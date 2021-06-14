unit URelDanfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RLReport, DB, RLBarcode, jpeg;

type
  TfRelDANFE = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLSubDetail3: TRLSubDetail;
    RLBand3: TRLBand;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLDraw3: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    RLDraw12: TRLDraw;
    RLDraw13: TRLDraw;
    RLDraw14: TRLDraw;
    RLDraw15: TRLDraw;
    RLBand4: TRLBand;
    RLBand7: TRLBand;
    RLImage1: TRLImage;
    RLLabel67: TRLLabel;
    RLDraw49: TRLDraw;
    RLLabel68: TRLLabel;
    rlbcChaveAcesso1: TRLBarcode;
    RLLabel69: TRLLabel;
    RLLabel70: TRLLabel;
    RLLabel71: TRLLabel;
    RLLabel72: TRLLabel;
    RLLabel73: TRLLabel;
    rllbSaidaEntrada1: TRLLabel;
    RLDraw50: TRLDraw;
    rllbEnd1: TRLLabel;
    rllbCidade1: TRLLabel;
    rllbFone1: TRLLabel;
    rllbCep1: TRLLabel;
    rllbHome1: TRLLabel;
    RLLabel74: TRLLabel;
    RLDBText49: TRLDBText;
    rllbPagina: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel75: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLDraw51: TRLDraw;
    rllbNatOperacao1: TRLLabel;
    RLLabel76: TRLLabel;
    RLDraw52: TRLDraw;
    RLLabel77: TRLLabel;
    RLDraw53: TRLDraw;
    RLLabel78: TRLLabel;
    RLDraw54: TRLDraw;
    RLLabel79: TRLLabel;
    RLDraw55: TRLDraw;
    RLLabel23: TRLLabel;
    RLBand1: TRLBand;
    RLDraw1: TRLDraw;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    rllbNumNota1: TRLLabel;
    rllbVecto1: TRLLabel;
    rllbValor1: TRLLabel;
    rllbNumNota2: TRLLabel;
    rllbVecto2: TRLLabel;
    rllbValor2: TRLLabel;
    rllbNumNota3: TRLLabel;
    rllbVecto3: TRLLabel;
    rllbValor3: TRLLabel;
    rllbNumNota4: TRLLabel;
    rllbVecto4: TRLLabel;
    rllbValor4: TRLLabel;
    rllbNumNota5: TRLLabel;
    rllbVecto5: TRLLabel;
    rllbValor5: TRLLabel;
    rllbNumNota6: TRLLabel;
    rllbVecto6: TRLLabel;
    rllbValor6: TRLLabel;
    rllbNumNota7: TRLLabel;
    rllbVecto7: TRLLabel;
    rllbValor7: TRLLabel;
    rllbNumNota8: TRLLabel;
    rllbVecto8: TRLLabel;
    rllbValor8: TRLLabel;
    rllbNumNota9: TRLLabel;
    rllbVecto9: TRLLabel;
    rllbValor9: TRLLabel;
    RLBand2: TRLBand;
    RLLabel12: TRLLabel;
    RLDraw20: TRLDraw;
    RLLabel32: TRLLabel;
    RLDBText24: TRLDBText;
    RLDraw26: TRLDraw;
    RLLabel33: TRLLabel;
    RLDBText25: TRLDBText;
    RLDraw27: TRLDraw;
    RLLabel34: TRLLabel;
    RLDraw28: TRLDraw;
    RLLabel36: TRLLabel;
    RLDraw30: TRLDraw;
    RLLabel37: TRLLabel;
    RLDraw5: TRLDraw;
    RLLabel35: TRLLabel;
    RLDBText27: TRLDBText;
    RLDBText28: TRLDBText;
    RLDraw6: TRLDraw;
    RLDraw29: TRLDraw;
    RLDBText30: TRLDBText;
    RLLabel40: TRLLabel;
    RLDraw32: TRLDraw;
    RLDraw33: TRLDraw;
    RLDBText29: TRLDBText;
    RLLabel42: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLDraw2: TRLDraw;
    RLLabel16: TRLLabel;
    RLDBText2: TRLDBText;
    RLDraw34: TRLDraw;
    RLLabel43: TRLLabel;
    RLDBText32: TRLDBText;
    RLDraw36: TRLDraw;
    RLDBText34: TRLDBText;
    RLLabel45: TRLLabel;
    RLDraw37: TRLDraw;
    RLLabel46: TRLLabel;
    RLDraw38: TRLDraw;
    RLLabel47: TRLLabel;
    RLDBText36: TRLDBText;
    RLDraw40: TRLDraw;
    RLLabel49: TRLLabel;
    RLDraw41: TRLDraw;
    RLLabel50: TRLLabel;
    RLDraw42: TRLDraw;
    RLDBText39: TRLDBText;
    RLLabel53: TRLLabel;
    RLLabel44: TRLLabel;
    RLLabel55: TRLLabel;
    RLDBText33: TRLDBText;
    RLDraw35: TRLDraw;
    RLLabel56: TRLLabel;
    RLDBText40: TRLDBText;
    RLDraw39: TRLDraw;
    RLLabel48: TRLLabel;
    RLDBText35: TRLDBText;
    RLDraw43: TRLDraw;
    RLLabel51: TRLLabel;
    RLDBText38: TRLDBText;
    RLDraw44: TRLDraw;
    RLLabel52: TRLLabel;
    RLDBText41: TRLDBText;
    RLDraw45: TRLDraw;
    RLLabel57: TRLLabel;
    RLDBText42: TRLDBText;
    RLDraw46: TRLDraw;
    RLLabel58: TRLLabel;
    RLDBText43: TRLDBText;
    RLDraw47: TRLDraw;
    RLLabel59: TRLLabel;
    RLDBText44: TRLDBText;
    RLDraw48: TRLDraw;
    RLLabel60: TRLLabel;
    RLDBText45: TRLDBText;
    RLLabel17: TRLLabel;
    RLDraw66: TRLDraw;
    RLLabel18: TRLLabel;
    rllbCidadeTransp: TRLLabel;
    RLDraw4: TRLDraw;
    RLLabel20: TRLLabel;
    RLDraw67: TRLDraw;
    RLLabel41: TRLLabel;
    RLDraw68: TRLDraw;
    RLLabel61: TRLLabel;
    RLDraw69: TRLDraw;
    RLLabel62: TRLLabel;
    RLDraw70: TRLDraw;
    RLLabel63: TRLLabel;
    RLDBText14: TRLDBText;
    rlmNomeProduto: TRLMemo;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLBand8: TRLBand;
    RLDraw57: TRLDraw;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText53: TRLDBText;
    RLDBText54: TRLDBText;
    RLLabel80: TRLLabel;
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
    RLLabel13: TRLLabel;
    RLLabel19: TRLLabel;
    RLBand9: TRLBand;
    RLDraw78: TRLDraw;
    RLDraw79: TRLDraw;
    RLLabel64: TRLLabel;
    RLDBText18: TRLDBText;
    RLLabel91: TRLLabel;
    RLLabel92: TRLLabel;
    RLLabel93: TRLLabel;
    RLLabel94: TRLLabel;
    RLDraw80: TRLDraw;
    RLDraw81: TRLDraw;
    RLLabel95: TRLLabel;
    RLLabel96: TRLLabel;
    RLDraw82: TRLDraw;
    RLLabel97: TRLLabel;
    RLDBText19: TRLDBText;
    RLDraw83: TRLDraw;
    rllbTextoA1: TRLLabel;
    rllbTextoB1: TRLLabel;
    RLDraw84: TRLDraw;
    rllbTextoProt1: TRLLabel;
    rllbProtocolo1: TRLLabel;
    rlbcContingencia1: TRLBarcode;
    RLBand10: TRLBand;
    RLLabel101: TRLLabel;
    RLDraw85: TRLDraw;
    rllbInscrEstadual1: TRLLabel;
    rllbCNPJ1: TRLLabel;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText4: TRLDBText;
    RLBand11: TRLBand;
    RLDraw16: TRLDraw;
    rlVlrTotalItens: TRLLabel;
    rlVlrTotalNota: TRLLabel;
    rllbChaveAcesso1: TRLLabel;
    RLBand6: TRLBand;
    RLDraw76: TRLDraw;
    RLLabel65: TRLLabel;
    RLDraw77: TRLDraw;
    RLLabel66: TRLLabel;
    rlmDadosAdicionais: TRLMemo;
    RLBand5: TRLBand;
    RLLabel38: TRLLabel;
    RLDraw31: TRLDraw;
    RLBand12: TRLBand;
    RLDraw17: TRLDraw;
    RLImage2: TRLImage;
    RLLabel39: TRLLabel;
    RLDraw18: TRLDraw;
    RLLabel54: TRLLabel;
    rlbcChaveAcesso2: TRLBarcode;
    RLLabel102: TRLLabel;
    RLLabel103: TRLLabel;
    RLLabel104: TRLLabel;
    RLLabel105: TRLLabel;
    RLLabel106: TRLLabel;
    rllbSaidaEntrada2: TRLLabel;
    rllbEnd2: TRLLabel;
    rllbCidade2: TRLLabel;
    rllbFone2: TRLLabel;
    rllbCep2: TRLLabel;
    rllbHome2: TRLLabel;
    RLLabel113: TRLLabel;
    RLDBText22: TRLDBText;
    RLLabel114: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel115: TRLLabel;
    RLSystemInfo4: TRLSystemInfo;
    RLDraw19: TRLDraw;
    rllbNatOperacao2: TRLLabel;
    RLLabel117: TRLLabel;
    RLDraw21: TRLDraw;
    RLLabel118: TRLLabel;
    RLDraw22: TRLDraw;
    RLLabel119: TRLLabel;
    RLDraw23: TRLDraw;
    RLLabel120: TRLLabel;
    RLDraw24: TRLDraw;
    RLLabel121: TRLLabel;
    RLLabel122: TRLLabel;
    RLDBText23: TRLDBText;
    RLDraw25: TRLDraw;
    rllbTextoA2: TRLLabel;
    rllbTextoB2: TRLLabel;
    RLDraw71: TRLDraw;
    rllbTextoProt2: TRLLabel;
    rllbProtocolo2: TRLLabel;
    rlbcContingencia2: TRLBarcode;
    rllbInscrEstadual2: TRLLabel;
    rllbCNPJ2: TRLLabel;
    rllbChaveAcesso2: TRLLabel;
    rllbNomeCliente: TRLLabel;
    rllbNumNota10: TRLLabel;
    rllbVecto10: TRLLabel;
    rllbValor10: TRLLabel;
    rllbNumNota11: TRLLabel;
    rllbVecto11: TRLLabel;
    rllbValor11: TRLLabel;
    rllbNumNota12: TRLLabel;
    rllbVecto12: TRLLabel;
    rllbValor12: TRLLabel;
    rllbEmpresa1: TRLLabel;
    rllbEmpresa2: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand7BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand8BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand9BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand10BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand12BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }

    procedure Monta_Faturas(Prazo : String; Posicao : Integer);

    //NFe 2.00
    procedure Monta_Cabecalho(Posicao : Integer);
  public
    { Public declarations }
    vAmbiente : String;
  end;

var
  fRelDANFE: TfRelDANFE;

implementation

uses UDM1, UEmissaoNotaFiscal, uNFe, UDMNotaFiscal, StrUtils;

{$R *.dfm}

procedure TfRelDANFE.Monta_Faturas(Prazo : String; Posicao : Integer);
begin
  if Prazo = 'OM' then
  begin
    fNFe.mParcelaNFe.First;
    TRLLabel(FindComponent('rllbNumNota'+IntToStr(Posicao))).Visible := True;
    TRLLabel(FindComponent('rllbNumNota'+IntToStr(Posicao))).Caption := 'Total de parcelas ' + IntToStr(fNFe.mParcelaNFe.RecordCount);
    TRLLabel(FindComponent('rllbNumNota'+IntToStr(4))).Visible       := True;
    TRLLabel(FindComponent('rllbNumNota'+IntToStr(4))).Caption       := 'Primeiro Vencimento ' + fNFe.mParcelaNFeDtVencimento.AsString
                                                                      + ' no valor de R$ ' + FormatFloat('0.00',fNFe.mParcelaNFeValor.AsFloat);
  end
  else
  if Prazo = 'OT' then
  begin
    DM1.tNotaFiscalParc.First;
    TRLLabel(FindComponent('rllbNumNota'+IntToStr(Posicao))).Visible := True;
    TRLLabel(FindComponent('rllbNumNota'+IntToStr(Posicao))).Caption := 'Total de parcelas ' + IntToStr(DM1.tNotaFiscalParc.RecordCount);
    TRLLabel(FindComponent('rllbNumNota'+IntToStr(4))).Visible       := True;
    TRLLabel(FindComponent('rllbNumNota'+IntToStr(4))).Caption       := 'Primeiro Vencimento ' + DM1.tNotaFiscalParcDtVenc.AsString
                                                                      + ' no valor de R$ ' + FormatFloat('0.00',DM1.tNotaFiscalParcVlrVenc.AsFloat);
  end
  else
  if Prazo = 'M' then
  begin
    TRLLabel(FindComponent('rllbNumNota'+IntToStr(Posicao))).Visible := True;
    TRLLabel(FindComponent('rllbVecto'+IntToStr(Posicao))).Visible   := True;
    TRLLabel(FindComponent('rllbValor'+IntToStr(Posicao))).Visible   := True;
    if DM1.tNotaFiscalCondPgto.AsString = 'V' then
      TRLLabel(FindComponent('rllbNumNota'+IntToStr(Posicao))).Caption := fNFe.mParcelaNFeNumNota.AsString
    else
    begin
      TRLLabel(FindComponent('rllbNumNota'+IntToStr(Posicao))).Caption := fNFe.mParcelaNFeNumNota.AsString + '/' + fNFe.mParcelaNFeParcela.AsString;
      if fNFe.mParcelaNFeParcela.AsInteger < 1 then
        TRLLabel(FindComponent('rllbNumNota'+IntToStr(Posicao))).Caption := TRLLabel(FindComponent('rllbNumNota'+IntToStr(Posicao))).Caption + 'ENT';
    end;
    TRLLabel(FindComponent('rllbVecto'+IntToStr(Posicao))).Caption   := fNFe.mParcelaNFeDtVencimento.AsString;
    TRLLabel(FindComponent('rllbValor'+IntToStr(Posicao))).Caption   := FormatFloat('###,###,##0.00',fNFe.mParcelaNFeValor.AsFloat);
  end
  else
  if Prazo = 'V' then
  begin
    TRLLabel(FindComponent('rllbNumNota'+IntToStr(Posicao))).Visible := True;
    TRLLabel(FindComponent('rllbVecto'+IntToStr(Posicao))).Visible   := True;
    TRLLabel(FindComponent('rllbValor'+IntToStr(Posicao))).Visible   := True;
    TRLLabel(FindComponent('rllbNumNota'+IntToStr(Posicao))).Caption := DM1.tNotaFiscalNumNota.AsString;
    TRLLabel(FindComponent('rllbVecto'+IntToStr(Posicao))).Caption   := 'A Vista';
    TRLLabel(FindComponent('rllbValor'+IntToStr(Posicao))).Caption   := FormatFloat('###,###,##0.00',DM1.tNotaFiscalVlrTotalDupl.AsFloat);
  end
  else
  if Prazo = 'PE' then
  begin
    TRLLabel(FindComponent('rllbNumNota'+IntToStr(Posicao))).Visible := True;
    TRLLabel(FindComponent('rllbVecto'+IntToStr(Posicao))).Visible   := True;
    TRLLabel(FindComponent('rllbValor'+IntToStr(Posicao))).Visible   := True;
    TRLLabel(FindComponent('rllbNumNota'+IntToStr(Posicao))).Caption := DM1.tNotaFiscalNumNota.AsString + '/0ENT';
    TRLLabel(FindComponent('rllbVecto'+IntToStr(Posicao))).Caption   := DM1.tNotaFiscalDtEntr.AsString;
    TRLLabel(FindComponent('rllbValor'+IntToStr(Posicao))).Caption   := FormatFloat('###,###,##0.00',DM1.tNotaFiscalEntrada.AsFloat);
  end
  else
  begin
    TRLLabel(FindComponent('rllbNumNota'+IntToStr(Posicao))).Visible := True;
    TRLLabel(FindComponent('rllbVecto'+IntToStr(Posicao))).Visible   := True;
    TRLLabel(FindComponent('rllbValor'+IntToStr(Posicao))).Visible   := True;
    TRLLabel(FindComponent('rllbNumNota'+IntToStr(Posicao))).Caption := DM1.tNotaFiscalNumNota.AsString + '/' + DM1.tNotaFiscalParcParcela.AsString;
    TRLLabel(FindComponent('rllbVecto'+IntToStr(Posicao))).Caption   := DM1.tNotaFiscalParcDtVenc.AsString;
    TRLLabel(FindComponent('rllbValor'+IntToStr(Posicao))).Caption   := FormatFloat('###,###,##0.00',DM1.tNotaFiscalParcVlrVenc.AsFloat);
  end;
end;

procedure TfRelDANFE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelDANFE.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  rlmNomeProduto.Lines.Clear;
  rlmNomeProduto.Lines.Text := fNFe.mItensNFeNomeProduto.AsString;
  if fNFe.mItensNFeInfAdicionais.Value <> '' then
    rlmNomeProduto.Lines.Text := rlmNomeProduto.Lines.Text + fNFe.mItensNFeInfAdicionais.Value;

  RLDBText4.Height  := RLBand4.Height;
  RLDBText6.Height  := RLBand4.Height;
  RLDBText7.Height  := RLBand4.Height;
  RLDBText8.Height  := RLBand4.Height;
  RLDBText9.Height  := RLBand4.Height;
  RLDBText10.Height := RLBand4.Height;
  RLDBText11.Height := RLBand4.Height;
  RLDBText12.Height := RLBand4.Height;
  RLDBText13.Height := RLBand4.Height;
  RLDBText14.Height := RLBand4.Height;
  RLDBText15.Height := RLBand4.Height;
  RLDBText16.Height := RLBand4.Height;
  RLDBText17.Height := RLBand4.Height;
end;

procedure TfRelDANFE.RLBand7BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := (DM1.tParametrosTipoDoLogoNFe.AsString <> 'R');
  if not PrintIt then
    exit;
  Monta_Cabecalho(1);
end;

procedure TfRelDANFE.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  i : Integer;
begin
  PrintIt := (DM1.tNotaFiscalCondPgto.AsString <> 'N');

  for i := 1 to 12 do
    begin
      TRLLabel(FindComponent('rllbNumNota'+IntToStr(i))).Visible := False;
      TRLLabel(FindComponent('rllbVecto'+IntToStr(i))).Visible   := False;
      TRLLabel(FindComponent('rllbValor'+IntToStr(i))).Visible   := False;
      TRLLabel(FindComponent('rllbNumNota'+IntToStr(i))).Caption := '';
      TRLLabel(FindComponent('rllbVecto'+IntToStr(i))).Caption   := '';
      TRLLabel(FindComponent('rllbValor'+IntToStr(i))).Caption   := '';
    end;

  if not PrintIt then
    exit;

  i := 1;
  //12/03/2010
  if not fNFe.mParcelaNFe.IsEmpty then
  begin
    i := 0;
    if fNFe.mParcelaNFe.RecordCount > 12 then
      Monta_Faturas('OM',1)
    else
    begin
      fNFe.mParcelaNFe.First;
      while not fNFe.mParcelaNFe.Eof do
      begin
        inc(i);
        Monta_Faturas('M',i);
        fNFe.mParcelaNFe.Next;
      end;
    end;
  end
  else
  //***************
  if DM1.tNotaFiscalCondPgto.AsString = 'V' then
    Monta_Faturas('V',1)
  else
  begin
    i := 0;
    if DM1.tNotaFiscalParc.RecordCount > 12 then
      Monta_Faturas('OT',1)
    else
    begin
      if StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalEntrada.AsFloat)) > 0 then
      begin
        inc(i);
        Monta_Faturas('PE',i);
      end;
      DM1.tNotaFiscalParc.First;
      while not DM1.tNotaFiscalParc.Eof do
      begin
        inc(i);
        Monta_Faturas('P',i);
        DM1.tNotaFiscalParc.Next;
      end;
    end;
  end;
  RLBand1.Height := 29;
  if ((i > 3) and (i < 7)) or (fNFe.mParcelaNFe.RecordCount > 12) then
    RLBand1.Height := 41
  else
  if (i > 6) and (i < 10) then
    RLBand1.Height := 54
  else
  if i > 9 then
    RLBand1.Height := 60;
end;

procedure TfRelDANFE.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  vVlrAux1, vVlrAux2 : Real;  
begin
  rllbCidadeTransp.Caption := '';
  DM1.tTransp.IndexFieldNames := 'Codigo';
  if DM1.tTransp.FindKey([DM1.tNotaFiscalCodTransp.AsInteger]) then
    begin
      fNFe.Posiciona_CidadeUF(DM1.tTranspCodCidade.AsInteger,1);
      rllbCidadeTransp.Caption := DM1.tCidadeNome.AsString;
    end;
  vVlrAux1 := DM1.tNotaFiscalVlrTotalItens.AsFloat + DM1.tNotaFiscalVlrTotalDesc.AsFloat;
  vVlrAux2 := DM1.tNotaFiscalVlrTotalNota.AsFloat;
  if DM1.tParametrosSomarNoProdFrete.AsBoolean then
    vVlrAux1 := vVlrAux1 + DM1.tNotaFiscalVlrFrete.AsFloat;
  if DM1.tParametrosSomarNoProdOutrasDesp.AsBoolean then
    vVlrAux1 := vVlrAux1 + DM1.tNotaFiscalOutrasDesp.AsFloat;
  if DM1.tParametrosSomarNoProdSeguro.AsBoolean then
    vVlrAux1 := vVlrAux1 + DM1.tNotaFiscalVlrSeguro.AsFloat;
    
  rlVlrTotalItens.Caption := FormatFloat('###,###,###,##0.00',vVlrAux1);
  rlVlrTotalNota.Caption  := FormatFloat('###,###,###,##0.00',vVlrAux2);
  //NFe 2.00
  RLLabel17.Caption := '';
  if DM1.tNotaFiscalEmitDest.AsString = '1' then
    RLLabel17.Caption := '0-Emitente'
  else
  if DM1.tNotaFiscalEmitDest.AsString = '2' then
    RLLabel17.Caption := '1-Destinatário'
  else
  if DM1.tNotaFiscalEmitDest.AsString = '3' then
    RLLabel17.Caption := '2-Terceiros'
  else
  if DM1.tNotaFiscalEmitDest.AsString = '4' then
    RLLabel17.Caption := '3-Próprio C/Remet.'
  else
  if DM1.tNotaFiscalEmitDest.AsString = '5' then
    RLLabel17.Caption := '4-Próprio C/Dest.'
  else
  if DM1.tNotaFiscalEmitDest.AsString = '9' then
    RLLabel17.Caption := '9-Sem Frete';
end;

procedure TfRelDANFE.RLBand6BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  rlmDadosAdicionais.Lines.Clear;
  rlmDadosAdicionais.Lines.Text := fNFe.mDadosAdicionaisNFeObs.Value;

  if rlmDadosAdicionais.Height < 43 then
    rlmDadosAdicionais.Height := 43;
end;

procedure TfRelDANFE.RLBand8BeforePrint(Sender: TObject;
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

  RLLabel13.Visible := (DM1.tNotaFiscalCondPgto.AsString <> 'N');
  if fNFe.ComboBox2.ItemIndex = 1 then
    rllbNomeCliente.Caption := 'NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL'
  else
    rllbNomeCliente.Caption := DM1.tClienteNome.AsString;
end;

procedure TfRelDANFE.RLBand9BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := (RLReport1.PageNumber < 2);
  //27/08/2009
  RLLabel94.Caption := 'Recebemos de ' + DM1.tFilialEmpresa.AsString +  ' os produtos constantes da Nota Fiscal ao lado';

  //NFe 2.00
  RLLabel96.Caption := 'Identificação e Assinatura do Recebedor    (' + DM1.tNotaFiscallkNomeCli.AsString + ')';
end;

procedure TfRelDANFE.RLBand10BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  //NFe 2.00
  PrintIt := ((Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '2') or (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '5')
              or (Trim(DM1.tNotaFiscalNFeChaveAcesso.AsString) = '')
              or ((Trim(DM1.tNotaFiscalNFeChaveAcesso.AsString) <> '') and (Trim(DM1.tNotaFiscalNFeProtocolo.AsString) = ''))
              or (DM1.tNotaFiscalNFeProtocoloCancelada.AsString <> '') or (fNFe.ComboBox2.ItemIndex = 1)
              or (DM1.tNotaFiscalNFeDenegada.AsBoolean));
  if DM1.tNotaFiscalNFeDenegada.AsBoolean then
    RLLabel101.Caption := 'NOTA  DENEGADA - ' + DM1.tNotaFiscalNFeMotivoDenegada.AsString
  else
  if Trim(DM1.tNotaFiscalNFeProtocoloCancelada.AsString) <> '' then
    RLLabel101.Caption := ' N O T A   C A N C E L A D A '
  else
  if fNFe.ComboBox2.ItemIndex = 1 then
    RLLabel101.Caption := 'DANFE MODO TESTE (SEM VALOR FISCAL)'
  else
  if Trim(DM1.tNotaFiscalNFeChaveAcesso.AsString) = '' then
    RLLabel101.Caption := 'DANFE MODO TESTE (SEM VALOR FISCAL)'
  else
  if Trim(DM1.tNotaFiscalNFeProtocolo.AsString) = '' then
    RLLabel101.Caption := 'NOTA FALTANDO O PROTOCOLO, REGULARIZAR ANTES DE ENVIAR AO CLIENTE'
  else
  if (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '2') or (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '3') or (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '5') then
    RLLabel101.Caption := 'DANFE em Contingência - Impresso em decorrência de problemas técnicos';
end;

procedure TfRelDANFE.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if (DM1.tFilialCodRegimeTrib.AsInteger = 1) or (DM1.tFilialCodRegimeTrib.AsInteger = 2) then
    RLLabel63.Caption := 'CSOSN'
  else
    RLLabel63.Caption := 'CST';
end;

procedure TfRelDANFE.Monta_Cabecalho(Posicao : Integer);
var
  vTexto : String;
  i : Integer;
begin
  TRLBarcode(FindComponent('rlbcChaveAcesso'+IntToStr(posicao))).Caption  := DM1.tNotaFiscalNFeChaveAcesso.AsString;
  TRLBarcode(FindComponent('rlbcContingencia'+IntToStr(posicao))).Caption := '';

  if DM1.tNotaFiscalSaidaEntrada.AsString = 'S' then
    TRLLabel(FindComponent('rllbSaidaEntrada'+IntToStr(Posicao))).Caption := '1'
  else
    TRLLabel(FindComponent('rllbSaidaEntrada'+IntToStr(Posicao))).Caption := '0';

  TRLImage(FindComponent('RLImage'+IntToStr(Posicao))).Stretch := DM1.tParametrosAjusteLogoNFeAutomatico.AsBoolean;

  if FileExists(DM1.tFilialEndLogo.AsString) then
    TRLImage(FindComponent('RLImage'+IntToStr(Posicao))).Picture.LoadFromFile(DM1.tFilialEndLogo.AsString)
  else
    TRLImage(FindComponent('RLImage'+IntToStr(Posicao))).Picture := nil;

  DM1.tNatOperacao.IndexFieldNames := 'Codigo';
  fNFe.Posiciona_CidadeUF(DM1.tFilialCodCidade.AsInteger,1);

  TRLLabel(FindComponent('rllbEmpresa'+IntToStr(Posicao))).Caption  := DM1.tFilialEmpresa.AsString;
  TRLLabel(FindComponent('rllbEnd'+IntToStr(Posicao))).Caption  := DM1.tFilialEndereco.AsString + ', ' + DM1.tFilialNumEnd.AsString;
  TRLLabel(FindComponent('rllbCep'+IntToStr(Posicao))).Caption    := 'CEP: ' + DM1.tFilialCep.AsString + ' - ' + DM1.tFilialBairro.AsString;
  TRLLabel(FindComponent('rllbCidade'+IntToStr(Posicao))).Caption := DM1.tCidadeNome.AsString + ' - ' + DM1.tCidadeEstado.AsString;
  TRLLabel(FindComponent('rllbFone'+IntToStr(Posicao))).Caption   := DM1.tFilialTel.AsString;
  TRLLabel(FindComponent('rllbHome'+IntToStr(Posicao))).Caption   := DM1.tFilialHomePage.AsString;
  TRLLabel(FindComponent('rllbInscrEstadual'+IntToStr(Posicao))).Caption := DM1.tFilialInscr.AsString;
  TRLLabel(FindComponent('rllbCNPJ'+IntToStr(Posicao))).Caption   := DM1.tFilialCNPJ.AsString;

  if DMNotaFiscal.qNatOper.RecordCount > 1 then
    TRLLabel(FindComponent('rllbNatOperacao'+IntToStr(Posicao))).Caption := 'VIDE ABAIXO'
  else
  if DM1.tNatOperacao.FindKey([DM1.tNotaFiscalCodNatOper.AsInteger]) then
    TRLLabel(FindComponent('rllbNatOperacao'+IntToStr(Posicao))).Caption := DM1.tNatOperacaoCodNatOper.AsString + ' - ' + DM1.tNatOperacaoDescricao.AsString;

  //NFe 2.00
  TRLLabel(FindComponent('rllbTextoA'+IntToStr(Posicao))).Visible  := ((Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) <> '2') and
                         (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) <> '5'));
  TRLLabel(FindComponent('rllbTextoB'+IntToStr(Posicao))).Visible  := ((Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) <> '2') and
                         (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) <> '5'));
  TRLBarcode(FindComponent('rlbcContingencia'+IntToStr(Posicao))).Visible := ((Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '2') or
                         (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '5'));
  if (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '2') or (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) = '5') then
    TRLBarcode(FindComponent('rlbcContingencia'+IntToStr(Posicao))).Caption := DM1.tNotaFiscalNFeCodBarraCont.AsString;

  //NFe 2.00
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
  //************

  //NFe 2.00 alterado o if
  if (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) <> '2') and (Copy(DM1.tNotaFiscalTipoEnvioNF.AsString,1,1) <> '5') then
    begin
      TRLLabel(FindComponent('rllbTextoProt'+IntToStr(Posicao))).Caption := 'PROTOCOLO DE AUTORIZAÇÃO DE USO';
      TRLLabel(FindComponent('rllbProtocolo'+IntToStr(Posicao))).Caption := DM1.tNotaFiscalNFeProtocolo.AsString;
      if Length(DM1.tNotaFiscalNFeProtocolo.AsString) < 20 then
        TRLLabel(FindComponent('rllbProtocolo'+IntToStr(Posicao))).Caption := DM1.tNotaFiscalNFeProtocolo.AsString + '  ' + DM1.tNotaFiscalDtCad.AsString + '  ' + DM1.tNotaFiscalHrCad.AsString;
    end        
  else
    begin
      TRLLabel(FindComponent('rllbTextoProt'+IntToStr(Posicao))).Caption    := 'DADOS DA NF-E';
      //NFe 2.00
      //rllbProtocolo.Caption := DM1.tNotaFiscalNFeCodBarraCont.AsString;
      //rllbProtocolo.Caption := DM1.tNotaFiscalNFeCodBarraCont.AsString;
      TRLLabel(FindComponent('rllbProtocolo'+IntToStr(Posicao))).Caption := '';
      vTexto := DM1.tNotaFiscalNFeCodBarraCont.AsString;
      i := 1;
      while i < 36 do
      begin
        if i > 1 then
          TRLLabel(FindComponent('rllbProtocolo'+IntToStr(Posicao))).Caption := TRLLabel(FindComponent('rllbProtocolo'+IntToStr(Posicao))).Caption + ' ';
        TRLLabel(FindComponent('rllbProtocolo'+IntToStr(Posicao))).Caption := TRLLabel(FindComponent('rllbProtocolo'+IntToStr(Posicao))).Caption + copy(vTexto,i,4);
        i := i + 4;
      end;
    end;
end;

procedure TfRelDANFE.RLBand12BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := (DM1.tParametrosTipoDoLogoNFe.AsString <> 'Q');
  if not PrintIt then
    exit;
  Monta_Cabecalho(2);
end;

end.
