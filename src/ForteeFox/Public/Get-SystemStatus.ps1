function Get-SystemStatus {
    <#
    .SYNOPSIS
        A short one-line action-based description, e.g. 'Tests if a function is valid'
    .DESCRIPTION
        A longer description of the function, its purpose, common use cases, etc.
    .NOTES
        Information or caveats about the function e.g. 'This function is not supported in Linux'
    .LINK
        Specify a URI to a help page, this will show when Get-Help -Online is used.
    .EXAMPLE
        Test-MyTestFunction -Verbose
        Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
    #>

    $Url = '/sys/status'
    $Response = Invoke-ForteeFoxRequest -Method Get -Url $Url

    if ($Response.result.status.code -eq 0) {
        Write-Output $Response.result.data
    }
}