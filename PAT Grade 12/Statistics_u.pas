unit Statistics_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Samples.Spin, Vcl.ComCtrls, Vcl.Buttons, VCLTee.Series,
  VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart, Data.DB, Data.Win.ADODB, System.UITypes;

type
  TfrmStatistics = class(TForm)
    chrtStatistics: TChart;
    Series1: TBarSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    btnLogOut: TBitBtn;
    btnMain: TBitBtn;
    btnMap: TBitBtn;
    btnStatistics: TBitBtn;
    btnAdmin: TBitBtn;
    btnSettings: TBitBtn;
    grpStatistics: TGroupBox;
    lblColumns: TLabel;
    pgcSeries: TPageControl;
    tbsSeries1: TTabSheet;
    cmbSelectSeries1: TComboBox;
    tbsSeries2: TTabSheet;
    cmbSelectSeries2: TComboBox;
    tbsSeries3: TTabSheet;
    cmbSelectSeries3: TComboBox;
    spnGraphAmount: TSpinEdit;
    rgpSort: TRadioGroup;
    rgpGroup: TRadioGroup;
    cmbGroupMap: TComboBox;
    cmbGroupUser: TComboBox;
    cmbGroupType: TComboBox;
    procedure btnMainClick(Sender: TObject);
    procedure btnMapClick(Sender: TObject);
    procedure btnAdminClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgpSortClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spnGraphAmountChange(Sender: TObject);
    procedure cmbSelectSeries2Select(Sender: TObject);
    procedure cmbSelectSeries1Select(Sender: TObject);
    procedure cmbSelectSeries3Select(Sender: TObject);
    procedure rgpGroupClick(Sender: TObject);
    procedure cmbGroupTypeSelect(Sender: TObject);
    procedure cmbGroupMapSelect(Sender: TObject);
    procedure cmbGroupUserSelect(Sender: TObject);
    procedure btnLogOutClick(Sender: TObject);
  private
    { Private declarations }
    procedure Display;
  public
    { Public declarations }
    procedure PopulateAndSortArrays(sSeries1, sSeries2, sSeries3  : String);
    var
    tblProperties : TADOTable;
  end;

var
  frmStatistics: TfrmStatistics;
  arrSeries1, arrSeries2, arrSeries3 : array of real;
  arrNames : array of string;
  sGroupBy, sGroupCompare : String;
  iCounter : Integer;


implementation

uses Admin_u, Settings_u, Login_u, PropertyMap_u, Properties_u;
{$R *.dfm}

procedure TfrmStatistics.btnAdminClick(Sender: TObject);
begin
  frmLogin.SwitchForm(frmStatistics, frmAdmin);
end;

procedure TfrmStatistics.btnLogOutClick(Sender: TObject);
begin
    if MessageDlg('Are you sure you want to log out?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      frmLogin.objAccount.LogOut;

      frmLogin.SwitchForm(frmStatistics, frmLogin);
    end;
end;

procedure TfrmStatistics.btnMainClick(Sender: TObject);
begin
  frmLogin.SwitchForm(frmStatistics, frmProperties);
end;

procedure TfrmStatistics.btnMapClick(Sender: TObject);
begin
  frmLogin.SwitchForm(frmStatistics, frmMap);
end;

procedure TfrmStatistics.cmbGroupMapSelect(Sender: TObject);
begin
  sGroupCompare := cmbGroupMap.Items[cmbGroupMap.ItemIndex];

  PopulateAndSortArrays(cmbSelectSeries1.Items[cmbSelectSeries1.ItemIndex], cmbSelectSeries2.Items[cmbSelectSeries2.ItemIndex], cmbSelectSeries3.Items[cmbSelectSeries3.ItemIndex]);

  Display;
end;

procedure TfrmStatistics.cmbGroupTypeSelect(Sender: TObject);
begin
  sGroupCompare := cmbGroupType.Items[cmbGroupType.ItemIndex];

  PopulateAndSortArrays(cmbSelectSeries1.Items[cmbSelectSeries1.ItemIndex], cmbSelectSeries2.Items[cmbSelectSeries2.ItemIndex], cmbSelectSeries3.Items[cmbSelectSeries3.ItemIndex]);

  Display;
end;

procedure TfrmStatistics.cmbGroupUserSelect(Sender: TObject);
begin
  sGroupCompare := cmbGroupUser.Items[cmbGroupUser.ItemIndex];

  PopulateAndSortArrays(cmbSelectSeries1.Items[cmbSelectSeries1.ItemIndex], cmbSelectSeries2.Items[cmbSelectSeries2.ItemIndex], cmbSelectSeries3.Items[cmbSelectSeries3.ItemIndex]);

  Display;
end;

procedure TfrmStatistics.cmbSelectSeries1Select(Sender: TObject);
begin
  PopulateAndSortArrays(cmbSelectSeries1.Items[cmbSelectSeries1.ItemIndex], cmbSelectSeries2.Items[cmbSelectSeries2.ItemIndex], cmbSelectSeries3.Items[cmbSelectSeries3.ItemIndex]);

  Display;
end;

procedure TfrmStatistics.cmbSelectSeries2Select(Sender: TObject);
begin
  PopulateAndSortArrays(cmbSelectSeries1.Items[cmbSelectSeries1.ItemIndex], cmbSelectSeries2.Items[cmbSelectSeries2.ItemIndex], cmbSelectSeries3.Items[cmbSelectSeries3.ItemIndex]);

  Display;
end;

procedure TfrmStatistics.cmbSelectSeries3Select(Sender: TObject);
begin
  PopulateAndSortArrays(cmbSelectSeries1.Items[cmbSelectSeries1.ItemIndex], cmbSelectSeries2.Items[cmbSelectSeries2.ItemIndex], cmbSelectSeries3.Items[cmbSelectSeries3.ItemIndex]);

  Display;
end;

procedure TfrmStatistics.Display;
var
  I, K, iColumns, iValue : Integer;
begin
  chrtStatistics.Series[0].Clear;
  chrtStatistics.Series[1].Clear;
  chrtStatistics.Series[2].Clear;
  iValue := spnGraphAmount.Value;

  //to ensure that it doesnt display info if the array didnt change
  if iCounter <> 0 then
    begin

      if rgpSort.ItemIndex = 0 then
        begin
          //to make sure that the user isnt trying to display more columns than there exists
          if Length(arrSeries1) <= iValue then
            iColumns := Length(arrSeries1) - 1    //-1 accounts for starting at 0
          else
            iColumns := iValue - 1;

        for I := 0 to iColumns do
          begin
            chrtStatistics.Series[0].Add(arrSeries1[I], arrNames[I]);
            chrtStatistics.Series[1].Add(arrSeries2[I]);
            chrtStatistics.Series[2].Add(arrSeries3[I]);
          end
        end
      else
        begin
          if Length(arrSeries1) <= iValue then
            iColumns := 0
          else
            iColumns := Length(arrSeries1) - iValue;

        for K := Length(arrSeries1) - 1 downto iColumns do
          begin
            chrtStatistics.Series[0].Add(arrSeries1[K], arrNames[K]);
            chrtStatistics.Series[1].Add(arrSeries2[K]);
            chrtStatistics.Series[2].Add(arrSeries3[K]);
          end;
        end;
    end;
end;

procedure TfrmStatistics.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmLogin.objAccount.LogOut;
  Application.Terminate;
end;

procedure TfrmStatistics.FormCreate(Sender: TObject);
var
  bFound : Boolean;
  iCounter2 : Integer;
  sFilePath, sFileName : String;
begin
  tblProperties := frmLogin.tblProperties;

  bFound := True;
  iCounter2 := 0;
  //checks files to see how many of them exist
  while bFound = True do
    begin
      Inc(iCounter2);

      if iCounter2 < 10 then
        sFileName := 'M00' + IntToStr(iCounter2) + '.txt'
      else
        if iCounter2 < 100 then
          sFileName := 'M0' + IntToStr(iCounter2) + '.txt'
            else
              sFileName := 'M' + IntToStr(iCounter2) + '.txt';

      sFilePath := FileSearch(sFileName, GetCurrentDir);
        if sFilePath = '' then
          bFound := False
        else
          begin
            bFound := True;
            cmbGroupMap.Items.Add(Copy(sFileName, 1, Length(sFileName)));
          end;
    end;

  tblUsers.First;
  while not tblUsers.Eof do
    begin
      cmbGroupUser.Items.Add(tblUsers['UserID']);
      tblUsers.Next;
    end;

  cmbGroupType.Items.Add('House');
  cmbGroupType.Items.Add('Apartment');
  cmbGroupType.Items.Add('Townhouse');
  cmbGroupType.Items.Add('Plot');
  cmbGroupType.Items.Add('Farm');
  cmbGroupType.Items.Add('Commercial Property');
  cmbGroupType.Items.Add('Industrial Property');
end;

procedure TfrmStatistics.FormShow(Sender: TObject);
begin
  btnStatistics.SetFocus;
  PopulateAndSortArrays(cmbSelectSeries1.Items[cmbSelectSeries1.ItemIndex], cmbSelectSeries2.Items[cmbSelectSeries2.ItemIndex], cmbSelectSeries3.Items[cmbSelectSeries3.ItemIndex]);
  Display;

end;

procedure TfrmStatistics.PopulateAndSortArrays(sSeries1, sSeries2,
  sSeries3: String);
var
  rHolder : Real;
  sHolder : String;
  I, K : Integer;
begin
  iCounter := 0;
  tblProperties.First;

  if sGroupBy = '' then
    begin
      while not tblProperties.Eof do
        begin
          //plus 1 because my counter starts at 0
          SetLength(arrSeries1, iCounter + 1);
          SetLength(arrSeries2, iCounter + 1);
          SetLength(arrSeries3, iCounter + 1);
          SetLength(arrNames, iCounter + 1);

          arrSeries1[iCounter] := tblProperties[sSeries1];
          arrSeries2[iCounter] := tblProperties[sSeries2];
          arrSeries3[iCounter] := tblProperties[sSeries3];

          arrNames[iCounter] := tblProperties['PropertyID'] + ' (' + tblProperties['PropertyAddress'] +')';

          Inc(iCounter);
          tblProperties.Next;
        end;
    end
  else
    begin
      while not tblProperties.Eof do
        begin
          if tblProperties[sGroupBy] = sGroupCompare then
            begin
              SetLength(arrSeries1, iCounter + 1);
              SetLength(arrSeries2, iCounter + 1);
              SetLength(arrSeries3, iCounter + 1);
              SetLength(arrNames, iCounter + 1);

              arrSeries1[iCounter] := tblProperties[sSeries1];
              arrSeries2[iCounter] := tblProperties[sSeries2];
              arrSeries3[iCounter] := tblProperties[sSeries3];

              arrNames[iCounter] := tblProperties['PropertyID'] + ' (' + tblProperties['PropertyAddress'] +')';

              Inc(iCounter);
            end;
          tblProperties.Next;
        end;
    end;

  for I := 0 to Length(arrSeries1) - 1 do
  begin                         //normally -1 but -2 to account for starting at 0
    for K := 0 to Length(arrSeries1) - 2 do
      begin
        if arrSeries1[K] < arrSeries1[K + 1] then
          begin
            rHolder := arrSeries1[K];
            arrSeries1[K] := arrSeries1[K + 1];
            arrSeries1[K + 1] := rHolder;

            rHolder := arrSeries2[K];
            arrSeries2[K] := arrSeries2[K + 1];
            arrSeries2[K + 1] := rHolder;

            rHolder := arrSeries3[K];
            arrSeries3[K] := arrSeries3[K + 1];
            arrSeries3[K + 1] := rHolder;

            sHolder := arrNames[K];
            arrNames[K] := arrNames[K + 1];
            arrNames[K + 1] := sHolder;
          end;
      end;
  end;

end;

procedure TfrmStatistics.rgpGroupClick(Sender: TObject);
begin
  case rgpGroup.ItemIndex of
    0 : begin
          sGroupBy := '';
          cmbGroupMap.Visible := False;
          cmbGroupUser.Visible := False;
          cmbGroupType.Visible := False;
          sGroupCompare := '';
        end;
    1 : begin
          sGroupBy := 'MapID';
          cmbGroupMap.ItemIndex := 0;
          cmbGroupMap.Visible := True;
          cmbGroupUser.Visible := False;
          cmbGroupType.Visible := False;
          cmbGroupMap.ItemIndex := 0;
          sGroupCompare := cmbGroupMap.Items[cmbGroupMap.ItemIndex];
        end;
    2 : begin
          sGroupBy := 'UserID';
          cmbGroupUser.ItemIndex := 0;
          cmbGroupMap.Visible := False;
          cmbGroupUser.Visible := True;
          cmbGroupType.Visible := False;
          cmbGroupUser.ItemIndex := 0;
          sGroupCompare := cmbGroupUser.Items[cmbGroupUser.ItemIndex];
        end;
    3 : begin
          sGroupBy := 'PropertyType';
          cmbGroupMap.Visible := False;
          cmbGroupUser.Visible := False;
          cmbGroupType.Visible := True;
          cmbGroupType.ItemIndex := 0;
          sGroupCompare := cmbGroupType.Items[cmbGroupType.ItemIndex];
        end;
    4 : begin
          sGroupBy := 'ForSale';
          cmbGroupMap.Visible := False;
          cmbGroupUser.Visible := False;
          cmbGroupType.Visible := False;
          sGroupCompare := 'True';
        end;
    5 : begin
          sGroupBy := 'Rent';
          cmbGroupMap.Visible := False;
          cmbGroupUser.Visible := False;
          cmbGroupType.Visible := False;
          sGroupCompare := 'True';
        end;
  end;

  PopulateAndSortArrays(cmbSelectSeries1.Items[cmbSelectSeries1.ItemIndex], cmbSelectSeries2.Items[cmbSelectSeries2.ItemIndex], cmbSelectSeries3.Items[cmbSelectSeries3.ItemIndex]);
  Display;
end;

procedure TfrmStatistics.rgpSortClick(Sender: TObject);
begin
  Display;
end;

procedure TfrmStatistics.spnGraphAmountChange(Sender: TObject);
begin
  Display;
end;

end.
