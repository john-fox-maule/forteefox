function Add-FirewallAddressGroupMember {
    <#
        .SYNOPSIS
        Add one or more members to an firewall address group.
        .DESCRIPTION
        The Add-FirewallAddressGroupMember cmdlet adds one or more firewall address objects to  an firewall address group.

        The Name parameter specifies the firewall address group that contains the members to add. You can identify a group by its name.

        You must invoke Connect-ForteeFox before any commands that access FortiManager. This cmdlet gets the session id.

        The Member parameter specifies the firewall address objects to add to the group specified by the Name parameter.
        .PARAMETER Name
        Specifies an firewall address group object by providing the name of the group.
        .PARAMETER Member
        Specifies an array of firewall address objects in a comma-separated list to add to a firewall address group.
        .PARAMETER PassThru
        Returns an firewall address group representing the item with which you are working. By default, this cmdlet does not generate any output.
        .EXAMPLE
        Add-FirewallAddressGroupMember -Name 'RFC5737-GRP' -Member 'TEST-NET-1'

        This example adds the firewall address object named TEST-NET-1 to the firewall address group RFC5737-GRP.
        .EXAMPLE
        Add-FirewallAddressGroupMember -Name 'RFC5737-GRP' -Member 'TEST-NET-1', 'TEST-NET-2'

        This example add the address objects named TEST-NET-1 and TEST-NET-2 to the firewall address group RFC5737-GRP.
        .INPUTS
        **None or ForteeFox.FirewallAddressGroup**

        A firewall address group object is received by the Name parameter.
        .OUTPUTS
        **None or ForteeFox.FirewallAddressGroup**

        Returns the new firewall address group object when the PassThru parameter is specified. By default, this cmdlet does not generate any output.
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/Add-FirewallAddressGroupMember.md
        .LINK
        Copy-FirewallAddressGroup
        .LINK
        Get-FirewallAddressGroup
        .LINK
        New-FirewallAddressGroup
        .LINK
        Remove-FirewallAddressGroup
        .LINK
        Remove-FirewallAddressGroupMember
        .LINK
        Set-FirewallAddressGroup
    #>

    [CmdletBinding(HelpUri='https://github.com/john-fox-maule/forteefox/blob/main/docs/Add-FirewallAddressGroupMember.md')]
    param (
        # Address group name.
        [Parameter(Mandatory)]
        [ValidateLength(1, 79)]
        [string]
        $Name,

        # Address objects contained within the group.
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $Member,

        [Parameter()]
        [switch]
        $PassThru
    )

    process {

        $Data = @{ name = $Name }
        $Url = '/pm/config/adom/{0}/obj/firewall/addrgrp/{1}' -f $FortiManagerParams.AdministrativeDomain, $Name

        try {

            # Check if the source group exist.
            $FirewallAddressGroup = Get-FirewallAddressGroup -Name $Name
            if ($null -eq $FirewallAddressGroup) {
                throw 'Failed to add group members because firewall address group {0} does not exists.' -f $Name
            }

            foreach ($FirewallAddress in $Member) {
                if ($FirewallAddressGroup.member -contains $FirewallAddress) {
                    $Message = 'Firewall address {0} is already a member of firewall address group {1}' -f $FirewallAddress, $Name
                    Write-Warning -Message $Message
                }
            }

            # Check if the new members does exist.
            $MembersToAdd = Confirm-FirewallAddressMember -Members $Member
            $Data.member = $FirewallAddressGroup.member += $MembersToAdd

            $Response = Invoke-ForteeFoxRequest -Method Update -Url $Url -Data $Data
            if ($Response.result.status.code -ne 0) {
                throw 'Add-FirewallAddressGroupMember failed with code {0} and message {1}' -f `
                           $Response.result.status.code, `
                           $Response.result.status.message
            }

            if ($PassThru) {
                Get-FirewallAddressGroup -Name $Name | Write-Output
            }
        }
        catch {
            Write-Error -Message $PSItem.Exception.Message
        }
    }

}