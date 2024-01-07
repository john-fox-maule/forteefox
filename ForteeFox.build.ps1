param (
    # Parameter help description
    [string]
    $ArtifactStagingDirectory,

    # Parameter help description
    [ValidateSet('Debug', 'Release')]
    [string]
    $Configuration = 'Debug',

    # Version number of this module.
    [string]
    $ModuleVersion = '0.1.0'
)

if (-not $PSBoundParameters.ContainsKey('ArtifactStagingDirectory')) {
    $ArtifactStagingDirectory = Join-Path -Path $PSScriptRoot -ChildPath 'obj'
}

# Assumes that build files is named ModuleName.build.ps1
$ModuleName = (Split-Path -Path $MyInvocation.MyCommand.Path -LeafBase).Replace('.build', '')
$ModulePath = Join-Path -Path 'Modules' -ChildPath $ModuleName -AdditionalChildPath $ModuleVersion
$BuildPath = Join-Path $ArtifactStagingDirectory -ChildPath $ModulePath

# Various paths
$PackagePath = Join-Path $ArtifactStagingDirectory -ChildPath 'package' -AdditionalChildPath $ModuleName
$SourcePath = Join-Path -Path $PSScriptRoot -ChildPath 'src'
$TmpPath = Join-Path -Path $ArtifactStagingDirectory -ChildPath (New-Guid).Guid

task Init {

    # We need to trust PSGallery
    $PSGallery = Get-PSRepository -Name 'PSGallery'
    if ($PSGallery -and $PSGallery.InstallationPolicy -ne 'Trusted') {
        Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted     
    }

    $NeededModules = @('PlatyPS', 'PSScriptAnalyzer' )

    # Are required modules installed.
    $NeededModules | ForEach-Object {
        if (-not (Get-Module -ListAvailable -Name $_ )) {
            Install-Module -Name $_ -Scope CurrentUser    
        }
        Import-Module -Name $_
    }

    # Restore InstallationPolicy
    if ($PSGallery) {
        Set-PSRepository -Name 'PSGallery' -InstallationPolicy $PSGallery.InstallationPolicy    
    }
}

task Analyze {
    Invoke-ScriptAnalyzer -Path $BuildPath -Recurse -ExcludeRule PSAvoidTrailingWhitespace -OutVariable Issues
    $Errors = $Issues | Where-Object { $_.Severity -eq 'Error'}
    $Warnings = $Issues | Where-Object { $_.Severity -eq 'Warning'}
    if ($Errors) {
        Write-Error -Message "Build FAILED. $Errors.Count errors, $Warnings.Count warnings"
    } else {
        Write-Output -Message "Build succeeded. $($Errors.Count) errors, $($Warnings.Count) warnings"
    }
}

task Clean {
    $PathsToClean = @($BuildPath, $ModulePath, $PackagePath, $TmpPath)
    $PathsToClean | ForEach-Object {
        # Remove any files in the directory.
        if (Test-Path -Path $_ -PathType Container) {
            Remove-Item -Path $_ -Recurse
        }
        New-Item -Path $_ -ItemType Directory | Out-Null
    }
}

task Build {
    # Copy the files
    $CopyFrom = Join-Path -Path $SourcePath -ChildPath $ModuleName -AdditionalChildPath '/*' -Resolve
    Copy-Item -Path $CopyFrom -Destination $BuildPath -Exclude @('*.cs') -Recurse
    Remove-Item (Join-Path -Path $BuildPath -ChildPath 'Classes') -Force

    # The Public and Private directory resides in the same directory as the manifest.
    $ModuleManifest = Get-ChildItem -Path $BuildPath -File -Include '*.psd1' -Recurse
    $PublicFunctionsPath = Split-Path -Path $ModuleManifest -Parent | Join-Path -ChildPath 'Public'
    $PublicFunctions = Get-ChildItem -Path $PublicFunctionsPath -File -Include '*.ps1' -Recurse

    # dotnet
    dotnet new sln --name $ModuleName --output $TmpPath --force
    $ProjectPath = Join-Path -Path $TmpPath -ChildPath $ModuleName
    if (-not (Test-Path $ProjectPath)) {
        New-Item -Path $ProjectPath -ItemType Directory | Out-Null
    }
    Set-Location $TmpPath
    dotnet new classlib --framework "netstandard2.0" --output $ModuleName --force
    Get-ChildItem -Path $TmpPath -File -Include @('*.cs') -Recurse | Remove-Item
    $ProjectPath = Get-ChildItem -Path $TmpPath -File -Include @('*.csproj') -Recurse
    $ClassesPath = Join-Path -Path $SourcePath -ChildPath $ModuleName -AdditionalChildPath 'Classes/*' -Resolve
    Copy-Item -Path $ClassesPath -Destination $ProjectPath.Directory -Include @('*.cs') -Recurse
    dotnet sln add $ProjectPath.FullName
    dotnet build --configuration $Configuration
    $BinPath = Join-Path -Path $TmpPath -ChildPath $ModuleName -AdditionalChildPath 'bin'
    Get-ChildItem -Path $BinPath -File -Include @('*.deps.json', '*.dll') -Recurse | Move-Item -Destination $TmpPath
    Get-ChildItem -Path $TmpPath -File -Include @('*.sln') -Recurse | Remove-Item -Force
    Remove-Item -Path $ModuleName -Recurse -Force
    Set-Location $SourcePath

    # Update the ModuleManifest
    Get-ChildItem -Path $BuildPath -File -Include @('*.psd1', '*.psm1', '*.ps1xml') -Recurse | Move-Item -Destination $TmpPath
    $TempModuleManifest = Get-ChildItem -Path $TmpPath -File -Include '*.psd1' -Recurse
    Update-ModuleManifest -Path $TempModuleManifest.FullName -ModuleVersion $ModuleVersion -FunctionsToExport $PublicFunctions.BaseName
    Get-ChildItem -Path $TmpPath -File -Include @('*.deps.json', '*.dll', '*.psd1', '*.psm1', '*.ps1xml') -Recurse | Move-Item -Destination $BuildPath
    Remove-Item -Path $TmpPath -Recurse

    # Register local repository
    $LocalPSRepo = @{
        Name = $ModuleName
        SourceLocation = $PackagePath
        ScriptSourceLocation = $PackagePath
        InstallationPolicy = 'Trusted'
    }

    Register-PSRepository @LocalPSRepo
    Publish-Module -Path $BuildPath -Repository $LocalPSRepo.Name
    Install-Module -Name $ModuleName -Repository $LocalPSRepo.Name -Scope CurrentUser
    Import-Module -Name $ModuleName -Force
    Remove-Module -Name $ModuleName
    Unregister-PSRepository $LocalPSRepo.Name

    Write-Output "artifact=$BuildPath" >> $env:GITHUB_OUTPUT
}

task Docs {
    $Module = Get-ChildItem -Path $BuildPath -File -Include '*.psm1' -Recurse
    $ModuleAssembly = Join-Path -Path $BuildPath -ChildPath ('{0}.dll' -f $ModuleName)
    try {
        Add-Type -AssemblyName $ModuleAssembly
    } catch {
        # To avoid failing when already loaded.
    }
    Import-Module $Module.FullName -Force
    $DocsPath = Join-Path $BuildPath -ChildPath 'docs'
    New-MarkdownHelp -Module $ModuleName -OutputFolder $DocsPath -ExcludeDontShow -UseFullTypeName -Force | Out-Null
    New-ExternalHelp -Path $DocsPath -OutputPath (Join-Path -Path $BuildPath -ChildPath 'en-US') | Out-Null
}

task Test {
    Invoke-Pester
}

task Publish {

}

task Deploy -If ($Configuration -eq 'Release') {

}

task . Init, Clean, Build, Analyze
