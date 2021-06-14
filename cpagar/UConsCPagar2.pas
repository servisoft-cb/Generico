unit UConsCPagar2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Grids, DBGrids, RXDBCtrl,
  RXLookup, Db, DBTables, RXSplit, DBFilter, RXCtrls, Menus, Printers,
  Mask, ToolEdit, CurrEdit, ALed, Variants, SMDBGrid;

type
  TfConsCPagar2 = class(TForm)
    qParcelas: TQuery;
    dsqParcelas: TDataSource;
    Panel5: TPanel;
    Label1: TLabel;
    Label27: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    BitBtn7: TBitBtn;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    ComboBox1: TComboBox;
    ProgressBar1: TProgressBar;
    Panel3: TPanel;
    Label5: TLabel;
    lbTotal: TLabel;
    lbDevolucao: TLabel;
    Label4: TLabel;
    Label21: TLabel;
    Label17: TLabel;
    lbPago: TLabel;
    lbRestante: TLabel;
    SMDBGrid1: TSMDBGrid;
    qParcelasNomeForn: TStringField;
    qParcelasCodForn: TIntegerField;
    qParcelasVlrPago: TFloatField;
    qParcelasVlrRestante: TFloatField;
    qParcelasVlrParcela: TFloatField;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    qParcelasVlrDevolucao: TFloatField;
    BitBtn2: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SMDBGrid1FilterChanged(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_SQLqParcelas;
    procedure Le_Parcelas;
  public
    { Public declarations }
  end;

var
  fConsCPagar2: TfConsCPagar2;

implementation

uses UDM1, URelCPagarForn;

{$R *.DFM}

procedure TfConsCPagar2.Monta_SQLqParcelas;
begin
  qParcelas.Close;
  qParcelas.SQL.Clear;
  qParcelas.SQL.Add('SELECT Dbfornecedores.NomeForn, Dbcpagarparc.CodForn, SUM( Dbcpagarparc.PgtoParcial ) VlrPago, ');
  qParcelas.SQL.Add(' SUM( Dbcpagarparc.RestParcela ) VlrRestante, SUM( Dbcpagarparc.VlrParcCPagar ) VlrParcela, ');
  qParcelas.SQL.Add(' SUM( Dbcpagarparc.VlrDevolucao ) VlrDevolucao ');
  qParcelas.SQL.Add('FROM "dbCPagar.DB" Dbcpagar ');
  qParcelas.SQL.Add('   INNER JOIN "dbCPagarParc.DB" Dbcpagarparc ');
  qParcelas.SQL.Add('   ON  (Dbcpagar.Filial = Dbcpagarparc.Filial) ');
  qParcelas.SQL.Add('   AND  (Dbcpagar.NumCPagar = Dbcpagarparc.NumCPagar) ');
  qParcelas.SQL.Add('   INNER JOIN "dbFornecedores.DB" Dbfornecedores ');
  qParcelas.SQL.Add('   ON  (Dbcpagarparc.CodForn = Dbfornecedores.CodForn) ');
  qParcelas.SQL.Add('WHERE 0 = 0');
  if RxDBLookupCombo2.Text <> '' then
  begin
    qParcelas.SQL.Add(' AND (dbCPagarParc.Filial = :Filial) ');
    qParcelas.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
  end;
  if RxDBLookupCombo1.Text <> '' then
  begin
    qParcelas.SQL.Add(' AND (dbCPagarParc.CodForn = :CodForn) ');
    qParcelas.ParamByName('CodForn').AsInteger := RxDBLookupCombo1.KeyValue;
  end;
  if DateEdit1.Date > 0 then
  begin
    qParcelas.SQL.Add(' AND (dbCPagarParc.DtVencCPagar >= :DtVectoIni) ');
    qParcelas.ParamByName('DtVectoIni').AsDate := DateEdit1.Date;
  end;
  if DateEdit2.Date > 0 then
  begin
    qParcelas.SQL.Add(' AND (dbCPagarParc.DtVencCPagar <= :DtVectoFin) ');
    qParcelas.ParamByName('DtVectoFin').AsDate := DateEdit2.Date;
  end;
  if DateEdit3.Date > 0 then
  begin
    qParcelas.SQL.Add(' AND (dbCPagarParc.DtGerado >= :DtEmissaoIni) ');
    qParcelas.ParamByName('DtEmissaoIni').AsDate := DateEdit3.Date;
  end;
  if DateEdit4.Date > 0 then
  begin
    qParcelas.SQL.Add(' AND (dbCPagarParc.DtGerado <= :DtEmissaoFin) ');
    qParcelas.ParamByName('DtEmissaoFin').AsDate := DateEdit4.Date;
  end;
  case ComboBox1.ItemIndex of
    0 : qParcelas.SQL.Add(' AND (dbCPagarParc.RestParcela > 0)');
    1 : qParcelas.SQL.Add(' AND (dbCPagarParc.PgtoParcial > 0)');
  end;
  qParcelas.SQL.Add('GROUP BY Dbfornecedores.NomeForn, Dbcpagarparc.CodForn');
  qParcelas.SQL.Add('ORDER BY dbFornecedores.NomeForn');
  qParcelas.Open;
end;

procedure TfConsCPagar2.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsCPagar2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConsCPagar2.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfConsCPagar2.BitBtn7Click(Sender: TObject);
begin
  Monta_SQLqParcelas;
  Le_Parcelas;
end;

procedure TfConsCPagar2.FormCreate(Sender: TObject);
begin
  DM1.tFilial.Open;
  DM1.tFornecedores.Open;
end;

procedure TfConsCPagar2.FormShow(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;
end;

procedure TfConsCPagar2.BitBtn1Click(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  fRelCPagarForn := TfRelCPagarForn.Create(Self);
  fRelCPagarForn.RLReport1.Preview;
  fRelCPagarForn.RLReport1.Free;
  SMDBGrid1.EnableScroll;
end;

procedure TfConsCPagar2.Le_Parcelas;
var
  vVlrPago, vVlrDevolucao, vVlrRestante, vVlrTotal : Real;
begin
  SMDBGrid1.DisableScroll;
  vVlrPago      := 0;
  vVlrDevolucao := 0;
  vVlrRestante  := 0;
  vVlrTotal     := 0;
  qParcelas.First;
  while not qParcelas.Eof do
  begin
    vVlrPago      := StrToFloat(FormatFloat('0.00', vVlrPago + qParcelasVlrPago.AsFloat));
    vVlrDevolucao := StrToFloat(FormatFloat('0.00',vVlrDevolucao + qParcelasVlrDevolucao.AsFloat));
    vVlrRestante  := StrToFloat(FormatFloat('0.00',vVlrRestante + qParcelasVlrRestante.AsFloat));
    vVlrTotal     := StrToFloat(FormatFloat('0.00',vVlrTotal + qParcelasVlrParcela.AsFloat));

    qParcelas.Next;
  end;

  lbPago.Caption      := FormatFloat('###,###,##0.00',vVlrPago);
  lbDevolucao.Caption := FormatFloat('###,###,##0.00',vVlrDevolucao);
  lbRestante.Caption  := FormatFloat('###,###,##0.00',vVlrRestante);
  lbTotal.Caption     := FormatFloat('###,###,##0.00',vVlrTotal);

  SMDBGrid1.EnableScroll;
end;

procedure TfConsCPagar2.SMDBGrid1FilterChanged(Sender: TObject);
begin
  Le_Parcelas;
end;

procedure TfConsCPagar2.BitBtn2Click(Sender: TObject);
begin
  Le_Parcelas;
end;

end.
