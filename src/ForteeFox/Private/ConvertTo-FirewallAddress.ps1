function ConvertTo-FirewallAddress {
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [psobject]
        $InputObject
    )

    $ForteeFoxPSType = 'ForteeFox.FirewallAddress'
    $FirewallAddress = ConvertTo-ForteeFoxObject -InputObject $InputObject -PSTypeName $ForteeFoxPSType

    return $FirewallAddress
}