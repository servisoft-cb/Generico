unit UDMNFeFB;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TDMNFeFB = class(TDataModule)
    sdsNotaFiscal_NFe: TSQLDataSet;
    dspNotaFiscal_NFe: TDataSetProvider;
    cdsNotaFiscal_NFe: TClientDataSet;
    dsNotaFiscal_NFe: TDataSource;
    sdsNotaFiscal_NFeFILIAL: TIntegerField;
    sdsNotaFiscal_NFeNUMSEQ: TIntegerField;
    sdsNotaFiscal_NFeITEM: TIntegerField;
    sdsNotaFiscal_NFeTIPO: TStringField;
    sdsNotaFiscal_NFeITEMTIPO: TIntegerField;
    sdsNotaFiscal_NFeDESCRICAO: TStringField;
    sdsNotaFiscal_NFeMOTIVO: TMemoField;
    cdsNotaFiscal_NFeFILIAL: TIntegerField;
    cdsNotaFiscal_NFeNUMSEQ: TIntegerField;
    cdsNotaFiscal_NFeITEM: TIntegerField;
    cdsNotaFiscal_NFeTIPO: TStringField;
    cdsNotaFiscal_NFeITEMTIPO: TIntegerField;
    cdsNotaFiscal_NFeDESCRICAO: TStringField;
    cdsNotaFiscal_NFeMOTIVO: TMemoField;
    sdsNotaFiscal_NFeNFEPROTOCOLO: TStringField;
    sdsNotaFiscal_NFeNFERECIBO: TStringField;
    sdsNotaFiscal_NFeXML: TMemoField;
    cdsNotaFiscal_NFeNFEPROTOCOLO: TStringField;
    cdsNotaFiscal_NFeNFERECIBO: TStringField;
    cdsNotaFiscal_NFeXML: TMemoField;
    qProximoItemTipo: TSQLQuery;
    qProximoItemTipoITEMTIPO: TIntegerField;
    sdsNotaFiscal_NFeDATAHORAAUT: TSQLTimeStampField;
    sdsNotaFiscal_NFeDTCADASTRO: TDateField;
    sdsNotaFiscal_NFeHRCADASTRO: TTimeField;
    cdsNotaFiscal_NFeDATAHORAAUT: TSQLTimeStampField;
    cdsNotaFiscal_NFeDTCADASTRO: TDateField;
    cdsNotaFiscal_NFeHRCADASTRO: TTimeField;
    sdsNFE_EMAIL: TSQLDataSet;
    sdpNFE_EMAIL: TDataSetProvider;
    cdsNFE_EMAIL: TClientDataSet;
    dsNFE_EMAIL: TDataSource;
    sdsNFE_EMAILID: TIntegerField;
    sdsNFE_EMAILNOME: TStringField;
    sdsNFE_EMAILEMAIL: TStringField;
    cdsNFE_EMAILID: TIntegerField;
    cdsNFE_EMAILNOME: TStringField;
    cdsNFE_EMAILEMAIL: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspNotaFiscal_NFeUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Abre_NotaFiscal_NFe(Filial, NumSeq: Integer; Tipo: String);
    function fnc_proximo_ItemTipo(Filial, NumSeq: Integer; Tipo: String): Integer;
  end;

var
  DMNFeFB: TDMNFeFB;
  ctNotaFiscal_NFe: String;
  ctNFe_Email: String;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMNFeFB.Abre_NotaFiscal_NFe(Filial, NumSeq: Integer;
  Tipo: String);
begin
  cdsNotaFiscal_NFe.Close;
  sdsNotaFiscal_NFe.CommandText := ctNotaFiscal_NFe
                                 + ' WHERE FILIAL = ' + IntToStr(Filial)
                                 + '   AND NUMSEQ = ' + IntToStr(NumSeq)
                                 + '   AND TIPO = ' + QuotedStr(Tipo);
  cdsNotaFiscal_NFe.Open;
end;

procedure TDMNFeFB.DataModuleCreate(Sender: TObject);
begin
  ctNotaFiscal_NFe := sdsNotaFiscal_NFe.CommandText;
  ctNFe_Email      := sdsNFE_EMAIL.CommandText;
end;

procedure TDMNFeFB.dspNotaFiscal_NFeUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  Response := rrAbort;
  raise exception.Create(E.Message);
end;

function TDMNFeFB.fnc_proximo_ItemTipo(Filial, NumSeq: Integer;
  Tipo: String): Integer;
begin
  Result := 0;
  qProximoItemTipo.Close;
  qProximoItemTipo.ParamByName('Filial').AsInteger := Filial;
  qProximoItemTipo.ParamByName('NumSeq').AsInteger := NumSeq;
  qProximoItemTipo.ParamByName('Tipo').AsString    := Tipo;
  qProximoItemTipo.Open;
  Result := qProximoItemTipoITEMTIPO.AsInteger + 1;
end;

end.
