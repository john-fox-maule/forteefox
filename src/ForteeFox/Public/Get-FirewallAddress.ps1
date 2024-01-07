function Get-FirewallAddress {
    <#
        .SYNOPSIS
        Gets one ore more firewall address.
        .DESCRIPTION
        The Get-FirewallAddress cmdlet gets one firewall address. B
        .PARAMETER Filter
        Specifies a query string that retrieves firewall address objects. This string uses the Fortinet Filter object syntax.
        .PARAMETER Name
        Specifies an firewall address object by providing the name of the firewall address.
        .EXAMPLE
        Get-FirewallAddress -Name 'TEST-NET-1'

        This example gets the firewall address named TEST-NET-1.
        .EXAMPLE
        Get-FirewallAddress -Filter @{ source='name'; condition='like'; target='%TEST-NET-_' }

        This exampe gets the firewall addresses where the name atrribute is like the target.
        .INPUTS
        **None or ForteeFox.FirewallAddress**

        A firewall address object is received by the Name parameter.
        .OUTPUTS
        **ForteeFox.FirewallAddress**
        .NOTES
        You must invoke Connect-ForteeFox before any commands that access FortiManager.
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/Get-FirewallAddress.md
        .LINK
        Copy-FirewallAddress
        .LINK
        New-FirewallAddress
        .LINK
        Remove-FirewallAddress
        .LINK
        Set-FirewallAddress
    #>

    [OutputType('ForteeFox.FirewallAddress')]
    [CmdletBinding(PositionalBinding=$false, HelpUri='https://github.com/john-fox-maule/forteefox/blob/main/docs/Get-FirewallAddress.md')]
    param (
        # Parameter help description
        [Parameter(ParameterSetName='Filter', ValueFromPipelineByPropertyName)]
        [ForteeFox.Filter]
        $Filter,

        [Parameter(Position=0, ParameterSetName='Name', Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateLength(1, 79)]
        [string]
        $Name
    )

    process {

        $Option = 'scope member'
        $Url = '/pm/config/adom/{0}/obj/firewall/address/{1}' -f $FortiManagerParams.AdministrativeDomain, $Name

        try {

            if ($PSBoundParameters.ContainsKey('Filter')) {
                $Url = '/pm/config/adom/{0}/obj/firewall/address' -f $FortiManagerParams.AdministrativeDomain
                $Response = Invoke-ForteeFoxRequest -Method Get -Url $Url -Option $Option -Filter $Filter
            } else {
                $Response = Invoke-ForteeFoxRequest -Method Get -Url $Url -Option $Option
            }

            if ($Response.result.status.code -eq 0) {
                $Response.result.data | ForEach-Object {
                    ConvertTo-FirewallAddress -InputObject $_ | Write-Output
                }
            }
        }
        catch {
            Write-Error -Message $PSItem.Exception.Message
        }

    }
}