function Set-FirewallAddress {
    <#
        .SYNOPSIS
        Modifies an firewall address.
        .DESCRIPTION
        The Set-FirewallAddress cmdlet modfies the properties of an firewall address.

        The Name parameter specifies the name of the address.
        .PARAMETER Color
        Specifies the color of the new firewall address in the GUI.
        .PARAMETER Comment
        Specifies the comment of the new firewall address in the GUI.
        .PARAMETER InputObject
        .PARAMETER Name
        Specifies an firewall address object by providing the name of the address.
        .PARAMETER PassThru
        Returns an firewall address representing the item with which you are working. By default, this cmdlet does not generate any output.
        .EXAMPLE
        Set-FirewallAddress -Name 'TEST-NET-1' -Color 9 -Comment 'Rio de la Plata'

        This example modfies the firewall address named TEST-NET-1 and set the properties for the color and the comment.
        .EXAMPLE
        Get-FirewallAddress -Name 'TEST-NET-2' | Set-FirewallAddress -Comment 'Teatro Solis'

        This example modfies the firewall address named TEST-NET-2 and set the properties for the color and the comment.
        .INPUTS
        **None or ForteeFox.FirewallAddress**

        A firewall address object is received by the Name parameter.
        .OUTPUTS
        **None or ForteeFox.FirewallAddress**

        Returns the modfied firewall address object when the PassThru parameter is specified. By default, this cmdlet does not generate any output.
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/Set-FirewallAddress.md
        .LINK
        Copy-FirewallAddress
        .LINK
        Get-FirewallAddress
        .LINK
        New-FirewallAddress
        .LINK
        Remove-FirewallAddress
        .EXAMPLE
        Test-MyTestFunction -Verbose
        Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
    #>

    [CmdletBinding(PositionalBinding=$false, DefaultParameterSetName='Name', SupportsShouldProcess, ConfirmImpact='Low', HelpUri='https://github.com/john-fox-maule/forteefox/blob/main/docs/Set-FirewallAddress.md')]
    param (
        # Parameter help description
        [Parameter(Position=0, ParameterSetName='Input', Mandatory, ValueFromPipeline)]
        [psobject]
        $InputObject,

        # Parameter help description
        [Parameter(ParameterSetName='Input', Mandatory, ValueFromPipelineByPropertyName)]
        [Parameter(Position=0, ParameterSetName='Name', Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateLength(1, 79)]
        [string]
        $Name,

        # Color of icon on the GUI.
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName)]
        [ValidateRange(0, 32)]
        [int]
        $Color,

        # Comment.
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName)]
        [ValidateLength(1, 256)]
        [string]
        $Comment,

        # Parameter help description
        [Parameter(Mandatory=$false)]
        [switch]
        $PassThru
    )

    process {

        $Data = @{ name = $Name}
        $Url = '/pm/config/adom/{0}/obj/firewall/address/{1}' ` -f $FortiManagerParams.AdministrativeDomain, $Name

        try {

            # Check if the firewall address exist.
            $FirewallAddress = Get-FirewallAddress -Name $Name
            if ($null -eq $FirewallAddress) {
                throw 'Failed to modify firewall address {0} because it does not exists.' -f $Name
            }

            # Create a list of properties that needs to be updated.
            foreach ($Property in Get-FirewallProperty) {
                if ($PSBoundParameters.ContainsKey($Property)) {
                    if ($FirewallAddress.$Property -ne $PSBoundParameters[$Property]) {
                        $Data.Add($Property, $PSBoundParameters[$Property])
                    }
                }
            }

            if ($PSCmdlet.ShouldProcess($Name, 'Set FirewallAddress')) {
                # Request the firewall address to be updated.
                $Response = Invoke-ForteeFoxRequest -Method Update -Url $Url -Data $Data

                if ($Response.result.status.code -ne 0) {
                    throw 'Set-FirewallAddress failed with code {0} and message {1}' -f `
                              $Response.result.status.code, `
                              $Response.result.status.message
                }

                # Returns the modified firewall address object.
                if ($PassThru) {
                    Get-FirewallAddress -Name $Name | Write-Output
                }
            } else {
                if ($null -eq (Get-FirewallAddress -Name $Name)) {
                    $Message = 'Failed to modify firewall address {0} because it does not exists.' -f $Name
                    Write-Error -Message $Message -Category ObjectNotFound
                }
            }
        } catch {
            Write-Error -Message $PSItem.Exception.Message
        }
    }
}