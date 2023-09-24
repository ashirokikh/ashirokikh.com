codeunit 50100 "ASH Fake AI Service Mgt."
{
    procedure GetAnswer(Question: Text): Text
    begin
        if Question = '' then
            Error('Please enter your question.');

        exit('answer');
    end;

}