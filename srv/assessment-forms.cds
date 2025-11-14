using { practice.capm as db } from '../db/schema.cds';

@path : '/service/AssessmentForms'
service AssessmentForms
{
    @odata.draft.enabled
    entity Assessments as
        projection on db.Assessments;

    entity Forms as
        projection on db.Forms;


    entity Questionnaires as
        projection on db.Questionnaires;

    entity Questions as
        projection on db.Questions;

    entity QuestionsChoice as
        projection on db.QuestionsChoice;


    entity DependentQuestions as
        projection on db.DependentQuestions;

    entity QuestionnaireResponses as
        projection on db.QuestionnaireResponses;
}

annotate AssessmentForms with @requires :
[
    'User'
];
