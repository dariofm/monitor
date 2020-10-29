unit ufrmConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,IniFiles,
  dxSkinsDefaultPainters, Vcl.Menus, Vcl.StdCtrls, Vcl.Samples.Spin, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, Vcl.ExtCtrls, cxPC, frxClass, frxDBSet, cxDBEdit, Data.DB,
  frxDesgn, cxSpinEdit;
type
  TCarregaEmitente = Class(TThread)
  protected
    procedure Execute; override;

  End;

type
  TfrmConfig = class(TForm)
    cxButton1: TcxButton;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Label4: TLabel;
    Label1: TLabel;
    cxBoxImpressora: TcxComboBox;
    SpinTempo: TSpinEdit;
    cxButton2: TcxButton;
    Shape1: TShape;
    frxDBDatasetCupom: TfrxDBDataset;
    DataSource1: TDataSource;
    Label3: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label5: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label6: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label7: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label8: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label9: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    Label10: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    Label11: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    Label12: TLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    cxButton3: TcxButton;
    TimerAtualizaCadastro: TTimer;
    frxDesigner1: TfrxDesigner;
    DataSource2: TDataSource;
    lblsStatus: TLabel;
    DataSource3: TDataSource;
    cxCbConfirmImp: TcxComboBox;
    Label14: TLabel;
    cxButton4: TcxButton;
    Label15: TLabel;
    cxComboBox1: TcxComboBox;
    Label2: TLabel;
    cxBoxImpressoraRestaurante: TcxComboBox;
    Label13: TLabel;
    frxDBDatasetCozinh: TfrxDBDataset;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

uses ufrmPrincipal, udmDados;

procedure TfrmConfig.cxButton1Click(Sender: TObject);
var
  ArqINI: TIniFile;
begin
  // Cria o arquivo "Configuracao.ini" no mesmo diretório da aplicação, com o nome Config.ini
  ArqINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Configuracao.ini');
  try
    // Grava os dados no arquivo "Config.ini"
    ArqINI.WriteString('Parametro', 'Intervalo', SpinTempo.Text);
    //ArqINI.WriteString('Parametro', 'IntervaloErp', SpinErp.Text);
    ArqINI.WriteString('Parametro', 'Impressora1', cxBoxImpressora.Text);
    ArqINI.WriteString('Parametro', 'Impressora2', cxBoxImpressoraRestaurante.Text);
    ArqINI.WriteString('Parametro', 'AutoImp', cxCbConfirmImp.Text);
  finally
    // Liberar a referência do arquivo da memória
    ArqINI.Free;
  end;
  // Apresenta a mensagem


  if dmDados.tblEmitente.State in [dsEdit] then
  begin
    dmDados.tblEmitente.Post;
  end;

  if dmDados.tblParam.State in [dsEdit] then
  begin
    dmDados.tblParam.Post;
  end;


frmPrincipal.TimeMonitor.Interval := TRUNC(frmConfig.SpinTempo.Value * 1000);

close;

end;

procedure TfrmConfig.cxButton2Click(Sender: TObject);
begin
  dmDados.frxReportCupom.clear;
  dmDados.frxReportCupom.LoadFromFile('C:\Kimmera Monitor\notamanual.fr3');
  dmDados.frxReportCupom.DesignReport;
end;

procedure TfrmConfig.cxButton3Click(Sender: TObject);
var
  ThreadGravar:TCarregaEmitente;
begin


  ThreadGravar := TCarregaEmitente.Create(true);
  ThreadGravar.FreeOnTerminate := True;
  ThreadGravar.Resume;

end;

procedure TfrmConfig.cxButton4Click(Sender: TObject);
begin
  WinExec('C:\Kimmera Monitor\install.bat',1);
end;

procedure TfrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    frmprincipal.TimeMonitor.Enabled := true;
end;

{ TCarregaEmitente }



{ TCarregaEmitente }

procedure TCarregaEmitente.Execute;
begin
  Priority := tpLower;

    WinExec('C:\Kimmera Monitor\App\dados.exe',0);
    ShowMessage('Para que as configurações tenham efeitos o sistema precisa ser reiniciado');


  inherited;

end;

end.
