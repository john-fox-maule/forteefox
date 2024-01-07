---
external help file: ForteeFox-help.xml
Module Name: ForteeFox
online version: https://github.com/john-fox-maule/forteefox/blob/main/docs/Copy-FirewallAddress.md
schema: 2.0.0
---

# Copy-FirewallAddress

## SYNOPSIS
Creates an firewall address by cloning an existing address.

## SYNTAX

### Name (Default)
```
Copy-FirewallAddress [-Name] <String> -CloneName <String> [-Color <UInt32>] [-Comment <String>] [-PassThru]
 [<CommonParameters>]
```

### Input
```
Copy-FirewallAddress [-Name] <String> -CloneName <String> [-Color <UInt32>] [-Comment <String>] [-PassThru]
 [<CommonParameters>]
```

## DESCRIPTION
The Copy-FirewallAddress cmdlet creates one firewall address by cloning an existing address.

The Name parameter specifies the name of the address that you clone from and are required to create a new address.
The CloneName parameter specifies the name of the cloned address.
You must invoke Connect-ForteeFox before any commands
that access FortiManager.
This cmdlet gets the session id.

## EXAMPLES

### EXAMPLE 1
```
Copy-FirewallAddress -Name 'TEST-NET-1' -CloneName 'CLONED-TEST-NET-1'
```

This example clones the firewall address named TEST-NET-1 and creates address named CLONED-TEST-NET-1.

### EXAMPLE 2
```
Get-FirewallAddress -Name 'TEST-NET-2' | Copy-FirewallAddress -CloneName 'CLONED-TEST-NET-2' -Comment 'Salto Grande Dam'
```

This example clones the firewall address named TEST-NET-2 and creates address named CLONED-TEST-NET-2 and changes the comment to Salto Grande Dam

### EXAMPLE 3
```
Copy-FirewallAddress -Name 'TEST-NET-3' -CloneName 'CLONED-TEST-NET-3' -Color 3 -comment 'La Mano de Punta del Este'
```

This example clones the firewall address named TEST-NET-3 and creates address named CLONED-TEST-NET-3 and changes the color to 3 and the comment to La Mano de Punta del Este.

## PARAMETERS

### -Name
Specifies an firewall address object by providing the name of the address.

```yaml
Type: System.String
Parameter Sets: Name
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

```yaml
Type: System.String
Parameter Sets: Input
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -CloneName
Specifies the the name of the cloned firewall address.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None.
### By default, this cmdlet returns no output.
### ForteeFox.FirewallAddress
### When you use the PassThru parameter, this cmdlet returns a FirewallAddress object representing the object..
## OUTPUTS

### None or ForteeFox.FirewallAddress
### Returns the new firewall address object when the PassThru parameter is specified. By default, this cmdlet does not generate any output.
## NOTES

## RELATED LINKS

[https://github.com/john-fox-maule/forteefox/blob/main/docs/Copy-FirewallAddress.md](https://github.com/john-fox-maule/forteefox/blob/main/docs/Copy-FirewallAddress.md)

[Get-FirewallAddress]()

[New-FirewallAddress]()

[Remove-FirewallAddress]()

[Set-FirewallAddress]()

