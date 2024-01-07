function Get-FirewallProperty {
    $Properties = @('_image-base64',
                'allow-routing',
                'associated-interface',
                'clearpass-spt',
                'color',
                'comment',
                'dirty',
                'dynamic_mapping',
                'fabric-object',
                'list',
                'macaddr',
                'node-ip-only',
                'obj-tag',
                'obj-type',
                'organization',
                'policy-group',
                'subnet',
                'subnet-name',
                'tag-detection-level',
                'tag-type',
                'tagging',
                'type',
                'uuid')

    return $Properties
}