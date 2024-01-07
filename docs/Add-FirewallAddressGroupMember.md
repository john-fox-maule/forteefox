---
external help file: ForteeFox-help.xml
Module Name: ForteeFox
online version: https://github.com/john-fox-maule/forteefox/blob/main/docs/Add-FirewallAddressGroupMember.md
schema: 2.0.0
---

# Add-FirewallAddressGroupMember

## SYNOPSIS
Add one or more members to an firewall address group.

## SYNTAX

```
Add-FirewallAddressGroupMember [-Name] <String> [-Member] <String[]> [-PassThru] [<CommonParameters>]
```

## DESCRIPTION
The Add-FirewallAddressGroupMember cmdlet adds one or more firewall address objects to  an firewall address group.

The Name parameter specifies the firewall address group that contains the members to add.
You can identify a group by its name.

You must invoke Connect-ForteeFox before any commands that access FortiManager.
This cmdlet gets the session id.

The Member parameter specifies the firewall address objects to add to the group specified by the Name parameter.

## EXAMPLES

### EXAMPLE 1
```
Add-FirewallAddressGroupMember -Name 'RFC5737-GRP' -Member 'TEST-NET-1'
```

This example adds the firewall address object named TEST-NET-1 to the firewall address group RFC5737-GRP.

### EXAMPLE 2
```
Add-FirewallAddressGroupMember -Name 'RFC5737-GRP' -Member 'TEST-NET-1', 'TEST-NET-2'
```

This example add the address objects named TEST-NET-1 and TEST-NET-2 to the firewall address group RFC5737-GRP.

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
Accept pipeline input: False
Accept wildcard characters: False
```

### -Member
Specifies an array of firewall address objects in a comma-separated list to add to a firewall address group.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
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
### Returns the new firewall address group object when the PassThru parameter is specified. By default, this cmdlet does not generate any output.
## NOTES

## RELATED LINKS

[https://github.com/john-fox-maule/forteefox/blob/main/docs/Add-FirewallAddressGroupMember.md](https://github.com/john-fox-maule/forteefox/blob/main/docs/Add-FirewallAddressGroupMember.md)

[Copy-FirewallAddressGroup]()

[Get-FirewallAddressGroup]()

[New-FirewallAddressGroup]()

[Remove-FirewallAddressGroup]()

[Remove-FirewallAddressGroupMember]()

[Set-FirewallAddressGroup]()

