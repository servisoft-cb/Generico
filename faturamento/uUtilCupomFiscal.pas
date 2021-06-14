unit uUtilCupomFiscal;

interface

uses
  Classes, SysUtils, DB, Dialogs, Variants, Forms, ExtCtrls, ShellApi, Registry;

  //Daruma
  function prc_Iniciar_Cupom_Daruma: Integer;
  procedure prc_Imprimir_Item_Cupom_Daruma(Desconto: Boolean);
  procedure prc_Encerrar_Cupom_Daruma;
  procedure prc_Imprimir_Item_Cancelado_Daruma;
  procedure prc_Abrir_Gaveta_Daruma;
  procedure prc_LeituraX_Daruma(Tipo: Integer);
  procedure prc_ReducaoZ_Daruma;
  procedure prc_Totalizar_Cupom_Daruma;
  procedure prc_Cancelar_Cupom_Daruma;
  function fnc_Busca_Ultimo_Cupom_Daruma: Integer;
  function fnc_Imp_Ligada_Daruma: Integer;
  procedure prc_Pgto_Cupom_Daruma(Forma, Condicao: String; Valor: Currency);

  //********

  procedure prc_Inserir_Cupom_Fiscal;
  //procedure DarumaFramework_Mostrar_Retorno(iRetorno:integer);

//var

implementation

uses
  UDM1, uIntegracao, UDMCupom, uImpFiscal_Daruma, UCupomFiscal;

procedure prc_Inserir_Cupom_Fiscal;
var
  vNumAux: Integer;
begin
  vNumAux := ProximaSequencia('CUPOMFISCAL',0);

  DMCupom.cdsCupomFiscal.Insert;
  DMCupom.cdsCupomFiscalID_CUPOM.AsInteger         := vNumAux;
  DMCupom.cdsCupomFiscalDTEMISSAO.AsDateTime       := Date;
  DMCupom.cdsCupomFiscalHREMISSAO.AsDateTime       := Now;
  DMCupom.cdsCupomFiscalCANCELADO.AsString         := 'N';
  DMCupom.cdsCupomFiscalNUMMOVFINANCEIRO.AsInteger := 0;
  DMCupom.cdsCupomFiscalBASEICMS.AsFloat           := 0;
  DMCupom.cdsCupomFiscalVLRICMS.AsFloat            := 0;
  DMCupom.cdsCupomFiscalVLRPRODUTOS.AsFloat        := 0;
  DMCupom.cdsCupomFiscalVLRDESCONTO.AsFloat        := 0;
  DMCupom.cdsCupomFiscalVLRTOTAL.AsFloat           := 0;
  DMCupom.cdsCupomFiscalVLRRECEBIDO.AsFloat        := 0;
  DMCupom.cdsCupomFiscalVLRTROCO.AsFloat           := 0;
  DMCupom.cdsCupomFiscalCODCONDPGTO.AsInteger      := 0;
  DMCupom.cdsCupomFiscalCODCONTA.AsInteger         := 0;
  DMCupom.cdsCupomFiscalFILIAL.AsInteger           := DM1.tFilialCodigo.AsInteger;
  DMCupom.cdsCupomFiscalTIPOPGTO.AsString          := 'V';
  DMCupom.cdsCupomFiscalCODCLIENTE.AsInteger       := DM1.tParametrosCodClienteConsumidor.AsInteger;
  dmCupom.cdsCupomFiscalNUMCUPOM.AsInteger         := fnc_Busca_Ultimo_Cupom_Daruma;
end;

function prc_Iniciar_Cupom_Daruma: Integer;
begin
  Result := iCFAbrirPadrao_ECF_Daruma();
end;

procedure prc_Imprimir_Item_Cupom_Daruma(Desconto: Boolean);
var
  vQtdAux : Real;
begin
  if fCupomFiscal.CurrencyEdit4.AsInteger > 1 then
    vQtdAux := StrToFloat(FormatFloat('0.00',DMCupom.cdsCupomFiscalItQTD.AsFloat * fCupomFiscal.CurrencyEdit4.AsInteger))
  else
    vQtdAux := StrToFloat(FormatFloat('0.00',DMCupom.cdsCupomFiscalItQTD.AsFloat));

  if Desconto then
  //  Int_Retorno := iCFVender_ECF_Daruma(Str_Aliquota, Str_Qtde, Str_ValorUnit, Str_Tipo_Desc_Acresc, Str_Valor_Desc_Acrec,
  //                 Str_Codigo_Item, Str_UnidadeMedida, Str_Descricao)
  else
   // Int_Retorno := iCFVender_ECF_Daruma('I1'{DMCupom.cdsCupomFiscalItSITTRIB.AsString}, FormatFloat('0.00',DMCupom.cdsCupomFiscalItQTD.AsFloat),
    //Int_Retorno := iCFVender_ECF_Daruma(DMCupom.cdsCupomFiscalItSITTRIB.AsString, FormatFloat('0.00',DMCupom.cdsCupomFiscalItQTD.AsFloat),
    Int_Retorno := iCFVender_ECF_Daruma(DMCupom.cdsCupomFiscalItSITTRIB.AsString, FormatFloat('0.00',vQtdAux),
                   FormatFloat('0.00#',DMCupom.cdsCupomFiscalItVLRUNIT.AsFloat), 'D%', '0', DMCupom.cdsCupomFiscalItCODPRODUTO.AsString,
                   DMCupom.cdsCupomFiscalItUNIDADE.AsString, DMCupom.cdsCupomFiscalItNOMEPRODUTO.AsString);

  if (Int_Retorno <> 1) and (Int_Retorno <> -12) then
    DarumaFramework_Mostrar_Retorno(Int_Retorno);
end;

procedure prc_Encerrar_Cupom_Daruma;
var
  vNome, vEndereco, vCnpj: String;
begin
  Int_Retorno:= confProgramarOperador_ECF_Daruma(dm1.tUsuarioUsuario.AsString);
  if (Int_Retorno <> 1) and (Int_Retorno <> -12) then
    DarumaFramework_Mostrar_Retorno(Int_Retorno);

  if DMCupom.cdsCupomFiscalCODCLIENTE.AsInteger <> dm1.tParametrosCodClienteConsumidor.AsInteger then
  begin
    vNome     := 'CONSUMIDOR';
    vEndereco := 'ENDERECO';
    vCNPJ     := 'CNPJ';
    if (not dm1.tClienteNome.IsNull) then
      vNome := dm1.tClienteNome.AsString;
    if (not dm1.tClienteEndereco.IsNull) then
      vEndereco := dm1.tClienteEndereco.AsString + ', ' + dm1.tClienteNumEnd.AsString;
    if (not dm1.tClienteCgcCpf.IsNull) then
      vCNPJ := dm1.tClienteCgcCpf.AsString;

      Int_Retorno := iCFIdentificarConsumidor_ECF_Daruma(vNome,vEndereco,vCNPJ);
      if (Int_Retorno <> 1) and (Int_Retorno <> -12) then
        DarumaFramework_Mostrar_Retorno(Int_Retorno);
  end;

  if dm1.tParametrosMensagemRodapeCupom.IsNull then
    Int_Retorno:= iCFEncerrarPadrao_ECF_Daruma()
  else
    Int_Retorno:=  iCFEncerrarConfigMsg_ECF_Daruma(dm1.tParametrosMensagemRodapeCupom.AsString);
  if (Int_Retorno <> 1) and (Int_Retorno <> -12) then
    DarumaFramework_Mostrar_Retorno(Int_Retorno);
end;

procedure prc_Imprimir_Item_Cancelado_Daruma;
begin
  Int_Retorno:= iCFCancelarItem_ECF_Daruma(DMCupom.cdsCupomFiscalItITEM.AsString);
  if (Int_Retorno <> 1) and (Int_Retorno <> -12) then
    DarumaFramework_Mostrar_Retorno(Int_Retorno);
end;

procedure prc_Abrir_Gaveta_Daruma;
begin
  Int_Retorno := eAbrirGaveta_ECF_Daruma();
  if (Int_Retorno <> 1) and (Int_Retorno <> -12) then
    DarumaFramework_Mostrar_Retorno(Int_Retorno);
end;

procedure prc_LeituraX_Daruma(Tipo: Integer);
begin
  case Tipo of
    1: Int_Retorno := iLeituraX_ECF_Daruma();
    2: Int_Retorno := rLeituraX_ECF_Daruma();
  end;
  if Int_Retorno <> 1 then
    DarumaFramework_Mostrar_Retorno(Int_Retorno);
end;

procedure prc_ReducaoZ_Daruma;
begin
  Int_Retorno:= iReducaoZ_ECF_Daruma(' ',' ');
  if Int_Retorno <> 1 then
    DarumaFramework_Mostrar_Retorno(Int_Retorno);
end;

function fnc_Busca_Ultimo_Cupom_Daruma: Integer;
var
  vNumCupomAux: String;
begin
  vNumCupomAux := '000000';
  SetLength(vNumCupomAux,6);
  Int_Retorno  := rRetornarInformacao_ECF_Daruma('26',vNumCupomAux);
  Result       := StrToInt(vNumCupomAux);
end;

function fnc_Imp_Ligada_Daruma: Integer;
var
  Int_Retorno: Integer;
begin
  Int_Retorno := eDefinirProduto_Daruma('ECF');
  Int_Retorno := regAlterarValor_Daruma('ECF\RetornarAvisoErro','1');
//  Result := Int_Retorno;
end;

{procedure DarumaFramework_Mostrar_Retorno(iRetorno:integer);
begin
   //Variaveis devem ser inicializadas
   Int_NumErro:= 0;
	 Int_NumAviso:= 0;
   Str_Msg_NumErro:=StringOFChar(' ',300);
   Str_Msg_NumAviso:=StringOFChar(' ',300);
   Str_Msg_RetMetodo:=StringOFChar(' ',300);

// Retorna o número de erro e aviso do último comando enviado
   Int_Retorno:=rStatusUltimoCMDInt_ECF_Daruma(Int_NumErro, Int_NumAviso);
// Retorno do método
   Int_Retorno:=eInterpretarRetorno_ECF_Daruma(iRetorno, Str_Msg_RetMetodo);
// Mensagem do erro
   Int_Retorno:=eInterpretarErro_ECF_Daruma(Int_NumErro, Str_Msg_NumErro);
// Mensagem aviso
   Int_Retorno:=eInterpretarAviso_ECF_Daruma(Int_NumAviso, Str_Msg_NumAviso);

  Str_Erro:=Str_Msg_NumErro;
  Str_Aviso:=Str_Msg_NumAviso;
  Str_Msg_Retorno_Metodo:=Str_Msg_RetMetodo;

   Application.MessageBox( Pchar('Retorno do Método = ' + pchar(Str_Msg_Retorno_Metodo) + #13 +
                                 'Número Erro = ' + pchar(Str_Erro) +  #13 +
                                 'Número Aviso = ' + pchar(Str_Aviso)), 'DarumaFramework Retorno do Método', mb_ok);
end;}

procedure prc_Totalizar_Cupom_Daruma;
begin
  Int_Retorno:= iCFTotalizarCupomPadrao_ECF_Daruma();
  if (Int_Retorno <> 1) and (Int_Retorno <> -12) then
    DarumaFramework_Mostrar_Retorno(Int_Retorno);
end;

procedure prc_Cancelar_Cupom_Daruma;
begin
  Int_Retorno:= iCFCancelar_ECF_Daruma();
  if (Int_Retorno <> 1) then
    DarumaFramework_Mostrar_Retorno(Int_Retorno);
end;

procedure prc_Pgto_Cupom_Daruma(Forma, Condicao: String; Valor: Currency);
var
  vForma, vCondicao, vValor: String;
begin
  vForma    := Forma;
  vCondicao := Condicao;
  vValor    := FormatFloat('0.00',Valor);


  if Forma = '' then
    Int_Retorno := iCFEfetuarPagamentoPadrao_ECF_Daruma()
  else
  if Condicao = '' then
    Int_Retorno := iCFEfetuarPagamentoFormatado_ECF_Daruma(vForma,vValor)
  else
    Int_Retorno := iCFEfetuarPagamento_ECF_Daruma(vForma,vValor,vCondicao);

  if (Int_Retorno <> 1) and (Int_Retorno <> -12) then
    DarumaFramework_Mostrar_Retorno(Int_Retorno);
end;

end.
