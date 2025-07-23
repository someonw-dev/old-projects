unit Properties_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, PropertyDisplay_u,
  Vcl.ExtCtrls, Vcl.Samples.Spin, System.Threading, System.UITypes;

type
  TfrmProperties = class(TForm)
    btnLogOut: TBitBtn;
    btnMain: TBitBtn;
    btnMap: TBitBtn;
    btnStatistics: TBitBtn;
    btnAdmin: TBitBtn;
    btnSettings: TBitBtn;
    scbProperties: TScrollBox;
    lblProperties: TLabel;
    lblNoProperties: TLabel;
    GroupBox1: TGroupBox;
    rgpList: TRadioGroup;
    grpUserSearch: TGroupBox;
    lblSUsername: TLabel;
    lblSID: TLabel;
    lblSearchAccount: TLabel;
    cmbID: TComboBox;
    cmbUsername: TComboBox;
    btnSearchAccounts: TBitBtn;
    procedure btnSettingsClick(Sender: TObject);
    procedure btnMapClick(Sender: TObject);
    procedure btnStatisticsClick(Sender: TObject);
    procedure btnAdminClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgpListClick(Sender: TObject);
    procedure btnLogOutClick(Sender: TObject);
    procedure cmbIDSelect(Sender: TObject);
    procedure cmbUsernameSelect(Sender: TObject);
    procedure btnSearchAccountsClick(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeList;
  public
    { Public declarations }
    procedure CreateItem(bFound : Boolean);
    var
      objProperty : TPropertyList;
  end;

var
  frmProperties: TfrmProperties;
  bPopulate : Boolean;

implementation

uses Admin_u, Settings_u, Login_u, PropertyMap_u, Statistics_u;

{$R *.dfm}

procedure TfrmProperties.btnAdminClick(Sender: TObject);
begin
  frmLogin.SwitchForm(frmProperties, frmAdmin);
end;

procedure TfrmProperties.btnLogOutClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to log out?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      frmLogin.objAccount.LogOut;

      frmLogin.SwitchForm(frmProperties, frmLogin);
    end;
end;

procedure TfrmProperties.btnMapClick(Sender: TObject);
begin
  frmLogin.SwitchForm(frmProperties, frmMap);
end;

procedure TfrmProperties.btnSearchAccountsClick(Sender: TObject);
var
  sSearchWith : String;
begin
  sSearchWith := InputBox('Search', 'Input a username or user ID to search for', '');

  //because check exists exits once it finds the item i can use this here
  // which makes it select the correct record etc
  if frmAdmin.CheckExists(sSearchWith, 'UserID', tblUsers) = True then
    ShowMessage('User ID found and selected!')
  else
    if frmAdmin.CheckExists(sSearchWith, 'Username', tblUsers) = True then
      ShowMessage('Username found and selected!')
    else
      ShowMessage('No username or user ID found.');

  cmbID.ItemIndex := frmAdmin.GetItemLocation(cmbID ,tblUsers['UserID']);
  cmbUsername.ItemIndex := frmAdmin.GetItemLocation(cmbUsername ,tblUsers['Username']);
  ChangeList;
end;

procedure TfrmProperties.btnSettingsClick(Sender: TObject);
begin
  TOldForm := frmProperties;
  frmLogin.SwitchForm(frmProperties, frmSettings);
end;

procedure TfrmProperties.btnStatisticsClick(Sender: TObject);
begin
  frmLogin.SwitchForm(frmProperties, frmStatistics);
end;

procedure TfrmProperties.ChangeList;
var
  bEnabled : Boolean;
  sUserID : String;
begin
  objProperty.Clear;
  tblProperties.First;
  grpUserSearch.Visible := False;

  case rgpList.ItemIndex of
    0 : begin
          lblNoProperties.Visible := False;

          while not tblProperties.Eof do
            begin
              if tblProperties['UserID'] = null then
               sUserID := ''
             else
               sUserID := tblProperties['UserID'];

              if sUserID = frmLogin.objAccount.getUserID then
                bEnabled := True
              else
                bEnabled := False;

              CreateItem(bEnabled);

              tblProperties.Next;
            end;
        end;
    1 : begin
          while not tblProperties.Eof do
            begin
              if tblProperties['UserID'] = null then
               sUserID := ''
             else
               sUserID := tblProperties['UserID'];

              if sUserID = frmLogin.objAccount.getUserID then
                begin
                  CreateItem(True);
                end;

              tblProperties.Next;
            end;

          if objProperty.getCounter = 0 then
            lblNoProperties.Visible := True
          else
            lblNoProperties.Visible := False;
        end;
    2 : begin
          lblNoProperties.Visible := False;
          while not tblProperties.Eof do
            begin
              if tblProperties['UserID'] = null then
               sUserID := ''
             else
               sUserID := tblProperties['UserID'];

              if NOT (sUserID = frmLogin.objAccount.getUserID) then
                begin
                  CreateItem(False);
                end;

              tblProperties.Next;
            end;
        end;
    3 : begin
          while not tblProperties.Eof do
            begin
              if tblProperties['UserID'] = null then
                sUserID := ''
             else
               sUserID := tblProperties['UserID'];

              if sUserID = cmbID.Items[cmbID.ItemIndex] then
                begin
                  if sUserID = frmLogin.objAccount.getUserID then
                    CreateItem(True)
                  else
                    CreateItem(False);
                end;
              tblProperties.Next;
            end;

          if objProperty.getCounter = 0 then
            lblNoProperties.Visible := True
          else
            lblNoProperties.Visible := False;
          grpUserSearch.Visible := True;
        end;
  end;

  objProperty.Visible;
end;

procedure TfrmProperties.cmbIDSelect(Sender: TObject);
begin
  frmAdmin.MatchUserComboboxes(cmbID.Items[cmbID.ItemIndex], 'UserID', 'Username', cmbUsername, tblUsers);

  ChangeList;
end;

procedure TfrmProperties.cmbUsernameSelect(Sender: TObject);
begin
  frmAdmin.MatchUserComboboxes(cmbUsername.Items[cmbUsername.ItemIndex], 'Username', 'UserID', cmbID, tblUsers);

  ChangeList;
end;

procedure TfrmProperties.CreateItem(bFound : Boolean);
var
  sUserContact, sUserID, sMapID, sX, sY : String;
  bFoundUser : Boolean;
begin
  bFoundUser := False;

  tblUsers.First;
  while not tblUsers.Eof do
    begin
      if tblProperties['UserID'] = null then
        sUserID := ''
      else
        sUserID := tblProperties['UserID'];

      if tblUsers['UserID'] = sUserID then
        begin
          if tblUsers['ContactInfo'] = null then
            sUserContact := ''
          else
            sUserContact := tblUsers['ContactInfo'];

          bFoundUser := True;
          break;
        end;

      tblUsers.Next;
    end;

  if tblProperties['MapID'] = null then
        sMapID := ''
      else
        sMapID := tblProperties['MapID'];

  if tblProperties['X'] = null then
        sX := ''
      else
        sX := tblProperties['X'];

  if tblProperties['Y'] = null then
        sY := ''
      else
        sY := tblProperties['Y'];

  if bFoundUser = False then
    sUserContact := '';

  objProperty.CreateItem(tblProperties['PropertyID'], tblProperties['PropertyAddress'], tblProperties['PropertyType'],
  tblProperties['Bathrooms'], tblProperties['Bedrooms'], tblProperties['Size'], tblProperties['Price'],
  tblProperties['Rent'], tblProperties['ForSale'], bFound, sUserContact, sMapID, sX, sY);
end;

procedure TfrmProperties.FormActivate(Sender: TObject);
begin
  ChangeList;
end;

procedure TfrmProperties.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmLogin.objAccount.LogOut;
  Application.Terminate;
end;

procedure TfrmProperties.FormCreate(Sender: TObject);
begin
  tblProperties := frmLogin.tblProperties;

  objProperty := TPropertyList.Create(scbProperties, tblProperties);

  tblUsers.First;
  while not tblUsers.Eof do
    begin
      cmbID.Items.Add(tblUsers['UserID']);
      cmbUsername.Items.Add(tblUsers['Username']);
      tblUsers.Next;
    end;

  cmbID.ItemIndex := 0;
  cmbUsername.ItemIndex := 0;
end;

procedure TfrmProperties.FormShow(Sender: TObject);
begin
  btnMain.SetFocus;
end;

procedure TfrmProperties.rgpListClick(Sender: TObject);
begin
  ChangeList;
end;

end.
