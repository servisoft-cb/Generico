unit UConsCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Grids, DBGrids, SMDBGrid, ExtCtrls, Mask,
  ToolEdit, DB, DBTables, DBClient, Buttons, ComCtrls;

type
  TfConsCompras = class(TForm)
    Panel1: TPanel;
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label3: TLabel;
    DateEdit1: TDateEdit;
    Label4: TLabel;
    DateEdit2: TDateEdit;
    qNotas: TQuery;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    Label5: TLabel;
    dsqNotas: TDataSource;
    BitBtn2: TBitBtn;
    mCompras: TClientDataSet;
    mComprasNumNota: TIntegerField;
    mComprasCodFornecedor: TIntegerField;
    mComprasNomeFornecedor: TStringField;
    mComprasFilial: TIntegerField;
    mComprasCodMaterial: TIntegerField;
    mComprasTipo: TStringField;
    mComprasData: TDateField;
    mComprasNomeProduto: TStringField;
    mComprasVlrUnitario: TFloatField;
    mComprasVlrTotal: TFloatField;
    mComprasQtd: TFloatField;
    mComprasVlrFrete: TFloatField;
    mComprasVlrIcms: TFloatField;
    mComprasVlrIpi: TFloatField;
    mComprasCodCor: TIntegerField;
    mComprasNomeCor: TStringField;
    mComprasVlrDesconto: TFloatField;
    dsmCompras: TDataSource;
    qNotaslkNomeCor: TStringField;
    ProgressBar1: TProgressBar;
    mComprasUnidade: TStringField;
    qNotasServico: TQuery;
    dsqNotasServico: TDataSource;
    qNotasNumNEntr: TIntegerField;
    qNotasDtEntrada: TDateField;
    qNotasDtEmissaoNEntr: TDateField;
    qNotasItem: TSmallintField;
    qNotasCodMaterial: TIntegerField;
    qNotasQtd: TFloatField;
    qNotasVlrTotalItens: TFloatField;
    qNotasVlrUnit: TFloatField;
    qNotasIcms: TFloatField;
    qNotasIpi: TFloatField;
    qNotasVlrDesc: TFloatField;
    qNotasVlrIpi: TFloatField;
    qNotasVlrIcms: TFloatField;
    qNotasNumOC: TIntegerField;
    qNotasItemOC: TIntegerField;
    qNotasUnidade: TStringField;
    qNotasCodCor: TIntegerField;
    qNotasCodNatOper: TIntegerField;
    qNotasGeraDupl: TBooleanField;
    qNotasVlrFrete: TFloatField;
    qNotasNomeForn: TStringField;
    qNotasNomeProduto: TStringField;
    qNotasCodForn: TIntegerField;
    qNotasFilial: TIntegerField;
    qNotasServicoNumNEntr: TIntegerField;
    qNotasServicoDtEntrada: TDateField;
    qNotasServicoDtEmissaoNEntr: TDateField;
    qNotasServicoNomeForn: TStringField;
    qNotasServicoDescricao: TStringField;
    qNotasServicoCodForn: TIntegerField;
    qNotasServicoFilial: TIntegerField;
    qNotasServicoItemMobra: TSmallintField;
    qNotasServicoVlrUnitServico: TFloatField;
    qNotasServicoVlrTotalServico: TFloatField;
    qNotasServicoQtdServico: TFloatField;
    qNotasServicoCodNatOperServico: TIntegerField;
    qNotasServicoGeraDuplMObra: TBooleanField;
    qNotasServicoCodServico: TSmallintField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure qNotasCalcFields(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
  private
    { Private declarations }
    vSql, vSqlServico : String;
    procedure Monta_SQL;
    procedure Monta_SQLServico;
    procedure Le_SQL;
    procedure Grava_mCompras(Tipo : String);
  public
    { Public declarations }
  end;

var
  fConsCompras: TfConsCompras;

implementation

uses UDM1, UNotaEntrada, URelCompras;

{$R *.dfm}

procedure TfConsCompras.Grava_mCompras(Tipo : String);
begin
  mCompras.Insert;
  if Tipo = 'P' then
    begin
      mComprasNumNota.AsInteger       := qNotasNumNEntr.AsInteger;
      mComprasCodFornecedor.AsInteger := qNotasCodForn.AsInteger;
      mComprasNomeFornecedor.AsString := qNotasNomeForn.AsString;
      mComprasFilial.AsInteger        := qNotasFilial.AsInteger;
      mComprasData.AsDateTime         := qNotasDtEntrada.AsDateTime;
      mComprasVlrFrete.AsFloat        := qNotasVlrFrete.AsFloat;
      mComprasTipo.AsString           := 'Prod';
      mComprasCodMaterial.AsInteger   := qNotasCodMaterial.AsInteger;
      mComprasNomeProduto.AsString    := qNotasNomeProduto.AsString;
      mComprasVlrUnitario.AsFloat     := qNotasVlrUnit.AsFloat;
      mComprasVlrTotal.AsFloat        := qNotasVlrTotalItens.AsFloat + qNotasVlrFrete.AsFloat;
      mComprasQtd.AsFloat             := qNotasQtd.AsFloat;
      mComprasVlrIcms.AsFloat         := qNotasVlrIcms.AsFloat;
      mComprasVlrIpi.AsFloat          := qNotasVlrIpi.AsFloat;
      mComprasCodCor.AsInteger        := qNotasCodCor.AsInteger;
      mComprasNomeCor.AsString        := qNotaslkNomeCor.AsString;
      mComprasVlrDesconto.AsFloat     := qNotasVlrDesc.AsFloat;
      mComprasUnidade.AsString        := qNotasUnidade.AsString;
    end
  else
    begin
      mComprasNumNota.AsInteger       := qNotasServicoNumNEntr.AsInteger;
      mComprasCodFornecedor.AsInteger := qNotasServicoCodForn.AsInteger;
      mComprasNomeFornecedor.AsString := qNotasServicoNomeForn.AsString;
      mComprasFilial.AsInteger        := qNotasServicoFilial.AsInteger;
      mComprasData.AsDateTime         := qNotasServicoDtEntrada.AsDateTime;
      mComprasVlrFrete.AsFloat        := 0;
      mComprasTipo.AsString           := 'M.Obr';
      mComprasCodMaterial.AsInteger   := qNotasServicoCodServico.AsInteger;
      mComprasNomeProduto.AsString    := qNotasServicoDescricao.AsString;
      mComprasVlrUnitario.AsFloat     := qNotasServicoVlrUnitServico.AsFloat;
      mComprasVlrTotal.AsFloat        := qNotasServicoVlrTotalServico.AsFloat;
      mComprasQtd.AsFloat             := qNotasServicoQtdServico.AsFloat;
      mComprasVlrIcms.AsFloat         := 0;
      mComprasVlrIpi.AsFloat          := 0;
      mComprasCodCor.AsInteger        := 0;
      mComprasNomeCor.AsString        := '';
      mComprasVlrDesconto.AsFloat     := 0;
      mComprasUnidade.AsString        := 'UN';
    end;
  mCompras.Post;
end;

procedure TfConsCompras.Le_SQL;
begin
  mCompras.EmptyDataSet;
  ProgressBar1.Max      := qNotas.RecordCount + qNotasServico.RecordCount;
  ProgressBar1.Position := 0;
  qNotas.First;
  while not qNotas.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      if qNotasGeraDupl.AsBoolean then
        Grava_mCompras('P');
      qNotas.Next;
    end;

  qNotasServico.First;
  while not qNotasServico.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      if qNotasServicoGeraDuplMObra.AsBoolean then
        Grava_mCompras('M');
      qNotasServico.Next;
    end;
end;

procedure TfConsCompras.Monta_SQL;
begin
  qNotas.Close;
  qNotas.SQL.Clear;
  qNotas.SQL.Text := vSql;
  if RxDBLookupCombo1.Text <> '' then
    begin
      qNotas.SQL.Add('  AND (dbNEntrada.Filial = :Filial) ' );
      qNotas.ParamByName('Filial').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo2.Text <> '' then
    begin
      qNotas.SQL.Add('  AND (dbFornecedores.CodForn = :CodForn) ' );
      qNotas.ParamByName('CodForn').AsInteger := RxDBLookupCombo2.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qNotas.SQL.Add(' AND (dbNEntrada.DtEntrada >= :DtInicial) ');
      qNotas.ParamByName('DtInicial').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then           
    begin
      qNotas.SQL.Add(' AND (dbNEntrada.DtEntrada <= :DtFinal) ');
      qNotas.ParamByName('DtFinal').AsDate := DateEdit2.Date;
    end;
  qNotas.Open;
end;

procedure TfConsCompras.Monta_SQLServico;
begin
  qNotasServico.Close;
  qNotasServico.SQL.Clear;
  qNotasServico.SQL.Text := vSqlServico;
  if RxDBLookupCombo1.Text <> '' then
    begin
      qNotasServico.SQL.Add('  AND (dbNEntrada.Filial = :Filial) ' );
      qNotasServico.ParamByName('Filial').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo2.Text <> '' then
    begin
      qNotasServico.SQL.Add('  AND (dbFornecedores.CodForn = :CodForn) ' );
      qNotasServico.ParamByName('CodForn').AsInteger := RxDBLookupCombo2.KeyValue;
    end;
  if DateEdit1.Date > 0 then
    begin
      qNotasServico.SQL.Add(' AND (dbNEntrada.DtEntrada >= :DtInicial) ');
      qNotasServico.ParamByName('DtInicial').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qNotasServico.SQL.Add(' AND (dbNEntrada.DtEntrada <= :DtFinal) ');
      qNotasServico.ParamByName('DtFinal').AsDate := DateEdit2.Date;
    end;
  qNotasServico.Open;
end;

procedure TfConsCompras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qNotas.Close;
  qNotasServico.Close;
  Dm1.tOrdemCompraItemGrade.Close;
  Dm1.tCondPgtoItem.Close;
  Dm1.tCPagar.Close;
  Dm1.tCPagarParc.Close;
  Dm1.tCPagarParcHist.Close;
  Dm1.tMaoDeObra.Close;
  Dm1.tOrdemCompra.Close;
  Dm1.tOrdemCompraItem.Close;
  DM1.tNEntrada.Close;
  DM1.tNEntradaItens.Close;
  DM1.tNEntradaItensGrade.Close;
  DM1.tNEntradaItensMobra.Close;
  DM1.tNEntradaParc.Close;
  DM1.tNEntradaNDevolvida.Close;

  DM1.tFornecedores.Close;
  DM1.tProduto.Close;
  Dm1.tProdutoCor.Close;
  DM1.tProdutoCli.Close;
  DM1.tProdutoConsumo.Close;
  DM1.tProdutoConsumoItem.Close;
  DM1.tProdutoGrade.Close;
  DM1.tProdutoMat.Close;
  DM1.tProdutoTam.Close;

  DM1.tEstoqueMatMov.Close;
  DM1.tCondPgto.Close;
  DM1.tCondPgto2.Close;

  DM1.tNatOperacao.Close;
  DM1.tPlanoContas.Close;
  DM1.tPlanoContasItens.Close;
  DM1.tTabPreco.Close;

  DM1.tNotaFiscal.Close;
  DM1.tNotaFiscalItens.Close;

  DM1.tUnidade.Close;

  Action := Cafree;
end;

procedure TfConsCompras.BitBtn1Click(Sender: TObject);
begin
  Monta_SQL;
  Monta_SQLServico;
  Le_SQL;
  ComboBox1Click(Sender);
end;

procedure TfConsCompras.FormShow(Sender: TObject);
begin
  Top   := 0;
  Left  := 0;
  Width := Screen.Width;
  Height := Screen.Height - 35;

  vSql        := qNotas.SQL.Text;
  vSqlServico := qNotasServico.SQL.Text;

  DM1.tFilial.Open;
  DM1.tCor2.Open;
  DM1.tFornecedores.Open;
end;

procedure TfConsCompras.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfConsCompras.qNotasCalcFields(DataSet: TDataSet);
begin
  //qNotasclVlrTotal.AsFloat := StrToFloat(FormatFloat('0.00',(qNotasVlrTotalItens.AsFloat + qNotasVlrFrete.AsFloat)));
end;

procedure TfConsCompras.BitBtn2Click(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  fRelCompras := TfRelCompras.Create(Self);
  fRelCompras.RLReport1.Preview;
  fRelCompras.RLReport1.Free;
  SMDBGrid1.EnableScroll;
end;

procedure TfConsCompras.SMDBGrid1DblClick(Sender: TObject);
begin
  {if qNotasNumNota.AsInteger > 0 then
    begin
      vNumNotaEntPos := qNotasNumNota.AsInteger;
      vCodFornPos    := qNotasCodForn.AsInteger;
      DM1.tFilial.Locate('Codigo',qNotasFilial.AsInteger,[loCaseInsensitive]);
      fNotaEntrada := TfNotaEntrada.Create(Self);
      fNotaEntrada.ShowModal;
    end;}
end;

procedure TfConsCompras.ComboBox1Click(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0 : mCompras.IndexFieldNames := 'Tipo;Data;NumNota;NomeFornecedor;NomeProduto';
    1 : mCompras.IndexFieldNames := 'Tipo;NumNota;NomeFornecedor;Data;NomeProduto';
    2 : mCompras.IndexFieldNames := 'Tipo;NomeFornecedor;NumNota;Data;NomeProduto';
    3 : mCompras.IndexFieldNames := 'Tipo;NomeProduto;NomeFornecedor;NumNota;Data';
  end;
end;

end.
