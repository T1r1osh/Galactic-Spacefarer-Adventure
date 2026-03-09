using {
    managed,
    cuid
} from '@sap/cds/common';

namespace sap.cap.galactic.adventure;

entity Spacefarers : cuid, managed {
    name                    : String;
    originPlanet            : String;
    spacecsuitColor         : String;
    stardustCollection      : Integer;
    wormholeNavigationSkill : Integer;
    department              : Association to Departments;
    position                : Association to Positions;

}

entity Departments : cuid {
    name        : String;
    description : String;
    spacefarers : Association to many Spacefarers
                      on spacefarers.department = $self;
}

entity Positions : cuid {
    title       : String;
    rank        : Integer;
    spacefarers : Association to many Spacefarers
                      on spacefarers.position = $self;
}
