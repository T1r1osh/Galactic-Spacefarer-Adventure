using {sap.cap.galactic as db} from '../db/schema';

service SpacefarerService @(odata: '/spacefarer') {
    entity Spacefarer as projection on db.Spacefarers;
}
