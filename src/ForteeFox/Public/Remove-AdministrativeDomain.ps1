function Remove-AdministrativeDomain {
    <#
        .SYNOPSIS
        Removes an Administrative Domain
        .DESCRIPTION
        The Remove-AdministrativeDomain removes an Administrative Domain object.
        .PARAMETER Name
        Specifies an Administrative Domain object by providing the name of the ADOM.
        .EXAMPLE
        Remove-AdministrativeDomain -Name Development
        .INPUTS
        None
        .OUTPUTS
        None
        .LINK
        https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-AdministrativeDomain.md
        .LINK
        Get-AdministrativeDomain
        .LINK
        Lock-AdministrativeDomain
        .LINK
        New-AdministrativeDomain
        .LINK
        Remove-AdministrativeDomain
        .LINK
        Unlock-AdministrativeDomain
    #>

    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='High')]
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $Name
    )

    begin {

        $Url = '/dvmdb/adom/{0}' -f $Name
    }

    process {

        try {

            if ($PSCmdlet.ShouldProcess($Name, 'Remove ADOM')) {
                $Response = Invoke-ForteeFoxRequest -Method Delete -Url $Url
                if ($Response.result.status.code -ne 0) {
                    throw 'Remove-AdministrativeDomain failed with code {0} and message {1}' -f `
                                 $Response.result.status.code, `
                                 $Response.result.status.message
                }
            } else {
                # WhatIf

                if ($PSBoundParameters.ContainsKey('WhatIf')) {
                    $Response = Get-AdministrativeDomain -Name $Name

                    if ($Response.name -eq $Name) {
                        continue
                    }

                    # Object not found
                    if ($Response.result.status.code -eq -3) {
                        $Message = 'Cannot Remove ADOM ''{0}'' because it does not exist.' -f $Name
                        Write-Error -Message $Message -Category ObjectNotFound
                    } else {
                        Write-Error -Message $Response.result.status.message -Category NotImplemented -ErrorId $Res.result.status.code
                    }
                }
            }
        }
        catch {
            Write-Error -Message $PSItem.Exception.Message
        }
    }
}