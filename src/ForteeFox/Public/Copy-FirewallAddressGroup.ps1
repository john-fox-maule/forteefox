function Copy-FirewallAddressGroup {
   <#
        .SYNOPSIS
        Creates an firewall address group by cloning an existing address group.
        .DESCRIPTION
        The Copy-FirewallAddressGroup cmdlet creates one firewall address group by cloning an existing group.

        The Name parameter specifies the name of the group that you clone from and are required to create a new group.

        The CloneName parameter specifies the name of the cloned group.
        .PARAMETER Color
        Color of icon on the GUI.
        .PARAMETER CloneName
        Specifies the the name of the cloned firewall address group.
        .PARAMETER Comment
        Specifies the comment of the cloned firewall address group in the GUI.
        .PARAMETER InputObject

        .PARAMETER Name
        Specifies an firewall address group object by providing the name of the group.
        .PARAMETER PassThru
        Returns an firewall address group representing the item with which you are working. By default, this cmdlet does not generate any output.
        .EXAMPLE
        Copy-FirewallAddressGroup -Name RFC5737-GRP -CloneName CLONED-RFC5737-GRP

        This example clones the firewall address group named RFC5737-GRP and creates a CLONED-RFC5737-GRP.
        .EXAMPLE
        Get-FirewallAddressGroup -Name RFC5737-GRP | Copy-FirewallAddressGroup -CloneName CLONED-RFC5737-GRP

        This example clones the firewall address group named RFC5737-GRP and creates a CLONED-RFC5737-GRP.
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/Copy-FirewallAddressGroup.md
        .LINK
        Add-FirewallAddressGroupMember
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
        .INPUTS
        **None or ForteeFox.FirewallAddressGroup**

        A firewall address group object is received by the Name parameter.
        .OUTPUTS
        **None or ForteeFox.FirewallAddressGroup**

        Returns the cloned firewall address group object when the PassThru parameter is specified. By default, this cmdlet does not generate any output.
        .NOTES
        You must invoke Connect-ForteeFox before any commands that access FortiManager.
    #>

    [CmdletBinding(PositionalBinding=$false, DefaultParameterSetName='Name')]
    param (
        # Parameter help description
        [Parameter(Position=0, ParameterSetName='Input', Mandatory, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [psobject]
        $InputObject,

        # Parameter help description
        [Parameter(ParameterSetName='Input', ValueFromPipelineByPropertyName)]
        [Parameter(Position=0, ParameterSetName='Name', Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateLength(1, 79)]
        [string]
        $Name,

        # Parameter help description
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateLength(1, 79)]
        [string]
        $CloneName,

        # Parameter help description
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName)]
        [string]
        $Color,

        # Parameter help description
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName)]
        [string]
        $Comment,

        # Parameter help description
        [Parameter(Mandatory=$false)]
        [switch]
        $PassThru
    )

    process {

        $Data = @{ name = $CloneName }
        $Url = '/pm/config/adom/{0}/obj/firewall/addrgrp/{1}' -f $FortiManagerParams.AdministrativeDomain, $Name

        try {

            # Check if the source group exist.
            $FirewallAddressGroup = Get-FirewallAddressGroup -Name $Name
            if ($null -eq $FirewallAddressGroup) {
                throw 'Failed to clone because firewall address group {0} does not exists.' -f $Name
            }

            # Check if the clone group already exists.
            if ($null -ne (Get-FirewallAddressGroup -Name $CloneName)) {
                throw 'Failed to clone because firewall address group {0} already exists.' -f $CloneName
            }

            # Set all modfied parameters in clone.
            foreach ($Property in Get-FirewallAddressGroupProperty) {
                if ($PSBoundParameters.ContainsKey($Property)) {
                    if ($FirewallAddressGroup.$Property -ne $PSBoundParameters[$Property]) {
                        $Data.Add($Property, $PSBoundParameters[$Property]);
                    }
                }
            }

            $Response = Invoke-ForteeFoxRequest -Method Clone -Url $Url -Data $Data
            if ($Response.result.status.code -ne 0) {
                throw 'Copy-FirewallAddressGroup failed with code {0} and message {1}' -f `
                       $Response.result.status.code, `
                       $Response.result.status.message
            }

            if ($PassThru) {
                Get-FirewallAddressGroup -Name $CloneName | Write-Output
            }
        }
        catch {
            Write-Error -Message $PSItem.Exception.Message
        }
    }
}