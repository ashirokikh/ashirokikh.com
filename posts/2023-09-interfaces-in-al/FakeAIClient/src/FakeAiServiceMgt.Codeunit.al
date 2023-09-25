codeunit 50100 "ASH Fake AI Service Mgt."
{
    procedure GetAnswer(Provider: Enum "ASH Fake AI Service Providers"; Question: Text) Answer: Text
    var
        AIServiceProvider: Interface "ASH AI Service Provider";
    begin
        if Question = '' then
            Error('Please enter your question.');

        AIServiceProvider := Provider;
        Answer := AIServiceProvider.GetAnswer(Question);
    end;

}