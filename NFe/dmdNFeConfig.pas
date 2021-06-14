unit dmdNFeConfig;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, DmdDatabase_NFeBD;

type
  TDMNFeConfig = class(TDataModule)
    sdsConfig_NFe: TSQLDataSet;
    sdsConfig_NFeCNPJ_TITULAR: TStringField;
    sdsConfig_NFeCHAVE_ACESSO: TMemoField;
    sdsConfig_NFeVALIDADE_INICIO: TSQLTimeStampField;
    sdsConfig_NFeVALIDADE_FIM: TSQLTimeStampField;
    sdsConfig_NFeID: TIntegerField;
    sdsConfig_NFeID_CERTIFICADO: TIntegerField;
    sdsConfig_NFeAMBIENTE: TIntegerField;
    sdsConfig_NFeCONTINGENCIA: TStringField;
    sdsConfig_NFeLICENCA: TStringField;
    sdsConfig_NFeTEMPO_ESPERA: TIntegerField;
    sdsConfig_NFeUF: TStringField;
    sdsConfig_NFeWEBSERVICE: TStringField;
    sdsConfig_NFeDANFE_DADOS_EMISSOR: TStringField;
    sdsConfig_NFeDANFE_QUADRO_RECIBO: TStringField;
    sdsConfig_NFeDANFE_QUADRO_FATURA: TStringField;
    sdsConfig_NFeDANFE_QUADRO_ISSQN: TStringField;
    sdsConfig_NFeDANFE_SEPARADOR_ITEM: TStringField;
    sdsConfig_NFeDANFE_CONF_PDF: TMemoField;
    sdsConfig_NFeDANFE_QTRIBDEC: TIntegerField;
    sdsConfig_NFeDANFE_RODAPE: TStringField;
    sdsConfig_NFeDANFE_SEM_COLUNA_DESCONTO: TStringField;
    sdsConfig_NFeDANFE_COM_FATURA: TStringField;
    sdsConfig_NFeDANFE_SEM_DADOS_EMITENTE: TStringField;
    sdsConfig_NFeDANFE_SEM_QUADRO_EMITENTE: TStringField;
    sdsConfig_NFeDANFE_SALTAR_LINHA: TStringField;
    sdsConfig_NFeDANFE_CARACTER_SALTAR_LINHA: TStringField;
    sdsConfig_NFeDANFE_MOSTRAR_ST: TStringField;
    sdsConfig_NFeDANFE_OMITIR_RESER_AO_FISCO: TStringField;
    sdsConfig_NFeDANFE_IMP_COLUNA_TRIB_SEM_INF: TStringField;
    sdsConfig_NFeDANFE_NAO_GERAR_ZEROS_ICMS: TStringField;
    sdsConfig_NFeDANFE_NAO_GERAR_ZEROS_IPI: TStringField;
    sdsConfig_NFeDANFE_NAO_GERAR_DADOS_ENTREGA: TStringField;
    sdsConfig_NFeDANFE_NAO_GERAR_DADOS_RETIRADA: TStringField;
    sdsConfig_NFeDANFE_MOSTRAR_FCI: TStringField;
    sdsConfig_NFeDANFE_ALTQUADRORECIBO: TIntegerField;
    dspConfig_NFe: TDataSetProvider;
    cdsConfig_NFe: TClientDataSet;
    cdsConfig_NFeCNPJ_TITULAR: TStringField;
    cdsConfig_NFeCHAVE_ACESSO: TMemoField;
    cdsConfig_NFeVALIDADE_INICIO: TSQLTimeStampField;
    cdsConfig_NFeVALIDADE_FIM: TSQLTimeStampField;
    cdsConfig_NFeID: TIntegerField;
    cdsConfig_NFeID_CERTIFICADO: TIntegerField;
    cdsConfig_NFeAMBIENTE: TIntegerField;
    cdsConfig_NFeCONTINGENCIA: TStringField;
    cdsConfig_NFeLICENCA: TStringField;
    cdsConfig_NFeTEMPO_ESPERA: TIntegerField;
    cdsConfig_NFeUF: TStringField;
    cdsConfig_NFeWEBSERVICE: TStringField;
    cdsConfig_NFeDANFE_DADOS_EMISSOR: TStringField;
    cdsConfig_NFeDANFE_QUADRO_RECIBO: TStringField;
    cdsConfig_NFeDANFE_QUADRO_FATURA: TStringField;
    cdsConfig_NFeDANFE_QUADRO_ISSQN: TStringField;
    cdsConfig_NFeDANFE_SEPARADOR_ITEM: TStringField;
    cdsConfig_NFeDANFE_CONF_PDF: TMemoField;
    cdsConfig_NFeDANFE_QTRIBDEC: TIntegerField;
    cdsConfig_NFeDANFE_RODAPE: TStringField;
    cdsConfig_NFeDANFE_SEM_COLUNA_DESCONTO: TStringField;
    cdsConfig_NFeDANFE_COM_FATURA: TStringField;
    cdsConfig_NFeDANFE_SEM_DADOS_EMITENTE: TStringField;
    cdsConfig_NFeDANFE_SEM_QUADRO_EMITENTE: TStringField;
    cdsConfig_NFeDANFE_SALTAR_LINHA: TStringField;
    cdsConfig_NFeDANFE_CARACTER_SALTAR_LINHA: TStringField;
    cdsConfig_NFeDANFE_MOSTRAR_ST: TStringField;
    cdsConfig_NFeDANFE_OMITIR_RESER_AO_FISCO: TStringField;
    cdsConfig_NFeDANFE_IMP_COLUNA_TRIB_SEM_INF: TStringField;
    cdsConfig_NFeDANFE_NAO_GERAR_ZEROS_ICMS: TStringField;
    cdsConfig_NFeDANFE_NAO_GERAR_ZEROS_IPI: TStringField;
    cdsConfig_NFeDANFE_NAO_GERAR_DADOS_ENTREGA: TStringField;
    cdsConfig_NFeDANFE_NAO_GERAR_DADOS_RETIRADA: TStringField;
    cdsConfig_NFeDANFE_MOSTRAR_FCI: TStringField;
    cdsConfig_NFeDANFE_ALTQUADRORECIBO: TIntegerField;
    dsConfig_NFe: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMNFeConfig: TDMNFeConfig;

implementation

{$R *.dfm}

{ TDMNFeConfig }

procedure TDMNFeConfig.DataModuleCreate(Sender: TObject);
begin
  dmDatabase_NFeBD := TdmDatabase_NFeBD.Create(Self);
end;

procedure TDMNFeConfig.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(dmDatabase_NFeBD);
end;

end.
