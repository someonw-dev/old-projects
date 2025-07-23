unit User_u;

interface

uses
  Vcl.Dialogs, System.SysUtils, Data.DB, Data.Win.ADODB, Hash;
  
type
  TAccount = class(TObject)
    private
      fUsername, fAccountID, fTheme, fName, fSurname, fContactDetails : String;
    public
      constructor Create (sUserID, sUsername, sName, sSurname, sTheme : string; bAdmin : Boolean; sContactDetails :String);
      function getTheme : string;
      function getUsername : string;
      function getName : String;
      function getSurname : String;
      function getEmail : String;
      function getUserID : string;
      procedure setTheme(sTheme : String);
      procedure setUsername(sUsername : String);
      procedure setName(sName : String);
      procedure setSurname(sSurname : String);
      procedure setPassword(sPassword : String);
      procedure setContact(sContactDetails : String);
      procedure Log(sChange : String);
      procedure MatchUserID; overload;
      procedure MatchUserID(sUserID : String); overload;
      procedure setTable(tblAccounts : TADOTable);
      procedure LogOut;
    var
      tblUsers : TADOTable;

  end;

implementation

{ TProperty }

constructor TAccount.Create(sUserID, sUsername, sName, sSurname, sTheme : string; bAdmin : Boolean; sContactDetails :String);
begin
  fAccountID := sUserID;
  fUsername := sUsername;
  fName := sName;
  fSurname := sSurname;
  fTheme := sTheme;
  fContactDetails := sContactDetails;
end;

function TAccount.getEmail: String;
begin
  Result := fContactDetails;
end;

function TAccount.getName: String;
begin
  Result := fName;
end;

function TAccount.getSurname: String;
begin
  Result := fSurname;
end;

function TAccount.getTheme: string;
begin
  Result := fTheme;
end;

function TAccount.getUserID: string;
begin
  Result := fAccountID;
end;

function TAccount.getUsername: string;
begin
  Result := fUsername;
end;

procedure TAccount.Log(sChange: String);
var
  tLog : Textfile;
  sDate, sFileName, sTime, sYearMonth, sDay : String;
  iPosFirst, iPosLast : Integer;
begin
  sDate := DateToStr(Now);
  sTime := TimeToStr(Now);

  iPosFirst := Pos('/', sDate);
  iPosLast := LastDelimiter('/', sDate);

  //gets current year and month for the textfile name
  sYearMonth := Copy(sDate, 1, iPosLast - 1);
  //sets the / to a ' ' because files dont allow special characters
  sYearMonth[iPosFirst] := ' ';
  sFileName := sYearMonth;

  sDay := Copy(sDate, iPosLast + 1, Length(sDate) - (iPosLast));

  AssignFile(tLog, sFileName + '.txt');
  
  if FileExists(sFileName + '.txt') then
    Append(tLog)
  else
    //if doesnt find the file creates it.
    Rewrite(tLog);
    
  Writeln(tLog, sDay + ' ' + sTime + ': ' + fAccountID + '(' + fUsername + ')' + ' ' + sChange);
  
  CloseFile(tLog);
end;

procedure TAccount.LogOut;
begin
  Log('logged out.');
  FreeAndNil(self);
end;

procedure TAccount.MatchUserID(sUserID: String);
begin
//matches the user ID in tblUsers but for changing other accounts
  tblUsers.First;

  while not tblUsers.Eof do
    begin
      if tblUsers['UserID'] = sUserID then
        Break;

      tblUsers.Next;
    end;
end;

procedure TAccount.MatchUserID;
begin
  //matches the user ID in tblUsers so that i dont have to do it anywhere else
  tblUsers.First;

  while not tblUsers.Eof do
    begin
      if tblUsers['UserID'] = fAccountID then
        Break;

      tblUsers.Next;
    end;
end;

procedure TAccount.setContact(sContactDetails: String);
begin
  fContactDetails := sContactDetails;

  tblUsers.Edit;
  tblUsers['ContactInfo'] := fContactDetails;
  tblUsers.Post;

  Log('changed their contact info.')
end;

procedure TAccount.setName(sName: String);
begin
  fName := sName;

  tblUsers.Edit;
  tblUsers['Name'] := fName;
  tblUsers.Post;

  Log('changed their name.')
end;

procedure TAccount.setPassword(sPassword: String);
begin
  tblUsers.Edit;
  tblUsers['Password'] := THashSHA1.GetHashString(sPassword + fAccountID);;
  tblUsers.Post;

  Log('changed their password.');
end;

procedure TAccount.setSurname(sSurname : String);
begin
  fSurname := sSurname;

  tblUsers.Edit;
  tblUsers['Surname'] := fSurname;
  tblUsers.Post;

  Log('changed their surname.')
end;

procedure TAccount.setTable(tblAccounts : TADOTable);
begin
  tblUsers := tblAccounts;
end;

procedure TAccount.setTheme(sTheme: String);
begin
  fTheme := sTheme;

  tblUsers.Edit;
  tblUsers['Theme'] := fTheme;
  tblUsers.Post;

  Log('changed their theme.')
end;

procedure TAccount.setUsername(sUsername: String);
begin
  fUsername := sUsername;

  tblUsers.Edit;
  tblUsers['Username'] := fUsername;
  tblUsers.Post;

  Log('changed their username.')
end;

end.
