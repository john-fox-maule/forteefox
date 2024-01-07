#---------------------------------------------------------------------------
#
#  Functions
#
#---------------------------------------------------------------------------
function Invoke-ForteeFoxRequest {
    [OutputType('System.Collections.Hashtable')]
    [CmdletBinding(PositionalBinding=$false)]
    param (
        # Parameter help description
        [Parameter(Mandatory=$false)]
        [hashtable]
        $Data,
        # Specifies the packet id of the request.
        [Parameter(Mandatory=$false)]
        $Id,

        # Parameter help description
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $Fields,

        # Parameter help description
        [Parameter()]
        [ForteeFox.Filter]
        $Filter,
        #
        [Parameter(Mandatory)]
        [ValidateSet('Add', 'Clone', 'Delete', 'Exec', 'Get', 'Move', 'Set', 'Update')]
        [string]
        $Method,

        # Set fetch option for the request.
        [Parameter(ParameterSetName='GetParameterSet')]
        [ValidateSet('chksum', 'datasrc', 'scope member')]
        [string]
        $Option,

        # Path to the object or table object.
        [Parameter(Mandatory=$true)]
        [string]
        $Url
    )

    begin {

        # Base request.
        $Request = @{
            method = $Method.ToLower()
            params = @(
                @{
                    url = $Url
                }
            )
        }

        # Do we have some data.
        if ($PSBoundParameters.ContainsKey('Data')) {
            $Request.params[0].Add('data', $Data)
        }

        # Do we only need some fields
        if ($PSBoundParameters.ContainsKey('Fields')) {
            $Request.params[0].Add('fields', $Fields -split ',')
        }

        # Do we have a filter
        if ($PSBoundParameters.ContainsKey('Filter')) {
            $FilterArray = @($Filter.source, $Filter.condition)
            $FilterArray += ($Filter.target -split ',')
            $Request.params[0].Add('filter', $FilterArray)
        }

        # Generate a unique id for each packet if not specified.
        if ($PSBoundParameters.ContainsKey('Id')) {
            $Request.Add('id', $Id)
        } else {
            $Request.Add('id', (New-Guid).Guid)
        }

        if ($PSBoundParameters.ContainsKey('Option')) {
            $Request.params[0].option = $Option
        }

        if ($null -ne $FortiManagerParams.session) {
            $Request.Add('session', $FortiManagerParams.session)
        } else {
            # It must be a login request
            if ($Url -ne '/sys/login/user') {
                Write-Error -Message 'You must call Connect-ForteeFox before calling any other cmdlet.' `
                            -Category InvalidOperation

                throw
            }
        }
    }

    process {

        try {
            $FortiManagerRequest = @{
                Uri = $FortiManagerParams.Uri
                Body = $Request | ConvertTo-Json -Depth 10
                ContentType = 'application/json'
                Method = 'POST'
                SkipCertificateCheck = $FortiManagerParams.SkipCertificateCheck
                SslProtocol = 'Tls12'
            }

            # Web request session handling.
            if ($null -ne $FortiManagerParams.WebSession) {
                $FortiManagerRequest.Add('WebSession', $FortiManagerParams.WebSession)
            } else {
                $FortiManagerRequest.Add('SessionVariable', 'FortiManagerWebSession')
            }

            # Send request to FortiManager.
            $Response = Invoke-WebRequest @FortiManagerRequest | ConvertFrom-Json

            if ($null -ne $FortiManagerWebSession) {
                $FortiManagerParams.WebSession = $FortiManagerWebSession
            }
        } catch {

            $Response = @{
                method = $Method.ToLower()
                result = @{
                    url = $Url
                    data = @{}
                    status = @{
                        code    = ''
                        message = ''
                    }
                }
            }

            if ($null -ne $_.Exception.Response.StatusCode) {
                $Response.result.data = $_.Exception.Response
                $Response.result.status.code = 1
                $Response.result.status.message = $_.Exception.Response.ReasonPhrase
            } else {
                $Response.result.status.code = 1
                $Response.result.status.message = $PSItem.ErrorDetails.Message
            }

            return $Response
        }
        return $Response
    }
}