unit UBuscaOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, DBCtrls, StdCtrls, Buttons, RXLookup, Grids,
  DBGrids, RXDBCtrl, Db, DbTables, Mask, ToolEdit, CurrEdit,
  DBFilter, ALed, DBVGrids;

type
  TfBuscaOC = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    tOrdemCompraItemGrade: TTable;
    dsOrdemCompraItemGrade: TDataSource;
    tOrdemCompraItemGradeCodigo: TIntegerField;
    tOrdemCompraItemGradeItem: TIntegerField;
    tOrdemCompraItemGradeCodGrade: TIntegerField;
    tOrdemCompraItemGradePosicao: TIntegerField;
    tOrdemCompraItemGradeQtd: TFloatField;
    tOrdemCompraItemGradeVlrUnitario: TFloatField;
    tOrdemCompraItemGradeVlrTotal: TFloatField;
    tGradeItem: TTable;
    tGradeItemCodGrade: TIntegerField;
    tGradeItemPosicao: TIntegerField;
    tGradeItemTamanho: TStringField;
    tOrdemCompraItemGradelkTamanho: TStringField;
    VDBGrid1: TVDBGrid;
    tOrdemCompraItemGradeQtdEntregue: TFloatField;
    tOrdemCompraItemGradeQtdRestante: TFloatField;
    tAuxCopiaOC: TTable;
    dsAuxCopiaOC: TDataSource;
    tAuxCopiaOCNroOrdem: TIntegerField;
    tAuxCopiaOCItem: TIntegerField;
    tAuxCopiaOCCodGrade: TIntegerField;
    tAuxCopiaOCPosicao: TIntegerField;
    tAuxCopiaOClkTamanho: TStringField;
    tAuxCopiaOCQtd: TFloatField;
    tAuxCopiaOCQtdRestante: TFloatField;
    DBText1: TDBText;
    RxDBFilter1: TRxDBFilter;
    tOrdemCompraItemGradeFilial: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure tAuxCopiaOCAfterInsert(DataSet: TDataSet);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
    procedure Monta_Grade;
    procedure Apaga_AuxCopiaOC;
  public
    { Public declarations }
  end;

var
  fBuscaOC: TfBuscaOC;
  vSelecionado : Boolean;
  vPedido : integer;

implementation

uses UDM1, UEmissaoNotaFiscal, UNotaEntrada;

{$R *.DFM}

procedure TfBuscaOC.Monta_Grade;
begin
  Apaga_AuxCopiaOC;
  tOrdemCompraItemGrade.First;
  while not tOrdemCompraItemGrade.Eof do
    begin
      if tOrdemCompraItemGradeQtdRestante.AsFloat > 0 then
        begin
          tAuxCopiaOC.Insert;
          tAuxCopiaOCNroOrdem.AsInteger  := StrToInt(Edit2.Text);
          tAuxCopiaOCItem.AsInteger      := StrToInt(Edit1.Text);
          tAuxCopiaOCCodGrade.AsInteger  := tOrdemCompraItemGradeCodGrade.AsInteger;
          tAuxCopiaOCPosicao.AsInteger   := tOrdemCompraItemGradePosicao.AsInteger;
          tAuxCopiaOCQtd.AsFloat         := tOrdemCompraItemGradeQtdRestante.AsFloat;
          tAuxCopiaOCQtdRestante.AsFloat := tOrdemCompraItemGradeQtdRestante.AsFloat;
          tAuxCopiaOC.Post;
        end;
      tOrdemCompraItemGrade.Next;
    end;
end;

procedure TfBuscaOC.Apaga_AuxCopiaOC;
begin
  tAuxCopiaOC.First;
  while not tAuxCopiaOC.Eof do
    tAuxCopiaOC.Delete;
end;

procedure TfBuscaOC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Edit2.Text <> ''  then
    fNotaEntrada.CurrencyEdit11.Text := Edit2.Text;
  if Edit1.Text <> '' then
    fNotaEntrada.CurrencyEdit12.Text := Edit1.Text;
  RxDBFilter1.Active := False;
  DM1.tFornecedores.IndexFieldNames := 'CodForn';
  DM1.tOrdemCompra.IndexFieldNames  := 'Filial;Codigo';
  Action := CaFree;
end;

procedure TfBuscaOC.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfBuscaOC.RxDBGrid1DblClick(Sender: TObject);
begin
  Edit2.Text := DM1.tOrdemCompraCodigo.AsString;
  Edit1.Text := DM1.tOrdemCompraItemItem.AsString;
  if Edit2.Text <> '' then
    Monta_Grade
  else
    Apaga_AuxCopiaOc;
end;

procedure TfBuscaOC.FormShow(Sender: TObject);
begin
  RxDBFilter1.Active := True;
  vSelecionado := False;
  DM1.tOrdemCompra.Refresh;
  Apaga_AuxCopiaOC;
end;

procedure TfBuscaOC.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if vSelecionado then
    begin
      ShowMessage('Esta janela não pode ser fechada se há um item selecionado!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfBuscaOC.RxDBGrid2DblClick(Sender: TObject);
begin
  Edit2.Text := DM1.tOrdemCompraCodigo.AsString;
end;

procedure TfBuscaOC.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text <> '' then
    begin
      DM1.tOrdemCompraItem.SetKey;
      DM1.tOrdemCompraItemCodigo.AsString := Edit2.Text;
      DM1.tOrdemCompraItemItem.AsInteger  := StrToInt(Edit1.Text);
      if DM1.tOrdemCompraItem.GotoKey then
        Monta_Grade
      else
        begin
          ShowMessage('Item não cadastrado!');
          Edit1.SetFocus;
          Apaga_AuxCopiaOC;
        end;
    end;
end;

procedure TfBuscaOC.Edit2Change(Sender: TObject);
begin
  try
    DM1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
    DM1.tOrdemCompra.FindNearest([DM1.tNEntradaFilial.AsString,Edit2.Text]);
  except
    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfBuscaOC.tAuxCopiaOCAfterInsert(DataSet: TDataSet);
begin
  if tAuxCopiaOC.RecordCount > tOrdemCompraItemGrade.RecordCount then
    begin
      tAuxCopiaOC.Delete;
      tAuxCopiaOc.RecNo := tOrdemCompraItemGrade.RecordCount;
    end;
end;

procedure TfBuscaOC.RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if Dm1.tOrdemCompraEntregue.AsBoolean then
    Background := clRed;
end;

end.
