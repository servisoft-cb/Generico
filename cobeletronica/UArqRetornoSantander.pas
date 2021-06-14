Unit UArqRetornoSantander;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, RXCtrls, Menus, Grids,
  DBGrids, RXDBCtrl, Db, DBTables, MemTable, ALed, Variants, DBClient;

type
  TfArqRetornoSantander = class(TForm)
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
    tClienteCodTransp: TIntegerField;
    tClienteIPISuspenso: TBooleanField;
    tClienteDtValidadeIPI: TDateField;
    tClienteCodObsIPI: TIntegerField;
    tClienteVendaPorMilheiro: TBooleanField;
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
    mArquivoVlrDespesaCobranca: TFloatField;
    mArquivoVlrIOF: TFloatField;
    mArquivoVlrAbatimento: TFloatField;
    mArquivoVlrDesconto: TFloatField;
    mArquivoVlrPago: TFloatField;
    mArquivoVlrJurosPagos: TFloatField;
    mArquivoDtLiquidacao: TStringField;
    mArquivoNomeCliente: TStringField;
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
    mArquivoCNPJCPF: TStringField;
    mArquivoVlrLiquido: TFloatField;
    mArquivoVlrOutrasDespesas: TFloatField;
    mArquivoVlrOutrosCreditos: TFloatField;
    mArquivoVlrOcorrenciaSacado: TFloatField;
    mArquivoCodOcorrenciaSacado: TStringField;
    mArquivoDtOcorrenciaSacado: TStringField;
    mArquivoComplementoOcorrenciaSacado: TStringField;
    mArquivoDescOcorrenciaSacado: TStringField;
    mArquivoFilial: TIntegerField;
    mArquivoDtCredito: TStringField;
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
    Entrada, Arquivo, Texto1 : String;

    procedure Grava_NumBanco;
    procedure Grava_Liquidacao;
    procedure Grava_Historico(Tipo, Historico : String); //E- Entrada  L- Liquidação  P-Protestado
    procedure Grava_ExtComissao;
    procedure Pagamento;
    procedure Grava_Protesto;
    procedure Grava_Vencimento;
    procedure Motivo_Rejeicao(Codigo : String);
    procedure Desc_Ocorrencia;
    procedure Desc_Liquidacao40C;
    procedure Grava_mArquivo;
    procedure Edita_mArquivo;
    procedure Desc_OcorrenciaSacado;

  public
    { Public declarations }
  end;

var
  fArqRetornoSantander: TfArqRetornoSantander;

implementation

uses UDM1, UDM2, URelArqRetSantander;

{$R *.DFM}

procedure TfArqRetornoSantander.Grava_mArquivo;
var
  i : Integer;
  vFlag : Integer;
begin
  mArquivo.Insert;
  mArquivoAtualizado.AsString    := 'N';
  mArquivoNumTitEmpresa.AsString := Copy(Entrada,55,15);
  mArquivoNumNota.AsString       := '';
  mArquivoParcela.AsString       := '';
  i     := 0;
  vFlag := 0;
  while vFlag < 2 do
    begin
      inc(i);
      if (i > 15) or (Trim(copy(mArquivoNumTitEmpresa.AsString,i,1)) = '') then
        vFlag := 2
      else
      if copy(mArquivoNumTitEmpresa.AsString,i,1) = '/' then
        vFlag := 1
      else
      if (Trim(copy(mArquivoNumTitEmpresa.AsString,i,1)) <> '') and
         (vFlag = 0) then
        mArquivoNumNota.AsString := mArquivoNumNota.AsString + copy(mArquivoNumTitEmpresa.AsString,i,1)
      else
      if (Trim(copy(mArquivoNumTitEmpresa.AsString,i,1)) <> '') and
         (vFlag = 1) then
        mArquivoParcela.AsString := mArquivoParcela.AsString + copy(mArquivoNumTitEmpresa.AsString,i,1)
    end;
  if Copy(Entrada,103,1) = '.' then
    begin
      mArquivoFilial.AsString         := Copy(Entrada,101,2);
      mArquivoNumCReceber.AsString    := Trim(Copy(Entrada,104,20));
    end
  else
    begin
      mArquivoFilial.AsInteger        := 1;
      mArquivoNumCReceber.AsString    := Trim(Copy(Entrada,101,25));
    end;
  mArquivoCodCarteira.AsString      := Copy(Entrada,54,1);
  mArquivoNumTitBanco.AsString      := Copy(Entrada,41,13);
  mArquivoCodOcorrenciaRet.AsString := trim(Copy(Entrada,16,2));
  Desc_Ocorrencia;
  mArquivoDtVenc.AsString           := Copy(Entrada,70,2) + '/' + Copy(Entrada,72,2) + '/' + Copy(Entrada,74,4);
  mArquivoVlrTitulo.AsString        := Copy(Entrada,78,13) + ',' + Copy(Entrada,91,2);
  mArquivoCNPJCPF.AsString          := Copy(Entrada,129,15);
  mArquivoNomeCliente.AsString      := Copy(Entrada,144,40);
  mArquivoVlrDespesaCobranca.AsString := Copy(Entrada,194,13) + ',' + Copy(Entrada,207,2);
  if (mArquivoCodOcorrenciaRet.AsString = '06') or
     (mArquivoCodOcorrenciaRet.AsString = '09') or
     (mArquivoCodOcorrenciaRet.AsString = '17') then
    Desc_Liquidacao40C;
  vIndiceErro := 0;
  if (mArquivoCodOcorrenciaRet.AsString = '03') or
     (mArquivoCodOcorrenciaRet.AsString = '26') or
     (mArquivoCodOcorrenciaRet.AsString = '30') then
    Motivo_Rejeicao(Trim(Copy(Entrada,209,10)));

  if tCReceber.Locate('Filial;NumCReceber',VarArrayOf([mArquivoFilial.AsInteger,mArquivoNumCReceber.AsInteger]),[locaseinsensitive]) then
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

procedure TfArqRetornoSantander.Edita_mArquivo;
begin
  mArquivo.Edit;
  if mArquivoCodOcorrenciaRet.AsString = '' then
    begin
      mArquivoCodOcorrenciaRet.AsString := trim(Copy(Entrada,16,2));
      Desc_Ocorrencia;
    end;
  mArquivoVlrJurosPagos.AsString     := Copy(Entrada,18,13) + ',' + Copy(Entrada,31,2);
  mArquivoVlrDesconto.AsString       := Copy(Entrada,33,13) + ',' + Copy(Entrada,46,2);
  mArquivoVlrAbatimento.AsString     := Copy(Entrada,48,13) + ',' + Copy(Entrada,61,2);
  mArquivoVlrIOF.AsString            := Copy(Entrada,63,13) + ',' + Copy(Entrada,76,2);
  mArquivoVlrPago.AsString           := Copy(Entrada,78,13) + ',' + Copy(Entrada,91,2);
  mArquivoVlrLiquido.AsString        := Copy(Entrada,93,13) + ',' + Copy(Entrada,106,2);
  mArquivoVlrOutrasDespesas.AsString := Copy(Entrada,108,13) + ',' + Copy(Entrada,121,2);
  mArquivoVlrOutrosCreditos.AsString := Copy(Entrada,123,13) + ',' + Copy(Entrada,136,2);
  mArquivoDtOcorrencia.AsString      := Copy(Entrada,138,2) + '/' + Copy(Entrada,140,2) + '/' + Copy(Entrada,142,4);
  mArquivoDtCredito.AsString         := Copy(Entrada,146,2) + '/' + Copy(Entrada,148,2) + '/' + Copy(Entrada,150,4);
  mArquivoCodOcorrenciaSacado.AsString := Copy(Entrada,154,4);
  mArquivoDtOcorrenciaSacado.AsString  := Copy(Entrada,158,2) + '/' + Copy(Entrada,160,2) + '/' + Copy(Entrada,162,4);
  mArquivoVlrOcorrenciaSacado.AsString := Copy(Entrada,166,13) + ',' + Copy(Entrada,179,2);
  mArquivoComplementoOcorrenciaSacado.AsString := Copy(Entrada,181,30);
  Desc_OcorrenciaSacado;
  mArquivo.Post;
end;

procedure TfArqRetornoSantander.Desc_OcorrenciaSacado;
begin
  case mArquivoCodOcorrenciaSacado.AsInteger of
    0101 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que não recebeu a  mercadoria';
    0102 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que a mercadoria chegou atrasada';
    0103 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que a mercadoria chegou avariada';
    0104 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que a mercadoria não confere com o pedido';
    0105 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que a mercadoria chegou incompleta';
    0106 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que a mercadoria está à disposição ao cedente';
    0107 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que devolveu a mercadoria';
    0108 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que a mercadoria está em desacordo com a Nota Fiscal';
    0109 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que nada deve ou comprou';
    0201 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que não recebeu a fatura';
    0202 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que o pedido de compra foi cancelado';
    0203 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que a duplicata foi cancelada';
    0204 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega não ter recebido a mercadoria, nota fiscal, fatura';
    0205 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que a duplicata/fatura está incorreta';
    0206 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que o valor está incorreto';
    0207 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que o faturamento é indevido';
    0208 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que não localizou o pedido de compra';
    0301 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que o vencimento correto é:';
    0302 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado solicita a  prorrogação de vencimento para:';
    0303 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado aceita se vencimento prorrogado para:';
    0304 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que pagará o título em:';
    0305 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado pagou o título diretamente ao cedente em:';
    0306 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado pagará o título diretamente ao cedente em:';
    0401 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado não foi localizado, confirmar endereço';
    0402 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado mudou-se, transferiu de domicílio';
    0403 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado não recebe no endereço indicado';
    0404 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado desconhecido no local';
    0405 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado reside fora do perímetro';
    0406 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado com endereço incompleto';
    0407 : mArquivoDescOcorrenciaSacado.AsString := 'Não foi localizado o número constante no endereço do título';
    0408 : mArquivoDescOcorrenciaSacado.AsString := 'Endereço não localizado/não consta nos guias da cidade';
    0409 : mArquivoDescOcorrenciaSacado.AsString := 'Endereço do sacado alterado para:';
    0501 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que tem desconto ou abatimento de:';
    0502 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado solicita desconto ou abatimento de:';
    0503 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado solicita dispensa dos juros de mora';
    0504 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado se recusa a pagar juros';
    0505 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado se recusa a pagar comissão de permanência';
    0601 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado está em regime de concordata';
    0602 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado está em regime de falência';
    0603 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado alega que mantém entendimentos com sacador';
    0604 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado está em entendimentos com o cedente';
    0605 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado está viajando';
    0606 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado recusou-se a aceitar o título';
    0607 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado sustou  protesto judicialmente';
    0608 : mArquivoDescOcorrenciaSacado.AsString := 'Empregado recusou-se a receber o título';
    0609 : mArquivoDescOcorrenciaSacado.AsString := 'Título reapresentado ao sacado';
    0610 : mArquivoDescOcorrenciaSacado.AsString := 'Estamos nos dirigindo ao nosso correspondente';
    0611 : mArquivoDescOcorrenciaSacado.AsString := 'Correspondente não se interessa pelo protesto';
    0612 : mArquivoDescOcorrenciaSacado.AsString := 'Sacado não atende aos avisos de nossos correspondentes';
    0613 : mArquivoDescOcorrenciaSacado.AsString := 'Título está sendo encaminhado ao correspondente';
    0614 : mArquivoDescOcorrenciaSacado.AsString := 'Entrega franco de pagamento ao sacado';
    0615 : mArquivoDescOcorrenciaSacado.AsString := 'Entrega franco de pagamento ao representante';
    0616 : mArquivoDescOcorrenciaSacado.AsString := 'A entrega franco de pagamento é difícil';
    0617 : mArquivoDescOcorrenciaSacado.AsString := 'Título recusado pelo cartório:';
  end;
end;

procedure TfArqRetornoSantander.Desc_Liquidacao40C;
begin
  if copy(Entrada,209,2) = '01' then
    mArquivoDescLiquidacao.AsString := 'POR SALDO'
  else
  if copy(Entrada,209,2) = '02' then
    mArquivoDescLiquidacao.AsString := 'POR CONTA'
  else
  if copy(Entrada,209,2) = '03' then
    mArquivoDescLiquidacao.AsString := 'NO PRÓPRIO BANCO'
  else
  if copy(Entrada,209,2) = '04' then
    mArquivoDescLiquidacao.AsString := 'COMPENSAÇÃO ELETRÔNICA'
  else
  if copy(Entrada,209,2) = '05' then
    mArquivoDescLiquidacao.AsString := 'COMPENSAÇÃO CONVENCIONAL'
  else
  if copy(Entrada,209,2) = '06' then
    mArquivoDescLiquidacao.AsString := 'ARQUIVO MAGNÉTICO'
  else
  if copy(Entrada,209,2) = '07' then
    mArquivoDescLiquidacao.AsString := 'APÓS FERIADO LOCAL'
  else
  if copy(Entrada,209,2) = '08' then
    mArquivoDescLiquidacao.AsString := 'EM CARTÓRIO'
  else
  if copy(Entrada,209,2) = '09' then
    mArquivoDescLiquidacao.AsString := 'COMANDADA PELO BANCO'
  else
  if copy(Entrada,209,2) = '10' then
    mArquivoDescLiquidacao.AsString := 'COMANDADA CLIENTE ARQUIVO'
  else
  if copy(Entrada,209,2) = '11' then
    mArquivoDescLiquidacao.AsString := 'COMANDADA CLIENTE ON-LINE'
  else
  if copy(Entrada,209,2) = '12' then
    mArquivoDescLiquidacao.AsString := 'DECURSO PRAZO - CLIENTE'
  else
  if copy(Entrada,209,2) = '13' then
    mArquivoDescLiquidacao.AsString := 'DECURSO PRAZO - BANCO';
end;

procedure TfArqRetornoSantander.Desc_Ocorrencia;
begin
  Case mArquivoCodOcorrenciaRet.AsInteger of
    2 : mArquivoNomeOcorrenciaRet.AsString := 'ENTRADA CONFIRMADA';
    3 : mArquivoNomeOcorrenciaRet.AsString := 'ENTRADA REJEITADA';
    4 : mArquivoNomeOcorrenciaRet.AsString := 'TRANSFERÊNCIA DE CARTEIRA/ENTRADA';
    5 : mArquivoNomeOcorrenciaRet.AsString := 'TRANSFERÊNCIA DE CARTEIRA/BAIXA';
    6 : mArquivoNomeOcorrenciaRet.AsString := 'LIQUIDAÇÃO';
    9 : mArquivoNomeOcorrenciaRet.AsString := 'BAIXA';
   11 : mArquivoNomeOcorrenciaRet.AsString := 'TITULOS EM CARTEIRA (EM SER)';
   12 : mArquivoNomeOcorrenciaRet.AsString := 'ABATIMENTO CONCEDIDO';
   13 : mArquivoNomeOcorrenciaRet.AsString := 'ABATIMENTO CANCELADO';
   14 : mArquivoNomeOcorrenciaRet.AsString := 'VENCIMENTO ALTERADO';
   17 : mArquivoNomeOcorrenciaRet.AsString := 'LIQUIDAÇÃO APÓS BAIXA OU LIQUIDAÇÃO TÍTULO NÃO REGISTRADOS';
   19 : mArquivoNomeOcorrenciaRet.AsString := 'CONFIRMA RECEBIMENTO DE INSTRUÇÃO DE PROTESTO';
   20 : mArquivoNomeOcorrenciaRet.AsString := 'CONFIRMA RECEBIMENTO DE INSTRUÇÃO DE SUSTAÇÃO DE PROTESTO';
   23 : mArquivoNomeOcorrenciaRet.AsString := 'PROTESTO ENVIADO A CARTÓRIO';
   24 : mArquivoNomeOcorrenciaRet.AsString := 'RETIRADA DE CARTÓRIO E MANUTENÇÃO EM CARTEIRA';
   25 : mArquivoNomeOcorrenciaRet.AsString := 'PROTESTADO E BAIXADO (BAIXA POR TER SIDO PROTESTADO)';
   26 : mArquivoNomeOcorrenciaRet.AsString := 'INSTRUÇÃO REJEITADA';
   27 : mArquivoNomeOcorrenciaRet.AsString := 'CONFIRMAÇÃO DO PEDIDO DE ALTERAÇÃO DE OUTROS DADOS';
   28 : mArquivoNomeOcorrenciaRet.AsString := 'DÉBITO DE TARIFAS/CUSTAS';
   29 : mArquivoNomeOcorrenciaRet.AsString := 'OCORRÊNCIAS DO SACADO';
   30 : mArquivoNomeOcorrenciaRet.AsString := 'ALTERAÇÃO DE DADOS REJEITADA';
  end;
end;


procedure TfArqRetornoSantander.Motivo_Rejeicao(Codigo : String);
var
  vCodErro : array [1..5] of String;
  i : Integer;
begin                  
  vIndiceErro := 0;
  for i := 1 to 5 do
    vCodErro[i] := '';
  if copy(Codigo,1,2) <> '' then
    vCodErro[1] := copy(Codigo,1,2);
  if copy(Codigo,3,2) <> '' then
    vCodErro[2] := copy(Codigo,3,2);
  if copy(Codigo,5,2) <> '' then
    vCodErro[3] := copy(Codigo,5,2);
  if copy(Codigo,7,2) <> '' then
    vCodErro[4] := copy(Codigo,7,2);
  if copy(Codigo,9,2) <> '' then
    vCodErro[5] := copy(Codigo,9,2);
  //Tabela 1 (Entrada Rejeitada)
  for i := 1 to 5 do
    begin
      if vCodErro[i] <> '' then
        begin
          inc(vIndiceErro);
          case StrToInt(vCodErro[i]) of
            01 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CÓDIGO DO BANCO INVÁLIDO';
            02 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'codigo do regsitro detalhe invalido';
            03 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'codigo do segmento invalido';
            04 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'codigo do movimento não permitido para carteira';
            05 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'codigo de movimento invalido';
            06 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'tipo/numero de inscrição do cedente invalidos';
            07 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'agencia/conta/DV invalido';
            08 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'nosso numero invalido';
            09 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'nosso numero duplicado';
            10 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'carteira invalida';
            11 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'forma de cadastramento do titulo invalida';
            12 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'tipo de documento invalido';
            13 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'identificação da emissão do bloqueto invalida';
            14 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'identificação da distribuição do bloqueto invalida';
            15 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'caracteristicas da cobrança imcompativeis';
            16 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'data de vencimento invalida';
            17 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'data de vencimento anterior a data de emissao';
            18 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'vencimento fora do prazo de operação';
            19 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'titulo a cargo de bancos correspndentes com vencimento inferior a xx dias';
            20 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'valor do título invalido';
            21 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'especie do titulo invalida';
            22 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'especie nao permitida para a carteira';
            23 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'aceite invalido';
            24 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Data de emissão inválida';
            25 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Data de emissão posterior a data de entrada';
            26 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Código de juros de mora inválido';
            27 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Valor/Taxa de juros de mora inválido';
            28 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Código de desconto inválido';
            29 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Valor do desconto  maior ou igual ao  valor do título';
            30 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Desconto a conceder não confere';
            31 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Concessão de desconto - já existe desconto anterior';
            32 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Valor do IOF';
            33 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Valor do abatimento inválido';
            34 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Valor do abatimento  maior ou igual ao valor do título';
            35 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Abatimento a conceder não confere';
            36 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Concessão de abatimento - já existe abatimento anterior';
            37 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Código para protesto inválido';
            38 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Prazo para protesto inválido';
            39 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Pedido de protesto não permitido para o título';
            40 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Título com ordem de protesto emitida';
            41 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Pedido de cancelamento/sustação para títulos sem instrução de  protesto';
            42 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Código para baixa/devolução inválido';
            43 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Prazo para baixa/devolução inválido';
            44 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Código de moeda inválido';
            45 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Nome do sacados  não informado';
            46 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Tipo /Número de inscrição do sacado inválidos';
            47 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Endereço do sacado não informado';
            48 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CEP inválido';
            49 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CEP sem praça de cobrança (não localizado)';
            50 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CEP referente a um Banco Correspondente';
            51 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'CEP incompatível com a unidade de federação';
            52 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Unidade de federação inválida';
            53 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Tipo/Número de inscrição do sacador/avalista inválidos';
            54 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Sacador/Avalista não informado';
            55 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Nosso número no Banco Correspondente não informado';
            56 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Código do Banco Correspondente não informado';
            57 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Código da multa inválido';
            58 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Data da  multa inválida';
            59 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Valor/Percentual da  multa inválido';
            60 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Movimento  para  título não cadastrado';
            61 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Alteração de agência cobradora/dv inválida';
            62 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Tipo de impressão inválido';
            63 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Entrada para título já cadastrado';
            64 : mArquivo.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := 'Número da linha inválido';
          end;
        end;
    end;
end;

procedure TfArqRetornoSantander.Grava_Protesto;
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

procedure TfArqRetornoSantander.Grava_Vencimento;
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

procedure TfArqRetornoSantander.Grava_ExtComissao;
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

procedure TfArqRetornoSantander.Grava_Historico(Tipo, Historico : String);
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
      DM1.tCReceberParcHistTipo.AsString             := 'PAG';
    end
  else
    begin
      DM1.tCReceberParcHistPgto.AsBoolean            := False;
      DM1.tCReceberParcHistTipo.AsString             := 'DIV';
    end;
end;

procedure TfArqRetornoSantander.Grava_NumBanco;
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

procedure TfArqRetornoSantander.Pagamento;
var
  vCodConta : Integer;
begin
  DM1.tCReceberParc.Edit;
  vNumMov      := 0;
  vNumMovJuros := 0;
  vCodConta    := DM1.tBcoSantanderCodConta.AsInteger;

  DM1.tContas.IndexFieldNames := 'CodConta';
  DM1.tContas.FindKey([vCodConta]);

  DM1.tCReceberParcDtPagParcCReceber.AsDateTime := mArquivoDtCredito.AsDateTime;
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
    vHistorico := 'PAGAMENTO PARCIAL' + ' - ' + mArquivoNomeOcorrenciaRet.AsString
  else
    vHistorico := 'PAGAMENTO TOTAL' + ' - ' + mArquivoNomeOcorrenciaRet.AsString;

  DM1.tMovimentos.MasterSource.Enabled        := False;

  DM2.tMovimentos2.Refresh;
  DM2.tMovimentos2.Filtered               := False;
  DM2.tMovimentos2.Filter                 := 'CodConta = '''+IntToStr(vCodConta)+'''';
  DM2.tMovimentos2.Filtered               := True;
  DM2.tMovimentos2.Last;
  DM1.tMovimentos.Insert;
  DM1.tMovimentosCodConta.AsInteger       := vCodConta;
  DM1.tMovimentosNumMovimento.AsInteger   := DM2.tMovimentos2NumMovimento.AsInteger + 1;
  DM1.tMovimentosNumCReceber.AsInteger    := DM1.tCReceberNumCReceber.AsInteger;
  DM1.tMovimentosDtMovimento.AsDateTime   := mArquivoDtCredito.AsDateTime;
  DM1.tMovimentosNumNota.AsInteger        := DM1.tCReceberParcNumNota.AsInteger;
  DM1.tMovimentosCodCli.AsInteger         := DM1.tCReceberParcCodCli.AsInteger;
  DM1.tMovimentosPlanoContas.AsInteger    := DM1.tCReceberParcPlanoContas.AsInteger;
  DM1.tMovimentosVlrMovCredito.AsCurrency := mArquivoVlrPago.AsFloat;
  DM1.tMovimentosHistorico.AsString     := 'Rec.Parc. '+ DM1.tCReceberParcParcCReceber.AsString +
                                           ' nf. ' + DM1.tCReceberNumNota.AsString +
                                           ' de ' + DM1.tCReceberlkNomeCli.AsString;
  DM1.tContas.FindKey([vCodConta]);
  DM1.tContas.Edit;
  DM1.tContasSaldoConta.AsFloat               := DM1.tContasSaldoConta.AsFloat + mArquivoVlrPago.AsFloat;
  DM1.tContas.Post;
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
      DM1.tContas.FindKey([vCodConta]);
      DM1.tContas.Edit;
      DM1.tContasSaldoConta.AsFloat           := DM1.tContasSaldoConta.AsFloat
                                                 + mArquivoVlrJurosPagos.AsFloat;
      DM1.tContas.Post;
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
   
procedure TfArqRetornoSantander.Grava_Liquidacao;
begin
  if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsCurrency)) > 0 then
    begin
      Pagamento;
      mArquivo.Edit;
      mArquivoAtualizado.AsBoolean := True;
      mArquivo.Post;
    end;
end;

procedure TfArqRetornoSantander.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tNotaFiscal.Close;
  Action := Cafree;
end;

procedure TfArqRetornoSantander.BitBtn2Click(Sender: TObject);
begin
  mArquivo.EmptyDataSet;
end;

procedure TfArqRetornoSantander.BitBtn1Click(Sender: TObject);
var
  Txt : TextFile;
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
            if (Copy(Entrada,8,1) = '0') and (Copy(Entrada,143,1) = '2') then
              begin
                if DM1.tContasNumConta.AsString <> Copy(Entrada,38,9) then
                  ShowMessage('Nº da conta diferente ' + Copy(Entrada,38,9))
                else
                if Copy(Entrada,103,15) <> 'BANCO SANTANDER' then
                  begin
                    ShowMessage('Arq. não é do Banco Santander,  ' + Copy(Entrada,103,30));
                    vContinuar := False;
                  end;
              end;
            if vContinuar then
              begin
                if Copy(Entrada,8,1) = '3'  then
                  begin
                    if copy(Entrada,14,1) = 'T' then
                      Grava_mArquivo
                    else
                    if copy(Entrada,14,1) = 'U' then
                      if mArquivo.Locate('NumTitEmpresa',Trim(Copy(Entrada,55,15)),[loCaseInsensitive]) then
                        Edita_mArquivo;
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

procedure TfArqRetornoSantander.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Atualizar o contas a receber?',mtconfirmation,[mbok,mbno],0)=mrok then
    begin
      mArquivo.First;
      while not mArquivo.Eof do
        begin
          if mArquivoCodCliente.AsInteger > 0 then
            begin
              try
                if DM1.tCReceber.Locate('Filial;CodCli;NumNota',VarArrayOf([mArquivoFilial.AsInteger,mArquivoCodCliente.AsInteger,mArquivoNumNota.AsInteger]),[locaseinsensitive]) then
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
                        if mArquivoCodOcorrenciaRet.AsString = '23' then //PROTESTADO
                          Grava_Protesto
                        else
                        if (mArquivoCodOcorrenciaRet.AsString = '06') or
                           (mArquivoCodOcorrenciaRet.AsString = '09') or
                           (mArquivoCodOcorrenciaRet.AsString = '17') then //LIQUIDAÇÃO DO TÍTULO
                          Grava_Liquidacao;
                      end
                    else
                      ShowMessage('Parcela não encontrada!')
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

procedure TfArqRetornoSantander.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (mArquivoAtualizado.AsBoolean) and (mArquivoCodOcorrenciaRet.AsString = '2') then
    begin
      Background  := clAqua;
      AFont.Color := clBlack;
    end
  else
  if (mArquivoAtualizado.AsBoolean) and ((mArquivoCodOcorrenciaRet.AsString = '06') or
     (mArquivoCodOcorrenciaRet.AsString = '09') or
     (mArquivoCodOcorrenciaRet.AsString = '17')) then //LIQUIDAÇÃO DO TÍTULO
    begin
      Background  := clTeal;
      AFont.Color := clBlack;
    end
  else
  if (mArquivoCodOcorrenciaRet.AsString = '23') then
    begin
      Background  := clRed;
      AFont.Color := clBlack;
    end
  else
  if (mArquivoCodOcorrenciaRet.AsString = '03') or
     (mArquivoCodOcorrenciaRet.AsString = '26') or
     (mArquivoCodOcorrenciaRet.AsString = '30') then
    begin
      Background  := clYellow;
      AFont.Color := clBlack;
    end;
end;

procedure TfArqRetornoSantander.FormShow(Sender: TObject);
begin
  DM1.tNotaFiscal.Open;
  tCReceber.Refresh;
  tCReceber.Close;
  tCReceber.Open;
  DM1.tCReceber.IndexFieldNames := 'Filial;NumCReceber';
end;

procedure TfArqRetornoSantander.Visualizar1Click(Sender: TObject);
begin
  if not mArquivo.IsEmpty then
    begin
      fRelArqRetSantander := TfRelArqRetSantander.Create(Self);
      fRelArqRetSantander.QuickRep1.Preview;
      fRelArqRetSantander.QuickRep1.Free;
    end
  else
    ShowMessage('Não há dados p/ imprimir!');
end;

procedure TfArqRetornoSantander.Imprimir1Click(Sender: TObject);
begin
  if not mArquivo.IsEmpty then
    begin
      fRelArqRetSantander := TfRelArqRetSantander.Create(Self);
      fRelArqRetSantander.QuickRep1.Print;
      fRelArqRetSantander.QuickRep1.Free;
    end
  else
    ShowMessage('Não há dados para imprimir!');
end;

end.


