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
    procedure Grava_Historico(Tipo, Historico : String); //E- Entrada  L- Liquida��o  P-Protestado
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
    mArquivoDescLiquidacao.AsString := 'AG�NCIA ITA� - DIGITA��O OFF-LINE'
  else
  if mArquivoCodLiquidacao.AsString = 'CP' then
    mArquivoDescLiquidacao.AsString := 'AG�NCIA ITA� - TERMINAL CAIXA'
  else
  if mArquivoCodLiquidacao.AsString = 'AA' then
    mArquivoDescLiquidacao.AsString := 'CAIXA ELETR�NICO ITA�'
  else
  if mArquivoCodLiquidacao.AsString = 'BF' then
    mArquivoDescLiquidacao.AsString := 'ITA� BANKFONE'
  else
  if mArquivoCodLiquidacao.AsString = 'BL' then
    mArquivoDescLiquidacao.AsString := 'ITA� BANKLINE'
  else
  if mArquivoCodLiquidacao.AsString = 'BC' then
    mArquivoDescLiquidacao.AsString := 'BANCOS CORRESPONDENTES'
  else
  if mArquivoCodLiquidacao.AsString = 'CK' then
    mArquivoDescLiquidacao.AsString := 'SISPAG (SISTEMA DE CONTAS A PAGAR ITA�)'
  else
  if mArquivoCodLiquidacao.AsString = 'B1' then
    mArquivoDescLiquidacao.AsString := 'OUTRO BANCO PELO C�DIGO DE BARRAS'
  else
  if mArquivoCodLiquidacao.AsString = 'B2' then
    mArquivoDescLiquidacao.AsString := 'OUTRO BANCO PELA LINHA DIGIT�VEL'
  else
  if mArquivoCodLiquidacao.AsString = 'B3' then
    mArquivoDescLiquidacao.AsString := 'OUTRO BANCO EM AUTO-ATENDIMENTO'
  else
  if mArquivoCodLiquidacao.AsString = 'LC' then
    mArquivoDescLiquidacao.AsString := 'PAGAMENTO EM CART�RIO DE PROTESTO COM CHEQUE'
  else
  if mArquivoCodLiquidacao.AsString = 'AC' then
    mArquivoDescLiquidacao.AsString := 'PAGAMENTO EM CART�RIO AUTOMATIZADO';
end;

procedure TfArqRetornoItau.Desc_Ocorrencia;
begin
  Case mArquivoCodOcorrenciaRet.AsInteger of
    2 : mArquivoNomeOcorrenciaRet.AsString := 'ENTRADA CONFIRMADA';
    3 : mArquivoNomeOcorrenciaRet.AsString := 'ENTRADA REJEITADA';
    4 : mArquivoNomeOcorrenciaRet.AsString := 'ALTERA��O DE DADOS - NOVA ENTRADA';
    5 : mArquivoNomeOcorrenciaRet.AsString := 'ALTERA��O DE DADOS - BAIXA';
    6 : mArquivoNomeOcorrenciaRet.AsString := 'LIQUIDA��O NORMAL';
    8 : mArquivoNomeOcorrenciaRet.AsString := 'LIQUIDA��O CART�RIO';
    9 : mArquivoNomeOcorrenciaRet.AsString := 'BAIXA SIMPLES';
   10 : mArquivoNomeOcorrenciaRet.AsString := 'BAIXA POR TER SIDO LIQUIDADO';
   11 : mArquivoNomeOcorrenciaRet.AsString := 'EM SER (S� NO RETORNO MENSAL)';
   12 : mArquivoNomeOcorrenciaRet.AsString := 'ABATIMENTO CONCEDIDO';
   13 : mArquivoNomeOcorrenciaRet.AsString := 'ABATIMENTO CANCELADO';
   14 : mArquivoNomeOcorrenciaRet.AsString := 'VENCIMENTO ALTERADO';
   15 : mArquivoNomeOcorrenciaRet.AsString := 'BAIXAS REJEITADAS';
   16 : mArquivoNomeOcorrenciaRet.AsString := 'INSTRU��ES REJEITADAS';
   17 : mArquivoNomeOcorrenciaRet.AsString := 'ALTERA��O DE DADOS REJEITADOS ';
   18 : mArquivoNomeOcorrenciaRet.AsString := 'COBRAN�A CONTRATUAL - ABATIMENTO E BAIXA BLOQUEADOS';
   19 : mArquivoNomeOcorrenciaRet.AsString := 'CONFIRMA RECEBIMENTO DE INSTRU��O DE PROTESTO';
   20 : mArquivoNomeOcorrenciaRet.AsString := 'CONFIRMA RECEBIMENTO DE INSTRU��O DE SUSTA��O DE PROTESTO /TARIFA';
   21 : mArquivoNomeOcorrenciaRet.AsString := 'CONFIRMA RECEBIMENTO DE INSTRU��O DE N�O PROTESTAR';
   23 : mArquivoNomeOcorrenciaRet.AsString := 'PROTESTO ENVIADO A CART�RIO/TARIFA';
   24 : mArquivoNomeOcorrenciaRet.AsString := 'INSTRU��O DE PROTESTO REJEITADA / SUSTADA / PENDENTE';
   25 : mArquivoNomeOcorrenciaRet.AsString := 'ALEGA��ES DO SACADO';
   26 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA DE AVISO DE COBRAN�A';
   27 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA DE EXTRATO POSI��O';
   28 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA DE RELA��O DAS LIQUIDA��ES';
   29 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA DE MANUTEN��O DE T�TULOS VENCIDOS';
   30 : mArquivoNomeOcorrenciaRet.AsString := 'D�BITO MENSAL DE TARIFAS (PARA ENTRADAS E BAIXAS)';
   32 : mArquivoNomeOcorrenciaRet.AsString := 'BAIXA POR TER SIDO PROTESTADO';
   33 : mArquivoNomeOcorrenciaRet.AsString := 'CUSTAS DE PROTESTO';
   34 : mArquivoNomeOcorrenciaRet.AsString := 'CUSTAS DE SUSTA��O';
   35 : mArquivoNomeOcorrenciaRet.AsString := 'CUSTAS DE CART�RIO DISTRIBUIDOR';
   36 : mArquivoNomeOcorrenciaRet.AsString := 'CUSTAS DE EDITAL';
   37 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA DE EMISS�O DE BLOQUETO/TARIFA DE ENVIO DE DUPLICATA';
   38 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA DE INSTRU��O';
   39 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA DE OCORR�NCIAS';
   40 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA MENSAL DE EMISS�O DE BLOQUETO/TARIFA MENSAL DE ENVIO DE DUPLICATA';
   41 : mArquivoNomeOcorrenciaRet.AsString := 'D�BITO MENSAL DE TARIFAS - EXTRATO DE POSI��O (B4EP/B4OX)';
   42 : mArquivoNomeOcorrenciaRet.AsString := 'D�BITO MENSAL DE TARIFAS - OUTRAS INSTRU��ES';
   43 : mArquivoNomeOcorrenciaRet.AsString := 'D�BITO MENSAL DE TARIFAS - MANUTEN��O DE T�TULOS VENCIDOS';
   44 : mArquivoNomeOcorrenciaRet.AsString := 'D�BITO MENSAL DE TARIFAS - OUTRAS OCORR�NCIAS';
   45 : mArquivoNomeOcorrenciaRet.AsString := 'D�BITO MENSAL DE TARIFAS - PROTESTO';
   46 : mArquivoNomeOcorrenciaRet.AsString := 'D�BITO MENSAL DE TARIFAS - SUSTA��O DE PROTESTO';
   47 : mArquivoNomeOcorrenciaRet.AsString := 'BAIXA COM TRANSFER�NCIA PARA DESCONTO';
   48 : mArquivoNomeOcorrenciaRet.AsString := 'CUSTAS DE SUSTA��O JUDICIAL';
   51 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA MENSAL REF A ENTRADAS BANCOS CORRESPONDENTES NA CARTEIRA';
   52 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA MENSAL BAIXAS NA CARTEIRA';
   53 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA MENSAL BAIXAS EM BANCOS CORRESPONDENTES NA CARTEIRA';
   54 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA MENSAL  DE LIQUIDA��ES NA CARTEIRA';
   55 : mArquivoNomeOcorrenciaRet.AsString := 'TARIFA MENSAL DE LIQUIDA��ES EM BANCOS CORRESPONDENTES NA CARTEIRA';
   56 : mArquivoNomeOcorrenciaRet.AsString := 'CUSTAS DE IRREGULARIDADE';
   57 : mArquivoNomeOcorrenciaRet.AsString := 'INSTRU��O CANCELADA';
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
                03 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'AG. COBRADORA	N�O FOI POSS�VEL ATRIBUIR A AG�NCIA  PELO CEP OU CEP INV�LIDO';
                04 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ESTADO	SIGLA DO ESTADO INV�LIDA';
                05 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA VENCIMENTO	PRAZO DA OPERA��O MENOR QUE PRAZO M�NIMO OU MAIOR QUE O M�XIMO';
                07 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'VALOR DO T�TULO	VALOR DO T�TULO MAIOR QUE 10.000.000,00';
                08 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NOME DO SACADO 	N�O INFORMADO OU DESLOCADO';
                09 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'AG�NCIA/CONTA 	AG�NCIA ENCERRADA';
                10 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'LOGRADOURO 	N�O INFORMADO OU DESLOCADO';
                11 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CEP	CEP N�O NUM�RICO';
                12 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SACADOR / AVALISTA 	NOME N�O INFORMADO OU DESLOCADO (BANCOS CORRESPONDENTES)';
                13 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ESTADO/CEP 	CEP INCOMPAT�VEL COM A SIGLA DO ESTADO';
                14 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NOSSO N�MERO	NOSSO N�MERO J� REGISTRADO NO CADASTRO DO BANCO OU FORA DA FAIXA';
                15 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NOSSO N�MERO	NOSSO N�MERO EM DUPLICIDADE NO MESMO MOVIMENTO';
                18 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA DE ENTRADA	DATA DE ENTRADA INV�LIDA PARA OPERAR COM ESTA CARTEIRA';
                19 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'OCORR�NCIA	OCORR�NCIA INV�LIDA';
                21 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'AG.COBR."CART.N�O ACEITA DEPOSIT.CORRESPONDENTE" "UF AG.DIF DA UF SACADO';
                22 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CARTEIRA 	CARTEIRA N�O PERMITIDA (NECESS�RIO CADASTRAR FAIXA LIVRE)';
                27 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CGC INAPTO	CGC DO CEDENTE INAPTO';
                29 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'C�DIGO EMPRESA	CATEGORIA DA CONTA INV�LIDA';
                35 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'VALOR DO IOF	IOF MAIOR QUE 5%';
                36 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'QTDADE DE MOEDA	QUANTIDADE DE MOEDA INCOMPAT�VEL COM VALOR DO T�TULO';
                37 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CGC/CPF DO SACADO	N�O NUM�RICO OU IGUAL A ZEROS';
                42 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NOSSO N�MERO	NOSSO N�MERO FORA DE FAIXA';
                52 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'AG. COBRADORA	EMPRESA N�O ACEITA BANCO CORRESPONDENTE';
                53 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'AG. COBRADORA	EMPRESA N�O ACEITA BANCO CORRESPONDENTE  - COBRAN�A MENSAGEM';
                54 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA DE VENCTO	BANCO CORRESPONDENTE - T�TULO COM VENCIMENTO INFERIOR A 15 DIAS';
                55 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DEP/BCO CORRESP	CEP N�O PERTENCE A DEPOSIT�RIA INFORMADA';
                56 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DT VENCTO/BCO CORRESP	VENCTO SUPERIOR A 180 DIAS DA DATA DE ENTRADA';
                57 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA DE VENCTO 	CEP S� DEPOSIT�RIA BCO DO BRASIL COM VENCTO INFERIOR A 8 DIAS';
                60 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ABATIMENTO	VALOR DO ABATIMENTO INV�LIDO';
                61 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'JUROS DE MORA	JUROS DE MORA MAIOR QUE O PERMITIDO';
                62 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DESCONTO	VALOR DO DESCONTO MAIOR QUE O VALOR DO T�TULO';
                63 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'IMPORT�NCIA POR DIA DE DESCONTO	N�O PERMITIDO';
                64 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'EMISS�O DO T�TULO	DATA DE EMISS�O DO T�TULO INV�LIDA (VENDOR)';
                65 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'TAXA FINANCTO	TAXA INV�LIDA (VENDOR)';
                66 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA DE VENCTO	INVALIDA/FORA DE PRAZO DE OPERA��O (M�NIMO OU M�XIMO)';
                67 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'VALOR/QTIDADE	VALOR DO T�TULO/QUANTIDADE DE MOEDA INV�LIDO';
                68 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CARTEIRA 	CARTEIRA INV�LIDA';
                98 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'FLASH INV�LIDO REGISTRO MENSAGEM SEM FLASH CADASTRADO OU FLASH INFORMADO DIFERENTE DO CADASTRADO';
                99 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'FLASH INV�LIDO CONTA DE COBRAN�A COM FLASH CADASTRADO E SEM REGISTRO DE MENSAGEM CORRESPONDENTE';
                91 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DAC	DAC AG�NCIA / CONTA CORRENTE INV�LIDO';
                92 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DAC	DAC AG�NCIA/CONTA/CARTEIRA/NOSSO N�MERO INV�LIDO';
                93 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ESTADO	SIGLA ESTADO INV�LIDA';
                94 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ESTADO	SIGLA ESTADO INCOMPAT�VEL COM CEP DO SACADO';
                95 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CEP	CEP DO SACADO N�O NUM�RICO OU INV�LIDO';
                96 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ENDERE�O	ENDERE�O / NOME / CIDADE SACADO INV�LIDO';
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
                02 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'AG�NCIA COBRADORA INV�LIDA OU COM O MESMO CONTE�DO';
                04 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SIGLA DO ESTADO INV�LIDA';
                05 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA DE VENCIMENTO INV�LIDA OU COM O MESMO CONTE�DO';
                06 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'VALOR DO T�TULO COM OUTRA ALTERA��O SIMULT�NEA';
                08 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NOME DO SACADO COM O MESMO CONTE�DO';
                09 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'AG�NCIA/CONTA INCORRETA';
                11 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CEP INV�LIDO';
                13 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SEU N�MERO COM O MESMO CONTE�DO';
                16 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ABATIMENTO/ALTERA��O DO VALOR DO T�TULO OU SOLICITA��O DE BAIXA BLOQUEADA';
                21 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'AG�NCIA COBRADORA N�O CONSTA NO CADASTRO DE DEPOSIT�RIA OU EM ENCERRAMENTO';
                53 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRU��O COM O MESMO CONTE�DO';
                54 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA VENCIMENTO PARA BANCOS CORRESPONDENTES INFERIOR AO ACEITO PELO BANCO';
                55 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ALTERA��ES IGUAIS PARA O MESMO CONTROLE (AG�NCIA/CONTA/CARTEIRA/NOSSO N�MERO)';
                56 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CGC/CPF INV�LIDO N�O NUM�RICO OU ZERADO';
                57 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'PRAZO DE VENCIMENTO INFERIOR A 15 DIAS';
                60 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'VALOR DE IOF - ALTERA��O N�O PERMITIDA PARA CARTEIRAS DE N.S. - MOEDA VARI�VEL';
                61 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'T�TULO J� BAIXADO OU LIQUIDADO OU N�O EXISTE T�TULO CORRESPONDENTE NO SISTEMA';
                66 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ALTERA��O N�O PERMITIDA PARA CARTEIRAS DE NOTAS DE SEGUROS - MOEDA VARI�VEL';
                81 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ALTERA��O BLOQUEADA - T�TULO COM PROTESTO';
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
                01 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRU��O/OCORR�NCIA N�O EXISTENTE';
                06 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NOSSO N�MERO IGUAL A ZEROS';
                09 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CGC/CPF  DO SACADOR/AVALISTA INV�LIDO';
                10 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'VALOR DO ABATIMENTO IGUAL OU MAIOR QUE O VALOR DO T�TULO';
                14 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'REGISTRO EM DUPLICIDADE';
                15 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CGC/CPF INFORMADO SEM NOME DO SACADOR/AVALISTA';
                21 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'T�TULO N�O REGISTRADO NO SISTEMA';
                22 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'T�TULO BAIXADO OU LIQUIDADO';
                23 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRU��O N�O ACEITA POR TER SIDO EMITIDO �LTIMO AVISO AO SACADO';
                24 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRU��O INCOMPAT�VEL - EXISTE INSTRU��O DE PROTESTO PARA O T�TULO';
                25 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRU��O INCOMPAT�VEL - N�O EXISTE INSTRU��O DE PROTESTO PARA O T�TULO';
                26 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRU��O N�O ACEITA POR TER SIDO EMITIDO �LTIMO AVISO AO SACADO';
                27 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRU��O N�O ACEITA POR N�O TER SIDO EMITIDA A ORDEM DE PROTESTO AO CART�RIO';
                28 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'J� EXISTE UMA MESMA INSTRU��O CADASTRADA ANTERIORMENTE PARA O T�TULO';
                29 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'VLR.L�Q. + VLR.ABATIM.DIFERENTE DO VLR.DO T�TULO, OU VLR.ABATIMENTO MAIOR QUE 90% DO VLR.DO T�TULO';
                30 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'EXISTE UMA INSTRU��O DE N�O PROTESTAR ATIVA PARA O T�TULO';
                31 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'EXISTE UMA OCORR�NCIA DO SACADO QUE BLOQUEIA A INSTRU��O';
                32 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DEPOSIT�RIA DO T�TULO = 9999 OU CARTEIRA N�O ACEITA PROTESTO';
                33 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ALTERA��O DE VENCIMENTO IGUAL � REGISTRADA NO SISTEMA OU QUE TORNA O T�TULO VENCIDO';
                34 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRU��O DE EMISS�O DE AVISO DE COBRAN�A PARA T�TULO VENCIDO ANTES DO VENCIMENTO';
                35 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SOLICITA��O DE CANCELAMENTO DE INSTRU��O INEXISTENTE';
                36 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'T�TULO SOFRENDO ALTERA��O DE CONTROLE (AG�NCIA/CONTA/CARTEIRA/NOSSO N�MERO)';
                37 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'INSTRU��O N�O PERMITIDA PARA A CARTEIRA';
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
                01 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CARTEIRA/N� N�MERO N�O NUM�RICO';
                04 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'NOSSO N�MERO EM DUPLICIDADE NUM MESMO MOVIMENTO';
                05 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SOLICITA��O DE BAIXA PARA T�TULO J� BAIXADO OU LIQUIDADO';
                06 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SOLICITA��O DE BAIXA PARA T�TULO N�O REGISTRADO NO SISTEMA';
                07 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'COBRAN�A PRAZO CURTO - SOLICITA��O DE BAIXA P/ T�TULO N�O REGISTRADO NO SISTEMA';
                08 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SOLICITA��O DE BAIXA PARA T�TULO EM FLOATING';
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
                16 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ABATIMENTO/ALTERA��O DO VALOR DO T�TULO OU SOLICITA��O DE BAIXA BLOQUEADOS';
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
            1313 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SOLICITA A PRORROGA��O DO VENCIMENTO PARA:';
            1321 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SOLICITA A DISPENSA DOS JUROS DE MORA';
            1339 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'N�O RECEBEU A MERCADORIA';
            1347 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'A MERCADORIA CHEGOU ATRASADA';
            1354 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'A MERCADORIA CHEGOU AVARIADA';
            1362 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'A MERCADORIA CHEGOU INCOMPLETA';
            1370 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'A MERCADORIA N�O CONFERE COM O PEDIDO';
            1388 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'A MERCADORIA EST� � DISPOSI��O';
            1396 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DEVOLVEU A MERCADORIA';
            1404 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'N�O RECEBEU A FATURA';
            1412 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'A FATURA EST� EM DESACORDO COM A NOTA FISCAL';
            1420 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'O PEDIDO DE COMPRA FOI CANCELADO';
            1438 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'A DUPLICATA FOI CANCELADA';
            1446 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'QUE NADA DEVE OU COMPROU';
            1453 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'QUE MANT�M ENTENDIMENTOS COM O SACADOR';
            1461 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'QUE PAGAR� O T�TULO EM:';
            1479 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'QUE PAGOU O T�TULO DIRETAMENTE AO CEDENTE EM:';
            1487 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'QUE PAGAR� O T�TULO DIRETAMENTE AO CEDENTE EM:';
            1495 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'QUE O VENCIMENTO CORRETO �:';
            1503 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'VALOR	QUE TEM DESCONTO OU ABATIMENTO DE:';
            1719 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SACADO N�O FOI LOCALIZADO; CONFIRMAR ENDERE�O';
            1727 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SACADO EST� EM REGIME DE CONCORDATA';
            1735 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SACADO EST� EM REGIME DE FAL�NCIA';
            1750 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SACADO SE RECUSA A PAGAR JUROS BANC�RIOS';
            1768 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SACADO SE RECUSA A PAGAR COMISS�O DE PERMAN�NCIA';
            1776 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'N�O FOI POSS�VEL A ENTREGA DO BLOQUETO AO SACADO';
            1784 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'BLOQUETO N�O ENTREGUE, MUDOU-SE/DESCONHECIDO';
            1792 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'BLOQUETO N�O ENTREGUE, CEP ERRADO/INCOMPLETO';
            1800 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'BLOQUETO N�O ENTREGUE, N�MERO N�O EXISTE/ENDERE�O INCOMPLETO';
            1818 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'BLOQUETO N�O RETIRADO PELO SACADO. REENVIADO PELO CORREIO';
            1826 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ENDERE�O DE E-MAIL INV�LIDO. BLOQUETO ENVIADO PELO CORREIO';
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
            1610 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DOCUMENTA��O SOLICITADA AO CEDENTE';
            3111 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SUSTA��O SOLICITADA AG. CEDENTE';
            3228 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ATOS DA CORREGEDORIA ESTADUAL';
            3244 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'PROTESTO SUSTADO / CEDENTE N�O ENTREGOU A DOCUMENTA��O';
            3269 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA DE EMISS�O DO T�TULO INV�LIDA/IRREGULAR';
            3301 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CGC/CPF DO SACADO INV�LIDO/INCORRETO';
            3319 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'SACADOR/AVALISTA E PESSOA F�SICA';
            3327 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CEP DO SACADO INCORRETO';
            3335 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DEPOSIT�RIA INCOMPAT�VEL COM CEP DO SACADO';
            3343 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CGC/CPF SACADOR INVALIDO/INCORRETO';
            3350 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'ENDERE�O DO SACADO INSUFICIENTE';
            3368 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'PRA�A PAGTO INCOMPAT�VEL COM ENDERE�O';
            3376 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'FALTA N�MERO/ESP�CIE DO T�TULO';
            3384 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'T�TULO ACEITO S/ ASSINATURA DO SACADOR';
            3392 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'T�TULO ACEITO S/ ENDOSSO CEDENTE OU IRREGULAR';
            3400 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'T�TULO SEM LOCAL OU DATA DE EMISS�O';
            3418 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'T�TULO ACEITO COM VALOR EXTENSO DIFERENTE DO NUM�RICO';
            3426 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'T�TULO ACEITO DEFINIR ESP�CIE DA DUPLICATA';
            3434 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DATA EMISS�O POSTERIOR AO VENCIMENTO';
            3442 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'T�TULO ACEITO DOCUMENTO N�O PROSTEST�VEL';
            3459 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'T�TULO ACEITO EXTENSO VENCIMENTO IRREGULAR';
            3467 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'T�TULO ACEITO FALTA NOME FAVORECIDO';
            3475 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'T�TULO ACEITO FALTA PRA�A DE PAGAMENTO';
            3483 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'T�TULO ACEITO FALTA CPF ASSINANTE CHEQUE';
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
            1156 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'N�O PROTESTAR';
            2261 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'DISPENSAR JUROS/COMISS�O DE  PERMAN�NCIA';
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
  DM1.tMovimentosHistorico.AsString     := 'Rec.Parc.n� '+ DM1.tCReceberParcParcCReceber.AsString +
                                           ' nf.n� ' + DM1.tCReceberNumNota.AsString +
                                           ' de ' + DM1.tCReceberlkNomeCli.AsString;
  //DM1.tContas.FindKey([vCodConta]);
  //DM1.tContas.Edit;
  //DM1.tContasSaldoConta.AsFloat               := DM1.tContasSaldoConta.AsFloat + mArquivoVlrPago.AsFloat;
  //DM1.tContas.Post;
  DM1.tMovimentos.Post;
  vNumMov := DM1.tMovimentosNumMovimento.AsInteger;

  //Lan�a os Juros no movimento financeiro
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
      DM1.tMovimentosHistorico.AsString       := 'Rec.Juros s/Parc.n� '+ DM1.tCReceberParcParcCReceber.AsString +
                                                 ' nf.n� ' + DM1.tCReceberNumNota.AsString +
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
                    ShowMessage('N� da conta diferente ' + Copy(Entrada,33,5));
                  end
                else
                if Copy(Entrada,77,3) <> '341' then
                  begin
                    ShowMessage('Arq. n�o � do Banco Ita�,  ' + Copy(Entrada,77,3));
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
                          02 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'NOTA PROMISS�RIA';
                          03 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'NOTA DE SEGURO';
                          04 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'MENSALIDADE ESCOLAR';
                          05 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'RECIBO';
                          06 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'CONTRATO';
                          07 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'COSSEGUROS';
                          08 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'DUPLICATA DE SERVI�O';
                          09 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'LETRA DE C�MBIO';
                          13 : mArquivoEspecieDoc.AsString := Copy(Entrada,174,2) + '-' + 'NOTA DE D�BITOS';
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
                        mArquivoNomeCliente.AsString := '...N�O ACHOU T�TULO, verificar...';
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
      ShowMessage('Voc� deve informar um arquivo p/ gerar a busca!');
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
                         (mArquivoCodOcorrenciaRet.AsString = '10') then //LIQUIDA��O DO T�TULO
                        Grava_Liquidacao;
                    end
                  else
                    ShowMessage('Parcela n�o encontrada!')
                end
              else
                ShowMessage('Nota n�o encontrada!')
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
     (mArquivoCodOcorrenciaRet.AsString = '10')) then //LIQUIDA��O DO T�TULO
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
    ShowMessage('N�o h� dados p/ imprimir!');
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
    ShowMessage('N�o h� dados p/ imprimir!');
end;

end.
