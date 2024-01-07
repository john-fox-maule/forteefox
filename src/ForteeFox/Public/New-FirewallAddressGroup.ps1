function New-FirewallAddressGroup {
    <#
        .SYNOPSIS
        Creates an firewall address group.
        .DESCRIPTION
        The New-FirewallAddressGroup cmdlet creates one firewall address group.

        The Name parameter specifies the name of the group and are required to create a new group.

        The Member parameter specifies the firewall address objects to add to the group specified by the Name parameter.
        .PARAMETER Color
        Specifies the firewall address group color.
        .PARAMETER Comment
        Specifies an firewall address group comment.
        .PARAMETER Member
        Specifies an array of firewall address objects in a comma-separated list to add to a firewall address group.
        .PARAMETER Name
        Specifies an firewall address group object by providing the name of the group.
        .PARAMETER PassThru
        Returns an firewall address group representing the item with which you are working. By default, this cmdlet does not generate any output.
        .EXAMPLE
        New-FirewallAddressGroup -Name 'RFC5737-GRP' -Member 'TEST-NET-1'

        This example creates the firewall address group named RFC5737-GRP with the TEST-NET-1 firewall address as a member.
        .EXAMPLE
        New-FirewallAddressGroup -Name 'RFC5737-GRP' -Member 'TEST-NET-1', 'TEST-NET-2', 'TEST-NET-3'

        This example creates the firewall address group named RFC5737-GRP with the TEST-NET-1, TEST-NET-2 and TEST-NET-3 firewall address as members.
        .INPUTS
        **None or ForteeFox.FirewallAddressGroup**

        A firewall address group object is received by the Name parameter.
        .OUTPUTS
        **None or ForteeFox.FirewallAddressGroup**

        Returns the new firewall address group object when the PassThru parameter is specified. By default, this cmdlet does not generate any output.
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/New-FirewallAddressGroup.md
        .LINK
        Add-FirewallAddressGroupMember
        .LINK
        Copy-FirewallAddressGroup
        .LINK
        Get-FirewallAddressGroup
        .LINK
        Remove-FirewallAddressGroup
        .LINK
        Remove-FirewallAddressGroupMember
        .LINK
        Set-FirewallAddressGroup
        .NOTES
        You must invoke Connect-ForteeFox before any commands that access FortiManager.
    #>

    [CmdletBinding(PositionalBinding=$false, DefaultParameterSetName='Name', SupportsShouldProcess, ConfirmImpact='Low', HelpUri='https://github.com/john-fox-maule/forteefox/blob/main/docs/New-FirewallAddressGroup.md')]
    param (
        # Parameter help description
        [Parameter(Position=0, ParameterSetName='Input', Mandatory, ValueFromPipeline)]
        [psobject]
        $InputObject,

        # Specifies an firewall address group object by providing the name of the group.
        [Parameter(Position=0, ParameterSetName='Name', Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateLength(1, 79)]
        [string]
        $Name,

        # Color of icon on the GUI.
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName)]
        [ValidateRange(0, 32)]
        [uint]
        $Color,

        # Comment.
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName)]
        [ValidateLength(1, 256)]
        [string]
        $Comment,

        # Specifies an array of firewall address objects in a comma-separated list to add to a firewall address group.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string[]]
        $Member,

        # Returns an firewall address group representing the item with which you are working.
        [Parameter(Mandatory=$false)]
        [switch]
        $PassThru
    )

    begin {
        $Url = '/pm/config/adom/{0}/obj/firewall/addrgrp' -f $FortiManagerParams.AdministrativeDomain
    }

    process {

        $Data = @{ name = $Name }
        $ValidMembers = @()

        try {
            # Build a list of valid members.
            foreach ($MemberName in $Member) {
                if ($null -eq ((Get-FirewallAddress -Name $MemberName) -or (Get-FirewallAddressGroup -Name $MemberName))) {
                    $Message = 'Firewall address or group ''{0}'', does not exist, and can not be used as a member' -f $MemberName
                    Write-Warning -Message $Message
                } else {
                    $ValidMembers += $MemberName
                    $Data.member = $ValidMembers
                }
            }

            # Add parameters that are set to data.
            foreach ($Property in Get-FirewallAddressGroupProperty) {
                if ($PSBoundParameters.ContainsKey($Property)) {
                    switch ($Property) {
                        'member' { } # Do nothing as this is already added.
                        Default { $Data.Add($Property, $PSBoundParameters[$Property]) }
                    }
                }
            }

            if ($PSCmdlet.ShouldProcess($Name, 'Create Firewall address group')) {

                # Request the firewall address group to be added
                $Response = Invoke-ForteeFoxRequest -Method Add -Url $Url -Data $Data
                if ($Response.result.status.code -ne 0) {
                    Write-Error -Message $Response.result.status.message `
                                -ErrorId $Response.result.status.code
                }

                if ($PassThru) {
                    Get-FirewallAddress -Name $Name
                }
            } else {
                if ($null -ne (Get-FirewallAddressGroup -Name $Name)) {
                    $Message = 'Cannot create firewall address group ''{0}'' because it already exists.' -f $Name
                    Write-Error -Message $Message -Category ResourceExists
                }
            }
        }
        catch {
            Write-Error -Message $PSItem.Exception.Message
        }
     }
}