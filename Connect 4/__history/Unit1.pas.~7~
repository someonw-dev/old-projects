unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Math, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmConnect4 = class(TForm)
    pgcConnect4: TPageControl;
    tsMenu: TTabSheet;
    tsSaveSelect: TTabSheet;
    tsConnect4: TTabSheet;
    btnPlay: TButton;
    btnSettings: TButton;
    btnExit: TButton;
    btnSave1: TButton;
    btnSave2: TButton;
    btnSave3: TButton;
    imgRowA7: TImage;
    imgRowA6: TImage;
    imgRowA5: TImage;
    imgRowA4: TImage;
    imgRowA3: TImage;
    imgRowA2: TImage;
    imgRowB2: TImage;
    imgRowB3: TImage;
    imgRowB4: TImage;
    imgRowB5: TImage;
    imgRowB7: TImage;
    imgRowC6: TImage;
    imgRowC7: TImage;
    imgRowC5: TImage;
    imgRowC4: TImage;
    imgRowC3: TImage;
    imgRowC2: TImage;
    imgRowD6: TImage;
    imgRowD7: TImage;
    imgRowD5: TImage;
    imgRowD4: TImage;
    imgRowD3: TImage;
    imgRowD2: TImage;
    imgRowE3: TImage;
    imgRowE2: TImage;
    imgRowE4: TImage;
    imgRowE5: TImage;
    imgRowE6: TImage;
    imgRowE7: TImage;
    imgRowF3: TImage;
    imgRowF2: TImage;
    imgRowF4: TImage;
    imgRowF5: TImage;
    imgRowF6: TImage;
    imgRowF7: TImage;
    imgRowG6: TImage;
    imgRowG7: TImage;
    imgRowG5: TImage;
    imgRowG4: TImage;
    imgRowG3: TImage;
    imgRowG2: TImage;
    imgRowB6: TImage;
    imgButton1: TImage;
    imgButton2: TImage;
    imgButton3: TImage;
    imgButton4: TImage;
    imgButton5: TImage;
    imgButton6: TImage;
    imgButton7: TImage;
    sBlueDisplay: TShape;
    sBlue1: TShape;
    sBlue2: TShape;
    sBlue3: TShape;
    sRed1: TShape;
    sRed2: TShape;
    sRed3: TShape;
    sBlue7: TShape;
    sRed10: TShape;
    sBlue8: TShape;
    sBlue10: TShape;
    sBlue11: TShape;
    sBlue12: TShape;
    sBlue13: TShape;
    sBlue14: TShape;
    sBlue16: TShape;
    sBlue18: TShape;
    sBlue19: TShape;
    sBlue20: TShape;
    sBlue17: TShape;
    sBlue9: TShape;
    sBlue6: TShape;
    sBlue5: TShape;
    sBlue4: TShape;
    sBlue21: TShape;
    sRed5: TShape;
    sBlue15: TShape;
    sRed15: TShape;
    sRed14: TShape;
    sRed12: TShape;
    sRed20: TShape;
    sRed19: TShape;
    sRed16: TShape;
    sRed13: TShape;
    sRed11: TShape;
    sRed9: TShape;
    sRed8: TShape;
    sRed18: TShape;
    sRed17: TShape;
    sRed7: TShape;
    sRed6: TShape;
    sRed4: TShape;
    sRed21: TShape;
    sBlue22: TShape;
    sRed22: TShape;
    Image1: TImage;
    sRedDisplay: TShape;
    Label1: TLabel;
    lblTitleCard: TLabel;
    tTitleCardLoop: TTimer;
    lblSplashText: TLabel;
    imgBackground: TImage;
    imgBackgroundSaveSelect: TImage;
    imgBackgroundConnect4: TImage;
    lblTurnDisplay: TLabel;
    Image2: TImage;
    btnClearSave1: TButton;
    btnClearSave2: TButton;
    btnClearSave3: TButton;
    lblPlayer1: TLabel;
    lblPlayer2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure imgButton1Click(Sender: TObject);
    procedure btnSave1Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure imgButton2Click(Sender: TObject);
    procedure imgButton3Click(Sender: TObject);
    procedure imgButton4Click(Sender: TObject);
    procedure imgButton5Click(Sender: TObject);
    procedure imgButton6Click(Sender: TObject);
    procedure imgButton7Click(Sender: TObject);
    procedure tTitleCardLoopTimer(Sender: TObject);
    procedure btnClearSave1Click(Sender: TObject);
    procedure btnClearSave2Click(Sender: TObject);
    procedure btnClearSave3Click(Sender: TObject);
    procedure btnSave2Click(Sender: TObject);
    procedure btnSave3Click(Sender: TObject);
    procedure Save;
    procedure ClearBoard;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConnect4: TfrmConnect4;
  iTurn, iDiagonalUp, iDiagonalDown, iHorisontal, iVertical, iTitleCounter, iBackgroundCounter, iDefaultPos, iTitleDistance, X, K, iCurrentSave, iWinsPlayer1, iWinsPlayer2  : Integer;
  bStartBlue, bBlueTurn, bSaveSlot1, bSaveSlot2, bSaveSlot3, bSavePos, bChangeDirectionTCL, bReset : Boolean;
  sPlayer1, sPlayer2 : string;
  cCheckCharB, cCheckCharF : Char;
  arrRowA : array[1..7] of string;
  arrRowB : array[1..7] of string;
  arrRowC : array[1..7] of string;
  arrRowD : array[1..7] of string;
  arrRowE : array[1..7] of string;
  arrRowF : array[1..7] of string;
  arrRowG : array[1..7] of string;

implementation

{$R *.dfm}

procedure TfrmConnect4.Save;
var
  tfSaves : TextFile;
  sSaveInfo, sSave1, sSave2, sSave3, sLine : string;
  A, B, C, D, E, F, G : Integer;
begin
  AssignFile(tfSaves, 'Saves.txt');

  try
    Reset(tfSaves)
  except
    ShowMessage('File doesn''t exist!');
    Exit;
  end;

  case iCurrentSave of
    1:  begin
          while NOT EoF(tfSaves) do
            begin
              Readln(tfSaves, sSaveInfo);
              if sSaveInfo[1] = '2' then
                sSave2 := sSaveInfo;
              if sSaveInfo[1] = '3' then
                sSave3 := sSaveInfo;
            end;

          CloseFile(tfSaves);
          Rewrite(tfSaves);

          sLine := '1,1,' + sPlayer1 + ',' + IntToStr(iWinsPlayer1) + ',' + sPlayer2 + ',' + IntToStr(iWinsPlayer2) + ',';

          sLine := sLine + 'A,';
          for A := 2 to 7 do
              sLine := sLine + arrRowA[A] + ',';

          sLine := sLine + 'B,';
          for B := 2 to 7 do
              sLine := sLine + arrRowB[B] + ',';

          sLine := sLine + 'C,';
          for C := 2 to 7 do
              sLine := sLine + arrRowC[C] + ',';

          sLine := sLine + 'D,';
          for D := 2 to 7 do
              sLine := sLine + arrRowD[D] + ',';

          sLine := sLine + 'E,';
          for E := 2 to 7 do
              sLine := sLine + arrRowE[E] + ',';

          sLine := sLine + 'F,';
          for F := 2 to 7 do
              sLine := sLine + arrRowF[F] + ',';

          sLine := sLine + 'G,';
          for G := 2 to 7 do
              sLine := sLine + arrRowG[G] + ',';

          Writeln(tfSaves, sLine);
          Writeln(tfSaves, sSave2);
          Writeln(tfSaves, sSave3);

          CloseFile(tfSaves);
          btnSave2.Caption := 'Save 1 [' + sPlayer1 + '&' + sPlayer2 + ']';
        end;
    2:  begin
          while NOT EoF(tfSaves) do
            begin
              Readln(tfSaves, sSaveInfo);
              if sSaveInfo[1] = '1' then
                sSave1 := sSaveInfo;
              if sSaveInfo[1] = '3' then
                sSave3 := sSaveInfo;
            end;

          CloseFile(tfSaves);
          Rewrite(tfSaves);

          sLine := '2,1,' + sPlayer1 + ',' + IntToStr(iWinsPlayer1) + ',' + sPlayer2 + ',' + IntToStr(iWinsPlayer2) + ',';

          sLine := sLine + 'A,';
          for A := 2 to 7 do
              sLine := sLine + arrRowA[A] + ',';

          sLine := sLine + 'B,';
          for B := 2 to 7 do
              sLine := sLine + arrRowB[B] + ',';

          sLine := sLine + 'C,';
          for C := 2 to 7 do
              sLine := sLine + arrRowC[C] + ',';

          sLine := sLine + 'D,';
          for D := 2 to 7 do
              sLine := sLine + arrRowD[D] + ',';

          sLine := sLine + 'E,';
          for E := 2 to 7 do
              sLine := sLine + arrRowE[E] + ',';

          sLine := sLine + 'F,';
          for F := 2 to 7 do
              sLine := sLine + arrRowF[F] + ',';

          sLine := sLine + 'G,';
          for G := 2 to 7 do
              sLine := sLine + arrRowG[G] + ',';

          Writeln(tfSaves, sSave1);
          Writeln(tfSaves, sLine);
          Writeln(tfSaves, sSave3);

          CloseFile(tfSaves);
          btnSave1.Caption := 'Save 2 [' + sPlayer1 + '&' + sPlayer2 + ']';
        end;
    3:  begin
          while NOT EoF(tfSaves) do
            begin
              Readln(tfSaves, sSaveInfo);
              if sSaveInfo[1] = '1' then
                sSave1 := sSaveInfo;
              if sSaveInfo[1] = '2' then
                sSave2 := sSaveInfo;
            end;

          CloseFile(tfSaves);
          Rewrite(tfSaves);

          sLine := '3,1,' + sPlayer1 + ',' + IntToStr(iWinsPlayer1) + ',' + sPlayer2 + ',' + IntToStr(iWinsPlayer2) + ',';

          sLine := sLine + 'A,';
          for A := 2 to 7 do
              sLine := sLine + arrRowA[A] + ',';

          sLine := sLine + 'B,';
          for B := 2 to 7 do
              sLine := sLine + arrRowB[B] + ',';

          sLine := sLine + 'C,';
          for C := 2 to 7 do
              sLine := sLine + arrRowC[C] + ',';

          sLine := sLine + 'D,';
          for D := 2 to 7 do
              sLine := sLine + arrRowD[D] + ',';

          sLine := sLine + 'E,';
          for E := 2 to 7 do
              sLine := sLine + arrRowE[E] + ',';

          sLine := sLine + 'F,';
          for F := 2 to 7 do
              sLine := sLine + arrRowF[F] + ',';

          sLine := sLine + 'G,';
          for G := 2 to 7 do
              sLine := sLine + arrRowG[G] + ',';

          Writeln(tfSaves, sSave1);
          Writeln(tfSaves, sSave2);
          Writeln(tfSaves, sLine);

          CloseFile(tfSaves);
          btnSave3.Caption := 'Save 1 [' + sPlayer1 + '&' + sPlayer2 + ']';
        end;
  end;
end;

procedure TfrmConnect4.ClearBoard;
var 
  I, K : Integer;
begin
  iTurn := 1;
  
  for I := 1 to 22 do
    begin
      TEdit(FindComponent('sBlue'+IntToStr(I))).Left := -100;

      TEdit(FindComponent('sRed'+IntToStr(I))).Left := -100;
    end;

  for K := 2 to 7 do
    begin
      arrRowA[K] := '0';
      arrRowB[K] := '0';
      arrRowC[K] := '0';
      arrRowD[K] := '0';
      arrRowE[K] := '0';
      arrRowF[K] := '0';
      arrRowG[K] := '0';
    end;

  lblPlayer1.Caption := sPlayer1 + ': ' + IntToStr(iWinsPlayer1);
  lblPlayer2.Caption := sPlayer2 + ': ' + IntToStr(iWinsPlayer2);
end;

procedure TfrmConnect4.btnPlayClick(Sender: TObject);
begin
  pgcConnect4.ActivePageIndex := 1;
  tsSaveSelect.Enabled := true;
end;

procedure TfrmConnect4.btnClearSave1Click(Sender: TObject);
var
  tfSaves : TextFile;
  sSaveInfo, sSave2, sSave3 : string;
begin
  AssignFile(tfSaves, 'Saves.txt');

  try
    Reset(tfSaves)
  except
    ShowMessage('File doesn''t exist!');
    Exit;
  end;

  while NOT EoF(tfSaves) do
    begin
      Readln(tfSaves, sSaveInfo);
      if sSaveInfo[1] = '2' then
        sSave2 := sSaveInfo;
      if sSaveInfo[1] = '3' then
        sSave3 := sSaveInfo;
    end;

  CloseFile(tfSaves);
  Rewrite(tfSaves);

  Writeln(tfSaves, '1,0,Player 1,0,Player 2,0,A,0,0,0,0,0,0,B,0,0,0,0,0,0,C,0,0,0,0,0,0,D,0,0,0,0,0,0,E,0,0,0,0,0,0,F,0,0,0,0,0,0,G,0,0,0,0,0,0,');
  Writeln(tfSaves, sSave2);
  Writeln(tfSaves, sSave3);

  CloseFile(tfSaves);
  btnSave1.Caption := 'Save 1 [Empty]';

  bSaveSlot1 := False;
end;

procedure TfrmConnect4.btnClearSave2Click(Sender: TObject);
var
  tfSaves : TextFile;
  sSaveInfo, sSave1, sSave3 : string;
begin
  AssignFile(tfSaves, 'Saves.txt');

  try
    Reset(tfSaves)
  except
    ShowMessage('File doesn''t exist!');
    Exit;
  end;

  while NOT EoF(tfSaves) do
    begin
      Readln(tfSaves, sSaveInfo);

      if sSaveInfo[1] = '1' then
        sSave1 := sSaveInfo;
      if sSaveInfo[1] = '3' then
        sSave3 := sSaveInfo;
    end;

  CloseFile(tfSaves);
  Rewrite(tfSaves);

  Writeln(tfSaves, sSave1);
  Writeln(tfSaves, '2,0,Player 1,0,Player 2,0,A,0,0,0,0,0,0,B,0,0,0,0,0,0,C,0,0,0,0,0,0,D,0,0,0,0,0,0,E,0,0,0,0,0,0,F,0,0,0,0,0,0,G,0,0,0,0,0,0,');
  Writeln(tfSaves, sSave3);

  CloseFile(tfSaves);
  btnSave2.Caption := 'Save 2 [Empty]';

  bSaveSlot2 := False;
end;

procedure TfrmConnect4.btnClearSave3Click(Sender: TObject);
var
  tfSaves : TextFile;
  sSaveInfo, sSave1, sSave2 : string;
begin
  AssignFile(tfSaves, 'Saves.txt');

  try
    Reset(tfSaves)
  except
    ShowMessage('File doesn''t exist!');
    Exit;
  end;

  while NOT EoF(tfSaves) do
    begin
      Readln(tfSaves, sSaveInfo);

      if sSaveInfo[1] = '1' then
        sSave1 := sSaveInfo;
      if sSaveInfo[1] = '2' then
        sSave2 := sSaveInfo;
    end;

  CloseFile(tfSaves);
  Rewrite(tfSaves);

  Writeln(tfSaves, sSave1);
  Writeln(tfSaves, sSave2);
  Writeln(tfSaves, '3,0,Player 1,0,Player 2,0,A,0,0,0,0,0,0,B,0,0,0,0,0,0,C,0,0,0,0,0,0,D,0,0,0,0,0,0,E,0,0,0,0,0,0,F,0,0,0,0,0,0,G,0,0,0,0,0,0,');

  CloseFile(tfSaves);
  btnSave3.Caption := 'Save 3 [Empty]';

  bSaveSlot3 := False;
end;

procedure TfrmConnect4.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConnect4.btnSave1Click(Sender: TObject);
var
  tfSaves : TextFile;
  A, B, C, D, E, F, G, iPos, iCounterBlue, iCounterRed : Integer;
  sSaveInfo, sSave : string;
begin
  AssignFile(tfSaves, 'Saves.txt');

  try
    Reset(tfSaves)
  except
    ShowMessage('File doesn''t exist!');
    Exit
  end;

  while NOT EoF(tfSaves) do
    begin
      Readln(tfSaves, sSaveInfo);

      if sSaveInfo[1] = '1' then
        begin
          sSave := sSaveInfo;
        end;
    end;
    
  CloseFile(tfSaves);
  
  iCounterBlue := 1;
  iCounterRed := 1;
  
  //Removes the 1-3 in start
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  iPos := Pos(',', sSave);
  if Copy(sSave, 1, iPos - 1) = '1' then
    bSaveSlot1 := True;
  Delete(sSave, 1, iPos);
  
  if bSaveSlot1 = False then
    begin
      sPlayer1 := InputBox('Player name', 'Please enter player 1 ''s name: ', 'Player 1');
      sPlayer2 := InputBox('Player name', 'Please enter a player 2 ''s name: ', 'Player 2');

      iPos := Pos(',', sSave);
      Delete(sSave, 1, iPos);

      iPos := Pos(',', sSave);
      Delete(sSave, 1, iPos);

      iPos := Pos(',', sSave);
      Delete(sSave, 1, iPos);

      iPos := Pos(',', sSave);
      Delete(sSave, 1, iPos);
    end
  else
    begin
      //Gets Player 1
      iPos := Pos(',', sSave);
      sPlayer1 := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      //Gets Player 1 wins
      iPos := Pos(',', sSave);
      iWinsPlayer1 := StrToInt(Copy(sSave, 1, iPos - 1));
      Delete(sSave, 1, iPos);
      
      //Gets Player 2
      iPos := Pos(',', sSave);
      sPlayer2 := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      //Gets Player 2 wins
      iPos := Pos(',', sSave);
      iWinsPlayer2 := StrToInt(Copy(sSave, 1, iPos - 1));
      Delete(sSave, 1, iPos);
    end;

  //Removes A and pulls RowA save information and enters it into the array
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for A := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowA[A] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);
      
      if arrRowA[A] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowA'+IntToStr(A))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowA'+IntToStr(A))).Top;

          Inc(iCounterBlue);
        end;
      if arrRowA[A] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowA'+IntToStr(A))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowA'+IntToStr(A))).Top;

          Inc(iCounterRed);
        end;
    end;
    
  //B 
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for B := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowB[B] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      if arrRowB[B] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowB'+IntToStr(B))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowB'+IntToStr(B))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowB[B] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowB'+IntToStr(B))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowB'+IntToStr(B))).Top;

          Inc(iCounterRed);
        end;
    end;

  //C 
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for C := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowC[C] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);
      
      if arrRowC[C] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowC'+IntToStr(C))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowC'+IntToStr(C))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowC[C] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowC'+IntToStr(C))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowC'+IntToStr(C))).Top;

          Inc(iCounterRed);
        end;
    end;
    
  //D
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for D := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowD[D] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      if arrRowD[D] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowD'+IntToStr(D))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowD'+IntToStr(D))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowD[D] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowD'+IntToStr(D))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowD'+IntToStr(D))).Top;

          Inc(iCounterRed);
        end;
    end;

  //E
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for E := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowE[E] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      if arrRowE[E] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowE'+IntToStr(E))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowE'+IntToStr(E))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowE[E] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowE'+IntToStr(E))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowE'+IntToStr(E))).Top;

          Inc(iCounterRed);
        end;
    end;

  //F
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for F := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowF[F] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      if arrRowF[F] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowF'+IntToStr(F))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowF'+IntToStr(F))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowF[F] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowF'+IntToStr(F))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowF'+IntToStr(F))).Top;

          Inc(iCounterRed);
        end;
    end;

  //G
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for G := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowG[G] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);
      
      if arrRowG[G] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowG'+IntToStr(G))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowG'+IntToStr(G))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowG[G] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowG'+IntToStr(G))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowG'+IntToStr(G))).Top;

          Inc(iCounterRed);
        end;
    end;

    iTurn := ((iCounterBlue + iCounterRed) div 2) + 1;
  
  if bBlueTurn = True then
    begin
      sRedDisplay.Visible := False;
      sBlueDisplay.Visible := True;

      lblTurnDisplay.Caption := 'Blue''s   turn!';
      lblTurnDisplay.Font.Color := clBlue;
    end
  else
    begin
      sRedDisplay.Visible := True;
      sBlueDisplay.Visible := False;

      lblTurnDisplay.Caption := 'Red''s   turn!';
      lblTurnDisplay.Font.Color := clRed;
    end;

  pgcConnect4.ActivePageIndex := 2;
  tsConnect4.Enabled := True;
  iCurrentSave := 1;
  lblPlayer1.Caption := sPlayer1 + ': ' + IntToStr(iWinsPlayer1);
  lblPlayer2.Caption := sPlayer2 + ': ' + IntToStr(iWinsPlayer2);

end;

procedure TfrmConnect4.btnSave2Click(Sender: TObject);
var
  tfSaves : TextFile;
  A, B, C, D, E, F, G, iPos, iCounterBlue, iCounterRed : Integer;
  sSaveInfo, sSave : string;
begin
  AssignFile(tfSaves, 'Saves.txt');

  try
    Reset(tfSaves)
  except
    ShowMessage('File doesn''t exist!');
    Exit
  end;

  while NOT EoF(tfSaves) do
    begin
      Readln(tfSaves, sSaveInfo);

      if sSaveInfo[1] = '2' then
        begin
          sSave := sSaveInfo;
        end;
    end;
    
  CloseFile(tfSaves);
  
  iCounterBlue := 1;
  iCounterRed := 1;
  
  //Removes the 1-3 in start
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  iPos := Pos(',', sSave);
  if Copy(sSave, 1, iPos - 1) = '1' then
    bSaveSlot1 := True;
  Delete(sSave, 1, iPos);
  
  if bSaveSlot2 = False then
    begin
      sPlayer1 := InputBox('Player name', 'Please enter player 1 ''s name: ', 'Player 1');
      sPlayer2 := InputBox('Player name', 'Please enter a player 2 ''s name: ', 'Player 2');

      iPos := Pos(',', sSave);
      Delete(sSave, 1, iPos);

      iPos := Pos(',', sSave);
      Delete(sSave, 1, iPos);

      iPos := Pos(',', sSave);
      Delete(sSave, 1, iPos);

      iPos := Pos(',', sSave);
      Delete(sSave, 1, iPos);

    end
  else
    begin
      //Gets Player 1
      iPos := Pos(',', sSave);
      sPlayer1 := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      //Gets Player 1 wins
      iPos := Pos(',', sSave);
      iWinsPlayer1 := StrToInt(Copy(sSave, 1, iPos - 1));
      Delete(sSave, 1, iPos);
      
      //Gets Player 2
      iPos := Pos(',', sSave);
      sPlayer2 := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      //Gets Player 2 wins
      iPos := Pos(',', sSave);
      iWinsPlayer2 := StrToInt(Copy(sSave, 1, iPos - 1));
      Delete(sSave, 1, iPos);
    end;
    
  //Removes A and pulls RowA save information and enters it into the array
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for A := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowA[A] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);
      
      if arrRowA[A] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowA'+IntToStr(A))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowA'+IntToStr(A))).Top;

          Inc(iCounterBlue);
        end;
      if arrRowA[A] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowA'+IntToStr(A))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowA'+IntToStr(A))).Top;

          Inc(iCounterRed);
        end;
    end;
    
  //B 
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for B := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowB[B] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      if arrRowB[B] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowB'+IntToStr(B))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowB'+IntToStr(B))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowB[B] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowB'+IntToStr(B))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowB'+IntToStr(B))).Top;

          Inc(iCounterRed);
        end;
    end;

  //C 
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for C := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowC[C] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);
      
      if arrRowC[C] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowC'+IntToStr(C))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowC'+IntToStr(C))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowC[C] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowC'+IntToStr(C))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowC'+IntToStr(C))).Top;

          Inc(iCounterRed);
        end;
    end;
    
  //D
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for D := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowD[D] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      if arrRowD[D] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowD'+IntToStr(D))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowD'+IntToStr(D))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowD[D] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowD'+IntToStr(D))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowD'+IntToStr(D))).Top;

          Inc(iCounterRed);
        end;
    end;

  //E
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for E := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowE[E] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      if arrRowE[E] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowE'+IntToStr(E))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowE'+IntToStr(E))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowE[E] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowE'+IntToStr(E))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowE'+IntToStr(E))).Top;

          Inc(iCounterRed);
        end;
    end;

  //F
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for F := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowF[F] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      if arrRowF[F] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowF'+IntToStr(F))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowF'+IntToStr(F))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowF[F] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowF'+IntToStr(F))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowF'+IntToStr(F))).Top;

          Inc(iCounterRed);
        end;
    end;

  //G
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for G := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowG[G] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);
      
      if arrRowG[G] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowG'+IntToStr(G))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowG'+IntToStr(G))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowG[G] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowG'+IntToStr(G))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowG'+IntToStr(G))).Top;

          Inc(iCounterRed);
        end;
    end;

    iTurn := (iCounterBlue + iCounterRed) div 2;
  
  if bBlueTurn = True then
    begin
      sRedDisplay.Visible := False;
      sBlueDisplay.Visible := True;

      lblTurnDisplay.Caption := 'Blue''s   turn!';
      lblTurnDisplay.Font.Color := clBlue;
    end
  else
    begin
      sRedDisplay.Visible := True;
      sBlueDisplay.Visible := False;

      lblTurnDisplay.Caption := 'Red''s   turn!';
      lblTurnDisplay.Font.Color := clRed;
    end;

  pgcConnect4.ActivePageIndex := 2;
  tsConnect4.Enabled := True;
  iCurrentSave := 2;

  lblPlayer1.Caption := sPlayer1 + ': ' + IntToStr(iWinsPlayer1);
  lblPlayer2.Caption := sPlayer2 + ': ' + IntToStr(iWinsPlayer2);
end;

procedure TfrmConnect4.btnSave3Click(Sender: TObject);
var
  tfSaves : TextFile;
  A, B, C, D, E, F, G, iPos, iCounterBlue, iCounterRed : Integer;
  sSaveInfo, sSave : string;
begin
  AssignFile(tfSaves, 'Saves.txt');

  try
    Reset(tfSaves)
  except
    ShowMessage('File doesn''t exist!');
    Exit
  end;

  while NOT EoF(tfSaves) do
    begin
      Readln(tfSaves, sSaveInfo);

      if sSaveInfo[1] = '3' then
        begin
          sSave := sSaveInfo;
        end;
    end;
    
  CloseFile(tfSaves);
  
  iCounterBlue := 1;
  iCounterRed := 1;
  
  //Removes the 1-3 in start
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  //Checks if save has been used before
  iPos := Pos(',', sSave);
  if Copy(sSave, 1, iPos - 1) = '1' then
    bSaveSlot1 := True;
  Delete(sSave, 1, iPos);
  
  if bSaveSlot2 = False then
    begin
      sPlayer1 := InputBox('Player name', 'Please enter player 1 ''s name: ', 'Player 1');
      sPlayer2 := InputBox('Player name', 'Please enter a player 2 ''s name: ', 'Player 2');

      iPos := Pos(',', sSave);
      Delete(sSave, 1, iPos);

      iPos := Pos(',', sSave);
      Delete(sSave, 1, iPos);

      iPos := Pos(',', sSave);
      Delete(sSave, 1, iPos);

      iPos := Pos(',', sSave);
      Delete(sSave, 1, iPos);
    end
  else
    begin
      //Gets Player 1
      iPos := Pos(',', sSave);
      sPlayer1 := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      //Gets Player 1 wins
      iPos := Pos(',', sSave);
      iWinsPlayer1 := StrToInt(Copy(sSave, 1, iPos - 1));
      Delete(sSave, 1, iPos);
      
      //Gets Player 2
      iPos := Pos(',', sSave);
      sPlayer2 := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      //Gets Player 2 wins
      iPos := Pos(',', sSave);
      iWinsPlayer2 := StrToInt(Copy(sSave, 1, iPos - 1));
      Delete(sSave, 1, iPos);
    end;

  //Removes A and pulls RowA save information and enters it into the array
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

   for A := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowA[A] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);
      
      if arrRowA[A] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowA'+IntToStr(A))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowA'+IntToStr(A))).Top;

          Inc(iCounterBlue);
        end;
      if arrRowA[A] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowA'+IntToStr(A))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowA'+IntToStr(A))).Top;

          Inc(iCounterRed);
        end;
    end;
    
  //B 
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for B := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowB[B] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      if arrRowB[B] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowB'+IntToStr(B))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowB'+IntToStr(B))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowB[B] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowB'+IntToStr(B))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowB'+IntToStr(B))).Top;

          Inc(iCounterRed);
        end;
    end;

  //C 
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for C := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowC[C] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);
      
      if arrRowC[C] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowC'+IntToStr(C))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowC'+IntToStr(C))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowC[C] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowC'+IntToStr(C))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowC'+IntToStr(C))).Top;

          Inc(iCounterRed);
        end;
    end;
    
  //D
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for D := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowD[D] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      if arrRowD[D] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowD'+IntToStr(D))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowD'+IntToStr(D))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowD[D] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowD'+IntToStr(D))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowD'+IntToStr(D))).Top;

          Inc(iCounterRed);
        end;
    end;

  //E
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for E := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowE[E] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      if arrRowE[E] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowE'+IntToStr(E))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowE'+IntToStr(E))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowE[E] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowE'+IntToStr(E))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowE'+IntToStr(E))).Top;

          Inc(iCounterRed);
        end;
    end;

  //F
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for F := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowF[F] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);

      if arrRowF[F] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowF'+IntToStr(F))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowF'+IntToStr(F))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowF[F] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowF'+IntToStr(F))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowF'+IntToStr(F))).Top;

          Inc(iCounterRed);
        end;
    end;

  //G
  iPos := Pos(',', sSave);
  Delete(sSave, 1, iPos);

  for G := 2 to 7 do
    begin
      iPos := Pos(',', sSave);
      arrRowG[G] := Copy(sSave, 1, iPos - 1);
      Delete(sSave, 1, iPos);
      
      if arrRowG[G] = 'B' then
        begin
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Left := TEdit(FindComponent('imgRowG'+IntToStr(G))).Left;
          TEdit(FindComponent('sBlue'+IntToStr(iCounterBlue))).Top :=  TEdit(FindComponent('imgRowG'+IntToStr(G))).Top;

          Inc(iCounterBlue);
        end;
      
      if arrRowG[G] = 'R' then
        begin
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Left := TEdit(FindComponent('imgRowG'+IntToStr(G))).Left;
          TEdit(FindComponent('sRed'+IntToStr(iCounterRed))).Top :=  TEdit(FindComponent('imgRowG'+IntToStr(G))).Top;

          Inc(iCounterRed);
        end;
    end;

    iTurn := (iCounterBlue + iCounterRed) div 2;
  
  if bBlueTurn = True then
    begin
      sRedDisplay.Visible := False;
      sBlueDisplay.Visible := True;

      lblTurnDisplay.Caption := 'Blue''s   turn!';
      lblTurnDisplay.Font.Color := clBlue;
    end
  else
    begin
      sRedDisplay.Visible := True;
      sBlueDisplay.Visible := False;

      lblTurnDisplay.Caption := 'Red''s   turn!';
      lblTurnDisplay.Font.Color := clRed;
    end;

  pgcConnect4.ActivePageIndex := 2;
  tsConnect4.Enabled := True;
  iCurrentSave := 3;

  lblPlayer1.Caption := sPlayer1 + ': ' + IntToStr(iWinsPlayer1);
  lblPlayer2.Caption := sPlayer2 + ': ' + IntToStr(iWinsPlayer2);
end;

procedure TfrmConnect4.FormActivate(Sender: TObject);
var
  tfSaves : TextFile;
  sSaveInfo, sSave : string;
  iPos : Integer;
  bEmpty : Boolean;
begin
  DoubleBuffered := True;

  bReset := False;
  iTurn := 1;
  pgcConnect4.ActivePageIndex := 0;

  pgcConnect4.Top := -24;
  pgcConnect4.Left := -4;
  frmConnect4.Width := pgcConnect4.Width - 8;
  frmConnect4.Height := pgcConnect4.Height - 31;

  //This removes the border and pretty much makes it so that you can't resize or move it.
  frmConnect4.BorderStyle := bsNone;
  //This just centres the form in the middle of your screen.
  frmConnect4.Left := (frmConnect4.Monitor.Width  - frmConnect4.Width)  div 2;
  frmConnect4.Top  := (frmConnect4.Monitor.Height - frmConnect4.Height) div 2;

  bBlueTurn := True;
  bSavePos := True;
  bChangeDirectionTCL := False;

  iDiagonalUp := 1;
  iDiagonalDown := 1;
  iHorisontal := 1;
  iVertical := 1;
  iTitleCounter := 0;
  iBackgroundCounter := 1;
  iWinsPlayer1 := 0;
  iWinsPlayer2 := 0;
  
  Image1.BringToFront;

  sRed1.BringToFront;
  sRed2.BringToFront;
  sRed3.BringToFront;
  sRed4.BringToFront;
  sRed5.BringToFront;
  sRed6.BringToFront;
  sRed7.BringToFront;
  sRed8.BringToFront;
  sRed9.BringToFront;
  sRed10.BringToFront;
  sRed11.BringToFront;
  sRed12.BringToFront;
  sRed13.BringToFront;
  sRed14.BringToFront;
  sRed15.BringToFront;
  sRed16.BringToFront;
  sRed17.BringToFront;
  sRed18.BringToFront;
  sRed19.BringToFront;
  sRed20.BringToFront;
  sRed21.BringToFront;
  sRed22.BringToFront;

  sBlue1.BringToFront;
  sBlue2.BringToFront;
  sBlue3.BringToFront;
  sBlue4.BringToFront;
  sBlue5.BringToFront;
  sBlue6.BringToFront;
  sBlue7.BringToFront;
  sBlue8.BringToFront;
  sBlue9.BringToFront;
  sBlue10.BringToFront;
  sBlue11.BringToFront;
  sBlue12.BringToFront;
  sBlue13.BringToFront;
  sBlue14.BringToFront;
  sBlue15.BringToFront;
  sBlue16.BringToFront;
  sBlue17.BringToFront;
  sBlue18.BringToFront;
  sBlue19.BringToFront;
  sBlue20.BringToFront;
  sBlue21.BringToFront;
  sBlue22.BringToFront;

  imgButton1.BringToFront;
  imgButton2.BringToFront;
  imgButton3.BringToFront;
  imgButton4.BringToFront;
  imgButton5.BringToFront;
  imgButton6.BringToFront;
  imgButton7.BringToFront;

  sBlueDisplay.BringToFront;
  sRedDisplay.BringToFront;

  Label1.BringToFront;

  tTitleCardLoop.Interval := 120;

  AddFontResource('poh_pixels.ttf');
  lblTitleCard.BringToFront;
  lblTitleCard.Font.Name := 'Po$h Pixels';
  lblTitleCard.Font.Size := 80;
  lblSplashText.BringToFront;
  lblSplashText.Font.Name := 'Po$h Pixels';
  lblSplashText.Font.Size := 20;
  lblTurnDisplay.Font.Name := 'Po$h Pixels';
  lblTurnDisplay.Font.Size := 30;
  lblPlayer1.Font.Name := 'Po$h Pixels';
  lblPlayer1.Font.Size := 30;
  lblPlayer1.Font.Color := clBlue;
  lblPlayer2.Font.Name := 'Po$h Pixels';
  lblPlayer2.Font.Color := clRed;
  lblPlayer2.Font.Size := 30;

  iDefaultPos := lblTitleCard.Top;
  iTitleDistance := 16;
  x := 0;

  //F stands for floor. The floor is never gonna change which is why i initialized it here.
  arrRowA[1] := 'F';
  arrRowB[1] := 'F';
  arrRowC[1] := 'F';
  arrRowD[1] := 'F';
  arrRowE[1] := 'F';
  arrRowF[1] := 'F';
  arrRowG[1] := 'F';

  sPlayer1 := 'Player 1';
  sPlayer2 := 'Player 2';

  AssignFile(tfSaves, 'Saves.txt');

  try
    Reset(tfSaves)
  except
    ShowMessage('File doesn''t exist!');
    Exit
  end;

  bEmpty := True;
  
  while NOT EoF(tfSaves) do
    begin
      Readln(tfSaves, sSaveInfo);

      case sSaveInfo[1] of
        '1' : begin
          //Removes starting number
          sSave := sSaveInfo;
          iPos := Pos(',', sSave);
          Delete(sSave, 1, iPos);

          //Checks if save exists or not
          iPos := Pos(',', sSave);
          if Copy(sSave, 1, iPos - 1) = '1' then
            bEmpty := False;
          Delete(sSave, 1, iPos);

          //Gets Player 1
          iPos := Pos(',', sSave);
          sPlayer1 := Copy(sSave, 1, iPos - 1);
          Delete(sSave, 1, iPos);

          iPos := Pos(',', sSave);
          Delete(sSave, 1, iPos);
          
          //Gets Player 2
          iPos := Pos(',', sSave);
          sPlayer2 := Copy(sSave, 1, iPos - 1);
          Delete(sSave, 1, iPos);

          iPos := Pos(',', sSave);
          Delete(sSave, 1, iPos);
          
          if bEmpty = False then
            begin
              btnSave1.Caption := 'Save 1 [' + sPlayer1 + ' vs ' + sPlayer2 + ']';
            end          
          else
            btnSave1.Caption := 'Save 1 [Empty]';
            
            bEmpty := True;
          end;
        '2' : begin
          //Removes starting number
          sSave := sSaveInfo;
          iPos := Pos(',', sSave);
          Delete(sSave, 1, iPos);

          //Checks if save exists or not
          iPos := Pos(',', sSave);
          if Copy(sSave, 1, iPos - 1) = '1' then
          bEmpty := False;
          Delete(sSave, 1, iPos);

          //Gets Player 1
          iPos := Pos(',', sSave);
          sPlayer1 := Copy(sSave, 1, iPos - 1);
          Delete(sSave, 1, iPos);

          iPos := Pos(',', sSave);
          Delete(sSave, 1, iPos);
          
          //Gets Player 2
          iPos := Pos(',', sSave);
          sPlayer2 := Copy(sSave, 1, iPos - 1);
          Delete(sSave, 1, iPos);

          iPos := Pos(',', sSave);
          Delete(sSave, 1, iPos);

          if bEmpty = False then
            begin
              btnSave2.Caption := 'Save 2 [' + sPlayer1 + ' vs ' + sPlayer2 + ']';
            end
          else
            btnSave2.Caption := 'Save 2 [Empty]';
            
            bEmpty := True;
          end;
        '3' : begin
          //Removes starting number
          sSave := sSaveInfo;
          iPos := Pos(',', sSave);
          Delete(sSave, 1, iPos);

          //Checks if save exists or not
          iPos := Pos(',', sSave);
          if Copy(sSave, 1, iPos - 1) = '1' then
          bEmpty := False;
          Delete(sSave, 1, iPos);

          //Gets Player 1
          iPos := Pos(',', sSave);
          sPlayer1 := Copy(sSave, 1, iPos - 1);
          Delete(sSave, 1, iPos);

          iPos := Pos(',', sSave);
          Delete(sSave, 1, iPos);
        
          //Gets Player 2
          iPos := Pos(',', sSave);
          sPlayer2 := Copy(sSave, 1, iPos - 1);
          Delete(sSave, 1, iPos);

          iPos := Pos(',', sSave);
          Delete(sSave, 1, iPos);
          
          if bEmpty = False then
            begin
              btnSave3.Caption := 'Save 3 [' + sPlayer1 + ' vs ' + sPlayer2 + ']';
            end
          else
            btnSave3.Caption := 'Save 3 [Empty]';

            bEmpty := True;
        end;
      end;
    end;

  CloseFile(tfSaves);

  //Removes the 1-3 in start
end;

procedure TfrmConnect4.imgButton2Click(Sender: TObject);
var
  I : Integer;
begin
  if arrRowB[7] = '0' then
  begin
    for I := 7 downto 2 do
      begin
        if (arrRowB[I] = '0') AND NOT (arrRowB[I - 1] = '0') then
          begin
            if bBlueTurn = True then
              begin
                arrRowB[I] := 'B';

                TEdit(FindComponent('sBlue'+IntToStr(iTurn))).Left := TEdit(FindComponent('imgRowB'+IntToStr(i))).Left;
                TEdit(FindComponent('sBlue'+IntToStr(iTurn))).Top :=  TEdit(FindComponent('imgRowB'+IntToStr(i))).Top;

                //Diagonal Up check
                if (I - 1 > 1) AND (arrRowA[I - 1] = 'B') then
                    Inc(iDiagonalUp);

                if (I + 1 <= 7) AND (arrRowC[I + 1] = 'B') then
                    begin
                      Inc(iDiagonalUp);

                      if (I + 2 <= 7) AND (arrRowD[I + 2] = 'B') then
                        begin
                          Inc(iDiagonalUp);

                          if (I + 3 <= 7) AND (arrRowE[I + 3] = 'B') then
                            Inc(iDiagonalUp);
                        end;
                    end;

                //Horisontal Check
                if arrRowA[I] = 'B' then
                  Inc(iHorisontal);

                if arrRowC[I] = 'B' then
                  begin
                    Inc(iHorisontal);

                    if arrRowD[I] = 'B' then
                    begin
                      Inc(iHorisontal);

                      if arrRowE[I] = 'B' then
                        Inc(iHorisontal);
                    end;
                  end;

                //Vertical Check
                if (I - 1 > 1) AND (arrRowB[I - 1] = 'B') then
                  begin
                    Inc(iVertical);

                    if (I - 2 > 1) AND (arrRowB[I - 2] = 'B') then
                    begin
                      Inc(iVertical);

                      if (I - 3 > 1) AND (arrRowB[I - 3] = 'B') then
                        Inc(iVertical);
                    end;
                  end;

                //Diagonal Down Check
                if (I + 1 <= 7) AND (arrRowA[I + 1] = 'B') then
                    Inc(iDiagonalDown);

                if (I - 1 > 1) AND (arrRowC[I - 1] = 'B') then
                  begin
                    Inc(iDiagonalDown);

                    if (I - 2 > 1) AND (arrRowD[I - 2] = 'B') then
                      begin
                        Inc(iDiagonalDown);

                        if (I - 3 > 1) AND (arrRowE[I - 3] = 'B') then
                          Inc(iDiagonalDown);
                      end;
                  end;

                bBlueTurn := False;
                inc(iTurn);

                if (iDiagonalUp >= 4) OR (iDiagonalDown >= 4) OR (iHorisontal >= 4) OR (iVertical >= 4)  then
                  begin
                    ShowMessage('Blue Wins!');
                    Inc(iWinsPlayer1);
                    bReset := True;
                  end;
              end
            else
              begin
                arrRowB[I] := 'R';

                TEdit(FindComponent('sRed'+IntToStr(iTurn))).Left := TEdit(FindComponent('imgRowB'+IntToStr(i))).Left;
                TEdit(FindComponent('sRed'+IntToStr(iTurn))).Top :=  TEdit(FindComponent('imgRowB'+IntToStr(i))).Top;

                //Diagonal Up check
                if (I - 1 > 1) AND (arrRowA[I - 1] = 'R') then
                    Inc(iDiagonalUp);

                if (I + 1 <= 7) AND (arrRowC[I + 1] = 'R') then
                    begin
                      Inc(iDiagonalUp);

                      if (I + 2 <= 7) AND (arrRowD[I + 2] = 'R') then
                        begin
                          Inc(iDiagonalUp);

                          if (I + 3 <= 7) AND (arrRowE[I + 3] = 'R') then
                            Inc(iDiagonalUp);
                        end;
                    end;

                //Horisontal Check
                if arrRowA[I] = 'R' then
                  Inc(iHorisontal);

                if arrRowC[I] = 'R' then
                  begin
                    Inc(iHorisontal);

                    if arrRowD[I] = 'R' then
                    begin
                      Inc(iHorisontal);

                      if arrRowE[I] = 'R' then
                        Inc(iHorisontal);
                    end;
                  end;

                //Vertical Check
                if (I - 1 > 1) AND (arrRowB[I - 1] = 'R') then
                  begin
                    Inc(iVertical);

                    if (I - 2 > 1) AND (arrRowB[I - 2] = 'R') then
                    begin
                      Inc(iVertical);

                      if (I - 3 > 1) AND (arrRowB[I - 3] = 'R') then
                        Inc(iVertical);
                    end;
                  end;

                //Diagonal Down Check
                if (I + 1 <= 7) AND (arrRowA[I + 1] = 'R') then
                    Inc(iDiagonalDown);

                if (I - 1 > 1) AND (arrRowC[I - 1] = 'R') then
                  begin
                    Inc(iDiagonalDown);

                    if (I - 2 > 1) AND (arrRowD[I - 2] = 'R') then
                      begin
                        Inc(iDiagonalDown);

                        if (I - 3 > 1) AND (arrRowE[I - 3] = 'R') then
                          Inc(iDiagonalDown);
                      end;
                  end;

                bBlueTurn := True;

                if (iDiagonalUp >= 4) OR (iDiagonalDown >= 4) OR (iHorisontal >= 4) OR (iVertical >= 4)  then
                  begin
                    ShowMessage('Red Wins!');
                    Inc(iWinsPlayer2);
                    bReset := True;
                  end;
              end;
          end;
      end;
  end;

  iVertical := 1;
  iDiagonalUp := 1;
  iDiagonalDown := 1;
  iHorisontal := 1;

  if bBlueTurn = True then
    begin
      sRedDisplay.Visible := False;
      sBlueDisplay.Visible := True;

      lblTurnDisplay.Caption := 'Blue''s   turn!';
      lblTurnDisplay.Font.Color := clBlue;
    end
  else
    begin
      sRedDisplay.Visible := True;
      sBlueDisplay.Visible := False;

      lblTurnDisplay.Caption := 'Red''s   turn!';
      lblTurnDisplay.Font.Color := clRed;
    end;

  if bReset = True then
    begin
      ClearBoard;
      bReset := False;
    end;
  
  Save;
end;

procedure TfrmConnect4.imgButton3Click(Sender: TObject);
var
  I : Integer;
begin
  if arrRowC[7] = '0' then
  begin
    for I := 7 downto 2 do
      begin
        if (arrRowC[I] = '0') AND NOT (arrRowC[I - 1] = '0') then
          begin
            if bBlueTurn = True then
              begin
                arrRowC[I] := 'B';

                TEdit(FindComponent('sBlue'+IntToStr(iTurn))).Left := TEdit(FindComponent('imgRowC'+IntToStr(i))).Left;
                TEdit(FindComponent('sBlue'+IntToStr(iTurn))).Top :=  TEdit(FindComponent('imgRowC'+IntToStr(i))).Top;

                //Diagonal Up check
                if (I - 1 > 1) AND (arrRowB[I - 1] = 'B') then
                  begin
                    Inc(iDiagonalUp);

                    if (I - 2 > 1) AND (arrRowA[I - 2] = 'B') then
                      Inc(iDiagonalUp);
                  end;


                if (I + 1 <= 7) AND (arrRowD[I + 1] = 'B') then
                    begin
                      Inc(iDiagonalUp);

                      if (I + 2 <= 7) AND (arrRowE[I + 2] = 'B') then
                        begin
                          Inc(iDiagonalUp);

                          if (I + 3 <= 7) AND (arrRowF[I + 3] = 'B') then
                            Inc(iDiagonalUp);
                        end;
                    end;

                //Horisontal Check
                if arrRowB[I] = 'B' then
                  begin
                    Inc(iHorisontal);

                    if arrRowA[I] = 'B' then
                      Inc(iHorisontal);
                  end;

                if arrRowD[I] = 'B' then
                  begin
                    Inc(iHorisontal);

                    if arrRowE[I] = 'B' then
                    begin
                      Inc(iHorisontal);

                      if arrRowF[I] = 'B' then
                        Inc(iHorisontal);
                    end;
                  end;

                //Vertical Check
                if (I - 1 > 1) AND (arrRowC[I - 1] = 'B') then
                  begin
                    Inc(iVertical);

                    if (I - 2 > 1) AND (arrRowC[I - 2] = 'B') then
                    begin
                      Inc(iVertical);

                      if (I - 3 > 1) AND (arrRowC[I - 3] = 'B') then
                        Inc(iVertical);
                    end;
                  end;

                //Diagonal Down Check
                if (I + 1 <= 7) AND (arrRowB[I + 1] = 'B') then
                  begin
                    Inc(iDiagonalDown);

                    if (I + 2 <= 7) AND (arrRowA[I + 2] = 'B') then
                      Inc(iDiagonalDown);
                  end;

                if (I - 1 > 1) AND (arrRowD[I - 1] = 'B') then
                  begin
                    Inc(iDiagonalDown);

                    if (I - 2 > 1) AND (arrRowE[I - 2] = 'B') then
                      begin
                        Inc(iDiagonalDown);

                        if (I - 3 > 1) AND (arrRowF[I - 3] = 'B') then
                          Inc(iDiagonalDown);
                      end;
                  end;

                inc(iTurn);
                bBlueTurn := False;

                if (iDiagonalUp >= 4) OR (iDiagonalDown >= 4) OR (iHorisontal >= 4) OR (iVertical >= 4)  then
                  begin
                    ShowMessage('Blue Wins!');
                    Inc(iWinsPlayer1);
                    bReset := True;
                  end;
              end
            else
              begin
                arrRowC[I] := 'R';

                TEdit(FindComponent('sRed'+IntToStr(iTurn))).Left := TEdit(FindComponent('imgRowC'+IntToStr(i))).Left;
                TEdit(FindComponent('sRed'+IntToStr(iTurn))).Top :=  TEdit(FindComponent('imgRowC'+IntToStr(i))).Top;

                //Diagonal Up check
                if (I - 1 <= 7) AND (arrRowB[I - 1] = 'R') then
                  begin
                    Inc(iDiagonalUp);

                    if (I - 2 <= 7) AND (arrRowA[I - 2] = 'R') then
                      Inc(iDiagonalUp);
                  end;


                if (I + 1 <= 7) AND (arrRowD[I + 1] = 'R') then
                    begin
                      Inc(iDiagonalUp);

                      if (I + 2 <= 7) AND (arrRowE[I + 2] = 'R') then
                        begin
                          Inc(iDiagonalUp);

                          if (I + 3 <= 7) AND (arrRowF[I + 3] = 'R') then
                            Inc(iDiagonalUp);
                        end;
                    end;

                //Horisontal Check
                if arrRowB[I] = 'R' then
                  begin
                    Inc(iHorisontal);

                    if arrRowA[I] = 'R' then
                      Inc(iHorisontal);
                  end;

                if arrRowD[I] = 'R' then
                  begin
                    Inc(iHorisontal);

                    if arrRowE[I] = 'R' then
                    begin
                      Inc(iHorisontal);

                      if arrRowF[I] = 'R' then
                        Inc(iHorisontal);
                    end;
                  end;

                //Vertical Check
                if (I - 1 > 1) AND (arrRowC[I - 1] = 'R') then
                  begin
                    Inc(iVertical);

                    if (I - 2 > 1) AND (arrRowC[I - 2] = 'R') then
                    begin
                      Inc(iVertical);

                      if (I - 3 > 1) AND (arrRowC[I - 3] = 'R') then
                        Inc(iVertical);
                    end;
                  end;

                //Diagonal Down Check
                if (I + 1 <= 7) AND (arrRowB[I + 1] = 'R') then
                  begin
                    Inc(iDiagonalDown);

                    if (I + 2 <= 7) AND (arrRowA[I + 2] = 'R') then
                      Inc(iDiagonalDown);
                  end;

                if (I - 1 > 1) AND (arrRowD[I - 1] = 'R') then
                  begin
                    Inc(iDiagonalDown);

                    if (I - 2 > 1) AND (arrRowE[I - 2] = 'R') then
                      begin
                        Inc(iDiagonalDown);

                        if (I - 3 > 1) AND (arrRowF[I - 3] = 'R') then
                          Inc(iDiagonalDown);
                      end;
                  end;

                bBlueTurn := True;

                if (iDiagonalUp >= 4) OR (iDiagonalDown >= 4) OR (iHorisontal >= 4) OR (iVertical >= 4)  then
                  begin
                    ShowMessage('Red Wins!');
                    Inc(iWinsPlayer2);
                    bReset := True;
                  end;
              end;
          end;
      end;
  end;

  iVertical := 1;
  iDiagonalUp := 1;
  iDiagonalDown := 1;
  iHorisontal := 1;

  if bBlueTurn = True then
    begin
      sRedDisplay.Visible := False;
      sBlueDisplay.Visible := True;

      lblTurnDisplay.Caption := 'Blue''s   turn!';
      lblTurnDisplay.Font.Color := clBlue;
    end
  else
    begin
      sRedDisplay.Visible := True;
      sBlueDisplay.Visible := False;

      lblTurnDisplay.Caption := 'Red''s   turn!';
      lblTurnDisplay.Font.Color := clRed;
    end;

  if bReset = True then
    begin
      ClearBoard;
      bReset := False;
    end;
  
  Save;
end;

procedure TfrmConnect4.imgButton4Click(Sender: TObject);
var
  I : Integer;
begin
  if arrRowD[7] = '0' then
  begin
    for I := 7 downto 2 do
      begin
        if (arrRowD[I] = '0') AND NOT (arrRowD[I - 1] = '0') then
          begin
            if bBlueTurn = True then
              begin
                arrRowD[I] := 'B';

                TEdit(FindComponent('sBlue'+IntToStr(iTurn))).Left := TEdit(FindComponent('imgRowD'+IntToStr(i))).Left;
                TEdit(FindComponent('sBlue'+IntToStr(iTurn))).Top :=  TEdit(FindComponent('imgRowD'+IntToStr(i))).Top;

                //Diagonal Up check
                if (I - 1 > 1) AND (arrRowC[I - 1] = 'B') then
                  begin
                    Inc(iDiagonalUp);

                    if (I - 2 > 1) AND (arrRowB[I - 2] = 'B') then
                      begin
                        Inc(iDiagonalUp);

                        if (I - 3 > 1) AND (arrRowA[I - 3] = 'B') then
                          Inc(iDiagonalUp);
                      end;
                  end;

                if (I + 1 <= 7) AND (arrRowE[I + 1] = 'B') then
                    begin
                      Inc(iDiagonalUp);

                      if (I + 2 <= 7) AND (arrRowF[I + 2] = 'B') then
                        begin
                          Inc(iDiagonalUp);

                          if (I + 3 <= 7) AND (arrRowG[I + 3] = 'B') then
                            Inc(iDiagonalUp);
                        end;
                    end;


                //Horisontal Check
                if arrRowC[I] = 'B' then
                  begin
                    Inc(iHorisontal);

                    if arrRowB[I] = 'B' then
                    begin
                      Inc(iHorisontal);

                      if arrRowA[I] = 'B' then
                        Inc(iHorisontal);
                    end;
                  end;

                if arrRowE[I] = 'B' then
                  begin
                    Inc(iHorisontal);

                    if arrRowF[I] = 'B' then
                    begin
                      Inc(iHorisontal);

                      if arrRowG[I] = 'B' then
                        Inc(iHorisontal);
                    end;
                  end;

                //Vertical Check
                if (I - 1 > 1) AND (arrRowD[I - 1] = 'B') then
                  begin
                    Inc(iVertical);

                    if (I - 2 > 1) AND (arrRowD[I - 2] = 'B') then
                    begin
                      Inc(iVertical);

                      if (I - 3 > 1) AND (arrRowD[I - 3] = 'B') then
                        Inc(iVertical);
                    end;
                  end;

                //Diagonal Down Check
                if (I + 1 <= 7) AND (arrRowC[I + 1] = 'B') then
                  begin
                    Inc(iDiagonalDown);

                    if (I + 2 <= 7) AND (arrRowB[I + 2] = 'B') then
                      begin
                        Inc(iDiagonalDown);

                        if (I + 3 <= 7) AND (arrRowA[I + 3] = 'B') then

                      end;
                  end;

                if (I - 1 > 1) AND (arrRowE[I - 1] = 'B') then
                  begin
                    Inc(iDiagonalDown);

                    if (I - 2 > 1) AND (arrRowF[I - 2] = 'B') then
                      begin
                        Inc(iDiagonalDown);

                        if (I - 3 > 1) AND (arrRowG[I - 3] = 'B') then
                          Inc(iDiagonalDown);
                      end;
                  end;

                inc(iTurn);
                bBlueTurn := False;

              if (iDiagonalUp >= 4) OR (iDiagonalDown >= 4) OR (iHorisontal >= 4) OR (iVertical >= 4)  then
                  begin
                    ShowMessage('Blue Wins!');
                    Inc(iWinsPlayer1);
                    bReset := True;
                  end;
              end
            else
              begin
                arrRowD[I] := 'R';

                TEdit(FindComponent('sRed'+IntToStr(iTurn))).Left := TEdit(FindComponent('imgRowD'+IntToStr(i))).Left;
                TEdit(FindComponent('sRed'+IntToStr(iTurn))).Top :=  TEdit(FindComponent('imgRowD'+IntToStr(i))).Top;
                //Diagonal Up check
                if (I - 1 > 1) AND (arrRowC[I - 1] = 'R') then
                  begin
                    Inc(iDiagonalUp);

                    if (I - 2 > 1) AND (arrRowB[I - 2] = 'R') then
                      begin
                        Inc(iDiagonalUp);

                        if (I - 3 > 1) AND (arrRowA[I - 3] = 'R') then
                          Inc(iDiagonalUp);
                      end;
                  end;

                if (I + 1 <= 7) AND (arrRowE[I + 1] = 'R') then
                    begin
                      Inc(iDiagonalUp);

                      if (I + 2 <= 7) AND (arrRowF[I + 2] = 'R') then
                        begin
                          Inc(iDiagonalUp);

                          if (I + 3 <= 7) AND (arrRowG[I + 3] = 'R') then
                            Inc(iDiagonalUp);
                        end;
                    end;


                //Horisontal Check
                if arrRowC[I] = 'R' then
                  begin
                    Inc(iHorisontal);

                    if arrRowB[I] = 'R' then
                    begin
                      Inc(iHorisontal);

                      if arrRowA[I] = 'R' then
                        Inc(iHorisontal);
                    end;
                  end;

                if arrRowE[I] = 'R' then
                  begin
                    Inc(iHorisontal);

                    if arrRowF[I] = 'R' then
                    begin
                      Inc(iHorisontal);

                      if arrRowG[I] = 'R' then
                        Inc(iHorisontal);
                    end;
                  end;

                //Vertical Check
                if (I - 1 > 1) AND (arrRowD[I - 1] = 'R') then
                  begin
                    Inc(iVertical);

                    if (I - 2 > 1) AND (arrRowD[I - 2] = 'R') then
                    begin
                      Inc(iVertical);

                      if (I - 3 > 1) AND (arrRowD[I - 3] = 'R') then
                        Inc(iVertical);
                    end;
                  end;

                //Diagonal Down Check
                if (I + 1 <= 7) AND (arrRowC[I + 1] = 'R') then
                  begin
                    Inc(iDiagonalDown);

                    if (I + 2 <= 7) AND (arrRowB[I + 2] = 'R') then
                      begin
                        Inc(iDiagonalDown);

                        if (I + 3 <= 7) AND (arrRowA[I + 3] = 'R') then

                      end;
                  end;

                if (I - 1 > 1) AND (arrRowE[I - 1] = 'R') then
                  begin
                    Inc(iDiagonalDown);

                    if (I - 2 > 1) AND (arrRowF[I - 2] = 'R') then
                      begin
                        Inc(iDiagonalDown);

                        if (I - 3 > 1) AND (arrRowG[I - 3] = 'R') then
                          Inc(iDiagonalDown);
                      end;
                  end;
                bBlueTurn := True;

                if (iDiagonalUp >= 4) OR (iDiagonalDown >= 4) OR (iHorisontal >= 4) OR (iVertical >= 4)  then
                  begin
                    ShowMessage('Red Wins!');
                    Inc(iWinsPlayer2);
                    bReset := True;
                  end;
              end;
          end;
      end;
  end;

  iVertical := 1;
  iDiagonalUp := 1;
  iDiagonalDown := 1;
  iHorisontal := 1;

  if bBlueTurn = True then
    begin
      sRedDisplay.Visible := False;
      sBlueDisplay.Visible := True;

      lblTurnDisplay.Caption := 'Blue''s   turn!';
      lblTurnDisplay.Font.Color := clBlue;
    end
  else
    begin
      sRedDisplay.Visible := True;
      sBlueDisplay.Visible := False;

      lblTurnDisplay.Caption := 'Red''s   turn!';
      lblTurnDisplay.Font.Color := clRed;
    end;
    
  if bReset = True then
    begin
      ClearBoard;
      bReset := False;
    end;
    
  Save;
end;

procedure TfrmConnect4.imgButton5Click(Sender: TObject);
var
  I : Integer;
begin
  if arrRowE[7] = '0' then
  begin
    for I := 7 downto 2 do
      begin
        if (arrRowE[I] = '0') AND NOT (arrRowE[I - 1] = '0') then
          begin
            if bBlueTurn = True then
              begin
                arrRowE[I] := 'B';

                TEdit(FindComponent('sBlue'+IntToStr(iTurn))).Left := TEdit(FindComponent('imgRowE'+IntToStr(i))).Left;
                TEdit(FindComponent('sBlue'+IntToStr(iTurn))).Top :=  TEdit(FindComponent('imgRowE'+IntToStr(i))).Top;

                //Diagonal Up check
                if (I - 1 > 1) AND (arrRowD[I - 1] = 'B') then
                  begin
                    Inc(iDiagonalUp);

                    if (I - 2 > 1) AND (arrRowC[I - 2] = 'B') then
                      begin
                        Inc(iDiagonalUp);

                        if (I - 3 > 1) AND (arrRowB[I - 3] = 'B') then
                          Inc(iDiagonalUp);
                      end;
                  end;

                if (I + 1 <= 7) AND (arrRowF[I + 1] = 'B') then
                    begin
                      Inc(iDiagonalUp);

                      if (I + 2 <= 7) AND (arrRowG[I + 2] = 'B') then
                          Inc(iDiagonalUp);
                    end;


                //Horisontal Check
                if arrRowD[I] = 'B' then
                  begin
                    Inc(iHorisontal);

                    if arrRowC[I] = 'B' then
                    begin
                      Inc(iHorisontal);

                      if arrRowB[I] = 'B' then
                        Inc(iHorisontal);
                    end;
                  end;

                if arrRowF[I] = 'B' then
                  begin
                    Inc(iHorisontal);

                    if arrRowG[I] = 'B' then
                      Inc(iHorisontal);
                  end;

                //Vertical Check
                if (I - 1 > 1) AND (arrRowE[I - 1] = 'B') then
                  begin
                    Inc(iVertical);

                    if (I - 2 > 1) AND (arrRowE[I - 2] = 'B') then
                    begin
                      Inc(iVertical);

                      if (I - 3 > 1) AND (arrRowE[I - 3] = 'B') then
                        Inc(iVertical);
                    end;
                  end;

                //Diagonal Down Check
                if (I + 1 <= 7) AND (arrRowC[I + 1] = 'B') then
                  begin
                    Inc(iDiagonalDown);

                    if (I + 2 <= 7) AND (arrRowB[I + 2] = 'B') then
                      begin
                        Inc(iDiagonalDown);

                        if (I + 3 <= 7) AND (arrRowA[I + 3] = 'B') then

                      end;
                  end;

                if (I - 1 > 1) AND (arrRowF[I - 1] = 'B') then
                  begin
                    Inc(iDiagonalDown);

                    if (I - 2 > 1) AND (arrRowG[I - 2] = 'B') then
                        Inc(iDiagonalDown);
                  end;

                inc(iTurn);
                bBlueTurn := False;

              if (iDiagonalUp >= 4) OR (iDiagonalDown >= 4) OR (iHorisontal >= 4) OR (iVertical >= 4)  then
                  begin
                    ShowMessage('Blue Wins!');
                    Inc(iWinsPlayer1);
                    bReset := True;
                  end;
              end
            else
              begin
                arrRowE[I] := 'R';

                TEdit(FindComponent('sRed'+IntToStr(iTurn))).Left := TEdit(FindComponent('imgRowE'+IntToStr(i))).Left;
                TEdit(FindComponent('sRed'+IntToStr(iTurn))).Top :=  TEdit(FindComponent('imgRowE'+IntToStr(i))).Top;

                //Diagonal Up check
                if (I - 1 > 1) AND (arrRowD[I - 1] = 'R') then
                  begin
                    Inc(iDiagonalUp);

                    if (I - 2 > 1) AND (arrRowC[I - 2] = 'R') then
                      begin
                        Inc(iDiagonalUp);

                        if (I - 3 > 1) AND (arrRowB[I - 3] = 'R') then
                          Inc(iDiagonalUp);
                      end;
                  end;

                if (I + 1 <= 7) AND (arrRowF[I + 1] = 'R') then
                    begin
                      Inc(iDiagonalUp);

                      if (I + 2 <= 7) AND (arrRowG[I + 2] = 'R') then
                          Inc(iDiagonalUp);
                    end;


                //Horisontal Check
                if arrRowD[I] = 'R' then
                  begin
                    Inc(iHorisontal);

                    if arrRowC[I] = 'R' then
                    begin
                      Inc(iHorisontal);

                      if arrRowB[I] = 'R' then
                        Inc(iHorisontal);
                    end;
                  end;

                if arrRowF[I] = 'R' then
                  begin
                    Inc(iHorisontal);

                    if arrRowG[I] = 'R' then
                      Inc(iHorisontal);
                  end;

                //Vertical Check
                if (I - 1 > 1) AND (arrRowE[I - 1] = 'R') then
                  begin
                    Inc(iVertical);

                    if (I - 2 > 1) AND (arrRowE[I - 2] = 'R') then
                    begin
                      Inc(iVertical);

                      if (I - 3 > 1) AND (arrRowE[I - 3] = 'R') then
                        Inc(iVertical);
                    end;
                  end;

                //Diagonal Down Check
                if (I + 1 <= 7) AND (arrRowC[I + 1] = 'R') then
                  begin
                    Inc(iDiagonalDown);

                    if (I + 2 <= 7) AND (arrRowB[I + 2] = 'R') then
                      begin
                        Inc(iDiagonalDown);

                        if (I + 3 <= 7) AND (arrRowA[I + 3] = 'R') then

                      end;
                  end;

                if (I - 1 > 1) AND (arrRowF[I - 1] = 'R') then
                  begin
                    Inc(iDiagonalDown);

                    if (I - 2 > 1) AND (arrRowG[I - 2] = 'R') then
                        Inc(iDiagonalDown);
                  end;

                bBlueTurn := True;

                if (iDiagonalUp >= 4) OR (iDiagonalDown >= 4) OR (iHorisontal >= 4) OR (iVertical >= 4)  then
                  begin
                    ShowMessage('Red Wins!');
                    Inc(iWinsPlayer2);
                    bReset := True;
                  end;
              end;
          end;
      end;
  end;

  iVertical := 1;
  iDiagonalUp := 1;
  iDiagonalDown := 1;
  iHorisontal := 1;

  if bBlueTurn = True then
    begin
      sRedDisplay.Visible := False;
      sBlueDisplay.Visible := True;

      lblTurnDisplay.Caption := 'Blue''s   turn!';
      lblTurnDisplay.Font.Color := clBlue;
    end
  else
    begin
      sRedDisplay.Visible := True;
      sBlueDisplay.Visible := False;

      lblTurnDisplay.Caption := 'Red''s   turn!';
      lblTurnDisplay.Font.Color := clRed;
    end;

  if bReset = True then
    begin
      ClearBoard;
      bReset := False;
    end;

  Save;
end;

procedure TfrmConnect4.imgButton6Click(Sender: TObject);
var
  I : Integer;
begin
  if arrRowF[7] = '0' then
  begin
    for I := 7 downto 2 do
      begin
        if (arrRowF[I] = '0') AND NOT (arrRowF[I - 1] = '0') then
          begin
            if bBlueTurn = True then
              begin
                arrRowF[I] := 'B';

                TEdit(FindComponent('sBlue'+IntToStr(iTurn))).Left := TEdit(FindComponent('imgRowF'+IntToStr(i))).Left;
                TEdit(FindComponent('sBlue'+IntToStr(iTurn))).Top :=  TEdit(FindComponent('imgRowF'+IntToStr(i))).Top;

                //Diagonal Up check
                if (I - 1 > 1) AND (arrRowE[I - 1] = 'B') then
                  begin
                    Inc(iDiagonalUp);

                    if (I - 2 > 1) AND (arrRowD[I - 2] = 'B') then
                      begin
                        Inc(iDiagonalUp);

                        if (I - 3 > 1) AND (arrRowC[I - 3] = 'B') then
                          Inc(iDiagonalUp);
                      end;
                  end;

                if (I + 1 <= 7) AND (arrRowG[I + 1] = 'B') then
                      Inc(iDiagonalUp);


                //Horisontal Check
                if arrRowE[I] = 'B' then
                  begin
                    Inc(iHorisontal);

                    if arrRowD[I] = 'B' then
                    begin
                      Inc(iHorisontal);

                      if arrRowC[I] = 'B' then
                        Inc(iHorisontal);
                    end;
                  end;

                if arrRowG[I] = 'B' then
                    Inc(iHorisontal);

                //Vertical Check
                if (I - 1 > 1) AND (arrRowF[I - 1] = 'B') then
                  begin
                    Inc(iVertical);

                    if (I - 2 > 1) AND (arrRowF[I - 2] = 'B') then
                    begin
                      Inc(iVertical);

                      if (I - 3 > 1) AND (arrRowF[I - 3] = 'B') then
                        Inc(iVertical);
                    end;
                  end;

                //Diagonal Down Check
                if (I + 1 <= 7) AND (arrRowE[I + 1] = 'B') then
                  begin
                    Inc(iDiagonalDown);

                    if (I + 2 <= 7) AND (arrRowD[I + 2] = 'B') then
                      begin
                        Inc(iDiagonalDown);

                        if (I + 3 <= 7) AND (arrRowC[I + 3] = 'B') then

                      end;
                  end;

                if (I - 1 > 1) AND (arrRowG[I - 1] = 'B') then
                    Inc(iDiagonalDown);

                inc(iTurn);
                bBlueTurn := False;

                if (iDiagonalUp >= 4) OR (iDiagonalDown >= 4) OR (iHorisontal >= 4) OR (iVertical >= 4)  then
                  begin
                    ShowMessage('Blue Wins!');
                    Inc(iWinsPlayer1);
                    bReset := True;
                  end;
              end
            else
              begin
                arrRowF[I] := 'R';

                TEdit(FindComponent('sRed'+IntToStr(iTurn))).Left := TEdit(FindComponent('imgRowF'+IntToStr(i))).Left;
                TEdit(FindComponent('sRed'+IntToStr(iTurn))).Top :=  TEdit(FindComponent('imgRowF'+IntToStr(i))).Top;

                //Diagonal Up check
                if (I - 1 > 1) AND (arrRowE[I - 1] = 'R') then
                  begin
                    Inc(iDiagonalUp);

                    if (I - 2 > 1) AND (arrRowD[I - 2] = 'R') then
                      begin
                        Inc(iDiagonalUp);

                        if (I - 3 > 1) AND (arrRowC[I - 3] = 'R') then
                          Inc(iDiagonalUp);
                      end;
                  end;

                if (I + 1 <= 7) AND (arrRowG[I + 1] = 'R') then
                      Inc(iDiagonalUp);


                //Horisontal Check
                if arrRowE[I] = 'R' then
                  begin
                    Inc(iHorisontal);

                    if arrRowD[I] = 'R' then
                    begin
                      Inc(iHorisontal);

                      if arrRowC[I] = 'R' then
                        Inc(iHorisontal);
                    end;
                  end;

                if arrRowG[I] = 'R' then
                    Inc(iHorisontal);

                //Vertical Check
                if (I - 1 > 1) AND (arrRowF[I - 1] = 'R') then
                  begin
                    Inc(iVertical);

                    if (I - 2 > 1) AND (arrRowF[I - 2] = 'R') then
                    begin
                      Inc(iVertical);

                      if (I - 3 > 1) AND (arrRowF[I - 3] = 'R') then
                        Inc(iVertical);
                    end;
                  end;

                //Diagonal Down Check
                if (I + 1 <= 7) AND (arrRowE[I + 1] = 'R') then
                  begin
                    Inc(iDiagonalDown);

                    if (I + 2 <= 7) AND (arrRowD[I + 2] = 'R') then
                      begin
                        Inc(iDiagonalDown);

                        if (I + 3 <= 7) AND (arrRowC[I + 3] = 'R') then

                      end;
                  end;

                if (I - 1 > 1) AND (arrRowG[I - 1] = 'R') then
                    Inc(iDiagonalDown);

                bBlueTurn := True;

                if (iDiagonalUp >= 4) OR (iDiagonalDown >= 4) OR (iHorisontal >= 4) OR (iVertical >= 4)  then
                  begin
                    ShowMessage('Red Wins!');
                    Inc(iWinsPlayer2);
                    bReset := True;
                  end;
              end;
          end;
      end;
  end;

  iVertical := 1;
  iDiagonalUp := 1;
  iDiagonalDown := 1;
  iHorisontal := 1;

  if bBlueTurn = True then
    begin
      sRedDisplay.Visible := False;
      sBlueDisplay.Visible := True;

      lblTurnDisplay.Caption := 'Blue''s   turn!';
      lblTurnDisplay.Font.Color := clBlue;
    end
  else
    begin
      sRedDisplay.Visible := True;
      sBlueDisplay.Visible := False;

      lblTurnDisplay.Caption := 'Red''s   turn!';
      lblTurnDisplay.Font.Color := clRed;
    end;

    if bReset = True then
    begin
      ClearBoard;
      bReset := False;
    end;
    
  Save;
end;

procedure TfrmConnect4.imgButton7Click(Sender: TObject);
var
  I : Integer;
begin
  if arrRowG[7] = '0' then
  begin
    for I := 7 downto 2 do
      begin
        if (arrRowG[I] = '0') AND NOT (arrRowG[I - 1] = '0') then
          begin
            if bBlueTurn = True then
              begin
                arrRowG[I] := 'B';

                TEdit(FindComponent('sBlue'+IntToStr(iTurn))).Left := TEdit(FindComponent('imgRowG'+IntToStr(i))).Left;
                TEdit(FindComponent('sBlue'+IntToStr(iTurn))).Top :=  TEdit(FindComponent('imgRowG'+IntToStr(i))).Top;

                //Diagonal Up check
                if (I - 1 > 1) AND (arrRowF[I - 1] = 'B') then
                  begin
                    Inc(iDiagonalUp);

                    if (I - 2 > 1) AND (arrRowE[I - 2] = 'B') then
                      begin
                        Inc(iDiagonalUp);

                        if (I - 3 > 1) AND (arrRowD[I - 3] = 'B') then
                          Inc(iDiagonalUp);
                      end;
                  end;


                //Horisontal Check
                if arrRowF[I] = 'B' then
                  begin
                    Inc(iHorisontal);

                    if arrRowE[I] = 'B' then
                    begin
                      Inc(iHorisontal);

                      if arrRowD[I] = 'B' then
                        Inc(iHorisontal);
                    end;
                  end;

                //Vertical Check
                if (I - 1 > 1) AND (arrRowG[I - 1] = 'B') then
                  begin
                    Inc(iVertical);

                    if (I - 2 > 1) AND (arrRowG[I - 2] = 'B') then
                    begin
                      Inc(iVertical);

                      if (I - 3 > 1) AND (arrRowG[I - 3] = 'B') then
                        Inc(iVertical);
                    end;
                  end;

                //Diagonal Down Check
                if (I + 1 <= 7) AND (arrRowF[I + 1] = 'B') then
                  begin
                    Inc(iDiagonalDown);

                    if (I + 2 <= 7) AND (arrRowE[I + 2] = 'B') then
                      begin
                        Inc(iDiagonalDown);

                        if (I + 3 <= 7) AND (arrRowD[I + 3] = 'B') then

                      end;
                  end;

                inc(iTurn);
                bBlueTurn := False;

                if (iDiagonalUp >= 4) OR (iDiagonalDown >= 4) OR (iHorisontal >= 4) OR (iVertical >= 4)  then
                  begin
                    ShowMessage('Blue Wins!');
                    Inc(iWinsPlayer1);
                    ClearBoard;
                  end;
              end
            else
              begin
                arrRowG[I] := 'R';

                TEdit(FindComponent('sRed'+IntToStr(iTurn))).Left := TEdit(FindComponent('imgRowG'+IntToStr(i))).Left;
                TEdit(FindComponent('sRed'+IntToStr(iTurn))).Top :=  TEdit(FindComponent('imgRowG'+IntToStr(i))).Top;

                //Diagonal Up check
                if (I - 1 > 1) AND (arrRowF[I - 1] = 'R') then
                  begin
                    Inc(iDiagonalUp);

                    if (I - 2 > 1) AND (arrRowE[I - 2] = 'R') then
                      begin
                        Inc(iDiagonalUp);

                        if (I - 3 > 1) AND (arrRowD[I - 3] = 'R') then
                          Inc(iDiagonalUp);
                      end;
                  end;


                //Horisontal Check
                if arrRowF[I] = 'R' then
                  begin
                    Inc(iHorisontal);

                    if arrRowE[I] = 'R' then
                    begin
                      Inc(iHorisontal);

                      if arrRowD[I] = 'R' then
                        Inc(iHorisontal);
                    end;
                  end;

                //Vertical Check
                if (I - 1 > 1) AND (arrRowG[I - 1] = 'R') then
                  begin
                    Inc(iVertical);

                    if (I - 2 > 1) AND (arrRowG[I - 2] = 'R') then
                    begin
                      Inc(iVertical);

                      if (I - 3 > 1) AND (arrRowG[I - 3] = 'R') then
                        Inc(iVertical);
                    end;
                  end;

                //Diagonal Down Check
                if (I + 1 <= 7) AND (arrRowF[I + 1] = 'R') then
                  begin
                    Inc(iDiagonalDown);

                    if (I + 2 <= 7) AND (arrRowE[I + 2] = 'R') then
                      begin
                        Inc(iDiagonalDown);

                        if (I + 3 <= 7) AND (arrRowD[I + 3] = 'R') then

                      end;
                  end;

                bBlueTurn := True;

                if (iDiagonalUp >= 4) OR (iDiagonalDown >= 4) OR (iHorisontal >= 4) OR (iVertical >= 4)  then
                  begin
                    ShowMessage('Red Wins!');
                    Inc(iWinsPlayer2);
                    ClearBoard;
                  end;
              end;
          end;
      end;
  end;

  iVertical := 1;
  iDiagonalUp := 1;
  iDiagonalDown := 1;
  iHorisontal := 1;

  if bBlueTurn = True then
    begin
      sRedDisplay.Visible := False;
      sBlueDisplay.Visible := True;

      lblTurnDisplay.Caption := 'Blue''s   turn!';
      lblTurnDisplay.Font.Color := clBlue;
    end
  else
    begin
      sRedDisplay.Visible := True;
      sBlueDisplay.Visible := False;

      lblTurnDisplay.Caption := 'Red''s   turn!';
      lblTurnDisplay.Font.Color := clRed;
    end;

  if bReset = True then
    begin
      ClearBoard;
      bReset := False;
    end;
  
  Save;
end;

procedure TfrmConnect4.tTitleCardLoopTimer(Sender: TObject);
var
  // iCurrentLeftPos : Integer;
  iPosModifier : Integer;
begin
  //ice'd

  iPosModifier := round(iTitleDistance * sin(X * Pi / iTitleDistance));
  lblTitleCard.Top := iDefaultPos + iPosModifier;
  X := ((X + 1) mod (2 * iTitleDistance));

  {
  if bChangeDirectionTCL = False then
    begin
      lblTitleCard.Top := iCurrentTopPos + 1;

      Inc(iTitleCounter);

      if iTitleCounter > 8 then
        bChangeDirectionTCL := True;
    end
  else
    begin
      lblTitleCard.Top := iCurrentTopPos - 1;

      Dec(iTitleCounter);

      if iTitleCounter = 0 then
        bChangeDirectionTCL := False;
    end;
    }

  lblSplashText.Left := lblTitleCard.Left + lblTitleCard.Width - 20;
  lblSplashText.Top := lblTitleCard.Top + lblTitleCard.Height - 20;
end;

procedure TfrmConnect4.imgButton1Click(Sender: TObject);
var
  I : Integer;
begin
  if arrRowA[7] = '0' then
  begin
    for I := 7 downto 2 do
      begin
        if (arrRowA[I] = '0') AND NOT (arrRowA[I - 1] = '0') then
          begin
            if bBlueTurn = True then
              begin
                arrRowA[I] := 'B';

                TEdit(FindComponent('sBlue'+IntToStr(iTurn))).Left := TEdit(FindComponent('imgRowA'+IntToStr(i))).Left;
                TEdit(FindComponent('sBlue'+IntToStr(iTurn))).Top :=  TEdit(FindComponent('imgRowA'+IntToStr(i))).Top;

                //Diagonal Up check
                if (I + 1 <= 7) AND (arrRowB[I + 1] = 'B') then
                    begin
                      Inc(iDiagonalUp);

                      if (I + 2 <= 7) AND (arrRowC[I + 2] = 'B') then
                        begin
                          Inc(iDiagonalUp);

                          if (I + 3 <= 7) AND (arrRowD[I + 3] = 'B') then
                            Inc(iDiagonalUp);
                        end;
                    end;

                //Horisontal Check
                if arrRowB[I] = 'B' then
                  begin
                    Inc(iHorisontal);

                    if arrRowC[I] = 'B' then
                    begin
                      Inc(iHorisontal);

                      if arrRowD[I] = 'B' then
                        Inc(iHorisontal);
                    end;
                  end;

                //Vertical Check
                if (I - 1 > 1) AND (arrRowA[I - 1] = 'B') then
                  begin
                    Inc(iVertical);

                    if (I - 2 > 1) AND (arrRowA[I - 2] = 'B') then
                    begin
                      Inc(iVertical);

                      if (I - 3 > 1) AND (arrRowA[I - 3] = 'B') then
                        Inc(iVertical);
                    end;
                  end;

                //Diagonal Down Check
                if (I - 1 > 1) AND (arrRowB[I - 1] = 'B') then
                  begin
                    Inc(iDiagonalDown);

                    if (I - 2 > 1) AND (arrRowC[I - 2] = 'B') then
                      begin
                        Inc(iDiagonalDown);

                        if (I - 3 > 1) AND (arrRowD[I - 3] = 'B') then
                          Inc(iDiagonalDown);
                      end;
                  end;

                inc(iTurn);
                bBlueTurn := False;

                if (iDiagonalUp >= 4) OR (iDiagonalDown >= 4) OR (iHorisontal >= 4) OR (iVertical >= 4)  then
                  begin
                    ShowMessage('Blue Wins!');
                    Inc(iWinsPlayer1);
                    bReset := True;
                  end;
              end
            else
              begin
                arrRowA[I] := 'R';

                TEdit(FindComponent('sRed'+IntToStr(iTurn))).Left := TEdit(FindComponent('imgRowA'+IntToStr(i))).Left;
                TEdit(FindComponent('sRed'+IntToStr(iTurn))).Top :=  TEdit(FindComponent('imgRowA'+IntToStr(i))).Top;

                //Diagonal Up check
                if (I + 1 <= 7) AND (arrRowB[I + 1] = 'R') then
                    begin
                      Inc(iDiagonalUp);

                      if (I + 2 <= 7) AND (arrRowC[I + 2] = 'R') then
                        begin
                          Inc(iDiagonalUp);

                          if (I + 3 <= 7) AND (arrRowD[I + 3] = 'R') then
                            Inc(iDiagonalUp);
                        end;
                    end;

                //Horisontal Check
                if arrRowB[I] = 'R' then
                  begin
                    Inc(iHorisontal);

                    if arrRowC[I] = 'R' then
                    begin
                      Inc(iHorisontal);

                      if arrRowD[I] = 'R' then
                        Inc(iHorisontal);
                    end;
                  end;

                //Vertical Check
                if (I - 1 > 1) AND (arrRowA[I - 1] = 'R') then
                  begin
                    Inc(iVertical);

                    if (I - 2 > 1) AND (arrRowA[I - 2] = 'R') then
                    begin
                      Inc(iVertical);

                      if (I - 3 > 1) AND (arrRowA[I - 3] = 'R') then
                        Inc(iVertical);
                    end;
                  end;

                //Diagonal Down Check
                if (I - 1 > 1) AND (arrRowB[I - 1] = 'R') then
                  begin
                    Inc(iDiagonalDown);

                    if (I - 2 > 1) AND (arrRowC[I - 2] = 'R') then
                      begin
                        Inc(iDiagonalDown);

                        if (I - 3 > 1) AND (arrRowD[I - 3] = 'R') then
                          Inc(iDiagonalDown);
                      end;
                  end;

                bBlueTurn := True;

                if (iDiagonalUp >= 4) OR (iDiagonalDown >= 4) OR (iHorisontal >= 4) OR (iVertical >= 4)  then
                  begin
                    ShowMessage('Red Wins!');
                    Inc(iWinsPlayer2);
                    bReset := True;
                  end;
              end;
          end;
      end;
  end;

  iVertical := 1;
  iDiagonalUp := 1;
  iDiagonalDown := 1;
  iHorisontal := 1;

  if bBlueTurn = True then
    begin
      sRedDisplay.Visible := False;
      sBlueDisplay.Visible := True;

      lblTurnDisplay.Caption := 'Blue''s   turn!';
      lblTurnDisplay.Font.Color := clBlue;
    end
  else
    begin
      sRedDisplay.Visible := True;
      sBlueDisplay.Visible := False;

      lblTurnDisplay.Caption := 'Red''s   turn!';
      lblTurnDisplay.Font.Color := clRed;
    end;

  if bReset = True then
    begin
      ClearBoard;
      bReset := False;
    end;
  
  Save;
end;

end.
