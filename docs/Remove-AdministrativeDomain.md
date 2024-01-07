---
external help file: ForteeFox-help.xml
Module Name: ForteeFox
online version: https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-AdministrativeDomain.md
schema: 2.0.0
---

# Remove-AdministrativeDomain

## SYNOPSIS
Removes an Administrative Domain

## SYNTAX

```
Remove-AdministrativeDomain [-Name] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The Remove-AdministrativeDomain removes an Administrative Domain object.

## EXAMPLES

### EXAMPLE 1
```
Remove-AdministrativeDomain -Name Development
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

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### None
## NOTES

## RELATED LINKS

[https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-AdministrativeDomain.md](https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-AdministrativeDomain.md)

[Get-AdministrativeDomain]()

[Lock-AdministrativeDomain]()

[New-AdministrativeDomain]()

[Remove-AdministrativeDomain]()

[Unlock-AdministrativeDomain]()

