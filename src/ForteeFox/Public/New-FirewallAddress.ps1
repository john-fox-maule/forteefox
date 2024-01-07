function New-FirewallAddress {
    <#
        .SYNOPSIS
        Creates an firewall address.
        .DESCRIPTION
        The New-FirewallAddress cmdlet creates an firewall address.

        The Name parameter specifies the name of the address.
        .PARAMETER Name
        Specifies an firewall address object by providing the name of the address.
        .PARAMETER Color
        Specifies the color of the new firewall address in the GUI.
        .PARAMETER Comment
        Specifies the comment of the new firewall address in the GUI.
        .PARAMETER Subnet
        Specifies the IP address and subnet mask of address.
        .PARAMETER Type
        Specifies the Type of address.
        .PARAMETER PassThru
        Returns an firewall address representing the item with which you are working. By default, this cmdlet does not generate any output.
        .EXAMPLE
        New-FirewallAddress -Name 'TEST-NET-1' -Type 'ipmask' -Subnet '192.0.2.0/24' -Color 9 -Comment 'RFC 5737'
        New-FirewallAddress -Name 'TEST-NET-2' -Type 'ipmask' -Subnet '198.51.100.0/24' -Color 9 -Comment 'RFC 5737'
        New-FirewallAddress -Name 'TEST-NET-3' -Type 'ipmask' -Subnet '203.0.113.0/24' -Color 9 -Comment 'RFC 5737'

        This example creates three firewall address named TEST-NET-1, TEST-NET-2 and TEST-NET-3 and set the properties for the color and the comment.
        .INPUTS
        **None or ForteeFox.FirewallAddress**

        A firewall address object is received by the Name parameter.
        .OUTPUTS
        **None or ForteeFox.FirewallAddress**

        Returns the new firewall address object when the PassThru parameter is specified. By default, this cmdlet does not generate any output.
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/New-FirewallAddress.md
        .LINK
        Copy-FirewallAddress
        .LINK
        Get-FirewallAddress
        .LINK
        Remove-FirewallAddress
        .LINK
        Set-FirewallAddress
        .NOTES
        You must invoke Connect-ForteeFox before any commands that access FortiManager.
    #>
    [CmdletBinding(PositionalBinding=$false, DefaultParameterSetName='Name', SupportsShouldProcess, ConfirmImpact='Low', HelpUri='https://github.com/john-fox-maule/forteefox/blob/main/docs/New-FirewallAddress.md')]
    param (
        # Parameter help description
        [Parameter(Position=0, ParameterSetName='Input', Mandatory, ValueFromPipeline)]
        [psobject]
        $InputObject,

        # Parameter help description
        [Parameter(ParameterSetName='Input', Mandatory, ValueFromPipelineByPropertyName)]
        [Parameter(Position=0, ParameterSetName='Name', Mandatory, ValueFromPipelineByPropertyName)]
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

        # Parameter help description
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Subnet,

        #
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateSet('ipmask')]
        [string]
        $Type,

        # Parameter help description
        [Parameter(Mandatory=$false)]
        [switch]
        $PassThru
    )

    process {

        $Data = @{ name = $Name }
        $Url = '/pm/config/adom/{0}/obj/firewall/address' -f $FortiManagerParams.AdministrativeDomain

        try {

            # Check if the source address exist.
            if ($null -ne (Get-FirewallAddress -Name $Name)) {
                throw 'Failed to create firewall address {0} because it already exists.' -f $Name
            }

            # Add parameters that are set to data.
            foreach ($Property in Get-FirewallProperty) {
                if ($PSBoundParameters.ContainsKey($Property)) {
                    $Data.Add($Property, $PSBoundParameters[$Property])
                }
            }

            if ($PSCmdlet.ShouldProcess($Name, 'New-FirewallAddress')) {
                # Request the firewall address to be added
                $Response = Invoke-ForteeFoxRequest -Method Add -Url $Url -Data $Data
                if ($Response.result.status.code -ne 0) {
                    throw 'New-FirewallAddress failed with code {0} and message {1}' -f `
                              $Response.result.status.code, `
                              $Response.result.status.message
                }

                if ($PassThru) {
                    Get-FirewallAddress -Name $Name
                }
            } else {
                if ($null -ne (Get-FirewallAddress -Name $Name)) {
                    $Message = 'Cannot create FirewallAddress ''{0}'' because it already exists.' -f $Name
                    Write-Error -Message $Message -Category ResourceExists
                }
            }
        }
        catch {
            Write-Error -Message $PSItem.Exception.Message
        }
    }
}