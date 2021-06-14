unit UCobEletronicaImp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, Grids,
  DBGrids, RXDBCtrl, ALed, Db, DBTables, MemTable, RxLookup, CurrEdit, DBCtrls, DBClient, SMDBGrid, DBFilter, Variants, RLBoleto,
  FMTBcd, SqlExpr;

type
  TfCobEletronicaImp = class(TForm)
    dsmBoletos: TDataSource;
    mBoletos: TClientDataSet;
    mBoletosNumCReceber: TIntegerField;
    mBoletosParcela: TIntegerField;
    mBoletosNumNota: TIntegerField;
    mBoletosVlrParcela: TFloatField;
    mBoletosArqGerado: TBooleanField;
    mBoletosDtEmissao: TDateField;
    mBoletosDtVencimento: TDateField;
    mBoletosCodCliente: TIntegerField;
    mBoletosNomeCliente: TStringField;
    mBoletosCodConta: TIntegerField;
    mBoletosNomeConta: TStringField;
    mBoletosFilial: TIntegerField;
    mBoletosSerie: TStringField;
    mBoletosNumSeqNota: TIntegerField;
    mBoletosIDCobEletronica: TIntegerField;
    mBoletosNossoNumero: TStringField;
    mBoletosEspecieDoc: TStringField;
    mBoletosAceite: TStringField;
    mBoletosCNPJCPF: TStringField;
    mBoletosNumCarteira: TStringField;
    mBoletosPessoa: TStringField;
    mBoletosDiasProtesto: TIntegerField;
    mBoletosVlrJurosPorDia: TFloatField;
    mBoletosTipoJuro: TStringField;
    mBoletosVlrDesconto: TFloatField;
    mBoletosDtLimiteDesc: TStringField;
    mBoletosTipoDesconto: TStringField;
    mBoletosEndereco: TStringField;
    mBoletosCep: TStringField;
    mBoletosCidade: TStringField;
    mBoletosUF: TStringField;
    mBoletosBairro: TStringField;
    mBoletosTipoCN: TStringField;
    mBoletosVlrMulta: TFloatField;
    RLBTitulo1: TRLBTitulo;
    mBoletosGeraNossoNumero: TStringField;
    mBoletosGerarRemessa: TStringField;
    qCarteira: TSQLQuery;
    qCarteiraCODCARTEIRA: TStringField;
    qCarteiraGERARNOSSONUMERO: TStringField;
    qCarteiraGERARREMESSA: TStringField;
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn4: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    BitBtn5: TBitBtn;
    mBoletosMensagem: TStringField;
    mBoletosVlrJurosDia_Calculado: TFloatField;
    qCarteiraCODCARTEIRA_IMP: TStringField;
    mBoletosNumCarteira_Imp: TStringField;
    mBoletosNumEnd: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mBoletosNewRecord(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Abre_Carteira;
    procedure Monta_RLBoleto;
    procedure Abre_qCarteira(CodCarteira: String);

    procedure prc_Montar_Mensagem_Caixa;

    function Posiciona_CReceber: Boolean;
    function fnc_Mensagem_Brasil: String;

    procedure prc_ImprimeACBR;
  public
    { Public declarations }
    vACBR: Boolean;
    vCodFilial, vCodBanco: Integer;
    procedure Monta_Endereco;
    procedure Grava_mBoletos(Filial, NumNota, Parcela, NumCReceber: Integer; Serie, Tipo: String);

  end;

var
  fCobEletronicaImp: TfCobEletronicaImp;

implementation

uses UDM1, uRelBoletoItau, UDMCobEletronica, UDMBanco, uUtilBanco, UDMCarteira, uUtilPadrao, uUtilVar;

{$R *.DFM}

procedure TfCobEletronicaImp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Tag = 1 then
  begin
    if DMCarteira.Owner.ClassName = Self.ClassName then
      FreeAndNil(DMCarteira);
  end;
  if qCarteira.Active then
    qCarteira.Close;
  vEmailEnvio   := '';
  vEmailAssunto := '';
  Action := Cafree;
end;

procedure TfCobEletronicaImp.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfCobEletronicaImp.BitBtn4Click(Sender: TObject);
var
  vNumCarteira: String;
  vContadorAux: Integer;
  vMsgAux: String;
begin
  if vACBR then
  begin
    prc_ImprimeACBR;
    Exit;
  end;

  //RLBTitulo1.ClearRecords;
  //if (Tag = 1) and (ComboBox1.ItemIndex < 0) then
  if (Tag = 1) and (RxDBLookupCombo1.Text = '') then
  begin
    ShowMessage('Falta escolher o tipo da carteira!');
    exit;
  end;
  //Só quando for nota
  //if Tag = 1 then
  //begin
    mBoletos.First;
    while not mBoletos.Eof do
    begin
      if SMDBGrid1.SelectedRows.CurrentRowSelected then
      begin
        if Posiciona_CReceber then
        //if DM1.tCReceberParc.Locate('ParcCReceber',mBoletosParcela.AsInteger,[loCaseInsensitive]) then
        begin
          Abre_qCarteira(mBoletosNumCarteira.AsString);
          vNumCarteira := mBoletosNumCarteira.AsString;
          if (Trim(mBoletosNossoNumero.AsString) = '') and (qCarteiraGERARNOSSONUMERO.AsString = 'S')  then
          begin
            DM1.tCReceberParc.Edit;
            if DM1.tContasCNAB.AsString = 'ITAU400' then
              DM1.tCReceberParcNumTitBanco.AsString := fnc_Calcula_NossoNumeroItau(vNumCarteira)
            else
            if Copy(DM1.tContasCNAB.AsString,1,6) = 'BRASIL' then
              DM1.tCReceberParcNumTitBanco.AsString := fnc_Calcula_NossoNumeroBrasil(vNumCarteira)
            else
            if DM1.tContasCNAB.AsString = 'CAIXA400' then
              DM1.tCReceberParcNumTitBanco.AsString := fnc_Calcula_NossoNumeroCaixa(vNumCarteira)
            else;
{            if DM1.tContasCNAB.AsString = 'SANTANDER240' then
              DM1.tCReceberParcNumTitBanco.AsString := fnc_Calcula_NossoNumeroSantander(vNumCarteira);
            DM1.tCReceberParcNumCarteira.AsString := mBoletosNumCarteira.AsString;}
            DM1.tCReceberParc.Post;

            mBoletos.Edit;
            mBoletosNossoNumero.AsString := DM1.tCReceberParcNumTitBanco.AsString;
            mBoletos.Post;
          end;
          if DM1.tContasCNAB.AsString <> 'ITAU400' then
            Monta_RLBoleto;

          if (Tag <> 1) and ((DMCobEletronica.cdsCobEletronica_NotaNUMCARTEIRA.AsString <> mBoletosNumCarteira.AsString) or
                             (DMCobEletronica.cdsCobEletronica_NotaNOSSONUMERO.AsString <> mBoletosNossoNumero.AsString)) then
          begin
            if DMCobEletronica.cdsCobEletronica_Nota.Locate('NUMCRECEBER;PARCELA',VarArrayOf([mBoletosNumCReceber.AsInteger,mBoletosParcela.AsInteger]),[locaseinsensitive]) then
            begin
              DMCobEletronica.cdsCobEletronica_Nota.Edit;
              DMCobEletronica.cdsCobEletronica_NotaNUMCARTEIRA.AsString := mBoletosNumCarteira.AsString;
              DMCobEletronica.cdsCobEletronica_NotaNOSSONUMERO.AsString := mBoletosNossoNumero.AsString;
              DMCobEletronica.cdsCobEletronica_Nota.Post;
              DMCobEletronica.cdsCobEletronica_Nota.ApplyUpdates(0);
            end;
          end;
        end;
      end;
      mBoletos.Next;
    end;
  //end;

  if DM1.tContasCNAB.AsString = 'ITAU400' then
  begin
    fRelBoletoItau := TfRelBoletoItau.Create(Self);
    fRelBoletoItau.RLReport1.Preview;
    fRelBoletoItau.RLReport1.Free;
    fRelBoletoItau.Destroy;
  end
  else
  begin

    try
      RLBTitulo1.PreviewModal;
    except
    end;
  end;

  SMDBGrid1.EnableScroll;
end;

procedure TfCobEletronicaImp.FormCreate(Sender: TObject);
begin
  if not DM1.tCliente.Active then
    DM1.tCliente.Open;
end;

procedure TfCobEletronicaImp.Monta_Endereco;
begin
  if not DM1.tCliente.Locate('Codigo',mBoletosCodCliente.AsInteger,[loCaseInsensitive]) then
    exit;

  if DM1.tClienteEndPgto.AsString <> '' then
  begin
    DM1.tCidade.Locate('Codigo',DM1.tClienteCodCidadeP.AsInteger,[loCaseInsensitive]);
    mBoletosBairro.AsString   := DM1.tClienteBairroPgto.AsString;
    mBoletosCep.AsString      := DM1.tClienteCepPgto.AsString;
    mBoletosCidade.AsString   := DM1.tCidadeNome.AsString;
    mBoletosEndereco.AsString := DM1.tClienteEndPgto.AsString;
//    mBoletosNumEnd.AsString   := dm1.tclientee
    mBoletosUf.AsString       := DM1.tClienteUfPgto.AsString;
  end
  else
  begin
    DM1.tCidade.Locate('Codigo',DM1.tClienteCodCidade.AsInteger,[loCaseInsensitive]);
    mBoletosBairro.AsString   := DM1.tClienteBairro.AsString;
    mBoletosCep.AsString      := DM1.tClienteCep.AsString;
    mBoletosCidade.AsString   := DM1.tCidadeNome.AsString;
    mBoletosEndereco.AsString := DM1.tClienteEndereco.AsString + ',' + DM1.tClienteNumEnd.AsString;
    mBoletosNumEnd.AsString   := dm1.tClienteNumEnd.AsString;
    if DM1.tClienteEndComplemento.AsString <> '' then
      mBoletosEndereco.AsString := mBoletosEndereco.AsString + '-' + DM1.tClienteEndComplemento.AsString;
    mBoletosUf.AsString := DM1.tClienteUf.AsString;
  end;
end;

procedure TfCobEletronicaImp.Grava_mBoletos(Filial, NumNota, Parcela, NumCReceber: Integer; Serie, Tipo: String); //C=Cobrança  N=Nota
var
  vAux: Real;
  vNumCarteiraAux: String;
begin
  if Tipo = 'C' then
  begin
    if not DM1.tCReceber.Locate('Filial;NumNota;Serie;NumCReceber',VarArrayOf([Filial,NumNota,Serie,NumCReceber]),[locaseinsensitive]) then
      exit;

    if not DM1.tCReceberParc.Locate('ParcCReceber',Parcela,[loCaseInsensitive]) then
      exit;

    if DM1.tClienteCodigo.AsInteger <> DM1.tCReceberParcCodCli.AsInteger then
      if not DM1.tCliente.Locate('Codigo',DM1.tCReceberParcCodCli.AsInteger,[loCaseInsensitive]) then
        exit;
  end
  else
  if Tipo = 'N' then
  begin
    if not DM1.tCReceber.Locate('Filial;NumNota;Serie',VarArrayOf([Filial,NumNota,Serie]),[locaseinsensitive]) then
      exit;

    if not DM1.tCReceberParc.Locate('ParcCReceber',Parcela,[loCaseInsensitive]) then
      exit;

    if DM1.tClienteCodigo.AsInteger <> DM1.tCReceberParcCodCli.AsInteger then
      if not DM1.tCliente.Locate('Codigo',DM1.tCReceberParcCodCli.AsInteger,[loCaseInsensitive]) then
        exit;
  end;

  fCobEletronicaImp.mBoletos.Insert;
  fCobEletronicaImp.mBoletosNumCReceber.AsInteger     := DM1.tCReceberNumCReceber.AsInteger;
  fCobEletronicaImp.mBoletosParcela.AsInteger         := DM1.tCReceberParcParcCReceber.AsInteger;
  fCobEletronicaImp.mBoletosNumNota.AsInteger         := DM1.tCReceberParcNumNota.AsInteger;
  fCobEletronicaImp.mBoletosVlrParcela.AsFloat        := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat));
  fCobEletronicaImp.mBoletosDtEmissao.AsDateTime      := DM1.tCReceberDtGerado.AsDateTime;
  fCobEletronicaImp.mBoletosDtVencimento.AsDateTime   := DM1.tCReceberParcDtVencCReceber.AsDateTime;
  fCobEletronicaImp.mBoletosCodCliente.AsInteger      := DM1.tCReceberParcCodCli.AsInteger;
  fCobEletronicaImp.mBoletosNomeCliente.AsString      := DM1.tCReceberParclkNomeCliente.AsString;
  fCobEletronicaImp.mBoletosCodConta.AsInteger        := DM1.tCReceberParcCodBancoBoleto.AsInteger;
  fCobEletronicaImp.mBoletosFilial.AsInteger          := DM1.tCReceberParcFilial.AsInteger;
  fCobEletronicaImp.mBoletosSerie.AsString            := DM1.tCReceberParcSerie.AsString;
  fCobEletronicaImp.mBoletosNumSeqNota.AsInteger      := DM1.tCReceberParcNumSeqNota.AsInteger;
  fCobEletronicaImp.mBoletosIDCobEletronica.AsInteger := DM1.tCReceberParcIDCobEletronica.AsInteger;
  fCobEletronicaImp.mBoletosNossoNumero.AsString      := DM1.tCReceberParcNumTitBanco.AsString;
  fCobEletronicaImp.mBoletosCNPJCPF.AsString          := DM1.tClienteCgcCpf.AsString;
  fCobEletronicaImp.mBoletosPessoa.AsString           := DM1.tClientePessoa.AsString;
  fCobEletronicaImp.mBoletosEspecieDoc.AsString       := DM1.tCReceberParcEspecieDoc.AsString;
  fCobEletronicaImp.mBoletosAceite.AsString           := 'N'; // DM1.tCReceberParcAceite.AsString;
  mBoletosVlrMulta.AsFloat                            := StrToFloat(FormatFloat('0.00',0));

  if Trim(DM1.tCReceberParcNumCarteira.AsString) <> '' then
    vNumCarteiraAux := DM1.tCReceberParcNumCarteira.AsString
  else
  if DM1.tContasCNAB.AsString = 'ITAU400' then
    vNumCarteiraAux := DMBanco.tBcoItauNumCarteira.AsString
  else
  if Copy(DM1.tContasCNAB.AsString,1,6) = 'BRASIL' then
    vNumCarteiraAux := DMBanco.tBcoBrasilNumCarteira.AsString
  else
  if DM1.tContasCNAB.AsString = 'CAIXA400' then
    vNumCarteiraAux := DMBanco.tBcoCaixaNumCarteira.AsString
  else
  if DM1.tContasCNAB.AsString = 'SANTANDER240' then
  begin
    DMBanco.tBcoSantander.Open;
    vNumCarteiraAux := DMBanco.tBcoSantanderNumCarteira.AsString;
  end;

  mBoletosNumCarteira.AsString := vNumCarteiraAux;
  Abre_qCarteira(mBoletosNumCarteira.AsString);
  if qCarteiraCODCARTEIRA_IMP.AsString <> '' then
    mBoletosNumCarteira_Imp.AsString := qCarteiraCODCARTEIRA_IMP.AsString
  else
    mBoletosNumCarteira_Imp.AsString := mBoletosNumCarteira.AsString;
  if DM1.tContasCNAB.AsString = 'ITAU400' then
  begin
    fCobEletronicaImp.mBoletosDiasProtesto.AsInteger := DMBanco.tBcoItauDiasProtesto.AsInteger;
    fCobEletronicaImp.mBoletosTipoJuro.AsString      := DMBanco.tBcoItauTipoJuro.AsString;
    fCobEletronicaImp.mBoletosVlrJurosPorDia.AsFloat := DMBanco.tBcoItauVlrJurosPorDia.AsFloat;
    if DMBanco.tBcoItauTipoJuro.AsString = 'B' then
    begin
      vAux := StrToFloat(FormatFloat('0.00',(mBoletosVlrParcela.AsFloat * mBoletosVlrJurosPorDia.AsFloat / 100) / 30));
      mBoletosVlrJurosPorDia.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
    end;

    fCobEletronicaImp.mBoletosVlrDesconto.AsFloat    := DMBanco.tBcoItauVlrDesconto.AsFloat;
    fCobEletronicaImp.mBoletosTipoDesconto.AsString  := DMBanco.tBcoItauTipoDesconto.AsString;
    if StrToFloat(FormatFloat('0.00',DMBanco.tBcoItauTaxaMulta.AsFloat)) > 0 then
      mBoletosVlrMulta.AsFloat := StrToFloat(FormatFloat('0.00',mBoletosVlrParcela.AsFloat * DMBanco.tBcoItauTaxaMulta.AsFloat / 100));
  end;

  if Copy(DM1.tContasCNAB.AsString,1,6) = 'BRASIL' then
  begin
    fCobEletronicaImp.mBoletosDiasProtesto.AsInteger := DMBanco.tBcoBrasilDiasProtesto.AsInteger;
    fCobEletronicaImp.mBoletosVlrJurosPorDia.AsFloat := DMBanco.tBcoBrasilVlrJurosPorDia.AsFloat;
    fCobEletronicaImp.mBoletosVlrDesconto.AsFloat    := DMBanco.tBcoBrasilVlrDesconto.AsFloat;
  end;

  if DM1.tContasCNAB.AsString = 'CAIXA400' then
  begin
    fCobEletronicaImp.mBoletosDiasProtesto.AsInteger := DMBanco.tBcoCaixaDiasProtesto.AsInteger;
    fCobEletronicaImp.mBoletosVlrJurosPorDia.AsFloat := DMBanco.tBcoCaixaVlrJurosPorDia.AsFloat;
    fCobEletronicaImp.mBoletosVlrDesconto.AsFloat    := 0;
    fCobEletronicaImp.mBoletosMensagem.AsString      := DMBanco.tBcoCaixaMensagem1.AsString;
  end;

  if dm1.tContasCNAB.AsString = 'SANTANDER240' then
  begin
    fCobEletronicaImp.mBoletosDiasProtesto.AsInteger := DMBanco.tBcoSantanderDiasProtesto.AsInteger;
    fCobEletronicaImp.mBoletosVlrJurosPorDia.AsFloat := DMBanco.tBcoSantanderVlrJurosPorDia.AsFloat;
    fCobEletronicaImp.mBoletosVlrDesconto.AsFloat    := 0;
    fCobEletronicaImp.mBoletosMensagem.AsString      := DMBanco.tBcoSantanderMensagem1.AsString;
  end;

  fCobEletronicaImp.Monta_Endereco;

  mBoletosTipoCN.AsString := Tipo;

  //Calcular o juros por dia - Foi colocado no dia 11/02/2013
  if mBoletosVlrJurosPorDia.AsFloat > 0 then
    vAux := mBoletosVlrJurosPorDia.AsFloat
  else
  if DM1.tParametrosPercJuros.AsFloat > 0 then
    vAux := DM1.tParametrosPercJuros.AsFloat
  else
    vAux := 3;
  vAux := StrToFloat(FormatFloat('0.00', ((mBoletosVlrParcela.AsFloat * vAux) / 100) / 30));
  mBoletosVlrJurosDia_Calculado.AsFloat := StrToFloat(FormatFloat('0.00',vAux));

  fCobEletronicaImp.mBoletos.Post;
end;

procedure TfCobEletronicaImp.FormShow(Sender: TObject);
begin
  if Tag = 1 then
  begin
    if not Assigned(DMCarteira) then
      DMCarteira := TDMCarteira.Create(Self);
  end;

  Abre_Carteira;

  if (DM1.tContasCNAB.AsString = 'ITAU400') and (DMBanco.tBcoItauNumCarteira.AsString <> '') then
     RxDBLookupCombo1.Value := DMBanco.tBcoItauNumCarteira.AsString
  else
  if Copy(DM1.tContasCNAB.AsString,1,6) = 'BRASIL' then
     RxDBLookupCombo1.Value := DMBanco.tBcoBrasilNumCarteira.AsString
  else
  if DM1.tContasCNAB.AsString = 'CAIXA400' then
     RxDBLookupCombo1.Value := DMBanco.tBcoCaixaNumCarteira.AsString;
end;

procedure TfCobEletronicaImp.Abre_Carteira;
begin
  DMCarteira.cdsCarteira.Close;
  if Trim(DM1.tContasCodBanco.AsString) = '' then
    ShowMessage('Código do banco não informado!')
  else
  if DM1.tContasCodBanco.AsString <> '' then
  begin
    DMCarteira.sdsCarteira.CommandText := ctCarteira
                                        + ' WHERE CODBANCO = ' + DM1.tContasCodBanco.AsString
                                        + ' ORDER BY CODCARTEIRA ';
    DMCarteira.cdsCarteira.Open;
  end;
end;

procedure TfCobEletronicaImp.mBoletosNewRecord(DataSet: TDataSet);
begin
  mBoletosGeraNossoNumero.AsString := 'N';
  mBoletosGerarRemessa.AsString    := 'N';
end;

procedure TfCobEletronicaImp.Monta_RLBoleto;
var
  vAux: String;
  i: Integer;
  vMemo: TStrings;

  vValor: Real;
  vTexto1: String;
begin
  //Create(vMemo);
  vMemo := TStringList.Create;
  vMemo.Clear;

  case ComboBox1.ItemIndex of
    0: RLBTitulo1.BoletoLayout := blPadrao;
    1: RLBTitulo1.BoletoLayout := blCarne;
  end;

  //Dados do Cedente
  RLBTitulo1.DataProcessamento := mBoletosDtEmissao.AsDateTime;
  RLBTitulo1.Cedente.ContaBancaria.Banco.Codigo  := Trim(Copy(DM1.tContasCodBanco.AsString,1,3));
  if DM1.tContasAge_PossuiDigVerificador.AsBoolean then
  begin
    RLBTitulo1.Cedente.ContaBancaria.CodigoAgencia := Trim(Copy(DM1.tContasAgencia.AsString,1,Length(DM1.tContasAgencia.AsString)-1));
    RLBTitulo1.Cedente.ContaBancaria.DigitoAgencia := Trim(Copy(DM1.tContasAgencia.AsString,Length(DM1.tContasAgencia.AsString),1));
  end
  else
  begin
    RLBTitulo1.Cedente.ContaBancaria.CodigoAgencia := DM1.tContasAgencia.AsString;
    RLBTitulo1.Cedente.ContaBancaria.DigitoAgencia := ''
  end;
  RLBTitulo1.Cedente.ContaBancaria.NumeroConta := Trim(DM1.tContasNumConta.AsString);
  RLBTitulo1.Cedente.ContaBancaria.DigitoConta := Trim(DM1.tContasDigConta.AsString);

  RLBTitulo1.Cedente.CodigoCedente             := Trim(Copy(DM1.tContasCodCedente.AsString,1,Length(DM1.tContasCodCedente.AsString)-1));
  RLBTitulo1.Cedente.DigitoCodigoCedente       := Trim(Copy(DM1.tContasCodCedente.AsString,Length(DM1.tContasCodCedente.AsString),1));

  if Trim(mBoletosNumCarteira.AsString) <> '' then
    RLBTitulo1.Carteira := Trim(mBoletosNumCarteira_Imp.AsString)
  else
    RLBTitulo1.Carteira := RxDBLookupCombo1.Value;
  if Copy(DM1.tContasCNAB.AsString,1,6) = 'BRASIL' then
  begin
    RLBTitulo1.Cedente.ContaBancaria.Convenio  := Trim(DMBanco.tBcoBrasilCodTransmissao.AsString);
    RLBTitulo1.LayoutNN := lnC7_N10;
  end
  else
  begin
    //RLBTitulo1.Cedente.ContaBancaria.Convenio  := Trim(DM1.tContasCodCedente.AsString);
    RLBTitulo1.LayoutNN := lnN11;
  end;
  if trim(DM1.tContasLocalPagamento.AsString) <> '' then
    RLBTitulo1.LocalPagamento := DM1.tContasLocalPagamento.AsString;

  RLBTitulo1.Cedente.ContaBancaria.NomeCliente := DM1.tFilialEmpresa.AsString + '    (CNPJ: ' + DM1.tFilialCNPJ.AsString + ')';
  RLBTitulo1.Cedente.TipoInscricao   := tiPessoaJuridica;
  RLBTitulo1.Cedente.NumeroCPFCGC    := Monta_Numero(DM1.tFilialCNPJ.AsString,14);
  RLBTitulo1.Cedente.Nome            := DM1.tFilialEmpresa.AsString + '    (CNPJ: ' + DM1.tFilialCNPJ.AsString + ')';
  RLBTitulo1.Cedente.Endereco.Rua    := DM1.tFilialEndereco.AsString + ', ' + DM1.tFilialNumEnd.AsString;
  RLBTitulo1.Cedente.Endereco.CEP    := DM1.tFilialCep.AsString;
  RLBTitulo1.Cedente.Endereco.Bairro := DM1.tFilialBairro.AsString;
  RLBTitulo1.Cedente.Endereco.Cidade := DM1.tFilialCidade.AsString;
  RLBTitulo1.Cedente.Endereco.Estado := DM1.tFilialEstado.AsString;

  //dados do sacado
  RLBTitulo1.Sacado.Nome := mBoletosNomeCliente.AsString;
  
  if (mBoletosPessoa.AsString = 'F') or (mBoletosPessoa.AsString = '1') then
  begin
    RLBTitulo1.Sacado.TipoInscricao := tiPessoaFisica;
    RLBTitulo1.Sacado.NumeroCPFCGC  := Monta_Numero(mBoletosCNPJCPF.AsString,11);
  end
  else
  begin
    RLBTitulo1.Sacado.TipoInscricao := tiPessoaJuridica;
    RLBTitulo1.Sacado.NumeroCPFCGC  := Monta_Numero(mBoletosCNPJCPF.AsString,14);
  end;
  RLBTitulo1.Sacado.Endereco.Rua    := mBoletosEndereco.AsString;
  vAux := Monta_Numero(mBoletosCep.AsString,8);
  RLBTitulo1.Sacado.Endereco.CEP    := vAux;
  RLBTitulo1.Sacado.Endereco.Cidade := mBoletosCidade.AsString;
  RLBTitulo1.Sacado.Endereco.Estado := mBoletosUF.AsString;
  //dados da cobranca
  if DM1.tContasCNAB.AsString = 'CAIXA400' then
    RLBTitulo1.NossoNumero := copy(mBoletosNossoNumero.AsString,1,10)
  else
    RLBTitulo1.NossoNumero := mBoletosNossoNumero.AsString;
  RLBTitulo1.ValorDocumento  := StrToFloat(FormatFloat('0.00',mBoletosVlrParcela.AsFloat));
  RLBTitulo1.DataDocumento   := mBoletosDtEmissao.AsDateTime;
  RLBTitulo1.DataVencimento  := mBoletosDtVencimento.AsDateTime;
  RLBTitulo1.NumeroDocumento := FormatFloat('000000',mBoletosNumNota.AsInteger) + '/' + mBoletosParcela.AsString;

  //Linha 1 de Instrução
  if copy(DM1.tContasCNAB.AsString,1,6) = 'BRASIL' then
  begin
    if mBoletosVlrJurosPorDia.AsFloat > 0 then
      vValor := mBoletosVlrJurosPorDia.AsFloat
    else
    if DM1.tParametrosPercJuros.AsFloat > 0 then
      vValor := DM1.tParametrosPercJuros.AsFloat
    else
      vValor := 3;
    vValor := StrToFloat(FormatFloat('0.00', ((mBoletosVlrParcela.AsFloat * vValor) / 100) / 30));
    if StrToFloat(FormatFloat('0.00',vValor)) > 0 then
      vMemo.Add('Após Vencimento cobrar juros diários de R$ ' + FormatFloat('###,###,##0.00',vValor));
  end;
  vTexto1 := '';
  if Copy(DM1.tContasCNAB.AsString,1,6) = 'BRASIL' then
    vTexto1 := fnc_Mensagem_Brasil
  else
  if DM1.tContasCNAB.AsString = 'CAIXA400' then
  begin
    if trim(mBoletosMensagem.AsString) <> '' then
      vMemo.Add(mBoletosMensagem.AsString);
    prc_Montar_Mensagem_Caixa;
    for i := 1 to 6 do
    begin
      if trim(vMensagem[i]) <> '' then
        vMemo.Add(vMensagem[i]);
    end;
  end;
  if Trim(vTexto1) <> '' then
    vMemo.Add(vTexto1);

  RLBTitulo1.Instrucoes.Text := vMemo.Text;

  RLBTitulo1.InsertRecord;

  FreeAndNil(vMemo);
end;

function TfCobEletronicaImp.Posiciona_CReceber: Boolean;
begin
  Result := False;
  if not DM1.tCReceber.Locate('Filial;NumCReceber',VarArrayOf([mBoletosFilial.AsInteger,mBoletosNumCReceber.AsInteger]),[locaseinsensitive]) then
    exit;
  if not DM1.tCReceberParc.Locate('ParcCReceber',mBoletosParcela.AsInteger,[loCaseInsensitive]) then
    exit;
  Result := True;
end;

procedure TfCobEletronicaImp.Abre_qCarteira(CodCarteira: String);
begin
  qCarteira.Close;
  qCarteira.ParamByName('CODBANCO').AsString    := DM1.tContasCodBanco.AsString;
  qCarteira.ParamByName('CODCARTEIRA').AsString := CodCarteira;
  qCarteira.Open;
end;

procedure TfCobEletronicaImp.BitBtn1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
    exit;
  if MessageDlg('Deseja alterar a carteira?', mtconfirmation, [mbok, mbno], 0) = mrNo then
    exit;
  mBoletos.First;
  while not mBoletos.Eof do
  begin
    if SMDBGrid1.SelectedRows.CurrentRowSelected then
    begin
      mBoletos.Edit;
      mBoletosNumCarteira.AsString := RxDBLookupCombo1.Value;
      mBoletos.Post;
    end;
    mBoletos.Next;
  end;
end;

function TfCobEletronicaImp.fnc_Mensagem_Brasil: String;
begin
  Result := '';
  if (DMBanco.tBcoBrasilInstrucao.AsString = '03') or (DMBanco.tBcoBrasilInstrucao2.AsString = '03') then
    Result := 'Protestar no 3º dia útil após o vencimento'
  else
  if (DMBanco.tBcoBrasilInstrucao.AsString = '04') or (DMBanco.tBcoBrasilInstrucao2.AsString = '04') then
    Result := 'Protestar no 4º dia útil após o vencimento'
  else
  if (DMBanco.tBcoBrasilInstrucao.AsString = '05') or (DMBanco.tBcoBrasilInstrucao2.AsString = '05') then
    Result := 'Protestar no 5º dia útil após o vencimento'
  else
  if (DMBanco.tBcoBrasilInstrucao.AsString = '06') or (DMBanco.tBcoBrasilInstrucao2.AsString = '06') then
    Result := 'Protestar no ' + DMBanco.tBcoBrasilDiasProtesto.AsString + 'º dia corrido após vencido'
  else
  if (DMBanco.tBcoBrasilInstrucao.AsString = '10') or (DMBanco.tBcoBrasilInstrucao2.AsString = '10') then
    Result := 'Protestar no 10º dia corrido após vencido'
  else
  if (DMBanco.tBcoBrasilInstrucao.AsString = '15') or (DMBanco.tBcoBrasilInstrucao2.AsString = '15') then
    Result := 'Protestar no 15º dia corrido após vencido'
  else
  if (DMBanco.tBcoBrasilInstrucao.AsString = '20') or (DMBanco.tBcoBrasilInstrucao2.AsString = '20') then
    Result := 'Protestar no 20º dia corrido após vencido'
  else
  if ((DMBanco.tBcoBrasilInstrucao.AsString = '22') or (DMBanco.tBcoBrasilInstrucao2.AsString = '22')) and
      (Trim(fCobEletronicaImp.mBoletosDtLimiteDesc.AsString) <> '') then
    Result := 'Conceder desconto só até a data ' + fCobEletronicaImp.mBoletosDtLimiteDesc.AsString
  else
  if (DMBanco.tBcoBrasilInstrucao.AsString = '25') or (DMBanco.tBcoBrasilInstrucao2.AsString = '25') then
    Result := 'Protestar no 25º dia corrido após vencido'
  else
  if (DMBanco.tBcoBrasilInstrucao.AsString = '30') or (DMBanco.tBcoBrasilInstrucao2.AsString = '30') then
    Result := 'Protestar no 30º dia corrido após vencido'
  else
  if (DMBanco.tBcoBrasilInstrucao.AsString = '45') or (DMBanco.tBcoBrasilInstrucao2.AsString = '45') then
    Result := 'Protestar no 45º dia corrido após vencido';
end;

procedure TfCobEletronicaImp.prc_Montar_Mensagem_Caixa;
var
  i: integer;
  vDataAux: TDateTime;
begin
  for i := 1 to 6 do
    vMensagem[i] := '';
  i := 0;
  if (StrToFloat(FormatFloat('0.00',mBoletosVlrJurosDia_Calculado.AsFloat)) > 0) then
  begin
    i      := i + 1;
    vMensagem[i] := 'Valor de mora por dia de atraso R$ ' + FormatFloat('0.00',mBoletosVlrJurosDia_Calculado.AsFloat);
  end;
  if (DMBanco.tBcoCaixaInstrucao.AsString = '01') and (mBoletosDiasProtesto.AsInteger > 0) then
  begin
    i            := i + 1;
    vDataAux     := mBoletosDtVencimento.AsDateTime + mBoletosDiasProtesto.AsInteger;
    vMensagem[i] := 'Protestar após ' + FormatDateTime('DD/MM/YY',vDataAux);
  end;
  if (DMBanco.tBcoCaixaInstrucao.AsString = '02') and (mBoletosDiasProtesto.AsInteger > 0) then
  begin
    i            := i + 1;
    vDataAux     := mBoletosDtVencimento.AsDateTime + mBoletosDiasProtesto.AsInteger;
    vMensagem[i] := 'Devolver após ' + FormatDateTime('DD/MM/YY',vDataAux);
  end;
end;

procedure TfCobEletronicaImp.prc_ImprimeACBR;
var
  vContadorAux: Integer;
  vMsgAux: String;
begin
    dmCobEletronica.ACBrBoleto1.ListadeBoletos.Clear;
    dmCobEletronica.buscaNossoNumero;

    DMCobEletronica.tContas.Locate('CodConta',DMCobEletronica.cdsCobEletronicaCODBANCO.AsInteger,[loCaseInsensitive]);
    DMCobEletronica.tBcoSantander.Open;

    mBoletos.First;
    while not mBoletos.Eof do
    begin
      if not SMDBGrid1.SelectedRows.CurrentRowSelected then
      begin
        mBoletos.Next;
        Continue;
      end;
      if mBoletosFilial.AsInteger <> vCodFilial then
      begin
        vMsgAux := '   3) Verifique se a Filial informada é a mesma do título;';
        mBoletos.Last;
        Continue;
      end;
      if not dmCobEletronica.tFilial.Active then
        dmCobEletronica.tFilial.Open;
      DMCobEletronica.tFilial.IndexFieldNames := 'Codigo';
      dmCobEletronica.tFilial.FindKey([vCodFilial]);

      DmCobEletronica.prc_Verificar_Carteira;
      if DmCobEletronica.vGera_NossoNumero = 'S' then
      begin
        vContadorAux := vContadorAux + 1;
        DmCobEletronica.geraCabecalhoAcbr;
        DmCobEletronica.vNossoNumero := DmCobEletronica.geraRegistroAcbr(mBoletosDtVencimento.AsDateTime,mBoletosDtEmissao.AsDateTime,
                                        mBoletosNossoNumero.AsString,mBoletosNumNota.AsString,mBoletosNumCarteira.AsString,
                                        mBoletosNomeCliente.AsString,mBoletosCNPJCPF.AsString,mBoletosEndereco.AsString,
                                        mBoletosNumEnd.AsString,mBoletosBairro.AsString,mBoletosCidade.AsString,mBoletosUF.AsString,
                                        mBoletosCep.AsString,mBoletosPessoa.AsString,mBoletosAceite.AsString,mBoletosVlrParcela.AsCurrency,
                                        mBoletosParcela.AsInteger,vCodBanco,mBoletosNumCReceber.AsInteger);

        Dm1.tCReceberParc.MasterSource.Enabled := False;
        Dm1.tCReceberParc.IndexFieldNames      := 'Filial;NumCReceber;ParcCReceber';
        Dm1.tCReceberParc.FindKey([mBoletosFilial.AsInteger,mBoletosNumCReceber.AsInteger,mBoletosParcela.AsInteger]);
        Dm1.tCReceberParc.Edit;
        Dm1.tCReceberParcNumTitBanco.AsString  := DmCobEletronica.vNossoNumero;
        Dm1.tCReceberParc.Post;
        Dm1.tCReceberParc.MasterSource.Enabled := True;

        if DMCobEletronica.cdsCobEletronica_Nota.Locate('NUMCRECEBER;PARCELA',VarArrayOf([mBoletosNumCReceber.AsInteger,mBoletosParcela.AsInteger]),[locaseinsensitive]) then
        begin
          DMCobEletronica.cdsCobEletronica_Nota.Edit;
          DMCobEletronica.cdsCobEletronica_NotaNUMCARTEIRA.AsString := mBoletosNumCarteira.AsString;
          DMCobEletronica.cdsCobEletronica_NotaNOSSONUMERO.AsString := DmCobEletronica.vNossoNumero;
          DMCobEletronica.cdsCobEletronica_Nota.Post;
          DMCobEletronica.cdsCobEletronica_Nota.ApplyUpdates(0);
        end;

        DMCobEletronica.prc_Gravar_Duplicata('I');
      end;
      mBoletos.Next;
    end;
    if vContadorAux <= 0 then
    begin
      MessageDlg('*** Nenhum boleto impresso!' +#13 +
                 'Motivo: ' +#13 +
                 '   1) Verifique se foi selecionado algum título;' +#13 +
                 '   2) Verifique se a carteira está marcada para impressão na Empresa ou no Banco;' +#13 +
                 vMsgAux + #13, mtInformation, [mbOk], 0);
      Exit;
    end;
    try
  // Atualiza a nosso numero no cadastro do banco
      DmCobEletronica.cdsContas_calculo.Edit;
      //fDmCob_Eletronica.cdsContas_calculoSEQ_NOSSONUMERO.AsInteger := fdmCob_Eletronica.xNossoNum;
      DmCobEletronica.cdsContas_calculoSEQ_NOSSONUMERO.AsString := IntToStr(dmCobEletronica.xNossoNum);
      DmCobEletronica.cdsContas_calculo.Post;
      DmCobEletronica.cdsContas_calculo.ApplyUpdates(0);
      try
//        fDMRel := TDMRel.Create(DMRel);
        dmCobEletronica.ACBrBoleto1.Imprimir;
      finally
//        FreeAndNil(fDMRel);
      end
  //    ACBrBoleto1.GerarPDF;
    except
      MessageDlg('Erro ao imprimir os boletos. Verifique!',mtWarning,[mbOK],0);
    end;
end;

end.

