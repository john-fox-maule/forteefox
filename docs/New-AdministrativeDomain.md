---
external help file: ForteeFox-help.xml
Module Name: ForteeFox
online version: https://github.com/john-fox-maule/forteefox/blob/main/docs/New-AdministrativeDomain.md
schema: 2.0.0
---

# New-AdministrativeDomain

## SYNOPSIS
Creates an Administrative domain.

## SYNTAX

```
New-AdministrativeDomain [[-Description] <String>] [-Name] <String> [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
The New-AdministrativeDomain creates an Administrative domain object.

## EXAMPLES

### EXAMPLE 1
```
New-AdministrativeDomain -Name 'Development' -Description 'Created with ForteeFox'
```

This example create an administrative domain with the name 'Development' and a description.

## PARAMETERS

### -Description
Specifies the description of the administrative domain.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Specifies an Administrative Domain object by providing the name of the ADOM.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Returns an administrative domain representing the item with which you are working.
By default, this cmdlet does not generate any output.

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

### None.
## OUTPUTS

### **None or ForteeFox.AdministrativeDomain**
### Returns the new administrative domain object when the PassThru parameter is specified. By default, this cmdlet does not generate any output.
## NOTES

## RELATED LINKS

[https://github.com/john-fox-maule/forteefox/blob/main/docs/New-AdministrativeDomain.md](https://github.com/john-fox-maule/forteefox/blob/main/docs/New-AdministrativeDomain.md)

[Get-AdministrativeDomain]()

[Lock-AdministrativeDomain]()

[Remove-AdministrativeDomain]()

[Unlock-AdministrativeDomain]()

