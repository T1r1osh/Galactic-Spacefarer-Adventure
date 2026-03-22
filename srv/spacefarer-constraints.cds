using {SpacefarerService} from './spacefarer-service';

annotate SpacefarerService.Spacefarer with {
     name                     @mandatory  @assert       : (case
                                                                when length(name) < 3
                                                                     then 'ASSERT_NAME'
                                                           end);
     email                    @mandatory  @assert.format: '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
     stardustCollection       @mandatory  @assert       : (case
                                                                when stardustCollection < 0
                                                                     then 'NEGATIVE_STARDUST'
                                                           end);
     wormholeNavigationSkill  @mandatory  @assert       : (case
                                                                when wormholeNavigationSkill > 100
                                                                     then 'OVER_MAX_NAVIGATION_SKILL'
                                                           end);
};
