using {SpacefarerService} from './spacefarer-service';

annotate SpacefarerService.Spacefarer with {
    name                     @mandatory  @assert       : (case
                                                              when length(name) < 3
                                                                   then 'Name must be at least 3 characters long'
                                                          end);
    email                    @mandatory  @assert.format: '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    stardustCollection       @mandatory  @assert       : (case
                                                              when stardustCollection < 0
                                                                   then 'Stardust Collection cannot be negative'
                                                          end);
    wormholeNavigationSkill  @mandatory  @assert       : (case
                                                              when wormholeNavigationSkill > 100
                                                                   then 'Wormhole Navigation Skill cannot exceed 100.'
                                                          end);
};
