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
            Label: 'Name',
        },
        {
            $Type: 'UI.DataField',
            Value: email,
            Label: 'Email',
        },
        {
            $Type: 'UI.DataField',
            Value: planet,
            Label: 'Origin Planet',
        },
        {
            $Type: 'UI.DataField',
            Value: spacecsuitColor,
            Label: 'Spacesuit Color',
        }
    ]},

    FieldGroup #Skills      : {Data: [
        {
            $Type: 'UI.DataField',
            Value: stardustCollection,
            Label: 'Stardust Collection',
        },
        {
            $Type: 'UI.DataField',
            Value: wormholeNavigationSkill,
            Label: 'Wormhole Navigation Skill',
        }
    ]},

    FieldGroup #Organization: {Data: [
        {
            $Type: 'UI.DataField',
            Value: department,
            Label: 'Department',
        },
        {
            $Type: 'UI.DataField',
            Value: position,
            Label: 'Position',
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
            Label: 'Name',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Spacecsuit Color',
            Value: spacecsuitColor,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Stardust Collection',
            Value: stardustCollection,
        },
    ],
});

//annotate SpacefarerService.Spacefarer with @odata.draft.enabled;
