using {sap.cap.galactic as db} from '../db/schema';

service SpacefarerService @(odata: '/spacefarer')@(requires: 'authenticated-user') {
    @(restrict: [
        {
            grant: 'READ',
            to   : 'user',
            where: 'planet = $user.planet'

        },
        {
            grant: ['*'],
            to   : 'admin'
        }
    ])
    entity Spacefarer as projection on db.Spacefarers;
}
