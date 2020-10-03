program MonitorG6;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  udmDados in 'udmDados.pas' {dmDados: TDataModule},
  ufrmConfig in 'ufrmConfig.pas' {frmConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.Run;
end.
