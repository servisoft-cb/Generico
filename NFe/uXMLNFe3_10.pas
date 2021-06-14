unit uXMLNFe3_10;

interface

uses
  Classes, SysUtils, Dialogs, SqlExpr, DmdDatabase, enviNFe_v310, DateUtils, Variants, uDM1, UNFe, UDMNotaFiscal;

  procedure prc_Gerar_XML_310(AStrings: TStrings);
  procedure prc_Monta_Cabecalho;
  procedure prc_Monta_Detalhe;
  procedure prc_Monta_Rodape;
  procedure prc_Monta_Transportadora;
  //Notas Referenciadas
  procedure prc_Le_mNotaDevolvidaNFe;
  procedure prc_Monta_B13;
  procedure prc_Monta_B14;
  procedure prc_Monta_B20j;
  procedure prc_Monta_B20a;
  procedure prc_Monta_CTeRef;
  //********************
  //Imposto ICMS
  procedure prc_Monta_ICMS00(Origem, CodSitTrib : String);
  procedure prc_Monta_ICMS10(Origem, CodSitTrib : String ; Perc_Interno : Real);
  procedure prc_Monta_ICMS20(Origem, CodSitTrib : String);
  procedure prc_Monta_ICMS30(Origem, CodSitTrib : String ; Perc_Interno : Real);
  procedure prc_Monta_ICMS40(Origem, CodSitTrib : String);
  procedure prc_Monta_ICMS51(Origem, CodSitTrib : String);
  procedure prc_Monta_ICMS60(Origem, CodSitTrib : String);
  procedure prc_Monta_ICMS70(Origem, CodSitTrib : String ; Perc_Interno : Real);
  procedure prc_Monta_ICMS90(Origem, CodSitTrib : String ; Perc_Interno : Real);
  procedure prc_Monta_ICMSSN101(Origem, CodSitTrib : String ; Perc_Simples : Real);
  procedure prc_Monta_ICMSSN102(Origem, CodSitTrib : String);
  procedure prc_Monta_ICMSSN201(Origem, CodSitTrib : String ; Perc_Interno, Perc_Simples : Real);
  procedure prc_Monta_ICMSSN202(Origem, CodSitTrib : String ; Perc_Interno : Real);
  procedure prc_Monta_ICMSSN500(Origem, CodSitTrib : String);
  procedure prc_Monta_ICMSSN900(Origem, CodSitTrib : String ; Perc_Interno, Perc_Simples : Real);
  //******  0
  procedure prc_Monta_PIS;
  procedure prc_Monta_COFINS;

  //22/12/2015
  procedure prc_Monta_ICMS_UF_Destino;
  //****

  //function fnc_Posicionar_Cidade(ID : Integer) : Boolean;
  procedure prc_Monta_parcela(Data : TDateTime ; Valor : Real ; Parcela, NumNota : Integer ; Tipo_Cond : String); //P= A Prazo  V= A Vista

var
  EnviNfe: IXMLTEnviNFe;
  NfeXML: IXMLTNFe;
  DetXML  : IXMLTNFe_infNFe_Det;
  RefNfeXML : IXMLTNFe_infNFe_ide_NFref;
  TranspXML : IXMLTNFe_infNFe_Transp;
  TransportaXML : IXMLTNFe_infNFe_transp_Transporta;
  CobrXML : IXMLTNFe_infNFe_cobr;
  DupXML : IXMLTNFe_infNFe_cobr_dup;
  LacreXML : IXMLTNFe_infNFe_transp_vol_lacres;
  DetDIXML : IXMLTNFe_infNFe_det_prod_DI;
  DetADIXML : IXMLTNFe_infNFe_det_prod_DI_adi;

  DetExport    : IXMLTNFe_infNFe_det_prod_detExport;

  AutXML : IXMLTNFe_infNFe_autXML;
  VolXML : IXMLTNFe_infNFe_transp_vol;
  ReboqueXML : IXMLTNFe_infNFe_Transp;
  DIXML : IXMLTNFe_infNFe_det_prod_DI;

  //ReboqueXML : ixml

  vTipo_Emissao_NFe : String;
  vTipo_Ambiente_NFe : String;
  vFinalidade_NFe : String;
  vProcesso_Emissao_NFe : String;
  vChave_XML : String;

implementation

uses DB, uUtil, StdConvs, uUtil_NFe;

procedure prc_Gerar_XML_310(AStrings: TStrings);
begin
  AStrings.Clear;

  EnviNfe := NewenviNFe;
  NfeXML  := EnviNfe.NFe.Add;

  prc_Monta_Cabecalho;

  if DM1.tUFSigla.AsString <>  DM1.tClienteUf.AsString then
    DM1.tUF.Locate('Sigla',DM1.tClienteUf.AsString,([Locaseinsensitive]));

  //fDMCadNotaFiscal.cdsNotaFiscal_Imp.First
  DMNotaFiscal.tNotaFiscalImp.First;
  fNFe.mItensNFe.First;
  while not fNFe.mItensNFe.Eof do
  begin
    prc_Monta_Detalhe;
    fNFe.mItensNFe.Next;
    //fDMCadNotaFiscal.cdsNotaFiscal_Imp.Next;
    DMNotaFiscal.tNotaFiscalImp.Next;
  end;
  prc_Monta_Rodape;

  AStrings.Text := '<?xml version="1.0" encoding="utf-8"?>'+NfeXML.XML;
  //Memo1.lines.Text := '<?xml version="1.0" encoding="utf-8"?>'+NfeXML.XML;
  //AStrings.Text := vTextoEnvio.Text;
end;

procedure prc_Monta_B13;
begin
  RefNfeXML.RefNFe := fNFe.mNotaDevolvidaNFeNFeChaveAcesso.AsString;
end;

procedure prc_Monta_B14;
begin
  RefNfeXML.RefNF.CUF   := fNFe.mNotaDevolvidaNFeNFeChaveAcesso.AsString;
  RefNfeXML.RefNF.AAMM  := FormatFloat('00',fNFe.mNotaDevolvidaNFeAnoEmissao.AsInteger) + FormatFloat('00',fNFe.mNotaDevolvidaNFeMesEmissao.AsInteger);
  RefNfeXML.RefNF.CNPJ  := Monta_Texto(fNFe.mNotaDevolvidaNFeCNPJ.AsString,14);
  RefNfeXML.RefNF.Mod_  := fNFe.mNotaDevolvidaNFeModelo.AsString;
  if (fNFe.mNotaDevolvidaNFeSerie.AsString = 'UN') or (fNFe.mNotaDevolvidaNFeSerie.AsString = 'UNI') then
    RefNfeXML.RefNF.Serie := '1'
  else
    RefNfeXML.RefNF.Serie := fNFe.mNotaDevolvidaNFeSerie.AsString;
  RefNfeXML.RefNF.NNF := fNFe.mNotaDevolvidaNFeNumNota.AsString;
end;

procedure prc_Monta_B20j;
begin
  RefNfeXML.RefECF.Mod_ := fNFe.mNotaDevolvidaNFeCupomModelo.AsString;
  RefNfeXML.RefECF.NECF := fNFe.mNotaDevolvidaNFeCupomNumECF.AsString;
  RefNfeXML.RefECF.NCOO := fNFe.mNotaDevolvidaNFeCupomNumCOO.AsString;
end;

procedure prc_Monta_B20a;
begin
  RefNfeXML.RefNFP.CUF  := fNFe.mNotaDevolvidaNFeCodUF.AsString;
  RefNfeXML.RefNFP.AAMM := FormatFloat('00',fNFe.mNotaDevolvidaNFeAnoEmissao.AsInteger) + FormatFloat('00',fNFe.mNotaDevolvidaNFeMesEmissao.AsInteger);
  if Length(fNFe.mNotaDevolvidaNFeCNPJ.AsString) > 12 then
    RefNfeXML.RefNFP.CNPJ := Monta_Texto(fNFe.mNotaDevolvidaNFeCNPJ.AsString,14)
  else
    RefNfeXML.RefNFP.CPF := Monta_Texto(fNFe.mNotaDevolvidaNFeCNPJ.AsString,11);
  RefNfeXML.RefNFP.IE    := Monta_Numero(fNFe.mNotaDevolvidaNFeIE.AsString,0);
  RefNfeXML.RefNFP.Mod_  := fNFe.mNotaDevolvidaNFeModelo.AsString;
  if (fNFe.mNotaDevolvidaNFeSerie.AsString = 'UN') or (fNFe.mNotaDevolvidaNFeSerie.AsString = 'UNI') then
    RefNfeXML.RefNFP.Serie := '1'
  else
    RefNfeXML.RefNFP.Serie := fNFe.mNotaDevolvidaNFeSerie.AsString;
  RefNfeXML.RefNFP.NNF := fNFe.mNotaDevolvidaNFeNumNota.AsString;
end;

procedure prc_Monta_CTeRef;
begin
  RefNfeXML.RefCTe := fNFe.mNotaDevolvidaNFeCTeChaveAcesso.AsString;
end;

procedure prc_Le_mNotaDevolvidaNFe;
begin
  if fNFe.mNotaDevolvidaNFe.IsEmpty then
    exit;

  RefNfeXML := NfeXML.InfNFe.Ide.NFref.Add;
  fNFe.mNotaDevolvidaNFe.First;
  while not fNFe.mNotaDevolvidaNFe.Eof do
  begin
    if fNFe.mNotaDevolvidaNFeTipo.AsString = '13' then
      prc_Monta_B13
    else
    if fNFe.mNotaDevolvidaNFeTipo.AsString = '14' then
      prc_Monta_B14
    else
    if fNFe.mNotaDevolvidaNFeTipo.AsString = '20j' then
      prc_Monta_B20j
    else
    if fNFe.mNotaDevolvidaNFeTipo.AsString = '20a' then
      prc_Monta_B20a
    else
      prc_Monta_CTeRef;
    fNFe.mNotaDevolvidaNFe.Next;
  end;
end;

procedure prc_Monta_ICMS00(Origem, CodSitTrib : String);
begin
  DetXML.Imposto.ICMS.ICMS00.Orig  := Origem;
  DetXML.Imposto.ICMS.ICMS00.CST   := CodSitTrib;
  DetXML.Imposto.ICMS.ICMS00.ModBC := '0';
  if StrToFloat(FormatFloat('0.00',fNFe.mItensNFeBaseICMS.AsFloat)) > 0 then
    DetXML.Imposto.ICMS.ICMS00.VBC := Replace(FormatFloat('0.00',fNFe.mItensNFeBaseICMS.AsFloat) ,',','.')
  else
  if StrToFloat(FormatFloat('0.0000',fNFe.mItensNFeAliqIcms.AsFloat)) > 0 then
    DetXML.Imposto.ICMS.ICMS00.VBC := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrTotal.AsFloat) ,',','.')
  else
    DetXML.Imposto.ICMS.ICMS00.VBC := Replace(FormatFloat('0.00',0) ,',','.');
  DetXML.Imposto.ICMS.ICMS00.PICMS := Replace(FormatFloat('0.00##',fNFe.mItensNFeAliqIcms.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS00.VICMS := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcms.AsFloat) ,',','.');
end;

procedure prc_Monta_ICMS10(Origem, CodSitTrib : String ; Perc_Interno : Real);
begin
  DetXML.Imposto.ICMS.ICMS10.Orig  := Origem;
  DetXML.Imposto.ICMS.ICMS10.CST   := CodSitTrib;
  DetXML.Imposto.ICMS.ICMS10.ModBC := '0';
  DetXML.Imposto.ICMS.ICMS10.VBC   := Replace(FormatFloat('0.00',fNFe.mItensNFeBaseICMS.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS10.PICMS := Replace(FormatFloat('0.00##',fNFe.mItensNFeAliqIcms.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS10.VICMS := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcms.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS10.ModBCST  := '4';
  DetXML.Imposto.ICMS.ICMS10.PMVAST   := Replace(FormatFloat('0.00##',fNFe.mItensNFeMVA.AsFloat) ,',','.');
  if StrToFloat(FormatFloat('0.00',fNFe.mItensNFePercRedICMSSubst.AsFloat)) > 0 then
    DetXML.Imposto.ICMS.ICMS10.PRedBCST := Replace(FormatFloat('0.00',fNFe.mItensNFePercRedICMSSubst.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS10.VBCST    := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsBaseSubst.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS10.PICMSST  := Replace(FormatFloat('0.00##',Perc_Interno) ,',','.');
  DetXML.Imposto.ICMS.ICMS10.VICMSST  := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsVlrSubst.AsFloat) ,',','.');
end;

procedure prc_Monta_ICMS20(Origem, CodSitTrib : String);
begin
  DetXML.Imposto.ICMS.ICMS20.Orig   := Origem;
  DetXML.Imposto.ICMS.ICMS20.CST    := CodSitTrib;
  DetXML.Imposto.ICMS.ICMS20.ModBC  := '0';
  DetXML.Imposto.ICMS.ICMS20.PRedBC := Replace(FormatFloat('0.00##',fNFe.mItensNFePercRedICMS.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS20.VBC    := Replace(FormatFloat('0.00',fNFe.mItensNFeBaseICMS.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS20.PICMS  := Replace(FormatFloat('0.00##',fNFe.mItensNFeAliqIcms.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS20.VICMS  := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcms.AsFloat) ,',','.');
  if StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsDesonerado.AsFloat)) > 0 then
  begin
    DetXML.Imposto.ICMS.ICMS20.VICMSDeson := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsDesonerado.AsFloat) ,',','.');
    DetXML.Imposto.ICMS.ICMS20.MotDesICMS := fNFe.mItensNFeCodMotivoDesonerado.AsString;
  end;
end;

procedure prc_Monta_ICMS30(Origem, CodSitTrib : String ; Perc_Interno : Real);
begin
  DetXML.Imposto.ICMS.ICMS30.Orig     := Origem;
  DetXML.Imposto.ICMS.ICMS30.CST      := CodSitTrib;
  DetXML.Imposto.ICMS.ICMS30.ModBCST  := '4';
  DetXML.Imposto.ICMS.ICMS30.PMVAST   := Replace(FormatFloat('0.00##',fNFe.mItensNFeMVA.AsFloat) ,',','.');
  if StrToFloat(FormatFloat('0.00##',fNFe.mItensNFePercRedICMSSubst.AsFloat)) > 0 then
    DetXML.Imposto.ICMS.ICMS30.PRedBCST := Replace(FormatFloat('0.00##',fNFe.mItensNFePercRedICMSSubst.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS30.VBCST    := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsBaseSubst.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS30.PICMSST  := Replace(FormatFloat('0.00##',Perc_Interno) ,',','.');
  DetXML.Imposto.ICMS.ICMS30.VICMSST  := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsVlrSubst.AsFloat) ,',','.');
  if StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsDesonerado.AsFloat)) > 0 then
  begin
    DetXML.Imposto.ICMS.ICMS30.VICMSDeson := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsDesonerado.AsFloat) ,',','.');
    DetXML.Imposto.ICMS.ICMS30.MotDesICMS := fNFe.mItensNFeCodMotivoDesonerado.AsString;
  end;
end;

procedure prc_Monta_ICMS40(Origem, CodSitTrib : String);
begin
  DetXML.Imposto.ICMS.ICMS40.Orig  := Origem;
  DetXML.Imposto.ICMS.ICMS40.CST   := CodSitTrib;
  if StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsDesonerado.AsFloat)) > 0 then
  begin
    DetXML.Imposto.ICMS.ICMS40.VICMSDeson := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsDesonerado.AsFloat) ,',','.');
    DetXML.Imposto.ICMS.ICMS40.MotDesICMS := fNFe.mItensNFeCodMotivoDesonerado.AsString;
  end;
end;

procedure prc_Monta_ICMS51(Origem, CodSitTrib : String);
var
  vVlrAux : Real;
begin
  DetXML.Imposto.ICMS.ICMS51.Orig     := Origem;
  DetXML.Imposto.ICMS.ICMS51.CST      := CodSitTrib;
  DetXML.Imposto.ICMS.ICMS51.ModBC    := '0';
  if StrToFloat(FormatFloat('0.00',fNFe.mItensNFePercRedICMS.AsFloat)) > 0 then
    DetXML.Imposto.ICMS.ICMS51.PRedBC   := Replace(FormatFloat('0.00##',fNFe.mItensNFePercRedICMS.AsFloat),',','.');
  DetXML.Imposto.ICMS.ICMS51.VBC      := Replace(FormatFloat('0.00',fNFe.mItensNFeBaseICMS.AsFloat),',','.');
  DetXML.Imposto.ICMS.ICMS51.PICMS    := Replace(FormatFloat('0.00##',fNFe.mItensNFeAliqIcms.AsFloat),',','.');
  //3.10
  {f (StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsOperacao.AsFloat)) > 0) and (DM1.tParametrosUSA_ICMSOPERACAO_CST51.AsString = 'S') then
  begin
    {DetXML.Imposto.ICMS.ICMS51.VICMSOp  := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsOperacao.AsFloat),',','.');
    if StrToFloat(FormatFloat('0.0000',fNFe.mItensNFePercTribIcms.AsFloat)) <= 0 then
      vVlrAux := StrToFloat(FormatFloat('0.0000',100))
    else
      vVlrAux := StrToFloat(FormatFloat('0.0000',100 - fNFe.mItensNFePercTribIcms.AsFloat));
    DetXML.Imposto.ICMS.ICMS51.PDif     := Replace(FormatFloat('0.00##',vVlrAux),',','.');
    if fNFe.mItensNFeVlrIcms.AsFloat > fNFe.mItensNFeVlrIcmsOperacao.AsFloat then
      vVlrAux := StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrIcms.AsFloat - fNFe.mItensNFeVlrIcmsOperacao.AsFloat))
    else
      vVlrAux := StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsOperacao.AsFloat - fNFe.mItensNFeVlrIcms.AsFloat));
    DetXML.Imposto.ICMS.ICMS51.VICMSDif := Replace(FormatFloat('0.00',vVlrAux),',','.');
  end;}
  //*******
  if (StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsOperacao.AsFloat)) > 0) then
  begin
    DetXML.Imposto.ICMS.ICMS51.VICMSOp  := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsOperacao.AsFloat),',','.');
    DetXML.Imposto.ICMS.ICMS51.PDif     := Replace(FormatFloat('0.00##',fNFe.mItensNFePercDiferimento.AsFloat),',','.');
    DetXML.Imposto.ICMS.ICMS51.VICMSDif := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsDiferido.AsFloat),',','.');
  end;
  DetXML.Imposto.ICMS.ICMS51.VICMS    := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcms.AsFloat),',','.');
end;

procedure prc_Monta_ICMS60(Origem, CodSitTrib : String);
begin
  DetXML.Imposto.ICMS.ICMS60.Orig       := Origem;
  DetXML.Imposto.ICMS.ICMS60.CST        := CodSitTrib;
  DetXML.Imposto.ICMS.ICMS60.VBCSTRet   := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsBaseSubst.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS60.VICMSSTRet := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsVlrSubst.AsFloat) ,',','.');
end;

procedure prc_Monta_ICMS70(Origem, CodSitTrib : String ; Perc_Interno : Real);
begin
  DetXML.Imposto.ICMS.ICMS70.Orig     := Origem;
  DetXML.Imposto.ICMS.ICMS70.CST      := CodSitTrib;
  DetXML.Imposto.ICMS.ICMS70.ModBC    := '0';
  if StrToFloat(FormatFloat('0.00##',fNFe.mItensNFePercRedICMS.AsFloat)) > 0 then
    DetXML.Imposto.ICMS.ICMS70.PRedBC   := Replace(FormatFloat('0.00##',fNFe.mItensNFePercRedICMS.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS70.VBC      := Replace(FormatFloat('0.00',fNFe.mItensNFeBaseICMS.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS70.PICMS    := Replace(FormatFloat('0.00##',fNFe.mItensNFeAliqIcms.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS70.VICMS    := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcms.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS70.ModBCST  := '4';
  DetXML.Imposto.ICMS.ICMS70.PMVAST   := Replace(FormatFloat('0.00##',fNFe.mItensNFeMVA.AsFloat) ,',','.');
  if StrToFloat(FormatFloat('0.00##',fNFe.mItensNFePercRedICMSSubst.AsFloat)) > 0 then
    DetXML.Imposto.ICMS.ICMS70.PRedBCST := Replace(FormatFloat('0.00##',fNFe.mItensNFePercRedICMSSubst.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS70.VBCST    := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsBaseSubst.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMS70.PICMSST  := Replace(FormatFloat('0.00##',Perc_Interno) ,',','.');
  DetXML.Imposto.ICMS.ICMS70.VICMSST  := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsVlrSubst.AsFloat) ,',','.');
  if StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsDesonerado.AsFloat)) > 0 then
  begin
    DetXML.Imposto.ICMS.ICMS70.VICMSDeson := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsDesonerado.AsFloat) ,',','.');
    DetXML.Imposto.ICMS.ICMS70.MotDesICMS := fNFe.mItensNFeCodMotivoDesonerado.AsString;
  end;
end;

procedure prc_Monta_ICMS90(Origem, CodSitTrib : String ; Perc_Interno : Real);
begin
  DetXML.Imposto.ICMS.ICMS90.Orig  := Origem;
  DetXML.Imposto.ICMS.ICMS90.CST   := CodSitTrib;
  DetXML.Imposto.ICMS.ICMS90.ModBC := '0';
  DetXML.Imposto.ICMS.ICMS90.VBC   := Replace(FormatFloat('0.00',fNFe.mItensNFeBaseICMS.AsFloat),',','.');
  if StrToFloat(FormatFloat('0.00',fNFe.mItensNFePercRedICMS.AsFloat)) = 100 then
    DetXML.Imposto.ICMS.ICMS90.PRedBC := Replace(FormatFloat('0.00',0),',','.')
  else
    DetXML.Imposto.ICMS.ICMS90.PRedBC := Replace(FormatFloat('0.00##',fNFe.mItensNFePercRedICMS.AsFloat),',','.');
  DetXML.Imposto.ICMS.ICMS90.PICMS := Replace(FormatFloat('0.00##',fNFe.mItensNFeAliqIcms.AsFloat),',','.');
  DetXML.Imposto.ICMS.ICMS90.VICMS := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcms.AsFloat),',','.');
  DetXML.Imposto.ICMS.ICMS90.ModBCST := '4';
  DetXML.Imposto.ICMS.ICMS90.PMVAST := Replace(FormatFloat('0.00##',fNFe.mItensNFeMVA.AsFloat),',','.');
  if StrToFloat(FormatFloat('0.00##',fNFe.mItensNFePercRedICMSSubst.AsFloat)) > 0 then
    DetXML.Imposto.ICMS.ICMS90.PRedBCST := Replace(FormatFloat('0.00##',fNFe.mItensNFePercRedICMSSubst.AsFloat),',','.');
  DetXML.Imposto.ICMS.ICMS90.VBCST    := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsBaseSubst.AsFloat),',','.');
  DetXML.Imposto.ICMS.ICMS90.PICMSST  := Replace(FormatFloat('0.00##',Perc_Interno),',','.');
  DetXML.Imposto.ICMS.ICMS90.VICMSST  := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsVlrSubst.AsFloat),',','.');
  if StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsDesonerado.AsFloat)) > 0 then
  begin
    DetXML.Imposto.ICMS.ICMS90.VICMSDeson := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsDesonerado.AsFloat) ,',','.');
    DetXML.Imposto.ICMS.ICMS90.MotDesICMS := fNFe.mItensNFeCodMotivoDesonerado.AsString;
  end;
end;

procedure prc_Monta_ICMSSN101(Origem, CodSitTrib : String ; Perc_Simples : Real);
begin
  DetXML.Imposto.ICMS.ICMSSN101.Orig        := Origem;
  DetXML.Imposto.ICMS.ICMSSN101.CSOSN       := CodSitTrib;
  DetXML.Imposto.ICMS.ICMSSN101.PCredSN     := Replace(FormatFloat('0.00##',Perc_Simples),',','.');
  DetXML.Imposto.ICMS.ICMSSN101.VCredICMSSN := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsSimples.AsFloat),',','.');
end;

procedure prc_Monta_ICMSSN102(Origem, CodSitTrib : String);
begin
  DetXML.Imposto.ICMS.ICMSSN102.Orig  := Origem;
  DetXML.Imposto.ICMS.ICMSSN102.CSOSN := CodSitTrib;
end;

procedure prc_Monta_ICMSSN201(Origem, CodSitTrib : String ; Perc_Interno, Perc_Simples : Real);
begin
  DetXML.Imposto.ICMS.ICMSSN201.Orig        := Origem;
  DetXML.Imposto.ICMS.ICMSSN201.CSOSN       := CodSitTrib;
  DetXML.Imposto.ICMS.ICMSSN201.ModBCST     := '4';
  DetXML.Imposto.ICMS.ICMSSN201.PMVAST      := Replace(FormatFloat('0.00',fNFe.mItensNFeMVA.AsFloat) ,',','.');
  if StrToFloat(FormatFloat('0.0000',fNFe.mItensNFePercRedICMSSubst.AsFloat)) > 0 then
    DetXML.Imposto.ICMS.ICMSSN201.PRedBCST    := Replace(FormatFloat('0.00',fNFe.mItensNFePercRedICMSSubst.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMSSN201.VBCST       := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsBaseSubst.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMSSN201.PICMSST     := Replace(FormatFloat('0.00',Perc_Interno) ,',','.');
  DetXML.Imposto.ICMS.ICMSSN201.VICMSST     := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsVlrSubst.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMSSN201.PCredSN     := Replace(FormatFloat('0.00',Perc_Simples) ,',','.');
  DetXML.Imposto.ICMS.ICMSSN201.VCredICMSSN := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsSimples.AsFloat) ,',','.');
end;

procedure prc_Monta_ICMSSN202(Origem, CodSitTrib : String ; Perc_Interno : Real);
begin
  DetXML.Imposto.ICMS.ICMSSN202.Orig     := Origem;
  DetXML.Imposto.ICMS.ICMSSN202.CSOSN    := CodSitTrib;
  DetXML.Imposto.ICMS.ICMSSN202.ModBCST  := '4';
  DetXML.Imposto.ICMS.ICMSSN202.PMVAST   := Replace(FormatFloat('0.00##',fNFe.mItensNFeMVA.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMSSN202.PRedBCST := Replace(FormatFloat('0.00',fNFe.mItensNFePercRedICMSSubst.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMSSN202.VBCST    := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsBaseSubst.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMSSN202.PICMSST  := Replace(FormatFloat('0.00##',Perc_Interno) ,',','.');
  DetXML.Imposto.ICMS.ICMSSN202.VICMSST  := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsVlrSubst.AsFloat) ,',','.');
end;                                                    

procedure prc_Monta_ICMSSN500(Origem, CodSitTrib : String);
begin
  DetXML.Imposto.ICMS.ICMSSN500.Orig       := Origem;
  DetXML.Imposto.ICMS.ICMSSN500.CSOSN      := CodSitTrib;
  DetXML.Imposto.ICMS.ICMSSN500.VBCSTRet   := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsBaseSubst.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMSSN500.VICMSSTRet := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsVlrSubst.AsFloat) ,',','.');
end;

procedure prc_Monta_ICMSSN900(Origem, CodSitTrib : String ; Perc_Interno, Perc_Simples : Real);
begin
  DetXML.Imposto.ICMS.ICMSSN900.Orig  := Origem;
  DetXML.Imposto.ICMS.ICMSSN900.CSOSN := CodSitTrib;
  DetXML.Imposto.ICMS.ICMSSN900.ModBC := '3';
  DetXML.Imposto.ICMS.ICMSSN900.VBC   := Replace(FormatFloat('0.00',fNFe.mItensNFeBaseICMS.AsFloat),',','.');
  if StrToFloat(FormatFloat('0.00',fNFe.mItensNFePercRedICMS.AsFloat)) = 100 then
    DetXML.Imposto.ICMS.ICMSSN900.PRedBC := Replace(FormatFloat('0.00',0),',','.')
  else
    DetXML.Imposto.ICMS.ICMSSN900.PRedBC := Replace(FormatFloat('0.00##',fNFe.mItensNFePercRedICMS.AsFloat),',','.');
  DetXML.Imposto.ICMS.ICMSSN900.PICMS := Replace(FormatFloat('0.00##',fNFe.mItensNFeAliqIcms.AsFloat),',','.');
  DetXML.Imposto.ICMS.ICMSSN900.VICMS := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcms.AsFloat),',','.');
  DetXML.Imposto.ICMS.ICMSSN900.ModBCST := '4';
  DetXML.Imposto.ICMS.ICMSSN900.PMVAST      := Replace(FormatFloat('0.00##',fNFe.mItensNFeMVA.AsFloat),',','.');
  DetXML.Imposto.ICMS.ICMSSN900.PRedBCST    := Replace(FormatFloat('0.00##',fNFe.mItensNFePercRedICMSSubst.AsFloat),',','.');
  DetXML.Imposto.ICMS.ICMSSN900.VBCST       := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsBaseSubst.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMSSN900.PICMSST     := Replace(FormatFloat('0.00##',Perc_Interno) ,',','.');
  DetXML.Imposto.ICMS.ICMSSN900.VICMSST     := Replace(FormatFloat('0.00',fNFe.mItensNFeIcmsVlrSubst.AsFloat) ,',','.');
  DetXML.Imposto.ICMS.ICMSSN900.PCredSN     := Replace(FormatFloat('0.00##',Perc_Simples) ,',','.');
  DetXML.Imposto.ICMS.ICMSSN900.VCredICMSSN := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIcmsSimples.AsFloat) ,',','.');
end;

procedure prc_Monta_PIS;
var
  vVlrAux : Real;
  vQtdAux : Real;
begin
  if (fNFe.mItensNFeCodPis.AsString = '01') or (fNFe.mItensNFeCodPis.AsString = '02') then
  begin
    DetXML.Imposto.PIS.PISAliq.CST := fNFe.mItensNFeCodPis.AsString;
    vVlrAux := 0;
    if fNFe.mItensNFeVlrPis.AsFloat > 0 then
      vVlrAux := fNFe.mItensNFeVlrTotal.AsFloat;
    DetXML.Imposto.PIS.PISAliq.VBC  := Replace(FormatFloat('0.00',vVlrAux),',','.');
    DetXML.Imposto.PIS.PISAliq.PPIS := Replace(FormatFloat('0.0000',fNFe.mItensNFeAliqPis.AsFloat),',','.');
    DetXML.Imposto.PIS.PISAliq.VPIS := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrPis.AsFloat),',','.');
  end
  else
  if (fNFe.mItensNFeCodPis.AsString = '03') then
  begin
    DetXML.Imposto.PIS.PISQtde.CST := fNFe.mItensNFeCodPis.AsString;
    vVlrAux := 0;
    if fNFe.mItensNFeVlrPis.AsFloat > 0 then
      vVlrAux := fNFe.mItensNFeQtd.AsFloat;
    DetXML.Imposto.PIS.PISQtde.QBCProd   := Replace(FormatFloat('0.0000',vVlrAux),',','.');
    DetXML.Imposto.PIS.PISQtde.VAliqProd := Replace(FormatFloat('0.0000',fNFe.mItensNFeAliqPis.AsFloat),',','.');
    DetXML.Imposto.PIS.PISQtde.VPIS      := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrPis.AsFloat),',','.');
  end
  else
  if (fNFe.mItensNFeCodPis.AsString = '04') or (fNFe.mItensNFeCodPis.AsString = '05') or (fNFe.mItensNFeCodPis.AsString = '06') or
     (fNFe.mItensNFeCodPis.AsString = '07') or (fNFe.mItensNFeCodPis.AsString = '08') or (fNFe.mItensNFeCodPis.AsString = '09') then
  begin
    //NfeXML.InfNFe.Det.Add.Imposto.PIS.PISNT.CST := fDMNFe.mItensNFeCodPis.AsString;
    DetXML.Imposto.PIS.PISNT.CST := fNFe.mItensNFeCodPis.AsString;
  end
  else
  begin
    //NfeXML.InfNFe.Det.Add.Imposto.PIS.PISOutr.CST := fDMNFe.mItensNFeCodPis.AsString;
    DetXML.Imposto.PIS.PISOutr.CST := fNFe.mItensNFeCodPis.AsString;
    vVlrAux := 0;
    vQtdAux := 0;
    if fNFe.mItensNFeVlrPis.AsFloat > 0 then
    begin
      vVlrAux := fNFe.mItensNFeVlrTotal.AsFloat;
      vQtdAux := fNFe.mItensNFeQtd.AsFloat;
    end;
    if fNFe.mItensNFeTipoPis.AsString = 'V' then
    begin
      DetXML.Imposto.PIS.PISOutr.QBCProd   := Replace(FormatFloat('0.0000',vQtdAux),',','.');
      DetXML.Imposto.PIS.PISOutr.VAliqProd := Replace(FormatFloat('0.0000',fNFe.mItensNFeAliqPis.AsFloat),',','.');
    end
    else
    begin
      DetXML.Imposto.PIS.PISOutr.VBC  := Replace(FormatFloat('0.00',vVlrAux),',','.');
      DetXML.Imposto.PIS.PISOutr.PPIS := Replace(FormatFloat('0.0000',fNFe.mItensNFeAliqPis.AsFloat),',','.');
    end;
    DetXML.Imposto.PIS.PISOutr.VPIS := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrPis.AsFloat),',','.');
  end;
end;

procedure prc_Monta_COFINS;
var
  vVlrAux : Real;
  vQtdAux : Real;
begin
  if (fNFe.mItensNFeCodCofins.AsString = '01') or (fNFe.mItensNFeCodCofins.AsString = '02') then
  begin
    //NfeXML.InfNFe.Det.Add.Imposto.COFINS.COFINSAliq.CST := fDMNFe.mItensNFeCodCofins.AsString;
    DetXML.Imposto.COFINS.COFINSAliq.CST := fNFe.mItensNFeCodCofins.AsString;
    vVlrAux := 0;
    if fNFe.mItensNFeVlrCofins.AsFloat > 0 then
      vVlrAux := fNFe.mItensNFeVlrTotal.AsFloat;
    DetXML.Imposto.COFINS.COFINSAliq.VBC     := Replace(FormatFloat('0.00',vVlrAux),',','.');
    DetXML.Imposto.COFINS.COFINSAliq.PCOFINS := Replace(FormatFloat('0.0000',fNFe.mItensNFeAliqCofins.AsFloat),',','.');
    DetXML.Imposto.COFINS.COFINSAliq.VCOFINS := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrCofins.AsFloat),',','.');
  end
  else
  if (fNFe.mItensNFeCodCofins.AsString = '03') then
  begin
    //NfeXML.InfNFe.Det.Add.Imposto.COFINS.COFINSQtde.CST := fDMNFe.mItensNFeCodCofins.AsString;
    DetXML.Imposto.COFINS.COFINSQtde.CST := fNFe.mItensNFeCodCofins.AsString;
    vQtdAux := 0;
    if fNFe.mItensNFeVlrCofins.AsFloat > 0 then
      vQtdAux := fNFe.mItensNFeQtd.AsFloat;
    DetXML.Imposto.COFINS.COFINSQtde.QBCProd   := Replace(FormatFloat('0.0000',vQtdAux),',','.');
    DetXML.Imposto.COFINS.COFINSQtde.VAliqProd := Replace(FormatFloat('0.0000',fNFe.mItensNFeAliqCofins.AsFloat),',','.');
    DetXML.Imposto.COFINS.COFINSQtde.VCOFINS   := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrCofins.AsFloat),',','.');
  end
  else
  if (fNFe.mItensNFeCodCofins.AsString = '04') or (fNFe.mItensNFeCodCofins.AsString = '05') or (fNFe.mItensNFeCodCofins.AsString = '06') or
     (fNFe.mItensNFeCodCofins.AsString = '07') or (fNFe.mItensNFeCodCofins.AsString = '08') or (fNFe.mItensNFeCodCofins.AsString = '09') then
  begin
    //NfeXML.InfNFe.Det.Add.Imposto.COFINS.COFINSNT.CST := fDMNFe.mItensNFeCodCofins.AsString;
    DetXML.Imposto.COFINS.COFINSNT.CST := fNFe.mItensNFeCodCofins.AsString;
  end
  else
  begin
    //NfeXML.InfNFe.Det.Add.Imposto.COFINS.COFINSOutr.CST := fDMNFe.mItensNFeCodCofins.AsString;
    DetXML.Imposto.COFINS.COFINSOutr.CST := fNFe.mItensNFeCodCofins.AsString;
    vVlrAux := 0;
    vQtdAux := 0;
    if fNFe.mItensNFeVlrCofins.AsFloat > 0 then
    begin
      vVlrAux := fNFe.mItensNFeVlrTotal.AsFloat;
      vQtdAux := fNFe.mItensNFeQtd.AsFloat;
    end;
    if fNFe.mItensNFeTipoCofins.AsString = 'V' then
    begin
      DetXML.Imposto.COFINS.COFINSOutr.QBCProd   := Replace(FormatFloat('0.0000',vQtdAux),',','.');
      DetXML.Imposto.COFINS.COFINSOutr.VAliqProd := Replace(FormatFloat('0.0000',fNFe.mItensNFeAliqCofins.AsFloat),',','.');
    end
    else
    begin
      DetXML.Imposto.COFINS.COFINSOutr.VBC     := Replace(FormatFloat('0.00',vVlrAux),',','.');
      DetXML.Imposto.COFINS.COFINSOutr.PCOFINS := Replace(FormatFloat('0.00',fNFe.mItensNFeAliqCofins.AsFloat),',','.');
    end;
    DetXML.Imposto.COFINS.COFINSOutr.VCOFINS := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrCofins.AsFloat),',','.');
  end;
end;

procedure prc_Monta_Transportadora;
var
  texto2, vInscTransp : string;
  vCNPJTransp : String;
begin
  TranspXML := NfeXML.InfNFe.Transp;
  if DM1.tTransp.Locate('Codigo',DM1.tNotaFiscalCodTransp.AsInteger,([Locaseinsensitive])) then
  begin
    if DM1.tTranspPessoa.AsString = 'F' then
      NfeXML.InfNFe.Transp.Transporta.CPF  := Monta_Texto(DM1.tTranspCNPJ.AsString,11)
    else
      NfeXML.InfNFe.Transp.Transporta.CNPJ := Monta_Texto(DM1.tTranspCNPJ.AsString,14);
    NfeXML.InfNFe.Transp.Transporta.XNome  := TirarAcento(DM1.tTranspNome.AsString);
    if trim(DM1.tTranspInscricao.AsString) <> '' then
      NfeXML.InfNFe.Transp.Transporta.IE     := Monta_Texto(DM1.tTranspInscricao.AsString,0);
    NfeXML.InfNFe.Transp.Transporta.XEnder := TirarAcento(DM1.tTranspEndereco.AsString);
    fNFe.Posiciona_CidadeUF(DM1.tTranspCodCidade.AsInteger,DM1.tTranspIDPais.AsInteger);
    if DM1.tTranspCodCidade.AsInteger > 0 then
      NfeXML.InfNFe.Transp.Transporta.XMun := TirarAcento(DM1.tCidadeNome.AsString);
    NfeXML.InfNFe.Transp.Transporta.UF := DM1.tTranspUF.AsString;
  end;

  //Grupo de retenção do ICMS Transporte não foi implementado

  //Veiculo
  if trim(DM1.tNotaFiscalPlaca.AsString) <> '' then
  begin
    NfeXML.InfNFe.Transp.VeicTransp.Placa := DM1.tNotaFiscalPlaca.AsString;
    NfeXML.InfNFe.Transp.VeicTransp.UF    := DM1.tNotaFiscalUFPlaca.AsString;
    if trim(DM1.tNotaFiscalRNTC.AsString) <> '' then
      NfeXML.InfNFe.Transp.VeicTransp.RNTC  := DM1.tNotaFiscalRNTC.AsString;
  end;

  //Reboque
  DMNotaFiscal.tNotaFiscalReboque.First;
  while not DMNotaFiscal.tNotaFiscalReboque.Eof do
  begin
    TranspXML.Reboque.AddChild('Placa').Text := DMNotaFiscal.tNotaFiscalReboquePlaca.AsString;
    TranspXML.Reboque.AddChild('UF').Text    := DMNotaFiscal.tNotaFiscalReboqueUF.AsString;
    if trim(DMNotaFiscal.tNotaFiscalReboqueRNTC.AsString) <> '' then
      TranspXML.Reboque.AddChild('RNTC').Text := DMNotaFiscal.tNotaFiscalReboqueRNTC.AsString;
    DMNotaFiscal.tNotaFiscalReboque.Next;
  end;
  //Identificação do Vagão ou Balsa
  if DM1.tNotaFiscalIdentifVagaoBalsa.AsString = 'V' then
    TranspXML.Vagao := DM1.tNotaFiscalIdentifVagaoBalsa.AsString
  else
  if DM1.tNotaFiscalIdentifVagaoBalsa.AsString = 'B' then
    TranspXML.Balsa := DM1.tNotaFiscalIdentifVagaoBalsa.AsString;
end;

procedure prc_Monta_parcela(Data : TDateTime ; Valor : Real ; Parcela, NumNota : Integer ; Tipo_Cond : String); //P= A Prazo  V= A Vista
begin
  DupXML  := NfeXML.InfNFe.Cobr.Dup.Add;
  if Tipo_Cond = 'V' then
  begin
    DupXML.NDup  := 'A  V I S T A';
  end
  else
  begin
    if Parcela < 1 then
      DupXML.NDup := InTToStr(NumNota) + '/' + 'ENT'
    else
      DupXML.NDup := InTToStr(NumNota) + '/' + IntToStr(Parcela);
     DupXML.DVenc := FormatFloat('0000',YearOf(Data)) + '-' + FormatFloat('00',MonthOf(Data)) + '-' + FormatFloat('00',DayOf(Data));
  end;
  DupXML.VDup  := Replace(FormatFloat('0.00',Valor),',','.');
end;

procedure prc_Monta_Rodape;
var
  vVlrOutrasDespAcess : Real;
  vAux : Real;
begin
{* W  Total da NF-e }

//Letra W - Totais - Grupo de Valores Totais referentes ao ICMS
  vVlrOutrasDespAcess := DM1.tNotaFiscalOutrasDesp.AsFloat;
  if DM1.tNotaFiscalPisCofinsSomarOutrasDesp.AsString = 'S' then
    vVlrOutrasDespAcess := vVlrOutrasDespAcess - DM1.tNotaFiscalVlrPis.AsFloat - DM1.tNotaFiscalVlrCofins.AsFloat;

  NfeXML.InfNFe.Total.ICMSTot.VBC        := Replace(FormatFloat('0.00',DM1.tNotaFiscalBaseIcms.AsFloat),',','.');
  NfeXML.InfNFe.Total.ICMSTot.VICMS      := Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrIcms.AsFloat),',','.');
  NfeXML.InfNFe.Total.ICMSTot.VICMSDeson := Replace(FormatFloat('0.00',DM1.tNotaFiscalVLR_ICMSDESONERADO.AsFloat),',','.');
  NfeXML.InfNFe.Total.ICMSTot.VBCST      := Replace(FormatFloat('0.00',DM1.tNotaFiscalICMSBaseSubst.AsFloat),',','.');
  NfeXML.InfNFe.Total.ICMSTot.VST        := Replace(FormatFloat('0.00',DM1.tNotaFiscalICMSVlrSubst.AsFloat),',','.');
  vAux := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalItens.AsFloat + DM1.tNotaFiscalVlrTotalDesc.AsFloat));
  NfeXML.InfNFe.Total.ICMSTot.VProd      := Replace(FormatFloat('0.00',vAux),',','.');
  NfeXML.InfNFe.Total.ICMSTot.VFrete     := Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrFrete.AsFloat),',','.');
  NfeXML.InfNFe.Total.ICMSTot.VSeg       := Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrSeguro.AsFloat),',','.');
  NfeXML.InfNFe.Total.ICMSTot.VDesc      := Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDesc.AsFloat),',','.');
  NfeXML.InfNFe.Total.ICMSTot.VII        := Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrImpImportacao.AsFloat),',','.');
  NfeXML.InfNFe.Total.ICMSTot.VIPI       := Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrIpi.AsFloat),',','.');
  NfeXML.InfNFe.Total.ICMSTot.VPIS       := Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrPis.AsFloat),',','.');
  NfeXML.InfNFe.Total.ICMSTot.VCOFINS    := Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrCofins.AsFloat),',','.');
  NfeXML.InfNFe.Total.ICMSTot.VOutro     := Replace(FormatFloat('0.00',vVlrOutrasDespAcess),',','.');
  vAux := DM1.tNotaFiscalVlrTotalNota.AsFloat;
  if DM1.tParametrosUSA_DESONERACAO.AsString = 'S' then
    vAux := StrToFloat(FormatCurr('0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat - DM1.tNotaFiscalVLR_ICMSDESONERADO.AsFloat));
  NfeXML.InfNFe.Total.ICMSTot.VNF        := Replace(FormatFloat('0.00',vAux),',','.');
  NfeXML.InfNFe.Total.ICMSTot.VTotTrib   := Replace(FormatFloat('0.00',DM1.tNotaFiscalVlr_Tributo.AsFloat),',','.');

{* W01  Total da NF-e / ISSQN }
  //Tag não implementada

{* W02  Total da NF-e / Retenção de Tributos }
  //Tag não implementada

{* X  Informações do transporte da NF-e }
  if DM1.tNotaFiscalEmitDest.AsString = '1' then
    NfeXML.InfNFe.Transp.ModFrete := '0'
  else
  if DM1.tNotaFiscalEmitDest.AsString = '2' then
    NfeXML.InfNFe.Transp.ModFrete := '1'
  else
  if DM1.tNotaFiscalEmitDest.AsString = '3' then
    NfeXML.InfNFe.Transp.ModFrete := '2'
  else
  if DM1.tNotaFiscalEmitDest.AsString = '9' then
    NfeXML.InfNFe.Transp.ModFrete := '9';

  //Transportadora dados
  if DM1.tNotaFiscalCodTransp.AsInteger > 0 then
    prc_Monta_Transportadora;

  //Volumes
  if (DM1.tNotaFiscalQtd.AsInteger > 0) or (trim(DM1.tNotaFiscalEspecie.AsString) <> '') or
     (trim(DM1.tNotaFiscalMarca.AsString) <> '') or (trim(DM1.tNotaFiscalNumero.AsString) <> '') or
     (StrToFloat(FormatFloat('0.000',DM1.tNotaFiscalPesoLiquido.AsFloat)) > 0) or
     (StrToFloat(FormatFloat('0.000',DM1.tNotaFiscalPesoBruto.AsFloat)) > 0) then
  begin
    VolXML := NfeXML.InfNFe.Transp.Vol.Add;
    if trim(DM1.tNotaFiscalQtd.AsString) <> '' then
      VolXML.QVol  := TirarAcento(DM1.tNotaFiscalQtd.AsString);
    if (DM1.tNotaFiscalEspecie.AsString) <> '' then
      VolXML.Esp   := TirarAcento(DM1.tNotaFiscalEspecie.AsString);
    if trim(DM1.tNotaFiscalMarca.AsString) <> '' then
      VolXML.Marca := TirarAcento(DM1.tNotaFiscalMarca.AsString);
    if trim(DM1.tNotaFiscalNumero.AsString) <> '' then
      VolXML.NVol  := DM1.tNotaFiscalNumero.AsString;
    if StrToFloat(FormatFloat('0.000',DM1.tNotaFiscalPesoLiquido.AsFloat)) > 0 then
      VolXML.PesoL := Replace(FormatFloat('0.000',DM1.tNotaFiscalPesoLiquido.AsFloat),',','.');
    if StrToFloat(FormatFloat('0.000',DM1.tNotaFiscalPesoBruto.AsFloat)) > 0 then
      VolXML.PesoB := Replace(FormatFloat('0.000',DM1.tNotaFiscalPesoBruto.AsFloat),',','.');
  end;

  //Lacre
  DMNotaFiscal.tNotaFiscalLacre.First;
  while not DMNotaFiscal.tNotaFiscalLacre.Eof do
  begin
    //NfeXML.InfNFe.Transp.Vol.Add.Lacres.Add.NLacre := fDMCadNotaFiscal.cdsNotaFiscal_LacreNUMLACRE.AsString;
    if trim(DMNotaFiscal.tNotaFiscalLacreNumLacre.AsString) <> '' then
      LacreXML.NLacre := DMNotaFiscal.tNotaFiscalLacreNumLacre.AsString;
    DMNotaFiscal.tNotaFiscalLacre.Next;
  end;

  //Letra Y - Cobrança
  if DM1.tNotaFiscalCondPgto.AsString <> 'N' then
  begin
    CobrXML := NfeXML.InfNFe.Cobr;

    CobrXML.Fat.NFat  := DM1.tNotaFiscalNumNota.AsString;
    CobrXML.Fat.VOrig := Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDupl.AsFloat),',','.');
    CobrXML.Fat.VLiq  := Replace(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDupl.AsFloat),',','.');

    if DM1.tNotaFiscalCondPgto.AsString = 'V' then
      prc_Monta_parcela(DM1.tNotaFiscalDtEmissao.AsDateTime,DM1.tNotaFiscalVlrTotalDupl.AsFloat,1,DM1.tNotaFiscalNumNota.AsInteger,'V')
    else
    begin
      DM1.tNotaFiscalParc.First;
      if (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalEntrada.AsFloat)) > 0) and (DM1.tNotaFiscalParcParcela.AsInteger > 0) then
        prc_Monta_parcela(DM1.tNotaFiscalDtEmissao.AsDateTime,DM1.tNotaFiscalEntrada.AsFloat,0,DM1.tNotaFiscalNumNota.AsInteger,'P');
      DM1.tNotaFiscalParc.First;
      while not DM1.tNotaFiscalParc.Eof do
      begin
        prc_Monta_parcela(DM1.tNotaFiscalParcDtVenc.AsDateTime,DM1.tNotaFiscalParcVlrVenc.AsFloat,DM1.tNotaFiscalParcParcela.AsInteger,DM1.tNotaFiscalNumNota.AsInteger,'P');
        DM1.tNotaFiscalParc.Next;
      end;
    end;
  end;

{* Z  Informações do transporte da NF-e }
  fNFe.mDadosAdicionaisNFe.First;
  if trim(fNFe.mDadosAdicionaisNFeObs.Value) <> '' then
    NfeXML.InfNFe.InfAdic.InfCpl := TirarAcento(fNFe.mDadosAdicionaisNFeObs.Value);

  //Indicador de processo não implementado

{* ZA  Informações de Comércio Exterior }
  //Informação de Exportação
  if DM1.tNotaFiscalUFEmbExp.AsString <> '' then
  begin
    NfeXML.InfNFe.Exporta.UFSaidaPais  := DM1.tNotaFiscalUFEmbExp.AsString;
    NfeXML.InfNFe.Exporta.XLocExporta  := DM1.tNotaFiscalLocalEmbExp.AsString;
    NfeXML.InfNFe.Exporta.XLocDespacho := DM1.tNotaFiscalLOCALDESPEXPORTACAO.AsString;
  end;
{* ZB  Informações de Compras }
  //Não implementado
end;

procedure prc_Monta_Detalhe;
var
  vItemAdicao : Integer;
  vCodSitTrib, vOrigem : String;
  vPerc_Interno : Real;
  vCodCSTIPI : String;
  texto2 : String;
  Det: IXMLTNFe_infNFe_det;
  Exp: IXMLTNFe_infNFe_det_prod_detExport;
begin
{* H  Detalhamento de Produtos e Serviços da NF-e }
  DetXML := NfeXML.InfNFe.Det.Add;
  DetXML.NItem := fNFe.mItensNFeItemNota.AsString;
  DetXML.Prod.CProd := fNFe.mItensNFeCodProduto.AsString;
  DetXML.Prod.CEAN   := Trim(fNFe.mItensNFeCodBarra.AsString);
  DetXML.Prod.XProd  := TirarAcento(fNFe.mItensNFeNomeProduto.AsString);
  DetXML.Prod.NCM    := Replace(fNFe.mItensNFeClasFiscal.AsString,'.','');
  //NfeXML.InfNFe.Det.Add.Prod.NVE    := Replace(fDMNFe.mItensNFeClasFiscal.AsString,'.',''); //aqui ver
  if trim(fNFe.mItensNFeNCM_EX.AsString) <> '' then
    DetXML.Prod.EXTIPI := fNFe.mItensNFeNCM_EX.AsString;
  DetXML.Prod.CFOP     := fNFe.mItensNFeCodNatOper.AsString;
  DetXML.Prod.UCom     := fNFe.mItensNFeUnidade.AsString;
  DetXML.Prod.QCom     := Replace(FormatFloat('0.0000',fNFe.mItensNFeQtd.AsFloat) ,',','.');
  DetXML.Prod.VUnCom   := Replace(FormatFloat('0.0000######',fNFe.mItensNFeVlrUnitario.AsFloat) ,',','.');
  DetXML.Prod.VProd    := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrTotal.AsFloat) ,',','.');
  DetXML.Prod.CEANTrib := Trim(fNFe.mItensNFeCodBarra.AsString);
  //04/07/2017 Unidade de tributação
  if trim(fNFe.mItensNFeUNIDADE_TRIB.AsString) <> '' then
    DetXML.Prod.UTrib := fNFe.mItensNFeUNIDADE_TRIB.AsString
  else
    DetXML.Prod.UTrib := fNFe.mItensNFeUnidade.AsString;
  if StrToFloat(FormatFloat('0.0000',fNFe.mItensNFeQTD_TRIB.AsFloat)) > 0 then
    DetXML.Prod.QTrib := Replace(FormatFloat('0.0000',fNFe.mItensNFeQTD_TRIB.AsFloat) ,',','.')
  else
    DetXML.Prod.QTrib := Replace(FormatFloat('0.0000',fNFe.mItensNFeQtd.AsFloat) ,',','.');
  if StrToFloat(FormatFloat('0.0000000000',fNFe.mItensNFeVLR_UNITARIO_TRIB.AsFloat)) > 0 then
    DetXML.Prod.VUnTrib := Replace(FormatFloat('0.0000######',fNFe.mItensNFeVLR_UNITARIO_TRIB.AsFloat) ,',','.')
  else
    DetXML.Prod.VUnTrib := Replace(FormatFloat('0.0000######',fNFe.mItensNFeVlrUnitario.AsFloat) ,',','.');
  //**********

  if StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrFrete.AsFloat)) > 0 then
    DetXML.Prod.VFrete   := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrFrete.AsFloat) ,',','.');
  if StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrSeguro.AsFloat)) > 0 then
    DetXML.Prod.VSeg     := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrSeguro.AsFloat) ,',','.');
  if StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrDesconto.AsFloat)) > 0 then
    DetXML.Prod.VDesc    := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrDesconto.AsFloat) ,',','.');
  if StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrOutrasDespesas.AsFloat)) > 0 then
    DetXML.Prod.VOutro    := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrOutrasDespesas.AsFloat) ,',','.');
  if fNFe.mItensNFeSomaVlrTotalProd.AsBoolean then
    DetXML.Prod.IndTot := '1'
  else
    DetXML.Prod.IndTot := '0';

{* I01  Produtos e Serviços / Declaração de Importação }
  if (DM1.tNotaFiscalItens.Locate('Filial;NumSeq;Item',VarArrayOf([DM1.tNotaFiscalFilial.AsInteger,DM1.tNotaFiscalNumSeq.AsInteger,fNFe.mItensNFeItemOriginal.AsInteger]),[locaseinsensitive])) then
  begin
    if not DMNotaFiscal.tNotaFiscalImp.IsEmpty then
      DIXML  := DetXML.Prod.DI.Add;
    DMNotaFiscal.tNotaFiscalImp.First;
    while not DMNotaFiscal.tNotaFiscalImp.Eof do
    begin
      vItemAdicao := 0;

      DIXML.NDI := Monta_Texto(DMNotaFiscal.tNotaFiscalImpNumDI.AsString,0);
      DIXML.DDI := FormatFloat('0000',YearOf(DMNotaFiscal.tNotaFiscalImpDataRegistro.AsDateTime)) + '-'
                                             + FormatFloat('00',MonthOf(DMNotaFiscal.tNotaFiscalImpDataRegistro.AsDateTime)) + '-'
                                             + FormatFloat('00',DayOf(DMNotaFiscal.tNotaFiscalImpDataRegistro.AsDateTime));
      DIXML.XLocDesemb := TirarAcento(DMNotaFiscal.tNotaFiscalImpLOCAL_DESEMBARACO.AsString);
      DIXML.UFDesemb   := DMNotaFiscal.tNotaFiscalImpUF.AsString;
      DIXML.DDesemb    := FormatFloat('0000',YearOf(DMNotaFiscal.tNotaFiscalImpDataDesembaraco.AsDateTime)) + '-'
                                                    + FormatFloat('00',MonthOf(DMNotaFiscal.tNotaFiscalImpDataDesembaraco.AsDateTime)) + '-'
                                                    + FormatFloat('00',DayOf(DMNotaFiscal.tNotaFiscalImpDataDesembaraco.AsDateTime));
      DIXML.TpViaTransp := DMNotaFiscal.tNotaFiscalImpTIPO_VIA_TRANSORTE.AsString;
      if DMNotaFiscal.tNotaFiscalImpTIPO_VIA_TRANSORTE.AsInteger = 1 then
        DIXML.VAFRMM := Replace(FormatFloat('0.00',DMNotaFiscal.tNotaFiscalImpVLR_AFRMM.AsFloat) ,',','.');
      DIXML.TpIntermedio := DMNotaFiscal.tNotaFiscalImpTIPO_INTERMEDIO.AsString;
      if DMNotaFiscal.tNotaFiscalImpTIPO_INTERMEDIO.AsInteger > 1 then
      begin
        DIXML.CNPJ := Monta_Texto(DMNotaFiscal.tNotaFiscalImpCNPJ.AsString,14);
        DIXML.UFTerceiro := DMNotaFiscal.tNotaFiscalImpUF_TERCEIRO.AsString;
      end;
      DIXML.CExportador := DMNotaFiscal.tNotaFiscalImpCodExportador.AsString;
      
      vItemAdicao := 0;

      //DIXML  := DetXML.Prod.DI.Add;
      //DetXML.Prod. aaaaaaaaa
      DetADIXML := DIXML.Adi.Add;
      //DetADIXML :=
      DMNotaFiscal.tNotaFiscalImpAdicao.First;
      while not DMNotaFiscal.tNotaFiscalImpAdicao.Eof do
      begin
        //if DMNotaFiscal.tNotaFiscalImpAdicaoNumSeq.AsInteger > 0 then
        //  vItemAdicao := DMNotaFiscal.tNotaFiscalImpAdicao.AsInteger
        //else
          vItemAdicao := vItemAdicao + 1;

        DetADIXML.NAdicao     := DMNotaFiscal.tNotaFiscalImpAdicaoNumAdicao.AsString;
        DetADIXML.NSeqAdic    := IntToStr(vItemAdicao);
        DetADIXML.CFabricante := DMNotaFiscal.tNotaFiscalImpAdicaoCodFabricante.AsString;
        if StrToFloat(FormatFloat('0.00',DMNotaFiscal.tNotaFiscalImpAdicaoValorDescontoDI.AsFloat)) > 0 then
          DetADIXML.VDescDI     := Replace(FormatFloat('0.00', DMNotaFiscal.tNotaFiscalImpAdicaoValorDescontoDI.AsFloat),',','.');
        if trim(DMNotaFiscal.tNotaFiscalImpAdicaoNUM_DRAWBACK.AsString) <> '' then
          DetADIXML.NDraw       :=  DMNotaFiscal.tNotaFiscalImpAdicaoNUM_DRAWBACK.AsString;
        DMNotaFiscal.tNotaFiscalImpAdicao.Next;
      end;
      DMNotaFiscal.tNotaFiscalImp.Next;
    end;
{* I03  Produtos e Serviços / Grupo de Exportação }
    //Coloquei esta tabela no dia 11/10/2017
    DMNotaFiscal.cdsNotaFiscal_DrawBack.Close;
    DMNotaFiscal.sdsNotaFiscal_DrawBack.ParamByName('ID').AsInteger   := DM1.tNotaFiscalNumSeq.AsInteger;
    DMNotaFiscal.sdsNotaFiscal_DrawBack.ParamByName('ITEM').AsInteger := DM1.tNotaFiscalItensItem.AsInteger;
    DMNotaFiscal.cdsNotaFiscal_DrawBack.Open;
    DMNotaFiscal.cdsNotaFiscal_DrawBack.First;
    while not DMNotaFiscal.cdsNotaFiscal_DrawBack.Eof do
    begin
      Exp := DetXML.Prod.DetExport.Add;
      if trim(DMNotaFiscal.cdsNotaFiscal_DrawBackNUM_DRAWBACK.AsString) <> '' then
        Exp.NDraw             := DMNotaFiscal.cdsNotaFiscal_DrawBackNUM_DRAWBACK.AsString;
      Exp.ExportInd.NRE     := DMNotaFiscal.cdsNotaFiscal_DrawBackNUM_REG_EXPORTACAO.AsString;
      Exp.ExportInd.ChNFe   := DMNotaFiscal.cdsNotaFiscal_DrawBackNUM_CHAVE_ACESSO_NFE.AsString;
      Exp.ExportInd.QExport := Replace(FormatFloat('0.0000',DMNotaFiscal.cdsNotaFiscal_DrawBackQTD.AsFloat),',','.');

      DMNotaFiscal.cdsNotaFiscal_DrawBack.Next;
    end;
  end;

{* I05  Produtos e Serviços / Pedido de Compra }
  if trim(fNFe.mItensNFePedidoCliente.AsString) <> '' then
  begin
    DetXML.Prod.XPed     := fNFe.mItensNFePedidoCliente.AsString;
    if fNFe.mItensNFeItemPedido.AsInteger > 0 then
      DetXML.Prod.NItemPed := fNFe.mItensNFeItemPedido.AsString;
  end;

{* I07  Produtos e Serviços / Grupo Diversos }
  //3.10  não coloquei a função da NFCI
  {if (fDMNFe.qParametrosUSA_FCI.AsString = 'S') and (trim(fDMNFe.mItensNFeNFCI.AsString) <> '') then
    //NfeXML.InfNFe.Det.Add.Prod.NFCI := fDMNFe.mItensNFeNFCI.AsString;
    DetXML.Prod.NFCI := fDMNFe.mItensNFeNFCI.AsString;}

{* M  Tributos incidentes no Produto ou Serviço }
  vOrigem     := Copy(fNFe.mItensNFeCodSitTrib.AsString,1,1);
  vCodSitTrib := Copy(fNFe.mItensNFeCodSitTrib.AsString,2,Length(fNFe.mItensNFeCodSitTrib.AsString) - 1);
  if StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrTributos.AsFloat)) > 0 then
    DetXML.Imposto.VTotTrib := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrTributos.AsFloat),',','.');

{* N  ICMS Normal e ST }
  //3.10 não foi colocado este controle
  //if StrToFloat(FormatFloat('0.0000',fNFe.mItensNFePercIcmsSubstInterno.AsFloat)) > 0 then
  //  vPerc_Interno := StrToFloat(FormatFloat('0.0000',fNFe.mItensNFePercIcmsSubstInterno.AsFloat))
  //else
    vPerc_Interno := StrToFloat(FormatFloat('0.0000',DM1.tUFIcmsInterno.AsFloat));

  if vCodSitTrib = '00' then
    prc_Monta_ICMS00(vOrigem,vCodSitTrib)
  else
  if vCodSitTrib = '10' then
    prc_Monta_ICMS10(vOrigem,vCodSitTrib,vPerc_Interno)
  else
  if vCodSitTrib = '20' then
    prc_Monta_ICMS20(vOrigem,vCodSitTrib)
  else
  if vCodSitTrib = '30' then
    prc_Monta_ICMS30(vOrigem,vCodSitTrib,vPerc_Interno)
  else
  if (vCodSitTrib = '40') or (vCodSitTrib = '41') or (vCodSitTrib = '50') then
    prc_Monta_ICMS40(vOrigem,vCodSitTrib)
  else
  if (vCodSitTrib = '51') then
    prc_Monta_ICMS51(vOrigem,vCodSitTrib)
  else
  if (vCodSitTrib = '60') then
    prc_Monta_ICMS60(vOrigem,vCodSitTrib)
  else
  if (vCodSitTrib = '70') then
    prc_Monta_ICMS70(vOrigem,vCodSitTrib,vPerc_Interno)
  else
  if (vCodSitTrib = '90') then
    prc_Monta_ICMS90(vOrigem,vCodSitTrib,vPerc_Interno)
  else
  if (vCodSitTrib = '101') then
    prc_Monta_ICMSSN101(vOrigem,vCodSitTrib,DM1.tNotaFiscalPercIcmsSimples.AsFloat)
  else
  if (vCodSitTrib = '102') or (vCodSitTrib = '103') or (vCodSitTrib = '300') or (vCodSitTrib = '400') then
    prc_Monta_ICMSSN102(vOrigem,vCodSitTrib)
  else
  if vCodSitTrib = '201' then
    prc_Monta_ICMSSN201(vOrigem,vCodSitTrib,vPerc_Interno,DM1.tNotaFiscalPercIcmsSimples.AsFloat)
  else
  if (vCodSitTrib = '202') or (vCodSitTrib = '203') then
    prc_Monta_ICMSSN202(vOrigem,vCodSitTrib,vPerc_Interno)
  else
  if vCodSitTrib = '500' then
    prc_Monta_ICMSSN500(vOrigem,vCodSitTrib)
  else
  if vCodSitTrib = '900' then
    prc_Monta_ICMSSN900(vOrigem,vCodSitTrib,vPerc_Interno,DM1.tNotaFiscalPercIcmsSimples.AsFloat);

{* O  Imposto sobre Produtos Industrializados }
  vCodCSTIPI := fNFe.mItensNFeCodCSTIPI.AsString;
  //21/12/2015
  if trim(fNFe.mItensNFeCod_EnqIPI.AsString) <> '' then
    DetXML.Imposto.IPI.CEnq := fNFe.mItensNFeCod_EnqIPI.AsString
  else
    DetXML.Imposto.IPI.CEnq := '999';
  //******

  if ((fNFe.mItensNFeVlrIpi.AsFloat > 0) and (fNFe.mItensNFeAliqIpi.AsFloat > 0)) or
     (fNFe.mItensNFeCodCSTIPI.AsString = '99') or (fNFe.mItensNFeCodCSTIPI.AsString = '49') or
     (fNFe.mItensNFeCodCSTIPI.AsString = '50') or (fNFe.mItensNFeCodCSTIPI.AsString = '00') then
  begin
    DetXML.Imposto.IPI.IPITrib.AddChild('CST').Text  := vCodCSTIPI;
    DetXML.Imposto.IPI.IPITrib.AddChild('vBC').Text  := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrTotal.AsFloat),',','.');
    DetXML.Imposto.IPI.IPITrib.AddChild('pIPI').Text := Replace(FormatFloat('0.00',fNFe.mItensNFeAliqIpi.AsFloat),',','.');
    DetXML.Imposto.IPI.IPITrib.AddChild('vIPI').Text := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIpi.AsFloat),',','.');
  end
  else
    //NfeXML.InfNFe.Det.Add.Imposto.IPI.IPITrib.CST  := vCodCSTIPI;
    DetXML.Imposto.IPI.IPINT.AddChild('CST').Text  := vCodCSTIPI;

{* P  Imposto de Importação }
  if (StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrBaseImportacao.AsFloat)) > 0) or
     (StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrImportacao.AsFloat)) > 0) or
     (StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrDespAduaneira.AsFloat)) > 0) or
     (StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlrIOF.AsFloat)) > 0) then
  begin
    DetXML.Imposto.II.VBC      := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrBaseImportacao.AsFloat),',','.');
    DetXML.Imposto.II.VDespAdu := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrDespAduaneira.AsFloat),',','.');
    DetXML.Imposto.II.VII      := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrImportacao.AsFloat),',','.');
    DetXML.Imposto.II.VIOF     := Replace(FormatFloat('0.00',fNFe.mItensNFeVlrIOF.AsFloat),',','.');
  end;

{* Q  PIS }
  prc_Monta_Pis;

{* R  PIS ST }
  //Tag não implementada

{* S  COFINS }
  prc_Monta_Cofins;

{* R  COFINS ST }
  //Tag não implementada

{* U  ISSQN }
  //Tag não implementada

{* UA  Tributos Devolvidos (para o item da NF-e) }
  //Tag não implementada

{* V  Informações adicionais (para o item da NF-e) }
  //NfeXML.InfNFe.Det.Add.InfAdProd := fDMNFe.mItensNFeInfAdicionais.Value;
  texto2 := trim(fNFe.mItensNFeInfAdicionais.Value);
  if trim(texto2) <> '' then
    DetXML.InfAdProd := fNFe.mItensNFeInfAdicionais.Value;
end;

procedure prc_Monta_Cabecalho;
var
  Texto2, Texto : String;
  i: Integer;
  vNatureza : String;
begin
{* A  Dados da Nota Fiscal Eletrônica}
  NfeXML.InfNFe.Versao   := DM1.tParametrosVersaoNFe.AsString;
  NfeXML.InfNFe.Id       := 'NFe' + vChave_XML;

  fNFe.Posiciona_CidadeUF(DM1.tFilialCodCidade.AsInteger,1);
  DM1.tNatOperacao.IndexFieldNames := 'Codigo';
  vNatureza := '';
  if DM1.tNatOperacao.FindKey([DM1.tNotaFiscalCodNatOper.AsInteger]) then
    vNatureza := DM1.tNatOperacaoDescricao.AsString;

{* B  Identificação da Nota Eletrônica}
  //NfeXML.InfNFe.Ide.CUF   := fDMNFe.qCidadeUF.AsString;
  NfeXML.InfNFe.Ide.CUF   := DM1.tUFCodUF.AsString;
  i := Length(vChave_XML) + 1 - 9;
  NfeXML.InfNFe.Ide.CNF   := copy(vChave_XML,i,8);
  NfeXML.InfNFe.Ide.NatOp := vNatureza;
  if DM1.tNotaFiscalCondPgto.AsString = 'P' then
    NfeXML.InfNFe.Ide.IndPag := '1'
  else
  if DM1.tNotaFiscalCondPgto.AsString = 'V' then
    NfeXML.InfNFe.Ide.IndPag := '0'
  else
    NfeXML.InfNFe.Ide.IndPag := '2';
  NfeXML.InfNFe.Ide.Mod_  := '55';
  NfeXML.InfNFe.Ide.Serie := DM1.tNotaFiscalSerie.AsString;
  NfeXML.InfNFe.Ide.NNF   := DM1.tNotaFiscalNumNota.AsString;
  if DM1.tNotaFiscalHrEmissao.AsDateTime > 0 then
    vHrEmissaoNFe := DM1.tNotaFiscalHrEmissao.AsDateTime
  else
    vHrEmissaoNFe := Now;
  Texto := FormatDateTime('YYYY-MM-DD',DM1.tNotaFiscalDtEmissao.AsDateTime) + 'T' + FormatDateTime('hh:nn:ss',vHrEmissaoNFe) + PegaTimeZone;
  NfeXML.InfNFe.Ide.DhEmi := Texto;

  if DM1.tNotaFiscalDtSaidaEnt.AsDateTime > 1 then
  begin
    Texto := FormatDateTime('YYYY-MM-DD',DM1.tNotaFiscalDtSaidaEnt.AsDateTime) + 'T' + FormatDateTime('hh:nn:ss',DM1.tNotaFiscalHoraSaida.AsDateTime) + PegaTimeZone;
    NfeXML.InfNFe.Ide.DhSaiEnt := Texto;
  end;
  if DM1.tNotaFiscalSaidaEntrada.AsString = 'S' then
    NfeXML.InfNFe.Ide.TpNF := '1'
  else
    NfeXML.InfNFe.Ide.TpNF := '0';
  NfeXML.InfNFe.Ide.IdDest   := DM1.tNotaFiscalTIPO_DESTINO_OPERACAO.AsString;
  NfeXML.InfNFe.Ide.CMunFG   := DM1.tCidadeCodMunicipio.AsString;
  NfeXML.InfNFe.Ide.TpImp    := '1';
  NfeXML.InfNFe.Ide.TpEmis   := vTipo_Emissao_NFe;
  NfeXML.InfNFe.Ide.CDV      := copy(vChave_XML,Length(vChave_XML),1);
  NfeXML.InfNFe.Ide.TpAmb    := vTipo_Ambiente_NFe;
  NfeXML.InfNFe.Ide.FinNFe   := vFinalidade_NFe;
  //NfeXML.InfNFe.Ide.IndFinal := DM1.tNotaFiscalTipo_Consumidor.AsString;
  NfeXML.InfNFe.Ide.IndFinal := DM1.tClienteTipo_Consumidor.AsString;
  NfeXML.InfNFe.Ide.IndPres  := DM1.tNotaFiscalTIPO_ATENDIMENTO.AsString;
  NfeXML.InfNFe.Ide.ProcEmi  := vProcesso_Emissao_NFe;
  NfeXML.InfNFe.Ide.VerProc  := DM1.tParametrosVersaoEmissaoNFe.AsString;
  if (vTipo_Emissao_NFe = '2') or (vTipo_Emissao_NFe = '3') or (vTipo_Emissao_NFe = '5') then
  begin
    Texto := FormatDateTime('YYYY-MM-DD',DM1.tNotaFiscalDtContingencia.AsDateTime) + 'T' + FormatDateTime('hh:nn:ss',DM1.tNotaFiscalHrContingencia.AsDateTime) + PegaTimeZone;
    NfeXML.InfNFe.Ide.DhCont := Texto;
    NfeXML.InfNFe.Ide.XJust  := DM1.tNotaFiscalMotivoContingencia.AsString;
  end;

{* BA  Documento Fiscal Referenciado}
  prc_Le_mNotaDevolvidaNFe;

{* C  Identificação do Emitente da Ntoa Fiscal Eletrônica }
  //if fDMNFe.qFilialPESSOA.AsString = 'J' then
    NfeXML.InfNFe.Emit.CNPJ := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
  //else
   // NfeXML.InfNFe.Emit.CPF := Monta_Texto(fDMNFe.qFilialCNPJ_CPF.AsString,11);
  NfeXML.InfNFe.Emit.XNome := TirarAcento(DM1.tFilialEmpresa.AsString);
  if trim(DM1.tFilialNomeInterno.AsString) <> '' then
    NfeXML.InfNFe.Emit.XFant := TirarAcento(DM1.tFilialNomeInterno.AsString);
  NfeXML.InfNFe.Emit.EnderEmit.XLgr := TirarAcento(DM1.tFilialEndereco.AsString);
  NfeXML.InfNFe.Emit.EnderEmit.Nro  := DM1.tFilialNumEnd.AsString;
  //if trim(fDMNFe.qFilialCOMPLEMENTO_END.AsString) <> '' then
  //  NfeXML.InfNFe.Emit.EnderEmit.XCpl := TirarAcento(fDMNFe.qFilialCOMPLEMENTO_END.AsString);
  NfeXML.InfNFe.Emit.EnderEmit.XBairro := TirarAcento(DM1.tFilialBairro.AsString);
  NfeXML.InfNFe.Emit.EnderEmit.CMun  := DM1.tCidadeCodMunicipio.AsString;
  NfeXML.InfNFe.Emit.EnderEmit.XMun  := TirarAcento(DM1.tCidadeNome.AsString);
  NfeXML.InfNFe.Emit.EnderEmit.UF    := DM1.tCidadeEstado.AsString;
  NfeXML.InfNFe.Emit.EnderEmit.CEP   := Monta_Texto(DM1.tFilialCep.AsString,8);
  NfeXML.InfNFe.Emit.EnderEmit.CPais := DM1.tPaisCodPais.AsString;
  NfeXML.InfNFe.Emit.EnderEmit.XPais := TirarAcento(DM1.tPaisPais.AsString);
  //09/03/2015
  Texto2 := Monta_Texto(DM1.tFilialTel.AsString,0);
  if (trim(Texto2) <> '') and (Length(Texto2) > 6) then
    NfeXML.InfNFe.Emit.EnderEmit.Fone  := Monta_Texto(DM1.tFilialTel.AsString,0);
  NfeXML.InfNFe.Emit.IE              := Monta_Numero(DM1.tFilialInscr.AsString,0);
  // NfeXML.InfNFe.Emit.IEST :=  esse campo verificar
  if DM1.tFilialInscMunicipal.AsString <> '' then
    NfeXML.InfNFe.Emit.IM := Monta_Texto(DM1.tFilialInscMunicipal.AsString,0);
  if trim(DM1.tFilialCNAE.AsString) <> '' then
    NfeXML.InfNFe.Emit.CNAE := DM1.tFilialCNAE.AsString;
  NfeXML.InfNFe.Emit.CRT  := DM1.tFilialCodRegimeTrib.AsString;

{* D  Identificação do Fisco Emitente da NFe }
  //aqui Verificar

{* E  Identificação do Destinatário da Nota Fiscal Eletrônica }
  fNFe.Posiciona_CidadeUF(DM1.tClienteCodCidade.AsInteger,DM1.tClienteIDPais.AsInteger);

  if DM1.tClientePessoa.AsString = 'E' then
    NfeXML.InfNFe.Dest.IdEstrangeiro := Monta_Texto(DM1.tClienteCgcCpf.AsString,0)
  else
  if DM1.tClientePessoa.AsString = 'J' then
    NfeXML.InfNFe.Dest.CNPJ := Monta_Texto(DM1.tClienteCgcCpf.AsString,14)
  else
  if DM1.tClientePessoa.AsString = 'F' then
    NfeXML.InfNFe.Dest.CPF := Monta_Texto(DM1.tClienteCgcCpf.AsString,11);
  if vTipo_Ambiente_NFe = '2' then
    NfeXML.InfNFe.Dest.XNome := 'NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL'
  else
    NfeXML.InfNFe.Dest.XNome := TirarAcento(DM1.tClienteNome.AsString);
  NfeXML.InfNFe.Dest.EnderDest.XLgr    := TirarAcento(DM1.tClienteEndereco.AsString);
  NfeXML.InfNFe.Dest.EnderDest.Nro     := DM1.tClienteNumEnd.AsString;
  if trim(DM1.tClienteComplEndereco.AsString) <> '' then
    NfeXML.InfNFe.Dest.EnderDest.XCpl    := TirarAcento(DM1.tClienteComplEndereco.AsString);
  NfeXML.InfNFe.Dest.EnderDest.XBairro := TirarAcento(DM1.tClienteBairro.AsString);
  if DM1.tNotaFiscalTIPO_DESTINO_OPERACAO.AsInteger = 3 then
  begin
    NfeXML.InfNFe.Dest.EnderDest.CMun := '9999999';
    NfeXML.InfNFe.Dest.EnderDest.XMun := 'EXTERIOR';
    NfeXML.InfNFe.Dest.EnderDest.UF   := 'EX';
  end
  else
  begin
    NfeXML.InfNFe.Dest.EnderDest.CMun := DM1.tCidadeCodMunicipio.AsString;
    NfeXML.InfNFe.Dest.EnderDest.XMun := TirarAcento(DM1.tCidadeNome.AsString);
    NfeXML.InfNFe.Dest.EnderDest.UF   := DM1.tUFSigla.AsString;
  end;
  NfeXML.InfNFe.Dest.EnderDest.CEP   := Monta_Texto(DM1.tClienteCep.AsString,8);
  NfeXML.InfNFe.Dest.EnderDest.CPais := DM1.tPaisCodPais.AsString;
  NfeXML.InfNFe.Dest.EnderDest.XPais := TirarAcento(DM1.tPaisPais.AsString);
  Texto2 := Monta_Texto(DM1.tClienteTelefone.AsString,0);
  if trim(Texto2) <> '' then
    NfeXML.InfNFe.Dest.EnderDest.Fone  := Monta_Texto(DM1.tClienteTelefone.AsString,0);
  NfeXML.InfNFe.Dest.IndIEDest := DM1.tClienteTIPO_CONTRIBUINTE.AsString;
  if trim(DM1.tClienteInscrEst.AsString) <> '' then
    NfeXML.InfNFe.Dest.IE := Monta_Texto(DM1.tClienteInscrEst.AsString,0);
  //if (trim(fDMCadNotaFiscal.cdsClienteINSC_SUFRAMA.AsString) <> '') and not(fDMCadNotaFiscal.cdsClienteINSC_SUFRAMA.IsNull) then
  //  NfeXML.InfNFe.Dest.ISUF := Monta_Texto(fDMCadNotaFiscal.cdsClienteINSC_SUFRAMA.AsString,0);
  //if (trim(fDMCadNotaFiscal.cdsClienteINSC_MUNICIPAL.AsString) <> '') and not(fDMCadNotaFiscal.cdsClienteINSC_MUNICIPAL.IsNull) then
  //  NfeXML.InfNFe.Dest.IM := Monta_Texto(fDMCadNotaFiscal.cdsClienteINSC_MUNICIPAL.AsString,0);
  if trim(DM1.tClienteEmailNFe.AsString) <> '' then
    NfeXML.InfNFe.Dest.Email := Copy(DM1.tClienteEmailNFe.AsString,1,60);
    
{* F  Identificação do Local de retirada }
  //Ver aqui

{* G  Identificação do Local de Entrega }
  if DM1.tNotaFiscalLocalEntrega.AsString = 'E' then
  begin
    if DM1.tClientePessoaEntrega.AsString = 'J' then
      NfeXML.InfNFe.Entrega.CNPJ := Monta_Texto(DM1.tClienteCgcCpfEntrega.AsString,14)
    else
      NfeXML.InfNFe.Entrega.CPF := Monta_Texto(DM1.tClienteCgcCpfEntrega.AsString,11);
    NfeXML.InfNFe.Entrega.XLgr := TirarAcento(DM1.tClienteEndEntrega.AsString);
    NfeXML.InfNFe.Entrega.Nro  := DM1.tClienteNumEndEntrega.AsString;
    if trim(DM1.tClienteComplEnderecoEntrega.AsString) <> '' then
      NfeXML.InfNFe.Entrega.XCpl := TirarAcento(DM1.tClienteComplEnderecoEntrega.AsString);
    NfeXML.InfNFe.Entrega.XBairro := TirarAcento(DM1.tClienteBairroEntrega.AsString);
    fNFe.Posiciona_CidadeUF(DM1.tClienteCodCidadeE.AsInteger,DM1.tClienteIDPais.AsInteger);
    if (DM1.tPaisCodPais.AsString = '1058') then
    begin
      NfeXML.InfNFe.Entrega.CMun := DM1.tCidadeCodMunicipio.AsString;
      NfeXML.InfNFe.Entrega.XMun := TirarAcento(DM1.tCidadeNome.AsString);
      NfeXML.InfNFe.Entrega.UF   := DM1.tUFSigla.AsString;
    end
    else
    begin
      NfeXML.InfNFe.Entrega.CMun := '9999999';
      NfeXML.InfNFe.Entrega.XMun := 'EXTERIOR';
      NfeXML.InfNFe.Entrega.UF   := 'EX';
    end;
  end;

{* GA  Autorização para obter XML }
  DM1.tFilial_Download.First;
  if not DM1.tFilial_Download.IsEmpty then
  begin
    DM1.tFilial_Download.First;
    while not DM1.tFilial_Download.Eof do
    begin
      AutXML := NfeXML.InfNFe.AutXML.Add;
      if DM1.tFilial_DownloadPessoa.AsString = 'J' then
        AutXML.CNPJ := Monta_Texto(DM1.tFilial_DownloadCNPJ_CPF.AsString,14)
      else
        AutXML.CPF := Monta_Texto(DM1.tFilial_DownloadCNPJ_CPF.AsString,11);
      DM1.tFilial_Download.Next;
    end;
  end;
end;

procedure prc_Monta_ICMS_UF_Destino;
begin
  //08/12/2015
  if (StrToFloat(FormatFloat('0.000',fNFe.mItensNFePerc_ICMS_FCP.AsFloat)) > 0) or (StrToFloat(FormatFloat('0.00',fNFe.mItensNFeVlr_ICMS_UF_Dest.AsFloat)) > 0)  then
  begin
    DetXML.Imposto.ICMSUFDest.VBCUFDest      := Replace(FormatFloat('0.00',fNFe.mItensNFeBaseICMS.AsFloat),',','.');
    DetXML.Imposto.ICMSUFDest.PFCPUFDest     := Replace(FormatFloat('0.00',fNFe.mItensNFePerc_ICMS_FCP.AsFloat),',','.');
    DetXML.Imposto.ICMSUFDest.PICMSUFDest    := Replace(FormatFloat('0.00',fNFe.mItensNFePerc_ICMS_UF_Dest.AsFloat),',','.');
    DetXML.Imposto.ICMSUFDest.PICMSInter     := Replace(FormatFloat('0.00',fNFe.mItensNFeAliqIcms.AsFloat),',','.');
    DetXML.Imposto.ICMSUFDest.PICMSInterPart := Replace(FormatFloat('0.00',fNFe.mItensNFePerc_ICMS_Partilha.AsFloat),',','.');
    DetXML.Imposto.ICMSUFDest.PICMSInterPart := Replace(FormatFloat('0.00',fNFe.mItensNFePerc_ICMS_Partilha.AsFloat),',','.');
    DetXML.Imposto.ICMSUFDest.VFCPUFDest     := Replace(FormatFloat('0.00',fNFe.mItensNFeVlr_ICMS_FCP.AsFloat),',','.');
    DetXML.Imposto.ICMSUFDest.VICMSUFDest    := Replace(FormatFloat('0.00',fNFe.mItensNFeVlr_ICMS_UF_Dest.AsFloat),',','.');
    DetXML.Imposto.ICMSUFDest.VICMSUFRemet   := Replace(FormatFloat('0.00',fNFe.mItensNFeVlr_ICMS_UF_Remet.AsFloat),',','.');
  end;
  //**************
end;

end.
