function Get-FirewallAddressGroupProperty {
    $Properties = @('_image-base64',
                    'allow-routing',
                    'category',
                    'color',
                    'comment',
                    'dynamic_mapping',
                    'exclude',
                    'exclude-member',
                    'fabric-object',
                    'member',
                    'tagging',
                    'type',
                    'uuid')

    return $Properties
}