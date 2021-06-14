unit UCobItau;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, Grids,
  DBGrids, RXDBCtrl, ALed, Db, DBTables, MemTable, RxLookup, CurrEdit, DBCtrls, Variants;

type
  TfCobItau = class(TForm)
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
    BitBtn7: TBitBtn;
    mBoletosImpBoleto: TStringField;
    mBoletosCnpjCpfEditado: TStringField;
    mBoletosNumCarteira: TStringField;
    mBoletosInstrCobranca1: TStringField;
    mBoletosInstrCobranca2: TStringField;
    mBoletosEmail: TStringField;
    mBoletosBoletoPorEmail: TBooleanField;
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
    BitBtn8: TBitBtn;
    tCReceberParcRem2NumTitBanco: TStringField;
    Bevel3: TBevel;
    Label9: TLabel;
    DBText1: TDBText;
    Label10: TLabel;
    Label11: TLabel;
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
    procedure BitBtn7Click(Sender: TObject);
    procedure mBoletosNewRecord(DataSet: TDataSet);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    F: TextFile;
    vContador : Integer;
    vVlrTotal : Real;
    ano, mes, dia : Word;
    vNossoNumero : String;
    vGeradoNossoNum : Boolean;
    procedure Habilita;
    procedure Gera_Arquivo;
    procedure Header;
    procedure Detalhe;
    procedure Reg_Avalista;
    procedure Trailler;    
    procedure Monta_MBoleto;
    procedure Grava_Historico(Tipo : String); //G= Geração   N= Nosso Número
    procedure Calcula_NossoNumero;
    procedure Le_mBoleto;

    function TirarAcento(texto : String) : string;

  public
    { Public declarations }
  end;

var
  fCobItau: TfCobItau;

implementation

uses UDM1, UCobItauAlt, UArqRetornoItau,
  UCobrancaEletronica, UDMBanco;

{$R *.DFM}

function TfCobItau.TirarAcento(Texto : String) : String;
var
  vAux : String;
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

procedure TfCobItau.Le_mBoleto;
var
  vNNumAux : String;
begin
  vContador := 0;
  mBoletos.First;
  while not mBoletos.Eof do
    begin
      if (mBoletosNossoNumero.AsString = '') and (mBoletosNumCarteira.AsString <> '112') then
        begin
          Calcula_NossoNumero;
          DM1.tCReceber.IndexFieldNames := 'Filial;NumCReceber';
          Dm1.tCReceber.SetKey;
          DM1.tCReceberFilial.AsInteger      := mBoletosFilial.AsInteger; 
          DM1.tCReceberNumCReceber.AsInteger := mBoletosNumCReceber.AsInteger;
          if DM1.tCReceber.GotoKey then
            begin
              if DM1.tCReceberParc.Locate('ParcCReceber',mBoletosParcela.AsInteger,[loCaseInsensitive]) then
                begin
                  DM1.tCReceberParc.Edit;
                  DM1.tCReceberParcNumTitBanco.AsString := mBoletosNossoNumero.AsString;
                  DM1.tCReceberParcNumCarteira.AsString := mBoletosNumCarteira.AsString;
                  DM1.tCReceberParc.Post;
                  Grava_Historico('N');
                end;
            end;
          inc(vContador);
        end;
      mBoletos.Next;
    end;
end;

procedure TfCobItau.Calcula_NossoNumero;
var
  vNumero, i, vSoma, vAux, vAux2, vSomaAux : Integer;
  texto1, texto2 : String;
begin
  //Busca o número sequencial do nosso número
  vNumero  := 1;
  if DM1.tContasParametros.Locate('Ano',9999,[loCaseInsensitive]) then
    begin
      vNumero := DM1.tContasParametrosNumSeqNossoNum.AsInteger;
      vNumero := vNumero + 1;
      DM1.tContasParametros.Edit;
      DM1.tContasParametrosItem.AsInteger           := 99;
      DM1.tContasParametrosNumSeqNossoNum.AsInteger := vNumero;
      DM1.tContasParametros.Post;
    end
  else
    begin
      DM1.tContasParametros.Insert;
      DM1.tContasParametrosCodConta.AsInteger       := DM1.tContasCodConta.AsInteger;
      DM1.tContasParametrosAno.AsInteger            := 9999;
      DM1.tContasParametrosItem.AsInteger           := 99;
      DM1.tContasParametrosNumSeqNossoNum.AsInteger := vNumero;
      DM1.tContasParametros.Post;
    end;
  //****
  texto1 := copy(DM1.tContasAgencia.AsString,1,4) + copy(DM1.tContasNumConta.AsString,1,5) +
            mBoletosNumCarteira.AsString + FormatFloat('00000000',vNumero);
  vSoma := 0;
  vAux  := 1;
  for i := length(texto1) downto 1 do
    begin
      inc(vAux);
      if vAux > 2 then
        vAux := 1;
      vSomaAux := StrToInt(Copy(texto1,i,1)) * vAux;
      if vSomaAux < 10 then
        vSoma := vSoma + vSomaAux
      else
        begin
          texto2 := formatfloat('00',vSomaAux);
          vSoma := vSoma + (StrToInt(Copy(texto2,1,1))) + (StrToInt(Copy(texto2,2,1)));
        end;
    end;

  vAux  := vSoma div 10;
  vAux2 := vAux * 10;
  vAux  := vSoma - vAux2;
  if vAux > 0 then
    vAux  := 10 - vAux;
  texto1 := texto1 + FormatFloat('0',vAux);

  mBoletos.Edit;
  mBoletosNossoNumero.AsString := FormatFloat('00000000',vNumero) + FormatFloat('0',vAux);
  mBoletos.Post;
end;

procedure TfCobItau.Grava_Historico(Tipo : String);
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
    DM1.tCReceberParcHistHistorico.AsString     := 'Duplicata gerada o nosso número para o Banco Itáu'
  else
    begin
      DM1.tCReceberParcHistHistorico.AsString     := 'Duplicata enviada para o Banco Itaú';
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
  DM1.tCReceberParcRemCodConta.AsInteger          := DMBanco.tBcoItauCodConta.AsInteger;
  DM1.tCReceberParcRemNumCarteira.AsString        := mBoletosNumCarteira.AsString;

  if mBoletosNumCarteira.AsString = '112' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'ESCRITURAL ELETRÔNICA - SIMPLES / CONTRATUAL'
  else
  if mBoletosNumCarteira.AsString = '109' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'DIRETA ELETRÔNICA SEM EMISSÃO - SIMPLES'
  else
  if mBoletosNumCarteira.AsString = '175' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'SEM REGISTRO SEM EMISSÃO';

  //Ocorrência
  if mBoletosInstrucao.AsString = '01' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Remessa'
  else
  if mBoletosInstrucao.AsString = '02' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Pedido de Baixa'
  else
  if mBoletosInstrucao.AsString = '04' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Concessão de Abatimento'
  else
  if mBoletosInstrucao.AsString = '05' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Cancelamento de Abatimento'
  else
  if mBoletosInstrucao.AsString = '06' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Alteração de vencimento'
  else
  if mBoletosInstrucao.AsString = '07' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Alteração do Uso da Empresa'
  else
  if mBoletosInstrucao.AsString = '08' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Alteração do Seu Número'
  else
  if mBoletosInstrucao.AsString = '09' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Protestar'
  else
  if mBoletosInstrucao.AsString = '10' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Não protestar'
  else
  if mBoletosInstrucao.AsString = '18' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Sustar o Protesto'
  else
  if mBoletosInstrucao.AsString = '31' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Alteração de outros dados'
  else
  if mBoletosInstrucao.AsString = '34' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Baixa por ter sido pago diretamente ao cedente'
  else
  if mBoletosInstrucao.AsString = '35' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'cancelamento de instrução'
  else
  if mBoletosInstrucao.AsString = '36' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'Protesto Urgente'
  else
  if mBoletosInstrucao.AsString = '37' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'alteração do vencimento e sustar protesto'
  else
  if mBoletosInstrucao.AsString = '38' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'CEDENTE NÃO CONCORDA COM ALEGAÇÃO DO SACADO'
  else
  if mBoletosInstrucao.AsString = '47' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + '-' + 'CEDENTE SOLICITA DISPENSA DE JUROS';

  //Espécie
  DM1.tCReceberParcRemEspDoc.AsString             := mBoletosEspecieDoc.AsString;
  if mBoletosEspecieDoc.AsString = '01' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Duplicata mercantil'
  else
  if mBoletosEspecieDoc.AsString = '02' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Nota Promissória'
  else
  if mBoletosEspecieDoc.AsString = '03' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Nota de Seguro'
  else
  if mBoletosEspecieDoc.AsString = '04' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Mensalidade escolar'
  else
  if mBoletosEspecieDoc.AsString = '05' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Recibo'
  else
  if mBoletosEspecieDoc.AsString = '06' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Contrato'
  else
  if mBoletosEspecieDoc.AsString = '07' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Cosseguros'
  else
  if mBoletosEspecieDoc.AsString = '08' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Duplicata de Serviço'
  else
  if mBoletosEspecieDoc.AsString = '09' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Letra de Câmbio'
  else
  if mBoletosEspecieDoc.AsString = '13' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Nota de Débitos'
  else
  if mBoletosEspecieDoc.AsString = '99' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-DIVERSOs';

  DM1.tCReceberParcRemCodAceite.AsString          := mBoletosAceite.AsString;
  if mBoletosAceite.AsString = 'A' then
    DM1.tCReceberParcRemCodAceite.AsString := DM1.tCReceberParcRemCodAceite.AsString + '-' + 'Sim'
  else
  if mBoletosAceite.AsString = 'N' then
    DM1.tCReceberParcRemCodAceite.AsString := DM1.tCReceberParcRemCodAceite.AsString + '-' + 'Não';

  //Instrução 1
  DM1.tCReceberParcRemInstrCobranca1.AsString := mBoletosInstrCobranca1.AsString;
  vAux := 0;
  if mBoletosInstrCobranca1.AsString <> '' then
    vAux := mBoletosInstrCobranca1.AsInteger;
  Case vAux of
    02 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  após 05 dias do Vencimento';
    03 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  após 30 dias do Vencimento';
    05 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Receber conforme instruções no próprio título';
    06 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  após 10 dias do Vencimento';
    07 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  após 15 dias do Vencimento';
    08 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  após 20 dias do Vencimento';
    09 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Protestar';
    10 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não protestar';
    11 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  após 25 dias do Vencimento';
    12 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  após 35 dias do Vencimento';
    13 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  após 40 dias do Vencimento';
    14 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  após 45 dias do Vencimento';
    15 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  após 50 dias do Vencimento';
    16 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  após 55 dias do Vencimento';
    17 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  após 60 dias do Vencimento';
    18 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  após 90 dias do Vencimento';
    19 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não Receber após 05 dias do vencimento';
    20 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não Receber após 10 dias do vencimento';
    21 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não Receber após 15 dias do vencimento';
    22 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não Receber após 20 dias do vencimento';
    23 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não Receber após 25 dias do vencimento';
    24 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não Receber após 30 dias do vencimento';
    25 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não Receber após 35 dias do vencimento';
    26 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não Receber após 40 dias do vencimento';
    27 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não Receber após 45 dias do vencimento';
    28 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não Receber após 50 dias do vencimento';
    29 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não Receber após 55 dias do vencimento';
    30 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Importância de desconto por dia';
    31 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não Receber após 60 dias do vencimento';
    32 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não Receber após 90 dias do vencimento';
    36 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Protesto Urgente';
    37 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Receber até o último dia do mês de vencimento';
    38 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Conceder desconto mesmo após vencimento';
    39 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não Receber após o vencimento';
    40 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Conceder desconto conforme Nota de Crédito';
    43 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Sujeito a protesto se não for pago no vencimento';
    44 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Importância por dia de atraso a partir de';
    45 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Tem dia da Graça';
    46 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-uso do banco';
    47 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-DISPENSAR JUROS/COMISSÃO DE PERMANÊNCIA';
    51 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-RECEBER SOMENTE COM A PARCELA ANTERIOR QUITADA';
    52 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-favor efetuar pgto  somente através desta cobrança bancária';
    53 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-USO DO BANCO';
    54 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-após vencimento pagável somente na empresa';
    56 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-uso do banco';
    57 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-somar valor do título ao valor do campo mora/multa caso exista';
    58 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-DEVOLVER APÓS 365 DIAS DE VENCIDO';
    59 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-COBRANÇA NEGOCIADA. PAGÁVEL SOMENTE POR ESTE BLOQUETO NA REDE BANCÁRIA';
    70 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-uso do banco';
    78 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-VALOR DA IDA ENGLOBA MULTA DE 10% PRO RATA';
    79 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Cobrar juros após 15 dias da emissão (para títulos com vencimento à vista)';
    80 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-PAGAMENTO EM CHEQUE: SOMENTE RECEBER COM CHEQUE DE EMISSÃO DO SACADO';
    81 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-protestar após xx dias corridos do vencimento';
    82 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-protestar após xx DIAS úteis do vencimento';
    83 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-OPERAÇÃO REF A VENDOR';
    84 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Após vencimento consultar a Agência cedente';
    86 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Antes do Vencimento ou após 15 dias, pagável SOMENTE em nossa sede';
    87 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-uso do banco';
    88 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não receber antes do Vencimento';
    89 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-uso do banco';
    90 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-No vencimento pagável em qualquer agência bancária';
    91 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Não receber após xx dias do vencimento';
    92 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver após xx dias do vencimento';
    93 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Mensagens nos bloquetos com 30 posições';
    94 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Mensagens nos bloquetos com 40 posições';
    95 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-uso do banco';
    98 : DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Duplicata / Fatura Nº';
  end;

  //Instrução 2
  DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrCobranca2.AsString;
  vAux := 0;
  if mBoletosInstrCobranca2.AsString <> '' then
    vAux := mBoletosInstrCobranca2.AsInteger;
  Case vAux of
    02 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  após 05 dias do Vencimento';
    03 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  após 30 dias do Vencimento';
    05 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Receber conforme instruções no próprio título';
    06 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  após 10 dias do Vencimento';
    07 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  após 15 dias do Vencimento';
    08 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  após 20 dias do Vencimento';
    09 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Protestar';
    10 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não protestar';
    11 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  após 25 dias do Vencimento';
    12 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  após 35 dias do Vencimento';
    13 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  após 40 dias do Vencimento';
    14 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  após 45 dias do Vencimento';
    15 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  após 50 dias do Vencimento';
    16 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  após 55 dias do Vencimento';
    17 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  após 60 dias do Vencimento';
    18 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  após 90 dias do Vencimento';
    19 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não Receber após 05 dias do vencimento';
    20 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não Receber após 10 dias do vencimento';
    21 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não Receber após 15 dias do vencimento';
    22 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não Receber após 20 dias do vencimento';
    23 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não Receber após 25 dias do vencimento';
    24 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não Receber após 30 dias do vencimento';
    25 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não Receber após 35 dias do vencimento';
    26 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não Receber após 40 dias do vencimento';
    27 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não Receber após 45 dias do vencimento';
    28 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não Receber após 50 dias do vencimento';
    29 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não Receber após 55 dias do vencimento';
    30 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Importância de desconto por dia';
    31 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não Receber após 60 dias do vencimento';
    32 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não Receber após 90 dias do vencimento';
    36 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Protesto Urgente';
    37 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Receber até o último dia do mês de vencimento';
    38 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Conceder desconto mesmo após vencimento';
    39 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não Receber após o vencimento';
    40 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Conceder desconto conforme Nota de Crédito';
    43 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Sujeito a protesto se não for pago no vencimento';
    44 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Importância por dia de atraso a partir de';
    45 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Tem dia da Graça';
    46 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-uso do banco';
    47 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-DISPENSAR JUROS/COMISSÃO DE PERMANÊNCIA';
    51 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-RECEBER SOMENTE COM A PARCELA ANTERIOR QUITADA';
    52 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-favor efetuar pgto  somente através desta cobrança bancária';
    53 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-USO DO BANCO';
    54 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-após vencimento pagável somente na empresa';
    56 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-uso do banco';
    57 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-somar valor do título ao valor do campo mora/multa caso exista';
    58 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-DEVOLVER APÓS 365 DIAS DE VENCIDO';
    59 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-COBRANÇA NEGOCIADA. PAGÁVEL SOMENTE POR ESTE BLOQUETO NA REDE BANCÁRIA';
    70 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-uso do banco';
    78 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-VALOR DA IDA ENGLOBA MULTA DE 10% PRO RATA';
    79 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Cobrar juros após 15 dias da emissão (para títulos com vencimento à vista)';
    80 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-PAGAMENTO EM CHEQUE: SOMENTE RECEBER COM CHEQUE DE EMISSÃO DO SACADO';
    81 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-protestar após xx dias corridos do vencimento';
    82 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-protestar após xx DIAS úteis do vencimento';
    83 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-OPERAÇÃO REF A VENDOR';
    84 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Após vencimento consultar a Agência cedente';
    86 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Antes do Vencimento ou após 15 dias, pagável SOMENTE em nossa sede';
    87 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-uso do banco';
    88 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não receber antes do Vencimento';
    89 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-uso do banco';
    90 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-No vencimento pagável em qualquer agência bancária';
    91 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Não receber após xx dias do vencimento';
    92 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver após xx dias do vencimento';
    93 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Mensagens nos bloquetos com 30 posições';
    94 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Mensagens nos bloquetos com 40 posições';
    95 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-uso do banco';
    98 : DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Duplicata / Fatura Nº';
  end;

  DM1.tCReceberParcRemDiasProtesto.AsInteger      := mBoletosDiasProtesto.AsInteger;
  DM1.tCReceberParcRemTaxaMulta.AsFloat           := mBoletosTaxaMulta.AsFloat;
  DM1.tCReceberParcRemTipoJuros.AsString          := mBoletosTipoJuro.AsString;
  if mBoletosTipoJuro.AsString = 'A' then
    DM1.tCReceberParcRemTipoJuros.AsString := DM1.tCReceberParcRemTipoJuros.AsString + '-' + 'Valor'
  else
  if mBoletosTipoJuro.AsString = 'B' then
    DM1.tCReceberParcRemTipoJuros.AsString := DM1.tCReceberParcRemTipoJuros.AsString + '-' + 'Percentual';
  DM1.tCReceberParcRemVlrJuros.AsFloat            := mBoletosVlrJurosPorDia.AsFloat;

  DM1.tCReceberParcRemTipoDesconto.AsString       := mBoletosTipoDesconto.AsString;
  if mBoletosTipoDesconto.AsString = 'A' then
    DM1.tCReceberParcRemTipoDesconto.AsString := DM1.tCReceberParcRemTipoDesconto.AsString + '-' + 'Valor'
  else
  if mBoletosTipoDesconto.AsString = 'B' then
    DM1.tCReceberParcRemTipoDesconto.AsString := DM1.tCReceberParcRemTipoDesconto.AsString + '-' + 'Percentual';
  DM1.tCReceberParcRemVlrDesconto.AsFloat         := mBoletosVlrDesconto.AsFloat;
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
  //if mBoletosImpBoleto.AsString = 'A' then
  //  DM1.tCReceberParcRemImpBoleto.AsString        := 'Pelo Itaú'
  //else
  //  DM1.tCReceberParcRemImpBoleto.AsString        := 'Pelo Cedente';
  DM1.tCReceberParcRemBairroAvalista.AsString  := mBoletosBairroAvalista.AsString;
  DM1.tCReceberParcRemEmail.AsString           := mBoletosEmail.AsString;
  DM1.tCReceberParcRemBoletoPorEmail.AsBoolean := mBoletosBoletoPorEmail.AsBoolean;
  DM1.tCReceberParcRemNumTitBanco.AsString     := mBoletosNossoNumero.AsString;
  DM1.tCReceberParcRem.Post;
  DM1.tCReceberParcRem.Refresh;
end;

procedure TfCobItau.Reg_Avalista;
var
  texto1, texto2, vAux : String;
  i : Integer;
begin
//Posição 1/1 Tamanho 1 - Identificação do registro sacador avalista
  Texto1 := '5';
              
//Posição 2/121 Tamanho 120 - Email do sacado
  texto2 := '';
  if mBoletosBoletoPorEmail.AsBoolean then
    texto2 := mBoletosEmail.AsString;
  for i := 1 to 120 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

//Posição 122/123 Tamanho 1 - Tipo do documento do Avalista
  if Length(mBoletosCpfCnpjAvalista.AsString) = 11 then
    texto1 := texto1 + '01'
  else
  if Length(mBoletosCpfCnpjAvalista.AsString) = 14 then
    texto1 := texto1 + '02'
  else
    texto1 := texto1 + '00';

//Posição 124/137 Tamanho 14 - Número do documento do avalista
  texto2 := mBoletosCpfCnpjAvalista.AsString;
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

//Posição 138/177 Tamanho 40 - Endereco do sacador avalista
  texto2 := TirarAcento(copy(mBoletosEndAvalista.AsString,1,40));
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

//Posição 178/189 Tamanho 12 - Bairro
  texto2 := TirarAcento(copy(mBoletosBairroAvalista.AsString,1,12));
  for i := 1 to 12 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

//Posição 190/197 Tamanho 8 - Cep do sacador avalista
  texto2 := mBoletosCepAvalista.AsString;
  for i := 1 to 8 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

//Posição 198/212 Tamanho 15 - Cidade do sacador avalista
  texto2 := TirarAcento(copy(mBoletosCidAvalista.AsString,1,15));
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

//Posição 213/214 Tamanho 2 - UF do sacador avalista
  texto2 := mBoletosUFAvalista.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

//Posição 215/394 Tamanho 180 - Filler (espaço em branco)
  for i := 1 to 180 do
    texto1 := texto1 + ' ';

//Posição 395/400 Tamanho 6 - Número sequencial do registro
  inc(vContador);
  texto2 := IntToStr(vContador);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  Writeln(F,texto1);
end;

procedure TfCobItau.Monta_MBoleto;
var
  i : Integer;
  vGera : Boolean;
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
          //mBoletosVlrParcela.AsFloat      := qBoletosVlrParcCReceber.AsFloat;
          mBoletosVlrParcela.AsFloat      := fCobrancaEletronica.qBoletosRestParcela.AsFloat;
          mBoletosNossoNumero.AsString    := fCobrancaEletronica.qBoletosNumTitBanco.AsString;
          mBoletosNumCarteira.AsString    := DMBanco.tBcoItauNumCarteira.AsString;
          mBoletosInstrucao.AsString      := DMBanco.tBcoItauInstrucao.AsString;
          mBoletosInstrCobranca1.AsString := DMBanco.tBcoItauInstrCobranca1.AsString;
          mBoletosInstrCobranca2.AsString := DMBanco.tBcoItauInstrCobranca2.AsString;
          mBoletosTipoDesconto.AsString   := DMBanco.tBcoItauTipoDesconto.AsString;
          mBoletosTipoJuro.AsString       := DMBanco.tBcoItauTipoJuro.AsString;
          mBoletosTaxaMulta.AsFloat       := DMBanco.tBcoItauTaxaMulta.AsFloat;
          mBoletosEspecieDoc.AsString     := DMBanco.tBcoItauEspecieDoc.AsString;
          mBoletosAceite.AsString         := DMBanco.tBcoItauAceite.AsString;
          mBoletosDiasProtesto.AsInteger  := DMBanco.tBcoItauDiasProtesto.AsInteger;
          mBoletosVlrJurosPorDia.AsFloat  := DMBanco.tBcoItauVlrJurosPorDia.AsFloat;
          mBoletosVlrDesconto.AsFloat     := DMBanco.tBcoItauVlrDesconto.AsFloat;
          mBoletosImpBoleto.AsString      := '';
          mBoletosEmail.AsString          := fCobrancaEletronica.qBoletosEmail.AsString;
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

          if tCReceberParcRem2.RecordCount > 0 then
            begin
              tCReceberParcRem2.Last;
              {mBoletosNomeAvalista.AsString := tCReceberParcRem2Avalista.AsString;
              mBoletosCpfCnpjAvalista.AsString := tCReceberParcRem2CnpjAvalista.AsString;
              mBoletosBairroAvalista.AsString  := tCReceberParcRem2BairroAvalista.AsString;
              mBoletosCidAvalista.AsString     := tCReceberParcRem2CidAvalista.AsString;
              mBoletosEndAvalista.AsString     := tCReceberParcRem2EndAvalista.AsString;
              mBoletosCepAvalista.AsString     := tCReceberParcRem2CepAvalista.AsString;
              mBoletosUFAvalista.AsString      := tCReceberParcRem2UFAvalista.AsString;}
              mBoletosEmail.AsString           := tCReceberParcRem2Email.AsString;
              mBoletosBoletoPorEmail.AsBoolean := tCReceberParcRem2BoletoPorEmail.AsBoolean;
              if tCReceberParcRem2NumTitBanco.AsString <> '' then
                if mBoletosNossoNumero.AsString <> tCReceberParcRem2NumTitBanco.AsString then
                  ShowMessage('Nosso número diferente na nota ' + fCobrancaEletronica.qBoletosNumNota.AsString);
            end;
          mBoletos.Post;
        end;
      fCobrancaEletronica.qBoletos.Next;
    end;
end;

procedure TfCobItau.Header;
var
  vAux : String;
  texto1, texto2 : String;
  i : Integer;
begin
  //Tipo de registro tamanho 1 - posicao 1 ao 1
  texto1 := '0';

  //Operação (remessa) tamanho 1 - posicao 2 ao 2
  texto1 := texto1 + '1';

  //Literal de remessa tamanho 7 - posicao 3 ao 9
  texto1 := texto1 + 'REMESSA';

  //Código do serviço tamanho 2 - posicao 10 ao 11
  texto1 := texto1 + '01';

  //Literal de serviço tamanho 15 - posicao 12 ao 26
  texto1 := texto1 + 'COBRANCA       ';

  //Agencia tamanho 4 - posicao 27 ao 30
  texto2 := copy(DM1.tContasAgencia.AsString,1,4);
  for i := 1 to 4 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Complemento do registro tamanho 2 - posicao 31 ao 32
  texto1 := texto1 + '00';

  //Número da conta tamanho 5 - posicao 33 ao 37
  texto2 := Trim(copy(DM1.tContasNumConta.AsString,1,5));
  for i := 1 to 5 - length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Digito tamanho 1 - posicao 38 ao 38
  if DM1.tContasDigConta.AsString <> '' then
    texto1 := texto1 + DM1.tContasDigConta.AsString
  else
    texto1 := texto1 + '0';

  //Complemento tamanho 8 - posicao 39 ao 46
  for i := 1 to 8 do
    texto1 := texto1 + ' ';

  //Nome da empresa tamanho 30 - posicao 47 ao 76
  texto2 := TirarAcento(copy(DM1.tFilialEmpresa.AsString,1,30));
  for i := 1 to 30 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;                  

  //Código do banco tamanho 3 - posicao 77 ao 79
  texto1 := texto1 + '341';

  //Nome do banco tamanho 15 - posicao 80 ao 94
  texto1 := texto1 + 'BANCO ITAU SA  ';

  //Data de geração do arquivo tamanho 6 - posicao 95 ao 100
  vAux := FormatDateTime('DD/MM/YY',Date);
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
   for i := 1 to 6 - Length(texto2) do
     texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Brancos tamanho 294 - posicao 101 ao 394
  for i := 1 to 294 do
    texto1 := texto1 + ' ';

  //Número sequencial tamanho 6 - posicao 395 ao 400
  inc(vContador);
  texto1 := texto1 + FormatFloat('000000',vContador);

  Writeln(F,texto1);
end;

procedure TfCobItau.Detalhe;
var
  vAux, texto1, texto2 : String;
  vVlrAux, vValor : Real;
  i : Integer;
begin
  //Tipo de registro tamanho 1 - posicao 1 ao 1
  texto1 := '1';

  //Tipo de inscrição tamanho 2 - posicao 2 ao 3
  texto1 := texto1 + '02';

  //Número de inscrição da empresa 14 - posicao 4 ao 17
   vAux   := Dm1.tFilialCNPJ.AsString;
   texto2 := '';
   for i  := 1 to Length(vAux) do
     if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
       Texto2 := Texto2 + Copy(vAux,i,1);
   for i := 1 to 14 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Agência mantenedora da conta tamanho 4 - posicao 18 ao 21
   texto2 := copy(DM1.tContasAgencia.AsString,1,4);
   for i := 1 to 4 - length(texto2) do
     texto2 := texto2 + ' ';
   texto1 := texto1 + texto2;

   //Complemento tamanho 2 - posicao 22 ao 23
   texto1 := texto1 + '00';

   //Número da conta da empresa tamanho 5 - posicao 24 ao 28
   texto2 := Trim(copy(DM1.tContasNumConta.AsString,1,5));
   for i := 1 to 5 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Digito da conta tamanho 1 - posicao 29 ao 29
   if DM1.tContasDigConta.AsString <> '' then
     texto1 := texto1 + DM1.tContasDigConta.AsString
   else
     texto1 := texto1 + '0';

   //Complemento tamanho 4 - posicao 30 ao 33
   texto1 := texto1 + '    ';

   //Instrução de alegação tamanho 4 - posicao 34 ao 37
   texto1 := texto1 + '    ';

   //identificação do titulo na empresa tamanho 25 - posicao 38 ao 62
   texto2 := FormatFloat('00',mBoletosFilial.AsInteger) + '.' + mBoletosNumCReceber.AsString;
   for i := 1 to 25 - Length(texto2) do
     texto2 := texto2 + ' ';
   texto1 := texto1 + texto2;

   //Nosso número tamanho 8 - posicao 63 ao 70
   texto2 := Copy(mBoletosNossoNumero.AsString,1,8);
   for i := 1 to 8 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Quantidade de moeda variável tamanho 13 - posicao 71 ao 83
   for i := 1 to 13 do
     texto1 := texto1 + '0';

   //Número da carteira no banco tamanho 3 - posicao 84 ao 86
   texto2 := mBoletosNumCarteira.AsString;
   for i := 1 to 3 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Uso do banco tamanho 21 - posicao 87 ao 107
   for i := 1 to 21 do
     texto1 := texto1 + ' ';

   //Código da carteira tamanho 1 - posicao 108 ao 108
   texto1 := texto1 + 'D';

   //Código de ocorrência tamanho 2 - posicao 109 ao 110
   texto2 := mBoletosInstrucao.AsString;
   for i := 1 to 2 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Número do documento tamanho 10 - posicao 111 ao 120
   texto2 := FormatFloat('000000',mBoletosNumNota.AsFloat) + '/' + mBoletosParcela.AsString;
   for i := 1 to 10 - Length(texto2) do
     texto2 := texto2 + ' ';
   texto1 := texto1 + texto2;

   //Data de vencimento do titulo tamanho 6 - posicao 121 ao 126
   vAux   := FormatDateTime('DD/MM/YY',mBoletosDtVencto.AsDateTime);
   texto2 := '';
   for i := 1 to Length(vAux) do
     if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
       Texto2 := Texto2 + Copy(vAux,i,1);
    for i := 1 to 6 - Length(texto2) do
      texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Valor do titulo tamanho 13 - posicao 127 ao 139
   texto2 := FormatFloat('00000000000.00',mBoletosVlrParcela.AsFloat);
   Delete(texto2,12,1);
   texto1 := texto1 + texto2;

   //Código do banco tamanho 3 - posicao 140 ao 142
   texto1 := texto1 + '341';

   //Agencia cobradora tamanho 5 - posicao 143 ao 147
   texto1 := texto1 + '00000';

   //Espécie tamanho 2 - posicao 148 ao 149
   texto2 := DMBanco.tBcoItauEspecieDoc.AsString;
   for i := 1 to 2 - length(texto2) do
     texto2 := texto2 + ' ';
   texto1 := texto1 + texto2;

   //Aceite tamanho 1 - posicao 150 ao 150
   if DMBanco.tBcoItauAceite.AsString <> '' then
     texto1 := texto1 + DMBanco.tBcoItauAceite.AsString
   else
     texto1 := texto1 + ' ';

   //Data de emissão do titulo tamanho 6 - posicao 151 ao 156
   vAux := FormatDateTime('DD/MM/YY',mBoletosDtGerado.AsDateTime);
   texto2 := '';
   for i := 1 to Length(vAux) do
     if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
       Texto2 := Texto2 + Copy(vAux,i,1);
    for i := 1 to 6 - Length(texto2) do
      texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Instrução 1 tamanho 2 - posicao 157 ao 158
   texto2 := DMBanco.tBcoItauInstrCobranca1.AsString;
   for i := 1 to 2 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Instrução 2 tamanho 2 - posicao 159 ao 160
   texto2 := DMBanco.tBcoItauInstrCobranca2.AsString;
   for i := 1 to 2 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Juros de mora por dia de atrazo tamanho 13 - posicao 161 ao 173
   vValor := 0;
   {if mBoletosVlrJurosPorDia.AsFloat > 0 then
     vValor := mBoletosVlrJurosPorDia.AsFloat
   else
   if DM1.tParametrosPercJuros.AsFloat > 0 then
     vValor := DM1.tParametrosPercJuros.AsFloat
   else
     vValor := 3;
   if (mBoletosTipoJuro.AsString = 'A') then
     vValor := StrToFloat(FormatFloat('0.00',((mBoletosVlrParcela.AsFloat * vValor) / 100) / 30))
   else
   if (mBoletosTipoJuro.AsString = 'B') then
     vValor := DM1.tParametrosPercJuros.AsFloat
   else
     vValor := 0;}
   texto2 := FormatFloat('00000000000.00',vValor);
   
   {if mBoletosVlrJurosPorDia.AsFloat > 0 then
     begin
       if mBoletosTipoJuro.AsString = 'A' then
         vVlrAux := (mBoletosVlrParcela.AsFloat * mBoletosVlrJurosPorDia.AsFloat) / 100
       else
         vVlrAux := mBoletosVlrJurosPorDia.AsFloat;
     end;}
   //texto2 := FormatFloat('00000000.00000',vVlrAux);
   Delete(texto2,9,1);
   texto1 := texto1 + texto2;

   //Data de desconto tamanho 6 - posicao 174 ao 179
   texto2 := '';
   if (mBoletosVlrDesconto.AsFloat > 0) and (mBoletosDtLimiteDesc.AsDateTime > 1) then
     begin
       vAux   := FormatDateTime('DD/MM/YY',mBoletosDtLimiteDesc.AsDateTime);
       texto2 := '';
       for i := 1 to Length(vAux) do
         if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
           Texto2 := Texto2 + Copy(vAux,i,1);
     end;
    for i := 1 to 6 - Length(texto2) do
      texto2 := '0' + texto2;
    texto1 := texto1 + texto2;

   //Valor do desconto tamanho 13 - posicao 180 ao 192
   vVlrAux := 0;
   if mBoletosVlrDesconto.AsFloat > 0 then
     begin               
       if mBoletosTipoDesconto.AsString = 'A' then
         vVlrAux := (mBoletosVlrParcela.AsFloat * mBoletosVlrDesconto.AsFloat) / 100
       else
         vVlrAux := mBoletosVlrDesconto.AsFloat;
     end;
   texto2 := FormatFloat('00000000000.00',vVlrAux);
   Delete(texto2,12,1);
   texto1 := texto1 + texto2;

   //Valor IOF recolhido por nota de seguro tamanho 13 - posicao 193 ao 205
   for i := 1 to 13 do
     texto1 := texto1 + '0';

   //Valor abatimento tamanho 13 - posicao 206 ao 218
   texto2 := FormatFloat('00000000000.00',mBoletosVlrAbatimento.AsFloat);
   Delete(texto2,12,1);
   texto1 := texto1 + texto2;

   //Código de inscrição do sacado tamanho 2 - posicao 219 ao 220
   if mBoletosPessoa.AsString = 'F' then
     texto1 := texto1 + '01'
   else
   if mBoletosPessoa.AsString = 'J' then
     texto1 := texto1 + '02'
   else
     texto1 := texto1 + '00';

   //Número de inscrição do sacado tamanho 14 - posicao 221 ao 234
   vAux  := mBoletosCNPJCPF.AsString;
   texto2 := '';
   for i := 1 to Length(vAux) do
     if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
       Texto2 := Texto2 + Copy(vAux,i,1);
   for i := 1 to 14 - Length(texto2) do
     texto2 := '0' + texto2;
   if texto2 = '00000000000000' then
     ShowMessage('Cliente  ' + mBoletosCliente.AsString + ' não possui CNPJ/CPF');
   texto1 := texto1 + texto2;

   //Nome do sacado tamanho 30 - posicao 235 ao 264
   texto2 := TirarAcento(copy(mBoletosCliente.AsString,1,30));
   for i := 1 to 30 - Length(texto2) do
     texto2 := texto2 + ' ';
   texto1 := texto1 + texto2;

   //brancos tamanho 10 - posicao 265 ao 274
   texto2 := TirarAcento(copy(mBoletosCliente.AsString,31,10));
   for i := 1 to 10 - Length(texto2) do
     texto2 := texto2 + ' ';
   texto1 := texto1 + texto2;

   //Logradouro tamanho 40 - posicao 275 ao 314
   texto2 := TirarAcento(copy(mBoletosEndereco.AsString,1,40));
   for i := 1 to 40 - Length(texto2) do
     texto2 := texto2 + ' ';
   texto1 := texto1 + texto2;

  //Bairro tamanho 12 - posicao 315 ao 326
  texto2 := TirarAcento(copy(mBoletosBairro.AsString,1,12));
  for i := 1 to 12 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Cep tamanho 8 - posicao 327 ao 334
  texto2 := mBoletosCep.AsString;
  vAux := texto2;
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
   for i := 1 to 8 - Length(texto2) do
     texto2 := texto2 + '0';
  texto1 := texto1 + copy(texto2,1,8);

  //Cidade tamanho 15 - posicao 335 ao 349
  texto2 := TirarAcento(copy(mBoletosCidade.AsString,1,15));
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Cidade tamanho 25 - posicao 350 ao 351
  texto2 := mBoletosUf.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Sacador avalista tamanho 30 - posicao 352 ao 381
  texto2 := TirarAcento(copy(mBoletosNomeAvalista.AsString,1,30));
  for i := 1 to 30 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Brancos tamanho 4 - posicao 382 ao 385
  for i := 1 to 4 do
    texto1 := texto1 + ' ';

  //Data de mora tamanho 6 - posicao 386 ao 391
  for i := 1 to 6 do
    texto1 := texto1 + ' ';

  //Prazo tamanho 2 - posicao 392 ao 393
  texto1 := texto1 + FormatFloat('00',mBoletosDiasProtesto.AsFloat);

  //Brancos tamanho 1 - posicao 394 ao 394
  texto1 := texto1 + ' ';

  //Número sequencial tamanho 6 - posicao 395 ao 400
  inc(vContador);
  texto1 := texto1 + FormatFloat('000000',vContador);

  Writeln(F,texto1);
end;

procedure TfCobItau.Trailler;
var
  texto1 : String;
  i : Integer;
begin
  //Tipo de registro tamanho 1 - posicao 1 ao 1
  texto1 := '9';

  //Brancos tamanho 393 - posicao 2 ao 394
  for i := 1 to 393 do
    texto1 := texto1 + ' ';

  //Número sequencial tamanho 6 - posicao 395 ao 400
  inc(vContador);
  texto1 := texto1 + FormatFloat('000000',vContador);

  Writeln(F,texto1);
end;

procedure TfCobItau.Gera_Arquivo;
var
  Texto1, Texto2 : String;
  i, vSeq : Integer;
  vValor : Currency;
  vAux : String;
  ano,mes,dia : Word;
  vNNumAux : String;
begin
  texto1 := fCobrancaEletronica.Monta_NomeArq(DMBanco.tBcoItauCaminho.AsString,'IT');
  Label12.Caption := 'Arq.Gerado: ' + Texto1;
  Label12.Visible := True;
  
  AssignFile(F,Texto1);
  Rewrite(F);
  vContador := 0;
  vVlrTotal := 0;
  Header;
  mBoletos.First;
  while not mBoletos.Eof do
    begin
      if mBoletosNumCarteira.AsString <> '175' then
        begin
          vNossoNumero    := mBoletosNossoNumero.AsString;
          vNNumAux        := mBoletosNossoNumero.AsString;
          vGeradoNossoNum := False;
          if (mBoletosNossoNumero.AsString = '') and (mBoletosNumCarteira.AsString <> '112') then
            begin               
              Calcula_NossoNumero;
              vGeradoNossoNum := True;
            end;
          Detalhe;
          if (mBoletosNomeAvalista.AsString <> '') or (mBoletosBoletoPorEmail.AsBoolean) then
            Reg_Avalista;
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
        end;
      mBoletos.Next;
    end;
  Trailler;

  CloseFile(F);
end;

procedure TfCobItau.Habilita;
begin
  DateEdit1.Enabled := not(DateEdit1.Enabled);
  DateEdit2.Enabled := not(DateEdit2.Enabled);
  BitBtn1.Enabled   := not(BitBtn1.Enabled);
  BitBtn2.Enabled   := not(BitBtn2.Enabled);
  BitBtn3.Enabled   := not(BitBtn3.Enabled);
  BitBtn4.Enabled   := not(BitBtn4.Enabled);
  BitBtn8.Enabled   := not(BitBtn8.Enabled);
end;

procedure TfCobItau.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fCobrancaEletronica.qBoletos.Close;
  if DMBanco.Owner.ClassName = Self.ClassName then
    FreeAndNil(DMBanco);
  Action := Cafree;
end;

procedure TfCobItau.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfCobItau.BitBtn1Click(Sender: TObject);
var
  i : Integer;
begin
  if (DateEdit1.Date > 1) and (DateEdit2.Date > 1) then
    begin
      Screen.Cursor   := crHourGlass;
      Label12.Caption := '';
      fCobrancaEletronica.Monta_SQLqBoletos(DMBanco.tBcoItauCodConta.AsInteger);
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

procedure TfCobItau.BitBtn3Click(Sender: TObject);
begin
  mBoletos.EmptyTable;
  Habilita;
  DateEdit1.SetFocus;
end;

procedure TfCobItau.BitBtn4Click(Sender: TObject);
begin
  if not mBoletos.IsEmpty then
    begin
      if MessageDlg('Deseja realmente excluir este título?',mtconfirmation,[mbok,mbno],0)=mrok then
        mBoletos.Delete;
    end
  else
    ShowMessage('Não há título p/ ser excluído!');
end;

procedure TfCobItau.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if mBoletosArqGerado.AsBoolean then
    begin
      Background  := clGreen;
      AFont.Color := clWhite;
    end;
end;

procedure TfCobItau.BitBtn2Click(Sender: TObject);
var
  vAux : Integer;
begin
  if not mBoletos.IsEmpty then
    begin
      if DM1.tContasFilial.AsInteger <> DM1.tFilialCodigo.AsInteger then
        begin
          ShowMessage('Diferente filial do banco!');
          exit;
        end;
      Screen.Cursor := crHourGlass;
      DM1.tFilial.IndexFieldNames := 'Codigo';
      DM1.tFilial.SetKey;
      DM1.tFilialCodigo.AsInteger := fCobrancaEletronica.vFilialConta;
      DM1.tFilial.GotoKey;
      Gera_Arquivo;
      Screen.Cursor := crDefault;
      vAux := vContador - 2;
      ShowMessage(IntToStr(vAux) + ' registro(s) gerados(s) c/ sucesso!!!');
    end
  else
    ShowMessage('Não há títulos selecionados para gerar arquivo!');
  Habilita;
  DateEdit1.SetFocus;
end;

procedure TfCobItau.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfCobItau.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Codigo';
end;

procedure TfCobItau.RxDBGrid1DblClick(Sender: TObject);
begin
  if mBoletosNumNota.AsInteger > 0 then
    begin
      mBoletos.Edit;
      fCobItauAlt := TfCobItauAlt.Create(Self);
      fCobItauAlt.ShowModal;
    end;
end;

procedure TfCobItau.BitBtn6Click(Sender: TObject);
begin
  fArqRetornoItau := TfArqRetornoItau.Create(Self);
  fArqRetornoItau.ShowModal;
end;

procedure TfCobItau.BitBtn7Click(Sender: TObject);
begin
  {if mBoletos.RecordCount > 0 then
    begin
      DM1.tFilial.IndexFieldNames := 'Codigo';
      DM1.tFilial.SetKey;
      DM1.tFilialCodigo.AsInteger := fCobrancaEletronica.vFilialConta;
      DM1.tFilial.GotoKey;
      fRelBoletoItau := TfRelBoletoItau.Create(Self);
      fRelBoletoItau.RLReport1.Preview;
      fRelBoletoItau.RLReport1.Free;
      fRelBoletoItau.Destroy;
    end;}
end;

procedure TfCobItau.mBoletosNewRecord(DataSet: TDataSet);
begin
  mBoletosNossoNumero.AsString     := '';
  mBoletosBoletoPorEmail.AsBoolean := False;
end;

procedure TfCobItau.BitBtn8Click(Sender: TObject);
begin
  if not mBoletos.IsEmpty then
    begin
      Screen.Cursor := crHourGlass;
      Le_mBoleto;
      Screen.Cursor := crDefault;
      ShowMessage(IntToStr(vContador) + ' registro(s) gerados(s) nosso número!!!');
    end
  else
    ShowMessage('Não há títulos selecionados para gerar nosso número!');
end;

procedure TfCobItau.FormShow(Sender: TObject);
begin
  if not Assigned(DMBanco) then
    DMBanco := TDMBanco.Create(Self);
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

  Label11.Caption := 'Ag.: ' + DM1.tContasAgencia.AsString + ' Conta: ' + DM1.tContasNumConta.AsString + ' ' + DM1.tContasDigConta.AsString +
                     '  ' + DM1.tContasNomeConta.AsString;

  DMBanco.tBcoItau.First;

  if fCobrancaEletronica.BitBtn6.Tag = 1 then
    BitBtn1Click(Sender);
end;

end.

