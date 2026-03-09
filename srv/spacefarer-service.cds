using {sap.cap.galactic.adventure as db} from '../db/schema';

service GalacticSpacefarerService @(odata: '/spacefarer') {
    entity Spacefarer as projection on db.Spacefarers;

}
