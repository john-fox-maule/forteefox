function Disconnect-ForteeFox {
    <#
        .SYNOPSIS
        Disconnect from the FortiManager.
        .DESCRIPTION
        You must invoke Disconnect-ForteeFox to release resources from the FortiManager after you have finished your work.
        .EXAMPLE
        Disconnect-ForteeFox

        This example Disconnect from the FortiManager.
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/Disconnect-ForteeFox.md
        .LINK
        Connect-ForteeFox
    #>

    [CmdletBinding(HelpUri='https://github.com/john-fox-maule/forteefox/blob/main/docs/Disconnect-ForteeFox.md')]

    $Url = '/sys/logout'
    Invoke-ForteeFoxRequest -Method Exec -Url $Url | Out-Null
    $FortiManagerParams.Clear()
}