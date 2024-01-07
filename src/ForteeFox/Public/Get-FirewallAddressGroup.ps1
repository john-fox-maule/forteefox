function Get-FirewallAddressGroup {
    <#
        .SYNOPSIS
        Gets one firewall address group.
        .DESCRIPTION
        The Get-FirewallAddressGroup cmdlet gets a firewall address group.
        .PARAMETER Filter
        Specifies a query string that retrieves firewall address group objects. This string uses the Fortinet Filter object syntax.
        .PARAMETER Name
        Specifies an firewall address group object by providing the name of the group.
        .EXAMPLE
        Get-FirewallAddressGroup -Name 'RFC5737-GRP'

        This example gets the firewall address group named RFC5737-GRP.
        .INPUTS
        **None or ForteeFox.FirewallAddressGroup**

        A firewall address group object is received by the Name parameter.
        .OUTPUTS
        **ForteeFox.FirewallAddressGroup**
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/Get-FirewallAddressGroup.md
        .LINK
        Add-FirewallAddressGroupMember
        .LINK
        Copy-FirewallAddressGroup
        .LINK
        New-FirewallAddressGroup
        .LINK
        Remove-FirewallAddressGroup
        .LINK
        Remove-FirewallAddressGroupMember
        .LINK
        Set-FirewallAddressGroup
    .EXAMPLE
        Get-FirewallAddressGroup -Name RFC5737-GRP
    #>

    [CmdletBinding(PositionalBinding=$false, DefaultParameterSetName='Name', HelpUri='https://github.com/john-fox-maule/forteefox/blob/main/docs/Get-FirewallAddressGroup.md')]
    param (
        # Parameter help description
        [Parameter(Position=0, ParameterSetName='Filter', Mandatory, ValueFromPipelineByPropertyName)]
        [ForteeFox.Filter]
        $Filter,

        # Address group name.
        [Parameter(Position=0, ParameterSetName='Name', Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateLength(1, 79)]
        [string]
        $Name
    )

    process {

        $Option = 'scope member'

        if ($PSBoundParameters.ContainsKey('Filter')) {
            $Url = '/pm/config/adom/{0}/obj/firewall/addrgrp' -f $FortiManagerParams.AdministrativeDomain, $FirewallAddressGroup
            $Response = Invoke-ForteeFoxRequest -Method Get -Url $Url -Option $Option -Filter $Filter
        } else {
            $Url = '/pm/config/adom/{0}/obj/firewall/addrgrp/{1}' -f $FortiManagerParams.AdministrativeDomain, $Name
            $Response = Invoke-ForteeFoxRequest -Method Get -Url $Url -Option $Option
        }

        if ($Response.result.status.code -eq 0)  {
            $Response.result.data | ForEach-Object {
                ConvertTo-FirewallAddressGroup -InputObject $_ | Write-Output
            }
        }
    }
}