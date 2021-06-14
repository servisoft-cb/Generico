unit URelCCe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RLReport, DB, RLBarcode, jpeg;

type
  TfRelCCe = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand7: TRLBand;
    RLImage1: TRLImage;
    RLLabel67: TRLLabel;
    RLDraw49: TRLDraw;
    rlbcChaveAcesso1: TRLBarcode;
    RLDraw50: TRLDraw;
    rllbEnd1: TRLLabel;
    rllbCidade1: TRLLabel;
    rllbFone1: TRLLabel;
    rllbCep1: TRLLabel;
    RLLabel77: TRLLabel;
    RLLabel79: TRLLabel;
    RLDraw55: TRLDraw;
    RLLabel23: TRLLabel;
    RLBand2: TRLBand;
    RLBand8: TRLBand;
    RLLabel81: TRLLabel;
    RLDraw56: TRLDraw;
    RLLabel82: TRLLabel;
    RLDraw58: TRLDraw;
    RLDBText56: TRLDBText;
    RLLabel83: TRLLabel;
    RLDraw59: TRLDraw;
    RLLabel84: TRLLabel;
    rllbEndCliente: TRLLabel;
    RLDraw60: TRLDraw;
    RLDBText57: TRLDBText;
    RLLabel85: TRLLabel;
    RLDraw61: TRLDraw;
    RLDBText58: TRLDBText;
    RLLabel86: TRLLabel;
    RLDraw62: TRLDraw;
    RLLabel87: TRLLabel;
    rllbCidadeCliente: TRLLabel;
    RLDraw63: TRLDraw;
    RLLabel88: TRLLabel;
    rllbFoneCliente: TRLLabel;
    RLDraw64: TRLDraw;
    RLLabel89: TRLLabel;
    RLDBText59: TRLDBText;
    RLDraw65: TRLDraw;
    RLDBText60: TRLDBText;
    RLLabel90: TRLLabel;
    RLDraw84: TRLDraw;
    rllbTextoProt1: TRLLabel;
    rllbProtocolo1: TRLLabel;
    rllbInscrEstadual1: TRLLabel;
    rllbCNPJ1: TRLLabel;
    rllbChaveAcesso1: TRLLabel;
    RLBand12: TRLBand;
    RLDraw17: TRLDraw;
    RLImage2: TRLImage;
    RLLabel39: TRLLabel;
    RLDraw18: TRLDraw;
    rlbcChaveAcesso2: TRLBarcode;
    rllbEnd2: TRLLabel;
    rllbCidade2: TRLLabel;
    rllbFone2: TRLLabel;
    rllbCep2: TRLLabel;
    RLLabel118: TRLLabel;
    RLLabel120: TRLLabel;
    RLDraw24: TRLDraw;
    RLLabel121: TRLLabel;
    RLDraw71: TRLDraw;
    rllbTextoProt2: TRLLabel;
    rllbProtocolo2: TRLLabel;
    rllbInscrEstadual2: TRLLabel;
    rllbCNPJ2: TRLLabel;
    rllbChaveAcesso2: TRLLabel;
    rllbNomeCliente: TRLLabel;
    RLBand9: TRLBand;
    RLLabel64: TRLLabel;
    RLDraw72: TRLDraw;
    RLLabel68: TRLLabel;
    RLLabel69: TRLLabel;
    RLLabel70: TRLLabel;
    RLLabel71: TRLLabel;
    RLLabel54: TRLLabel;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLDraw1: TRLDraw;
    RLLabel3: TRLLabel;
    RLMemo1: TRLMemo;
    RLBand1: TRLBand;
    RLDraw2: TRLDraw;
    RLLabel5: TRLLabel;
    RLMemo2: TRLMemo;
    rllbEmpresa1: TRLLabel;
    rllbEmpresa2: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand7BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand8BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand12BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand9BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    procedure Monta_Cabecalho(Posicao : Integer);
    
  public
    { Public declarations }
  end;

var
  fRelCCe: TfRelCCe;

implementation

uses UDM1, UEmissaoNotaFiscal, uNFe, UDMNotaFiscal, UDMNFeFB,
  UNotaFiscalCCe;

{$R *.dfm}

procedure TfRelCCe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCCe.RLBand7BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := (DM1.tParametrosTipoDoLogoNFe.AsString <> 'R');
  if not PrintIt then
    exit;
  Monta_Cabecalho(1);
end;

procedure TfRelCCe.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLMemo1.Lines.Clear;
  RLMemo1.Lines.Text := fNotaFiscalCCe.mCCeObs.Value;
end;

procedure TfRelCCe.RLBand8BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  rllbEndCliente.Caption := DM1.tClienteEndereco.AsString + ', ' + DM1.tClienteNumEnd.AsString + ' ' +
                            DM1.tClienteComplEndereco.AsString;

  fNFe.Posiciona_CidadeUF(DM1.tClienteCodCidade.AsInteger,DM1.tClienteIDPais.AsInteger);
  rllbCidadeCliente.Caption := DM1.tCidadeNome.AsString;

  rllbFoneCliente.Caption := '';
  if DM1.tClienteTelefone.AsString <> '' then
    rllbFoneCliente.Caption := DM1.tClienteTelefone.AsString
  else
  if DM1.tClienteTelefone2.AsString <> '' then
    rllbFoneCliente.Caption := DM1.tClienteTelefone2.AsString;
  if DM1.tClienteFax.AsString <> '' then
    rllbFoneCliente.Caption := rllbFoneCliente.Caption + ' / ' + DM1.tClienteFax.AsString;

  rllbNomeCliente.Caption := DM1.tClienteNome.AsString;
end;

procedure TfRelCCe.Monta_Cabecalho(Posicao : Integer);
var
  vTexto : String;
  i : Integer;
begin
  TRLBarcode(FindComponent('rlbcChaveAcesso'+IntToStr(posicao))).Caption  := DM1.tNotaFiscalNFeChaveAcesso.AsString;

  TRLImage(FindComponent('RLImage'+IntToStr(Posicao))).Stretch := DM1.tParametrosAjusteLogoNFeAutomatico.AsBoolean;

  if FileExists(DM1.tFilialEndLogo.AsString) then
    TRLImage(FindComponent('RLImage'+IntToStr(Posicao))).Picture.LoadFromFile(DM1.tFilialEndLogo.AsString)
  else
    TRLImage(FindComponent('RLImage'+IntToStr(Posicao))).Picture := nil;

  DM1.tNatOperacao.IndexFieldNames := 'Codigo';
  fNFe.Posiciona_CidadeUF(DM1.tFilialCodCidade.AsInteger,1);

  TRLLabel(FindComponent('rllbEmpresa'+IntToStr(Posicao))).Caption := DM1.tFilialEmpresa.AsString;
  TRLLabel(FindComponent('rllbEnd'+IntToStr(Posicao))).Caption     := DM1.tFilialEndereco.AsString + ', ' + DM1.tFilialNumEnd.AsString;
  TRLLabel(FindComponent('rllbCep'+IntToStr(Posicao))).Caption     := 'CEP: ' + DM1.tFilialCep.AsString + ' - ' + DM1.tFilialBairro.AsString;
  TRLLabel(FindComponent('rllbCidade'+IntToStr(Posicao))).Caption  := DM1.tCidadeNome.AsString + ' - ' + DM1.tCidadeEstado.AsString;
  TRLLabel(FindComponent('rllbFone'+IntToStr(Posicao))).Caption    := DM1.tFilialTel.AsString;
  TRLLabel(FindComponent('rllbInscrEstadual'+IntToStr(Posicao))).Caption := DM1.tFilialInscr.AsString;
  TRLLabel(FindComponent('rllbCNPJ'+IntToStr(Posicao))).Caption    := DM1.tFilialCNPJ.AsString;

  TRLLabel(FindComponent('rllbChaveAcesso'+IntToStr(Posicao))).Caption := '';
  vTexto := DM1.tNotaFiscalNFeChaveAcesso.AsString;
  i := 1;
  while i < 44 do                        
  begin
    if i > 1 then
      TRLLabel(FindComponent('rllbChaveAcesso'+IntToStr(Posicao))).Caption := TRLLabel(FindComponent('rllbChaveAcesso'+IntToStr(Posicao))).Caption + ' ';
    TRLLabel(FindComponent('rllbChaveAcesso'+IntToStr(Posicao))).Caption   := TRLLabel(FindComponent('rllbChaveAcesso'+IntToStr(Posicao))).Caption + copy(vTexto,i,4);
    i := i + 4;
  end;

  TRLLabel(FindComponent('rllbTextoProt'+IntToStr(Posicao))).Caption := 'PROTOCOLO DE AUTORIZAÇÃO DE USO';
  TRLLabel(FindComponent('rllbProtocolo'+IntToStr(Posicao))).Caption := fNotaFiscalCCe.mCCeNumProtocolo.AsString;
end;

procedure TfRelCCe.RLBand12BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := (DM1.tParametrosTipoDoLogoNFe.AsString <> 'Q');
  if not PrintIt then
    exit;
  Monta_Cabecalho(2);
end;

procedure TfRelCCe.RLBand9BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel69.Caption := DM1.tNotaFiscalNumNota.AsString;
  RLLabel71.Caption := DM1.tNotaFiscalSerie.AsString;
  RLLabel1.Caption  := DMNFeFB.cdsNotaFiscal_NFeITEMTIPO.AsString;
end;

end.
