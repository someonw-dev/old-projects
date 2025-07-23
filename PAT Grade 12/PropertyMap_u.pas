unit PropertyMap_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Map_u, Vcl.ExtCtrls, System.UITypes,
  Vcl.Buttons, Vcl.Mask;

type
  TfrmMap = class(TForm)
    grpMap: TGroupBox;
    tMapDebounce: TTimer;
    btnLogOut: TBitBtn;
    btnMain: TBitBtn;
    btnMap: TBitBtn;
    btnAdmin: TBitBtn;
    btnStatistics: TBitBtn;
    btnSettings: TBitBtn;
    grpPropertyMapStuff: TGroupBox;
    grpLegend: TGroupBox;
    sProperty: TShape;
    sRoad: TShape;
    Label1: TLabel;
    Label2: TLabel;
    grpPropertyInfo: TGroupBox;
    lblNoInfo: TLabel;
    chkRent: TCheckBox;
    edtSize: TLabeledEdit;
    edtPropertyID: TLabeledEdit;
    edtPropertyAddress: TLabeledEdit;
    edtType: TLabeledEdit;
    edtPrice: TLabeledEdit;
    cmbMaps: TComboBox;
    lblLoad: TLabel;
    sStore: TShape;
    Label3: TLabel;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tMapDebounceTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLogOutClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAdminClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure btnMainClick(Sender: TObject);
    procedure btnStatisticsClick(Sender: TObject);
    procedure cmbMapsChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      objMap : TMap;
      bNormalPopulate : Boolean;
  end;

var
  frmMap: TfrmMap;

implementation

uses Login_u, User_u, Admin_u, Settings_u, Properties_u, Statistics_u;

{$R *.dfm}

procedure TfrmMap.btnAdminClick(Sender: TObject);
begin
  frmLogin.SwitchForm(frmMap, frmAdmin);
end;

procedure TfrmMap.btnLogOutClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to log out?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      frmLogin.objAccount.LogOut;

      frmLogin.SwitchForm(frmMap, frmLogin);
    end;
end;

procedure TfrmMap.btnMainClick(Sender: TObject);
begin
  frmLogin.SwitchForm(frmMap, frmProperties);
end;

procedure TfrmMap.btnSettingsClick(Sender: TObject);
begin
  TOldForm := frmMap;
  frmLogin.SwitchForm(frmMap, frmSettings);
end;

procedure TfrmMap.btnStatisticsClick(Sender: TObject);
begin
  frmLogin.SwitchForm(frmMap, frmStatistics);
end;

procedure TfrmMap.cmbMapsChange(Sender: TObject);
begin
  objMap.Populate(cmbMaps.Items[cmbMaps.ItemIndex]);
end;

procedure TfrmMap.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmLogin.objAccount.LogOut;
  Application.Terminate;
end;

procedure TfrmMap.FormCreate(Sender: TObject);
begin
  //in create so that it only happens once
  tblProperties := frmLogin.tblProperties;
  sProperty.Brush.Color := clWebChocolate;
  bNormalPopulate := True;

  objMap := TMap.Create(grpMap, tblProperties);
  objMap.Build;
  objMap.setOutput(edtPropertyID, edtPropertyAddress, edtType, edtPrice, edtSize, chkRent, lblNoInfo);
end;

procedure TfrmMap.FormResize(Sender: TObject);
begin
  tMapDebounce.Enabled := True;
end;

procedure TfrmMap.FormShow(Sender: TObject);
var
  iItemIndex : Integer;
begin
  btnMap.SetFocus;

  if bNormalPopulate = True then
  begin
    iItemIndex := cmbMaps.ItemIndex;

    if iItemIndex = -1 then
      iItemIndex := 0
    else
      if iItemIndex > cmbMaps.ItemHeight then
        iItemIndex := cmbMaps.ItemHeight;
    cmbMaps.Clear;
    objMap.FillCmbMaps(cmbMaps);
    cmbMaps.ItemIndex := iItemIndex;
    objMap.Populate(cmbMaps.Items[cmbMaps.ItemIndex]);
  end
else
  begin
    bNormalPopulate := True;
    cmbMaps.Clear;
    objMap.FillCmbMaps(cmbMaps);
    cmbMaps.ItemIndex := frmAdmin.GetItemLocation(cmbMaps, objMap.getMapName);
  end;
end;

procedure TfrmMap.tMapDebounceTimer(Sender: TObject);
var
  iWidth, iHeight, iMapSize : Integer;
begin
  //if left button = not pressed do x
  if GetAsyncKeyState(VK_LBUTTON) = 0 then
    begin
      iWidth :=  (frmMap.ClientWidth div 3) * 2;
      iHeight := frmMap.ClientHeight - 50;

      //compares width and height because the map must always be square
      if iWidth > iHeight then
        begin
          iWidth := iHeight;
        end;

      if iHeight > iWidth then
        begin
          iHeight := iWidth;
        end;

      iMapSize := objMap.getMapSize;

      grpMap.Height := (iHeight div iMapSize) * iMapSize;
      grpMap.Width := (iWidth div iMapSize) * iMapSize;
      grpMap.Top := frmMap.ClientHeight div 2 - grpMap.Height div 2 + 15;

      //this is for a funky bug when you resize before the window is active
      if frmMap.Active = True then
        objMap.Resize;

       tMapDebounce.Enabled := False;
    end;
end;

end.
