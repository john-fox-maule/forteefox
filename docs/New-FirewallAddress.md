---
external help file: ForteeFox-help.xml
Module Name: ForteeFox
online version: https://github.com/john-fox-maule/forteefox/blob/main/docs/New-FirewallAddress.md
schema: 2.0.0
---

# New-FirewallAddress

## SYNOPSIS
Creates an firewall address.

## SYNTAX

### Name (Default)
```
New-FirewallAddress [-Name] <String> [-Color <UInt32>] [-Comment <String>] -Subnet <String> -Type <String>
 [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Input
```
New-FirewallAddress [-InputObject] <PSObject> [-Name] <String> [-Color <UInt32>] [-Comment <String>]
 -Subnet <String> -Type <String> [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The New-FirewallAddress cmdlet creates an firewall address.

The Name parameter specifies the name of the address.

## EXAMPLES

### EXAMPLE 1
```
New-FirewallAddress -Name 'TEST-NET-1' -Type 'ipmask' -Subnet '192.0.2.0/24' -Color 9 -Comment 'RFC 5737'
New-FirewallAddress -Name 'TEST-NET-2' -Type 'ipmask' -Subnet '198.51.100.0/24' -Color 9 -Comment 'RFC 5737'
New-FirewallAddress -Name 'TEST-NET-3' -Type 'ipmask' -Subnet '203.0.113.0/24' -Color 9 -Comment 'RFC 5737'
```

This example creates three firewall address named TEST-NET-1, TEST-NET-2 and TEST-NET-3 and set the properties for the color and the comment.

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
Specifies an firewall address object by providing the name of the address.

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

### -Color
Specifies the color of the new firewall address in the GUI.

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

### -Subnet
Specifies the IP address and subnet mask of address.

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

### -Type
Specifies the Type of address.

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
### Returns the new firewall address object when the PassThru parameter is specified. By default, this cmdlet does not generate any output.
## NOTES
You must invoke Connect-ForteeFox before any commands that access FortiManager.

## RELATED LINKS

[https://github.com/john-fox-maule/forteefox/blob/main/docs/New-FirewallAddress.md](https://github.com/john-fox-maule/forteefox/blob/main/docs/New-FirewallAddress.md)

[Copy-FirewallAddress]()

[Get-FirewallAddress]()

[Remove-FirewallAddress]()

[Set-FirewallAddress]()

