unit Settings_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, User_u, Validation_u, Visuals_u,
  Vcl.Mask;

type
  TfrmSettings = class(TForm)
    lblPreviewHeader: TLabel;
    grpPreview: TGroupBox;
    sPreviewBackground: TShape;
    lblPreview: TLabel;
    btnPreview: TButton;
    edtPreview: TEdit;
    rgpThemes: TRadioGroup;
    btnReturn: TBitBtn;
    btnCancel: TBitBtn;
    grpUserSettings: TGroupBox;
    btnConfirm: TBitBtn;
    edtContactDetails: TLabeledEdit;
    edtSurname: TLabeledEdit;
    edtName: TLabeledEdit;
    edtUsername: TLabeledEdit;
    lblOutputUsername: TLabel;
    lblOutputName: TLabel;
    lblOutputSurname: TLabel;
    lblOutputContact: TLabel;
    edtPassword: TLabeledEdit;
    edtConfirmPassword: TLabeledEdit;
    lblOutputPassword: TLabel;
    chkShowPass: TCheckBox;
    procedure rgpThemesClick(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure edtUsernameChange(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure edtSurnameChange(Sender: TObject);
    procedure edtContactDetailsChange(Sender: TObject);
    procedure edtUsernameExit(Sender: TObject);
    procedure edtPasswordExit(Sender: TObject);
    procedure edtNameExit(Sender: TObject);
    procedure edtSurnameExit(Sender: TObject);
    procedure edtContactDetailsExit(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtPasswordChange(Sender: TObject);
    procedure chkShowPassClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetButtons;
  public
    { Public declarations }
  end;

var
  frmSettings: TfrmSettings;
  TOldForm : TForm;
  bChangeUser, bChangeName, bChangeTheme, bChangeSurname, bChangeEmail, bChangePass : Boolean;
  objAccount : tAccount;
implementation

uses Login_u, Admin_u, PropertyMap_u, Properties_u, Statistics_u;
{$R *.dfm}

procedure TfrmSettings.btnCancelClick(Sender: TObject);
var
  sTheme :String;
begin
  bChangeUser := False;
  bChangeName := False;
  bChangeTheme := False;
  bChangeSurname := False;

  sTheme := objAccount.getTheme;

  if sTheme = 'Windows10' then
    rgpThemes.ItemIndex := 0
  else
  if sTheme = 'Windows10 SlateGray' then
    rgpThemes.ItemIndex := 1
  else
  if sTheme = 'Windows10 Dark' then
    rgpThemes.ItemIndex := 2
  else
  if sTheme = 'Windows10 Blue' then
    rgpThemes.ItemIndex := 3
  else
  if sTheme = 'Windows10 Purple' then
    rgpThemes.ItemIndex := 4
  else
  if sTheme = 'Windows10 Green' then
    rgpThemes.ItemIndex := 5;

  edtUsername.Text := objAccount.getUsername;
  edtName.Text := objAccount.getName;
  edtSurname.Text := objAccount.getSurname;
  edtContactDetails.Text := objAccount.getEmail;

  edtUsername.StyleElements := [seFont, seClient, seBorder];
  edtPassword.StyleElements := [seFont, seClient, seBorder];
  edtConfirmPassword.StyleElements := [seFont, seClient, seBorder];
  edtContactDetails.StyleElements := [seFont, seClient, seBorder];
  edtSurname.StyleElements := [seFont, seClient, seBorder];
  edtName.StyleElements := [seFont, seClient, seBorder];

  lblOutputUsername.Caption := '';
  lblOutputName.Caption := '';
  lblOutputSurname.Caption := '';
  lblOutputContact.Caption := '';
  lblOutputPassword.Caption := '';
end;

procedure TfrmSettings.btnConfirmClick(Sender: TObject);
begin
  objAccount.MatchUserID;
  ShowMessage('Changes saved!');

  if bChangeTheme = True then
    begin
      objAccount.setTheme(grpPreview.StyleName);
      frmSettings.StyleName := objAccount.getTheme;
      bChangeTheme := False;
    end;

  if bChangeUser = True then
    begin
      objAccount.setUsername(edtUsername.Text);
      bChangeUser := False;
    end;

  if bChangeSurname = True then
    begin
      objAccount.setSurname(edtSurname.Text);
      bChangeSurname := False;
    end;

  if bChangeName = True then
    begin
      objAccount.setName(edtName.Text);
      bChangeName := False;
    end;

  if bChangeEmail = True then
    begin
      objAccount.setContact(edtContactDetails.Text);
      bChangeEmail := False;
    end;

  if bChangePass = True then
    begin
      objAccount.setPassword(edtPassword.Text);
      bChangePass := False;
      edtPassword.Text := '';
      edtConfirmPassword.Text := '';
    end;

  SetButtons;
end;

procedure TfrmSettings.btnReturnClick(Sender: TObject);
begin
  frmLogin.SwitchForm(frmSettings, TOldForm);
end;

procedure TfrmSettings.chkShowPassClick(Sender: TObject);
begin
  if chkShowPass.Checked = True then
    begin
      edtPassword.PasswordChar := #0;
      edtConfirmPassword.PasswordChar := #0;
    end
  else
    begin
      edtPassword.PasswordChar := '*';
      edtConfirmPassword.PasswordChar := '*';
    end;
end;

procedure TfrmSettings.edtContactDetailsChange(Sender: TObject);
begin
   if edtContactDetails.Text = objAccount.getEmail then
    bChangeEmail := False
  else
    bChangeEmail := True;

  SetButtons;
end;

procedure TfrmSettings.edtContactDetailsExit(Sender: TObject);
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

  SetButtons;
end;

procedure TfrmSettings.edtNameChange(Sender: TObject);
begin
   if edtName.Text = objAccount.getName then
    bChangeName := False
  else
    bChangeName := True;

  SetButtons;
end;

procedure TfrmSettings.edtNameExit(Sender: TObject);
begin
  if (Length(edtName.Text) <> 0) then
    begin
     GeneralValidation(lblOutputName, edtName);
    end
  else
    begin
      edtName.StyleElements := [seFont, seClient, seBorder];
      lblOutputName.Caption := '';
    end;

  SetButtons;
end;

procedure TfrmSettings.edtPasswordChange(Sender: TObject);
begin
  if (Length(edtPassword.Text) <> 0) OR (Length(edtConfirmPassword.Text) <> 0) then
    bChangePass := True
  else
    bChangePass := False;

  SetButtons;
end;

procedure TfrmSettings.edtPasswordExit(Sender: TObject);
begin
  if (Length(edtPassword.Text) <> 0) OR (Length(edtConfirmPassword.Text) <> 0) then
    PassValidation(lblOutputPassword, edtPassword, edtConfirmPassword)
  else
    begin
      edtPassword.StyleElements := [seFont, seClient, seBorder];
      edtConfirmPassword.StyleElements := [seFont, seClient, seBorder];
      lblOutputPassword.Caption := '';
    end;

  SetButtons;
end;

procedure TfrmSettings.edtSurnameChange(Sender: TObject);
begin
   if edtSurname.Text = objAccount.getSurname then
    bChangeSurname := False
  else
    bChangeSurname := True;

  SetButtons;
end;

procedure TfrmSettings.edtSurnameExit(Sender: TObject);
begin
  if (Length(edtSurname.Text) <> 0) then
    begin
      GeneralValidation(lblOutputSurname, edtSurname);
    end
  else
    begin
      edtSurname.StyleElements := [seFont, seClient, seBorder];
      lblOutputSurname.Caption := '';
    end;

  SetButtons;
end;

procedure TfrmSettings.edtUsernameChange(Sender: TObject);
begin
  if edtUsername.Text = objAccount.getUsername then
    bChangeUser := False
  else
    bChangeUser := True;

  SetButtons;
end;

procedure TfrmSettings.edtUsernameExit(Sender: TObject);
var
  bFound : Boolean;
begin
  if (edtUsername.Text <> frmLogin.objAccount.getUsername) then
    begin
      SpecifiedLenValidation(lblOutputUsername, edtUsername, 30, 3);

      bFound := False;

      tblUsers.First;
      while not tblUsers.Eof do
        begin
          if tblUsers['Username'] = edtUsername.Text then
            bFound := True;

          tblUsers.Next;
        end;

      if bFound = True then
        begin
          lblOutputUsername.Caption := 'Username already exists.';

          ChangeEdit(edtUsername, bFound);
          CenterLabel(lblOutputUsername, edtUsername);
        end;
    end
  else
    begin
      edtUsername.StyleElements := [seFont, seClient, seBorder];
      lblOutputUsername.Caption := '';
    end;

  SetButtons;
end;

procedure TfrmSettings.FormActivate(Sender: TObject);
var
  sTheme : String;
begin
  bChangeUser := False;
  bChangeName := False;
  bChangeTheme := False;
  bChangeSurname := False;

  btnCancel.OnMouseEnter := frmLogin.ButtonEnter;
  btnCancel.OnMouseLeave := frmLogin.ButtonExit;

  sTheme := objAccount.getTheme;

  if sTheme = 'Windows10' then
    rgpThemes.ItemIndex := 0
  else
  if sTheme = 'Windows10 Dark' then
    rgpThemes.ItemIndex := 1
  else
  if sTheme = 'Windows10 Blue' then
    rgpThemes.ItemIndex := 2
  else
  if sTheme = 'Windows10 Purple' then
    rgpThemes.ItemIndex := 3
  else
  if sTheme = 'Windows10 Green' then
    rgpThemes.ItemIndex := 4;

  edtUsername.Text := objAccount.getUsername;
  edtName.Text := objAccount.getName;
  edtSurname.Text := objAccount.getSurname;
  edtContactDetails.Text := objAccount.getEmail;
end;

procedure TfrmSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmLogin.objAccount.LogOut;
  Application.Terminate;
end;

procedure TfrmSettings.FormShow(Sender: TObject);
var
  sTheme :String;
begin
  objAccount := frmLogin.objAccount;

  bChangeUser := False;
  bChangeName := False;
  bChangeTheme := False;
  bChangeSurname := False;

  sTheme := objAccount.getTheme;

  if sTheme = 'Windows10' then
    rgpThemes.ItemIndex := 0
  else
  if sTheme = 'Windows10 Dark' then
    rgpThemes.ItemIndex := 1
  else
  if sTheme = 'Windows10 Blue' then
    rgpThemes.ItemIndex := 2
  else
  if sTheme = 'Windows10 Purple' then
    rgpThemes.ItemIndex := 3
  else
  if sTheme = 'Windows10 Green' then
    rgpThemes.ItemIndex := 4;

  edtUsername.Text := objAccount.getUsername;
  edtName.Text := objAccount.getName;
  edtSurname.Text := objAccount.getSurname;
  edtContactDetails.Text := objAccount.getEmail;

  edtUsername.StyleElements := [seFont, seClient, seBorder];
  edtPassword.StyleElements := [seFont, seClient, seBorder];
  edtConfirmPassword.StyleElements := [seFont, seClient, seBorder];
  edtContactDetails.StyleElements := [seFont, seClient, seBorder];
  edtSurname.StyleElements := [seFont, seClient, seBorder];
  edtName.StyleElements := [seFont, seClient, seBorder];

  lblOutputUsername.Caption := '';
  lblOutputName.Caption := '';
  lblOutputSurname.Caption := '';
  lblOutputContact.Caption := '';
  lblOutputPassword.Caption := '';
end;

procedure TfrmSettings.rgpThemesClick(Sender: TObject);
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

  if grpPreview.StyleName = frmLogin.objAccount.getTheme then
    bChangeTheme := False
  else
    bChangeTheme := True;

  SetButtons;
end;

procedure TfrmSettings.SetButtons;
var
  bError : Boolean;
begin
  bError := False;

           //holy mother of an if statement
  if (edtContactDetails.StyleElements = [seBorder]) OR (edtName.StyleElements = [seBorder]) OR (edtSurname.StyleElements = [seBorder]) OR
  (edtPassword.StyleElements = [seBorder]) OR (edtConfirmPassword.StyleElements = [seBorder]) OR (edtUsername.StyleElements = [seBorder]) then
    bError := True;

  if ((bChangeUser = True) OR (bChangeName = True) OR (bChangeSurname = True) OR (bChangeTheme = True) OR (bChangeEmail = True) OR (bChangePass = True)) AND (bError = False)  then
    begin
      btnConfirm.Enabled := True;
      btnCancel.Enabled := True;
    end
  else
    begin
      btnConfirm.Enabled := False;
      btnCancel.Enabled := False;
    end;

  if bError = True then
    btnCancel.Enabled := True;
end;

end.
