unit ufrmConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,IniFiles,
  dxSkinsDefaultPainters, Vcl.Menus, Vcl.StdCtrls, Vcl.Samples.Spin, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, Vcl.ExtCtrls, cxPC, frxClass, frxDBSet, cxDBEdit, Data.DB,
  frxDesgn;

type
  TfrmConfig = class(TForm)
    cxButton1: TcxButton;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    cxBoxImpressora: TcxComboBox;
    SpinTempo: TSpinEdit;
    SpinEdit1: TSpinEdit;
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
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
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
  // Cria o arquivo "Configuracao.ini" no mesmo diret�rio da aplica��o, com o nome Config.ini
  ArqINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Configuracao.ini');
  try
    // Grava os dados no arquivo "Config.ini"
    ArqINI.WriteString('Parametro', 'Intervalo', SpinTempo.Text);
    ArqINI.WriteString('Parametro', 'Impressora', cxBoxImpressora.Text);
  finally
    // Liberar a refer�ncia do arquivo da mem�ria
    ArqINI.Free;
  end;
  // Apresenta a mensagem

frmPrincipal.TimeMonitor.Interval := TRUNC(frmConfig.SpinTempo.Value * 1000);
end;

procedure TfrmConfig.cxButton2Click(Sender: TObject);
begin
  dmDados.frxReportCupom.clear;
  dmDados.frxReportCupom.LoadFromFile('C:\Kimmera Monitor\CupomMei.fr3');
  dmDados.frxReportCupom.DesignReport;
end;

procedure TfrmConfig.cxButton3Click(Sender: TObject);
begin

  WinExec('C:\Kimmera Monitor\App\dados.exe',0);

  TimerAtualizaCadastro.Enabled := true;
  dmDados.tblEmitente.Refresh;
  TimerAtualizaCadastro.Enabled := false;

end;

end.
