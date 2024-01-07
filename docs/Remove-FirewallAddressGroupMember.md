---
external help file: ForteeFox-help.xml
Module Name: ForteeFox
online version: https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-FirewallAddressGroupMember.md
schema: 2.0.0
---

# Remove-FirewallAddressGroupMember

## SYNOPSIS
Removes one or more members from an firewall addressgroup.

## SYNTAX

```
Remove-FirewallAddressGroupMember [-Name] <String> -Member <String[]> [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
The Remove-FirewallAddressGroupMember cmdlet removes one or more firewall address objects from an firewall address group.

The Name parameter specifies the firewall address group that contains the members to remove.
You can identify a group by its name.
The Member parameter specifies the firewall address objects to remove from the group specified by the Name parameter.

## EXAMPLES

### EXAMPLE 1
```
Remove-FirewallAddressGroupMember -Name 'RFC5737-GRP' -Member 'TEST-NET-1'
```

This example removes the firewall address object named TEST-NET-1 from the firewall address group RFC5737-GRP.

### EXAMPLE 2
```
Test-MyTestFunction -Verbose
Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
```

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
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Member
Specifies an array of firewall address objects in a comma-separated list to remove from a firewall address group.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Returns an object representing the item with which you are working.
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
## OUTPUTS

### **None**
## NOTES

## RELATED LINKS

[https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-FirewallAddressGroupMember.md](https://github.com/john-fox-maule/forteefox/blob/main/docs/Remove-FirewallAddressGroupMember.md)

[Add-FirewallAddressGroupMember]()

[Copy-FirewallAddressGroup]()

[Get-FirewallAddressGroup]()

[New-FirewallAddressGroup]()

[Remove-FirewallAddressGroup]()

[Set-FirewallAddressGroup]()

