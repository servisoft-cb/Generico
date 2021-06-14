unit uNFe;
                   
interface

uses
  inifiles, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, xmldom, XMLIntf, msxmldom,
  XMLDoc, StdCtrls, oxmldom, Buttons, Mask, ToolEdit, DB, DBClient, IdIOHandler, IdIOHandlerSocket, IdBaseComponent, RzSndMsg,
  IdComponent, IdTCPConnection, IdTCPClient, RzButton, RzTabs, ExtCtrls, IdCoder, IdCoder3to4, IdCoderMIME, IdMessageClient,
  IdSSLOpenSSL, IdSMTP, IdMessage, JvComponent, JvMail, Mapi, ShellApi, RLMetaFile, DBTables, dbXPress, SqlExpr, FMTBcd,
  UDMConsNotaEletronica;

type
  TfNFe = class(TForm)
    Button1: TButton;
    XMLDocument1: TXMLDocument;
    DirectoryEdit1: TDirectoryEdit;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    ComboBox3: TComboBox;
    Label4: TLabel;
    ComboBox4: TComboBox;
    mItensNFe: TClientDataSet;
    mItensNFeFilial: TIntegerField;
    mItensNFeNumNota: TIntegerField;
    mItensNFeItemNota: TIntegerField;
    mItensNFeCodNatOper: TStringField;
    mItensNFeNomeProduto: TStringField;
    mItensNFeQtd: TFloatField;
    mItensNFeUnidade: TStringField;
    mItensNFeVlrUnitario: TFloatField;
    mItensNFeVlrTotal: TFloatField;
    mItensNFeAliqIcms: TFloatField;
    mItensNFeAliqIpi: TFloatField;
    mItensNFeVlrIcms: TFloatField;
    mItensNFeVlrIpi: TFloatField;
    mItensNFeAliqSitTrib: TFloatField;
    mItensNFeClasFiscalRed: TStringField;
    mItensNFeClasFiscal: TStringField;
    mItensNFeInfAdicionais: TMemoField;
    mItensNFeVlrDesconto: TFloatField;
    mItensNFePercRedICMS: TFloatField;
    mItensNFeVlrBaseICMS: TFloatField;
    mItensNFeBaseICMS: TFloatField;
    mItensNFeCodCSTIPI: TStringField;
    TCPClient: TIdTCPClient;
    IOHandlerSocket: TIdIOHandlerSocket;
    Label9: TLabel;
    ComboBox5: TComboBox;
    dsmiItensNFe: TDataSource;
    mDadosAdicionaisNFe: TClientDataSet;
    mDadosAdicionaisNFeFilial: TIntegerField;
    mDadosAdicionaisNFeObs: TMemoField;
    mDadosAdicionaisNFeObsAux: TMemoField;
    mDadosAdicionaisNFeNumNota: TIntegerField;
    mAuxDadosNFe: TClientDataSet;
    mAuxDadosNFeTipo: TStringField;
    mAuxDadosNFeCodigo: TStringField;
    mNotaDevolvidaNFe: TClientDataSet;
    mNotaDevolvidaNFeNumNota: TIntegerField;
    mNotaDevolvidaNFeParcialTotal: TStringField;
    mNotaDevolvidaNFeQtd: TFloatField;
    mNotaDevolvidaNFeUnidade: TStringField;
    mNotaDevolvidaNFeCodForn: TIntegerField;
    mNotaDevolvidaNFeNomeForn: TStringField;
    mNotaDevolvidaNFeTriangular: TBooleanField;
    RzSendMessage1: TRzSendMessage;
    mItensNFeTipoReg: TStringField;
    mItensNFeCodProduto: TStringField;
    CheckBox1: TCheckBox;
    mItensNFeAliqPis: TFloatField;
    mItensNFeAliqCofins: TFloatField;
    mItensNFeVlrPis: TFloatField;
    mItensNFeVlrCofins: TFloatField;
    OpenDialog: TOpenDialog;
    CheckBox2: TCheckBox;
    RzPageControl1: TRzPageControl;
    tsEnvio: TRzTabSheet;
    tsConfig: TRzTabSheet;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbRecibo: TLabel;
    lbNroProtocolo: TLabel;
    lbChaveAcesso: TLabel;
    btEnviar: TButton;
    btDanfe: TButton;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    lbNroProtocoloCancelamento: TLabel;
    Edit1: TEdit;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    Label17: TLabel;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    btGravaNota: TButton;
    Button8: TButton;
    Label12: TLabel;
    MailMessage: TIdMessage;
    SMTP: TIdSMTP;
    AttachmentDialog: TOpenDialog;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    mParcelaNFe: TClientDataSet;
    mParcelaNFeValor: TFloatField;
    mParcelaNFeDtVencimento: TStringField;
    mParcelaNFeNumNota: TIntegerField;
    mParcelaNFeParcela: TIntegerField;
    JvMail1: TJvMail;
    ckAnexarDanfe: TCheckBox;
    edChaveNfe: TEdit;
    edCodBarras: TEdit;
    btCancelar: TBitBtn;
    qNotaAux: TQuery;
    qNotaAuxFilial: TIntegerField;
    qNotaAuxSerie: TStringField;
    qNotaAuxNumNota: TIntegerField;
    mItensNFeIcmsBaseSubst: TFloatField;
    mItensNFeIcmsVlrSubst: TFloatField;
    ckFilialNao: TCheckBox;
    mItensNFeCodPis: TStringField;
    mItensNFeCodCofins: TStringField;
    mItensNFeTipoPis: TStringField;
    mItensNFeTipoCofins: TStringField;
    mItensNFeCodSitTrib: TStringField;
    mItensNFePedidoCliente: TStringField;
    mItensNFeItemPedido: TIntegerField;
    mItensNFeVlrIcmsSimples: TFloatField;
    mItensNFeBaseIcmsSimples: TFloatField;
    Label15: TLabel;
    cbConvTxtXml: TComboBox;
    GroupBox4: TGroupBox;
    Label16: TLabel;
    lbNroProtocoloInutil: TLabel;
    btInutilizar: TBitBtn;
    Button2: TButton;
    Button3: TButton;
    btConexao: TButton;
    mNotaDevolvidaNFeTipo: TStringField;
    mNotaDevolvidaNFeCNPJ: TStringField;
    mNotaDevolvidaNFeCodUF: TStringField;
    mNotaDevolvidaNFeModelo: TStringField;
    mNotaDevolvidaNFeSerie: TStringField;
    mNotaDevolvidaNFeItem: TIntegerField;
    mNotaDevolvidaNFeNFeChaveAcesso: TStringField;
    mNotaDevolvidaNFeCupomNumECF: TIntegerField;
    mNotaDevolvidaNFeCupomNumCOO: TIntegerField;
    mNotaDevolvidaNFeCupomModelo: TStringField;
    mNotaDevolvidaNFeAnoEmissao: TIntegerField;
    mNotaDevolvidaNFeMesEmissao: TIntegerField;
    mItensNFeMVA: TFloatField;
    mItensNFeSomaVlrTotalProd: TBooleanField;
    GroupBox5: TGroupBox;
    Label11: TLabel;
    lbCodBarraContingencia: TLabel;
    btContingencia: TBitBtn;
    mItensNFeVlrFrete: TFloatField;
    mItensNFeVlrSeguro: TFloatField;
    mItensNFeVlrOutrasDespesas: TFloatField;
    mItensNFeCodBarra: TStringField;
    mItensNFeVlrBaseImportacao: TFloatField;
    mItensNFeVlrImportacao: TFloatField;
    mItensNFeVlrIOF: TFloatField;
    mItensNFeVlrDespAduaneira: TFloatField;
    mNotaDevolvidaNFeIE: TStringField;
    lbErro: TLabel;
    GroupBox6: TGroupBox;
    Label18: TLabel;
    lbNroProtocoloCCe: TLabel;
    btCCe: TBitBtn;
    GroupBox7: TGroupBox;
    ckUsarOutlook: TCheckBox;
    ckUsarPadrao: TCheckBox;
    ckUsarJv: TCheckBox;
    ckUsarOutlookOLE: TCheckBox;
    ckEmailConfigurado: TCheckBox;
    btEnviarNovo: TButton;
    btBuscarStatus: TButton;
    CheckBox3: TCheckBox;
    mItensNFeVlrTributos: TFloatField;
    mItensNFeVlrTributos_Federal: TFloatField;
    mItensNFeVlrTributos_Estadual: TFloatField;
    mItensNFeVlrTributos_Municipal: TFloatField;
    mItensNFePercTributos_Federal: TFloatField;
    mItensNFePercTributos_Estadual: TFloatField;
    mItensNFePercTributos_Municipal: TFloatField;
    mItensNFeFonte: TStringField;
    mNotaDevolvidaNFeCTeChaveAcesso: TStringField;
    mItensNFePercRedICMSSubst: TFloatField;
    mItensNFeVlrIcmsDesonerado: TFloatField;
    mItensNFeCodMotivoDesonerado: TIntegerField;
    mItensNFeVlrIcmsOperacao: TFloatField;
    mItensNFePercTribIcms: TFloatField;
    mItensNFeNCM_EX: TStringField;
    mItensNFeItemOriginal: TIntegerField;
    TabSheet1: TRzTabSheet;
    ComboBox6: TComboBox;
    Memo1: TMemo;
    mItensNFePercDiferimento: TFloatField;
    mItensNFeVlrIcmsDiferido: TFloatField;
    btDownloadWeb: TButton;
    mItensNFeCod_EnqIPI: TStringField;
    qIcmsPartilha: TSQLQuery;
    qIcmsPartilhaANO: TIntegerField;
    qIcmsPartilhaPERC_DESTINO: TFloatField;
    mItensNFePerc_ICMS_FCP: TFloatField;
    mItensNFePerc_ICMS_UF_Dest: TFloatField;
    mItensNFePerc_ICMS_Partilha: TFloatField;
    mItensNFeVlr_ICMS_FCP: TFloatField;
    mItensNFeVlr_ICMS_UF_Dest: TFloatField;
    mItensNFeVlr_ICMS_UF_Remet: TFloatField;
    mItensNFeQTD_TRIB: TFloatField;
    mItensNFeVLR_UNITARIO_TRIB: TFloatField;
    mItensNFeUNIDADE_TRIB: TStringField;
    qTPag: TQuery;
    qsTPag: TDataSource;
    qTPagVLR_VENCIMENTO: TFloatField;
    qTPagCod_Imp_Fiscal: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure btEnviarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btDanfeClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btConexaoClick(Sender: TObject);
    procedure mNotaDevolvidaNFeNewRecord(DataSet: TDataSet);
    procedure mDadosAdicionaisNFeBeforePost(DataSet: TDataSet);
    procedure mItensNFeBeforePost(DataSet: TDataSet);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure btGravaNotaClick(Sender: TObject);
    procedure mItensNFeNewRecord(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button8Click(Sender: TObject);
    procedure ComboBox5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btInutilizarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btContingenciaClick(Sender: TObject);
    procedure btCCeClick(Sender: TObject);
    procedure btEnviarNovoClick(Sender: TObject);
    procedure btBuscarStatusClick(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure btDownloadWebClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsNotaEletronica : TDMConsNotaEletronica;
    
    Texto: String;
    vTextoEnvio: TStrings;
    vConexao: Boolean;
    vItemAdicao, vNumNota: Integer;
    vContigencia: Boolean;
    vEmailTransp: String;
    vCodPisNFe, vCodCofinsNFe: String;
    vCodSitTrib, vOrigem: String;
    vCodCSTIPI: String;

    vDadosCorpoEmail: WideString;
    vEmailAdicionais: WideString;

    vGerar_Chave_Antiga: String;
    vChave_Geral       : String;

    //3.10  18/03/2015
    vMarca_Homologacao, vCliente_Canhoto : String;
    procedure prc_Imprimir_Danfe(Tipo: String); //E= Envio   I=Imprimir
    procedure prc_Controlar_Envio_Email(Tipo: String = 'E');//C=Cancelar   E=Envio
    //********

    procedure prc_Monta_CorpoEmail;

    procedure Monta_Cabecalho;
    procedure Monta_Detalhe;

    procedure Gera_Chave(Contingencia: Boolean);

    procedure Monta_B13;
    procedure Monta_B14;
    procedure Monta_B20j;
    procedure Monta_B20a;

    //***

    procedure Monta_I18;
    procedure Monta_I25;

    procedure Monta_N02;
    procedure Monta_N03;
    procedure Monta_N04;
    procedure Monta_N05;
    procedure Monta_N06;
    procedure Monta_N07;
    procedure Monta_N08;
    procedure Monta_N10;
    procedure Monta_N10c;
    procedure Monta_N10d;
    procedure Monta_N10e;
    procedure Monta_N10f;
    procedure Monta_N10g; //Falta implementar
    procedure Monta_N10h; //Falta implementar e testar

    procedure Monta_O;
    procedure Monta_O07;
    procedure Monta_O08;
    procedure Monta_O10;

    procedure Monta_P;

    procedure Monta_Q02;
    procedure Monta_Q03;
    procedure Monta_Q04;
    procedure Monta_Q05;

    procedure Monta_S02;
    procedure Monta_S03;
    procedure Monta_S04;
    procedure Monta_S05;

    procedure Monta_X03;
    
    procedure Monta_X22;
    procedure Monta_X33;

    procedure Le_Parcelas;
    procedure Monta_Y07(Data: TDateTime; Valor: Real; Parcela: Integer);

    procedure GerarNFeTXT(AStrings: TStrings);

    procedure Habilita_Botoes;

    //07/03/2010
    procedure GetSettings;
    procedure SaveSettings;

    //22/08/2009
    function Verifica_ConexaoInternet: Boolean;

    function Replace(Str, Ant, Novo: string): string;

    function Monta_Diretorio(Tipo, Diretorio: string): string;  //Tipo = "T" Texto  "X" XML

    procedure Envia_Mail(Email, Assunto, TextoLinha1: String); //Usa o Outlook
    procedure Envia_Mail2(Email, Assunto, TextoLinha1: String); //Usa o envio direto conforme as configurações
    procedure Envia_MailJV(Email, Assunto, TextoLinha1: String);
    procedure Envia_MailOLE(Email, Assunto, TextoLinha1: String);
    //28/08/2009
    procedure Le_tNotaFiscalRef;

    //07/09/2009
    procedure Monta_CodBarraContingencia(Tipo: String); //G= Gerar para consultar  E=Enviar e imprimir

    //24/09/2009
    function Verifica_Contigencia: Boolean;

    procedure prc_Controle_Envio_Email(sEmail: String);

    //3.10   18/03/2015
    procedure prc_Danfe_Flexdocs;
    procedure prc_Configura_Variaveis_Envio;


  public
    { Public declarations }
    vNomeArquivo, vNomeArqPdf: String;
    vPessoaTransp: String;

    function TirarAcento(texto: String): string;
    procedure Posiciona_CidadeUF(CodCidade, IDPais: Integer);
  end;

var
  fNFe: TfNFe;

implementation

uses nfe_v110, UDM1, DateUtils, uNFeConsts, uNFeComandos, URelDANFE, UNFeDados, UDMNotaFiscal, ComObj,
  RLReport, UDMNFe, UDMNFeFB, UNotaFiscalCCe, URelCCe, DmdDatabase, uXMLNFe4_00,
  uUtil;

{$R *.dfm}

procedure TfNFe.Envia_MailOLE(Email, Assunto, TextoLinha1: String);
const
	olMailItem = 0;
var
	Outlook: OLEVariant;
	MailItem: Variant;
  Anexo1, Anexo2: String;
begin
  if Email = '' then
    exit;
  try
    //OLE e Outlook
    try
    Outlook:=GetActiveOleObject('Outlook.Application') ;
    except
    Outlook:=CreateOleObject('Outlook.Application') ;
    end;
    MailItem := Outlook.CreateItem(olMailItem) ;
    MailItem.Recipients.Add(Email);
    if vEmailTransp <> '' then
      MailItem.Recipients.Add(vEmailTransp);
    if Trim(DM1.tClienteEmailNFe2.AsString) <> '' then
      MailItem.Recipients.Add(DM1.tClienteEmailNFe2.AsString);

    //16/05/2012
    DMNFeFB.cdsNFE_EMAIL.First;
    while not DMNFeFB.cdsNFE_EMAIL.Eof do
    begin
      MailItem.Recipients.Add(DMNFeFB.cdsNFE_EMAILEMAIL.AsString);
      DMNFeFB.cdsNFE_EMAIL.Next;
    end;

    MailItem.Subject := 'Assunto';
    MailItem.Body    := 'Corpo do Email';
    Anexo1 := '';
    Anexo2 := '';
    if (ckAnexarDanfe.Checked) and (vNomeArqPdf <> '') then
    begin
      Anexo1 :=  vNomeArquivo;
      Anexo2 :=  vNomeArqPdf;
      MailItem.Attachments.Add(vNomeArquivo) ;
      MailItem.Attachments.Add(vNomeArqPdf);
    end
    else
    begin
      Anexo1 :=  vNomeArquivo;
      Anexo2 :=  '';
      MailItem.Attachments.Add(vNomeArquivo) ;
    end;
    MailItem.Send; //MailItem.Send to skip the window and just send the email
    VarClear(Outlook);
  except
    ShowMessage('Erro ao enviar email!');
  end;
end;

procedure TfNFe.Envia_MailJV(Email, Assunto, TextoLinha1: String);
const
	olMailItem = 0;
begin
  if Email = '' then
    exit;

  try
    JvMail1.Clear;
    JvMail1.Attachment.Clear;
    JvMail1.Recipient.AddRecip(Email);

    if vEmailTransp <> '' then
      JvMail1.Recipient.AddRecip(vEmailTransp);

    if Trim(DM1.tClienteEmailNFe2.AsString) <> '' then
      JvMail1.Recipient.AddRecip(DM1.tClienteEmailNFe2.AsString);

    //16/05/2012
    DMNFeFB.cdsNFE_EMAIL.First;
    while not DMNFeFB.cdsNFE_EMAIL.Eof do
    begin
      JvMail1.BlindCopy.AddRecip(DMNFeFB.cdsNFE_EMAILEMAIL.AsString);
      DMNFeFB.cdsNFE_EMAIL.Next;
    end;

    JvMail1.Subject := Assunto;
    JvMail1.Attachment.Clear;
    JvMail1.Attachment.Add(vNomeArquivo);
    if vNomeArqPdf <> '' then
      JvMail1.Attachment.Add(vNomeArqPdf);
    JvMail1.Body.Clear;
    JvMail1.Body.Add(TextoLinha1);
    JvMail1.Body.Add('');

    if ComboBox1.ItemIndex = 1 then
      JvMail1.Body.Add('NOTA EM CONTINGENCIA FS  Impressa em formulário de seguranca')
    else
    if ComboBox1.ItemIndex = 2 then
      JvMail1.Body.Add('NOTA EM CONTINGENCIA SCAN')
    else
    if ComboBox1.ItemIndex = 3 then
      JvMail1.Body.Add('NOTA EM CONTINGENCIA FS-DA  Impressa em formulário de seguranca');

    //*************
    JvMail1.Body.Add('');

    JvMail1.Body.Add(DM1.tFilialEmpresa.AsString);
    JvMail1.Body.Add(DM1.tFilialCNPJ.AsString);
    JvMail1.Body.Add(DM1.tFilialEndereco.AsString + ', ' + DM1.tFilialNumEnd.AsString);
    if DM1.tCidade.Locate('Codigo',DM1.tFilialCodCidade.AsInteger,[loCaseInsensitive]) then
      JvMail1.Body.Add(DM1.tCidadeNome.AsString + ' - ' + DM1.tCidadeEstado.AsString);
    JvMail1.Body.Add('Fone: ' + DM1.tFilialTel.AsString);
    JvMail1.SendMail(True);
  except
    ShowMessage('Falha no envio de email');
  end;
end;

procedure TfNFe.Envia_Mail2(Email, Assunto, TextoLinha1: String); //Usa o envio direto conforme as configurações
var
  vEmailAux: String;
  lista_Anexo: TStringList;
begin
  if Email = '' then
    exit;

  Lista_Anexo := TStringList.Create;
  try
    vEmailAux := Email;
    if Trim(DM1.tClienteEmailNFe2.AsString) <> '' then
      vEmailAux := vEmailAux + ',' + DM1.tClienteEmailNFe2.AsString;
    if vEmailTransp <> '' then
      vEmailAux := vEmailAux + ',' + vEmailTransp;

    prc_Monta_CorpoEmail;

    vDadosCorpoEmail := TextoLinha1 + #13 + vDadosCorpoEmail;

    texto := Monta_Texto(DM1.tFilialCNPJ.AsString,14);

    lista_Anexo.Add(vNomeArquivo);
    if vNomeArqPdf <> '' then
      lista_Anexo.Add(vNomeArqPdf);

    EnviarEmail(Trim(DM1.tParametrosLocalServidorNFe.AsString),
                 texto,
                 vEmailAux,
                 vEmailAdicionais,
                 Assunto,
                 vDadosCorpoEmail,
                 lista_Anexo );

    ShowMessage('E-mail enviado com sucesso!');
  finally
    FreeAndNil(Lista_Anexo);
  end;

end;

function TfNFe.Verifica_Contigencia: Boolean;
begin
  Result := False;
  if ComboBox1.ItemIndex = 2 then
    Result := True;
end;

procedure TfNFe.Monta_Q02;
var
  vVlrAux: Real;
begin
//PIS - Grupo de PIS tributado pela aliquota
  Texto := 'Q02|' + vCodPisNFe + '|';

  vVlrAux := 0;
  if mItensNFeVlrPis.AsFloat > 0 then
    vVlrAux := mItensNFeVlrTotal.AsFloat;

  Texto := Texto + Replace(FormatFloat('0.00',vVlrAux),',','.') + '|';
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqPis.AsFloat),',','.') + '|';
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrPis.AsFloat),',','.') + '|';
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_Q03;
var
  vQtdAux: Real;
begin
//PIS - Grupo de Pis tributado por quantidade
  Texto := 'Q03|' + vCodPisNFe + '|';

  vQtdAux := 0;
  if mItensNFeVlrPis.AsFloat > 0 then
    vQtdAux := mItensNFeQtd.AsFloat;

  Texto := Texto + Replace(FormatFloat('0.0000',vQtdAux),',','.') + '|';
  Texto := Texto + Replace(FormatFloat('0.0000',mItensNFeAliqPis.AsFloat),',','.') + '|';
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrPis.AsFloat),',','.') + '|';
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_Q04;
begin
//PIS - Grupo de PIS não tributado
  if Trim(vCodPisNFe) = '' then
    vCodPisNFe := '08';
  //Texto := 'Q04|08|';
  Texto := 'Q04|' + vCodPisNFe + '|';
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_Q05;
var
  vVlrAux: Real;
  vQtdAux: Real;
begin
//PIS - Grupo de PIS outras operações
  if Trim(vCodPisNFe) = '' then
    vCodPisNFe := '99';
  //Texto := 'Q05|99|';
  Texto := 'Q05|' + vCodPisNFe + '|';
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrPis.AsFloat),',','.') + '|';
  vTextoEnvio.Add(Texto);

  vVlrAux := 0;
  vQtdAux := 0;
  if mItensNFeVlrPis.AsFloat > 0 then
  begin
    vVlrAux := mItensNFeVlrTotal.AsFloat;
    vQtdAux := mItensNFeQtd.AsFloat;
  end;

  //Texto := 'Q07|0|0|';
  if mItensNFeTipoPis.AsString = 'V' then
  begin
    Texto := 'Q10|';
    Texto := Texto + Replace(FormatFloat('0.0000',vQtdAux),',','.') + '|';
    Texto := Texto + Replace(FormatFloat('0.0000',mItensNFeAliqPis.AsFloat),',','.') + '|';
  end
  else
  begin
    Texto := 'Q07|';
    Texto := Texto + Replace(FormatFloat('0.00',vVlrAux),',','.') + '|';
    Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqPis.AsFloat),',','.') + '|';
  end;
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_S02;
var
  vVlrAux: Real;
begin
//COFINS - Grupo de COFINS outras operações
  vVlrAux := 0;
  if mItensNFeVlrCofins.AsFloat > 0 then
    vVlrAux := mItensNFeVlrTotal.AsFloat;

  Texto := 'S02|' + vCodCofinsNFe + '|';
  Texto := Texto + Replace(FormatFloat('0.00',vVlrAux),',','.') + '|';
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqCofins.AsFloat),',','.') + '|';
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrCofins.AsFloat),',','.') + '|';
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_S03;
var
  vQtdAux: Real;
begin
//COFINS - Grupo de COFINS outras operações
  vQtdAux := 0;
  if mItensNFeVlrCofins.AsFloat > 0 then
    vQtdAux := mItensNFeQtd.AsFloat;

  Texto := 'S03|' + vCodCofinsNFe + '|';
  Texto := Texto + Replace(FormatFloat('0.0000',vQtdAux),',','.') + '|';
  Texto := Texto + Replace(FormatFloat('0.0000',mItensNFeAliqCofins.AsFloat),',','.') + '|';
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrCofins.AsFloat),',','.') + '|';
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_S04;
begin
//COFINS - Grupo de COFINS não tributado
  if Trim(vCodCofinsNFe) = '' then
    vCodCofinsNFe := '07';
  //Texto := 'S04|07|';
  Texto := 'S04|' + vCodCofinsNFe + '|';
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_S05;
var
  vVlrAux: Real;
  vQtdAux: Real;
begin
//COFINS - Grupo de COFINS outras operações
  if Trim(vCodCofinsNFe) = '' then
    vCodCofinsNFe := '99';
  //Texto := 'S05|99|';
  Texto := 'S05|' + vCodCofinsNFe + '|';
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrCofins.AsFloat),',','.') + '|';
  vTextoEnvio.Add(Texto);

  vVlrAux := 0;
  vQtdAux := 0;
  if mItensNFeVlrCofins.AsFloat > 0 then
  begin
    vVlrAux := mItensNFeVlrTotal.AsFloat;
    vQtdAux := mItensNFeQtd.AsFloat;
  end;

  //Texto := 'S07|0|0|';
  if mItensNFeTipoCofins.AsString = 'V' then
  begin
    Texto := 'S09|';
    Texto := Texto + Replace(FormatFloat('0.0000',vQtdAux),',','.') + '|';
    Texto := Texto + Replace(FormatFloat('0.0000',mItensNFeAliqPis.AsFloat),',','.') + '|';
    vTextoEnvio.Add(Texto);
  end
  else
  begin
    Texto := 'S07|';
    Texto := Texto + Replace(FormatFloat('0.00',vVlrAux),',','.') + '|';
    Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqPis.AsFloat),',','.') + '|';
    vTextoEnvio.Add(Texto);
  end;
end;

procedure TfNFe.Monta_I18;
var
  vCidadeImp, vUFImp: String;
begin
//Letra I18 - Declaração de Importação
//Número do documento de importação DI
  Texto := 'I18|' + Monta_Texto(DMNotaFiscal.tNotaFiscalImpNumDI.AsString,0) + '|';
                                
//Data de Registro DI
  Texto := Texto + FormatFloat('0000',YearOf(DMNotaFiscal.tNotaFiscalImpDataRegistro.AsDateTime)) + '-' +
                   FormatFloat('00',MonthOf(DMNotaFiscal.tNotaFiscalImpDataRegistro.AsDateTime)) + '-' +
                   FormatFloat('00',DayOf(DMNotaFiscal.tNotaFiscalImpDataRegistro.AsDateTime)) + '|';

//Local de desembaraço
  vCidadeImp := '';
  if DMNotaFiscal.tNotaFiscalImpCodCidade.AsInteger > 0 then
    begin
      Posiciona_CidadeUF(DMNotaFiscal.tNotaFiscalImpCodCidade.AsInteger,1);
      vCidadeImp := DM1.tCidadeNome.AsString;
      vUFImp     := DM1.tCidadeEstado.AsString;
    end;
  Texto := Texto + vCidadeImp + '|';

//Sigla da UF desembaraço
  Texto := Texto + vUFImp + '|';

//Data do Desembaraço Aduaneiro
  Texto := Texto + FormatFloat('0000',YearOf(DMNotaFiscal.tNotaFiscalImpDataDesembaraco.AsDateTime)) + '-' +
                   FormatFloat('00',MonthOf(DMNotaFiscal.tNotaFiscalImpDataDesembaraco.AsDateTime)) + '-' +
                   FormatFloat('00',DayOf(DMNotaFiscal.tNotaFiscalImpDataDesembaraco.AsDateTime)) + '|';

//Código do exportador
  Texto := Texto + DMNotaFiscal.tNotaFiscalImpCodExportador.AsString + '|';

  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_I25;
begin
//Letra I25 - Adições
//Número da adição
  vItemAdicao := vItemAdicao + 1;
  Texto := 'I25|' + DMNotaFiscal.tNotaFiscalImpAdicaoNumAdicao.AsString + '|';

//Número sequencial da adição
  Texto := Texto + IntToStr(vItemAdicao) + '|';

//Código do Fabricante
  Texto := Texto + DMNotaFiscal.tNotaFiscalImpAdicaoCodFabricante.AsString + '|';

//Valor do Desconto
  Texto := Texto + Replace(FormatFloat('0.00',DMNotaFiscal.tNotaFiscalImpAdicaoValorDescontoDI.AsFloat),',','.') + '|';

  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_CodBarraContingencia(Tipo: String);
var
  vCnpjRem: String;
  vCnpjDest: String;
  vVlrNota: String;
  vDestaqueICMS: TICMS;
  vDestaqueICMSSubst: TICMS;
  vCodBarraAux: String;
begin
  { Informações retidas da página  4 do link:
    http://www.nfe.fazenda.gov.br/portal/docs/NT_2009.003_Preenchimento_de_campos_e_codigo_de_barras_auxiliar.pdf }
  vCnpjDest   := Monta_Texto(DM1.tClienteCgcCpf.AsString,14);
  vCnpjRem    := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
  //vVlrNota    := Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat),',','.');
  vVlrNota    := FormatFloat('0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat);
  vVlrNota    := Monta_Texto(vVlrNota,14);
  Posiciona_CidadeUF(DM1.tClienteCodCidade.AsInteger,DM1.tClienteIDPais.AsInteger);

  if StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrIcms.AsFloat)) > 0 then
    vDestaqueICMS := icComDestaque
  else
    vDestaqueICMS := icSemDestaque;
  if StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalICMSVlrSubst.AsFloat)) > 0 then
    vDestaqueICMSSubst := icComDestaque
  else
    vDestaqueICMSSubst := icSemDestaque;

  vCodBarraAux := GeraCodigoBarras( Trim(DM1.tParametrosLocalServidorNFe.AsString),
                                           vCnpjRem,
                                           DM1.tUFCodUF.AsString,                // UF
                                           vCnpjDest,         //CNPJ Destinatário, Remetente ou zeros
                                           //StrToFloat(vVlrNota),              // Valor Total da NF-e
                                           StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat)),              // Valor Total da NF-e
                                           teContFS,            // Tipo emissão: Contingência FS ou Contingência FSDA
                                           vDestaqueICMS,       // Destaque de ICMS próprio na NF-e: há destaque de ICMS próprio ou não há destaque de ICMS próprio
                                           //icSemDestaque,       // Destaque de ICMS por substituição tributária na NF-e: há destaque de ICMS por substituição tributária ou não há destaque de ICMS por substituição tributária
                                           vDestaqueICMSSubst,       // Destaque de ICMS por substituição tributária na NF-e: há destaque de ICMS por substituição tributária ou não há destaque de ICMS por substituição tributária
                                           //***************
                                           DM1.tNotaFiscalDtEmissao.AsDateTime // Data de emissão, será utilizado internamente o dia
                                         );

  if Tipo = 'G' then
    edCodBarras.Text := vCodBarraAux
  else
    lbCodBarraContingencia.Caption := vCodBarraAux;
end;

procedure TfNFe.Le_tNotaFiscalRef;
begin
  if mNotaDevolvidaNFe.IsEmpty then
    exit;

  //Tirado esse IF dia 17/01/2012, pois esse if tem que estar na hora que gera a nota de devolução que é no UNFeDados
  //é a tabela tNotaFiscalNDevolvida  
  //if DM1.tParametrosEnviarNotasBenefNaNFe.AsBoolean then
  //begin
    mNotaDevolvidaNFe.First;
    while not mNotaDevolvidaNFe.Eof do
    begin
      if mNotaDevolvidaNFeTipo.AsString = '13' then
        Monta_B13
      else
      if mNotaDevolvidaNFeTipo.AsString = '14' then
        Monta_B14
      else
      if mNotaDevolvidaNFeTipo.AsString = '20j' then
        Monta_B20j
      else
      if mNotaDevolvidaNFeTipo.AsString = '20a' then
        Monta_B20a;
      mNotaDevolvidaNFe.Next;
    end;
  //end;

  //if DM1.tNotaFiscalRef.IsEmpty then
    //exit;

  {DM1.tNotaFiscalRef.First;
  while not DM1.tNotaFiscalRef.Eof do
    begin
      if DM1.tNotaFiscalRefTipo.AsString = '13' then
        Monta_B13
      else
      if DM1.tNotaFiscalRefTipo.AsString = '14' then
        Monta_B14
      else
      if DM1.tNotaFiscalRefTipo.AsString = '20j' then
        Monta_B20j;
      DM1.tNotaFiscalRef.Next;
    end;}
end;

procedure TfNFe.Envia_Mail(Email, Assunto, TextoLinha1: String);
begin
  //27/08/2009
  if Email = '' then
    exit;

  try
    RzSendMessage1.ClearLists;
    RzSendMessage1.ToRecipients.Add(Email);
    if vEmailTransp <> '' then
      RzSendMessage1.ToRecipients.Add(vEmailTransp);
    if Trim(DM1.tClienteEmailNFe2.AsString) <> '' then
      RzSendMessage1.ToRecipients.Add(DM1.tClienteEmailNFe2.AsString);

    //16/05/2012
    DMNFeFB.cdsNFE_EMAIL.First;
    while not DMNFeFB.cdsNFE_EMAIL.Eof do
    begin
      RzSendMessage1.BccRecipients.Add(DMNFeFB.cdsNFE_EMAILEMAIL.AsString);
      DMNFeFB.cdsNFE_EMAIL.Next;
    end;
    //************

    RzSendMessage1.Attachments.Add(ExpandFileName(vNomeArquivo));
    if (ckAnexarDanfe.Checked) and (vNomeArqPdf <> '') then
      RzSendMessage1.Attachments.Add(ExpandFileName(vNomeArqPdf));
    RzSendMessage1.Subject := Assunto;
    RzSendMessage1.MessageText.Add(TextoLinha1);
    RzSendMessage1.MessageText.Add('');

    if ComboBox1.ItemIndex = 1 then
      RzSendMessage1.MessageText.Add('NOTA EM CONTINGENCIA FS   Impressa em formulário de seguranca')
    else
    if ComboBox1.ItemIndex = 2 then
      RzSendMessage1.MessageText.Add('NOTA EM CONTINGENCIA SCAN')
    else
    if ComboBox1.ItemIndex = 3 then
      RzSendMessage1.MessageText.Add('NOTA EM CONTINGENCIA FS-DA   Impressa em formulário de seguranca');
    //**************

    RzSendMessage1.MessageText.Add('');
    
    RzSendMessage1.MessageText.Add(DM1.tFilialEmpresa.AsString);
    RzSendMessage1.MessageText.Add(DM1.tFilialCNPJ.AsString);
    RzSendMessage1.MessageText.Add(DM1.tFilialEndereco.AsString + ', ' + DM1.tFilialNumEnd.AsString);
    if DM1.tCidade.Locate('Codigo',DM1.tFilialCodCidade.AsInteger,[loCaseInsensitive]) then
      RzSendMessage1.MessageText.Add(DM1.tCidadeNome.AsString + ' - ' + DM1.tCidadeEstado.AsString);
    RzSendMessage1.MessageText.Add('Fone: ' + DM1.tFilialTel.AsString);
    RzSendMessage1.Send;
  except
     ShowMessage('Problema no envio, e-mail não enviado!');
  end;

end;

procedure TfNFe.Habilita_Botoes;
begin
  if Tag = 1 then //Inutilizar
  begin
    btInutilizar.Enabled   := True;
    btEnviar.Enabled       := False;
    btCancelar.Enabled     := False;
    btDanfe.Enabled        := False;
    btContingencia.Enabled := False;
    btCCe.Enabled          := False;
  end
  else
  if Tag = 2 then //Cancelar
  begin
    btCancelar.Enabled     := ((DM1.tNotaFiscalNFeChaveAcesso.AsString <> '')
                              and (DM1.tNotaFiscalNFeProtocoloCancelada.AsString = '')
                              and (vConexao));
    btEnviar.Enabled       := False;
    btContingencia.Enabled := False;
  end
  else
  //16/05/2012
  if Tag = 5 then //Carta Correção
  begin
    btCCe.Enabled     := ((DM1.tNotaFiscalNFeChaveAcesso.AsString <> '')
                         and (DM1.tNotaFiscalNFeProtocoloCancelada.AsString = '')
                         and (vConexao));
    btEnviar.Enabled       := False;
    btContingencia.Enabled := False;
  end
  else
  begin
  if (ComboBox1.ItemIndex = 1) or (ComboBox1.ItemIndex = 3) then
  begin
    btEnviar.Enabled   := ((DM1.tNotaFiscalNFeProtocolo.AsString = '') and
                           (DM1.tNotaFiscalNFeChaveAcesso.AsString <> '') and
                          (vConexao));
    btContingencia.Enabled := (DM1.tNotaFiscalNFeChaveAcesso.AsString = '');  
  end
  else
  begin
    btEnviar.Enabled       := ((DM1.tNotaFiscalNFeChaveAcesso.AsString = '') and
                              (vConexao));
    btContingencia.Enabled := False;
  end;
  end;
  btEnviarNovo.Enabled := btEnviar.Enabled;
end;

function TfNFe.Verifica_ConexaoInternet: Boolean;
begin
  texto    := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
  Result   := ConectadoInternet(DM1.tParametrosLocalServidorNFe.AsString,texto);
end;

function TfNFe.Monta_Diretorio(Tipo, Diretorio: string): string;
var
  vSerieAux: String;
  vAnoMes: String;
  i: Integer;
begin
  if Tipo = 'C' then
    vAnoMes := FormatFloat('0000',YearOf(DMNFeFB.cdsNotaFiscal_NFeDTCADASTRO.AsDateTime)) + FormatFloat('00',MonthOf(DMNFeFB.cdsNotaFiscal_NFeDTCADASTRO.AsDateTime))
  else
    vAnoMes := FormatFloat('0000',YearOf(DM1.tNotaFiscalDtEmissao.AsDateTime)) + FormatFloat('00',MonthOf(DM1.tNotaFiscalDtEmissao.AsDateTime));
  vSerieAux := DM1.tNotaFiscalSerie.AsString;
  for i := 1 to 3 - Length(vSerieAux) do
    vSerieAux := '0' + vSerieAux;
  Result := '';
  if Diretorio = '' then
    Raise Exception.Create('É obrigatório informar o diretório para salvar o arquivo!');
  if copy(Diretorio,Length(Diretorio),1) <> '\' then
    Diretorio := Diretorio + '\';

  if not DirectoryExists(Diretorio) then
  begin
    ShowMessage('Pasta não ' + Diretorio + ' existe!');
    exit;
  end;
  if Tipo = 'T' then
    Result := Diretorio + 'NFe_' + FormatFloat('00',DM1.tNotaFiscalFilial.AsFloat) + '_S' + vSerieAux + '_' + FormatFloat('000000',DM1.tNotaFiscalNumNota.AsInteger) + '.txt'
  else
  if Tipo = 'P' then
  begin
    Result := Diretorio + vAnoMes; 
    CreateDir(Result);
    Result := Result + '\NFe_' + FormatFloat('00',DM1.tNotaFiscalFilial.AsFloat) + '_S' + vSerieAux + '_' + FormatFloat('000000',DM1.tNotaFiscalNumNota.AsInteger) + '.pdf';
  end
  else
  if Tipo = 'I'then
  begin
    Result := Diretorio + 'Inutilizadas';
    CreateDir(Result);
    Result := Result + '\NFe_' + FormatFloat('00',DM1.tFilialCodigo.AsFloat) + '_' +  DMNFe.tNFeInutilizacaoNumNotaIni.AsString + '_a_' + DMNFe.tNFeInutilizacaoNumNotaFin.AsString + '_';
  end
  else
  if Tipo = 'C'then
  begin
    Result := Diretorio + 'CCe';
    CreateDir(Result);
    Result := Diretorio + 'CCe\' + vAnoMes;
    CreateDir(Result);
    Result := Result + '\CCe_' + FormatFloat('00',DM1.tFilialCodigo.AsFloat) + '_S' + vSerieAux + '_'+ FormatFloat('000000',DM1.tNotaFiscalNumNota.AsInteger) + '_Seq' + FormatFloat('00',DMNFeFB.cdsNotaFiscal_NFeITEMTIPO.AsInteger) + '_';
  end
  else
  begin
    Result := Diretorio + vAnoMes;
    CreateDir(Result);
    //Result := Diretorio + 'NFe_' + FormatFloat('00',DM1.tNotaFiscalFilial.AsFloat) + '_' + DM1.tNotaFiscalNumNota.AsString;
    Result := Result + '\NFe_' + FormatFloat('00',DM1.tNotaFiscalFilial.AsFloat) + '_S' + vSerieAux + '_' + FormatFloat('000000',DM1.tNotaFiscalNumNota.AsInteger);
  end;
end;

function TfNFe.TirarAcento(Texto: String): String;
var
  i: Integer;
begin
  texto := UpperCase(texto);
  for i := 1 to Length(texto) do
    begin
      if (Texto[i] = 'Á') or
         (Texto[i] = 'À') or
         (Texto[i] = 'Â') or
         (Texto[i] = 'Ä') or
         (Texto[i] = 'Ã') then
        Texto[i] := 'A'
      else
      if (Texto[i] = 'É') or
         (Texto[i] = 'È') or
         (Texto[i] = 'Ê') or
         (Texto[i] = 'Ë') then
        Texto[i] := 'E'
      else
      if (Texto[i] = 'Í') or
         (Texto[i] = 'Ì') or
         (Texto[i] = 'Î') or
         (Texto[i] = 'Ï') then
        Texto[i] := 'I'
      else
      if (Texto[i] = 'Ó') or
         (Texto[i] = 'Ò') or
         (Texto[i] = 'Ô') or
         (Texto[i] = 'Ö') or
         (Texto[i] = 'Õ') then
        Texto[i] := 'O'
      else
      if (Texto[i] = 'Ú') or
         (Texto[i] = 'Ù') or
         (Texto[i] = 'Û') or
         (Texto[i] = 'Ü') then
        Texto[i] := 'U'
      else
      if (Texto[i] = 'Ç') then
        Texto[i] := 'C'
      else
      if (Texto[i] = 'Ñ') then
        Texto[i] := 'N'
      else
      if (Texto[i] = '&') then
        Texto[i] := 'e';
    end;
  Result := AnsiUpperCase(Texto);
end;

function TfNFe.Replace(Str, Ant, Novo: string): string;
var
  iPos: Integer;
begin
  while Pos(Ant, Str) > 0 do
  begin
    iPos := Pos(Ant, Str);
    Str := copy(Str, 1, iPos - 1) + Novo + copy(Str, iPos + 1, Length(Str) - iPos);
  end;
  Result := Str;
end;

procedure TfNFe.GerarNFeTXT(AStrings: TStrings);
var
  vVlrOutrasDespAcess: Real;
  vAux: Real;
begin
  AStrings.Clear;

  Monta_Cabecalho;

  mItensNFe.First;
  while not mItensNFe.Eof do
    begin
      Monta_Detalhe;
      mItensNFe.Next;
    end;

//Letra U - ISS - Informar os campos para cálculo do ISSQN nas NFe conjugadas, onde há a prestação de serviços sujeitos ao ISSQN e fornecimento de peças sujeitas ao ICMS

//Letra W - Totais - Grupo de Valores Totais referentes ao ICMS
  vVlrOutrasDespAcess := DM1.tNotaFiscalOutrasDesp.AsFloat;
  if DM1.tNotaFiscalPisCofinsSomarOutrasDesp.AsBoolean then
    vVlrOutrasDespAcess := vVlrOutrasDespAcess - DM1.tNotaFiscalVlrPis.AsFloat -
                           DM1.tNotaFiscalVlrCofins.AsFloat;

  Texto := 'W|';
  vTextoEnvio.Add(Texto);

//Letra W02 - Base de Cálculo do ICMS
  Texto := 'W02|' + Replace(FormatFloat('0.00',DM1.tNotaFiscalBaseIcms.AsFloat),',','.') + '|';
//Valor Total do ICMS
  Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrIcms.AsFloat),',','.') + '|';
//Base de Cálculo do ICMS ST
  //Incluida esta linha dia 12/07/2010
  Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalICMSBaseSubst.AsFloat),',','.') + '|';

//Valor Total do ICMS ST
  //Incluida esta linha dia 12/07/2010
  Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalICMSVlrSubst.AsFloat),',','.') + '|';

//Valor Total dos produtos e serviços
  vAux := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalItens.AsFloat + DM1.tNotaFiscalVlrTotalDesc.AsFloat));
  //Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalItens.AsFloat),',','.') + '|';
  Texto := Texto + Replace(FormatFloat('0.00',vAux),',','.') + '|';
//Valor Total do Frete
  Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrFrete.AsFloat),',','.') + '|';
//Valor Total do Seguro
  Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrSeguro.AsFloat),',','.') + '|';
//Valor Total do Desconto
  Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDesc.AsFloat),',','.') + '|';
//Valor Total do II
  ///Texto := Texto + '0.00|';
  //05/12/2011
  Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrImpImportacao.AsFloat),',','.') + '|';
     
//Valor Total do IPI
  Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrIpi.AsFloat),',','.') + '|';
//Valor do PIS
  Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrPis.AsFloat),',','.') + '|';
//Valor do COFINS
  Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrCofins.AsFloat),',','.') + '|';
//Outras Despesas acessórias
  //Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalOutrasDesp.AsFloat),',','.') + '|';
  Texto := Texto + Replace(FormatFloat('0.00',vVlrOutrasDespAcess),',','.') + '|';
//Valor Total da NF-e
  Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat),',','.') + '|';
  //Lei 12.741/12
//Valor Tributos Lei 12.741/12
  Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalVlr_Tributo.AsFloat),',','.') + '|';

  vTextoEnvio.Add(Texto);

//Grupo de valores totais referentes ao ISSQN
//W17

//Grupo de retenções de tributos
//W23

//Letra X - Transporte
  Texto := 'X|';
//Modalidade do frete; 0 - por conta do emitente;  1 - por conta do destinatário
                    // 2 - Por conta de terceiros; 9 - Sem Frete
  if DM1.tNotaFiscalEmitDest.AsString = '1' then
    Texto := Texto + '0|'
  else
  if DM1.tNotaFiscalEmitDest.AsString = '2' then
    Texto := Texto + '1|'
  else
  if DM1.tNotaFiscalEmitDest.AsString = '3' then
    Texto := Texto + '2|'
  else
  if DM1.tNotaFiscalEmitDest.AsString = '9' then
    Texto := Texto + '9|'
  else
    Texto := Texto + '|';

  vTextoEnvio.Add(Texto);

//Letra X03 - Transportador
  if DM1.tNotaFiscalCodTransp.AsInteger > 0 then
    Monta_X03;

//Letra X26 - Volumes
  if (DM1.tNotaFiscalQtd.AsInteger > 0) or (trim(DM1.tNotaFiscalEspecie.AsString) <> '') or
     (trim(DM1.tNotaFiscalMarca.AsString) <> '') or (trim(DM1.tNotaFiscalNumero.AsString) <> '') or
     (StrToFloat(FormatFloat('0.000',DM1.tNotaFiscalPesoBruto.AsFloat)) > 0) or (StrToFloat(FormatFloat('0.000',DM1.tNotaFiscalPesoLiquido.AsFloat)) > 0) then
  begin
    Texto := 'X26|';
    Texto := Texto + DM1.tNotaFiscalQtd.AsString + '|';

    //Espécie dos volumes transportados
    Texto := Texto + TirarAcento(DM1.tNotaFiscalEspecie.AsString) + '|';

    //Marca dos volumes transportados
    Texto := Texto + TirarAcento(DM1.tNotaFiscalMarca.AsString) + '|';

    //Numeração dos volumes transportados
    Texto := Texto + DM1.tNotaFiscalNumero.AsString + '|';

    //Peso Líquido (em kg)
    Texto := Texto + Replace(FormatFloat('0.000',DM1.tNotaFiscalPesoLiquido.AsFloat),',','.') + '|';

    //Peso Bruto (em kg)
    Texto := Texto + Replace(FormatFloat('0.000',DM1.tNotaFiscalPesoBruto.AsFloat),',','.') + '|';
    vTextoEnvio.Add(Texto);
  end;

//Lacre
  Monta_X33;

//Letra Y - Cobrança
  if DM1.tNotaFiscalCondPgto.AsString <> 'N' then
    Le_Parcelas;

//Informações Adicionais
//Informações Adicionais de Interesse do Fisco
//Informações Complementares de Interesse do Contribuinte

  Texto := 'Z||';
  mDadosAdicionaisNFe.First;
  Texto := Texto + TirarAcento(mDadosAdicionaisNFeObs.Value) + '|';
  vTextoEnvio.Add(Texto);

//Informação de Exportação
  if DM1.tNotaFiscalUFEmbExp.AsString <> '' then
  begin
    Texto := 'ZA|' + DM1.tNotaFiscalUFEmbExp.AsString + '|' + DM1.tNotaFiscalLocalEmbExp.AsString + '|';
    vTextoEnvio.Add(Texto);
  end;

  AStrings.Text := vTextoEnvio.Text;

end;

procedure TfNFe.Le_Parcelas;
begin
//Cobrança
  Texto := 'Y|';
  vTextoEnvio.Add(Texto);

  if DM1.tNotaFiscalCondPgto.AsString = 'V' then
    Monta_Y07(DM1.tNotaFiscalDtEmissao.AsDateTime,DM1.tNotaFiscalVlrTotalDupl.AsFloat,1)
  else
  begin
    if StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalEntrada.AsFloat)) > 0 then
      Monta_Y07(DM1.tNotaFiscalDtEntr.AsDateTime,DM1.tNotaFiscalEntrada.AsFloat,0);
    DM1.tNotaFiscalParc.First;
    while not DM1.tNotaFiscalParc.Eof do
    begin
      Monta_Y07(DM1.tNotaFiscalParcDtVenc.AsDateTime,DM1.tNotaFiscalParcVlrVenc.AsFloat,DM1.tNotaFiscalParcParcela.AsInteger);
      DM1.tNotaFiscalParc.Next;
    end;
  end;
end;

procedure TfNFe.Monta_Y07(Data: TDateTime; Valor: Real; Parcela: Integer);
begin
//Duplicata
  if Parcela < 1 then
    Texto := 'Y07|' + DM1.tNotaFiscalNumNota.AsString + '/' + IntToStr(Parcela) + 'ENT' + '|'
  else
    Texto := 'Y07|' + DM1.tNotaFiscalNumNota.AsString + '/' + IntToStr(Parcela) + '|';
  Texto := Texto + FormatFloat('0000',YearOf(Data)) + '-' +
                   FormatFloat('00',MonthOf(Data)) + '-' +
                   FormatFloat('00',DayOf(Data)) + '|';
  Texto := Texto + Replace(FormatFloat('0.00',Valor),',','.') + '|';
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_O;
begin
  if trim(mItensNFeCodCSTIPI.AsString) = '' then
    exit;
  Texto := 'O|||||999|';
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_O08;
begin
//Código da situação tributária do IPI
  Texto := 'O08|' + mItensNFeCodCSTIPI.AsString + '|';
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_O07;
begin
//IPI Tributável
//Código da situação tributária do IPI
  Texto := 'O07|' + vCodCSTIPI+'|';

//Valor do IPI
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrIpi.AsFloat),',','.') + '|';
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_O10;
begin
//Valor da BC do IPI
  Texto := 'O10|' +  Replace(FormatFloat('0.00',mItensNFeVlrTotal.AsFloat),',','.') + '|';

//Aliquota do IPI
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqIpi.AsFloat),',','.') + '|';
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_P;
begin
  Texto := 'P|' +  Replace(FormatFloat('0.00',mItensNFeVlrBaseImportacao.AsFloat),',','.') + '|';

  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrDespAduaneira.AsFloat),',','.') + '|';

  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrImportacao.AsFloat),',','.') + '|';

  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrIOF.AsFloat),',','.') + '|';

  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_N10;
begin
//CST – 90 - Outros
//Origem da mercadoria - 0 – Nacional; 1 – Estrangeira – Importação direta; 2 – Estrangeira – Adquirida no mercado interno.
  Texto := 'N10|' + vOrigem +'|';

//Tributação do ICMS
  Texto := Texto + vCodSitTrib +'|';

//Modadelidade de determinação
  Texto := Texto + '0|';

//Valor da BC do ICMS
//  if DM1.tNotaFiscalVersaoNFe.AsString = '2.00' then
 //   Texto := Texto + Replace(FormatFloat('0.00',mItensNFeBaseICMS.AsFloat),',','.') + '|'
  //else
    //Percentual da redução de BC
    if StrToFloat(FormatFloat('0.00',mItensNFePercRedICMS.AsFloat)) = 100 then
      Texto := Texto + Replace(FormatFloat('0.00',0),',','.') + '|'
    else
      Texto := Texto + Replace(FormatFloat('0.00',mItensNFePercRedICMS.AsFloat),',','.') + '|';

//Percentual da redução de BC
  //if DM1.tNotaFiscalVersaoNFe.AsString = '2.00' then
  //  Texto := Texto + Replace(FormatFloat('0.00',mItensNFePercRedICMS.AsFloat),',','.') + '|'
  //else
    //Valor da BC do ICMS
    Texto := Texto + Replace(FormatFloat('0.00',mItensNFeBaseICMS.AsFloat),',','.') + '|';

//Aliquota do imposto
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqIcms.AsFloat),',','.') + '|';

//Valor do icms
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrIcms.AsFloat),',','.') + '|';

//Modalidade de determinação da BC do ICMS ST
  Texto := Texto + '0|';

//Percentual da margem de valor adicionado do ICMS ST
  Texto := Texto + '|';

//Percentual da redução da BC do ICMS ST
  Texto := Texto + '|';

//valor da BC do ICMS ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeIcmsBaseSubst.AsFloat),',','.') + '|';

//Aliquota do imposto do ICMS ST
  //Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqSitTrib.AsFloat),',','.') + '|';
  Texto := Texto + Replace(FormatFloat('0.00',0),',','.') + '|';

//Valor do icms do ICMS ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeIcmsVlrSubst.AsFloat),',','.') + '|';

  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_N10c;
begin
//pelo simples nacional
//Situação tributária 101 com permissão de crédito
//Origem da mercadoria - 0 – Nacional; 1 – Estrangeira – Importação direta; 2 – Estrangeira – Adquirida no mercado interno.
  Texto := 'N10c|' + vOrigem +'|';

//Situação tributária
  Texto := Texto + vCodSitTrib + '|';

//Aliquota aplicável de cálculo do crédito (simples nacional)
  Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalPercIcmsSimples.AsFloat),',','.') + '|';

//Valor crédito do ICMS que pode ser aproveitado nos termos do art. 23 ds LC 123
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrIcmsSimples.AsFloat),',','.') + '|';

  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_N10d;
begin
//pelo simples nacional
//Situação tributária 102, 103, 300 ou 400
//Origem da mercadoria - 0 – Nacional; 1 – Estrangeira – Importação direta; 2 – Estrangeira – Adquirida no mercado interno.
  Texto := 'N10d|' + vOrigem +'|';

//Situação tributária
  Texto := Texto + vCodSitTrib + '|';

  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_N10e;
begin
//pelo simples nacional
//Situação tributária 201
//Origem da mercadoria - 0 – Nacional; 1 – Estrangeira – Importação direta; 2 – Estrangeira – Adquirida no mercado interno.
  Texto := 'N10e|' + vOrigem +'|';

//Situação tributária
  Texto := Texto + vCodSitTrib + '|';

//Modalidade de determinação da BC do ICMS ST
  Texto := Texto + '4|';

//Percentual da margem de valor adicionado do ICMS ST
  Texto := Texto + '|';

//Percentual da redução da BC do ICMS ST, OPCIONAL
  Texto := Texto + '|';

//Valor da BC do ICMS ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeIcmsBaseSubst.AsFloat) ,',','.') + '|';

//Aliquota do Imposto de ICMS ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqSitTrib.AsFloat) ,',','.') + '|';

//Valor do ICMS ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeIcmsVlrSubst.AsFloat) ,',','.') + '|';

//Alíquota aplicável de cálculo do crédito (simples nacional)
  Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalPercIcmsSimples.AsFloat) ,',','.') + '|';

//Valor crédito do icms que pode ser aproveitado nos termos do art. 23 da LC 123 (simples nacional)
  Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalPercIcmsSimples.AsFloat) ,',','.') + '|';

  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_N10f;
begin
//pelo simples nacional
//Situação tributária 202 e 203
//Origem da mercadoria - 0 – Nacional; 1 – Estrangeira – Importação direta; 2 – Estrangeira – Adquirida no mercado interno.
  Texto := 'N10f|' + vOrigem +'|';

//Situação tributária
  Texto := Texto + vCodSitTrib + '|';

//Modalidade de determinação da BC do ICMS ST
  Texto := Texto + '4|';

//Percentual da margem de valor adicionado do ICMS ST
  Texto := Texto + '|';

//Percentual da redução da BC do ICMS ST
  Texto := Texto + '|';

//Valor da BC do ICMS ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeIcmsBaseSubst.AsFloat) ,',','.') + '|';

//Aliquota do Imposto de ICMS ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqSitTrib.AsFloat) ,',','.') + '|';

//Valor do ICMS ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeIcmsVlrSubst.AsFloat) ,',','.') + '|';

  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_N10g;
begin
//pelo simples nacional
//Situação tributária 500
//Origem da mercadoria - 0 – Nacional; 1 – Estrangeira – Importação direta; 2 – Estrangeira – Adquirida no mercado interno.
  Texto := 'N10g|' + vOrigem +'|';

//Situação tributária
  Texto := Texto + vCodSitTrib + '|';

//Valor do BC do ICMS ST cobrado anteriormente por ST
  //Texto := Texto + '|';
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeIcmsBaseSubst.AsFloat) ,',','.') + '|';

//Valor do ICMS ST cobrado anteriormente por ST
  //Texto := Texto + '|';
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeIcmsVlrSubst.AsFloat) ,',','.') + '|';

  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_N10h;
begin
//pelo simples nacional
//Situação tributária 900
//Origem da mercadoria - 0 – Nacional; 1 – Estrangeira – Importação direta; 2 – Estrangeira – Adquirida no mercado interno.
  Texto := 'N10h|' + vOrigem +'|';

//Tributação pelo ICMS 90 - Outros
  Texto := Texto + vCodSitTrib + '|';

//Modalidade de determinação da BC do ICMS
  Texto := Texto + '3|';

//Percentual da redução
  if StrToFloat(FormatFloat('0.00',mItensNFePercRedICMS.AsFloat)) = 100 then
    Texto := Texto + Replace(FormatFloat('0.00',0),',','.') + '|'
  else
    Texto := Texto + Replace(FormatFloat('0.00',mItensNFePercRedICMS.AsFloat),',','.') + '|';

//Valor da BC do ICMS
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeBaseICMS.AsFloat),',','.') + '|';

//Aliquota do Icms
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqIcms.AsFloat),',','.') + '|';

//Valor do Icms
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrIcms.AsFloat),',','.') + '|';

//Modalidade de determinaçãio da BC do ICMS ST
  Texto := Texto + '4|';

//Percentual da margem de valor adicionado do Icms ST
  Texto := Texto + '|';

//Percentual da redução de BC do Icms ST
  Texto := Texto + '|';

//Valor da BC do Icms ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeIcmsBaseSubst.AsFloat) ,',','.') + '|';

//Aliquota do Imposto de ICMS ST
  //Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqSitTrib.AsFloat) ,',','.') + '|';
  Texto := Texto + '0|';

//Valor do ICMS ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeIcmsVlrSubst.AsFloat) ,',','.') + '|';

//Alíquota aplicável de cálculo do crédito (Simples Nacional)
  Texto := Texto + Replace(FormatFloat('0.00',DM1.tNotaFiscalPercIcmsSimples.AsFloat) ,',','.') + '|';

//Valor do crédito do Icms que pode ser aproveitado nos termos do art. 23 da LC 123 (Simples Nacional)
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrIcmsSimples.AsFloat) ,',','.') + '|';

  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_N07;
begin
//CST – 51 - Diferimento - A exigência do preenchimento das informações do ICMS diferido fica a critério de cada UF
//Origem da mercadoria - 0 – Nacional; 1 – Estrangeira – Importação direta; 2 – Estrangeira – Adquirida no mercado interno.
  Texto := 'N07|' + vOrigem +'|';

//Tributação do ICMS
  Texto := Texto + vCodSitTrib +'|';

//Modadelidade de determinação
  Texto := Texto + '0|';

//Percentual da redução de BC
  if StrToFloat(FormatFloat('0.00',mItensNFePercRedICMS.AsFloat)) = 100 then
    Texto := Texto + Replace(FormatFloat('0.00',0),',','.') + '|'
  else
    Texto := Texto + Replace(FormatFloat('0.00',mItensNFePercRedICMS.AsFloat),',','.') + '|';

//Valor da BC do ICMS
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeBaseICMS.AsFloat),',','.') + '|';

//Aliquota do imposto
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqIcms.AsFloat),',','.') + '|';

//Valor do icms
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrIcms.AsFloat),',','.') + '|';
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_N06;
begin
//CST – 40 - Isenta, 41 - Não Tributada e 50 - Suspensão
//Origem da mercadoria - 0 – Nacional; 1 – Estrangeira – Importação direta; 2 – Estrangeira – Adquirida no mercado interno.
  Texto := 'N06|' + vOrigem +'|';

//Tributação do ICMS
  Texto := Texto + vCodSitTrib +'|';

//Vlr. Icms
  Texto := Texto + '0|';

//Motivo da desoneração do Icms
  Texto := Texto + '|';

  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_N04;
begin
//CST – 20 - com redução de base de cálculo
//Origem da mercadoria - 0 – Nacional; 1 – Estrangeira – Importação direta; 2 – Estrangeira – Adquirida no mercado interno.
  Texto := 'N04|' + vOrigem +'|';

//Tributação do ICMS
  Texto := Texto + vCodSitTrib +'|';

//Modadelidade de determinação
  Texto := Texto + '0|';

//Percentual da redução de BC
  if StrToFloat(FormatFloat('0.00',mItensNFePercRedICMS.AsFloat)) = 100 then
    Texto := Texto + Replace(FormatFloat('0.00',0) ,',','.') + '|'
  else
    Texto := Texto + Replace(FormatFloat('0.00',mItensNFePercRedICMS.AsFloat) ,',','.') + '|';

//Valor da BC do ICMS
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeBaseICMS.AsFloat) ,',','.') + '|';

//Aliquota do imposto
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqIcms.AsFloat) ,',','.') + '|';

//Valor do icms
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrIcms.AsFloat) ,',','.') + '|';
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_N02;
begin
//CST – 00 - Tributada Integralmente
//Origem da mercadoria - 0 – Nacional; 1 – Estrangeira – Importação direta; 2 – Estrangeira – Adquirida no mercado interno.
  Texto := 'N02|' + vOrigem +'|';

//Tributação do ICMS
  Texto := Texto + vCodSitTrib +'|';

//Modadelidade de determinação
  Texto := Texto + '0|';

//Valor da BC do ICMS
  if (StrToFloat(FormatFloat('0.00',mItensNFeBaseICMS.AsFloat)) > 0) and (StrToFloat(FormatFloat('0.00',mItensNFeAliqIcms.AsFloat)) > 0) then
    Texto := Texto + Replace(FormatFloat('0.00',mItensNFeBaseICMS.AsFloat) ,',','.') + '|'
  else
  if mItensNFeAliqIcms.AsFloat > 0 then
    Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrTotal.AsFloat) ,',','.') + '|'
  else
    Texto := Texto + Replace(FormatFloat('0.00',0) ,',','.') + '|';

//Aliquota do imposto
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqIcms.AsFloat) ,',','.') + '|';

//Valor do icms
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrIcms.AsFloat) ,',','.') + '|';
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_N03;
begin
//CST – 10 - Tributada e com cobrança do ICMS por substituição tributária
//Origem da mercadoria - 0 – Nacional; 1 – Estrangeira – Importação direta; 2 – Estrangeira – Adquirida no mercado interno.
  Texto := 'N03|' + copy(mItensNFeCodSitTrib.AsString,1,1) +'|';

//Tributação do ICMS
  Texto := Texto + copy(mItensNFeCodSitTrib.AsString,2,2) +'|';

//Modadelidade de determinação
  Texto := Texto + '0|';

//Valor da BC do ICMS
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeBaseICMS.AsFloat) ,',','.') + '|';

//Aliquota do imposto
  if (DM1.tFilialSimples.AsBoolean) or (DM1.tFilialSimplesGaucho.AsBoolean) then
    Texto := Texto + Replace(FormatFloat('0.00',0) ,',','.') + '|'
  else
    Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqIcms.AsFloat) ,',','.') + '|';

//Valor do icms
  if (DM1.tFilialSimples.AsBoolean) or (DM1.tFilialSimplesGaucho.AsBoolean) then
    Texto := Texto + Replace(FormatFloat('0.00',0) ,',','.') + '|'
  else
    Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrIcms.AsFloat) ,',','.') + '|';

//Modalidade de determinação da BC do ICMS ST
  Texto := Texto + '4|';

//Percentual da Margem de Valor Agregado do ICMS ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeMVA.AsFloat) ,',','.') + '|';

//Percentual da Redução de BC do ICMS ST
  if StrToFloat(FormatFloat('0.00',mItensNFePercRedICMS.AsFloat)) = 100 then
    Texto := Texto + Replace(FormatFloat('0.00',0) ,',','.') + '|'
  else
    Texto := Texto + Replace(FormatFloat('0.00',mItensNFePercRedICMS.AsFloat) ,',','.') + '|';

//Valor da BC do ICMS ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeIcmsBaseSubst.AsFloat) ,',','.') + '|';

//Alíquota do imposto do ICMS ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqIcms.AsFloat) ,',','.') + '|';

//Valor do ICMS ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeIcmsVlrSubst.AsFloat) ,',','.') + '|';

  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_Detalhe;
begin
//Letra H - Detalhamento de produtos e serviços - Nº do Item
  Texto := 'H|' + mItensNFeItemNota.AsString + '|';

//Informações complementares do produto
  Texto := Texto + TirarAcento(Copy(mItensNFeInfAdicionais.Value,1,500)) + '|';
  vTextoEnvio.Add(Texto);

//Letra I - Cód. do Produto
  Texto := 'I|' + mItensNFeCodProduto.AsString + '|';
//GTIN (Global Trade Item Number) do produto, antigo código EAN ou código de barras
  //29/07/2011
  Texto := Texto + Trim(mItensNFeCodBarra.AsString) + '|';

//Descrição do produto
  Texto := Texto + TirarAcento(mItensNFeNomeProduto.AsString) + '|';

//Código NCM (Opcional)
  if (mItensNFeClasFiscal.AsString = '') and (Copy(fNFe.mItensNFeCodProduto.AsString,1,4) = 'CFOP' ) then
    Texto := Texto + '00|'
  else
    Texto := Texto + Replace(mItensNFeClasFiscal.AsString,'.','') + '|';

//EX_TIPI (Opcional)
  Texto := Texto + '|';

//Gênero do Produto ou Serviço
  if DM1.tNotaFiscalVersaoNFe.AsString <> '2.00' then
    Texto := Texto + '|';

//Cód. Nat. Oper.
  Texto := Texto + mItensNFeCodNatOper.AsString + '|';

// Unidade de Medida
  Texto := Texto + mItensNFeUnidade.AsString + '|';

//Quantidade Comercial
  Texto := Texto + Replace(FormatFloat('0.0000',mItensNFeQtd.AsFloat) ,',','.') + '|';

//Valor Unitário de comercialização
  Texto := Texto + Replace(FormatFloat('0.0000000000',mItensNFeVlrUnitario.AsFloat) ,',','.') + '|';

//Valor Total Bruto dos Produtos ou Serviços
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrTotal.AsFloat) ,',','.') + '|';

//GTIN (Global Trade Item Number) da unidade tributável, antigo código EAN ou código de barras
  //29/07/2011
  Texto := Texto + Trim(mItensNFeCodBarra.AsString) + '|';


//Unidade Tributária
  Texto := Texto + mItensNFeUnidade.AsString + '|';

//Quantidade Tributável
  Texto := Texto + Replace(FormatFloat('0.0000',mItensNFeQtd.AsFloat) ,',','.') + '|';

//Valor Unitário de tributação
  Texto := Texto + Replace(FormatFloat('0.0000000000',mItensNFeVlrUnitario.AsFloat) ,',','.') + '|';
                      
//Valor Total do Frete
  //NFe 2.00
  //Texto := Texto + '|';
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrFrete.AsFloat) ,',','.') + '|';

//VALOR DO SEGURO
  //NFe 2.00
  //Texto := Texto + '|';
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrSeguro.AsFloat) ,',','.') + '|';

//VALOR DO DESCONTO
  if mItensNFeVlrDesconto.AsFloat > 0 then
    Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrDesconto.AsFloat) ,',','.') + '|'
  else
    Texto := Texto + '|';

  //NFe 2.0
//Outras despesas e acessórias
  if DM1.tNotaFiscalVersaoNFe.AsString = '2.00' then
  begin
    //Texto := Texto + '|';
    Texto := Texto + Replace(FormatFloat('0.00',mItensNFeVlrOutrasDespesas.AsFloat) ,',','.') + '|';

    //Indica se o valor do item compõe o valor total da nota  0- Não compõe  1- Compõe
    if mItensNFeSomaVlrTotalProd.AsBoolean then
      Texto := Texto + '1|'
    else
      Texto := Texto + '0|';

    //Número do pedido de compra
    if (Trim(mItensNFePedidoCliente.AsString) <> '') and (mItensNFeItemPedido.AsInteger > 0) then
    begin
      Texto := Texto + mItensNFePedidoCliente.AsString + '|';

      //Item do pedido de compra
      Texto := Texto + mItensNFeItemPedido.AsString + '|';
    end
    else
      Texto := Texto + '|' + '|';
  end;

  vTextoEnvio.Add(Texto);

  //Dados da Importação
  if CheckBox2.Checked then
    begin
      DMNotaFiscal.tNotaFiscalImp.First;
      while not DMNotaFiscal.tNotaFiscalImp.Eof do
        begin
          vItemAdicao := 0;
          Monta_I18;
          DMNotaFiscal.tNotaFiscalImpAdicao.First;
          while not DMNotaFiscal.tNotaFiscalImpAdicao.Eof do
            begin
              Monta_I25;
              DMNotaFiscal.tNotaFiscalImpAdicao.Next;
            end;
          DMNotaFiscal.tNotaFiscalImp.Next;
        end;
    end;

//Letra M - Grupo de Tributos incidentes no Produto ou Serviço
  Texto := 'M|';
  //Lei 12.741/12
//Valor Tributos Lei 12.741/12
  Texto := Texto + Replace(FormatFloat('0.00',fNFe.mItensNFeVlrTributos.AsFloat),',','.') + '|';
  vTextoEnvio.Add(Texto);

//Letra N - ICMS //aqui
  //NFe 2.00
  vOrigem := Copy(mItensNFeCodSitTrib.AsString,1,1);
  vCodSitTrib := Copy(mItensNFeCodSitTrib.AsString,2,Length(mItensNFeCodSitTrib.AsString) - 1);

  Texto := 'N|';
  vTextoEnvio.Add(Texto);

  //if Copy(mItensNFeCodSitTrib.AsString,2,2) = '00' then
  if vCodSitTrib = '00' then
    Monta_N02
  else
  if vCodSitTrib = '10' then
    Monta_N03
  else
  //if Copy(mItensNFeCodSitTrib.AsString,2,2) = '20' then
  if vCodSitTrib = '20' then
    Monta_N04
  else
  //if Copy(mItensNFeCodSitTrib.AsString,2,2) = '30' then
  if vCodSitTrib = '30' then
    Monta_N05 //Juca 07/07/2010
  else
  //if (Copy(mItensNFeCodSitTrib.AsString,2,2) = '40') or
  //   (Copy(mItensNFeCodSitTrib.AsString,2,2) = '41') or
  //   (Copy(mItensNFeCodSitTrib.AsString,2,2) = '50') then
  if (vCodSitTrib = '40') or
     (vCodSitTrib = '41') or
     (vCodSitTrib = '50') then
    Monta_N06
  else
  //if Copy(mItensNFeCodSitTrib.AsString,2,2) = '51' then
  if vCodSitTrib = '51' then
    Monta_N07
  else
  //if Copy(mItensNFeCodSitTrib.AsString,2,2) = '60' then
  if vCodSitTrib = '60' then
    Monta_N08
  else
  //if Copy(mItensNFeCodSitTrib.AsString,2,2) = '90' then
  if vCodSitTrib = '90' then
    Monta_N10
  else
  if vCodSitTrib = '101' then
    Monta_N10c
  else
  if (vCodSitTrib = '102') or (vCodSitTrib = '103') or (vCodSitTrib = '300') or (vCodSitTrib = '400') then
    Monta_N10d
  else
  if vCodSitTrib = '201' then
    Monta_N10e
  else
  if (vCodSitTrib = '202') or (vCodSitTrib = '203') then
    Monta_N10f
  else
  if vCodSitTrib = '500' then
    Monta_N10g
  else
  if vCodSitTrib = '900' then
    Monta_N10h;

//Letra O - IPI - Informar apenas quando o item for sujeito ao IPI
//Letra O - IPI Tributável
  //testar
  vCodCSTIPI := mItensNFeCodCSTIPI.AsString;

  Monta_O;
  if ((mItensNFeVlrIpi.AsFloat > 0) and (mItensNFeAliqIpi.AsFloat > 0)) or
     (mItensNFeCodCSTIPI.AsString = '99') or (mItensNFeCodCSTIPI.AsString = '49') or
     (mItensNFeCodCSTIPI.AsString = '50') or (mItensNFeCodCSTIPI.AsString = '00') then
    begin
      Monta_O07;
      Monta_O10;
    end
  //estava comentada, tirei para testar
  else
  if trim(mItensNFeCodCSTIPI.AsString) <> '' then
    Monta_O08;

  //Foi alterado dia 04/04/2014 = A Lotus precisava fazer uma nota de devolução de exportação e não tinha valores nesta Tag
  {if (StrToFloat(FormatFloat('0.00',mItensNFeVlrBaseImportacao.AsFloat)) > 0) or
     (StrToFloat(FormatFloat('0.00',mItensNFeVlrImportacao.AsFloat)) > 0) or
     (StrToFloat(FormatFloat('0.00',mItensNFeVlrDespAduaneira.AsFloat)) > 0) or
     (StrToFloat(FormatFloat('0.00',mItensNFeVlrIOF.AsFloat)) > 0) then
    Monta_P;}
  if copy(mItensNFeCodNatOper.AsString,1,1) = '3' then
    Monta_P;

//Letra Q - PIS - grupo de PIS tributado pela alíquota
  Texto := 'Q|';
  vTextoEnvio.Add(Texto);

//PIS - grupo de PIS tributado pela alíquota - Código de Situação Tributária do PIS
  //NFe 2.00 - Esse if foi alterado 04/03/2011
  vCodPisNFe := mItensNFeCodPis.AsString;
  if (mItensNFeCodPis.AsString = '01') or (mItensNFeCodPis.AsString = '02') then
    Monta_Q02
  else
  if (mItensNFeCodPis.AsString = '03') then
    Monta_Q03
  else
  if (mItensNFeCodPis.AsString = '04') or (mItensNFeCodPis.AsString = '06') or (mItensNFeCodPis.AsString = '07') or
     (mItensNFeCodPis.AsString = '08') or (mItensNFeCodPis.AsString = '09') then
    Monta_Q04
  else
  //if (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrPis.AsFloat)) > 0) or
  //   (mItensNFeCodPis.AsString = '99') then
    Monta_Q05;
  //**********************

//Letra S - COFINS - grupo de COFINS tributado pela alíquota
  Texto := 'S|';
  vTextoEnvio.Add(Texto);

//S02 CST Código de Situação Tributária do COFINS
  //NFe 2.00 - Esse if foi alterado 04/03/2011
  vCodCofinsNFe := mItensNFeCodCofins.AsString;
  if (mItensNFeCodCofins.AsString = '01') or (mItensNFeCodCofins.AsString = '02') then
    Monta_S02
  else
  if (mItensNFeCodCofins.AsString = '03') then
    Monta_S03
  else
  if (mItensNFeCodCofins.AsString = '04') or (mItensNFeCodCofins.AsString = '06') or (mItensNFeCodCofins.AsString = '07') or
     (mItensNFeCodCofins.AsString = '08') or (mItensNFeCodCofins.AsString = '09') then
    Monta_S04
  else
  //if (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrCofins.AsFloat)) > 0) or
  //   (mItensNFeCodCofins.AsString = '99') then
    Monta_S05;
  //*******************
end;

procedure TfNFe.Posiciona_CidadeUF(CodCidade, IDPais: Integer);
begin
  DM1.tCidade.IndexFieldNames := 'Codigo';
  DM1.tCidade.FindKey([CodCidade]);
  DM1.tUF.FindKey([DM1.tCidadeEstado.AsString]);
  //-----------Juca 17/05/2011
  {if not (dm1.tClienteIdPais.AsInteger > 0) then
  begin
    ShowMessage('País do cliente inválido!');
    Exit;
  end;}
  //DM1.tPais.FindKey([DM1.tClienteIdPais.AsInteger]);
  DM1.tPais.FindKey([IDPais]);
end;

procedure TfNFe.Monta_Cabecalho;
var
  Texto2: String;
  i: Integer;
begin
  Texto := 'NOTA FISCAL|1|';
  vTextoEnvio.Add(Texto);

  //Texto := 'A|1.10|NFe|'; // Versão e o literal NFe
  
  //NFe 2.0
  Texto := 'A|' + DM1.tNotaFiscalVersaoNFe.AsString + '|NFe|'; // Versão e o literal NFe
  vTextoEnvio.Add(Texto);

  //Cód. da UF, Nat Oper
  Posiciona_CidadeUF(DM1.tFilialCodCidade.AsInteger,1);
  Texto := '';
  DM1.tNatOperacao.IndexFieldNames := 'Codigo';
  if DM1.tNatOperacao.FindKey([DM1.tNotaFiscalCodNatOper.AsInteger]) then
    Texto := DM1.tNatOperacaoDescricao.AsString;
    
  //NFe 2.0  falta informar o código que compõe a chave de acesso
  //aqui
  Texto := 'B|' + DM1.tUFCodUF.AsString + '||' + Texto + '|';
                                                   
  if DM1.tNotaFiscalCondPgto.AsString = 'P' then
    Texto := Texto + '1|' // A Prazo
  else
  if DM1.tNotaFiscalCondPgto.AsString = 'V' then
    Texto := Texto + '0|' // À Vista
  else
    Texto := Texto + '2|'; // Outros

//Utilizar cód. 55
  Texto := Texto + '55|';

// Série, informar zero para série única
  if DM1.tNotaFiscalSerie.AsString = 'UN' then
    Texto := Texto + '1|'
  else
    Texto := Texto +  DM1.tNotaFiscalSerie.AsString + '|';
//Nº da nota
  Texto := Texto + DM1.tNotaFiscalNumNota.AsString + '|';
//Data emissão
  Texto := Texto + FormatFloat('0000',YearOf(DM1.tNotaFiscalDtEmissao.AsDateTime)) + '-' +
                   FormatFloat('00',MonthOf(DM1.tNotaFiscalDtEmissao.AsDateTime)) + '-' +
                   FormatFloat('00',DayOf(DM1.tNotaFiscalDtEmissao.AsDateTime)) + '|';
//Data de Saída (Opcional)
  if DM1.tNotaFiscalDtSaidaEnt.AsDateTime > 1 then
    Texto := Texto + FormatFloat('0000',YearOf(DM1.tNotaFiscalDtSaidaEnt.AsDateTime)) + '-' +
                     FormatFloat('00',MonthOf(DM1.tNotaFiscalDtSaidaEnt.AsDateTime)) + '-' +
                     FormatFloat('00',DayOf(DM1.tNotaFiscalDtSaidaEnt.AsDateTime)) + '|'
  else
  //NFe 2.00
    Texto := Texto +   '|';
  //Texto := Texto + FormatFloat('0000',YearOf(DM1.tNotaFiscalDtEmissao.AsDateTime)) + '-' +
  //                 FormatFloat('00',MonthOf(DM1.tNotaFiscalDtEmissao.AsDateTime)) + '-' +
  //                 FormatFloat('00',DayOf(DM1.tNotaFiscalDtEmissao.AsDateTime)) + '|';

//Hora da saída ou entrada da mercadoria  NFa 2.00
  if (DM1.tParametrosVersaoNFe.AsString = '2.00') and (DM1.tNotaFiscalHoraSaida.AsDateTime > 0) then
    Texto := Texto + DM1.tNotaFiscalHoraSaida.AsString + '|'
  else
    Texto := Texto + '|';

//Tipo da nota 0 - entrada; 1 - saída
  if DM1.tNotaFiscalSaidaEntrada.AsString = 'S' then
    Texto := Texto +  '1|'
  else
    Texto := Texto +  '0|';
//Cód. da UF (43) + Município (04606)
  Texto := Texto + DM1.tCidadeCodMunicipio.AsString + '|';
//Formato de impressão da DANFE, 1 - Retrato; 2 - Paisagem
  Texto := Texto + '1|';
//Forma de emissão da NF-e, 1 - Normal; 2 - Contigência FS; 3 - Scan; 4-DPEC; 5-Contingência FS-DA
  //NFe 2.00
  if ComboBox1.ItemIndex = 3 then
    i := 5
  else
    i := ComboBox1.ItemIndex + 1;
  //Texto := Texto + IntToStr(ComboBox1.ItemIndex + 1) + '|';
  Texto := Texto + IntToStr(i) + '|';
//Dígito Verificador da Chave de Acesso da NF-e (não obrigatório)
  Texto := Texto + '|';
//Ident. do Ambiente, 1 - Produção; 2 - Homologação
  Texto := Texto + IntToStr(ComboBox2.ItemIndex + 1) + '|';
//Finalidade da emissão, 1 - NF-e Normal; 2 - NF-e Complementar; 3 - NF-e de Ajuste
  Texto := Texto + IntToStr(ComboBox3.ItemIndex + 1) + '|';

//Processo de emissão da NF-e, 0 - Emissão com aplicativo do contribuinte; 1 - emissão de NF-e avulsa pelo Fisco;
// 2 - emissão NF-e avulsa, pelo contribuinte com seu certificado digital, através do site do Fisco;
// 3 - emissão NF-e pelo contribuinte com aplicativo fornecido pelo Fisco
  //Texto := Texto + '3|';
  Texto := Texto + IntToStr(ComboBox4.ItemIndex) + '|';

   //NFe 2.00
// Versão do Processo de emissão da NF-e
  Texto := Texto + DM1.tNotaFiscalIdentVersaoEmissao.AsString + '|';
  if (DM1.tNotaFiscalVersaoNFe.AsString = '2.00') and
     ((Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '2') or (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '3') or (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '5')) then
  begin 
    Texto := Texto + FormatFloat('0000',YearOf(DM1.tNotaFiscalDtContingencia.AsDateTime)) + '-'
                   + FormatFloat('00',MonthOf(DM1.tNotaFiscalDtContingencia.AsDateTime)) + '-'
                   + FormatFloat('00',DayOf(DM1.tNotaFiscalDtContingencia.AsDateTime)) + 'T'
                   + DM1.tNotaFiscalHrContingencia.AsString + '|';

    Texto := Texto + TirarAcento(DM1.tNotaFiscalMotivoContingencia.AsString) + '|';
  end
  else
  if (DM1.tNotaFiscalVersaoNFe.AsString = '2.00') then
    Texto := Texto + '|' + '|';

  vTextoEnvio.Add(Texto);

  //NFe 2.0
//Letra B13 - Notas Referenciadas
//Letra B14 - Notas Referenciadas
  //28/08/2009
  Le_tNotaFiscalRef;

// Letra C - Razão Social ou Nome do emitente + Fantasia não obrigatório
  Texto := 'C|' + TirarAcento(DM1.tFilialEmpresa.AsString) + '| |';
  
//IE - em branco não obrigatório IEST, IM e CNAE
  texto2 := ' ';
  if DM1.tFilialInscMunicipal.AsString <> '' then
    texto2 := Monta_Texto(DM1.tFilialInscMunicipal.AsString,0);
  Texto := Texto +  Monta_Texto(DM1.tFilialInscr.AsString,0) + '| |' + Texto2 + '|';
  texto2 := ' ';
  if DM1.tFilialCNAE.AsString <> '' then
    texto2 := DM1.tFilialCNAE.AsString;
  Texto := Texto + texto2 + '|';

  //NFe 2.00
//Código do Regime Tributário
  if DM1.tNotaFiscalVersaoNFe.AsString = '2.00' then
    Texto := Texto + DM1.tNotaFiscalCodRegimeTrib.AsString + '|';

  vTextoEnvio.Add(Texto);

// Letra C02 - cnpj do emitente
  texto2 := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
  Texto := 'C02|' + Texto2 + '|';
  vTextoEnvio.Add(Texto);  

// Letra C05 - Logradouro
  Texto := 'C05|' + DM1.tFilialEndereco.AsString + '|';

// Nº
  Texto := Texto + DM1.tFilialNumEnd.AsString + '|';

//Complemento não obrigatório
  Texto := Texto + ' |';

//Bairro
  Texto := Texto + DM1.tFilialBairro.AsString + '|';

//Cód. da UF (43) + Município (04606)
  Texto := Texto + DM1.tCidadeCodMunicipio.AsString + '|';

//Nome do município
  Texto := Texto + TirarAcento(DM1.tCidadeNome.AsString) + '|';

//UF
  Texto := Texto + DM1.tCidadeEstado.AsString + '|';
//Cep
  texto2 := Monta_Texto(DM1.tFilialCep.AsString,8);
  Texto :=  Texto + Texto2 + '|';

//Cód. País
  Texto := Texto + DM1.tPaisCodPais.AsString + '|';

//Nome do País
  Texto := Texto + TirarAcento(DM1.tPaisPais.AsString) + '|';

  //NFe 2.00
//Telefone
  Texto := texto + Monta_Texto(DM1.tFilialTel.AsString,13) + '|';
  vTextoEnvio.Add(Texto);

//Letra E - Nome do Destinatário
  if ComboBox2.ItemIndex = 1 then
    Texto := 'E|' + 'NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL|'
  else
    Texto := 'E|' + TirarAcento(DM1.tClienteNome.AsString) + '|';

//IE - Se tiver Inscr. Estadual informar, se não fica ISENTO
  Texto := Texto + Monta_Texto(DM1.tClienteInscrEst.AsString,0) + '|';

//Inscrição na SUFRAMA
  Texto := Texto + ' |';

  //NFe 2.00           
//Email do cliente (pode ser o e-mail de recepção da nfe)
  if DM1.tNotaFiscalVersaoNFe.AsString = '2.00' then
    Texto := Texto + Copy(DM1.tClienteEmailNFe.AsString,1,60) + '|';
  vTextoEnvio.Add(Texto);

//Letra E02 se for CNPJ ou E03 se for CPF
  Posiciona_CidadeUF(DM1.tClienteCodCidade.AsInteger,DM1.tClienteIDPais.AsInteger);
  if DM1.tPaisCodPais.AsString <> '1058' then
    texto := 'E02||'
  else
  if DM1.tClientePessoa.AsString = 'J' then
    texto := 'E02|' + Monta_Texto(DM1.tClienteCgcCpf.AsString,14) + '|'
  else
    texto := 'E03|' + Monta_Texto(DM1.tClienteCgcCpf.AsString,11) + '|';
  vTextoEnvio.Add(Texto);

//Letra E05 - Endereço Destinatário + Número
  Texto := 'E05|' + TirarAcento(DM1.tClienteEndereco.AsString) + '|';
  Texto := Texto +  DM1.tClienteNumEnd.AsString + '|';

//Complemento
  Texto := Texto + TirarAcento(DM1.tClienteComplEndereco.AsString) + '|';

//Bairro
  Texto := Texto + TirarAcento(DM1.tClienteBairro.AsString) + '|';

//Cód. do País (43) + Município (09209)
  if (DM1.tPaisCodPais.AsString = '1058') then
    Texto := Texto + DM1.tCidadeCodMunicipio.AsString + '|'
  else
    Texto := Texto + '9999999|';

//Nome Município
  if (DM1.tPaisCodPais.AsString = '1058') then
    Texto := Texto + TirarAcento(DM1.tCidadeNome.AsString) + '|'
  else
    Texto := Texto + 'EXTERIOR|';

//UF
  //Texto := Texto + 'RS|';
  if (DM1.tPaisCodPais.AsString = '1058') then
    Texto := Texto + DM1.tUFSigla.AsString + '|'
  else
    Texto := Texto + 'EX|';

//Cep
  Texto := Texto + Monta_Texto(DM1.tClienteCep.AsString,8) + '|';

//Cód. País
  Texto := Texto + DM1.tPaisCodPais.AsString + '|';

//Nome do País
  Texto := Texto + TirarAcento(DM1.tPaisPais.AsString) + '|';

//Telefone
  Texto2 := DM1.tClienteDDDFone1.AsString + DM1.tClienteTelefone.AsString;
  Texto  := Texto + Monta_Texto(Texto2,14) + '|';
  vTextoEnvio.Add(Texto);     

//Letra G - Local de entrega - Informar apenas quando for diferente do endereço do destinatário.
  if not DM1.tNotaFiscalLocalEntrega.AsBoolean then
    exit;

  //NFe 2.00  
//CNPJ entrega
  if DM1.tNotaFiscalVersaoNFe.AsString = '2.00' then
    Texto := 'G|'
  else
    Texto := 'G|' + Monta_Texto(DM1.tClienteCgcCpfEntrega.AsString,14) + '|';

//Endereço de entrega
  Texto := Texto + TirarAcento(DM1.tClienteEndEntrega.AsString) + '|';

//Nº Endereço de entrega
  Texto := Texto + DM1.tClienteNumEndEntrega.AsString + '|';

  //NFe 2.00  
//Complemento
  Texto := Texto + TirarAcento(DM1.tClienteComplEnderecoEntrega.AsString) + '|';

//Bairro de endereço de entrega
  Texto := Texto + TirarAcento(DM1.tClienteBairroEntrega.AsString) + '|';

//Código do municipio de entrega
  Posiciona_CidadeUF(DM1.tClienteCodCidadeE.AsInteger,DM1.tClienteIDPais.AsInteger);
  //16/09/2009
  if (DM1.tPaisCodPais.AsString = '1058') then
    Texto := Texto + TirarAcento(DM1.tCidadeCodMunicipio.AsString) + '|'
  else
    Texto := Texto + '9999999|';

//nome do municipio de entrega
  //16/09/2009
  if (DM1.tPaisCodPais.AsString = '1058') then
    Texto := Texto + TirarAcento(DM1.tCidadeNome.AsString) + '|'
  else
    Texto := Texto + 'EXTERIOR|';

//UF do endereço de entrega
  //16/09/2009
  if (DM1.tPaisCodPais.AsString = '1058') then
    Texto := Texto + DM1.tUFSigla.AsString + '|'
  else
    Texto := Texto + 'EX|';
  vTextoEnvio.Add(Texto);

  //NFe 2.00
//CNPJ entrega
  if DM1.tNotaFiscalVersaoNFe.AsString = '2.00' then
  begin
    Texto2 := Monta_Texto(DM1.tClienteCgcCpfEntrega.AsString,14);
    if copy(Texto2,1,3) = '000' then
    begin
      texto2 := Copy(texto2,4,11);
      texto  := 'G02a|' + texto2 + '|';
    end
    else
      texto  := 'G02|' + texto2 + '|';
    vTextoEnvio.Add(Texto);
  end;
end;

procedure TfNFe.Button1Click(Sender: TObject);
var
  Nota: IXMLTNFe;
  Ide: IXMLIde;
  Emit: IXMLEmit;
  Dest: IXMLDest;
  Det: IXMLDet;
  Total: IXMLTotal;
  Transp: IXMLTransp;
begin
  Nota := NewNFe;

(* A *)
  Nota.InfNFe.Versao := '1.10';
  Nota.InfNFe.Id     := 'NFe43090393748523000282550000000069920000069922';

(* B *)
  Ide := Nota.InfNFe.Ide;
  Ide.CUF := '43';
  Ide.CNF := '000069922';
  Ide.NatOp := 'VENDA';
//  Ide.IndPag := '0';
  Ide.Mod_ := '55';
//  Ide.AddChild('mod').Text := '55';
  Ide.Serie := '0';
  Ide.NNF := '6992';
  Ide.DEmi := '2009-03-27';
  Ide.TpNF := '1';
  Ide.CMunFG := '03905';
  Ide.TpImp := '1';
  Ide.TpEmis := 'N';
//  Ide.CDV    := '2';
//  Ide.TpAmb := '2';
  Ide.TpNF := '1';

(* C *)
  Emit := Nota.InfNFe.Emit;
  Emit.CNPJ := '93748523000282';
  Emit.XNome := 'QUIMIGAL INDUSTRIA QUIMICA LTDA';
  Emit.EnderEmit.XLgr := 'RUA FREI PACIFICO';
  Emit.EnderEmit.Nro := '1325';
  Emit.EnderEmit.XBairro := 'BAIRRO PIO X';
  Emit.EnderEmit.CMun := '03905';
  Emit.EnderEmit.XMun := 'CAMPO BOM';
  Emit.EnderEmit.UF := 'RS';
  Emit.EnderEmit.CEP := '93700000';
  Emit.EnderEmit.CPais := '1058';
  Emit.IE := '00';

(* E *)
  Dest := Nota.InfNFe.Dest;
  Dest.CNPJ := '00742829000160';
  Dest.XNome := 'SERVISOFT INFORMATICA LTDA';
  Dest.EnderDest.XLgr := 'RUA SANTO INACIO DE LOIOLA';
  Dest.EnderDest.Nro := '195';
  Dest.EnderDest.XCpl := 'SALA 4';
  Dest.EnderDest.XBairro := 'CENTRO';
  Dest.EnderDest.CMun := '03905';
  Dest.EnderDest.XMun := 'CAMPO BOM';
  Dest.EnderDest.UF := 'RS';
  Dest.EnderDest.CEP := '93700000';
  Dest.EnderDest.CPais := '1058';

(* H *)
  Det := Nota.InfNFe.Det.Add;
  Det.NItem := '1';

(* I *)
  Det.Prod.CProd := '1';
  Det.Prod.CEAN := '0';
  Det.Prod.XProd := 'PRODUTO TESTE';
  Det.Prod.NCM   := '00030039099';
  Det.Prod.Genero := '0';
  Det.Prod.AddChild('CST').Text := '0';
  Det.Prod.CFOP  := '5101';
  Det.Prod.UTrib := 'PECAS';
  Det.Prod.QTrib := '10000';
  Det.Prod.VProd := '10000';
  Det.Prod.VFrete := '0';
  Det.Prod.VSeg := '0';
  Det.Prod.VDesc := '0';

(* N *)
  Det.Imposto.ICMS.AddChild('modBC').Text := '3';
  Det.Imposto.ICMS.AddChild('vBC').Text := '10000';
  Det.Imposto.ICMS.AddChild('pICMS').Text := '1700';
  Det.Imposto.ICMS.AddChild('vICMS').Text := '17';

(* Q *)
  Det.Imposto.PIS.AddChild('CST').Text := '07';
  Det.Imposto.PIS.AddChild('vBC').Text := '0';
  Det.Imposto.PIS.AddChild('pPIS').Text := '0';
  Det.Imposto.PIS.AddChild('vPis').Text := '0';

(* S *)
  Det.Imposto.COFINS.AddChild('CST').Text := '07';
  Det.Imposto.COFINS.AddChild('vBC').Text := '0';
  Det.Imposto.COFINS.AddChild('pCOFINS').Text := '0';
  Det.Imposto.COFINS.AddChild('vCOFINS').Text := '0';

(* W *)
  Total := Nota.InfNFe.Total;
  Total.ICMSTot.VBC := '10000';
  Total.ICMSTot.VICMS := '17';
  Total.ICMSTot.VBCST := '10000';
  Total.ICMSTot.VST := '17';
  Total.ICMSTot.VProd := '10000';
  Total.ICMSTot.VFrete := '0';
  Total.ICMSTot.VSeg := '0';
  Total.ICMSTot.VDesc := '0';
  Total.ICMSTot.VII := '0';
  Total.ICMSTot.VIPI := '0';
  Total.ICMSTot.VPIS := '0';
  Total.ICMSTot.VCOFINS := '0';
  Total.ICMSTot.VOutro := '0';
  Total.ICMSTot.VNF := '10000';

(* X *)
  Transp := Nota.InfNFe.Transp;
  Transp.ModFrete := '0';
  Transp.Transporta.CNPJ := '82638644000174';
  Transp.Transporta.XNome := 'TRANSPORTES TESTE';
  Transp.Transporta.IE := '1080001953';
  Transp.Transporta.XEnder := 'ENDERECO TRANSPORTADORA';
  Transp.Transporta.XMun := 'CAMPO BOM';
  Transp.Transporta.UF := 'RS';

(* Z *)
  Nota.InfNFe.InfAdic.InfCpl := 'INFORMACOES ADICIONAIS';

  XMLDocument1.Active := false;
  XMLDocument1.XML.Text := '<?xml version="1.0" encoding="UTF-8"?>' + Nota.XML;
  XMLDocument1.Active := true;
  XMLDocument1.SaveToFile('43090393748523000282550000000069920000069922-nfe.xml');
end;

procedure TfNFe.btEnviarClick(Sender: TObject);
var
  oNFe: TStrings;
  oNFeChave: TStrings;
  oNFeStream: TMemoryStream;
  //3.10   18/03/2015
  Danfe: TMemoryStream;
  Recibo: string;
  NroProtocolo: string;
  ChaveAcesso: string;
  vNumAux: Integer;
  vEnviarTxt: Boolean;
  vGravarChave: Boolean;
  CodigoErro: integer;
  MensagemErro: string;

  vFlag: Boolean;
  ID: TTransactionDesc;
  sds: TSQLDataSet;

begin
  if DM1.tNotaFiscalNFeDenegada.AsBoolean then
  begin
    ShowMessage('Nota não pode ser enviada pois esta denegada!');
    exit;
  end;
  if DM1.tNotaFiscalNumNota.AsInteger <= 0 then
    exit;
  vNumAux := DM1.tNotaFiscalNumNota.AsInteger - 1;
  qNotaAux.Close;
  qNotaAux.ParamByName('Filial').AsInteger  := DM1.tFilialCodigo.AsInteger;
  qNotaAux.ParamByName('Serie').AsString    := DM1.tNotaFiscalSerie.AsString;
  qNotaAux.ParamByName('NumNota').AsInteger := vNumAux;
  qNotaAux.Open;
  if  (DM1.tNotaFiscalNumNota.AsInteger > 1) and ((qNotaAux.IsEmpty) or (qNotaAuxNumNota.AsInteger <> vNumAux)) then
  begin
    ShowMessage('*** Número da nota incorreto *** '+#13+
                'Não existe a nota anterior número ' + IntToStr(vNumAux));
    exit;
  end;

  case cbConvTxtXml.ItemIndex of
    0: vEnviarTxt := True;
    1: vEnviarTxt := False;
  end;

  //3.10 16/03/2015
  case ComboBox1.ItemIndex of
    0: vTipo_Emissao_NFe := '1';
    1: vTipo_Emissao_NFe := '2';
    3: vTipo_Emissao_NFe := '3';
    4: vTipo_Emissao_NFe := '5';
  end;
  vTipo_Ambiente_NFe    := IntToStr(ComboBox2.ItemIndex + 1);
  vFinalidade_NFe       := IntToStr(ComboBox3.ItemIndex + 1);
  vProcesso_Emissao_NFe := IntToStr(ComboBox4.ItemIndex);
  vEnviarTxt := False;
  prc_Configura_Variaveis_Envio;
  //***************

  if ComboBox5.ItemIndex = 1 then
    vNomeArquivo := Monta_Diretorio('T',DirectoryEdit1.Text)
  else
  begin
    vNomeArquivo := Monta_Diretorio('X',DM1.tParametrosEndSalvarXMLNFe.AsString);
    vNomeArqPdf  := Monta_Diretorio('P',DM1.tParametrosEndSalvarPDFNFe.AsString);
  end;
  if vNomeArquivo = '' then
    exit;

  vTextoEnvio := TStringList.Create;
  vTextoEnvio.Clear;
  oNFe       := TStringList.Create;
  oNFeChave  := TStringList.Create;
  oNFeStream := TMemoryStream.Create;
  Danfe      := TMemoryStream.Create;

  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  ID.TransactionID  := 2;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    vFlag := False;
    while not vflag do
    begin
      try
        sds.Close;
        sds.SQLConnection := dmDatabase.scoDados;
        sds.NoMetadata    := True;
        sds.GetMetadata   := False;
        sds.CommandText := ' UPDATE TABELALOC SET FLAG = 0 ' +
                           ' WHERE TABELA = ' + QuotedStr('NOTAFISCAL');
        sds.ExecSQL();
        vFlag := True;
      except
        vFlag := False;
      end
    end;

    if vEnviarTxt then
      GerarNFeTXT(oNFe)
    else
    begin
      vGerar_Chave_Antiga := 'N';
      Gera_Chave(False);
      vChave_XML := lbChaveAcesso.Caption;
      lbChaveAcesso.Caption := '';
      prc_Gerar_XML_400(oNFe);
      //oNFe.Add( Memo1.Text );
      //prc_Gerar_XML;
    end;
    if ComboBox5.ItemIndex <> 3 then
    begin
      oNFe.SaveToStream(oNFeStream);
      oNFeStream.Position := 0;
    end;

    if ComboBox5.ItemIndex = 3 then
    begin
      vNomeArquivo := vNomeArquivo + '_' + DM1.tNotaFiscalNFeChaveAcesso.AsString + '.xml';
      prc_Controle_Envio_Email(DM1.tClienteEmailNFe.AsString);
    end
    //*********************
    else
    if ComboBox5.ItemIndex = 1 then
    begin
      oNFe.SaveToFile(vNomeArquivo);
      prc_Controle_Envio_Email(DM1.tParametrosEmailResponsavelSistema.AsString);
    end
    else
    if (ComboBox5.ItemIndex = 0) or (ComboBox5.ItemIndex = 2) then
      begin
        vGravarChave := False;
        texto        := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
        vContigencia := Verifica_Contigencia;
        //if not ConectadoInternet(Trim(DM1.tParametrosLocalServidorNFe.AsString), texto) then
        //  exit;

        EnviaNFe( Trim(DM1.tParametrosLocalServidorNFe.AsString),
                  Texto,
                  oNFeStream,
                  Recibo,
                  NroProtocolo,
                  ChaveAcesso,vContigencia,vEnviarTxt,
                  CodigoErro, MensagemErro ); //Essa última linha foi incluida dia 02/04/2012, para controlar as notas denegadas

        if Trim(lbRecibo.Caption) = '' then
          lbRecibo.Caption := Recibo;

        if Trim(lbNroProtocolo.Caption) = '' then
          lbNroProtocolo.Caption := NroProtocolo;

        if Trim(lbChaveAcesso.Caption) = '' then
        begin
          lbChaveAcesso.Caption := ChaveAcesso;
          vGravarChave          := True;
        end;

        oNFeStream.Position := 0;
        if DM1.tParametrosUSA_DANFE_FLEXDOCS.AsString = 'S' then
        begin
          NFe_GerarDANFE( trim(DM1.tParametrosLocalServidorNFe.AsString),
                        //texto,'marca que é de homologação ou cancelada','Nome do cliente no canhoto',
                        texto,vMarca_Homologacao,vCliente_Canhoto,
                        oNFeStream,
                        DANFE );

          //Arquivo := ExtractFilePath(Application.ExeName) + 'DANFE.pdf';
          if FileExists(vNomeArqPdf) then
            DeleteFile(vNomeArqPdf);

          DANFE.Position := 0;
          DANFE.SaveToFile(vNomeArqPdf);
        end;
        //*****************

        vNomeArquivo := vNomeArquivo + '_' + ChaveAcesso + '.xml';
        SalvarUTF8( oNFeStream, vNomeArquivo );

        //Grava
        if (Trim(ChaveAcesso) <> '') and (vGravarChave) then
        begin
          try
            DM1.tNotaFiscal.Edit;
            DM1.tNotaFiscalNFeRecibo.AsString      := Recibo;
            DM1.tNotaFiscalNFeProtocolo.AsString   := NroProtocolo;
            DM1.tNotaFiscalNFeChaveAcesso.AsString := Trim(ChaveAcesso);
            case ComboBox3.ItemIndex of
              0: DM1.tNotaFiscalFinalidade.AsString := '1';
              1: DM1.tNotaFiscalFinalidade.AsString := '2';
              2: DM1.tNotaFiscalFinalidade.AsString := '3';
              3: DM1.tNotaFiscalFinalidade.AsString := '4';
            end;
            DM1.tNotaFiscalImpressa.AsBoolean    := True;
            DM1.tNotaFiscalNFeDenegada.AsBoolean := ((CodigoErro = 301) or (CodigoErro = 302));
            if CodigoErro = 301 then
              DM1.tNotaFiscalNFeMotivoDenegada.AsString := 'Irregularidade do Emitente'
            else
            if CodigoErro = 302 then
              DM1.tNotaFiscalNFeMotivoDenegada.AsString := 'Irregularidade do Destinatário';
            DM1.tNotaFiscal.Post;
          except
            ShowMessage('Erro na gravação da chave de acesso para o banco de dados - Envio Normal!');
          end;
        end;

        //Envia por e-mail
        if DM1.tParametrosUSA_DANFE_FLEXDOCS.AsString <> 'S' then
        begin
          if (ckAnexarDanfe.Checked) then
            prc_Imprimir_Danfe('E')
          else
            vNomeArqPdf := '';
        end;
        //************

        {if (ckAnexarDanfe.Checked) then
        begin
          fRelDanfe := TfRelDanfe.Create(Self);
          fRelDANFE.RLReport1.Prepare;
          fRelDANFE.RLReport1.SaveToFile(vNomeArqPdf);
          dm1.RLPDFFilter1.FileName := vNomeArqPdf;
          DM1.RLPDFFilter1.FilterPages(fRelDANFE.RLReport1.Pages,1,-1,'',0);
          fRelDanfe.RLReport1.Free;

          fRelDanfe.Destroy;
        end
        else
          vNomeArqPdf := '';}

        if (CodigoErro <> 301) and (CodigoErro <> 302) then
          prc_Controle_Envio_Email(DM1.tClienteEmailNFe.AsString);

        btEnviar.Enabled := (Trim(ChaveAcesso) = '');
        btDanfe.Enabled  := (Trim(ChaveAcesso) <> '');
        lbErro.Visible   := DM1.tNotaFiscalNFeDenegada.AsBoolean;
        lbErro.Caption   := DM1.tNotaFiscalNFeMotivoDenegada.AsString;
      end;

    dmDatabase.scoDados.Commit(ID);

  except
    on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao enviar a NOTA, favor tentar novamente: ' + #13 + e.Message);
      end;
  end;
  FreeAndNil(sds);

  FreeAndNil(oNFeStream);
  FreeAndNil(oNfe);
  FreeAndNil(oNfeChave);
  FreeAndNil(vTextoEnvio);
  FreeAndNil(Danfe);

  Edit1.Text := vNomeArquivo;
  DM1.tNotaFiscal.IndexFieldNames := 'Filial;NumSeq';
  DM1.tNotaFiscal.FindKey([DM1.tFilialCodigo.AsInteger,DMNotaFiscal.vNumSeqNFe]);
end;

procedure TfNFe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DMNFe.Owner.ClassName = Self.ClassName then
    FreeAndNil(DMNFe);
  //16/05/2012
  if Tag <> 5 then
  begin
    if DMNFeFB.Owner.ClassName = Self.ClassName then
      FreeAndNil(DMNFeFB);
  end;
  //*******

  Tag := 0;

  SaveSettings;

  Action := Cafree;
end;

procedure TfNFe.FormShow(Sender: TObject);
begin
  //16/05/2012
  //Tag = 1   Inutilizar
  //Tag = 2   Cancelar
  //Tag = 5   Carta de Correção

  vEmailTransp := '';
  //NFe 2.00
  if Tag <> 1  then
  begin
    lbErro.Visible := DM1.tNotaFiscalNFeDenegada.AsBoolean;
    lbErro.Caption := DM1.tNotaFiscalNFeMotivoDenegada.AsString;

    lbRecibo.Caption                   := DM1.tNotaFiscalNFeRecibo.AsString;
    lbNroProtocolo.Caption             := DM1.tNotaFiscalNFeProtocolo.AsString;
    lbChaveAcesso.Caption              := DM1.tNotaFiscalNFeChaveAcesso.AsString;
    lbNroProtocoloCancelamento.Caption := DM1.tNotaFiscalNFeProtocoloCancelada.AsString;
    lbCodBarraContingencia.Caption     := DM1.tNotaFiscalNFeCodBarraCont.AsString;

    //16/05/2012
    if Tag <> 5 then
    begin
      if DM1.tTransp.Locate('Codigo',DM1.tNotaFiscalCodTransp.AsInteger,[loCaseInsensitive]) then
        vEmailTransp := DM1.tTranspEmailNFe.AsString;
      vNumNota := dm1.tNotaFiscalNumSeq.AsInteger;

    //NFe 2.00
      if DM1.tNotaFiscalTipoEnvioNF.AsString = '1-NORMAL' then
        ComboBox1.ItemIndex := 0
      else
      if DM1.tNotaFiscalTipoEnvioNF.AsString = '2-CONTINGENCIA FS' then
        ComboBox1.ItemIndex := 1
      else
      if DM1.tNotaFiscalTipoEnvioNF.AsString = '3-CONTINGENCIA SCAN' then
        ComboBox1.ItemIndex := 2
      else
      if DM1.tNotaFiscalTipoEnvioNF.AsString = '5-CONTINGENCIA FS-DA' then
        ComboBox1.ItemIndex := 3;

    //NFe 2.00
      ComboBox1.Enabled := ((DM1.tNotaFiscalTipoEnvioNF.AsString <> '2-CONTINGENCIA FS')  and
                            (DM1.tNotaFiscalTipoEnvioNF.AsString <> '5-CONTINGENCIA FS-DA'));

      if DM1.tNotaFiscalFinalidade.AsString = '4' then
        ComboBox3.ItemIndex := 3
      else
      if DM1.tNotaFiscalFinalidade.AsString = '3' then
        ComboBox3.ItemIndex := 2
      else
      if DM1.tNotaFiscalFinalidade.AsString = '2' then
        ComboBox3.ItemIndex := 1
      else
        ComboBox3.ItemIndex := 0;
    end;

  end;

  //NFe 2.00
  try
    RzPageControl1.ActivePage := tsEnvio;
    vConexao := Verifica_ConexaoInternet;
    Habilita_Botoes;
  except
    on E: Exception do
    begin
      ShowMessage('Erro: ' + E.Message + #13 + '! NFeConfig não aberto ou Servidor não encontrado!');
    end;
  end;

  if DM1.tParametrosNFeProducao.AsBoolean then
    ComboBox2.ItemIndex := 0
  else
    ComboBox2.ItemIndex := 1;

  //NFe 2.0
  //if DM1.tNotaFiscalTipoNotaNFeRef.AsString = 'C' then
  //  ComboBox3.ItemIndex := 1;
  if vPessoaTransp = '' then
    vPessoaTransp := 'J';

  cbConvTxtXml.ItemIndex := 1;

  CheckBox3Click(Sender);

  btEnviarNovo.Enabled := (trim(lbChaveAcesso.Caption) = '');
end;

procedure TfNFe.btDanfeClick(Sender: TObject);
begin
  if DM1.tParametrosUSA_DANFE_FLEXDOCS.AsString = 'S' then
    prc_Danfe_Flexdocs
  else
    prc_Imprimir_Danfe('I');
end;

procedure TfNFe.btCancelarClick(Sender: TObject);
var
  NroProtocolo: string;
  oNFeStream: TMemoryStream;
begin
  vNomeArqPdf := '';
  if ComboBox5.ItemIndex = 1 then
    vNomeArquivo := Monta_Diretorio('T',DirectoryEdit1.Text)
  else
    vNomeArquivo := Monta_Diretorio('X',DM1.tParametrosEndSalvarXMLNFe.AsString);
  if vNomeArquivo = '' then
    exit;

  texto        := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
  vContigencia := Verifica_Contigencia;

  oNFeStream := TMemoryStream.Create;
  try

    CancelaNFe( //'localhost',
                Trim(DM1.tParametrosLocalServidorNFe.AsString),
                texto,
                //10/09/2009
                Copy(lbNroProtocolo.Caption,1,15),
                lbChaveAcesso.Caption,
                DM1.tNotaFiscalMotivoCanc.AsString,
                NroProtocolo,
                oNFeStream,
                vContigencia,False);

    lbNroProtocoloCancelamento.Caption := NroProtocolo;
    oNFeStream.Position                := 0;
    vNomeArquivo := vNomeArquivo + '_CANCELADA_' + lbChaveAcesso.Caption + '.xml';
    SalvarUTF8( oNFeStream, vNomeArquivo );

    if lbNroProtocoloCancelamento.Caption <> '' then
      begin
        DM1.tNotaFiscal.Edit;
        DM1.tNotaFiscalNFeProtocoloCancelada.AsString := NroProtocolo;
        //NFe 2.00
        DM1.tNotaFiscalCancelada.AsBoolean            := True;
        DM1.tNotaFiscal.Post;
        btCancelar.Enabled := False;

        prc_Controlar_Envio_Email('C');
        {if ckUsarJv.Checked then
          Envia_MailJV(DM1.tClienteEmailNFe.AsString,'NOTA CANCELADA nº ' + DM1.tNotaFiscalNumNota.AsString,'Em Anexo o XML referente a Nota Cancelada')
        else
        if ckUsarOutlookOLE.Checked then
          Envia_MailOLE(DM1.tClienteEmailNFe.AsString,'NOTA CANCELADA nº ' + DM1.tNotaFiscalNumNota.AsString,'Em Anexo o XML referente a Nota Cancelada')
        else
        if ckUsarOutlook.Checked then
          Envia_Mail(DM1.tClienteEmailNFe.AsString,'NOTA CANCELADA nº ' + DM1.tNotaFiscalNumNota.AsString,'Em Anexo o XML referente a Nota Cancelada')
        else
          Envia_Mail2(DM1.tClienteEmailNFe.AsString,'NOTA CANCELADA nº ' + DM1.tNotaFiscalNumNota.AsString,'Em Anexo o XML referente a Nota Cancelada');}
      end
    else
      ShowMessage('Problema no cancelamento, nota não foi cancelada!');

  finally
    FreeAndNil(oNFeStream);
    Edit1.Text := vNomeArquivo;
  end;

end;

procedure TfNFe.btConexaoClick(Sender: TObject);
begin
  vConexao := Verifica_ConexaoInternet;
  Habilita_Botoes;
  if not vConexao then
    ShowMessage('Internet com problema, sem conexão!')
  else
    ShowMessage('Internet esta ok!');
end;

procedure TfNFe.mNotaDevolvidaNFeNewRecord(DataSet: TDataSet);
begin
  mNotaDevolvidaNFeQtd.AsFloat := 0;
end;

procedure TfNFe.mDadosAdicionaisNFeBeforePost(DataSet: TDataSet);
begin
  if mDadosAdicionaisNFeObs.Value <> '' then
    begin
      mDadosAdicionaisNFeObs.Value := StringReplace( mDadosAdicionaisNFeObs.Value, #13, #32, [rfReplaceAll] );
      mDadosAdicionaisNFeObs.Value := StringReplace( mDadosAdicionaisNFeObs.Value, #10, '', [rfReplaceAll] );
    end;
  if mDadosAdicionaisNFeObsAux.Value <> '' then
    begin
      mDadosAdicionaisNFeObsAux.Value := StringReplace( mDadosAdicionaisNFeObsAux.Value, #13, #32, [rfReplaceAll] );
      mDadosAdicionaisNFeObsAux.Value := StringReplace( mDadosAdicionaisNFeObsAux.Value, #10, '', [rfReplaceAll] );
    end;
end;

procedure TfNFe.mItensNFeBeforePost(DataSet: TDataSet);
begin
  if mItensNFeInfAdicionais.Value <> '' then
    begin
      mItensNFeInfAdicionais.Value := StringReplace( mItensNFeInfAdicionais.Value, #13, #32, [rfReplaceAll] );
      mItensNFeInfAdicionais.Value := StringReplace( mItensNFeInfAdicionais.Value, #10, '', [rfReplaceAll] );
    end;
end;

procedure TfNFe.Button5Click(Sender: TObject);
begin
  vGerar_Chave_Antiga := '';
  Gera_Chave(False);
end;

procedure TfNFe.Button6Click(Sender: TObject);
begin
  Monta_CodBarraContingencia('G');
end;

procedure TfNFe.Button7Click(Sender: TObject);
var
  Protocolo: String;
begin
  if SameText(Trim(edChaveNfe.Text), EmptyStr) then
    raise Exception.Create('Crie primeiro a chave de acesso pelo botão "Gera Chave NFe".');

  texto        := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
  vContigencia := Verifica_Contigencia;

  lbRecibo.Caption       := EmptyStr;
  lbNroProtocolo.Caption := EmptyStr;
  lbChaveAcesso.Caption  := EmptyStr;

  Protocolo := NFe_Consultar( Trim(DM1.tParametrosLocalServidorNFe.AsString),
                              texto,
                              edChaveNfe.Text,
                              vContigencia,False );

  lbNroProtocolo.Caption := Protocolo;
  lbChaveAcesso.Caption  := edChaveNfe.Text;
end;

procedure TfNFe.btGravaNotaClick(Sender: TObject);
begin
  if Trim(DM1.tNotaFiscalNFeChaveAcesso.AsString) <> '' then
    begin
      ShowMessage('Chave de acesso já gerada!');
      exit;
    end;
  if Trim(lbChaveAcesso.Caption) = '' then
    begin
      ShowMessage('Não foi feita a consulta da chave de acesso!');
      exit;
    end;

  if Trim(DM1.tNotaFiscalNFeChaveAcesso.AsString) = '' then
    begin
      DM1.tNotaFiscal.Edit;
      DM1.tNotaFiscalNFeChaveAcesso.AsString := lbChaveAcesso.Caption;
      DM1.tNotaFiscalNFeProtocolo.AsString   := lbNroProtocolo.Caption;
      DM1.tNotaFiscal.Post;
      Close;
    end;
end;

procedure TfNFe.mItensNFeNewRecord(DataSet: TDataSet);
begin
  //14/09/2009
  mItensNFeTipoReg.AsString := 'R';

  //NFe 2.00
  mItensNFeMVA.AsFloat                := 0;
  mItensNFeSomaVlrTotalProd.AsBoolean := True;
end;

procedure TfNFe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
  begin
    CheckBox1.Visible := not(CheckBox1.Visible);
    CheckBox2.Visible := not(CheckBox2.Visible);
    btEnviar.Visible  := not(btEnviar.Visible);
  end;
end;

procedure TfNFe.Button8Click(Sender: TObject);
var
  Stream: TMemoryStream;
begin
  if OpenDialog.Execute then
  begin
    Stream := TMemoryStream.Create;
    texto := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
    vContigencia := Verifica_Contigencia;

    try
      Stream.LoadFromFile(OpenDialog.FileName);
      NFe_AdicionaProtNFe( Trim(DM1.tParametrosLocalServidorNFe.AsString),
                           Texto,
                           Stream,
                           vContigencia );

      Stream.Position := 0;
      vNomeArquivo := Monta_Diretorio('X',DM1.tParametrosEndSalvarXMLNFe.AsString);
      vNomeArquivo := vNomeArquivo + '_RE_' + lbChaveAcesso.Caption + '.xml';
      SalvarUTF8( Stream, vNomeArquivo );

      //Envia por e-mail
      Envia_Mail(DM1.tClienteEmailNFe.AsString,'NFe nº ' + DM1.tNotaFiscalNumNota.AsString,' Em Anexo, XML referente a Nota Eletrônica');

    finally
      FreeAndNil(Stream);
    end;
  end;
end;

procedure TfNFe.ComboBox5Click(Sender: TObject);
begin
  if (ComboBox5.ItemIndex = 1) or (ComboBox5.ItemIndex = 3) then
  begin
    btEnviar.Enabled := True;
    btEnviar.Visible := True;
  end
  else
    btEnviar.Enabled := ((DM1.tNotaFiscalNFeChaveAcesso.AsString = '') and
                        (vConexao));
end;

procedure TfNFe.FormCreate(Sender: TObject);
begin
  //NFe 2.00 - Procedure alterada, foi incluido o try
  CheckBox3.Checked := True;
  CheckBox3Click(Sender);

  try
    if not Assigned(DMNFe) then
      DMNFe := TDMNFe.Create(Self);

    //16/05/2012
    if Tag <> 5 then
    begin
      if not Assigned(DMNFeFB) then
        DMNFeFB := TDMNFeFB.Create(Self);
      DMNFeFB.cdsNFE_EMAIL.Close;
      DMNFeFB.sdsNFE_EMAIL.CommandText := ctNFe_Email;
      DMNFeFB.cdsNFE_EMAIL.Open;
    end;
    //************
    DMNotaFiscal.tUF2.Open;
    GetSettings;
  except
    on E: Exception do
    begin
      ShowMessage('Erro: ' + E.Message);
    end;
  end;
end;

procedure TfNFe.GetSettings;
var
  ini: TIniFile;
  vUsarOutlook: String;
  vUsarJV, vUsarPadrao, vUsarOutlookOLE, vFilialNaChaveNao: String;
  vAnexarDanfe: String;
begin
  
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName,'_' + DM1.tUsuarioUsuario.AsString + '_NFe.ini'));
  try
    vUsarOutlook  := ini.ReadString('MAIL','UsarOutlook','');
    vUsarJV       := ini.ReadString('MAIL','UsarJv','');
    vUsarPadrao   := ini.ReadString('MAIL','UsarPadrao','');
    vUsarOutlookOLE := ini.ReadString('MAIL','UsarOutlookOLE','');
    vAnexarDanfe  := ini.ReadString('MAIL','AnexarDanfe','');
    vFilialNaChaveNao := ini.ReadString('DADOS','NaoFilialNaChave','');

  finally
    ini.Free;
  end;

  if vUsarOutlook = 'SIM' then
    ckUsarOutlook.Checked := True
  else
    ckUsarOutlook.Checked := False;
  if vUsarJV = 'SIM' then
    ckUsarJv.Checked := True
  else
    ckUsarJv.Checked := False;
  if vUsarPadrao = 'SIM' then
    ckUsarPadrao.Checked := True
  else
    ckUsarPadrao.Checked := False;
  if vUsarOutlookOLE = 'SIM' then
    ckUsarOutlookOLE.Checked := True
  else
    ckUsarOutlookOLE.Checked := False;
  if vAnexarDanfe = 'SIM' then
    ckAnexarDanfe.Checked := True
  else
    ckAnexarDanfe.Checked := False;
  if vFilialNaChaveNao = 'SIM' then
    ckFilialNao.Checked := True
  else
    ckFilialNao.Checked := False;
end;

procedure TfNFe.SaveSettings;
var
  ini: TIniFile;
  vUsarOutlook: String;
  vUsarJV, vUsarOutlookOLE, vUsarPadrao, vFilialNaChaveNao: String;
  vAnexarDanfe: String;
begin
  if ckUsarOutlook.Checked then
    vUsarOutlook := 'SIM'
  else
    vUsarOutlook := 'NAO';
  if ckUsarOutlookOLE.Checked then
    vUsarOutlookOLE := 'SIM'
  else
    vUsarOutlookOLE := 'NAO';

  if ckFilialNao.Checked then
    vFilialNaChaveNao := 'SIM'
  else
    vFilialNaChaveNao := 'NAO';

  if ckUsarPadrao.Checked then
    vUsarPadrao := 'SIM'
  else
    vUsarPadrao := 'NAO';
  if ckUsarJv.Checked then
    vUsarJV := 'SIM'
  else
    vUsarJV := 'NAO';
  if ckAnexarDanfe.Checked then
    vAnexarDanfe := 'SIM'
  else
    vAnexarDanfe := 'NAO';

  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName,'_' + DM1.tUsuarioUsuario.AsString + '_NFe.ini'));
  try
    ini.WriteString('MAIL','UsarOutlook',vUsarOutlook);
    ini.WriteString('MAIL','UsarPadrao',vUsarPadrao);
    ini.WriteString('MAIL','UsarOutlookOLE',vUsarOutlookOLE);
    ini.WriteString('MAIL','UsarJv',vUsarJV);
    ini.WriteString('MAIL','AnexarDanfe',vAnexarDanfe);
    ini.WriteString('DADOS','NaoFilialNaChave',vFilialNaChaveNao);

  finally
    ini.Free;
  end;
end;

procedure TfNFe.Monta_N08;
begin
//CST – 60 - ICMS cobrado anteriormente por substituição tributária
  Texto := 'N08|';

//Origem
  Texto := Texto + vOrigem + '|';

//Tributação do ICMS
  Texto := Texto + vCodSitTrib + '|';
  
//Valor da BC do ICMS ST retido
  Texto := Texto + '0|';

//Valor do ICMS ST retido
  Texto := Texto + '0|';

  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_N05;
begin
//CST – 30 -  Isenta ou não tributada e com cobrança do ICMS por substituição tributária
//Origem da mercadoria - 0 – Nacional; 1 – Estrangeira – Importação direta; 2 – Estrangeira – Adquirida no mercado interno.
  Texto := 'N05|' + vOrigem +'|';

//Tributação do ICMS
  Texto := Texto + vCodSitTrib +'|';

//Modadelidade de determinação
  Texto := Texto + '4|';

//Percentual da margem de valor adicionado do ICMS ST, OPCIONAL
  Texto := Texto + '|';

//Percentual da redução da BC do ICMS ST, OPCIONAL
  Texto := Texto + '|';

//Valor da BC do ICMS ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeIcmsBaseSubst.AsFloat) ,',','.') + '|';

//Aliquota do Imposto de ICMS ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeAliqSitTrib.AsFloat) ,',','.') + '|';

//Valor do ICMS ST
  Texto := Texto + Replace(FormatFloat('0.00',mItensNFeIcmsVlrSubst.AsFloat) ,',','.') + '|';

  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_B13;
begin
  //NFe 2.00
//Letra B13 - Notas Referenciadas
//Informação das NFe referenciadas
  //Texto := 'B13|' + DM1.tNotaFiscalRefNFeChaveAcessoRef.AsString + '|';
  Texto := 'B13|' + mNotaDevolvidaNFeNFeChaveAcesso.AsString + '|';
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_B14;
begin
  //NFe 2.00
//Letra B14 - Notas Referenciadas
//Codigo UF
  //Texto := 'B14|' + DM1.tNotaFiscalRefCodUFEmitenteRef.AsString + '|';
  Texto := 'B14|';
  Texto := Texto + mNotaDevolvidaNFeCodUF.AsString + '|';

  {if DMNotaFiscal.tUF2.Locate('Sigla',DM1.tNotaFiscalRefCodUFEmitenteRef.AsString,[loCaseInsensitive]) then
    Texto := Texto + DMNotaFiscal.tUF2CodUF.AsString + '|'
  else
    Texto := Texto + '|';}
//Ano e Mês
  //Texto := Texto + FormatFloat('00',DM1.tNotaFiscalRefAnoEmissaoRef.AsInteger) + FormatFloat('00',DM1.tNotaFiscalRefMesEmissaoRef.AsInteger) + '|';
  Texto := Texto + FormatFloat('00',mNotaDevolvidaNFeAnoEmissao.AsInteger) + FormatFloat('00',mNotaDevolvidaNFeMesEmissao.AsInteger) + '|';
//CNPJ
  //Texto := Texto + Monta_Texto(DM1.tNotaFiscalRefCNPJEmitenteRef.AsString,14) + '|';
  Texto := Texto + Monta_Texto(mNotaDevolvidaNFeCNPJ.AsString,14) + '|';
//Modelo
  //Texto := Texto + DM1.tNotaFiscalRefModeloRef.AsString  + '|';
  Texto := Texto + mNotaDevolvidaNFeModelo.AsString  + '|';
//Série
  {if (DM1.tNotaFiscalRefSerieRef.AsString = 'UN') or (DM1.tNotaFiscalRefSerieRef.AsString = 'UNI') then
    Texto := Texto + '1|'
  else
    Texto := Texto + DM1.tNotaFiscalRefSerieRef.AsString  + '|';}
  if (mNotaDevolvidaNFeSerie.AsString = 'UN') or (mNotaDevolvidaNFeSerie.AsString = 'UNI') then
    Texto := Texto + '1|'
  else
    Texto := Texto + mNotaDevolvidaNFeSerie.AsString  + '|';
//Número da nota
  //Texto := Texto + DM1.tNotaFiscalRefNumNotaRef.AsString + '|';
  Texto := Texto + mNotaDevolvidaNFeNumNota.AsString + '|';

  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_B20a;
begin
  //NFe 2.00
//Letra B20a - Notas Referenciadas de Produto Rural
//Codigo UF
  Texto := 'B20a|';
  Texto := Texto + mNotaDevolvidaNFeCodUF.AsString + '|';
//Ano e Mês
  //Texto := Texto + FormatFloat('00',DM1.tNotaFiscalRefAnoEmissaoRef.AsInteger) + FormatFloat('00',DM1.tNotaFiscalRefMesEmissaoRef.AsInteger) + '|';
  Texto := Texto + FormatFloat('00',mNotaDevolvidaNFeAnoEmissao.AsInteger) + FormatFloat('00',mNotaDevolvidaNFeMesEmissao.AsInteger) + '|';
//IE
  Texto := Texto + mNotaDevolvidaNFeIE.AsString  + '|';
//Modelo
  Texto := Texto + mNotaDevolvidaNFeModelo.AsString  + '|';
//Série
  if (mNotaDevolvidaNFeSerie.AsString = 'UN') or (mNotaDevolvidaNFeSerie.AsString = 'UNI') then
    Texto := Texto + '1|'
  else
    Texto := Texto + mNotaDevolvidaNFeSerie.AsString  + '|';
//Número da nota
  //Texto := Texto + DM1.tNotaFiscalRefNumNotaRef.AsString + '|';
  Texto := Texto + mNotaDevolvidaNFeNumNota.AsString + '|';

  vTextoEnvio.Add(Texto);

//Registro B20d ou B20e CNPJ ou CPF do produtor rural
  if Length(mNotaDevolvidaNFeCNPJ.AsString) > 12 then
  begin
    Texto := 'B20d|';
    Texto := Texto + Monta_Texto(mNotaDevolvidaNFeCNPJ.AsString,14) + '|'
  end
  else
  begin
    Texto := 'B20e|';
    Texto := Texto + Monta_Texto(mNotaDevolvidaNFeCNPJ.AsString,11) + '|';
  end;
  vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Monta_B20j;
begin
  //NFe 2.0
//Cupom Fiscal
  Texto := 'B20j|';

//Modelo do documento fiscal (Cupom)
  //Texto := Texto + DM1.tNotaFiscalRefCupomModelo.AsString + '|';
  Texto := Texto + mNotaDevolvidaNFeCupomModelo.AsString + '|';

//Número de ordem sequencial do ECF
  Texto := Texto + mNotaDevolvidaNFeCupomNumECF.AsString + '|';

//Número do contador de ordem de operação - COO
  Texto := Texto + mNotaDevolvidaNFeCupomNumCOO.AsString + '|';

  vTextoEnvio.Add(Texto);
end;


procedure TfNFe.Monta_X22;
begin
  DMNotaFiscal.tNotaFiscalReboque.First;
  while not DMNotaFiscal.tNotaFiscalReboque.Eof do
    begin
      Texto := 'X22|';

      Texto := Texto + DMNotaFiscal.tNotaFiscalReboquePlaca.AsString + '|';
      Texto := Texto + DMNotaFiscal.tNotaFiscalReboqueUF.AsString + '|';
      Texto := Texto + DMNotaFiscal.tNotaFiscalReboqueRNTC.AsString + '|';

      vTextoEnvio.Add(Texto);

      DMNotaFiscal.tNotaFiscalReboque.Next;
    end;
end;

procedure TfNFe.Monta_X33;
begin
  DMNotaFiscal.tNotaFiscalLacre.First;
  while not DMNotaFiscal.tNotaFiscalLacre.Eof do
    begin
      Texto := 'X33|';

      Texto := Texto + DMNotaFiscal.tNotaFiscalLacreNumLacre.AsString + '|';
      vTextoEnvio.Add(Texto);

      DMNotaFiscal.tNotaFiscalLacre.Next;
    end;

end;

procedure TfNFe.btInutilizarClick(Sender: TObject);
var
  NroProtocolo: string;
  oNFeStream: TMemoryStream;
begin
  vNomeArquivo := Monta_Diretorio('I',DM1.tParametrosEndSalvarXMLNFe.AsString);

  if vNomeArquivo = '' then
    exit;

  texto        := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
  vContigencia := Verifica_Contigencia;

  oNFeStream := TMemoryStream.Create;

  try
    InutilizaNFe( Trim(DM1.tParametrosLocalServidorNFe.AsString),
                  Texto,
                  DM1.tUFCodUF.AsString,
                  Copy(DMNFe.tNFeInutilizacaoAno.AsString,3,2),
                  DMNFe.tNFeInutilizacaoModelo.AsString,
                  DMNFe.tNFeInutilizacaoSerie.AsString,
                  DMNFe.tNFeInutilizacaoNumNotaIni.AsString,
                  DMNFe.tNFeInutilizacaoNumNotaFin.AsString,
                  DMNFe.tNFeInutilizacaoMotivo.AsString,
                  NroProtocolo,
                  oNFeStream,
                  vContigencia);

    lbNroProtocoloInutil.Caption := NroProtocolo;

    vNomeArquivo := vNomeArquivo + NroProtocolo + '.xml';
    SalvarUTF8( oNFeStream, vNomeArquivo );

    if NroProtocolo <> '' then
      begin
        DMNFe.tNFeInutilizacao.Edit;
        DMNFe.tNFeInutilizacaoNumProtocolo.AsString := NroProtocolo;
        DMNFe.tNFeInutilizacao.Post;
      end;

    oNFeStream.Position          := 0;
  finally
    FreeAndNil(oNFeStream);
    Edit1.Text := vNomeArquivo;
    btInutilizar.Enabled := False;
  end;
end;

procedure TfNFe.Button2Click(Sender: TObject);
begin
  texto        := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
  if VerificaStatusNFe(Trim(DM1.tParametrosLocalServidorNFe.AsString), Texto, False) then
    ShowMessage('No ar')
  else
    ShowMessage('Fora do ar');
end;

procedure TfNFe.Button3Click(Sender: TObject);
begin
  texto        := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
  if VerificaStatusNFe(Trim(DM1.tParametrosLocalServidorNFe.AsString), Texto, True) then
    ShowMessage('No ar')
  else
    ShowMessage('Fora do ar');
end;

procedure TfNFe.Monta_X03;
var
  texto2, vInscTransp: string;
  vCNPJTransp: String;
begin
  texto2      := ' ';
  vInscTransp := ' ';
  if DM1.tTransp.Locate('Codigo',DM1.tNotaFiscalCodTransp.AsInteger,[loCaseInsensitive]) then
    begin
      if DM1.tCidade.Locate('Codigo',DM1.tTranspCodCidade.AsInteger,[loCaseInsensitive]) then
        Texto2 := TirarAcento(DM1.tCidadeNome.AsString);
      vInscTransp := Monta_Texto(DM1.tTranspInscricao.AsString,0);
    end;
  Texto := 'X03|';
//Nome da transportadora
  Texto := Texto + TirarAcento(DM1.tNotaFiscallkNomeTransp.AsString) + '|';
//Inscrição Estadual
  Texto := Texto + vInscTransp + '|';
//Endereço Completo
  Texto := Texto + TirarAcento(DM1.tNotaFiscallkEndTransp.AsString) + '|';
//Sigla da UF
  if DM1.tNotaFiscallkUf.AsString = 'UR' then
    Texto := Texto + '|'
  else
    Texto := Texto + DM1.tNotaFiscallkUfTransp.AsString + '|';
//Município
  Texto := Texto + texto2 +'|';
  vTextoEnvio.Add(Texto);

//Letra X04 se for CNPJ ou X05 se for CPF
  if DM1.tNotaFiscalCodTransp.AsInteger > 0 then
  begin
    if vPessoaTransp = 'F' then
    begin
      vCnpjTransp := Monta_Texto(DM1.tNotaFiscallkCgcTransp.AsString,11);
      Texto := 'X05|';
    end
    else
    begin
    if vPessoaTransp = 'J' then
      Texto := 'X04|';
      vCnpjTransp := Monta_Texto(DM1.tNotaFiscallkCgcTransp.AsString,14);
    end;
    Texto := Texto + vCnpjTransp + '|';
    //Texto := Texto + Monta_Texto(DM1.tNotaFiscallkCgcTransp.AsString,14) + '|';
    vTextoEnvio.Add(Texto);
  end;

//Letra X18 - Veículo - Placa do Veículo
  if DM1.tNotaFiscalPlaca.AsString <> '' then
    begin
      Texto := 'X18|' + Trim(DM1.tNotaFiscalPlaca.AsString) + '|';
      //Sigla da UF
      Texto := Texto + DM1.tNotaFiscalUFPlaca.AsString + '|';
      //Registro Nacional de Transportador de Carga (ANTT) (Opcional)
      Texto := Texto +  DM1.tNotaFiscalRNTC.AsString + '|';
      vTextoEnvio.Add(Texto);
    end;

//Reboque
  //NFe 2.00
  Monta_X22;

//Identificação do Vagão ou Balsa
//NF2 2.00
  Texto := '';
  if DM1.tNotaFiscalTipoIdentifVagaoBalsa.AsString = 'V' then
    Texto := 'X25a|' + DM1.tNotaFiscalIdentifVagaoBalsa.AsString + '|'
  else
  if DM1.tNotaFiscalTipoIdentifVagaoBalsa.AsString = 'B' then
    Texto := 'X25b|' + DM1.tNotaFiscalIdentifVagaoBalsa.AsString + '|';
  if Texto <> '' then
    vTextoEnvio.Add(Texto);
end;

procedure TfNFe.Gera_Chave(Contingencia: Boolean);
var
  ChaveNfe: string;
  vSerieAux: String;
  vNumNotaAux: String;
  vVersaoAntiga: Boolean;
  vTipoEnvio: Integer;
begin
  texto       := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
  if DM1.tNotaFiscalSerie.AsString = 'UN' then
    vSerieAux   := '001'
  else
    vSerieAux   := Monta_Texto(DM1.tNotaFiscalSerie.AsString,3);
  vNumNotaAux := Monta_Texto(DM1.tNotaFiscalNumNota.AsString,9);
  Posiciona_CidadeUF(DM1.tFilialCodCidade.AsInteger,1);
  //NFe 2.00
  if ComboBox1.ItemIndex = 3 then
    vTipoEnvio := 5
  else
    vTipoEnvio := ComboBox1.ItemIndex + 1;
    
  //Colocar não (False) para versão 2.00
  //NFe 2.00
  if vGerar_Chave_Antiga = 'N' then
    vVersaoAntiga := False
  else
  if not Contingencia then
    vVersaoAntiga := (MessageDlg('Deseja usar a versão antiga da geração da chave?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  else
    vVersaoAntiga := False;
  ChaveNfe := CriaChaveNFe( Trim(DM1.tParametrosLocalServidorNFe.AsString),
                            Texto,
                            DM1.tNotaFiscalDtEmissao.AsDateTime,
                            DM1.tUFCodUF.AsString,
                            '55',
                            vSerieAux,
                            vNumNotaAux,IntToStr(vTipoEnvio),vVersaoAntiga);

  if not Contingencia then
    edChaveNfe.Text := ChaveNfe
  else
    lbChaveAcesso.Caption := ChaveNfe;
  if vGerar_Chave_Antiga = 'N' then
    lbChaveAcesso.Caption := ChaveNfe;
end;

procedure TfNFe.btContingenciaClick(Sender: TObject);
begin
  //NFe 2.00  = Foi incluida toda esta procedure
  Gera_Chave(True);
  Monta_CodBarraContingencia('E');

  if lbCodBarraContingencia.Caption = '' then
  begin
    ShowMessage('Problema na geração do código de barras!');
    exit;
  end;

  DM1.tNotaFiscal.Edit;
  DM1.tNotaFiscalNFeRecibo.AsString       := '';
  DM1.tNotaFiscalNFeProtocolo.AsString    := '';
  DM1.tNotaFiscalNFeChaveAcesso.AsString  := Trim(lbChaveAcesso.Caption);
  DM1.tNotaFiscalImpressa.AsBoolean       := True;

  DM1.tNotaFiscalNFeCodBarraCont.AsString := lbCodBarraContingencia.Caption;
  DM1.tNotaFiscal.Post;
end;

procedure TfNFe.btCCeClick(Sender: TObject);
var
  XML: TMemoryStream;
  Ret: string;
  vAssunto: String;
begin
  vNomeArquivo := Monta_Diretorio('C',DM1.tParametrosEndSalvarXMLNFe.AsString);
  vNomeArqPdf  := Monta_Diretorio('C',DM1.tParametrosEndSalvarPDFNFe.AsString);
  vNomeArqPdf  := vNomeArqPdf + '.pdf'; 

  if vNomeArquivo = '' then
    exit;

  texto        := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
  vContigencia := Verifica_Contigencia;

  XML := TMemoryStream.Create;
  try
    Ret := EnviarCartaCorrecao( Trim(DM1.tParametrosLocalServidorNFe.AsString),
                                Texto,
                                lbChaveAcesso.Caption,
                                DMNFeFB.cdsNotaFiscal_NFeMOTIVO.Value,
                                DMNFeFB.cdsNotaFiscal_NFeITEMTIPO.AsInteger,
                                False,
                                XML );

    lbNroProtocoloCCe.Caption := Ret;
    XML.Position := 0;

    vNomeArquivo := vNomeArquivo + lbChaveAcesso.Caption + '.xml';
    SalvarUTF8( XML, vNomeArquivo );

    if lbNroProtocoloCCe.Caption <> '' then
    begin
      DMNFeFB.cdsNotaFiscal_NFe.Edit;
      DMNFeFB.cdsNotaFiscal_NFeNFEPROTOCOLO.AsString := lbNroProtocoloCCe.Caption;
      DMNFeFB.cdsNotaFiscal_NFeXML.LoadFromStream(XML);
      DMNFeFB.cdsNotaFiscal_NFe.Post;
      DMNFeFB.cdsNotaFiscal_NFe.ApplyUpdates(0);

      btCCe.Enabled := False;
      vAssunto := 'CARTA DE CORREÇÃO DA NOTA nº ' + DM1.tNotaFiscalNumNota.AsString + ' Série ' + DM1.tNotaFiscalSerie.AsString;

      fNotaFiscalCCe.Gravar_mCCe;
      fRelCCe := TfRelCCe.Create(Self);
      fRelCCe.RLReport1.Prepare;
      fRelCCe.RLReport1.SaveToFile(vNomeArqPdf);
      DM1.RLPDFFilter1.FilterPages(fRelCCe.RLReport1.Pages,1,-1,'',0);
      fRelCCe.RLReport1.Free;
      fRelCCe.Destroy;

      if ckUsarJv.Checked then
        Envia_MailJV(DM1.tClienteEmailNFe.AsString,vAssunto,' Em Anexo o XML referente a Carta de Correção, Chave de Acesso ' + lbChaveAcesso.Caption)
      else
      if ckUsarOutlookOLE.Checked then
        Envia_MailOLE(DM1.tClienteEmailNFe.AsString,vAssunto,' Em Anexo o XML referente a Carta de Correção, Chave de Acesso ' + lbChaveAcesso.Caption)
      else
      if ckUsarOutlook.Checked then
        Envia_Mail(DM1.tClienteEmailNFe.AsString,vAssunto,' Em Anexo o XML referente a Carta de Correção, Chave de Acesso ' + lbChaveAcesso.Caption)
      else
        Envia_Mail2(DM1.tClienteEmailNFe.AsString,vAssunto,' Em Anexo o XML referente a Carta de Correção, Chave de Acesso ' + lbChaveAcesso.Caption)
    end
    else
      ShowMessage('Problema na autorização da carta de correção, CCe não foi autorizada!');

  finally
    begin
      FreeAndNil(XML);
      Edit1.Text := vNomeArquivo;
    end;
  end;

end;

procedure TfNFe.prc_Monta_CorpoEmail;
begin
  vDadosCorpoEmail := '';
  vEmailAdicionais := '';
  DMNFeFB.cdsNFE_EMAIL.First;
  while not DMNFeFB.cdsNFE_EMAIL.Eof do
  begin
    if trim(DMNFeFB.cdsNFE_EMAILEMAIL.AsString) <> '' then
    begin
      if trim(vEmailAdicionais) = '' then
        vEmailAdicionais := DMNFeFB.cdsNFE_EMAILEMAIL.AsString
      else
        vEmailAdicionais := vEmailAdicionais + ',' + DMNFeFB.cdsNFE_EMAILEMAIL.AsString;
    end;
    DMNFeFB.cdsNFE_EMAIL.Next;
  end;

  //NFe 2.00
  if ComboBox1.ItemIndex = 1 then
    vDadosCorpoEmail := 'NOTA EM CONTINGENCIA FS  Impressa em formulário de seguranca'
  else
  if ComboBox1.ItemIndex = 2 then
    vDadosCorpoEmail := 'NOTA EM CONTINGENCIA SCAN'
  else
  if ComboBox1.ItemIndex = 3 then
    vDadosCorpoEmail := 'NOTA EM CONTINGENCIA FS-DA  Impressa em formulário de seguranca';
  vDadosCorpoEmail := vDadosCorpoEmail + #13;

  //*************

  vDadosCorpoEmail := vDadosCorpoEmail  + #13 + DM1.tFilialEmpresa.AsString;
  vDadosCorpoEmail := vDadosCorpoEmail  + #13 + DM1.tFilialCNPJ.AsString;
  vDadosCorpoEmail := vDadosCorpoEmail  + #13 + DM1.tFilialEndereco.AsString + ', ' + DM1.tFilialNumEnd.AsString;
  Posiciona_CidadeUF(DM1.tFilialCodCidade.AsInteger,1);
  vDadosCorpoEmail := vDadosCorpoEmail  + #13 + DM1.tCidadeNome.AsString + ' - ' + DM1.tCidadeEstado.AsString;
  vDadosCorpoEmail := vDadosCorpoEmail  + #13 + 'Fone: ' + DM1.tFilialTel.AsString;
end;

procedure TfNFe.btEnviarNovoClick(Sender: TObject);
var
  oNFe: TStrings;
  oNFeChave: TStrings;
  oNFeStream: TMemoryStream;
  Recibo: string;
  NroProtocolo: string;
  ChaveAcesso: string;
  vNumAux: Integer;
  vEnviarTxt: Boolean;
  MensagemErro: string;
begin
  if (DM1.tNotaFiscalNFeDenegada.AsBoolean) or (DM1.tNotaFiscalCancelada.AsBoolean) then
  begin
    ShowMessage('Nota Denegada ou Cancelada!');
    exit;
  end;
  //28/10/2015
  if (DM1.tNotaFiscalHrEmissao.IsNull) or (trim(DM1.tNotaFiscalHrEmissao.AsString) = '') or (DM1.tNotaFiscalHrEmissao.AsDateTime = 0) then
  begin
    DM1.tNotaFiscal.Edit;
    DM1.tNotaFiscalHrEmissao.AsDateTime := Now;
    DM1.tNotaFiscal.Post;
  end;
  //*********

  case ComboBox1.ItemIndex of
    0: vTipo_Emissao_NFe := '1';
    1: vTipo_Emissao_NFe := '2';
    3: vTipo_Emissao_NFe := '3';
    4: vTipo_Emissao_NFe := '5';
  end;
  vTipo_Ambiente_NFe    := IntToStr(ComboBox2.ItemIndex + 1);
  vFinalidade_NFe       := IntToStr(ComboBox3.ItemIndex + 1);
  vProcesso_Emissao_NFe := IntToStr(ComboBox4.ItemIndex);
  vEnviarTxt := (cbConvTxtXml.ItemIndex = 0);
  //*********

  case cbConvTxtXml.ItemIndex of
    0: vEnviarTxt := True;
    1: vEnviarTxt := False;
  end;

  if DM1.tNotaFiscalNumNota.AsInteger > 1 then
  begin
    vNumAux := DM1.tNotaFiscalNumNota.AsInteger - 1;
    qNotaAux.Close;
    qNotaAux.ParamByName('Filial').AsInteger  := DM1.tFilialCodigo.AsInteger;
    qNotaAux.ParamByName('Serie').AsString    := DM1.tNotaFiscalSerie.AsString;
    qNotaAux.ParamByName('NumNota').AsInteger := vNumAux;
    qNotaAux.Open;
    if (qNotaAux.IsEmpty) or (qNotaAuxNumNota.AsInteger <> vNumAux) then
    begin
      ShowMessage('*** Número da nota incorreto *** '+#13+
                  'Não existe a nota anterior número ' + IntToStr(vNumAux));
      exit;
    end;
  end;

  vNomeArquivo := Monta_Diretorio('X',DM1.tParametrosEndSalvarXMLNFe.AsString);
  vNomeArqPdf  := Monta_Diretorio('P',DM1.tParametrosEndSalvarPDFNFe.AsString);
  if vNomeArquivo = '' then
    exit;
  vTextoEnvio := TStringList.Create;
  vTextoEnvio.Clear;
  oNFe       := TStringList.Create;
  oNFeChave  := TStringList.Create;
  oNFeStream := TMemoryStream.Create;

  try
    ChaveAcesso := '';
    if vEnviarTxt then
      GerarNFeTXT(oNFe)
    else              
    begin
      vGerar_Chave_Antiga := 'N';
      Gera_Chave(False);
      vChave_XML := lbChaveAcesso.Caption;
      lbChaveAcesso.Caption := '';
      prc_Gerar_XML_400(oNFe);
    end;
    oNFe.SaveToStream(oNFeStream);
    oNFeStream.Position := 0;
    Memo1.Text := oNFe.Text;

    texto        := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
    vContigencia := Verifica_Contigencia;
    if not ConectadoInternet(Trim(DM1.tParametrosLocalServidorNFe.AsString), texto) then
      exit;

    ChaveAcesso := EnviarNFe( Trim(DM1.tParametrosLocalServidorNFe.AsString),
                              Texto,
                              oNFeStream,
                              vContigencia,'','' );

    //MessageDlg('Chave ' + ChaveAcesso, mtError, [mbno], 0);

    if Trim(ChaveAcesso) <> '' then
    begin
      //lbChaveAcesso.Caption  := ChaveAcesso;
      vChave_Geral := ChaveAcesso;

    //oNFeStream.Position    := 0;
    //vNomeArquivo := vNomeArquivo + '_' + ChaveAcesso + '.xml';
    //SalvarUTF8( oNFeStream, vNomeArquivo );

       btBuscarStatusClick(Sender);

       btEnviar.Enabled     := (Trim(ChaveAcesso) = '');
       btEnviarNovo.Enabled := (Trim(ChaveAcesso) = '');
       lbErro.Visible       := DM1.tNotaFiscalNFeDenegada.AsBoolean;
       lbErro.Caption       := DM1.tNotaFiscalNFeMotivoDenegada.AsString;
    end;

  finally
    FreeAndNil(oNFeStream);
    FreeAndNil(oNfe);
    FreeAndNil(oNfeChave);
    FreeAndNil(vTextoEnvio);
    Edit1.Text := vNomeArquivo;
    DM1.tNotaFiscal.IndexFieldNames := 'Filial;NumSeq';
    DM1.tNotaFiscal.FindKey([DM1.tFilialCodigo.AsInteger,DMNotaFiscal.vNumSeqNFe]);
  end;
end;

procedure TfNFe.btBuscarStatusClick(Sender: TObject);
var
  oNFeStream: TMemoryStream;
  DANFE: TMemoryStream;
  Recibo: string;
  NroProtocolo: string;
  ChaveAcesso: string;
  ConvTXT2XML: Boolean;
  CodigoErro: integer;
  MensagemErro: string;
  vCont: String;
begin
  if (trim(lbChaveAcesso.Caption) = '') and (trim(vGerar_Chave_Antiga) = '')  and (trim(vChave_Geral) = '') then
  begin
    vGerar_Chave_Antiga := 'N';
    Gera_Chave(False);
    vChave_Geral          := lbChaveAcesso.Caption;
    lbChaveAcesso.Caption := '';
  end;
  if trim(lbChaveAcesso.Caption) <> '' then
    vChave_Geral := lbChaveAcesso.Caption
  else
  if trim(edChaveNfe.Text) <> '' then
    vChave_Geral := edChaveNfe.Text;
  if trim(vChave_Geral) = '' then
  begin
    ShowMessage('Nota não enviada!');
    exit;
  end;

  vNomeArquivo := Monta_Diretorio('X',DM1.tParametrosEndSalvarXMLNFe.AsString);
  vNomeArqPdf  := Monta_Diretorio('P',DM1.tParametrosEndSalvarPDFNFe.AsString);

  if vNomeArquivo = '' then
    exit;

  texto        := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
  vContigencia := Verifica_Contigencia;
  if vContigencia = True then
    vCont := 'True'
  else
  if vContigencia = False then
    vCont := 'False'
  else
    vCont := 'Erro';

  if not ConectadoInternet(Trim(DM1.tParametrosLocalServidorNFe.AsString), texto) then
    exit;

  ChaveAcesso  := vChave_Geral;
  vChave_Geral := '';

  //MessageDlg('Parte ChaveAcesso ' + ChaveAcesso, mtError, [mbno], 0);
  Danfe      := TMemoryStream.Create;
  oNFeStream := TMemoryStream.Create;
  try
    BuscarStatusNF( Trim(DM1.tParametrosLocalServidorNFe.AsString),
                    texto,
                    ChaveAcesso,
                    vContigencia,
                    False,
                    oNFeStream,
                    Recibo,
                    NroProtocolo,
                    CodigoErro,
                    MensagemErro );

    if Trim(lbChaveAcesso.Caption) = '' then
      lbChaveAcesso.Caption  := ChaveAcesso;
    if Trim(lbRecibo.Caption) = '' then
      lbRecibo.Caption       := Recibo
    else
      Recibo := lbRecibo.Caption;
    if Trim(lbNroProtocolo.Caption) = '' then
      lbNroProtocolo.Caption := NroProtocolo
    else
      NroProtocolo := lbNroProtocolo.Caption;

    if Trim(lbNroProtocolo.Caption) = '' then
      lbChaveAcesso.Caption := '';

    oNFeStream.Position := 0;
    vNomeArquivo        := vNomeArquivo + '_' + lbChaveAcesso.Caption + '.xml';
    SalvarUTF8( oNFeStream, vNomeArquivo );

    if DM1.tParametrosUSA_DANFE_FLEXDOCS.AsString = 'S' then
    begin
      NFe_GerarDANFE( trim(DM1.tParametrosLocalServidorNFe.AsString),
                      //texto,'marca que é de homologação ou cancelada','Nome do cliente no canhoto',
                      texto,vMarca_Homologacao,vCliente_Canhoto,
                      oNFeStream,
                      DANFE );

      //Arquivo := ExtractFilePath(Application.ExeName) + 'DANFE.pdf';
      if FileExists(vNomeArqPdf) then
        DeleteFile(vNomeArqPdf);

      DANFE.Position := 0;
      DANFE.SaveToFile(vNomeArqPdf);
    end;

    if (CodigoErro > 0) and (CodigoErro <> 302) and (CodigoErro <> 301) then
      raise Exception.Create(MensagemErro)
    else
    begin
      DM1.tNotaFiscal.Edit;
      DM1.tNotaFiscalNFeRecibo.AsString      := Recibo;
      DM1.tNotaFiscalNFeProtocolo.AsString   := NroProtocolo;
      DM1.tNotaFiscalNFeChaveAcesso.AsString := Trim(ChaveAcesso);
      DM1.tNotaFiscalImpressa.AsBoolean      := True;
      DM1.tNotaFiscalNFeDenegada.AsBoolean := ((CodigoErro = 301) or (CodigoErro = 302));

      if CodigoErro = 301 then
        DM1.tNotaFiscalNFeMotivoDenegada.AsString := 'Irregularidade do Emitente'
      else
      if CodigoErro = 302 then
        DM1.tNotaFiscalNFeMotivoDenegada.AsString := 'Irregularidade do Destinatário';
      DM1.tNotaFiscal.Post;
    end;

    if (ckAnexarDanfe.Checked) then
    begin

      fRelDanfe := TfRelDanfe.Create(Self);
      fRelDANFE.RLReport1.Prepare;
      fRelDANFE.RLReport1.SaveToFile(vNomeArqPdf);
      DM1.RLPDFFilter1.FilterPages(fRelDANFE.RLReport1.Pages,1,-1,'',0);
      fRelDanfe.RLReport1.Free;
      fRelDanfe.Destroy;

    end
    else
      vNomeArqPdf := '';

    if (CodigoErro <> 301) and (CodigoErro <> 302) then
    begin
      if ckUsarJv.Checked then
        Envia_MailJV(DM1.tClienteEmailNFe.AsString,'NFe nº ' + DM1.tNotaFiscalNumNota.AsString,'Em anexo, arquivos referentes a Nota Eletrônica')
      else
      if ckUsarOutlookOLE.Checked then
        Envia_MailOLE(DM1.tClienteEmailNFe.AsString,'NFe nº ' + DM1.tNotaFiscalNumNota.AsString,'Em anexo, arquivos referentes a Nota Eletrônica')
      else
      if ckUsarOutlook.Checked then
        Envia_Mail(DM1.tClienteEmailNFe.AsString,'NFe nº ' + DM1.tNotaFiscalNumNota.AsString,'Em anexo, arquivos referentes a Nota Eletrônica')
      else
        Envia_Mail2(DM1.tClienteEmailNFe.AsString,'NFe nº ' + DM1.tNotaFiscalNumNota.AsString,'Em anexo, arquivos referentes a Nota Eletrônica');
    end;

    lbErro.Visible   := DM1.tNotaFiscalNFeDenegada.AsBoolean;
    lbErro.Caption   := DM1.tNotaFiscalNFeMotivoDenegada.AsString;

  finally
    FreeAndNil(oNFeStream);
    FreeAndNil(vTextoEnvio);
    FreeAndNil(DANFE);
    Edit1.Text := vNomeArquivo;
    DM1.tNotaFiscal.IndexFieldNames := 'Filial;NumSeq';
    DM1.tNotaFiscal.FindKey([DM1.tFilialCodigo.AsInteger,DMNotaFiscal.vNumSeqNFe]);
  end;
end;

procedure TfNFe.CheckBox3Click(Sender: TObject);
begin
  btEnviarNovo.Enabled   := CheckBox3.Checked;
  btBuscarStatus.Enabled := CheckBox3.Checked;
  btEnviar.Enabled       := not(CheckBox3.Checked);
end;

procedure TfNFe.prc_Controle_Envio_Email(sEmail: String);
begin
  if ckUsarJv.Checked then
    Envia_MailJV(sEmail,'NFe nº ' + DM1.tNotaFiscalNumNota.AsString,'Em anexo, arquivos referentes a Nota Eletrônica')
  else
  if ckUsarOutlookOLE.Checked then
    Envia_MailOLE(sEmail,'NFe nº ' + DM1.tNotaFiscalNumNota.AsString,'Em anexo, arquivos referentes a Nota Eletrônica')
  else
  if ckUsarOutlook.Checked then
    Envia_Mail(sEmail,'NFe nº ' + DM1.tNotaFiscalNumNota.AsString,'Em anexo, arquivos referentes a Nota Eletrônica')
  else
    Envia_Mail2(sEmail,'NFe nº ' + DM1.tNotaFiscalNumNota.AsString,'Em anexo, arquivos referentes a Nota Eletrônica');
end;

procedure TfNFe.prc_Configura_Variaveis_Envio;
begin
  case ComboBox1.ItemIndex of
    0: vTipo_Emissao_NFe := '1';
    1: vTipo_Emissao_NFe := '2';
    3: vTipo_Emissao_NFe := '3';
    4: vTipo_Emissao_NFe := '5';
  end;
  vTipo_Ambiente_NFe    := IntToStr(ComboBox2.ItemIndex + 1);
  vFinalidade_NFe       := IntToStr(ComboBox3.ItemIndex + 1);
  vProcesso_Emissao_NFe := IntToStr(ComboBox4.ItemIndex);
  vMarca_Homologacao    := '';
  vCliente_Canhoto      := '';
  if DM1.tClienteCodigo.AsInteger <> DM1.tNotaFiscalCodCli.AsInteger then
    DM1.tCliente.Locate('CODIGO',DM1.tNotaFiscalCodCli.AsInteger,([Locaseinsensitive]));
  vCliente_Canhoto := DM1.tClienteNome.AsString;
  if DM1.tClientePessoa.AsString = 'J' then
    vCliente_Canhoto := vCliente_Canhoto + ', CNPJ: ' + DM1.tClienteCgcCpf.AsString
  else
  if DM1.tClientePessoa.AsString = 'F' then
    vCliente_Canhoto := vCliente_Canhoto + ', CPF: ' + DM1.tClienteCgcCpf.AsString
  else
    vCliente_Canhoto := vCliente_Canhoto + ', DOC: ' + DM1.tClienteCgcCpf.AsString;
  vCliente_Canhoto := 'Recebemos de ' + DM1.tFilialEmpresa.AsString + ', os produtos constantes da nota fiscal indicada ao lado: '
                    + 'Data de Emissão:' + DM1.tNotaFiscalDtEmissao.AsString
                    + ', Valor Total: R$' + FormatFloat('###,###,##0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat)
                    + ', Destinatário: ' + vCliente_Canhoto;
  if vTipo_Ambiente_NFe = '2' then
    vMarca_Homologacao := 'HOMOLOGAÇÃO ';
  if DM1.tNotaFiscalCancelada.AsBoolean then
    vMarca_Homologacao := 'CANCELADA'
  else
  if DM1.tNotaFiscalNFeDenegada.AsBoolean then
    vMarca_Homologacao := 'DENEGADA';
end;

procedure TfNFe.prc_Danfe_Flexdocs;
var
  oNFe: TStrings;
  oNFeStream, Danfe: TMemoryStream;
  vNomeArq: String;
  vArqAux: String;
begin
  fDMConsNotaEletronica := TDMConsNotaEletronica.Create(Self);

  oNFe       := TStringList.Create;
  oNFeStream := TMemoryStream.Create;
  Danfe      := TMemoryStream.Create;
  prc_Configura_Variaveis_Envio;
  if (trim(DM1.tNotaFiscalNFeChaveAcesso.AsString) <> '') and (ComboBox6.ItemIndex <= 0) then
  begin
    fDMConsNotaEletronica.cdsNota_Fiscal_Eletronica.Close;
    fDMConsNotaEletronica.sdsNota_Fiscal_Eletronica.ParamByName('CHAVE_ACESSO').AsString := DM1.tNotaFiscalNFeChaveAcesso.AsString;
    fDMConsNotaEletronica.cdsNota_Fiscal_Eletronica.Open;
    fDMConsNotaEletronica.cdsNota_Fiscal_EletronicaXML_ASSINADO_PROC.SaveToStream(oNFeStream);

    //oNFe.LoadFromFile(vArqAux);
  end
  else
  if (trim(DM1.tNotaFiscalNFeChaveAcesso.AsString) = '') or (ComboBox6.ItemIndex = 1) then
  begin
    vGerar_Chave_Antiga := 'N';
    Gera_Chave(False);
    vChave_XML := lbChaveAcesso.Caption;
    lbChaveAcesso.Caption := '';
    prc_Gerar_XML_400(oNFe);
    oNFe.SaveToStream(oNFeStream);
  end
  else
  if (ComboBox6.ItemIndex = 2) then
  begin
    vArqAux := Monta_Diretorio('X',DM1.tParametrosEndSalvarXMLNFe.AsString);
    vArqAux := vArqAux + '_' + DM1.tNotaFiscalNFeChaveAcesso.AsString + '.xml';
    //oNFe.LoadFromFile(vArqAux);
    oNFeStream.LoadFromFile(vArqAux);

    {vGerar_Chave_Antiga := 'N';
    Gera_Chave(False);
    vChave_XML := lbChaveAcesso.Caption;
    lbChaveAcesso.Caption := '';
    prc_Gerar_XML_310(fDMCadNotaFiscal,fDMNFe,oNFe);
    oNFe.SaveToStream(oNFeStream);}
  end;

  oNFeStream.Position := 0;
  //oNFeStream.SaveToFile('C:\a\teste.xml');

  NFe_GerarDANFE( trim(DM1.tParametrosLocalServidorNFe.AsString),
                   //texto,'marca que é de homologação ou cancelada','Nome do cliente no canhoto',
                   //texto,vMarca_Homologacao,'',
                   texto,vMarca_Homologacao,vCliente_Canhoto,
                   oNFeStream,
                   DANFE );

  vNomeArq := ExtractFilePath(Application.ExeName) + 'Temp';
  if not DirectoryExists(vNomeArq) then
    CreateDir(vNomeArq);

  vNomeArq := vNomeArq + '\DANFE_ENV_' + FormatDateTime('YYYYMMDD',Date) +  '_' + FormatDateTime('HHMMSS',Time) + '.pdf';
  if FileExists(vNomeArq) then
    DeleteFile(vNomeArq);

  DANFE.Position := 0;
  DANFE.SaveToFile(vNomeArq);

  ShellExecute(Application.Handle, 'Open', PChar(vNomeArq), nil, nil, SW_SHOWMAXIMIZED);

  FreeAndNil(fDMConsNotaEletronica);
  FreeAndNil(oNFe);
  FreeAndNil(oNFeStream);
  FreeAndNil(Danfe);
end;

procedure TfNFe.prc_Imprimir_Danfe(Tipo: String);
begin
  DM1.tFilial.Locate('Codigo',DM1.tNotaFiscalFilial.AsInteger,[loCaseInsensitive]);

  if DM1.tClienteCodigo.AsInteger <> DM1.tNotaFiscalCodCli.AsInteger then
    DM1.tCliente.Locate('CODIGO',DM1.tNotaFiscalCodCli.AsInteger,[loCaseInsensitive]);
  vEmail_Fortes := DM1.tClienteEmailNFe.AsString;
  vEmail_Assunto_Fortes := 'Nota Fiscal Nº ' +  DM1.tNotaFiscalNumNota.AsString;
  vEmail_Fortes_Corpo   := 'Em Anexo Nota Fiscal Nº ' + DM1.tNotaFiscalNumNota.AsString;
  vTipo_Config_Email    := 1;

  fRelDANFE := TfRelDANFE.Create(Self);
  //fRelDANFE.prc_Mudar_DataSet;
  case ComboBox2.ItemIndex of
    0: fRelDANFE.vAmbiente := '1';
    1: fRelDANFE.vAmbiente := '2';
  end;
  if Tipo = 'I' then
  begin
    //fDMRel.RLPDFFilter1.FileName := 'Reldanfe';
    fRelDANFE.RLReport1.PreviewModal;
  end
  else
  begin
    fRelDANFE.RLReport1.Prepare;
    fRelDANFE.RLReport1.SaveToFile(vNomeArqPdf);
    DM1.RLPDFFilter1.FileName := vNomeArqPdf;
    DM1.RLPDFFilter1.FilterPages(fRelDANFE.RLReport1.Pages,1,-1,'',0);
  end;
  fRelDANFE.RLReport1.Free;
  fRelDanfe.Destroy;
end;

procedure TfNFe.prc_Controlar_Envio_Email(Tipo: String);
var
  vTexto: String;
  vTexto2: String;
begin
  if Tipo <> 'C' then
  begin
    if (ckAnexarDanfe.Checked) then
      prc_Imprimir_Danfe('E')
    else
      vNomeArqPdf := '';
  end;
  if Tipo = 'C' then
  begin
    vTexto  := 'NOTA CANCELADA nº ' + DM1.tNotaFiscalNumNota.AsString;
    vTexto2 := 'Em Anexo o XML referente a Nota Cancelada';
  end
  else
  begin
    vTexto  := 'NFe nº ' + DM1.tNotaFiscalNumNota.AsString;
    vTexto2 := 'Em anexo, arquivos referentes a Nota Eletrônica';
  end;
  if ckUsarJv.Checked then
    Envia_MailJV(DM1.tClienteEmailNFe.AsString,vTexto,vTexto2)
  else
  if ckUsarOutlookOLE.Checked then
    Envia_MailOLE(DM1.tClienteEmailNFe.AsString,vTexto,vTexto2)
  else
  if ckUsarOutlook.Checked then
    Envia_Mail(DM1.tClienteEmailNFe.AsString,vTexto,vTexto2)
  else
    Envia_Mail2(DM1.tClienteEmailNFe.AsString,vTexto,vTexto2);
end;

procedure TfNFe.btDownloadWebClick(Sender: TObject);
var
  vChave_Aux: String;
  oNFeStream: TMemoryStream;
begin
  {vChave_Aux := '';
  if (trim(lbChaveAcesso.Caption) <> '') and (trim(edChaveNfe.Text) = '') then
     edChaveNfe.Text := lbChaveAcesso.Caption
  else
  if (trim(lbChaveAcesso.Caption) = '') or (trim(edChaveNfe.Text) = '') then
  begin
    Gera_Chave(False);
    edChaveNfe.Text := lbChaveAcesso.Caption;
    vChave_Aux      := lbChaveAcesso.Caption;
    lbChaveAcesso.Caption := '';
  end;
  texto := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
  oNFeStream := TMemoryStream.Create;
  try
    DownloadNFeWeb(Trim(DM1.tParametrosLocalServidorNFe.AsString),
                   texto,
                   edChaveNfe.Text,
                    oNFeStream);
  finally
    oNFeStream.SaveToFile('c:\a\testeaaa.xml');
  end;
  FreeAndNil(oNFeStream);}
end;

end.
