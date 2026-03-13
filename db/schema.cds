using {
    managed,
    cuid
} from '@sap/cds/common';

namespace sap.cap.galactic;

entity Spacefarers : cuid, managed {
    name                    : String                       @mandatory  @title: 'Name';
    email                   : String(255) not null         @mandatory  @title: 'Email';
    planet                  : String(100) default 'Earth'  @mandatory  @title: 'Planet';
    spacecsuitColor         : String(20) default 'White'   @title: 'Spacesuit Color';
    stardustCollection      : Integer                      @title: 'Stardust Collection';
    wormholeNavigationSkill : Integer                      @title: 'Wormhole Navigation Skill';
    department              : Association to Departments   @mandatory  @title: 'Department ID';
    position                : Association to Positions     @mandatory  @title: 'Position ID';

}

entity Departments {
    key ID          : Integer;
        name        : String(100) not null  @mandatory  @title: 'Department';
        description : String(500) not null  @title: 'Department Description';
        spacefarers : Association to many Spacefarers
                          on spacefarers.department = $self;
}


entity Positions {
    key ID          : Integer;
        title       : String(100) not null @title       : 'Position';
        rank        : Integer not null     @assert.range: [
            1,
            10
        ];
        spacefarers : Association to many Spacefarers
                          on spacefarers.position = $self
                                           @title       : 'Spacefarers';
}
