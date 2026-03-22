using {
    managed,
    cuid
} from '@sap/cds/common';

namespace sap.cap.galactic;

entity Spacefarers : cuid, managed {
    name                    : String                     @Core.Immutable: true  @mandatory;
    email                   : String(255) not null       @Core.Immutable: true  @mandatory;
    planet                  : String(100) not null       @Core.Immutable: true  @mandatory;
    spacecsuitColor         : String(20) default 'White' @UI.selectionField;
    stardustCollection      : Integer;
    wormholeNavigationSkill : Integer;
    department              : Association to Departments @mandatory;
    position                : Association to Positions   @mandatory;

}

entity Departments {
    key ID          : Integer;
        name        : String(100) not null @mandatory;
        description : String(500) not null;
        spacefarers : Association to many Spacefarers
                          on spacefarers.department = $self;
}


entity Positions {
    key ID          : Integer;
        title       : String(100) not null;
        rank        : Integer not null @assert.range: [
            1,
            10
        ];
        spacefarers : Association to many Spacefarers
                          on spacefarers.position = $self;
}
