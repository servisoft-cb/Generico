unit UArqRetornoBrasil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, RXCtrls, Menus, Grids,
  DBGrids, RXDBCtrl, Db, DBTables, MemTable, ALed, Variants, DBClient,
  RxLookup;

type
  TfArqRetornoBrasil = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    FilenameEdit1: TFilenameEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Visualizar1: TMenuItem;
    BitBtn3: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    ALed1: TALed;
    Label8: TLabel;
    ALed2: TALed;
    Label2: TLabel;
    tExtComissaoIns: TTable;
    tExtComissaoInsNroLancamento: TIntegerField;
    tExtComissaoInsCodVendedor: TIntegerField;
    tExtComissaoInsDtReferencia: TDateField;
    tExtComissaoInsNroDoc: TIntegerField;
    tExtComissaoInsParcDoc: TIntegerField;
    tExtComissaoInsCodCliente: TIntegerField;
    tExtComissaoInsFuncao: TStringField;
    tExtComissaoInsVlrBase: TFloatField;
    tExtComissaoInsPercDescDupl: TFloatField;
    tExtComissaoInsPercComissao: TFloatField;
    tExtComissaoInsVlrComissao: TFloatField;
    tExtComissaoInsTipo: TStringField;
    tExtComissaoInsSuspensa: TBooleanField;
    ALed3: TALed;
    Label3: TLabel;
    Label4: TLabel;
    ALed4: TALed;
    RxLabel1: TRxLabel;
    tCReceber: TTable;
    tCReceberFilial: TIntegerField;
    tCReceberNumCReceber: TIntegerField;
    tCReceberNumNota: TIntegerField;
    tCReceberQuitado: TBooleanField;
    tCReceberCodCli: TIntegerField;
    tCReceberTipoDoc: TStringField;
    tCReceberDtGerado: TDateField;
    tCReceberHistorico: TStringField;
    tCReceberCancelado: TBooleanField;
    tCReceberDuplicataImp: TBooleanField;
    tCReceberVlrTotal: TFloatField;
    tCReceberBoletoImp: TBooleanField;
    tCliente: TTable;
    tClienteCodigo: TIntegerField;
    tClienteNome: TStringField;
    tClienteEndereco: TStringField;
    tClienteBairro: TStringField;
    tClienteCidade: TStringField;
    tClienteUf: TStringField;
    tClienteCep: TStringField;
    tClienteTelefone: TStringField;
    tClienteTelefone2: TStringField;
    tClienteFax: TStringField;
    tClientePessoa: TStringField;
    tClienteCgcCpf: TStringField;
    tClienteInscrEst: TStringField;
    tClienteContato: TStringField;
    tClienteObs: TMemoField;
    tClienteAprovCredito: TStringField;
    tClienteTipoAprov: TStringField;
    tClienteEndEntrega: TStringField;
    tClienteBairroEntrega: TStringField;
    tClienteCidEntrega: TStringField;
    tClienteCepEntrega: TStringField;
    tClienteUfEntrega: TStringField;
    tClienteCgcCpfEntrega: TStringField;
    tClienteInscEntrega: TStringField;
    tClienteEndPgto: TStringField;
    tClienteBairroPgto: TStringField;
    tClienteCidPgto: TStringField;
    tClienteCepPgto: TStringField;
    tClienteUfPgto: TStringField;
    tClienteFantasia: TStringField;
    tClienteDtCadastro: TDateField;
    tClienteCodVendedor: TIntegerField;
    tClienteObsCtas: TMemoField;
    tClienteLojas: TIntegerField;
    tClienteSelecionado: TBooleanField;
    tClienteCaixaPostal: TStringField;
    tClienteRg: TStringField;
    tClienteCodCidade: TIntegerField;
    tClienteCodCidadeE: TIntegerField;
    tClienteCodCidadeP: TIntegerField;
    tClienteEmail: TStringField;
    tClientePercTransf: TFloatField;
    tClienteCodCondPgto: TIntegerField;
    tClienteDtNascContato: TDateField;
    tClienteNomeResp: TStringField;
    tClienteContatoCliente: TStringField;
    tClienteContatoModelagem: TStringField;
    tClienteImpItemNotaPorTam: TBooleanField;
    tClienteCodBancoBoleto: TIntegerField;
    tClienteUsuario: TStringField;
    tClienteDtCad: TDateField;
    tClienteHrCad: TTimeField;
    tCReceberlkNomeCliente: TStringField;
    mArquivo: TClientDataSet;
    mArquivoNumTitEmpresa: TStringField;
    mArquivoNumTitBanco: TStringField;
    mArquivoCodCarteira: TStringField;
    mArquivoCodOcorrenciaRet: TStringField;
    mArquivoNomeOcorrenciaRet: TStringField;
    mArquivoDtOcorrencia: TStringField;
    mArquivoNumNota: TStringField;
    mArquivoDtVenc: TStringField;
    mArquivoVlrTitulo: TFloatField;
    mArquivoEspecieDoc: TStringField;
    mArquivoVlrDespesaCobranca: TFloatField;
    mArquivoVlrIOF: TFloatField;
    mArquivoVlrAbatimento: TFloatField;
    mArquivoVlrDesconto: TFloatField;
    mArquivoVlrPago: TFloatField;
    mArquivoVlrJurosPagos: TFloatField;
    mArquivoDtLiquidacao: TStringField;
    mArquivoInstrCancelada: TStringField;
    mArquivoNomeCliente: TStringField;
    mArquivoErros: TStringField;
    mArquivoCodLiquidacao: TStringField;
    mArquivoDescLiquidacao: TStringField;
    mArquivoAtualizado: TStringField;
    mArquivoCodCliente: TIntegerField;
    mArquivoParcela: TStringField;
    mArquivoDescErro2: TStringField;
    mArquivoDescErro1: TStringField;
    mArquivoDescErro3: TStringField;
    mArquivoDescErro4: TStringField;
    mArquivoNumCReceber: TIntegerField;
    dsmArquivo: TDataSource;
    mArquivoDescErro5: TStringField;
    mArquivoCodInstrCancelada: TStringField;
    mArquivoDescErro6: TStringField;
    mArquivoConfNossoNumero: TStringField;
    mArquivoVlrOutrasDespesas: TFloatField;
    mArquivoVlrJurosCartorioDesc: TFloatField;
    mArquivoVlrMulta: TFloatField;
    mArquivoVlrOutrosCreditos: TFloatField;
    mArquivoFormadeCredito: TStringField;
    ALed5: TALed;
    Label5: TLabel;
    mArquivoFilial: TIntegerField;
    mArquivoDtCredito: TStringField;
    Reduzido1: TMenuItem;
    tCReceberParc: TTable;
    tCReceberParcFilial: TIntegerField;
    tCReceberParcNumCReceber: TIntegerField;
    tCReceberParcParcCReceber: TIntegerField;
    tCReceberParcVlrParcCReceber: TFloatField;
    tCReceberParcDtVencCReceber: TDateField;
    tCReceberParcQuitParcCReceber: TBooleanField;
    tCReceberParcJurosParcCReceber: TFloatField;
    tCReceberParcDtPagParcCReceber: TDateField;
    tCReceberParcCodCli: TIntegerField;
    tCReceberParcNumNota: TIntegerField;
    tCReceberParcDesconto: TFloatField;
    tCReceberParcPgtoParcial: TFloatField;
    tCReceberParcRestParcela: TFloatField;
    tCReceberParcContaDupl: TSmallintField;
    tCReceberParcSelecionado: TBooleanField;
    tCReceberParcCodVendedor: TIntegerField;
    tCReceberParcBaixada: TBooleanField;
    tCReceberParcPercComissao: TFloatField;
    tCReceberParcVlrComissao: TFloatField;
    tCReceberParcPlanoContas: TIntegerField;
    tCReceberParcAgencia: TStringField;
    tCReceberParcTitPortador: TStringField;
    tCReceberParcCodTipoCobranca: TIntegerField;
    tCReceberParcDespesas: TFloatField;
    tCReceberParcAbatimentos: TFloatField;
    tCReceberParcCodConta: TIntegerField;
    tCReceberParcPgCartorio: TBooleanField;
    tCReceberParcDiasAtraso: TFloatField;
    tCReceberParcLetraCambio: TBooleanField;
    tCReceberParcNroLancExtComissao: TIntegerField;
    tCReceberParcJurosPagos: TFloatField;
    tCReceberParcCancelado: TBooleanField;
    tCReceberParcTitProtestado: TBooleanField;
    tCReceberParcDtGerado: TDateField;
    tCReceberParcTipoDoc: TStringField;
    tCReceberParcVlrDevolucao: TFloatField;
    tCReceberParcArqGerado: TBooleanField;
    tCReceberParcTransferencia: TBooleanField;
    tCReceberParcNumTitBanco: TStringField;
    tCReceberParcComissaoItem: TBooleanField;
    tCReceberParcVlrComissaoRestante: TFloatField;
    tCReceberParcCodPlanoContasItens: TIntegerField;
    tCReceberParcCodVendedor2: TIntegerField;
    tCReceberParcPercComissao2: TFloatField;
    tCReceberParcCodBancoBoleto: TIntegerField;
    tCReceberParcNumCarteira: TStringField;
    tCReceberParcNumSeqNossoNum: TIntegerField;
    tCReceberParcItemSeqNossoNum: TIntegerField;
    tCReceberParcDtVencimento2: TDateField;
    tCReceberParcSerie: TStringField;
    tCReceberParcNumSeqNota: TIntegerField;
    tCReceberParcNumCheque: TIntegerField;
    tCReceberParcCodBancoCheque: TIntegerField;
    tCReceberParcCodCartaoCredito: TIntegerField;
    tCReceberParcNumCartaoCredito: TStringField;
    tCReceberParcValidadeCartao: TStringField;
    tCReceberParcTipoCondicao: TStringField;
    tCReceberParcNumAutorizacaoCartao: TStringField;
    tCReceberParclkNomeCliente: TStringField;
    Label6: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    mArquivoCodNatRecebimento: TStringField;
    mArquivoTipoCobranca: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure Reduzido1Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
  private
    { Private declarations }
    vNumMov, vNumMovJuros : Integer;
    vHistorico : String;
    vIndiceErro : Integer;
    Entrada : String;
    procedure Grava_NumBanco;
    procedure Grava_Liquidacao;
    procedure Grava_Historico(Tipo, Historico : String); //E- Entrada  L- Liquidação  P-Protestado
    procedure Grava_ExtComissao;
    procedure Pagamento;
    procedure Grava_Protesto;
    procedure Grava_Vencimento;
    procedure Motivo_Rejeicao(Codigo : String);
    procedure Desc_Ocorrencia;
    procedure Desc_Liquidacao;
    procedure Desc_Liquidacao2;
  public
    { Public declarations }
  end;

var
  fArqRetornoBrasil: TfArqRetornoBrasil;

implementation

uses UDM1, UDM2, URelArqRetBrasil, URelArqRetBrasilRed, uUtilBanco;

{$R *.DFM}

procedure TfArqRetornoBrasil.Desc_Liquidacao;
begin
  if DM1.tContasCNAB.AsString = 'BRASIL400' then
    mArquivoCodLiquidacao.AsString := Trim(Copy(Entrada,87,2))
  else
    mArquivoCodLiquidacao.AsString := Trim(Copy(Entrada,81,2));

  if mArquivoCodLiquidacao.AsString = '01' then
    mArquivoDescLiquidacao.AsString := 'Liquidação normal'
  else
  if mArquivoCodLiquidacao.AsString = '02' then
    mArquivoDescLiquidacao.AsString := 'Liquidação por conta'
  else
  if mArquivoCodLiquidacao.AsString = '03' then
    mArquivoDescLiquidacao.AsString := 'Liquidação por saldo'
  else
  if mArquivoCodLiquidacao.AsString = '04' then
    mArquivoDescLiquidacao.AsString := 'Liquidação com cheque a compensar'
  else
  if mArquivoCodLiquidacao.AsString = '05' then
    mArquivoDescLiquidacao.AsString := 'Liquidação de título sem registro'
  else
  if mArquivoCodLiquidacao.AsString = '07' then
    mArquivoDescLiquidacao.AsString := 'Liquidação na apresentação'
  else
  if mArquivoCodLiquidacao.AsString = '09' then
    mArquivoDescLiquidacao.AsString := 'Liquidação em cartório';
end;

procedure TfArqRetornoBrasil.Desc_Liquidacao2;
begin
  if DM1.tContasCNAB.AsString = 'BRASIL400' then
    mArquivoCodLiquidacao.AsString := Trim(Copy(Entrada,87,2))
  else
    mArquivoCodLiquidacao.AsString := Trim(Copy(Entrada,81,2));
  if mArquivoCodLiquidacao.AsString = '00' then
    mArquivoDescLiquidacao.AsString := 'Solicitada pelo cliente'
  else
  if mArquivoCodLiquidacao.AsString = '15' then
    mArquivoDescLiquidacao.AsString := 'Protestado'
  else
  if mArquivoCodLiquidacao.AsString = '18' then
    mArquivoDescLiquidacao.AsString := 'Por alteração da carteira'
  else
  if mArquivoCodLiquidacao.AsString = '19' then
    mArquivoDescLiquidacao.AsString := 'Débito automático'
  else
  if mArquivoCodLiquidacao.AsString = '31' then
    mArquivoDescLiquidacao.AsString := 'Liquidação anteriormente'
  else
  if mArquivoCodLiquidacao.AsString = '32' then
    mArquivoDescLiquidacao.AsString := 'Habilitado em processo'
  else
  if mArquivoCodLiquidacao.AsString = '33' then
    mArquivoDescLiquidacao.AsString := 'Incobravel por nosso intermédio'
  else
  if mArquivoCodLiquidacao.AsString = '34' then
    mArquivoDescLiquidacao.AsString := 'Transferido para créditos em liquidação'
  else
  if mArquivoCodLiquidacao.AsString = '46' then
    mArquivoDescLiquidacao.AsString := 'Por alteração do código do cedente'
  else
  if mArquivoCodLiquidacao.AsString = '47' then
    mArquivoDescLiquidacao.AsString := 'Por alteração da variação'
  else
  if mArquivoCodLiquidacao.AsString = '51' then
    mArquivoDescLiquidacao.AsString := 'Acerto'
  else
  if mArquivoCodLiquidacao.AsString = '90' then
    mArquivoDescLiquidacao.AsString := 'Baixa automática';
end;

procedure TfArqRetornoBrasil.Desc_Ocorrencia;
begin
  Case mArquivoCodOcorrenciaRet.AsInteger of
    2 : mArquivoNomeOcorrenciaRet.AsString := 'CONFIRMAÇÃO DA ENTRADA DO TÍTULO';
    3 : mArquivoNomeOcorrenciaRet.AsString := 'COMANDO RECUSADO';
    5 : mArquivoNomeOcorrenciaRet.AsString := 'LIQUIDAÇÃO SEM REGISTRO';
    6 : mArquivoNomeOcorrenciaRet.AsString := 'LIQUIDAÇÃO NORMAL';
    7 : mArquivoNomeOcorrenciaRet.AsString := 'LIQUIDAÇÃO POR CONTA';
    8 : mArquivoNomeOcorrenciaRet.AsString := 'LIQUIDAÇÃO POR SALDO';
    9 : mArquivoNomeOcorrenciaRet.AsString := 'BAIXA DE TITULO';
   10 : mArquivoNomeOcorrenciaRet.AsString := 'BAIXA SOLICITADA';
   11 : mArquivoNomeOcorrenciaRet.AsString := 'TITULO EM SER';
   12 : mArquivoNomeOcorrenciaRet.AsString := 'ABATIMENTO CONCEDIDO';
   13 : mArquivoNomeOcorrenciaRet.AsString := 'ABATIMENTO CANCELADO';
   14 : mArquivoNomeOcorrenciaRet.AsString := 'VENCIMENTO ALTERADO';
   15 : mArquivoNomeOcorrenciaRet.AsString := 'LIQUIDAÇÃO EM CARTÓRIO';
   16 : mArquivoNomeOcorrenciaRet.AsString := 'CONFIRMAÇÃO DE ALT. DE JUROS';
   19 : mArquivoNomeOcorrenciaRet.AsString := 'CONF. DE RECTO. DE INSTR. PARA PROTESTO';
   20 : mArquivoNomeOcorrenciaRet.AsString := 'DEBITO EM CONTA';
   21 : mArquivoNomeOcorrenciaRet.AsString := 'ALT. DO NOME DO SACADO';
   22 : mArquivoNomeOcorrenciaRet.AsString := 'ALT. DO ENDEREÇO DO SACADO';
   23 : mArquivoNomeOcorrenciaRet.AsString := 'INDICAÇÃO DE ENCAMINHAMENTO A CARTÓRIO';
   24 : mArquivoNomeOcorrenciaRet.AsString := 'SUSTAR PROTESTO';
   25 : mArquivoNomeOcorrenciaRet.AsString := 'DISPENSAR JUROS DE MORA';
   28 : mArquivoNomeOcorrenciaRet.AsString := 'MANUT. DE TITULO VENCIDO';
   31 : mArquivoNomeOcorrenciaRet.AsString := 'CONCEDER DESCONTO';
   32 : mArquivoNomeOcorrenciaRet.AsString := 'NÃO CONCEDER DESCONTO';
   33 : mArquivoNomeOcorrenciaRet.AsString := 'RETIFICAR DESCONTO';
   34 : mArquivoNomeOcorrenciaRet.AsString := 'ALT. DATA PARA DESCONTO';
   35 : mArquivoNomeOcorrenciaRet.AsString := 'COBRAR MULTA';
   36 : mArquivoNomeOcorrenciaRet.AsString := 'DISPENSAR MULTA';
   37 : mArquivoNomeOcorrenciaRet.AsString := 'DISPENSAR INDEXADOR';
   38 : mArquivoNomeOcorrenciaRet.AsString := 'DISPENSAR PRAZO LIMITE PARA RECEBIMENTO';
   39 : mArquivoNomeOcorrenciaRet.AsString := 'ALT. PRAZO LIMITE PARA RECEBIMENTO';
   72 : mArquivoNomeOcorrenciaRet.AsString := 'ALT. DE TIPO DE COBRANÇA';
   96 : mArquivoNomeOcorrenciaRet.AsString := 'DESPESAS DE PROTESTO';
   97 : mArquivoNomeOcorrenciaRet.AsString := 'DESPESAS DE SUSTAÇÃO DE PROTESTO';
   98 : mArquivoNomeOcorrenciaRet.AsString := 'DEBITO DE CUSTAS ANTECIPADAS';
  end;
end;

procedure TfArqRetornoBrasil.Motivo_Rejeicao(Codigo : String);
var
  i : Integer;
begin
  vIndiceErro := 1;
  case StrToInt(Codigo) of
    01 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Indentificação invalida';
    02 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Variação da carteira invalida';
    03 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Valor dos juros por um dia invalido';
    04 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Valor do desconto invalido';
    05 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Espécie de titulo invalida para carteira';
    06 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Espécie de valor variavel invalido';
    07 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Prefixo da agencia usuaria invalido';
    08 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Valor do titulo/apolice invalido';
    09 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Data de vencimento invalida';
    10 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Fora do prazo';
    11 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Inexistencia de margem para desconto';
    12 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'O Banco não tem agencia na praça do sacado';
    13 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Razões cadastrais';
    14 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Sacado interligado com o sacador';
    15 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Titulo sacado contra orgão do poder público';
    16 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Titulo preenchido de forma irregular';
    17 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Titulo rasurado';
    18 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'End. do sacado não localizado ou incompleto';
    19 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Cód. do cedente invalido';
    20 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Nome/endereço do cliente não informado/ECT';
    21 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Carteira invalida';
    22 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Quantidade de valor variavel invalida';
    23 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Faixa nosso número excedida';
    24 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Valor do abatimento invalido';
    25 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Novo número do titulo dado pelo cedente invalido';
    26 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Valor da IOF de seguro invalido';
    27 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Nome do sacado/cedente invalido ou não informado';
    28 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Data do novo vencimento invalida';
    29 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'End. não informado';
    30 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Registro de titulo já liquidado';
    31 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Número de bordero invalido';
    32 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Nome da pessoa autorizada invalido';
    33 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Nosso número já existente';
    34 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Número da prestação do contrato invalido';
    35 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Percentual de desconto invalido';
    36 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Dias para fichamento de protesto inválido';
    37 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Data de emissão do titulo inválida';
    38 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Data do vencimento anterior a data da emissão';
    39 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Comando de alteração indevido para a carteira';
    40 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Tipo de moeda invalido';
    41 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Abatimento não permitido';
    42 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CEP/UF invalido';
    43 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Código de unidade variavel incompativel com a data de emissão';
    44 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Dados para debito ao sacado invalidos';
    45 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Carteira/variação encerrada';
    46 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Convenio encerrado';
    47 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Titulo tem valor diverso do informado';
    48 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Motivo de baixa invalido para a carteira';
    49 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Abatimento a cancelar não consta do titulo';
    50 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Comando incompativel com a carteira';
    51 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Código de convenete invalido';
    52 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Abatimento igual ou maior que valor do titulo';
    53 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Titulo já se encontra na situação pretendida';
    54 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Titulo fora do prazo admitido para a conta 1';
    55 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Novo vencimento fora dos limites da carteira';
    56 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Titulo não pertence ao convenete';
    57 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Variação incompativel com a carteira';
    58 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Impossivel a transferencia para a cart. indicada';
    59 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Titulo vencido em tranferencia para a cart. 51';
    60 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Tit. com prazo superior a 179 dias em transf. para cart. 51';
    61 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Título já foi fichado para protesto';
    62 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Alt.Action da situação de debito invalida para o cód. de responsabilidade';
    63 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DV do nosso numero invalido';
    64 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Tit. não passivel de debito/baixa situação anormal';
    65 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Tit.Action com ordem de não protestar';
    67 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Titulo/carne rejeitado';
    69 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Valor/percentual de juros inválido';
    70 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Titulo já se encontra isento de juros';
    71 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Código de juros invalido';
    72 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Pedido de protesto recusado / cidade do sacado não protesta titulos';
    80 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Nosso número invalido';
    81 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Data para concessão ddo desconto invalida';
    82 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CEP do sacado invalido';
    83 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Carteira/variação não localizada no cedente';
    84 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Titulo não localizado na existência';
    99 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Outros motivos';
  end;
end;

procedure TfArqRetornoBrasil.Grava_Protesto;
begin
  DM1.tCReceberParc.Edit;
  DM1.tCReceberParcTitProtestado.AsBoolean := True;
  DM1.tCReceberParc.Post;

  Grava_Historico('P','TITULO PROTESTADO');
  DM1.tCReceberParcHist.Post;

  mArquivo.Edit;
  mArquivoAtualizado.AsBoolean := True;
  mArquivo.Post;
end;

procedure TfArqRetornoBrasil.Grava_Vencimento;
begin
  DM1.tCReceberParc.Edit;
  vHistorico := 'DT.VECTO. ALTERADA DE ' + DM1.tCReceberParcDtVencCReceber.AsString + '  PARA ' + mArquivoDtVenc.AsString;
  DM1.tCReceberParcDtVencCReceber.AsDateTime := mArquivoDtVenc.AsDateTime;
  DM1.tCReceberParc.Post;

  Grava_Historico('V',vHistorico);
  DM1.tCReceberParcHist.Post;

  mArquivo.Edit;
  mArquivoAtualizado.AsBoolean := True;
  mArquivo.Post;
end;

procedure TfArqRetornoBrasil.Grava_ExtComissao;
var
  vAux, vPercentual, vPercentual2 : Real;
begin
  tExtComissaoIns.Refresh;
  tExtComissaoIns.Last;
  DM1.tExtComissao.Insert;
  DM1.tExtComissaoNroLancamento.AsInteger := tExtComissaoInsNroLancamento.AsInteger + 1;
  DM1.tExtComissaoCodVendedor.AsInteger   := DM1.tCReceberParcCodVendedor.AsInteger;
  DM1.tExtComissaoDtReferencia.AsDateTime := mArquivoDtOcorrencia.AsDateTime;
  DM1.tExtComissaoParcDoc.AsInteger       := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tExtComissaoCodCliente.AsInteger    := DM1.tCReceberParcCodCli.AsInteger;
  DM1.tExtComissaoFuncao.AsString         := 'E';
  DM1.tExtComissaoNroDoc.AsInteger        := DM1.tCReceberParcNumNota.AsInteger;
  if StrToFloat(FormatFloat('0.00',mArquivoVlrPago.AsFloat)) > 0 then
    DM1.tExtComissaoVlrBase.AsCurrency      := mArquivoVlrPago.AsFloat
  else
    DM1.tExtComissaoVlrBase.AsCurrency      := mArquivoVlrTitulo.AsFloat;
  DM1.tExtComissaoPercDescDupl.AsFloat    := DM1.tCReceberParcDesconto.AsFloat;
  DM1.tExtComissaoPercComissao.AsFloat    := DM1.tCReceberParcPercComissao.AsFloat;
  if DM1.tCReceberParcPercComissao.AsFloat > 0 then
    begin
      vAux := 0;
      DM1.tNotaFiscal.IndexFieldNames := 'Filial;NumNota';
      DM1.tNotaFiscal.SetKey;
      DM1.tNotaFiscalFilial.AsInteger  := DM1.tCReceberFilial.AsInteger;
      DM1.tNotaFiscalNumNota.AsInteger := DM1.tCReceberParcNumNota.AsInteger;
      if DM1.tNotaFiscal.GotoKey then
        begin
          if DM1.tNotaFiscalVlrIpi.AsFloat > 0 then
            begin
              if DM1.tCReceberParc.RecordCount = 1 then
                begin
                  vPercentual  := StrToFloat(FormatFloat('0.0000',(DM1.tExtComissaoVlrBase.AsFloat / DM1.tCReceberParcVlrParcCReceber.AsFloat) * 100));
                  vAux         := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrIpi.AsFloat * vPercentual) / 100));
                  DM1.tExtComissaoVlrBase.AsCurrency := DM1.tExtComissaoVlrBase.AsCurrency - vAux;
                end
              else
                begin
                  vPercentual  := StrToFloat(FormatFloat('0.0000',(DM1.tExtComissaoVlrBase.AsFloat / DM1.tCReceberParcVlrParcCReceber.AsFloat) * 100));
                  vPercentual2 := StrToFloat(FormatFloat('0.0000',(DM1.tCReceberParcVlrParcCReceber.AsFloat / DM1.tCReceberVlrTotal.AsFloat) * 100));
                  vAux         := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrIpi.AsFloat * vPercentual2) / 100));
                  vAux         := StrToFloat(FormatFloat('0.00',(vAux * vPercentual) / 100));
                  DM1.tExtComissaoVlrBase.AsCurrency := DM1.tExtComissaoVlrBase.AsCurrency - vAux;
                end;
            end;
        end;
      DM1.tExtComissaoVlrComissao.AsFloat := StrToFloat(FormatFloat('0.00',(DM1.tExtComissaoVlrBase.AsFloat * DM1.tExtComissaoPercComissao.AsFloat) / 100));
    end
  else
  if DM1.tCReceberParcVlrComissao.AsFloat > 0 then
    begin
      if DM1.tCReceberParcQuitParcCReceber.AsBoolean then
        begin
          DM1.tExtComissaoVlrComissao.AsFloat          := DM1.tCReceberParcVlrComissaoRestante.AsFloat;
          DM1.tCReceberParcVlrComissaoRestante.AsFloat := 0;
        end
      else
        begin
          vPercentual := StrToFloat(FormatFloat('0.0000',(DM1.tExtComissaoVlrBase.AsFloat / DM1.tCReceberParcVlrParcCReceber.AsFloat) * 100));
          vAux        := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcVlrComissao.AsFloat * vPercentual / 100));
          DM1.tExtComissaoVlrComissao.AsFloat          := StrToFloat(FormatFloat('0.00',vAux));
          DM1.tCReceberParcVlrComissaoRestante.AsFloat := DM1.tCReceberParcVlrComissaoRestante.AsFloat - DM1.tExtComissaoVlrComissao.AsFloat;
          if DM1.tCReceberParcVlrComissaoRestante.AsFloat < 0 then
            DM1.tCReceberParcVlrComissaoRestante.AsFloat := 0;
        end;
    end;
  DM1.tExtComissaoTipo.AsString           := 'D';
  DM1.tExtComissaoSuspensa.AsBoolean      := False;
  DM1.tExtComissao.Post;
  DM1.tCReceberParcHistNroLancExtComissao.AsInteger := DM1.tExtComissaoNroLancamento.AsInteger;
end;

procedure TfArqRetornoBrasil.Grava_Historico(Tipo, Historico : String);
begin
  DM2.tCReceberParcHist2.Refresh;
  DM2.tCReceberParcHist2.Last;
  DM1.tCReceberParcHist.Insert;
  DM1.tCReceberParcHistNumCReceber.AsInteger   := DM1.tCReceberParcNumCReceber.AsInteger;
  DM1.tCReceberParcHistParcCReceber.AsInteger  := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tCReceberParcHistItem.AsInteger          := DM2.tCReceberParcHist2Item.AsInteger + 1;
  DM1.tCReceberParcHistDtHistorico.AsDateTime  := Date;
  DM1.tCReceberParcHistCodHistorico.AsCurrency := 0;
  DM1.tCReceberParcHistHistorico.AsString      := Historico;
  DM1.tCReceberParcHistCodConta.AsInteger      := DM1.tContasCodConta.AsInteger;
  if Tipo = 'L' then
    begin
      DM1.tCReceberParcHistDtUltPgto.AsDateTime      := mArquivoDtOcorrencia.AsDateTime;
      if StrToFloat(FormatFloat('0.00',mArquivoVlrPago.AsFloat)) > 0 then
        DM1.tCReceberParcHistVlrUltPgto.AsCurrency     := mArquivoVlrPago.AsFloat
      else
        DM1.tCReceberParcHistVlrUltPgto.AsCurrency     := mArquivoVlrTitulo.AsFloat;
      DM1.tCReceberParcHistVlrUltJuros.AsFloat       := mArquivoVlrJurosPagos.AsFloat;
      DM1.tCReceberParcHistVlrUltDescontos.AsFloat   := mArquivoVlrDesconto.AsFloat;
      DM1.tCReceberParcHistVlrUltDespesas.AsFloat    := 0;
      DM1.tCReceberParcHistVlrUltAbatimentos.AsFloat := mArquivoVlrAbatimento.AsFloat;
      DM1.tCReceberParcHistJurosPagos.AsFloat        := mArquivoVlrJurosPagos.AsFloat;
      DM1.tCReceberParcHistPgto.AsBoolean            := True;
      DM1.tCReceberParcHistNumMov.AsInteger          := vNumMov;
      DM1.tCReceberParcHistNumMovJuros.AsInteger     := vNumMovJuros;
      DM1.tCReceberParcHistJurosCalc.AsFloat         := mArquivoVlrJurosPagos.AsFloat;
      DM1.tCReceberParcHistTipo.AsString             := 'PAG';
    end
  else
    begin
      DM1.tCReceberParcHistPgto.AsBoolean := False;
      DM1.tCReceberParcHistTipo.AsString  := 'DIV';
    end;
end;

procedure TfArqRetornoBrasil.Grava_NumBanco;
var
  vMudouCarteira : Boolean;
begin
  vMudouCarteira := False;
  //if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) <= 0 then
  //  exit;

  //if mArquivo
  DM1.tCReceberParc.Edit;
  if mArquivoCodNatRecebimento.AsString = '18' then
  begin
    if mArquivoTipoCobranca.AsString = '4' then
    begin
      DM1.tCReceberParcCodTipoCobranca.AsInteger := 3;
      vMudouCarteira := True;
    end;
  end;
  if Trim(mArquivoNumTitBanco.AsString) <> '' then
    DM1.tCReceberParcNumTitBanco.AsString := mArquivoNumTitBanco.AsString;
  DM1.tCReceberParc.Post;

  if vMudouCarteira then
    Grava_Historico('E','E ALTEROU A CARTEIRA PARA DESCONTADA')
  else
    Grava_Historico('E','ENTRADA CONFIRMADA');
  DM1.tCReceberParcHist.Post;

  mArquivo.Edit;
  mArquivoAtualizado.AsBoolean := True;
  mArquivo.Post;
end;

procedure TfArqRetornoBrasil.Pagamento;
var
  vCodConta : Integer;
  vDataPag : TDateTime;
  vDia : Word;
  vVlrPago : Real;
begin
  if (Copy(mArquivoDtCredito.AsString,1,2) = '00') or (StrToFloat(FormatFloat('0.00',mArquivoVlrPago.AsFloat)) <= 0) then
    exit;

  if (Copy(mArquivoDtCredito.AsString,1,2) <> '00') then
    vDataPag := mArquivoDtCredito.AsDateTime
  else
    vDataPag := mArquivoDtLiquidacao.AsDateTime;
  if StrToFloat(FormatFloat('0.00',mArquivoVlrPago.AsFloat)) > 0 then
    vVlrPago := StrToFloat(FormatFloat('0.00',mArquivoVlrPago.AsFloat))
  else
    vVlrPago := StrToFloat(FormatFloat('0.00',mArquivoVlrTitulo.AsFloat));

  DM1.tCReceberParc.Edit;
  vNumMov      := 0;
  vNumMovJuros := 0;
  vCodConta    := DM1.tContasCodConta.AsInteger;

  DM1.tContas.IndexFieldNames := 'CodConta';
  DM1.tContas.FindKey([vCodConta]);

  //DM1.tCReceberParcDtPagParcCReceber.AsDateTime := mArquivoDtCredito.AsDateTime;
  DM1.tCReceberParcDtPagParcCReceber.AsDateTime := vDataPag;
  //DM1.tCReceberParcPgtoParcial.AsFloat := DM1.tCReceberParcPgtoParcial.AsFloat +
  //                                        mArquivoVlrPago.AsFloat;
  DM1.tCReceberParcPgtoParcial.AsFloat := DM1.tCReceberParcPgtoParcial.AsFloat +
                                          StrToFloat(FormatFloat('0.00',vVlrPago));
  //DM1.tCReceberParcRestParcela.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) -
  //                                        StrToFloat(FormatFloat('0.00',mArquivoVlrPago.AsFloat));
  DM1.tCReceberParcRestParcela.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) -
                                          StrToFloat(FormatFloat('0.00',vVlrPago));
  DM1.tCReceberParcDesconto.AsFloat    := DM1.tCReceberParcDesconto.AsFloat +
                                          mArquivoVlrDesconto.AsFloat + mArquivoVlrAbatimento.AsFloat;
  DM1.tCReceberParcJurosPagos.AsFloat  := DM1.tCReceberParcJurosPagos.AsFloat + mArquivoVlrJurosPagos.AsFloat;
  DM1.tCReceberParcJurosParcCReceber.AsFloat := DM1.tCReceberParcJurosParcCReceber.AsFloat + mArquivoVlrJurosPagos.AsFloat;

  DM1.tCReceberParcRestParcela.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) -
                                          StrToFloat(FormatFloat('0.00',mArquivoVlrDesconto.AsFloat)) -
                                          StrToFloat(FormatFloat('0.00',mArquivoVlrAbatimento.AsFloat));

  if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) <= 0 then
    DM1.tCReceberParcRestParcela.AsFloat := 0;
  if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) = 0 then
    DM1.tCReceberParcQuitParcCReceber.AsBoolean := True;

  if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) > 0 then
    vHistorico := 'PAGAMENTO PARCIAL' + ' - ' + mArquivoNomeOcorrenciaRet.AsString
  else
    vHistorico := 'PAGAMENTO TOTAL' + ' - ' + mArquivoNomeOcorrenciaRet.AsString;
  if mArquivoCodOcorrenciaRet.AsString = '17' then
    DM1.tCReceberParcPgCartorio.AsBoolean := True;

  DM1.tMovimentos.MasterSource.Enabled := False;

  DM2.tMovimentos2.Refresh;
  DM2.tMovimentos2.Filtered               := False;
  DM2.tMovimentos2.Filter                 := 'CodConta = '''+IntToStr(vCodConta)+'''';
  DM2.tMovimentos2.Filtered               := True;
  DM2.tMovimentos2.Last;
  DM1.tMovimentos.Insert;
  DM1.tMovimentosCodConta.AsInteger       := vCodConta;
  DM1.tMovimentosNumMovimento.AsInteger   := DM2.tMovimentos2NumMovimento.AsInteger + 1;
  DM1.tMovimentosNumCReceber.AsInteger    := DM1.tCReceberNumCReceber.AsInteger;
  //DM1.tMovimentosDtMovimento.AsDateTime   := mArquivoDtCredito.AsDateTime;
  DM1.tMovimentosDtMovimento.AsDateTime   := vDataPag;
  DM1.tMovimentosNumNota.AsInteger        := DM1.tCReceberParcNumNota.AsInteger;
  DM1.tMovimentosCodCli.AsInteger         := DM1.tCReceberParcCodCli.AsInteger;
  DM1.tMovimentosPlanoContas.AsInteger    := DM1.tCReceberParcPlanoContas.AsInteger;
  //DM1.tMovimentosVlrMovCredito.AsCurrency := mArquivoVlrPago.AsFloat;
  DM1.tMovimentosVlrMovCredito.AsCurrency := StrToFloat(FormatFloat('0.00',vVlrPago));
  DM1.tMovimentosHistorico.AsString       := 'Rec.Parc.nº '+ DM1.tCReceberParcParcCReceber.AsString +
                                             ' nf.nº ' + DM1.tCReceberNumNota.AsString +
                                             ' de ' + DM1.tCReceberlkNomeCli.AsString;
  DM1.tMovimentos.Post;

  vNumMov := DM1.tMovimentosNumMovimento.AsInteger;

  //Lança os Juros no movimento financeiro
  if mArquivoVlrJurosPagos.AsFloat > 0 then
    begin
      DM2.tMovimentos2.Refresh;
      DM2.tMovimentos2.Filtered             := False;
      DM2.tMovimentos2.Filter               := 'CodConta = '''+IntToStr(vCodConta)+'''';
      DM2.tMovimentos2.Filtered             := True;
      DM2.tMovimentos2.Last;
      DM1.tMovimentos.Insert;
      DM1.tMovimentosCodConta.AsInteger     := vCodConta;
      DM1.tMovimentosNumMovimento.AsInteger := DM2.tMovimentos2NumMovimento.AsInteger + 1;
      DM1.tMovimentosNumCReceber.AsInteger  := DM1.tCReceberNumCReceber.AsInteger;
      DM1.tMovimentosDtMovimento.AsDateTime := mArquivoDtOcorrencia.AsDateTime;
      DM1.tMovimentosVlrMovCredito.AsFloat  := mArquivoVlrJurosPagos.AsFloat;
      DM1.tMovimentosNumNota.AsInteger      := DM1.tCReceberParcNumNota.AsInteger;
      DM1.tMovimentosCodCli.AsInteger       := DM1.tCReceberParcCodCli.AsInteger;
      DM1.tMovimentosPlanoContas.AsInteger  := DM1.tCReceberParcPlanoContas.AsInteger;
      DM1.tMovimentosHistorico.AsString     := 'Rec.Juros s/Parc.nº '+ DM1.tCReceberParcParcCReceber.AsString +
                                               ' nf.nº ' + DM1.tCReceberNumNota.AsString +
                                               ' de ' + DM1.tCReceberlkNomeCli.AsString;
      DM1.tMovimentos.Post;
      DM1.tContas.FindKey([vCodConta]);
      vNumMovJuros := DM1.tMovimentosNumMovimento.AsInteger;
    end;
  DM1.tCReceberParcCodConta.AsInteger := vCodConta;
  if DM1.tCReceberParcDtPagParcCReceber.AsDateTime > DM1.tCReceberParcDtVencCReceber.AsDateTime then
    DM1.tCReceberParcDiasAtraso.AsFloat := DM1.tCReceberParcDtPagParcCReceber.AsDateTime - DM1.tCReceberParcDtVencCReceber.AsDateTime
  else
    DM1.tCReceberParcDiasAtraso.AsFloat := 0;
  //if DM1.tCReceberParcRestParcela.AsFloat > 0 then
  Grava_Historico('L',vHistorico);

  if (DM1.tCReceberParclkTipoComissao.AsString = 'D') and (DM1.tCReceberParcCodVendedor.AsInteger > 0) and
     (DM1.tCReceberParcPercComissao.AsFloat > 0) then
    Grava_ExtComissao;
  DM1.tCReceberParcHist.Post;
  DM1.tCReceberParc.Post;
  DM2.tMovimentos2.Filtered := False;
  DM1.tMovimentos.MasterSource.Enabled := True;
end;
   
procedure TfArqRetornoBrasil.Grava_Liquidacao;
begin
  if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsCurrency)) > 0 then
  begin
    Pagamento;
    if (Copy(mArquivoDtCredito.AsString,1,2) <> '00') or (StrToFloat(FormatFloat('0.00',mArquivoVlrPago.AsFloat)) > 0) then
    begin
      mArquivo.Edit;
      mArquivoAtualizado.AsBoolean := True;
      mArquivo.Post;
    end;
  end;
end;

procedure TfArqRetornoBrasil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tNotaFiscal.Close;
  Action := Cafree;
end;

procedure TfArqRetornoBrasil.BitBtn2Click(Sender: TObject);
begin
  mArquivo.EmptyDataSet;
end;

procedure TfArqRetornoBrasil.BitBtn1Click(Sender: TObject);
var
  Txt : TextFile;
  Arquivo, Texto1, vbanco, NumNota : String;
  i : Integer;
  vFlag : Boolean;
  vContinuar : Boolean;
  vNumArq : String;
  vContAux : Integer;
begin
  if FileNameEdit1.Text <> '' then
    begin
      try
        vContinuar := True;
        mArquivo.EmptyDataSet;
        Arquivo := FilenameEdit1.FileName;
        AssignFile(Txt,Arquivo);
        Reset(Txt);
        while not Eof(Txt) do
          begin
            ReadLn(Txt,Entrada);
            if (Copy(Entrada,2,1) = '2') and (Copy(Entrada,3,7) = 'RETORNO') then
              begin
                vbanco := Copy(DM1.tContasNumConta.AsString,1,8);
                for i := 1 to 8 - length(Copy(DM1.tContasNumConta.AsString,1,8)) do
                  vbanco := '0' + vbanco;
                if vbanco <> Copy(Entrada,32,8) then
                  ShowMessage('Nº da conta diferente ' + Copy(Entrada,32,8))
                else
                if Copy(Entrada,77,3) <> '001' then
                begin
                  ShowMessage('Arquivo não é do Banco do Brasil, ' + Copy(Entrada,77,18));
                  vContinuar := False;
                end;
              end;
            if vContinuar then
              begin
                if DM1.tContasCNAB.AsString = 'BRASIL400' then
                begin
                  vNumArq  := '7';
                  vContAux := 0;
                end
                else
                begin
                  vNumArq  := '1';
                  vContAux := 1;
                end;
                //if Copy(Entrada,1,1) = '7' then
                if Copy(Entrada,1,1) = vNumArq then
                  begin
                    mArquivo.Insert;
                    mArquivoAtualizado.AsString := 'N';
                    if Copy(Entrada,(41-vContAux),1) = '.' then
                    begin
                      mArquivoFilial.AsString       := Copy(Entrada,(39-vContAux),2);
                      mArquivoNumCReceber.AsString  := Trim(Copy(Entrada,(42-vContAux),20));
                      if mArquivoNumCReceber.AsInteger <= 0 then
                      begin
                        if pos(Trim(Copy(Entrada,(42-vContAux),20)),'B') > 0 then
                          mArquivoNumCReceber.AsString  := Trim(Copy(Entrada,(42-vContAux),20))
                        else
                          mArquivoNumCReceber.AsString  := '0';
                      end;
                    end
                    else
                    begin
                      mArquivoFilial.AsInteger      := DM1.tContasFilial.AsInteger;
                      //mArquivoFilial.AsInteger      := 1;
                      if pos(Trim(Copy(Entrada,(39-vContAux),25)),'B') > 0 then
                        mArquivoNumCReceber.AsString  := Trim(Copy(Entrada,(39-vContAux),25))
                      else
                        mArquivoNumCReceber.AsString  := '0';
                    end;
                    if DM1.tContasCNAB.AsString = 'BRASIL400' then
                      mArquivoNumTitBanco.AsString := Copy(Entrada,64,17)
                    else
                      mArquivoNumTitBanco.AsString := Copy(Entrada,63,11) + Copy(Entrada,74,1);

                    NumNota := Copy(Entrada,117,6);
                    if Trim(NumNota) = '' then
                      NumNota := '0';
                    if Pos('/',NumNota) > 0 then
                      mArquivoNumNota.AsString          := Copy(NumNota,1,Pos('/',NumNota)-1)
                    else
                    if Pos('.',NumNota) > 0 then
                      mArquivoNumNota.AsString          := Copy(NumNota,1,Pos('.',NumNota)-1)
                    else
                    if Pos('-',NumNota) > 0 then
                      mArquivoNumNota.AsString          := Copy(NumNota,1,Pos('-',NumNota)-1)
                    else
                      mArquivoNumNota.AsString          := NumNota;

                    mArquivoNumTitEmpresa.AsString    := Copy(Entrada,117,10);
                    mArquivoCodCarteira.AsString      := Copy(Entrada,107,2);

                    mArquivoCodOcorrenciaRet.AsString := Copy(Entrada,109,2);
                    Desc_Ocorrencia;
                    //liquidação
                    if (mArquivoCodOcorrenciaRet.AsString = '05') or
                       (mArquivoCodOcorrenciaRet.AsString = '06') or
                       (mArquivoCodOcorrenciaRet.AsString = '07') or
                       (mArquivoCodOcorrenciaRet.AsString = '08') or
                       (mArquivoCodOcorrenciaRet.AsString = '15') then
                      Desc_Liquidacao;
                    if (mArquivoCodOcorrenciaRet.AsString = '09') or
                       (mArquivoCodOcorrenciaRet.AsString = '10') or
                       (mArquivoCodOcorrenciaRet.AsString = '20') then
                      Desc_Liquidacao2;
                    if mArquivoCodOcorrenciaRet.AsString = '03' then
                    begin
                      if DM1.tContasCNAB.AsString = 'BRASIL400' then
                        Motivo_Rejeicao(Trim(Copy(Entrada,87,2)))
                      else
                        Motivo_Rejeicao(Trim(Copy(Entrada,81,2)));
                    end;
                    if DM1.tContasCNAB.AsString = 'BRASIL400' then
                      mArquivoCodNatRecebimento.AsString := Trim(Copy(Entrada,87,2))
                    else
                      mArquivoCodNatRecebimento.AsString := Trim(Copy(Entrada,81,2));
                    if DM1.tContasCNAB.AsString = 'BRASIL400' then
                      mArquivoTipoCobranca.AsString := Trim(Copy(Entrada,81,1))
                    else
                      mArquivoTipoCobranca.AsString := Trim(Copy(Entrada,75,1));
                    mArquivoDtOcorrencia.AsString := Copy(Entrada,111,2) + '/' + Copy(Entrada,113,2) + '/' + '20' + Copy(Entrada,115,2);
                    mArquivoDtLiquidacao.AsString := Copy(Entrada,111,2) + '/' + Copy(Entrada,113,2) + '/' + '20' + Copy(Entrada,115,2);
                    mArquivoDtCredito.AsString    := Copy(Entrada,176,2) + '/' + Copy(Entrada,178,2) + '/' + '20' + Copy(Entrada,180,2);
                    mArquivoParcela.AsString      := Trim(Copy(Entrada,124,3));
                    if Trim(Copy(Entrada,174,2)) <> '' then
                    begin
                      case StrToInt(Copy(Entrada,174,2)) of
                        00 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'Informado nos reg. com comando 97';
                        01 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'DUPLICATA MERCANTIL';
                        02 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'NOTA PROMISSÓRIA';
                        03 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'NOTA DE SEGURO';
                        05 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'RECIBO';
                        08 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'LETRA DE CAMBIO';
                        09 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'WARRANT';
                        10 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'CHEQUE';
                        12 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'DUPLICATA DE SERVIÇO';
                        13 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'NOTA DE DEBITO';
                        15 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'APOLICE DE SEGURO';
                        25 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'DIVIDA ATIVA UNIÃO';
                        26 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'DIVIDA ATIVA ESTADO';
                        27 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'DIVIDA ATIVA MUNICIPIO';
                      end;
                    end;
                    mArquivoDtVenc.AsString           := Copy(Entrada,147,2) + '/' + Copy(Entrada,149,2) + '/' + '20' + Copy(Entrada,151,2);
                    mArquivoVlrTitulo.AsString        := Copy(Entrada,153,11) + ',' + Copy(Entrada,164,2);
                    mArquivoVlrDespesaCobranca.AsString   := Copy(Entrada,182,5) + ',' + Copy(Entrada,187,2);
                    mArquivoVlrOutrasDespesas.AsString    := Copy(Entrada,189,11) + ',' + Copy(Entrada,200,2);
                    mArquivoVlrJurosCartorioDesc.AsString := Copy(Entrada,202,11) + ',' + Copy(Entrada,213,2);
                    mArquivoVlrIOF.AsString               := Copy(Entrada,215,11) + ',' + Copy(Entrada,226,2);
                    mArquivoVlrAbatimento.AsString        := Copy(Entrada,228,11) + ',' + Copy(Entrada,239,2);
                    mArquivoVlrDesconto.AsString          := Copy(Entrada,241,11) + ',' + Copy(Entrada,252,2);
                    mArquivoVlrPago.AsString              := Copy(Entrada,254,11) + ',' + Copy(Entrada,265,2);
                    mArquivoVlrJurosPagos.AsString        := Copy(Entrada,267,11) + ',' + Copy(Entrada,278,2);
                    mArquivoVlrOutrosCreditos.AsString    := Copy(Entrada,280,11) + ',' + Copy(Entrada,291,2);

                    {if tCReceber.Locate('Filial;NumNota',VarArrayOf([mArquivoFilial.AsInteger,mArquivoNumNota.AsInteger]),[locaseinsensitive]) then
                    begin
                      mArquivoCodCliente.AsInteger := tCReceberCodCli.AsInteger;
                      mArquivoNomeCliente.AsString := tCReceberlkNomeCliente.AsString;
                    end}
                    if tCReceberParc.Locate('Filial;NumCReceber',VarArrayOf([mArquivoFilial.AsInteger,mArquivoNumCReceber.AsInteger]),[locaseinsensitive]) then
                    begin
                      mArquivoCodCliente.AsInteger := tCReceberParcCodCli.AsInteger;
                      mArquivoNomeCliente.AsString := tCReceberParclkNomeCliente.AsString;
                    end
                    else
                    if tCReceberParc.Locate('Filial;NumNota',VarArrayOf([mArquivoFilial.AsInteger,mArquivoNumNota.AsInteger]),[locaseinsensitive]) then
                    begin
                      mArquivoCodCliente.AsInteger := tCReceberParcCodCli.AsInteger;
                      mArquivoNomeCliente.AsString := tCReceberParclkNomeCliente.AsString;
                    end
                    else
                    if tCReceberParc.Locate('Filial;NumTitBanco',VarArrayOf([mArquivoFilial.AsInteger,mArquivoNumTitBanco.AsString]),[locaseinsensitive]) then
                    begin
                      mArquivoCodCliente.AsInteger := tCReceberParcCodCli.AsInteger;
                      mArquivoNomeCliente.AsString := tCReceberParclkNomeCliente.AsString;
                      mArquivoNumNota.AsString     := tCReceberParcNumNota.AsString;
                      mArquivoParcela.AsString     := tCReceberParcParcCReceber.AsString;
                      mArquivoDtVenc.AsString      := tCReceberParcDtVencCReceber.AsString;
                    end
                    else
                    begin
                      mArquivoCodCliente.AsInteger := 0;
                      mArquivoNomeCliente.AsString := '...NÃO ACHOU TÍTULO, verificar...';
                    end;
                    mArquivo.Post;
                  end;
              end;
        end;
        CloseFile(Txt);
      except
      end;
    end
  else
    begin
      ShowMessage('Você deve informar um arquivo p/ gerar a busca!');
      FilenameEdit1.SetFocus;
    end;
end;

procedure TfArqRetornoBrasil.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Atualizar o contas a receber?',mtconfirmation,[mbok,mbno],0)=mrok then
  begin
    mArquivo.First;
    while not mArquivo.Eof do
    begin
      if mArquivoCodCliente.AsInteger > 0 then
      begin
        try
          if DM1.tFilialCodigo.AsInteger <> mArquivoFilial.AsInteger then
            DM1.tFilial.Locate('Codigo',mArquivoFilial.AsInteger,[loCaseInsensitive]);

          if Posiciona_Titulo(mArquivoCodCliente.AsInteger,mArquivoNumNota.AsInteger,mArquivoParcela.AsInteger,mArquivoNumCReceber.AsInteger,'') then
          //if DM1.tCReceber.Locate('Filial;CodCli;NumNota',VarArrayOf([mArquivoFilial.AsInteger,mArquivoCodCliente.AsInteger,mArquivoNumNota.AsInteger]),[locaseinsensitive]) then
          begin
            {DM1.tCReceberParc.SetKey;
            DM1.tCReceberParcFilial.AsInteger       := DM1.tCReceberFilial.AsInteger;
            DM1.tCReceberParcNumCReceber.AsInteger  := DM1.tCReceberNumCReceber.AsInteger;
            DM1.tCReceberParcParcCReceber.AsInteger := mArquivoParcela.AsInteger;
            if DM1.tCReceberParc.GotoKey then
            begin}
              if (mArquivoCodOcorrenciaRet.AsString = '02') or
                 ((mArquivoCodOcorrenciaRet.AsString = '10') and (mArquivoCodNatRecebimento.AsString = '18')) then //ENTRADA CONFIRMADA
                Grava_NumBanco
              else
              if (mArquivoCodOcorrenciaRet.AsString = '05') or
                 (mArquivoCodOcorrenciaRet.AsString = '06') or
                 (mArquivoCodOcorrenciaRet.AsString = '07') or
                 (mArquivoCodOcorrenciaRet.AsString = '08') or
                 (mArquivoCodOcorrenciaRet.AsString = '09') or
                 (mArquivoCodOcorrenciaRet.AsString = '10') or
                 (mArquivoCodOcorrenciaRet.AsString = '15') or
                 (mArquivoCodOcorrenciaRet.AsString = '20') then //LIQUIDAÇÃO DO TÍTULO
                Grava_Liquidacao;
              //Grava_Protesto foi tirado fora por pedido da Mara SSBolsa, pois ele foi encaminhado e não protestado
              {else
              if (mArquivoCodOcorrenciaRet.AsString = '19') then //PROTESTO
                Grava_Protesto;}
            //end
            //else
            //  ShowMessage('Parcela não encontrada!')
          end
          else
            ShowMessage('Nota não encontrada!');
        except
          on E: Exception do
            ShowMessage('Não foi possível gravar, ' + E.Message);
        end;
      end;
      mArquivo.Next;
    end;
  end;
end;

procedure TfArqRetornoBrasil.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (mArquivoAtualizado.AsBoolean) and (mArquivoCodOcorrenciaRet.AsString = '02') then
    begin
      Background  := clAqua;
      AFont.Color := clBlack;
    end
  else
  if (mArquivoAtualizado.AsBoolean) and ((mArquivoCodOcorrenciaRet.AsString = '05') or
     (mArquivoCodOcorrenciaRet.AsString = '06') or
     (mArquivoCodOcorrenciaRet.AsString = '07') or
     (mArquivoCodOcorrenciaRet.AsString = '08') or
     (mArquivoCodOcorrenciaRet.AsString = '10') or
     (mArquivoCodOcorrenciaRet.AsString = '15')) then //LIQUIDAÇÃO DO TÍTULO
    begin
      Background  := clTeal;
      AFont.Color := clBlack;
    end
  else
  if (mArquivoCodOcorrenciaRet.AsString = '19') then
    begin
      Background  := clRed;
      AFont.Color := clBlack;
    end
  else
  if (mArquivoCodOcorrenciaRet.AsString = '03') then
    begin
      Background  := clYellow;
      AFont.Color := clBlack;
    end
  else
  if mArquivoCodOcorrenciaRet.AsString = '14' then
    begin
      Background  := clMaroon;
      AFont.Color := clYellow;
    end;
end;

procedure TfArqRetornoBrasil.FormShow(Sender: TObject);
begin
  DM1.tNotaFiscal.Open;
  tCReceber.Refresh;
  tCReceber.Close;
  tCReceber.Open;
  DM1.tCReceber.IndexFieldNames := 'Filial;NumCReceber';
end;

procedure TfArqRetornoBrasil.Visualizar1Click(Sender: TObject);
begin
  if mArquivo.IsEmpty then
  begin
    ShowMessage('Não há dados para imprimir!');
    exit;
  end;
  fRelArqRetBrasil := TfRelArqRetBrasil.Create(Self);
  fRelArqRetBrasil.QuickRep1.Preview;
  fRelArqRetBrasil.QuickRep1.Free;
end;

procedure TfArqRetornoBrasil.Reduzido1Click(Sender: TObject);
begin
  if mArquivo.IsEmpty then
  begin
    ShowMessage('Não há dados para imprimir!');
    exit;
  end;
  mArquivo.IndexFieldNames := 'TipoCobranca;CodOcorrenciaRet;NumNota';
  fRelArqRetBrasilRed := TfRelArqRetBrasilRed.Create(Self);
  fRelArqRetBrasilRed.RLReport1.Preview;
  fRelArqRetBrasilRed.RLReport1.Free;
end;

procedure TfArqRetornoBrasil.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tContas.IndexFieldNames := 'NomeConta';
end;

end.
