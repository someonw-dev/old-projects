program Triangle_p;

uses
  Vcl.Forms,
  Triangle_U in 'Triangle_U.pas' {frmTriangle};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTriangle, frmTriangle);
  Application.Run;
end.
