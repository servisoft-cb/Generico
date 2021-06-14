unit UConsRazaoCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Mask, ToolEdit, ExtCtrls, Buttons, Grids,
  DBGrids, SMDBGrid, DB, DBTables, ComCtrls, DBClient, RXCtrls, CurrEdit;

type
  TfConsRazaoCli = class(TForm)
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
    mRazao: TClientDataSet;
    mRazaoParcela: TIntegerField;
    mRazaoData: TDateField;
    mRazaoHistorico: TStringField;
    mRazaoNumNota: TIntegerField;
    mRazaoFilial: TIntegerField;
    mRazaoDebito: TFloatField;
    mRazaoCredito: TFloatField;
    dsmRazao: TDataSource;
    qSaldoAnt: TQuery;
    mRazaoNumControle: TIntegerField;
    mRazaoAno: TIntegerField;
    mRazaoMes: TIntegerField;
    mRazaoSaldo: TFloatField;
    mRazaoNumCReceber: TIntegerField;
    mRazaoCodCli: TIntegerField;
    mRazaoNomeCli: TStringField;
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
    qSaldoAntCodCli: TIntegerField;
    Label5: TLabel;
    CurrencyPagina: TCurrencyEdit;
    Panel2: TPanel;
    Label6: TLabel;
    CurrencyPaginaFinal: TCurrencyEdit;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure mRazaoNewRecord(DataSet: TDataSet);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
  private
    { Private declarations }
    vDataAux : TDateTime;
    vDebitoMes, vCreditoMes, vDebitoCli, vCreditoCli, vSaldo : Real;
    vAno, vMes, vCodCli : Integer;
    vNomeCli : String;
    vSaldoTeste : Real;
    procedure Monta_SQLqConsulta;
    procedure Monta_SQLqSaldoAnt;
    procedure Le_qConsulta;
    procedure Grava_mRazao(Tipo : String);
    procedure Le_tCliente;
  public
    { Public declarations }
    vSaldoAnt : Real;
    vNomeFilial : String;
    procedure Le_qSaldoAnt(Codigo : Integer);
  end;

var
  fConsRazaoCli: TfConsRazaoCli;

implementation

uses UDM1, URelRazaoCli, DateUtils, URelatorio;

{$R *.dfm}

procedure TfConsRazaoCli.Le_tCliente;
begin
  DM1.tCliente.First;
  while not DM1.tCliente.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      if ((RxDBLookupCombo2.Text <> '') and (RxDBLookupCombo2.KeyValue = DM1.tClienteCodigo.AsInteger)) or
         (RxDBLookupCombo2.Text = '') then
        begin
          if not mRazao.Locate('CodCli',DM1.tClienteCodigo.AsInteger,[loCaseInsensitive]) then
            begin
              Le_qSaldoAnt(DM1.tClienteCodigo.AsInteger);
              if vSaldoAnt > 0 then
                begin
                  mRazao.Insert;
                  mRazaoCodCli.AsInteger       := DM1.tClienteCodigo.AsInteger;
                  mRazaoNomeCli.AsString       := DM1.tClienteNome.AsString;
                  mRazaoAno.AsInteger          := 0;
                  mRazaoMes.AsInteger          := 0;
                  mRazaoHistorico.AsString     := 'Saldo Anterior: ';
                  mRazaoSaldo.AsFloat          := vSaldoAnt;
                  mRazaoNumControle.AsInteger  := 1;
                  mRazao.Post;
                end;
            end;
        end;
      DM1.tCliente.Next;
    end;
end;

procedure TfConsRazaoCli.Le_qSaldoAnt(Codigo : Integer);
begin
  qSaldoAnt.Filtered := False;
  qSaldoAnt.Filter   := 'CodCli = '''+IntToStr(Codigo)+'''';
  qSaldoAnt.Filtered := True;
  qSaldoAnt.First;

  vSaldoAnt := 0;
  qSaldoAnt.First;
  while not qSaldoAnt.Eof do
    begin
      if qSaldoAntTipo.AsString = 'ENT' then
        vSaldoAnt := vSaldoAnt + qSaldoAntVlrParcCReceber.AsFloat
      else
      if qSaldoAntTipo.AsString = 'PAG' then
        vSaldoAnt := vSaldoAnt - qSaldoAntVlrUltPgto.AsFloat - qSaldoAntVlrUltDescontos.AsFloat
      else
      if qSaldoAntTipo.AsString = 'DEV' then
        vSaldoAnt := vSaldoAnt - qSaldoAntVlrDevolucao.AsFloat;
      qSaldoAnt.Next;
    end;
  vSaldoTeste := vSaldoTeste + vSaldoAnt;
  qSaldoAnt.Filtered := False;
end;

procedure TfConsRazaoCli.Monta_SQLqSaldoAnt;
begin
  qSaldoAnt.Close;
  qSaldoAnt.SQL.Clear;
  qSaldoAnt.SQL.Add('SELECT SUM( DbCReceberparc.VlrParcCReceber ) VlrParcCReceber, SUM( DbCReceberparchist.VlrUltPgto ) VlrUltPgto, SUM( DbCReceberparchist.VlrUltDescontos ) VlrUltDescontos, ');
  qSaldoAnt.SQL.Add(' SUM( DbCReceberparchist.VlrDevolucao ) VlrDevolucao, DbCReceberparchist.Tipo, dbCReceberParc.CodCli ');
  qSaldoAnt.SQL.Add('FROM "dbCReceberParc.DB" DbCReceberparc');
  qSaldoAnt.SQL.Add('   INNER JOIN "dbCReceberParcHist.DB" DbCReceberparchist');
  qSaldoAnt.SQL.Add('   ON  (DbCReceberparc.Filial = DbCReceberparchist.Filial)');
  qSaldoAnt.SQL.Add('   AND  (DbCReceberparc.NumCReceber = DbCReceberparchist.NumCReceber)');
  qSaldoAnt.SQL.Add('   AND  (DbCReceberparc.ParcCReceber = DbCReceberparchist.ParcCReceber)');
  qSaldoAnt.SQL.Add('WHERE  ((DbCReceberparchist.Tipo <> ''ALT'' ) and  (DbCReceberparchist.Tipo <> ''DIV'' ) and  (DbCReceberparchist.Tipo <> ''OUT'' ))');
  qSaldoAnt.SQL.Add('      AND  (dbCReceberParcHist.DtUltPgto < :DataIni)');
  qSaldoAnt.SQL.Add('      AND  ((dbCReceberParc.Cancelado = False) or (dbCReceberParc.Cancelado is Null))');
  qSaldoAnt.ParamByName('DataIni').AsDate := DateEdit1.Date;
  if RxDBLookupCombo1.Text <> '' then
    begin
      qSaldoAnt.SQL.Add('  AND (dbCReceberParc.Filial = :Filial)');
      qSaldoAnt.ParamByName('Filial').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  qSaldoAnt.SQL.Add('GROUP BY DbCReceberparchist.Tipo, dbCReceberParc.CodCli');
  qSaldoAnt.Open;
end;

procedure TfConsRazaoCli.Grava_mRazao(Tipo : String);
begin
  mRazao.Insert;
  if Tipo = 'SAL' then
    begin
      mRazaoCodCli.AsInteger        := qConsultaCodCli.AsInteger;
      mRazaoNomeCli.AsString        := qConsultaNomeCli.AsString;
      mRazaoAno.AsInteger           := 0;
      mRazaoMes.AsInteger           := 0;
      mRazaoHistorico.AsString      := 'Saldo Anterior: ';
      Le_qSaldoAnt(qConsultaCodCli.AsInteger);
      mRazaoSaldo.AsFloat           := vSaldoAnt;
      mRazaoNumControle.AsInteger   := 0;
      vSaldo                        := vSaldoAnt;
    end
  else
  if Tipo = 'MES' then
    begin
      mRazaoAno.AsInteger   := vAno;
      mRazaoMes.AsInteger   := vMes;
      mRazaoDebito.AsFloat  := vDebitoMes;
      mRazaoCredito.AsFloat := vCreditoMes;
      vDebitoMes            := 0;
      vCreditoMes           := 0;
      mRazaoNomeCli.AsString := vNomeCli;
      mRazaoCodCli.AsInteger := vCodCli;
      mRazaoHistorico.AsString := 'Total Mês ' + IntToStr(vMes) + '/' + IntToStr(vAno) + ':';
      mRazaoNumControle.AsInteger   := 2;
    end
  else
  if Tipo = 'FOR' then
    begin
      mRazao.Insert;
      mRazaoAno.AsInteger   := vAno;
      mRazaoMes.AsInteger   := vMes;
      mRazaoDebito.AsFloat  := vDebitoCli;
      mRazaoCredito.AsFloat := vCreditoCli;
      vDebitoCli            := 0;
      vCreditoCli           := 0;
      vSaldo                := 0;

      mRazaoCodCli.AsInteger      := vCodCli;
      mRazaoNomeCli.AsString      := vNomeCli;
      mRazaoHistorico.AsString    := 'Total Cliente:';
      mRazaoNumControle.AsInteger := 3;
    end
  else
    begin
      mRazaoNumCReceber.AsInteger   := qConsultaNumCReceber.AsInteger;
      mRazaoParcela.AsInteger       := qConsultaParcCReceber.AsInteger;
      mRazaoData.AsDateTime         := qConsultaDtUltPgto.AsDateTime;
      mRazaoCodCli.AsInteger        := qConsultaCodCli.AsInteger;
      mRazaoNomeCli.AsString        := qConsultaNomeCli.AsString;
      mRazaoAno.AsInteger           := YearOf(qConsultaDtUltPgto.AsDateTime);
      mRazaoMes.AsInteger           := MonthOf(qConsultaDtUltPgto.AsDateTime);
      if Tipo = 'ENT' then
        begin
          mRazaoHistorico.AsString := 'ENTRADA DO TITULO ' + qConsultaNumNota.AsString + '/' + qConsultaParcCReceber.AsString;
          //mRazaoCredito.AsFloat  := qConsultaVlrParcCReceber.AsFloat;
          mRazaoDebito.AsFloat     := qConsultaVlrParcCReceber.AsFloat;
        end
      else
      if Tipo = 'DEV' then
        begin
          mRazaoHistorico.AsString := 'DEVOLUCAO DO TITULO '  + qConsultaNumNota.AsString + '/' + qConsultaParcCReceber.AsString;
          //mRazaoDebito.AsFloat     := qConsultaVlrDevolucao.AsFloat;
          mRazaoCredito.AsFloat     := qConsultaVlrDevolucao.AsFloat;
        end
      else
      if Tipo = 'PAG' then
        begin
          mRazaoHistorico.AsString := 'LIQUIDACAO DO TITULO ' + qConsultaNumNota.AsString + '/' + qConsultaParcCReceber.AsString;
          //mRazaoDebito.AsFloat     := qConsultaVlrUltPgto.AsFloat;
          mRazaoCredito.AsFloat     := qConsultaVlrUltPgto.AsFloat;
        end
      else
      if Tipo = 'DES' then
        begin
          mRazaoHistorico.AsString := 'DESCONTO NO TITULO ' + qConsultaNumNota.AsString + '/' + qConsultaParcCReceber.AsString;
          //mRazaoDebito.AsFloat     := qConsultaVlrUltDescontos.AsFloat;
          mRazaoCredito.AsFloat     := qConsultaVlrUltDescontos.AsFloat;
        end;

      mRazaoNumNota.AsInteger      := qConsultaNumNota.AsInteger;
      mRazaoFilial.AsInteger       := qConsultaFilial.AsInteger;

      vDebitoMes   := vDebitoMes + mRazaoDebito.AsFloat;
      vCreditoMes  := vCreditoMes + mRazaoCredito.AsFloat;
      vDebitoCli   := vDebitoCli + mRazaoDebito.AsFloat;
      vCreditoCli  := vCreditoCli + mRazaoCredito.AsFloat;
      //vSaldo       := vSaldo +  mRazaoCredito.AsFloat - mRazaoDebito.AsFloat;
      vSaldo       := vSaldo +  mRazaoDebito.AsFloat - mRazaoCredito.AsFloat;

      mRazaoSaldo.AsFloat := vSaldo;
    end;
  mRazao.Post;
end;

procedure TfConsRazaoCli.Le_qConsulta;
begin
  mRazao.Filtered := False;
  mRazao.EmptyDataSet;
  ProgressBar1.Max      := qConsulta.RecordCount + DM1.tCliente.RecordCount;
  ProgressBar1.Position := 0;
  vDebitoMes  := 0;
  vCreditoMes := 0;
  vDebitoCli  := 0;
  vCreditoCli := 0;
  vSaldo      := 0;
  qConsulta.First;
  //vDataAux := qConsultaDtUltPgto.AsDateTime;
  vAno     := YearOf(qConsultaDtUltPgto.AsDateTime);
  vMes     := MonthOf(qConsultaDtUltPgto.AsDateTime);
  vCodCli  := qConsultaCodCli.AsInteger;
  vNomeCli := qConsultaNomeCli.AsString;
  Grava_mRazao('SAL');
  while not qConsulta.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      if vCodCli <> qConsultaCodCli.AsInteger then
        begin
          Grava_mRazao('FOR');
          Grava_mRazao('MES');
          Grava_mRazao('SAL');
        end
      else
      if (vAno <> YearOf(qConsultaDtUltPgto.AsDateTime)) or
         (vMes <> MonthOf(qConsultaDtUltPgto.AsDateTime)) then
        Grava_mRazao('MES');
      Grava_mRazao(qConsultaTipo.AsString);
      if (qConsultaTipo.AsString = 'PAG') and (qConsultaVlrUltDescontos.AsFloat > 0) then
        Grava_mRazao('DES');
      vAno      := YearOf(qConsultaDtUltPgto.AsDateTime);
      vMes      := MonthOf(qConsultaDtUltPgto.AsDateTime);
      vCodCli   := qConsultaCodCli.AsInteger;
      vNomeCli  := qConsultaNomeCli.AsString;
      qConsulta.Next;
    end;
  if qConsulta.RecordCount > 0 then
    begin
      Grava_mRazao('FOR');
      Grava_mRazao('MES');
    end;
end;

procedure TfConsRazaoCli.Monta_SQLqConsulta;
begin
  qConsulta.Close;
  qConsulta.SQL.Clear;
  qConsulta.SQL.Add('SELECT DbCReceberparc.Filial, DbCReceberparc.NumCReceber, DbCReceberparc.ParcCReceber, DbCReceberparc.CodCli, ');
  qConsulta.SQL.Add('DbCReceberparc.NumNota, DbCReceberparc.VlrParcCReceber, DbCReceberparc.DtVencCReceber, DbCReceberparchist.DtUltPgto, ');
  qConsulta.SQL.Add('DbCReceberparchist.VlrUltPgto, DbCReceberparchist.Tipo, DbCReceberparchist.VlrUltDescontos, DbCReceberparchist.VlrDevolucao, ');
  qConsulta.SQL.Add('dbCliente.Nome NomeCli ');
  qConsulta.SQL.Add('FROM "dbCReceberParc.DB" DbCReceberparc ');
  qConsulta.SQL.Add('   INNER JOIN "dbCReceberParcHist.DB" DbCReceberparchist ');
  qConsulta.SQL.Add('   ON  (DbCReceberparc.Filial = DbCReceberparchist.Filial) ');
  qConsulta.SQL.Add('   AND  (DbCReceberparc.NumCReceber = DbCReceberparchist.NumCReceber) ');
  qConsulta.SQL.Add('   AND  (DbCReceberparc.ParcCReceber = DbCReceberparchist.ParcCReceber) ');
  qConsulta.SQL.Add('   INNER JOIN "dbCliente.DB" DbCliente ');
  qConsulta.SQL.Add('   ON  (DbCReceberparc.CodCli = DbCliente.Codigo) ');
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
  qConsulta.SQL.Add('ORDER BY dbCliente.Nome, dbCReceberParcHist.DtUltPgto');
  qConsulta.Open;
end;

procedure TfConsRazaoCli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qConsulta.Close;
  qSaldoAnt.Close;
  DM1.tCliente.Close;
  DM1. tRelatorio.Close;
  Action := Cafree;
end;

procedure TfConsRazaoCli.BitBtn1Click(Sender: TObject);
begin
  if (DateEdit1.Date < 1) or (DateEdit2.Date < 1) then
    ShowMessage('É obrigatório informar a data!')
  else
    begin
      vSaldoTeste := 0;
      Monta_SQLqConsulta;
      Monta_SQLqSaldoAnt;
      Le_qConsulta;
      Le_tCliente;

      //ShowMessage('Saldo Ant = ' + FormatFloat('###,###,##0.00',vSaldoTeste));
    end;
end;

procedure TfConsRazaoCli.BitBtn2Click(Sender: TObject);
begin
  if mRazao.RecordCount > 0 then
    begin
      SMDBGrid1.DisableScroll;
      vNomeFilial := '';
      if (RxDBLookupCombo1.Text <> '') and
         (DM1.tFilial2.Locate('Codigo',RxDBLookupCombo1.KeyValue,[loCaseInsensitive])) then
        vNomeFilial := DM1.tFilial2Empresa.AsString;
      mRazao.Filtered := False;
      mRazao.Filter   := 'NumControle = '''+'1'+'''';
      mRazao.Filtered := True;

      fRelRazaoCli := TfRelRazaoCli.Create(Self);
      fRelRazaoCli.RLReport1.Preview;
      fRelRazaoCli.RLReport1.Free;
      FreeAndNil(fRelRazaoCli);
      mRazao.Filtered := False;
      SMDBGrid1.EnableScroll;
    end;
end;

procedure TfConsRazaoCli.mRazaoNewRecord(DataSet: TDataSet);
begin
  mRazaoDebito.AsFloat        := 0;
  mRazaoCredito.AsFloat       := 0;
  mRazaoNumControle.AsInteger := 1;
  mRazaoSaldo.AsFloat         := 0;
end;

procedure TfConsRazaoCli.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (mRazao.RecordCount > 0) and (mRazaoNumControle.AsInteger = 2) then
    Background := clYellow;
  if (mRazao.RecordCount > 0) and (mRazaoNumControle.AsInteger = 3) then
    Background := clAqua;
  if (mRazao.RecordCount > 0) and (mRazaoNumControle.AsInteger = 0) then
    Background := clSilver;
end;

procedure TfConsRazaoCli.FormShow(Sender: TObject);
begin
  DM1.tCliente.Open;
  DM1. tRelatorio.Open;
end;

procedure TfConsRazaoCli.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';       
end;

procedure TfConsRazaoCli.BitBtn4Click(Sender: TObject);
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

procedure TfConsRazaoCli.RxDBLookupCombo1Exit(Sender: TObject);
begin
  CurrencyPaginaFinal.AsInteger := 0;
  if (RxDBLookupCombo1.Text <> '') and
     (DM1.tRelatorio.Locate('Filial;NomeRel',VarArrayOf([RxDBLookupCombo1.KeyValue, Name ]),[locaseinsensitive])) then
    CurrencyPagina.AsInteger := DM1.tRelatorioNumUltPagina.AsInteger + 1
  else
    CurrencyPagina.AsInteger := 0;
end;

end.
