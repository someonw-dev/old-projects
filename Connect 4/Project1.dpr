program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {frmConnect4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmConnect4, frmConnect4);
  Application.Run;
end.
