unit Map_u;

interface

uses Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Graphics, System.SysUtils, System.Classes, System.Generics.Collections, System.UITypes,
  Vcl.Controls, Winapi.Windows, Winapi.Messages, System.Variants, Vcl.Forms, Vcl.ComCtrls, Vcl.Buttons, User_u, Hash,
  Data.DB, Data.Win.ADODB;

type
  TMap = class(TObject)
    private
      fParent : TGroupBox;
      fMapSize : Integer;
      fMapName, fTilePaintCode : String;
      fPropertyID, fPropertyAddress, fType, fPrice, fSize, fX, fY : TLabeledEdit;
      fRent : TCheckBox;
      fNoInfo : TLabel;
      procedure InitializeBlocks;
      procedure OnClickProperty(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
      procedure OnClickPaint(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
      procedure OnClickReturn(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
      procedure OnEnterPaint(Sender : TObject);
      procedure Save;
      procedure ChangeVisibility(bVisible : Boolean);
    public
      constructor Create(grpParent : TGroupBox; tblAllProperties : TADOTable);
      procedure Build;
      procedure EnablePaint(Sender : TObject);
      procedure DisablePaint(Sender : TObject);
      procedure ReturnCoords(Sender : TObject);
      procedure Populate(sFileName : String);
      procedure Resize;
      procedure SetTilePaint(sTilePaintCode : String);
      procedure setOutput(edtPropertyID, edtPropertyAddress, edtType, edtPrice, edtSize : TLabeledEdit; chkRent : TCheckBox; lblNoInfo : TLabel);
      procedure setCoordOutput(edtX, edtY: TLabeledEdit);
      procedure GenerateNewMap;
      procedure PopulateCoord(sMap : String; iX, iY: Integer);
      procedure FillCmbMaps(cmbFill : TComboBox);
      function getMapName : String;
      function getMapSize : Integer;
      var
        tblProperties : TADOTable;
  end;

type
  TMapBlock = class(TObject)
    private
      fBrushColour, fPenColour : TColor;
      constructor Create(cBrushColour, cPenColour : TColor);
  end;

var
  objTile : TShape;
  //using a dictionary because i can then store a key value to easily pull the colour values from using the key
  dictBlocks : TDictionary<String, TMapBlock>;
  objMapBlock : TMapBlock;
  objTilePaint : TMapBlock;
  arrMapSave : array of array of String;

implementation

{ TMap }

procedure TMap.Build;
var
  I, K, iWidth : Integer;
begin
  iWidth := fParent.Width div fMapSize;

  SetLength(arrMapSave, fMapSize, fMapSize);

  for I := 0 to fMapSize do
    for K := 0 to fMapSize do
      begin
        objTile := TShape.Create(fParent);
        objTile.Parent := fParent;
        objTile.Name := 'm' + IntToStr(I) + '_' + IntToStr(K);
        objTile.Left := iWidth * I;
        objTile.Top := iWidth * K;
        objTile.Width := iWidth;
        objTile.Height := iWidth;
        objTile.Pen.Width := 1;

        //removes capture mouse for a very infuriating bug that took me like a whole day to solve
        objTile.ControlStyle := objTile.ControlStyle - [csCaptureMouse];
      end;

end;

procedure TMap.ChangeVisibility(bVisible: Boolean);
begin
  fPropertyID.Visible := bVisible;
  fPropertyAddress.Visible := bVisible;
  fType.Visible := bVisible;
  fPrice.Visible := bVisible;
  fSize.Visible := bVisible;
  fRent.Visible := bVisible;

  if bVisible = True then
    fNoInfo.Visible := False
  else
    fNoInfo.Visible := True;
end;

constructor TMap.Create(grpParent : TGroupBox; tblAllProperties : TADOTable);
begin
  tblProperties := tblAllProperties;
  fParent := grpParent;
  fMapSize := 40;

  objTilePaint := TMapBlock.Create(clWhite, clWhite);

  InitializeBlocks;

  //set tile paint after initializing blocks because the tiles wont exist to be compared to
  SetTilePaint('0');
end;

procedure TMap.DisablePaint(Sender : TObject);
var
  tfMap : TextFile;
  sLine, sFileName : String;
  I, K : Integer;
  objBlock : TShape;
begin
  Save;

  K := 0;
  sFileName := fMapName;

  AssignFile(tfMap, fMapName);
  if FileExists(sFileName) then
    begin
      Reset(tfMap);
      while not Eof(tfMap) do
        begin
          Readln(tfMap, sLine);

          for I := 0 to Length(sLine) - 1 do
            begin
              objBlock := TShape(fParent.FindComponent('m' + IntToStr(I) + '_' + IntToStr(K)));
              //gets the value from the textfile
              //looks at the value in the dictionary
              //uses that to determine the colour.
              if (sLine[I + 1] = 'P') OR (sLine[I + 1] = 'X') then
                begin
                  objBlock.OnMouseDown := OnClickProperty;
                  objBlock.OnMouseEnter := nil;
                end
              else
                begin
                  objBlock.OnMouseEnter := nil;
                  objBlock.OnMouseDown := nil;
                end;
            end;

          Inc(K);
        end;

      CloseFile(tfMap);
    end
  else
    MessageDlg('Map not found cannot generate world.', mtError, [mbOK], 0);
end;

procedure TMap.OnClickPaint;
var
  iX, iY, iPos : Integer;
  sName : String;
begin
//
  TShape(Sender).Brush.Color := objTilePaint.fBrushColour;
  TShape(Sender).Pen.Color := objTilePaint.fPenColour;

  sName := TShape(Sender).Name;
  iPos := Pos('_', sName);                          //-2 to account for the m at the start
  iX := StrToInt(Copy(sName, 2, iPos - 2));
  iY := StrToInt(Copy(sName, iPos + 1));

  arrMapSave[iX][iY] := fTilePaintCode;
end;

procedure TMap.OnEnterPaint;
var
  iX, iY, iPos : Integer;
  sName : String;
begin
  if GetAsyncKeyState(VK_LBUTTON) < 0 then
    begin
      //sets the object to the selected tile paint color
      TShape(Sender).Brush.Color := objTilePaint.fBrushColour;
      TShape(Sender).Pen.Color := objTilePaint.fPenColour;

      sName := TShape(Sender).Name;
      iPos := Pos('_', sName);                          //-2 to account for the m at the start
      iX := StrToInt(Copy(sName, 2, iPos - 2));
      iY := StrToInt(Copy(sName, iPos + 1));

      arrMapSave[iX][iY] := fTilePaintCode;
    end;
end;

procedure TMap.EnablePaint(Sender : TObject);
var
  MapBlock : TShape;
  I, K : Integer;
begin
//
  for I := 0 to fMapSize - 1 do
    for K := 0 to fMapSize - 1 do
      begin
        MapBlock := TShape(fParent.FindComponent('m' + IntToStr(I) + '_' + IntToStr(K)));
        MapBlock.OnMouseEnter := OnEnterPaint;
        MapBlock.OnMouseDown := OnClickPaint;
      end;
end;

procedure TMap.FillCmbMaps(cmbFill: TComboBox);
var
  sFilePath, sFileName : String;
  iCounter : Integer;
  bFound : Boolean;
begin
  bFound := True;
  iCounter := 0;

  while bFound = True do
    begin
      Inc(iCounter);

      if iCounter < 10 then
        sFileName := 'M00' + IntToStr(iCounter) + '.txt'
      else
        if iCounter < 100 then
          sFileName := 'M0' + IntToStr(iCounter) + '.txt'
        else
          sFileName := 'M' + IntToStr(iCounter) + '.txt';

      sFilePath := FileSearch(sFileName, GetCurrentDir);
      if NOT (sFilePath = '') then
        begin
          bFound := True;

          cmbFill.Items.Add(sFileName);
        end
      else
        bFound := False;
    end;

end;

procedure TMap.GenerateNewMap;
var
  tfMap : TextFile;
  sFilePath, sFileName, sLine : String;
  iCounter, I : Integer;
  bFound : Boolean;
begin
  bFound := True;
  iCounter := 0;

  while bFound = True do
    begin
      Inc(iCounter);

      if iCounter < 10 then
        sFileName := 'M00' + IntToStr(iCounter) + '.txt'
      else
        if iCounter < 100 then
          sFileName := 'M0' + IntToStr(iCounter) + '.txt'
        else
          sFileName := 'M' + IntToStr(iCounter) + '.txt';

      sFilePath := FileSearch(sFileName, GetCurrentDir);
      if sFilePath = '' then
        begin
          //if here it means file was not found which means i can use this for the new map.
          fMapName := sFileName;
          bFound := False;

          AssignFile(tfMap, fMapName);
          Rewrite(tfMap);

          sLine := '';

          for I := 1 to fMapSize do
            sLine := sLine + '0';

          for I := 1 to fMapSize do
            Writeln(tfMap, sLine);

          CloseFile(tfMap);
        end
      else
        begin
          bFound := True;
        end;
    end;

  Populate(sFileName);
end;

procedure TMap.OnClickProperty;
var
  iX, iY, iPos : Integer;
  sName : String;
begin
// when you click on a property do x
  sName := TShape(Sender).Name;
  iPos := Pos('_', sName);
  iX := StrToInt(Copy(sName, 2, iPos - 2));
  iY := StrToInt(Copy(sName, iPos + 1));

  tblProperties.First;
  while not tblProperties.Eof do
    begin
      if (tblProperties['X'] = iX) AND (tblProperties['Y'] = iY) AND (fMapName = tblProperties['MapID']) then
        begin
          ChangeVisibility(True);
          fPropertyID.Text := tblProperties['PropertyID'];
          fPropertyAddress.Text := tblProperties['PropertyAddress'];
          fType.Text := tblProperties['PropertyType'];
          fPrice.Text := FloatToStrF(tblProperties['Price'], ffCurrency, 8, 2);
          fSize.Text := IntToStr(tblProperties['Size']) + ' meters squared';

          if tblProperties['Rent'] = True then
            fRent.Checked := True
          else
            fRent.Checked := False;

          Exit;
        end;

      tblProperties.Next;
    end;

  //no need for an if statement because of the exit procedure
  ChangeVisibility(False);

end;

procedure TMap.OnClickReturn(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  iX, iY, iPos : Integer;
  sName : String;
begin
// when you click on a property do x
  sName := TShape(Sender).Name;
  iPos := Pos('_', sName);
  iX := StrToInt(Copy(sName, 2, iPos - 2));
  iY := StrToInt(Copy(sName, iPos + 1));

  fX.Text := IntToStr(iX);
  fY.Text := IntToStr(iY);
end;

function TMap.getMapName: String;
begin
  Result := fMapName;
end;

function TMap.getMapSize: Integer;
begin
  Result := fMapSize;
end;

procedure TMap.InitializeBlocks;
begin
  dictBlocks := TDictionary<string, TMapBlock>.Create;
  //using numbers for the key values
  //0 = water
  //1 = ground
  //2 = road
  //3 = property on sale
  //4 = property not on sale

  //water
  objMapBlock := TMapBlock.Create(clMenuHighlight, clBlue);
  dictBlocks.Add('W', objMapBlock);

  //ground
  objMapBlock := TMapBlock.Create(clWebForestGreen, clWebDarkgreen);
  dictBlocks.Add('0', objMapBlock);

  //road
  objMapBlock := TMapBlock.Create(clGrayText, clBlack);
  dictBlocks.Add('R', objMapBlock);

  //property for sale
  objMapBlock := TMapBlock.Create(clWebChocolate, clLime);
  dictBlocks.Add('P', objMapBlock);

  //shop
  objMapBlock := TMapBlock.Create(clFuchsia, clPurple);
  dictBlocks.Add('S', objMapBlock);

  //next two just for visual stuff
  //gray out
  objMapBlock := TMapBlock.Create(clGray, clDkGray);
  dictBlocks.Add('D', objMapBlock);

  //highlight gold
  objMapBlock := TMapBlock.Create(clYellow, clWebDarkOrange);
  dictBlocks.Add('G', objMapBlock);
end;

procedure TMap.Populate(sFileName : String);
var
  tfMap : TextFile;
  sLine : String;
  I, K : Integer;
  objBlock : TShape;
begin
  K := 0;

  fMapName := sFileName;
  AssignFile(tfMap, fMapName);

  if FileExists(fMapName) then
    begin
      Reset(tfMap);
      while not Eof(tfMap) do
        begin
          Readln(tfMap, sLine);

          for I := 0 to Length(sLine) - 1 do
            begin
              //gets the value from the textfile
              //looks at the value in the dictionary
              //uses that to determine the colour.
              if dictBlocks.TryGetValue(sLine[I + 1], objMapBlock) = True then
                begin
                  objBlock := TShape(fParent.FindComponent('m' + IntToStr(I) + '_' + IntToStr(K)));
                  objBlock.Brush.Color := objMapBlock.fBrushColour;
                  objBlock.Pen.Color := objMapBlock.fPenColour;
                  if (sLine[I + 1] = 'P') OR (sLine[I + 1] = 'X') then
                    begin
                      objBlock.OnMouseDown := OnClickProperty;
                    end;

                end;

              arrMapSave[I][K] := sLine[I + 1];
            end;

          Inc(K);
        end;

      CloseFile(tfMap);
    end
  else
    MessageDlg('Map not found cannot generate world.', mtError, [mbOK], 0);
end;

procedure TMap.PopulateCoord(sMap : String; iX, iY: Integer);
var
  tfMap : TextFile;
  sLine : String;
  I, K : Integer;
  objBlock : TShape;
begin
  K := 0;

  fMapName := sMap;
  AssignFile(tfMap, fMapName);

  if FileExists(fMapName) then
    begin
      Reset(tfMap);
      while not Eof(tfMap) do
        begin
          Readln(tfMap, sLine);

          for I := 0 to Length(sLine) - 1 do
            begin
              //gets the value from the textfile
              //looks at the value in the dictionary
              //uses that to determine the colour.
              if dictBlocks.TryGetValue(sLine[I + 1], objMapBlock) = True then
                begin


                  objBlock := TShape(fParent.FindComponent('m' + IntToStr(I) + '_' + IntToStr(K)));
                  if (I = iX) AND (K = iY) then
                    begin
                      objBlock.Brush.Color := clYellow;
                      objBlock.Pen.Color := clOlive;
                    end
                  else
                    begin
                      objBlock.Brush.Color := objMapBlock.fBrushColour;
                      objBlock.Pen.Color := objMapBlock.fPenColour;
                    end;
                  if (sLine[I + 1] = 'P') OR (sLine[I + 1] = 'X') then
                    begin
                      objBlock.OnMouseDown := OnClickProperty;
                    end;

                end;

              arrMapSave[I][K] := sLine[I + 1];
            end;

          Inc(K);
        end;

      CloseFile(tfMap);
    end
  else
    MessageDlg('Map not found cannot generate world.', mtError, [mbOK], 0);

end;

procedure TMap.Resize;
var
  I, K, iWidth : Integer;
  MapSegment : TShape;
begin
  iWidth := fParent.Width div fMapSize;

  for I := 0 to fMapSize do
    for K := 0 to fMapSize do
      begin
        MapSegment := TShape(fParent.FindComponent('m' + IntToStr(I) + '_' + IntToStr(K)));
        MapSegment.Left := iWidth * I;
        MapSegment.Top := iWidth * K;
        MapSegment.Width := iWidth;
        MapSegment.Height := iWidth;
      end;
end;

procedure TMap.ReturnCoords(Sender: TObject);
var
  tfMap : TextFile;
  sLine : String;
  I, K : Integer;
  objBlock : TShape;
  bFound : Boolean;
  sReturnID : String;
begin
  K := 0;
  sReturnID := tblProperties['PropertyID'];
  AssignFile(tfMap, fMapName);

  if FileExists(fMapName) then
    begin
      Reset(tfMap);
      while not Eof(tfMap) do
        begin
          Readln(tfMap, sLine);

          for I := 0 to Length(sLine) - 1 do
            begin
              //gets the value from the textfile
              //looks at the value in the dictionary
              //uses that to determine the colour.
              if dictBlocks.TryGetValue(sLine[I + 1], objMapBlock) = True then
                begin
                  objBlock := TShape(fParent.FindComponent('m' + IntToStr(I) + '_' + IntToStr(K)));
                  objBlock.Brush.Color := objMapBlock.fBrushColour;
                  objBlock.Pen.Color := objMapBlock.fPenColour;


                  if (sLine[I + 1] = 'P') then
                    begin
                      tblProperties.First;
                      bFound := False;

                      while not tblProperties.Eof do
                      begin
                        if (tblProperties['MapID'] = fMapName) AND (tblProperties['X'] = I) AND (tblProperties['Y'] = K) then
                          begin
                            objBlock.Brush.Color := clGrayText;
                            objBlock.Pen.Color := clDkGray;
                            bFound := True;
                            Break;
                          end;

                        tblProperties.Next;
                      end;

                      if bFound = False then
                        objBlock.OnMouseDown := OnClickReturn;
                    end;

                end;

              arrMapSave[I][K] := sLine[I + 1];
            end;

          Inc(K);
        end;
      //returns to the property the user selected
      CloseFile(tfMap);

      tblProperties.First;
      while not tblProperties.Eof do
        begin
          if tblProperties['PropertyID'] = sReturnID then
            Break;
          tblProperties.Next;
        end;
    end
  else
    MessageDlg('Map not found cannot generate world.', mtError, [mbOK], 0);
end;

procedure TMap.Save;
var
  I, K : Integer;
  tfMap : TextFile;
  sLine : String;
begin
  AssignFile(tfMap, fMapName);
  Rewrite(tfMap);

  // -1 because it returns 40 but
  // the array goes from 0-39
  for I := 0 to Length(arrMapSave) - 1 do
    begin
      sLine := '';
      for K := 0 to Length(arrMapSave) - 1 do
        begin                     //just flipped it and it work and i dont wanna test why lol
          sLine := sLine + arrMapSave[K][I];
        end;

        Writeln(tfMap, sLine);
    end;

  CloseFile(tfMap);
end;

procedure TMap.setCoordOutput(edtX, edtY: TLabeledEdit);
begin
  fX := edtX;
  fY := edtY;
end;

procedure TMap.setOutput(edtPropertyID, edtPropertyAddress, edtType, edtPrice,
  edtSize: TLabeledEdit; chkRent: TCheckBox; lblNoInfo : TLabel);
begin
  fPropertyID := edtPropertyID;
  fPropertyAddress := edtPropertyAddress;
  fType := edtType;
  fPrice := edtPrice;
  fSize := edtSize;
  fRent := chkRent;
  fNoInfo := lblNoInfo;
end;

procedure TMap.SetTilePaint(sTilePaintCode : String);
begin
  //sets the tile you use to paint
  fTilePaintCode := sTilePaintCode;

  if dictBlocks.TryGetValue(sTilePaintCode, objMapBlock) = True then
    begin
      objTilePaint.fBrushColour := objMapBlock.fBrushColour;
      objTilePaint.fPenColour := objMapBlock.fPenColour;
    end;
end;

{ TMapBlock }

constructor TMapBlock.Create(cBrushColour, cPenColour : TColor);
begin
  fBrushColour := cBrushColour;
  fPenColour := cPenColour;
end;

end.
