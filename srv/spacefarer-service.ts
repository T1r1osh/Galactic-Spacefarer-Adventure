import { Spacefarer } from "#cds-models/SpacefarerService";
import cds, { type Request } from "@sap/cds";

export class SpacefarerService extends cds.ApplicationService {
  init() {
    this.before("*", (req) => {
      console.log(req.user);
    });

    this.before("CREATE", Spacefarer, async (req) => {
      validateStardustCollection(req);
      validateWormholeNavigationSkill(req);
      enhanceStardustCollection(req);
      enhanceWormholeNavigationSkill(req);
    });

    this.after("CREATE", Spacefarer, async (spacefarer) => {
      sendNotification(spacefarer!);
    });

    return super.init();
  }
}

async function validateStardustCollection(req: cds.Request<Spacefarer>) {
  const stardust = req.data.stardustCollection;
  if (stardust === undefined || stardust === null) {
    return req.error(
      400,
      "Stardust Collection is mandatory and cannot be null.",
    );
  }
  if (stardust < 0) {
    return req.error(400, "Stardust Collection cannot be negative.");
  }
}

async function validateWormholeNavigationSkill(req: cds.Request<Spacefarer>) {
  const navigationSkill = req.data.wormholeNavigationSkill;
  if (navigationSkill === undefined || navigationSkill === null) {
    return req.error(
      400,
      "Wormhole Navigation Skill is mandatory and cannot be null.",
    );
  }
  if (navigationSkill > 100) {
    return req.error(400, "Wormhole Navigation Skill cannot exceed 100.");
  }
}

async function enhanceStardustCollection(req: cds.Request<Spacefarer>) {
  const stardust = req.data.stardustCollection;
  if (stardust === undefined || stardust === null) {
    return req.error(
      400,
      "Stardust Collection is mandatory and cannot be null.",
    );
  }
  // Add registration bonus of 200 stardust for new spacefarers
  req.data.stardustCollection = stardust + 200;
}

async function enhanceWormholeNavigationSkill(req: cds.Request<Spacefarer>) {
  const navigationSkill = req.data.wormholeNavigationSkill;
  if (navigationSkill === undefined || navigationSkill === null) {
    return req.error(
      400,
      "Wormhole Navigation Skill is mandatory and cannot be null.",
    );
  }
  if (navigationSkill < 1) {
    // Set a default navigation skill of 1 for new spacefarers even if they think they are worse than that
    req.data.wormholeNavigationSkill = 1;
  }
}

async function sendNotification(spacefarer: Spacefarer) {
  const notification = {
    to: `${spacefarer?.email}`,
    subject: "🚀 Welcome to the Galactic Spacefarer Program!",
    body: `Hello ${spacefarer?.name || "Spacefarer"}, \n Welcome aboard! Your adventure among the stars begins now. Safe travels and happy exploring!`,
    type: `email`,
  };
  try {
    // await sendNotification(notification);
    console.log(notification);
  } catch (error) {
    console.log("Cosmic email service unavailable:", error);
  }
}
