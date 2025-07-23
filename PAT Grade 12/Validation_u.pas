unit Validation_u;

interface

uses
  Vcl.Dialogs, System.SysUtils, Data.DB, Data.Win.ADODB, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.controls, Visuals_u;

procedure GeneralValidation(lblOutput : TLabel; edtInput : TLabeledEdit);
procedure SpecifiedLenValidation(lblOutput : TLabel; edtInput : TLabeledEdit; iMax, iMin : Integer);
procedure PassValidation(lblOutput : TLabel; edtInput, edtInputConfirm : TLabeledEdit);
procedure UserValidation(lblOutput : TLabel; edtInput : TLabeledEdit; tblUsers : TADOTable);
function CheckAllowed(sErrType, sInput, sAllowed : String; lblOutput : TLabel) : Boolean; overload;
function CheckAllowed(sErrType, sInput : String; cChar1, cChar2: Char; lblOutput : TLabel): Boolean; overload;
function CheckLength(sErrType, sInput: String; iMax, iMin : Integer; lblOutput : TLabel): Boolean;
function CheckPresence(sInput : String; cChar1, cChar2 : Char) : Boolean;

implementation

procedure UserValidation(lblOutput : TLabel; edtInput : TLabeledEdit; tblUsers : TADOTable);
var
  bFound : Boolean;
begin
  SpecifiedLenValidation(lblOutput, edtInput, 30, 3);

  //makes sure user is unique
  bFound := False;

  tblUsers.First;
  while not tblUsers.Eof do
    begin
      if tblUsers['Username'] = edtInput.Text then
        bFound := True;

      tblUsers.Next;
    end;

  if bFound = True then
    begin
      lblOutput.Caption := 'Username already exists.';

      ChangeEdit(edtInput, bFound);
      CenterLabel(lblOutput, edtInput);
    end;

end;

function CheckPresence(sInput: String; cChar1,
  cChar2: Char): Boolean;
var
  I : Integer;
begin
  //checks presence of a set of characters
  Result := False;

  for I := 1 to Length(sInput) do
    begin
      if CharInSet(sInput[I], [cChar1..cChar2]) then
        Result := True;
    end;
end;

procedure PassValidation(lblOutput : TLabel; edtInput, edtInputConfirm : TLabeledEdit);
var
  sPassword, sStrongerPass : String;
  bError, bCapital, bNum, bUniqueChar : Boolean;
begin
  lblOutput.Caption := '';

  sPassword := edtInput.Text;
  bError := False;
  bCapital := True;
  bNum := True;
  bUniqueChar := True;

  //' ' to 'z' is basically every character you can normally access on your keyboard without using ascii
  if CheckAllowed('Password', sPassword, ' ', 'z', lblOutput) = False then
    bError := True
  else
    if CheckLength('Password', sPassword, 30, 5, lblOutput) = False then
      bError := True
    else
      begin
        //check if password is strong enough
        if CheckPresence(sPassword, 'A', 'Z') = False then
          begin
            bCapital := False;
            sStrongerPass := 'a capital letter '
          end;

        if CheckPresence(sPassword, '0', '9') = False then
          begin
            bNum := False;

            if sStrongerPass = '' then
              sStrongerPass := 'a number'
            else
              sStrongerPass := sStrongerPass + ', a number '
          end;

        if (CheckPresence(sPassword, ':', '@') = False) AND
        (CheckPresence(sPassword, '!', '/') = False) AND
        (CheckPresence(sPassword, '[', '`') = False) then
          begin
            bUniqueChar := False;

            if sStrongerPass = '' then
              sStrongerPass := 'a unique character (!, @)'
            else
              sStrongerPass := sStrongerPass + ', a unique character (!, @)'
          end;

        if (bUniqueChar = False) OR (bNum = False) OR (bCapital = False) then
          begin
            lblOutput.Caption := 'Your password must have: ' + #13 + sStrongerPass;
            bError := True;
          end
        else
          if NOT (edtInput.Text = edtInputConfirm.Text) then
            begin
              bError := True;
              lblOutput.Caption := 'Passwords must match.';
            end;
      end;

  CenterLabel(lblOutput, edtInputConfirm);

  ChangeEdit(edtInput, bError);
  ChangeEdit(edtInputConfirm, bError);

end;
                 //len for length
procedure SpecifiedLenValidation(lblOutput : TLabel; edtInput : TLabeledEdit; iMax, iMin : Integer);
var
  sInput : String;
  bError : Boolean;
begin
  lblOutput.Caption := '';

  sInput := edtInput.Text;
  bError := False;

  if CheckLength('Name', sInput, iMax, iMin, lblOutput) = False then
    bError := True
  else
    if CheckAllowed('Name', sInput, ' ', 'z', lblOutput) = False then
      bError := True;

  CenterLabel(lblOutput, edtInput);
  ChangeEdit(edtInput, bError);
end;

procedure GeneralValidation(lblOutput: TLabel;
  edtInput: TLabeledEdit);
var
  sInput : String;
  bError : Boolean;
begin
  lblOutput.Caption := '';

  sInput := edtInput.Text;
  bError := False;

  if CheckLength('Name', sInput, 30, 1, lblOutput) = False then
    bError := True
  else
    if CheckAllowed('Name', sInput, ' ', 'z', lblOutput) = False then
      bError := True;

  CenterLabel(lblOutput, edtInput);
  ChangeEdit(edtInput, bError);
end;

function CheckLength(sErrType, sInput: String; iMax, iMin : Integer; lblOutput : TLabel): Boolean;
begin
  //checks if valid length using a min and a max and also ensures that there is a string
  Result := True;

  if Length(sInput) = 0 then
    begin
      Result := False;
      lblOutput.Caption := sErrType + ' must have a value.'
    end
  else
    if iMax <= Length(sInput) then
      begin
        Result := False;
        lblOutput.Caption := sErrType + ' can only have ' + #13 + IntToStr(iMax) + ' characters.';
      end
    else
      if iMin > Length(sInput) then
        begin
          Result := False;
          lblOutput.Caption := sErrType + ' must have at least ' + #13 + IntToStr(iMin) + ' characters.';
        end;
end;

function CheckAllowed(sErrType, sInput, sAllowed : String; lblOutput : TLabel): Boolean;
var
  I, K : Integer;
  bInAllowed : Boolean;
begin
  //checks allowed using a string of characters
  Result := True;

  for I := 1 to Length(sInput) do
    begin
      bInAllowed := False;

      for K := 1 to Length(sAllowed) do
        if sAllowed[K] = UpperCase(sInput[I]) then
          begin
            bInAllowed := True;
          end;

      if bInAllowed = False then
        Result := False;
    end;
end;

function CheckAllowed(sErrType, sInput : String; cChar1, cChar2: Char; lblOutput : TLabel): Boolean;
var
  I : Integer;
begin
  //checks if valid between two characters
  Result := True;

  for I := 1 to Length(sInput) do
    begin
      if NOT (CharInSet(sInput[I], [cChar1..cChar2])) then
        Result := False;
    end;

  if Result = False then
    lblOutput.Caption := sErrType + ' must only use' + #13 + 'characters between ''!''-''z''.';
end;

end.
