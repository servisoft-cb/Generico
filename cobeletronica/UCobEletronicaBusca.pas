unit UCobEletronicaBusca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, ALed, Db,
  DBTables, DBClient, SMDBGrid, DBGrids, Grids;

type
  TfCobEletronicaBusca = class(TForm)
    qBoletos: TQuery;
    qBoletosNumCReceber: TIntegerField;
    qBoletosParcCReceber: TIntegerField;
    qBoletosVlrParcCReceber: TFloatField;
    qBoletosDtVencCReceber: TDateField;
    qBoletosCodCli: TIntegerField;
    qBoletosNumNota: TIntegerField;
    qBoletosDtGerado: TDateField;
    qBoletosNome: TStringField;
    qBoletosEndereco: TStringField;
    qBoletosBairro: TStringField;
    qBoletosUf: TStringField;
    qBoletosCep: TStringField;
    qBoletosPessoa: TStringField;
    qBoletosCgcCpf: TStringField;
    qBoletosInscrEst: TStringField;
    qBoletosEndPgto: TStringField;
    qBoletosBairroPgto: TStringField;
    qBoletosCepPgto: TStringField;
    qBoletosUfPgto: TStringField;
    qBoletosCodCidade: TIntegerField;
    qBoletosCodCidadeP: TIntegerField;
    qBoletoslkCidade: TStringField;
    qBoletoslkCidadePgto: TStringField;
    qBoletosArqGerado: TBooleanField;
    msTitulos: TDataSource;
    qBoletosNumTitBanco: TStringField;
    qBoletosEmail: TStringField;
    qBoletosNumCarteira: TStringField;
    dsqBoletos: TDataSource;
    qBoletosFilial: TIntegerField;
    qBoletosRestParcela: TFloatField;
    mTitulos: TClientDataSet;
    mTitulosNumCReceber: TIntegerField;
    mTitulosParcela: TIntegerField;
    mTitulosNumNota: TIntegerField;
    mTitulosVlrParcela: TFloatField;
    mTitulosArqGerado: TBooleanField;
    mTitulosDtEmissao: TDateField;
    mTitulosDtVencimento: TDateField;
    mTitulosCodCliente: TIntegerField;
    mTitulosNomeCliente: TStringField;
    mTitulosCodConta: TIntegerField;
    mTitulosNomeConta: TStringField;
    qBoletosCodBancoBoleto: TIntegerField;
    mTitulosFilial: TIntegerField;
    qBoletosComplEndereco: TStringField;
    mTitulosSerie: TStringField;
    qBoletosSerie: TStringField;
    qBoletosNumSeqNota: TIntegerField;
    mTitulosNumSeqNota: TIntegerField;
    qBoletosIDCobEletronica: TIntegerField;
    mTitulosIDCobEletronica: TIntegerField;
    mTitulosNossoNumero: TStringField;
    mTitulosCgcCpf: TStringField;
    mTitulosPessoa: TStringField;
    mTitulosNumCarteira: TStringField;
    Panel2: TPanel;
    Label3: TLabel;
    ALed1: TALed;
    Label7: TLabel;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn4: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    vVlrTitulos : Real;
    vQtdTitulos : Integer;
    procedure Monta_MBoleto;
    procedure Monta_SQLqBoletos(CodConta : Integer);

  public
    vCodBanco : Integer;
    vDtInicialCob, vDtFinalCob: TDateTime;
    vFilialCob, vFilialConta: Integer;

    Function Monta_NomeArq(Caminho,Banco : String) : String;

    { Public declarations }
  end;

var
  fCobEletronicaBusca: TfCobEletronicaBusca;

implementation

uses UDM1, UBcoItau, UBcoBrasil, URelCobrancaEletronica, UDMCobEletronica, UCobrancaEletronica, UDMBanco, UCobEletronica,
  UCobEletronicaC;

{$R *.DFM}

function TfCobEletronicaBusca.Monta_NomeArq(Caminho,Banco : String) : String;
var
  Texto1, texto2 : String;
  vAux : Integer;
  Flag : Boolean;
  ano, mes, dia : Word;
begin
  DecodeDate(Date,ano,mes,dia);
  texto2 := Banco + FormatFloat('00',DM1.tFilialCodigo.AsFloat) + '_';
  {if DM1.tFilialCodigo.AsInteger = 1 then
    texto2 := Banco
  else
    texto2 := Banco + '2';}
  Texto1 := '';
  vAux := 0;
  flag := True;
  while Flag do
    begin
      inc(vAux);
      if copy(Caminho,Length(Caminho),1) = '\' then
        Texto1 := Caminho + 'REMESSA\' + texto2 + FormatFloat('00',ano) + FormatFloat('00',Mes) + FormatFloat('00',Dia) + IntToStr(vAux) + '.REM'
      else
        Texto1 := Caminho + '\REMESSA\' + texto2 + Copy(FormatFloat('0000',ano),3,2) + FormatFloat('00',Mes) + FormatFloat('00',Dia) + IntToStr(vAux) + '.REM';
      if not(FileExists(texto1)) then
        flag := False;
    end;
  Result := Texto1;
end;

procedure TfCobEletronicaBusca.Monta_MBoleto;
begin
  qBoletos.First;
  while not qBoletos.Eof do
    begin
      mTitulos.Insert;
      mTitulosArqGerado.AsBoolean       := qBoletosArqGerado.AsBoolean;
      mTitulosNumCReceber.AsInteger     := qBoletosNumCReceber.AsInteger;
      mTitulosParcela.AsInteger         := qBoletosParcCReceber.AsInteger;
      mTitulosNumNota.AsInteger         := qBoletosNumNota.AsInteger;
      mTitulosVlrParcela.AsFloat        := qBoletosVlrParcCReceber.AsFloat;
      mTitulosDtEmissao.AsDateTime      := qBoletosDtGerado.AsDateTime;
      mTitulosDtVencimento.AsDateTime   := qBoletosDtVencCReceber.AsDateTime;
      mTitulosCodCliente.AsInteger      := qBoletosCodCli.AsInteger;
      mTitulosNomeCliente.AsString      := qBoletosNome.AsString;
      mTitulosCodConta.AsInteger        := qBoletosCodBancoBoleto.AsInteger;
      mTitulosFilial.AsInteger          := qBoletosFilial.AsInteger;
      mTitulosSerie.AsString            := qBoletosSerie.AsString;
      mTitulosNumSeqNota.AsInteger      := qBoletosNumSeqNota.AsInteger;
      mTitulosIDCobEletronica.AsInteger := qBoletosIDCobEletronica.AsInteger;
      mTitulosNossoNumero.AsString      := qBoletosNumTitBanco.AsString;
      mTitulosCgcCpf.AsString           := qBoletosCgcCpf.AsString;
      mTitulosPessoa.AsString           := qBoletosPessoa.AsString;
      mTitulosNumCarteira.AsString      := qBoletosNumCarteira.AsString;

      if (qBoletosCodBancoBoleto.AsInteger > 0) and
         (DM1.tContas.Locate('CodConta',qBoletosCodBancoBoleto.AsInteger,[loCaseInsensitive])) then
        mTitulosNomeConta.AsString := DM1.tContasNomeConta.AsString;
      mTitulos.Post;
      qBoletos.Next;
    end;
end;

procedure TfCobEletronicaBusca.Monta_SQLqBoletos(CodConta : Integer);
begin
  qBoletos.Close;
  qBoletos.SQL.Clear;
  qBoletos.SQL.Add('SELECT Dbcreceberparc.NumCReceber, Dbcreceberparc.ParcCReceber, ');
  qBoletos.SQL.Add(' Dbcreceberparc.VlrParcCReceber, Dbcreceberparc.DtVencCReceber, ');
  qBoletos.SQL.Add(' Dbcreceberparc.CodCli, Dbcreceberparc.NumNota, Dbcreceberparc.DtGerado, ');
  qBoletos.SQL.Add(' Dbcliente.Nome, Dbcliente.Endereco||'', ''||Dbcliente.NumEnd as Endereco, Dbcliente.Bairro, Dbcliente.Uf, Dbcliente.Cep, Dbcliente.Pessoa, Dbcliente.CgcCpf, ');
  qBoletos.SQL.Add(' Dbcliente.InscrEst, Dbcliente.EndPgto, Dbcliente.BairroPgto, Dbcliente.CepPgto, Dbcliente.UfPgto, Dbcliente.CodCidade, ');
  qBoletos.SQL.Add(' Dbcliente.CodCidadeP, Dbcreceberparc.ArqGerado, Dbcreceberparc.NumTitBanco, dbCReceberParc.NumSeqNossoNum, ');
  qBoletos.SQL.Add(' dbCliente.Email, dbCReceberParc.NumCarteira, dbCReceberParc.Filial, Dbcreceberparc.RestParcela, Dbcreceberparc.CodBancoBoleto, ');
  qBoletos.SQL.Add(' dbCliente.ComplEndereco, dbCReceberParc.Serie, dbCReceberParc.NumSeqNota, dbCReceberParc.IDCobEletronica ');
  qBoletos.SQL.Add('FROM "DBCRECEBERPARC.DB" Dbcreceberparc');
  qBoletos.SQL.Add('   INNER JOIN "dbCliente.DB" Dbcliente');
  qBoletos.SQL.Add('   ON  (Dbcreceberparc.CodCli = Dbcliente.Codigo)');
  qBoletos.SQL.Add('WHERE ((Dbcreceberparc.cancelado = False) OR (Dbcreceberparc.Cancelado IS NULL))');
  qBoletos.SQL.Add('  AND ((Dbcreceberparc.Transferencia = False) OR (Dbcreceberparc.Transferencia IS NULL))');
  qBoletos.SQL.Add('  AND (Dbcreceberparc.DtGerado BETWEEN :D1 AND :D2)');
  qBoletos.SQL.Add('  AND (Dbcreceberparc.RestParcela > 0)');
  if ComboBox1.ItemIndex = 0 then
  begin
    //qBoletos.SQL.Add('  AND ((Dbcreceberparc.NumTitBanco is null) or (Dbcreceberparc.NumTitBanco = ' + QuotedStr('') +') or (Dbcreceberparc.ArqGerado = False))');
    //qBoletos.SQL.Add('  AND (Dbcreceberparc.ArqGerado = False)');
    qBoletos.SQL.Add('  AND (Dbcreceberparc.IDCobEletronica = 0)');
  end
  else
  if ComboBox1.ItemIndex = 1 then
  begin
    qBoletos.SQL.Add('  AND ((Dbcreceberparc.NumTitBanco not is null) or (Dbcreceberparc.NumTitBanco <> ' + QuotedStr('') +'))');
    qBoletos.SQL.Add('  AND (Dbcreceberparc.ArqGerado = False)');
    qBoletos.SQL.Add('  AND (Dbcreceberparc.IDCobEletronica = 0)');
  end;

  qBoletos.SQL.Add('  AND (Dbcreceberparc.Filial = :Filial)');
  qBoletos.ParamByName('Filial').AsInteger := vFilialCob;

  if ComboBox2.ItemIndex = 1 then
  begin
    qBoletos.SQL.Add('  AND ((Dbcreceberparc.CodBancoBoleto = :CodConta)');
    qBoletos.SQL.Add('  OR   ((Dbcreceberparc.CodBancoBoleto = 0) or (Dbcreceberparc.CodBancoBoleto is Null))) ');
    qBoletos.ParamByName('CodConta').AsInteger := vCodBanco
  end;
  qBoletos.ParamByName('D1').AsDate  := vDtInicialCob;
  qBoletos.ParamByName('D2').AsDate  := vDtFinalCob;
  qBoletos.SQL.Add('ORDER BY Dbcreceberparc.DtGerado, Dbcreceberparc.NumCReceber, Dbcreceberparc.ParcCReceber, Dbcreceberparc.DtVencCReceber');
  qBoletos.Open;
end;

procedure TfCobEletronicaBusca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qBoletos.Close;
  Action := Cafree;
end;

procedure TfCobEletronicaBusca.BitBtn1Click(Sender: TObject);
begin
  SMDBGrid1.UnSelectAllClick(Self);
  Screen.Cursor   := crHourGlass;
  mTitulos.EmptyDataSet;
  Monta_SQLqBoletos(0);
  Monta_MBoleto;
  Screen.Cursor := crDefault;
end;

procedure TfCobEletronicaBusca.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if mTitulosArqGerado.AsBoolean then
    begin
      Background  := clGreen;
      AFont.Color := clWhite;
    end;
end;

procedure TfCobEletronicaBusca.BitBtn4Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  DMCobEletronica.cdsCobEletronica_Nota.First;
  DMCobEletronica.cdsCobEletronica_Nota.Last;
  vItemAux := DMCobEletronica.cdsCobEletronica_NotaITEM.AsInteger;

  vVlrTitulos := StrToFloat(FormatFloat('0.00',DMCobEletronica.cdsCobEletronicaVLRTITULOS.AsFloat));
  vQtdTitulos := DMCobEletronica.cdsCobEletronicaQTDTITULOS.AsInteger;

  mTitulos.First;
  while not mTitulos.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
    begin
      vQtdTitulos := vQtdTitulos + 1;
      vVlrTitulos := vVlrTitulos + StrToFloat(FormatFloat('0.00',mTitulosVlrParcela.AsFloat));

      vItemAux := vItemAux + 1;
      DMCobEletronica.cdsCobEletronica_Nota.Insert;
      DMCobEletronica.cdsCobEletronica_NotaID.AsInteger            := DMCobEletronica.cdsCobEletronicaID.AsInteger;
      DMCobEletronica.cdsCobEletronica_NotaITEM.AsInteger          := vItemAux;
      DMCobEletronica.cdsCobEletronica_NotaNUMNOTA.AsInteger       := mTitulosNumNota.AsInteger;
      DMCobEletronica.cdsCobEletronica_NotaCODCLIENTE.AsInteger    := mTitulosCodCliente.AsInteger;
      DMCobEletronica.cdsCobEletronica_NotaSERIE.AsString          := mTitulosSerie.AsString;
      DMCobEletronica.cdsCobEletronica_NotaNUMSEQNOTA.AsInteger    := mTitulosNumSeqNota.AsInteger;
      DMCobEletronica.cdsCobEletronica_NotaVLRTITULO.AsFloat       := StrToFloat(FormatFloat('0.00',mTitulosVlrParcela.AsFloat));
      DMCobEletronica.cdsCobEletronica_NotaDTVENCIMENTO.AsDateTime := mTitulosDtVencimento.AsDateTime;
      DMCobEletronica.cdsCobEletronica_NotaPROCESSO.AsString       := '';
      DMCobEletronica.cdsCobEletronica_NotaPARCELA.AsInteger       := mTitulosParcela.AsInteger;
      DMCobEletronica.cdsCobEletronica_NotaNumCReceber.AsInteger   := mTitulosNumCReceber.AsInteger;
      DMCobEletronica.cdsCobEletronica_NotaFILIAL.AsInteger        := mTitulosFilial.AsInteger;
      DMCobEletronica.cdsCobEletronica_NotaNOSSONUMERO.AsString    := mTitulosNossoNumero.AsString;
      DMCobEletronica.cdsCobEletronica_NotaNOMECLIENTE.AsString    := mTitulosNomeCliente.AsString;
      DMCobEletronica.cdsCobEletronica_NotaCGCCPF.AsString         := mTitulosCgcCpf.AsString;
      DMCobEletronica.cdsCobEletronica_NotaPESSOA.AsString         := mTitulosPessoa.AsString;
      dmCobEletronica.cdsCobEletronica_NotaDTEMISSAO.AsDateTime    := mTitulosDtEmissao.AsDateTime;
      if Trim(mTitulosNumCarteira.AsString) <> '' then
        DMCobEletronica.cdsCobEletronica_NotaNUMCARTEIRA.AsString  := Trim(mTitulosNumCarteira.AsString);
      if DM1.tContasCNAB.AsString = 'ITAU400' then
      begin
        if Trim(DMCobEletronica.cdsCobEletronica_NotaNUMCARTEIRA.AsString) = '' then
          DMCobEletronica.cdsCobEletronica_NotaNUMCARTEIRA.AsString  := DMBanco.tBcoItauNumCarteira.AsString;
        DMCobEletronica.cdsCobEletronica_NotaACEITE.AsString       := DMBanco.tBcoBrasilAceite.AsString;
        DMCobEletronica.cdsCobEletronica_NotaESPECIEDOC.AsString   := DMBanco.tBcoItauEspecieDoc.AsString;
      end
      else
      if Copy(DM1.tContasCNAB.AsString,1,6) = 'BRASIL' then
      begin
        if Trim(DMCobEletronica.cdsCobEletronica_NotaNUMCARTEIRA.AsString) = '' then
          DMCobEletronica.cdsCobEletronica_NotaNUMCARTEIRA.AsString  := DMBanco.tBcoBrasilNumCarteira.AsString;
        DMCobEletronica.cdsCobEletronica_NotaACEITE.AsString       := DMBanco.tBcoBrasilAceite.AsString;
        DMCobEletronica.cdsCobEletronica_NotaESPECIEDOC.AsString   := DMBanco.tBcoItauEspecieDoc.AsString;
      end
      else
      if DM1.tContasCNAB.AsString = 'CAIXA400' then
      begin
        if Trim(DMCobEletronica.cdsCobEletronica_NotaNUMCARTEIRA.AsString) = '' then
          DMCobEletronica.cdsCobEletronica_NotaNUMCARTEIRA.AsString  := DMBanco.tBcoCaixaNumCarteira.AsString;
        DMCobEletronica.cdsCobEletronica_NotaACEITE.AsString       := DMBanco.tBcoCaixaAceite.AsString;
        DMCobEletronica.cdsCobEletronica_NotaESPECIEDOC.AsString   := DMBanco.tBcoCaixaEspecieDoc.AsString;
      end
      else
      if DM1.tContasCNAB.AsString = 'SANTANDER240' then
      begin
        if Trim(DMCobEletronica.cdsCobEletronica_NotaNUMCARTEIRA.AsString) = '' then
          DMCobEletronica.cdsCobEletronica_NotaNUMCARTEIRA.AsString := DMBanco.tBcoSantanderNumCarteira.AsString;
        DMCobEletronica.cdsCobEletronica_NotaACEITE.AsString     := DMBanco.tBcoSantanderAceite.AsString;
        DMCobEletronica.cdsCobEletronica_NotaESPECIEDOC.AsString := DMBanco.tBcoSantanderEspecieDoc.AsString;
      end;
      DMCobEletronica.cdsCobEletronica_Nota.Post;

      if fCobEletronicaC.fnc_Posiciona_CReceber(DMCobEletronica.cdsCobEletronica_NotaFILIAL.AsInteger,DMCobEletronica.cdsCobEletronica_NotaNUMNOTA.AsInteger,
                                              DMCobEletronica.cdsCobEletronica_NotaParcela.AsInteger,DMCobEletronica.cdsCobEletronica_NotaNUMCRECEBER.AsInteger,DMCobEletronica.cdsCobEletronica_NotaSERIE.AsString) then
        fCobEletronica.Gravar_tCReceberParc;
    end;
    mTitulos.Next;
  end;

  DMCobEletronica.cdsCobEletronicaVLRTITULOS.AsFloat   := StrToFloat(FormatFloat('0.00',vVlrTitulos));
  DMCobEletronica.cdsCobEletronicaQTDTITULOS.AsInteger := vQtdTitulos;

  DMCobEletronica.cdsCobEletronica.Post;
  DMCobEletronica.cdsCobEletronica.ApplyUpdates(0);

  DMCobEletronica.cdsCobEletronica.Edit;

  Close;
end;

end.

