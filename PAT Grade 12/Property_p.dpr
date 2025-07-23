program Property_p;

uses
  Vcl.Forms,
  Login_u in 'Login_u.pas' {frmLogin},
  Vcl.Themes,
  Vcl.Styles,
  User_u in 'User_u.pas',
  Map_u in 'Map_u.pas',
  PropertyMap_u in 'PropertyMap_u.pas' {frmMap},
  Admin_u in 'Admin_u.pas' {frmAdmin},
  Settings_u in 'Settings_u.pas' {frmSettings},
  Register_u in 'Register_u.pas' {frmRegister},
  Setup_u in 'Setup_u.pas' {frmSetup},
  Properties_u in 'Properties_u.pas' {frmProperties},
  Visuals_u in 'Visuals_u.pas',
  Validation_u in 'Validation_u.pas',
  Statistics_u in 'Statistics_u.pas' {frmStatistics},
  PropertyDisplay_u in 'PropertyDisplay_u.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmMap, frmMap);
  Application.CreateForm(TfrmAdmin, frmAdmin);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TfrmRegister, frmRegister);
  Application.CreateForm(TfrmSetup, frmSetup);
  Application.CreateForm(TfrmProperties, frmProperties);
  Application.CreateForm(TfrmStatistics, frmStatistics);
  Application.Run;
end.
