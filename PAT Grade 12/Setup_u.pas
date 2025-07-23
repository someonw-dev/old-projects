unit Setup_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, User_u, Validation_u,
  Vcl.ComCtrls, Vcl.Mask;

type
  TfrmSetup = class(TForm)
    lblTitle: TLabel;
    lblPreviewTitle: TLabel;
    grpPreview: TGroupBox;
    sPreviewBackground: TShape;
    lblPreview: TLabel;
    btnPreview: TButton;
    edtPreview: TEdit;
    rgpThemes: TRadioGroup;
    btnContinue: TBitBtn;
    grpUserDetails: TGroupBox;
    edtName: TLabeledEdit;
    edtSurname: TLabeledEdit;
    edtContactDetails: TLabeledEdit;
    lblOutputName: TLabel;
    lblOutputSurname: TLabel;
    lblOutputContact: TLabel;
    procedure rgpThemesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnContinueClick(Sender: TObject);
    procedure edtNameExit(Sender: TObject);
    procedure edtSurnameExit(Sender: TObject);
    procedure edtContactDetailsExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    var
      objAccount : TAccount;
  public
    { Public declarations }
  end;

var
  frmSetup: TfrmSetup;

implementation

uses PropertyMap_u, Register_u, Login_u, Admin_u, Properties_u;


{$R *.dfm}

procedure TfrmSetup.btnContinueClick(Sender: TObject);
var
  bError : Boolean;
begin
  bError := False;

  edtNameExit(edtName);
  edtSurnameExit(edtSurname);
  edtContactDetailsExit(edtContactDetails);

  if (edtName.StyleElements = [seBorder]) OR (edtSurname.StyleElements = [seBorder]) OR (edtContactDetails.StyleElements = [seBorder]) then
    bError := True;

  if bError = False then
    begin
      objAccount.MatchUserID;

      objAccount.setTheme(grpPreview.StyleName);
      objAccount.setName(edtName.Text);
      objAccount.setSurname(edtSurname.Text);
      objAccount.setContact(edtContactDetails.Text);

      frmLogin.SwitchForm(frmSetup, frmProperties);
    end;
end;

procedure TfrmSetup.edtContactDetailsExit(Sender: TObject);
begin
  if Length(edtContactDetails.Text) <> 0 then
    begin
      GeneralValidation(lblOutputContact, edtContactDetails);
    end
  else
    begin
      edtContactDetails.StyleElements := [seFont, seClient, seBorder];
      lblOutputContact.Caption := '';
    end;
end;

procedure TfrmSetup.edtNameExit(Sender: TObject);
begin
  if Length(edtName.Text) <> 0 then
    begin
     GeneralValidation(lblOutputName, edtName);
    end
  else
    begin
      edtName.StyleElements := [seFont, seClient, seBorder];
      lblOutputName.Caption := '';
    end;
end;

procedure TfrmSetup.edtSurnameExit(Sender: TObject);
begin
  if Length(edtSurname.Text) <> 0 then
    begin
      GeneralValidation(lblOutputSurname, edtSurname);
    end
  else
    begin
      edtSurname.StyleElements := [seFont, seClient, seBorder];
      lblOutputSurname.Caption := '';
    end;
end;

procedure TfrmSetup.FormActivate(Sender: TObject);
begin
  objAccount := frmLogin.objAccount;
  grpPreview.StyleName := 'Windows10 Dark';
  sPreviewBackground.Brush.Color := $00000000;
end;

procedure TfrmSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmLogin.objAccount.LogOut;
  Application.Terminate;
end;

procedure TfrmSetup.rgpThemesClick(Sender: TObject);
begin
//i have the preview background shape because the groupbox doesnt change the background when changing the stylename
  case rgpThemes.Items[rgpThemes.ItemIndex][1] of
    'L' : begin
            grpPreview.StyleName := 'Windows10';
            sPreviewBackground.Brush.Color := $00F3F3F3;
          end;
    'D' : begin
            grpPreview.StyleName := 'Windows10 Dark';
            sPreviewBackground.Brush.Color := $00000000;
          end;
    'B' : begin
            grpPreview.StyleName := 'Windows10 Blue';
            sPreviewBackground.Brush.Color := $00C8700C;
          end;
    'P' : begin
            grpPreview.StyleName := 'Windows10 Purple';
            sPreviewBackground.Brush.Color := $007B3980;
          end;
    'E' : begin
            grpPreview.StyleName := 'Windows10 Green';
            sPreviewBackground.Brush.Color := $00687507;
          end;
  end;


end;

end.
