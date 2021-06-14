unit UArqRetornoItau;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, RXCtrls, Menus, Grids,
  DBGrids, RXDBCtrl, Db, DBTables, MemTable, ALed, Variants, DBClient;

type
  TfArqRetornoItau = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    FilenameEdit1: TFilenameEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    BitBtn3: TBitBtn;
    RxDBGrid1: TRxDBGrid;
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
    Panel3: TPanel;
    ALed1: TALed;
    Label8: TLabel;
    ALed2: TALed;
    Label2: TLabel;
    ALed3: TALed;
    Label3: TLabel;
    Label4: TLabel;
    ALed4: TALed;
    ALed5: TALed;
    Label6: TLabel;
    RxLabel1: TRxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
  private
    { Private declarations }
    vNumMov, vNumMovJuros : Integer;
    vHistorico : String;
    vIndiceErro : Integer;
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
  public
    { Public declarations }
  end;

var
  fArqRetornoItau: TfArqRetornoItau;

implementation

uses UDM1, UDM2, URelArqRetItau;

{$R *.DFM}

procedure TfArqRetornoItau.Desc_Liquidacao;
begin
  if mArquivoCodLiquidacao.AsString = 'DG' then
    mArquivoDescLiquidacao.AsString := 'AGÊNCIA ITAÚ - DIGITAÇÃO OFF-LINE'
  else
  if mArquivoCodLiquidacao.AsString = 'CP' then
    mArquivoDescLiquidacao.AsString := 'AGÊNCIA ITAÚ - TERMINAL CAIXA'
  else
  if mArquivoCodLiquidacao.AsString = 'AA' then
    mArquivoDescLiquidacao.AsString := 'CAIXA ELETRÔNICO ITAÚ'
  else
  if mArquivoCodLiquidacao.AsString = 'BF' then
    mArquivoDescLiquidacao.AsString := 'ITAÚ BANKFONE'
  else
  if mArquivoCodLiquidacao.AsString = 'BL' then
    mArquivoDescLiquidacao.AsString := 'ITAÚ BANKLINE'
  else
  if mArquivoCodLiquidacao.AsString = 'BC' then
    mArquivoDescLiquidacao.AsString := 'BANCOS CORRESPONDENTES'
  else
  if mArquivoCodLiquidacao.AsString = 'CK' then
    mArquivoDescLiquidacao.AsString := 'SISPAG (SISTEMA DE CONTAS A PAGAR ITAÚ)'
  else
  if mArquivoCodLiquidacao.AsString = 'B1' then
    mArquivoDescLiquidacao.AsString := 'OUTRO BANCO PELO CÓDIGO DE BARRAS'
  else
  if mArquivoCodLiquidacao.AsString = 'B2' then
    mArquivoDescLiquidacao.AsString := 'OUTRO BANCO PELA LINHA DIGITÁVEL'
  else
  if mArquivoCodLiquidacao.AsString = 'B3' then
    mArquivoDescLiquidacao.AsString := 'OUTRO BANCO EM AUTO-ATENDIMENTO'
  else
  if mArquivoCodLiquidacao.AsString = 'LC' then
    mArquivoDescLiquidacao.AsString := 'PAGAMENTO EM CARTÓRIO DE PROTESTO COM CHEQUE'
  else
  if mArquivoCodLiquidacao.AsString = 'AC' then
    mArquivoDescLiquidacao.AsString := 'PAGAMENTO EM CARTÓRIO AUTOMATIZADO';
end;

procedure TfArqRetornoItau.Desc_Ocorrencia;
begin
  Case mArquivoCodOcorrenciaRet.AsInteger of
    2 : mArquivoNomeOcorrenciaRet.AsString := 'ENTRADA CONFIRMADA';
    3 : mArquivoNomeOcorrenciaRet.AsString := 'ENTRADA REJEITADA';
    4 : mArquivoNomeOcorrenciaRet.AsString := 'ALTERAÇÃO DE DADOS - NOVA ENTRADA';
    5 : mArquivoNomeOcorrenciaRet.AsString := 'ALTERAÇÃO DE DADOS - BAIXA';
    6 : mArquivoNomeOcorrenciaRet.AsString := 'LIQUIDAÇÃO NORMAL';
    8 : mArquivoNomeOcorrenciaRet.AsString := 'LIQUIDAÇÃO CARTÓRIO';
    9 : mArquivoNomeOcorrenciaRet.AsString := 'BAIXA SIMPLES';
   10 : mArquivoNomeOcorrenciaRet.AsString := 'BAIXA POR TER SIDO LIQUIDADO';
   11 : mArquivoNomeOcorrenciaRet.AsString := 'EM SER (SÓ NO RETORNO MENSAL)';
   12 : mArquivoNomeOcorrenciaRet.AsString := 'ABATIMENTO CONCEDIDO';
   13 : mArquivoNomeOcorrenciaRet.AsString := 'ABATIMENTO CANCELADO';
   14 : mArquivoNomeOcorrenciaRet.AsString := 'VENCIMENTO ALTERADO';
   15 : mArquivoNomeOcorrenciaRet.AsString := 'BAIXAS REJEITADAS';
   16 : mArquivoNomeOcorrenciaRet.AsString := 'INSTRUÇÕES REJEITADAS';
   17 : mArquivoNomeOcorrenciaRet.AsString := 'ALTERAÇÃO DE DADOS REJEITADOS ';
   18 : mArquivoNomeOcorrenciaRet.AsString := 'COBRANÇA CONTRATUAL - ABATIMENTO E BAIXA BLOQUEADOS';
   19 : mArquivoNomeOcorrenciaRet.AsString := 'CONFIRMA RECEBIMENTO DE INSTRUÇÃO DE PROTESTO';
   20 : mArquivoNomeOcorrenciaRet.AsString := 'CONFIRMA RECEBIMENTO DE INSTRUÇÃO DE SUSTAÇÃO DE PROTESTO /TARIFA';
   21 : mArquivoNomeOcorrenciaRet.AsString := 'CONFIRMA RECEBIMENTO DE INSTRUÇÃO DE NÃO PROTESTAR';
   23 : mArquivoNomeOcorrenciaRet.AsString := 'PROTESTO ENVIADO A CARTÓRIO/TARIFA';
   24 : mArquivoNomeOcorrenciaRet.AsString := 'INSTRUÇÃO DE PROTESTO REJEITADA / SUSTADA / PENDENTE';
   25 : mArquivoNomeOcorrenciaRet.AsString := 'ALEGAÇÕES DO SACADO';
   26 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA DE AVISO DE COBRANÇA';
   27 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA DE EXTRATO POSIÇÃO';
   28 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA DE RELAÇÃO DAS LIQUIDAÇÕES';
   29 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA DE MANUTENÇÃO DE TÍTULOS VENCIDOS';
   30 : mArquivoNomeOcorrenciaRet.AsString := 'DÉBITO MENSAL DE TARIFAS (PARA ENTRADAS E BAIXAS)';
   32 : mArquivoNomeOcorrenciaRet.AsString := 'BAIXA POR TER SIDO PROTESTADO';
   33 : mArquivoNomeOcorrenciaRet.AsString := 'CUSTAS DE PROTESTO';
   34 : mArquivoNomeOcorrenciaRet.AsString := 'CUSTAS DE SUSTAÇÃO';
   35 : mArquivoNomeOcorrenciaRet.AsString := 'CUSTAS DE CARTÓRIO DISTRIBUIDOR';
   36 : mArquivoNomeOcorrenciaRet.AsString := 'CUSTAS DE EDITAL';
   37 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA DE EMISSÃO DE BLOQUETO/TARIFA DE ENVIO DE DUPLICATA';
   38 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA DE INSTRUÇÃO';
   39 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA DE OCORRÊNCIAS';
   40 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA MENSAL DE EMISSÃO DE BLOQUETO/TARIFA MENSAL DE ENVIO DE DUPLICATA';
   41 : mArquivoNomeOcorrenciaRet.AsString := 'DÉBITO MENSAL DE TARIFAS - EXTRATO DE POSIÇÃO (B4EP/B4OX)';
   42 : mArquivoNomeOcorrenciaRet.AsString := 'DÉBITO MENSAL DE TARIFAS - OUTRAS INSTRUÇÕES';
   43 : mArquivoNomeOcorrenciaRet.AsString := 'DÉBITO MENSAL DE TARIFAS - MANUTENÇÃO DE TÍTULOS VENCIDOS';
   44 : mArquivoNomeOcorrenciaRet.AsString := 'DÉBITO MENSAL DE TARIFAS - OUTRAS OCORRÊNCIAS';
   45 : mArquivoNomeOcorrenciaRet.AsString := 'DÉBITO MENSAL DE TARIFAS - PROTESTO';
   46 : mArquivoNomeOcorrenciaRet.AsString := 'DÉBITO MENSAL DE TARIFAS - SUSTAÇÃO DE PROTESTO';
   47 : mArquivoNomeOcorrenciaRet.AsString := 'BAIXA COM TRANSFERÊNCIA PARA DESCONTO';
   48 : mArquivoNomeOcorrenciaRet.AsString := 'CUSTAS DE SUSTAÇÃO JUDICIAL';
   51 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA MENSAL REF A ENTRADAS BANCOS CORRESPONDENTES NA CARTEIRA';
   52 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA MENSAL BAIXAS NA CARTEIRA';
   53 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA MENSAL BAIXAS EM BANCOS CORRESPONDENTES NA CARTEIRA';
   54 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA MENSAL  DE LIQUIDAÇÕES NA CARTEIRA';
   55 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA MENSAL DE LIQUIDAÇÕES EM BANCOS CORRESPONDENTES NA CARTEIRA';
   56 : mArquivoNomeOcorrenciaRet.AsString := 'CUSTAS DE IRREGULARIDADE';
   57 : mArquivoNomeOcorrenciaRet.AsString := 'INSTRUÇÃO CANCELADA';
  end;
end;


procedure TfArqRetornoItau.Motivo_Rejeicao(Codigo : String);
var
  vCodErro : array [1..4] of String;
  i : Integer;
begin
  vIndiceErro := 0;
  for i := 1 to 4 do
    vCodErro[i] := '';
  if copy(Codigo,1,2) <> '' then
    vCodErro[1] := copy(Codigo,1,2);
  if copy(Codigo,3,2) <> '' then
    vCodErro[2] := copy(Codigo,3,2);
  if copy(Codigo,5,2) <> '' then
    vCodErro[3] := copy(Codigo,5,2);
  if copy(Codigo,7,2) <> '' then
    vCodErro[4] := copy(Codigo,7,2);
  //Tabela 1 (Entrada Rejeitada)
  if mArquivoCodOcorrenciaRet.AsString = '03' then
    begin
      for i := 1 to 4 do
        begin
          if vCodErro[i] <> '' then
            begin
              inc(vIndiceErro);
              case StrToInt(vCodErro[i]) of
                03 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'AG. COBRADORA	NÃO FOI POSSÍVEL ATRIBUIR A AGÊNCIA  PELO CEP OU CEP INVÁLIDO';
                04 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ESTADO	SIGLA DO ESTADO INVÁLIDA';
                05 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA VENCIMENTO	PRAZO DA OPERAÇÃO MENOR QUE PRAZO MÍNIMO OU MAIOR QUE O MÁXIMO';
                07 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'VALOR DO TÍTULO	VALOR DO TÍTULO MAIOR QUE 10.000.000,00';
                08 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NOME DO SACADO 	NÃO INFORMADO OU DESLOCADO';
                09 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'AGÊNCIA/CONTA 	AGÊNCIA ENCERRADA';
                10 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'LOGRADOURO 	NÃO INFORMADO OU DESLOCADO';
                11 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CEP	CEP NÃO NUMÉRICO';
                12 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SACADOR / AVALISTA 	NOME NÃO INFORMADO OU DESLOCADO (BANCOS CORRESPONDENTES)';
                13 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ESTADO/CEP 	CEP INCOMPATÍVEL COM A SIGLA DO ESTADO';
                14 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NOSSO NÚMERO	NOSSO NÚMERO JÁ REGISTRADO NO CADASTRO DO BANCO OU FORA DA FAIXA';
                15 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NOSSO NÚMERO	NOSSO NÚMERO EM DUPLICIDADE NO MESMO MOVIMENTO';
                18 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA DE ENTRADA	DATA DE ENTRADA INVÁLIDA PARA OPERAR COM ESTA CARTEIRA';
                19 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'OCORRÊNCIA	OCORRÊNCIA INVÁLIDA';
                21 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'AG.COBR."CART.NÃO ACEITA DEPOSIT.CORRESPONDENTE" "UF AG.DIF DA UF SACADO';
                22 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CARTEIRA 	CARTEIRA NÃO PERMITIDA (NECESSÁRIO CADASTRAR FAIXA LIVRE)';
                27 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CGC INAPTO	CGC DO CEDENTE INAPTO';
                29 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CÓDIGO EMPRESA	CATEGORIA DA CONTA INVÁLIDA';
                35 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'VALOR DO IOF	IOF MAIOR QUE 5%';
                36 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'QTDADE DE MOEDA	QUANTIDADE DE MOEDA INCOMPATÍVEL COM VALOR DO TÍTULO';
                37 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CGC/CPF DO SACADO	NÃO NUMÉRICO OU IGUAL A ZEROS';
                42 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NOSSO NÚMERO	NOSSO NÚMERO FORA DE FAIXA';
                52 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'AG. COBRADORA	EMPRESA NÃO ACEITA BANCO CORRESPONDENTE';
                53 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'AG. COBRADORA	EMPRESA NÃO ACEITA BANCO CORRESPONDENTE  - COBRANÇA MENSAGEM';
                54 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA DE VENCTO	BANCO CORRESPONDENTE - TÍTULO COM VENCIMENTO INFERIOR A 15 DIAS';
                55 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DEP/BCO CORRESP	CEP NÃO PERTENCE A DEPOSITÁRIA INFORMADA';
                56 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DT VENCTO/BCO CORRESP	VENCTO SUPERIOR A 180 DIAS DA DATA DE ENTRADA';
                57 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA DE VENCTO 	CEP SÓ DEPOSITÁRIA BCO DO BRASIL COM VENCTO INFERIOR A 8 DIAS';
                60 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ABATIMENTO	VALOR DO ABATIMENTO INVÁLIDO';
                61 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'JUROS DE MORA	JUROS DE MORA MAIOR QUE O PERMITIDO';
                62 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DESCONTO	VALOR DO DESCONTO MAIOR QUE O VALOR DO TÍTULO';
                63 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'IMPORTÂNCIA POR DIA DE DESCONTO	NÃO PERMITIDO';
                64 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'EMISSÃO DO TÍTULO	DATA DE EMISSÃO DO TÍTULO INVÁLIDA (VENDOR)';
                65 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'TAXA FINANCTO	TAXA INVÁLIDA (VENDOR)';
                66 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA DE VENCTO	INVALIDA/FORA DE PRAZO DE OPERAÇÃO (MÍNIMO OU MÁXIMO)';
                67 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'VALOR/QTIDADE	VALOR DO TÍTULO/QUANTIDADE DE MOEDA INVÁLIDO';
                68 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CARTEIRA 	CARTEIRA INVÁLIDA';
                98 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'FLASH INVÁLIDO REGISTRO MENSAGEM SEM FLASH CADASTRADO OU FLASH INFORMADO DIFERENTE DO CADASTRADO';
                99 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'FLASH INVÁLIDO CONTA DE COBRANÇA COM FLASH CADASTRADO E SEM REGISTRO DE MENSAGEM CORRESPONDENTE';
                91 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DAC	DAC AGÊNCIA / CONTA CORRENTE INVÁLIDO';
                92 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DAC	DAC AGÊNCIA/CONTA/CARTEIRA/NOSSO NÚMERO INVÁLIDO';
                93 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ESTADO	SIGLA ESTADO INVÁLIDA';
                94 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ESTADO	SIGLA ESTADO INCOMPATÍVEL COM CEP DO SACADO';
                95 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CEP	CEP DO SACADO NÃO NUMÉRICO OU INVÁLIDO';
                96 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ENDEREÇO	ENDEREÇO / NOME / CIDADE SACADO INVÁLIDO';
              end;
            end;
        end;
    end;
  //**********
  //Tabela 2
  if mArquivoCodOcorrenciaRet.AsString = '17' then
    begin
      for i := 1 to 4 do
        begin
          if vCodErro[i] <> '' then
            begin
              inc(vIndiceErro);
              case StrToInt(vCodErro[i]) of
                02 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'AGÊNCIA COBRADORA INVÁLIDA OU COM O MESMO CONTEÚDO';
                04 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SIGLA DO ESTADO INVÁLIDA';
                05 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA DE VENCIMENTO INVÁLIDA OU COM O MESMO CONTEÚDO';
                06 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'VALOR DO TÍTULO COM OUTRA ALTERAÇÃO SIMULTÂNEA';
                08 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NOME DO SACADO COM O MESMO CONTEÚDO';
                09 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'AGÊNCIA/CONTA INCORRETA';
                11 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CEP INVÁLIDO';
                13 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SEU NÚMERO COM O MESMO CONTEÚDO';
                16 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ABATIMENTO/ALTERAÇÃO DO VALOR DO TÍTULO OU SOLICITAÇÃO DE BAIXA BLOQUEADA';
                21 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'AGÊNCIA COBRADORA NÃO CONSTA NO CADASTRO DE DEPOSITÁRIA OU EM ENCERRAMENTO';
                53 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRUÇÃO COM O MESMO CONTEÚDO';
                54 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA VENCIMENTO PARA BANCOS CORRESPONDENTES INFERIOR AO ACEITO PELO BANCO';
                55 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ALTERAÇÕES IGUAIS PARA O MESMO CONTROLE (AGÊNCIA/CONTA/CARTEIRA/NOSSO NÚMERO)';
                56 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CGC/CPF INVÁLIDO NÃO NUMÉRICO OU ZERADO';
                57 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'PRAZO DE VENCIMENTO INFERIOR A 15 DIAS';
                60 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'VALOR DE IOF - ALTERAÇÃO NÃO PERMITIDA PARA CARTEIRAS DE N.S. - MOEDA VARIÁVEL';
                61 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'TÍTULO JÁ BAIXADO OU LIQUIDADO OU NÃO EXISTE TÍTULO CORRESPONDENTE NO SISTEMA';
                66 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ALTERAÇÃO NÃO PERMITIDA PARA CARTEIRAS DE NOTAS DE SEGUROS - MOEDA VARIÁVEL';
                81 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ALTERAÇÃO BLOQUEADA - TÍTULO COM PROTESTO';
              end;
            end;
        end;
    end;

  //Tabela 3
  if mArquivoCodOcorrenciaRet.AsString = '16' then
    begin
      for i := 1 to 4 do
        begin
          if vCodErro[i] <> '' then
            begin
              inc(vIndiceErro);
              case StrToInt(vCodErro[i]) of
                01 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRUÇÃO/OCORRÊNCIA NÃO EXISTENTE';
                06 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NOSSO NÚMERO IGUAL A ZEROS';
                09 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CGC/CPF  DO SACADOR/AVALISTA INVÁLIDO';
                10 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'VALOR DO ABATIMENTO IGUAL OU MAIOR QUE O VALOR DO TÍTULO';
                14 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'REGISTRO EM DUPLICIDADE';
                15 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CGC/CPF INFORMADO SEM NOME DO SACADOR/AVALISTA';
                21 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'TÍTULO NÃO REGISTRADO NO SISTEMA';
                22 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'TÍTULO BAIXADO OU LIQUIDADO';
                23 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRUÇÃO NÃO ACEITA POR TER SIDO EMITIDO ÚLTIMO AVISO AO SACADO';
                24 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRUÇÃO INCOMPATÍVEL - EXISTE INSTRUÇÃO DE PROTESTO PARA O TÍTULO';
                25 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRUÇÃO INCOMPATÍVEL - NÃO EXISTE INSTRUÇÃO DE PROTESTO PARA O TÍTULO';
                26 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRUÇÃO NÃO ACEITA POR TER SIDO EMITIDO ÚLTIMO AVISO AO SACADO';
                27 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRUÇÃO NÃO ACEITA POR NÃO TER SIDO EMITIDA A ORDEM DE PROTESTO AO CARTÓRIO';
                28 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'JÁ EXISTE UMA MESMA INSTRUÇÃO CADASTRADA ANTERIORMENTE PARA O TÍTULO';
                29 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'VLR.LÍQ. + VLR.ABATIM.DIFERENTE DO VLR.DO TÍTULO, OU VLR.ABATIMENTO MAIOR QUE 90% DO VLR.DO TÍTULO';
                30 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'EXISTE UMA INSTRUÇÃO DE NÃO PROTESTAR ATIVA PARA O TÍTULO';
                31 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'EXISTE UMA OCORRÊNCIA DO SACADO QUE BLOQUEIA A INSTRUÇÃO';
                32 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DEPOSITÁRIA DO TÍTULO = 9999 OU CARTEIRA NÃO ACEITA PROTESTO';
                33 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ALTERAÇÃO DE VENCIMENTO IGUAL À REGISTRADA NO SISTEMA OU QUE TORNA O TÍTULO VENCIDO';
                34 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRUÇÃO DE EMISSÃO DE AVISO DE COBRANÇA PARA TÍTULO VENCIDO ANTES DO VENCIMENTO';
                35 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SOLICITAÇÃO DE CANCELAMENTO DE INSTRUÇÃO INEXISTENTE';
                36 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'TÍTULO SOFRENDO ALTERAÇÃO DE CONTROLE (AGÊNCIA/CONTA/CARTEIRA/NOSSO NÚMERO)';
                37 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRUÇÃO NÃO PERMITIDA PARA A CARTEIRA';
              end;
            end;
        end;
    end;

  //Tabela 4
  if mArquivoCodOcorrenciaRet.AsString = '15' then
    begin
      for i := 1 to 4 do
        begin
          if vCodErro[i] <> '' then
            begin
              inc(vIndiceErro);
              case StrToInt(vCodErro[i]) of
                01 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CARTEIRA/Nº NÚMERO NÃO NUMÉRICO';
                04 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NOSSO NÚMERO EM DUPLICIDADE NUM MESMO MOVIMENTO';
                05 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SOLICITAÇÃO DE BAIXA PARA TÍTULO JÁ BAIXADO OU LIQUIDADO';
                06 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SOLICITAÇÃO DE BAIXA PARA TÍTULO NÃO REGISTRADO NO SISTEMA';
                07 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'COBRANÇA PRAZO CURTO - SOLICITAÇÃO DE BAIXA P/ TÍTULO NÃO REGISTRADO NO SISTEMA';
                08 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SOLICITAÇÃO DE BAIXA PARA TÍTULO EM FLOATING';
              end;
            end;
        end;
    end;

  //Tabela 5
  if mArquivoCodOcorrenciaRet.AsString = '18' then
    begin
      for i := 1 to 4 do
        begin
          if vCodErro[i] <> '' then
            begin
              inc(vIndiceErro);
              case StrToInt(vCodErro[i]) of
                16 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ABATIMENTO/ALTERAÇÃO DO VALOR DO TÍTULO OU SOLICITAÇÃO DE BAIXA BLOQUEADOS';
              end;
            end;
        end;
    end;

  //Tabela 6
  if mArquivoCodOcorrenciaRet.AsString = '25' then
    begin
      if mArquivoCodInstrCancelada.AsString <> '' then
        begin
          inc(vIndiceErro);
          Case mArquivoCodInstrCancelada.AsInteger of
            1313 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SOLICITA A PRORROGAÇÃO DO VENCIMENTO PARA:';
            1321 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SOLICITA A DISPENSA DOS JUROS DE MORA';
            1339 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NÃO RECEBEU A MERCADORIA';
            1347 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'A MERCADORIA CHEGOU ATRASADA';
            1354 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'A MERCADORIA CHEGOU AVARIADA';
            1362 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'A MERCADORIA CHEGOU INCOMPLETA';
            1370 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'A MERCADORIA NÃO CONFERE COM O PEDIDO';
            1388 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'A MERCADORIA ESTÁ À DISPOSIÇÃO';
            1396 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DEVOLVEU A MERCADORIA';
            1404 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NÃO RECEBEU A FATURA';
            1412 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'A FATURA ESTÁ EM DESACORDO COM A NOTA FISCAL';
            1420 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'O PEDIDO DE COMPRA FOI CANCELADO';
            1438 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'A DUPLICATA FOI CANCELADA';
            1446 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'QUE NADA DEVE OU COMPROU';
            1453 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'QUE MANTÉM ENTENDIMENTOS COM O SACADOR';
            1461 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'QUE PAGARÁ O TÍTULO EM:';
            1479 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'QUE PAGOU O TÍTULO DIRETAMENTE AO CEDENTE EM:';
            1487 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'QUE PAGARÁ O TÍTULO DIRETAMENTE AO CEDENTE EM:';
            1495 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'QUE O VENCIMENTO CORRETO É:';
            1503 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'VALOR	QUE TEM DESCONTO OU ABATIMENTO DE:';
            1719 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SACADO NÃO FOI LOCALIZADO; CONFIRMAR ENDEREÇO';
            1727 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SACADO ESTÁ EM REGIME DE CONCORDATA';
            1735 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SACADO ESTÁ EM REGIME DE FALÊNCIA';
            1750 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SACADO SE RECUSA A PAGAR JUROS BANCÁRIOS';
            1768 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SACADO SE RECUSA A PAGAR COMISSÃO DE PERMANÊNCIA';
            1776 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NÃO FOI POSSÍVEL A ENTREGA DO BLOQUETO AO SACADO';
            1784 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'BLOQUETO NÃO ENTREGUE, MUDOU-SE/DESCONHECIDO';
            1792 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'BLOQUETO NÃO ENTREGUE, CEP ERRADO/INCOMPLETO';
            1800 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'BLOQUETO NÃO ENTREGUE, NÚMERO NÃO EXISTE/ENDEREÇO INCOMPLETO';
            1818 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'BLOQUETO NÃO RETIRADO PELO SACADO. REENVIADO PELO CORREIO';
            1826 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ENDEREÇO DE E-MAIL INVÁLIDO. BLOQUETO ENVIADO PELO CORREIO';
          end;
        end;
    end;

  //Tabela 7
  if mArquivoCodOcorrenciaRet.AsString = '24' then
    begin
      if mArquivoCodInstrCancelada.AsString <> '' then
        begin
          inc(vIndiceErro);
          Case mArquivoCodInstrCancelada.AsInteger of
            1610 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DOCUMENTAÇÃO SOLICITADA AO CEDENTE';
            3111 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SUSTAÇÃO SOLICITADA AG. CEDENTE';
            3228 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ATOS DA CORREGEDORIA ESTADUAL';
            3244 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'PROTESTO SUSTADO / CEDENTE NÃO ENTREGOU A DOCUMENTAÇÃO';
            3269 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA DE EMISSÃO DO TÍTULO INVÁLIDA/IRREGULAR';
            3301 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CGC/CPF DO SACADO INVÁLIDO/INCORRETO';
            3319 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SACADOR/AVALISTA E PESSOA FÍSICA';
            3327 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CEP DO SACADO INCORRETO';
            3335 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DEPOSITÁRIA INCOMPATÍVEL COM CEP DO SACADO';
            3343 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CGC/CPF SACADOR INVALIDO/INCORRETO';
            3350 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ENDEREÇO DO SACADO INSUFICIENTE';
            3368 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'PRAÇA PAGTO INCOMPATÍVEL COM ENDEREÇO';
            3376 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'FALTA NÚMERO/ESPÉCIE DO TÍTULO';
            3384 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'TÍTULO ACEITO S/ ASSINATURA DO SACADOR';
            3392 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'TÍTULO ACEITO S/ ENDOSSO CEDENTE OU IRREGULAR';
            3400 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'TÍTULO SEM LOCAL OU DATA DE EMISSÃO';
            3418 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'TÍTULO ACEITO COM VALOR EXTENSO DIFERENTE DO NUMÉRICO';
            3426 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'TÍTULO ACEITO DEFINIR ESPÉCIE DA DUPLICATA';
            3434 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA EMISSÃO POSTERIOR AO VENCIMENTO';
            3442 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'TÍTULO ACEITO DOCUMENTO NÃO PROSTESTÁVEL';
            3459 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'TÍTULO ACEITO EXTENSO VENCIMENTO IRREGULAR';
            3467 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'TÍTULO ACEITO FALTA NOME FAVORECIDO';
            3475 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'TÍTULO ACEITO FALTA PRAÇA DE PAGAMENTO';
            3483 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'TÍTULO ACEITO FALTA CPF ASSINANTE CHEQUE';
          end;
        end;
    end;

  //Tabela 8
  if mArquivoCodOcorrenciaRet.AsString = '57' then
    begin
      if mArquivoCodInstrCancelada.AsString <> '' then
        begin
          inc(vIndiceErro);
          Case mArquivoCodInstrCancelada.AsInteger of
            1156 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NÃO PROTESTAR';
            2261 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DISPENSAR JUROS/COMISSÃO DE  PERMANÊNCIA';
          end;
        end;
    end;
end;

procedure TfArqRetornoItau.Grava_Protesto;
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

procedure TfArqRetornoItau.Grava_Vencimento;
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

procedure TfArqRetornoItau.Grava_ExtComissao;
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
  DM1.tExtComissaoVlrBase.AsCurrency      := mArquivoVlrPago.AsFloat;
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

procedure TfArqRetornoItau.Grava_Historico(Tipo, Historico : String);
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
  if Tipo = 'L' then
    begin
      DM1.tCReceberParcHistDtUltPgto.AsDateTime      := mArquivoDtOcorrencia.AsDateTime;
      DM1.tCReceberParcHistVlrUltPgto.AsCurrency     := mArquivoVlrPago.AsFloat;
      DM1.tCReceberParcHistVlrUltJuros.AsFloat       := mArquivoVlrJurosPagos.AsFloat;
      DM1.tCReceberParcHistVlrUltDescontos.AsFloat   := mArquivoVlrDesconto.AsFloat;
      DM1.tCReceberParcHistVlrUltDespesas.AsFloat    := 0;
      DM1.tCReceberParcHistVlrUltAbatimentos.AsFloat := mArquivoVlrAbatimento.AsFloat;
      DM1.tCReceberParcHistJurosPagos.AsFloat        := mArquivoVlrJurosPagos.AsFloat;
      DM1.tCReceberParcHistPgto.AsBoolean            := True;
      DM1.tCReceberParcHistNumMov.AsInteger          := vNumMov;
      DM1.tCReceberParcHistNumMovJuros.AsInteger     := vNumMovJuros;
      DM1.tCReceberParcHistJurosCalc.AsFloat         := mArquivoVlrJurosPagos.AsFloat;
    end
  else
    DM1.tCReceberParcHistPgto.AsBoolean              := False;
end;

procedure TfArqRetornoItau.Grava_NumBanco;
begin
  DM1.tCReceberParc.Edit;
  DM1.tCReceberParcNumTitBanco.AsString := mArquivoNumTitBanco.AsString;
  DM1.tCReceberParc.Post;

  Grava_Historico('E','ENTRADA CONFIRMADA');
  DM1.tCReceberParcHist.Post;

  mArquivo.Edit;
  mArquivoAtualizado.AsBoolean := True;
  mArquivo.Post;
end;

procedure TfArqRetornoItau.Pagamento;
var
  vCodConta : Integer;
begin
  DM1.tCReceberParc.Edit;
  vNumMov      := 0;
  vNumMovJuros := 0;
  vCodConta    := DM1.tContasCodConta.AsInteger;

  DM1.tContas.IndexFieldNames := 'CodConta';
  DM1.tContas.FindKey([vCodConta]);

  DM1.tCReceberParcDtPagParcCReceber.AsDateTime := mArquivoDtLiquidacao.AsDateTime; 
  DM1.tCReceberParcPgtoParcial.AsFloat := DM1.tCReceberParcPgtoParcial.AsFloat +
                                          mArquivoVlrPago.AsFloat;
  DM1.tCReceberParcRestParcela.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) -
                                          StrToFloat(FormatFloat('0.00',mArquivoVlrPago.AsFloat));
  DM1.tCReceberParcDesconto.AsFloat    := DM1.tCReceberParcDesconto.AsFloat +
                                          mArquivoVlrDesconto.AsFloat + mArquivoVlrAbatimento.AsFloat;
  DM1.tCReceberParcJurosPagos.AsFloat  := DM1.tCReceberParcJurosPagos.AsFloat + mArquivoVlrJurosPagos.AsFloat;
  DM1.tCReceberParcJurosParcCReceber.AsFloat    := DM1.tCReceberParcJurosParcCReceber.AsFloat + mArquivoVlrJurosPagos.AsFloat;

  DM1.tCReceberParcRestParcela.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) -
                                          StrToFloat(FormatFloat('0.00',mArquivoVlrDesconto.AsFloat)) -
                                          StrToFloat(FormatFloat('0.00',mArquivoVlrAbatimento.AsFloat));

  if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) <= 0 then
    DM1.tCReceberParcRestParcela.AsFloat := 0;
  if DM1.tCReceberParcRestParcela.AsFloat = 0 then
    DM1.tCReceberParcQuitParcCReceber.AsBoolean := True;

  if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) > 0 then
    vHistorico          := 'PAGAMENTO PARCIAL' + ' - ' + mArquivoNomeOcorrenciaRet.AsString
  else
    vHistorico          := 'PAGAMENTO TOTAL' + ' - ' + mArquivoNomeOcorrenciaRet.AsString;
  if mArquivoCodOcorrenciaRet.AsString = '08' then
    DM1.tCReceberParcPgCartorio.AsBoolean := True;

  DM1.tMovimentos.MasterSource.Enabled        := False;
  
  DM2.tMovimentos2.Refresh;
  DM2.tMovimentos2.Filtered                   := False;
  DM2.tMovimentos2.Filter                     := 'CodConta = '''+IntToStr(vCodConta)+'''';
  DM2.tMovimentos2.Filtered                   := True;
  DM2.tMovimentos2.Last;
  DM1.tMovimentos.Insert;
  DM1.tMovimentosCodConta.AsInteger           := vCodConta;
  DM1.tMovimentosNumMovimento.AsInteger       := DM2.tMovimentos2NumMovimento.AsInteger + 1;
  DM1.tMovimentosNumCReceber.AsInteger        := DM1.tCReceberNumCReceber.AsInteger;
  DM1.tMovimentosDtMovimento.AsDateTime       := mArquivoDtOcorrencia.AsDateTime;
  DM1.tMovimentosNumNota.AsInteger            := DM1.tCReceberParcNumNota.AsInteger;
  DM1.tMovimentosCodCli.AsInteger             := DM1.tCReceberParcCodCli.AsInteger;
  DM1.tMovimentosPlanoContas.AsInteger        := DM1.tCReceberParcPlanoContas.AsInteger;
  DM1.tMovimentosVlrMovCredito.AsCurrency := mArquivoVlrPago.AsFloat;
  DM1.tMovimentosHistorico.AsString     := 'Rec.Parc.nº '+ DM1.tCReceberParcParcCReceber.AsString +
                                           ' nf.nº ' + DM1.tCReceberNumNota.AsString +
                                           ' de ' + DM1.tCReceberlkNomeCli.AsString;
  //DM1.tContas.FindKey([vCodConta]);
  //DM1.tContas.Edit;
  //DM1.tContasSaldoConta.AsFloat               := DM1.tContasSaldoConta.AsFloat + mArquivoVlrPago.AsFloat;
  //DM1.tContas.Post;
  DM1.tMovimentos.Post;
  vNumMov := DM1.tMovimentosNumMovimento.AsInteger;

  //Lança os Juros no movimento financeiro
  if mArquivoVlrJurosPagos.AsFloat > 0 then
    begin
      DM2.tMovimentos2.Refresh;
      DM2.tMovimentos2.Filtered               := False;
      DM2.tMovimentos2.Filter                 := 'CodConta = '''+IntToStr(vCodConta)+'''';
      DM2.tMovimentos2.Filtered               := True;
      DM2.tMovimentos2.Last;
      DM1.tMovimentos.Insert;
      DM1.tMovimentosCodConta.AsInteger       := vCodConta;
      DM1.tMovimentosNumMovimento.AsInteger   := DM2.tMovimentos2NumMovimento.AsInteger + 1;
      DM1.tMovimentosNumCReceber.AsInteger    := DM1.tCReceberNumCReceber.AsInteger;
      DM1.tMovimentosDtMovimento.AsDateTime   := mArquivoDtOcorrencia.AsDateTime;
      DM1.tMovimentosVlrMovCredito.AsFloat    := mArquivoVlrJurosPagos.AsFloat;
      DM1.tMovimentosNumNota.AsInteger        := DM1.tCReceberParcNumNota.AsInteger;
      DM1.tMovimentosCodCli.AsInteger         := DM1.tCReceberParcCodCli.AsInteger;
      DM1.tMovimentosPlanoContas.AsInteger    := DM1.tCReceberParcPlanoContas.AsInteger;
      DM1.tMovimentosHistorico.AsString       := 'Rec.Juros s/Parc.nº '+ DM1.tCReceberParcParcCReceber.AsString +
                                                 ' nf.nº ' + DM1.tCReceberNumNota.AsString +
                                                 ' de ' + DM1.tCReceberlkNomeCli.AsString;
      //DM1.tContas.FindKey([vCodConta]);
      //DM1.tContas.Edit;
      //DM1.tContasSaldoConta.AsFloat           := DM1.tContasSaldoConta.AsFloat
      //                                           + mArquivoVlrJurosPagos.AsFloat;
      //DM1.tContas.Post;
      DM1.tMovimentos.Post;
      vNumMovJuros := DM1.tMovimentosNumMovimento.AsInteger;
    end;
  DM1.tCReceberParcCodConta.AsInteger           := vCodConta;
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

procedure TfArqRetornoItau.Grava_Liquidacao;
begin
  if DM1.tCReceberParcQuitParcCReceber.AsBoolean <> True then
    begin
      Pagamento;
      mArquivo.Edit;
      mArquivoAtualizado.AsBoolean := True;
      mArquivo.Post;
    end;
end;

procedure TfArqRetornoItau.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tNotaFiscal.Close;
  Action := Cafree;
end;

procedure TfArqRetornoItau.BitBtn2Click(Sender: TObject);
begin
  mArquivo.EmptyDataSet;
end;

procedure TfArqRetornoItau.BitBtn1Click(Sender: TObject);
var
  Txt : TextFile;
  Entrada, Arquivo : String;
  vContinuar : Boolean;
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
                if DM1.tContasNumConta.AsString <> Copy(Entrada,33,5) then
                  begin
                    vContinuar := False;
                    ShowMessage('Nº da conta diferente ' + Copy(Entrada,33,5));
                  end
                else
                if Copy(Entrada,77,3) <> '341' then
                  begin
                    ShowMessage('Arq. não é do Banco Itaú,  ' + Copy(Entrada,77,3));
                    vContinuar := False;
                  end;
              end;
            if vContinuar then
              begin
                if Copy(Entrada,1,1) = '1' then
                  begin
                    mArquivo.Insert;
                    mArquivoAtualizado.AsString := 'N';
                    mArquivoNumTitEmpresa.AsString    := Copy(Entrada,38,25);
                    mArquivoNumCReceber.AsString      := Trim(Copy(Entrada,41,10));
                    mArquivoCodCarteira.AsString      := Copy(Entrada,83,3);
                    mArquivoNumTitBanco.AsString      := Copy(Entrada,86,8) + Copy(Entrada,94,1);
                    mArquivoCodOcorrenciaRet.AsString := Copy(Entrada,109,2);
                    Desc_Ocorrencia;
                    mArquivoDtOcorrencia.AsString     := Copy(Entrada,111,2) + '/' + Copy(Entrada,113,2) + '/' + '20' + Copy(Entrada,115,2);
                    mArquivoNumNota.AsString          := Copy(Entrada,117,6);
                    mArquivoParcela.AsString          := Trim(Copy(Entrada,124,3));
                    mArquivoConfNossoNumero.AsString  := Copy(Entrada,127,8);
                    mArquivoDtVenc.AsString           := Copy(Entrada,147,2) + '/' + Copy(Entrada,149,2) + '/' + '20' + Copy(Entrada,151,2);
                    mArquivoVlrTitulo.AsString        := Copy(Entrada,153,11) + ',' + Copy(Entrada,164,2);
                    if Trim(Copy(Entrada,174,2)) <> '' then
                      begin
                        case StrToInt(Copy(Entrada,174,2)) of
                          01 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'DUPLICATA MERCANTIL';
                          02 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'NOTA PROMISSÓRIA';
                          03 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'NOTA DE SEGURO';
                          04 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'MENSALIDADE ESCOLAR';
                          05 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'RECIBO';
                          06 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'CONTRATO';
                          07 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'COSSEGUROS';
                          08 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'DUPLICATA DE SERVIÇO';
                          09 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'LETRA DE CÂMBIO';
                          13 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'NOTA DE DÉBITOS';
                          99 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'DIVERSOS';
                        end;
                      end;
                    mArquivoVlrDespesaCobranca.AsString  := Copy(Entrada,176,11) + ',' + Copy(Entrada,187,2);
                    mArquivoVlrIOF.AsString              := Copy(Entrada,215,11) + ',' + Copy(Entrada,226,2);
                    mArquivoVlrAbatimento.AsString       := Copy(Entrada,228,11) + ',' + Copy(Entrada,239,2);
                    mArquivoVlrDesconto.AsString         := Copy(Entrada,241,11) + ',' + Copy(Entrada,252,2);
                    mArquivoVlrPago.AsString             := Copy(Entrada,254,11) + ',' + Copy(Entrada,265,2);
                    mArquivoVlrJurosPagos.AsString        := Copy(Entrada,267,11) + ',' + Copy(Entrada,278,2);
                    mArquivoDtLiquidacao.AsString := Copy(Entrada,296,2) + '/' + Copy(Entrada,298,2) + '/' + '20' + Copy(Entrada,300,2);

                    mArquivoCodInstrCancelada.AsString := Copy(Entrada,302,4);
                    mArquivoErros.AsString             := Copy(Entrada,378,8);
                    vIndiceErro := 0;
                    Motivo_Rejeicao(Trim(Copy(Entrada,378,8)));

                    mArquivoCodLiquidacao.AsString := Trim(Copy(Entrada,393,2));
                    Desc_Liquidacao;

                    if tCReceber.Locate('Filial;NumNota',VarArrayOf([DM1.tFilialCodigo.AsInteger,mArquivoNumNota.AsInteger]),[locaseinsensitive]) then
                      begin
                        mArquivoCodCliente.AsInteger := tCReceberCodCli.AsInteger;
                        mArquivoNomeCliente.AsString := tCReceberlkNomeCliente.AsString;
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

procedure TfArqRetornoItau.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Atualizar o contas a receber?',mtconfirmation,[mbok,mbno],0)=mrok then
    begin
      mArquivo.First;
      while not mArquivo.Eof do
        begin
          if mArquivoCodCliente.AsInteger > 0 then
            begin
              if DM1.tCReceber.Locate('Filial;CodCli;NumNota',VarArrayOf([DM1.tFilialCodigo.AsInteger,mArquivoCodCliente.AsInteger,mArquivoNumNota.AsInteger]),[locaseinsensitive]) then
                begin
                  DM1.tCReceberParc.SetKey;
                  DM1.tCReceberParcFilial.AsInteger       := DM1.tCReceberFilial.AsInteger;
                  DM1.tCReceberParcNumCReceber.AsInteger  := DM1.tCReceberNumCReceber.AsInteger;
                  DM1.tCReceberParcParcCReceber.AsInteger := mArquivoParcela.AsInteger;
                  if DM1.tCReceberParc.GotoKey then
                    begin
                      if mArquivoCodOcorrenciaRet.AsString = '02' then //ENTRADA CONFIRMADA
                        Grava_NumBanco
                      else
                      if (mArquivoCodOcorrenciaRet.AsString = '06') or
                         (mArquivoCodOcorrenciaRet.AsString = '08') or
                         (mArquivoCodOcorrenciaRet.AsString = '09') or
                         (mArquivoCodOcorrenciaRet.AsString = '10') then //LIQUIDAÇÃO DO TÍTULO
                        Grava_Liquidacao;
                    end
                  else
                    ShowMessage('Parcela não encontrada!')
                end
              else
                ShowMessage('Nota não encontrada!')
            end;
          mArquivo.Next;
        end;
    end;
end;

procedure TfArqRetornoItau.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (mArquivoAtualizado.AsBoolean) and (mArquivoCodOcorrenciaRet.AsString = '2') then
    begin
      Background  := clAqua;
      AFont.Color := clBlack;
    end
  else
  if (mArquivoAtualizado.AsBoolean) and ((mArquivoCodOcorrenciaRet.AsString = '06') or
     (mArquivoCodOcorrenciaRet.AsString = '08') or
     (mArquivoCodOcorrenciaRet.AsString = '09') or
     (mArquivoCodOcorrenciaRet.AsString = '10')) then //LIQUIDAÇÃO DO TÍTULO
    begin
      Background  := clTeal;
      AFont.Color := clBlack;
    end
  else
  if (mArquivoCodOcorrenciaRet.AsString = '19') or
     (mArquivoCodOcorrenciaRet.AsString = '23') then
    begin
      Background  := clRed;
      AFont.Color := clBlack;
    end
  else
  if (mArquivoCodOcorrenciaRet.AsString = '03') or
     (mArquivoCodOcorrenciaRet.AsString = '15') or
     (mArquivoCodOcorrenciaRet.AsString = '16') or
     (mArquivoCodOcorrenciaRet.AsString = '17') or
     (mArquivoCodOcorrenciaRet.AsString = '18') or
     (mArquivoCodOcorrenciaRet.AsString = '24') or
     (mArquivoCodOcorrenciaRet.AsString = '25') or
     (mArquivoCodOcorrenciaRet.AsString = '57') then
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

procedure TfArqRetornoItau.FormShow(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;

  DM1.tNotaFiscal.Open;
  tCReceber.Refresh;
  tCReceber.Close;
  tCReceber.Open;
  tCliente.Open;
  tExtComissaoIns.Open;
  DM1.tCReceber.IndexFieldNames := 'Filial;NumCReceber';
end;

procedure TfArqRetornoItau.Visualizar1Click(Sender: TObject);
begin
  if not mArquivo.IsEmpty then
    begin
      fRelArqRetItau := TfRelArqRetItau.Create(Self);
      fRelArqRetItau.QuickRep1.Preview;
      fRelArqRetItau.QuickRep1.Free;
    end
  else
    ShowMessage('Não há dados p/ imprimir!');
end;

procedure TfArqRetornoItau.Imprimir1Click(Sender: TObject);
begin
  if not mArquivo.IsEmpty then
    begin
      fRelArqRetItau := TfRelArqRetItau.Create(Self);
      fRelArqRetItau.QuickRep1.Print;
      fRelArqRetItau.QuickRep1.Free;
    end
  else
    ShowMessage('Não há dados p/ imprimir!');
end;

end.
