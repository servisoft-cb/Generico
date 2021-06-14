unit UConsPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RxLookup, StdCtrls, Mask, ToolEdit, Buttons, Db, DBTables,
  Grids, DBGrids, MemTable, RXDBCtrl, ALed, ComCtrls, DBClient, RzTabs,
  SMDBGrid;

type
  TfConsPlanoContas = class(TForm)
    Panel1: TPanel;
    qCReceber: TQuery;
    qCPagar: TQuery;
    qMovimentos: TQuery;
    qCReceberNomePlanoContas: TStringField;
    qCReceberDtVencCReceber: TDateField;
    qCReceberRestParcela: TFloatField;
    qCReceberPlanoContas: TIntegerField;
    qCReceberCodPlanoContasItens: TIntegerField;
    qCPagarNomePlanoContas: TStringField;
    qCPagarPlanoContas: TIntegerField;
    qCPagarCodPlanoContasItens: TIntegerField;
    qCPagarDtVencCPagar: TDateField;
    qCPagarRestParcela: TFloatField;
    qMovimentosPlanoContas: TIntegerField;
    qMovimentosCodPlanoContasItens: TIntegerField;
    qMovimentosDtMovimento: TDateField;
    qMovimentosNomePlanoContas: TStringField;
    dsqCReceber: TDataSource;
    dsqCPagar: TDataSource;
    dsqMovimentos: TDataSource;
    qCReceberlkNomePlanoItens: TStringField;
    tPlanoContasItens: TTable;
    tPlanoContasItensCodPlano: TIntegerField;
    tPlanoContasItensCodItem: TIntegerField;
    tPlanoContasItensNome: TStringField;
    qCReceberNumNota: TIntegerField;
    qCPagarlkNomePlanoItens: TStringField;
    qCPagarNumNotaEnt: TIntegerField;
    qCPagarCodForn: TIntegerField;
    qCPagarlkNomeFornecedor: TStringField;
    qMovimentoslkNomePlanoItens: TStringField;
    qMovimentosVlrMovCredito: TFloatField;
    qMovimentosNumNota: TIntegerField;
    qMovimentosNumNotaEnt: TIntegerField;
    qMovimentosVlrMovDebito: TFloatField;
    qMovimentosHistorico: TStringField;
    mAuxPlano: TClientDataSet;
    mAuxPlanoNome: TStringField;
    mAuxPlanoSubItem: TStringField;
    mAuxPlanoNomePlanoItens: TStringField;
    mAuxPlanoCodPlanoItens: TIntegerField;
    mAuxPlanoPlanoContas: TIntegerField;
    mAuxPlanoEntradaR: TFloatField;
    mAuxPlanoSaidaR: TFloatField;
    mAuxPlanoEntradaP: TFloatField;
    mAuxPlanoSaidaP: TFloatField;
    dsmAuxPlano: TDataSource;
    mAuxPlanoVlrEntrada: TFloatField;
    mAuxPlanoVlrSaida: TFloatField;
    qCReceberVlrParcCReceber: TFloatField;
    qCPagarVlrParcCPagar: TFloatField;
    mAuxPlanoTipoES: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    RzPageControl1: TRzPageControl;
    TabSheet5: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Label4: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label5: TLabel;
    ComboBox2: TComboBox;
    qCReceberFilial: TIntegerField;
    qCPagarFilial: TIntegerField;
    qMovimentosFilial: TIntegerField;
    CheckBox1: TCheckBox;
    mAuxPlanoFilial: TIntegerField;
    mAuxPlanoNomeFilial: TStringField;
    tFilial: TTable;
    tFilialCodigo: TIntegerField;
    tFilialEmpresa: TStringField;
    qNEntrada: TQuery;
    DataSource1: TDataSource;
    mAuxPlanoNEntrada: TClientDataSet;
    mAuxPlanoNEntradaCodPlano: TIntegerField;
    mAuxPlanoNEntradaCodPlanoItens: TIntegerField;
    mAuxPlanoNEntradaNomePlano: TStringField;
    mAuxPlanoNEntradaNomePlanoItens: TStringField;
    mAuxPlanoNEntradaFilial: TIntegerField;
    mAuxPlanoNEntradaNomeFilial: TStringField;
    dsmAuxPlanoNEntrada: TDataSource;
    qNEntradaCodPlano: TIntegerField;
    qNEntradaCodPlanoItens: TIntegerField;
    qNEntradaDtEntrada: TDateField;
    qNEntradaNomePlano: TStringField;
    qNEntradalkNomePlanoItens: TStringField;
    qNEntradaFilial: TIntegerField;
    qNEntradaVlrTotalItens: TFloatField;
    mAuxPlanoNEntradaValor: TFloatField;
    mAuxPlanoNEntradaSubItem: TStringField;
    GroupBox1: TGroupBox;
    SMDBGrid2: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure mAuxPlanoNewRecord(DataSet: TDataSet);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
    vSQLNEntrada : String;

    procedure Monta_Dados;
    procedure Monta_SQLCReceber;
    procedure Monta_SQLCPagar;
    procedure Monta_SQLMovimento;

    procedure Gravar_mAuxPlano(Filial : Integer ; NomePlano,NomeItem, Tipo : String ; VlrEntrada , VlrSaida : Real);

    procedure Gravar_mAuxPlanoNEntrada(Filial : Integer ; NomePlano,NomeItem, Tipo : String ; Valor : Real);

    procedure Monta_SQLNEntrada;
    procedure Le_SQLNEntrada;

    //procedure Cria_TabelaAuxiliar;
  public
    { Public declarations }
  end;

var
  fConsPlanoContas: TfConsPlanoContas;
  F : TextFile;
  vTotalCred, vTotalDeb, vTotalSaldo    : Real;
  vTotalCredP, vTotalDebP, vTotalSaldoP : Real;
  Linha, Pagina : Integer;

implementation

uses UDM1, UEscImpressora, URelPlano2, URelPlanoContas;

{$R *.DFM}

procedure TfConsPlanoContas.Monta_Dados;
var
  vEntradaP, vSaidaP, vEntradaR, vSaidaR : Real;
begin
  mAuxPlano.EmptyDataSet;
  vEntradaP := 0;
  vSaidaP   := 0;
  vEntradaR := 0;
  vSaidaR   := 0;
  {*** Lê o contas a receber ***}
  qCReceber.First;
  while not qCReceber.Eof do
  begin
    //Grava o Plano
    Gravar_mAuxPlano(qCReceberFilial.AsInteger,qCReceberNomePlanoContas.AsString,'','N',qCReceberVlrParcCReceber.AsFloat,0);

    //Grava a SubConta (Plano de Contas Itens)
    Gravar_mAuxPlano(qCReceberFilial.AsInteger,qCReceberNomePlanoContas.AsString,qCReceberlkNomePlanoItens.AsString,'S',qCReceberVlrParcCReceber.AsFloat,0);

    qCReceber.Next;
  end;

  {*** Lê o contas a pagar ***}
  qCPagar.First;
  while not qCPagar.Eof do
  begin
    //Grava o Plano
    Gravar_mAuxPlano(qCPagarFilial.AsInteger,qCPagarNomePlanoContas.AsString,'','N',0,qCPagarVlrParcCPagar.AsFloat);

    //Grava a SubConta (Plano de Contas Itens)
    Gravar_mAuxPlano(qCPagarFilial.AsInteger,qCPagarNomePlanoContas.AsString,qCPagarlkNomePlanoItens.AsString,'S',0,qCPagarVlrParcCPagar.AsFloat);

    qCPagar.Next;
  end;

  {*** Lê o movimento financeiro ***}
  qMovimentos.First;
  while not qMovimentos.Eof do
  begin
    //Grava o Plano
    Gravar_mAuxPlano(qMovimentosFilial.AsInteger,qMovimentosNomePlanoContas.AsString,'','N',qMovimentosVlrMovCredito.AsFloat,qMovimentosVlrMovDebito.AsFloat);

    //Grava a SubConta (Plano de Contas Itens)
    Gravar_mAuxPlano(qMovimentosFilial.AsInteger,qMovimentosNomePlanoContas.AsString,qMovimentoslkNomePlanoItens.AsString,'S',qMovimentosVlrMovCredito.AsFloat,qMovimentosVlrMovDebito.AsFloat);

    qMovimentos.Next;
  end;
  mAuxPlano.First;
end;

procedure TfConsPlanoContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qCPagar.Close;
  qCReceber.Close;
  qMovimentos.Close;
  DM1.tPlanoContas.Close;
  DM1.tPlanoContasItens.Close;
  mAuxPlano.EmptyDataSet;
  Action := caFree;
end;

procedure TfConsPlanoContas.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsPlanoContas.FormShow(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;

  vSQLNEntrada := qNEntrada.SQL.Text;

  DM1.tParametros.Open;
  DM1.tPlanoContas.Open;
  DM1.tPlanoContasItens.Open;

  GroupBox1.Visible := DM1.tParametrosUsaPlanoContasNEntradaIt.AsBoolean;
end;

procedure TfConsPlanoContas.BitBtn3Click(Sender: TObject);
begin
  if ((DateEdit1.Date > 10) and (DateEdit2.Date < 10)) or
     ((DateEdit2.Date > 10) and (DateEdit1.Date < 10)) then
  begin
    ShowMessage('Não pode informar só uma data, é preciso informar o período!');
    exit;
  end;
  mAuxPlano.IndexFieldNames := 'Filial;Nome;SubItem;NomePlanoItens';
  if ComboBox2.ItemIndex <> 1 then
    Monta_SQLCReceber;
  if ComboBox2.ItemIndex <> 0 then
    Monta_SQLCPagar;
  Monta_SQLMovimento;

  Monta_Dados;
  mAuxPlano.IndexFieldNames := 'Filial;TipoES;Nome;SubItem;NomePlanoItens';
  mAuxPlano.First;

  if DM1.tParametrosUsaPlanoContasNEntradaIt.AsBoolean then
  begin
    Monta_SQLNEntrada;
    Le_SQLNEntrada;
  end;

  BitBtn1.Enabled := True;
end;

procedure TfConsPlanoContas.BitBtn1Click(Sender: TObject);
begin
  if mAuxPlano.RecordCount > 0 then
  begin
    fRelPlanoContas := TfRelPlanoContas.Create(Self);
    fRelPlanoContas.RLReport1.Preview;
    fRelPlanoContas.RLReport1.Free;
  end
  else
    ShowMessage('Primeiro executar a consulta!');
end;

procedure TfConsPlanoContas.mAuxPlanoNewRecord(DataSet: TDataSet);
begin
  mAuxPlanoEntradaR.AsFloat := 0;
  mAuxPlanoSaidaR.AsFloat   := 0;
  mAuxPlanoEntradaP.AsFloat := 0;
  mAuxPlanoSaidaP.AsFloat   := 0;
end;

procedure TfConsPlanoContas.Gravar_mAuxPlano(Filial : Integer; NomePlano,NomeItem, Tipo : String ; VlrEntrada , VlrSaida : Real);
begin
  if (ComboBox2.ItemIndex = 0) and (StrToFloat(FormatFloat('0.00',VlrEntrada)) <= 0) then
    exit;
  if (ComboBox2.ItemIndex = 1) and (StrToFloat(FormatFloat('0.00',VlrSaida)) <= 0) then
    exit;

  if CheckBox1.Checked then
    Filial := 0;

  if mAuxPlano.FindKey([Filial,NomePlano,Tipo,NomeItem]) then
    mAuxPlano.Edit
  else
  begin
    mAuxPlano.Insert;
    mAuxPlanoFilial.AsInteger        := Filial;
    mAuxPlanoNome.AsString           := NomePlano;
    mAuxPlanoSubItem.AsString        := Tipo;
    mAuxPlanoNomePlanoItens.AsString := NomeItem;
    if Filial <= 0 then
      mAuxPlanoNomeFilial.AsString := 'Geral'
    else
    if tFilial.FindKey([Filial]) then
      mAuxPlanoNomeFilial.AsString := tFilialEmpresa.AsString;
  end;
  mAuxPlanoVlrEntrada.AsFloat := mAuxPlanoVlrEntrada.AsFloat + VlrEntrada;
  mAuxPlanoVlrSaida.AsFloat   := mAuxPlanoVlrSaida.AsFloat + VlrSaida;
  if VlrEntrada > 0 then
    mAuxPlanoTipoES.AsString := 'E'
  else
    mAuxPlanoTipoES.AsString := 'S';
  mAuxPlano.Post;
end;

procedure TfConsPlanoContas.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if mAuxPlanoSubItem.AsString = 'N' then
    Background := clBtnFace;
end;

procedure TfConsPlanoContas.Monta_SQLCPagar;
begin
  //Contas a Receber Pendentes
  qCReceber.Close;
  qCReceber.SQL.Clear;
  qCReceber.SQL.Add('SELECT Dbplanocontas.Descricao NomePlanoContas, Dbcreceberparc.DtVencCReceber, ');
  qCReceber.SQL.Add(' Dbcreceberparc.RestParcela, Dbcreceberparc.PlanoContas, Dbcreceberparc.CodPlanoContasItens, ');
  qCReceber.SQL.Add(' Dbcreceberparc.NumNota, Dbcreceberparc.VlrParcCReceber, dbCReceberParc.Filial ');
  qCReceber.SQL.Add('FROM "dbPlanoContas.DB" Dbplanocontas');
  qCReceber.SQL.Add('   INNER JOIN "dbCReceberParc.DB" Dbcreceberparc');
  qCReceber.SQL.Add('   ON  (Dbcreceberparc.PlanoContas = Dbplanocontas.Codigo)');
  qCReceber.SQL.Add('WHERE ( (Dbcreceberparc.Cancelado = FALSE)  OR  (Dbcreceberparc.Cancelado IS NULL) )');
  if RxDBLookupCombo1.Text <> '' then
  begin
    qCReceber.SQL.Add(' AND (Dbcreceberparc.PlanoContas = :CodPlano)');
    qCReceber.ParamByName('CodPlano').AsInteger := RxDBLookupCombo1.KeyValue;
  end;
  if RxDBLookupCombo2.Text <> '' then
  begin
    qCReceber.SQL.Add(' AND (Dbcreceberparc.Filial = :Filial)');
    qCReceber.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
  end;
  if (DateEdit1.Date > 0) and (DateEdit2.Date > 0) then
  begin
    if ComboBox1.ItemIndex = 0 then
      qCReceber.SQL.Add(' AND (Dbcreceberparc.DtVencCReceber BETWEEN :DataI AND :DataF)')
    else
      qCReceber.SQL.Add(' AND (Dbcreceberparc.DtGerado BETWEEN :DataI AND :DataF)');
    qCReceber.ParamByName('DataI').AsDate := DateEdit1.Date;
    qCReceber.ParamByName('DataF').AsDate := DateEdit2.Date;
  end;
  qCReceber.SQL.Add('ORDER BY Dbplanocontas.Descricao, Dbcreceberparc.CodPlanoContasItens');
  qCReceber.Open;
end;

procedure TfConsPlanoContas.Monta_SQLCReceber;
begin
  //Contas a Pagar Pendentes
  qCPagar.Close;
  qCPagar.SQL.Clear;
  qCPagar.SQL.Add('SELECT Dbplanocontas.Descricao NomePlanoContas, Dbcpagarparc.PlanoContas, Dbcpagarparc.NroDuplicata,');
  qCPagar.SQL.Add(' Dbcpagarparc.CodPlanoContasItens, Dbcpagarparc.DtVencCPagar, Dbcpagarparc.RestParcela, Dbcpagarparc.NumNotaEnt, ');
  qCPagar.SQL.Add(' Dbcpagarparc.CodForn, Dbcpagarparc.VlrParcCPagar, Dbcpagarparc.Filial ');
  qCPagar.SQL.Add('FROM "dbCPagarParc.DB" Dbcpagarparc');
  qCPagar.SQL.Add('   INNER JOIN "dbPlanoContas.DB" Dbplanocontas');
  qCPagar.SQL.Add('   ON  (Dbcpagarparc.PlanoContas = Dbplanocontas.Codigo)');
  qCPagar.SQL.Add('WHERE (0 = 0)');
  if RxDBLookupCombo1.Text <> '' then
  begin
    qCPagar.SQL.Add('AND   (Dbcpagarparc.PlanoContas = :CodPlano)');
    qCPagar.ParamByName('CodPlano').AsInteger := RxDBLookupCombo1.KeyValue;
  end;
  if RxDBLookupCombo2.Text <> '' then
  begin
    qCPagar.SQL.Add('AND   (Dbcpagarparc.Filial = :Filial)');
    qCPagar.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
  end;
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
  begin
    if ComboBox1.ItemIndex = 0 then
      qCPagar.SQL.Add(' AND (Dbcpagarparc.DtVencCPagar BETWEEN :DataI AND :DataF)')
    else
      qCPagar.SQL.Add(' AND (Dbcpagarparc.DtGerado BETWEEN :DataI AND :DataF)');
    qCPagar.ParamByName('DataI').AsDate := DateEdit1.Date;
    qCPagar.ParamByName('DataF').AsDate := DateEdit2.Date;
  end;
  qCPagar.Open;
end;

procedure TfConsPlanoContas.Monta_SQLMovimento;
begin
  //Movimentos Financeiros Realizado
  qMovimentos.Close;
  qMovimentos.SQL.Clear;
  qMovimentos.SQL.Add('SELECT Dbmovimentos.PlanoContas, Dbmovimentos.CodPlanoContasItens, Dbmovimentos.DtMovimento, Dbmovimentos.Historico,');
  qMovimentos.SQL.Add(' Dbmovimentos.VlrMovDebito, Dbmovimentos.VlrMovCredito, Dbplanocontas.Descricao NomePlanoContas, Dbmovimentos.NumNota, ');
  qMovimentos.SQL.Add(' Dbmovimentos.NumNotaEnt, Dbmovimentos.Filial ');
  qMovimentos.SQL.Add('FROM "dbMovimentos.DB" Dbmovimentos');
  qMovimentos.SQL.Add('   INNER JOIN "dbPlanoContas.DB" Dbplanocontas');
  qMovimentos.SQL.Add('   ON  (Dbmovimentos.PlanoContas = Dbplanocontas.Codigo)');
  qMovimentos.SQL.Add(' WHERE (Dbmovimentos.NumCPagar <= 0) and (Dbmovimentos.NumCReceber <= 0) ');
  if RxDBLookupCombo1.Text <> '' then
  begin
    qMovimentos.SQL.Add(' AND (Dbmovimentos.PlanoContas = :CodPlano)');
    qMovimentos.ParamByName('CodPlano').AsInteger := RxDBLookupCombo1.KeyValue;
  end;
  if RxDBLookupCombo2.Text <> '' then
  begin
    qMovimentos.SQL.Add(' AND (Dbmovimentos.Filial = :Filial)');
    qMovimentos.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
  end;
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
  begin
    qMovimentos.SQL.Add(' AND (Dbmovimentos.DtMovimento BETWEEN :DataI AND :DataF)');
    qMovimentos.ParamByName('DataI').AsDate := DateEdit1.Date;
    qMovimentos.ParamByName('DataF').AsDate := DateEdit2.Date;
  end;
  qMovimentos.Open;
end;

procedure TfConsPlanoContas.Le_SQLNEntrada;
begin
  mAuxPlanoNEntrada.EmptyDataSet;
  qNEntrada.First;
  while not qNEntrada.Eof do
  begin
    //Grava o Plano
    Gravar_mAuxPlanoNEntrada(qNEntradaFilial.AsInteger,qNEntradaNomePlano.AsString,'','N',qNEntradaVlrTotalItens.AsFloat);

    //Grava a SubConta (Plano de Contas Itens)
    Gravar_mAuxPlanoNEntrada(qNEntradaFilial.AsInteger,qNEntradaNomePlano.AsString,qNEntradalkNomePlanoItens.AsString,'S',qNEntradaVlrTotalItens.AsFloat);

    qNEntrada.Next;
  end;
end;

procedure TfConsPlanoContas.Monta_SQLNEntrada;
begin
  qNEntrada.Close;
  qNEntrada.SQL.Clear;
  qNEntrada.SQL.Text := vSQLNEntrada;
  qNEntrada.SQL.Add(' WHERE 0 = 0');

  if RxDBLookupCombo1.Text <> '' then
  begin
    qNEntrada.SQL.Add(' AND (dbNEntradaItens.CodPlano = :CodPlano)');
    qNEntrada.ParamByName('CodPlano').AsInteger := RxDBLookupCombo1.KeyValue;
  end;
  if RxDBLookupCombo2.Text <> '' then
  begin
    qNEntrada.SQL.Add(' AND (dbNEntradaItens.Filial = :Filial)');
    qNEntrada.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
  end;
  if (DateEdit1.Date > 0) and (DateEdit2.Date > 0) then
  begin
    qNEntrada.SQL.Add(' AND (dbNEntrada.DtEntrada BETWEEN :DataI AND :DataF)');
    qNEntrada.ParamByName('DataI').AsDate := DateEdit1.Date;
    qNEntrada.ParamByName('DataF').AsDate := DateEdit2.Date;
  end;
  qNEntrada.SQL.Add('ORDER BY Dbplanocontas.Descricao, Dbcreceberparc.CodPlanoContasItens');
  qNEntrada.Open;
end;

procedure TfConsPlanoContas.Gravar_mAuxPlanoNEntrada(Filial: Integer;
  NomePlano, NomeItem, Tipo: String; Valor: Real);
begin
  if CheckBox1.Checked then
    Filial := 0;

  if mAuxPlanoNEntrada.FindKey([Filial,NomePlano,Tipo,NomeItem]) then
    mAuxPlanoNEntrada.Edit
  else
  begin
    mAuxPlanoNEntrada.Insert;
    mAuxPlanoNEntradaFilial.AsInteger        := Filial;
    mAuxPlanoNEntradaNomePlano.AsString      := NomePlano;
    mAuxPlanoNEntradaSubItem.AsString        := Tipo;
    mAuxPlanoNEntradaNomePlanoItens.AsString := NomeItem;
    if Filial <= 0 then
      mAuxPlanoNEntradaNomeFilial.AsString := 'Geral'
    else
    if tFilial.FindKey([Filial]) then
      mAuxPlanoNEntradaNomeFilial.AsString := tFilialEmpresa.AsString;
  end;
  mAuxPlanoNEntradaValor.AsFloat := mAuxPlanoNEntradaValor.AsFloat + Valor;
  mAuxPlanoNEntrada.Post;
end;

end.
