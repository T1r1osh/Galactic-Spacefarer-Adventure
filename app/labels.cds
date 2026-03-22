using SpacefarerService as my from '../srv/spacefarer-service';

annotate my.Spacefarer with {
    name                    @title: '{i18n>Name}';
    email                   @title: '{i18n>Email}';
    planet                  @title: '{i18n>Planet}';
    spacecsuitColor         @title: '{i18n>SpacesuitColor}';
    stardustCollection      @title: '{i18n>StardustCollection}';
    wormholeNavigationSkill @title: '{i18n>WormholeNavigationSkill}';
    department              @title: '{i18n>Department}';
    position                @title: '{i18n>Position}';
}
