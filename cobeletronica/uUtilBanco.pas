unit uUtilBanco;

interface

uses
  Classes, SysUtils, DB, Dialogs, Variants, Forms;

  var vMensagem: array[1..6] of String;

  function Posiciona_Titulo(CodCliente, NumNota, Parcela, NumCReceber: Integer ; Serie: String): Boolean;
  function Monta_NomeArq(Caminho,Banco: String): String;

  function MontaBoletoItau(tipo, nDoc, Carteira, DigNossoNum: string; data: TDateTime; valor: Currency): string;

  procedure prc_Enviar_RLBoleto;

  procedure Grava_Historico(Tipo: string); //G= Gera��o   N= Nosso N�mero

  procedure Montar_Mensagens;

  //Banco do Brasil CNAB 400
  procedure prc_Header_Brasil;
  procedure prc_Detalhe_Brasil;
  procedure prc_DetalheEmail_Brasil;
  procedure prc_Trailler_Brasil;
  procedure Grava_HistoricoBBrasil;

  //Caixa Federal CNAB 400
  procedure prc_Header_Caixa;
  procedure prc_Detalhe_Caixa;
  procedure prc_Mensagem_Caixa;
  procedure prc_Trailler_Caixa;
  procedure Grava_HistoricoBCaixa;

  //Banco It�u CNAB 400
  procedure prc_Header_Itau400;
  procedure prc_Detalhe_Itau400;
  procedure prc_Reg_Avalista_Itau400;
  procedure prc_Trailler_Itau400;
  procedure prc_Calcula_NossoNumeroItau;

  function fnc_Calcula_NossoNumeroItau(NumCarteira: String): String;
  function fnc_Calcula_NossoNumeroBrasil(NumCarteira: String): String;
  function fnc_Calcula_NossoNumeroCaixa(NumCarteira: String): String;

  function fnc_ContasParametros(Ano, Item: Integer): Integer;

  //RLBoleto novo componente
  //procedure prc_RLBoleto;
  //procedure Gravar_RLBoleto;

  procedure Grava_HistoricoItau;

  procedure Posiciona_Cidade(Codigo: Integer);

var
  vNomeArqRemessa: String;
  FR: TextFile;
  vContadorReg: Integer;
  vContadorTit: Integer;
  vVlrTotalTit: Real;
  vGeradoNossoNum: Boolean;

implementation

uses
  StrUtils, UDM1, uIntegracao, UDMCobEletronica, UEnviarBanco, UDMBanco, uUtilPadrao, UDMBanco_CNAB;

{****************************************************************************}
{*** Fun��o para montar o c�digo de barras e a linha digit�vel do boleto ITA�}
{****************************************************************************}
function MontaBoletoItau(tipo, nDoc, Carteira, DigNossoNum: string; data: TDateTime; valor: Currency): string;
var
  fatVcto, vlr, vCodBarra, vLinha, dv: string;
  i: Byte;
  vAux, vAux2, vSoma: Integer;
  vCampo1, vCampo2, vCampo3, vCampo4, vCampo5: string;
//Fun��o para calcular o digito verificador no m�dulo 11
  function CalculaDigMod11(Campo: string): string;
  var
    i: Byte;
  begin
    vSoma := 0;
    vAux := 1;
    for i := length(campo) downto 1 do
    begin
      inc(vAux);
      if vAux > 9 then
        vAux := 2;
      vSoma := vSoma + (StrToInt(Copy(vCodBarra, i, 1)) * vAux);
    end;
    vAux := vSoma div 11;
    vAux2 := vAux * 11;
    vAux := vSoma - vAux2;
    vAux := 11 - vAux;
    CalculaDigMod11 := IntToStr(vAux);
  end;
//Fun��o para calcular o digito verificador no m�dulo 10
function CalculaDigMod10(Campo: string): string;
  var
    i: Byte;
    v: string;
  begin
    v := '2';
    vSoma := 0;
    for i := length(campo) downto 1 do
    begin
      dv := IntToStr(StrToInt(Copy(campo, i, 1)) * StrToInt(v));
      if StrToInt(dv) >= 10 then
        dv := IntToStr(StrToInt(copy(dv, 1, 1)) + StrToInt(copy(dv, 2, 1)));
      vSoma := vSoma + StrToInt(dv);
      if v = '2' then
        v := '1'
      else
        v := '2';
    end;
  //dv := IntToStr(vSoma + 9);
  //dv := IntToStr(StrToInt(dv) div 10);
    dv := IntToStr(vSoma div 10);
    dv := IntToStr(StrToInt(dv) * 10);
    vSoma := vSoma - StrToInt(dv);
    if vSoma = 10 then
      vSoma := 0
    else
      vSoma := 10 - vSoma;
    CalculaDigMod10 := IntToStr(vSoma);
  end;

begin
  fatVcto := FormatFloat('0', data - StrToDate('07/10/1997'));
  vlr := FormatFloat('0', valor * 100);
  for i := 1 to 10 - Length(vlr) do
    vlr := '0' + vlr;

  //vCalc := '7489' + ;

  vCodBarra := '341'; //01 a 03 Identifica��o do banco
  vCodBarra := vCodBarra + '9'; //04 a 04 C�digo da moeda
  vCodBarra := vCodBarra + fatVcto; //06 a 09
  vCodBarra := vCodBarra + vlr; //10 a 19
  vCodBarra := vCodBarra + carteira; //20 a 22 Tipo de carteira
  vCodBarra := vCodBarra + nDoc; //23 a 30 Nosso n�mero
  vCodBarra := vCodBarra + DigNossoNum; //31 a 31 DAC [Ag�ncia /Conta/Carteira/Nosso N�mero
  vCodBarra := vCodBarra + Copy(DM1.tContasAgencia.AsString, 1, 4); //32 a 35 Ag�ncia
  vCodBarra := vCodBarra + Copy(DM1.tContasNumConta.AsString, 1, 5); //36 a 40 N�mero da conta
  vCodBarra := vCodBarra + DM1.tContasDigConta.AsString; //41 a 41 Digito da conta
  vCodBarra := vCodBarra + '000'; //42 a 44 Zero

  {//C�lcula o digito verificar do campo livre calculado (posi��o 44 do c�digo de barras)
  //Calculo este digito verificar pegando as 42 posi��es do c�digo de barras at� o momento
  vAux := StrToInt(CalculaDigMod11(vCodBarra));
  if (vAux > 9) or (vAux = 1) then
    vAux := 0;
  vCodBarra := vCodBarra + IntToStr(vAux); //44 a 44 DV do campo livre calculado por m�dulo 11}

  //C�lcula o digito verificador geral (posi��o 5 do c�digo de barras)
  vAux := StrToInt(CalculaDigMod11(vCodBarra));
  if (vAux > 9) or (vAux = 0) then
    vAux := 1;
  vCodBarra := copy(vCodBarra, 1, 4) + IntToStr(vAux) + copy(vCodBarra, 5, 39);

  //C�digo de barras
  if tipo = 'B' then //B = c�digo Barra
    result := vCodBarra
  else
  //Linha digit�vel
    if tipo = 'L' then //L = Linha digit�vel
    begin
      vCampo1 := '3419' + carteira + copy(nDoc, 1, 2);
      vCampo1 := vCampo1 + CalculaDigMod10(vCampo1);

      vCampo2 := copy(nDoc, 3, 6) + DigNossoNum + copy(DM1.tContasAgencia.AsString, 1, 3);
      vCampo2 := vCampo2 + CalculaDigMod10(vCampo2);

      vCampo3 := copy(DM1.tContasAgencia.AsString, 4, 1) + Copy(DM1.tContasNumConta.AsString, 1, 5) + DM1.tContasDigConta.AsString + '000';
      vCampo3 := vCampo3 + CalculaDigMod10(vCampo3);

      vCampo4 := copy(vCodBarra, 5, 1);

      vCampo5 := FormatFloat('0000', StrToFloat(fatVcto)) + vlr;

      vLinha := copy(vCampo1, 1, 5) + '.' + copy(vCampo1, 6, 5) + ' ';
      vLinha := vLinha + copy(vCampo2, 1, 5) + '.' + copy(vCampo2, 6, 6) + ' ';
      vLinha := vLinha + copy(vCampo3, 1, 5) + '.' + copy(vCampo3, 6, 6) + ' ' + vCampo4 + ' ' + vCampo5;

      result := vLinha;
    end;
end;

function Posiciona_Titulo(CodCliente, NumNota, Parcela, NumCReceber: Integer ; Serie: String): Boolean;
begin
  Result := False;
  DM1.tCliente.IndexFieldNames := 'Codigo';

  if not DM1.tCliente.FindKey([CodCliente]) then
    exit;

  if Trim(Serie) <> '' then
  begin
    if not DM1.tCReceber.Locate('Filial;NumNota;NumCReceber;Serie',
           VarArrayOf([DM1.tFilialCodigo.AsInteger,NumNota,NumCReceber,Serie]),[locaseinsensitive]) then
      exit;
  end
  else
  if not DM1.tCReceber.Locate('Filial;NumCReceber',VarArrayOf([DM1.tFilialCodigo.AsInteger,NumCReceber]),[locaseinsensitive]) then
    exit;

  if not DM1.tCReceberParc.Locate('ParcCReceber',Parcela,[loCaseInsensitive]) then
    exit;

  Result := True;
end;

function Monta_NomeArq(Caminho,Banco: String): String;
var
  Texto1, texto2: String;
  vAux: Integer;
  Flag: Boolean;
  ano, mes, dia: Word;
begin
  DecodeDate(Date,ano,mes,dia);
  //texto2 := Banco + FormatFloat('00',DM1.tFilialCodigo.AsFloat) + '_';
  texto2 := FormatFloat('00',DM1.tFilialCodigo.AsFloat);
  Texto1 := '';
  vAux := 0;
  flag := True;
  while Flag do
    begin
      inc(vAux);
      if copy(Caminho,Length(Caminho),1) = '\' then
        Texto1 := Caminho + 'REMESSA\' + texto2 + FormatFloat('00',Mes) + FormatFloat('00',Dia) + IntToStr(vAux) + '.REM'
      else
        Texto1 := Caminho + '\REMESSA\' + texto2 + FormatFloat('00',Mes) + FormatFloat('00',Dia) + IntToStr(vAux) + '.REM';
      if not(FileExists(texto1)) then
        flag := False;
    end;
  Result := Texto1;
end;

procedure prc_Enviar_RLBoleto;
var
  vCodTipoCobranca: Integer;
  vNossoNumeroAux: String; 
begin
  DM1.tCliente.IndexFieldNames := 'Codigo';
  vNomeArqRemessa := '';

  if DM1.tContasCNAB.AsString = 'ITAU400' then
    vNomeArqRemessa := Monta_NomeArq(DMBanco.tBcoItauCaminho.AsString,'IT')
  else
  if copy(DM1.tContasCNAB.AsString,1,9) = 'BRASIL400'  then
    vNomeArqRemessa := Monta_NomeArq(DMBanco.tBcoBrasilCaminho.AsString, 'BB')
  else
  //08/02/13  Feito para a Sissano
  if DM1.tContasCNAB.AsString = 'CAIXA400'  then
    vNomeArqRemessa := Monta_NomeArq(DMBanco.tBcoCaixaCaminho.AsString, 'CX');

  if vNomeArqRemessa <> '' then
  begin
    AssignFile(FR, vNomeArqRemessa);
    Rewrite(FR);
  end;

  vContadorReg := 0;
  vVlrTotalTit := 0;
  vContadorTit := 0;

  if DM1.tContasCNAB.AsString = 'ITAU400' then
    prc_Header_Itau400
  else
  if copy(DM1.tContasCNAB.AsString,1,9) = 'BRASIL400'  then
    prc_Header_Brasil
  else
  if DM1.tContasCNAB.AsString = 'CAIXA400'  then
    prc_Header_Caixa;

  fEnviarBanco.mBoletos.First;
  while not fEnviarBanco.mBoletos.Eof do
  begin
    vGeradoNossoNum := False;
    vCodTipoCobranca := 0;
    if Posiciona_Titulo(fEnviarBanco.mBoletosCodCliente.AsInteger,fEnviarBanco.mBoletosNumNota.AsInteger,fEnviarBanco.mBoletosParcela.AsInteger,
       fEnviarBanco.mBoletosNumCReceber.AsInteger,fEnviarBanco.mBoletosSerie.AsString) then
    begin
      if Trim(fEnviarBanco.mBoletosGerarRemessa.AsString) = 'S' then
      begin
        if fEnviarBanco.mBoletosGeraNossoNumero.AsString = 'S' then
        begin
          vNossoNumeroAux := '';
          if Trim(fEnviarBanco.mBoletosNossoNumero.AsString) = '' then
          begin
            if DM1.tContasCNAB.AsString = 'ITAU400' then
              vNossoNumeroAux := fnc_Calcula_NossoNumeroItau(fEnviarBanco.mBoletosNumCarteira.AsString)
            else
            if Copy(DM1.tContasCNAB.AsString,1,6) = 'BRASIL' then
              vNossoNumeroAux := fnc_Calcula_NossoNumeroBrasil(fEnviarBanco.mBoletosNumCarteira.AsString)
            else
            if DM1.tContasCNAB.AsString = 'CAIXA400' then
              vNossoNumeroAux := fnc_Calcula_NossoNumeroCaixa(fEnviarBanco.mBoletosNumCarteira.AsString);
          end;
          if Trim(vNossoNumeroAux) <> '' then
          begin
            fEnviarBanco.mBoletos.Edit;
            fEnviarBanco.mBoletosNossoNumero.AsString := vNossoNumeroAux;
            fEnviarBanco.mBoletos.Post;
            vGeradoNossoNum := True;
          end;
        end;

        if DM1.tContasCNAB.AsString = 'ITAU400' then
        begin
          prc_Detalhe_Itau400;
          if (fEnviarBanco.mBoletosNomeAvalista.AsString <> '') or (fEnviarBanco.mBoletosBoletoPorEmail.AsBoolean) then
            prc_Reg_Avalista_Itau400;
        end
        else
        if copy(DM1.tContasCNAB.AsString,1,9) = 'BRASIL400'  then
        begin
          prc_Detalhe_Brasil;
          if Trim(DM1.tClienteEmailCobranca.AsString) <> '' then
            prc_DetalheEmail_Brasil;
          if DMBanco.tBcoBrasilCodTipoCobranca.AsInteger > 0 then
            vCodTipoCobranca := DMBanco.tBcoBrasilCodTipoCobranca.AsInteger;
        end
        else
        if DM1.tContasCNAB.AsString = 'CAIXA400'  then
        begin
          prc_Detalhe_Caixa;
          prc_Mensagem_Caixa;
        end;
      end;

      if DMCobEletronica.cdsCobEletronica_Nota.Locate('Filial;NumCReceber;Parcela',VarArrayOf([fEnviarBanco.mBoletosFilial.AsInteger,fEnviarBanco.mBoletosNumCReceber.AsInteger,fEnviarBanco.mBoletosParcela.AsInteger]),[locaseinsensitive]) then
      begin
        DMCobEletronica.cdsCobEletronica_Nota.Edit;
        DMCobEletronica.cdsCobEletronica_NotaNUMCARTEIRA.AsString := fEnviarBanco.mBoletosNumCarteira.AsString;
        DMCobEletronica.cdsCobEletronica_NotaNOSSONUMERO.AsString := fEnviarBanco.mBoletosNossoNumero.AsString;
        DMCobEletronica.cdsCobEletronica_NotaESPECIEDOC.AsString  := fEnviarBanco.mBoletosEspecieDoc.AsString;
        DMCobEletronica.cdsCobEletronica_NotaACEITE.AsString      := fEnviarBanco.mBoletosAceite.AsString;
        DMCobEletronica.cdsCobEletronica_Nota.Post;
      end;

      DM1.tCReceberParc.Edit;
      DM1.tCReceberParcArqGerado.AsBoolean       := True;
      DM1.tCReceberParcNumTitBanco.AsString      := fEnviarBanco.mBoletosNossoNumero.AsString;
      DM1.tCReceberParcNumCarteira.AsString      := fEnviarBanco.mBoletosNumCarteira.AsString;
      DM1.tCReceberParcCodTipoCobranca.AsInteger := vCodTipoCobranca;
      DM1.tCReceberParcAceite.AsString           := fEnviarBanco.mBoletosAceite.AsString;
      DM1.tCReceberParcEspecieDoc.AsString       := fEnviarBanco.mBoletosEspecieDoc.AsString;
      DM1.tCReceberParc.Post;

      Grava_Historico('G');
    end;

    fEnviarBanco.mBoletos.Next;
  end;

  //if copy(DM1.tContasCNAB.AsString,1,9) = 'BRASIL240'  then
  //  Gravar_RLBoleto;

  DMCobEletronica.cdsCobEletronica.Post;
  DMCobEletronica.cdsCobEletronica.ApplyUpdates(0);
  DMCobEletronica.cdsCobEletronica.Edit;

  if DM1.tContasCNAB.AsString = 'ITAU400' then
    prc_Trailler_Itau400
  else
  if copy(DM1.tContasCNAB.AsString,1,9) = 'BRASIL400' then
    prc_Trailler_Brasil
  else
  if DM1.tContasCNAB.AsString = 'CAIXA400' then
    prc_Trailler_Brasil;

  if vNomeArqRemessa <> '' then
    CloseFile(FR);
end;

procedure prc_Header_Brasil;
var
  vAux: string;
  texto1, texto2: string;
  i: Integer;
  vBrancos: Integer;
begin
  //C�digo do regisrto tamanho 1 - posicao 1 ao 1
  texto1 := '0';

  //tamanho 1 - posicao 2 ao 2
  texto1 := texto1 + '1';

  //tamanho 7 - posicao 3 ao 9
  if fEnviarBanco.CheckBox1.Checked then
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

  //Ag�ncia Cedente   tamanho 4 - posicao 27 ao 30
  texto2 := copy(DM1.tContasAgencia.AsString, 1, 4);
  for i := 1 to 4 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Digito da ag�ncia  tamanho 1 - posicao 31 ao 31
  texto2 := copy(DM1.tContasAgencia.AsString, 5, 1);
  for i := 1 to 1 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;

  //Conta do cedente, n�mro da conta  tamanho 8 - posicao 32 ao 39
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

  //Data de gera��o do arquivo tamanho 6 - posicao 95 ao 100
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

    //N�mero do conv�nio   tamanho 7 - posicao 130 ao 136
    texto2 := copy(fEnviarBanco.mBoletosCodTransmissao.AsString, 1, 7);
    for i := 1 to 7 - Length(texto2) do
      texto2 := '0' + texto2;
    texto1 := texto1 + texto2;

    //Brancos  tamanho 258 - posicao 137 ao 394
    for i := 1 to 258 do
      texto1 := texto1 + ' ';

  end;

  //N�mero de sequ�ncia  tamanho 6 - posicao 395 ao 400
  inc(vContadorReg);
  texto2 := IntToStr(vContadorReg);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  Writeln(FR, texto1);
end;


procedure prc_Detalhe_Brasil;
var
  vAux, texto1, texto2: string;
  i: Integer;
  vValor: Real;
  vContAux: Integer;
begin
  //C�digo do registro  tamanho 1 - posicao 1 ao 1
  if DM1.tContasCNAB.AsString = 'BRASIL400' then
    texto1 := '7'
  else
    texto1 := '1';

  //C�digo de Inscri��o  tamanho 2 - posicao 2 ao 3
  texto1 := texto1 + '02';

  //N�mero de inscri��o da empresa  tamanho 14 - posicao 4 ao 17
  vAux := Dm1.tFilialCNPJ.AsString;
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux, i, 1) <> '.') and (Copy(vAux, i, 1) <> '-') and (Copy(vAux, i, 1) <> '/') then
      Texto2 := Texto2 + Copy(vAux, i, 1);
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Ag�ncia do cedente  tamanho 4 - posicao 18 ao 21
  texto2 := copy(DM1.tContasAgencia.AsString, 1, 4);
  for i := 1 to 4 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Digito da ag�ncia  tamanho 1 - posicao 22 ao 22
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

  //N�mero do conv�nio  tamanho 7 - posicao 32 ao 38
  if DM1.tContasCNAB.AsString = 'BRASIL400' then
    vContAux := 7
  else
    vContAux := 6;
  texto2 := copy(fEnviarBanco.mBoletosCodTransmissao.AsString, 1, vContAux);
  for i := 1 to vContAux - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //N� Controle do participante  tamanho 25 - posicao 39 ao 63
  texto2 := FormatFloat('00', fEnviarBanco.mBoletosFilial.AsInteger) + '.' + fEnviarBanco.mBoletosNumCReceber.AsString;
  for i := 1 to 25 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //N�mero do titulo no banco  tamanho 7 - posicao 64 ao 80
  if DM1.tContasCNAB.AsString = 'BRASIL400' then
    vContAux := 17
  else
    vContAux := 11;
  texto2 := Copy(fEnviarBanco.mBoletosNossoNumero.AsString, 1, vContAux);
  for i := 1 to vContAux - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Digito Verificador
  if DM1.tContasCNAB.AsString = 'BRASIL400-6' then
    texto1 := texto1 + ' ';

  //N� da presta��o   tamanho 2 - posicao 81 ao 82
  texto1 := texto1 + '00';

  //Indicativo de grupo de valor    tamanho 2 - posicao 83 ao 84
  texto1 := texto1 + '00';

  //Brancos    tamanho 3 - posicao 85 ao 87
  texto1 := texto1 + '   ';

  //Indicativo do sacador (se tem avalista)  tamanho 1 - posicao 88 ao 88
  if fEnviarBanco.mBoletosNomeAvalista.AsString <> '' then
    texto1 := texto1 + 'A'
  else
    texto1 := texto1 + ' ';

  //Prefixo do t�tulo   tamanho 3 - posicao 89 ao 91
  if DM1.tContasCNAB.AsString = 'BRASIL400-6' then
    texto1 := texto1 + '   '
  else
  if (fEnviarBanco.mBoletosNumCarteira.AsString = '31') or (fEnviarBanco.mBoletosNumCarteira.AsString = '51') then
    texto1 := texto1 + 'SD '
  else
  if fEnviarBanco.mBoletosNumCarteira.AsString = '12' then
    texto1 := texto1 + 'AIU'
  else
    texto1 := texto1 + '   ';

  //Varia��o da carteira   tamanho 3 - posicao 92 ao 94
  //texto1 := texto1 + '019';
  texto2 := DMBanco.tBcoBrasilVariacaoCarteira.AsString;
  for i := 1 to 3 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Conta cau��o  tamanho 1 - posicao 95 ao 95
  texto1 := texto1 + '0';

  //C�digo de responsabilidade
  if DM1.tContasCNAB.AsString = 'BRASIL400-6' then
    texto1 := texto1 + '000000';

  //N�mero do bordero  tamanho 6 - posicao 96 ao 101
  texto1 := texto1 + '000000';

  //Tipo de cobran�a  tamanho 5 - posicao 102 ao 106
  texto2 := fEnviarBanco.mBoletosTipoDocumento.AsString;
  for i := 1 to 5 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Carteira  tamanho 2 - posicao 107 ao 108
  texto2 := fEnviarBanco.mBoletosNumCarteira.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Comando  tamanho 2 - posicao 109 ao 110
  texto2 := fEnviarBanco.mBoletosCodComando.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //N� do t�tulo  tamanho 10 - posicao 111 ao 120
  texto2 := FormatFloat('000000', fEnviarBanco.mBoletosNumNota.AsFloat) + '/' + fEnviarBanco.mBoletosParcela.AsString;
  for i := 1 to 10 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Data de vencimento do titulo   tamanho 6 - posicao 121 ao 126
  vAux := FormatDateTime('DD/MM/YY', fEnviarBanco.mBoletosDtVencto.AsDateTime);
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux, i, 1) <> '.') and (Copy(vAux, i, 1) <> '-') and (Copy(vAux, i, 1) <> '/') then
      Texto2 := Texto2 + Copy(vAux, i, 1);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Valor do titulo tamanho 13 - posicao 127 ao 139
  texto2 := FormatFloat('00000000000.00', fEnviarBanco.mBoletosVlrParcela.AsFloat);
  Delete(texto2, 12, 1);
  texto1 := texto1 + texto2;

  vVlrTotalTit := vVlrTotalTit + fEnviarBanco.mBoletosVlrParcela.AsFloat;

  //Identifica��o do banco  tamanho 3 - posicao 140 ao 142
  texto1 := texto1 + '001';

  //Ag�ncia cobradora  tamanho 4 - posicao 143 ao 146
  texto1 := texto1 + '0000';

  //Digito verificador da ag�ncia cobradora  tamanho 1 - posicao 147 ao 147
  if DM1.tContasCNAB.AsString = 'BRASIL400' then
    texto1 := texto1 + '0'
  else
    texto1 := texto1 + ' ';

  //Esp�cie do t�tulo  tamanho 2 - posicao 148 ao 149
  texto2 := fEnviarBanco.mBoletosEspecieDoc.AsString;
  for i := 1 to 2 - length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Identif. de t�tulo Aceito/N�o Aceito  tamanho 1 - posicao 150 ao 150
  texto1 := texto1 + fEnviarBanco.mBoletosAceite.AsString;

  //Data de emiss�o do t�tulo  tamanho 6 - posicao 151 ao 156
  vAux := FormatDateTime('DD/MM/YY', fEnviarBanco.mBoletosDtGerado.AsDateTime);
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux, i, 1) <> '.') and (Copy(vAux, i, 1) <> '-') and (Copy(vAux, i, 1) <> '/') then
      Texto2 := Texto2 + Copy(vAux, i, 1);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //C�digo da 1� instru��o  tamanho 2 - posicao 157 ao 158
  texto2 := fEnviarBanco.mBoletosInstrucao.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //C�digo da 2� instru��o  tamanho 2 - posicao 159 ao 160
  texto2 := fEnviarBanco.mBoletosInstrucao2.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Juros de mora  tamanho 13 - posicao 161 ao 173
  if fEnviarBanco.mBoletosVlrJurosPorDia.AsFloat > 0 then
    vValor := fEnviarBanco.mBoletosVlrJurosPorDia.AsFloat
  else
  if DM1.tParametrosPercJuros.AsFloat > 0 then
    vValor := DM1.tParametrosPercJuros.AsFloat
  else
    vValor := 3;
  vValor := StrToFloat(FormatFloat('0.00', ((fEnviarBanco.mBoletosVlrParcela.AsFloat * vValor) / 100) / 30));

  texto2 := FormatFloat('00000000000.00', vValor);
  //texto2 := FormatFloat('00000000000.00',fEnviarBanco.mBoletosVlrJurosPorDia.AsFloat);
  Delete(texto2, 12, 1);
  texto1 := texto1 + texto2;

  //Data limite para desconto   tamanho 6 - posicao 174 ao 179
  texto2 := fEnviarBanco.mBoletosDtLimiteDesc.AsString;
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Valor desconto  tamanho 13 - posicao 180 ao 192
  texto2 := FormatFloat('00000000000.00', fEnviarBanco.mBoletosVlrDesconto.AsFloat);
  Delete(texto2, 12, 1);
  texto1 := texto1 + texto2;

  //Valor da IOF   tamanho 13 - posicao 193 ao 205
  if fEnviarBanco.mBoletosNumCarteira.AsString = '15' then
    texto2 := FormatFloat('00000000000.00', fEnviarBanco.mBoletosVlrIOF.AsFloat)
  else
    texto2 := '00000000000.00';
  Delete(texto2, 12, 1);
  texto1 := texto1 + texto2;

  //Valor abatimento  tamanho 13 - posicao 206 ao 218
  if (fEnviarBanco.mBoletosNumCarteira.AsString = '11') or (fEnviarBanco.mBoletosNumCarteira.AsString = '17') or
    (fEnviarBanco.mBoletosNumCarteira.AsString = '31') then
    texto2 := FormatFloat('00000000000.00', fEnviarBanco.mBoletosVlrAbatimento.AsFloat)
  else
    texto2 := '00000000000.00';
  Delete(texto2, 12, 1);
  texto1 := texto1 + texto2;

  //Tipo inscr. sacado   tamanho 2 - posicao 219 ao 220
  if fEnviarBanco.mBoletosPessoa.AsString = 'F' then
    texto1 := texto1 + '01'
  else
    texto1 := texto1 + '02';

  //N�mero de inscri��o do sacado  tamanho 14 - posicao 221 ao 234
  vAux := fEnviarBanco.mBoletosCNPJCPF.AsString;
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux, i, 1) <> '.') and (Copy(vAux, i, 1) <> '-') and (Copy(vAux, i, 1) <> '/') then
      Texto2 := Texto2 + Copy(vAux, i, 1);
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  if texto2 = '00000000000000' then
    ShowMessage('Cliente  ' + fEnviarBanco.mBoletosCliente.AsString + ' n�o possui CNPJ/CPF');
  if fEnviarBanco.mBoletosPessoa.AsString = 'F' then
    texto1 := texto1 + copy(texto2, 1, 9) + '000' + copy(texto2, 10, 2)
  else
    texto1 := texto1 + texto2;

  //Nome do sacado tamanho 37 - posicao 235 ao 271
  texto2 := TirarAcento(copy(fEnviarBanco.mBoletosCliente.AsString, 1, 37));
  for i := 1 to 37 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Branco tamanho 3 - posicao 272 ao 274
  texto1 := texto1 + '   ';

  //Endere�o do sacado tamanho 40 - posicao 275 ao 311
  if DM1.tContasCNAB.AsString = 'BRASIL400' then
    vContAux := 37
  else
    vContAux := 52;
  texto2 := TirarAcento(copy(fEnviarBanco.mBoletosEndereco.AsString, 1, vContAux));

  for i := 1 to vContAux - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Branco   tamanho 15 - posicao 312 ao 326
  if DM1.tContasCNAB.AsString = 'BRASIL400' then
    for i := 1 to 15 do
      texto1 := texto1 + ' ';

  //Cep do sacado  tamanho 8 - posicao 327 ao 334
  texto2 := fEnviarBanco.mBoletosCep.AsString;
  vAux := texto2;
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux, i, 1) <> '.') and (Copy(vAux, i, 1) <> '-') and (Copy(vAux, i, 1) <> '/') then
      Texto2 := Texto2 + Copy(vAux, i, 1);
  for i := 1 to 8 - Length(texto2) do
    texto2 := texto2 + '0';
  texto1 := texto1 + copy(texto2, 1, 8);

  //Cidade tamanho 15 - posicao 335 ao 349
  texto2 := TirarAcento(copy(fEnviarBanco.mBoletosCidade.AsString, 1, 15));
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Unidade da federa��o  tamanho 2 - posicao 350 ao 351
  texto2 := fEnviarBanco.mBoletosUf.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Nome do sacador tamanho 40 - posicao 352 ao 391
  texto2 := '';
  if fEnviarBanco.mBoletosNomeAvalista.AsString <> '' then
  begin
    if Length(fEnviarBanco.mBoletosCpfCnpjAvalista.AsString) > 11 then
      texto2 := ' CNPJ' + fEnviarBanco.mBoletosCpfCnpjAvalista.AsString
    else
      texto2 := ' CPF' + fEnviarBanco.mBoletosCpfCnpjAvalista.AsString;
  end;
  texto2 := TirarAcento(copy(fEnviarBanco.mBoletosNomeAvalista.AsString, 1, 40 - Length(texto2))) + texto2;
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //N� de dias para protesto   tamanho 2 - posicao 392 ao 393
  texto2 := '';
  if (fEnviarBanco.mBoletosInstrucao.AsString = '06') or (fEnviarBanco.mBoletosInstrucao2.AsString = '06') then
    texto2 := fEnviarBanco.mBoletosDiasProtesto.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;

  //Branco   tamanho 1 - posicao 394 ao 394
  texto1 := texto1 + ' ';

  inc(vContadorReg);
  inc(vContadorTit);
  //Reservado   tamanho 6 - posicao 395 ao 400
  texto2 := IntToStr(vContadorReg);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  Writeln(FR, texto1);
end;

procedure prc_DetalheEmail_Brasil;
var
  texto1, texto2: string;
  i: Integer;
begin
  //C�digo do registro  tamanho 1 - posicao 1 ao 1
  texto1 := '5';

  //Bloqueto por email  tamanho 2 - posicao 2 ao 3
  texto1 := texto1 + '01';

  //Email   tamanho 136 - posicao 4 ao 139
  texto2 := fEnviarBanco.mBoletosEmail.AsString;
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

  Writeln(FR, texto1);
end;

procedure prc_Trailler_Brasil;
var
  texto1, texto2: string;
  i: Integer;
begin
  //C�digo do registro  tamanho 1 - posicao 1 ao 1
  texto1 := '9';

  //Brancos   tamanho 393 - posicao 2 ao 394
  for i := 1 to 393 do
    texto1 := texto1 + ' ';

  //N�mero de sequ�ncia  tamanho 6 - posicao 395 ao 400
  inc(vContadorReg);
  texto2 := IntToStr(vContadorReg);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  Writeln(FR, texto1);
end;


/////////////////////////////////////
///////// CAIXA FEDERAL /////////////
/////////////////////////////////////

procedure prc_Header_Caixa;
var
  vAux: string;
  texto1, texto2: string;
  i: Integer;
begin
  //C�digo do regisrto tamanho 1 - posicao 1 ao 1
  texto1 := '0';

  //tamanho 1 - posicao 2 ao 2
  texto1 := texto1 + '1';

  //tamanho 7 - posicao 3 ao 9
  if fEnviarBanco.CheckBox1.Checked then
    texto2 := 'REM.TST'
  else
    texto2 := 'REMESSA';
  for i := 1 to 7 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //tamanho 2 - posicao 10 ao 11
  texto1 := texto1 + '01';

  //tamanho 15- posicao 12 ao 26
  texto2 := 'COBRANCA';
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //N�mero Cedente tamanho 16 - posicao 27 ao 42
  texto2 := copy(DM1.tContasAgencia.AsString + DM1.tContasCodCedente.AsString,1,16);
  for i := 1 to 16 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Brancos   tamanho 4 - posicao 43 ao 46
  for i := 1 to 4 do
    texto1 := texto1 + ' ';

  //Nome da empresa tamanho 30 - posicao 47 ao 76
  texto2 := TirarAcento(copy(DM1.tFilialEmpresa.AsString, 1, 30));
  for i := 1 to 30 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //C�digo de compensa��o da caixa  tamanho 3 - posicao 77 ao 79
  texto1 := texto1 + '104';

  //Nome do banco  tamanho 15 - posicao 80 ao 94
  texto2 := 'C ECON FEDERAL';
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Data de gera��o do arquivo tamanho 6 - posicao 95 ao 100
  vAux := FormatDateTime('DD/MM/YY', Date);
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux, i, 1) <> '.') and (Copy(vAux, i, 1) <> '-') and (Copy(vAux, i, 1) <> '/') then
      Texto2 := Texto2 + Copy(vAux, i, 1);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Brancos  tamanho 289 - posicao 101 ao 389
  for i := 1 to 289 do
    texto1 := texto1 + ' ';

  //Sequencial da remessa  tamanho 5 - posicao 390 ao 394
  i := DMBanco.tBcoCaixaNumRemessa.AsInteger + 1;
  DMBanco.tBcoCaixa.Edit;
  DMBanco.tBcoCaixaNumRemessa.AsInteger := i;
  DMBanco.tBcoCaixa.Post;
  texto1 := texto1 + FormatFloat('00000', i);

  //N�mero de sequ�ncia  tamanho 6 - posicao 395 ao 400
  inc(vContadorReg);
  texto2 := IntToStr(vContadorReg);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  Writeln(FR, texto1);
end;

procedure prc_Detalhe_Caixa;
var
  vAux, texto1, texto2: string;
begin
  //C�digo do registro  tamanho 1 - posicao 1 ao 1
  texto1 := '1';
  //C�digo de Inscri��o  tamanho 2 - posicao 2 ao 3
  texto1 := texto1 + '02';
  //N�mero de inscri��o da empresa  tamanho 14 - posicao 4 ao 17
  texto1 := texto1 + Monta_Numero(Dm1.tFilialCNPJ.AsString,14);
  //Ag�ncia do cedente  tamanho 16 - posicao 18 ao 33
  texto1 := texto1 + Formatar_Campo(DM1.tContasAgencia.AsString +  DM1.tContasCodCedente.AsString,16);
  //Campo em branco   tamanho 2 - posicao 34 ao 35
  texto1 := texto1 + Formatar_Campo('',2);
  //Comiss�o de perman�ncia  tamanho 2 - posicao 36 ao 37
  texto1 := texto1 + Formatar_Campo(DMBanco.tBcoCaixaComissaoPermanencia.AsString,2);
  //Identifica��o do t�tulo na empresa  (Nosso N�mero) tamanho 25 - posicao 38 ao 62
  texto2 := FormatFloat('00', fEnviarBanco.mBoletosFilial.AsInteger) + '.' + fEnviarBanco.mBoletosNumCReceber.AsString;
  texto1 := texto1 + Formatar_Campo(texto2,25);
  //N�mero do titulo no banco  tamanho 7 - posicao 63 ao 73
  texto1 := texto1 + Monta_Numero(Copy(fEnviarBanco.mBoletosNossoNumero.AsString, 1, 11),11);
  //Campo em branco  tamanho 3 - posicao 74 a 76
  texto1 := texto1 + Formatar_Campo('',3);
  //N� da presta��o   tamanho 30 - posicao 77 ao 106
  texto1 := texto1 + Formatar_Campo(fEnviarBanco.mBoletosMensagem.AsString,30);
  //C�digo da carteira   tamanho 2 - posicao 107 ao 108
  texto1 := texto1 + Formatar_Campo(fEnviarBanco.mBoletosNumCarteira.AsString,2);
  //C�digo da ocorr�ncia   tamanho 2 - posicao 109 ao 110
  texto1 := texto1 + Formatar_Campo(fEnviarBanco.mBoletosCodComando.AsString,2);
  //Seu N�mero    tamanho 10 - posicao 111 ao 120
  texto1 := texto1 + Formatar_Campo(FormatFloat('000000', fEnviarBanco.mBoletosNumNota.AsFloat) + '/' + fEnviarBanco.mBoletosParcela.AsString,10);
  //Data de vencimento do titulo   tamanho 6 - posicao 121 ao 126
  vAux := FormatDateTime('DD/MM/YY', fEnviarBanco.mBoletosDtVencto.AsDateTime);
  texto1 := texto1 + Monta_Numero(vAux,6);
  //Valor do titulo tamanho 13 - posicao 127 ao 139
  texto1 := texto1 + Monta_Numero(FormatFloat('0.00', fEnviarBanco.mBoletosVlrParcela.AsFloat),13);
  vVlrTotalTit := vVlrTotalTit + fEnviarBanco.mBoletosVlrParcela.AsFloat;
  //C�digo do Banco  tamanho 3 - posicao 140 ao 142
  texto1 := texto1 + '104';
  //Ag�ncia cobradora  tamanho 5 - posicao 143 ao 147
  //texto1 := texto1 + Monta_Numero(Copy(DM1.tContasAgencia.AsString,1,5),5);
  texto1 := texto1 + Monta_Numero('0',5);
  //Esp�cie do t�tulo  tamanho 2 - posicao 148 ao 149
  texto1 := texto1 + Monta_Numero(fEnviarBanco.mBoletosEspecieDoc.AsString,2);
  //Identif. de t�tulo Aceito/N�o Aceito  tamanho 1 - posicao 150 ao 150
  texto1 := texto1 +  Formatar_Campo(fEnviarBanco.mBoletosAceite.AsString,1);
  //Data de emiss�o do t�tulo  tamanho 6 - posicao 151 ao 156
  vAux := FormatDateTime('DD/MM/YY', fEnviarBanco.mBoletosDtGerado.AsDateTime);
  texto1 := texto1 + Monta_Numero(vAux,6);
  //C�digo da 1� instru��o  tamanho 2 - posicao 157 ao 158
  texto1 := texto1 + Monta_Numero(fEnviarBanco.mBoletosInstrucao.AsString,2);
  //C�digo da 2� instru��o  tamanho 2 - posicao 159 ao 160
  texto1 := texto1 + Monta_Numero('0',2);
  //Juros de mora  tamanho 13 - posicao 161 ao 173
  texto1 := texto1 + Monta_Numero(FormatFloat('0.00', fEnviarBanco.mBoletosVlrJurosDia_Calculado.AsFloat),13);
  //Data limite para desconto   tamanho 6 - posicao 174 ao 179
  texto1 := texto1 + Monta_Numero(fEnviarBanco.mBoletosDtLimiteDesc.AsString,6);
  //Valor desconto  tamanho 13 - posicao 180 ao 192
  texto1 := texto1 + Monta_Numero(FormatFloat('0.00',fEnviarBanco.mBoletosVlrDesconto.AsFloat),13);
  //Valor da IOF   tamanho 13 - posicao 193 ao 205
  texto1 := texto1 + Monta_Numero(FormatFloat('0.00',fEnviarBanco.mBoletosVlrIOF.AsFloat),13);
  //Valor abatimento  tamanho 13 - posicao 206 ao 218
  texto1 := texto1 + Monta_Numero(FormatFloat('0.00',fEnviarBanco.mBoletosVlrAbatimento.AsFloat),13);
  //Tipo inscri��o do sacado   tamanho 2 - posicao 219 ao 220
  if fEnviarBanco.mBoletosPessoa.AsString = 'F' then
    texto1 := texto1 + '01'
  else
    texto1 := texto1 + '02';
  //N�mero de inscri��o do sacado  tamanho 14 - posicao 221 ao 234
  texto1 := texto1 + Monta_Numero(fEnviarBanco.mBoletosCNPJCPF.AsString,14);
  //Nome do sacado tamanho 40 - posicao 235 ao 274
  texto2 := TirarAcento(copy(fEnviarBanco.mBoletosCliente.AsString, 1, 40));
  texto1 := texto1 + Formatar_Campo(texto2,40);
  //Endere�o do sacado tamanho 40 - posicao 275 ao 314
  texto2 := TirarAcento(copy(fEnviarBanco.mBoletosEndereco.AsString, 1, 40));
  texto1 := texto1 + Formatar_Campo(texto2,40);
  //Branco   tamanho 12 - posicao 315 ao 326
  texto2 := TirarAcento(copy(fEnviarBanco.mBoletosBairro.AsString, 1, 12));
  texto1 := texto1 + Formatar_Campo(texto2,12);
  //Cep do sacado  tamanho 8 - posicao 327 ao 334
  texto1 := texto1 + Monta_Numero(fEnviarBanco.mBoletosCep.AsString,8);
  //Cidade tamanho 15 - posicao 335 ao 349
  texto2 := TirarAcento(copy(fEnviarBanco.mBoletosCidade.AsString, 1, 15));
  texto1 := texto1 + Formatar_Campo(texto2,15);
  //Unidade da federa��o  tamanho 2 - posicao 350 ao 351
  texto1 := texto1 + Formatar_Campo(fEnviarBanco.mBoletosUf.AsString,2);
  //Data da multa  tamanho 6 - posicao 352 ao 357
  texto1 := texto1 + Monta_Numero('0',6);
  //Valor da multa  tamanho 10 - posicao 358 ao 367
  texto1 := texto1 + Monta_Numero('0',10);
  //Nome avalista  tamanho 22 - posicao 368 ao 389
  texto2 := TirarAcento(copy(fEnviarBanco.mBoletosNomeAvalista.AsString, 1, 22));
  texto1 := texto1 + Formatar_Campo(texto2,22);
  //Terceira instru��o de cobran�a  tamanho 2 - posicao 390 ao 391
  texto1 := texto1 + Monta_Numero(fEnviarBanco.mBoletosInstrCobranca2.AsString,2);
  //Prazo  tamanho 2 - posicao 392 ao 393
  texto1 := texto1 + Monta_Numero(fEnviarBanco.mBoletosDiasProtesto.AsString,2);
  //C�digo da moeda   tamanho 1 - posicao 394 ao 394
  texto1 := texto1 + '1';
  //N�mero sequencial  tamanho 6 - posicao 395 ao 400
  inc(vContadorReg);
  inc(vContadorTit);
  texto1 := texto1 + Monta_Numero(IntToStr(vContadorReg),6);

  Writeln(FR, texto1);
end;

procedure prc_Mensagem_Caixa;
var
  texto1: string;
begin
  {if (StrToFloat(FormatFloat('0.00',fEnviarBanco.mBoletosVlrJurosDia_Calculado.AsFloat)) <= 0) and (fEnviarBanco.mBoletosDiasProtesto.AsInteger <= 0) then
    exit;

  //C�digo do registro  tamanho 1 - posicao 1 ao 1
  texto1 := '2';
  //C�digo de Inscri��o  tamanho 2 - posicao 2 ao 3
  texto1 := texto1 + '02';
  //N�mero de inscri��o da empresa  tamanho 14 - posicao 4 ao 17
  texto1 := texto1 + Monta_Numero(Dm1.tFilialCNPJ.AsString,14);
  //Ag�ncia do cedente  tamanho 16 - posicao 18 ao 33
  texto1 := texto1 + Formatar_Campo(DM1.tContasCodCedente.AsString,16);
  //Campo em branco   tamanho 29 - posicao 34 ao 62
  texto1 := texto1 + Formatar_Campo('',29);
  //Nosso n�mero   tamanho 11 - posicao 63 ao 73
  texto1 := texto1 + Monta_Numero(Copy(fEnviarBanco.mBoletosNossoNumero.AsString, 1, 11),11);
  //Campo em branco  tamanho 33 - posicao 74 a 106
  texto1 := texto1 + Formatar_Campo('',33);
  //C�digo da carteira   tamanho 2 - posicao 107 ao 108
  texto1 := texto1 + Formatar_Campo(fEnviarBanco.mBoletosNumCarteira.AsString,2);
  //C�digo da ocorr�ncia   tamanho 2 - posicao 109 ao 110
  texto1 := texto1 + Formatar_Campo(fEnviarBanco.mBoletosCodComando.AsString,2);
  //Brancos    tamanho 29 - posicao 111 ao 139
  texto1 := texto1 + Formatar_Campo('',29);
  //C�digo do Banco  tamanho 3 - posicao 140 ao 142
  texto1 := texto1 + '104';
  //Mensagem 1 a ser impressa no boleto  tamanho 40 - posica 143 ao 182
  texto1 := texto1 +  Formatar_Campo(vMensagem[1],40);
  //Mensagem 2 a ser impressa no boleto  tamanho 40 - posica 183 ao 222
  texto1 := texto1 +  Formatar_Campo(vMensagem[2],40);
  //Mensagem 3 a ser impressa no boleto  tamanho 40 - posica 223 ao 262
  texto1 := texto1 +  Formatar_Campo(vMensagem[3],40);
  //Mensagem 4 a ser impressa no boleto  tamanho 40 - posica 263 ao 302
  texto1 := texto1 +  Formatar_Campo(vMensagem[4],40);
  //Mensagem 5 a ser impressa no boleto  tamanho 40 - posica 303 ao 342
  texto1 := texto1 +  Formatar_Campo(vMensagem[5],40);
  //Mensagem 6 a ser impressa no boleto  tamanho 40 - posica 343 ao 382
  texto1 := texto1 +  Formatar_Campo(vMensagem[6],40);
  //Campo em branco   tamanho 12 - posica 383 ao 394
  texto1 := texto1 +  Formatar_Campo('',12);
  //N�mero sequencial  tamanho 6 - posicao 395 ao 400
  inc(vContadorReg);
  texto1 := texto1 + Monta_Numero(IntToStr(vContadorReg),6);

  Writeln(FR, texto1);}
end;

procedure prc_Trailler_Caixa;
var
  texto1: string;
begin
  //C�digo do registro  tamanho 1 - posicao 1 ao 1
  texto1 := '9';
  //Brancos   tamanho 393 - posicao 2 ao 394
  texto1 := texto1 + Formatar_Campo('',393);
  //N�mero de sequ�ncia  tamanho 6 - posicao 395 ao 400
  inc(vContadorReg);
  texto1 := texto1 + Monta_Numero(IntToStr(vContadorReg),6);

  Writeln(FR, texto1);
end;


///////////////////////////////////
///////////////////////////////////
///////////////////////////////////


procedure Posiciona_Cidade(Codigo: Integer);
begin
  DM1.tCidade.Locate('Codigo',Codigo,[loCaseInsensitive]);
end;

procedure Grava_Historico(Tipo: string); //G= Gera��o   N= Nosso N�mero
var
  vAux: Integer;
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
  DM1.tCReceberParcHistHistorico.AsString     := 'Duplicata enviada para ' + DM1.tContasNomeConta.AsString;
  DM1.tCReceberParcHistPgto.AsBoolean         := False;
  DM1.tCReceberParcHistDevolucao.AsBoolean    := False;
  if vGeradoNossoNum then
    DM1.tCReceberParcHistHistorico.AsString   := DM1.tCReceberParcHistHistorico.AsString + ', nosso n� gerado';
  DM1.tCReceberParcHist.Post;

  //Grava a tabela do hist�rico da remessa
  DM1.tCReceberParcRem.Refresh;
  DM1.tCReceberParcRem.Last;
  vAux := DM1.tCReceberParcRemItemRem.AsInteger;
  DM1.tCReceberParcRem.Insert;
  DM1.tCReceberParcRemFilial.AsInteger       := DM1.tCReceberParcHistFilial.AsInteger;
  DM1.tCReceberParcRemNumCReceber.AsInteger  := DM1.tCReceberParcHistNumCReceber.AsInteger;
  DM1.tCReceberParcRemParcCReceber.AsInteger := DM1.tCReceberParcHistParcCReceber.AsInteger;
  DM1.tCReceberParcRemItemHist.AsInteger     := DM1.tCReceberParcHistItem.AsInteger;
  DM1.tCReceberParcRemItemRem.AsInteger      := vAux + 1;
  DM1.tCReceberParcRemCodConta.AsInteger     := DMBanco.tBcoBrasilCodConta.AsInteger;
  DM1.tCReceberParcRemNumCarteira.AsString   := fEnviarBanco.mBoletosNumCarteira.AsString;

  if DM1.tContasCNAB.AsString = 'ITAU400' then
    Grava_HistoricoItau
  else
  if copy(DM1.tContasCNAB.AsString,1,9) = 'BRASIL400' then
    Grava_HistoricoBBrasil
  else
  if copy(DM1.tContasCNAB.AsString,1,9) = 'CAIXA400' then
    Grava_HistoricoBCaixa;
{  else
  if DM1.tContasCNAB.AsString = 'SANTANDER240' then
    Grava_HistoricoBSantander;
}

  //Protesto
  DM1.tCReceberParcRemDiasProtesto.AsInteger := fEnviarBanco.mBoletosDiasProtesto.AsInteger;

  //Juros
  DM1.tCReceberParcRemVlrJuros.AsFloat := fEnviarBanco.mBoletosVlrJurosPorDia.AsFloat;

  //Desconto
  DM1.tCReceberParcRemVlrDesconto.AsFloat := fEnviarBanco.mBoletosVlrDesconto.AsFloat;
  DM1.tCReceberParcRemDtLimiteDesconto.AsString := fEnviarBanco.mBoletosDtLimiteDesc.AsString;

  //Baixa/Devolu��o
  DM1.tCReceberParcRemVlrIOF.AsFloat            := fEnviarBanco.mBoletosVlrIOF.AsFloat;
  DM1.tCReceberParcRemVlrAbatimento.AsString    := fEnviarBanco.mBoletosVlrAbatimento.AsString;
  DM1.tCReceberParcRemAvalista.AsString         := fEnviarBanco.mBoletosNomeAvalista.AsString;
  DM1.tCReceberParcRemCnpjAvalista.AsString     := fEnviarBanco.mBoletosCpfCnpjAvalista.AsString;
  DM1.tCReceberParcRemDtVecto.AsString          := fEnviarBanco.mBoletosDtVencto.AsString;
  DM1.tCReceberParcRemCepAvalista.AsString      := fEnviarBanco.mBoletosCepAvalista.AsString;
  DM1.tCReceberParcRemEndAvalista.AsString      := fEnviarBanco.mBoletosEndAvalista.AsString;
  DM1.tCReceberParcRemCidAvalista.AsString      := fEnviarBanco.mBoletosCidAvalista.AsString;
  DM1.tCReceberParcRemUFAvalista.AsString       := fEnviarBanco.mBoletosUFAvalista.AsString;
  DM1.tCReceberParcRemBairroAvalista.AsString   := fEnviarBanco.mBoletosBairroAvalista.AsString;
  DM1.tCReceberParcRemNumTitBanco.AsString      := fEnviarBanco.mBoletosNossoNumero.AsString;
  DM1.tCReceberParcRemBoletoPorEmail.AsBoolean  := fEnviarBanco.mBoletosBoletoPorEmail.AsBoolean;
  DM1.tCReceberParcRemCodTransmissaoST.AsString := fEnviarBanco.mBoletosCodTransmissao.AsString;
  DM1.tCReceberParcRemEmail.AsString            := fEnviarBanco.mBoletosEmail.AsString;
  DM1.tCReceberParcRem.Post;
  DM1.tCReceberParcRem.Refresh;
end;

procedure Grava_HistoricoBBrasil;
begin
  //C�digo da carteira
  DM1.tCReceberParcRemCodCedente.AsString       := DM1.tContasNumConta.AsString;
  if fEnviarBanco.mBoletosNumCarteira.AsString = '11' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobran�a Simples'
  else
  if fEnviarBanco.mBoletosNumCarteira.AsString = '12' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobran�a Indexada'
  else
  if fEnviarBanco.mBoletosNumCarteira.AsString = '17' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobran�a Direta Especial'
  else
  if fEnviarBanco.mBoletosNumCarteira.AsString = '31' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobran�a Vinculada'
  else
  if fEnviarBanco.mBoletosNumCarteira.AsString = '51' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobran�a Descontada';

  //Tipo de cobran�a
  if fEnviarBanco.mBoletosTipoDocumento.AsString = '04DSC' then
    DM1.tCReceberParcRemTipoDocumentoST.AsString := fEnviarBanco.mBoletosTipoDocumento.AsString + '-' + 'Solicita��o de registro como cobran�a Descontada'
  else
  if fEnviarBanco.mBoletosTipoDocumento.AsString = '08VDR' then
    DM1.tCReceberParcRemTipoDocumentoST.AsString := fEnviarBanco.mBoletosTipoDocumento.AsString + '-' + 'Solicita��o de registro como cobran�a Vendor'
  else
  if fEnviarBanco.mBoletosTipoDocumento.AsString = '02VIN' then
    DM1.tCReceberParcRemTipoDocumentoST.AsString := fEnviarBanco.mBoletosTipoDocumento.AsString + '-' + 'Solicita��o de registro como cobran�a Vinculada';

  //C�digo da 1� instru��o
  if fEnviarBanco.mBoletosInstrucao.AsString = '00' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Aus�ncia de intru��es'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '01' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Cobrar juros'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '03' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Protestar no terceiro dia �til ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '04' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Protestar no quarto dia �til ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '05' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Protestar no quinto dia �til ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '06' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Protesto em dias corridos (' + fEnviarBanco.mBoletosDiasProtesto.AsString + ')'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '07' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'N�o Protestar'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '10' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Protestar no 10� dia corrido ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '15' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Protestar no 15� dia corrido ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '20' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Protestar no 20� dia corrido ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '22' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Conceder desconto s� at� a data estipulada'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '25' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Protestar no 25� dia corrido ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '30' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Protestar no 30� dia corrido ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '45' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Protestar no 45� dia corrido ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '42' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Devolver'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '44' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Baixar'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '46' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Entregar ao sacado franco de pagamento';

  //C�digo da 2� instru��o
  if fEnviarBanco.mBoletosInstrucao2.AsString = '00' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'Aus�ncia de intru��es'
  else
  if fEnviarBanco.mBoletosInstrucao2.AsString = '01' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'Cobrar juros'
  else
  if fEnviarBanco.mBoletosInstrucao2.AsString = '03' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'Protestar no terceiro dia �til ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao2.AsString = '04' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'Protestar no quarto dia �til ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao2.AsString = '05' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'Protestar no quinto dia �til ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao2.AsString = '06' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'Protesto em dias corridos'
  else
  if fEnviarBanco.mBoletosInstrucao2.AsString = '07' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'N�o Protestar'
  else
  if fEnviarBanco.mBoletosInstrucao2.AsString = '10' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'Protestar no 10� dia corrido ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao2.AsString = '15' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'Protestar no 15� dia corrido ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao2.AsString = '20' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'Protestar no 20� dia corrido ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao2.AsString = '22' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'Conceder desconto s� at� a data estipulada'
  else
  if fEnviarBanco.mBoletosInstrucao2.AsString = '25' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'Protestar no 25� dia corrido ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao2.AsString = '30' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'Protestar no 30� dia corrido ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao2.AsString = '45' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'Protestar no 45� dia corrido ap�s vencido'
  else
  if fEnviarBanco.mBoletosInstrucao2.AsString = '42' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'Devolver'
  else
  if fEnviarBanco.mBoletosInstrucao2.AsString = '44' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'Baixar'
  else
  if fEnviarBanco.mBoletosInstrucao2.AsString = '46' then
    DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrucao2.AsString + 'Entregar ao sacado franco de pagamento';

  //Esp�cie
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '01' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Duplicata mercantil'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '02' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Nota promiss�ria'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '03' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Nota de seguro'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '05' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Recibo'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '08' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Letra de c�mbio'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '09' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Warrant'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '10' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Cheque'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '12' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Duplicata de servi�o'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '13' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Nota de d�bito'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '15' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Ap�lice de seguro'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '21' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Duplicata rural'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '25' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Divida ativa da Uni�o'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '26' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Divida ativa de Estado'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '27' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Divida ativa de Mun�cipio';

  //Comando
  if fEnviarBanco.mBoletosCodComando.AsString = '01' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Registro de t�tulos'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '02' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Solicita��o de baixa'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '03' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Pedido de debito em conta'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '04' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Concess�o de abatimento'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '05' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Cancelamento de abatimento'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '06' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Altera��o de vcto. de t�tulo'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '07' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Altera��o do n�mero de controle do participante'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '08' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Altera��o do n�mero do t�tulo dado pelo cedente'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '09' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Instru��o para protestar'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '10' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Instru��o para sustar protesto'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '11' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Instru��o para dispensar juros'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '12' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Altera��o de nome e endere�o do sacado'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '16' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Altera��o de juros mora'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '31' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Conceder desconto'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '32' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-N�o conceder desconto'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '33' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Retificar desconto'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '34' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Alterar data para desconto'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '35' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Cobrar multa'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '36' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Dispensar multa'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '37' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Dispensar indexador'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '38' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Dispensar prazo limite de recebimento'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '39' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Alterar prazo limite de recebimento'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '40' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Alterar modalidade de cobran�a';

  //Aceite
  DM1.tCReceberParcRemCodAceite.AsString := fEnviarBanco.mBoletosAceite.AsString;
  if fEnviarBanco.mBoletosAceite.AsString = 'A' then
    DM1.tCReceberParcRemCodAceite.AsString := DM1.tCReceberParcRemCodAceite.AsString + '-' + 'Aceite'
  else
  if fEnviarBanco.mBoletosAceite.AsString = 'N' then
    DM1.tCReceberParcRemCodAceite.AsString := DM1.tCReceberParcRemCodAceite.AsString + '-' + 'N�o ACeite';
end;

procedure Grava_HistoricoBCaixa;
begin
  //C�digo da carteira
  DM1.tCReceberParcRemCodCedente.AsString := DM1.tContasCodCedente.AsString;
  if fEnviarBanco.mBoletosNumCarteira.AsString = '11' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobran�a Simples'
  else
  if fEnviarBanco.mBoletosNumCarteira.AsString = '12' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobran�a R�pida'
  else
  if fEnviarBanco.mBoletosNumCarteira.AsString = '14' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobran�a Sem Registro'
  else
  if fEnviarBanco.mBoletosNumCarteira.AsString = '41' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'Cobran�a Descontada';

  //C�digo da 1� instru��o
  if fEnviarBanco.mBoletosInstrucao.AsString = '01' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Protestar em NN Dias'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '02' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + 'Devolver em NN Dias';

  //Esp�cie
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '01' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Duplicata mercantil'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '02' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Nota promiss�ria'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '03' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Duplicata de Presta��o de Servi�o'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '05' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Nota de Seguro'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '06' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Letra de c�mbio'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '09' then
    DM1.tCReceberParcRemEspDoc.AsString := fEnviarBanco.mBoletosEspecieDoc.AsString + '-Outros';

  //Comando
  if fEnviarBanco.mBoletosCodComando.AsString = '01' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Entrada de T�tulo'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '02' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Pedido de Baixa'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '03' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Concess�o de Abatimento'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '04' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Cancelamento do Abatimento'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '05' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Altera��o do Vencimento'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '06' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Altera��o do Uso da Empresa'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '07' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Altera��o do Prazo de Protesto'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '08' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Altera��o do Prazo de Devolu��o'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '09' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Altera��o de Outros Dados'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '10' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Alt. de Dados c/ Emiss�o/Emiss�o de Bloqueto'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '11' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Altera��o da Op��o de Protesto para Devolu��o'
  else
  if fEnviarBanco.mBoletosCodComando.AsString = '12' then
    DM1.tCReceberParcRemCodComando.AsString := fEnviarBanco.mBoletosCodComando.AsString + '-Altera��o da Op��o de Devolu��o para Protesto';

  //Aceite
  DM1.tCReceberParcRemCodAceite.AsString := fEnviarBanco.mBoletosAceite.AsString;
  if fEnviarBanco.mBoletosAceite.AsString = 'A' then
    DM1.tCReceberParcRemCodAceite.AsString := DM1.tCReceberParcRemCodAceite.AsString + '-' + 'Aceite'
  else
  if fEnviarBanco.mBoletosAceite.AsString = 'N' then
    DM1.tCReceberParcRemCodAceite.AsString := DM1.tCReceberParcRemCodAceite.AsString + '-' + 'N�o ACeite';
end;

procedure prc_Header_Itau400;
var
  vAux: String;
  texto1, texto2: String;
  i: Integer;
begin
  //Tipo de registro tamanho 1 - posicao 1 ao 1
  texto1 := '0';

  //Opera��o (remessa) tamanho 1 - posicao 2 ao 2
  texto1 := texto1 + '1';

  //Literal de remessa tamanho 7 - posicao 3 ao 9
  texto1 := texto1 + 'REMESSA';

  //C�digo do servi�o tamanho 2 - posicao 10 ao 11
  texto1 := texto1 + '01';

  //Literal de servi�o tamanho 15 - posicao 12 ao 26
  texto1 := texto1 + 'COBRANCA       ';

  //Agencia tamanho 4 - posicao 27 ao 30
  texto2 := copy(DM1.tContasAgencia.AsString,1,4);
  for i := 1 to 4 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Complemento do registro tamanho 2 - posicao 31 ao 32
  texto1 := texto1 + '00';

  //N�mero da conta tamanho 5 - posicao 33 ao 37
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

  //C�digo do banco tamanho 3 - posicao 77 ao 79
  texto1 := texto1 + '341';

  //Nome do banco tamanho 15 - posicao 80 ao 94
  texto1 := texto1 + 'BANCO ITAU SA  ';

  //Data de gera��o do arquivo tamanho 6 - posicao 95 ao 100
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

  //N�mero sequencial tamanho 6 - posicao 395 ao 400
  inc(vContadorReg);
  texto1 := texto1 + FormatFloat('000000',vContadorReg);

  Writeln(FR,texto1);
end;

procedure prc_Detalhe_Itau400;
var
  vAux, texto1, texto2: String;
  vVlrAux: Real;
  i: Integer;
begin
  //Tipo de registro tamanho 1 - posicao 1 ao 1
  texto1 := '1';

  //Tipo de inscri��o tamanho 2 - posicao 2 ao 3
  texto1 := texto1 + '02';

  //N�mero de inscri��o da empresa 14 - posicao 4 ao 17
   vAux   := Dm1.tFilialCNPJ.AsString;
   texto2 := '';
   for i  := 1 to Length(vAux) do
     if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
       Texto2 := Texto2 + Copy(vAux,i,1);
   for i := 1 to 14 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Ag�ncia mantenedora da conta tamanho 4 - posicao 18 ao 21
   texto2 := copy(DM1.tContasAgencia.AsString,1,4);
   for i := 1 to 4 - length(texto2) do
     texto2 := texto2 + ' ';
   texto1 := texto1 + texto2;

   //Complemento tamanho 2 - posicao 22 ao 23
   texto1 := texto1 + '00';

   //N�mero da conta da empresa tamanho 5 - posicao 24 ao 28
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

   //Instru��o de alega��o tamanho 4 - posicao 34 ao 37
   texto1 := texto1 + '    ';

   //identifica��o do titulo na empresa tamanho 25 - posicao 38 ao 62
   texto2 := FormatFloat('00',fEnviarBanco.mBoletosFilial.AsInteger) + '.' + fEnviarBanco.mBoletosNumCReceber.AsString;
   for i := 1 to 25 - Length(texto2) do
     texto2 := texto2 + ' ';
   texto1 := texto1 + texto2;

   //Nosso n�mero tamanho 8 - posicao 63 ao 70
   texto2 := Copy(fEnviarBanco.mBoletosNossoNumero.AsString,1,8);
   for i := 1 to 8 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Quantidade de moeda vari�vel tamanho 13 - posicao 71 ao 83
   for i := 1 to 13 do
     texto1 := texto1 + '0';

   //N�mero da carteira no banco tamanho 3 - posicao 84 ao 86
   texto2 := fEnviarBanco.mBoletosNumCarteira.AsString;
   for i := 1 to 3 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Uso do banco tamanho 21 - posicao 87 ao 107
   for i := 1 to 21 do
     texto1 := texto1 + ' ';

   //C�digo da carteira tamanho 1 - posicao 108 ao 108
   texto1 := texto1 + 'D';

   //C�digo de ocorr�ncia tamanho 2 - posicao 109 ao 110
   texto2 := fEnviarBanco.mBoletosInstrucao.AsString;
   for i := 1 to 2 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //N�mero do documento tamanho 10 - posicao 111 ao 120
   texto2 := FormatFloat('000000',fEnviarBanco.mBoletosNumNota.AsFloat) + '/' + fEnviarBanco.mBoletosParcela.AsString;
   for i := 1 to 10 - Length(texto2) do
     texto2 := texto2 + ' ';
   texto1 := texto1 + texto2;

   //Data de vencimento do titulo tamanho 6 - posicao 121 ao 126
   vAux   := FormatDateTime('DD/MM/YY',fEnviarBanco.mBoletosDtVencto.AsDateTime);
   texto2 := '';
   for i := 1 to Length(vAux) do
     if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
       Texto2 := Texto2 + Copy(vAux,i,1);
    for i := 1 to 6 - Length(texto2) do
      texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Valor do titulo tamanho 13 - posicao 127 ao 139
   texto2 := FormatFloat('00000000000.00',fEnviarBanco.mBoletosVlrParcela.AsFloat);
   Delete(texto2,12,1);
   texto1 := texto1 + texto2;

   //C�digo do banco tamanho 3 - posicao 140 ao 142
   texto1 := texto1 + '341';

   //Agencia cobradora tamanho 5 - posicao 143 ao 147
   texto1 := texto1 + '00000';

   //Esp�cie tamanho 2 - posicao 148 ao 149
   texto2 := DMBanco.tBcoItauEspecieDoc.AsString;
   for i := 1 to 2 - length(texto2) do
     texto2 := texto2 + ' ';
   texto1 := texto1 + texto2;

   //Aceite tamanho 1 - posicao 150 ao 150
   if DMBanco.tBcoItauAceite.AsString <> '' then
     texto1 := texto1 + DMBanco.tBcoItauAceite.AsString
   else
     texto1 := texto1 + ' ';

   //Data de emiss�o do titulo tamanho 6 - posicao 151 ao 156
   vAux := FormatDateTime('DD/MM/YY',fEnviarBanco.mBoletosDtGerado.AsDateTime);
   texto2 := '';
   for i := 1 to Length(vAux) do
     if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
       Texto2 := Texto2 + Copy(vAux,i,1);
    for i := 1 to 6 - Length(texto2) do
      texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Instru��o 1 tamanho 2 - posicao 157 ao 158
   texto2 := DMBanco.tBcoItauInstrCobranca1.AsString;
   for i := 1 to 2 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Instru��o 2 tamanho 2 - posicao 159 ao 160
   texto2 := DMBanco.tBcoItauInstrCobranca2.AsString;
   for i := 1 to 2 - Length(texto2) do
     texto2 := '0' + texto2;
   texto1 := texto1 + texto2;

   //Juros de mora por dia de atrazo tamanho 13 - posicao 161 ao 173
   vVlrAux := 0;
   if fEnviarBanco.mBoletosVlrJurosPorDia.AsFloat > 0 then
     begin
       //Foi tirado dia 18/01/2010 conforme Raquel
       //if mBoletosTipoJuro.AsString = 'B' then
       //  vVlrAux := (mBoletosVlrParcela.AsFloat * mBoletosVlrJurosPorDia.AsFloat) / 100
       //else
         vVlrAux := fEnviarBanco.mBoletosVlrJurosPorDia.AsFloat;
     end;
   texto2 := FormatFloat('00000000000.00',vVlrAux);
   Delete(texto2,12,1);
   texto1 := texto1 + texto2;

   //Data de desconto tamanho 6 - posicao 174 ao 179
   texto2 := '';
   if (fEnviarBanco.mBoletosVlrDesconto.AsFloat > 0) and (fEnviarBanco.mBoletosDtLimiteDesc.AsDateTime > 1) then
     begin
       vAux   := FormatDateTime('DD/MM/YY',fEnviarBanco.mBoletosDtLimiteDesc.AsDateTime);
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
   if fEnviarBanco.mBoletosVlrDesconto.AsFloat > 0 then
     begin               
       if fEnviarBanco.mBoletosTipoDesconto.AsString = 'A' then
         vVlrAux := (fEnviarBanco.mBoletosVlrParcela.AsFloat * fEnviarBanco.mBoletosVlrDesconto.AsFloat) / 100
       else
         vVlrAux := fEnviarBanco.mBoletosVlrDesconto.AsFloat;
     end;
   texto2 := FormatFloat('00000000000.00',vVlrAux);
   Delete(texto2,12,1);
   texto1 := texto1 + texto2;

   //Valor IOF recolhido por nota de seguro tamanho 13 - posicao 193 ao 205
   for i := 1 to 13 do
     texto1 := texto1 + '0';

   //Valor abatimento tamanho 13 - posicao 206 ao 218
   texto2 := FormatFloat('00000000000.00',fEnviarBanco.mBoletosVlrAbatimento.AsFloat);
   Delete(texto2,12,1);
   texto1 := texto1 + texto2;

   //C�digo de inscri��o do sacado tamanho 2 - posicao 219 ao 220
   if fEnviarBanco.mBoletosPessoa.AsString = 'F' then
     texto1 := texto1 + '01'
   else
   if fEnviarBanco.mBoletosPessoa.AsString = 'J' then
     texto1 := texto1 + '02'
   else
     texto1 := texto1 + '00';

   //N�mero de inscri��o do sacado tamanho 14 - posicao 221 ao 234
   vAux  := fEnviarBanco.mBoletosCNPJCPF.AsString;
   texto2 := '';
   for i := 1 to Length(vAux) do
     if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
       Texto2 := Texto2 + Copy(vAux,i,1);
   for i := 1 to 14 - Length(texto2) do
     texto2 := '0' + texto2;
   if texto2 = '00000000000000' then
     ShowMessage('Cliente  ' + fEnviarBanco.mBoletosCliente.AsString + ' n�o possui CNPJ/CPF');
   texto1 := texto1 + texto2;

   //Nome do sacado tamanho 30 - posicao 235 ao 264
   texto2 := TirarAcento(copy(fEnviarBanco.mBoletosCliente.AsString,1,30));
   for i := 1 to 30 - Length(texto2) do
     texto2 := texto2 + ' ';
   texto1 := texto1 + texto2;

   //brancos tamanho 10 - posicao 265 ao 274
   texto2 := TirarAcento(copy(fEnviarBanco.mBoletosCliente.AsString,31,10));
   for i := 1 to 10 - Length(texto2) do
     texto2 := texto2 + ' ';
   texto1 := texto1 + texto2;

   //Logradouro tamanho 40 - posicao 275 ao 314
   texto2 := TirarAcento(copy(fEnviarBanco.mBoletosEndereco.AsString,1,40));
   for i := 1 to 40 - Length(texto2) do
     texto2 := texto2 + ' ';
   texto1 := texto1 + texto2;

  //Bairro tamanho 12 - posicao 315 ao 326
  texto2 := TirarAcento(copy(fEnviarBanco.mBoletosBairro.AsString,1,12));
  for i := 1 to 12 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Cep tamanho 8 - posicao 327 ao 334
  texto2 := fEnviarBanco.mBoletosCep.AsString;
  vAux := texto2;
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
   for i := 1 to 8 - Length(texto2) do
     texto2 := texto2 + '0';
  texto1 := texto1 + copy(texto2,1,8);

  //Cidade tamanho 15 - posicao 335 ao 349
  texto2 := TirarAcento(copy(fEnviarBanco.mBoletosCidade.AsString,1,15));
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Cidade tamanho 25 - posicao 350 ao 351
  texto2 := fEnviarBanco.mBoletosUf.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Sacador avalista tamanho 30 - posicao 352 ao 381
  texto2 := TirarAcento(copy(fEnviarBanco.mBoletosNomeAvalista.AsString,1,30));
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
  texto1 := texto1 + FormatFloat('00',fEnviarBanco.mBoletosDiasProtesto.AsFloat);

  //Brancos tamanho 1 - posicao 394 ao 394
  texto1 := texto1 + ' ';

  //N�mero sequencial tamanho 6 - posicao 395 ao 400
  inc(vContadorReg);
  inc(vContadorTit);
  texto1 := texto1 + FormatFloat('000000',vContadorReg);

  Writeln(FR,texto1);
end;

procedure prc_Reg_Avalista_Itau400;
var
  texto1, texto2: String;
  i: Integer;
begin
//Posi��o 1/1 Tamanho 1 - Identifica��o do registro sacador avalista
  Texto1 := '5';
              
//Posi��o 2/121 Tamanho 120 - Email do sacado
  texto2 := '';
  if fEnviarBanco.mBoletosBoletoPorEmail.AsBoolean then
    texto2 := fEnviarBanco.mBoletosEmail.AsString;
  for i := 1 to 120 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

//Posi��o 122/123 Tamanho 1 - Tipo do documento do Avalista
  if Length(fEnviarBanco.mBoletosCpfCnpjAvalista.AsString) = 11 then
    texto1 := texto1 + '01'
  else
  if Length(fEnviarBanco.mBoletosCpfCnpjAvalista.AsString) = 14 then
    texto1 := texto1 + '02'
  else
    texto1 := texto1 + '00';

//Posi��o 124/137 Tamanho 14 - N�mero do documento do avalista
  texto2 := fEnviarBanco.mBoletosCpfCnpjAvalista.AsString;
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

//Posi��o 138/177 Tamanho 40 - Endereco do sacador avalista
  texto2 := TirarAcento(copy(fEnviarBanco.mBoletosEndAvalista.AsString,1,40));
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

//Posi��o 178/189 Tamanho 12 - Bairro
  texto2 := TirarAcento(copy(fEnviarBanco.mBoletosBairroAvalista.AsString,1,12));
  for i := 1 to 12 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

//Posi��o 190/197 Tamanho 8 - Cep do sacador avalista
  texto2 := fEnviarBanco.mBoletosCepAvalista.AsString;
  for i := 1 to 8 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

//Posi��o 198/212 Tamanho 15 - Cidade do sacador avalista
  texto2 := TirarAcento(copy(fEnviarBanco.mBoletosCidAvalista.AsString,1,15));
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

//Posi��o 213/214 Tamanho 2 - UF do sacador avalista
  texto2 := fEnviarBanco.mBoletosUFAvalista.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

//Posi��o 215/394 Tamanho 180 - Filler (espa�o em branco)
  for i := 1 to 180 do
    texto1 := texto1 + ' ';

//Posi��o 395/400 Tamanho 6 - N�mero sequencial do registro
  inc(vContadorReg);
  texto2 := IntToStr(vContadorReg);
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  Writeln(FR,texto1);
end;

procedure prc_Trailler_Itau400;
var
  texto1: String;
  i: Integer;
begin
  //Tipo de registro tamanho 1 - posicao 1 ao 1
  texto1 := '9';

  //Brancos tamanho 393 - posicao 2 ao 394
  for i := 1 to 393 do
    texto1 := texto1 + ' ';

  //N�mero sequencial tamanho 6 - posicao 395 ao 400
  inc(vContadorReg);
  texto1 := texto1 + FormatFloat('000000',vContadorReg);

  Writeln(FR,texto1);
end;

procedure prc_Calcula_NossoNumeroItau;
var
  vNumero, i, vSoma, vAux, vAux2, vSomaAux: Integer;
  texto1, texto2: String;
begin
  //Busca o n�mero sequencial do nosso n�mero
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
            fEnviarBanco.mBoletosNumCarteira.AsString + FormatFloat('00000000',vNumero);
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
    vAux := 10 - vAux;
  texto1 := texto1 + FormatFloat('0',vAux);

  fEnviarBanco.mBoletos.Edit;
  fEnviarBanco.mBoletosNossoNumero.AsString := FormatFloat('00000000',vNumero) + FormatFloat('0',vAux);
  fEnviarBanco.mBoletos.Post;
end;

function fnc_Calcula_NossoNumeroItau(NumCarteira: String): String;
var
  vNumero, i, vSoma, vAux, vAux2, vSomaAux: Integer;
  texto1, texto2: String;
begin
  Result := '';
  //Busca o n�mero sequencial do nosso n�mero
  //vNumero := 1;
  vNumero := fnc_ContasParametros(9999,99);
  //****
  texto1 := copy(DM1.tContasAgencia.AsString,1,4) + copy(DM1.tContasNumConta.AsString,1,5) +
            NumCarteira + FormatFloat('00000000',vNumero);
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

  Result := FormatFloat('00000000',vNumero) + FormatFloat('0',vAux);
end;

function fnc_Calcula_NossoNumeroBrasil(NumCarteira: String): String;
var
  vNumero: Integer;
  texto1 : String;
begin
  Result := '';
  //Busca o n�mero sequencial do nosso n�mero
  //vNumero := 1;
  vNumero := fnc_ContasParametros(9999,99);
  //****
  //texto1 := DMBanco.tBcoBrasilCodTransmissao.AsString + FormatFloat('0000000000',vNumero);
  texto1 := DMBanco.tBcoBrasilCodTransmissao.AsString + FormatFloat('0000000000',vNumero);

  Result := texto1;
end;

function fnc_Calcula_NossoNumeroCaixa(NumCarteira: String): String;
var
  vNumero, i, vSoma, vAux, vAux2, vSomaAux: Integer;
  texto1: String;
begin
  Result := '';
  //vNumero := 1;
  vNumero := fnc_ContasParametros(9999,99);
  //****
  if (NumCarteira = '11') or (NumCarteira = '12') then
    texto1 := '9' + FormatFloat('000000000',vNumero)
  else
  if (NumCarteira = '14') then
    texto1 := '82' + FormatFloat('00000000',vNumero);

  vSoma := 0;
  vAux  := 2;
  for i := length(texto1) downto 1 do
  begin
    vSomaAux := StrToInt(Copy(texto1,i,1)) * vAux;
    vSoma    := vSoma + vSomaAux;
    vAux := vAux + 1;
    if vAux > 9 then
      vAux := 2;
  end;

  vAux  := vSoma div 11;
  vAux2 := vAux * 11;
  vAux  := vSoma - vAux2;
  if vAux > 0 then
    vAux  := 11 - vAux;
  if vAux > 9 then
    vAux := 0;
  //Result := FormatFloat('00000000',vNumero) + FormatFloat('0',vAux);
  Result := texto1 + FormatFloat('0',vAux);
end;

procedure Grava_HistoricoItau;
var
  vAux: Integer;
begin
  if fEnviarBanco.mBoletosNumCarteira.AsString = '112' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'ESCRITURAL ELETR�NICA - SIMPLES / CONTRATUAL'
  else
  if fEnviarBanco.mBoletosNumCarteira.AsString = '109' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'DIRETA ELETR�NICA SEM EMISS�O - SIMPLES'
  else
  if fEnviarBanco.mBoletosNumCarteira.AsString = '175' then
    DM1.tCReceberParcRemNumCarteira.AsString := DM1.tCReceberParcRemNumCarteira.AsString + '-' + 'SEM REGISTRO SEM EMISS�O';

  //Ocorr�ncia
  if fEnviarBanco.mBoletosInstrucao.AsString = '01' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'Remessa'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '02' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'Pedido de Baixa'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '04' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'Concess�o de Abatimento'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '05' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'Cancelamento de Abatimento'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '06' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'Altera��o de vencimento'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '07' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'Altera��o do Uso da Empresa'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '08' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'Altera��o do Seu N�mero'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '09' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'Protestar'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '10' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'N�o protestar'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '18' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'Sustar o Protesto'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '31' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'Altera��o de outros dados'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '34' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'Baixa por ter sido pago diretamente ao cedente'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '35' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'cancelamento de instru��o'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '36' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'Protesto Urgente'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '37' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'altera��o do vencimento e sustar protesto'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '38' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'CEDENTE N�O CONCORDA COM ALEGA��O DO SACADO'
  else
  if fEnviarBanco.mBoletosInstrucao.AsString = '47' then
    DM1.tCReceberParcRemInstrucao.AsString := fEnviarBanco.mBoletosInstrucao.AsString + '-' + 'CEDENTE SOLICITA DISPENSA DE JUROS';

  //Esp�cie
  DM1.tCReceberParcRemEspDoc.AsString             := fEnviarBanco.mBoletosEspecieDoc.AsString;
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '01' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Duplicata mercantil'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '02' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Nota Promiss�ria'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '03' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Nota de Seguro'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '04' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Mensalidade escolar'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '05' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Recibo'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '06' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Contrato'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '07' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Cosseguros'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '08' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Duplicata de Servi�o'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '09' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Letra de C�mbio'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '13' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-Nota de D�bitos'
  else
  if fEnviarBanco.mBoletosEspecieDoc.AsString = '99' then
    DM1.tCReceberParcRemEspDoc.AsString := DM1.tCReceberParcRemEspDoc.AsString + '-DIVERSOs';

  DM1.tCReceberParcRemCodAceite.AsString          := fEnviarBanco.mBoletosAceite.AsString;
  if fEnviarBanco.mBoletosAceite.AsString = 'A' then
    DM1.tCReceberParcRemCodAceite.AsString := DM1.tCReceberParcRemCodAceite.AsString + '-' + 'Sim'
  else
  if fEnviarBanco.mBoletosAceite.AsString = 'N' then
    DM1.tCReceberParcRemCodAceite.AsString := DM1.tCReceberParcRemCodAceite.AsString + '-' + 'N�o';

  //Instru��o 1
  DM1.tCReceberParcRemInstrCobranca1.AsString := fEnviarBanco.mBoletosInstrCobranca1.AsString;
  vAux := 0;
  if fEnviarBanco.mBoletosInstrCobranca1.AsString <> '' then
    vAux := fEnviarBanco.mBoletosInstrCobranca1.AsInteger;
  Case vAux of
    02: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  ap�s 05 dias do Vencimento';
    03: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  ap�s 30 dias do Vencimento';
    05: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Receber conforme instru��es no pr�prio t�tulo';
    06: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  ap�s 10 dias do Vencimento';
    07: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  ap�s 15 dias do Vencimento';
    08: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  ap�s 20 dias do Vencimento';
    09: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Protestar';
    10: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o protestar';
    11: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  ap�s 25 dias do Vencimento';
    12: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  ap�s 35 dias do Vencimento';
    13: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  ap�s 40 dias do Vencimento';
    14: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  ap�s 45 dias do Vencimento';
    15: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  ap�s 50 dias do Vencimento';
    16: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  ap�s 55 dias do Vencimento';
    17: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  ap�s 60 dias do Vencimento';
    18: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver  ap�s 90 dias do Vencimento';
    19: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o Receber ap�s 05 dias do vencimento';
    20: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o Receber ap�s 10 dias do vencimento';
    21: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o Receber ap�s 15 dias do vencimento';
    22: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o Receber ap�s 20 dias do vencimento';
    23: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o Receber ap�s 25 dias do vencimento';
    24: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o Receber ap�s 30 dias do vencimento';
    25: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o Receber ap�s 35 dias do vencimento';
    26: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o Receber ap�s 40 dias do vencimento';
    27: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o Receber ap�s 45 dias do vencimento';
    28: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o Receber ap�s 50 dias do vencimento';
    29: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o Receber ap�s 55 dias do vencimento';
    30: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Import�ncia de desconto por dia';
    31: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o Receber ap�s 60 dias do vencimento';
    32: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o Receber ap�s 90 dias do vencimento';
    36: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Protesto Urgente';
    37: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Receber at� o �ltimo dia do m�s de vencimento';
    38: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Conceder desconto mesmo ap�s vencimento';
    39: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o Receber ap�s o vencimento';
    40: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Conceder desconto conforme Nota de Cr�dito';
    43: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Sujeito a protesto se n�o for pago no vencimento';
    44: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Import�ncia por dia de atraso a partir de';
    45: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Tem dia da Gra�a';
    46: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-uso do banco';
    47: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-DISPENSAR JUROS/COMISS�O DE PERMAN�NCIA';
    51: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-RECEBER SOMENTE COM A PARCELA ANTERIOR QUITADA';
    52: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-favor efetuar pgto  somente atrav�s desta cobran�a banc�ria';
    53: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-USO DO BANCO';
    54: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-ap�s vencimento pag�vel somente na empresa';
    56: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-uso do banco';
    57: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-somar valor do t�tulo ao valor do campo mora/multa caso exista';
    58: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-DEVOLVER AP�S 365 DIAS DE VENCIDO';
    59: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-COBRAN�A NEGOCIADA. PAG�VEL SOMENTE POR ESTE BLOQUETO NA REDE BANC�RIA';
    70: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-uso do banco';
    78: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-VALOR DA IDA ENGLOBA MULTA DE 10% PRO RATA';
    79: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Cobrar juros ap�s 15 dias da emiss�o (para t�tulos com vencimento � vista)';
    80: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-PAGAMENTO EM CHEQUE: SOMENTE RECEBER COM CHEQUE DE EMISS�O DO SACADO';
    81: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-protestar ap�s xx dias corridos do vencimento';
    82: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-protestar ap�s xx DIAS �teis do vencimento';
    83: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-OPERA��O REF A VENDOR';
    84: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Ap�s vencimento consultar a Ag�ncia cedente';
    86: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Antes do Vencimento ou ap�s 15 dias, pag�vel SOMENTE em nossa sede';
    87: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-uso do banco';
    88: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o receber antes do Vencimento';
    89: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-uso do banco';
    90: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-No vencimento pag�vel em qualquer ag�ncia banc�ria';
    91: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-N�o receber ap�s xx dias do vencimento';
    92: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Devolver ap�s xx dias do vencimento';
    93: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Mensagens nos bloquetos com 30 posi��es';
    94: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Mensagens nos bloquetos com 40 posi��es';
    95: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-uso do banco';
    98: DM1.tCReceberParcRemInstrCobranca1.AsString := DM1.tCReceberParcRemInstrCobranca1.AsString + '-Duplicata / Fatura N�';
  end;

  //Instru��o 2
  DM1.tCReceberParcRemInstrCobranca2.AsString := fEnviarBanco.mBoletosInstrCobranca2.AsString;
  vAux := 0;
  if fEnviarBanco.mBoletosInstrCobranca2.AsString <> '' then
    vAux := fEnviarBanco.mBoletosInstrCobranca2.AsInteger;
  Case vAux of
    02: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  ap�s 05 dias do Vencimento';
    03: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  ap�s 30 dias do Vencimento';
    05: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Receber conforme instru��es no pr�prio t�tulo';
    06: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  ap�s 10 dias do Vencimento';
    07: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  ap�s 15 dias do Vencimento';
    08: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  ap�s 20 dias do Vencimento';
    09: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Protestar';
    10: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o protestar';
    11: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  ap�s 25 dias do Vencimento';
    12: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  ap�s 35 dias do Vencimento';
    13: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  ap�s 40 dias do Vencimento';
    14: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  ap�s 45 dias do Vencimento';
    15: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  ap�s 50 dias do Vencimento';
    16: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  ap�s 55 dias do Vencimento';
    17: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  ap�s 60 dias do Vencimento';
    18: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver  ap�s 90 dias do Vencimento';
    19: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o Receber ap�s 05 dias do vencimento';
    20: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o Receber ap�s 10 dias do vencimento';
    21: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o Receber ap�s 15 dias do vencimento';
    22: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o Receber ap�s 20 dias do vencimento';
    23: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o Receber ap�s 25 dias do vencimento';
    24: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o Receber ap�s 30 dias do vencimento';
    25: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o Receber ap�s 35 dias do vencimento';
    26: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o Receber ap�s 40 dias do vencimento';
    27: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o Receber ap�s 45 dias do vencimento';
    28: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o Receber ap�s 50 dias do vencimento';
    29: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o Receber ap�s 55 dias do vencimento';
    30: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Import�ncia de desconto por dia';
    31: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o Receber ap�s 60 dias do vencimento';
    32: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o Receber ap�s 90 dias do vencimento';
    36: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Protesto Urgente';
    37: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Receber at� o �ltimo dia do m�s de vencimento';
    38: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Conceder desconto mesmo ap�s vencimento';
    39: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o Receber ap�s o vencimento';
    40: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Conceder desconto conforme Nota de Cr�dito';
    43: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Sujeito a protesto se n�o for pago no vencimento';
    44: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Import�ncia por dia de atraso a partir de';
    45: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Tem dia da Gra�a';
    46: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-uso do banco';
    47: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-DISPENSAR JUROS/COMISS�O DE PERMAN�NCIA';
    51: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-RECEBER SOMENTE COM A PARCELA ANTERIOR QUITADA';
    52: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-favor efetuar pgto  somente atrav�s desta cobran�a banc�ria';
    53: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-USO DO BANCO';
    54: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-ap�s vencimento pag�vel somente na empresa';
    56: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-uso do banco';
    57: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-somar valor do t�tulo ao valor do campo mora/multa caso exista';
    58: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-DEVOLVER AP�S 365 DIAS DE VENCIDO';
    59: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-COBRAN�A NEGOCIADA. PAG�VEL SOMENTE POR ESTE BLOQUETO NA REDE BANC�RIA';
    70: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-uso do banco';
    78: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-VALOR DA IDA ENGLOBA MULTA DE 10% PRO RATA';
    79: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Cobrar juros ap�s 15 dias da emiss�o (para t�tulos com vencimento � vista)';
    80: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-PAGAMENTO EM CHEQUE: SOMENTE RECEBER COM CHEQUE DE EMISS�O DO SACADO';
    81: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-protestar ap�s xx dias corridos do vencimento';
    82: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-protestar ap�s xx DIAS �teis do vencimento';
    83: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-OPERA��O REF A VENDOR';
    84: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Ap�s vencimento consultar a Ag�ncia cedente';
    86: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Antes do Vencimento ou ap�s 15 dias, pag�vel SOMENTE em nossa sede';
    87: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-uso do banco';
    88: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o receber antes do Vencimento';
    89: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-uso do banco';
    90: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-No vencimento pag�vel em qualquer ag�ncia banc�ria';
    91: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-N�o receber ap�s xx dias do vencimento';
    92: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Devolver ap�s xx dias do vencimento';
    93: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Mensagens nos bloquetos com 30 posi��es';
    94: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Mensagens nos bloquetos com 40 posi��es';
    95: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-uso do banco';
    98: DM1.tCReceberParcRemInstrCobranca2.AsString := DM1.tCReceberParcRemInstrCobranca2.AsString + '-Duplicata / Fatura N�';
  end;

  DM1.tCReceberParcRemTaxaMulta.AsFloat           := fEnviarBanco.mBoletosTaxaMulta.AsFloat;
  DM1.tCReceberParcRemTipoJuros.AsString          := fEnviarBanco.mBoletosTipoJuro.AsString;
  if fEnviarBanco.mBoletosTipoJuro.AsString = 'A' then
    DM1.tCReceberParcRemTipoJuros.AsString := DM1.tCReceberParcRemTipoJuros.AsString + '-' + 'Valor'
  else
  if fEnviarBanco.mBoletosTipoJuro.AsString = 'B' then
    DM1.tCReceberParcRemTipoJuros.AsString := DM1.tCReceberParcRemTipoJuros.AsString + '-' + 'Percentual';
  DM1.tCReceberParcRemVlrJuros.AsFloat            := fEnviarBanco.mBoletosVlrJurosPorDia.AsFloat;

  DM1.tCReceberParcRemTipoDesconto.AsString       := fEnviarBanco.mBoletosTipoDesconto.AsString;
  if fEnviarBanco.mBoletosTipoDesconto.AsString = 'A' then
    DM1.tCReceberParcRemTipoDesconto.AsString := DM1.tCReceberParcRemTipoDesconto.AsString + '-' + 'Valor'
  else
  if fEnviarBanco.mBoletosTipoDesconto.AsString = 'B' then
    DM1.tCReceberParcRemTipoDesconto.AsString := DM1.tCReceberParcRemTipoDesconto.AsString + '-' + 'Percentual';
  DM1.tCReceberParcRemCodCedente.AsString         := DM1.tContasCodCedente.AsString;
end;

{procedure prc_RLBoleto;
var
  vAux: String;
  i: Integer;
  texto2: String;
begin
  //Dados do Cedente Empresa
  fEnviarBanco.RLBTitulo1.Cedente.ContaBancaria.Banco.Codigo  := DM1.tContasCodBanco.AsString;
  fEnviarBanco.RLBTitulo1.Cedente.ContaBancaria.CodigoAgencia := Trim(copy(DM1.tContasAgencia.AsString,1,4));
  fEnviarBanco.RLBTitulo1.Cedente.ContaBancaria.DigitoAgencia := Trim(copy(DM1.tContasAgencia.AsString,5,1));
  fEnviarBanco.RLBTitulo1.Cedente.ContaBancaria.NumeroConta   := DM1.tContasNumConta.AsString;
  fEnviarBanco.RLBTitulo1.Cedente.ContaBancaria.DigitoConta   := DM1.tContasDigConta.AsString;
  fEnviarBanco.RLBTitulo1.Cedente.CodigoCedente               := DM1.tContasCodCedente.AsString;
  if Trim(DM1.tContasCodCedente.AsString) <> '' then
    fEnviarBanco.RLBTitulo1.Cedente.DigitoCodigoCedente       := Copy(DM1.tContasCodCedente.AsString,Length(DM1.tContasCodCedente.AsString,1);
  fEnviarBanco.RLBTitulo1.Carteira                            := fEnviarBanco.mBoletosNumCarteira.AsString;
  fEnviarBanco.RLBTitulo1.Cedente.ContaBancaria.Convenio      := DMBanco_CNAB.cdsBanco_CNABCODTRANSMISSAO.AsString;
  fEnviarBanco.RLBTitulo1.Cedente.ContaBancaria.NomeCliente   := DM1.tFilialEmpresa.AsString;
  fEnviarBanco.RLBTitulo1.Cedente.TipoInscricao               := 'J';

  vAux := DM1.tFilialCNPJ.AsString;
  texto2 := '';
  for i := 1 to Length(vAux) do
    if (Copy(vAux, i, 1) <> '.') and (Copy(vAux, i, 1) <> '-') and (Copy(vAux, i, 1) <> '/') then
      Texto2 := Texto2 + Copy(vAux, i, 1);
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  fEnviarBanco.RLBTitulo1.Cedente.NumeroCPFCGC := Texto2;
  fEnviarBanco.RLBTitulo1.Cedente.Nome         := DM1.tFilialEmpresa.AsString;

  //dados do sacado Cliente
  fEnviarBanco.RLBTitulo1.Sacado.Nome := fEnviarBanco.mBoletosCliente.AsString;
  if fEnviarBanco.mBoletosPessoa.AsString = 'F' then
    fEnviarBanco.RLBTitulo1.Sacado.TipoInscricao := tiPessoaFisica
  else
    fEnviarBanco.RLBTitulo1.Sacado.TipoInscricao := tiPessoaJuridica;
  fEnviarBanco.RLBTitulo1.Sacado.NumeroCPFCGC := fEnviarBanco.mBoletosCNPJCPF.AsString;

  fEnviarBanco.RLBTitulo1.Sacado.Endereco.Rua    := fEnviarBanco.mBoletosEndereco.AsString;
  fEnviarBanco.RLBTitulo1.Sacado.Endereco.CEP    := fEnviarBanco.mBoletosCep.AsString;
  fEnviarBanco.RLBTitulo1.Sacado.Endereco.Cidade := fEnviarBanco.mBoletosCidade.AsString;
  fEnviarBanco.RLBTitulo1.Sacado.Endereco.Estado := fEnviarBanco.mBoletosUf.AsString;
  //dados da cobranca
  fEnviarBanco.RLBTitulo1.TipoOcorrencia := toRemessaRegistrar;
  fEnviarBanco.RLBTitulo1.EspecieDocumento := edDuplicataMercantil;
  Edit4.Text := IntToStr(StrToIntDef(Trim(Edit4.Text),0)+1); //Simulando o nosso numero
  fEnviarBanco.RLBTitulo1.NossoNumero := Trim(Edit4.Text);
  fEnviarBanco.RLBTitulo1.ValorDocumento := StrToCurr(Edit10.Text);
  fEnviarBanco.RLBTitulo1.DataDocumento  := Date;
  fEnviarBanco.RLBTitulo1.DataVencimento := StrToDate(MaskEdit1.Text);
  fEnviarBanco.RLBTitulo1.NumeroDocumento := Trim(Edit3.Text);
  fEnviarBanco.RLBTitulo1.Instrucoes.Text := Memo1.Lines.Text;
  //Inserindo o boleto na remessa
  fEnviarBanco.RLBRemessa1.Titulos.Add(fEnviarBanco.RLBTitulo1.);

end;}

{procedure Gravar_RLBoleto;
begin

  fEnviarBanco.RLBRemessa1.DataArquivo := Date; //� a data que o arquivo est� sendo gerado
  fEnviarBanco.RLBRemessa1.LayoutArquivo := laCNAB400; // Layout do arquivo, � necess�rio ver com o banco qual � o indicado.
                                            //CNAB400 � o mais comum.
  if DM1.tContasCNAB.AsString = 'BRASIL240' then
    fEnviarBanco.RLBRemessa1.LayoutArquivo := laCNAB240
  else
    fEnviarBanco.RLBRemessa1.LayoutArquivo := laCNAB400;

  fEnviarBanco.RLBRemessa1.NomeArquivo := FormatDateTime('yymmdd',Date)+'.REM'; // Apenas o nome do arquivo, alguns bancos
                                                                     //estipulam regras e outros n�o
  fEnviarBanco.RLBRemessa1.NumeroArquivo := 1; // Sequencia n�merica de quandos arquivos j� foram gerados para este banco
  fEnviarBanco.RLBRemessa1.TipoMovimento := tmRemessa;

  fEnviarBanco.RLBRemessa1.NomeArquivo := ExtractFileDir(Application.ExeName)+'\'+fEnviarBanco.RLBRemessa1.NomeArquivo; // Apenas colocando um caminho para o arquivo

  if fEnviarBanco.RLBRemessa1.GerarRemessa then
    MessageDlg('O arquivo foi gerado com sucesso.'#13+fEnviarBanco.RLBRemessa1.NomeArquivo,mtInformation,[mbOK],0);


end;}

function fnc_ContasParametros(Ano, Item: Integer): Integer;
var
  vNumAux: Integer;
begin
  vNumAux := 1;
  if DM1.tContasParametros.Locate('Ano',Ano,[loCaseInsensitive]) then
  begin
    vNumAux := DM1.tContasParametrosNumSeqNossoNum.AsInteger;
    vNumAux := vNumAux + 1;
    DM1.tContasParametros.Edit;
    DM1.tContasParametrosItem.AsInteger           := Item;
    DM1.tContasParametrosNumSeqNossoNum.AsInteger := vNumAux;
    DM1.tContasParametros.Post;
  end
  else
  begin
    DM1.tContasParametros.Insert;
    DM1.tContasParametrosCodConta.AsInteger       := DM1.tContasCodConta.AsInteger;
    DM1.tContasParametrosAno.AsInteger            := Ano;
    DM1.tContasParametrosItem.AsInteger           := Item;
    DM1.tContasParametrosNumSeqNossoNum.AsInteger := vNumAux;
    DM1.tContasParametros.Post;
  end;
  Result := vNumAux;
end;

procedure Montar_Mensagens;
var
  i: integer;
  vDataAux: TDateTime;
begin
  for i := 1 to 6 do
    vMensagem[i] := '';
  i := 0;
  if (StrToFloat(FormatFloat('0.00',fEnviarBanco.mBoletosVlrJurosDia_Calculado.AsFloat)) > 0) then
  begin
    i      := i + 1;
    vMensagem[i] := 'Valor de mora por dia de atraso R$ ' + FormatFloat('0.00',fEnviarBanco.mBoletosVlrJurosDia_Calculado.AsFloat);
  end;
  if (fEnviarBanco.mBoletosInstrucao.AsString = '01') and (fEnviarBanco.mBoletosDiasProtesto.AsInteger > 0) then
  begin
    i            := i + 1;
    vDataAux     := fEnviarBanco.mBoletosDtVencto.AsDateTime + fEnviarBanco.mBoletosDiasProtesto.AsInteger;
    vMensagem[i] := 'Protestar ap�s ' + FormatDateTime('DD/MM/YY',vDataAux);
  end;
  if (fEnviarBanco.mBoletosInstrucao.AsString = '02') and (fEnviarBanco.mBoletosDiasProtesto.AsInteger > 0) then
  begin
    i            := i + 1;
    vDataAux     := fEnviarBanco.mBoletosDtVencto.AsDateTime + fEnviarBanco.mBoletosDiasProtesto.AsInteger;
    vMensagem[i] := 'Devolver ap�s ' + FormatDateTime('DD/MM/YY',vDataAux);
  end;
end;

end.

