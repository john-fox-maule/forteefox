---
external help file: ForteeFox-help.xml
Module Name: ForteeFox
online version: https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-FirewallAddress.md
schema: 2.0.0
---

# Remove-FirewallAddress

## SYNOPSIS
Removes an firewall address.

## SYNTAX

```
Remove-FirewallAddress [-Name] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The Remove-FirewallAddress cmdlet removes a firewall address.

The Name parameter specifies the name of the firewall address to remove.

## EXAMPLES

### EXAMPLE 1
```
Remove-FirewallAddress -Name 'TEST-NET-1'
```

This example removes the firewall address named TEST-NET-1.

### EXAMPLE 2
```
Get-FirewallAddress -Name 'TEST-NET-2' | Remove-FirewallAddress
```

This example removes the firewall address named TEST-NET-2.

## PARAMETERS

### -Name
Specifies an firewall address object by providing the name of the firewall address.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
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

### **None or ForteeFox.FirewallAddress**
## OUTPUTS

### **None**
## NOTES

## RELATED LINKS

[https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-FirewallAddress.md](https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-FirewallAddress.md)

[Copy-FirewallAddress]()

[Get-FirewallAddress]()

[New-FirewallAddress]()

[Set-FirewallAddress]()

