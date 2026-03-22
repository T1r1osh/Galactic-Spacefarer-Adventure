using SpacefarerService as my from '../../srv/spacefarer-service';


annotate my.Spacefarer with @(UI: {

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
            Value: department_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: position_ID,
        }
    ]},

    Facets                  : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>General}',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Skills}',
            Target: '@UI.FieldGroup#Skills'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Organization}',
            Target: '@UI.FieldGroup#Organization'
        }
    ],
    LineItem                : [
        {
            $Type: 'UI.DataField',
            Value: name,
            selectionField
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

annotate my.Spacefarer with {
    department @(
        Common.ValueList               : {
            CollectionPath: 'Departments',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: department_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name'
                }
            ]
        },
        Common.ValueListWithFixedValues: true,
        Common.Text                    : department.name,
        Common.TextArrangement         : #TextOnly,

    );
    position   @(
        Common.ValueList               : {
            CollectionPath: 'Positions',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: position_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'title'
                }
            ]
        },
        Common.ValueListWithFixedValues: true,
        Common.Text                    : position.title,
        Common.TextArrangement         : #TextOnly,
    );

};

annotate my.Spacefarer with @UI.SelectionFields: [
    name,
    spacecsuitColor,
    stardustCollection
];

//annotate SpacefarerService.Spacefarer with @odata.draft.enabled;
