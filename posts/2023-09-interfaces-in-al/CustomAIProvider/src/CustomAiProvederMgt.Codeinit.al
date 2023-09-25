codeunit 50151 "ASH Cust. Serv. Provider Mgt."
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"ASH Fake AI Service Mgt.", OnBeforeGetAnswer, '', false, false)]
    local procedure OnBeforeGetAnswer(Provider: Enum "ASH Fake AI Service Providers"; var AIServiceProvider: Interface "ASH AI Service Provider");
    var
        ApricotAIServiceMgt: Codeunit "ASH Apricot AI Service Mgt.";
    begin
        if Provider = Provider::Apricot then
            AIServiceProvider := ApricotAIServiceMgt;
    end;

}