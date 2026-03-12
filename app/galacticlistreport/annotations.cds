using SpacefarerService as service from '../../srv/spacefarer-service';

annotate service.Spacefarer with @(
    UI.FieldGroup #SpacefarerDetails: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'name',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Label: 'email',
                Value: email,
            },
            {
                $Type: 'UI.DataField',
                Label: 'planet',
                Value: planet,
            },
            {
                $Type: 'UI.DataField',
                Label: 'spacecsuitColor',
                Value: spacecsuitColor,
            },
            {
                $Type: 'UI.DataField',
                Label: 'stardustCollection',
                Value: stardustCollection,
            },
            {
                $Type: 'UI.DataField',
                Label: 'wormholeNavigationSkill',
                Value: wormholeNavigationSkill,
            },
        ],
    },
    UI.Facets                       : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'SpacefarerDetailsFacet',
        Label : 'Cosmic Details',
        Target: '@UI.FieldGroup#SpacefarerDetails',
    }, ],
    UI.LineItem                     : [
        {
            $Type: 'UI.DataField',
            Label: 'name',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Label: 'spacecsuitColor',
            Value: spacecsuitColor,
        },
        {
            $Type: 'UI.DataField',
            Label: 'stardustCollection',
            Value: stardustCollection,
        },
    ],
);
