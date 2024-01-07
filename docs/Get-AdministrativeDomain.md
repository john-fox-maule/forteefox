---
external help file: ForteeFox-help.xml
Module Name: ForteeFox
online version: https://github.com/john-fox-maule/forteefox/blob/main/docs/Get-AdministrativeDomain.md
schema: 2.0.0
---

# Get-AdministrativeDomain

## SYNOPSIS
Gets one or more Administrative domains.

## SYNTAX

```
Get-AdministrativeDomain [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION
The Get-AdministrativeDomain gets one or more Administrative domain object(s).

## EXAMPLES

### EXAMPLE 1
```
Get-AdministrativeDomain
```

### EXAMPLE 2
```
Get-AdministrativeDomain -Name Development
```

## PARAMETERS

### -Name
Specifies an Administrative Domain object by providing the name of the ADOM.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None.
## OUTPUTS

### ForteeFox.AdministrativeDomain
## NOTES

## RELATED LINKS

[https://github.com/john-fox-maule/forteefox/blob/main/docs/Get-AdministrativeDomain.md](https://github.com/john-fox-maule/forteefox/blob/main/docs/Get-AdministrativeDomain.md)

[Lock-AdministrativeDomain]()

[New-AdministrativeDomain]()

[Remove-AdministrativeDomain]()

[Unlock-AdministrativeDomain]()

