using AssessmentForms as service from '../../srv/assessment-forms';
annotate service.Assessments with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'sourceSystem',
                Value : sourceSystem,
            },
            {
                $Type : 'UI.DataField',
                Label : 'sourceSystemID',
                Value : sourceSystemID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'responsibilityArea',
                Value : responsibilityArea,
            },
            {
                $Type : 'UI.DataField',
                Value : useCaseOwner,
            },
            {
                $Type : 'UI.DataField',
                Value : processor,
            },
            {
                $Type : 'UI.DataField',
                Label : 'isSteeringExceptionProvided',
                Value : isSteeringExceptionProvided,
            },
            {
                $Type : 'UI.DataField',
                Label : 'escalatedToHighRisk',
                Value : escalatedToHighRisk,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Submissions',
            ID : 'Submissions',
            Target : 'forms/@UI.LineItem#Submissions',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'sourceSystem',
            Value : sourceSystem,
        },
        {
            $Type : 'UI.DataField',
            Label : 'sourceSystemID',
            Value : sourceSystemID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'responsibilityArea',
            Value : responsibilityArea,
        },
        {
            $Type : 'UI.DataField',
            Value : useCaseOwner,
        },
    ],
);

annotate service.Forms with @(
    UI.LineItem #Submissions : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : formType,
            Label : 'formType',
        },
        {
            $Type : 'UI.DataField',
            Value : formVersion,
            Label : 'formVersion',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'status_code',
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedBy,
        },
    ]
);

