---
external help file: ForteeFox-help.xml
Module Name: ForteeFox
online version: https://github.com/john-fox-maule/forteefox/blob/main/docs/Set-FirewallAddress.md
schema: 2.0.0
---

# Set-FirewallAddress

## SYNOPSIS
Modifies an firewall address.

## SYNTAX

### Name (Default)
```
Set-FirewallAddress [-Name] <String> [-Color <Int32>] [-Comment <String>] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### Input
```
Set-FirewallAddress [-InputObject] <PSObject> [-Name] <String> [-Color <Int32>] [-Comment <String>] [-PassThru]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The Set-FirewallAddress cmdlet modfies the properties of an firewall address.

The Name parameter specifies the name of the address.

## EXAMPLES

### EXAMPLE 1
```
Set-FirewallAddress -Name 'TEST-NET-1' -Color 9 -Comment 'Rio de la Plata'
```

This example modfies the firewall address named TEST-NET-1 and set the properties for the color and the comment.

### EXAMPLE 2
```
Get-FirewallAddress -Name 'TEST-NET-2' | Set-FirewallAddress -Comment 'Teatro Solis'
```

This example modfies the firewall address named TEST-NET-2 and set the properties for the color and the comment.

### EXAMPLE 3
```
Test-MyTestFunction -Verbose
Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
```

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
Specifies an firewall address object by providing the name of the address.

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
Specifies the color of the new firewall address in the GUI.

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Comment
Specifies the comment of the new firewall address in the GUI.

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
Returns an firewall address representing the item with which you are working.
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

### **None or ForteeFox.FirewallAddress**
### A firewall address object is received by the Name parameter.
## OUTPUTS

### **None or ForteeFox.FirewallAddress**
### Returns the modfied firewall address object when the PassThru parameter is specified. By default, this cmdlet does not generate any output.
## NOTES

## RELATED LINKS

[https://github.com/john-fox-maule/forteefox/blob/main/docs/Set-FirewallAddress.md](https://github.com/john-fox-maule/forteefox/blob/main/docs/Set-FirewallAddress.md)

[Copy-FirewallAddress]()

[Get-FirewallAddress]()

[New-FirewallAddress]()

[Remove-FirewallAddress]()

