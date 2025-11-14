using { practice.capm as db } from '../db/schema.cds';


@path : '/service/QuestionnaireManagement'
service QuestionnaireManagement
{

    annotate QuestionsChoice
    {
        questionChoiceText
            @Common.Label : 'Option'; 
        choiceSeqNum
            @Common.Label : 'Sequence';
    }

    annotate Questions
    {
        questionText
            @Common.Label : 'Question Text';
        questionNumber
            @Common.Label : 'Question ID';
    }


    annotate Sections
    {
        sectionName
            @Common.Label : 'Section Name';
    }

    @odata.draft.enabled
    entity Questionnaires as
        projection on db.Questionnaires;

    entity Questions as
        projection on db.Questions;

    entity QuestionsChoice as
        projection on db.QuestionsChoice
        {
            *,
            question.questionnaire.ID as extendedQuestionID : UUID
        };

    entity Sections as
        projection on db.Sections;

    entity DependentQuestions as
        projection on db.DependentQuestions;

   
}

annotate QuestionnaireManagement with @requires :
[
    'User'
    
];