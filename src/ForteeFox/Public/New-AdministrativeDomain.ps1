function New-AdministrativeDomain {
    <#
        .SYNOPSIS
        Creates an Administrative domain.
        .DESCRIPTION
        The New-AdministrativeDomain creates an Administrative domain object.
        .PARAMETER Description
        Specifies the description of the administrative domain.
        .PARAMETER Name
        Specifies an Administrative Domain object by providing the name of the ADOM.
        .PARAMETER PassThru
        Returns an administrative domain representing the item with which you are working. By default, this cmdlet does not generate any output.
        .EXAMPLE
        New-AdministrativeDomain -Name 'Development' -Description 'Created with ForteeFox'

        This example create an administrative domain with the name 'Development' and a description.
        .INPUTS
        None.
        .OUTPUTS
        **None or ForteeFox.AdministrativeDomain**

        Returns the new administrative domain object when the PassThru parameter is specified. By default, this cmdlet does not generate any output.
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/New-AdministrativeDomain.md
        .LINK
        Get-AdministrativeDomain
        .LINK
        Lock-AdministrativeDomain
        .LINK
        Remove-AdministrativeDomain
        .LINK
        Unlock-AdministrativeDomain
    #>

    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Low')]
    param (
        [Parameter()]
        [ValidateLength(1, 128)]
        [string]
        $Description,

        [Parameter(Mandatory)]
        [ValidateLength(1, 48)]
        [string]
        $Name,

        [Parameter()]
        [switch]
        $PassThru
    )

    process {

        $Data = @{ name = $Name }
        $Url = '/dvmdb/adom'

        try {

            if ($Description) {
                $Data.Add('desc', $Description)
            }

            if ($PSCmdlet.ShouldProcess($Name, 'Create ADOM')) {
                $Response = Invoke-ForteeFoxRequest -Method Add -Url $Url -Data $Data
                if ($Response.result.status.code -ne 0) {
                    throw 'New-AdministrativeDomain failed with code {0} and message {1}' -f `
                              $Response.result.status.code, `
                              $Response.result.status.message
                }

                if ($PassThru) {
                    Get-AdministrativeDomain -Name $Name
                }

            } else {
                $Response = Get-AdministrativeDomain -Name $Name
                if ($Response.result.status.code -eq 0) {
                    $Message = 'Cannot create administrative domain ''{0}'' because it already exists.' -f $Name
                    Write-Error -Message $Message -Category ResourceExists
                }
                continue
            }
        }
        catch {
            Write-Error -Message $PSItem.Exception.Message
        }
    }
}