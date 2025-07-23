unit Admin_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Samples.Spin, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, System.UITypes,
  Vcl.Mask, Vcl.DBCtrls, Math, Visuals_u, Validation_u, Map_u, Hash;

type
  TfrmAdmin = class(TForm)
    btnLogOut: TBitBtn;
    btnMain: TBitBtn;
    btnMap: TBitBtn;
    btnAdmin: TBitBtn;
    btnStatistics: TBitBtn;
    tResizeDebounce: TTimer;
    btnSettings: TBitBtn;
    pgcAdmin: TPageControl;
    tbsUsers: TTabSheet;
    dbgUsers: TDBGrid;
    grpUserSearch: TGroupBox;
    lblSUsername: TLabel;
    lblSUserID: TLabel;
    lblSearchAccount: TLabel;
    cmbID: TComboBox;
    cmbUsername: TComboBox;
    btnSearchAccounts: TBitBtn;
    pgcUsers: TPageControl;
    tbsCreateAccount: TTabSheet;
    chkCShowPass: TCheckBox;
    chkCAdmin: TCheckBox;
    btnCAccountConfirm: TBitBtn;
    tbsEditAccount: TTabSheet;
    btnEAccountConfirm: TBitBtn;
    chkEShowPass: TCheckBox;
    chkEAdmin: TCheckBox;
    tbsDeleteAccount: TTabSheet;
    btnAccountDelete: TBitBtn;
    tbsProperties: TTabSheet;
    dbgProperties: TDBGrid;
    pgcProperties: TPageControl;
    tbsCreateStock: TTabSheet;
    btnCConfirmStock: TBitBtn;
    tbsEditStock: TTabSheet;
    lblECategory: TLabel;
    lblEPrice: TLabel;
    btnEConfirmStock: TBitBtn;
    tbsDeleteStock: TTabSheet;
    btnStockDelete: TBitBtn;
    tbsUpdatePrices: TTabSheet;
    lblUpdatePrices: TLabel;
    lblPOwnerID: TLabel;
    chkUpdateByUser: TCheckBox;
    rgpPrice: TRadioGroup;
    spnIncreasePrice: TSpinEdit;
    btnUpdatePrices: TBitBtn;
    cmbOwnerID: TComboBox;
    grpStockSearch: TGroupBox;
    lblItemDescription: TLabel;
    lblItemID: TLabel;
    lblSearchStock: TLabel;
    cmbPropertyID: TComboBox;
    cmbAddress: TComboBox;
    btnSearchProperties: TBitBtn;
    tbsMaps: TTabSheet;
    lblLoad: TLabel;
    grpMapAdmin: TGroupBox;
    cmbMaps: TComboBox;
    tbsQueries: TTabSheet;
    dbgQueries: TDBGrid;
    tbsRestoreDatabase: TTabSheet;
    Label2: TLabel;
    pgbLoadDatabase: TProgressBar;
    btnRestoreDatabase: TButton;
    ProgressBar2: TProgressBar;
    btnSaveDatabase: TButton;
    tMapDebounce: TTimer;
    lblOutputCUsername: TLabel;
    lblOutputCPass: TLabel;
    cmbEPropertyCategory: TComboBox;
    edtCUsername: TLabeledEdit;
    edtCPassword: TLabeledEdit;
    edtCConfirmPassword: TLabeledEdit;
    pgcMaps: TPageControl;
    tbsInfo: TTabSheet;
    tbsEdit: TTabSheet;
    grpPropertyInfo: TGroupBox;
    lblNoInfo: TLabel;
    chkRent: TCheckBox;
    edtSize: TLabeledEdit;
    edtPropertyID: TLabeledEdit;
    edtPropertyAddress: TLabeledEdit;
    edtType: TLabeledEdit;
    edtPrice: TLabeledEdit;
    chkPaint: TCheckBox;
    rgpPaint: TRadioGroup;
    btnGenerate: TBitBtn;
    grpSQL: TGroupBox;
    BitBtn2: TBitBtn;
    redSQL: TRichEdit;
    lblSQL: TLabel;
    edtEUsername: TLabeledEdit;
    edtEPassword: TLabeledEdit;
    edtEConfirmPassword: TLabeledEdit;
    lblOutputEUsername: TLabel;
    lblOutputEPass: TLabel;
    tbsSaveProperty: TTabSheet;
    edtX: TLabeledEdit;
    edtY: TLabeledEdit;
    edtMap: TLabeledEdit;
    spnEPrice: TSpinEdit;
    spnESize: TSpinEdit;
    lblESize: TLabel;
    btnCancel: TBitBtn;
    btnConfirm: TBitBtn;
    lblEBathroom: TLabel;
    lblEBedrooms: TLabel;
    spnEBathrooms: TSpinEdit;
    spnEBedrooms: TSpinEdit;
    TabSheet1: TTabSheet;
    btnPlaceProperty: TBitBtn;
    lblOutputEAddress: TLabel;
    edtEAddress: TLabeledEdit;
    chkERent: TCheckBox;
    chkEForSale: TCheckBox;
    edtCAddress: TLabeledEdit;
    lblOutputCAddress: TLabel;
    cmbCType: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    spnCBathrooms: TSpinEdit;
    spnCBedrooms: TSpinEdit;
    chkCRent: TCheckBox;
    chkCForSale: TCheckBox;
    spnCPrice: TSpinEdit;
    spnCSize: TSpinEdit;
    Label5: TLabel;
    lblCPrice: TLabel;
    lblCCategory: TLabel;
    lblCOwner: TLabel;
    cmbCOwner: TComboBox;
    cmbEOwner: TComboBox;
    lblEOwner: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCAccountConfirmClick(Sender: TObject);
    procedure btnRestoreDatabaseClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMapClick(Sender: TObject);
    procedure pgcAdminChange(Sender: TObject);
    procedure tResizeDebounceTimer(Sender: TObject);
    procedure btnSaveDatabaseClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure btnLogOutClick(Sender: TObject);
    procedure btnUpdatePricesClick(Sender: TObject);
    procedure rgpPriceClick(Sender: TObject);
    procedure chkUpdateByUserClick(Sender: TObject);
    procedure spnIncreasePriceChange(Sender: TObject);
    procedure btnAccountDeleteClick(Sender: TObject);
    procedure chkCShowPassClick(Sender: TObject);
    procedure chkEShowPassClick(Sender: TObject);
    procedure pgcUsersChange(Sender: TObject);
    procedure btnStatisticsClick(Sender: TObject);
    procedure btnMainClick(Sender: TObject);
    procedure tMapDebounceTimer(Sender: TObject);
    procedure chkPaintClick(Sender: TObject);
    procedure rgpPaintClick(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure edtCUsernameExit(Sender: TObject);
    procedure edtCPasswordExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnSearchAccountsClick(Sender: TObject);
    procedure UsersAfterScroll(Dataset : TDataSet);
    procedure PropertyfterScroll(Dataset : TDataSet);
    procedure edtEPasswordExit(Sender: TObject);
    procedure edtEUsernameExit(Sender: TObject);
    procedure btnEAccountConfirmClick(Sender: TObject);
    procedure cmbIDSelect(Sender: TObject);
    procedure cmbUsernameSelect(Sender: TObject);
    procedure cmbMapsSelect(Sender: TObject);
    procedure pgcPropertiesChange(Sender: TObject);
    procedure btnPlacePropertyClick(Sender: TObject);
    procedure edtXChange(Sender: TObject);
    procedure edtYChange(Sender: TObject);
    procedure edtMapChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtEAddressExit(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure btnEConfirmStockClick(Sender: TObject);
    procedure cmbOwnerIDSelect(Sender: TObject);
    procedure edtCAddressExit(Sender: TObject);
    procedure btnCConfirmStockClick(Sender: TObject);
    procedure pgcMapsChange(Sender: TObject);
    procedure btnStockDeleteClick(Sender: TObject);
    procedure cmbPropertyIDSelect(Sender: TObject);
    procedure cmbAddressSelect(Sender: TObject);
    procedure btnSearchPropertiesClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetColumnSizes(sGridName : String);
    procedure ResizeColumns(sGridName : String; arrSize : array of real);
    procedure UpdateButtonPrices;
    procedure UpdateConfirm;
  public
    { Public declarations }
    procedure BackupDatabase;
    procedure MatchUserComboboxes(sSearchWith, sSearchIn, sFindIn : String; cmbSearchItem: TComboBox; tblSearchIn : TADOTable);
    function CheckExists(sSearchWith, sSearchIn : String; tblSearchIn :  TADOTable) : Boolean;
    function GetItemLocation(cmbSearchItem: TComboBox; sItemName: String): Integer;
    var
      bUserChange, bPropertiesChange, bReturnCoords : Boolean
  end;

var
  frmAdmin: TfrmAdmin;
  tblUsers, tblProperties : TADOTable;
  arrGetSize, arrPropertiesSize, arrUsersSize, arrServicesSize, arrQuerySize : array of Real;
  objMapAdmin : TMap;
implementation

uses Login_u, PropertyMap_u, Settings_u, Statistics_u, Properties_u, Register_u;
{$R *.dfm}

procedure TfrmAdmin.BackupDatabase;
begin
  CopyFile('Properties.mdb', 'Properties Backup.mdb', False);
end;

procedure TfrmAdmin.btnPlacePropertyClick(Sender: TObject);
begin
  pgcAdmin.ActivePageIndex := 2;
  pgcMaps.ActivePageIndex := 2;

  edtMap.Text := cmbMaps.Items[cmbMaps.ItemIndex];
  bReturnCoords := True;
  objMapAdmin.ReturnCoords(self);

  frmAdmin.Resize;
end;

procedure TfrmAdmin.BitBtn2Click(Sender: TObject);
var
  sSQL : String;
begin
  sSQL := redSQL.Text;

  //ensures that you dont have an error
  with frmLogin do
    begin
      try
        qryQuery.Close;
        qryQuery.SQL.Text := sSQL;
        qryQuery.Open;
      except
        on E : Exception do
          ShowMessage('Error in SQL statement');
      end;
    end;

  //Doing this because each time there is a new query new column sizes need to be redone
  GetColumnSizes('Queries');
  arrQuerySize := Copy(arrGetSize);

  ResizeColumns('Queries', arrGetSize);
end;

procedure TfrmAdmin.btnAccountDeleteClick(Sender: TObject);
begin
  //makes sure the admin really wants to delete the user.
  if MessageDlg('Are you sure you want to delete ' + tblUsers['Username'] + '''s account?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      //removes the user you are deleting from the combo boxes
      cmbID.Items.Delete(GetItemLocation(cmbID, tblUsers['UserID']));
      cmbUsername.Items.Delete(GetItemLocation(cmbUsername, tblUsers['Username']));

      frmProperties.cmbID.Items.Delete(GetItemLocation(cmbID, tblUsers['UserID']));
      frmProperties.cmbUsername.Items.Delete(GetItemLocation(cmbUsername, tblUsers['Username']));

      frmStatistics.cmbGroupUser.Items.Delete(GetItemLocation(cmbID, tblUsers['UserID']));

      frmLogin.objAccount.Log('deleted ' + tblUsers['UserID'] + '(' + tblUsers['Username'] + ')''s account');
      ShowMessage('Account deleted.');

      //deletes the user
      tblUsers.Delete;
    end;

  //calling this because when you delete a user it moves where you are in the table
  //but doesnt do the after scroll so i do it manually
  UsersAfterScroll(tblUsers);
end;

procedure TfrmAdmin.btnCAccountConfirmClick(Sender: TObject);
var
  sPassword, sUserID, sUsername : String ;
  bError : Boolean;
begin
  bError := False;

  edtCPasswordExit(edtCPassword);
  edtCUsernameExit(edtCUsername);

  if (edtCPassword.StyleElements = [seBorder]) OR (edtCUsername.StyleElements = [seBorder]) then
    bError := True;

  if bError = False then
    begin
      sUserID := frmRegister.GenerateID(tblUsers, 'UserID');
      sUsername := edtCUsername.Text;
      sPassword := edtCPassword.Text;

      bUserChange := True;

      tblUsers.Insert;
      tblUsers['UserID'] := sUserID;
      tblUsers['Username'] := sUsername;
      //Hashes the password to make it more secure and then salting it
      //with the userID since that will always be unique making essentially every password unique.
      tblUsers['Password'] := THashSHA1.GetHashString(sPassword + sUserID);
      tblUsers['Theme'] := 'Windows10 Dark';
      if chkCAdmin.Checked = True then
        tblUsers['AdminPriviledges'] := True
      else
       tblUsers['AdminPriviledges'] := False;
      tblUsers.Post;
      bUserChange := False;
      cmbID.Items.Add(sUserID);
      cmbUsername.Items.Add(sUsername);

      ShowMessage('Account created');
      frmLogin.objAccount.Log('created');

      UsersAfterScroll(tblUsers);
    end;
end;

procedure TfrmAdmin.btnCancelClick(Sender: TObject);
begin
  edtX.Text := '';
  edtY.Text := '';

  bReturnCoords := False;
  //disable paint just sets the stuff back to default so im just using this here
  objMapAdmin.DisablePaint(self);
  objMapAdmin.Populate(cmbMaps.Items[cmbMaps.ItemIndex]);
  pgcAdmin.ActivePageIndex := 1;
  pgcMaps.ActivePageIndex := 0;
end;

procedure TfrmAdmin.btnCConfirmStockClick(Sender: TObject);
var
  bError : Boolean;
  sPropertyID : String;
begin
  bError := False;
  edtCAddressExit(edtCAddress);

  if edtCAddress.StyleElements = [seBorder] then
    bError := True;

  if bError = False then
    begin
      tblProperties.Last;
      bPropertiesChange := True;
      sPropertyID := frmRegister.GenerateID(tblUsers, 'UserID');

      tblProperties.Insert;
      tblProperties['PropertyID'] := sPropertyID;
      tblProperties['PropertyAddress'] := edtCAddress.Text;
      tblProperties['PropertyType'] := cmbCType.Items[cmbCType.ItemIndex];
      tblProperties['Bathrooms'] := spnCBathrooms.Value;
      tblProperties['Bedrooms'] := spnCBedrooms.Value;
      tblProperties['Price'] := spnCPrice.Value;
      tblProperties['Size'] := spnCSize.Value;
      tblProperties['Rent'] := chkCRent.Checked;
      tblProperties['ForSale'] := chkCForSale.Checked;
      tblProperties['UserID'] := cmbCOwner.Items[cmbCOwner.ItemIndex];
      tblProperties['X'] := 0;
      tblProperties['Y'] := 0;
      tblProperties.post;

      cmbPropertyID.Items.Add(tblProperties['PropertyID']);
      cmbAddress.Items.Add(tblProperties['PropertyAddress']);

      bPropertiesChange := False;
      PropertyfterScroll(tblProperties);

      ShowMessage('Property created.');
      frmLogin.objAccount.Log('created property ' + tblProperties['PropertyID'] + '(' + tblProperties['PropertyAddress'] + ')');
    end;
end;

procedure TfrmAdmin.btnConfirmClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want change ' + tblProperties['PropertyAddress'] + '''s coordinates?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      tblProperties.Edit;
      tblProperties['MapID'] := edtMap.Text;
      tblProperties['X'] := edtX.Text;
      tblProperties['Y'] := edtY.Text;
      tblProperties.Post;

      btnCancel.Click;
    end;
end;

procedure TfrmAdmin.btnEAccountConfirmClick(Sender: TObject);
var
  bUpdatePass, bUpdateUser, bUpdateAdmin, bError : Boolean;
  sCurrentPriv, sCurrentUser : string;
begin
  sCurrentUser := tblUsers['Username'];
  sCurrentPriv := tblUsers['AdminPriviledges'];

  edtEPasswordExit(edtEPassword);
  edtEUsernameExit(edtEUsername);
  bUpdatePass := False;
  bUpdateAdmin := False;
  bUpdateUser := False;
  bError := False;

  if Length(edtEUsername.Text) > 0 then
    bUpdateUser := True;

  if (Length(edtEPassword.Text) > 0) OR (Length(edtEConfirmPassword.Text) > 0) then
    bUpdatePass := True;

  if NOT (chkEAdmin.Checked = tblUsers['AdminPriviledges']) then
    bUpdateAdmin := True;

    //if the stylement is only equal to seborder there is an error
  if (edtEUsername.StyleElements = [seBorder]) OR (edtEPassword.StyleElements = [seBorder])  OR (edtEConfirmPassword.StyleElements = [seBorder]) then
    bError := True;

  if (bError = False) AND ((bUpdatePass = TRUE) OR (bUpdateUser = True) OR (bUpdateAdmin = True)) then
  if (MessageDlg('Are you sure you want to edit ' + sCurrentUser + '''s account?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      frmLogin.objAccount.Log('changed ' + tblUsers['UserID'] + '(' + tblUsers['Username'] + ')''s account.');

      tblUsers.Edit;

      if chkEAdmin.Checked = True then
        tblUsers['AdminPriviledges'] := 'True'
      else
        tblUsers['AdminPriviledges'] := 'False';

      if bUpdateUser = True then
        begin
          //deletes username before changing it in the database and then adds the new username to the combobox, and then
          cmbUsername.Items.Delete(GetItemLocation(cmbUsername, tblUsers['Username']));
          tblUsers['Username'] := edtEUsername.Text;
          cmbUsername.Items.Add(edtEUsername.Text);
          cmbUsername.ItemIndex := GetItemLocation(cmbUsername, tblUsers['Username']);
        end;

          if bUpdatePass = True then
            tblUsers['Password'] := THashSHA1.GetHashString(edtEPassword.Text + tblUsers['UserID']);

          tblUsers.Post;

          Showmessage('Account changed.');

          edtEUsername.Clear;
          edtEPassword.Clear;
          edtEConfirmPassword.Clear;
    end;
end;

procedure TfrmAdmin.btnEConfirmStockClick(Sender: TObject);
var
  bChangeAddress, bError : Boolean;
begin
  bChangeAddress := False;
  bError := False;

  edtEAddressExit(edtEAddress);

  if Length(edtEAddress.Text) > 0 then
    bChangeAddress := True;

  if edtEAddress.StyleElements = [seBorder] then
    bError := True;

  if bError = False then
  if (MessageDlg('Are you sure you want to edit ' + tblProperties['PropertyAddress'] + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      tblProperties.Edit;

      if bChangeAddress = True then
        tblProperties['PropertyAddress'] := edtEAddress.Text;

      tblProperties['PropertyType'] := cmbEPropertyCategory.Items[cmbEPropertyCategory.ItemIndex];
      tblProperties['Bathrooms'] := spnEBathrooms.Value;
      tblProperties['Bedrooms'] := spnEBedrooms.Value;
      tblProperties['Price'] := spnEPrice.Value;
      tblProperties['Size'] := spnESize.Value;
      tblProperties['Rent'] := chkERent.Checked;
      tblProperties['ForSale'] := chkEForSale.Checked;
      tblProperties['UserID'] := cmbEOwner.Items[cmbEOwner.ItemIndex];
      tblProperties.post;

      frmLogin.objAccount.Log('edited property ' + tblProperties['PropertyID'] + '(' + tblProperties['PropertyAddress'] + ')');
    end;
end;

procedure TfrmAdmin.btnGenerateClick(Sender: TObject);
begin
  objMapAdmin.GenerateNewMap;
  frmLogin.objAccount.Log('created a map.');

  cmbMaps.Clear;
  objMapAdmin.FillCmbMaps(cmbMaps);
  cmbMaps.ItemIndex := GetItemLocation(cmbMaps, objMapAdmin.getMapName);
end;

procedure TfrmAdmin.btnLogOutClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to log out?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      frmLogin.objAccount.LogOut;

      frmLogin.SwitchForm(frmAdmin, frmLogin);
    end;
end;

procedure TfrmAdmin.btnMainClick(Sender: TObject);
begin
  frmLogin.SwitchForm(frmAdmin, frmProperties);
end;

procedure TfrmAdmin.btnMapClick(Sender: TObject);
begin
  frmLogin.SwitchForm(frmAdmin, frmMap);
end;

procedure TfrmAdmin.btnRestoreDatabaseClick(Sender: TObject);
begin
if FileExists('Properties Backup.mdb') then
  begin
  if MessageDlg('Are you sure you want restore your database?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      pgbLoadDatabase.Visible := True;

      //restores the database to the last save.
      frmLogin.dbConnection.Close;

      //have to call free and nil because free only free's the object but does not
      //set's its refrence to nil, so when i call connect database nothing happens because
      // dbConnection <> nil
      FreeAndNil(frmLogin.dbConnection);

      with frmLogin do
        begin
          tblProperties.Free;
          tblUsers.Free;
          dsrProperties.Free;
          dsrUsers.Free;
          qryQuery.Free;
          dsrQuery.Free;
        end;
                                       //false is if the file that it is trying to replace exists
                                       //then replace it    \/
      CopyFile('Properties Backup.mdb', 'Properties.mdb', False);
      frmLogin.ConnectDatabase;
      pgbLoadDatabase.Position := 30;

      tblProperties := frmLogin.tblProperties;
      tblUsers := frmLogin.tblUsers;

      frmStatistics.tblProperties := frmLogin.tblProperties;
      frmProperties.objProperty.tblProperty := frmLogin.tblProperties;
      frmMap.objMap.tblProperties := frmLogin.tblProperties;
      frmLogin.objAccount.setTable(tblUsers);
      objMapAdmin.tblProperties := frmLogin.tblProperties;
      dbgUsers.DataSource := frmLogin.dsrUsers;
      dbgProperties.DataSource := frmLogin.dsrProperties;
      dbgQueries.DataSource := frmLogin.dsrQuery;

      pgbLoadDatabase.Position := 60;

      pgbLoadDatabase.Position := 90;

      //frmStatistics.tblStock := frmLogin.tblStock;

      //frmSettings.tblUsers := frmLogin.tblUsers;
      pgbLoadDatabase.Position := 100;
      frmLogin.objAccount.Log('restored database to latest save.');

      ShowMessage('Database restored!');

      pgbLoadDatabase.Visible := False;
    end;
  end
  else
    ShowMessage('Backup File not found!');
end;

procedure TfrmAdmin.btnSaveDatabaseClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want save your database?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      BackupDatabase;
      ShowMessage('Database saved.')
    end;
end;

procedure TfrmAdmin.btnSearchAccountsClick(Sender: TObject);
var
  sSearchWith : String;
begin
  sSearchWith := InputBox('Search', 'Input a username or user ID to search for', '');

  //because check exists exits once it finds the item i can use this here
  // which makes it select the correct record etc
  if CheckExists(sSearchWith, 'UserID', tblUsers) = True then
    ShowMessage('User ID found and selected!')
  else
    if CheckExists(sSearchWith, 'Username', tblUsers) = True then
      ShowMessage('Username found and selected!')
    else
      ShowMessage('No username or user ID found.');

  UsersAfterScroll(tblUsers);
end;

procedure TfrmAdmin.btnSearchPropertiesClick(Sender: TObject);
  var
  sSearchWith : String;
begin
  sSearchWith := InputBox('Search', 'Input a address or property ID to search for', '');

  //because check exists exits once it finds the item i can use this here
  // which makes it select the correct record etc
  if CheckExists(sSearchWith, 'PropertyID', tblProperties) = True then
    ShowMessage('Property ID found and selected!')
  else
    if CheckExists(sSearchWith, 'PropertyAddress', tblProperties) = True then
      ShowMessage('Address found and selected!')
    else
      ShowMessage('No address or user ID found.');

  PropertyfterScroll(tblProperties);
end;

procedure TfrmAdmin.btnSettingsClick(Sender: TObject);
begin
  TOldForm := frmAdmin;
  frmLogin.SwitchForm(frmAdmin, frmSettings);
end;

procedure TfrmAdmin.btnStatisticsClick(Sender: TObject);
begin
  frmLogin.SwitchForm(frmAdmin, frmStatistics);
end;

procedure TfrmAdmin.btnStockDeleteClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete ' + tblProperties['PropertyAddress'] + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      //removes the user you are deleting from the combo boxes
      cmbPropertyID.Items.Delete(GetItemLocation(cmbID, tblProperties['PropertyID']));
      cmbAddress.Items.Delete(GetItemLocation(cmbUsername, tblProperties['PropertyAddress']));

      frmLogin.objAccount.Log('deleted property ' + tblProperties['PropertyID'] + '(' + tblProperties['PropertyAddress'] + ')');
      ShowMessage('Property deleted.');

      //deletes the property
      tblProperties.Delete;
    end;
end;

procedure TfrmAdmin.btnUpdatePricesClick(Sender: TObject);
var
  rPrice : Real;
  bIncreaseAll, bDecreaseAll, bIncreaseCertain, bDecreaseCertain : Boolean;
  sFormatPrice : String;
begin

if MessageDlg('Are you sure you want to change these prices?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin

  bIncreaseAll := False;
  bDecreaseAll := False;
  bIncreaseCertain := False;
  bDecreaseCertain := False;

  if chkUpdateByUser.Checked = True then
    begin
      tblProperties.First;

      while not tblProperties.Eof do
        begin
          if tblProperties['UserID'] = cmbOwnerID.Items[cmbOwnerID.ItemIndex] then
            begin
              tblProperties.Edit;

              if rgpPrice.ItemIndex = 0 then
                begin
                  rPrice := tblProperties['Price'] + (tblProperties['Price'] * (spnIncreasePrice.Value / 100));;
                  sFormatPrice := FloatToStrF(rPrice, ffCurrency, 8, 2);
                  tblProperties['Price'] := sFormatPrice;
                  bIncreaseCertain := True;
                end
              else
                begin
                  rPrice := tblProperties['Price'] - (tblProperties['Price'] * (spnIncreasePrice.Value / 100));;
                  sFormatPrice := FloatToStrF(rPrice, ffCurrency, 8, 2);
                  tblProperties['Price'] := sFormatPrice;
                  bDecreaseCertain := True;
                end;

              tblProperties.Post;
            end;

          tblProperties.Next;
        end;
    end
  else
    begin
      tblProperties.First;

      while not tblProperties.Eof do
        begin
          tblProperties.Edit;

          if rgpPrice.ItemIndex = 0 then
            begin
              rPrice := tblProperties['Price'] + (tblProperties['Price'] * (spnIncreasePrice.Value / 100));;
              sFormatPrice := FloatToStrF(rPrice, ffCurrency, 8, 2);
              tblProperties['Price'] := sFormatPrice;
              bIncreaseAll := True;
            end
          else
            begin
              rPrice := tblProperties['Price'] - (tblProperties['Price'] * (spnIncreasePrice.Value / 100));;
              sFormatPrice := FloatToStrF(rPrice, ffCurrency, 8, 2);
              tblProperties['Price'] := sFormatPrice;
              bDecreaseAll := True;
            end;

          tblProperties.Post;

          tblProperties.Next;
        end;
    end;

  if bIncreaseAll = True then
    frmLogin.objAccount.Log('increase price of all stock by ' + IntToStr(spnIncreasePrice.Value) + '%.');

  if bDecreaseAll = True then
    frmLogin.objAccount.Log('decrease price of all stock by ' + IntToStr(spnIncreasePrice.Value) + '%.');

  if bIncreaseCertain = True then
    frmLogin.objAccount.Log('increased price of all stock from ' + tblUsers['Username'] + ' by ' + IntToStr(spnIncreasePrice.Value) + '%.');

  if bDecreaseCertain = True then
    frmLogin.objAccount.Log('decrease price of all stock from ' + tblUsers['Username'] + ' by ' + IntToStr(spnIncreasePrice.Value) + '%.');
end;

end;

function TfrmAdmin.CheckExists(sSearchWith, sSearchIn: String;
  tblSearchIn: TADOTable): Boolean;
begin
  //i cant remember if i said what this purpose is somewhere so ill just say it here:
  //its essentially just to make sure that while the table is looping to find stuff it doesnt update stuff like the search
  //comboboxes with the afterscroll event handler
  bUserChange := True;
  bPropertiesChange := True;

  Result := False;

  tblSearchIn.First;
  while not tblSearchIn.Eof do
    begin
      if sSearchWith = tblSearchIn[sSearchIn] then
        begin
          Result := True;
          Break;
        end;
      tblSearchIn.Next;
    end;

  bUserChange := False;
  bPropertiesChange := False;
end;

procedure TfrmAdmin.chkCShowPassClick(Sender: TObject);
begin
if chkCShowPass.Checked = True then
  begin
    edtCPassword.PasswordChar := #0;
    edtCConfirmPassword.PasswordChar := #0;
  end
else
  begin
    edtCPassword.PasswordChar := '*';
    edtCConfirmPassword.PasswordChar := '*';
  end;
end;

procedure TfrmAdmin.chkEShowPassClick(Sender: TObject);
begin
if chkEShowPass.Checked = True then
  begin
    edtEPassword.PasswordChar := #0;
    edtEConfirmPassword.PasswordChar := #0;
  end
else
  begin
    edtEPassword.PasswordChar := '*';
    edtEConfirmPassword.PasswordChar := '*';
  end;
end;

procedure TfrmAdmin.chkPaintClick(Sender: TObject);
begin
  if chkPaint.Checked then
    objMapAdmin.EnablePaint(Self)
  else
    begin
      objMapAdmin.DisablePaint(Self);
      frmLogin.objAccount.Log('painted on map ' + objMapAdmin.getMapName);
    end;
end;

procedure TfrmAdmin.chkUpdateByUserClick(Sender: TObject);
begin
  if chkUpdateByUser.Checked = True then
    begin
      cmbOwnerID.Visible := True;
      lblPOwnerID.Visible := True;
    end
  else
    begin
      cmbOwnerID.Visible := False;
      lblPOwnerID.Visible := False;
    end;

  UpdateButtonPrices;
end;

procedure TfrmAdmin.cmbAddressSelect(Sender: TObject);
begin
  MatchUserComboboxes(cmbAddress.Items[cmbAddress.ItemIndex], 'PropertyAddress', 'PropertyID', cmbPropertyID, tblProperties);

   PropertyfterScroll(tblProperties);
end;

procedure TfrmAdmin.cmbIDSelect(Sender: TObject);
begin
  MatchUserComboboxes(cmbID.Items[cmbID.ItemIndex], 'UserID', 'Username', cmbUsername, tblUsers);

  UsersAfterScroll(tblUsers);
end;

procedure TfrmAdmin.cmbMapsSelect(Sender: TObject);
begin
  if chkPaint.Checked = True then
    chkPaint.Checked := False;

  edtMap.Text := cmbMaps.Items[cmbMaps.ItemIndex];
  objMapAdmin.Populate(cmbMaps.Items[cmbMaps.ItemIndex]);

  if bReturnCoords = True then
    begin
      edtX.Text := '';
      edtY.Text := '';
      objMapAdmin.ReturnCoords(self);
    end;
end;

procedure TfrmAdmin.cmbOwnerIDSelect(Sender: TObject);
begin
  UpdateButtonPrices;
end;

procedure TfrmAdmin.cmbPropertyIDSelect(Sender: TObject);
begin
   MatchUserComboboxes(cmbPropertyID.Items[cmbPropertyID.ItemIndex], 'PropertyID', 'PropertyAddress', cmbAddress, tblProperties);

   PropertyfterScroll(tblProperties);
end;

procedure TfrmAdmin.cmbUsernameSelect(Sender: TObject);
begin
  //when you make a selection matches this combobox's selected item to its user ID
  MatchUserComboboxes(cmbUsername.Items[cmbUsername.ItemIndex], 'Username', 'UserID', cmbID, tblUsers);
  //runs this after making a change to make sure the edit page is up to date with the new selected person
  UsersAfterScroll(tblUsers);
end;

procedure TfrmAdmin.edtCAddressExit(Sender: TObject);
begin
  GeneralValidation(lblOutputCAddress, edtCAddress);
end;

procedure TfrmAdmin.edtCPasswordExit(Sender: TObject);
begin
  PassValidation(lblOutputCPass, edtCPassword, edtCConfirmPassword);
end;

procedure TfrmAdmin.edtCUsernameExit(Sender: TObject);
var
  sUserID : String;
begin
  sUserID := tblUsers['UserID'];

  bUserChange := True;
  UserValidation(lblOutputCUsername, edtCUsername, tblUsers);

  //returns to original value
  tblUsers.First;
  while not tblUsers.Eof do
    begin
      if tblUsers['UserID'] = sUserID then
        Break;

      tblUsers.Next;
    end;

  bUserChange := False;
end;

procedure TfrmAdmin.edtEAddressExit(Sender: TObject);
begin
  if Length(edtEAddress.Text) > 0 then
    GeneralValidation(lblOutputEAddress, edtEAddress);
end;

procedure TfrmAdmin.edtEPasswordExit(Sender: TObject);
begin
  if (Length(edtEPassword.Text) > 0) OR (Length(edtEConfirmPassword.Text) > 0) then
    PassValidation(lblOutputEPass, edtEPassword, edtEConfirmPassword)
  else
    begin
      ChangeEdit(edtEPassword, False);
      ChangeEdit(edtEConfirmPassword, False);
      lblOutputEPass.Caption := '';
    end;
end;

procedure TfrmAdmin.edtEUsernameExit(Sender: TObject);
var
  sUserID : String;
begin
  sUserID := tblUsers['UserID'];

  if Length(edtEUsername.Text) > 0 then
    begin
      bUserChange := True;
      UserValidation(lblOutputEUsername, edtEUsername, tblUsers);
      bUserChange := False;
    end
  else
    begin
      ChangeEdit(edtEUsername, False);
      lblOutputEUsername.Caption := '';
    end;

  //returning to the value the user selected before i changed stuff
  bUserChange := True;

  tblUsers.First;
  while not tblUsers.Eof do
    begin
      if tblUsers['UserID'] = sUserID then
        Break;

      tblUsers.Next;
    end;

  bUserChange := False;
end;

procedure TfrmAdmin.edtMapChange(Sender: TObject);
begin
  UpdateConfirm;
end;

procedure TfrmAdmin.edtXChange(Sender: TObject);
begin
  UpdateConfirm;
end;

procedure TfrmAdmin.edtYChange(Sender: TObject);
begin
  UpdateConfirm;
end;

procedure TfrmAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmLogin.objAccount.LogOut;
  Application.Terminate;
end;

procedure TfrmAdmin.FormCreate(Sender: TObject);
begin
  tblUsers := frmLogin.tblUsers;
  tblProperties := frmLogin.tblProperties;

  dbgUsers.DataSource := frmLogin.dsrUsers;
  dbgProperties.DataSource := frmLogin.dsrProperties;

  dbgQueries.DataSource := frmLogin.dsrQuery;

  GetColumnSizes('Properties');
  arrPropertiesSize := Copy(arrGetSize);

  GetColumnSizes('Users');
  arrUsersSize := Copy(arrGetSize);

  pgcAdmin.ActivePageIndex := 0;
  pgcProperties.ActivePageIndex := 0;
  pgcUsers.ActivePageIndex := 0;
  pgcMaps.ActivePageIndex := 0;

  objMapAdmin := TMap.Create(grpMapAdmin, tblProperties);
  objMapAdmin.Build;
  objMapAdmin.setOutput(edtPropertyID, edtPropertyAddress, edtType, edtPrice, edtSize, chkRent, lblNoInfo);
  objMapAdmin.setCoordOutput(edtX, edtY);

  //sets the after scroll
  tblUsers.AfterScroll := UsersAfterScroll;
  tblProperties.AfterScroll := PropertyfterScroll;

  //populates the comboboxes in the search box
  tblUsers.First;
  while not tblUsers.Eof do
    begin
      cmbID.Items.Add(tblUsers['UserID']);
      cmbUsername.Items.Add(tblUsers['Username']);
      cmbOwnerID.Items.Add(tblUsers['UserID']);
      cmbCOwner.Items.Add(tblUsers['UserID']);
      cmbEOwner.Items.Add(tblUsers['UserID']);

      tblUsers.Next;
    end;
  cmbOwnerID.ItemIndex := 0;
  cmbCOwner.ItemIndex := 0;

   tblProperties.First;
  while not tblProperties.Eof do
    begin
      cmbPropertyID.Items.Add(tblProperties['PropertyID']);
      cmbAddress.Items.Add(tblProperties['PropertyAddress']);
      tblProperties.Next;
    end;
end;

procedure TfrmAdmin.FormResize(Sender: TObject);
begin
    case pgcAdmin.ActivePageIndex of
      //if in user page
    0 : begin
          dbgUsers.Width := pgcAdmin.Width - 15;
          dbgUsers.Height := pgcAdmin.Height div 4;
          pgcUsers.Top := ((pgcAdmin.Height - dbgUsers.Height) div 2) - (pgcUsers.Height div 2) + dbgUsers.Height - 10;

          //Makes everything look nice when the admin is in the user tab and is resizing it
          case pgcUsers.ActivePageIndex of
            0 : begin
                  //if the user is in the create account page do this:
                  pgcUsers.Left := (pgcAdmin.ClientWidth div 2) - (pgcUsers.Width div 2) + 10;
                end;
            1 : begin
                  //if user is in edit account
                  pgcUsers.Left := (pgcAdmin.ClientWidth div 2) - (pgcUsers.Width div 2) + 10 - (grpUserSearch.Width div 2);

                  grpUserSearch.Left := pgcUsers.Left + pgcUsers.Width + 10;
                  grpUserSearch.Top := pgcUsers.Top + (pgcUsers.Height div 2) - (grpUserSearch.Height div 2);
                end;
            2 : begin
                  //if user is in delete account
                  pgcUsers.Left := (pgcAdmin.Width div 2) - (pgcUsers.Width div 2) + 10 - (grpUserSearch.Width div 2);

                  grpUserSearch.Left := pgcUsers.Left + pgcUsers.Width + 10;
                  grpUserSearch.Top := pgcUsers.Top + (pgcUsers.Height div 2) - (grpUserSearch.Height div 2);

                  //dbgSuppliers.Width := pgcAdmin.Width - 15;
                end;
          end;
        end;
        //if in property page
    1 : begin
          dbgProperties.Width := pgcAdmin.Width - 15;
          dbgProperties.Height := pgcAdmin.Height div 4;

          case pgcProperties.ActivePageIndex of
            0 : begin
                  pgcProperties.Left := (pgcAdmin.Width div 2) - (pgcProperties.Width div 2) + 10;
                end;
            1 : begin
                  pgcProperties.Left := (pgcAdmin.Width div 2) - (pgcProperties.Width div 2) + 10 - (grpStockSearch.Width div 2);
                  grpStockSearch.Left := pgcProperties.Left + pgcProperties.Width + 10;
                  grpStockSearch.Top := pgcProperties.Top + (pgcProperties.Height div 2) - (grpStockSearch.Height div 2);
                end;
            2 : begin
                  pgcProperties.Left := (pgcAdmin.Width div 2) - (pgcProperties.Width div 2) + 10 - (grpStockSearch.Width div 2);
                  grpStockSearch.Left := pgcProperties.Left + pgcProperties.Width + 10;
                  grpStockSearch.Top := pgcProperties.Top + (pgcProperties.Height div 2) - (grpStockSearch.Height div 2);
                end;
            3 : begin
                  pgcProperties.Left := (pgcAdmin.Width div 2) - (pgcProperties.Width div 2) + 10 - (grpStockSearch.Width div 2);
                  grpStockSearch.Left := pgcProperties.Left + pgcProperties.Width + 10;
                  grpStockSearch.Top := pgcProperties.Top + (pgcProperties.Height div 2) - (grpStockSearch.Height div 2);
                end;
            4 : begin
                  pgcProperties.Left := (pgcAdmin.Width div 2) - (pgcProperties.Width div 2) + 10 - (grpStockSearch.Width div 2);
                  grpStockSearch.Left := pgcProperties.Left + pgcProperties.Width + 10;
                  grpStockSearch.Top := pgcProperties.Top + (pgcProperties.Height div 2) - (grpStockSearch.Height div 2);
                end;
          end;
        end;
     //if in map
    2 : begin
          tMapDebounce.Enabled := True;
        end;
    // if in query place
    3 : begin
          dbgQueries.Height := pgcAdmin.Height div 4;
        end;
  end;

  tResizeDebounce.Enabled := True;
  tResizeDebounce.Interval := 1;

end;

procedure TfrmAdmin.FormShow(Sender: TObject);
var
  iItemIndex : Integer;
begin
  btnAdmin.SetFocus;

  iItemIndex := cmbMaps.ItemIndex;

  if iItemIndex = -1 then
    iItemIndex := 0
  else
    if iItemIndex > cmbMaps.ItemHeight then
      iItemIndex := cmbMaps.ItemHeight;

  cmbMaps.Clear;
  objMapAdmin.FillCmbMaps(cmbMaps);
  cmbMaps.ItemIndex := iItemIndex;
  objMapAdmin.Populate(cmbMaps.Items[cmbMaps.ItemIndex]);
end;

procedure TfrmAdmin.GetColumnSizes(sGridName : String);
var
  iTotalWidth, K, I : Integer;
begin
  iTotalWidth := 0;
  //Resets the array
  SetLength(arrGetSize, 0);
  //find component just allows for dynamically finding objects and stuff
  SetLength(arrGetSize, TDBGrid(FindComponent('dbg' + sGridName)).Columns.Count);
  for K := 0 to TDBGrid(FindComponent('dbg' + sGridName)).Columns.Count - 1 do
    iTotalWidth := iTotalWidth + TDBGrid(FindComponent('dbg' + sGridName)).Columns[K].Width;

  //stores the percentages in the arrays
  for I := 0 to TDBGrid(FindComponent('dbg' + sGridName)).Columns.Count - 1 do
    arrGetSize[I] :=  TDBGrid(FindComponent('dbg' + sGridName)).Columns[I].Width / iTotalWidth;

  ResizeColumns(sGridName, arrGetSize);
end;

procedure TfrmAdmin.pgcAdminChange(Sender: TObject);
begin
  //just to make sure

  if bReturnCoords = True then
    begin
      edtX.Text := '';
      edtY.Text := '';

      bReturnCoords := False;
      //disable paint just sets the stuff back to default so im just using this here
      objMapAdmin.DisablePaint(self);
      objMapAdmin.Populate(cmbMaps.Items[cmbMaps.ItemIndex]);
      pgcMaps.ActivePageIndex := 0;
    end;
  frmAdmin.Resize;
end;

procedure TfrmAdmin.pgcMapsChange(Sender: TObject);
begin
  if bReturnCoords = True then
    begin
      edtX.Text := '';
      edtY.Text := '';

      bReturnCoords := False;
      //disable paint just sets the stuff back to default so im just using this here
      objMapAdmin.DisablePaint(self);
      objMapAdmin.Populate(cmbMaps.Items[cmbMaps.ItemIndex]);
    end;
end;

procedure TfrmAdmin.pgcPropertiesChange(Sender: TObject);
begin
  case pgcProperties.ActivePageIndex of
    0 : begin
          grpStockSearch.Visible := False;

          edtCAddress.Clear;

        end;
    1 : begin
          grpStockSearch.Visible := True;

          edtEAddress.Clear;
          edtEAddress.StyleElements := [seFont, seClient, seBorder];
          lblOutputEAddress.Caption := '';



        end;
    2 : begin
          grpStockSearch.Visible := True;

          //StockAfterScroll(tblStock);
        end;
    3 : begin
          grpStockSearch.Visible := True;
        end;
    4 : begin
          grpStockSearch.Visible := False;
        end;
  end;

  frmAdmin.Resize;
end;

procedure TfrmAdmin.pgcUsersChange(Sender: TObject);
begin
  case pgcUsers.ActivePageIndex of
    0 : begin
          grpUserSearch.Visible := False;

          edtCUsername.Clear;
          edtCPassword.Clear;
          edtCConfirmPassword.Clear;
          edtCUsername.StyleElements := [seFont, seClient, seBorder];
          edtCPassword.StyleElements := [seFont, seClient, seBorder];
          edtCConfirmPassword.StyleElements := [seFont, seClient, seBorder];
          lblOutputCUsername.Caption := '';
          lblOutputCPass.Caption := '';

          chkCShowPass.Checked := False;
          chkCAdmin.Checked := False;
        end;
    1 : begin
          grpUserSearch.Visible := True;

          edtEUsername.Clear;
          edtEPassword.Clear;
          edtEConfirmPassword.Clear;
          edtEUsername.StyleElements := [seFont, seClient, seBorder];
          edtEPassword.StyleElements := [seFont, seClient, seBorder];
          edtEConfirmPassword.StyleElements := [seFont, seClient, seBorder];
          lblOutputEUsername.Caption := '';
          lblOutputEPass.Caption := '';

          chkEShowPass.Checked := False;

          //UsersAfterScroll(tblUsers);
        end;
    2 : begin
          grpUserSearch.Visible := True;

          //UsersAfterScroll(tblUsers);
        end;
  end;

  frmAdmin.Resize;
end;

procedure TfrmAdmin.PropertyfterScroll(Dataset: TDataSet);
begin
  if bPropertiesChange = False then
    begin
      edtEAddress.Text := '';
      spnEPrice.Value := tblProperties['Price'];
      spnESize.Value := tblProperties['Size'];
      spnEBedrooms.Value := tblProperties['Bedrooms'];
      spnEBathrooms.Value := tblProperties['Bathrooms'];
      chkERent.Checked := tblProperties['Rent'];
      chkEForSale.Checked := tblProperties['ForSale'];
      cmbEPropertyCategory.ItemIndex := GetItemLocation(cmbEPropertyCategory, tblProperties['PropertyType']);

      cmbPropertyID.ItemIndex := GetItemLocation(cmbPropertyID ,tblProperties['PropertyID']);
      cmbAddress.ItemIndex := GetItemLocation(cmbAddress ,tblProperties['PropertyAddress']);
      cmbEOwner.ItemIndex := GetItemLocation(cmbEOwner ,tblProperties['UserID']);
    end;
end;

procedure TfrmAdmin.ResizeColumns(sGridName: String; arrSize : array of real);
var
  I : Integer;
begin
  TDBGrid(FindComponent('dbg' + sGridName)).Width := pgcAdmin.Width - 15;

  //Actually sets the size on the form, the -19 is to account for the scrollbar
  for I := 0 to TDBGrid(FindComponent('dbg' + sGridName)).Columns.Count - 1 do
    TDBGrid(FindComponent('dbg' + sGridName)).Columns[I].Width := Floor(arrSize[I] * (TDBGrid(FindComponent('dbg' + sGridName)).ClientWidth - 19));
end;

procedure TfrmAdmin.rgpPaintClick(Sender: TObject);
begin
   case rgpPaint.ItemIndex of
    0 : objMapAdmin.SetTilePaint('W');
    1 : objMapAdmin.SetTilePaint('0');
    2 : objMapAdmin.SetTilePaint('R');
    3 : objMapAdmin.SetTilePaint('P');
    4 : objMapAdmin.SetTilePaint('S');
  end;
end;

procedure TfrmAdmin.rgpPriceClick(Sender: TObject);
begin
  UpdateButtonPrices;
end;

procedure TfrmAdmin.spnIncreasePriceChange(Sender: TObject);
begin
  UpdateButtonPrices;
end;

procedure TfrmAdmin.tMapDebounceTimer(Sender: TObject);
var
  iWidth, iHeight, iMapSize : Integer;
begin
  //if left button = not pressed do x
  if GetAsyncKeyState(VK_LBUTTON) = 0 then
    begin
      iWidth :=  (tbsMaps.ClientWidth div 3) * 2;
      iHeight := tbsMaps.ClientHeight - 50;

      //compares width and height because the map must always be square
      if iWidth > iHeight then
        begin
          iWidth := iHeight;
        end;

      if iHeight > iWidth then
        begin
          iHeight := iWidth;
        end;

      iMapSize := objMapAdmin.getMapSize;

      grpMapAdmin.Height := (iHeight div iMapSize) * iMapSize;
      grpMapAdmin.Width := (iWidth div iMapSize) * iMapSize;
      grpMapAdmin.Top := tbsMaps.ClientHeight div 2 - grpMapAdmin.Height div 2 + 15;

      //this is for a funky bug when you resize before the window is active
      if frmAdmin.Active = True then
        objMapAdmin.Resize;

       tMapDebounce.Enabled := False;
    end;

end;

procedure TfrmAdmin.tResizeDebounceTimer(Sender: TObject);
begin
  //if left button = not pressed do x
  if GetAsyncKeyState(VK_LBUTTON) = 0 then
    begin
          //Only resizes the dbgrid in the active page
          case pgcAdmin.ActivePageIndex of
            0 : ResizeColumns('Users', arrUsersSize);
            1 : ResizeColumns('Properties', arrPropertiesSize);
            3 : ResizeColumns('Queries', arrGetSize);
          end;

          tResizeDebounce.Enabled := False;
    end;
end;

procedure TfrmAdmin.UpdateButtonPrices;
begin
  if chkUpdateByUser.Checked = True then
    begin
      tblUsers.First;

      while not tblUsers.Eof do
        begin
          if tblUsers['UserID'] = cmbOwnerID.Items[cmbOwnerID.ItemIndex] then
            Break;

          tblUsers.Next;
        end;
    end;

  if chkUpdateByUser.Checked = True then
    if rgpPrice.ItemIndex = 0 then
      btnUpdatePrices.Caption := 'Increase price of all properties from ' + tblUsers['UserID'] + ' by ' + IntToStr(spnIncreasePrice.Value) + '%.'
    else
      btnUpdatePrices.Caption := 'Decrease price of all properties from ' + tblUsers['UserID'] + ' by ' + IntToStr(spnIncreasePrice.Value) + '%.'
  else
    if rgpPrice.ItemIndex = 0 then
      btnUpdatePrices.Caption := 'Increase price of all properties by ' + IntToStr(spnIncreasePrice.Value) + '%.'
    else
      btnUpdatePrices.Caption := 'Decrease price of all properties by ' + IntToStr(spnIncreasePrice.Value) + '%.';

  if rgpPrice.ItemIndex = 0 then
    btnUpdatePrices.Glyph.LoadFromFile('trending_up.bmp')
  else
    btnUpdatePrices.Glyph.LoadFromFile('trending_down.bmp');
end;


procedure TfrmAdmin.UpdateConfirm;
begin
  if (Length(edtX.Text) > 0) AND (Length(edtY.Text) > 0) AND (Length(edtMap.Text) > 0) then
    btnConfirm.Enabled := True
  else
    btnConfirm.Enabled := False;
end;

procedure TfrmAdmin.UsersAfterScroll(DataSet: TDataSet);
begin
  //boolean is making sure its not editing the values while you are going through the table
  if bUserChange = False then
    begin
      //because you cant change the text with the dropdown list style i have to get the items location
      // and then with that set them
      // where you want to find the item in, name of the item
      cmbID.ItemIndex := GetItemLocation(cmbID ,tblUsers['UserID']);
      cmbUsername.ItemIndex := GetItemLocation(cmbUsername ,tblUsers['Username']);

      if tblUsers['AdminPriviledges'] = True then
        chkEAdmin.Checked := True
      else
        chkEAdmin.Checked := False;
    end;
end;

function TfrmAdmin.GetItemLocation(cmbSearchItem: TComboBox;
  sItemName: String): Integer;
var
  I : Integer;
begin
  //finds where the item is in a combobox
  //if it doesnt find anything then result := -1
  // which means that it wont change anything
  Result := -1;
  for I := 0 to cmbSearchItem.Items.Count do
    begin
      if cmbSearchItem.Items[I] = sItemName then
        begin
          Result := I;
          Break;
        end;
    end;
end;


procedure TfrmAdmin.MatchUserComboboxes(sSearchWith, sSearchIn, sFindIn: String;
  cmbSearchItem: TComboBox; tblSearchIn: TADOTable);
var
  sFoundText : string;
begin
  bUserChange := True;

  //on select change other combobox to match its value to this user ID's username
  tblSearchIn.First;
  while not tblSearchIn.Eof do
    begin
      if sSearchWith = tblSearchIn[sSearchIn] then
        begin
          sFoundText := tblSearchIn[sFindIn];
          Break;
        end;
      tblSearchIn.Next;
    end;

  bUserChange := False;

  cmbSearchItem.ItemIndex := GetItemLocation(cmbSearchItem, sFoundText);

end;

end.
