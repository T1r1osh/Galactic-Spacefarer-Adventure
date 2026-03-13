using {SpacefarerService} from './spacefarer-service';

annotate SpacefarerService.Spacefarer with {
    name  @mandatory  @assert: (case
                                    when length(name) < 3
                                         then 'Name must be at least 3 characters long'
                                end);
    email @mandatory;
};
