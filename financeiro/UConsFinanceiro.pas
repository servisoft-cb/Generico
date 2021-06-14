unit UConsFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, Grids, DBGrids, SMDBGrid, Buttons, DB,
  DBTables, RxLookup, DBClient, ComCtrls, CurrEdit, ExtCtrls;

type
  TfConsFinanceiro = class(TForm)
    SMDBGrid1: TSMDBGrid;
    qCReceber: TQuery;
    qCReceberCodCli: TIntegerField;
    qCReceberNome: TStringField;
    qCReceberNumCReceber: TIntegerField;
    qCReceberParcCReceber: TIntegerField;
    qCReceberVlrParcCReceber: TFloatField;
    qCReceberDtVencCReceber: TDateField;
    qCReceberRestParcela: TFloatField;
    qCReceberDtVencimento2: TDateField;
    qCReceberFilial: TIntegerField;
    mFinanceiro: TClientDataSet;
    mFinanceiroData: TDateField;
    mFinanceiroDtVencimento: TDateField;
    mFinanceiroSaldo: TFloatField;
    mFinanceiroNome: TStringField;
    mFinanceiroBanco: TStringField;
    mFinanceiroNomeTipoCobranca: TStringField;
    dsmFinanceiro: TDataSource;
    qCPagar: TQuery;
    qCPagarCodForn: TIntegerField;
    qCPagarNomeForn: TStringField;
    qCPagarFilial: TIntegerField;
    qCPagarParcCPagar: TIntegerField;
    qCPagarNumCPagar: TIntegerField;
    qCPagarDtVencCPagar: TDateField;
    qCPagarVlrParcCPagar: TFloatField;
    qCPagarRestParcela: TFloatField;
    qCPagarCodConta: TIntegerField;
    qCPagarDtGerado: TDateField;
    qCReceberNumNota: TIntegerField;
    qCReceberDtGerado: TDateField;
    qCheque: TQuery;
    qChequeCodConta: TIntegerField;
    qChequeNumCheque: TIntegerField;
    qChequeDtPrevista: TDateField;
    qChequeVlrTotal: TFloatField;
    qChequeNominal: TStringField;
    mFinanceiroFilial: TIntegerField;
    qCReceberCodConta: TIntegerField;
    qCReceberCodTipoCobranca: TIntegerField;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    CheckBox1: TCheckBox;
    ProgressBar1: TProgressBar;
    Label4: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    qChequeNomeConta: TStringField;
    qChequeFilial: TIntegerField;
    CheckBox2: TCheckBox;
    mFinanceiroVlrCredito: TFloatField;
    mFinanceiroVlrDebito: TFloatField;
    mFinanceiroTipo: TStringField;
    mFinanceiroNumNota: TStringField;
    mFinanceiroParcela: TIntegerField;
    qCPagarNroDuplicata: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure mFinanceiroNewRecord(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    vSqlCReceber, vSqlCPagar, vSqlCheque : String;
    procedure Monta_SQL;
    procedure Le_SQL;
  public
    { Public declarations }
  end;

var
  fConsFinanceiro: TfConsFinanceiro;

implementation

uses UDM1, UFluxoFuturo, URelFinanceiro;

{$R *.dfm}

procedure TfConsFinanceiro.Le_SQL;
var
  vSaldo : Real;
begin
  ProgressBar1.Max      := qCReceber.RecordCount + qCPagar.RecordCount + qCheque.RecordCount;
  ProgressBar1.Position := 0;
  
  mFinanceiro.EmptyDataSet;
  qCReceber.First;
  while not qCReceber.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      mFinanceiro.Insert;
      mFinanceiroData.AsDateTime         := qCReceberDtVencimento2.AsDateTime;
      mFinanceiroDtVencimento.AsDateTime := qCReceberDtVencCReceber.AsDateTime;
      mFinanceiroVlrCredito.AsFloat      := qCReceberRestParcela.AsFloat;
      mFinanceiroNome.AsString           := qCReceberNome.AsString;
      if DM1.tContas.Locate('CodConta',qCReceberCodConta.AsInteger,[loCaseInsensitive]) then
        mFinanceiroBanco.AsString := DM1.tContasNomeConta.AsString;
      if DM1.tTipoCobranca.Locate('Codigo',qCReceberCodTipoCobranca.AsInteger,[loCaseInsensitive]) then
        mFinanceiroNomeTipoCobranca.AsString := DM1.tTipoCobrancaNome.AsString;
      mFinanceiroFilial.AsInteger  := qCReceberFilial.AsInteger;
      mFinanceiroTipo.AsString     := 'Receber';
      mFinanceiroNumNota.AsString  := qCReceberNumNota.AsString;
      mFinanceiroParcela.AsInteger := qCReceberParcCReceber.AsInteger;
      mFinanceiro.Post;
      qCReceber.Next;
    end;

  qCPagar.First;
  while not qCPagar.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      mFinanceiro.Insert;
      mFinanceiroData.AsDateTime         := qCPagarDtVencCPagar.AsDateTime;
      mFinanceiroDtVencimento.AsDateTime := qCPagarDtVencCPagar.AsDateTime;
      mFinanceiroVlrDebito.AsFloat       := qCPagarRestParcela.AsFloat;
      mFinanceiroNome.AsString           := qCPagarNomeForn.AsString;
      if DM1.tContas.Locate('CodConta',qCPagarCodConta.AsInteger,[loCaseInsensitive]) then
        mFinanceiroBanco.AsString := DM1.tContasNomeConta.AsString;
      mFinanceiroNomeTipoCobranca.AsString := '';
      mFinanceiroFilial.AsInteger  := qCPagarFilial.AsInteger;
      mFinanceiroTipo.AsString     := 'Pagar';
      mFinanceiroNumNota.AsString  := qCPagarNroDuplicata.AsString;
      mFinanceiroParcela.AsInteger := qCPagarParcCPagar.AsInteger;
      mFinanceiro.Post;
      qCPagar.Next;
    end;

  qCheque.First;
  while not qCheque.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      mFinanceiro.Insert;
      mFinanceiroData.AsDateTime           := qChequeDtPrevista.AsDateTime;
      mFinanceiroDtVencimento.AsDateTime   := qChequeDtPrevista.AsDateTime;
      mFinanceiroVlrDebito.AsFloat         := qChequeVlrTotal.AsFloat;
      mFinanceiroNome.AsString             := qChequeNominal.AsString;
      mFinanceiroBanco.AsString            := qChequeNomeConta.AsString;
      mFinanceiroNomeTipoCobranca.AsString := '';
      mFinanceiroFilial.AsInteger          := qChequeFilial.AsInteger;
      mFinanceiroTipo.AsString             := 'Cheque';
      mFinanceiroNumNota.AsString          := qChequeNumCheque.AsString;
      mFinanceiro.Post;
      qCheque.Next;
    end;

  vSaldo := 0;
  if DateEdit1.Date > 0 then
    begin
      fFluxoFuturo.Monta_Atraso(DateEdit1.Date,CheckBox1.Checked);
      vSaldo := fFluxoFuturo.vSaldoAnt;
      mFinanceiro.Insert;
      mFinanceiroData.Clear;
      mFinanceiroNome.AsString := ' *** SALDO ANTERIOR *** ';
      mFinanceiro.Post;
    end;
  CurrencyEdit1.Value   := vSaldo;
  ProgressBar1.Max      := mFinanceiro.RecordCount;
  ProgressBar1.Position := 0;
  mFinanceiro.First;
  while not mFinanceiro.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      if (CheckBox2.Checked) or (not(CheckBox2.Checked) and (mFinanceiroData.AsDateTime > 1)) then
        begin
          vSaldo := vSaldo + (mFinanceiroVlrCredito.AsFloat - mFinanceiroVlrDebito.AsFloat);
          mFinanceiro.Edit;
          mFinanceiroSaldo.AsFloat := vSaldo;
          mFinanceiro.Post;
        end;
      mFinanceiro.Next;
    end;
end;

procedure TfConsFinanceiro.Monta_SQL;
begin
  //Contas a Receber
  qCReceber.Close;
  qCReceber.SQL.Text := vSqlCReceber;
  qCReceber.SQL.Add('  AND ((dbCReceberParc.Cancelado = False) or (dbCReceberParc.Cancelado is Null))');
  if not CheckBox1.Checked then
    qCReceber.SQL.Add('  AND ((dbCReceberParc.Transferencia = False) or (dbCReceberParc.Transferencia is Null))');
  if RxDBLookupCombo1.Text <> '' then
    begin
      qCReceber.SQL.Add('  AND (dbCReceberParc.Filial = :Filial)');
      qCReceber.ParamByName('Filial').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qCReceber.SQL.Add('  AND (dbCReceberParc.DtVencimento2 >= :DtInicial)');
      qCReceber.ParamByName('DtInicial').AsDate := DateEdit1.date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qCReceber.SQL.Add('  AND (dbCReceberParc.DtVencimento2 <= :DtFinal)');
      qCReceber.ParamByName('DtFinal').AsDate := DateEdit2.date;
    end;
  qCReceber.Open;

  //Contas Pagar
  qCPagar.Close;
  qCPagar.SQL.Text := vSqlCPagar;
  if RxDBLookupCombo1.Text <> '' then
    begin
      qCPagar.SQL.Add('  AND (dbCPagarParc.Filial = :Filial)');
      qCPagar.ParamByName('Filial').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qCPagar.SQL.Add('  AND (dbCPagarParc.DtVencCPagar >= :DtInicial)');
      qCPagar.ParamByName('DtInicial').AsDate := DateEdit1.date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qCPagar.SQL.Add('  AND (dbCPagarParc.DtVencCPagar <= :DtFinal)');
      qCPagar.ParamByName('DtFinal').AsDate := DateEdit2.date;
    end;
  qCPagar.Open;

  //Cheques
  qCheque.Close;
  qCheque.SQL.Text := vSqlCheque;
  if RxDBLookupCombo1.Text <> '' then
    begin
      qCheque.SQL.Add('  AND (dbCheque.Filial = :Filial)');
      qCheque.ParamByName('Filial').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qCheque.SQL.Add('  AND (dbCheque.DtPrevista >= :DtInicial)');
      qCheque.ParamByName('DtInicial').AsDate := DateEdit1.date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qCheque.SQL.Add('  AND (dbCheque.DtPrevista <= :DtFinal)');
      qCheque.ParamByName('DtFinal').AsDate := DateEdit2.date;
    end;
  qCheque.Open;
end;

procedure TfConsFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qCReceber.Close;
  qCPagar.Close;
  qCheque.Close;
  Action := Cafree;
end;

procedure TfConsFinanceiro.FormShow(Sender: TObject);
begin
  Top   := 0;
  Left  := 0;
  Width := Screen.Width;
  Height := Screen.Height - 35;

  vSqlCReceber := qCReceber.SQL.Text;
  vSqlCPagar   := qCPagar.SQL.Text;
  vSqlCheque   := qCheque.SQL.Text;

  DM1.tTipoCobranca.Open;
  DM1.tContas.Open;
end;

procedure TfConsFinanceiro.BitBtn1Click(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  Monta_SQL;
  Le_SQL;
  SMDBGrid1.EnableScroll;
end;

procedure TfConsFinanceiro.mFinanceiroNewRecord(DataSet: TDataSet);
begin
  mFinanceiroVlrCredito.AsFloat := 0;
  mFinanceiroVlrDebito.AsFloat  := 0;
  mFinanceiroSaldo.AsFloat      := 0;
end;

procedure TfConsFinanceiro.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsFinanceiro.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if mFinanceiroSaldo.AsFloat < 0 then
    AFont.Color := clRed;
end;

procedure TfConsFinanceiro.BitBtn2Click(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  fRelFinanceiro := TfRelFinanceiro.Create(Self);
  fRelFinanceiro.RLReport1.Preview;
  fRelFinanceiro.RLReport1.Free;
  SMDBGrid1.EnableScroll;
end;

end.
