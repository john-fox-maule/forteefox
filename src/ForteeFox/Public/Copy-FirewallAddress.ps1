function Copy-FirewallAddress {
    <#
        .SYNOPSIS
        Creates an firewall address by cloning an existing address.
        .DESCRIPTION
        The Copy-FirewallAddress cmdlet creates one firewall address by cloning an existing address.

        The Name parameter specifies the name of the address that you clone from and are required to create a new address.
        The CloneName parameter specifies the name of the cloned address. You must invoke Connect-ForteeFox before any commands
        that access FortiManager. This cmdlet gets the session id.
        .PARAMETER CloneName
        Specifies the the name of the cloned firewall address.
        .PARAMETER Color
        Color of icon on the GUI.
        .PARAMETER Comment
        Comment.
        .PARAMETER Name
        Specifies an firewall address object by providing the name of the address.
        .PARAMETER PassThru
        Returns an object representing the item with which you are working. By default, this cmdlet does not generate any output.
        .EXAMPLE
        Copy-FirewallAddress -Name 'TEST-NET-1' -CloneName 'CLONED-TEST-NET-1'

        This example clones the firewall address named TEST-NET-1 and creates address named CLONED-TEST-NET-1.
        .EXAMPLE
        Get-FirewallAddress -Name 'TEST-NET-2' | Copy-FirewallAddress -CloneName 'CLONED-TEST-NET-2' -Comment 'Salto Grande Dam'

        This example clones the firewall address named TEST-NET-2 and creates address named CLONED-TEST-NET-2 and changes the comment to Salto Grande Dam
        .EXAMPLE
        Copy-FirewallAddress -Name 'TEST-NET-3' -CloneName 'CLONED-TEST-NET-3' -Color 3 -comment 'La Mano de Punta del Este'

        This example clones the firewall address named TEST-NET-3 and creates address named CLONED-TEST-NET-3 and changes the color to 3 and the comment to La Mano de Punta del Este.
        .INPUTS
        None.
        By default, this cmdlet returns no output.

        ForteeFox.FirewallAddress
        When you use the PassThru parameter, this cmdlet returns a FirewallAddress object representing the object..
        .OUTPUTS
        None or ForteeFox.FirewallAddress

        Returns the new firewall address object when the PassThru parameter is specified. By default, this cmdlet does not generate any output.
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/Copy-FirewallAddress.md
        .LINK
        Get-FirewallAddress
        .LINK
        New-FirewallAddress
        .LINK
        Remove-FirewallAddress
        .LINK
        Set-FirewallAddress
    #>

    [OutputType('ForteeFox.FirewallAddress')]
    [CmdletBinding(PositionalBinding=$false, DefaultParameterSetName='Name', HelpUri='https://github.com/john-fox-maule/forteefox/blob/main/docs/Gopy-FirewallAddress.md')]
    param (
        # Parameter help description
        [Parameter(Position=0, ParameterSetName='Input', Mandatory, ValueFromPipeline, DontShow)]
        [psobject]
        $InputObject,

        # Specifies an firewall address object by providing the name of the address.
        [Parameter(ParameterSetName='Input', Mandatory, ValueFromPipelineByPropertyName)]
        [Parameter(Position=0, ParameterSetName='Name', Mandatory, ValueFromPipeline)]
        [ValidateLength(1, 79)]
        [string]
        $Name,

        # Specifies the name of the cloned firewall address.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateLength(1, 79)]
        [string]
        $CloneName,

        # Specifies the color of the cloned firewall address in the GUI..
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName)]
        [ValidateRange(1, 32)]
        [uint]
        $Color,

        # Specifies the comment of the cloned firewall address in the GUI.
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

        $Data = @{ name = $CloneName }
        $Url = '/pm/config/adom/{0}/obj/firewall/address/{1}' -f $FortiManagerParams.AdministrativeDomain, $Name

        try {

            # Check if the source firewall address exist.
            $Source = Get-FirewallAddress -Name $Name
            if ($null -eq $Source) {
                throw 'Failed to clone firewall address {0} because it does not exists.' -f $Name
            }

            # Check if the clone firewall address already exists.
            if ($null -ne (Get-FirewallAddress -Name $CloneName)) {
                throw 'Failed to clone firewall address {0} because clone {1} already exists.' -f $Name, $CloneName
            }

            # Set all modfied parameters in clone.
            foreach ($Property in Get-FirewallProperty) {
                if ($PSBoundParameters.ContainsKey($Property)) {
                    if ($Source.$Property -ne $PSBoundParameters[$Property]) {
                        $Data.Add($Property, $PSBoundParameters[$Property])
                    }
                }
            }

            # Request the firewall address to be cloned.
            $Response = Invoke-ForteeFoxRequest -Method Clone -Url $Url -Data $Data

            if ($Response.result.status.code -ne 0) {
                throw 'Clone-FirewallAddress failed with code {0} and message {1}' -f `
                            $Response.result.status.code, `
                            $Response.result.status.message
            }

            if ($PassThru) {
                Get-FirewallAddress -Name $Response.result.data.name
            }
        }
        catch {
            Write-Error -Message $PSItem.Exception.Message
        }
    }

}