---
external help file: ForteeFox-help.xml
Module Name: ForteeFox
online version: https://github.com/john-fox-maule/forteefox/blob/main/docs/New-FirewallAddressGroup.md
schema: 2.0.0
---

# New-FirewallAddressGroup

## SYNOPSIS
Creates an firewall address group.

## SYNTAX

### Name (Default)
```
New-FirewallAddressGroup [-Name] <String> [-Color <UInt32>] [-Comment <String>] -Member <String[]> [-PassThru]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Input
```
New-FirewallAddressGroup [-InputObject] <PSObject> [-Color <UInt32>] [-Comment <String>] -Member <String[]>
 [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The New-FirewallAddressGroup cmdlet creates one firewall address group.

The Name parameter specifies the name of the group and are required to create a new group.

The Member parameter specifies the firewall address objects to add to the group specified by the Name parameter.

## EXAMPLES

### EXAMPLE 1
```
New-FirewallAddressGroup -Name 'RFC5737-GRP' -Member 'TEST-NET-1'
```

This example creates the firewall address group named RFC5737-GRP with the TEST-NET-1 firewall address as a member.

### EXAMPLE 2
```
New-FirewallAddressGroup -Name 'RFC5737-GRP' -Member 'TEST-NET-1', 'TEST-NET-2', 'TEST-NET-3'
```

This example creates the firewall address group named RFC5737-GRP with the TEST-NET-1, TEST-NET-2 and TEST-NET-3 firewall address as members.

## PARAMETERS

### -InputObject
Parameter help description

```yaml
Type: System.Management.Automation.PSObject
Parameter Sets: Input
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
Specifies an firewall address group object by providing the name of the group.

```yaml
Type: System.String
Parameter Sets: Name
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Color
Specifies the firewall address group color.

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
Specifies an firewall address group comment.

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
Specifies an array of firewall address objects in a comma-separated list to add to a firewall address group.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PassThru
Returns an firewall address group representing the item with which you are working.
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

### **None or ForteeFox.FirewallAddressGroup**
### A firewall address group object is received by the Name parameter.
## OUTPUTS

### **None or ForteeFox.FirewallAddressGroup**
### Returns the new firewall address group object when the PassThru parameter is specified. By default, this cmdlet does not generate any output.
## NOTES
You must invoke Connect-ForteeFox before any commands that access FortiManager.

## RELATED LINKS

[https://github.com/john-fox-maule/forteefox/blob/main/docs/New-FirewallAddressGroup.md](https://github.com/john-fox-maule/forteefox/blob/main/docs/New-FirewallAddressGroup.md)

[Add-FirewallAddressGroupMember]()

[Copy-FirewallAddressGroup]()

[Get-FirewallAddressGroup]()

[Remove-FirewallAddressGroup]()

[Remove-FirewallAddressGroupMember]()

[Set-FirewallAddressGroup]()

