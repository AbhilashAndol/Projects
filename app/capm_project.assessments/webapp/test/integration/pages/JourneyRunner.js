sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"capmproject/assessments/test/integration/pages/AssessmentsList",
	"capmproject/assessments/test/integration/pages/AssessmentsObjectPage",
	"capmproject/assessments/test/integration/pages/FormsObjectPage"
], function (JourneyRunner, AssessmentsList, AssessmentsObjectPage, FormsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('capmproject/assessments') + '/test/flpSandbox.html#capmprojectassessments-tile',
        pages: {
			onTheAssessmentsList: AssessmentsList,
			onTheAssessmentsObjectPage: AssessmentsObjectPage,
			onTheFormsObjectPage: FormsObjectPage
        },
        async: true
    });

    return runner;
});

