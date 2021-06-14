unit uCalculos;

interface

uses
  Classes, SysUtils, DB, Dialogs, StrUtils;

procedure Calcula_Desconto_Novo(Repetir: Boolean);
procedure Calcula_ICMS_Novo(VlrTotal, VlrDesconto, VlrIPI, PercIcms: Real; CodSitTrib: Integer);
procedure Calcula_IPI_Novo(VlrTotal, VlrDesconto, PercIPI: Real);
procedure Calcula_ICMSSimples_Novo(VlrTotal: Real ; CodSitTrib: Integer);
procedure Calcula_PisCofins_Novo(VlrTotal: Real);
procedure Calcula_Frete_Novo;
procedure Calcula_Seguro_Novo;
procedure Calcula_OutrasDespesas_Novo;
procedure Calcula_Importacao_Novo;
procedure Calcula_Aduaneira_Novo;
procedure Calculo_GeralItem(Qtd,VlrUnitario,DescontoItem,PercDescontoItem,VlrTotal: Real; GeraDupl: Boolean);
procedure Subst_Tributaria;
procedure prc_Calcular_Tributos_Transparencia;
function fnc_Calcula_Importacao : Real;

//22/12/2015
procedure prc_Calcular_ICMS_UF_Dest;

var
  vCalcFrete, vCalcTotalNota, vCalcSeguro, vCalcOutrasDesp, vCalcImportacao, vCalcAduaneira : Real;
  vContadorOutros: Integer;
  vFlagGeraDupl: Boolean;

implementation

uses
  UEmissaoNotaFiscal, UDM1, UDMNotaFiscal, DateUtils, UNFe, StdConvs;

procedure Calcula_Desconto_Novo(Repetir: Boolean);
var
  vDesconto: Real;
  vDescAux: Real;
  vAux: Real;
  vContador: Integer;
  vVlrTotalItens: Real;
  vDescontoItem: Real;
  vVlrDuplicata: Real;
  vVlrDuplicata2: Real;
  vVlrDupAux : Real;
  vImpAux : Boolean;
begin
  DM1.tNotaFiscalItens.First;
  if (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrUnit.AsFloat)) <= 0) OR
     (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensQtd.AsFloat)) <= 0) then
    exit;

  if not Repetir then
  begin
    vCalcFrete      := DM1.tNotaFiscalVlrFrete.AsFloat;
    vCalcSeguro     := DM1.tNotaFiscalVlrSeguro.AsFloat;
    vCalcOutrasDesp := DM1.tNotaFiscalOutrasDesp.AsFloat;
    vCalcImportacao := DM1.tNotaFiscalVlrImpImportacao.AsFloat;
    vCalcAduaneira  := DM1.tNotaFiscalVlrAduaneira.AsFloat;

    vVlrDuplicata   := 0;
    vVlrDuplicata2  := 0;
    vCalcTotalNota  := 0;
    vContador       := 0;
    vContadorOutros := 0;
    vFlagGeraDupl   := False;
    fEmissaoNotaFiscal.qTotalItem.Close;
    fEmissaoNotaFiscal.qTotalItem.ParamByName('Filial').AsInteger := DM1.tNotaFiscalFilial.AsInteger;
    fEmissaoNotaFiscal.qTotalItem.ParamByName('NumSeq').AsInteger := DM1.tNotaFiscalNumSeq.AsInteger;
    fEmissaoNotaFiscal.qTotalItem.Open;
    fEmissaoNotaFiscal.qTotalItem.First;
    while not fEmissaoNotaFiscal.qTotalItem.Eof do
    begin
      if fEmissaoNotaFiscal.qTotalItemGeraDupl.AsBoolean then
      begin
        vVlrDuplicata := fEmissaoNotaFiscal.qTotalItemVlrTotal.AsFloat;
        vContador     := fEmissaoNotaFiscal.qTotalItemQtdItens.AsInteger;
      end;
      vCalcTotalNota := vCalcTotalNota + fEmissaoNotaFiscal.qTotalItemVlrTotal.AsFloat;

      if fEmissaoNotaFiscal.qTotalItemGeraDupl.AsBoolean then
      begin
        vContadorOutros := fEmissaoNotaFiscal.qTotalItemQtdItens.AsInteger;
        vFlagGeraDupl   := True;
      end
      else
      begin
        vContadorOutros := vContadorOutros + fEmissaoNotaFiscal.qTotalItemQtdItens.AsInteger;
        vVlrDuplicata2  := fEmissaoNotaFiscal.qTotalItemVlrTotal.AsFloat;
      end;
      fEmissaoNotaFiscal.qTotalItem.Next;
    end;
    if not vFlagGeraDupl then
      vContador := vContadorOutros;
    DM1.tNotaFiscalBaseIcmsSimples.AsFloat := 0;
    DM1.tNotaFiscalVlrIcmsSimples.AsFloat  := 0;
    DM1.tNotaFiscalVlrTotalDupl.AsFloat    := 0;
    DM1.tNotaFiscalVlrTotalItens.AsFloat   := 0;
    DM1.tNotaFiscalVlrTotalNota.AsFloat    := 0;
    DM1.tNotaFiscalBaseIcms.AsFloat        := 0;
    DM1.tNotaFiscalVlrIcms.AsFloat         := 0;
    DM1.tNotaFiscalVlrIpi.AsFloat          := 0;
    DM1.tNotaFiscalVlrPis.AsFloat          := 0;
    DM1.tNotaFiscalVlrCofins.AsFloat       := 0;
    DM1.tNotaFiscalVlr_Tributo.AsFloat     := 0;
    DM1.tNotaFiscalVLR_TRIBUTOS_ESTADUAL.AsFloat  := 0;
    DM1.tNotaFiscalVLR_TRIBUTOS_FEDERAL.AsFloat   := 0;
    DM1.tNotaFiscalVLR_TRIBUTOS_MUNICIPAL.AsFloat := 0;
    //aqui 09/06/2016

    //08/12/2015
    DM1.tNotaFiscalVLR_ICMS_FCP.AsFloat      := 0;
    DM1.tNotaFiscalVLR_ICMS_UF_DEST.AsFloat  := 0;
    DM1.tNotaFiscalVLR_ICMS_UF_REMET.AsFloat := 0;
    //*************

    if DM1.tClienteCodigo.AsInteger <> DM1.tNotaFiscalCodCli.AsInteger then
      DM1.tCliente.Locate('Codigo',DM1.tNotaFiscalCodCli.AsInteger,[loCaseInsensitive]);

    if DM1.tNotaFiscalTipoDesconto.AsString = 'N' then
      vDesconto := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDesc.AsFloat))
    else
    begin
      vDesconto := StrToFloat(FormatFloat('0.00',0));
      vContador := 0;
      DM1.tNotaFiscalVlrTotalDesc.AsFloat := 0;
    end;
    vDescAux      := 0;
  end;

  DM1.tNotaFiscalItens.First;
  while not DM1.tNotaFiscalItens.Eof do
  begin
    vDescontoItem  := 0;
    vVlrTotalItens := 0;
    DM1.tNatOperacao.Locate('Codigo',DM1.tNotaFiscalItensNatOper.AsInteger,([Locaseinsensitive]));
    vImpAux := False;
    if (copy(DM1.tNatOperacaoCodNatOper.AsString,1,1) = '3') and (DM1.tNotaFiscalItensSoma_Automatico_Imp.AsBoolean) then
      vImpAux := True;

    if not Repetir then
    begin
      DM1.tNotaFiscalItens.Edit;

      DM1.tNotaFiscalItensVlrTotal.AsFloat := 0;

      vVlrTotalItens := StrToCurr(FormatCurr('0.00',DM1.tNotaFiscalItensQtd.AsFloat * DM1.tNotaFiscalItensVlrUnit.AsFloat));

      if DM1.tNotaFiscalTipoDesconto.AsString = 'I' then
        vDesconto := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrDesconto.AsFloat));
      DM1.tNotaFiscalItensVlrDesconto.AsFloat       := 0;
      DM1.tNotaFiscalItensVlrDescontoRateio.AsFloat := 0;
    end;
    vDescAux := 0;
    if (DM1.tNotaFiscalItensGeraDupl.AsBoolean) or not(vFlagGeraDupl) then
    begin
      vContador := vContador - 1;
      if Repetir then
        DM1.tNotaFiscalItens.Edit;
      if vFlagGeraDupl then
        vVlrDupAux := StrToFloat(FormatFloat('0.00',vVlrDuplicata))
      else
        vVlrDupAux := StrToFloat(FormatFloat('0.00',vVlrDuplicata2));

      if (StrToFloat(FormatFloat('0.00',vDesconto)) > 0) then
      begin
        if (vContador <= 0) or (DM1.tNotaFiscalTipoDesconto.AsString = 'I') then
          vDescAux := StrToFloat(FormatFloat('0.00',vDesconto))
        else
        begin
          if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
          begin
            //vDescAux := StrToCurr(FormatCurr('0.00',(vVlrTotalItens / vVlrDuplicata) * 100));
            vDescAux := StrToCurr(FormatCurr('0.00',(vVlrTotalItens / vVlrDupAux) * 100));
            vDescAux := StrToCurr(FormatCurr('0.00',(vDescAux * DM1.tNotaFiscalVlrTotalDesc.AsFloat) / 100));
          end
          else                   
          begin
            //vDescAux := StrToFloat(FormatFloat('0.00',(vVlrTotalItens / vVlrDuplicata) * 100));
            vDescAux := StrToFloat(FormatFloat('0.00',(vVlrTotalItens / vVlrDupAux) * 100));
            vDescAux := StrToFloat(FormatFloat('0.00',(vDescAux * DM1.tNotaFiscalVlrTotalDesc.AsFloat) / 100));
          end;
          if StrToFloat(FormatFloat('0.00',vDescAux)) > StrToFloat(FormatFloat('0.00',vDesconto)) then
            vDescAux := StrToFloat(FormatFloat('0.00',vDesconto));
        end;
        vDesconto     := StrToFloat(FormatFloat('0.00',vDesconto - vDescAux));
        vDescontoItem := StrToFloat(FormatFloat('0.00',vDescAux));
      end;
    end;
    if DM1.tNotaFiscalTipoDesconto.AsString = 'I' then
      DM1.tNotaFiscalItensVlrDesconto.AsFloat       := DM1.tNotaFiscalItensVlrDesconto.AsFloat + vDescAux
    else
      DM1.tNotaFiscalItensVlrDescontoRateio.AsFloat := DM1.tNotaFiscalItensVlrDescontoRateio.AsFloat + vDescAux;
    vDescAux := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrDesconto.AsFloat + DM1.tNotaFiscalItensVlrDescontoRateio.AsFloat));

    if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
      DM1.tNotaFiscalItensVlrTotal.AsFloat := StrToCurr(FormatCurr('0.00',(DM1.tNotaFiscalItensQtd.AsFloat * DM1.tNotaFiscalItensVlrUnit.AsFloat) - vDescAux))
    else
      DM1.tNotaFiscalItensVlrTotal.AsFloat := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalItensQtd.AsFloat * DM1.tNotaFiscalItensVlrUnit.AsFloat) - vDescAux));

    if (copy(DM1.tNatOperacaoCodNatOper.AsString,1,1) = '3') and (DM1.tNotaFiscalItensSoma_Automatico_Imp.AsBoolean) then
      DM1.tNotaFiscalItensVlrImportacao.AsFloat     := fnc_Calcula_Importacao;

    fEmissaoNotaFiscal.vTipoPis := DM1.tNotaFiscalItensTipoPis.AsString;
    fEmissaoNotaFiscal.vPercPis := DM1.tNotaFiscalItensAliqPis.AsFloat;
    fEmissaoNotaFiscal.vVlrPis  := 0;

    fEmissaoNotaFiscal.vTipoCofins := DM1.tNotaFiscalItensTipoCofins.AsString;
    fEmissaoNotaFiscal.vPercCofins := DM1.tNotaFiscalItensAliqCofins.AsFloat;
    fEmissaoNotaFiscal.vVlrCofins  := 0;

    Calcula_PisCofins_Novo(DM1.tNotaFiscalItensVlrTotal.AsFloat);

    DM1.tNotaFiscalItensAliqPis.AsFloat       := fEmissaoNotaFiscal.vPercPis;
    DM1.tNotaFiscalItensAliqCofins.AsFloat   := fEmissaoNotaFiscal.vPercCofins;
    DM1.tNotaFiscalItensVlrPis.AsFloat        := fEmissaoNotaFiscal.vVlrPis;
    DM1.tNotaFiscalItensVlrCofins.AsFloat     := fEmissaoNotaFiscal.vVlrCofins;

    Calcula_IPI_Novo(DM1.tNotaFiscalItensVlrTotal.AsFloat,vDescAux,DM1.tNotaFiscalItensIpi.AsFloat);
    DM1.tNotaFiscalItensVlrIpi.AsFloat := vValorIPI;

    Calcula_ICMS_Novo(DM1.tNotaFiscalItensVlrTotal.AsFloat,vDescAux,DM1.tNotaFiscalItensVlrIpi.AsFloat,DM1.tNotaFiscalItensIcms.AsFloat,DM1.tNotaFiscalItensSitTrib.AsInteger);
    DM1.tNotaFiscalItensBaseIcms.AsFloat := vBaseICMS;
    DM1.tNotaFiscalItensVlrIcms.AsFloat  := vValorICMS;

    Calcula_ICMSSimples_Novo(DM1.tNotaFiscalItensVlrTotal.AsFloat,DM1.tNotaFiscalItensSitTrib.AsInteger);

    //08/12/2015
    prc_Calcular_ICMS_UF_Dest;

    if DM1.tNotaFiscalItensGeraDupl.AsBoolean then
    begin
     //Lei 12.741/12
     prc_Calcular_Tributos_Transparencia;
     DM1.tNotaFiscalVlr_Tributo.AsFloat            := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlr_Tributo.AsFloat + DM1.tNotaFiscalItensVlr_Tributo.AsFloat));
     DM1.tNotaFiscalVLR_TRIBUTOS_ESTADUAL.AsFloat  := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVLR_TRIBUTOS_ESTADUAL.AsFloat + DM1.tNotaFiscalItensVLR_TRIBUTOS_ESTADUAL.AsFloat));
     DM1.tNotaFiscalVLR_TRIBUTOS_FEDERAL.AsFloat   := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVLR_TRIBUTOS_FEDERAL.AsFloat + DM1.tNotaFiscalItensVLR_TRIBUTOS_FEDERAL.AsFloat));
     DM1.tNotaFiscalVLR_TRIBUTOS_MUNICIPAL.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVLR_TRIBUTOS_MUNICIPAL.AsFloat + DM1.tNotaFiscalItensVLR_TRIBUTOS_MUNICIPAL.AsFloat));
     //********

      if not Repetir then
      begin
        Calcula_Frete_Novo;
        calcula_Seguro_Novo;
        Calcula_OutrasDespesas_Novo;
        calcula_Importacao_Novo;
        calcula_Aduaneira_Novo;

      end;

      DM1.tNotaFiscalVlrTotalDupl.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDupl.AsFloat + vVlrTotalItens - vDescontoItem));
    end;

    if not(vFlagGeraDupl) and not(Repetir) then
    begin
      Calcula_Frete_Novo;
      calcula_Seguro_Novo;
      Calcula_OutrasDespesas_Novo;
      calcula_Importacao_Novo;
      calcula_Aduaneira_Novo;
    end;

    if (copy(DM1.tNatOperacaoCodNatOper.AsString,1,1) = '3') and (DM1.tNotaFiscalItensSoma_Automatico_Imp.AsBoolean) then
      DM1.tNotaFiscalVlrTotalNota.AsCurrency  := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalNota.AsCurrency + DM1.tNotaFiscalItensBaseIcms.AsFloat))
    else
      DM1.tNotaFiscalVlrTotalNota.AsCurrency  := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalNota.AsCurrency + vVlrTotalItens - vDescontoItem));
    if DM1.tNotaFiscalTipoDesconto.AsString = 'I' then
      DM1.tNotaFiscalVlrTotalDesc.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDesc.AsFloat + vDescontoItem));

    if DM1.tNatOperacao.Locate('Codigo',DM1.tNotaFiscalItensNatOper.AsInteger,([Locaseinsensitive])) then
    begin
      if DM1.tNatOperacaoSomaMercNF.AsBoolean then
        DM1.tNotaFiscalVlrTotalItens.AsCurrency := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalItens.AsCurrency + vVlrTotalItens));
      DM1.tNotaFiscalVlrTotalItens.AsCurrency := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalItens.AsCurrency - vDescontoItem));
    end;

    DM1.tNotaFiscalBaseIcms.AsCurrency := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalBaseIcms.AsCurrency + DM1.tNotaFiscalItensBaseIcms.AsCurrency));
    DM1.tNotaFiscalVlrIcms.AsCurrency  := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrIcms.AsCurrency + DM1.tNotaFiscalItensVlrIcms.AsCurrency));
    DM1.tNotaFiscalVlrIpi.AsCurrency   := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrIpi.AsCurrency + DM1.tNotaFiscalItensVlrIpi.AsCurrency));

    DM1.tNotaFiscalVlrPis.AsFloat    := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrPis.AsFloat + DM1.tNotaFiscalItensVlrPis.AsFloat));
    DM1.tNotaFiscalVlrCofins.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrCofins.AsFloat + DM1.tNotaFiscalItensVlrCofins.AsFloat));

    if (DM1.tNotaFiscalVlrTransf.AsFloat > 0) and (DM1.tNotaFiscalPercTransf.AsFloat > 0) then
      DM1.tNotaFiscalVlrTotalDupl.AsFloat     := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDupl.AsFloat - DM1.tNotaFiscalVlrTransf.AsFloat));

    //08/12/2015
    if copy(DM1.tNatOperacaoCodNatOper.AsString,1,1) <> '7' then
    begin
      DM1.tNotaFiscalVLR_ICMS_FCP.AsFloat      := DM1.tNotaFiscalVLR_ICMS_FCP.AsFloat + DM1.tNotaFiscalItensVLR_ICMS_FCP.AsFloat;
      DM1.tNotaFiscalVLR_ICMS_UF_DEST.AsFloat  := DM1.tNotaFiscalVLR_ICMS_UF_DEST.AsFloat + DM1.tNotaFiscalItensVLR_ICMS_UF_DEST.AsFloat;
      DM1.tNotaFiscalVLR_ICMS_UF_REMET.AsFloat := DM1.tNotaFiscalVLR_ICMS_UF_REMET.AsFloat + DM1.tNotaFiscalItensVLR_ICMS_UF_REMET.AsFloat;
    end;
    //*****************

    if DM1.tNotaFiscalItens.State in [dsEdit] then
      DM1.tNotaFiscalItens.Post;

    if Repetir then
      DM1.tNotaFiscalItens.Last;

    DM1.tNotaFiscalItens.Next;
  end;

  if StrToFloat(FormatFloat('0.00',vDesconto)) > 0 then
    Calcula_Desconto_Novo(True);

  if DM1.tNotaFiscalGeraDupl_Frete.AsBoolean then
    DM1.tNotaFiscalVlrTotalDupl.AsFloat := DM1.tNotaFiscalVlrTotalDupl.AsFloat + DM1.tNotaFiscalVlrFrete.AsFloat;
  if DM1.tNotaFiscalGeraDupl_OutrosValores.AsBoolean then
    DM1.tNotaFiscalVlrTotalDupl.AsFloat := DM1.tNotaFiscalVlrTotalDupl.AsFloat + DM1.tNotaFiscalOutrasDesp.AsFloat;
  if DM1.tNotaFiscalGeraDupl_Seguro.AsBoolean then
    DM1.tNotaFiscalVlrTotalDupl.AsFloat := DM1.tNotaFiscalVlrTotalDupl.AsFloat + DM1.tNotaFiscalVlrSeguro.AsFloat;
  if DM1.tNotaFiscalGeraDupl_PisCofins.AsBoolean then
    DM1.tNotaFiscalVlrTotalDupl.AsFloat := DM1.tNotaFiscalVlrTotalDupl.AsFloat + DM1.tNotaFiscalVlrPis.AsFloat + DM1.tNotaFiscalVlrCofins.AsFloat;

  if StrToFloat(FormatFloat('0.00',vVlrDuplicata)) > 0 then
    DM1.tNotaFiscalVlrTotalDupl.AsFloat := DM1.tNotaFiscalVlrTotalDupl.AsFloat + DM1.tNotaFiscalVlrIpi.AsFloat;

  //if vImpAux then
  if (copy(DM1.tNatOperacaoCodNatOper.AsString,1,1) = '3') and (DM1.tNotaFiscalItensSoma_Automatico_Imp.AsBoolean) then
    DM1.tNotaFiscalVlrTotalNota.AsCurrency  := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalBaseIcms.AsCurrency))
  else
    DM1.tNotaFiscalVlrTotalNota.AsFloat := DM1.tNotaFiscalVlrTotalNota.AsFloat + DM1.tNotaFiscalVlrFrete.AsFloat
                                         + DM1.tNotaFiscalOutrasDesp.AsFloat + DM1.tNotaFiscalVlrSeguro.AsFloat
                                         + DM1.tNotaFiscalVlrIpi.AsFloat;

  if StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDesc.AsFloat)) <= 0 then
    DM1.tNotaFiscalTipoDesconto.AsString := '';
  if StrToFloat(FormatFloat('0.0000',DM1.tNotaFiscalPercDesc.AsFloat)) > 0 then
    DM1.tNotaFiscalPercDescontoOrig.AsFloat := StrToFloat(FormatFloat('0.0000',DM1.tNotaFiscalPercDesc.AsFloat))
  else
    DM1.tNotaFiscalPercDescontoOrig.AsFloat := StrToFloat(FormatFloat('0.0000',0));

  DM1.tNotaFiscalPercDesc.AsFloat := StrToFloat(FormatFloat('0.0000',0));
end;

procedure Calcula_ICMS_Novo(VlrTotal, VlrDesconto, VlrIPI, PercIcms: Real; CodSitTrib: Integer);
var
  vSitTributaria: Real;
  vVlrIcmsOpe : Real;
  vBaseAux : Real;
  vVlrIcmsAux : Real;
begin
  DM1.tNotaFiscalItensPERC_DIFERIMENTO.AsFloat := 0;
  DM1.tNotaFiscalItensVLR_ICMSOPERACAO.AsFloat := 0;
  vBaseICMS  := 0;
  vValorICMS := 0;
  if StrToFloat(FormatFloat('0.00',PercIcms)) <= 0 then
  begin
    if (copy(DM1.tNatOperacaoCodNatOper.AsString,1,1) = '3') and (DM1.tNotaFiscalItensSoma_Automatico_Imp.AsBoolean) then
    begin
      vBaseAux := DM1.tNotaFiscalItensVlrTotal.AsFloat + DM1.tNotaFiscalItensVlrImportacao.AsFloat + DM1.tNotaFiscalItensVlrIpi.AsFloat
                + DM1.tNotaFiscalItensVlrPis.AsFloat + DM1.tNotaFiscalVlrCofins.AsFloat + DM1.tNotaFiscalItensVlrAduaneira.AsFloat;
      //09/06/2016   ver aqui o siscomex
      //if DM1.tParametrosSOMAR_BASE_ICMS_SISCOMEX.AsBoolean then
      //  vBaseAux := vBaseAux + fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TAXACISCOMEX.AsFloat;
      vBaseICMS  := vBaseAux
    end;
    exit;
  end;

  if (copy(DM1.tNatOperacaoCodNatOper.AsString,1,1) = '3') and (DM1.tNotaFiscalItensSoma_Automatico_Imp.AsBoolean) then
  begin
    vBaseAux := DM1.tNotaFiscalItensVlrTotal.AsFloat + DM1.tNotaFiscalItensVlrImportacao.AsFloat + DM1.tNotaFiscalItensVlrIpi.AsFloat
              + DM1.tNotaFiscalItensVlrPis.AsFloat + DM1.tNotaFiscalItensVlrCofins.AsFloat + DM1.tNotaFiscalItensVlrAduaneira.AsFloat;
    //09/06/2016  ver aqui siscomex
    //if fDMCadNotaFiscal.cdsParametrosSOMAR_BASE_ICMS_SISCOMEX.AsString = 'S' then
    //  vBaseAux := vBaseAux + fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TAXACISCOMEX.AsFloat;
    vBaseAux := vBaseAux / (1 - (PercIcms / 100));
    if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
      vVlrIcmsAux := StrToCurr(FormatCurr('0.00',vBaseAux * PercIcms / 100))
    else
      vVlrIcmsAux := StrToFloat(FormatFloat('0.00',vBaseAux * PercIcms / 100));
    //vBaseDif    := StrToFloat(FormatFloat('0.00',vBaseAux));
    vBaseICMS   := StrToFloat(FormatFloat('0.00',vBaseAux));
    vValorICMS  := StrToFloat(FormatFloat('0.00',vVlrIcmsAux));
    vVlrICMSOpe := StrToCurr(FormatCurr('0.00',0));
  end
  else
  begin
    if DM1.tParametrosAplicarDescontoNoICMS.AsBoolean then
      vBaseICMS := VlrTotal
    else
      vBaseICMS := StrToCurr(FormatCurr('0.00',VlrTotal + VlrDesconto));
    if DM1.tNotaFiscalItensIcmsIpi.AsBoolean then
      vBaseICMS  := StrToCurr(FormatCurr('0.00',vBaseICMS + VlrIPI));
    vSitTributaria := 0;
    if CodSitTrib > 0 then
    begin
      DM1.tSitTributaria.IndexFieldNames := 'Codigo';
      DM1.tSitTributaria.SetKey;
      DM1.tSitTributariaCodigo.AsInteger := CodSitTrib;
      if DM1.tSitTributaria.GotoKey then
      begin
        vSitTributaria := DM1.tSitTributariaSitTributaria.AsFloat;
        if (DM1.tSitTributariaCodSit.AsString = '51') and (StrToFloat(FormatFloat('0.0000',DM1.tSitTributariaSitTributaria.AsFloat)) <= 0) then
          vSitTributaria := 100;
        DM1.tNotaFiscalItensPERC_DIFERIMENTO.AsFloat := StrToFloat(FormatFloat('0.0000',DM1.tSitTributariaPerc_Diferimento.AsFloat));
      end
      else
        ShowMessage('Sit. Tributária não encontrada! ICMS não será calculado!');
    end;
    if vSitTributaria > 0 then
      vBaseICMS := StrToCurr(FormatCurr('0.00',vBaseICMS * vSitTributaria  / 100))
    else
      vBaseICMS := 0;
    if vBaseICMS > 0 then
      vValorICMS := StrToCurr(FormatCurr('0.00',vBaseICMS * PercIcms / 100))
    else
      vValorICMS := 0;
    vVlrICMSOpe := StrToCurr(FormatCurr('0.00',0));
    if (DM1.tNotaFiscalItenslkSitTributaria.AsString = '51') and (DM1.tNotaFiscalItenslkCALCULAR_ICMS_DIFERIDO.AsBoolean)   then
    begin
        vVlrIcmsOpe := StrToFloat(FormatFloat('0.00',vValorICMS));
        vValorICMS  := StrToFloat(FormatFloat('0.00',vVlrIcmsOpe - ((vVlrIcmsOpe * DM1.tNotaFiscalItensPERC_DIFERIMENTO.AsFloat) / 100)));
    end;
    if StrToFloat(FormatFloat('0.00',vVlrIcmsOpe)) > 0 then
      DM1.tNotaFiscalItensVLR_ICMSDIFERIDO.AsFloat := StrToFloat(FormatFloat('0.00',vVlrIcmsOpe - vValorICMS));
    DM1.tNotaFiscalItensVLR_ICMSOPERACAO.AsFloat := StrToFloat(FormatFloat('0.00',vVlrIcmsOpe));
  end;
end;

procedure Calcula_IPI_Novo(VlrTotal, VlrDesconto, PercIPI: Real);
var
  vAux : Real;
begin
  vValorIPI := 0;
  if copy(DM1.tNatOperacaoCodNatOper.AsString,1,1) = '3' then
  begin
    //aqui 07/05/2014 ==> estava somente o strtocurr
    //if trim(fDMCadNotaFiscal.qParametros_ImpSOMAR_VLR_II_NO_IPI.AsString) = 'S' then
    begin
      //if fDMCadNotaFiscal.cdsParametrosARREDONDAR_5.AsString = 'B' then
        VlrTotal := StrToCurr(FormatCurr('0.00',VlrTotal + DM1.tNotaFiscalItensVlrImportacao.AsFloat));
      //else
        //VlrTotal := StrToFloat(FormatFloat('0.00',VlrTotal + fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_IMPORTACAO.AsFloat));
    end;
  end;

  if DM1.tParametrosAplicarDescontoNoIPI.AsBoolean then
    vAux := StrToCurr(FormatCurr('0.00',VlrTotal))
  else
    vAux := StrToCurr(FormatCurr('0.00',VlrTotal + VlrDesconto));

  if (PercIPI > 0) then
    vValorIPI := StrToCurr(FormatCurr('0.00',vAux * PercIPI / 100));
end;

procedure Calcula_ICMSSimples_Novo(VlrTotal: Real; CodSitTrib: Integer);
var
  vSitTributaria : Real;
  vBaseAux, vVlrIcmsAux : Real;
begin
  DM1.tNotaFiscalItensBaseIcmsSimples.AsFloat := 0;
  DM1.tNotaFiscalItensVlrIcmsSimples.AsFloat  := 0;

  if not(DM1.tFilialSimples.AsBoolean) and not(Dm1.tFilialSimplesGaucho.AsBoolean) then
    exit;
  if not(DM1.tClienteUsaIcmsSimples.AsBoolean) or (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalPercIcmsSimples.AsFloat)) <= 0) then
    exit;
  if not DM1.tNatOperacaoIcmsSimples.AsBoolean then
    exit;

  vBaseAux := VlrTotal;
  //Lê a tabela da Situação tributária
  vSitTributaria := 0;
  if CodSitTrib > 0 then
    begin
      DM1.tSitTributaria.IndexFieldNames := 'Codigo';
      DM1.tSitTributaria.SetKey;
      DM1.tSitTributariaCodigo.AsInteger := CodSitTrib;
      if DM1.tSitTributaria.GotoKey then
        vSitTributaria := DM1.tSitTributariaSitTributaria.AsFloat
      else
        begin
          ShowMessage('Sit. Tributária não encontrada! ICMS será calculado 100%!');
          vSitTributaria := 100;
        end;
    end;
  if vSitTributaria > 0 then
     vBaseAux := StrToCurr(FormatCurr('0.00',vBaseAux * vSitTributaria  / 100))
  else
    vBaseAux := 0;
  vVlrIcmsAux := 0;

  //Calcula o valor do icms
  if vBaseAux > 0 then
    vVlrIcmsAux := StrToCurr(FormatCurr('0.00',vBaseAux * DM1.tNotaFiscalPercIcmsSimples.AsFloat / 100));
  DM1.tNotaFiscalItensBaseIcmsSimples.AsFloat := StrToCurr(FormatCurr('0.00',vBaseAux));
  DM1.tNotaFiscalItensVlrIcmsSimples.AsFloat  := StrToCurr(FormatCurr('0.00',vVlrIcmsAux));

  DM1.tNotaFiscalBaseIcmsSimples.AsFloat := StrToCurr(FormatCurr('0.00',DM1.tNotaFiscalBaseIcmsSimples.AsCurrency + DM1.tNotaFiscalItensBaseIcmsSimples.AsCurrency));
  DM1.tNotaFiscalVlrIcmsSimples.AsFloat  := StrToCurr(FormatCurr('0.00',DM1.tNotaFiscalVlrIcmsSimples.AsCurrency + DM1.tNotaFiscalItensVlrIcmsSimples.AsCurrency));
end;

procedure Calcula_PisCofins_Novo(VlrTotal: Real);
begin
  //09/06/2016
  //if not DM1.tNotaFiscalItensGeraDupl.AsBoolean then
  //  exit;
  if fEmissaoNotaFiscal.vPercPis > 0 then
  begin
    if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
      fEmissaoNotaFiscal.vVlrPis :=  StrToCurr(FormatCurr('0.00',(DM1.tNotaFiscalItensVlrTotal.AsFloat * fEmissaoNotaFiscal.vPercPis) / 100))
    else
      fEmissaoNotaFiscal.vVlrPis :=  StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalItensVlrTotal.AsFloat * fEmissaoNotaFiscal.vPercPis) / 100));
  end;
  if fEmissaoNotaFiscal.vPercCofins > 0 then
  begin
    if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
      fEmissaoNotaFiscal.vVlrCofins :=  StrToCurr(FormatCurr('0.00',(DM1.tNotaFiscalItensVlrTotal.AsFloat * fEmissaoNotaFiscal.vPercCofins) / 100))
    else
      fEmissaoNotaFiscal.vVlrCofins :=  StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalItensVlrTotal.AsFloat * fEmissaoNotaFiscal.vPercCofins) / 100));
  end;
end;

procedure Calcula_Frete_Novo;
var
  vAux : Real;
begin
  vContadorOutros := vContadorOutros - 1;
  vAux := 0;
  if vContadorOutros <= 0 then
    vAux := StrToFloat(FormatFloat('0.00',vCalcFrete))
  else
  if StrToFloat(FormatFloat('0.00',vCalcFrete)) > 0 then
  begin
    if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
    begin
      vAux := StrToCurr(FormatCurr('0.0000',(DM1.tNotaFiscalItensVlrTotal.AsFloat / vCalcTotalNota) * 100));
      vAux := StrToCurr(FormatCurr('0.00',(vCalcFrete * vAux) / 100));
    end
    else
    begin
      vAux := StrToFloat(FormatFloat('0.0000',(DM1.tNotaFiscalItensVlrTotal.AsFloat / vCalcTotalNota) * 100));
      vAux := StrToFloat(FormatFloat('0.00',(vCalcFrete * vAux) / 100));
    end;
  end;
  DM1.tNotaFiscalItensVlrFrete.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
  vCalcFrete := StrToFloat(FormatFloat('0.00',vCalcFrete - vAux));
  if StrToFloat(FormatFloat('0.00',vCalcFrete)) <= 0 then
    vCalcFrete := StrToFloat(FormatFloat('0.00',0));
  DM1.tNotaFiscalItensVlrIcmsFrete.AsFloat := 0;
  if (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrFrete.AsFloat)) > 0) and (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalAliqICMS_Frete.AsFloat)) > 0) then
  begin
    if not(DM1.tFilialSimples.AsBoolean) and not(DM1.tFilialSimplesGaucho.AsBoolean) then
    begin
      DM1.tNotaFiscalItensVlrIcmsFrete.AsCurrency := StrToFloat(FormatCurr('0.00',(DM1.tNotaFiscalItensVlrFrete.AsCurrency * DM1.tNotaFiscalAliqICMS_Frete.AsCurrency) / 100));
      DM1.tNotaFiscalItensBaseIcms.AsCurrency     := StrToFloat(FormatCurr('0.00',DM1.tNotaFiscalItensBaseIcms.AsCurrency + DM1.tNotaFiscalItensVlrFrete.AsCurrency));
      DM1.tNotaFiscalItensVlrIcms.AsCurrency      := StrToFloat(FormatCurr('0.00',DM1.tNotaFiscalItensVlrIcms.AsCurrency + DM1.tNotaFiscalItensVlrIcmsFrete.AsCurrency));
    end;
  end;
end;

procedure Calcula_Seguro_Novo;
var
  vAux : Real;
begin
  vAux := 0;
  if vContadorOutros <= 0 then
    vAux := StrToFloat(FormatFloat('0.00',vCalcSeguro))
  else
  if StrToFloat(FormatFloat('0.00',vCalcSeguro)) > 0 then
  begin
    if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
    begin
      vAux := StrToCurr(FormatCurr('0.0000',(DM1.tNotaFiscalItensVlrTotal.AsFloat / vCalcTotalNota) * 100));
      vAux := StrToCurr(FormatCurr('0.00',(vCalcSeguro * vAux) / 100));
    end
    else
    begin
      vAux := StrToFloat(FormatFloat('0.0000',(DM1.tNotaFiscalItensVlrTotal.AsFloat / vCalcTotalNota) * 100));
      vAux := StrToFloat(FormatFloat('0.00',(vCalcSeguro * vAux) / 100));
    end;
  end;
  DM1.tNotaFiscalItensVlrSeguro.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
  vCalcSeguro := StrToFloat(FormatFloat('0.00',vCalcSeguro - vAux));
  if StrToFloat(FormatFloat('0.00',vCalcSeguro)) <= 0 then
    vCalcSeguro := StrToFloat(FormatFloat('0.00',0));
end;

procedure Calcula_OutrasDespesas_Novo;
var
  vAux : Real;
begin
  vAux := 0;
  if vContadorOutros <= 0 then
    vAux := StrToFloat(FormatFloat('0.00',vCalcOutrasDesp))
  else
  if StrToFloat(FormatFloat('0.00',vCalcOutrasDesp)) > 0 then
  begin
    if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
    begin
      vAux := StrToCurr(FormatCurr('0.0000',(DM1.tNotaFiscalItensVlrTotal.AsFloat / vCalcTotalNota) * 100));
      vAux := StrToCurr(FormatCurr('0.00',(vCalcOutrasDesp * vAux) / 100));
    end
    else
    begin
      vAux := StrToFloat(FormatFloat('0.0000',(DM1.tNotaFiscalItensVlrTotal.AsFloat / vCalcTotalNota) * 100));
      vAux := StrToFloat(FormatFloat('0.00',(vCalcOutrasDesp * vAux) / 100));
    end;
  end;
  DM1.tNotaFiscalItensVlrOutrasDespesas.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
  vCalcOutrasDesp := StrToFloat(FormatFloat('0.00',vCalcOutrasDesp - vAux));
  if StrToFloat(FormatFloat('0.00',vCalcOutrasDesp)) <= 0 then
    vCalcOutrasDesp := StrToFloat(FormatFloat('0.00',0));

  DM1.tNotaFiscalItensVlrIcmsOutrasDespesas.AsFloat := 0;
  if (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrOutrasDespesas.AsFloat)) > 0) and (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalAliqICMS_OutrosValores.AsFloat)) > 0) then
  begin
    if not(DM1.tFilialSimples.AsBoolean) and not(DM1.tFilialSimplesGaucho.AsBoolean) then
    begin
      DM1.tNotaFiscalItensVlrIcmsOutrasDespesas.AsCurrency := StrToFloat(FormatCurr('0.00',(DM1.tNotaFiscalItensVlrOutrasDespesas.AsCurrency * DM1.tNotaFiscalAliqICMS_OutrosValores.AsCurrency) / 100));
      DM1.tNotaFiscalItensBaseIcms.AsCurrency              := StrToFloat(FormatCurr('0.00',DM1.tNotaFiscalItensBaseIcms.AsCurrency + DM1.tNotaFiscalItensVlrOutrasDespesas.AsCurrency));
      DM1.tNotaFiscalItensVlrIcms.AsCurrency               := StrToFloat(FormatCurr('0.00',DM1.tNotaFiscalItensVlrIcms.AsCurrency + DM1.tNotaFiscalItensVlrIcmsOutrasDespesas.AsCurrency));
    end;
  end;
end;

procedure Calcula_Importacao_Novo;
var
  vAux : Real;
begin
  vAux := 0;
  if vContadorOutros <= 0 then
    vAux := StrToFloat(FormatFloat('0.00',vCalcImportacao))
  else
  if StrToFloat(FormatFloat('0.00',vCalcImportacao)) > 0 then
  begin
    if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
    begin
      vAux := StrToCurr(FormatCurr('0.0000',(DM1.tNotaFiscalItensVlrTotal.AsFloat / vCalcTotalNota) * 100));
      vAux := StrToCurr(FormatCurr('0.00',(vCalcImportacao * vAux) / 100));
    end
    else
    begin
      vAux := StrToFloat(FormatFloat('0.0000',(DM1.tNotaFiscalItensVlrTotal.AsFloat / vCalcTotalNota) * 100));
      vAux := StrToFloat(FormatFloat('0.00',(vCalcImportacao * vAux) / 100));
    end;
  end;
  DM1.tNotaFiscalItensVlrImportacao.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
  vCalcImportacao := StrToFloat(FormatFloat('0.00',vCalcImportacao - vAux));
  if StrToFloat(FormatFloat('0.00',vCalcImportacao)) <= 0 then
    vCalcImportacao := StrToFloat(FormatFloat('0.00',0));
end;

procedure Calcula_Aduaneira_Novo;
var
  vAux : Real;
begin
  vAux := 0;
  if vContadorOutros <= 0 then
    vAux := StrToFloat(FormatFloat('0.00',vCalcAduaneira))
  else
  if StrToFloat(FormatFloat('0.00',vCalcAduaneira)) > 0 then
  begin
    if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
    begin
      vAux := StrToCurr(FormatCurr('0.0000',(DM1.tNotaFiscalItensVlrTotal.AsFloat / vCalcTotalNota) * 100));
      vAux := StrToCurr(FormatCurr('0.00',(vCalcAduaneira * vAux) / 100));
    end
    else
    begin
      vAux := StrToFloat(FormatFloat('0.0000',(DM1.tNotaFiscalItensVlrTotal.AsFloat / vCalcTotalNota) * 100));
      vAux := StrToFloat(FormatFloat('0.00',(vCalcAduaneira * vAux) / 100));
    end;
  end;
  DM1.tNotaFiscalItensVlrAduaneira.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
  vCalcAduaneira := StrToFloat(FormatFloat('0.00',vCalcAduaneira - vAux));
  if StrToFloat(FormatFloat('0.00',vCalcAduaneira)) <= 0 then
    vCalcAduaneira := StrToFloat(FormatFloat('0.00',0));
end;

procedure Calculo_GeralItem(Qtd,VlrUnitario,DescontoItem,PercDescontoItem,VlrTotal: Real; GeraDupl: Boolean);
var
  vVlrTotalItem: Real;
  vVlrDescontoItem: Real;
  vVlrAux: Real;
  vVlrDescAux: Real;
  vVlrFreteAnt, vVlrSeguroAnt, vVlrOutrasDespAnt, vVlrPisAnt, vVlrCofinsAnt, vVlrIPIAnt, vBaseICMSAnt : Real;
begin
  if (StrToCurr(FormatCurr('0.00',Qtd)) > 0) and (StrToCurr(FormatCurr('0.00',VlrUnitario)) > 0) then
    vVlrTotalItem    := StrToCurr(FormatCurr('0.00',Qtd * VlrUnitario))
  else
    vVlrTotalItem    := StrToCurr(FormatCurr('0.00',VlrTotal));

  vVlrDescontoItem := 0;

  vVlrFreteAnt      := 0;
  vVlrSeguroAnt     := 0;
  vVlrOutrasDespAnt := 0;
  vVlrPisAnt        := 0;
  vVlrCofinsAnt     := 0;
  vVlrIPIAnt        := 0;
  vBaseICMSANt      := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensBaseIcms.AsFloat));

  DM1.tNatOperacao.Locate('Codigo',DM1.tNotaFiscalItensNatOper.AsInteger,([Locaseinsensitive]));

  if (DM1.tNotaFiscalTipoDesconto.AsString = 'N') and (GeraDupl) then
  begin
    vVlrAux := StrToCurr(FormatCurr('0.00',vVlrTotalItem));
    if not DMNotaFiscal.tNotaFiscalTBDesconto.IsEmpty then
    begin
      DMNotaFiscal.tNotaFiscalTBDesconto.First;
      while not DMNotaFiscal.tNotaFiscalTBDesconto.Eof do
      begin
        if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
          vVlrDescAux := StrToCurr(FormatCurr('0.00',(vVlrAux * DMNotaFiscal.tNotaFiscalTBDescontoPercDesconto.AsFloat) / 100))
        else
          vVlrDescAux := StrToFloat(FormatFloat('0.00',(vVlrAux * DMNotaFiscal.tNotaFiscalTBDescontoPercDesconto.AsFloat) / 100));
        vVlrAux          := StrToFloat(FormatFloat('0.00',vVlrAux - vVlrDescAux));
        vVlrDescontoItem := StrToFloat(FormatFloat('0.00',vVlrDescontoItem + vVlrDescAux));
        DMNotaFiscal.tNotaFiscalTBDesconto.Next;
      end;
    end
    else
    if DM1.tNotaFiscalPercDesc.AsFloat > 0 then
    begin
      if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
        vVlrDescontoItem := StrToCurr(FormatCurr('0.00',(vVlrAux * DM1.tNotaFiscalPercDesc.AsFloat) / 100))
      else
        vVlrDescontoItem := StrToFloat(FormatFloat('0.00',(vVlrAux * DM1.tNotaFiscalPercDesc.AsFloat) / 100));
    end;
  end
  else
  if (DM1.tNotaFiscalTipoDesconto.AsString <> 'N') and (StrToFloat(FormatFloat('0.000',PercDescontoItem)) > 0) then
    vVlrDescontoItem := StrToCurr(FormatCurr('0.00',vVlrTotalItem * PercDescontoItem / 100))
  else
  if (DM1.tNotaFiscalTipoDesconto.AsString <> 'N') and (StrToFloat(FormatFloat('0.000',DescontoItem)) > 0) then
    vVlrDescontoItem := StrToCurr(FormatCurr('0.00',DescontoItem));

  DM1.tNotaFiscalItensVlrTotal.AsFloat := StrToFloat(FormatFloat('0.00',vVlrTotalItem - vVlrDescontoItem));

  //aqui incluido cálculo da importação - 09/06/2016
  if (copy(DM1.tNatOperacaoCodNatOper.AsString,1,1) = '3') and (DM1.tNotaFiscalItensSoma_Automatico_Imp.AsBoolean) then
  begin
    DM1.tNotaFiscalItensVlrOutrasDespesas.AsFloat := 0;
    DM1.tNotaFiscalItensVlrImportacao.AsFloat     := fnc_Calcula_Importacao;
  end;

  Calcula_IPI_Novo(DM1.tNotaFiscalItensVlrTotal.AsFloat,vVlrDescontoItem,DM1.tNotaFiscalItensIpi.AsFloat);
  DM1.tNotaFiscalItensVlrIpi.AsFloat   := vValorIPI;

  fEmissaoNotaFiscal.vTipoPis := DM1.tNotaFiscalItensTipoPis.AsString;
  fEmissaoNotaFiscal.vPercPis := DM1.tNotaFiscalItensAliqPis.AsFloat;
  fEmissaoNotaFiscal.vVlrPis  := 0;

  fEmissaoNotaFiscal.vTipoCofins := DM1.tNotaFiscalItensTipoCofins.AsString;
  fEmissaoNotaFiscal.vPercCofins := DM1.tNotaFiscalItensAliqCofins.AsFloat;
  fEmissaoNotaFiscal.vVlrCofins  := 0;

  Calcula_PisCofins_Novo(DM1.tNotaFiscalItensVlrTotal.AsFloat);

  DM1.tNotaFiscalItensAliqPis.AsFloat    := fEmissaoNotaFiscal.vPercPis;
  DM1.tNotaFiscalItensAliqCofins.AsFloat := fEmissaoNotaFiscal.vPercCofins;
  DM1.tNotaFiscalItensVlrPis.AsFloat     := fEmissaoNotaFiscal.vVlrPis;
  DM1.tNotaFiscalItensVlrCofins.AsFloat  := fEmissaoNotaFiscal.vVlrCofins;

  Calcula_ICMS_Novo(vVlrTotalItem,vVlrDescontoItem,DM1.tNotaFiscalItensVlrIpi.AsFloat,DM1.tNotaFiscalItensIcms.AsFloat,DM1.tNotaFiscalItensSitTrib.AsInteger);
  DM1.tNotaFiscalItensBaseIcms.AsFloat := vBaseICMS;
  DM1.tNotaFiscalItensVlrIcms.AsFloat  := vValorICMS;

  Calcula_ICMSSimples_Novo(DM1.tNotaFiscalItensVlrTotal.AsFloat,DM1.tNotaFiscalItensSitTrib.AsInteger);

  //08/12/2015
  prc_Calcular_ICMS_UF_Dest;

  //Lei 12.741/12
  prc_Calcular_Tributos_Transparencia;
  DM1.tNotaFiscalVlr_Tributo.AsFloat            := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlr_Tributo.AsFloat + DM1.tNotaFiscalItensVlr_Tributo.AsFloat));
  DM1.tNotaFiscalVLR_TRIBUTOS_ESTADUAL.AsFloat  := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVLR_TRIBUTOS_ESTADUAL.AsFloat + DM1.tNotaFiscalItensVLR_TRIBUTOS_ESTADUAL.AsFloat));
  DM1.tNotaFiscalVLR_TRIBUTOS_FEDERAL.AsFloat   := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVLR_TRIBUTOS_FEDERAL.AsFloat + DM1.tNotaFiscalItensVLR_TRIBUTOS_FEDERAL.AsFloat));
  DM1.tNotaFiscalVLR_TRIBUTOS_MUNICIPAL.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVLR_TRIBUTOS_MUNICIPAL.AsFloat + DM1.tNotaFiscalItensVLR_TRIBUTOS_MUNICIPAL.AsFloat));
  //********

  if GeraDupl then
    DM1.tNotaFiscalVlrTotalDupl.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDupl.AsFloat + vVlrTotalItem - vVlrDescontoItem));
  Calcula_Frete_Novo;
  calcula_Seguro_Novo;
  Calcula_OutrasDespesas_Novo;

  //09/06/2016
  DM1.tNatOperacao.Locate('Codigo',DM1.tNotaFiscalItensNatOper.AsInteger,([Locaseinsensitive]));

  if DM1.tNotaFiscalTipoDesconto.AsString = 'I' then
    DM1.tNotaFiscalVlrTotalDesc.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDesc.AsFloat + vVlrDescontoItem));

  if DM1.tNatOperacao.Locate('Codigo',DM1.tNotaFiscalItensNatOper.AsInteger,([Locaseinsensitive])) then
  begin
    if DM1.tNatOperacaoSomaMercNF.AsBoolean then
      DM1.tNotaFiscalVlrTotalItens.AsCurrency := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalItens.AsCurrency + vVlrTotalItem));
    DM1.tNotaFiscalVlrTotalItens.AsCurrency := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalItens.AsCurrency - vVlrDescontoItem));
  end;

  DM1.tNotaFiscalBaseIcms.AsCurrency := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalBaseIcms.AsCurrency + DM1.tNotaFiscalItensBaseIcms.AsCurrency));
  DM1.tNotaFiscalVlrIcms.AsCurrency  := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrIcms.AsCurrency + DM1.tNotaFiscalItensVlrIcms.AsCurrency));
  DM1.tNotaFiscalVlrIpi.AsCurrency   := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrIpi.AsCurrency + DM1.tNotaFiscalItensVlrIpi.AsCurrency));

  if (copy(DM1.tNatOperacaoCodNatOper.AsString,1,1) = '3') and (DM1.tNotaFiscalItensSoma_Automatico_Imp.AsBoolean) then
    DM1.tNotaFiscalVlrTotalNota.AsCurrency  := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalNota.AsCurrency + DM1.tNotaFiscalItensBaseIcms.AsFloat))
  else
    DM1.tNotaFiscalVlrTotalNota.AsCurrency  := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalNota.AsCurrency + vVlrTotalItem - vVlrDescontoItem));

  {if DM1.tNotaFiscalGeraDupl_Frete.AsBoolean then
    DM1.tNotaFiscalVlrTotalDupl.AsFloat := DM1.tNotaFiscalVlrTotalDupl.AsFloat + DM1.tNotaFiscalVlrFrete.AsFloat - vVlrFreteAnt;
  if DM1.tNotaFiscalGeraDupl_OutrosValores.AsBoolean then
    DM1.tNotaFiscalVlrTotalDupl.AsFloat := DM1.tNotaFiscalVlrTotalDupl.AsFloat + DM1.tNotaFiscalOutrasDesp.AsFloat - vVlrOutrasDespAnt;
  if DM1.tNotaFiscalGeraDupl_Seguro.AsBoolean then
    DM1.tNotaFiscalVlrTotalDupl.AsFloat := DM1.tNotaFiscalVlrTotalDupl.AsFloat + DM1.tNotaFiscalVlrSeguro.AsFloat - vVlrSeguroAnt;
  if DM1.tNotaFiscalGeraDupl_PisCofins.AsBoolean then
    DM1.tNotaFiscalVlrTotalDupl.AsFloat := DM1.tNotaFiscalVlrTotalDupl.AsFloat + DM1.tNotaFiscalVlrPis.AsFloat + DM1.tNotaFiscalVlrCofins.AsFloat;}

  if DM1.tNotaFiscalGeraDupl_Frete.AsBoolean then
    DM1.tNotaFiscalVlrTotalDupl.AsFloat := DM1.tNotaFiscalVlrTotalDupl.AsFloat + DM1.tNotaFiscalItensVlrFrete.AsFloat - vVlrFreteAnt;
  if DM1.tNotaFiscalGeraDupl_OutrosValores.AsBoolean then
    DM1.tNotaFiscalVlrTotalDupl.AsFloat := DM1.tNotaFiscalVlrTotalDupl.AsFloat + DM1.tNotaFiscalItensVlrOutrasDespesas.AsFloat - vVlrOutrasDespAnt;
  if DM1.tNotaFiscalGeraDupl_Seguro.AsBoolean then
    DM1.tNotaFiscalVlrTotalDupl.AsFloat := DM1.tNotaFiscalVlrTotalDupl.AsFloat + DM1.tNotaFiscalItensVlrSeguro.AsFloat - vVlrSeguroAnt;
  if DM1.tNotaFiscalGeraDupl_PisCofins.AsBoolean then
    DM1.tNotaFiscalVlrTotalDupl.AsFloat := DM1.tNotaFiscalVlrTotalDupl.AsFloat + DM1.tNotaFiscalItensVlrPis.AsFloat + DM1.tNotaFiscalItensVlrCofins.AsFloat;

  {if GeraDupl then
    DM1.tNotaFiscalVlrTotalDupl.AsFloat := DM1.tNotaFiscalVlrTotalDupl.AsFloat + DM1.tNotaFiscalVlrIpi.AsFloat - vVlrIPIAnt;

  DM1.tNotaFiscalVlrTotalNota.AsFloat := DM1.tNotaFiscalVlrTotalNota.AsFloat + DM1.tNotaFiscalVlrFrete.AsFloat
                                       + DM1.tNotaFiscalOutrasDesp.AsFloat + DM1.tNotaFiscalVlrSeguro.AsFloat
                                       + DM1.tNotaFiscalVlrIpi.AsFloat
                                       - vVlrFreteAnt - vVlrSeguroAnt - vVlrOutrasDespAnt
                                       - vVlrIPIAnt;}
  if GeraDupl then
    DM1.tNotaFiscalVlrTotalDupl.AsFloat := DM1.tNotaFiscalVlrTotalDupl.AsFloat + DM1.tNotaFiscalItensVlrIpi.AsFloat - vVlrIPIAnt;

  if (copy(DM1.tNatOperacaoCodNatOper.AsString,1,1) = '3') and (DM1.tNotaFiscalItensSoma_Automatico_Imp.AsBoolean) then
  begin
    DM1.tNotaFiscalVlrTotalNota.AsFloat := DM1.tNotaFiscalVlrTotalNota.AsFloat + DM1.tNotaFiscalItensVlrFrete.AsFloat
                                         + DM1.tNotaFiscalItensVlrOutrasDespesas.AsFloat + DM1.tNotaFiscalItensVlrSeguro.AsFloat
                                         - vVlrFreteAnt - vVlrSeguroAnt - vVlrOutrasDespAnt
  end
  else
    DM1.tNotaFiscalVlrTotalNota.AsFloat := DM1.tNotaFiscalVlrTotalNota.AsFloat + DM1.tNotaFiscalItensVlrFrete.AsFloat
                                         + DM1.tNotaFiscalItensVlrOutrasDespesas.AsFloat + DM1.tNotaFiscalItensVlrSeguro.AsFloat
                                         + DM1.tNotaFiscalItensVlrIpi.AsFloat
                                         - vVlrFreteAnt - vVlrSeguroAnt - vVlrOutrasDespAnt
                                         - vVlrIPIAnt;

  DM1.tNotaFiscalVlrPis.AsFloat    := DM1.tNotaFiscalVlrPis.AsFloat + DM1.tNotaFiscalItensVlrPis.AsFloat - vVlrPisAnt;
  DM1.tNotaFiscalVlrCofins.AsFloat := DM1.tNotaFiscalVlrCofins.AsFloat + DM1.tNotaFiscalItensVlrCofins.AsFloat - vVlrCofinsAnt;

  if StrToFloat(FormatFloat('0.0000',DM1.tNotaFiscalPercDesc.AsFloat)) > 0 then
    DM1.tNotaFiscalPercDescontoOrig.AsFloat := StrToFloat(FormatFloat('0.0000',DM1.tNotaFiscalPercDesc.AsFloat))
  else
    DM1.tNotaFiscalPercDescontoOrig.AsFloat := StrToFloat(FormatFloat('0.0000',0));
  DM1.tNotaFiscalVlrImpImportacao.AsFloat := DM1.tNotaFiscalVlrImpImportacao.AsFloat + DM1.tNotaFiscalItensVlrImportacao.AsFloat;
  DM1.tNotaFiscalVlrAduaneira.AsFloat     := DM1.tNotaFiscalVlrAduaneira.AsFloat + DM1.tNotaFiscalItensVlrAduaneira.AsFloat;
end;

procedure Subst_Tributaria;
var
  vTEIcms, vTIIcms, vBIcms, vVIcms, vBIcmsDif, vVIcmsDif, vTot, vVlrFrete, vVlrOutros: Currency;
begin
  vBIcmsDif := 0; //
  vVIcmsDif := 0; //
  vBIcms    := 0; //
  vVIcms    := 0; //
  vTot      := 0; //acumulador de total da nf
  vTIIcms   := 0; //taxa interna de icms
  vTEIcms   := 0; //taxa externa de icms

  dm1.tUF.Locate('Sigla', dm1.tNotaFiscallkUf.AsString, [loCaseInsensitive]);
  vTEIcms := dm1.tUFPercentual.AsCurrency;
  vTIIcms := dm1.tUFIcmsInterno.AsCurrency;

  dm1.tNotaFiscalItens.First;
  while not dm1.tNotaFiscalItens.Eof do
  begin
    vBIcms := dm1.tNotaFiscalItensVlrTotal.AsCurrency;

    dm1.tNatOperacao.IndexFieldNames := 'Codigo';
    dm1.tNatOperacao.FindKey([dm1.tNotaFiscalItensNatOper.AsInteger]);
    if dm1.tNatOperacaoSubstTrib.AsBoolean then
    begin
      dm1.tClasFiscal.IndexFieldNames := 'ClasFiscal';
      dm1.tClasFiscal.FindKey([dm1.tNotaFiscalItensClasFiscal.AsString]);
      if copy(dm1.tNatOperacaoCodNatOper.AsString,1,1) = '5' then
      begin
        dm1.tNotaFiscalItens.Edit;
        if not dm1.tNatOperacaoMVA.AsBoolean then
        begin
          dm1.tNotaFiscalItensIcmsBaseSubst.AsString := FormatFloat('0.00',vBIcms);
          vBIcmsDif := vBIcmsDif + dm1.tNotaFiscalItensIcmsBaseSubst.AsCurrency;
          if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
            vVIcms := StrToCurr(FormatCurr('0.00',(vBIcms * vTIIcms / 100) - (vBIcms * vTEIcms / 100)))
          else
            vVIcms := StrToFloat(FormatFloat('0.00',(vBIcms * vTIIcms / 100) - (vBIcms * vTEIcms / 100)));
          dm1.tNotaFiscalItensIcmsVlrSubst.AsCurrency := vVIcms;
          vVIcmsDif := vVIcmsDif + dm1.tNotaFiscalItensIcmsVlrSubst.AsCurrency;
        end
        else
        if dm1.tClasFiscalVmaInterno.AsCurrency > 0 then
        begin
          if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
            dm1.tNotaFiscalItensIcmsBaseSubst.AsString := FormatCurr('0.00', vBIcms * (1 + dm1.tClasFiscalVmaInterno.AsCurrency / 100))
          else
            dm1.tNotaFiscalItensIcmsBaseSubst.AsString := FormatFloat('0.00', vBIcms * (1 + dm1.tClasFiscalVmaInterno.AsCurrency / 100));
          vBIcmsDif := vBIcmsDif + dm1.tNotaFiscalItensIcmsBaseSubst.AsCurrency;
          if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
            vVIcms := StrToCurr(FormatCurr('0.00', vBIcms * vTEIcms / 100))
          else
            vVIcms := StrToFloat(FormatFloat('0.00', vBIcms * vTEIcms / 100));
          if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
            dm1.tNotaFiscalItensIcmsVlrSubst.AsString := FormatCurr('0.00',dm1.tNotaFiscalItensIcmsBaseSubst.AsCurrency * vTIIcms / 100 - vVIcms)
          else
            dm1.tNotaFiscalItensIcmsVlrSubst.AsString := FormatFloat('0.00',dm1.tNotaFiscalItensIcmsBaseSubst.AsCurrency * vTIIcms / 100 - vVIcms);
          vVIcmsDif := vVIcmsDif + dm1.tNotaFiscalItensIcmsVlrSubst.AsCurrency;
        end;
        dm1.tNotaFiscalItens.Post;
      end
      else //fora do estado
      begin
        dm1.tNotaFiscalItens.Edit;
        if not dm1.tNatOperacaoMVA.AsBoolean then
        begin
          dm1.tNotaFiscalItensIcmsBaseSubst.AsString := FormatFloat('0.00',vBIcms);
          vBIcmsDif := vBIcmsDif + dm1.tNotaFiscalItensIcmsBaseSubst.AsCurrency;
          if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
            vVIcms := StrToCurr(FormatCurr('0.00',(vBIcms * vTIIcms / 100) - (vBIcms * vTEIcms / 100)))
          else
            vVIcms := StrToFloat(FormatFloat('0.00',(vBIcms * vTIIcms / 100) - (vBIcms * vTEIcms / 100)));
          dm1.tNotaFiscalItensIcmsVlrSubst.AsCurrency := vVIcms;
          vVIcmsDif := vVIcmsDif + dm1.tNotaFiscalItensIcmsVlrSubst.AsCurrency;
        end
        else
        if dm1.tClasFiscalVmaInterestadual.AsCurrency > 0 then
        begin
          if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
            dm1.tNotaFiscalItensIcmsBaseSubst.AsString := FormatCurr('0.00', vBIcms * (1 + dm1.tClasFiscalVmaInterestadual.AsFloat / 100))
          else
            dm1.tNotaFiscalItensIcmsBaseSubst.AsString := FormatFloat('0.00', vBIcms * (1 + dm1.tClasFiscalVmaInterestadual.AsFloat / 100));
          vBIcmsDif := vBIcmsDif + dm1.tNotaFiscalItensIcmsBaseSubst.AsCurrency;
          if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
          begin
            vVIcms := StrToCurr(FormatCurr('0.00',vBIcms * vTEIcms / 100));
            dm1.tNotaFiscalItensIcmsVlrSubst.AsString := FormatCurr('0.00',dm1.tNotaFiscalItensIcmsBaseSubst.AsFloat * vTIIcms / 100 - vVIcms);
          end
          else
          begin
            vVIcms := StrToFloat(FormatFloat('0.00',vBIcms * vTEIcms / 100));
            dm1.tNotaFiscalItensIcmsVlrSubst.AsString := FormatFloat('0.00',dm1.tNotaFiscalItensIcmsBaseSubst.AsFloat * vTIIcms / 100 - vVIcms);
          end;
          vVIcmsDif := vVIcmsDif + dm1.tNotaFiscalItensIcmsVlrSubst.AsCurrency;
        end;
        dm1.tNotaFiscalItens.Post;
      end;
    end;
    vTot := vTot + dm1.tNotaFiscalItensVlrTotal.AsCurrency + dm1.tNotaFiscalItensIcmsVlrSubst.AsCurrency;
    if DM1.tNotaFiscalItensGeraDupl.AsBoolean then
      dm1.tNotaFiscalVlrTotalDupl.AsCurrency := dm1.tNotaFiscalVlrTotalDupl.AsCurrency + dm1.tNotaFiscalItensIcmsVlrSubst.AsCurrency;
    dm1.tNotaFiscalItens.Next;
  end;

  dm1.tNotaFiscalIcmsBaseSubst.AsString  := FormatFloat('0.00', vBIcmsDif);
  dm1.tNotaFiscalIcmsVlrSubst.AsString   := FormatFloat('0.00', vVIcmsDif);
  dm1.tNotaFiscalVlrTotalNota.AsCurrency := vTot + DM1.tNotaFiscalVlrFrete.AsFloat +
                                            DM1.tNotaFiscalOutrasDesp.AsFloat +
                                            DM1.tNotaFiscalVlrSeguro.AsFloat +
                                            DM1.tNotaFiscalVlrIpi.AsFloat;
                                            //dm1.tNotaFiscalVlrTotalDesc.AsCurrency;
  dm1.tNotaFiscalVlrTotalItens.AsFloat   := vTot - dm1.tNotaFiscalIcmsVlrSubst.AsCurrency;
end;

//Lei 12.741/12
procedure prc_Calcular_Tributos_Transparencia;
var
  vAux : Real;
begin
  {DM1.tNotaFiscalItensVlr_Tributo.AsFloat := 0;
  if (DM1.tNatOperacaoGerar_Tributo.AsString = 'S') and (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensPerc_Tributo.AsFloat)) > 0) then
  begin
    vAux := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalItensVlrTotal.AsFloat * DM1.tNotaFiscalItensPerc_Tributo.AsFloat) / 100));
    DM1.tNotaFiscalItensVlr_Tributo.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
  end;}

  DM1.tNotaFiscalItensVlr_Tributo.AsFloat            := 0;
  DM1.tNotaFiscalItensVLR_TRIBUTOS_FEDERAL.AsFloat   := 0;
  DM1.tNotaFiscalItensVLR_TRIBUTOS_ESTADUAL.AsFloat  := 0;
  DM1.tNotaFiscalItensVLR_TRIBUTOS_MUNICIPAL.AsFloat := 0;
  if (DM1.tNatOperacaoGerar_Tributo.AsString = 'S') then
  begin
    if (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensPERC_TRIBUTO_FEDERAL.AsFloat)) > 0) then
    begin
      vAux := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalItensVlrTotal.AsFloat * DM1.tNotaFiscalItensPERC_TRIBUTO_FEDERAL.AsFloat) / 100));
      DM1.tNotaFiscalItensVLR_TRIBUTOS_FEDERAL.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
    end;
    if (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensPERC_TRIBUTO_ESTADUAL.AsFloat)) > 0) then
    begin
      vAux := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalItensVlrTotal.AsFloat * DM1.tNotaFiscalItensPERC_TRIBUTO_ESTADUAL.AsFloat) / 100));
      DM1.tNotaFiscalItensVLR_TRIBUTOS_ESTADUAL.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
    end;
    if (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensPERC_TRIBUTO_MUNICIPAL.AsFloat)) > 0) then
    begin
      vAux := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalItensVlrTotal.AsFloat * DM1.tNotaFiscalItensPERC_TRIBUTO_MUNICIPAL.AsFloat) / 100));
      DM1.tNotaFiscalItensVLR_TRIBUTOS_MUNICIPAL.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
    end;
    DM1.tNotaFiscalItensVlr_Tributo.AsFloat := DM1.tNotaFiscalItensVLR_TRIBUTOS_ESTADUAL.AsFloat
                                             + DM1.tNotaFiscalItensVLR_TRIBUTOS_FEDERAL.AsFloat
                                             + DM1.tNotaFiscalItensVLR_TRIBUTOS_MUNICIPAL.AsFloat;
  end;
end;

procedure prc_Calcular_ICMS_UF_Dest;
var
  vAux, vAux2 : Real;
  vPerc_Partilha : Real;
  vVlr_ICMS_Int : Real;
  vVlr_ICMS_Ope : Real;
  vDifal : Real;
begin
  DM1.tNotaFiscalItensPERC_ICMS_FCP.AsFloat      := 0;
  DM1.tNotaFiscalItensPERC_ICMS_UF_DEST.AsFloat  := 0;
  DM1.tNotaFiscalItensPERC_ICMS_PARTILHA.AsFloat := 0;
  DM1.tNotaFiscalItensVLR_ICMS_FCP.AsFloat       := 0;
  DM1.tNotaFiscalItensVLR_ICMS_UF_DEST.AsFloat   := 0;
  DM1.tNotaFiscalItensVLR_ICMS_UF_REMET.AsFloat  := 0;
  if YearOf(DM1.tNotaFiscalDtEmissao.AsDateTime) < 2016 then
    exit;
  if DM1.tClienteUf.AsString = DM1.tFilialEstado.AsString then
    exit;
  if DM1.tClienteTipo_Consumidor.AsInteger <> 1 then
    exit;
  if DM1.tFilialSimples.AsBoolean then
    exit;
  if not DM1.tNatOperacaoIcms.AsBoolean then
    exit;
  if DM1.tClienteTIPO_CONTRIBUINTE.AsInteger <> 9 then
    exit;
  //Somar a base
  //vAux2 := StrToFloat(FormatFloat('0.00',((1 - (fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat / 100)) / (1 - (fDMCadNotaFiscal.cdsUFPERC_ICMS_INTERNO.AsFloat / 100))) ));
  {vAux := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat / ((1 - (fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat / 100)) / (1 - (fDMCadNotaFiscal.cdsUFPERC_ICMS_INTERNO.AsFloat / 100))) ));
  vVlr_ICMS_Int := StrToFloat(FormatFloat('0.00',vAux * fDMCadNotaFiscal.cdsNotaFiscal_ItensPERC_ICMS.AsFloat / 100));
  vVlr_ICMS_Ope := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensVLR_TOTAL.AsFloat * fDMCadNotaFiscal.cdsUFPERC_ICMS_INTERNO.AsFloat / 100));}
  vAux := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrTotal.AsFloat));
  vVlr_ICMS_Int := StrToFloat(FormatFloat('0.00',vAux * DM1.tNotaFiscalItensIcms.AsFloat / 100));
  vVlr_ICMS_Ope := StrToFloat(FormatFloat('0.00',vAux * DM1.tUFIcmsInterno.AsFloat / 100));
  vDifal        := vVlr_ICMS_Ope - vVlr_ICMS_Int;
  if DM1.tUFPERC_CP.AsFloat > 0 then
  begin
    DM1.tNotaFiscalItensPERC_ICMS_FCP.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tUFPERC_CP.AsFloat));
    DM1.tNotaFiscalItensVLR_ICMS_FCP.AsFloat  := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensBaseIcms.AsFloat * DM1.tUFPERC_CP.AsFloat / 100));
  end;
  DMNotaFiscal.qIcmsPartilha.Close;
  DMNotaFiscal.qIcmsPartilha.ParamByName('ANO').AsInteger := YearOf(DM1.tNotaFiscalDtEmissao.AsDateTime);
  DMNotaFiscal.qIcmsPartilha.Open;
  vPerc_Partilha := StrToFloat(FormatFloat('0.00',DMNotaFiscal.qIcmsPartilhaPERC_DESTINO.AsFloat));
  if (StrToFloat(FormatFloat('0.00',DMNotaFiscal.qIcmsPartilhaPERC_DESTINO.AsFloat)) <= 0) and (YearOf(DM1.tNotaFiscalDtEmissao.AsDateTime) >= 2019) then
    vPerc_Partilha := StrToFloat(FormatFloat('0.00',100));
  if (StrToFloat(FormatFloat('0.00',vPerc_Partilha)) <= 0) and (YearOf(DM1.tNotaFiscalDtEmissao.AsDateTime) < 2019) then
    exit;
  DM1.tNotaFiscalItensPERC_ICMS_PARTILHA.AsFloat := StrToFloat(FormatFloat('0.00',vPerc_Partilha));
  if (StrToFloat(FormatFloat('0.00',DM1.tUFIcmsInterno.AsFloat)) > 0) and (StrToFloat(FormatFloat('0.00',vPerc_Partilha)) > 0) then
  begin
    DM1.tNotaFiscalItensPERC_ICMS_UF_DEST.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tUFIcmsInterno.AsFloat));
    vAux := StrToFloat(FormatFloat('0.00',DM1.tUFIcmsInterno.AsFloat - DM1.tNotaFiscalItensIcms.AsFloat));
    if StrToFloat(FormatFloat('0.00',vAux)) > 0 then
    begin
      //vAux2 := StrToFloat(FormatFloat('0.00',fDMCadNotaFiscal.cdsNotaFiscal_ItensBASE_ICMS.AsFloat * vAux / 100));
      if StrToFloat(FormatFloat('0.00',vPerc_Partilha)) = 100 then
        DM1.tNotaFiscalItensVLR_ICMS_UF_DEST.AsFloat := StrToFloat(FormatFloat('0.00',vDifal))
      else
      begin
        DM1.tNotaFiscalItensVLR_ICMS_UF_DEST.AsFloat  := StrToFloat(FormatFloat('0.00',vDifal * vPerc_Partilha / 100));
        DM1.tNotaFiscalItensVLR_ICMS_UF_REMET.AsFloat := StrToFloat(FormatFloat('0.00',vDifal - DM1.tNotaFiscalItensVLR_ICMS_UF_DEST.AsFloat));
      end;
    end;
  end;
end;

function fnc_Calcula_Importacao : Real;
var
  vAux: Real;
begin
  Result := 0;
  if StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensPerc_Importacao.AsFloat)) > 0 then
  begin
    if DM1.tParametrosTipo_Arredondamento.AsString = 'C' then
      vAux := StrToCurr(FormatCurr('0.00',(DM1.tNotaFiscalItensVlrTotal.AsFloat * DM1.tNotaFiscalItensPerc_Importacao.AsFloat) / 100))
    else
      vAux := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalItensVlrTotal.AsFloat * DM1.tNotaFiscalItensPerc_Importacao.AsFloat) / 100));
    Result := StrToFloat(FormatFloat('0.00',vAux));
  end;
end;

end.
