function ConvertTo-FirewallAddressGroup {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [psobject]
        $InputObject
    )

    $ForteeFoxPSType = 'ForteeFox.FirewallAddressGroup'
    $FirewallAddressGroup = ConvertTo-ForteeFoxObject -InputObject $InputObject -PSTypeName $ForteeFoxPSType

    return $FirewallAddressGroup
}