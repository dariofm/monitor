unit udmDados;

interface

uses
  System.SysUtils, System.Classes, UniProvider, InterBaseUniProvider, Data.DB,
  DBAccess, Uni, MemDS, frxClass, frxDBSet,inifiles;

type
  TdmDados = class(TDataModule)
    uniConection: TUniConnection;
    InterBaseUniProvider1: TInterBaseUniProvider;
    qryNota: TUniQuery;
    dsNota: TUniDataSource;
    qryGen: TUniQuery;
    qryMaxNota: TUniQuery;
    frxReportCupom: TfrxReport;
    tblEmitente: TUniTable;
    tblEmitenteNOME: TStringField;
    tblEmitenteNOMEFANTASIA: TStringField;
    tblEmitenteTELEFONE: TStringField;
    tblEmitenteCNPJ: TStringField;
    tblEmitenteENDERECO: TStringField;
    tblEmitenteNUMERO: TStringField;
    tblEmitenteBAIRRO: TStringField;
    tblEmitenteCEP: TStringField;
    tblEmitenteCIDADE: TStringField;
    tblParam: TUniTable;
    tblParamCONTROLE: TIntegerField;
    tblUsuario: TUniTable;
    qryNotaID: TIntegerField;
    qryNotaITEM: TIntegerField;
    qryNotaNUMERO: TIntegerField;
    qryNotaEMISSAO: TDateField;
    qryNotaCODIGOINTERNO: TIntegerField;
    qryNotaDESCRICAO: TStringField;
    qryNotaUND: TStringField;
    qryNotaQTD: TFloatField;
    qryNotaVALOR_UNITARIO: TFloatField;
    qryNotaVALOR_TOTAL: TFloatField;
    qryNotaUSUARIO: TStringField;
    qryNotaIMPRESSO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
