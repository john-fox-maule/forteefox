---
external help file: ForteeFox-help.xml
Module Name: ForteeFox
online version: https://github.com/john-fox-maule/forteefox/blob/main/docs/Get-FirewallAddressGroup.md
schema: 2.0.0
---

# Get-FirewallAddressGroup

## SYNOPSIS
Gets one firewall address group.

## SYNTAX

### Name (Default)
```
Get-FirewallAddressGroup [-Name] <String> [<CommonParameters>]
```

### Filter
```
Get-FirewallAddressGroup [-Filter] <Filter> [<CommonParameters>]
```

## DESCRIPTION
The Get-FirewallAddressGroup cmdlet gets a firewall address group.

## EXAMPLES

### EXAMPLE 1
```
Get-FirewallAddressGroup -Name 'RFC5737-GRP'
```

This example gets the firewall address group named RFC5737-GRP.

### EXAMPLE 2
```
Get-FirewallAddressGroup -Name RFC5737-GRP
```

## PARAMETERS

### -Filter
Specifies a query string that retrieves firewall address group objects.
This string uses the Fortinet Filter object syntax.

```yaml
Type: ForteeFox.Filter
Parameter Sets: Filter
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
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
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### **None or ForteeFox.FirewallAddressGroup**
### A firewall address group object is received by the Name parameter.
## OUTPUTS

### **ForteeFox.FirewallAddressGroup**
## NOTES

## RELATED LINKS

[https://github.com/john-fox-maule/forteefox/blob/main/docs/Get-FirewallAddressGroup.md](https://github.com/john-fox-maule/forteefox/blob/main/docs/Get-FirewallAddressGroup.md)

[Add-FirewallAddressGroupMember]()

[Copy-FirewallAddressGroup]()

[New-FirewallAddressGroup]()

[Remove-FirewallAddressGroup]()

[Remove-FirewallAddressGroupMember]()

[Set-FirewallAddressGroup]()

