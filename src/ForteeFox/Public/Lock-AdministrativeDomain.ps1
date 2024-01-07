function Lock-AdministrativeDomain {
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

    [CmdletBinding(PositionalBinding=$false, DefaultParameterSetName='Name')]
    param (
        # Parameter help description
        [Parameter(Position=0, ParameterSetName='Input', Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [psobject]
        $InputObject,

        # Parameter help description
        [Parameter(Position=0, ParameterSetName='Name', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
        [ValidateLength(1, 48)]
        [string]
        $Name
    )

    begin {

        $Url = '/dvmdb/adom/{0}/workspace/lock' -f $FortiManagerParams.AdministrativeDomain

        if ($PSBoundParameters.ContainsKey('InputObject')) {
            $Url = '/dvmdb/adom/{0}/workspace/lock' -f $InputObject.Name
        }

        if ($PSBoundParameters.ContainsKey('Name')) {
            $Url = '/dvmdb/adom/{0}/workspace/lock' -f $Name
        }
    }

    process {
        Invoke-ForteeFoxRequest -Method Exec -Url $Url | Out-Null

        if ($Response.result.status.code -ne 0) {
            Write-Error -Message 'Lock-AdministrativeDomain failed with code {0} and message {1}' -f `
                                  $Response.result.status.code, `
                                  $Response.result.status.message
        }
    }
}