function Initialize-ForteeFox {
    # Variables
    $FortiManagerParams = @{
        AdministrativeDomain    = $null
        Port                    = $null
        Server                  = $null
        Session                 = $null
        SkipCertificateCheck    = $null
        Uri                     = $null
        WebSession              = $null
    }

    # Make script scope variable
    New-Variable -Name 'FortiManagerParams' `
                 -Value $FortiManagerParams `
                 -Scope Script `
                 -Visibility Private `
                 -Force
}