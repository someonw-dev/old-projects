program Project1;

uses
  Vcl.Forms,
  Snake in 'Snake.pas' {frmSnake};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSnake, frmSnake);
  Application.Run;
end.
