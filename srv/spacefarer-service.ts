import { Spacefarer } from "#cds-models/SpacefarerService";
import cds from "@sap/cds";

export class SpacefarerService extends cds.ApplicationService {
  init() {
    /*    this.before("*", (req) => {
      console.log(req.user);
    }); */

    this.before("CREATE", Spacefarer, async (req) => {
      validateStardustCollection(req);
      validateWormholeNavigationSkill(req);
      enhanceStardustCollection(req);
      enhanceWormholeNavigationSkill(req);

      /* 
      // More validation & enhancement logic based on stardust collection and navigation skill
      // 

      const { stardustCollection, wormholeNavigationSkill } = req.data;
      if (stardustCollection == null) {
        return req.error(400, "Stardust collection is missing");
      }

      if (wormholeNavigationSkill == null) {
        return req.error(400, "Wormhole navigation skill is missing");
      }
      if (stardustCollection > 5000 && wormholeNavigationSkill < 5) {
        req.error(
          400,
          "Spacefarers with large stardust collections must have navigation skill >= 5",
        );
      }
      // Enhancement based on stardust
      if (stardustCollection > 10000) {
        req.data.position_ID = 3;
      } else if (stardustCollection > 5000) {
        req.data.position_ID = 2;
      } else {
        req.data.position_ID = 1;
      } 
      */
    });

    this.after("CREATE", Spacefarer, async (spacefarer) => {
      if (!spacefarer) {
        console.log("No spacefarer data available after creation.");
        return;
      }
      sendNotification(spacefarer);
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
  if (!spacefarer.email) {
    console.log("User has no email, skipping notification.");
    return;
  }
  const notification = {
    to: `${spacefarer.email}`,
    subject: "🚀 Welcome to the Galactic Spacefarer Program!",
    body: `Hello ${spacefarer.name ?? "Spacefarer"}, \n Welcome aboard! Your adventure among the stars begins now. Safe travels and happy exploring!`,
    type: `email`,
  };
  try {
    console.log(notification);
  } catch (error) {
    console.log("Cosmic email service unavailable:", error);
  }
}
