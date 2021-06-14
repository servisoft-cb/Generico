unit UDMBanco;

interface

uses
  SysUtils, Classes, DB, DBTables, DBIProcs, FMTBcd, DBClient, Provider, SqlExpr;

type
  TDMBanco = class(TDataModule)
    tBcoBrasil: TTable;
    tBcoBrasilCodConta: TIntegerField;
    tBcoBrasilCodCedente: TStringField;
    tBcoBrasilAceite: TStringField;
    tBcoBrasilInstrucao: TStringField;
    tBcoBrasilDiasProtesto: TIntegerField;
    tBcoBrasilCaminho: TStringField;
    tBcoBrasilNome: TStringField;
    tBcoBrasilExtensao: TStringField;
    tBcoBrasilVlrDesconto: TFloatField;
    tBcoBrasilVlrJurosPorDia: TFloatField;
    tBcoBrasilEspecieDoc: TStringField;
    tBcoBrasilNumCarteira: TStringField;
    tBcoBrasilDtLimiteDesconto: TDateField;
    tBcoBrasilCodTransmissao: TStringField;
    tBcoBrasilTipoDocumento: TStringField;
    tBcoBrasilMensagem1: TStringField;
    tBcoBrasilMensagem2: TStringField;
    tBcoBrasilNumRemessa: TIntegerField;
    tBcoBrasilCodComando: TStringField;
    tBcoBrasilInstrucao2: TStringField;
    tBcoBrasilVlrIOF: TFloatField;
    tBcoBrasilMoeda: TStringField;
    tBcoBrasilVariacaoCarteira: TStringField;
    tBcoBrasilCodTipoCobranca: TIntegerField;
    dsBcoBrasil: TDataSource;
    tBcoItau: TTable;
    tBcoItauCodConta: TIntegerField;
    tBcoItauCodCedente: TStringField;
    tBcoItauCarteira: TStringField;
    tBcoItauAceite: TStringField;
    tBcoItauInstrucao: TStringField;
    tBcoItauDiasProtesto: TIntegerField;
    tBcoItauCaminho: TStringField;
    tBcoItauNome: TStringField;
    tBcoItauExtensao: TStringField;
    tBcoItauVlrDesconto: TFloatField;
    tBcoItauVlrJurosPorDia: TFloatField;
    tBcoItauEspecieDoc: TStringField;
    tBcoItauInstrCobranca1: TStringField;
    tBcoItauInstrCobranca2: TStringField;
    tBcoItauNumCarteira: TStringField;
    tBcoItauDtLimiteDesconto: TDateField;
    tBcoItauTipoJuro: TStringField;
    tBcoItauTipoDesconto: TStringField;
    tBcoItauTaxaMulta: TFloatField;
    dsBcoItau: TDataSource;
    tBcoItauVlrTaxaBoleto: TFloatField;
    tBcoCaixa: TTable;
    dsBcoCaixa: TDataSource;
    tBcoCaixaCodConta: TIntegerField;
    tBcoCaixaAceite: TStringField;
    tBcoCaixaInstrucao: TStringField;
    tBcoCaixaDiasProtesto: TIntegerField;
    tBcoCaixaCaminho: TStringField;
    tBcoCaixaNome: TStringField;
    tBcoCaixaExtensao: TStringField;
    tBcoCaixaVlrJurosPorDia: TFloatField;
    tBcoCaixaEspecieDoc: TStringField;
    tBcoCaixaNumCarteira: TStringField;
    tBcoCaixaTipoDocumento: TStringField;
    tBcoCaixaMensagem1: TStringField;
    tBcoCaixaNumRemessa: TIntegerField;
    tBcoCaixaCodComando: TStringField;
    tBcoCaixaInstrucao2: TStringField;
    tBcoCaixaVlrIOF: TFloatField;
    tBcoCaixaMoeda: TStringField;
    tBcoCaixaVariacaoCarteira: TStringField;
    tBcoCaixaCodTipoCobranca: TIntegerField;
    tBcoCaixaComissaoPermanencia: TStringField;
    tBcoSantander: TTable;
    dsBcoSantander: TDataSource;
    tBcoSantanderCodConta: TIntegerField;
    tBcoSantanderCodCedente: TStringField;
    tBcoSantanderCarteira: TStringField;
    tBcoSantanderAceite: TStringField;
    tBcoSantanderInstrucao: TStringField;
    tBcoSantanderDiasProtesto: TIntegerField;
    tBcoSantanderCaminho: TStringField;
    tBcoSantanderNome: TStringField;
    tBcoSantanderExtensao: TStringField;
    tBcoSantanderVlrDesconto: TFloatField;
    tBcoSantanderVlrJurosPorDia: TFloatField;
    tBcoSantanderEspecieDoc: TStringField;
    tBcoSantanderNumCarteira: TStringField;
    tBcoSantanderDtLimiteDesconto: TDateField;
    tBcoSantanderTipoJuro: TStringField;
    tBcoSantanderTipoDesconto: TStringField;
    tBcoSantanderTaxaMulta: TFloatField;
    tBcoSantanderCodTransmissao: TStringField;
    tBcoSantanderNumRemessa: TIntegerField;
    tBcoSantanderFormaCadastramento: TIntegerField;
    tBcoSantanderCodProtesto: TStringField;
    tBcoSantanderCodBaixa: TStringField;
    tBcoSantanderCodCompensacao: TStringField;
    tBcoSantanderTipoDocumento: TStringField;
    tBcoSantanderDiasBaixa: TIntegerField;
    tBcoSantanderVlrIOF: TFloatField;
    tBcoSantanderCodMulta: TStringField;
    tBcoSantanderDtMulta: TDateField;
    tBcoSantanderVlrMulta: TFloatField;
    tBcoSantanderTipoDesconto2: TStringField;
    tBcoSantanderDtLimiteDesconto2: TDateField;
    tBcoSantanderVlrDesconto2: TFloatField;
    tBcoSantanderMensagem1: TStringField;
    tBcoSantanderMensagem2: TStringField;
    sdsEspecie: TSQLDataSet;
    sdsEspecieID: TIntegerField;
    sdsEspecieCODIGO: TStringField;
    sdsEspecieNOME: TStringField;
    sdsEspecieTIPO_REG: TStringField;
    sdsEspecieID_BANCO: TIntegerField;
    sdsEspecieCOD_REDUZIDO: TStringField;
    dspEspecie: TDataSetProvider;
    cdsEspecie: TClientDataSet;
    cdsEspecieID: TIntegerField;
    cdsEspecieCODIGO: TStringField;
    cdsEspecieNOME: TStringField;
    cdsEspecieTIPO_REG: TStringField;
    cdsEspecieID_BANCO: TIntegerField;
    cdsEspecieCOD_REDUZIDO: TStringField;
    dsEspecie: TDataSource;
    tBcoSantanderComplemento: TStringField;
    tBcoSantanderGerarNossoNumero: TStringField;
    procedure tBcoBrasilAfterPost(DataSet: TDataSet);
    procedure tBcoItauAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBanco: TDMBanco;

implementation

uses UDM1;

{$R *.dfm}

procedure TDMBanco.tBcoBrasilAfterPost(DataSet: TDataSet);
begin
  DbiSaveChanges(tBcoBrasil.Handle);
end;

procedure TDMBanco.tBcoItauAfterPost(DataSet: TDataSet);
begin
  DbiSaveChanges(tBcoItau.Handle);
end;

procedure TDMBanco.DataModuleCreate(Sender: TObject);
begin
  cdsEspecie.Close;
  sdsEspecie.ParamByName('ID_BANCO').AsInteger := 4; //SANTANDER
  cdsEspecie.Open;
end;

end.
