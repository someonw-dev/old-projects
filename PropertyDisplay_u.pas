unit PropertyDisplay_u;

interface

uses Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Graphics, System.SysUtils, System.Classes, System.Generics.Collections, System.UITypes,
  Vcl.Controls, Winapi.Windows, Winapi.Messages, System.Variants, Vcl.Forms, Vcl.ComCtrls, Vcl.Buttons, User_u, Hash,
  Data.DB, Data.Win.ADODB, Samples.Spin, Math, PropertyMap_u, Login_u;

type
  TPropertyList = class(TObject)
    private
      fParent : TScrollBox;
      fLoad : Boolean;
      fCounter, fMax, iScroll : Integer;
      fEditable : Boolean;
      objProperty : TGroupBox;
      procedure CreateSpinEdit(sName, sCaption: String; iValue, X, Y, iWidth, iMax : Integer; grpParent : TGroupBox);
      procedure CreateCheckBox(sName, sCaption : String; bChecked : Boolean; X, Y : Integer; grpParent : TGroupBox);
      procedure CreateComboBox(sName, sCaption, sText : String; X, Y, iWidth : Integer; grpParent : TGroupBox);
      procedure CreateButton(sName, sCaption: String; X, Y : Integer; grpParent : TGroupBox);
      procedure CreateButtonLoad(sName, sCaption: String; X, Y : Integer; scbParent : TScrollBox);
      procedure CreateLabel(sName, sCaption: String; X, Y : Integer; grpParent : TGroupBox);
      procedure CreateBitBtn(sName, sCaption: String; X, Y : Integer; grpParent : TGroupBox);
      procedure CenterLabel(lblCenter : TLabel; spnPoint : TSpinEdit); overload;
      procedure CenterLabel(lblCenter : TLabel; cmbPoint : TComboBox); overload;
      procedure ButtonClick(Sender : TObject);
      procedure BitBtnClick(Sender : TObject);
      procedure ButtonLoadClick(Sender : TObject);
      function GetItemLocation(cmbSearchItem: TComboBox; sItemName: String): Integer;
    public
      var
        tblProperty : TADOTable;
      constructor Create(scbParent : TScrollBox; tblProperties : TADOTable);
      procedure CreateItem(sID, sAddress, sType : String; iBathrooms, iBedrooms, iSize : Integer; rPrice : Real; bRent, bSale : Boolean; bEditable : Boolean; sContact, sMapID, sX, sY : String);
      procedure Clear;
      procedure Visible;
      function getCounter : Integer;
  end;

implementation
uses  Properties_u;
function TPropertyList.GetItemLocation(cmbSearchItem: TComboBox;
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

procedure TPropertyList.CenterLabel(lblCenter: TLabel; spnPoint: TSpinEdit);
var
  iMid : Integer;
begin
  iMid := spnPoint.Left + spnPoint.Width div 2;

  lblCenter.Left := iMid - lblCenter.Width div 2;
  lblCenter.Top := spnPoint.Top - lblCenter.Height + - 5;

end;

procedure TPropertyList.BitBtnClick(Sender: TObject);
var
  sName, sMap : String;
  iX, iY : Integer;
begin
  sName := TBitBtn(sender).Name;
  sName := StringReplace(sName, '_', '.', [rfReplaceAll]);
  sMap := Copy(sName, 1, Pos('X', sName) - 1);
  Delete(sName, 1, Pos('X', sName));
  iX := StrToInt(Copy(sName, 1, Pos('Y', sName) - 1));
  Delete(sName, 1, Pos('Y', sName));
  iY := StrToInt(sName);

  if sMap <> '' then
    begin
      frmMap.bNormalPopulate := False;
      frmMap.objMap.PopulateCoord(sMap, iX, iY);
      frmLogin.SwitchForm(frmProperties, frmMap);
    end
  else
    ShowMessage('No map associated with property');
end;

procedure TPropertyList.ButtonClick(Sender: TObject);
var
  sID, sType : STring;
  iBathrooms, iBedrooms, iPrice, iSize : Integer;
  bRent, bForSale : Boolean;
  objParent : TGroupBox;
  objCombo : TComboBox;
begin
  if MessageDlg('Are you sure you want to save changes?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      sID := TButton(Sender).Name;
      objParent := TGroupBox(TButton(Sender).Parent);

      //gets all the values
      objCombo := TComboBox(objParent.FindComponent('cmbType'));
      sType := objCombo.Items[objCombo.ItemIndex];
      iBathrooms := TSpinEdit(objParent.FindComponent('spnBathrooms')).Value;
      iBedrooms := TSpinEdit(objParent.FindComponent('spnBedrooms')).Value;
      iPrice := TSpinEdit(objParent.FindComponent('spnPrice')).Value;
      iSize := TSpinEdit(objParent.FindComponent('spnSize')).Value;
      bRent := TCheckBox(objParent.FindComponent('chkRent')).Checked;
      bForSale := TCheckBox(objParent.FindComponent('chkForSale')).Checked;

      tblProperty.First;
      while not tblProperty.Eof do
        begin
          if tblProperty['PropertyID'] = sID then
            begin
              tblProperty.Edit;
              tblProperty['PropertyType'] := sType;
              tblProperty['Bathrooms'] := iBathrooms;
              tblProperty['Bedrooms'] := iBedrooms;
              tblProperty['Price'] := iPrice;
              tblProperty['Size'] := iSize;
              tblProperty['Rent'] := bRent;
              tblProperty['ForSale'] := bForSale;
              tblProperty.Post;
              Break;
            end;

          tblProperty.Next;
        end;
    end;
end;

procedure TPropertyList.ButtonLoadClick(Sender: TObject);
var
  iCounter : Integer;
  sUserID : String;
  bEnabled : Boolean;
begin
  iScroll := fParent.VertScrollBar.ScrollPos;
  //doing this for a dumb bug
  fParent.VertScrollBar.Position := 0;
  iCounter := 1;
  tblProperty.First;
    while iCounter < fMax + 1 do
      begin
        Inc(iCounter);
        tblProperty.Next;
      end;
  fLoad := False;
  
  fMax := fMax + 10;

  case frmProperties.rgpList.ItemIndex of
    0 : begin
          frmProperties.lblNoProperties.Visible := False;
          while not tblProperty.Eof do
            begin
              if tblProperty['UserID'] = null then
               sUserID := ''
             else
               sUserID := tblProperty['UserID'];

              if sUserID = frmLogin.objAccount.getUserID then
                bEnabled := True
              else
                bEnabled := False;

              frmProperties.CreateItem(bEnabled);

              tblProperty.Next;
            end;
        end;
    1 : begin
          while not tblProperty.Eof do
            begin
              if tblProperty['UserID'] = null then
               sUserID := ''
             else
               sUserID := tblProperty['UserID'];

              if sUserID = frmLogin.objAccount.getUserID then
                begin
                  frmProperties.CreateItem(True);
                end;

              tblProperty.Next;
            end;

          if frmProperties.objProperty.getCounter = 0 then
            frmProperties.lblNoProperties.Visible := True
          else
            frmProperties.lblNoProperties.Visible := False;
        end;
    2 : begin
          frmProperties.lblNoProperties.Visible := False;
          while not tblProperty.Eof do
            begin
              if tblProperty['UserID'] = null then
               sUserID := ''
             else
               sUserID := tblProperty['UserID'];

              if NOT (sUserID = frmLogin.objAccount.getUserID) then
                begin
                  frmProperties.CreateItem(False);
                end;

              tblProperty.Next;
            end;
        end;
    3 : begin
          while not tblProperty.Eof do
            begin
              if tblProperty['UserID'] = null then
                sUserID := ''
             else
               sUserID := tblProperty['UserID'];

              if sUserID = frmProperties.cmbID.Items[frmProperties.cmbID.ItemIndex] then
                begin
                  if sUserID = frmLogin.objAccount.getUserID then
                    frmProperties.CreateItem(True)
                  else
                    frmProperties.CreateItem(False);
                end;
              tblProperty.Next;
            end;

          if frmProperties.objProperty.getCounter = 0 then
            frmProperties.lblNoProperties.Visible := True
          else
            frmProperties.lblNoProperties.Visible := False;
          frmProperties.grpUserSearch.Visible := True;
        end;
  end;

  frmProperties.objProperty.Visible;
  fParent.VertScrollBar.Position := iScroll;
end;

procedure TPropertyList.CenterLabel(lblCenter: TLabel; cmbPoint: TComboBox);
var
  iMid : Integer;
begin
  iMid := cmbPoint.Left + cmbPoint.Width div 2;

  lblCenter.Left := iMid - lblCenter.Width div 2;
  lblCenter.Top := cmbPoint.Top - lblCenter.Height + - 5;
end;

procedure TPropertyList.Clear;
begin
  if fParent.ComponentCount > 0 then
    fParent.DestroyComponents;

  fMax := 10;
  fCounter := 0;
  fLoad := False;
end;

{ TPropertyBox }

constructor TPropertyList.Create(scbParent: TScrollBox; tblProperties : TADOTable);
begin
  fParent := scbParent;
  fMax := 10;
  tblProperty := tblProperties;
  fCounter := 0;
  fLoad := False;
end;

procedure TPropertyList.CreateBitBtn(sName, sCaption: String; X, Y: Integer; grpParent : TGroupBox);
var
  objBitBtn : TBitBtn;
begin
  objBitBtn := TBitBtn.Create(grpParent);
  objBitBtn.Parent := grpParent;
  objBitBtn.Name := sName;
  objBitBtn.Caption := '';
  objBitBtn.Width := 25;
  objBitBtn.Height := 25;
  objBitBtn.Left := X;
  objBitBtn.Top := Y;
  objBitBtn.Anchors := [TAnchorKind.akRight];
  objBitBtn.OnClick := BitBtnClick;
  objBitBtn.Glyph.LoadFromFile('home_pin.bmp');
end;

procedure TPropertyList.CreateButton(sName, sCaption: String; X, Y: Integer; grpParent : TGroupBox);
var
  objButton : TButton;
begin
  objButton := TButton.Create(grpParent);
  objButton.Parent := grpParent;
  objButton.Name := sName;
  objButton.Left := X;
  objButton.Top := Y;
  objButton.Caption := sCaption;
  objButton.Anchors := [];
  objButton.OnClick := ButtonClick;
end;

procedure TPropertyList.CreateButtonLoad(sName, sCaption: String; X, Y: Integer;
   scbParent : TScrollBox);
var
  objButton : TButton;
begin
  objButton := TButton.Create(fParent);
  objButton.Parent := fParent;
  objButton.Name := sName;
  objButton.Width := 100;
  objButton.Height := 50;
  objButton.Left := X - objButton.Width div 2;
  objButton.Top := Y;
  objButton.Caption := sCaption;
  objButton.Anchors := [TAnchorKind.akTop];
  objButton.OnClick := ButtonLoadClick;

end;

procedure TPropertyList.CreateCheckBox(sName, sCaption: String;
  bChecked: Boolean; X, Y: Integer; grpParent: TGroupBox);
var
  objCheckBox : TCheckBox;
begin
  objCheckBox := TCheckBox.Create(grpParent);
  objCheckBox.Parent := grpParent;
  if fEditable = False then
    objCheckbox.Enabled := False;
  objCheckBox.Name := 'chk' + sName;
  objCheckBox.Caption := sCaption;
  objCheckBox.Checked :=  bChecked;
  objCheckBox.Left := X;
  objCheckBox.Top := Y;
  objCheckBox.Anchors := [];
end;

procedure TPropertyList.CreateComboBox(sName, sCaption, sText: String; X, Y,
  iWidth: Integer; grpParent: TGroupBox);
var
  objCombobox : TComboBox;
  objLabel : TLabel;
begin
  objLabel := TLabel.Create(grpParent);
  objLabel.Parent := grpParent;
  objLabel.Name := 'lbl' + sName;
  objLabel.Anchors := [];
  objLabel.Caption := sCaption;
  if fEditable = False then
    objLabel.Enabled := False;

  objCombobox := TComboBox.Create(grpParent);
  objCombobox.Parent := grpParent;
  objCombobox.Name := 'cmb' + sName;
  objCombobox.Width := iWidth;
  objCombobox.Left := X;
  objCombobox.Top := Y;
  objCombobox.Style := csDropDownList;
  objCombobox.Anchors := [];

  objCombobox.Items.Add('Apartment');
  objCombobox.Items.Add('Commercial Property');
  objCombobox.Items.Add('Farm');
  objCombobox.Items.Add('House');
  objCombobox.Items.Add('Industrial Property');
  objCombobox.Items.Add('Plot');
  objCombobox.Items.Add('Townhouse');

  if fEditable = False then
    objCombobox.Enabled := False;

  objCombobox.ItemIndex := GetItemLocation(objCombobox, sText);
  CenterLabel(objLabel, objCombobox)
end;

procedure TPropertyList.CreateItem(sID, sAddress, sType : String; iBathrooms, iBedrooms, iSize : Integer; rPrice : Real;
 bRent, bSale : Boolean; bEditable : Boolean; sContact, sMapID, sX, sY : String);
begin
  //too make sure there isnt too many things loaded
  if fCounter < fMax then
  begin
  Inc(fCounter);
  fEditable := bEditable;
  //getting the sizes and everything for the groupbox
  objProperty := TGroupBox.Create(fParent);
  objProperty.Visible := False;
  objProperty.Parent := fParent;
  objProperty.Left := 5;
  objProperty.Top := 7 * fCounter + 135 * (fCounter - 1);
  //ShowMessage(IntToStr(fCounter) + ' ' + IntToStr(fMax) + ' ' + IntToStr(objProperty.Top)+ ' ' + IntToStr());
  objProperty.Height := 135;
  objProperty.Width := 400;
  objProperty.Anchors := [TAnchorKind.akLeft, TAnchorKind.akRight, TAnchorKind.akTop];
  objProperty.Name := 'Property' + IntToStr(fCounter);


  //doing the visuals and inside stuff of the groupbox to display everything on the property \/
  objProperty.Caption := inttostr(fCounter) + '.)   ' + sID + ' (' + sAddress + ')';
  objProperty.DefaultHeaderFont := False;
  objProperty.StyleElements := [seClient, seBorder];
  if bEditable = False then
    objProperty.HeaderFont.Color := clLtGray
  else
    objProperty.HeaderFont.Color := clYellow;

  CreateComboBox('Type', 'Property Type', sType, 5, 35, 120, objProperty);
  CreateSpinEdit('Bathrooms', 'Bathrooms', iBathrooms, 145, 35, 37, 99, objProperty);
  CreateSpinEdit('Bedrooms', 'Bedrooms', iBedrooms, 205, 35, 37, 99, objProperty);
  CreateSpinEdit('Size', 'Size (m^2)', iSize, 257, 35, 85, 100000000, objProperty);
  CreateSpinEdit('Price', 'Price', Ceil(rPrice), 5, 80, 120, 1000000000, objProperty);
  CreateCheckBox('Rent', 'Rent', bRent , 120, 80, objProperty);
  CreateCheckBox('ForSale', 'For sale', bSale , 180, 80, objProperty);
  if sContact = '' then
    CreateLabel('Contact', 'No contact info', 5, 117, objProperty)
  else
    CreateLabel('Contact', 'Contact info: ' + sContact, 5, 117, objProperty);

  if bEditable = True then
    CreateButton(sID, 'Save Changes', 260, 90, objProperty);

  sMapID := StringReplace(sMapID, '.', '_', [rfReplaceAll]);
  CreateBitBtn(sMapID + 'X' + sX + 'Y' + sY, '', 340, 60, objProperty);

  objProperty.Width := fParent.ClientWidth - 10;
  end
else
  begin
    if fLoad = False then
      begin
        CreateButtonLoad('Load' + IntToStr(fCounter), 'Load more', fParent.Width div 2 ,135 * (fCounter) + 7 * (fCounter + 1) , fParent);
        fLoad := True;
      end;
  end;
end;

procedure TPropertyList.CreateLabel(sName, sCaption: String; X, Y: Integer;
  grpParent: TGroupBox);
var
  objLabel : tLabel;
begin
  objLabel := TLabel.Create(grpParent);
  objLabel.Parent := grpParent;
  objLabel.Name := 'lbl' + sName;
  objLabel.Left := X;
  objLabel.Top := Y;
  objLabel.Anchors := [TAnchorKind.akLeft, TAnchorKind.akBottom];
  objLabel.Caption := sCaption;
end;

procedure TPropertyList.CreateSpinEdit(sName, sCaption: String; iValue, X, Y,
  iWidth, iMax: Integer; grpParent: TGroupBox);
var
  objLabel : TLabel;
  objSpinEdit : TSpinEdit;
begin
  objLabel := TLabel.Create(grpParent);
  objLabel.Parent := grpParent;
  objLabel.Name := 'lbl' + sName;
  objLabel.Anchors := [];
  objLabel.Caption := sCaption;
  if fEditable = False then
    objLabel.Enabled := False;

  objSpinEdit := TSpinEdit.Create(grpParent);
  objSpinEdit.Parent := grpParent;
  objSpinEdit.Name := 'spn' + sName;
  objSpinEdit.Width := iWidth;
  objSpinEdit.Left := X;
  objSpinEdit.Top := Y;
  objSpinEdit.Value := iValue;
  objSpinEdit.MaxValue := iMax;
  objSpinEdit.Anchors := [];
  if fEditable = False then
    objSpinEdit.Enabled := False;

  CenterLabel(objLabel, objSpinEdit)

end;

function TPropertyList.getCounter: Integer;
begin
  Result := fCounter;
end;

procedure TPropertyList.Visible;
var
  I : Integer;
begin
  for I := 1 to fCounter do
    TGroupBox(fParent.FindComponent('Property' + IntToStr(I))).Visible := True;
end;

end.

