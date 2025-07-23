unit Visuals_u;

interface

uses
  Vcl.Dialogs, System.SysUtils, Data.DB, Data.Win.ADODB, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.controls;

procedure ChangeEdit(edtChange: TLabeledEdit; bError : Boolean); overload;
procedure ChangeEdit(edtChange: TEdit; bError : Boolean); overload;
procedure CenterLabel(lblCenter : TLabel; edtPoint : TLabeledEdit); overload;
procedure CenterLabel(lblCenter : TLabel; edtPoint : TEdit); overload;

implementation

procedure ChangeEdit(edtChange: TLabeledEdit; bError: Boolean);
begin
  if bError = True then        //removes the style from the button so that you can see the red.
    edtChange.StyleElements := [seBorder]
    else                           //adds the style back
      edtChange.StyleElements := [seFont, seClient, seBorder];
end;

procedure ChangeEdit(edtChange: TEdit; bError: Boolean);
begin
  if bError = True then        //removes the style from the button so that you can see the red.
    edtChange.StyleElements := [seBorder]
    else                           //adds the style back
      edtChange.StyleElements := [seFont, seClient, seBorder];
end;

procedure CenterLabel(lblCenter: TLabel; edtPoint: TLabeledEdit);
var
  iMid : Integer;
begin
  iMid := edtPoint.Left + edtPoint.Width div 2;

  lblCenter.Left := iMid - lblCenter.Width div 2;
  lblCenter.Top := edtPoint.Top + edtPoint.Height + 10;
end;

procedure CenterLabel(lblCenter: TLabel; edtPoint: TEdit);
var
  iMid : Integer;
begin
  iMid := edtPoint.Left + edtPoint.Width div 2;

  lblCenter.Left := iMid - lblCenter.Width div 2;
  lblCenter.Top := edtPoint.Top + edtPoint.Height + 10;
end;

end.
