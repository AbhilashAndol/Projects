namespace sapit.acoe.gbaas;

using { cuid, managed, User} from '@sap/cds/common';

entity Assessments : cuid, managed
{
   
    name: String @mandatory;
    sourceSystem                 : String @mandatory;
    sourceSystemID               : String @mandatory;
    responsibilityArea           : String @mandatory;
    useCaseOwner                 : User   @mandatory;  
    processor                    : User;
    isSteeringExceptionProvided  : Boolean default false;
    escalatedToHighRisk          : Boolean default false;
    initialClassification        : Association to one UseCaseClassificationCode;
    useCaseclassification        : Association to one UseCaseClassificationCode;
    status                       : Association to one StatusCode default 'Draft';
    assessmentsDelegates : Association to many AssessmentsDelegates on assessmentsDelegates.assessments = $self;
    comments : Composition of many Comments on comments.assessment = $self;
    forms : Composition of many Forms on forms.assessment = $self;
    statusCode : Association to one StatusCode;
}

entity Forms: cuid, managed
{  
    @assert.range
    formType : FormType @mandatory;
    formVersion : Integer default 1;
    assessment : Association to one Assessments;
    questionnaire : Association to one Questionnaires;
    questionnaireResponses : Composition of many QuestionnaireResponses on questionnaireResponses.form = $self;
    status : Association to one FormSubmissionStatusCode;
   
}


entity Questionnaires:cuid, managed
{
    version : Integer default 1;
    versionDescription : String(100);
    submitted          : Boolean default false;
    email : String(100) @mandatory;
    isActive : Boolean default true;
    @assert.range
    questionnairetype : QuestionnaireType @mandatory;
    questions : Composition of many Questions on questions.questionnaire = $self;
}


entity Questions
{
    key questionNumber : Integer;
    questionText : String(100) @mandatory;
    @assert.range
    responseType : ResponseType ;
    examples : String(100);
    isRequired : Boolean default false;
    policyDescription : String(100);
    compliantAnswer: String(100);
    questionnaire : Association to one Questionnaires;
    section : Association to one Sections;
    questionsChoices : Composition of many QuestionsChoice on questionsChoices.question = $self;
    dependentQuestions : Composition of many DependentQuestions on dependentQuestions.question = $self;
}



entity QuestionsChoice:cuid
{
    questionChoiceId : Integer;
    choiceSeqNum : Integer @mandatory;
    questionChoiceText : String(100) @mandatory;
    question : Association to one Questions;
}

entity Sections:cuid
{
    sectionName : String(100);
}

entity DependentQuestions
{
    key dependentQuestionNum : Integer;
    seqNumber : Integer;
    question : Association to one Questions;
}

entity QuestionnaireResponses:cuid, managed
{
    responseText : String(100);
    comment: String;
    question: Association to one Questions;
    form : Association to one Forms;
}


entity AssessmentsDelegates:cuid,managed
{
    assessments : Association to one Assessments;
    userID                   : User @mandatory;
    toBeNotified             : Boolean default true;

}

entity Comments:cuid,managed
{
    comment : String(100);
    assessment : Association to one Assessments;
}

entity StatusCode
{
    @assert.range
    key code : StatusType;
}

entity FormSubmissionStatusCode
{
    @assert.range
    key code : FormSubmissionStatusType;
}

entity UseCaseClassificationCode
{
    @assert.range
    key code : UseCaseClassificationType;
}



type FormType : String enum
{
    Exception;
    Inventory;
    T496;
}

type QuestionnaireType : String enum
{
    Exception;
    Inventory;
    T496;
}

type ResponseType : String enum
{
    CHOICE;
    DROPDOWN;
    TEXT;
}

type StatusType : String enum
{
    ActionOnRequestor = 'Action On Requestor';
    Completed;
    Draft;
    InReview;
    New;
    Obsolete;
    ReadyToSubmit = 'Ready To Submit';
    Stopped;
    Submitted;
}

type FormSubmissionStatusType : String enum
{
    Done;
    WorkInProgress = 'Work In Progress';
}

type UseCaseClassificationType : String enum
{
    HighRisk = 'High Risk';
    Prohibited;
    Standard;
}