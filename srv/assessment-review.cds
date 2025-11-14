using {practice.capm as my} from '../db/schema.cds';

@path: '/service/FormReview'
service FormReview 
{
    @odata.draft.enabled
    entity Assessments            as projection on my.Assessments;

    entity Questionnaires         as projection on my.Questionnaires;

    entity QuestionnaireResponses as projection on my.QuestionnaireResponses;

    entity Questions              as projection on my.Questions;

    entity Forms                  as projection on my.Forms;

    entity QuestionsChoice        as projection on my.QuestionsChoice;

    entity DependentQuestions     as projection on my.DependentQuestions;
}

annotate FormReview with @requires :
[
    'User'
];
