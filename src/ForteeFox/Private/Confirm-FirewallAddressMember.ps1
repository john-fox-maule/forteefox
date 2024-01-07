function Confirm-FirewallAddressMember {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $Members
    )

    begin {
        $ValidMembers = @()
    }

    process {

        foreach ($Member in $Members) {
            if ($null -eq (Get-FirewallAddress -Name $Member)) {
                Write-Warning -Message 'Firewall address object {0}, does not exist. Will not use as a member' -f $Member
            } else {
                $ValidMembers += $Member
            }
        }
        return $ValidMembers
    }
}