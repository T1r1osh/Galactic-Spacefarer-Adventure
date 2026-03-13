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
    entity Spacefarer  as
        projection on db.Spacefarers {
            *,
            position.title  as positionTitle,
            department.name as departmentName
        };

    @readonly
    entity Departments as projection on db.Departments;

    @readonly
    entity Positions   as projection on db.Positions;

    annotate Spacefarer with @odata.draft.enabled;
}
