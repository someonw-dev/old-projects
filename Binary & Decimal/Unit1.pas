unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Math;

type
  TForm1 = class(TForm)
    btnDecimalConversion: TButton;
    edtDecimalInput: TEdit;
    redOutput: TRichEdit;
    edtBinaryInput: TEdit;
    btnBinaryConversion: TButton;
    lblBinary: TLabel;
    lblDecimal: TLabel;
    procedure btnBinaryConversionClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDecimalConversionClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnBinaryConversionClick(Sender: TObject);
var
  sInput : string;
  K, iExponent, iNumber, iDecimal, iMultiply, I : Integer;
  bWrongChar : Boolean;
  cChar : Char;
begin
  sInput := edtBinaryInput.Text;
  bWrongChar := False;

  //This and the following if statement is just validation ignore it.
  for I := 1 to Length(sInput) do
    begin
      //Reason I used CharInSet here is just to get rid of an annoying warning that pops up still part of the validation so ignore it
      cChar := sInput[I];
      if NOT CharInSet(cChar, ['0', '1']) then
        bWrongChar := True;
    end;


  if bWrongChar = True then
    ShowMessage('Please only use binary numbers (0 & 1)')
  else
  begin
    //This going to be used to calculate the decimal from the first binary number all the way down to the last number.
    iExponent := Length(sInput) - 1;
    //Initializing the decimal number.
    iDecimal := 0;

    for K := 1 to Length(sInput) do
      begin
        iNumber := StrToInt(Copy(sInput, K, 1));
        //To use the Power as below you need to add the math function at the top!
        //Ceil is just to make sure the answer is a integer.
        iMultiply := Ceil(Power(2, iExponent));

        iDecimal := iDecimal + (iNumber * iMultiply);
        //Decrements the exponent for the following number.
        Dec(iExponent);
      end;

    //Output
    redOutput.Lines.Clear;
    redOutput.Lines.Add('Binary Input: ' + #9 + sInput);
    redOutput.Lines.Add('Decimal Output: ' + #9 + IntToStr(iDecimal));
  end;
end;

procedure TForm1.btnDecimalConversionClick(Sender: TObject);
var
  sInput, sBinaryConcat, sRemainder : String;
  I, iNumber, iRemainder : Integer;
  cChar : Char;
  bWrongChar : Boolean;
begin
  sInput := edtDecimalInput.Text;

  bWrongChar := False;

  //This and the following if statement is just validation ignore it.
  for I := 1 to Length(sInput) do
    begin
      //Reason I used CharInSet here is just to get rid of an annoying warning that pops up still part of the validation so ignore it
      cChar := sInput[I];
      if NOT CharInSet(cChar, ['0'..'9']) then
        bWrongChar := True;
    end;

  if bWrongChar = True then
    ShowMessage('Please only use decimal numbers (1-9)')
  else
    begin
      iNumber := StrToInt(sInput);
      sBinaryConcat := '';

      //Repeat until number has been divided to 0
      repeat
        iRemainder := iNumber mod 2;
        //Reason i turn this into string is so that i can concat it later on.
        sRemainder := IntToStr(iRemainder);

        sBinaryConcat := sRemainder + sBinaryConcat;
        iNumber := iNumber div 2;
      until (iNumber < 1);

    redOutput.Lines.Clear;
    redOutput.Lines.Add('Decimal Input: ' + #9 + sInput);
    redOutput.Lines.Add('Binary Output: ' + #9 + sBinaryConcat);
    end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  redOutput.Paragraph.TabCount := 2;
  redOutput.Paragraph.Tab[200];
end;

end.
