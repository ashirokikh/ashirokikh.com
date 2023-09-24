page 50100 "ASH Fake AI Service"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Fake AI Service';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            field(Question; Question)
            {
                ApplicationArea = All;
                Caption = 'Question';
                MultiLine = true;
                ToolTip = 'The question to ask the AI service.';
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Get AI Answer")
            {
                Caption = 'Get AI Answer';
                ApplicationArea = All;
                Image = Answers;
                ToolTip = 'Get the answer from the AI service.';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    FakeAiServiceMgt: Codeunit "ASH Fake AI Service Mgt.";
                begin
                    Message(FakeAiServiceMgt.GetAnswer(Question));
                end;
            }
        }
    }

    var
        Question: Text;

}

