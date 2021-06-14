unit UEnviarBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons,
  Grids, DBGrids, RXDBCtrl, DBTables, DB, MemTable, RLBoleto, FMTBcd, SqlExpr;

type
  TfEnviarBanco = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    msBoletos: TDataSource;
    StaticText1: TStaticText;
    mBoletos: TMemoryTable;
    mBoletosNumCReceber: TIntegerField;
    mBoletosParcela: TIntegerField;
    mBoletosNumNota: TIntegerField;
    mBoletosVlrParcela: TFloatField;
    mBoletosPessoa: TStringField;
    mBoletosCNPJCPF: TStringField;
    mBoletosEndereco: TStringField;
    mBoletosBairro: TStringField;
    mBoletosCep: TStringField;
    mBoletosCidade: TStringField;
    mBoletosUf: TStringField;
    mBoletosArqGerado: TBooleanField;
    mBoletosCliente: TStringField;
    mBoletosNossoNumero: TStringField;
    mBoletosInstrucao: TStringField;
    mBoletosTaxaMulta: TFloatField;
    mBoletosEspecieDoc: TStringField;
    mBoletosAceite: TStringField;
    mBoletosDiasProtesto: TIntegerField;
    mBoletosVlrJurosPorDia: TFloatField;
    mBoletosVlrDesconto: TFloatField;
    mBoletosVlrAbatimento: TFloatField;
    mBoletosCpfCnpjAvalista: TStringField;
    mBoletosNomeAvalista: TStringField;
    mBoletosEndAvalista: TStringField;
    mBoletosCidAvalista: TStringField;
    mBoletosCepAvalista: TStringField;
    mBoletosUFAvalista: TStringField;
    mBoletosDtGerado: TStringField;
    mBoletosDtVencto: TStringField;
    mBoletosDtLimiteDesc: TStringField;
    mBoletosImpBoleto: TStringField;
    mBoletosCnpjCpfEditado: TStringField;
    mBoletosNumCarteira: TStringField;
    mBoletosBairroAvalista: TStringField;
    tCReceberParcRem2: TTable;
    tCReceberParcRem2Filial: TIntegerField;
    tCReceberParcRem2NumCReceber: TIntegerField;
    tCReceberParcRem2ParcCReceber: TIntegerField;
    tCReceberParcRem2ItemHist: TIntegerField;
    tCReceberParcRem2ItemRem: TIntegerField;
    tCReceberParcRem2CodConta: TIntegerField;
    tCReceberParcRem2Instrucao: TStringField;
    tCReceberParcRem2CampoAlterado: TStringField;
    tCReceberParcRem2EspDoc: TStringField;
    tCReceberParcRem2CodAceite: TStringField;
    tCReceberParcRem2InstProtesto: TStringField;
    tCReceberParcRem2DiasProtesto: TIntegerField;
    tCReceberParcRem2TaxaMulta: TFloatField;
    tCReceberParcRem2TipoJuros: TStringField;
    tCReceberParcRem2VlrJuros: TFloatField;
    tCReceberParcRem2TipoDesconto: TStringField;
    tCReceberParcRem2VlrDesconto: TFloatField;
    tCReceberParcRem2DtLimiteDesconto: TStringField;
    tCReceberParcRem2VlrDescAntecipacao: TFloatField;
    tCReceberParcRem2VlrAbatimento: TFloatField;
    tCReceberParcRem2Avalista: TStringField;
    tCReceberParcRem2CnpjAvalista: TStringField;
    tCReceberParcRem2DtVecto: TStringField;
    tCReceberParcRem2CodCedente: TStringField;
    tCReceberParcRem2CepAvalista: TStringField;
    tCReceberParcRem2EndAvalista: TStringField;
    tCReceberParcRem2CidAvalista: TStringField;
    tCReceberParcRem2UFAvalista: TStringField;
    tCReceberParcRem2ImpBoleto: TStringField;
    tCReceberParcRem2InstrCobranca1: TStringField;
    tCReceberParcRem2InstrCobranca2: TStringField;
    tCReceberParcRem2NumCarteira: TStringField;
    tCReceberParcRem2BairroAvalista: TStringField;
    tCReceberParcRem2Email: TStringField;
    tCReceberParcRem2BoletoPorEmail: TBooleanField;
    tCReceberParcRem2NumTitBanco: TStringField;
    mBoletosTipoDocumento: TStringField;
    tCReceberParcRem2TipoDocumentoST: TStringField;
    tCReceberParcRem2CodCompensacaoST: TStringField;
    tCReceberParcRem2CodBaixaST: TStringField;
    tCReceberParcRem2CodProtestoST: TStringField;
    tCReceberParcRem2FormaCadastramentoST: TStringField;
    tCReceberParcRem2NumRemessaST: TIntegerField;
    tCReceberParcRem2CodTransmissaoST: TStringField;
    mBoletosVlrIOF: TFloatField;
    tCReceberParcRem2DiasBaixa: TIntegerField;
    tCReceberParcRem2VlrIOF: TFloatField;
    tCReceberParcRem2CodMulta: TStringField;
    tCReceberParcRem2DtMulta: TStringField;
    tCReceberParcRem2VlrMulta: TFloatField;
    tCReceberParcRem2TipoDesconto2: TStringField;
    tCReceberParcRem2DtLimiteDesconto2: TStringField;
    tCReceberParcRem2VlrDesconto2: TFloatField;
    mBoletosCodTransmissao: TStringField;
    tCReceberParcRem2IncidenciaMulta: TStringField;
    tCReceberParcRem2QtdDiasMulta: TIntegerField;
    CheckBox1: TCheckBox;
    mBoletosCodComando: TStringField;
    mBoletosInstrucao2: TStringField;
    mBoletosMoeda: TStringField;
    mBoletosEmail: TStringField;
    Label12: TLabel;
    mBoletosFilial: TIntegerField;
    mBoletosComplEndereco: TStringField;
    mBoletosCodCliente: TIntegerField;
    mBoletosSerie: TStringField;
    mBoletosInstrCobranca1: TStringField;
    mBoletosInstrCobranca2: TStringField;
    mBoletosTipoDesconto: TStringField;
    mBoletosTipoJuro: TStringField;
    mBoletosBoletoPorEmail: TBooleanField;
    mBoletosVlrTaxaBanco: TFloatField;
    RLBRemessa1: TRLBRemessa;
    RLBTitulo1: TRLBTitulo;
    mBoletosGeraNossoNumero: TStringField;
    qCarteira: TSQLQuery;
    qCarteiraCODCARTEIRA: TStringField;
    qCarteiraGERARNOSSONUMERO: TStringField;
    qCarteiraGERARREMESSA: TStringField;
    mBoletosGerarRemessa: TStringField;
    mBoletosMensagem: TStringField;
    mBoletosVlrJurosDia_Calculado: TFloatField;
    mBoletosCodConta: TIntegerField;
    mBoletosCodBanco: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure mBoletosNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure mBoletosBeforePost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    //vNossoNumero: String;
    procedure Habilita;

    procedure Le_Titulos;
    procedure Grava_mBoletos;
    procedure Grava_mBoletos_Brasil;
    procedure Grava_mBoletos_Itau400;
    procedure Grava_mBoletos_Caixa;
    procedure prc_Enviar_ACBR;

    procedure Abre_qCarteira(CodCarteira: String);

  public
    { Public declarations }
    vACBR: Boolean;
  end;

var
  fEnviarBanco: TfEnviarBanco;

implementation

uses UDM1, UCobBrasilAlt, UArqRetornoBrasil, UCobrancaEletronica, DateUtils, URelCobrancaEletronica, UDMCobEletronica,
  uUtilBanco, UDMBanco, UCobItauAlt, uUtilPadrao, DmdDatabase;

{$R *.DFM}

procedure TfEnviarBanco.Le_Titulos;
begin
  mBoletos.EmptyTable;
  DMCobEletronica.cdsCobEletronica_Nota.First;
  while not DMCobEletronica.cdsCobEletronica_Nota.Eof do
  begin
    if Posiciona_Titulo(DMCobEletronica.cdsCobEletronica_NotaCODCLIENTE.AsInteger,DMCobEletronica.cdsCobEletronica_NotaNUMNOTA.AsInteger,
                        DMCobEletronica.cdsCobEletronica_NotaPARCELA.AsInteger,DMCobEletronica.cdsCobEletronica_NotaNUMCRECEBER.AsInteger,
                        DMCobEletronica.cdsCobEletronica_NotaSERIE.AsString) then
    begin
      if DM1.tContasCNAB.AsString = 'ITAU400' then
        Grava_mBoletos_Itau400
      else
        Grava_mBoletos;
    end;

    DMCobEletronica.cdsCobEletronica_Nota.Edit;
    DMCobEletronica.cdsCobEletronica_NotaESPECIEDOC.AsString  := mBoletosEspecieDoc.AsString;
    DMCobEletronica.cdsCobEletronica_NotaACEITE.AsString      := mBoletosAceite.AsString;
    DMCobEletronica.cdsCobEletronica_NotaNUMCARTEIRA.AsString := mBoletosNumCarteira.AsString;
    DMCobEletronica.cdsCobEletronica_NotaNOSSONUMERO.AsString := mBoletosNossoNumero.AsString;
    DMCobEletronica.cdsCobEletronica_Nota.Post;

    DMCobEletronica.cdsCobEletronica_Nota.Next;
  end;
  //DMCobEletronica.cdsCobEletronica_Nota.ApplyUpdates(0);
end;

procedure TfEnviarBanco.Habilita;
begin
  BitBtn2.Enabled := not(BitBtn2.Enabled);
  BitBtn4.Enabled := not(BitBtn4.Enabled);
end;

procedure TfEnviarBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfEnviarBanco.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfEnviarBanco.BitBtn4Click(Sender: TObject);
begin
  if not mBoletos.IsEmpty then
  begin
    if MessageDlg('Deseja realmente excluir este título?', mtconfirmation, [mbok, mbno], 0) = mrok then
      mBoletos.Delete;
  end
  else
    ShowMessage('Não há título para ser excluído!');
end;

procedure TfEnviarBanco.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if mBoletosArqGerado.AsBoolean then
  begin
    Background  := clGreen;
    AFont.Color := clWhite;
  end;
end;

procedure TfEnviarBanco.BitBtn2Click(Sender: TObject);
begin
  vContadorReg := 0;
  vContadorTit := 0;
  DMCobEletronica.ACBrBoleto1.ListadeBoletos.Clear;
  
  if not mBoletos.IsEmpty then
  begin
    Screen.Cursor := crHourGlass;
    mBoletos.First;
    if vACBR then
    begin
      while not mBoletos.Eof do
      begin
        prc_Enviar_ACBR;
        mBoletos.Next;
      end;
      dmCobEletronica.ACBrBoleto1.GerarRemessa(DMCobEletronica.vNum_Remessa);
    end
    else
      prc_Enviar_RLBoleto;
      
    Screen.Cursor := crDefault;
    if vContadorTit > 0 then
    begin
      ShowMessage(IntToStr(vContadorTit) + ' registro(s) gerados(s) com sucesso!!!');
      Label12.Visible := True;
      Label12.Caption := 'Arq.Gerado: ' + vNomeArqRemessa;
      if DMCobEletronica.cdsCobEletronica.State in [dsBrowse] then
        DMCobEletronica.cdsCobEletronica.Edit;
      DMCobEletronica.cdsCobEletronicaNOMEARQUIVO.AsString := vNomeArqRemessa;
      //DMCobEletronica.cdsCobEletronica.Post;
    end;
  end
  else
    ShowMessage('Não há títulos selecionados para gerar arquivo!');
  Habilita;
  mBoletos.EmptyTable;
  Close;
End;

procedure TfEnviarBanco.RxDBGrid1DblClick(Sender: TObject);
begin
  if mBoletosNumNota.AsInteger > 0 then
  begin
    mBoletos.Edit;
    if DM1.tContasCNAB.AsString = 'ITAU400' then
    begin
      fCobItauAlt := TfCobItauAlt.Create(Self);
      fCobItauAlt.ShowModal;
    end
    else
    begin
      fCobBrasilAlt := TfCobBrasilAlt.Create(Self);
      fCobBrasilAlt.ShowModal;
    end;
  end;
end;

procedure TfEnviarBanco.mBoletosNewRecord(DataSet: TDataSet);
begin
  mBoletosNossoNumero.AsString      := '';
  mBoletosBoletoPorEmail.AsBoolean  := False;
  mBoletosGeraNossoNumero.AsString  := 'N';
  mBoletosGerarRemessa.AsString     := 'N';
end;

procedure TfEnviarBanco.FormShow(Sender: TObject);
begin
  mBoletos.Open;
  tCReceberParcRem2.Open;
  Caption := DM1.tContasNomeConta.AsString + ' (CNAB ' + DM1.tContasCNAB.AsString + ')';

  Le_Titulos;
end;

procedure TfEnviarBanco.Grava_mBoletos_Itau400;
begin
  mBoletos.Insert;
  mBoletosArqGerado.AsBoolean := DM1.tCReceberParcArqGerado.AsBoolean;
  mBoletosFilial.AsInteger    := DM1.tFilialCodigo.AsInteger;

  if DM1.tClienteEndPgto.AsString <> '' then
  begin
    Posiciona_Cidade(DM1.tClienteCodCidadeP.AsInteger);
    mBoletosBairro.AsString := Copy(DM1.tClienteBairroPgto.AsString, 1, 10);
    mBoletosCep.AsString := Monta_Numero(DM1.tClienteCepPgto.AsString,0);

    mBoletosCidade.AsString   := Copy(DM1.tCidadeNome.AsString, 1, 15);
    mBoletosEndereco.AsString := DM1.tClienteEndPgto.AsString;
    mBoletosUf.AsString       := DM1.tClienteUfPgto.AsString;
  end
  else
  begin
    Posiciona_Cidade(DM1.tClienteCodCidade.AsInteger);
    mBoletosBairro.AsString   := Copy(DM1.tClienteBairro.AsString, 1, 10);
    mBoletosCep.AsString      := Monta_Numero(DM1.tClienteCep.AsString,0);
    mBoletosCidade.AsString   := Copy(DM1.tCidadeNome.AsString, 1, 15);
    mBoletosEndereco.AsString := DM1.tClienteEndereco.AsString + ',' + DM1.tClienteNumEnd.AsString;
    if DM1.tClienteEndComplemento.AsString <> '' then
      mBoletosEndereco.AsString := mBoletosEndereco.AsString + '-' + DM1.tClienteEndComplemento.AsString;
    mBoletosUf.AsString := DM1.tClienteUf.AsString;
  end;

  mBoletosCliente.AsString        := DM1.tClienteNome.AsString;
  mBoletosCodCliente.AsInteger    := DM1.tClienteCodigo.AsInteger;
  mBoletosCnpjCpfEditado.AsString := DM1.tClienteCgcCpf.AsString;
  mBoletosEmail.AsString          := DM1.tClienteEmailCobranca.AsString;
  mBoletosCNPJCPF.AsString        := Monta_Numero(DM1.tClienteCgcCpf.AsString,0);
  if DM1.tClientePessoa.AsString = 'F' then
    mBoletosPessoa.AsString := '1'
  else
    mBoletosPessoa.AsString := '2';
  mBoletosDtGerado.AsString     := DM1.tCReceberParcDtGerado.AsString;
  mBoletosDtVencto.AsString     := DM1.tCReceberParcDtVencCReceber.AsString;
  mBoletosNumCReceber.AsInteger := DM1.tCReceberNumCReceber.AsInteger;
  if DM1.tCReceberParcNumNota.AsInteger > 0 then
    mBoletosNumNota.AsInteger := DM1.tCReceberParcNumNota.AsInteger;
  mBoletosParcela.AsInteger     := DM1.tCReceberParcParcCReceber.AsInteger;
  mBoletosSerie.AsString        := DM1.tCReceberParcSerie.AsString;
  mBoletosCodConta.AsInteger    := dm1.tCReceberParcCodConta.AsInteger;
  mBoletosVlrParcela.AsFloat    := DM1.tCReceberParcRestParcela.AsFloat;
  mBoletosNossoNumero.AsString  := DM1.tCReceberParcNumTitBanco.AsString;
  mBoletosNumCarteira.AsString  := DMBanco.tBcoItauNumCarteira.AsString;

  //Carteira
  Abre_qCarteira(DMBanco.tBcoItauNumCarteira.AsString);
  //*************

  mBoletosInstrucao.AsString     := DMBanco.tBcoItauInstrucao.AsString;
  mBoletosInstrucao2.AsString    := '';
  mBoletosInstrCobranca1.AsString := DMBanco.tBcoItauInstrCobranca1.AsString;
  mBoletosInstrCobranca2.AsString := DMBanco.tBcoItauInstrCobranca2.AsString;

  mBoletosTipoDesconto.AsString  := DMBanco.tBcoItauTipoDesconto.AsString;
  mBoletosTipoJuro.AsString      := DMBanco.tBcoItauTipoJuro.AsString;
  mBoletosTaxaMulta.AsFloat      := DMBanco.tBcoItauTaxaMulta.AsFloat;
  mBoletosEspecieDoc.AsString    := DMBanco.tBcoItauEspecieDoc.AsString;
  mBoletosAceite.AsString        := DMBanco.tBcoItauAceite.AsString;

  mBoletosDiasProtesto.AsInteger := DMBanco.tBcoItauDiasProtesto.AsInteger;
  mBoletosVlrJurosPorDia.AsFloat := DMBanco.tBcoItauVlrJurosPorDia.AsFloat;
  mBoletosVlrDesconto.AsFloat    := DMBanco.tBcoItauVlrDesconto.AsFloat;
  mBoletosImpBoleto.AsString     := '';
  mBoletosEmail.AsString         := DM1.tClienteEmailCobranca.AsString;
  mBoletosCodComando.AsString    := '';
  mBoletosMoeda.AsString         := '';

  if DM1.tContasFilial.AsInteger <> DM1.tFilialCodigo.AsInteger then
  begin
    if DM1.tFilial2.Locate('Codigo', DM1.tContasFilial.AsInteger, [loCaseInsensitive]) then
    begin
      mBoletosNomeAvalista.AsString    := DM1.tFilial2Empresa.AsString;
      mBoletosCpfCnpjAvalista.AsString := Monta_Numero(DM1.tFilial2CNPJ.AsString, 0);

      mBoletosBairroAvalista.AsString  := DM1.tFilial2Bairro.AsString;
      mBoletosCidAvalista.AsString     := DM1.tFilial2Cidade.AsString;
      mBoletosEndAvalista.AsString     := DM1.tFilial2Endereco.AsString;
      mBoletosCepAvalista.AsString     := Monta_Numero(DM1.tFilial2Cep.AsString, 0);
      mBoletosUFAvalista.AsString      := DM1.tFilial2Estado.AsString;
    end;
  end;

  if (tCReceberParcRem2.RecordCount > 0) and (tCReceberParcRem2CodConta.AsInteger = DM1.tContasCodConta.AsInteger) then
  begin
    tCReceberParcRem2.Last;
    mBoletosEmail.AsString           := tCReceberParcRem2Email.AsString;
    mBoletosBoletoPorEmail.AsBoolean := tCReceberParcRem2BoletoPorEmail.AsBoolean;
    if tCReceberParcRem2NumTitBanco.AsString <> '' then
      if mBoletosNossoNumero.AsString <> tCReceberParcRem2NumTitBanco.AsString then
        ShowMessage('Nosso número diferente na nota ' + mBoletosNumNota.AsString);
  end;
  mBoletos.Post;
end;

procedure TfEnviarBanco.Grava_mBoletos_Brasil;
begin
  mBoletosNumCarteira.AsString   := DMBanco.tBcoBrasilNumCarteira.AsString;
  mBoletosInstrucao.AsString     := DMBanco.tBcoBrasilInstrucao.AsString;
  mBoletosInstrucao2.AsString    := DMBanco.tBcoBrasilInstrucao2.AsString;
  mBoletosTipoDocumento.AsString := DMBanco.tBcoBrasilTipoDocumento.AsString;
  mBoletosEspecieDoc.AsString    := DMBanco.tBcoBrasilEspecieDoc.AsString;
  mBoletosAceite.AsString        := DMBanco.tBcoBrasilAceite.AsString;
  if (mBoletosInstrucao.AsString = '06') or (mBoletosInstrucao2.AsString = '06') then
    mBoletosDiasProtesto.AsInteger := DMBanco.tBcoBrasilDiasProtesto.AsInteger
  else
    mBoletosDiasProtesto.AsInteger := 0;
  mBoletosVlrJurosPorDia.AsFloat  := DMBanco.tBcoBrasilVlrJurosPorDia.AsFloat;
  mBoletosVlrDesconto.AsFloat     := DMBanco.tBcoBrasilVlrDesconto.AsFloat;
  mBoletosImpBoleto.AsString      := '';
  mBoletosCodTransmissao.AsString := DMBanco.tBcoBrasilCodTransmissao.AsString;
  mBoletosCodComando.AsString     := DMBanco.tBcoBrasilCodComando.AsString;
  mBoletosMoeda.AsString          := DMBanco.tBcoBrasilMoeda.AsString;

  //Carteira
  Abre_qCarteira(DMBanco.tBcoBrasilNumCarteira.AsString);
  //*************
end;

procedure TfEnviarBanco.Grava_mBoletos_Caixa;
begin
  mBoletosNumCarteira.AsString   := DMBanco.tBcoCaixaNumCarteira.AsString;
  mBoletosInstrucao.AsString     := DMBanco.tBcoCaixaInstrucao.AsString;
  mBoletosInstrucao2.AsString    := DMBanco.tBcoCaixaInstrucao2.AsString;
  mBoletosEspecieDoc.AsString    := DMBanco.tBcoCaixaEspecieDoc.AsString;
  mBoletosAceite.AsString        := DMBanco.tBcoCaixaAceite.AsString;
  if (mBoletosInstrucao.AsString = '01') or (mBoletosInstrucao2.AsString = '01') then
    mBoletosDiasProtesto.AsInteger := DMBanco.tBcoCaixaDiasProtesto.AsInteger
  else
    mBoletosDiasProtesto.AsInteger := 0;
  mBoletosVlrJurosPorDia.AsFloat := DMBanco.tBcoCaixaVlrJurosPorDia.AsFloat;
  mBoletosVlrDesconto.AsFloat    := DMBanco.tBcoBrasilVlrDesconto.AsFloat;
  mBoletosImpBoleto.AsString     := '';
  mBoletosCodComando.AsString    := DMBanco.tBcoCaixaCodComando.AsString;
  mBoletosMoeda.AsString         := DMBanco.tBcoCaixaMoeda.AsString;
  mBoletosMensagem.AsString      := DMBanco.tBcoCaixaMensagem1.AsString;

  //Carteira
  Abre_qCarteira(DMBanco.tBcoCaixaNumCarteira.AsString);
  //*************
end;

procedure TfEnviarBanco.Grava_mBoletos;
var
  vValor: Real;
begin
  mBoletos.Insert;
  mBoletosArqGerado.AsBoolean := DM1.tCReceberParcArqGerado.AsBoolean;
  mBoletosFilial.AsInteger    := DM1.tFilialCodigo.AsInteger;

  if DM1.tClienteEndPgto.AsString <> '' then
  begin
    Posiciona_Cidade(DM1.tClienteCodCidadeP.AsInteger);
    mBoletosBairro.AsString := Copy(DM1.tClienteBairroPgto.AsString, 1, 10);
    mBoletosCep.AsString := Monta_Numero(DM1.tClienteCepPgto.AsString,0);

    mBoletosCidade.AsString   := Copy(DM1.tCidadeNome.AsString, 1, 15);
    mBoletosEndereco.AsString := DM1.tClienteEndPgto.AsString;
    mBoletosUf.AsString       := DM1.tClienteUfPgto.AsString;
  end
  else
  begin
    Posiciona_Cidade(DM1.tClienteCodCidade.AsInteger);
    mBoletosBairro.AsString   := Copy(DM1.tClienteBairro.AsString, 1, 10);
    mBoletosCep.AsString      := Monta_Numero(DM1.tClienteCep.AsString,0);
    mBoletosCidade.AsString   := Copy(DM1.tCidadeNome.AsString, 1, 15);
    mBoletosEndereco.AsString := DM1.tClienteEndereco.AsString + ',' + DM1.tClienteNumEnd.AsString;
    if DM1.tClienteEndComplemento.AsString <> '' then
      mBoletosEndereco.AsString := mBoletosEndereco.AsString + '-' + DM1.tClienteEndComplemento.AsString;
    mBoletosUf.AsString := DM1.tClienteUf.AsString;
  end;
  mBoletosCliente.AsString        := DM1.tClienteNome.AsString;
  mBoletosCodCliente.AsInteger    := DM1.tClienteCodigo.AsInteger;
  mBoletosCnpjCpfEditado.AsString := DM1.tClienteCgcCpf.AsString;
  mBoletosEmail.AsString          := DM1.tClienteEmailCobranca.AsString;
  mBoletosCNPJCPF.AsString        := Monta_Numero(DM1.tClienteCgcCpf.AsString,0);
  if DM1.tClientePessoa.AsString = 'F' then
    mBoletosPessoa.AsString := '1'
  else
    mBoletosPessoa.AsString := '2';
  mBoletosDtGerado.AsString     := DM1.tCReceberParcDtGerado.AsString;
  mBoletosDtVencto.AsString     := DM1.tCReceberParcDtVencCReceber.AsString;
  mBoletosNumCReceber.AsInteger := DM1.tCReceberNumCReceber.AsInteger;
  mBoletosCodConta.AsInteger    := dm1.tCReceberParcCodConta.AsInteger;
  mBoletosCodBanco.AsInteger    := dm1.tContasCodBanco.AsInteger; //juca - 2015-04-06
  if DM1.tCReceberParcNumNota.AsInteger > 0 then
    mBoletosNumNota.AsInteger := DM1.tCReceberParcNumNota.AsInteger;
  mBoletosParcela.AsInteger     := DM1.tCReceberParcParcCReceber.AsInteger;
  mBoletosSerie.AsString        := DM1.tCReceberParcSerie.AsString;
  mBoletosVlrParcela.AsFloat    := DM1.tCReceberParcRestParcela.AsFloat;
  mBoletosNossoNumero.AsString  := DM1.tCReceberParcNumTitBanco.AsString;
  mBoletosVlrJurosPorDia.AsFloat := StrToFloat(FormatFloat('0.00',DMBanco.tBcoSantanderVlrJurosPorDia.AsFloat));
  if copy(DM1.tContasCNAB.AsString,1,6) = 'BRASIL' then
    Grava_mBoletos_Brasil
  else
  if DM1.tContasCNAB.AsString = 'CAIXA400' then
    Grava_mBoletos_Caixa;

  if DM1.tContasFilial.AsInteger <> DM1.tFilialCodigo.AsInteger then
  begin
    if DM1.tFilial2.Locate('Codigo', DM1.tContasFilial.AsInteger, [loCaseInsensitive]) then
    begin
      mBoletosNomeAvalista.AsString    := DM1.tFilial2Empresa.AsString;
      mBoletosCpfCnpjAvalista.AsString := Monta_Numero(DM1.tFilial2CNPJ.AsString, 0);
      mBoletosBairroAvalista.AsString  := DM1.tFilial2Bairro.AsString;
      mBoletosCidAvalista.AsString     := DM1.tFilial2Cidade.AsString;
      mBoletosEndAvalista.AsString     := DM1.tFilial2Endereco.AsString;
      mBoletosCepAvalista.AsString     := Monta_Numero(DM1.tFilial2Cep.AsString, 0);
      mBoletosUFAvalista.AsString      := DM1.tFilial2Estado.AsString;
    end;
  end;

  if (tCReceberParcRem2.RecordCount > 0) and (tCReceberParcRem2CodConta.AsInteger = DM1.tContasCodConta.AsInteger) then
  begin
    tCReceberParcRem2.Last;
    if tCReceberParcRem2NumTitBanco.AsString <> '' then
      if mBoletosNossoNumero.AsString <> tCReceberParcRem2NumTitBanco.AsString then
        ShowMessage('Nosso número diferente na nota ' + mBoletosNumNota.AsString);
  end;

  //Calcular o juros por dia - Foi colocado no dia 11/02/2013
  if fEnviarBanco.mBoletosVlrJurosPorDia.AsFloat > 0 then
    vValor := mBoletosVlrJurosPorDia.AsFloat
  else
  if DM1.tParametrosPercJuros.AsFloat > 0 then
    vValor := DM1.tParametrosPercJuros.AsFloat
  else
    vValor := 3;
  vValor := StrToFloat(FormatFloat('0.00',((mBoletosVlrParcela.AsFloat * vValor) / 100) / 30));
  mBoletosVlrJurosDia_Calculado.AsFloat := StrToFloat(FormatFloat('0.00',vValor));
  //aqui
  if (DM1.tContasCNAB.AsString = 'SANTANDER240') or (DM1.tContasCNAB.AsString = 'SANTANDER400') then
    mBoletosAceite.AsString := DMBanco.tBcoSantanderAceite.AsString;

  mBoletos.Post;
end;

procedure TfEnviarBanco.mBoletosBeforePost(DataSet: TDataSet);
begin
  if (mBoletosGeraNossoNumero.AsString = 'n') or (Trim(mBoletosGeraNossoNumero.AsString) = '') then
    mBoletosGeraNossoNumero.AsString := 'N'
  else
  if (mBoletosGeraNossoNumero.AsString = 's') then
    mBoletosGeraNossoNumero.AsString := 'S';
  if (mBoletosGerarRemessa.AsString = 'n') or (Trim(mBoletosGerarRemessa.AsString) = '') then
    mBoletosGerarRemessa.AsString := 'N'
  else
  if (mBoletosGerarRemessa.AsString = 's') then
    mBoletosGerarRemessa.AsString := 'S';
end;

procedure TfEnviarBanco.Abre_qCarteira(CodCarteira: String);
begin
  qCarteira.Close;
  qCarteira.ParamByName('CODBANCO').AsString    := DM1.tContasCodBanco.AsString;
  qCarteira.ParamByName('CODCARTEIRA').AsString := CodCarteira;
  qCarteira.Open;
  if not qCarteira.IsEmpty then
  begin
    mBoletosGeraNossoNumero.AsString := qCarteiraGERARNOSSONUMERO.AsString;
    mBoletosGerarRemessa.AsString    := qCarteiraGERARREMESSA.AsString;
  end;
  qCarteira.Close;
end;

procedure TfEnviarBanco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
    CheckBox1.Visible := not (CheckBox1.Visible);
end;


procedure TfEnviarBanco.prc_Enviar_ACBR;
begin
  DmCobEletronica.vNossoNumero := dmCobEletronica.geraRegistroAcbr(mBoletosDtVencto.AsDateTime,mBoletosDtGerado.AsDateTime,
                                                                   mBoletosNossoNumero.AsString,
                                                                   mBoletosNumNota.AsString,DMBanco.tBcoSantanderNumCarteira.AsString,
                                                                   mBoletosCliente.AsString,
                                                                   mBoletosCNPJCPF.AsString,mBoletosEndereco.AsString,'',
                                                                   mBoletosBairro.AsString,mBoletosCidade.AsString,
                                                                   mBoletosUf.AsSTring,mBoletosCEP.ASString,mBoletosPessoa.AsString,
                                                                   mBoletosAceite.AsString,mBoletosVlrParcela.AsCurrency,
                                                                   mBoletosParcela.AsInteger,mBoletosCodBanco.AsInteger,mBoletosNumCReceber.AsInteger);
  inc(vContadorTit);
end;

end.

