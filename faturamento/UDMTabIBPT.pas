unit UDMTabIBPT;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, DBTables;

type
  TDMTabIBPT = class(TDataModule)
    sdsIBPT: TSQLDataSet;
    dspIBPT: TDataSetProvider;
    cdsIBPT: TClientDataSet;
    dsIBPT: TDataSource;
    sdsIBPTID: TIntegerField;
    sdsIBPTCODIGO: TStringField;
    sdsIBPTEX: TStringField;
    sdsIBPTTABELA: TStringField;
    sdsIBPTNOME: TStringField;
    sdsIBPTPERC_NACIONAL: TFloatField;
    sdsIBPTPERC_IMPORTACAO: TFloatField;
    cdsIBPTID: TIntegerField;
    cdsIBPTCODIGO: TStringField;
    cdsIBPTEX: TStringField;
    cdsIBPTTABELA: TStringField;
    cdsIBPTNOME: TStringField;
    cdsIBPTPERC_NACIONAL: TFloatField;
    cdsIBPTPERC_IMPORTACAO: TFloatField;
    qIBPT: TSQLQuery;
    qIBPTPERC_NACIONAL: TFloatField;
    qIBPTPERC_IMPORTACAO: TFloatField;
    sdsIBPTPERC_ESTADUAL: TFloatField;
    sdsIBPTPERC_MUNICIPAL: TFloatField;
    sdsIBPTDT_INICIO: TDateField;
    sdsIBPTDT_FINAL: TDateField;
    sdsIBPTCHAVE: TStringField;
    sdsIBPTVERSAO: TStringField;
    sdsIBPTFONTE: TStringField;
    cdsIBPTPERC_ESTADUAL: TFloatField;
    cdsIBPTPERC_MUNICIPAL: TFloatField;
    cdsIBPTDT_INICIO: TDateField;
    cdsIBPTDT_FINAL: TDateField;
    cdsIBPTCHAVE: TStringField;
    cdsIBPTVERSAO: TStringField;
    cdsIBPTFONTE: TStringField;
    qIBPT_Contador: TSQLQuery;
    qIBPT_ContadorCONTADOR: TIntegerField;
    qIBPTPERC_ESTADUAL: TFloatField;
    qIBPTPERC_MUNICIPAL: TFloatField;
    qFilialCodigo: TIntegerField;
    qFilialEmpresa: TStringField;
    qFilialNomeInterno: TStringField;
    qFilial: TQuery;
    qFilialUF: TStringField;
    qIBPTFONTE: TStringField;
    qIBPTVERSAO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspIBPTUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }
  public
    { Public declarations }
    ctIBPT: String;
    ctqIBPT : String;
    procedure Abre_Tab_IBPT(ID : Integer ; Codigo : String = '' ; EX : String = '');
  end;

var
  DMTabIBPT: TDMTabIBPT;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMTabIBPT.Abre_Tab_IBPT(ID : Integer ; Codigo : String = '' ; EX : String = '');
begin
  cdsIBPT.Close;
  sdsIBPT.CommandText := ctIBPT;
  if ID > 0 then
    sdsIBPT.CommandText := sdsIBPT.CommandText + ' WHERE ID = ' + IntToStr(ID)
  else
  begin
    sdsIBPT.CommandText := sdsIBPT.CommandText + ' WHERE CODIGO = ' + QuotedStr(Codigo)
                             + ' AND EX = ' + QuotedStr(EX);
  end;
  cdsIBPT.Open;
end;

procedure TDMTabIBPT.DataModuleCreate(Sender: TObject);
begin
  ctIBPT  := sdsIBPT.CommandText;
  ctqIBPT := qIBPT.SQL.Text;
end;

procedure TDMTabIBPT.dspIBPTUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  Response := rrAbort;
  raise exception.Create(E.Message);
end;

end.
