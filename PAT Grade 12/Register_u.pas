unit Register_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Math,
  Data.DB, Data.Win.ADODB, Hash, User_u, Vcl.Mask, Vcl.ExtCtrls, Visuals_u, Validation_u;

type
  TfrmRegister = class(TForm)
    grpLogin: TGroupBox;
    btnReturn: TBitBtn;
    pgcRegister: TPageControl;
    tbsUsername: TTabSheet;
    tbsPassword: TTabSheet;
    edtUsername: TLabeledEdit;
    btnContinue: TBitBtn;
    lblOutputUser: TLabel;
    edtConfirmPass: TLabeledEdit;
    edtPassword: TLabeledEdit;
    lblOutputPass: TLabel;
    btnRegister: TBitBtn;
    chkShowPass: TCheckBox;
    btnBack: TBitBtn;
    procedure chkShowPassClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReturnClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtUsernameExit(Sender: TObject);
    procedure edtPasswordExit(Sender: TObject);
    procedure btnContinueClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    function GenerateID (tblGenerate : TADOTable; sColumnName : String) : String;
  end;

var
  frmRegister: TfrmRegister;
  tblUsers : TADOTable;

implementation

uses Login_u, PropertyMap_u, Setup_u, Properties_u, Admin_u, Statistics_u;

{$R *.dfm}

procedure TfrmRegister.btnBackClick(Sender: TObject);
begin
  pgcRegister.ActivePageIndex := 0;
end;

procedure TfrmRegister.btnContinueClick(Sender: TObject);
begin
  edtUsernameExit(edtUsername);
  
  if NOT (edtUsername.StyleElements = [seBorder]) then
    pgcRegister.ActivePageIndex := 1;
end;

procedure TfrmRegister.btnRegisterClick(Sender: TObject);
var
  sPassword, sUserID, sUsername : String ;
  bError : Boolean;
begin
  bError := False;

  edtPasswordExit(edtPassword);

  if (edtPassword.StyleElements = [seBorder]) then
    bError := True;

  if bError = False then
    begin
      frmProperties.btnAdmin.Visible := False;
      frmStatistics.btnAdmin.Visible := False;
      frmMap.btnAdmin.Visible := False;

     sUserID := GenerateID(tblUsers, 'UserID');
     sUsername := edtUsername.Text;
     sPassword := edtPassword.Text;

     frmAdmin.bUserChange := True;

     tblUsers.Insert;
     tblUsers['UserID'] := sUserID;
     tblUsers['Username'] := sUsername;
     //Hashes the password to make it more secure and then salting it
     //with the userID since that will always be unique making essentially every password unique.
     tblUsers['Password'] := THashSHA1.GetHashString(sPassword + sUserID);
     tblUsers['Theme'] := 'Windows10 Dark';
     tblUsers['AdminPriviledges'] := False;
     tblUsers.Post;

     frmAdmin.bUserChange := False;

     frmLogin.objAccount := TAccount.Create(tblUsers['UserID'], tblUsers['Username'], '', '', tblUsers['Theme'], tblUsers['AdminPriviledges'], '');
     frmLogin.objAccount.setTable(tblUsers);
     frmLogin.objAccount.Log('created an account.');
     frmLogin.SwitchForm(frmRegister, frmSetup);
    end;
end;

procedure TfrmRegister.btnReturnClick(Sender: TObject);
begin
  frmLogin.SwitchForm(frmRegister, frmLogin);
end;

procedure TfrmRegister.chkShowPassClick(Sender: TObject);
begin
  if chkShowPass.Checked = True then
    begin
      edtPassword.PasswordChar := #0;
      edtConfirmPass.PasswordChar := #0;
    end
  else
    begin
      edtPassword.PasswordChar := '*';
      edtConfirmPass.PasswordChar := '*';
    end;

end;

procedure TfrmRegister.edtPasswordExit(Sender: TObject);
begin
  PassValidation(lblOutputPass, edtPassword, edtConfirmPass);
end;

procedure TfrmRegister.edtUsernameExit(Sender: TObject);
begin
  UserValidation(lblOutputUser, edtUsername, tblUsers);
end;

procedure TfrmRegister.FormActivate(Sender: TObject);
begin
  tblUsers := frmLogin.tblUsers;

  btnRegister.OnMouseEnter := frmLogin.ButtonEnter;
  btnRegister.OnMouseLeave := frmLogin.ButtonExit;
  btnContinue.OnMouseEnter := frmLogin.ButtonEnter;
  btnContinue.OnMouseLeave := frmLogin.ButtonExit; 

  edtUsername.StyleElements := [seFont, seClient, seBorder];
  edtPassword.StyleElements := [seFont, seClient, seBorder];
  edtConfirmPass.StyleElements := [seFont, seClient, seBorder];

  CenterLabel(lblOutputPass, edtConfirmPass);
  CenterLabel(lblOutputUser, edtUsername);
  
  pgcRegister.ActivePageIndex := 0;
end;

procedure TfrmRegister.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmRegister.FormShow(Sender: TObject);
begin
  edtPassword.Text := '';
  edtUsername.Text := '';
  edtConfirmPass.Text := '';
  lblOutputUser.Caption := '';
  lblOutputPass.Caption := '';
  chkShowPass.Checked := False;
end;

function TfrmRegister.GenerateID(tblGenerate : TADOTable; sColumnName : String) : String;
var
  I :Integer;
  sID : String;
  bUnique : Boolean;
begin
  bUnique := False;

  while bUnique = False do
    begin
      bUnique := True;
      Randomize;
      sID := '';
      //Chr just changes a valid ascii value into a char so i use that to get a random character here
      sID := sID + Chr(RandomRange(65, 91));

      for I := 1 to 4 do
        begin
          sID := sID + IntToStr(RandomRange(0,9));
        end;

      tblGenerate.First;

      while NOT tblGenerate.Eof do
        begin
          if tblGenerate[sColumnName] = sID then
            begin
              bUnique := False;
              Break;
            end;
          tblGenerate.Next;
        end;

    end;

  Result := sID;
end;

end.
