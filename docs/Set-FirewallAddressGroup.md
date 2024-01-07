---
external help file: ForteeFox-help.xml
Module Name: ForteeFox
online version: https://github.com/john-fox-maule/forteefox/blob/main/docs/Set-FirewallAddressGroup.md
schema: 2.0.0
---

# Set-FirewallAddressGroup

## SYNOPSIS
Modifies an firewall address group.

## SYNTAX

### Name (Default)
```
Set-FirewallAddressGroup [-Name] <String> [-Color <UInt32>] [-Comment <String>] [-Member <String[]>]
 [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Input
```
Set-FirewallAddressGroup [[-InputObject] <PSObject>] [-Name] <String> [-Color <UInt32>] [-Comment <String>]
 [-Member <String[]>] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The Set-FirewallAddress cmdlet modfies the properties of an firewall address group.

## EXAMPLES

### EXAMPLE 1
```
Set-FirewallAddressGroup -Name 'RFC5737-GRP' -Color 9 -Comment 'La Celeste'
```

### EXAMPLE 2
```
Set-FirewallAddressGroup -Name 'RFC5737-GRP' -Color 9 -Comment 'La Celeste'
```

## PARAMETERS

### -InputObject
Parameter help description

```yaml
Type: System.Management.Automation.PSObject
Parameter Sets: Input
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
Address group name.

```yaml
Type: System.String
Parameter Sets: Name
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

```yaml
Type: System.String
Parameter Sets: Input
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Color
Color of icon on the GUI.

```yaml
Type: System.UInt32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Comment
Comment.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Member
Firewall address objects contained within the group.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PassThru
TODO

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
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
### A firewall address group object is received by the Name parameter.
## OUTPUTS

### **None or ForteeFox.FirewallAddressGroup**
### Returns the new firewall address group object when the PassThru parameter is specified. By default, this cmdlet does not generate any output.
## NOTES

## RELATED LINKS

[https://github.com/john-fox-maule/forteefox/blob/main/docs/Set-FirewallAddressGroup.md](https://github.com/john-fox-maule/forteefox/blob/main/docs/Set-FirewallAddressGroup.md)

[Add-FirewallAddressGroupMember]()

[Copy-FirewallAddressGroup]()

[Get-FirewallAddressGroup]()

[New-FirewallAddressGroup]()

[Remove-FirewallAddressGroup]()

[Remove-FirewallAddressGroupMember]()

