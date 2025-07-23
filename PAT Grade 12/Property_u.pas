unit Property_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Map_u, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TfrmProperty = class(TForm)
    grpMap: TGroupBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    tMapDebounce: TTimer;
    CheckBox1: TCheckBox;
    RadioGroup1: TRadioGroup;
    edtPropertyID: TEdit;
    edtPropertyAddress: TEdit;
    edtPrice: TEdit;
    edtSize: TEdit;
    btnLogOut: TBitBtn;
    btnMain: TBitBtn;
    btnStatistics: TBitBtn;
    btnAdmin: TBitBtn;
    edtType: TEdit;
    chkRent: TCheckBox;
    lblPropertyID: TLabel;
    lblAddress: TLabel;
    lblType: TLabel;
    lblPrice: TLabel;
    lblArea: TLabel;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tMapDebounceTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure btnLogOutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProperty: TfrmProperty;
  objMap : TMap;

implementation

uses Login_u, User_u;

{$R *.dfm}

procedure TfrmProperty.btnLogOutClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to log out?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      frmLogin.objAccount.LogOut;

      frmLogin.SwitchForm(frmProperty, frmLogin);
    end;
end;

procedure TfrmProperty.Button1Click(Sender: TObject);
begin
  objMap.Populate('M001.txt');
end;

procedure TfrmProperty.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    objMap.EnablePaint(Self, 'M001.txt')
  else
    objMap.DisablePaint(Self, 'M001.txt');
end;

procedure TfrmProperty.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmProperty.FormCreate(Sender: TObject);
begin
  //in create so that it only happens once
  tblProperties := frmLogin.tblProperties;

  objMap := TMap.Create(grpMap, tblProperties);
  objMap.Build;
  objMap.setOutput(edtPropertyID, edtPropertyAddress, edtType, edtPrice, edtSize, chkRent);
  objMap.Populate('M001.txt');
end;

procedure TfrmProperty.FormResize(Sender: TObject);
begin
  tMapDebounce.Enabled := True;
end;

procedure TfrmProperty.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : objMap.SetTilePaint('W');
    1 : objMap.SetTilePaint('0');
    2 : objMap.SetTilePaint('R');
    3 : objMap.SetTilePaint('P');
    4 : objMap.SetTilePaint('X');
    5 : objMap.SetTilePaint('S');
  end;
end;

procedure TfrmProperty.tMapDebounceTimer(Sender: TObject);
var
  iWidth, iHeight, iMapSize : Integer;
begin
  //if left button = not pressed do x
  if GetAsyncKeyState(VK_LBUTTON) = 0 then
    begin
      iWidth :=  (frmProperty.ClientWidth div 3) * 2;
      iHeight := frmProperty.ClientHeight - 50;

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
      grpMap.Top := frmProperty.ClientHeight div 2 - grpMap.Height div 2 + 15;

      //this is for a funky bug when you resize before the window is active
      if frmProperty.Active = True then
        objMap.Resize;

       tMapDebounce.Enabled := False;
    end;
end;

end.
