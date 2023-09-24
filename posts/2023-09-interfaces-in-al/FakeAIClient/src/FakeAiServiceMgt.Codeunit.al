codeunit 50100 "ASH Fake AI Service Mgt."
{
    procedure GetAnswer(Provider: Enum "ASH Fake AI Service Providers"; Question: Text) Answer: Text
    var
        AlfasoftAiServiceMgt: Codeunit "ASH Alfasoft AI Service Mgt.";
        BingleAiServiceMgt: Codeunit "ASH Bingle AI Service Mgt.";
        AIServiceProvider: Interface "ASH AI Service Provider";
    begin
        if Question = '' then
            Error('Please enter your question.');

        case Provider of
            Provider::Bingle:
                AIServiceProvider := BingleAiServiceMgt;
            Provider::Alfasoft:
                AIServiceProvider := AlfasoftAiServiceMgt;
            else
                OnBeforeGetAnswer(Provider, AIServiceProvider);
        end;

        Answer := AIServiceProvider.GetAnswer(Question);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetAnswer(Provider: Enum "ASH Fake AI Service Providers"; var AIServiceProvider: Interface "ASH AI Service Provider")
    begin
    end;

}