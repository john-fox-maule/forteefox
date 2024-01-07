---
external help file: ForteeFox-help.xml
Module Name: ForteeFox
online version: https://github.com/john-fox-maule/forteefox/blob/main/docs/Connect-ForteeFox.md
schema: 2.0.0
---

# Connect-ForteeFox

## SYNOPSIS
The Connect-ForteeFox cmdlet connects an authenticated account to FortiManager for use with cmdlets from the ForteeFox module.

## SYNTAX

```
Connect-ForteeFox -AdministrativeDomain <String> -Password <SecureString> [-Port <UInt32>] -Server <String>
 [-SkipCertificateCheck] -Username <String> [<CommonParameters>]
```

## DESCRIPTION
The Connect-ForteeFox cmdlet connects to FortiManager with an authenticated account for use with cmdlets from the ForteeFox
module.
After executing this cmdlet, you can disconnect from FortiManager account using Disconnect-ForteeFox.

## EXAMPLES

### EXAMPLE 1
```
$Password = (Read-Host -AsSecureString 'Password')
Connect-ForteeFox -Server localhost -Username 'el.barquero' -Password $Password
```

This example Connect to the FortiManager localhost on default port as user el.barquero to default adom 'root'

### EXAMPLE 2
```
$Password = ConvertTo-SecureString -String 'DameM@sAgua11800' -AsPlainText
Connect-ForteeFox -Server localhost -Port 8443 -Username 'el.barquero' -Password $Password
```

This example Connect to the FortiManager localhost on custom port 8443 as user el.barquero with the specifed password to default adom 'root'

### EXAMPLE 3
```
$Password = (Read-Host -AsSecureString 'Password')
Connect-ForteeFox -Server localhost -Username 'el.barquero' -Password $Password -AdministrativeDomain 'Development'
```

This example Connect to the FortiManager localhost on on default port as user el.barquero to the adom 'Development'

### EXAMPLE 4
```
$Password = (Read-Host -AsSecureString 'Password')
Connect-ForteeFox -Server localhost -Username 'el.barquero' -Password $Password -SkipCertificateCheck
```

This example Connect to the FortiManager localhost on on default port as user el.barquero to default adom 'root' and skips the certificate check.

### EXAMPLE 5
```
$Password = (Read-Host -AsSecureString 'Password')
Connect-ForteeFox -Server localhost -Port 8443 -Username el.barquero -Password $Password -SkipCertificateCheck -AdministrativeDomain Development
```

This example Connect to the FortiManager localhost on custom port 8443 as user 'el.barquero' to the adom 'Development' and skips the certificate check.

## PARAMETERS

### -AdministrativeDomain
Specifies the administrative domain you want to connect to in FortiManager.
This is also called the ADOM.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Specifies the password of the user with json-api access to authenticate to the FortiManager.

```yaml
Type: System.Security.SecureString
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Port
Specifies the tcp port that FortiManager is listening on.

```yaml
Type: System.UInt32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 443
Accept pipeline input: False
Accept wildcard characters: False
```

### -Server
Specifies an server address that FortiManager is installed, should be an fully qualified domain name, but can be an ip address.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipCertificateCheck
Skips certificate validation checks.
This includes all validations such as expiration, revocation, trusted root authority, etc.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Username
Specifies the username with json-api access to authenticate to the FortiManager.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None.
## OUTPUTS

### None.
## NOTES
None.

## RELATED LINKS

[https://github.com/john-fox-maule/forteefox/blob/main/docs/Connect-ForteeFox.md](https://github.com/john-fox-maule/forteefox/blob/main/docs/Connect-ForteeFox.md)

[Disconnect-ForteFox]()

