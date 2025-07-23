unit Login_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, User_u, Hash,
  Data.DB, Data.Win.ADODB, Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmLogin = class(TForm)
    grpLogin: TGroupBox;
    lblNotFound: TLabel;
    lblRegisterAccount: TLabel;
    chkShowPass: TCheckBox;
    btnLogin: TBitBtn;
    pgbLoad: TProgressBar;
    edtUsername: TLabeledEdit;
    edtPassword: TLabeledEdit;
    procedure btnLoginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure chkShowPassClick(Sender: TObject);
    procedure Shape1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure lblRegisterAccountMouseEnter(Sender: TObject);
    procedure lblRegisterAccountMouseLeave(Sender: TObject);
    procedure lblRegisterAccountClick(Sender: TObject);
  private
    { Private declarations }
  var
    tblBuild : TADOTable;
    dsrBuild : TDataSource;
    procedure BuildTable(sTableName : String);
  public
    { Public declarations }
    procedure ConnectDatabase;
    var
      tblProperties, tblUsers : TADOTable;
      dsrProperties, dsrUsers, dsrQuery : TDataSource;
      qryQuery : TADOQuery;
      dbConnection : TADOConnection;
      objAccount : TAccount;
    procedure SwitchForm(TCurrentForm, TNextForm : TForm);
    procedure ButtonEnter(Sender: TObject);
    procedure ButtonExit(Sender: TObject);

  end;

var
  frmLogin: TfrmLogin;
implementation

uses
  PropertyMap_u, Admin_u, Register_u, Properties_u, Statistics_u;

{$R *.dfm}

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  sUsername, sPassword, sName, sSurname, sContactInfo : String;
begin
  sUsername := edtUsername.Text;
  //hashing the password to compare the hash in the table

  if objAccount <> nil then
    objAccount := nil;

  tblUsers.First;
  while not tblUsers.Eof do
    begin
      sPassword := THashSHA1.GetHashString(edtPassword.Text + tblUsers['UserID']);

      if (tblUsers['Username'] = sUsername) AND (tblUsers['Password'] = sPassword) then
        begin
          frmAdmin.BackupDatabase;
          if tblUsers['AdminPriviledges'] = False then
            begin
              frmProperties.btnAdmin.Visible := False;
              frmMap.btnAdmin.Visible := False;
              frmStatistics.btnAdmin.Visible := False;
            end
          else
            begin
              frmProperties.btnAdmin.Visible := True;
              frmMap.btnAdmin.Visible := True;
              frmStatistics.btnAdmin.Visible := True;
            end;
          //just to ensure that the string isnt null
          if tblUsers['Name'] = Null then
            sName := ''
          else
            sName := tblUsers['Name'];

          if tblUsers['Surname'] = Null then
            sSurname := ''
          else
            sSurname := tblUsers['Surname'];

          if tblUsers['ContactInfo'] = Null then
            sContactInfo := ''
          else
            sContactInfo := tblUsers['ContactInfo'];

          lblNotFound.Visible := False;
          objAccount := TAccount.Create(tblUsers['UserID'], tblUsers['Username'], sName, sSurname, tblUsers['Theme'], tblUsers['AdminPriviledges'], sContactInfo);
          objAccount.setTable(tblUsers);

          //doing this because hiding it hides the icon as well and idk how to fix that.
          frmProperties.Left := frmLogin.Left;
          frmProperties.Top := frmLogin.Top;

          frmLogin.Top := -1 - frmLogin.Height;
          frmProperties.Visible := True;
          frmProperties.StyleName := objAccount.getTheme;
          objAccount.Log('logged in.');

          OutputDebugString('|| Logged in ||');
          Break;
        end;

      tblUsers.Next;
    end;

  if objAccount = nil then
    lblNotFound.Visible := True;

end;

procedure TfrmLogin.BuildTable(sTableName : string);
begin
  tblBuild := TADOTable.Create(frmLogin);
  dsrBuild := TDataSource.Create(frmLogin);

  dsrBuild.Name := 'dsr' + sTableName;
  with tblBuild do
    begin
      Name := 'tbl' + sTableName;
      Connection := dbConnection;
      TableName := 'tbl' + sTableName;
      Open;
    end;
  dsrBuild.DataSet := tblBuild;

end;

procedure TfrmLogin.ButtonEnter(Sender: TObject);
begin
  //makes the button bigger when you hover over it
  TButton(Sender).Font.Style := [fsBold];
  TButton(Sender).Left := TButton(Sender).Left - 2;
  TButton(Sender).Top := TButton(Sender).Top - 2;
  TButton(Sender).Width := TButton(Sender).Width + 4;
  TButton(Sender).Height := TButton(Sender).Height + 4;
end;

procedure TfrmLogin.ButtonExit(Sender: TObject);
begin
  TButton(Sender).Font.Style := [];
  TButton(Sender).Left := TButton(Sender).Left + 2;
  TButton(Sender).Top := TButton(Sender).Top + 2;
  TButton(Sender).Width := TButton(Sender).Width - 4;
  TButton(Sender).Height := TButton(Sender).Height - 4;
end;

procedure TfrmLogin.chkShowPassClick(Sender: TObject);
begin
  if chkShowPass.Checked = True then
    edtPassword.PasswordChar := #0
  else
    edtPassword.PasswordChar := '*';
end;

procedure TfrmLogin.ConnectDatabase;
begin
  if (FileExists('Properties Backup.mdb')) AND (NOT FileExists('Properties.mdb')) then
  begin
    //attempts to restore database if it doesnt exist
    CopyFile('Properties Backup.mdb', 'Properties.mdb', False);
    ShowMessage('Database missing, backup used to restore information.');
  end;

  if FileExists('Properties.mdb') then
    begin
      //checks is dbConnection has created yet, essentially making sure that its only created once
      if dbConnection = nil then
        begin
          dbConnection := TADOConnection.Create(frmLogin);

          tblProperties := TADOTable.Create(frmLogin);
          tblUsers := TADOTable.Create(frmLogin);

          dsrProperties := TDataSource.Create(frmLogin);
          dsrUsers := TDataSource.Create(frmLogin);

          //query
          qryQuery := TADOQuery.Create(frmLogin);
          dsrQuery := TDataSource.Create(frmLogin);

          with dbConnection do
            begin
              ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + 'Properties' +'.mdb;Mode=ReadWrite;Persist Security Info=False';
              LoginPrompt := False;
              Provider := 'Provider=Microsoft.Jet.OLEDB.4.0;';
              Open;
            end;

          BuildTable('Properties');
          tblProperties := tblBuild;
          dsrProperties := dsrBuild;

          BuildTable('Users');
          tblUsers := tblBuild;
          dsrUsers := dsrBuild;

          qryQuery.Connection := dbConnection;
          dsrQuery.DataSet := qryQuery;
        end;
    end
  else
    begin
      ShowMessage('WARNING database and backup not found.');
    end;

end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  //Shape1.ControlStyle := ControlStyle - [csCaptureMouse];
  btnLogin.OnMouseEnter := ButtonEnter;
  btnLogin.OnMouseLeave := ButtonExit;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
   ConnectDatabase;
end;

procedure TfrmLogin.lblRegisterAccountClick(Sender: TObject);
begin
  frmRegister.Left := frmLogin.Left;
  frmRegister.Top := frmLogin.Top;

  frmLogin.Top := -1 - frmLogin.Height;
  frmRegister.Visible := True;
end;

procedure TfrmLogin.lblRegisterAccountMouseEnter(Sender: TObject);
begin
  lblRegisterAccount.Font.Style := [TFontStyle.fsBold, TFontStyle.fsUnderline];
  lblRegisterAccount.Left := lblRegisterAccount.Left - 1;
end;

procedure TfrmLogin.lblRegisterAccountMouseLeave(Sender: TObject);
begin
  lblRegisterAccount.Font.Style := [];
  lblRegisterAccount.Left := lblRegisterAccount.Left + 1;
end;

procedure TfrmLogin.Shape1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin

  {RichEdit1.Lines.Add(IntToStr((ScreenToClient(Mouse.CursorPos).X)) + ' ' + IntToStr(ScreenToClient(Mouse.CursorPos).Y))       }
end;

procedure TfrmLogin.SwitchForm(TCurrentForm, TNextForm: TForm);
begin
  //Checks if the current form is maximized and if it is then make next form maximized
  if TCurrentForm.WindowState = TWindowState.wsMaximized then
    begin
      //sets some values for when the user minimizes again
      TNextForm.Height := 470;
      TNextForm.Width := 730;
      TNextForm.Left := (Screen.Width div 2) - (TNextForm.Width div 2);
      TNextForm.Top := (Screen.Height div 2) - (TNextForm.Height div 2);
      TNextForm.WindowState := TWindowState.wsMaximized
    end
  else
    begin
      TNextForm.Top := TCurrentForm.Top;
      TNextForm.Left := TCurrentForm.Left;
      TNextForm.Width := TCurrentForm.Width;
      TNextForm.Height := TCurrentForm.Height;
      TNextForm.WindowState := TWindowState.wsNormal;
    end;

  TCurrentForm.Hide;

  //i want the login and register screen to always be dark so i use this here
  if NOT ((TNextForm = frmLogin) OR (TNextForm = frmRegister)) then
    begin
      TNextForm.StyleName := objAccount.getTheme;
    end
  else
    begin
      edtPassword.Text := '';
      edtUsername.Text := '';
      chkShowPass.Checked := False;
    end;

  TNextForm.Show;

end;

end.
