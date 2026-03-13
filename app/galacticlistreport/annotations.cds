using SpacefarerService as service from '../../srv/spacefarer-service';


annotate service.Spacefarer with @(UI: {

    HeaderInfo              : {
        TypeName      : 'Spacefarer',
        TypeNamePlural: 'Spacefarers',
        Title         : {
            $Type: 'UI.DataField',
            Value: name,
        }
    },

    FieldGroup #General     : {Data: [
        {
            $Type: 'UI.DataField',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Value: email,
        },
        {
            $Type: 'UI.DataField',
            Value: planet,
        },
        {
            $Type: 'UI.DataField',
            Value: spacecsuitColor,
        }
    ]},

    FieldGroup #Skills      : {Data: [
        {
            $Type: 'UI.DataField',
            Value: stardustCollection,
        },
        {
            $Type: 'UI.DataField',
            Value: wormholeNavigationSkill,
        }
    ]},

    FieldGroup #Organization: {Data: [
        {
            $Type: 'UI.DataField',
            Value: department,
        },
        {
            $Type: 'UI.DataField',
            Value: position,
        }
    ]},

    Facets                  : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Information',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Space Skills',
            Target: '@UI.FieldGroup#Skills'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Organization',
            Target: '@UI.FieldGroup#Organization'
        }
    ],
    LineItem                : [
        {
            $Type: 'UI.DataField',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Value: spacecsuitColor,
        },
        {
            $Type: 'UI.DataField',
            Value: stardustCollection,
        },
    ],
});

//annotate SpacefarerService.Spacefarer with @odata.draft.enabled;
