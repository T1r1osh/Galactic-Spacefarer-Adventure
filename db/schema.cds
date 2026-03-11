using {
    managed,
    cuid
} from '@sap/cds/common';

namespace sap.cap.galactic;

entity Spacefarers : cuid, managed {
    name                    : String not null;
    email                   : String not null;
    planet                  : String not null;
    spacecsuitColor         : String not null;
    stardustCollection      : Integer;
    wormholeNavigationSkill : Integer;
    department              : Association to Departments not null;
    position                : Association to Positions not null;

}

entity Departments : cuid {
    name        : String not null;
    description : String not null;
    spacefarers : Association to many Spacefarers
                      on spacefarers.department = $self;
}


entity Positions : cuid {
    title       : String not null;
    rank        : Integer not null;
    spacefarers : Association to many Spacefarers
                      on spacefarers.position = $self;
}
