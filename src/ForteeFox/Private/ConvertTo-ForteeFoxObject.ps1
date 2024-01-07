function ConvertTo-ForteeFoxObject {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [psobject]
        $InputObject,

        # Parameter help description
        [Parameter(Mandatory=$true)]
        [string]
        $PSTypeName
    )

    # Create our custom type.
    $ConvertedObject = [PSCustomObject]@{
        PSTypeName = $PSTypeName
    }

    # Copy all properties.
    foreach ($Property in $InputObject.psobject.Properties.name) {
        $ConvertedObject | Add-Member -MemberType NoteProperty -Name $Property -Value $InputObject.$Property
    }

    # Remove oid property
    if (Get-Member -InputObject $InputObject -Name 'oid') {
        $ConvertedObject.psobject.properties.remove('oid')
    }

    return $ConvertedObject
}