---
external help file: ForteeFox-help.xml
Module Name: ForteeFox
online version: https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-FirewallAddressGroup.md
schema: 2.0.0
---

# Remove-FirewallAddressGroup

## SYNOPSIS
Removes an firewall object group.

## SYNTAX

```
Remove-FirewallAddressGroup [-Name] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The Remove-FirewallAddressGroup cmdlet removes firewall address object group.

The Name parameter specifies the firewall address group to remove.

## EXAMPLES

### EXAMPLE 1
```
Remove-FirewallAddressGroup -Name 'RFC5737-GRP'
```

This example removes the firewall address group object named RFC5737-GRP.

## PARAMETERS

### -Name
Specifies an firewall address group object by providing the name of the group.

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

### **None or ForteeFox.FirewallAddressGroup**
## OUTPUTS

### **None**
## NOTES

## RELATED LINKS

[https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-FirewallAddressGroup.md](https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-FirewallAddressGroup.md)

[Add-FirewallAddressGroupMember]()

[Copy-FirewallAddressGroup]()

[Get-FirewallAddressGroup]()

[New-FirewallAddressGroup]()

[Remove-FirewallAddressGroupMember]()

[Set-FirewallAddressGroup]()

