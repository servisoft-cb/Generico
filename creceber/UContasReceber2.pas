unit UContasReceber2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, Menus,
  RXCtrls, Printers, Db, DBTables, Grids, DBGrids, RxLookup, SMDBGrid, CurrEdit, DBFilter, ALed, Variants;

type
  TfContasReceber2 = class(TForm)
    Panel1: TPanel;
    StaticText1: TStaticText;
    DateEdit1: TDateEdit;
    StaticText2: TStaticText;
    DateEdit2: TDateEdit;
    qConsulta: TQuery;
    Label3: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label4: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    StaticText3: TStaticText;
    DateEdit3: TDateEdit;
    StaticText4: TStaticText;
    DateEdit4: TDateEdit;
    dsqConsulta: TDataSource;
    qConsultaFilial: TIntegerField;
    qConsultaCodCli: TIntegerField;
    qConsultaNomeCliente: TStringField;
    qConsultaNomeVendedor: TStringField;
    qConsultaCodVendedor: TIntegerField;
    qConsultaVlrParcCReceber: TFloatField;
    qConsultaParcCReceber: TIntegerField;
    qConsultaNumCReceber: TIntegerField;
    qConsultaDtVencCReceber: TDateField;
    qConsultaDtPagParcCReceber: TDateField;
    qConsultaPgtoParcial: TFloatField;
    qConsultaRestParcela: TFloatField;
    qConsultaPercComissao: TFloatField;
    qConsultaAbatimentos: TFloatField;
    qConsultaNomeConta: TStringField;
    qConsultaJurosPagos: TFloatField;
    qConsultaCancelado: TBooleanField;
    qConsultaDtGerado: TDateField;
    qConsultaVlrDevolucao: TFloatField;
    qConsultaTransferencia: TBooleanField;
    qConsultaNumTitBanco: TStringField;
    qConsultaNumCarteira: TStringField;
    qConsultaNumNota: TIntegerField;
    qConsultaCodBancoBoleto: TIntegerField;
    Label1: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    qConsultaCodConta: TIntegerField;
    qConsultaNomeBancoBoleto: TStringField;
    qConsultaclTransferencia: TStringField;
    qConsultaCodTipoCobranca: TIntegerField;
    qConsultaNomeCobranca: TStringField;
    ComboBox2: TComboBox;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    ComboBox1: TComboBox;
    Label6: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    qConsultaCgcCpf: TStringField;
    CurrencyEdit1: TCurrencyEdit;
    Label7: TLabel;
    qConsultaEndereco: TStringField;
    qConsultaBairro: TStringField;
    qConsultaUf: TStringField;
    qConsultaCep: TStringField;
    qConsultaFantasia: TStringField;
    qConsultaCodCidade: TIntegerField;
    qConsultaPessoa: TStringField;
    qConsultaDesconto: TFloatField;
    qConsultaDespesas: TFloatField;
    tCReceberParcHist: TTable;
    dsCReceberParcHist: TDataSource;
    tCReceberParcHistFilial: TIntegerField;
    tCReceberParcHistNumCReceber: TIntegerField;
    tCReceberParcHistParcCReceber: TIntegerField;
    tCReceberParcHistItem: TIntegerField;
    tCReceberParcHistCodHistorico: TIntegerField;
    tCReceberParcHistDtHistorico: TDateField;
    tCReceberParcHistHistorico: TStringField;
    tCReceberParcHistDtUltPgto: TDateField;
    tCReceberParcHistVlrUltPgto: TFloatField;
    tCReceberParcHistVlrUltJuros: TFloatField;
    tCReceberParcHistVlrUltDescontos: TFloatField;
    tCReceberParcHistVlrUltDespesas: TFloatField;
    tCReceberParcHistVlrUltAbatimentos: TFloatField;
    tCReceberParcHistPgto: TBooleanField;
    tCReceberParcHistJurosPagos: TFloatField;
    tCReceberParcHistNumMov: TIntegerField;
    tCReceberParcHistNumMovJuros: TIntegerField;
    tCReceberParcHistJurosCalc: TFloatField;
    tCReceberParcHistVlrDevolucao: TFloatField;
    tCReceberParcHistDevolucao: TBooleanField;
    tCReceberParcHistNroLancExtComissao: TIntegerField;
    tCReceberParcHistTipo: TStringField;
    tCReceberParcHistCodConta: TIntegerField;
    RxDBFilter1: TRxDBFilter;
    SMDBGrid1: TSMDBGrid;
    Panel4: TPanel;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label14: TLabel;
    Label16: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Panel3: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn99: TBitBtn;
    GroupBox2: TGroupBox;
    ALed1: TALed;
    Label9: TLabel;
    ALed2: TALed;
    Label10: TLabel;
    ALed3: TALed;
    Label11: TLabel;
    ALed4: TALed;
    Label12: TLabel;
    qConsultaclDiasAtraso: TFloatField;
    GroupBox1: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    qConsultaDescontado: TBooleanField;
    BitBtn7: TBitBtn;
    qConsultaDtVencimento2: TDateField;
    StaticText7: TStaticText;
    DateEdit5: TDateEdit;
    StaticText8: TStaticText;
    DateEdit6: TDateEdit;
    StaticText9: TStaticText;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn4: TBitBtn;
    qConsultaTipoDoc: TStringField;
    qConsultaSerie: TStringField;
    qConsultaCodCartaoCredito: TIntegerField;
    qConsultaCodBancoCheque: TIntegerField;
    qConsultaNumCartaoCredito: TStringField;
    qConsultaValidadeCartao: TStringField;
    qConsultaTipoCondicao: TStringField;
    qConsultaNumCheque: TIntegerField;
    qConsultaNomeCartao: TStringField;
    Label8: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    CheckBox4: TCheckBox;
    ALed5: TALed;
    Label13: TLabel;
    qConsultaTitProtestado: TBooleanField;
    CheckBox5: TCheckBox;
    BitBtn9: TBitBtn;
    Label18: TLabel;
    Label19: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure BitBtn99Click(Sender: TObject);
    procedure qConsultaCalcFields(DataSet: TDataSet);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure RxDBLookupCombo6Enter(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    vExiste : Boolean;
    procedure Monta_SQL;
    procedure Posiciona_Parcela;
    procedure Calcula_Totais;
  public
    { Public declarations }
    procedure Pagto_CartaoCredito;
    procedure Excluir_Pagto_CartaoCredito;

    function fnc_Achou_tExtCartao : Boolean;
  end;

var
  fContasReceber2: TfContasReceber2;

implementation

uses UDM1, UConsCReceberHist, UCReceberAltera, UContasReceberPag, UEstPagamento, UContasReceberDev, UContasReceberPagSel,
  ULancaCReceber, UConsCReceber, URelCReceber3, UCReceberAlteraSel, UDM2;

{$R *.DFM}

procedure TfContasReceber2.Calcula_Totais;
var
  vTotalGeral, vTotalDevol, vTotalDesc, vTotalRecebido, vTotalPendente : Real;
begin
  SMDBGrid1.DisableScroll;
  vTotalGeral    := 0;
  vTotalDevol    := 0;
  vTotalDesc     := 0;
  vTotalRecebido := 0;
  vTotalPendente := 0;
  qConsulta.First;
  while not qConsulta.Eof do
    begin
      if not qConsultaCancelado.AsBoolean then
        begin
          vTotalGeral    := vTotalGeral + qConsultaVlrParcCReceber.AsFloat;
          vTotalDevol    := vTotalDevol + qConsultaVlrDevolucao.AsFloat;
          vTotalRecebido := vTotalRecebido + qConsultaPgtoParcial.AsFloat;
          vTotalPendente := vTotalPendente + qConsultaRestParcela.AsFloat;
          if qConsultaDescontado.AsBoolean then
            vTotalDesc  := vTotalDesc + qConsultaVlrParcCReceber.AsFloat;
        end;
      qConsulta.Next;
    end;
  vTotalPendente  := StrToFloat(FormatFloat('0.00',vTotalPendente - vTotalDesc));
  Label16.Caption := FormatFloat('###,###,##0.00',vTotalGeral);
  Label23.Caption := FormatFloat('###,###,##0.00',vTotalDevol);
  Label25.Caption := FormatFloat('###,###,##0.00',vTotalDesc);
  Label2.Caption  := FormatFloat('###,###,##0.00',vTotalRecebido);
  Label17.Caption := FormatFloat('###,###,##0.00',vTotalPendente);
  SMDBGrid1.EnableScroll;
end;

procedure TfContasReceber2.Posiciona_Parcela;
begin
  vExiste := False;
  DM1.tFilial.Locate('Codigo',qConsultaFilial.AsInteger,[loCaseInsensitive]);
  if DM1.tCReceber.Locate('Filial;NumCReceber',VarArrayOf([qConsultaFilial.AsInteger,qConsultaNumCReceber.AsInteger]),[locaseinsensitive]) then
    if DM1.tCReceberParc.Locate('Filial;NumCReceber;ParcCReceber',VarArrayOf([qConsultaFilial.AsInteger,qConsultaNumCReceber.AsInteger,qConsultaParcCReceber.AsInteger]),[locaseinsensitive]) then
      vExiste := True;
  if not vExiste then
    ShowMessage('Parcela não encontrada no contas a receber!');
end;

procedure TfContasReceber2.Monta_SQL;
begin
  if Edit1.Text <> '' then
    ComboBox1.ItemIndex := 2;

  qConsulta.Close;
  qConsulta.SQL.Clear;
  qConsulta.SQL.Add('SELECT CRP.Filial, CRP.CodCli, Dbcliente.Nome NomeCliente, Dbvendedor.Nome NomeVendedor, ');
  qConsulta.SQL.Add('CRP.CodVendedor, CRP.VlrParcCReceber, CRP.ParcCReceber, CRP.NumCReceber, ');
  qConsulta.SQL.Add('CRP.DtVencCReceber, CRP.DtPagParcCReceber, CRP.PgtoParcial, CRP.RestParcela, ');
  qConsulta.SQL.Add('CRP.PercComissao, CRP.Abatimentos, Dbcontas.NomeConta, CRP.JurosPagos, ');
  qConsulta.SQL.Add('CRP.Cancelado, CRP.DtGerado, CRP.VlrDevolucao, CRP.Transferencia, ');
  qConsulta.SQL.Add('CRP.NumTitBanco, CRP.NumCarteira, CRP.NumNota, CRP.CodBancoBoleto, ');
  qConsulta.SQL.Add('CRP.CodConta, Dbcontas_1.NomeConta NomeBancoBoleto, CRP.CodTipoCobranca, ');
  qConsulta.SQL.Add('dbTipoCobranca.Nome NomeCobranca, dbCliente.CgcCpf, Dbcliente.Endereco, Dbcliente.Bairro, Dbcliente.Uf, ');
  qConsulta.SQL.Add('Dbcliente.Cep, Dbcliente.Fantasia, Dbcliente.CodCidade, Dbcliente.Pessoa, CRP.Desconto, ');
  qConsulta.SQL.Add('CRP.Despesas, DbTipoCobranca.Descontado, CRP.DtVencimento2, CRP.TipoDoc, CRP.Serie, ');
  qConsulta.SQL.Add('CRP.CodCartaoCredito, CRP.CodBancoCheque, CRP.NumCartaoCredito, CRP.ValidadeCartao,  ');
  qConsulta.SQL.Add('CRP.TipoCondicao, CRP.NumCheque, dbCartaoCredito.Nome NomeCartao, CRP.TitProtestado ');
  qConsulta.SQL.Add('FROM "dbCReceberParc.DB" CRP ');
  qConsulta.SQL.Add('INNER JOIN "dbCliente.DB" Dbcliente ON (CRP.CodCli = Dbcliente.Codigo) ');
  qConsulta.SQL.Add('FULL JOIN "dbVendedor.DB" Dbvendedor ON (CRP.CodVendedor = Dbvendedor.Codigo) ');
  qConsulta.SQL.Add('FULL JOIN "dbContas.DB" Dbcontas ON (CRP.CodConta = Dbcontas.CodConta) ');
  qConsulta.SQL.Add('FULL JOIN "dbContas.DB" Dbcontas_1 ON (CRP.CodBancoBoleto = Dbcontas_1.CodConta)');
  qConsulta.SQL.Add('FULL JOIN "dbTipoCobranca.DB" DbTipoCobranca  ON (CRP.CodTipoCobranca = DbTipoCobranca.Codigo)');
  qConsulta.SQL.Add('FULL OUTER JOIN "dbCartaoCredito.DB" dbCartaoCredito ON (CRP.CodCartaoCredito = dbCartaoCredito.Codigo)');
  qConsulta.SQL.Add('WHERE (0=0)');
  if not CheckBox5.Checked then
    qConsulta.SQL.Add('  AND ((CRP.Cancelado = False) or (CRP.Cancelado is NULL))');
  if Edit1.Text <> '' then
  begin
    qConsulta.SQL.Add(' AND (CRP.NumTitBanco = :NumTitBanco) ');
    qConsulta.ParamByName('NumTitBanco').AsString := Edit1.Text;
  end;

  if CheckBox4.Checked then
    qConsulta.SQL.Add(' AND (CRP.NumTitBanco <> ' + QuotedStr('') + ')' );

  if not(CheckBox1.Checked) then
     qConsulta.SQL.Add(' AND (CRP.TitProtestado <> True) ');

  if RxDBLookupCombo1.Text <> '' then
    begin
      qConsulta.SQL.Add(' AND (CRP.CodTipoCobranca = :CodTipoCobranca) ');
      qConsulta.ParamByName('CodTipoCobranca').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if CurrencyEdit1.AsInteger > 0 then
    begin
      qConsulta.SQL.Add(' AND (CRP.NumNota = :NumNota) ');
      qConsulta.ParamByName('NumNota').AsInteger := CurrencyEdit1.AsInteger;
    end;
  if RxDBLookupCombo2.Text <> '' then
    begin
      qConsulta.SQL.Add(' AND (CRP.Filial = :Filial) ');
      qConsulta.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;
  if RxDBLookupCombo3.Text <> '' then
    begin
      qConsulta.SQL.Add(' AND (CRP.CodCli = :CodCli) ');
      qConsulta.ParamByName('CodCli').AsInteger := RxDBLookupCombo3.KeyValue;
    end;
  if RxDBLookupCombo4.Text <> '' then
    begin
      qConsulta.SQL.Add(' AND (CRP.CodBancoBoleto = :CodBancoBoleto) ');
      qConsulta.ParamByName('CodBancoBoleto').AsInteger := RxDBLookupCombo4.KeyValue;
    end;
  if RxDBLookupCombo6.Text <> '' then
    begin
      qConsulta.SQL.Add(' AND (CRP.CodVendedor = :CodVendedor) ');
      qConsulta.ParamByName('CodVendedor').AsInteger := RxDBLookupCombo6.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qConsulta.SQL.Add(' AND (CRP.DtGerado >= :DtGeradoIni)');
      qConsulta.ParamByName('DtGeradoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qConsulta.SQL.Add(' AND (CRP.DtGerado <= :DtGeradoFin)');
      qConsulta.ParamByName('DtGeradoFin').AsDate := DateEdit2.Date;
    end;
  if DateEdit3.Date > 0 then
    begin
      qConsulta.SQL.Add(' AND (CRP.DtVencCReceber >= :DtVencCReceberIni)');
      qConsulta.ParamByName('DtVencCReceberIni').AsDate := DateEdit3.Date;
    end;
  if DateEdit4.Date > 0 then
    begin
      qConsulta.SQL.Add(' AND (CRP.DtVencCReceber <= :DtVencCReceberFin)');
      qConsulta.ParamByName('DtVencCReceberFin').AsDate := DateEdit4.Date;
    end;
  if DateEdit5.Date > 0 then
    begin
      qConsulta.SQL.Add(' AND (CRP.DtVencimento2 >= :DtFinanceiroIni)');
      qConsulta.ParamByName('DtFinanceiroIni').AsDate := DateEdit5.Date;
    end;
  if DateEdit6.Date > 0 then
    begin
      qConsulta.SQL.Add(' AND (CRP.DtVencimento2 <= :DtFinanceiroFin)');
      qConsulta.ParamByName('DtFinanceiroFin').AsDate := DateEdit6.Date;
    end;
  case ComboBox1.ItemIndex of
    0 : qConsulta.SQL.Add(' AND (CRP.RestParcela > 0)');
    1 : qConsulta.SQL.Add(' AND (CRP.PgtoParcial > 0)');
  end;
  if (CheckBox2.Checked) and not(CheckBox3.Checked) then
    qConsulta.SQL.Add(' and ((CRP.Transferencia = False) or (CRP.Transferencia IS NULL)) ')
  else
  if not (CheckBox2.Checked) and (CheckBox3.Checked) then
    qConsulta.SQL.Add(' and (CRP.Transferencia = True) ');                                 


  case ComboBox2.ItemIndex of
    0 : qConsulta.SQL.Add('ORDER BY Dbcontas_1.NomeConta, CRP.DtVencCReceber, CRP.NumNota, CRP.ParcCReceber');
    1 : qConsulta.SQL.Add('ORDER BY dbTipoCobranca.Nome, CRP.DtVencCReceber, CRP.NumNota, CRP.ParcCReceber');
    2 : qConsulta.SQL.Add('ORDER BY dbCliente.Nome, CRP.CodCli, CRP.DtVencCReceber, CRP.NumNota, CRP.ParcCReceber');
    3 : qConsulta.SQL.Add('ORDER BY CRP.DtVencCReceber, CRP.NumNota, CRP.ParcCReceber');
    4 : qConsulta.SQL.Add('ORDER BY CRP.DtGerado, CRP.DtVencCReceber, CRP.NumNota, CRP.ParcCReceber');
    5 : qConsulta.SQL.Add('ORDER BY dbVendedor.Nome, CRP.DtVencCReceber, CRP.NumNota, CRP.ParcCReceber');
    6 : qConsulta.SQL.Add('ORDER BY CRP.DtVencimento2, CRP.DtVencCReceber, CRP.NumNota, CRP.ParcCReceber');
  end;
  qConsulta.Open;

  if DM1.tParametrosMostrarVale.AsBoolean then
  begin
    DM2.qVale.Close;
    DM2.qVale.Open;
    Label19.Caption := FormatFloat('###,###,##0.00',DM2.qValeVlrTotal.AsFloat);
  end;
end;

procedure TfContasReceber2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm1.GravaGrid(SMDBGrid1,Name);
  qConsulta.Close;
  if Screen.FormCount < 3 then
  begin
    DM1.tCliente.Close;
    DM1.tTipoCobranca.Close;
    DM1.tVendedor.Close;
    DM1.tPlanoContas.Close;
    DM1.tPlanoContasItens.Close;
    DM1.tCReceber.Close;
    DM1.tCReceberParc.Close;
    DM1.tCReceberParcHist.Close;
    DM1.tCReceberParcRem.Close;
    DM1.tExtComissao.Close;
    DM1.tMovimentos.Close;
    DM1.tJuros.Close;
    DM1.tFeriado.Close;
    DM1.tNotaFiscal.Close;
    DM1.tExtCartao.Close;
  end;
  RxDBFilter1.Active := False;
  Action := caFree;
end;

procedure TfContasReceber2.FormShow(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;

  DM1.tFilial.Open;
  DM1.tContas.Open;
  DM1.tCliente.Open;
  DM1.tTipoCobranca.Open;
  DM1.tVendedor.Open;
  DM1.tPlanoContas.Open;
  DM1.tPlanoContasItens.Open;
  DM1.tCReceber.Open;
  DM1.tCReceberParc.Open;
  DM1.tCReceberParcHist.Open;
  DM1.tCReceberParcRem.Open;
  DM1.tExtComissao.Open;
  DM1.tMovimentos.Open;
  DM1.tJuros.Open;
  DM1.tVendedor2.Open;
  DM1.tFeriado.Open;
  DM1.tNotaFiscal.Open;
  DM1.tExtCartao.Open;
  DM1.tCartaoCredito.Open;
  DM1.tParametros.Open;

  tCReceberParcHist.Open;
  RxDBFilter1.Active := True;

  Label18.Visible := DM1.tParametrosMostrarVale.AsBoolean;
  Label19.Visible := DM1.tParametrosMostrarVale.AsBoolean;
end;

procedure TfContasReceber2.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfContasReceber2.BitBtn99Click(Sender: TObject);
begin
  Monta_SQL;
  Calcula_Totais;
end;

procedure TfContasReceber2.qConsultaCalcFields(DataSet: TDataSet);
begin
  if qConsultaTransferencia.AsBoolean then
    qConsultaclTransferencia.AsString := 'T';
  if qConsultaRestParcela.AsFloat > 0 then
    qConsultaclDiasAtraso.AsFloat := Date - qConsultaDtVencCReceber.AsDateTime
  else
    qConsultaclDiasAtraso.AsFloat :=  qConsultaDtPagParcCReceber.AsDateTime - qConsultaDtVencCReceber.AsDateTime;
  if qConsultaclDiasAtraso.AsFloat <= 0 then
    qConsultaclDiasAtraso.AsFloat := 0;
end;

procedure TfContasReceber2.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit1.AsInteger > 0) then
    begin
      ComboBox1.ItemIndex := 2;
      BitBtn99Click(Sender);
    end;
end;

procedure TfContasReceber2.RxSpeedButton1Click(Sender: TObject);
begin
  //if (qConsulta.Active) and (qConsulta.RecordCount > 0) then
   // begin
      fConsCReceber := TfConsCReceber.Create(Self);
      fConsCReceber.ShowModal;
   // end
  //else
    //ShowMessage('Não existe registro para a impressão ou não foi feita a consulta!');
end;

procedure TfContasReceber2.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  {if qConsultaCancelado.AsBoolean then
    begin
      Background  := $00C080FF;
      AFont.Color := clBlack;
    end
  else
  if StrToFloat(FormatFloat('0.00', qConsultaRestParcela.AsFloat)) <= 0 then
    begin
      Background  := clTeal;
      AFont.Color := clWhite;
    end
  else
  if qConsultaclDiasAtraso.AsInteger > 0 then
    begin
      Background  := clRed;
      AFont.Color := clWhite;
    end;}

  if qConsultaCancelado.AsBoolean then
    AFont.Color := clGray
  else
  if StrToFloat(FormatFloat('0.00', qConsultaRestParcela.AsFloat)) <= 0 then
    AFont.Color := clTeal
  else
  if qConsultaTitProtestado.AsBoolean then
   AFont.Color := clMaroon
  else
  if qConsultaclDiasAtraso.AsInteger > 0 then
   AFont.Color := clRed;
end;

procedure TfContasReceber2.BitBtn1Click(Sender: TObject);
begin
  if qConsultaNumCReceber.AsInteger > 0 then
    Posiciona_Parcela;
  if not vExiste then
    exit;
  fConsCReceberHist := tfConsCReceberHist.Create(Self);
  fConsCReceberHist.ShowModal;
  CurrencyEdit1.SetFocus;
end;

procedure TfContasReceber2.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioCReceberAltera.AsBoolean then
  begin
    if qConsultaNumCReceber.AsInteger > 0 then
      Posiciona_Parcela;
    if not vExiste then
      exit;
    if (DM1.tCReceberParcRestParcela.AsFloat > 0) and (not DM1.tCReceberParcCancelado.AsBoolean) then
    begin
      fCReceberAltera := tfCReceberAltera.Create(Self);
      fCReceberAltera.ShowModal;
    end
    else
      ShowMessage('Parcela já quitada!');
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasReceber2.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioCReceberPag.AsBoolean then
    begin
      if qConsultaNumCReceber.AsInteger > 0 then
        Posiciona_Parcela;
      if not vExiste then
        exit;
      if (DM1.tCReceberParcRestParcela.AsFloat > 0) and (not DM1.tCReceberParcCancelado.AsBoolean) then
        begin
          fContasReceberPag := tfContasReceberPag.Create(Self);
          fContasReceberPag.ShowModal;
        end
      else
        ShowMessage('Parcela já quitada!');
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasReceber2.BitBtn5Click(Sender: TObject);
begin
  if DM1.tUsuarioEstPgtoRec.AsBoolean then
  begin
    if qConsultaNumCReceber.AsInteger > 0 then
      Posiciona_Parcela;
    if not vExiste then
      exit;
    fEstPagamento := TfEstPagamento.Create(Self);
    if MessageDlg('Deseja fazer estorno de Pgto?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      fEstPagamento.RxDBFilter1.Active := True;
      fEstPagamento.BitBtn2.Enabled    := False;
      fEstPagamento.BitBtn3.Enabled    := True;
      if (DM1.tCReceberParcHist.RecordCount > 0) and (not DM1.tCReceberParcCancelado.AsBoolean) then
      begin
        fEstPagamento.ShowModal;
        CurrencyEdit1.SetFocus;
      end
      else
        ShowMessage('Não há pagamentos a estornar!');
    end
    else
    begin
      fEstPagamento.RxDBFilter2.Active := True;
      fEstPagamento.BitBtn3.Enabled    := False;
      fEstPagamento.BitBtn2.Enabled    := True;
      if (DM1.tCReceberParcHist.RecordCount > 0) and (not DM1.tCReceberParcCancelado.AsBoolean) then
      begin
        fEstPagamento.ShowModal;
        CurrencyEdit1.SetFocus;
      end
      else
        ShowMessage('Não há devoluções a estornar!');
    end;
    fEstPagamento.RxDBFilter1.Active := False;
    fEstPagamento.RxDBFilter2.Active := False;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasReceber2.BitBtn6Click(Sender: TObject);
begin
  if DM1.tUsuarioCReceberPag.AsBoolean then
    begin
      if qConsultaNumCReceber.AsInteger > 0 then
        Posiciona_Parcela;
      if not vExiste then
        exit;
      if (DM1.tCReceberParcRestParcela.AsFloat > 0) and (not DM1.tCReceberParcCancelado.AsBoolean) then
        begin
          fContasReceberDev := tfContasReceberDev.Create(Self);
          fContasReceberDev.ShowModal;
          CurrencyEdit1.SetFocus;
        end
      else
        ShowMessage('Parcela já quitada e/ou Nota Fiscal cancelada!');
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasReceber2.BitBtn8Click(Sender: TObject);
begin
  fContasReceberPagSel := tfContasReceberPagSel.Create(Self);
  fContasReceberPagSel.ShowModal;
end;

procedure TfContasReceber2.BitBtn11Click(Sender: TObject);
begin
  if DM1.tUsuarioLancCReceber.AsBoolean then
    begin
      fLancaCReceber := tfLancaCReceber.Create(Self);
      fLancaCReceber.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasReceber2.BitBtn12Click(Sender: TObject);
begin
  if DM1.tUsuarioLancCReceber.AsBoolean then
    begin
      if qConsultaNumCReceber.AsInteger > 0 then
        Posiciona_Parcela;
      if not vExiste then
        exit;
      fLancaCReceber := tfLancaCReceber.Create(Self);
      fLancaCReceber.Tag := 1;
      fLancaCReceber.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasReceber2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F4 then
    BitBtn99Click(Sender);
  if key = vk_F5 then
    BitBtn1Click(Sender);
  if key = vk_F6 then
    BitBtn2Click(Sender);
  if key = vk_F7 then
    BitBtn3Click(Sender);
  if key = vk_F8 then
    BitBtn5Click(Sender);
  if key = vk_F9 then
    BitBtn6Click(Sender);
end;

procedure TfContasReceber2.BitBtn7Click(Sender: TObject);
begin
  Calcula_Totais;
end;

procedure TfContasReceber2.BitBtn4Click(Sender: TObject);
begin
  if (qConsulta.Active) and (qConsulta.RecordCount > 0) then
    begin
      SMDBGrid1.DisableScroll;
      fRelCReceber3 := TfRelCReceber3.Create(Self);
      fRelCReceber3.RLReport1.Preview;
      fRelCReceber3.RLReport1.Free;
      SMDBGrid1.EnableScroll;
    end
  else
    ShowMessage('Não existe registro para a impressão ou não foi feita a consulta!');
end;

procedure TfContasReceber2.BitBtn9Click(Sender: TObject);
begin
  fCReceberAlteraSel := tfCReceberAlteraSel.Create(Self);
  fCReceberAlteraSel.ShowModal;
end;

procedure TfContasReceber2.Pagto_CartaoCredito;
begin
  DM1.tExtCartao.Edit;
  DM1.tExtCartaoDtPagamento.AsDateTime := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
  DM1.tExtCartaoVlrPagamento.AsFloat   := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcVlrParcCReceber.AsFloat));
  DM1.tExtCartaoPago.AsBoolean         := True;
  DM1.tExtCartaoVlrPendente.AsFloat    := StrToFloat(FormatFloat('0.00',0));
  DM1.tExtCartao.Post;
end;

function TfContasReceber2.fnc_Achou_tExtCartao: Boolean;
begin
  Result := True;
  if not DM1.tExtCartao.Locate('Filial;NumCReceber;Parcela',VarArrayOf([DM1.tFilialCodigo.AsInteger,DM1.tCReceberParcNumCReceber.AsInteger,DM1.tCReceberParcParcCReceber.AsInteger]),[locaseinsensitive]) then
  begin
    ShowMessage('Não achou o registro na tabela de extrato do cartão de crédito para quitar!');
    Result := False;
  end;
end;

procedure TfContasReceber2.RxDBLookupCombo6Enter(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfContasReceber2.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tTipoCobranca.IndexFieldNames := 'Nome';
end;

procedure TfContasReceber2.FormCreate(Sender: TObject);
begin
  dm1.leGrid(SMDBGrid1,Name);
end;

procedure TfContasReceber2.Excluir_Pagto_CartaoCredito;
begin
  if DM1.tExtCartao.Locate('Filial;NumCReceber;Parcela',VarArrayOf([DM1.tFilialCodigo.AsInteger,DM1.tCReceberParcNumCReceber.AsInteger,DM1.tCReceberParcParcCReceber.AsInteger]),[]) then
  begin
    DM1.tExtCartao.Edit;
    DM1.tExtCartaoDtPagamento.Clear;
    DM1.tExtCartaoVlrPagamento.AsFloat := StrToFloat(FormatFloat('0.00',0));
    DM1.tExtCartaoPago.AsBoolean       := False;
    DM1.tExtCartaoVlrPendente.AsFloat  := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcVlrParcCReceber.AsFloat));
    DM1.tExtCartao.Post;
  end;
end;

end.
