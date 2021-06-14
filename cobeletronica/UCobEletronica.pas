unit UCobEletronica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Mask,
  DBCtrls, RxLookup, ToolEdit, RXDBCtrl, Grids, DBGrids, SMDBGrid, RLSaveDialog, RLFilters, RLPDFFilter, RLBoleto,
  ACBrBoleto, ACBrBoletoFCFortesFr, ACBrBase, DateUtils;

type
  TfCobEletronica = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label6: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label7: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label8: TLabel;
    DBDateEdit2: TDBDateEdit;
    SMDBGrid1: TSMDBGrid;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    Label10: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    Label11: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    BitBtn6: TBitBtn;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn7: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure RxDBLookupCombo2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    vVlrTitulos: Real;
    vQtdTitulos: Integer;
    vACBR: Boolean;
    procedure Le_Titulos;
    procedure Tela_CNAB(Codigo: Integer);
    procedure Grava_Cobranca;

    procedure Posiciona_FilialConta;

    procedure Abrir_Banco_CNAB;
    procedure prc_ImprimeACBR;
  public
    { Public declarations }
    procedure Gravar_tCReceberParc;
  end;

var
  fCobEletronica: TfCobEletronica;

implementation

uses UDMCobEletronica, UDM1, UCobEletronicaBusca, UCobEletronicaC, DB, UEnviarBanco, UBcoBrasil, UBcoItau, UCobEletronicaImp,
  UDMBanco, UDMBanco_CNAB, UBcoCaixa, UBcoSantander;

{$R *.dfm}

procedure TfCobEletronica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMCobEletronica.cdsCobEletronica.State in [dsEdit,dsInsert] then
    DMCobEletronica.cdsCobEletronica.CancelUpdates;
  Action := Cafree;
end;

procedure TfCobEletronica.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a inclusão/alteração?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  Close;
end;

procedure TfCobEletronica.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tContas.IndexFieldNames := 'NomeConta';
  vACBR := False;
end;

procedure TfCobEletronica.BitBtn3Click(Sender: TObject);
begin
  if (DMCobEletronica.cdsCobEletronicaDTINICIAL.AsDateTime < 10) or (DMCobEletronica.cdsCobEletronicaDTFINAL.AsDateTime < 10) then
  begin
    ShowMessage('É obrigatório informar o período!');
    exit;
  end;
  if (DMCobEletronica.cdsCobEletronicaDTINICIAL.AsDateTime > DMCobEletronica.cdsCobEletronicaDTFINAL.AsDateTime) then
  begin
    ShowMessage('Data inicial maior que a data final!');
    exit;
  end;
  if (DMCobEletronica.cdsCobEletronicaCODBANCO.AsInteger < 1) and (DMCobEletronica.cdsCobEletronicaFILIAL.AsInteger < 1) then
  begin
    ShowMessage('Banco ou Filial não foram informados!');
    exit;
  end;

  fCobEletronicaBusca := TfCobEletronicaBusca.Create(Self);
  fCobEletronicaBusca.vCodBanco     := DMCobEletronica.cdsCobEletronicaCODBANCO.AsInteger;
  fCobEletronicaBusca.vFilialCob    := DMCobEletronica.cdsCobEletronicaFILIAL.AsInteger;
  fCobEletronicaBusca.vDtInicialCob := DMCobEletronica.cdsCobEletronicaDTINICIAL.AsDateTime;
  fCobEletronicaBusca.vDtFinalCob   := DMCobEletronica.cdsCobEletronicaDTFINAL.AsDateTime;
  fCobEletronicaBusca.ShowModal;
end;

procedure TfCobEletronica.BitBtn1Click(Sender: TObject);
begin
  Grava_Cobranca;

  DMCobEletronica.cdsCobEletronica.ApplyUpdates(0);

  Close;
end;

procedure TfCobEletronica.Le_Titulos;
begin
  vVlrTitulos := 0;
  vQtdTitulos := 0;
  DMCobEletronica.cdsCobEletronica_Nota.First;
  while not DMCobEletronica.cdsCobEletronica_Nota.Eof do
  begin
    DMCobEletronica.cdsCobEletronica_Nota.Edit;
    if fCobEletronicaC.fnc_Posiciona_CReceber(DMCobEletronica.cdsCobEletronica_NotaFILIAL.AsInteger,DMCobEletronica.cdsCobEletronica_NotaNUMNOTA.AsInteger,
                                              DMCobEletronica.cdsCobEletronica_NotaParcela.AsInteger,DMCobEletronica.cdsCobEletronica_NotaNUMCRECEBER.AsInteger,DMCobEletronica.cdsCobEletronica_NotaSERIE.AsString) then
    begin
      Gravar_tCReceberParc;

      DMCobEletronica.cdsCobEletronica_NotaPROCESSO.AsString := 'S';

      vVlrTitulos := vVlrTitulos + StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat));
      vQtdTitulos := vQtdTitulos + 1;
    end
    else
      DMCobEletronica.cdsCobEletronica_NotaPROCESSO.AsString := 'N';
    DMCobEletronica.cdsCobEletronica_Nota.Post;

    DMCobEletronica.cdsCobEletronica_Nota.Next;
  end;
end;

procedure TfCobEletronica.BitBtn4Click(Sender: TObject);
var
  vFilialAux, vNumNotaAux, vParcelaAux, vNumCReceberAux : Integer;
  vSerieAux : String;
begin
  if MessageDlg('Deseja excluir o título selecionado?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  vFilialAux      := DMCobEletronica.cdsCobEletronicaFILIAL.AsInteger;
  vNumNotaAux     := DMCobEletronica.cdsCobEletronica_NotaNUMNOTA.AsInteger;
  vParcelaAux     := DMCobEletronica.cdsCobEletronica_NotaParcela.AsInteger;
  vSerieAux       := DMCobEletronica.cdsCobEletronica_NotaSERIE.AsString;
  vNumCReceberAux := DMCobEletronica.cdsCobEletronica_NotaNUMCRECEBER.AsInteger;

  DMCobEletronica.cdsCobEletronicaVLRTITULOS.AsFloat   := StrToFloat(FormatFloat('0.00',DMCobEletronica.cdsCobEletronicaVLRTITULOS.AsFloat - DMCobEletronica.cdsCobEletronica_NotaVLRTITULO.AsFloat));
  DMCobEletronica.cdsCobEletronicaQTDTITULOS.AsInteger := DMCobEletronica.cdsCobEletronicaQTDTITULOS.AsInteger - 1;

  DMCobEletronica.cdsCobEletronica_Nota.Delete;
  DMCobEletronica.cdsCobEletronica_Nota.ApplyUpdates(0);

  if fCobEletronicaC.fnc_Posiciona_CReceber(vFilialAux,vNumNotaAux,vParcelaAux,vNumCReceberAux,vSerieAux) then
    fCobEletronicaC.prc_Ajustar_CReceber;
  
  DMCobEletronica.cdsCobEletronica.Edit;
end;

procedure TfCobEletronica.BitBtn5Click(Sender: TObject);
begin
  DMCobEletronica.tFilial.IndexFieldNames := 'Codigo';
  DMCobEletronica.tFilial.FindKey([DMCobEletronica.cdsCobEletronicaFILIAL.AsInteger]);

  dmCobEletronica.tContas.IndexFieldNames := 'CodConta';
  DMCobEletronica.tContas.FindKey([DMCobEletronica.cdsCobEletronicaCODBANCO.AsInteger]);

  if (copy(DMCobEletronica.tContasCNAB.AsString,1,9) = 'SANTANDER') then
    DMCobEletronica.tBcoSantander.Open;

  RxDBLookupCombo1Exit(Sender);
  if vAcbr then
  begin
    dmCobEletronica.geraCabecalhoAcbr;
    Abrir_Banco_CNAB;
  end;

  Grava_Cobranca;

  if not DMCobEletronica.cdsCobEletronica_Nota.IsEmpty then
  begin
    fEnviarBanco := TfEnviarBanco.Create(Self);
    fEnviarBanco.vACBR := vACBR;
    fEnviarBanco.ShowModal;
  end;
end;

procedure TfCobEletronica.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if (RxDBLookupCombo2.Text = '') and (DM1.tContasFilial.AsInteger > 0) then
    DMCobEletronica.cdsCobEletronicaFILIAL.AsInteger := DM1.tContasFilial.AsInteger;
  if (RxDBLookupCombo3.Text = '') and (DM1.tContasCodTipoCobranca.AsInteger > 0) then
    DMCobEletronica.cdsCobEletronicaCODTIPOCOBRANCA.AsInteger := DM1.tContasCodTipoCobranca.AsInteger;

  if not dmCobEletronica.tContas.Active then
    dmCobEletronica.tContas.Open;
  dmCobEletronica.tContas.IndexFieldNames := 'CODCONTA';
  dmCobEletronica.tContas.FindKey([dm1.tContasCodConta.AsInteger]);

  if not (dmCobEletronica.tContasACBR_TIPOCOBRANCA.IsNull) then
  begin
    dm1.tFilial.IndexFieldNames := 'Codigo';
    dm1.tFilial.FindKey([DMCobEletronica.cdsCobEletronicaFILIAL.AsInteger]);

    vACBR := not (dmCobEletronica.tContasACBR_TIPOCOBRANCA.IsNull);
    DmCobEletronica.prc_ConfiguraACBR;
  end;
end;

procedure TfCobEletronica.Tela_CNAB(Codigo: Integer);
begin
  //Nesta nova cobrança só foi feito do Banco do Brasil
  DM1.tContas.IndexFieldNames := 'CodConta';
  if DM1.tContas.FindKey([Codigo]) then
  begin
    if DM1.tContasCNAB.AsString = 'ITAU400' then
    begin
      fBcoItau := TfBcoItau.Create(Self);
      fBcoItau.BitBtn4.Enabled := False;
      fBcoItau.ShowModal;
    end
    else
    {if DM1.tContasCNAB.AsString = 'REAL400' then
    begin
      fBcoReal := TfBcoReal.Create(Self);
      fBcoReal.ShowModal;
    end}
    //else
    if (DM1.tContasCNAB.AsString = 'BRASIL400') or (DM1.tContasCNAB.AsString = 'BRASIL400-6') then
    begin
      fBcoBrasil := TfBcoBrasil.Create(Self);
      fBcoBrasil.BitBtn4.Enabled := False;
      fBcoBrasil.ShowModal;
    end
    else
    if (DM1.tContasCNAB.AsString = 'CAIXA400') then
    begin
      fBcoCaixa := TfBcoCaixa.Create(Self);
      fBcoCaixa.BitBtn4.Enabled := False;
      fBcoCaixa.ShowModal;
    end
    else
    if (DM1.tContasCNAB.AsString = 'SANTANDER240') then
    begin
      fBcoSantander := fBcoSantander.Create(Self);
      fBcoSantander.BitBtn4.Enabled := False;
      fBcoSantander.ShowModal;
    end;
  end;
end;

procedure TfCobEletronica.BitBtn6Click(Sender: TObject);
begin
  if DMCobEletronica.cdsCobEletronicaCODBANCO.AsInteger < 1 then
    ShowMessage('Primeiro selecionar um banco!')
  else
    Tela_CNAB(DMCobEletronica.cdsCobEletronicaCODBANCO.AsInteger);
end;

procedure TfCobEletronica.Grava_Cobranca;
begin
  if DMCobEletronica.cdsCobEletronica_Nota.IsEmpty then
  begin
    ShowMessage('Títulos não informados!');
    exit;
  end;

  DM1.tContas.IndexFieldNames := 'CodConta';
  DM1.tContas.FindKey([DMCobEletronica.cdsCobEletronicaCODBANCO.AsInteger]);

  try
    if DMCobEletronica.cdsCobEletronica.State in [dsEdit,dsInsert] then
    begin
      if DMCobEletronica.cdsCobEletronicaCODTIPOCOBRANCA.AsInteger < 1 then
        DMCobEletronica.cdsCobEletronicaCODTIPOCOBRANCA.AsInteger := DM1.tContasCodTipoCobranca.AsInteger;

      //DMCobEletronica.cdsCobEletronica.Post;
    end;
    //DMCobEletronica.cdsCobEletronica.ApplyUpdates(0);

    Le_Titulos;

    if DMCobEletronica.cdsCobEletronica.State in [dsBrowse] then
      DMCobEletronica.cdsCobEletronica.Edit;
    DMCobEletronica.cdsCobEletronicaVLRTITULOS.AsFloat := StrToFloat(FormatFloat('0.00',vVlrTitulos));
    DMCobEletronica.cdsCobEletronica.Post;
    //DMCobEletronica.cdsCobEletronica.ApplyUpdates(0);

  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível gravar a cobrança, ' + E.Message + '!');
    end;
  end;
end;

procedure TfCobEletronica.Posiciona_FilialConta;
begin
  DM1.tContas.IndexFieldNames := 'CodConta';
  DM1.tFilial.IndexFieldNames := 'Codigo';
  DM1.tCidade.IndexFieldNames := 'Codigo';

  if not DM1.tFilial.FindKey([DMCobEletronica.cdsCobEletronicaFILIAL.AsInteger]) then
    ShowMessage('Filial não encontrada!');

  if not DM1.tContas.FindKey([DMCobEletronica.cdsCobEletronicaCODBANCO.AsInteger]) then
    ShowMessage('Conta Não Cadastrada!');
end;

procedure TfCobEletronica.BitBtn7Click(Sender: TObject);
begin
  dm1.tFilial.IndexFieldNames := 'Codigo';
  dm1.tFilial.FindKey([DMCobEletronica.cdsCobEletronicaFILIAL.AsInteger]);
  RxDBLookupCombo1Exit(Sender);
  Posiciona_FilialConta;

  fCobEletronicaImp := TfCobEletronicaImp.Create(Self);
  fCobEletronicaImp.vACBR := vACBR;
  fCobEletronicaImp.vCodFilial := RxDBLookupCombo2.KeyValue;
  fCobEletronicaImp.vCodBanco  := RxDBLookupCombo1.KeyValue;

  DM1.tContas.Locate('CodConta',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);

  if (copy(DMCobEletronica.tContasCNAB.AsString,1,9) = 'SANTANDER') then
    DMCobEletronica.tBcoSantander.Open;

  fCobEletronicaImp.Tag := 0;
  fCobEletronicaImp.mBoletos.EmptyDataSet;

  DMCobEletronica.cdsCobEletronica_Nota.First;
  while not DMCobEletronica.cdsCobEletronica_Nota.Eof do
  begin
    fCobEletronicaImp.Grava_mBoletos(DMCobEletronica.cdsCobEletronicaFILIAL.AsInteger,DMCobEletronica.cdsCobEletronica_NotaNUMNOTA.AsInteger,
                                     DMCobEletronica.cdsCobEletronica_NotaPARCELA.AsInteger,DMCobEletronica.cdsCobEletronica_NotaNUMCRECEBER.AsInteger,
                                     DMCobEletronica.cdsCobEletronica_NotaSERIE.AsString,'C');
    if fCobEletronicaImp.mBoletosNossoNumero.AsString <> DMCobEletronica.cdsCobEletronica_NotaNOSSONUMERO.AsString then
    begin
      DMCobEletronica.cdsCobEletronica_Nota.Edit;
      DMCobEletronica.cdsCobEletronica_NotaNOSSONUMERO.AsString := fCobEletronicaImp.mBoletosNossoNumero.AsString;
      DMCobEletronica.cdsCobEletronica_Nota.Post;
    end;

    DMCobEletronica.cdsCobEletronica_Nota.Next;
  end;
  fCobEletronicaImp.ShowModal;
  fCobEletronicaImp.Free;

  if DMCobEletronica.cdsCobEletronica.State in [dsEdit,dsInsert] then
    DMCobEletronica.cdsCobEletronica.Post;
  DMCobEletronica.cdsCobEletronica.ApplyUpdates(0);
  DMCobEletronica.cdsCobEletronica.Edit;
end;

procedure TfCobEletronica.Gravar_tCReceberParc;
begin
  DM1.tCReceberParc.Edit;
  DM1.tCReceberParcIDCobEletronica.AsInteger := DMCobEletronica.cdsCobEletronicaID.AsInteger;
  DM1.tCReceberParcCodTipoCobranca.AsInteger := DMCobEletronica.cdsCobEletronicaCODTIPOCOBRANCA.AsInteger;
  DM1.tCReceberParcCodBancoBoleto.AsInteger  := DMCobEletronica.cdsCobEletronicaCODBANCO.AsInteger;
  DM1.tCReceberParcAceite.AsString           := DMCobEletronica.cdsCobEletronica_NotaACEITE.AsString;
  DM1.tCReceberParcNumCarteira.AsString      := DMCobEletronica.cdsCobEletronica_NotaNUMCARTEIRA.AsString;
  DM1.tCReceberParcEspecieDoc.AsString       := DMCobEletronica.cdsCobEletronica_NotaESPECIEDOC.AsString;
  DM1.tCReceberParcNumTitBanco.AsString      := DMCobEletronica.cdsCobEletronica_NotaNOSSONUMERO.AsString;
  DM1.tCReceberParcArqGerado.AsBoolean       := True;
  DM1.tCReceberParc.Post;
end;

procedure TfCobEletronica.Abrir_Banco_CNAB;
begin
  DMBanco_CNAB.cdsBanco_CNAB.Close;
  DMBanco_CNAB.sdsBanco_CNAB.CommandText := ctBanco_CNAB + ' WHERE CODCONTA = ' + DM1.tContasCodConta.AsString;
  DMBanco_CNAB.cdsBanco_CNAB.Open;
end;

procedure TfCobEletronica.prc_ImprimeACBR;
begin
  DMCobEletronica.ACBrBoleto1.ListadeBoletos.Clear;
  DMCobEletronica.buscaNossoNumero;
  DMCobEletronica.tCReceberParc.First;
  while not DMCobEletronica.tCReceberParc.Eof do
  begin
    if not SMDBGrid1.SelectedRows.CurrentRowSelected then
    begin
      DMCobEletronica.tCReceberParc.Next;
      Continue;
    end;
    dmCobEletronica.geraCabecalhoAcbr;

{    DMCobEletronica.vNossoNumero := dmCobEletronica.geraRegistroAcbr(mBoletosDtVencimento.AsDateTime,mBoletosDtEmissao.AsDateTime,
                                                                     mBoletosNumNota.AsString,'1',
                                                                     mBoletosNomeCliente.AsString,
                                                                     mBoletosCNPJCPF.AsString,mBoletosEndereco.AsString,'',
                                                                     mBoletosBairro.AsString,mBoletosCidade.AsString,
                                                                     mBoletosUf.AsSTring,mBoletosCEP.ASString,mBoletosPessoa.AsString,
                                                                     'N',mBoletosVlrParcela.AsCurrency,mBoletosNossoNumero.AsInteger,
                                                                     mBoletosParcela.AsInteger,mBoletosCodConta.AsInteger);
}    DMCobEletronica.prc_Gravar_Duplicata('I');

    DMCobEletronica.tCReceberParc.Next;
  end;

  try
// Atualiza a nosso numero no cadastro do banco
    DMCobEletronica.cdsContas_calculo.Edit;
    DMCobEletronica.cdsContas_calculoSEQ_NOSSONUMERO.AsInteger := DMCobEletronica.xNossoNum;
    DMCobEletronica.cdsContas_calculo.Post;
    DMCobEletronica.cdsContas_calculo.ApplyUpdates(0);

    dmCobEletronica.ACBrBoleto1.Imprimir;
//    ACBrBoleto1.GerarPDF;
  except
    MessageDlg('Erro ao imprimir os boletos. Verifique!',mtWarning,[mbOK],0);
  end;
end;

procedure TfCobEletronica.RxDBLookupCombo2Change(Sender: TObject);
begin
  if not dmCobEletronica.tFilial.Active then
    dmCobEletronica.tFilial.Open;
  dmCobEletronica.tFilial.IndexFieldNames := 'CODIGO';
  dmCobEletronica.tFilial.FindKey([dm1.tFilialCodigo.AsInteger]);
end;

procedure TfCobEletronica.FormShow(Sender: TObject);
begin
  dmCobEletronica.tFilial.Open;
  dmCobEletronica.tContas.Open;
  if not DM1.tContas.Active then
    DM1.tContas.Open;
  if not DM1.tTipoCobranca.Active then
    DM1.tTipoCobranca.Open;
  if not DM1.tFilial.Active then
    DM1.tFilial.Open;
end;

end.
