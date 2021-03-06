unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit,inifiles,
  cxMaskEdit, cxSpinEdit, Vcl.Menus, Vcl.Samples.Spin, cxButtons, cxDropDownEdit,Printers,
  Vcl.AppEvnts;

type
  TfrmPrincipal = class(TForm)
    TimeMonitor: TTimer;
    lblUltimaNota: TLabel;
    lblStatus: TLabel;
    cxButton1: TcxButton;
    DBGrid1: TDBGrid;
    cxCbUsuario: TcxComboBox;
    cxButton2: TcxButton;
    DBGrid2: TDBGrid;
    TimeCozinha: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    procedure TimeMonitorTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxCbUsuarioPropertiesCloseUp(Sender: TObject);
    procedure TimeCozinhaTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }


  end;

var
  frmPrincipal: TfrmPrincipal;
  intervalo,usuario:string;

implementation

{$R *.dfm}

uses udmDados, ufrmConfig;

procedure TfrmPrincipal.cxButton1Click(Sender: TObject);
begin
  SetWindowPos(frmPrincipal.handle, HWND_NOTOPMOST, frmPrincipal.Left, frmPrincipal.Top,frmPrincipal.Width, frmPrincipal.Height, 0);
  TimeMonitor.Enabled := false;
  TimeCozinha.Enabled := false;

  frmConfig.ShowModal;

end;

procedure TfrmPrincipal.cxCbUsuarioPropertiesCloseUp(Sender: TObject);
var
  ArqINI: TIniFile;
begin
  // Cria o arquivo "Configuracao.ini" no mesmo diret�rio da aplica��o, com o nome Config.ini
  ArqINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Configuracao.ini');
  try
    // Grava os dados no arquivo "Config.ini"
    ArqINI.WriteString('Parametro', 'Usuario', cxCbUsuario.Text);

  finally
    // Liberar a refer�ncia do arquivo da mem�ria
    ArqINI.Free;
  end;

end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin

if messagebox(frmPrincipal.Handle,'Confirmar Sa�da?','Sair',mb_yesno+MB_ICONQUESTION)= idno then
begin
abort;
end
  else
    begin
      frmPrincipal.Free;
      frmPrincipal := nil;
      Application.Terminate;
    end;

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  I:Integer;
  impressoras:TPrinter;
  ArquivoConfig: TIniFile;
begin

  frmConfig.cxBoxImpressora.Properties.Items.Clear;
  frmConfig.cxBoxImpressoraRestaurante.Properties.Items.Clear;
  impressoras:=TPrinter.Create;
  try
  for i := 0 to Printer.Printers. Count - 1 do
  begin
    frmConfig.cxBoxImpressoraRestaurante.Properties.Items.Add(Printer.Printers.Strings[i] );
    frmConfig.cxBoxImpressora.Properties.Items.Add(Printer.Printers.Strings[i] );
    frmConfig.cxBoxImpressora.ItemIndex:=0;
    frmConfig.cxBoxImpressoraRestaurante.ItemIndex:=0;
  end;
  finally
  impressoras.free;
  end;

  ArquivoConfig := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Configuracao.ini');
  TimeMonitor.Interval :=  TRUNC(ArquivoConfig.ReadInteger('Parametro', 'Intervalo', 0)*1000);
  TimeCozinha.Interval :=  TRUNC(ArquivoConfig.ReadInteger('Parametro', 'Intervalo', 0)*1000);
  frmConfig.SpinTempo.Value := ArquivoConfig.ReadInteger('Parametro', 'Intervalo', 0);
  frmConfig.cxCbConfirmImp.Text := ArquivoConfig.ReadString('Parametro', 'AutoImp', '');
  frmConfig.cxCbConfirmaImpCoz.Text := ArquivoConfig.ReadString('Parametro', 'AutoImpCozinha', '');

  try
   frmConfig.cxBoxImpressora.Text :=  ArquivoConfig.ReadString('Parametro', 'Impressora1', '');
   frmConfig.cxBoxImpressoraRestaurante.Text :=  ArquivoConfig.ReadString('Parametro', 'Impressora2', '');
  except
   frmConfig.cxBoxImpressora.Text := '';
  end;

  dmDados.tblUsuario.First;
  cxCbUsuario.Properties.Items.Clear;
  while not dmDados.tblUsuario.Eof do
  begin

    cxCbUsuario.Properties.Items.Add(dmDados.tblUsuario.FieldByName('nome').AsString);
    cxCbUsuario.Text := ArquivoConfig.ReadString('Parametro', 'Usuario', '');
    usuario := ArquivoConfig.ReadString('Parametro', 'Usuario', '');
    dmDados.tblUsuario.Next;
  end;

  ArquivoConfig.Free;


end;



procedure TfrmPrincipal.TimeCozinhaTimer(Sender: TObject);
begin
  lblStatus.Caption := 'Status: Monitorando Nota Manual...';
  dmDados.qryRestaurante.close;
  //dmDados.qryRestaurante.Params[0].Value := usuario;
  dmDados.qryRestaurante.Params[0].Value := 0;
  dmDados.qryRestaurante.open;
  if dmDados.qryRestaurante.RecordCount > 0   then
  begin
    TimeCozinha.Enabled := false;
    if TimeCozinha.Enabled = false then
    begin
      SetWindowPos(frmPrincipal.handle, HWND_TOPMOST, frmPrincipal.Left, frmPrincipal.Top,frmPrincipal.Width, frmPrincipal.Height, 0);
      frmPrincipal.FormStyle := fsStayOnTop;
    end;
    lblUltimaNota.Caption := '�ltima Nota: '+dmDados.qryRestaurante.FieldByName('NUMERO').AsString;
    dmDados.frxReportCupom.Clear;
    dmDados.frxReportCupom.LoadFromFile('C:\Kimmera Monitor\cozinha.fr3');
    dmDados.frxReportCupom.Variables['NUMERO']             := QuotedStr(Format('%10.10d',[dmDados.qryRestaurante.FieldByName('Numero').AsInteger]));
    dmDados.frxReportCupom.Variables['Emissao']            := QuotedStr(DateToStr(date));
    dmDados.frxReportCupom.Variables['hora']               := QuotedStr(TimeToStr(time));
    dmDados.frxReportCupom.Variables['operador']           := QuotedStr(cxCbUsuario.Text);

    if frmConfig.cxCbConfirmaImpCoz.Text = 'Sim' then
    begin
      TimeCozinha.Enabled := false;
      if Application.MessageBox('Imprimir Pedido?','Aten��o',MB_ICONQUESTION + MB_YESNO) = 6 then
      begin
        dmDados.frxReportCupom.PrintOptions.Printer := frmConfig.cxBoxImpressoraRestaurante.Text;
        dmDados.frxReportCupom.PrintOptions.ShowDialog:= false;
        dmDados.frxReportCupom.PrepareReport;
        dmDados.frxReportCupom.Print;
      end;
    end;
      if frmConfig.cxCbConfirmaImpCoz.Text = 'N�o' then
      begin
        dmDados.frxReportCupom.PrintOptions.Printer := frmConfig.cxBoxImpressoraRestaurante.Text;
        dmDados.frxReportCupom.PrintOptions.ShowDialog:= false;
        dmDados.frxReportCupom.PrepareReport;
        dmDados.frxReportCupom.Print;
      end;
  lblStatus.Caption := 'Status: Imprimindo Nota Manual...';
  end;
  dmDados.qryGen.SQL.Clear;
  dmDados.qryGen.SQL.Text := 'UPDATE RESTAURANTE SET IMPRESSO = :P0 WHERE  IMPRESSO = :P2';
  dmDados.qryGen.Params[0].Value := 1;
  dmDados.qryGen.Params[1].Value := 0;
  dmDados.qryGen.ExecSQL;
  TimeCozinha.Enabled := true;
  SetWindowPos(frmPrincipal.handle, HWND_NOTOPMOST, frmPrincipal.Left, frmPrincipal.Top,frmPrincipal.Width, frmPrincipal.Height, 0);

end;

procedure TfrmPrincipal.TimeMonitorTimer(Sender: TObject);
begin
  lblStatus.Caption := 'Status: Monitorando Nota Manual...';
  dmDados.qryNota.close;
  dmDados.qryNota.Params[0].Value := usuario;
  dmDados.qryNota.Params[1].Value := 0;
  dmDados.qryNota.open;
  if dmDados.qryNota.RecordCount > 0   then
  begin
    TimeMonitor.Enabled := false;
    if TimeMonitor.Enabled = false then
    begin
      SetWindowPos(frmPrincipal.handle, HWND_TOPMOST, frmPrincipal.Left, frmPrincipal.Top,frmPrincipal.Width, frmPrincipal.Height, 0);
      frmPrincipal.FormStyle := fsStayOnTop;
    end;
    lblUltimaNota.Caption := '�ltima Nota: '+dmDados.qryNota.FieldByName('NUMERO').AsString;
    dmDados.frxReportCupom.Clear;
    dmDados.frxReportCupom.LoadFromFile('C:\Kimmera Monitor\notamanual.fr3');
    dmDados.frxReportCupom.Variables['NUMERO']             := QuotedStr(Format('%10.10d',[dmDados.qryNota.FieldByName('Numero').AsInteger]));
    dmDados.frxReportCupom.Variables['Nome_Emitente']      := QuotedStr(dmDados.tblEmitenteNOMEFANTASIA.AsString);
    dmDados.frxReportCupom.Variables['Nome_Endereco']      := QuotedStr(dmDados.tblEmitenteENDERECO.AsString+', '+dmDados.tblEmitenteNUMERO.AsString+' - '+dmDados.tblEmitenteBAIRRO.AsString);
    dmDados.frxReportCupom.Variables['Nome_Cliente']       := QuotedStr(dmDados.qryNota.FieldByName('Usuario').AsString);
    dmDados.frxReportCupom.Variables['Emissao']            := QuotedStr(DateToStr(date));
    dmDados.frxReportCupom.Variables['hora']               := QuotedStr(TimeToStr(time));
    dmDados.frxReportCupom.Variables['operador']           := QuotedStr(cxCbUsuario.Text);
    if frmConfig.cxCbConfirmImp.Text = 'Sim' then
    begin
      if Application.MessageBox('Imprimir Comanda?','Aten��o',MB_ICONQUESTION + MB_YESNO) = 6 then
      begin
        dmDados.frxReportCupom.PrintOptions.Printer := frmConfig.cxBoxImpressora.Text;
        dmDados.frxReportCupom.PrintOptions.ShowDialog:= false;
        dmDados.frxReportCupom.PrepareReport;
        dmDados.frxReportCupom.Print;
      end;
    end;
      if frmConfig.cxCbConfirmImp.Text = 'N�o' then
      begin
        dmDados.frxReportCupom.PrintOptions.Printer := frmConfig.cxBoxImpressoraRestaurante.Text;
        dmDados.frxReportCupom.PrintOptions.ShowDialog:= false;
        dmDados.frxReportCupom.PrepareReport;
        dmDados.frxReportCupom.Print;
      end;
  lblStatus.Caption := 'Status: Imprimindo Nota Manual...';
  end;
  dmDados.qryGen.SQL.Clear;
  dmDados.qryGen.SQL.Text := 'UPDATE NOTA_MANUAL SET IMPRESSO = :P0 WHERE USUARIO = :P1 AND IMPRESSO = :P2';
  dmDados.qryGen.Params[0].Value := 1;
  dmDados.qryGen.Params[1].Value := usuario;
  dmDados.qryGen.Params[2].Value := 0;
  dmDados.qryGen.ExecSQL;
  TimeMonitor.Enabled := true;
  SetWindowPos(frmPrincipal.handle, HWND_NOTOPMOST, frmPrincipal.Left, frmPrincipal.Top,frmPrincipal.Width, frmPrincipal.Height, 0);

end;


end.
