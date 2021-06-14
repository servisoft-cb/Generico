unit UCobBrasil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, Grids, DBGrids, RXDBCtrl,
  ALed, Db, DBTables, MemTable, RxLookup, CurrEdit, DBCtrls, Variants;

type
  TfCobBrasil = class(TForm)
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
    mBoletosTipoDocumento: TStringField;
    tCReceberParcRem2TipoDocumentoST: TStringField;
    tCReceberParcRem2CodCompensacaoST: TStringField;
    tCReceberParcRem2CodBaixaST: TStringField;
    tCReceberParcRem2CodProtestoST: TStringField;
    tCReceberParcRem2FormaCadastramentoST: TStringField;
    tCReceberParcRem2NumRemessaST: TIntegerField;
    tCReceberParcRem2CodTransmissaoST: TStringField;
    mBoletosVlrIOF: TFloatField;
    tCReceberParcRem2DiasBaixa: TIntegerField;
    tCReceberParcRem2VlrIOF: TFloatField;
    tCReceberParcRem2CodMulta: TStringField;
    tCReceberParcRem2DtMulta: TStringField;
    tCReceberParcRem2VlrMulta: TFloatField;
    tCReceberParcRem2TipoDesconto2: TStringField;
    tCReceberParcRem2DtLimiteDesconto2: TStringField;
    tCReceberParcRem2VlrDesconto2: TFloatField;
    mBoletosCodTransmissao: TStringField;
    tCReceberParcRem2IncidenciaMulta: TStringField;
    tCReceberParcRem2QtdDiasMulta: TIntegerField;
    CheckBox1: TCheckBox;
    mBoletosCodComando: TStringField;
    mBoletosInstrucao2: TStringField;
    mBoletosMoeda: TStringField;
    mBoletosEmail: TStringField;
    Label12: TLabel;
    mBoletosFilial: TIntegerField;
    BitBtn7: TBitBtn;
    mBoletosComplEndereco: TStringField;
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
    procedure CheckBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
    F: TextFile;
    vContador, vContadorReg: Integer;
    vVlrTotal: Real;
    ano, mes, dia: Word;
    //vNossoNumero : String;
    vGeradoNossoNum: Boolean;
    procedure Habilita;
    procedure Gera_Arquivo;
    procedure Header_Arquivo;
    procedure Detalhe;
    procedure Detalhe_Email;
    procedure Trailler_Arquivo;
    procedure Monta_MBoleto;
    procedure Grava_Historico(Tipo: string); //G= Geração   N= Nosso Número

    function TirarAcento(texto: string): string;

  public
    { Public declarations }
  end;

var
  fCobBrasil: TfCobBrasil;

implementation

uses UDM1, UCobBrasilAlt, UArqRetornoBrasil, UCobrancaEletronica,
  DateUtils, URelCobrancaEletronica, UDMBanco;

{$R *.DFM}

function TfCobBrasil.TirarAcento(Texto: string): string;
var
  i: Integer;
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

procedure TfCobBrasil.Grava_Historico(Tipo: string);
var
  vAux: Integer;
begin
  DM1.tCReceberParcHist.Refresh;
  DM1.tCReceberParcHist.Last;
  vAux := DM1.tCReceberParcHistItem.AsInteger;
  DM1.tCReceberParcHist.Insert;
  DM1.tCReceberParcHistFilial.AsInteger := DM1.tCReceberParcFilial.AsInteger;
  DM1.tCReceberParcHistNumCReceber.AsInteger := DM1.tCReceberParcNumCReceber.AsInteger;
  DM1.tCReceberParcHistParcCReceber.AsInteger := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tCReceberParcHistItem.AsInteger := vAux + 1;
  DM1.tCReceberParcHistDtHistorico.AsDateTime := Date;
  DM1.tCReceberParcHistHistorico.AsString := 'Duplicata enviada para o Banco Brasil';
  DM1.tCReceberParcHistPgto.AsBoolean := False;
  DM1.tCReceberParcHistDevolucao.AsBoolean := False;
  DM1.tCReceberParcHist.Post;

  //Grava a tabela do histórico da remessa
  DM1.tCReceberParcRem.Refresh;
  DM1.tCReceberParcRem.Last;
  vAux := DM1.tCReceberParcRemItemRem.AsInteger;
  DM1.tCReceberParcRem.Insert;
  DM1.tCReceberParcRemFilial.AsInteger := DM1.tCReceberParcHistFilial.AsInteger;
  DM1.tCReceberParcRemNumCReceber.AsInteger := DM1.tCReceberParcHistNumCReceber.AsInteger;
  DM1.tCReceberParcRemParcCReceber.AsInteger := DM1.tCReceberParcHistParcCReceber.AsInteger;
  DM1.tCReceberParcRemItemHist.AsInteger := DM1.tCReceberParcHistItem.AsInteger;
  DM1.tCReceberParcRemItemRem.AsInteger := vAux + 1;
  DM1.tCReceberParcRemCodConta.AsInteger := DMBanco.tBcoBrasilCodConta.AsInteger;
  DM1.tCReceberParcRemNumCarteira.AsString := mBoletosNumCarteira.AsString;
  //Código da carteira
  if mBoletosNumCarteira.AsString = '11' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobrança Simples'
  else
    if mBoletosNumCarteira.AsString = '12' then
      DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobrança Indexada'
    else
      if mBoletosNumCarteira.AsString = '17' then
        DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobrança Direta Especial'
      else
        if mBoletosNumCarteira.AsString = '31' then
          DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobrança Vinculada'
        else
          if mBoletosNumCarteira.AsString = '51' then
            DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobrança Descontada';

  //Tipo de cobrança
  if mBoletosTipoDocumento.AsString = '04DSC' then
    DM1.tCReceberParcRemTipoDocumentoST.AsString := mBoletosTipoDocumento.AsString + '-' + 'Solicitação de registro como cobrança Descontada'
  else
    if mBoletosTipoDocumento.AsString = '08VDR' then
      DM1.tCReceberParcRemTipoDocumentoST.AsString := mBoletosTipoDocumento.AsString + '-' + 'Solicitação de registro como cobrança Vendor'
    else
      if mBoletosTipoDocumento.AsString = '02VIN' then
        DM1.tCReceberParcRemTipoDocumentoST.AsString := mBoletosTipoDocumento.AsString + '-' + 'Solicitação de registro como cobrança Vinculada';

  //Código da 1º instrução
  if mBoletosInstrucao.AsString = '00' then
    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Ausência de intruções'
  else
    if mBoletosInstrucao.AsString = '01' then
      DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Cobrar juros'
    else
      if mBoletosInstrucao.AsString = '03' then
        DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Protestar no terceiro dia útil após vencido'
      else
        if mBoletosInstrucao.AsString = '04' then
          DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Protestar no quarto dia útil após vencido'
        else
          if mBoletosInstrucao.AsString = '05' then
            DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Protestar no quinto dia útil após vencido'
          else
            if mBoletosInstrucao.AsString = '06' then
              DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Protesto em dias corridos (' + mBoletosDiasProtesto.AsString + ')'
            else
              if mBoletosInstrucao.AsString = '07' then
                DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Não Protestar'
              else
                if mBoletosInstrucao.AsString = '10' then
                  DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Protestar no 10º dia corrido após vencido'
                else
                  if mBoletosInstrucao.AsString = '15' then
                    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Protestar no 15º dia corrido após vencido'
                  else
                    if mBoletosInstrucao.AsString = '20' then
                      DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Protestar no 20º dia corrido após vencido'
                    else
                      if mBoletosInstrucao.AsString = '22' then
                        DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Conceder desconto só até a data estipulada'
                      else
                        if mBoletosInstrucao.AsString = '25' then
                          DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Protestar no 25º dia corrido após vencido'
                        else
                          if mBoletosInstrucao.AsString = '30' then
                            DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Protestar no 30º dia corrido após vencido'
                          else
                            if mBoletosInstrucao.AsString = '45' then
                              DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Protestar no 45º dia corrido após vencido'
                            else
                              if mBoletosInstrucao.AsString = '42' then
                                DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Devolver'
                              else
                                if mBoletosInstrucao.AsString = '44' then
                                  DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Baixar'
                                else
                                  if mBoletosInstrucao.AsString = '46' then
                                    DM1.tCReceberParcRemInstrucao.AsString := mBoletosInstrucao.AsString + 'Entregar ao sacado franco de pagamento';

  //Código da 2º instrução
  if mBoletosInstrucao2.AsString = '00' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Ausência de intruções'
  else
    if mBoletosInstrucao2.AsString = '01' then
      DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Cobrar juros'
    else
      if mBoletosInstrucao2.AsString = '03' then
        DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Protestar no terceiro dia útil após vencido'
      else
        if mBoletosInstrucao2.AsString = '04' then
          DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Protestar no quarto dia útil após vencido'
        else
          if mBoletosInstrucao2.AsString = '05' then
            DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Protestar no quinto dia útil após vencido'
          else
            if mBoletosInstrucao2.AsString = '06' then
              DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Protesto em dias corridos'
            else
              if mBoletosInstrucao2.AsString = '07' then
                DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Não Protestar'
              else
                if mBoletosInstrucao2.AsString = '10' then
                  DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Protestar no 10º dia corrido após vencido'
                else
                  if mBoletosInstrucao2.AsString = '15' then
                    DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Protestar no 15º dia corrido após vencido'
                  else
                    if mBoletosInstrucao2.AsString = '20' then
                      DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Protestar no 20º dia corrido após vencido'
                    else
                      if mBoletosInstrucao2.AsString = '22' then
                        DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Conceder desconto só até a data estipulada'
                      else
                        if mBoletosInstrucao2.AsString = '25' then
                          DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Protestar no 25º dia corrido após vencido'
                        else
                          if mBoletosInstrucao2.AsString = '30' then
                            DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Protestar no 30º dia corrido após vencido'
                          else
                            if mBoletosInstrucao2.AsString = '45' then
                              DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Protestar no 45º dia corrido após vencido'
                            else
                              if mBoletosInstrucao2.AsString = '42' then
                                DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Devolver'
                              else
                                if mBoletosInstrucao2.AsString = '44' then
                                  DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Baixar'
                                else
                                  if mBoletosInstrucao2.AsString = '46' then
                                    DM1.tCReceberParcRemInstrCobranca2.AsString := mBoletosInstrucao2.AsString + 'Entregar ao sacado franco de pagamento';

  //Espécie
  if mBoletosEspecieDoc.AsString = '01' then
    DM1.tCReceberParcRemEspDoc.AsString := mBoletosEspecieDoc.AsString + '-Duplicata mercantil'
  else
    if mBoletosEspecieDoc.AsString = '02' then
      DM1.tCReceberParcRemEspDoc.AsString := mBoletosEspecieDoc.AsString + '-Nota promissória'
    else
      if mBoletosEspecieDoc.AsString = '03' then
        DM1.tCReceberParcRemEspDoc.AsString := mBoletosEspecieDoc.AsString + '-Nota de seguro'
      else
        if mBoletosEspecieDoc.AsString = '05' then
          DM1.tCReceberParcRemEspDoc.AsString := mBoletosEspecieDoc.AsString + '-Recibo'
        else
          if mBoletosEspecieDoc.AsString = '08' then
            DM1.tCReceberParcRemEspDoc.AsString := mBoletosEspecieDoc.AsString + '-Letra de câmbio'
          else
            if mBoletosEspecieDoc.AsString = '09' then
              DM1.tCReceberParcRemEspDoc.AsString := mBoletosEspecieDoc.AsString + '-Warrant'
            else
              if mBoletosEspecieDoc.AsString = '10' then
                DM1.tCReceberParcRemEspDoc.AsString := mBoletosEspecieDoc.AsString + '-Cheque'
              else
                if mBoletosEspecieDoc.AsString = '12' then
                  DM1.tCReceberParcRemEspDoc.AsString := mBoletosEspecieDoc.AsString + '-Duplicata de serviço'
                else
                  if mBoletosEspecieDoc.AsString = '13' then
                    DM1.tCReceberParcRemEspDoc.AsString := mBoletosEspecieDoc.AsString + '-Nota de débito'
                  else
                    if mBoletosEspecieDoc.AsString = '15' then
                      DM1.tCReceberParcRemEspDoc.AsString := mBoletosEspecieDoc.AsString + '-Apólice de seguro'
                    else
                      if mBoletosEspecieDoc.AsString = '21' then
                        DM1.tCReceberParcRemEspDoc.AsString := mBoletosEspecieDoc.AsString + '-Duplicata rural'
                      else
                        if mBoletosEspecieDoc.AsString = '25' then
                          DM1.tCReceberParcRemEspDoc.AsString := mBoletosEspecieDoc.AsString + '-Divida ativa da União'
                        else
                          if mBoletosEspecieDoc.AsString = '26' then
                            DM1.tCReceberParcRemEspDoc.AsString := mBoletosEspecieDoc.AsString + '-Divida ativa de Estado'
                          else
                            if mBoletosEspecieDoc.AsString = '27' then
                              DM1.tCReceberParcRemEspDoc.AsString := mBoletosEspecieDoc.AsString + '-Divida ativa de Munícipio';

  //Comando
  if mBoletosCodComando.AsString = '01' then
    DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Registro de títulos'
  else
    if mBoletosCodComando.AsString = '02' then
      DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Solicitação de baixa'
    else
      if mBoletosCodComando.AsString = '03' then
        DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Pedido de debito em conta'
      else
        if mBoletosCodComando.AsString = '04' then
          DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Concessão de abatimento'
        else
          if mBoletosCodComando.AsString = '05' then
            DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Cancelamento de abatimento'
          else
            if mBoletosCodComando.AsString = '06' then
              DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Alteração de vcto. de título'
            else
              if mBoletosCodComando.AsString = '07' then
                DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Alteração do número de controle do participante'
              else
                if mBoletosCodComando.AsString = '08' then
                  DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Alteração do número do título dado pelo cedente'
                else
                  if mBoletosCodComando.AsString = '09' then
                    DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Instrução para protestar'
                  else
                    if mBoletosCodComando.AsString = '10' then
                      DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Instrução para sustar protesto'
                    else
                      if mBoletosCodComando.AsString = '11' then
                        DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Instrução para dispensar juros'
                      else
                        if mBoletosCodComando.AsString = '12' then
                          DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Alteração de nome e endereço do sacado'
                        else
                          if mBoletosCodComando.AsString = '16' then
                            DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Alteração de juros mora'
                          else
                            if mBoletosCodComando.AsString = '31' then
                              DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Conceder desconto'
                            else
                              if mBoletosCodComando.AsString = '32' then
                                DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Não conceder desconto'
                              else
                                if mBoletosCodComando.AsString = '33' then
                                  DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Retificar desconto'
                                else
                                  if mBoletosCodComando.AsString = '34' then
                                    DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Alterar data para desconto'
                                  else
                                    if mBoletosCodComando.AsString = '35' then
                                      DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Cobrar multa'
                                    else
                                      if mBoletosCodComando.AsString = '36' then
                                        DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Dispensar multa'
                                      else
                                        if mBoletosCodComando.AsString = '37' then
                                          DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Dispensar indexador'
                                        else
                                          if mBoletosCodComando.AsString = '38' then
                                            DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Dispensar prazo limite de recebimento'
                                          else
                                            if mBoletosCodComando.AsString = '39' then
                                              DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Alterar prazo limite de recebimento'
                                            else
                                              if mBoletosCodComando.AsString = '40' then
                                                DM1.tCReceberParcRemCodComando.AsString := mBoletosCodComando.AsString + '-Alterar modalidade de cobrança';

  //Aceite
  DM1.tCReceberParcRemCodAceite.AsString := mBoletosAceite.AsString;
  if mBoletosAceite.AsString = 'A' then
    DM1.tCReceberParcRemCodAceite.AsString := DM1.tCReceberParcRemCodAceite.AsString + '-' + 'Aceite'
  else
    if mBoletosAceite.AsString = 'N' then
      DM1.tCReceberParcRemCodAceite.AsString := DM1.tCReceberParcRemCodAceite.AsString + '-' + 'Não ACeite';

  //Protesto
  DM1.tCReceberParcRemDiasProtesto.AsInteger := mBoletosDiasProtesto.AsInteger;

  //Juros
  DM1.tCReceberParcRemVlrJuros.AsFloat := mBoletosVlrJurosPorDia.AsFloat;

  //Desconto
  DM1.tCReceberParcRemVlrDesconto.AsFloat := mBoletosVlrDesconto.AsFloat;
  DM1.tCReceberParcRemDtLimiteDesconto.AsString := mBoletosDtLimiteDesc.AsString;

  //Baixa/Devolução
  DM1.tCReceberParcRemVlrIOF.AsFloat := mBoletosVlrIOF.AsFloat;
  DM1.tCReceberParcRemVlrAbatimento.AsString := mBoletosVlrAbatimento.AsString;
  DM1.tCReceberParcRemAvalista.AsString := mBoletosNomeAvalista.AsString;
  DM1.tCReceberParcRemCnpjAvalista.AsString := mBoletosCpfCnpjAvalista.AsString;
  DM1.tCReceberParcRemDtVecto.AsString := mBoletosDtVencto.AsString;
  DM1.tCReceberParcRemCodCedente.AsString := DM1.tContasNumConta.AsString;
  DM1.tCReceberParcRemCepAvalista.AsString := mBoletosCepAvalista.AsString;
  DM1.tCReceberParcRemEndAvalista.AsString := mBoletosEndAvalista.AsString;
  DM1.tCReceberParcRemCidAvalista.AsString := mBoletosCidAvalista.AsString;
  DM1.tCReceberParcRemUFAvalista.AsString := mBoletosUFAvalista.AsString;
  DM1.tCReceberParcRemBairroAvalista.AsString := mBoletosBairroAvalista.AsString;
  DM1.tCReceberParcRemNumTitBanco.AsString := mBoletosNossoNumero.AsString;
  DM1.tCReceberParcRemCodTransmissaoST.AsString := mBoletosCodTransmissao.AsString;
  DM1.tCReceberParcRemEmail.AsString := mBoletosEmail.AsString;
  DM1.tCReceberParcRem.Post;
  DM1.tCReceberParcRem.Refresh;
end;

procedure TfCobBrasil.Monta_MBoleto;
var
  i: Integer;
  vGera: Boolean;
begin
  fCobrancaEletronica.qBoletos.First;
  while not fCobrancaEletronica.qBoletos.Eof do
  begin
    vGera := True;
    if fCobrancaEletronica.BitBtn6.Tag = 1 then
      if not fCobrancaEletronica.mTitulos.Locate('NumCReceber;Parcela', VarArrayOf([fCobrancaEletronica.qBoletosNumCReceber.AsInteger, fCobrancaEletronica.qBoletosParcCReceber.AsInteger]), [locaseinsensitive]) then
        vGera := False;
    if vGera then
    begin
      if fCobrancaEletronica.SMDBGrid1.SelectedRows.CurrentRowSelected then
      begin
        mBoletos.Insert;
        mBoletosArqGerado.AsBoolean := fCobrancaEletronica.qBoletosArqGerado.AsBoolean;
        mBoletosFilial.AsInteger    := fCobrancaEletronica.qBoletosFilial.AsInteger;
        if fCobrancaEletronica.qBoletosEndPgto.AsString <> '' then
        begin
          mBoletosBairro.AsString := Copy(fCobrancaEletronica.qBoletosBairroPgto.AsString, 1, 10);
          for i := 1 to 9 do
          begin
            if (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString, i, 1) = '0') or (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString, i, 1) = '1') or (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString, i, 1) = '2') or
              (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString, i, 1) = '3') or (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString, i, 1) = '4') or (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString, i, 1) = '5') or
              (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString, i, 1) = '6') or (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString, i, 1) = '7') or (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString, i, 1) = '8') or
              (Copy(fCobrancaEletronica.qBoletosCepPgto.AsString, i, 1) = '9') then
              mBoletosCep.AsString := mBoletosCep.AsString + Copy(fCobrancaEletronica.qBoletosCepPgto.AsString, i, 1);
          end;
          mBoletosCidade.AsString := Copy(fCobrancaEletronica.qBoletoslkCidadePgto.AsString, 1, 15);
          mBoletosEndereco.AsString := fCobrancaEletronica.qBoletosEndPgto.AsString;
          mBoletosUf.AsString := fCobrancaEletronica.qBoletosUfPgto.AsString;
        end
        else
        begin
          mBoletosBairro.AsString := Copy(fCobrancaEletronica.qBoletosBairro.AsString, 1, 10);
          for i := 1 to 9 do
          begin
            if (Copy(fCobrancaEletronica.qBoletosCep.AsString, i, 1) = '0') or (Copy(fCobrancaEletronica.qBoletosCep.AsString, i, 1) = '1') or (Copy(fCobrancaEletronica.qBoletosCep.AsString, i, 1) = '2') or
              (Copy(fCobrancaEletronica.qBoletosCep.AsString, i, 1) = '3') or (Copy(fCobrancaEletronica.qBoletosCep.AsString, i, 1) = '4') or (Copy(fCobrancaEletronica.qBoletosCep.AsString, i, 1) = '5') or
              (Copy(fCobrancaEletronica.qBoletosCep.AsString, i, 1) = '6') or (Copy(fCobrancaEletronica.qBoletosCep.AsString, i, 1) = '7') or (Copy(fCobrancaEletronica.qBoletosCep.AsString, i, 1) = '8') or
              (Copy(fCobrancaEletronica.qBoletosCep.AsString, i, 1) = '9') then
              mBoletosCep.AsString := mBoletosCep.AsString + Copy(fCobrancaEletronica.qBoletosCep.AsString, i, 1);
          end;
          mBoletosCidade.AsString := Copy(fCobrancaEletronica.qBoletoslkCidade.AsString, 1, 15);
          mBoletosEndereco.AsString := fCobrancaEletronica.qBoletosEndereco.AsString;
          if fCobrancaEletronica.qBoletosComplEndereco.AsString <> '' then
            mBoletosEndereco.AsString := mBoletosEndereco.AsString + '-' + fCobrancaEletronica.qBoletosComplEndereco.AsString;
          mBoletosUf.AsString := fCobrancaEletronica.qBoletosUf.AsString;
        end;
        mBoletosCliente.AsString := fCobrancaEletronica.qBoletosNome.AsString;
        mBoletosCnpjCpfEditado.AsString := fCobrancaEletronica.qBoletosCgcCpf.AsString;
        if fCobrancaEletronica.qBoletosPessoa.AsString = 'F' then
        begin
          mBoletosPessoa.AsString := '1';
          mBoletosCNPJCPF.AsString := Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString, 1, 3) +
            Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString, 5, 3) +
            Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString, 9, 3) +
            Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString, 13, 2);
        end
        else
        begin
          mBoletosPessoa.AsString := '2';
          mBoletosCNPJCPF.AsString := Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString, 1, 2) +
            Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString, 4, 3) +
            Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString, 8, 3) +
            Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString, 12, 4) +
            Copy(fCobrancaEletronica.qBoletosCgcCpf.AsString, 17, 2);
        end;
        mBoletosDtGerado.AsString := fCobrancaEletronica.qBoletosDtGerado.AsString;
        mBoletosDtVencto.AsString := fCobrancaEletronica.qBoletosDtVencCReceber.AsString;
        mBoletosNumCReceber.AsInteger := fCobrancaEletronica.qBoletosNumCReceber.AsInteger;
        if fCobrancaEletronica.qBoletosNumNota.AsInteger > 0 then
          mBoletosNumNota.AsInteger := fCobrancaEletronica.qBoletosNumNota.AsInteger;
        mBoletosParcela.AsInteger := fCobrancaEletronica.qBoletosParcCReceber.AsInteger;
        mBoletosVlrParcela.AsFloat := fCobrancaEletronica.qBoletosRestParcela.AsFloat;
        mBoletosNossoNumero.AsString := fCobrancaEletronica.qBoletosNumTitBanco.AsString;
        mBoletosNumCarteira.AsString := DMBanco.tBcoBrasilNumCarteira.AsString;
        mBoletosInstrucao.AsString := DMBanco.tBcoBrasilInstrucao.AsString;
        mBoletosInstrucao2.AsString := DMBanco.tBcoBrasilInstrucao2.AsString;
        mBoletosTipoDocumento.AsString := DMBanco.tBcoBrasilTipoDocumento.AsString;
        mBoletosEspecieDoc.AsString := DMBanco.tBcoBrasilEspecieDoc.AsString;
        mBoletosAceite.AsString := DMBanco.tBcoBrasilAceite.AsString;
        if (mBoletosInstrucao.AsString = '06') or (mBoletosInstrucao2.AsString = '06') then
          mBoletosDiasProtesto.AsInteger := DMBanco.tBcoBrasilDiasProtesto.AsInteger
        else
          mBoletosDiasProtesto.AsInteger := 0;
        mBoletosVlrJurosPorDia.AsFloat := DMBanco.tBcoBrasilVlrJurosPorDia.AsFloat;
        mBoletosVlrDesconto.AsFloat := DMBanco.tBcoBrasilVlrDesconto.AsFloat;
        mBoletosImpBoleto.AsString := '';
        mBoletosCodTransmissao.AsString := DMBanco.tBcoBrasilCodTransmissao.AsString;
        mBoletosCodComando.AsString := DMBanco.tBcoBrasilCodComando.AsString;
        mBoletosMoeda.AsString := DMBanco.tBcoBrasilMoeda.AsString;

          //Esse if para controle do avalista foi incluido dia 12/02/2009 porque esta sendo
          //feito os títulos pela compotech e emitido para o banco pela pollytex
        if mBoletosFilial.AsInteger <> fCobrancaEletronica.vFilialConta then
        begin
          if DM1.tFilial2.Locate('Codigo', mBoletosFilial.AsInteger, [loCaseInsensitive]) then
          begin
            mBoletosNomeAvalista.AsString := DM1.tFilial2Empresa.AsString;
            mBoletosCpfCnpjAvalista.AsString := Copy(DM1.tFilialCNPJ.AsString, 1, 2) +
              Copy(DM1.tFilialCNPJ.AsString, 4, 3) +
              Copy(DM1.tFilialCNPJ.AsString, 8, 3) +
              Copy(DM1.tFilialCNPJ.AsString, 12, 4) +
              Copy(DM1.tFilialCNPJ.AsString, 17, 2);
            mBoletosBairroAvalista.AsString := DM1.tFilial2Bairro.AsString;
            mBoletosCidAvalista.AsString := DM1.tFilial2Cidade.AsString;
            mBoletosEndAvalista.AsString := DM1.tFilial2Endereco.AsString;
            if Length(DM1.tFilial2Cep.AsString) > 8 then
              mBoletosCepAvalista.AsString := Copy(DM1.tFilial2Cep.AsString, 1, 5) + Copy(DM1.tFilial2Cep.AsString, 7, 3)
            else
              mBoletosCepAvalista.AsString := DM1.tFilial2Cep.AsString;
            mBoletosUFAvalista.AsString := DM1.tFilial2Estado.AsString;
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
    end;
    fCobrancaEletronica.qBoletos.Next;
  end;
end;

procedure TfCobBrasil.Header_Arquivo;
var
  vAux: string;
  texto1, texto2: string;
  i: Integer;
  vBrancos: Integer;
begin
  //Código do regisrto tamanho 1 - posicao 1 ao 1
  texto1 := '0';

  //tamanho 1 - posicao 2 ao 2
  texto1 := texto1 + '1';

  //tamanho 7 - posicao 3 ao 9
  if CheckBox1.Checked then
    texto2 := 'TESTE'
  else
    texto2 := 'REMESSA';
  for i := 1 to 7 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //tamanho 2 - posicao 10 ao 11
  texto1 := texto1 + '01';

  //tamanho 8 - posicao 12 ao 19
  texto1 := texto1 + 'COBRANCA';

  //Brancos   tamanho 7 - posicao 20 ao 26
  for i := 1 to 7 do
    texto1 := texto1 + ' ';

  //Agência Cedente   tamanho 4 - posicao 27 ao 30
  texto2 := copy(DM1.tContasAgencia.AsString, 1, 4);
  for i := 1 to 4 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Digito da agência  tamanho 1 - posicao 31 ao 31
  texto2 := copy(DM1.tContasAgencia.AsString, 5, 1);
  for i := 1 to 1 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;

  //Conta do cedente, númro da conta  tamanho 8 - posicao 32 ao 39
  texto2 := copy(DM1.tContasNumConta.AsString, 1, 8);
  for i := 1 to 8 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Digito da conta   tamanho 1 - posicao 40 ao 40
  texto2 := DM1.tContasDigConta.AsString;
  for i := 1 to 1 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Zeros tamanho 6 - posicao 41 ao 46

  texto2 := DM1.tContasConvenioLider.AsString;
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Nome do cedente  tamanho 30 - posicao 47 ao 76
  texto2 := TirarAcento(copy(DM1.tFilialEmpresa.AsString, 1, 30));
  for i := 1 to 30 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Nome do banco  tamanho 18 - posicao 77 ao 94
  texto1 := texto1 + '001BANCO DO BRASIL';

  //Data de geração do arquivo tamanho 6 - posicao 95 ao 100
  vAux := FormatDateTime('DD/MM/YY', Date);
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux, i, 1) <> '.') and (Copy(vAux, i, 1) <> '-') and (Copy(vAux, i, 1) <> '/') then
      Texto2 := Texto2 + Copy(vAux, i, 1);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Sequencial da remessa  tamanho 7 - posicao 101 ao 107
  i := DMBanco.tBcoBrasilNumRemessa.AsInteger + 1;
  DMBanco.tBcoBrasil.Edit;
  DMBanco.tBcoBrasilNumRemessa.AsInteger := i;
  DMBanco.tBcoBrasil.Post;
  texto1 := texto1 + FormatFloat('0000000', i);


  if DM1.tContasCNAB.AsString = 'BRASIL400-6' then
    vBrancos := 287
  else
    vBrancos := 22;

  //Brancos  tamanho 22 - posicao 108 ao 129
  //ou 287 brancos, conforme o layout
  for i := 1 to vBrancos do
    texto1 := texto1 + ' ';

  if DM1.tContasCNAB.AsString = 'BRASIL400' then
  begin

    //Número do convênio   tamanho 7 - posicao 130 ao 136
    texto2 := copy(mBoletosCodTransmissao.AsString, 1, 7);
    for i := 1 to 7 - Length(texto2) do
      texto2 := '0' + texto2;
    texto1 := texto1 + texto2;

    //Brancos  tamanho 258 - posicao 137 ao 394
    for i := 1 to 258 do
      texto1 := texto1 + ' ';

  end;

  //Número de sequência  tamanho 6 - posicao 395 ao 400
  inc(vContadorReg);
  texto2 := IntToStr(vContadorReg);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  Writeln(F, texto1);
end;

procedure TfCobBrasil.Detalhe;
var
  vAux, texto1, texto2: string;
  i: Integer;
  vValor: Real;
  vContAux: Integer;
begin
  inc(vContador);
  //Código do registro  tamanho 1 - posicao 1 ao 1
  if DM1.tContasCNAB.AsString = 'BRASIL400' then
    texto1 := '7'
  else
    texto1 := '1';

  //Código de Inscrição  tamanho 2 - posicao 2 ao 3
  texto1 := texto1 + '02';

  //Número de inscrição da empresa  tamanho 14 - posicao 4 ao 17
  vAux := Dm1.tFilialCNPJ.AsString;
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux, i, 1) <> '.') and (Copy(vAux, i, 1) <> '-') and (Copy(vAux, i, 1) <> '/') then
      Texto2 := Texto2 + Copy(vAux, i, 1);
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Agência do cedente  tamanho 4 - posicao 18 ao 21
  texto2 := copy(DM1.tContasAgencia.AsString, 1, 4);
  for i := 1 to 4 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Digito da agência  tamanho 1 - posicao 22 ao 22
  texto2 := copy(DM1.tContasAgencia.AsString, 5, 1);
  for i := 1 to 1 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Conta do cedente  tamanho 8 - posicao 23 ao 30
  texto2 := copy(DM1.tContasNumConta.AsString, 1, 8);
  for i := 1 to 8 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Digito da conta  tamanho 1 - posicao 31 ao 31
  texto2 := DM1.tContasDigConta.AsString;
  for i := 1 to 1 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Número do convênio  tamanho 7 - posicao 32 ao 38
  if DM1.tContasCNAB.AsString = 'BRASIL400' then
    vContAux := 7
  else
    vContAux := 6;
  texto2 := copy(mBoletosCodTransmissao.AsString, 1, vContAux);
  for i := 1 to vContAux - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Nº Controle do participante  tamanho 25 - posicao 39 ao 63
  texto2 := FormatFloat('00', mBoletosFilial.AsInteger) + '.' + mBoletosNumCReceber.AsString;
  for i := 1 to 25 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Número do titulo no banco  tamanho 7 - posicao 64 ao 80
  if DM1.tContasCNAB.AsString = 'BRASIL400' then
    vContAux := 17
  else
    vContAux := 11;
  texto2 := Copy(mBoletosNossoNumero.AsString, 1, vContAux);
  for i := 1 to vContAux - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Digito Verificador
  if DM1.tContasCNAB.AsString = 'BRASIL400-6' then
    texto1 := texto1 + ' ';

  //Nº da prestação   tamanho 2 - posicao 81 ao 82
  texto1 := texto1 + '00';

  //Indicativo de grupo de valor    tamanho 2 - posicao 83 ao 84
  texto1 := texto1 + '00';

  //Brancos    tamanho 3 - posicao 85 ao 87
  texto1 := texto1 + '   ';

  //Indicativo do sacador (se tem avalista)  tamanho 1 - posicao 88 ao 88
  if mBoletosNomeAvalista.AsString <> '' then
    texto1 := texto1 + 'A'
  else
    texto1 := texto1 + ' ';

  //Prefixo do título   tamanho 3 - posicao 89 ao 91
  if DM1.tContasCNAB.AsString = 'BRASIL400-6' then
    texto1 := texto1 + '   '
  else
    if (mBoletosNumCarteira.AsString = '31') or (mBoletosNumCarteira.AsString = '51') then
      texto1 := texto1 + 'SD '
    else
      if mBoletosNumCarteira.AsString = '12' then
        texto1 := texto1 + 'AIU'
      else
        texto1 := texto1 + '   ';

  //Variação da carteira   tamanho 3 - posicao 92 ao 94
  //texto1 := texto1 + '019';
  texto2 := DMBanco.tBcoBrasilVariacaoCarteira.AsString;
  for i := 1 to 3 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Conta caução  tamanho 1 - posicao 95 ao 95
  texto1 := texto1 + '0';

  //Código de responsabilidade
  if DM1.tContasCNAB.AsString = 'BRASIL400-6' then
    texto1 := texto1 + '000000';

  //Número do bordero  tamanho 6 - posicao 96 ao 101
  texto1 := texto1 + '000000';

  //Tipo de cobrança  tamanho 5 - posicao 102 ao 106
  texto2 := mBoletosTipoDocumento.AsString;
  for i := 1 to 5 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Carteira  tamanho 2 - posicao 107 ao 108
  texto2 := mBoletosNumCarteira.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Comando  tamanho 2 - posicao 109 ao 110
  texto2 := mBoletosCodComando.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Nº do título  tamanho 10 - posicao 111 ao 120
  texto2 := FormatFloat('000000', mBoletosNumNota.AsFloat) + '/' + mBoletosParcela.AsString;
  for i := 1 to 10 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Data de vencimento do titulo   tamanho 6 - posicao 121 ao 126
  vAux := FormatDateTime('DD/MM/YY', mBoletosDtVencto.AsDateTime);
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux, i, 1) <> '.') and (Copy(vAux, i, 1) <> '-') and (Copy(vAux, i, 1) <> '/') then
      Texto2 := Texto2 + Copy(vAux, i, 1);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Valor do titulo tamanho 13 - posicao 127 ao 139
  texto2 := FormatFloat('00000000000.00', mBoletosVlrParcela.AsFloat);
  Delete(texto2, 12, 1);
  texto1 := texto1 + texto2;

  vVlrTotal := vVlrTotal + mBoletosVlrParcela.AsFloat;

  //Identificação do banco  tamanho 3 - posicao 140 ao 142
  texto1 := texto1 + '001';

  //Agência cobradora  tamanho 4 - posicao 143 ao 146
  texto1 := texto1 + '0000';

  //Digito verificador da agência cobradora  tamanho 1 - posicao 147 ao 147
  if DM1.tContasCNAB.AsString = 'BRASIL400' then
    texto1 := texto1 + '0'
  else
    texto1 := texto1 + ' ';

  //Espécie do título  tamanho 2 - posicao 148 ao 149
  texto2 := mBoletosEspecieDoc.AsString;
  for i := 1 to 2 - length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Identif. de título Aceito/Não Aceito  tamanho 1 - posicao 150 ao 150
  texto1 := texto1 + mBoletosAceite.AsString;

  //Data de emissão do título  tamanho 6 - posicao 151 ao 156
  vAux := FormatDateTime('DD/MM/YY', mBoletosDtGerado.AsDateTime);
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux, i, 1) <> '.') and (Copy(vAux, i, 1) <> '-') and (Copy(vAux, i, 1) <> '/') then
      Texto2 := Texto2 + Copy(vAux, i, 1);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Código da 1º instrução  tamanho 2 - posicao 157 ao 158
  texto2 := mBoletosInstrucao.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Código da 2º instrução  tamanho 2 - posicao 159 ao 160
  texto2 := mBoletosInstrucao2.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Juros de mora  tamanho 13 - posicao 161 ao 173
  if mBoletosVlrJurosPorDia.AsFloat > 0 then
    vValor := mBoletosVlrJurosPorDia.AsFloat
  else
    if DM1.tParametrosPercJuros.AsFloat > 0 then
      vValor := DM1.tParametrosPercJuros.AsFloat
    else
      vValor := 3;

  //if (mBoletosTipoJuro.AsString = '1') or (mBoletosTipoJuro.AsString = '5') then
  vValor := StrToFloat(FormatFloat('0.00', ((mBoletosVlrParcela.AsFloat * vValor) / 100) / 30));
  //else
  //if (mBoletosTipoJuro.AsString = '2') or (mBoletosTipoJuro.AsString = '6') then
  //  vValor := DM1.tParametrosPercJuros.AsFloat
  //else
  //  vValor := 0;
  texto2 := FormatFloat('00000000000.00', vValor);
  //texto2 := FormatFloat('00000000000.00',mBoletosVlrJurosPorDia.AsFloat);
  Delete(texto2, 12, 1);
  texto1 := texto1 + texto2;

  //Data limite para desconto   tamanho 6 - posicao 174 ao 179
  texto2 := mBoletosDtLimiteDesc.AsString;
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Valor desconto  tamanho 13 - posicao 180 ao 192
  texto2 := FormatFloat('00000000000.00', mBoletosVlrDesconto.AsFloat);
  Delete(texto2, 12, 1);
  texto1 := texto1 + texto2;

  //Valor da IOF   tamanho 13 - posicao 193 ao 205
  if mBoletosNumCarteira.AsString = '15' then
    texto2 := FormatFloat('00000000000.00', mBoletosVlrIOF.AsFloat)
  else
    texto2 := '00000000000.00';
  Delete(texto2, 12, 1);
  texto1 := texto1 + texto2;

  //Valor abatimento  tamanho 13 - posicao 206 ao 218
  if (mBoletosNumCarteira.AsString = '11') or (mBoletosNumCarteira.AsString = '17') or
    (mBoletosNumCarteira.AsString = '31') then
    texto2 := FormatFloat('00000000000.00', mBoletosVlrAbatimento.AsFloat)
  else
    texto2 := '00000000000.00';
  Delete(texto2, 12, 1);
  texto1 := texto1 + texto2;

  //Tipo inscr. sacado   tamanho 2 - posicao 219 ao 220
  if mBoletosPessoa.AsString = 'F' then
    texto1 := texto1 + '01'
  else
    texto1 := texto1 + '02';

  //Número de inscrição do sacado  tamanho 14 - posicao 221 ao 234
  vAux := mBoletosCNPJCPF.AsString;
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux, i, 1) <> '.') and (Copy(vAux, i, 1) <> '-') and (Copy(vAux, i, 1) <> '/') then
      Texto2 := Texto2 + Copy(vAux, i, 1);
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  if texto2 = '00000000000000' then
    ShowMessage('Cliente  ' + mBoletosCliente.AsString + ' não possui CNPJ/CPF');
  if mBoletosPessoa.AsString = 'F' then
    texto1 := texto1 + copy(texto2, 1, 9) + '000' + copy(texto2, 10, 2)
  else
    texto1 := texto1 + texto2;

  //Nome do sacado tamanho 37 - posicao 235 ao 271
  texto2 := TirarAcento(copy(mBoletosCliente.AsString, 1, 37));
  for i := 1 to 37 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Branco tamanho 3 - posicao 272 ao 274
  texto1 := texto1 + '   ';

  //Endereço do sacado tamanho 40 - posicao 275 ao 311
  if DM1.tContasCNAB.AsString = 'BRASIL400' then
    vContAux := 37
  else
    vContAux := 52;
  texto2 := TirarAcento(copy(mBoletosEndereco.AsString, 1, vContAux));

  for i := 1 to vContAux - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Branco   tamanho 15 - posicao 312 ao 326
  if DM1.tContasCNAB.AsString = 'BRASIL400' then
    for i := 1 to 15 do
      texto1 := texto1 + ' ';

  //Cep do sacado  tamanho 8 - posicao 327 ao 334
  texto2 := mBoletosCep.AsString;
  vAux := texto2;
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux, i, 1) <> '.') and (Copy(vAux, i, 1) <> '-') and (Copy(vAux, i, 1) <> '/') then
      Texto2 := Texto2 + Copy(vAux, i, 1);
  for i := 1 to 8 - Length(texto2) do
    texto2 := texto2 + '0';
  texto1 := texto1 + copy(texto2, 1, 8);

  //Cidade tamanho 15 - posicao 335 ao 349
  texto2 := TirarAcento(copy(mBoletosCidade.AsString, 1, 15));
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Unidade da federação  tamanho 2 - posicao 350 ao 351
  texto2 := mBoletosUf.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Nome do sacador tamanho 40 - posicao 352 ao 391
  texto2 := '';
  if mBoletosNomeAvalista.AsString <> '' then
  begin
    if Length(mBoletosCpfCnpjAvalista.AsString) > 11 then
      texto2 := ' CNPJ' + mBoletosCpfCnpjAvalista.AsString
    else
      texto2 := ' CPF' + mBoletosCpfCnpjAvalista.AsString;
  end;
  texto2 := TirarAcento(copy(mBoletosNomeAvalista.AsString, 1, 40 - Length(texto2))) + texto2;
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Nº de dias para protesto   tamanho 2 - posicao 392 ao 393
  texto2 := '';
  if (mBoletosInstrucao.AsString = '06') or (mBoletosInstrucao2.AsString = '06') then
    texto2 := mBoletosDiasProtesto.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;

  //Branco   tamanho 1 - posicao 394 ao 394
  texto1 := texto1 + ' ';

  inc(vContadorReg);
  //Reservado   tamanho 6 - posicao 395 ao 400
  texto2 := IntToStr(vContadorReg);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  Writeln(F, texto1);
end;

procedure TfCobBrasil.Detalhe_Email;
var
  vAux, texto1, texto2: string;
  i: Integer;
begin
  //Código do registro  tamanho 1 - posicao 1 ao 1
  texto1 := '5';

  //Bloqueto por email  tamanho 2 - posicao 2 ao 3
  texto1 := texto1 + '01';

  //Email   tamanho 136 - posicao 4 ao 139
  texto2 := mBoletosEmail.AsString;
  for i := 1 to 136 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Brancos   tamanho 255 - posicao 140 ao 394
  for i := 1 to 255 do
    texto1 := texto1 + ' ';

  //Sequencial registro   tamanho 6 - posicao 395 ao 400
  inc(vContadorReg);
  texto2 := IntToStr(vContadorReg);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  Writeln(F, texto1);
end;

procedure TfCobBrasil.Trailler_Arquivo;
var
  texto1, texto2: string;
  i: Integer;
begin
  //Código do registro  tamanho 1 - posicao 1 ao 1
  texto1 := '9';

  //Brancos   tamanho 393 - posicao 2 ao 394
  for i := 1 to 393 do
    texto1 := texto1 + ' ';

  //Número de sequência  tamanho 6 - posicao 395 ao 400
  inc(vContadorReg);
  texto2 := IntToStr(vContadorReg);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  Writeln(F, texto1);
end;

procedure TfCobBrasil.Gera_Arquivo;
var
  Texto1: string;
begin
  texto1 := fCobrancaEletronica.Monta_NomeArq(DMBanco.tBcoBrasilCaminho.AsString, 'BB');
  Label12.Caption := 'Arq.Gerado: ' + Texto1;
  Label12.Visible := True;
  AssignFile(F, Texto1);
  Rewrite(F);
  vContador := 0;
  vContadorReg := 0;
  vVlrTotal := 0;
  Header_Arquivo;
  mBoletos.First;
  while not mBoletos.Eof do
  begin
    Detalhe;
    if mBoletosEmail.AsString <> '' then
      Detalhe_Email;
    DM1.tCReceber.IndexFieldNames := 'Filial;NumCReceber';
    Dm1.tCReceber.SetKey;
    DM1.tCReceberFilial.AsInteger := mBoletosFilial.AsInteger;
    DM1.tCReceberNumCReceber.AsInteger := mBoletosNumCReceber.AsInteger;
    if DM1.tCReceber.GotoKey then
    begin
      if DM1.tCReceberParc.Locate('ParcCReceber', mBoletosParcela.AsInteger, [loCaseInsensitive]) then
      begin
        DM1.tCReceberParc.Edit;
        DM1.tCReceberParcArqGerado.AsBoolean := True;
        DM1.tCReceberParcNumTitBanco.AsString := mBoletosNossoNumero.AsString;
        DM1.tCReceberParcNumCarteira.AsString := mBoletosNumCarteira.AsString;
        if DMBanco.tBcoBrasilCodTipoCobranca.AsInteger > 0 then
          DM1.tCReceberParcCodTipoCobranca.AsInteger := DMBanco.tBcoBrasilCodTipoCobranca.AsInteger;


        DM1.tCReceberParc.Post;

        Grava_Historico('G');
      end;
    end;
    mBoletos.Next;
  end;
  Trailler_Arquivo;

  CloseFile(F);
end;

procedure TfCobBrasil.Habilita;
begin
  DateEdit1.Enabled := not (DateEdit1.Enabled);
  DateEdit2.Enabled := not (DateEdit2.Enabled);
  BitBtn1.Enabled := not (BitBtn1.Enabled);
  BitBtn2.Enabled := not (BitBtn2.Enabled);
  BitBtn3.Enabled := not (BitBtn3.Enabled);
  BitBtn4.Enabled := not (BitBtn4.Enabled);
end;

procedure TfCobBrasil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fCobrancaEletronica.qBoletos.Close;
  if DMBanco.Owner.ClassName = Self.ClassName then
    FreeAndNil(DMBanco);
  Action := Cafree;
end;

procedure TfCobBrasil.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfCobBrasil.BitBtn1Click(Sender: TObject);
begin
  if (DateEdit1.Date > 1) and (DateEdit2.Date > 1) then
  begin
    Label12.Caption := '';
    Screen.Cursor := crHourGlass;
    mBoletos.EmptyTable;
    fCobrancaEletronica.Monta_SQLqBoletos(DMBanco.tBcoBrasilCodConta.AsInteger);
    Monta_MBoleto;
    Habilita;
    BitBtn2.SetFocus;
    Screen.Cursor := crDefault;
  end
  else
  begin
    ShowMessage('Você deve informar datas inicial, final e filial p/ gerar relação!');
    DateEdit1.SetFocus;
  end;
end;

procedure TfCobBrasil.BitBtn3Click(Sender: TObject);
begin
  mBoletos.EmptyTable;
  Habilita;
  DateEdit1.SetFocus;
end;

procedure TfCobBrasil.BitBtn4Click(Sender: TObject);
begin
  if not mBoletos.IsEmpty then
  begin
    if MessageDlg('Deseja realmente excluir este título?', mtconfirmation, [mbok, mbno], 0) = mrok then
      mBoletos.Delete;
  end
  else
    ShowMessage('Não há título p/ ser excluído!');
end;

procedure TfCobBrasil.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if mBoletosArqGerado.AsBoolean then
  begin
    Background := clGreen;
    AFont.Color := clWhite;
  end;
end;

procedure TfCobBrasil.BitBtn2Click(Sender: TObject);
var
  vAux: Integer;
begin
  if not mBoletos.IsEmpty then
  begin
    Screen.Cursor := crHourGlass;
    DM1.tFilial.IndexFieldNames := 'Codigo';
    DM1.tFilial.SetKey;
    DM1.tFilialCodigo.AsInteger := fCobrancaEletronica.vFilialConta;
    DM1.tFilial.GotoKey;
    Gera_Arquivo;
    Screen.Cursor := crDefault;
    ShowMessage(IntToStr(vContador) + ' registro(s) gerados(s) c/ sucesso!!!');
  end
  else
    ShowMessage('Não há títulos selecionados para gerar arquivo!');
  Habilita;
  DateEdit1.SetFocus;
end;

procedure TfCobBrasil.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfCobBrasil.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Codigo';
end;

procedure TfCobBrasil.RxDBGrid1DblClick(Sender: TObject);
begin
  if mBoletosNumNota.AsInteger > 0 then
  begin
    mBoletos.Edit;
    fCobBrasilAlt := TfCobBrasilAlt.Create(Self);
    fCobBrasilAlt.ShowModal;
  end;
end;

procedure TfCobBrasil.BitBtn6Click(Sender: TObject);
begin
  fArqRetornoBrasil := TfArqRetornoBrasil.Create(Self);
  fArqRetornoBrasil.ShowModal;
end;

procedure TfCobBrasil.mBoletosNewRecord(DataSet: TDataSet);
begin
  mBoletosNossoNumero.AsString := '';
end;

procedure TfCobBrasil.FormShow(Sender: TObject);
begin
  if not Assigned(DMBanco) then
    DMBanco := TDMBanco.Create(Self);
  Dm1.tContas.Open;

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

procedure TfCobBrasil.CheckBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
    CheckBox1.Visible := not (CheckBox1.Visible);
end;

procedure TfCobBrasil.BitBtn7Click(Sender: TObject);
begin
  fRelCobrancaEletronica := TfRelCobrancaEletronica.Create(Self);
  fRelCobrancaEletronica.RLReport1.Preview;
  fRelCobrancaEletronica.RLReport1.Free;
end;

end.

