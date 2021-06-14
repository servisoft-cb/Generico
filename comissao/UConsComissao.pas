unit UConsComissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit, RxLookup, Grids, DBGrids, RXDBCtrl,
  Db, DBTables, ExtCtrls, RXCtrls, CurrEdit, MemTable, Variants, SMDBGrid,
  DBClient, RzTabs;

type
  TfConsComissao = class(TForm)
    qComissao: TQuery;
    dsqComissao: TDataSource;
    qComissaoDtReferencia: TDateField;
    qComissaoCodCliente: TIntegerField;
    qComissaoParcDoc: TIntegerField;
    qComissaoNroDoc: TIntegerField;
    qComissaoFuncao: TStringField;
    qComissaoVlrBase: TFloatField;
    qComissaoPercDescDupl: TFloatField;
    qComissaoPercComissao: TFloatField;
    qComissaoVlrComissao: TFloatField;
    qComissaoTipo: TStringField;
    qComissaolkNomeCliente: TStringField;
    qSaldoAnt: TQuery;
    qSaldoAntFuncao: TStringField;
    qSaldoAntVlrComissao: TFloatField;
    qSaldoAntCodVendedor: TIntegerField;
    qSaldoAntNome: TStringField;
    mVerifica: TMemoryTable;
    mVerificaNumNota: TIntegerField;
    mVerificaParcela: TIntegerField;
    qComissaoFilial: TIntegerField;
    qComissaolkNomeFilial: TStringField;
    mVerificaFilial: TIntegerField;
    mResumido: TClientDataSet;
    mResumidoCodVendedor: TIntegerField;
    mResumidoNomeVendedor: TStringField;
    mResumidoSaldoAnt: TFloatField;
    mResumidoVlrEntrada: TFloatField;
    mResumidoVlrSaida: TFloatField;
    mResumidoVlrDevolucao: TFloatField;
    mResumidoVlrIRPeriodo: TFloatField;
    mResumidoVlrIRAnt: TFloatField;
    mResumidoVlrIRAcumulado: TFloatField;
    mResumidoSaldoAcumulado: TFloatField;
    mResumidoVlrTotalAnt: TFloatField;
    mResumidoVlrTotalPeriodo: TFloatField;
    mResumidoVlrTotalAcumulado: TFloatField;
    dsmResumido: TDataSource;
    qPeriodo: TQuery;
    qPeriodoNome: TStringField;
    qPeriodoFuncao: TStringField;
    qPeriodoVlrComissao: TFloatField;
    qPeriodoCodVendedor: TIntegerField;
    mResumidoPercIR: TFloatField;
    qPeriodoPercImpRenda: TFloatField;
    qSaldoAntPercImpRenda: TFloatField;
    Panel2: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    ComboBox1: TComboBox;
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel9: TRxLabel;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit9: TCurrencyEdit;
    GroupBox3: TGroupBox;
    RxLabel7: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel10: TRxLabel;
    CurrencyEdit7: TCurrencyEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit10: TCurrencyEdit;
    GroupBox4: TGroupBox;
    RxLabel6: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel11: TRxLabel;
    CurrencyEdit6: TCurrencyEdit;
    CurrencyEdit8: TCurrencyEdit;
    CurrencyEdit11: TCurrencyEdit;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    StaticText1: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure DateEdit2Exit(Sender: TObject);
    procedure RxDBLookupCombo2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_SaldoAnt;
    procedure Monta_SaldoPeriodo;

  public
    { Public declarations }
    vVlrPago : Real;
    procedure Monta_SqlComissao;
  end;

var
  fConsComissao: TfConsComissao;

implementation

uses UDM1, UPgtoComissao2, UConsComissaoDet, URelExtComissao;

{$R *.DFM}

procedure TfConsComissao.Monta_SqlComissao;
begin
  qComissao.Close;
  qComissao.SQL.Clear;
  qComissao.SQL.Add('SELECT DtReferencia, CodCliente, ParcDoc, NroDoc, Funcao, VlrBase, PercDescDupl, PercComissao, VlrComissao, Tipo, Filial, CodVendedor');
  qComissao.SQL.Add('FROM "dbExtComissao.db" Dbextcomissao');
  qComissao.SQL.Add('WHERE (Dbextcomissao.DtReferencia BETWEEN :DtIni AND :DtFin)');
  qComissao.SQL.Add('  AND (Dbextcomissao.CodVendedor = :CodVendedor)');
  if RxDBLookupCombo2.Text <> '' then
    begin
      qComissao.SQL.Add('  AND (Dbextcomissao.Filial = :Filial)');
      qComissao.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;
  qComissao.ParamByName('DtIni').AsDate     := DateEdit1.Date;
  qComissao.ParamByName('DtFin').AsDate     := DateEdit2.Date;
  qComissao.ParamByName('CodVendedor').AsInteger := mResumidoCodVendedor.AsInteger;
  case ComboBox1.ItemIndex of
    0 : qComissao.SQL.Add('ORDER BY Dbextcomissao.DtReferencia, Dbextcomissao.NroDoc, Dbextcomissao.ParcDoc, Dbextcomissao.Funcao');
    1 : qComissao.SQL.Add('ORDER BY Dbextcomissao.NroDoc, Dbextcomissao.DtReferencia, Dbextcomissao.ParcDoc, Dbextcomissao.Funcao');
  end;
  qComissao.Open;
end;

procedure TfConsComissao.Monta_SaldoPeriodo;
var
  vEntradas, vSaidas, vDevolucao, vSaldoTotal, vSaldoAnterior, vSaldoPeriodo  : Real;
begin
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit3.Clear;
  CurrencyEdit4.Clear;
  CurrencyEdit5.Clear;
  CurrencyEdit6.Clear;
  CurrencyEdit7.Clear;
  CurrencyEdit8.Clear;
  CurrencyEdit9.Clear;
  CurrencyEdit10.Clear;
  CurrencyEdit11.Clear;

  qPeriodo.Close;
  qPeriodo.SQL.Clear;
  qPeriodo.SQL.Add('SELECT Dbvendedor.Nome, Dbextcomissao.Funcao, SUM( Dbextcomissao.VlrComissao ) VlrComissao, dbExtComissao.CodVendedor, Dbvendedor.PercImpRenda');
  qPeriodo.SQL.Add('FROM "dbExtComissao.db" Dbextcomissao');
  qPeriodo.SQL.Add('   INNER JOIN "dbVendedor.DB" Dbvendedor');
  qPeriodo.SQL.Add('   ON  (Dbextcomissao.CodVendedor = Dbvendedor.Codigo)');
  qPeriodo.SQL.Add('   WHERE  (Dbextcomissao.DtReferencia BETWEEN :DtIni AND :DtFin) ');
  if RxDBLookupCombo2.Text <> '' then
    begin
      qPeriodo.SQL.Add('  AND Dbextcomissao.Filial = :Filial');
      qPeriodo.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;
  qPeriodo.ParamByName('DtIni').AsDate := DateEdit1.Date;
  qPeriodo.ParamByName('DtFin').AsDate := DateEdit2.Date;
  qPeriodo.SQL.Add('GROUP BY Dbvendedor.Nome, Dbextcomissao.Funcao, dbExtComissao.CodVendedor, Dbvendedor.PercImpRenda');
  qPeriodo.SQL.Add('ORDER BY Dbvendedor.Nome');
  qPeriodo.Open;
  qPeriodo.First;
  while not qPeriodo.Eof do
    begin
      if mResumido.Locate('CodVendedor',qPeriodoCodVendedor.AsInteger,[loCaseInsensitive]) then
        mResumido.Edit
      else
        begin
          mResumido.Insert;
          mResumidoCodVendedor.AsInteger := qPeriodoCodVendedor.AsInteger;
          mResumidoNomeVendedor.AsString := qPeriodoNome.AsString;
          mResumidoPercIR.AsFloat        := qPeriodoPercImpRenda.AsFloat;
        end;
      if qPeriodoFuncao.AsString = 'E' then
        begin
          mResumidoVlrEntrada.AsFloat      := mResumidoVlrEntrada.AsFloat + qPeriodoVlrComissao.AsFloat;
          mResumidoVlrTotalPeriodo.AsFloat := mResumidoVlrTotalPeriodo.AsFloat + qPeriodoVlrComissao.AsFloat;
        end
      else
      if qPeriodoFuncao.AsString = 'S' then
        begin
          mResumidoVlrSaida.AsFloat := mResumidoVlrSaida.AsFloat + qPeriodoVlrComissao.AsFloat;
          mResumidoVlrTotalPeriodo.AsFloat := mResumidoVlrTotalPeriodo.AsFloat - qPeriodoVlrComissao.AsFloat;
        end
      else
      if qPeriodoFuncao.AsString = 'D' then
        begin
          mResumidoVlrDevolucao.AsFloat    := mResumidoVlrDevolucao.AsFloat + qPeriodoVlrComissao.AsFloat;
          mResumidoVlrTotalPeriodo.AsFloat := mResumidoVlrTotalPeriodo.AsFloat - qPeriodoVlrComissao.AsFloat;
        end;
      mResumido.Post;
      qPeriodo.Next;
    end;

  vEntradas      := 0;
  vSaidas        := 0;
  vDevolucao     := 0;
  vSaldoTotal    := 0;
  vSaldoAnterior := 0;
  vSaldoPeriodo  := 0;
  mResumido.First;
  while not mResumido.Eof do
    begin
      mResumido.Edit;
      if (mResumidoPercIR.AsFloat > 0) and (mResumidoSaldoAnt.AsFloat > 0) then
        begin
          mResumidoVlrIRAnt.AsFloat := StrToFloat(FormatFloat('0.00',(mResumidoSaldoAnt.AsFloat * mResumidoPercIR.AsFloat) / 100));
          if mResumidoVlrIRAnt.AsFloat < DM1.tParametrosVlrLimImpRenda.AsFloat then
            mResumidoVlrIRAnt.AsFloat := 0;
        end;
      mResumidoVlrTotalAnt.AsFloat := mResumidoSaldoAnt.AsFloat - mResumidoVlrIRAnt.AsFloat;

      if (mResumidoPercIR.AsFloat > 0) and (mResumidoVlrTotalPeriodo.AsFloat > 0) then
        begin
          mResumidoVlrIRPeriodo.AsFloat := StrToFloat(FormatFloat('0.00',(mResumidoVlrTotalPeriodo.AsFloat * mResumidoPercIR.AsFloat) / 100));
          if mResumidoVlrIRPeriodo.AsFloat < DM1.tParametrosVlrLimImpRenda.AsFloat then
            mResumidoVlrIRPeriodo.AsFloat := 0;
        end;
      mResumidoVlrTotalPeriodo.AsFloat := mResumidoVlrTotalPeriodo.AsFloat - mResumidoVlrIRPeriodo.AsFloat;

      //mResumidoSaldoAcumulado.AsFloat := mResumidoSaldoAcumulado.AsFloat + mResumidoVlrTotalAnt.AsFloat + mResumidoVlrTotalPeriodo.AsFloat;
      mResumidoSaldoAcumulado.AsFloat := mResumidoVlrEntrada.AsFloat - mResumidoVlrSaida.AsFloat - mResumidoVlrDevolucao.AsFloat + mResumidoSaldoAnt.AsFloat;
      if (mResumidoPercIR.AsFloat > 0) and (mResumidoSaldoAcumulado.AsFloat > 0) then
        begin
          //Tirei a linha que soma e coloquei a que multiplica 03/12/2008
          //mResumidoVlrIRAcumulado.AsFloat := StrToFloat(FormatFloat('0.00',mResumidoVlrIRAnt.AsFloat + mResumidoVlrIRPeriodo.AsFloat));
          mResumidoVlrIRAcumulado.AsFloat := StrToFloat(FormatFloat('0.00',(mResumidoSaldoAcumulado.AsFloat * mResumidoPercIR.AsFloat) / 100));
          if mResumidoVlrIRAcumulado.AsFloat < DM1.tParametrosVlrLimImpRenda.AsFloat then
            mResumidoVlrIRAcumulado.AsFloat := 0;
        end;
      mResumidoVlrTotalAcumulado.AsFloat := mResumidoSaldoAcumulado.AsFloat - mResumidoVlrIRAcumulado.AsFloat;

      CurrencyEdit2.Value := CurrencyEdit2.Value + mResumidoVlrEntrada.AsFloat;
      CurrencyEdit3.Value := CurrencyEdit3.Value + mResumidoVlrSaida.AsFloat;
      CurrencyEdit4.Value := CurrencyEdit4.Value + mResumidoVlrDevolucao.AsFloat;
      CurrencyEdit9.Value := CurrencyEdit9.Value + mResumidoVlrIRPeriodo.AsFloat;
      CurrencyEdit5.Value := CurrencyEdit5.Value + mResumidoVlrTotalPeriodo.AsFloat;

      CurrencyEdit1.Value  := CurrencyEdit1.Value + mResumidoSaldoAnt.AsFloat;
      CurrencyEdit7.Value  := CurrencyEdit7.Value + mResumidoVlrIRAnt.AsFloat;
      CurrencyEdit10.Value := CurrencyEdit10.Value + mResumidoVlrTotalAnt.AsFloat;

      CurrencyEdit6.Value  := CurrencyEdit6.Value + mResumidoSaldoAcumulado.AsFloat;
      CurrencyEdit11.Value := CurrencyEdit11.Value + mResumidoVlrIRAcumulado.AsFloat;
      CurrencyEdit8.Value  := CurrencyEdit8.Value + mResumidoVlrTotalAcumulado.AsFloat;

      {vEntradas      := vEntradas + mResumidoVlrEntrada.AsFloat;
      vSaidas        := vSaidas + mResumidoVlrSaida.AsFloat;
      vDevolucao     := vDevolucao + mResumidoVlrDevolucao.AsFloat;
      vSaldoAnterior := vSaldoAnterior + mResumidoSaldoAnt.AsFloat;
      vSaldoPeriodo  := vSaldoPeriodo + mResumidoVlrTotalPeriodo.AsFloat;
      vSaldoTotal    := vSaldoTotal + mResumidoSaldoAcumulado.AsFloat;}

      mResumido.Next;
    end;
end;

procedure TfConsComissao.Monta_SaldoAnt;
begin
  qSaldoAnt.Close;
  qSaldoAnt.SQL.Clear;
  qSaldoAnt.SQL.Add('SELECT Dbextcomissao.Funcao, SUM( Dbextcomissao.VlrComissao ) VlrComissao, Dbextcomissao.CodVendedor, Dbvendedor.Nome, dbVendedor.PercImpRenda');
  qSaldoAnt.SQL.Add('FROM "dbExtComissao.db" Dbextcomissao');
  qSaldoAnt.SQL.Add('   INNER JOIN "dbVendedor.DB" Dbvendedor');
  qSaldoAnt.SQL.Add('   ON  (Dbextcomissao.CodVendedor = Dbvendedor.Codigo)');
  qSaldoAnt.SQL.Add('WHERE  Dbextcomissao.DtReferencia < :DtIni');
  //qSaldoAnt.SQL.Add('       AND Dbextcomissao.CodVendedor = :Codigo');
  if RxDBLookupCombo2.Text <> '' then
    begin
      qSaldoAnt.SQL.Add('  AND Dbextcomissao.Filial = :Filial');
      qSaldoAnt.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;
  qSaldoAnt.ParamByName('DtIni').AsDate     := DateEdit1.Date;
  //qSaldoAnt.ParamByName('Codigo').AsInteger := RxDBLookupCombo1.KeyValue;
  qSaldoAnt.SQL.Add('GROUP BY Dbextcomissao.Funcao, Dbextcomissao.CodVendedor, Dbvendedor.Nome, Dbvendedor.PercImpRenda');
  qSaldoAnt.SQL.Add('ORDER BY Dbextcomissao.CodVendedor');
  qSaldoAnt.Open;
  qSaldoAnt.First;
  while not qSaldoAnt.Eof do
    begin
      if mResumido.Locate('CodVendedor',qSaldoAntCodVendedor.AsInteger,[loCaseInsensitive]) then
        mResumido.Edit
      else
        begin
          mResumido.Insert;
          mResumidoCodVendedor.AsInteger := qSaldoAntCodVendedor.AsInteger;
          mResumidoNomeVendedor.AsString := qSaldoAntNome.AsString;
          mResumidoPercIR.AsFloat        := qSaldoAntPercImpRenda.AsFloat;
        end;
      if qSaldoAntFuncao.AsString = 'E' then
        mResumidoSaldoAnt.AsFloat := mResumidoSaldoAnt.AsFloat + qSaldoAntVlrComissao.AsFloat
      else
      if qSaldoAntFuncao.AsString = 'D' then
        mResumidoSaldoAnt.AsFloat := mResumidoSaldoAnt.AsFloat - qSaldoAntVlrComissao.AsFloat
      else
      if qSaldoAntFuncao.AsString = 'S' then
        mResumidoSaldoAnt.AsFloat := mResumidoSaldoAnt.AsFloat - qSaldoAntVlrComissao.AsFloat;
      mResumido.Post;
      qSaldoAnt.Next;
    end;
  qSaldoAnt.Close;
end;

procedure TfConsComissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tVendedor.IndexFieldNames := 'Codigo';
  DM1.tVendedor.Close;
  DM1.tExtComissao.Close;
  qComissao.Close;
  qSaldoAnt.Close;
  qPeriodo.Close;
  Action := caFree;
end;

procedure TfConsComissao.BitBtn3Click(Sender: TObject);
var
  vEntradas, vSaidas, vDevolucao, vSaldoTotal, vSaldoAnterior, vSaldoPeriodo  : Real;
begin
  if DateEdit1.Date <= 1 then
    begin
      ShowMessage('Falta informar a data inicial!');
      exit;
    end;

  mResumido.EmptyDataSet;
  Monta_SaldoAnt;
  Monta_SaldoPeriodo;
end;

procedure TfConsComissao.DateEdit2Exit(Sender: TObject);
begin
  RxLabel6.Caption := 'Saldo até a data ' + DateEdit2.Text;
end;

procedure TfConsComissao.RxDBLookupCombo2Change(Sender: TObject);
begin
  qComissao.Close;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit3.Clear;
  CurrencyEdit4.Clear;
  CurrencyEdit5.Clear;
  CurrencyEdit6.Clear;
end;

procedure TfConsComissao.FormShow(Sender: TObject);
begin
  Top   := 0;
  Left  := 0;
  Width := Screen.Width;
  Height := Screen.Height - 35;

  DM1.tVendedor.Open;
  DM1.tExtComissao.Open;
end;

procedure TfConsComissao.SMDBGrid1DblClick(Sender: TObject);
begin
  vVlrPago := 0;
  Monta_SqlComissao;
  fConsComissaoDet := TfConsComissaoDet.Create(Self);
  fConsComissaoDet.ShowModal;
  if vVlrPago > 0 then
    begin
      CurrencyEdit3.Value := CurrencyEdit3.Value + vVlrPago;
      CurrencyEdit5.Value := CurrencyEdit5.Value - vVlrPago;
      CurrencyEdit6.Value := CurrencyEdit6.Value - vVlrPago;
      CurrencyEdit8.Value := CurrencyEdit8.Value - vVlrPago;
    end;
end;

procedure TfConsComissao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsComissao.BitBtn1Click(Sender: TObject);
begin
  Tag := 0;
  fRelExtComissao := TfRelExtComissao.Create(Self);
  fRelExtComissao.RLReport1.Preview;
  fRelExtComissao.RLReport1.Free;
end;

procedure TfConsComissao.BitBtn4Click(Sender: TObject);
begin
  Tag := 1;
  fRelExtComissao := TfRelExtComissao.Create(Self);
  fRelExtComissao.RLReport1.Preview;
  fRelExtComissao.RLReport1.Free;
end;

end.
