function Connect-ForteeFox {
    <#
        .SYNOPSIS
        The Connect-ForteeFox cmdlet connects an authenticated account to FortiManager for use with cmdlets from the ForteeFox module.
        .DESCRIPTION
        The Connect-ForteeFox cmdlet connects to FortiManager with an authenticated account for use with cmdlets from the ForteeFox
        module. After executing this cmdlet, you can disconnect from FortiManager account using Disconnect-ForteeFox.
        .PARAMETER AdministrativeDomain
        Specifies the administrative domain you want to connect to in FortiManager. This is also called the ADOM.
        .PARAMETER Password
        Specifies the password of the user with json-api access to authenticate to the FortiManager.
        .PARAMETER Port
        Specifies the tcp port that FortiManager is listening on.
        .PARAMETER Server
        Specifies an server address that FortiManager is installed, should be an fully qualified domain name, but can be an ip address.
        .PARAMETER SkipCertificateCheck
        Skips certificate validation checks. This includes all validations such as expiration, revocation, trusted root authority, etc.
        .PARAMETER Username
        Specifies the username with json-api access to authenticate to the FortiManager.
        .EXAMPLE
        $Password = (Read-Host -AsSecureString 'Password')
        Connect-ForteeFox -Server localhost -Username 'el.barquero' -Password $Password

        This example Connect to the FortiManager localhost on default port as user el.barquero to default adom 'root'
        .EXAMPLE
        $Password = ConvertTo-SecureString -String 'DameM@sAgua11800' -AsPlainText
        Connect-ForteeFox -Server localhost -Port 8443 -Username 'el.barquero' -Password $Password

        This example Connect to the FortiManager localhost on custom port 8443 as user el.barquero with the specifed password to default adom 'root'
        .EXAMPLE
        $Password = (Read-Host -AsSecureString 'Password')
        Connect-ForteeFox -Server localhost -Username 'el.barquero' -Password $Password -AdministrativeDomain 'Development'

        This example Connect to the FortiManager localhost on on default port as user el.barquero to the adom 'Development'
        .EXAMPLE
        $Password = (Read-Host -AsSecureString 'Password')
        Connect-ForteeFox -Server localhost -Username 'el.barquero' -Password $Password -SkipCertificateCheck

        This example Connect to the FortiManager localhost on on default port as user el.barquero to default adom 'root' and skips the certificate check.
        .EXAMPLE
        $Password = (Read-Host -AsSecureString 'Password')
        Connect-ForteeFox -Server localhost -Port 8443 -Username el.barquero -Password $Password -SkipCertificateCheck -AdministrativeDomain Development

        This example Connect to the FortiManager localhost on custom port 8443 as user 'el.barquero' to the adom 'Development' and skips the certificate check.
        .INPUTS
        None.
        .OUTPUTS
        None.
        .NOTES
        None.
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/Connect-ForteeFox.md
        .LINK
        Disconnect-ForteFox
    #>

    [CmdletBinding(PositionalBinding=$false, HelpUri='https://github.com/john-fox-maule/forteefox/blob/main/docs/Connect-ForteeFox.md')]
    param (
        # Parameter help description
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $AdministrativeDomain,

        # Parameter help description
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [securestring]
        $Password,

        # Parameter help description
        [Parameter()]
        [ValidateRange(1, 65535)]
        [uint]
        $Port = 443,

        # Parameter help description
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Server,

        # Parameter help description
        [Parameter()]
        [switch]
        $SkipCertificateCheck,

        # Parameter help description
        [Parameter(Mandatory)]
        [ValidateLength(1, 128)]
        [string]
        $Username
    )

    Initialize-ForteeFox

    # Setup variables.
    $FortiManagerParams.AdministrativeDomain = $AdministrativeDomain
    $FortiManagerParams.Port = $Port
    $FortiManagerParams.Server = $Server
    $FortiManagerParams.SkipCertificateCheck = $SkipCertificateCheck
    $FortiManagerParams.Uri = 'https://{0}:{1}/jsonrpc' -f $Server, $Port

    $Data = @{
        user   = $Username
        passwd =  ConvertFrom-SecureString -SecureString $Password -AsPlainText
    }

    $Url = '/sys/login/user'

    $Response = Invoke-ForteeFoxRequest -Method 'Exec' -Url $Url -Data $Data

    if ($null -ne $Response.session) {
        $FortiManagerParams.Session = $Response.session
    }

    if ($Response.result.status.code -ne 0) {
        Write-Error -Message $Response.result.status.message `
                    -ErrorId $Response.result.status.code

        throw
    }

    $Data.Clear()
}