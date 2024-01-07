function Set-FirewallAddressGroup {
    <#
        .SYNOPSIS
        Modifies an firewall address group.
        .DESCRIPTION
        The Set-FirewallAddress cmdlet modfies the properties of an firewall address group.
        .PARAMETER Color
        Color of icon on the GUI.
        .PARAMETER Comment
        Comment.
        .PARAMETER Member
        Firewall address objects contained within the group.
        .PARAMETER Name
        Address group name.
        .PARAMETER PassThru
        TODO
        .EXAMPLE
        Set-FirewallAddressGroup -Name 'RFC5737-GRP' -Color 9 -Comment 'La Celeste'
        .INPUTS
        **None or ForteeFox.FirewallAddressGroup**

        A firewall address group object is received by the Name parameter.
        .OUTPUTS
        **None or ForteeFox.FirewallAddressGroup**

        Returns the new firewall address group object when the PassThru parameter is specified. By default, this cmdlet does not generate any output.
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/Set-FirewallAddressGroup.md
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
        Remove-FirewallAddressGroupMember
        .EXAMPLE
        Set-FirewallAddressGroup -Name 'RFC5737-GRP' -Color 9 -Comment 'La Celeste'
    #>

    [CmdletBinding(PositionalBinding=$false, DefaultParameterSetName='Name', SupportsShouldProcess, ConfirmImpact='Low', HelpUri='https://github.com/john-fox-maule/forteefox/blob/main/docs/Set-FirewallAddressGroup.md')]
    param (
        # Parameter help description
        [Parameter(Position=0, ParameterSetName='Input', ValueFromPipeline)]
        [psobject]
        $InputObject,

        # Address group name.
        [Parameter(ParameterSetName='Input', Mandatory, ValueFromPipelineByPropertyName)]
        [Parameter(Position=0, ParameterSetName='Name', Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $Name,

        # Color of icon on the GUI.
        [Parameter(ValueFromPipelineByPropertyName)]
        [ValidateRange(1, 32)]
        [uint]
        $Color,

        # Comment.
        [Parameter(ValueFromPipelineByPropertyName)]
        [ValidateLength(1, 256)]
        [string]
        $Comment,

        # Address objects contained within the group.
        [Parameter(ValueFromPipelineByPropertyName)]
        [string[]]
        $Member,

        # Parameter help description
        [Parameter(ValueFromPipelineByPropertyName)]
        [switch]
        $PassThru
    )

    process {

        $Data = @{ name = $name }
        $Url = '/pm/config/adom/{0}/obj/firewall/addrgrp/{1}' -f $FortiManagerParams.AdministrativeDomain, $Name

        try {
            if ($null -eq (Get-FirewallAddressGroup -Name $Name)) {
                throw 'Failed to modify firewall address group {0} because it does not exists.' -f $Name
            }

            foreach ($Property in Get-FirewallAddressGroupProperty) {
                if ($PSBoundParameters.ContainsKey($Property)) {
                    if ($Property -ne $PSBoundParameters[$Property]) {
                        $Data.Add($Property, $PSBoundParameters[$Property])
                    }
                }
            }

            if ($PSCmdlet.ShouldProcess($Name, 'Set FirewallAddress')) {
                $Response = Invoke-ForteeFoxRequest -Method Update -Url $Url -Data $Data
                if ($Response.result.status.code -ne 0) {
                    throw 'Set-FirewallAddressGroup failed with code {0} and message {1}' -f `
                              $Response.result.status.code, `
                              $Response.result.status.message
                }
            } else {
                if ($PSBoundParameters.ContainsKey('WhatIf')) {
                    continue
                }

            }
        } catch {
            Write-Error -Message $PSItem.Exception.Message
        }
    }

}