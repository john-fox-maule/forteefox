function Remove-FirewallAddressGroupMember {
    <#
        .SYNOPSIS
        Removes one or more members from an firewall addressgroup.
        .DESCRIPTION
        The Remove-FirewallAddressGroupMember cmdlet removes one or more firewall address objects from an firewall address group.

        The Name parameter specifies the firewall address group that contains the members to remove. You can identify a group by its name.
        The Member parameter specifies the firewall address objects to remove from the group specified by the Name parameter.
        .PARAMETER Name
        Specifies an firewall address group object by providing the name of the group.
        .PARAMETER Member
        Specifies an array of firewall address objects in a comma-separated list to remove from a firewall address group.
        .PARAMETER PassThru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
        .EXAMPLE
        Remove-FirewallAddressGroupMember -Name 'RFC5737-GRP' -Member 'TEST-NET-1'

        This example removes the firewall address object named TEST-NET-1 from the firewall address group RFC5737-GRP.
        .INPUTS
        **None or ForteeFox.FirewallAddressGroup**
        .OUTPUTS
        **None**
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-FirewallAddressGroupMember.md
        .LINK
        Add-FirewallAddressGroupMember
        .LINK
        Copy-FirewallAddressGroup
        .LINK
        Get-FirewallAddressGroup
        .LINK
        New-FirewallAddressGroup
        .LINK
        Remove-FirewallAddressGroup
        .LINK
        Set-FirewallAddressGroup
        .EXAMPLE
        Test-MyTestFunction -Verbose
        Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
    #>

    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Low', HelpUri='https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-FirewallAddressGroupMember.md')]
    param (
        # Address group name.
        [Parameter(Position=0, Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateLength(1, 79)]
        [string]
        $Name,

        # Address objects contained within the group.
        [Parameter(Mandatory)]
        [string[]]
        $Member,

        # Parameter help description
        [Parameter(Mandatory=$false)]
        [switch]
        $PassThru
    )

    process {
        try {
            $Data = @{ name = $Name }
            $Url = '/pm/config/adom/{0}/obj/firewall/addrgrp/{1}' -f $FortiManagerParams.AdministrativeDomain, $Name

            # Check if the source group exist.
            $FirewallAddressGroup = Get-FirewallAddressGroup -Name $Name
            if ($null -eq $FirewallAddressGroup) {
                throw 'Failed to remove group members because firewall address group {0} does not exists.' -f $Name
            }

            foreach ($FirewallAddress in $Member) {
                if ($FirewallAddressGroup.member -notcontains $FirewallAddress) {
                    $Message = 'Firewall address {0} is not a member of firewall address group {1}' -f $FirewallAddress, $Name
                    Write-Warning -Message $Message
                }
            }

            $Data.member = $FirewallAddressGroup.member | Where-Object { $_ -notin $Member }

            if ($PSCmdlet.ShouldProcess($Name, 'Remove Firewall addressgroup member')) {
                $Response = Invoke-ForteeFoxRequest -Method Update -Url $Url -Data $Data
                if ($Response.result.status.code -ne 0) {
                    throw 'Remove-FirewallAddressGroupMember failed with code {0} and message {1}' -f `
                                 $Response.result.status.code, `
                                 $Response.result.status.message
                }

                if ($PassThru) {
                    Get-FirewallAddressGroup -Name $Name
                }
            } else {
                continue
            }
        }
        catch {
            Write-Error -Message $PSItem.Exception.Message
        }
    }

}