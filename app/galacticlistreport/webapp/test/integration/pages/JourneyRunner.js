sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"galacticlistreport/test/integration/pages/SpacefarerList",
	"galacticlistreport/test/integration/pages/SpacefarerObjectPage"
], function (JourneyRunner, SpacefarerList, SpacefarerObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('galacticlistreport') + '/test/flp.html#app-preview',
        pages: {
			onTheSpacefarerList: SpacefarerList,
			onTheSpacefarerObjectPage: SpacefarerObjectPage
        },
        async: true
    });

    return runner;
});

