unit UCobSantander;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, Grids, DBGrids, RXDBCtrl,
  ALed, Db, DBTables, MemTable, RxLookup, CurrEdit, DBCtrls, Variants;

type
  TfCobSantander = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    msBoletos: TDataSource;
    Label5: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn6: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label3: TLabel;
    ALed1: TALed;
    Label4: TLabel;
    ALed2: TALed;
    StaticText1: TStaticText;
    mBoletos: TMemoryTable;
    mBoletosNumCReceber: TIntegerField;
    mBoletosParcela: TIntegerField;
    mBoletosNumNota: TIntegerField;
    mBoletosVlrParcela: TFloatField;
    mBoletosPessoa: TStringField;
    mBoletosCNPJCPF: TStringField;
    mBoletosEndereco: TStringField;
    mBoletosBairro: TStringField;
    mBoletosCep: TStringField;
    mBoletosCidade: TStringField;
    mBoletosUf: TStringField;
    mBoletosArqGerado: TBooleanField;
    mBoletosCliente: TStringField;
    mBoletosNossoNumero: TStringField;
    mBoletosInstrucao: TStringField;
    mBoletosTipoDesconto: TStringField;
    mBoletosTipoJuro: TStringField;
    mBoletosTaxaMulta: TFloatField;
    mBoletosEspecieDoc: TStringField;
    mBoletosAceite: TStringField;
    mBoletosDiasProtesto: TIntegerField;
    mBoletosVlrJurosPorDia: TFloatField;
    mBoletosVlrDesconto: TFloatField;
    mBoletosVlrAbatimento: TFloatField;
    mBoletosCpfCnpjAvalista: TStringField;
    mBoletosNomeAvalista: TStringField;
    mBoletosEndAvalista: TStringField;
    mBoletosCidAvalista: TStringField;
    mBoletosCepAvalista: TStringField;
    mBoletosUFAvalista: TStringField;
    mBoletosDtGerado: TStringField;
    mBoletosDtVencto: TStringField;
    mBoletosDtLimiteDesc: TStringField;
    mBoletosImpBoleto: TStringField;
    mBoletosCnpjCpfEditado: TStringField;
    mBoletosNumCarteira: TStringField;
    mBoletosBairroAvalista: TStringField;
    tCReceberParcRem2: TTable;
    tCReceberParcRem2Filial: TIntegerField;
    tCReceberParcRem2NumCReceber: TIntegerField;
    tCReceberParcRem2ParcCReceber: TIntegerField;
    tCReceberParcRem2ItemHist: TIntegerField;
    tCReceberParcRem2ItemRem: TIntegerField;
    tCReceberParcRem2CodConta: TIntegerField;
    tCReceberParcRem2Instrucao: TStringField;
    tCReceberParcRem2CampoAlterado: TStringField;
    tCReceberParcRem2EspDoc: TStringField;
    tCReceberParcRem2CodAceite: TStringField;
    tCReceberParcRem2InstProtesto: TStringField;
    tCReceberParcRem2DiasProtesto: TIntegerField;
    tCReceberParcRem2TaxaMulta: TFloatField;
    tCReceberParcRem2TipoJuros: TStringField;
    tCReceberParcRem2VlrJuros: TFloatField;
    tCReceberParcRem2TipoDesconto: TStringField;
    tCReceberParcRem2VlrDesconto: TFloatField;
    tCReceberParcRem2DtLimiteDesconto: TStringField;
    tCReceberParcRem2VlrDescAntecipacao: TFloatField;
    tCReceberParcRem2VlrAbatimento: TFloatField;
    tCReceberParcRem2Avalista: TStringField;
    tCReceberParcRem2CnpjAvalista: TStringField;
    tCReceberParcRem2DtVecto: TStringField;
    tCReceberParcRem2CodCedente: TStringField;
    tCReceberParcRem2CepAvalista: TStringField;
    tCReceberParcRem2EndAvalista: TStringField;
    tCReceberParcRem2CidAvalista: TStringField;
    tCReceberParcRem2UFAvalista: TStringField;
    tCReceberParcRem2ImpBoleto: TStringField;
    tCReceberParcRem2InstrCobranca1: TStringField;
    tCReceberParcRem2InstrCobranca2: TStringField;
    tCReceberParcRem2NumCarteira: TStringField;
    tCReceberParcRem2BairroAvalista: TStringField;
    tCReceberParcRem2Email: TStringField;
    tCReceberParcRem2BoletoPorEmail: TBooleanField;
    CurrencyEdit1: TCurrencyEdit;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    Edit2: TEdit;
    tCReceberParcRem2NumTitBanco: TStringField;
    Bevel3: TBevel;
    Label9: TLabel;
    DBText1: TDBText;
    Label10: TLabel;
    Label11: TLabel;
    mBoletosFormaCadastramento: TStringField;
    mBoletosCodProtesto: TStringField;
    mBoletosCodBaixa: TStringField;
    mBoletosCodCompensacao: TStringField;
    mBoletosTipoDocumento: TStringField;
    tCReceberParcRem2TipoDocumentoST: TStringField;
    tCReceberParcRem2CodCompensacaoST: TStringField;
    tCReceberParcRem2CodBaixaST: TStringField;
    tCReceberParcRem2CodProtestoST: TStringField;
    tCReceberParcRem2FormaCadastramentoST: TStringField;
    tCReceberParcRem2NumRemessaST: TIntegerField;
    tCReceberParcRem2CodTransmissaoST: TStringField;
    qUltRemessa: TQuery;
    qUltRemessaNumRemessa: TIntegerField;
    mBoletosDiasBaixa: TIntegerField;
    mBoletosVlrIOF: TFloatField;
    tCReceberParcRem2DiasBaixa: TIntegerField;
    tCReceberParcRem2VlrIOF: TFloatField;
    mBoletosCodMulta: TStringField;
    mBoletosDtMulta: TStringField;
    mBoletosVlrMulta: TFloatField;
    mBoletosTipoDesconto2: TStringField;
    mBoletosDtLimiteDesc2: TStringField;
    mBoletosVlrDesconto2: TFloatField;
    tCReceberParcRem2CodMulta: TStringField;
    tCReceberParcRem2DtMulta: TStringField;
    tCReceberParcRem2VlrMulta: TFloatField;
    tCReceberParcRem2TipoDesconto2: TStringField;
    tCReceberParcRem2DtLimiteDesconto2: TStringField;
    tCReceberParcRem2VlrDesconto2: TFloatField;
    mBoletosMensagem1: TStringField;
    mBoletosMensagem2: TStringField;
    Label12: TLabel;
    mBoletosFilial: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure mBoletosNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    F: TextFile;
    vContador, vContadorReg : Integer;
    vVlrTotal : Real;
    ano, mes, dia : Word;
    //vNossoNumero : String;
    vGeradoNossoNum : Boolean;
    procedure Habilita;
    procedure Gera_Arquivo;
    procedure Header_Arquivo;
    procedure Header_Lote;
    procedure Detalhe_SegmentoP;
    procedure Detalhe_SegmentoQ;
    procedure Detalhe_SegmentoR;
    procedure Trailler_Lote;
    procedure Trailler_Arquivo;
    procedure Monta_MBoleto;
    procedure Grava_Historico(Tipo : String); //G= Geração   N= Nosso Número

    function TirarAcento(texto : String) : string;

  public
    { Public declarations }
  end;

var
  fCobSantander: TfCobSantander;

implementation

uses UDM1, UCobSantanderAlt, UArqRetornoSantander, UCobrancaEletronica;

{$R *.DFM}

function TfCobSantander.TirarAcento(Texto : String) : String;
var
  i : Integer;
begin
  Texto := Trim(AnsiUpperCase(Texto));
  for i := 1 to Length(texto) do
  begin
    if Pos(Texto[i], ' 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~''"!@#$%^&*()_-+=|/\{}[]:;,.<>') = 0 then
    begin
      case Texto[i] of
        'Á', 'À', 'Â', 'Ä', 'Ã': Texto[i] := 'A';
        'É', 'È', 'Ê', 'Ë': Texto[i] := 'E';
        'Í', 'Ì', 'Î', 'Ï': Texto[i] := 'I';
        'Ó', 'Ò', 'Ô', 'Ö', 'Õ': Texto[i] := 'O';
        'Ú', 'Ù', 'Û', 'Ü': Texto[i] := 'U';
        'Ç': Texto[i] := 'C';
        'Ñ': Texto[i] := 'N';
      else
        Texto[i] := ' ';
      end;
    end;
  end;
  Result := AnsiUpperCase(Texto);
end;

procedure TfCobSantander.Grava_Historico(Tipo : String);
var
  vAux : Integer;
begin
  DM1.tCReceberParcHist.Refresh;
  DM1.tCReceberParcHist.Last;
  vAux := DM1.tCReceberParcHistItem.AsInteger;
  DM1.tCReceberParcHist.Insert;
  DM1.tCReceberParcHistFilial.AsInteger       := DM1.tCReceberParcFilial.AsInteger;
  DM1.tCReceberParcHistNumCReceber.AsInteger  := DM1.tCReceberParcNumCReceber.AsInteger;
  DM1.tCReceberParcHistParcCReceber.AsInteger := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tCReceberParcHistItem.AsInteger         := vAux + 1;
  DM1.tCReceberParcHistDtHistorico.AsDateTime := Date;
  if (mBoletosNumCarteira.AsString = '175') or (Tipo = 'N') then
    DM1.tCReceberParcHistHistorico.AsString     := 'Duplicata gerada o nosso número para o Santander'
  else
    begin
      DM1.tCReceberParcHistHistorico.AsString     := 'Duplicata enviada para o Santander';
      if vGeradoNossoNum then
        DM1.tCReceberParcHistHistorico.AsString   := DM1.tCReceberParcHistHistorico.AsString + ', e também foi gerada nosso número';
    end;
  DM1.tCReceberParcHistPgto.AsBoolean         := False;
  DM1.tCReceberParcHistDevolucao.AsBoolean    := False;
  DM1.tCReceberParcHist.Post;

  //Grava a tabela do histórico da remessa
  DM1.tCReceberParcRem.Refresh;
  DM1.tCReceberParcRem.Last;
  vAux := DM1.tCReceberParcRemItemRem.AsInteger;
  DM1.tCReceberParcRem.Insert;
  DM1.tCReceberParcRemFilial.AsInteger            := DM1.tCReceberParcHistFilial.AsInteger;
  DM1.tCReceberParcRemNumCReceber.AsInteger       := DM1.tCReceberParcHistNumCReceber.AsInteger;
  DM1.tCReceberParcRemParcCReceber.AsInteger      := DM1.tCReceberParcHistParcCReceber.AsInteger;
  DM1.tCReceberParcRemItemHist.AsInteger          := DM1.tCReceberParcHistItem.AsInteger;
  DM1.tCReceberParcRemItemRem.AsInteger           := vAux + 1;
  DM1.tCReceberParcRemCodConta.AsInteger          := DM1.tBcoSantanderCodConta.AsInteger;
  DM1.tCReceberParcRemNumCarteira.AsString        := mBoletosNumCarteira.AsString;
  //Tipo de Cobrança
  if mBoletosNumCarteira.AsString = '1' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobrança Simples (Sem Registro e Eletrônica com Registro)'
  else
  if mBoletosNumCarteira.AsString = '3' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobrança Caucionada (Eletrônica com Registro e Convencional com Registro)'
  else
  if mBoletosNumCarteira.AsString = '5' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobrança Simples (Rápida com Registro)'
  else
  if mBoletosNumCarteira.AsString = '6' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobrança Caucionada (Rápida com Registro)';

  //Cód.Movimento
  if mBoletosInstrucao.AsString = '01' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Entrada de título'
  else
  if mBoletosInstrucao.AsString = '02' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Pedido de baixa'
  else
  if mBoletosInstrucao.AsString = '04' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Concessão de abatimento'
  else
  if mBoletosInstrucao.AsString = '05' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + ' Cancelamento de abatimento'
  else
  if mBoletosInstrucao.AsString = '06' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Alteração de vencimento'
  else
  if mBoletosInstrucao.AsString = '07' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Alteração de identificação do título na empresa'
  else
  if mBoletosInstrucao.AsString = '08' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Alteração seu número'
  else
  if mBoletosInstrucao.AsString = '09' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Pedido Protesto'
  else
  if mBoletosInstrucao.AsString = '18' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Pedido de Sustação de Protesto'
  else
  if mBoletosInstrucao.AsString = '10' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Concessão de desconto'
  else
  if mBoletosInstrucao.AsString = '11' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Cancelamento de desconto'
  else
  if mBoletosInstrucao.AsString = '31' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Alteração de outros dados'
  else
  if mBoletosInstrucao.AsString = '98' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Não Protestar';

  //Cód.Compensação
  DM1.tCReceberParcRemCodCompensacaoST.AsString := mBoletosCodCompensacao.AsString;
  
  //Forma de Cadastramento
  DM1.tCReceberParcRemFormaCadastramentoST.AsString := mBoletosFormaCadastramento.AsString;
  if mBoletosFormaCadastramento.AsString = '1' then
    DM1.tCReceberParcRemFormaCadastramentoST.AsString := DM1.tCReceberParcRemFormaCadastramentoST.AsString + ' - Cobrança Registrada (Rápida e Eletrônica com Registro)'
  else
    DM1.tCReceberParcRemFormaCadastramentoST.AsString := DM1.tCReceberParcRemFormaCadastramentoST.AsString + ' - Cobrança sem Registro)';

  //Tipo do Documento
  DM1.tCReceberParcRemTipoDocumentoST.AsString := mBoletosTipoDocumento.AsString;
  if mBoletosTipoDocumento.AsString = '1' then
    DM1.tCReceberParcRemTipoDesconto.AsString := DM1.tCReceberParcRemTipoDesconto.AsString + ' - Tradicional'
  else
    DM1.tCReceberParcRemTipoDesconto.AsString := DM1.tCReceberParcRemTipoDesconto.AsString + ' - Escritural';

  //Espécie
  DM1.tCReceberParcRemEspDoc.AsString             := mBoletosEspecieDoc.AsString;
  if mBoletosEspecieDoc.AsString = '02' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + ' - Duplicata mercantil'
  else
  if mBoletosEspecieDoc.AsString = '04' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + ' - Duplicata de Serviço'
  else
  if mBoletosEspecieDoc.AsString = '07' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + ' - Letra de Câmbio (Somente para Banco 353)'
  else
  if mBoletosEspecieDoc.AsString = '30' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + ' - Letra de Câmbio (Somente para Banco 008)'
  else
  if mBoletosEspecieDoc.AsString = '12' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + ' - Nota Promissória'
  else
  if mBoletosEspecieDoc.AsString = '13' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + ' - Nota Promissória Rural'
  else
  if mBoletosEspecieDoc.AsString = '17' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + ' - Recibo'
  else
  if mBoletosEspecieDoc.AsString = '20' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + ' - Apólice de Seguro'
  else
  if mBoletosEspecieDoc.AsString = '97' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + ' - Cheque'
  else
  if mBoletosEspecieDoc.AsString = '98' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + ' - Nota Promissória Direta';

  //Aceite
  DM1.tCReceberParcRemCodAceite.AsString          := mBoletosAceite.AsString;
  if mBoletosAceite.AsString = 'A' then
    DM1.tCReceberParcRemCodAceite.AsString := DM1.tCReceberParcRemCodAceite.AsString + '-' + 'Aceite'
  else
  if mBoletosAceite.AsString = 'N' then
    DM1.tCReceberParcRemCodAceite.AsString := DM1.tCReceberParcRemCodAceite.AsString + '-' + 'Não ACeite';

  //Juros
  DM1.tCReceberParcRemTipoJuros.AsString          := mBoletosTipoJuro.AsString;
  if mBoletosTipoJuro.AsString = '1' then
    DM1.tCReceberParcRemTipoJuros.AsString := DM1.tCReceberParcRemTipoJuros.AsString + ' - Valor por dia'
  else
  if mBoletosTipoJuro.AsString = '2' then
    DM1.tCReceberParcRemTipoJuros.AsString := DM1.tCReceberParcRemTipoJuros.AsString + ' - Taxa Mensal'
  else
  if mBoletosTipoJuro.AsString = '3' then
    DM1.tCReceberParcRemTipoJuros.AsString := DM1.tCReceberParcRemTipoJuros.AsString + ' - Isento'
  else
  if mBoletosTipoJuro.AsString = '4' then
    DM1.tCReceberParcRemTipoJuros.AsString := DM1.tCReceberParcRemTipoJuros.AsString + ' - Utilizar comissão permanência do Banco por dia de atraso'
  else
  if mBoletosTipoJuro.AsString = '5' then
    DM1.tCReceberParcRemTipoJuros.AsString := DM1.tCReceberParcRemTipoJuros.AsString + ' - Tolerância valor por dia (cobrar juros a partir de)'
  else
  if mBoletosTipoJuro.AsString = '6' then
    DM1.tCReceberParcRemTipoJuros.AsString := DM1.tCReceberParcRemTipoJuros.AsString + ' - Tolerância taxa mensal (cobrar juros a partir de)';
  DM1.tCReceberParcRemVlrJuros.AsFloat            := mBoletosVlrJurosPorDia.AsFloat;

  //Desconto
  DM1.tCReceberParcRemTipoDesconto.AsString       := mBoletosTipoDesconto.AsString;
  if mBoletosTipoDesconto.AsString = '0' then
    DM1.tCReceberParcRemTipoDesconto.AsString := DM1.tCReceberParcRemTipoDesconto.AsString + ' - Isento'
  else
  if mBoletosTipoDesconto.AsString = '1' then
    DM1.tCReceberParcRemTipoDesconto.AsString := DM1.tCReceberParcRemTipoDesconto.AsString + ' - Valor fixo até a data informada'
  else
  if mBoletosTipoDesconto.AsString = '2' then
    DM1.tCReceberParcRemTipoDesconto.AsString := DM1.tCReceberParcRemTipoDesconto.AsString + ' - Percentual até a data informada'
  else
  if mBoletosTipoDesconto.AsString = '3' then
    DM1.tCReceberParcRemTipoDesconto.AsString := DM1.tCReceberParcRemTipoDesconto.AsString + ' - Valor por antecipação por dia corrido'
  else
  if mBoletosTipoDesconto.AsString = '4' then
    DM1.tCReceberParcRemTipoDesconto.AsString := DM1.tCReceberParcRemTipoDesconto.AsString + ' - Valor por antecipação dia útil';
  DM1.tCReceberParcRemVlrDesconto.AsFloat         := mBoletosVlrDesconto.AsFloat;
  DM1.tCReceberParcRemDtLimiteDesconto.AsString := mBoletosDtLimiteDesc.AsString;

  //Protesto
  DM1.tCReceberParcRemCodProtestoST.AsString := mBoletosCodProtesto.AsString;
  if mBoletosCodProtesto.AsString = '0' then
    DM1.tCReceberParcRemCodProtestoST.AsString := DM1.tCReceberParcRemCodProtestoST.AsString + ' - Não Protestar'
  else
  if mBoletosCodProtesto.AsString = '1' then
    DM1.tCReceberParcRemCodProtestoST.AsString := DM1.tCReceberParcRemCodProtestoST.AsString + ' - Protestar dias corridos'
  else
  if mBoletosCodProtesto.AsString = '2' then
    DM1.tCReceberParcRemCodProtestoST.AsString := DM1.tCReceberParcRemCodProtestoST.AsString + ' - Protestar dias úteis'
  else
  if mBoletosCodProtesto.AsString = '3' then
    DM1.tCReceberParcRemCodProtestoST.AsString := DM1.tCReceberParcRemCodProtestoST.AsString + ' - Utilizar perfíl cedente'
  else
  if mBoletosCodProtesto.AsString = '9' then
    DM1.tCReceberParcRemCodProtestoST.AsString := DM1.tCReceberParcRemCodProtestoST.AsString + ' - Cancelamento de protesto automatico';
  DM1.tCReceberParcRemDiasProtesto.AsInteger      := mBoletosDiasProtesto.AsInteger;

  //Baixa/Devolução
  DM1.tCReceberParcRemCodBaixaST.AsString := mBoletosCodBaixa.AsString;
  if mBoletosCodBaixa.AsString = '1' then
    DM1.tCReceberParcRemCodBaixaST.AsString := DM1.tCReceberParcRemCodBaixaST.AsString + ' - Baixar / Devolver'
  else
  if mBoletosCodBaixa.AsString = '2' then
    DM1.tCReceberParcRemCodBaixaST.AsString := DM1.tCReceberParcRemCodBaixaST.AsString + ' - Não Baixar / Não Devolver'
  else
  if mBoletosCodBaixa.AsString = '3' then
    DM1.tCReceberParcRemCodBaixaST.AsString := DM1.tCReceberParcRemCodBaixaST.AsString + ' - Utilizar Perfíl Cedente';
  DM1.tCReceberParcRemDiasBaixa.AsInteger         := mBoletosDiasBaixa.AsInteger;
  DM1.tCReceberParcRemTaxaMulta.AsFloat           := mBoletosTaxaMulta.AsFloat;
  DM1.tCReceberParcRemInstrCobranca1.AsString     := mBoletosMensagem1.AsString;
  DM1.tCReceberParcRemInstrCobranca2.AsString     := mBoletosMensagem2.AsString;
  DM1.tCReceberParcRemVlrIOF.AsFloat              := mBoletosVlrIOF.AsFloat;
  DM1.tCReceberParcRemVlrAbatimento.AsString      := mBoletosVlrAbatimento.AsString;
  DM1.tCReceberParcRemAvalista.AsString           := mBoletosNomeAvalista.AsString;
  DM1.tCReceberParcRemCnpjAvalista.AsString       := mBoletosCpfCnpjAvalista.AsString;
  DM1.tCReceberParcRemDtLimiteDesconto.AsString   := mBoletosDtLimiteDesc.AsString;
  DM1.tCReceberParcRemDtVecto.AsString            := mBoletosDtVencto.AsString;
  DM1.tCReceberParcRemCodCedente.AsString         := DM1.tContasCodCedente.AsString;
  DM1.tCReceberParcRemCepAvalista.AsString        := mBoletosCepAvalista.AsString;
  DM1.tCReceberParcRemEndAvalista.AsString        := mBoletosEndAvalista.AsString;
  DM1.tCReceberParcRemCidAvalista.AsString        := mBoletosCidAvalista.AsString;
  DM1.tCReceberParcRemUFAvalista.AsString         := mBoletosUFAvalista.AsString;
  DM1.tCReceberParcRemBairroAvalista.AsString     := mBoletosBairroAvalista.AsString;
  DM1.tCReceberParcRemNumTitBanco.AsString        := mBoletosNossoNumero.AsString;
  DM1.tCReceberParcRem.Post;
  DM1.tCReceberParcRem.Refresh;
end;

procedure TfCobSantander.Monta_MBoleto;
var
  i: Integer;
  vGera: Boolean;
begin
  fCobrancaEletronica.qBoletos.First;
  while not fCobrancaEletronica.qBoletos.Eof do
    begin
      vGera := True;
      if fCobrancaEletronica.BitBtn6.Tag = 1 then
        if not fCobrancaEletronica.mTitulos.Locate('NumCReceber;Parcela',VarArrayOf([fCobrancaEletronica.qBoletosNumCReceber.AsInteger,fCobrancaEletronica.qBoletosParcCReceber.AsInteger]),[locaseinsensitive]) then
          vGera := False;
      if vGera then
        begin
          mBoletos.Insert;
          mBoletosArqGerado.AsBoolean := fCobrancaEletronica.qBoletosArqGerado.AsBoolean;
          mBoletosFilial.AsInteger    := fCobrancaEletronica.qBoletosFilial.AsInteger;
          if fCobrancaEletronica.qBoletosEndPgto.AsString <> '' then
            begin
              mBoletosBairro.AsString   := Copy(fCobrancaEletronica.qBoletosBairroPgto.AsString,1,10);
              for i := 1 to 9 do
                begin
                  if (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString,i,1) = '0') or (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString,i,1) = '1') or (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString,i,1) = '2') or
                     (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString,i,1) = '3') or (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString,i,1) = '4') or (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString,i,1) = '5') or
                     (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString,i,1) = '6') or (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString,i,1) = '7') or (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString,i,1) = '8') or
                     (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString,i,1) = '9') then
                    mBoletosCep.AsString := mBoletosCep.AsString + Copy(fCobrancaEletronica.qBoletosCepPgto.AsString,i,1);
                end;
              mBoletosCidade.AsString   := Copy(fCobrancaEletronica.qBoletoslkCidadePgto.AsString,1,15);
              mBoletosEndereco.AsString := fCobrancaEletronica.qBoletosEndPgto.AsString;
              mBoletosUf.AsString       := fCobrancaEletronica.qBoletosUfPgto.AsString;
            end
          else
            begin
              mBoletosBairro.AsString   := Copy(fCobrancaEletronica.qBoletosBairro.AsString,1,10);
              for i := 1 to 9 do
                begin
                  if (Copy(fCobrancaEletronica.qBoletosCep.AsString,i,1) = '0') or (Copy(fCobrancaEletronica.qBoletosCep.AsString,i,1) = '1') or (Copy(fCobrancaEletronica.qBoletosCep.AsString,i,1) = '2') or
                     (Copy(fCobrancaEletronica.qBoletosCep.AsString,i,1) = '3') or (Copy(fCobrancaEletronica.qBoletosCep.AsString,i,1) = '4') or (Copy(fCobrancaEletronica.qBoletosCep.AsString,i,1) = '5') or
                     (Copy(fCobrancaEletronica.qBoletosCep.AsString,i,1) = '6') or (Copy(fCobrancaEletronica.qBoletosCep.AsString,i,1) = '7') or (Copy(fCobrancaEletronica.qBoletosCep.AsString,i,1) = '8') or
                     (Copy(fCobrancaEletronica.qBoletosCep.AsString,i,1) = '9') then
                    mBoletosCep.AsString := mBoletosCep.AsString + Copy(fCobrancaEletronica.qBoletosCep.AsString,i,1);
                end;
              mBoletosCidade.AsString   := Copy(fCobrancaEletronica.qBoletoslkCidade.AsString,1,15);
              mBoletosEndereco.AsString := fCobrancaEletronica.qBoletosEndereco.AsString;
              mBoletosUf.AsString       := fCobrancaEletronica.qBoletosUf.AsString;
            end;
          mBoletosCliente.AsString        := fCobrancaEletronica.qBoletosNome.AsString;
          mBoletosCnpjCpfEditado.AsString := fCobrancaEletronica.qBoletosCgcCpf.AsString;
          if fCobrancaEletronica.qBoletosPessoa.AsString = 'F' then
            begin
              mBoletosPessoa.AsString  := '1';
              mBoletosCNPJCPF.AsString := Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString,1,3) +
                                          Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString,5,3) +
                                          Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString,9,3) +
                                          Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString,13,2);
            end
          else
            begin
              mBoletosPessoa.AsString  := '2';
              mBoletosCNPJCPF.AsString := Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString,1,2)  +
                                          Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString,4,3)  +
                                          Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString,8,3)  +
                                          Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString,12,4) +
                                          Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString,17,2);
            end;
          mBoletosDtGerado.AsString     := fCobrancaEletronica.qBoletosDtGerado.AsString;
          mBoletosDtVencto.AsString     := fCobrancaEletronica.qBoletosDtVencCReceber.AsString;
          mBoletosNumCReceber.AsInteger := fCobrancaEletronica.qBoletosNumCReceber.AsInteger;
          if fCobrancaEletronica.qBoletosNumNota.AsInteger > 0 then
            mBoletosNumNota.AsInteger := fCobrancaEletronica.qBoletosNumNota.AsInteger;
          mBoletosParcela.AsInteger       := fCobrancaEletronica.qBoletosParcCReceber.AsInteger;
          mBoletosVlrParcela.AsFloat      := fCobrancaEletronica.qBoletosRestParcela.AsFloat;
          mBoletosNossoNumero.AsString    := fCobrancaEletronica.qBoletosNumTitBanco.AsString;
          mBoletosNumCarteira.AsString        := DM1.tBcoSantanderNumCarteira.AsString;
          mBoletosInstrucao.AsString          := DM1.tBcoSantanderInstrucao.AsString;
          mBoletosTipoDocumento.AsString      := DM1.tBcoSantanderTipoDocumento.AsString;
          mBoletosCodCompensacao.AsString     := DM1.tBcoSantanderCodCompensacao.AsString;
          mBoletosCodBaixa.AsString           := DM1.tBcoSantanderCodBaixa.AsString;
          mBoletosCodProtesto.AsString        := DM1.tBcoSantanderCodProtesto.AsString;
          mBoletosFormaCadastramento.AsString := DM1.tBcoSantanderFormaCadastramento.AsString;
          mBoletosTipoDesconto.AsString       := DM1.tBcoSantanderTipoDesconto.AsString;
          mBoletosTipoJuro.AsString           := DM1.tBcoSantanderTipoJuro.AsString;
          mBoletosTaxaMulta.AsFloat           := DM1.tBcoSantanderTaxaMulta.AsFloat;
          mBoletosVlrIOF.AsFloat              := DM1.tBcoSantanderVlrIOF.AsFloat;
          mBoletosEspecieDoc.AsString         := DM1.tBcoSantanderEspecieDoc.AsString;
          mBoletosAceite.AsString             := DM1.tBcoSantanderAceite.AsString;
          mBoletosDiasProtesto.AsInteger      := DM1.tBcoSantanderDiasProtesto.AsInteger;
          mBoletosDiasBaixa.AsInteger         := DM1.tBcoSantanderDiasBaixa.AsInteger;
          mBoletosVlrJurosPorDia.AsFloat      := DM1.tBcoSantanderVlrJurosPorDia.AsFloat;
          mBoletosVlrDesconto.AsFloat         := DM1.tBcoSantanderVlrDesconto.AsFloat;
          mBoletosImpBoleto.AsString          := '';
          mBoletosCodMulta.AsString           := DM1.tBcoSantanderCodMulta.AsString;
          mBoletosDtMulta.AsString            := DM1.tBcoSantanderDtMulta.AsString;
          mBoletosVlrMulta.AsFloat            := DM1.tBcoSantanderVlrMulta.AsFloat;
          mBoletosTipoDesconto2.AsString      := DM1.tBcoSantanderTipoDesconto2.AsString;
          mBoletosDtLimiteDesc2.AsString      := DM1.tBcoSantanderDtLimiteDesconto2.AsString;
          mBoletosVlrDesconto2.AsFloat        := DM1.tBcoSantanderVlrDesconto2.AsFloat;
          mBoletosMensagem1.AsString          := DM1.tBcoSantanderMensagem1.AsString;
          mBoletosMensagem2.AsString          := DM1.tBcoSantanderMensagem2.AsString;

          //Esse if para controle do avalista foi incluido dia 12/02/2009 porque esta sendo
          //feito os títulos pela compotech e emitido para o banco pela pollytex
          if mBoletosFilial.AsInteger <> fCobrancaEletronica.vFilialConta then
            begin
              if DM1.tFilial2.Locate('Codigo',mBoletosFilial.AsInteger,[loCaseInsensitive]) then
                begin
                  mBoletosNomeAvalista.AsString    := DM1.tFilial2Empresa.AsString;
                  mBoletosCpfCnpjAvalista.AsString := Copy(DM1.tFilialCNPJ.AsString,1,2)  +
                                                      Copy(DM1.tFilialCNPJ.AsString,4,3)  +
                                                      Copy(DM1.tFilialCNPJ.AsString,8,3)  +
                                                      Copy(DM1.tFilialCNPJ.AsString,12,4) +
                                                      Copy(DM1.tFilialCNPJ.AsString,17,2);
                  mBoletosBairroAvalista.AsString  := DM1.tFilial2Bairro.AsString;
                  mBoletosCidAvalista.AsString     := DM1.tFilial2Cidade.AsString;
                  mBoletosEndAvalista.AsString     := DM1.tFilial2Endereco.AsString;
                  if Length(DM1.tFilial2Cep.AsString) > 8 then
                    mBoletosCepAvalista.AsString     := Copy(DM1.tFilial2Cep.AsString,1,5) + Copy(DM1.tFilial2Cep.AsString,7,3)
                  else
                    mBoletosCepAvalista.AsString     := DM1.tFilial2Cep.AsString;
                  mBoletosUFAvalista.AsString      := DM1.tFilial2Estado.AsString;
                end;
            end;

          if (tCReceberParcRem2.RecordCount > 0) and (tCReceberParcRem2CodConta.AsInteger = DM1.tContasCodConta.AsInteger) then
            begin
              tCReceberParcRem2.Last;
              {mBoletosNomeAvalista.AsString    := tCReceberParcRem2Avalista.AsString;
              mBoletosCpfCnpjAvalista.AsString := tCReceberParcRem2CnpjAvalista.AsString;
              mBoletosBairroAvalista.AsString  := tCReceberParcRem2BairroAvalista.AsString;
              mBoletosCidAvalista.AsString     := tCReceberParcRem2CidAvalista.AsString;
              mBoletosEndAvalista.AsString     := tCReceberParcRem2EndAvalista.AsString;
              mBoletosCepAvalista.AsString     := tCReceberParcRem2CepAvalista.AsString;
              mBoletosUFAvalista.AsString      := tCReceberParcRem2UFAvalista.AsString;}
              if tCReceberParcRem2NumTitBanco.AsString <> '' then
                if mBoletosNossoNumero.AsString <> tCReceberParcRem2NumTitBanco.AsString then
                  ShowMessage('Nosso número diferente na nota ' + fCobrancaEletronica.qBoletosNumNota.AsString);
            end;
          mBoletos.Post;
        end;
      fCobrancaEletronica.qBoletos.Next;
    end;
end;

procedure TfCobSantander.Header_Arquivo;
var
  vAux : String;
  texto1, texto2 : String;
  i : Integer;
begin
  //Código do banco na compensação tamanho 3 - posicao 1 ao 3
  texto1 := mBoletosCodCompensacao.AsString;
  for i := 1 to 3 - Length(texto1) do
    texto1 := '0' + texto1;

  //Lote de serviço tamanho 4 - posicao 4 ao 7
  texto1 := texto1 + '0000';

  //Tipo de registro tamanho 1 - posicao 8 ao 8
  texto1 := texto1 + '0';

  //Reservado   tamanho 8 - posicao 9 ao 16
  texto1 := texto1 + '        ';

  //Tipo de inscrição da empresa  tamanho 1 - posicao 17 ao 17
  texto1 := texto1 + '2';

  //Número de inscrição da empresa  tamanho 15 - posicao 18 ao 32
   vAux   := Dm1.tFilialCNPJ.AsString;
   texto2 := '';
   for i  := 1 to Length(vAux) do
     if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
       Texto2 := Texto2 + Copy(vAux,i,1);
   for i := 1 to 15 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

  //Código de transmissão  tamanho 15 - posicao 33 ao 47
  texto2 := DM1.tBcoSantanderCodTransmissao.AsString;
  for i := 1 to 15 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Reservado  tamanho 25 - posicao 48 ao 72
  for i := 1 to 25  do
    texto1 := texto1 + ' ';

  //Nome da empresa  tamanho 30 - posicao 73 ao 102
  texto2 := TirarAcento(copy(DM1.tFilialEmpresa.AsString,1,30));
  for i := 1 to 30 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Nome do banco  tamanho 30 - posicao 103 ao 132
  texto2 := 'Banco Santander';
  for i := 1 to 30 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Reservado  tamanho 10 - posicao 133 ao 142
  for i := 1 to 10  do
    texto1 := texto1 + ' ';

  //Código remessa  tamanho 1 - posicao 143 ao 143
  texto1 := texto1 + '1';

  //Data de geração do arquivo tamanho 8 - posicao 144 ao 151
  vAux := FormatDateTime('DD/MM/YYYY',Date);
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
   for i := 1 to 8 - Length(texto2) do
     texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Reservado  tamanho 6 - posicao 152 ao 157
  for i := 1 to 6  do
    texto1 := texto1 + ' ';

  //Nº sequencial do arquivo tamanho 6 - posicao 158 ao 163
  texto1 := texto1 + '000001';

  //Nº da versão do layout do arquivo tamanho 3 - posicao 164 ao 166
  texto1 := texto1 + '040';

  //Reservado  tamanho 74 - posicao 167 ao 240
  for i := 1 to 74 do
    texto1 := texto1 + ' ';

  inc(vContadorReg);
  Writeln(F,texto1);
end;

procedure TfCobSantander.Header_Lote;
var
  vAux : String;
  texto1, texto2 : String;
  i : Integer;
begin
  //Código do banco na compensação tamanho 3 - posicao 1 ao 3
  texto1 := mBoletosCodCompensacao.AsString;
  for i := 1 to 3 - Length(texto1) do
    texto1 := '0' + texto1;

  //Nº do Lote de remessa tamanho 4 - posicao 4 ao 7
  texto1 := texto1 + '0001';

  //Tipo de registro tamanho 1 - posicao 8 ao 8
  texto1 := texto1 + '1';

  //Tipo de operação tamanho 1 - posicao 9 ao 9
  texto1 := texto1 + 'R';

  //Tipo de serviço tamanho 2 - posicao 10 ao 11
  texto1 := texto1 + '01';

  //Reservado tamanho 2 - posicao 12 ao 13
  texto1 := texto1 + '  ';

  //Nº da versão do layout  tamanho 3 - posicao 14 ao 16
  texto1 := texto1 + '030';

  //Reservado  tamanho 1 - posicao 17 ao 17
  texto1 := texto1 + ' ';

  //Tipo inscrição da empresa tamanho 1 - posicao 18 ao 18
  texto1 := texto1 + '2';

  //Número de inscrição da empresa  tamanho 15 - posicao 19 ao 33
   vAux   := Dm1.tFilialCNPJ.AsString;
   texto2 := '';
   for i  := 1 to Length(vAux) do
     if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
       Texto2 := Texto2 + Copy(vAux,i,1);
   for i := 1 to 15 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

  //Reservado   tamanho 20 - posicao 34 ao 53
  for i := 1 to 20 do
    texto1 := texto1 + ' ';

  //Código de transmissão  tamanho 15 - posicao 54 ao 68
  texto2 := DM1.tBcoSantanderCodTransmissao.AsString;
  for i := 1 to 15 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Reservado   tamanho 5 - posicao 69 ao 73
  for i := 1 to 5 do
    texto1 := texto1 + ' ';

  //Nome da empresa  tamanho 30 - posicao 74 ao 103
  texto2 := TirarAcento(copy(DM1.tFilialEmpresa.AsString,1,30));
  for i := 1 to 30 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Mensagem 1  tamanho 40 - posicao 104 ao 143
  texto2 := DM1.tBcoSantanderMensagem1.AsString;
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Mensagem 2  tamanho 40 - posicao 144 ao 183
  texto2 := DM1.tBcoSantanderMensagem2.AsString;
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Nº remessa/retorno  tamanho 8 - posicao 184 ao 191
  qUltRemessa.Close;
  qUltRemessa.Params[0].AsInteger := DM1.tContasCodConta.AsInteger;
  qUltRemessa.Open;
  i := qUltRemessaNumRemessa.AsInteger + 1;
  texto2 := IntToStr(i);
  for i := 1 to 8 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Data da gravação do arquivo remessa/retorno  tamanho 8 - posicao 192 ao 199
  vAux := FormatDateTime('DD/MM/YYYY',Date);
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
   for i := 1 to 8 - Length(texto2) do
     texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Reservado  tamanho 41 - posicao 200 ao 240
  for i := 1 to 41  do
    texto1 := texto1 + ' ';

  inc(vContadorReg);
  Writeln(F,texto1);
end;

procedure TfCobSantander.Detalhe_SegmentoP;
var
  vAux, texto1, texto2 : String;
  i : Integer;
  vValor : Real;
begin
  inc(vContador);

  //Código do banco na compensação tamanho 3 - posicao 1 ao 3
  texto1 := mBoletosCodCompensacao.AsString;
  for i := 1 to 3 - Length(texto1) do
    texto1 := '0' + texto1;

  //Nº do lote remessa tamanho 4 - posicao 4 ao 7
  texto1 := texto1 + '0001';

  //Tipo do registro  tamanho 1 - posicao 8 ao 8
  texto1 := texto1 + '3';

  //Nº sequencial do registro lote  tamanho 5 - posicao 9 ao 13
  texto2 := IntToStr(vContador);
  for i := 1 to 5 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Código do segmento  tamanho 1 - posicao 14 ao 14
  texto1 := texto1 + 'P';

  //Reservado  tamanho 1 - posicao 15 ao 15
  texto1 := texto1 + ' ';

  //Código de movimento remessa  tamanho 2 - posicao 16 ao 17
  texto2 := mBoletosInstrucao.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Agência do cedente  tamanho 4 - posicao 18 ao 21
  texto2 := copy(DM1.tContasAgencia.AsString,1,4);
  for i := 1 to 4 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Dígito da Agência do cedente  tamanho 1 - posicao 22 ao 22
  if copy(DM1.tContasAgencia.AsString,5,1) = '' then
    texto1 := texto1 + '0'
  else
    texto1 := texto1 + copy(DM1.tContasAgencia.AsString,5,1);

  //Nº da conta corrente  tamanho 9 - posicao 23 ao 31
  texto2 := DM1.tContasNumConta.AsString;
  for i := 1 to 9 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Dígito verificado da conta  tamanho 1 - posicao 32 ao 32
  if DM1.tContasDigConta.AsString = '' then
    texto1 := texto1 + '0'
  else
    texto1 := texto1 + DM1.tContasDigConta.AsString;

  //Conta cobrança  tamanho 9 - posicao 33 ao 41
  texto2 := DM1.tContasNumConta.AsString;
  for i := 1 to 9 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Dígito da conta cobrança  tamanho 1 - posicao 42 ao 42
  if DM1.tContasDigConta.AsString = '' then
    texto1 := texto1 + '0'
  else
    texto1 := texto1 + DM1.tContasDigConta.AsString;

  //Reservado  tamanho 2 - posicao 43 ao 44
  texto1 := texto1 + '  ';

  //Identificação do título no banco tamanho 13 - posicao 45 ao 57
  for i := 1 to 13 do
    texto1 := texto1 + '0';

  //Tipo Cobrança tamanho 1 - posicao 58 ao 58
  if mBoletosNumCarteira.AsString = '' then
    texto1 := texto1 + '0'
  else
    texto1 := texto1 + mBoletosNumCarteira.AsString;

  //Forma de cadastramento tamanho 1 - posicao 59 ao 59
  if mBoletosFormaCadastramento.AsString = '' then
    texto1 := texto1 + '0'
  else
    texto1 := texto1 + mBoletosFormaCadastramento.AsString;

  //Tipo documento  tamanho 1 - posicao 60 ao 60
  if mBoletosTipoDocumento.AsString = '' then
    texto1 := texto1 + '0'
  else
    texto1 := texto1 + mBoletosTipoDocumento.AsString;

  //Reservado  tamanho 1 - posicao 61 ao 61
  texto1 := texto1 + ' ';

  //Reservado  tamanho 1 - posicao 62 ao 62
  texto1 := texto1 + ' ';

  //Nº do documento  tamanho 15 - posicao 63 ao 77
  texto2 := mBoletosNumNota.AsString + '/' + mBoletosParcela.AsString;
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Data de vencimento do titulo   tamanho 8 - posicao 78 ao 85
  vAux   := FormatDateTime('DD/MM/YYYY',mBoletosDtVencto.AsDateTime);
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
  for i := 1 to 8 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Valor do titulo tamanho 15 - posicao 86 ao 100
  texto2 := FormatFloat('0000000000000.00',mBoletosVlrParcela.AsFloat);
  Delete(texto2,14,1);
  texto1 := texto1 + texto2;

  //Agência encarregada da cobrança  tamanho 4 - posicao 101 ao 104
  texto2 := copy(DM1.tContasAgencia.AsString,1,4);
  for i := 1 to 4 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Dígito da agência do cedente  tamanho 1 - posicao 105 ao 105
  if copy(DM1.tContasAgencia.AsString,5,1) = '' then
    texto1 := texto1 + '0'
  else
    texto1 := texto1 + copy(DM1.tContasAgencia.AsString,5,1);

  //Rersevado  tamanho 1 - posicao 106 ao 106
  texto1 := texto1 + ' ';

  //Espécie do título  tamanho 2 - posicao 107 ao 108
  texto2 := mBoletosEspecieDoc.AsString;
  for i := 1 to 2 - length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Identif. de título Aceito/Não Aceito  tamanho 1 - posicao 109 ao 109
  texto1 := texto1 + mBoletosAceite.AsString;

  //Data de emissão do título  tamanho 8 - posicao 110 ao 117
  vAux   := FormatDateTime('DD/MM/YYYY',mBoletosDtGerado.AsDateTime);
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
  for i := 1 to 8 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Código do juros de mora  tamanho 1 - posicao 118 ao 118
  if mBoletosTipoJuro.AsString = '' then
    texto1 := texto1 + ' '
  else
    texto1 := texto1 + mBoletosTipoJuro.AsString;

  //Data do juros de mora   tamanho 8 - posicao 119 ao 126
  vAux   := FormatDateTime('DD/MM/YYYY',mBoletosDtVencto.AsDateTime);
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
  for i := 1 to 8 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Valor da mora/dia ou taxa mensal   tamanho 15 - posicao 127 ao 141
  if mBoletosVlrJurosPorDia.AsFloat > 0 then
    vValor := mBoletosVlrJurosPorDia.AsFloat
  else
  if DM1.tParametrosPercJuros.AsFloat > 0 then
    vValor := DM1.tParametrosPercJuros.AsFloat
  else
    vValor := 3;
  if (mBoletosTipoJuro.AsString = '1') or (mBoletosTipoJuro.AsString = '5') then
    vValor := StrToFloat(FormatFloat('0.00',((mBoletosVlrParcela.AsFloat * vValor) / 100) / 30))
  else
  if (mBoletosTipoJuro.AsString = '2') or (mBoletosTipoJuro.AsString = '6') then
    vValor := DM1.tParametrosPercJuros.AsFloat
  else
    vValor := 0;
  texto2 := FormatFloat('0000000000000.00',vValor);
  Delete(texto2,14,1);
  texto1 := texto1 + texto2;

  //Código do desconto 1   tamanho 1 - posicao 142 ao 142
  if mBoletosTipoDesconto.AsString = '' then
    texto1 := texto1 + '0'
  else
    texto1 := texto1 + mBoletosTipoDesconto.AsString;

  //Data do desconto 1   tamanho 8 - posicao 143 ao 150
  texto2 := '';
  if ((mBoletosTipoDesconto.AsString = '1') or (mBoletosTipoDesconto.AsString = '2')) and (mBoletosDtLimiteDesc.AsDateTime > 1) then
    begin
      vAux   := FormatDateTime('DD/MM/YYYY',mBoletosDtLimiteDesc.AsDateTime);
      texto2 := '';
      for i := 1 to Length(vAux) do
        if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
          Texto2 := Texto2 + Copy(vAux,i,1);
    end;
   for i := 1 to 8 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

  //Valor ou percentual do desconto   tamanho 15 - posicao 151 ao 165
  texto2 := FormatFloat('0000000000000.00',mBoletosVlrDesconto.AsFloat);
  Delete(texto2,14,1);
  texto1 := texto1 + texto2;

  //Valor do IOF a ser recolhido   tamanho 15 - posicao 166 ao 180
  texto2 := FormatFloat('0000000000000.00',mBoletosVlrIOF.AsFloat);
  Delete(texto2,14,1);                                   
  texto1 := texto1 + texto2;

  //Valor do abatimento   tamanho 15 - posicao 181 ao 195
  texto2 := FormatFloat('0000000000000.00',mBoletosVlrAbatimento.AsFloat);
  Delete(texto2,14,1);
  texto1 := texto1 + texto2;

   //Identificação do titulo na empresa   tamanho 25 - posicao 196 ao 220
   texto2 := FormatFloat('00',mBoletosFilial.AsInteger) + '.' + mBoletosNumCReceber.AsString;
   for i := 1 to 25 - Length(texto2) do
     texto2 := texto2 + ' ';
   texto1 := texto1 + texto2;

   //Código para protesto   tamanho 1 - posicao 221 ao 221
   if mBoletosCodProtesto.AsString = '' then
     texto1 := texto1 + ' '
   else
     texto1 := texto1 + mBoletosCodProtesto.AsString;

   //Nº de dias para protesto   tamanho 2 - posicao 222 ao 223
   texto2 := mBoletosDiasProtesto.AsString;
   for i := 1 to 2 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Código para baixa/devolução   tamanho 1 - posicao 224 ao 224
   if mBoletosCodBaixa.AsString = '' then
     texto1 := texto1 + ' '
   else
     texto1 := texto1 + mBoletosCodBaixa.AsString;

   //Reservado   tamanho 1 - posicao 225 ao 225
   texto1 := texto1 + '0';

   //Nº de dias para baixa/devolução   tamanho 2 - posicao 226 ao 227
   texto2 := mBoletosDiasBaixa.AsString;
   for i := 1 to 2 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Código da moeda   tamanho 2 - posicao 228 ao 229
   texto1 := texto1 + '00';

   //Reservado   tamanho 11 - posicao 230 ao 240
   for i := 1 to 11 do
     texto1 := texto1 + ' ';

  inc(vContadorReg);
  Writeln(F,texto1);
end;

procedure TfCobSantander.Detalhe_SegmentoQ;
var
  vAux, texto1, texto2 : String;
  i : Integer;
begin
  inc(vContador);

  //Código do banco na compensação tamanho 3 - posicao 1 ao 3
  texto1 := mBoletosCodCompensacao.AsString;
  for i := 1 to 3 - Length(texto1) do
    texto1 := '0' + texto1;

  //Nº do lote remessa tamanho 4 - posicao 4 ao 7
  texto1 := texto1 + '0001';

  //Tipo do registro  tamanho 1 - posicao 8 ao 8
  texto1 := texto1 + '3';

  //Nº sequencial do registro lote  tamanho 5 - posicao 9 ao 13
  texto2 := IntToStr(vContador);
  for i := 1 to 5 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Código do segmento  tamanho 1 - posicao 14 ao 14
  texto1 := texto1 + 'Q';

  //Reservado  tamanho 1 - posicao 15 ao 15
  texto1 := texto1 + ' ';

  //Código de movimento remessa  tamanho 2 - posicao 16 ao 17
  texto2 := mBoletosInstrucao.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Tipo de inscrição do sacado   tamanho 1 - posicao 18 ao 18
  if mBoletosPessoa.AsString = 'F' then
    texto1 := texto1 + '1'
  else
    texto1 := texto1 + '2';

  //Número de inscrição do sacado  tamanho 15 - posicao 19 ao 33
  vAux  := mBoletosCNPJCPF.AsString;
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
  for i := 1 to 15 - Length(texto2) do
    texto2 := '0' + texto2;
  if texto2 = '000000000000000' then
    ShowMessage('Cliente  ' + mBoletosCliente.AsString + ' não possui CNPJ/CPF');
  texto1 := texto1 + texto2;

   //Nome do sacado tamanho 40 - posicao 34 ao 73
  texto2 := TirarAcento(copy(mBoletosCliente.AsString,1,40));
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Endereço do sacado tamanho 40 - posicao 74 ao 113
  texto2 := TirarAcento(copy(mBoletosEndereco.AsString,1,40));
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Bairro do sacado  tamanho 15 - posicao 114 ao 128
  texto2 := TirarAcento(copy(mBoletosBairro.AsString,1,15));
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Cep do sacado  tamanho 8 - posicao 129 ao 136
  texto2 := mBoletosCep.AsString;
  vAux := texto2;
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
   for i := 1 to 8 - Length(texto2) do
     texto2 := texto2 + '0';
  texto1 := texto1 + copy(texto2,1,8);

  //Cidade tamanho 15 - posicao 137 ao 151
  texto2 := TirarAcento(copy(mBoletosCidade.AsString,1,15));
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Unidade da federação  tamanho 2 - posicao 152 ao 153
  texto2 := mBoletosUf.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Tipo de inscrição sacador/avalista  tamanho 1 - posicao 154 ao 154
  if Length(Trim(mBoletosCpfCnpjAvalista.AsString)) > 11 then
    texto1 := texto1 + '2'
  else
  if Length(Trim(mBoletosCpfCnpjAvalista.AsString)) > 9 then
    texto1 := texto1 + '1'
  else
    texto1 := texto1 + '0';

  //Nº de inscrição sacador/avalista  tamanho 15 - posicao 155 ao 169
  texto2 := Trim(mBoletosCpfCnpjAvalista.AsString);
  for i := 1 to 15 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Sacador avalista tamanho 40 - posicao 170 ao 209
  texto2 := TirarAcento(copy(mBoletosNomeAvalista.AsString,1,40));
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Identificador de carnê  tamanho 3 - posicao 210 ao 212
  texto1 := texto1 + '000';

  //Sequencial da parcela  tamanho 3 - posicao 213 ao 215
  texto1 := texto1 + '000';

  //Quantidade total de parcelas  tamanho 3 - posicao 216 ao 218
  texto1 := texto1 + '000';

  //Nº do plano   tamanho 3 - posicao 219 ao 221
  texto1 := texto1 + '000';

  //Reservado   tamanho 19 - posicao 222 ao 240
  for i := 1 to 19 do
    texto1 := texto1 + ' ';

  inc(vContadorReg);
  Writeln(F,texto1);
end;

procedure TfCobSantander.Detalhe_SegmentoR;
var
  vAux, texto1, texto2 : String;
  i : Integer;
begin
  //Código do banco na compensação tamanho 3 - posicao 1 ao 3
  texto1 := mBoletosCodCompensacao.AsString;
  for i := 1 to 3 - Length(texto1) do
    texto1 := '0' + texto1;

  //Nº do lote remessa tamanho 4 - posicao 4 ao 7
  texto1 := texto1 + '0001';

  //Tipo do registro  tamanho 1 - posicao 8 ao 8
  texto1 := texto1 + '3';

  //Nº sequencial do registro lote  tamanho 5 - posicao 9 ao 13
  texto2 := IntToStr(vContador);
  for i := 1 to 5 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Código do segmento  tamanho 1 - posicao 14 ao 14
  texto1 := texto1 + 'R';

  //Reservado  tamanho 1 - posicao 15 ao 15
  texto1 := texto1 + ' ';

  //Código de movimento remessa  tamanho 2 - posicao 16 ao 17
  texto2 := mBoletosInstrucao.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Código do desconto 2   tamanho 1 - posicao 18 ao 18
  if mBoletosTipoDesconto2.AsString = '' then
    texto1 := texto1 + '0'
  else
    texto1 := texto1 + mBoletosTipoDesconto.AsString;

  //Data do desconto 2   tamanho 8 - posicao 19 ao 26
  texto2 := '';
  if ((mBoletosTipoDesconto2.AsString = '1') or (mBoletosTipoDesconto2.AsString = '2')) and (mBoletosDtLimiteDesc2.AsDateTime > 1) then
    begin
      vAux   := FormatDateTime('DD/MM/YYYY',mBoletosDtLimiteDesc2.AsDateTime);
      texto2 := '';
      for i := 1 to Length(vAux) do
        if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
          Texto2 := Texto2 + Copy(vAux,i,1);
    end;
   for i := 1 to 8 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

  //Valor ou percentual do desconto 2   tamanho 15 - posicao 27 ao 41
  texto2 := FormatFloat('0000000000000.00',mBoletosVlrDesconto2.AsFloat);
  Delete(texto2,14,1);
  texto1 := texto1 + texto2;

  //Reservado    tamanho 24 - posicao 42 ao 65
  for i := 1 to 24 do
    texto1 := texto1 + ' ';

  //Código da multa   tamanho 1 - posicao 66 ao 66
  if mBoletosCodMulta.AsString = '' then
    texto1 := texto1 + ' '
  else
    texto1 := texto1 + mBoletosCodMulta.AsString;

  //Data da multa   tamanho 8 - posicao 67 ao 74
  texto2 := '';
  if (mBoletosDtMulta.AsString <> '') then
    begin
      vAux   := FormatDateTime('DD/MM/YYYY',mBoletosDtMulta.AsDateTime);
      texto2 := '';
      for i := 1 to Length(vAux) do
        if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
          Texto2 := Texto2 + Copy(vAux,i,1);
    end;
  for i := 1 to 8 - Length(texto2) do
   texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Valor ou percentual a ser aplicado   tamanho 15 - posicao 75 ao 89
  texto2 := FormatFloat('0000000000000.00',mBoletosVlrMulta.AsFloat);
  Delete(texto2,14,1);
  texto1 := texto1 + texto2;

  //Reservado   tamanho 10 - posicao 90 ao 99
  for i := 1 to 10 do
    texto1 := texto1 + ' ';

  //Mensagem 3   tamanho 40 - posicao 100 ao 139
  texto2 := mBoletosMensagem1.AsString;
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Mensagem 4   tamanho 40 - posicao 140 ao 179
  texto2 := mBoletosMensagem2.AsString;
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Reservado   tamanho 61 - posicao 180 ao 240
  for i := 1 to 61 do
    texto1 := texto1 + ' ';

  inc(vContadorReg);
  Writeln(F,texto1);
end;

procedure TfCobSantander.Trailler_Lote;
var
  texto1, texto2 : String;
  i : Integer;
begin
  //Código do banco na compensação tamanho 3 - posicao 1 ao 3
  texto1 := mBoletosCodCompensacao.AsString;
  for i := 1 to 3 - Length(texto1) do
    texto1 := '0' + texto1;

  //Nº do lote remessa tamanho 4 - posicao 4 ao 7
  texto1 := texto1 + '0001';

  //Tipo do registro  tamanho 1 - posicao 8 ao 8
  texto1 := texto1 + '5';

  //Reservado  tamanho 9 - posicao 9 ao 17
  for i := 1 to 9 do
    texto1 := texto1 + ' ';

  //Quantidade de registros do lote   tamanho 6 - posicao 18 ao 23
  texto2 := IntToStr(vContadorReg);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Reservado   tamanho 217 - posicao 24 ao 240
  for i := 1 to 217 do
    texto1 := texto1 + ' ';

  inc(vContadorReg);
  Writeln(F,texto1);
end;

procedure TfCobSantander.Trailler_Arquivo;
var
  texto1, texto2 : String;
  i : Integer;
begin
  //Código do banco na compensação tamanho 3 - posicao 1 ao 3
  texto1 := mBoletosCodCompensacao.AsString;
  for i := 1 to 3 - Length(texto1) do
    texto1 := '0' + texto1;

  //Nº do lote remessa tamanho 4 - posicao 4 ao 7
  texto1 := texto1 + '0001';

  //Tipo do registro  tamanho 1 - posicao 8 ao 8
  texto1 := texto1 + '9';

  //Reservado  tamanho 9 - posicao 9 ao 17
  for i := 1 to 9 do
    texto1 := texto1 + ' ';

  //Quantidade de registros do lote   tamanho 6 - posicao 18 ao 23
  texto1 := texto1 + '000001';

  //Quantidade de registros do arquivo  tamanho 6 - posicao 24 ao 29
  inc(vContadorReg);
  texto2 := IntToStr(vContadorReg);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Reservado   tamanho 211 - posicao 30 ao 240
  for i := 1 to 211 do
    texto1 := texto1 + ' ';

  Writeln(F,texto1);
end;

procedure TfCobSantander.Gera_Arquivo;
var
  Texto1 : String;
begin
  texto1 := fCobrancaEletronica.Monta_NomeArq(DM1.tBcoSantanderCaminho.AsString,'ST');
  Label12.Caption := 'Arq.Gerado: ' + Texto1;
  Label12.Visible := True;
  
  AssignFile(F,Texto1);
  Rewrite(F);
  vContador    := 0;
  vContadorReg := 0;
  vVlrTotal    := 0;
  Header_Arquivo;
  Header_Lote;
  mBoletos.First;
  while not mBoletos.Eof do
    begin
      Detalhe_SegmentoP;
      Detalhe_SegmentoQ;
      Detalhe_SegmentoR;
      DM1.tCReceber.IndexFieldNames := 'Filial;NumCReceber';
      Dm1.tCReceber.SetKey;
      DM1.tCReceberFilial.AsInteger      := mBoletosFilial.AsInteger;
      DM1.tCReceberNumCReceber.AsInteger := mBoletosNumCReceber.AsInteger;
      if DM1.tCReceber.GotoKey then
        begin
          if DM1.tCReceberParc.Locate('ParcCReceber',mBoletosParcela.AsInteger,[loCaseInsensitive]) then
            begin
              DM1.tCReceberParc.Edit;
              DM1.tCReceberParcArqGerado.AsBoolean  := True;
              DM1.tCReceberParcNumTitBanco.AsString := mBoletosNossoNumero.AsString;
              DM1.tCReceberParcNumCarteira.AsString := mBoletosNumCarteira.AsString;
              DM1.tCReceberParc.Post;

              Grava_Historico('G');
            end;
        end;
      mBoletos.Next;
    end;
  Trailler_Lote;
  Trailler_Arquivo;

  CloseFile(F);
end;

procedure TfCobSantander.Habilita;
begin
  DateEdit1.Enabled := not(DateEdit1.Enabled);
  DateEdit2.Enabled := not(DateEdit2.Enabled);
  BitBtn1.Enabled   := not(BitBtn1.Enabled);
  BitBtn2.Enabled   := not(BitBtn2.Enabled);
  BitBtn3.Enabled   := not(BitBtn3.Enabled);
  BitBtn4.Enabled   := not(BitBtn4.Enabled);
end;

procedure TfCobSantander.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fCobrancaEletronica.qBoletos.Close;
  Action := Cafree;
end;

procedure TfCobSantander.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfCobSantander.BitBtn1Click(Sender: TObject);
begin
  if (DateEdit1.Date > 1) and (DateEdit2.Date > 1) then
    begin
      Screen.Cursor   := crHourGlass;
      Label12.Caption := '';
      mBoletos.EmptyTable;
      fCobrancaEletronica.Monta_SQLqBoletos(DM1.tBcoSantanderCodConta.AsInteger);
      Monta_MBoleto;
      Habilita;
      BitBtn2.SetFocus;
      Screen.Cursor   := crDefault;
    end
  else
    begin
      ShowMessage('Você deve informar datas inicial, final e filial p/ gerar relação!');
      DateEdit1.SetFocus;
    end;
end;

procedure TfCobSantander.BitBtn3Click(Sender: TObject);
begin
  mBoletos.EmptyTable;
  Habilita;
  DateEdit1.SetFocus;
end;

procedure TfCobSantander.BitBtn4Click(Sender: TObject);
begin
  if not mBoletos.IsEmpty then
    begin
      if MessageDlg('Deseja realmente excluir este título?',mtconfirmation,[mbok,mbno],0)=mrok then
        mBoletos.Delete;
    end
  else
    ShowMessage('Não há título p/ ser excluído!');
end;

procedure TfCobSantander.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if mBoletosArqGerado.AsBoolean then
    begin
      Background  := clGreen;
      AFont.Color := clWhite;
    end;
end;

procedure TfCobSantander.BitBtn2Click(Sender: TObject);
var
  vAux : Integer;
begin
  if not mBoletos.IsEmpty then
    begin
      DM1.tFilial.IndexFieldNames := 'Codigo';
      DM1.tFilial.SetKey;
      DM1.tFilialCodigo.AsInteger := fCobrancaEletronica.vFilialConta;
      DM1.tFilial.GotoKey;
      Screen.Cursor := crHourGlass;
      Gera_Arquivo;
      Screen.Cursor := crDefault;
      vAux := mBoletos.RecordCount;
      ShowMessage(IntToStr(vAux) + ' registro(s) gerados(s) c/ sucesso!!!');
    end
  else
    ShowMessage('Não há títulos selecionados para gerar arquivo!');
  Habilita;
  DateEdit1.SetFocus;
end;

procedure TfCobSantander.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfCobSantander.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Codigo';
end;

procedure TfCobSantander.RxDBGrid1DblClick(Sender: TObject);
begin
  if mBoletosNumNota.AsInteger > 0 then
    begin
      mBoletos.Edit;
      fCobSantanderAlt := TfCobSantanderAlt.Create(Self);
      fCobSantanderAlt.ShowModal;
    end;
end;

procedure TfCobSantander.BitBtn6Click(Sender: TObject);
begin
  fArqRetornoSantander := TfArqRetornoSantander.Create(Self);
  fArqRetornoSantander.ShowModal;
end;

procedure TfCobSantander.mBoletosNewRecord(DataSet: TDataSet);
begin
  mBoletosNossoNumero.AsString     := '';
end;

procedure TfCobSantander.FormShow(Sender: TObject);
begin
  DM1.tFilial.IndexFieldNames := 'Codigo';
  DM1.tFilial.SetKey;
  DM1.tFilialCodigo.AsInteger := DM1.tContasFilial.AsInteger;
  if not DM1.tFilial.GotoKey then
    begin
      ShowMessage('Não achou a Filial, tente novamente!');
      Close;
    end;
  DateEdit1.Date := fCobrancaEletronica.vDtInicialCob;
  DateEdit2.Date := fCobrancaEletronica.vDtFinalCob;
  if fCobrancaEletronica.vCodClienteCob > 0 then
    RxDBLookupCombo1.KeyValue := fCobrancaEletronica.vCodClienteCob;

  Label11.Caption := ' Conta: ' + DM1.tContasNumConta.AsString + ' ' + DM1.tContasDigConta.AsString +
                     '  ' + DM1.tContasNomeConta.AsString;

  if fCobrancaEletronica.BitBtn6.Tag = 1 then
    BitBtn1Click(Sender);
end;

end.

