unit uUtil_NFe;

interface

uses
  Classes, SysUtils, DB, Dialogs, Variants;

  //procedure prc_Grava_ObsTalao(Obs : String);

  function fnc_monta_Lei_Transparencia_Itens : String;
  function fnc_monta_Lei_Transparencia_DAdicionais : String;

var
  //vPerc_Trib_Maior : Real;
  vVlr_Trib_Itens : Real;
  vPerc_Trib_2 : Boolean;

  vPerc_Trib_Federal   : Real;
  vPerc_Trib_Estadual  : Real;
  vPerc_Trib_Municipal : Real;

  vVlr_Trib_Federal   : Real;
  vVlr_Trib_Estadual  : Real;
  vVlr_Trib_Municipal : Real;
  vHrEmissaoNFe : TDateTime;

implementation

uses
  StrUtils, UDM1;

function fnc_monta_Lei_Transparencia_Itens : String;
var
  Texto1 : String;
  vPercAux : Real;
begin
  Result := '';
  if (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlr_Tributo.AsFloat)) > 0) and (DM1.tParametrosLei_Transp_Imp_Item.AsString = 'S') then
  begin
    Texto1 := DM1.tParametrosLei_Transp_Texto_Item.AsString;
    if DM1.tParametrosIMP_TIPO_TRIBUTOS_ITENS.AsString = 'T' then
    begin
      if trim(Texto1) = '' then
        Texto1 := 'Vlr. aproxim. de tributos federais, estaduais, e municipais cfe. disposto na lei 12.741/12.';
      Texto1 := '(' + Texto1 + ' R$ '  + FormatFloat('####,###,##0.00',DM1.tNotaFiscalItensVlr_Tributo.AsFloat);
      vPercAux := StrToCurr(FormatCurr('0.00',((DM1.tNotaFiscalVlr_Tributo.AsFloat / vVlr_Trib_Itens) * 100)));
      Texto1 := Texto1 + ' (' + FormatFloat('0.00',vPercAux) + '%)';
    end
    else
    begin
      Texto1 := 'Vlr.aprox.de trib. R$ ' + FormatFloat('0.00',DM1.tNotaFiscalItensVLR_TRIBUTOS_FEDERAL.AsFloat);
      if DM1.tParametrosIMP_PERC_TRIB_ITENS.AsString = 'S' then
        Texto1 := Texto1 + ' %' + FormatFloat('0.00',DM1.tNotaFiscalItensPERC_TRIBUTO_FEDERAL.AsFloat);
      Texto1 := Texto1 + ' Federal';
        Texto1 := Texto1 + ', R$ ' + FormatFloat('0.00',DM1.tNotaFiscalItensVLR_TRIBUTOS_ESTADUAL.AsFloat);
      if DM1.tParametrosIMP_PERC_TRIB_ITENS.AsString = 'S' then
        Texto1 := Texto1 + ' %' + FormatFloat('0.00',DM1.tNotaFiscalItensPERC_TRIBUTO_ESTADUAL.AsFloat);
      Texto1 := Texto1 + ' Estadual';
        Texto1 := Texto1 + ', R$ ' + FormatFloat('0.00',DM1.tNotaFiscalItensVLR_TRIBUTOS_MUNICIPAL.AsFloat);
      if DM1.tParametrosIMP_PERC_TRIB_ITENS.AsString = 'S' then
        Texto1 := Texto1 + ' %' + FormatFloat('0.00',DM1.tNotaFiscalItensPERC_TRIBUTO_MUNICIPAL.AsFloat);
      Texto1 := Texto1 + ' Municipal';
      Texto1 := Texto1 + '  e R$ ' + FormatFloat('0.00',DM1.tNotaFiscalItensVlr_Tributo.AsFloat);
      vPercAux := StrToCurr(FormatCurr('0.00',((DM1.tNotaFiscalVlr_Tributo.AsFloat / vVlr_Trib_Itens) * 100)));
      Texto1 := Texto1 + '  %' + FormatFloat('0.00',vPercAux) + ' Total';
      Texto1 := Texto1 + ' lei 12.741/12';
    end;
    if trim(DM1.tNotaFiscalItensFONTE_TRIBUTO.AsString) <> '' then
      Texto1 := Texto1 + ' Fonte: ' + DM1.tNotaFiscalItensFONTE_TRIBUTO.AsString + ')'
    else
    if DM1.tParametrosTipo_Lei_Transp.AsString = 'I' then
      Texto1 := Texto1 + ' Fonte IBPT)'
    else
      Texto1 := Texto1 + ')';
    Result := Texto1;
  end;
end;

function fnc_monta_Lei_Transparencia_DAdicionais : String;
var
  vTexto : String;
  vPercAux : Real;
  vPercAux_Estadual  : Real;
  vPercAux_Federal   : Real;
  vPercAux_Municipal : Real;
begin
  {Result := '';
  if StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlr_Tributo.AsFloat)) > 0 then
  begin
    //vPercAux := StrToCurr(FormatCurr('0.00',((DM1.tNotaFiscalVlr_Tributo.AsFloat / DM1.tNotaFiscalVlrTotalItens.AsFloat) * 100)));
    if vPerc_Trib_2 then
      vPercAux := StrToCurr(FormatCurr('0.00',((DM1.tNotaFiscalVlr_Tributo.AsFloat / vVlr_Trib_Itens) * 100)))
    else
      vPercAux := vPerc_Trib_Maior;
    Texto1 := '(Vlr. aproximado total de tributos federais, estaduais, e municipais cfe. disposto na lei 12.741/12. R$ ' + FormatFloat('###,###,##0.00',DM1.tNotaFiscalVlr_Tributo.AsFloat);
    if DM1.tParametrosLei_Transp_Perc_Adic.AsString = '1' then
      vPercAux := vPerc_Trib_Maior;
    Texto1 := Texto1 + '  ' + FormatFloat('0.00',vPercAux) + '%';
    if DM1.tParametrosTipo_Lei_Transp.AsString = 'I' then
      Texto1 := Texto1 + ' Fonte IBPT)'
    else
      Texto1 := Texto1 + ')';
    Result := Texto1;
  end;}

  Result := '';
  if StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlr_Tributo.AsFloat)) > 0 then
  begin
    if DM1.tParametrosIMP_TIPO_TRIBUTOS.AsString = 'T' then
    begin
      vPercAux := StrToCurr(FormatCurr('0.00',((DM1.tNotaFiscalVlr_Tributo.AsFloat / vVlr_Trib_Itens) * 100)));
      vTexto := '(Vlr. aproximado total de tributos federais, estaduais, e municipais cfe. disposto na lei 12.741/12. R$ ' + FormatFloat('###,###,##0.00',DM1.tNotaFiscalVlr_Tributo.AsFloat);
      vTexto := vTexto + '  ' + FormatFloat('0.00',vPercAux) + '% )';
    end
    else
    begin
      vPercAux_Estadual  := 0;
      vPercAux_Federal   := 0;
      vPercAux_Municipal := 0;
      vPercAux := StrToCurr(FormatCurr('0.00',((DM1.tNotaFiscalVlr_Tributo.AsFloat / vVlr_Trib_Itens) * 100)));
      if vPerc_Trib_Estadual <> StrToCurr(FormatCurr('0.00',0)) then
        vPercAux_Estadual := StrToCurr(FormatCurr('0.00',vPerc_Trib_Estadual))
      else
      if vVlr_Trib_Estadual <> StrToCurr(FormatCurr('0.00',0)) then
        vPercAux_Estadual  := StrToCurr(FormatCurr('0.00',((DM1.tNotaFiscalVLR_TRIBUTOS_ESTADUAL.AsFloat / vVlr_Trib_Estadual) * 100)));
      if vPerc_Trib_Federal <> StrToCurr(FormatCurr('0.00',0)) then
        vPercAux_Federal := StrToCurr(FormatCurr('0.00',vPerc_Trib_Federal))
      else
      if vVlr_Trib_Federal <> StrToCurr(FormatCurr('0.00',0)) then
        vPercAux_Federal  := StrToCurr(FormatCurr('0.00',((DM1.tNotaFiscalVLR_TRIBUTOS_FEDERAL.AsFloat / vVlr_Trib_Federal) * 100)));
      if vPerc_Trib_Municipal <> StrToCurr(FormatCurr('0.00',0)) then
        vPerc_Trib_Municipal := StrToCurr(FormatCurr('0.00',vPerc_Trib_Municipal))
      else
      if vVlr_Trib_Municipal <> StrToCurr(FormatCurr('0.00',0)) then
        vPerc_Trib_Municipal := StrToCurr(FormatCurr('0.00',((DM1.tNotaFiscalVLR_TRIBUTOS_MUNICIPAL.AsFloat / vVlr_Trib_Municipal) * 100)));
      vTexto := '(Vlr.aprox. tributos R$ ' + FormatFloat('###,###,##0.00',DM1.tNotaFiscalVLR_TRIBUTOS_FEDERAL.AsFloat);
      if DM1.tParametrosIMP_PERC_TRIB_DADOS_ADIC.AsString = 'S' then
        vTexto := vTexto + ' %' + FormatFloat('0.00',vPercAux_Federal);
      vTexto := vTexto + ' Federal,';
      vTexto := vTexto + ' R$ ' + FormatFloat('###,###,##0.00',DM1.tNotaFiscalVLR_TRIBUTOS_ESTADUAL.AsFloat);
      if DM1.tParametrosIMP_PERC_TRIB_DADOS_ADIC.AsString = 'S' then
        vTexto := vTexto + ' %' + FormatFloat('0.00',vPercAux_Estadual);
      vTexto := vTexto + ' Estadual e R$ ' + FormatFloat('###,###,##0.00',DM1.tNotaFiscalVLR_TRIBUTOS_MUNICIPAL.AsFloat);
      if DM1.tParametrosIMP_PERC_TRIB_DADOS_ADIC.AsString = 'S' then
        vTexto := vTexto + ' %' + FormatFloat('0.00',vPercAux_Municipal);
      vTexto := vTexto + ' Municipal  R$ ' + FormatFloat('###,###,##0.00',DM1.tNotaFiscalVlr_Tributo.AsFloat);
      if DM1.tParametrosIMP_PERC_TRIB_DADOS_ADIC.AsString = 'S' then
        vTexto := vTexto + ' %' + FormatFloat('0.00',vPercAux);
      vTexto := vTexto + ' Total';
      vTexto := vTexto + ' Lei 12.741/12,';
      if (trim(DM1.tNotaFiscalFONTE_TRIBUTOS.AsString) = '') and (DM1.tParametrosTipo_Lei_Transp.AsString = 'I') then
        vTexto := vTexto + ' Fonte IBPT)'
      else
        vTexto := vTexto + ' Fonte ' + DM1.tNotaFiscalFonte_TRIBUTOS.AsString + ')';
    end;
    Result := vTexto;
  end;
end;

end.
