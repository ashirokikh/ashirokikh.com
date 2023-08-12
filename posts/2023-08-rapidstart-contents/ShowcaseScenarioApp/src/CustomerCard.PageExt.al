pageextension 50100 "ASH Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("ASH Important Field"; Rec."ASH Important Field")
            {
                ApplicationArea = All;
                Caption = 'ASH Important Field';
                ToolTip = 'ASH Important Field';
            }
        }
    }
}