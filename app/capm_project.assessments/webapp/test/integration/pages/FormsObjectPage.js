sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'capmproject.assessments',
            componentId: 'FormsObjectPage',
            contextPath: '/Assessments/forms'
        },
        CustomPageDefinitions
    );
});