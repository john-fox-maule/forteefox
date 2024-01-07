---
external help file: ForteeFox-help.xml
Module Name: ForteeFox
online version: https://github.com/john-fox-maule/forteefox/blob/main/docs/Copy-FirewallAddressGroup.md
schema: 2.0.0
---

# Copy-FirewallAddressGroup

## SYNOPSIS
Creates an firewall address group by cloning an existing address group.

## SYNTAX

### Name (Default)
```
Copy-FirewallAddressGroup [-Name] <String> -CloneName <String> [-Color <String>] [-Comment <String>]
 [-PassThru] [<CommonParameters>]
```

### Input
```
Copy-FirewallAddressGroup [-InputObject] <PSObject> [[-Name] <String>] -CloneName <String> [-Color <String>]
 [-Comment <String>] [-PassThru] [<CommonParameters>]
```

## DESCRIPTION
The Copy-FirewallAddressGroup cmdlet creates one firewall address group by cloning an existing group.

The Name parameter specifies the name of the group that you clone from and are required to create a new group.

The CloneName parameter specifies the name of the cloned group.

## EXAMPLES

### EXAMPLE 1
```
Copy-FirewallAddressGroup -Name RFC5737-GRP -CloneName CLONED-RFC5737-GRP
```

This example clones the firewall address group named RFC5737-GRP and creates a CLONED-RFC5737-GRP.

### EXAMPLE 2
```
Get-FirewallAddressGroup -Name RFC5737-GRP | Copy-FirewallAddressGroup -CloneName CLONED-RFC5737-GRP
```

This example clones the firewall address group named RFC5737-GRP and creates a CLONED-RFC5737-GRP.

## PARAMETERS

### -InputObject
{{ Fill InputObject Description }}

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

```yaml
Type: System.String
Parameter Sets: Input
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -CloneName
Specifies the the name of the cloned firewall address group.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Color
Color of icon on the GUI.

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

### -Comment
Specifies the comment of the cloned firewall address group in the GUI.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### **None or ForteeFox.FirewallAddressGroup**
### A firewall address group object is received by the Name parameter.
## OUTPUTS

### **None or ForteeFox.FirewallAddressGroup**
### Returns the cloned firewall address group object when the PassThru parameter is specified. By default, this cmdlet does not generate any output.
## NOTES
You must invoke Connect-ForteeFox before any commands that access FortiManager.

## RELATED LINKS

[https://github.com/john-fox-maule/forteefox/blob/main/docs/Copy-FirewallAddressGroup.md](https://github.com/john-fox-maule/forteefox/blob/main/docs/Copy-FirewallAddressGroup.md)

[Add-FirewallAddressGroupMember]()

[Get-FirewallAddressGroup]()

[New-FirewallAddressGroup]()

[Remove-FirewallAddressGroup]()

[Remove-FirewallAddressGroupMember]()

[Set-FirewallAddressGroup]()

