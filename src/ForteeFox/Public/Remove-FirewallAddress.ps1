function Remove-FirewallAddress {
    <#
        .SYNOPSIS
        Removes an firewall address.
        .DESCRIPTION
        The Remove-FirewallAddress cmdlet removes a firewall address.

        The Name parameter specifies the name of the firewall address to remove.
        .PARAMETER Name
        Specifies an firewall address object by providing the name of the firewall address.
        .EXAMPLE
        Remove-FirewallAddress -Name 'TEST-NET-1'

        This example removes the firewall address named TEST-NET-1.
        .EXAMPLE
        Get-FirewallAddress -Name 'TEST-NET-2' | Remove-FirewallAddress

        This example removes the firewall address named TEST-NET-2.
        .INPUTS
        **None or ForteeFox.FirewallAddress**
        .OUTPUTS
        **None**
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-FirewallAddress.md
        .LINK
        Copy-FirewallAddress
        .LINK
        Get-FirewallAddress
        .LINK
        New-FirewallAddress
        .LINK
        Set-FirewallAddress
    #>

    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Low', HelpUri='https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-FirewallAddress.md')]
    param (
        # Parameter help description
        [Parameter(Position=0, Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateLength(1, 79)]
        [string]
        $Name
    )

    process {

        try {

            $Url = '/pm/config/adom/{0}/obj/firewall/address/{1}' ` -f $FortiManagerParams.AdministrativeDomain, $Name

            # Check if the firewall address exist.
            if ($null -eq (Get-FirewallAddress -Name $Name)) {
                throw 'Failed to delete firewall address {0} because it does not exists.' -f $Name
            }

            if ($PSCmdlet.ShouldProcess($Name, 'Remove FirewallAddress')) {

                # Request the firewall address to be deleted.
                $Response = Invoke-ForteeFoxRequest -Method Delete -Url $Url
                if ($Response.result.status.code -ne 0) {
                    throw 'Remove-FirewallAddress failed with code {0} and message {1}' -f `
                                 $Response.result.status.code, `
                                 $Response.result.status.message
                }
            } else {
                if ($null -eq (Get-FirewallAddress -Name $Name)) {
                    $Message = 'Failed to delete firewall address {0} because it does not exists.' -f $Name
                    Write-Error -Message $Message -Category ObjectNotFound
                }

            }

        } catch {
            Write-Error -Message $PSItem.Exception.Message
        }
    }

}