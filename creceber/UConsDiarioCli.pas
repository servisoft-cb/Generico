unit UConsDiarioCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Mask, ToolEdit, ExtCtrls, Buttons, Grids,
  DBGrids, SMDBGrid, DB, DBTables, ComCtrls, DBClient, RXCtrls, CurrEdit;

type
  TfConsDiarioCli = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    SMDBGrid1: TSMDBGrid;
    qConsulta: TQuery;
    dsqConsulta: TDataSource;
    ProgressBar1: TProgressBar;
    dsmDiario: TDataSource;
    qSaldoAnt: TQuery;
    RxLabel1: TRxLabel;
    CheckBox1: TCheckBox;
    CurrencyEdit1: TCurrencyEdit;
    qConsultaFilial: TIntegerField;
    qConsultaNumCReceber: TIntegerField;
    qConsultaParcCReceber: TIntegerField;
    qConsultaCodCli: TIntegerField;
    qConsultaNumNota: TIntegerField;
    qConsultaVlrParcCReceber: TFloatField;
    qConsultaDtVencCReceber: TDateField;
    qConsultaDtUltPgto: TDateField;
    qConsultaVlrUltPgto: TFloatField;
    qConsultaTipo: TStringField;
    qConsultaVlrUltDescontos: TFloatField;
    qConsultaVlrDevolucao: TFloatField;
    qConsultaNomeCli: TStringField;
    qSaldoAntVlrParcCReceber: TFloatField;
    qSaldoAntVlrUltPgto: TFloatField;
    qSaldoAntVlrUltDescontos: TFloatField;
    qSaldoAntVlrDevolucao: TFloatField;
    qSaldoAntTipo: TStringField;
    mDiario: TClientDataSet;
    mDiarioParcela: TIntegerField;
    mDiarioData: TDateField;
    mDiarioHistorico: TStringField;
    mDiarioNumNota: TIntegerField;
    mDiarioFilial: TIntegerField;
    mDiarioDebito: TFloatField;
    mDiarioCredito: TFloatField;
    mDiarioNumControle: TIntegerField;
    mDiarioCodCli: TIntegerField;
    mDiarioNomeCli: TStringField;
    mDiarioNumCReceber: TIntegerField;
    Label5: TLabel;
    CurrencyPagina: TCurrencyEdit;
    Label6: TLabel;
    CurrencyPaginaFinal: TCurrencyEdit;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure mDiarioNewRecord(DataSet: TDataSet);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
  private
    { Private declarations }
    vDataAux : TDateTime;
    vDebito, vCredito, vSaldo : Real;
    procedure Monta_SQLqConsulta;
    procedure Monta_SQLqSaldoAnt;
    procedure Le_qConsulta;
    procedure Grava_mDiario(Tipo : String);
  public
    { Public declarations }
    vNomeFilial : String;
  end;

var
  fConsDiarioCli: TfConsDiarioCli;

implementation

uses UDM1, URelDiarioCli, URelatorio;

{$R *.dfm}

procedure TfConsDiarioCli.Monta_SQLqSaldoAnt;
var
  vAux : Real;
begin
  qSaldoAnt.Close;
  qSaldoAnt.SQL.Clear;
  qSaldoAnt.SQL.Add('SELECT SUM( DbCReceberparc.VlrParcCReceber ) VlrParcCReceber, SUM( DbCReceberparchist.VlrUltPgto ) VlrUltPgto, ');
  qSaldoAnt.SQL.Add(' SUM( DbCReceberparchist.VlrUltDescontos ) VlrUltDescontos, SUM( DbCReceberparchist.VlrDevolucao ) VlrDevolucao, DbCReceberparchist.Tipo, dbcreceberparc.codcli ');
  qSaldoAnt.SQL.Add('FROM "dbCReceberParc.DB" DbCReceberparc');
  qSaldoAnt.SQL.Add('   INNER JOIN "dbCReceberParcHist.DB" DbCReceberparchist');
  qSaldoAnt.SQL.Add('   ON  (DbCReceberparc.Filial = DbCReceberparchist.Filial)');
  qSaldoAnt.SQL.Add('   AND  (DbCReceberparc.NumCReceber = DbCReceberparchist.NumCReceber)');
  qSaldoAnt.SQL.Add('   AND  (DbCReceberparc.ParcCReceber = DbCReceberparchist.ParcCReceber)');
  qSaldoAnt.SQL.Add('WHERE  ((DbCReceberparchist.Tipo <> ''ALT'' ) and  (DbCReceberparchist.Tipo <> ''DIV'' ) and  (DbCReceberparchist.Tipo <> ''OUT'' ))');
  qSaldoAnt.SQL.Add('      AND  (dbCReceberParcHist.DtUltPgto < :DataIni)');
  qSaldoAnt.SQL.Add('      AND  ((dbCReceberParc.Cancelado = False) or (dbCReceberParc.Cancelado is Null))');
  if RxDBLookupCombo1.Text <> '' then
    begin
      qSaldoAnt.SQL.Add(' AND (dbCReceberParc.Filial = :Filial)');
      qSaldoAnt.ParamByName('Filial').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  qSaldoAnt.SQL.Add('GROUP BY DbCReceberparchist.Tipo, dbcreceberparc.codcli');
  qSaldoAnt.ParamByName('DataIni').AsDate := DateEdit1.Date;
  qSaldoAnt.Open;

  vAux := 0;
  qSaldoAnt.First;
  while not qSaldoAnt.Eof do
    begin
      if qSaldoAntTipo.AsString = 'ENT' then
        vAux := vAux + qSaldoAntVlrParcCReceber.AsFloat
      else
      if qSaldoAntTipo.AsString = 'PAG' then
        vAux := vAux - qSaldoAntVlrUltPgto.AsFloat - qSaldoAntVlrUltDescontos.AsFloat
      else
      if qSaldoAntTipo.AsString = 'DEV' then
        vAux := vAux - qSaldoAntVlrDevolucao.AsFloat;
      qSaldoAnt.Next;
    end;
  RxLabel1.Caption    := 'Saldo até a data ' + DateToStr(DateEdit1.Date - 1) + ':';
  CurrencyEdit1.Value := vAux;
end;

procedure TfConsDiarioCli.Grava_mDiario(Tipo : String);
begin
  mDiario.Insert;
  if Tipo <> 'TOT' then
    begin
      mDiarioNumCReceber.AsInteger   := qConsultaNumCReceber.AsInteger;
      mDiarioParcela.AsInteger       := qConsultaParcCReceber.AsInteger;
      mDiarioData.AsDateTime         := qConsultaDtUltPgto.AsDateTime;
      mDiarioCodCli.AsInteger        := qConsultaCodCli.AsInteger;
      mDiarioNomeCli.AsString := qConsultaNomeCli.AsString;
      if Tipo = 'ENT' then
        begin
          mDiarioHistorico.AsString := 'ENTRADA DO TITULO';
          mDiarioDebito.AsFloat    := qConsultaVlrParcCReceber.AsFloat;
        end
      else
      if Tipo = 'DEV' then
        begin
          mDiarioHistorico.AsString := 'DEVOLUCAO';
          mDiarioCredito.AsFloat     := qConsultaVlrDevolucao.AsFloat;
        end
      else
      if Tipo = 'PAG' then
        begin
          mDiarioHistorico.AsString := 'LIQUIDACAO';
          mDiarioCredito.AsFloat     := qConsultaVlrUltPgto.AsFloat;
        end
      else
      if Tipo = 'DES' then
        begin
          mDiarioHistorico.AsString := 'DESCONTO';
          mDiarioCredito.AsFloat     := qConsultaVlrUltDescontos.AsFloat;
        end;

      mDiarioNumNota.AsInteger      := qConsultaNumNota.AsInteger;
      mDiarioFilial.AsInteger       := qConsultaFilial.AsInteger;

      vDebito  := vDebito + mDiarioDebito.AsFloat;
      vCredito := vCredito + mDiarioCredito.AsFloat;
      vSaldo   := vSaldo + mDiarioDebito.AsFloat - mDiarioCredito.AsFloat;
    end
  else
    begin
      mDiarioData.AsDateTime := vDataAux;
      mDiarioDebito.AsFloat  := vDebito;
      mDiarioCredito.AsFloat := vCredito;
      mDiarioNomeCli.AsString := '    Data';
      mDiarioNumControle.AsInteger   := 2;
      mDiario.Post;

      vDebito  := 0;
      vCredito := 0;

      mDiario.Insert;
      mDiarioData.AsDateTime := vDataAux;
      mDiarioCredito.AsFloat := vSaldo;
      mDiarioNomeCli.AsString := '    Saldo em ' + DateToStr(vDataAux);
      mDiarioNumControle.AsInteger   := 2;
    end;
  mDiario.Post;
end;

procedure TfConsDiarioCli.Le_qConsulta;
begin
  mDiario.Filtered := False;
  mDiario.EmptyDataSet;
  ProgressBar1.Max      := qConsulta.RecordCount;
  ProgressBar1.Position := 0;
  vDebito  := 0;
  vCredito := 0;
  vSaldo   := 0;
  qConsulta.First;
  vDataAux := qConsultaDtUltPgto.AsDateTime;
  while not qConsulta.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      if vDataAux <> qConsultaDtUltPgto.AsDateTime then
        Grava_mDiario('TOT');
      Grava_mDiario(qConsultaTipo.AsString);
      if (qConsultaTipo.AsString = 'PAG') and (qConsultaVlrUltDescontos.AsFloat > 0) then
        Grava_mDiario('DES');
      vDataAux := qConsultaDtUltPgto.AsDateTime;
      qConsulta.Next;
    end;
  if qConsulta.RecordCount > 0 then
    Grava_mDiario('TOT');
end;

procedure TfConsDiarioCli.Monta_SQLqConsulta;
begin
  qConsulta.Close;
  qConsulta.SQL.Clear;
  qConsulta.SQL.Add('SELECT dbCReceberParc.Filial, dbCReceberParc.NumCReceber, dbCReceberParc.ParcCReceber, dbCReceberParc.CodCli, ');
  qConsulta.SQL.Add(' dbCReceberParc.NumNota, dbCReceberParc.VlrParcCReceber, dbCReceberParc.DtVencCReceber, dbCReceberParchist.DtUltPgto, ');
  qConsulta.SQL.Add(' dbCReceberParchist.VlrUltPgto, dbCReceberParchist.Tipo, dbCReceberParchist.VlrUltDescontos, dbCReceberParchist.VlrDevolucao, ');
  qConsulta.SQL.Add(' DbCliente.Nome NomeCli ');
  qConsulta.SQL.Add('FROM "dbCReceberParc.DB" dbCReceberParc');
  qConsulta.SQL.Add('   INNER JOIN "dbCReceberParcHist.DB" dbCReceberParchist');
  qConsulta.SQL.Add('   ON  (dbCReceberParc.Filial = dbCReceberParchist.Filial)');
  qConsulta.SQL.Add('   AND  (dbCReceberParc.NumCReceber = dbCReceberParchist.NumCReceber)');
  qConsulta.SQL.Add('   AND  (dbCReceberParc.ParcCReceber = dbCReceberParchist.ParcCReceber)');
  qConsulta.SQL.Add('   INNER JOIN "dbCliente.DB" dbCliente');
  qConsulta.SQL.Add('   ON  (dbCReceberParc.CodCli = DbCliente.Codigo)');
  qConsulta.SQL.Add('WHERE (dbCReceberParcHist.Tipo <> ''ALT'')');
  qConsulta.SQL.Add('  AND ((dbCReceberParc.Cancelado = False) or (dbCReceberParc.Cancelado is Null)) ');
  if RxDBLookupCombo1.Text <> '' then
    begin
      qConsulta.SQL.Add('  AND (dbCReceberParc.Filial = :Filial)');
      qConsulta.ParamByName('Filial').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo2.Text <> '' then
    begin
      qConsulta.SQL.Add('  AND (dbCReceberParc.CodCli = :CodCli)');
      qConsulta.ParamByName('CodCli').AsInteger := RxDBLookupCombo2.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qConsulta.SQL.Add('  AND (dbCReceberParcHist.DtUltPgto >= :DtInicial)');
      qConsulta.ParamByName('DtInicial').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qConsulta.SQL.Add('  AND (dbCReceberParcHist.DtUltPgto <= :DtFinal)');
      qConsulta.ParamByName('DtFinal').AsDate := DateEdit2.Date;
    end;
  qConsulta.SQL.Add('ORDER BY dbCReceberParchist.DtUltPgto, dbCReceberParchist.Tipo');
  qConsulta.Open;
end;

procedure TfConsDiarioCli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qConsulta.Close;
  qSaldoAnt.Close;
  DM1.tCliente.Close;
  DM1.tRelatorio.Close;
  Action := Cafree;
end;

procedure TfConsDiarioCli.BitBtn1Click(Sender: TObject);
begin
  if (DateEdit1.Date < 1) or (DateEdit2.Date < 1) then
    ShowMessage('É obrigatório informar a data!')
  else
    begin
      Monta_SQLqConsulta;
      Monta_SQLqSaldoAnt;
      Le_qConsulta;
    end;
end;

procedure TfConsDiarioCli.BitBtn2Click(Sender: TObject);
begin
  if mDiario.RecordCount > 0 then
    begin
      SMDBGrid1.DisableScroll;
      vNomeFilial := '';
      if (RxDBLookupCombo1.Text <> '') and
         (DM1.tFilial2.Locate('Codigo',RxDBLookupCombo1.KeyValue,[loCaseInsensitive])) then
        vNomeFilial := DM1.tFilial2Empresa.AsString;
      mDiario.Filtered := False;
      mDiario.Filter   := 'NumControle = '''+'1'+'''';
      mDiario.Filtered := True;

      fRelDiarioCli := TfRelDiarioCli.Create(Self);
      if CheckBox1.Checked then
        fRelDiarioCli.vSaldoData  := CurrencyEdit1.Value
      else
        fRelDiarioCli.vSaldoData  := 0;
      fRelDiarioCli.RLReport1.Preview;
      fRelDiarioCli.RLReport1.Free;
      FreeAndNil(fRelDiarioCli);
      mDiario.Filtered := False;
      SMDBGrid1.EnableScroll;
    end;
end;

procedure TfConsDiarioCli.mDiarioNewRecord(DataSet: TDataSet);
begin
  mDiarioDebito.AsFloat        := 0;
  mDiarioCredito.AsFloat       := 0;
  mDiarioNumControle.AsInteger := 1;
end;

procedure TfConsDiarioCli.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (mDiario.RecordCount > 0) and (mDiarioNumControle.AsInteger = 2) then
    Background := clAqua;
end;

procedure TfConsDiarioCli.FormShow(Sender: TObject);
begin
  DM1.tCliente.Open;
  DM1.tRelatorio.Open;
  DM1.tFilial.Open;
end;

procedure TfConsDiarioCli.RxDBLookupCombo1Exit(Sender: TObject);
begin
  CurrencyPaginaFinal.AsInteger := 0;
  if (RxDBLookupCombo1.Text <> '') and
     (DM1.tRelatorio.Locate('Filial;NomeRel',VarArrayOf([RxDBLookupCombo1.KeyValue, Name ]),[locaseinsensitive])) then
    CurrencyPagina.AsInteger := DM1.tRelatorioNumUltPagina.AsInteger + 1
  else
    CurrencyPagina.AsInteger := 0;
end;

procedure TfConsDiarioCli.BitBtn4Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    begin
      fRelatorio := TfRelatorio.Create(Self);
      fRelatorio.Le_tRelatorio(RxDBLookupCombo1.KeyValue,CurrencyPagina.AsInteger,CurrencyPaginaFinal.AsInteger,Name);
      fRelatorio.ShowModal;
    end
  else
    ShowMessage('É obrigatório informar a Filial!');
end;

procedure TfConsDiarioCli.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

end.
