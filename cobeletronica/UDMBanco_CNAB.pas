unit UDMBanco_CNAB;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TDMBanco_CNAB = class(TDataModule)
    sdsBanco_CNAB: TSQLDataSet;
    dspBanco_CNAB: TDataSetProvider;
    cdsBanco_CNAB: TClientDataSet;
    dsBanco_CNAB: TDataSource;
    sdsBanco_CNABCODCONTA: TIntegerField;
    sdsBanco_CNABCODCEDENTE: TStringField;
    sdsBanco_CNABACEITE: TStringField;
    sdsBanco_CNABINSTRUCAO: TStringField;
    sdsBanco_CNABDIASPROTESTO: TIntegerField;
    sdsBanco_CNABCAMINHO: TStringField;
    sdsBanco_CNABNOME: TStringField;
    sdsBanco_CNABEXTENSAO: TStringField;
    sdsBanco_CNABVLRDESCONTO: TFloatField;
    sdsBanco_CNABVLRJUROSPORDIA: TFloatField;
    sdsBanco_CNABESPECIEDOC: TStringField;
    sdsBanco_CNABNUMCARTEIRA: TStringField;
    sdsBanco_CNABDTLIMITEDESCONTO: TDateField;
    sdsBanco_CNABCODTRANSMISSAO: TStringField;
    sdsBanco_CNABTIPODOCUMENTO: TIntegerField;
    sdsBanco_CNABMENSAGEM1: TStringField;
    sdsBanco_CNABMENSAGEM2: TStringField;
    sdsBanco_CNABNUMREMESSA: TIntegerField;
    sdsBanco_CNABCODCOMANDO: TStringField;
    sdsBanco_CNABINSTRUCAO2: TStringField;
    sdsBanco_CNABVLRIOF: TFloatField;
    sdsBanco_CNABMOEDA: TStringField;
    sdsBanco_CNABVARIACAOCARTEIRA: TStringField;
    sdsBanco_CNABCODTIPOCOBRANCA: TIntegerField;
    cdsBanco_CNABCODCONTA: TIntegerField;
    cdsBanco_CNABCODCEDENTE: TStringField;
    cdsBanco_CNABACEITE: TStringField;
    cdsBanco_CNABINSTRUCAO: TStringField;
    cdsBanco_CNABDIASPROTESTO: TIntegerField;
    cdsBanco_CNABCAMINHO: TStringField;
    cdsBanco_CNABNOME: TStringField;
    cdsBanco_CNABEXTENSAO: TStringField;
    cdsBanco_CNABVLRDESCONTO: TFloatField;
    cdsBanco_CNABVLRJUROSPORDIA: TFloatField;
    cdsBanco_CNABESPECIEDOC: TStringField;
    cdsBanco_CNABNUMCARTEIRA: TStringField;
    cdsBanco_CNABDTLIMITEDESCONTO: TDateField;
    cdsBanco_CNABCODTRANSMISSAO: TStringField;
    cdsBanco_CNABTIPODOCUMENTO: TIntegerField;
    cdsBanco_CNABMENSAGEM1: TStringField;
    cdsBanco_CNABMENSAGEM2: TStringField;
    cdsBanco_CNABNUMREMESSA: TIntegerField;
    cdsBanco_CNABCODCOMANDO: TStringField;
    cdsBanco_CNABINSTRUCAO2: TStringField;
    cdsBanco_CNABVLRIOF: TFloatField;
    cdsBanco_CNABMOEDA: TStringField;
    cdsBanco_CNABVARIACAOCARTEIRA: TStringField;
    cdsBanco_CNABCODTIPOCOBRANCA: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspBanco_CNABUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBanco_CNAB: TDMBanco_CNAB;
  ctBanco_CNAB : String;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMBanco_CNAB.DataModuleCreate(Sender: TObject);
begin
  ctBanco_CNAB := sdsBanco_CNAB.CommandText;
end;

procedure TDMBanco_CNAB.dspBanco_CNABUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  Response := rrAbort;
  raise exception.Create(E.Message);
end;

end.
