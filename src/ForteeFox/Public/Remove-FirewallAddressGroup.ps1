function Remove-FirewallAddressGroup {
    <#
        .SYNOPSIS
        Removes an firewall object group.
        .DESCRIPTION
        The Remove-FirewallAddressGroup cmdlet removes firewall address object group.

        The Name parameter specifies the firewall address group to remove.
        .PARAMETER Name
        Specifies an firewall address group object by providing the name of the group.
        .EXAMPLE
        Remove-FirewallAddressGroup -Name 'RFC5737-GRP'

        This example removes the firewall address group object named RFC5737-GRP.
        .INPUTS
        **None or ForteeFox.FirewallAddressGroup**
        .OUTPUTS
        **None**
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-FirewallAddressGroup.md
        .LINK
        Add-FirewallAddressGroupMember
        .LINK
        Copy-FirewallAddressGroup
        .LINK
        Get-FirewallAddressGroup
        .LINK
        New-FirewallAddressGroup
        .LINK
        Remove-FirewallAddressGroupMember
        .LINK
        Set-FirewallAddressGroup
    #>

    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Low', HelpUri='https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-FirewallAddressGroup.md')]
    param (
        # Specifies an firewall address group object by providing the name of the group.
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateLength(1, 79)]
        [string]
        $Name
    )

    process {

        try {

            $Url = '/pm/config/adom/{0}/obj/firewall/addrgrp/{1}' ` -f $FortiManagerParams.AdministrativeDomain, $Name

            if ($null -eq (Get-FirewallAddressGroup -Name $Name)) {
                $Message = 'Firewall address group {0}, does not exist. Can not delete' -f $Name
                Write-Warning -Message $Message
            } else {
                if ($PSCmdlet.ShouldProcess($Name, '')) {
                    $Response = Invoke-ForteeFoxRequest -Method Delete -Url $Url
                    if ($Response.result.status.code -ne 0) {
                        throw 'Remove-FirewallAddressGroup failed with code {0} and message {1}' -f `
                                     $Response.result.status.code, `
                                     $Response.result.status.message
                    }
                } else {
                    continue
                }
            }
        }
        catch {
            Write-Error -Message $PSItem.Exception.Message
        }
    }
}