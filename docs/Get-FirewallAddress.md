---
external help file: ForteeFox-help.xml
Module Name: ForteeFox
online version: https://github.com/john-fox-maule/forteefox/blob/main/docs/Get-FirewallAddress.md
schema: 2.0.0
---

# Get-FirewallAddress

## SYNOPSIS
Gets one ore more firewall address.

## SYNTAX

### Filter
```
Get-FirewallAddress [-Filter <Filter>] [<CommonParameters>]
```

### Name
```
Get-FirewallAddress [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION
The Get-FirewallAddress cmdlet gets one firewall address.
B

## EXAMPLES

### EXAMPLE 1
```
Get-FirewallAddress -Name 'TEST-NET-1'
```

This example gets the firewall address named TEST-NET-1.

### EXAMPLE 2
```
Get-FirewallAddress -Filter @{ source='name'; condition='like'; target='%TEST-NET-_' }
```

This exampe gets the firewall addresses where the name atrribute is like the target.

## PARAMETERS

### -Filter
Specifies a query string that retrieves firewall address objects.
This string uses the Fortinet Filter object syntax.

```yaml
Type: ForteeFox.Filter
Parameter Sets: Filter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Name
Specifies an firewall address object by providing the name of the firewall address.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### **None or ForteeFox.FirewallAddress**
### A firewall address object is received by the Name parameter.
## OUTPUTS

### **ForteeFox.FirewallAddress**
## NOTES
You must invoke Connect-ForteeFox before any commands that access FortiManager.

## RELATED LINKS

[https://github.com/john-fox-maule/forteefox/blob/main/docs/Get-FirewallAddress.md](https://github.com/john-fox-maule/forteefox/blob/main/docs/Get-FirewallAddress.md)

[Copy-FirewallAddress]()

[New-FirewallAddress]()

[Remove-FirewallAddress]()

[Set-FirewallAddress]()

