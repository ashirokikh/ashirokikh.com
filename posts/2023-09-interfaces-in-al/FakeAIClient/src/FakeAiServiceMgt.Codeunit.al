codeunit 50100 "ASH Fake AI Service Mgt."
{
    procedure GetAnswer(Provider: Enum "ASH Fake AI Service Providers"; Question: Text) Answer: Text
    var
        AlfasoftAiServiceMgt: Codeunit "ASH Alfasoft AI Service Mgt.";
        BingleAiServiceMgt: Codeunit "ASH Bingle AI Service Mgt.";
    begin
        if Question = '' then
            Error('Please enter your question.');

        case Provider of
            Provider::Bingle:
                Answer := BingleAiServiceMgt.GetAnswer(Question);
            Provider::Alfasoft:
                Answer := AlfasoftAiServiceMgt.GetAnswer(Question);
        end;
    end;

}