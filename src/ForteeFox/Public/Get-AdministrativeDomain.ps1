function Get-AdministrativeDomain {
    <#
        .SYNOPSIS
        Gets one or more Administrative domains.
        .DESCRIPTION
        The Get-AdministrativeDomain gets one or more Administrative domain object(s).
        .PARAMETER Name
        Specifies an Administrative Domain object by providing the name of the ADOM.
        .EXAMPLE
        Get-AdministrativeDomain
        .EXAMPLE
        Get-AdministrativeDomain -Name Development
        .INPUTS
        None.
        .OUTPUTS
        ForteeFox.AdministrativeDomain
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/Get-AdministrativeDomain.md
        .LINK
        Lock-AdministrativeDomain
        .LINK
        New-AdministrativeDomain
        .LINK
        Remove-AdministrativeDomain
        .LINK
        Unlock-AdministrativeDomain
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $Name
    )

    process {
        $Url = '/dvmdb/adom/{0}' -f $Name
        $Response = Invoke-ForteeFoxRequest -Method Get -Url $Url

        if ($Response.result.status.code -eq 0) {
            ConvertTo-ForteeFoxObject -InputObject $Response.result.data -PSTypeName 'ForteeFox.AdministrativeDomain' | Write-Output
        }
    }
}