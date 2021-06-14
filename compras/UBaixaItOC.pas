unit UBaixaItOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, DBCtrls, StdCtrls, Buttons, RXLookup, Grids,
  DBGrids, RXDBCtrl, Db, DbTables, Mask, ToolEdit, CurrEdit,
  DBFilter, ALed, DBVGrids;

type
  TfBaixaItOC = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    RxDBGrid1: TRxDBGrid;
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
    BitBtn3: TBitBtn;
    tOrdemCompraItem: TTable;
    tOrdemCompraItemCodigo: TIntegerField;
    tOrdemCompraItemItem: TIntegerField;
    tOrdemCompraItemQtd: TFloatField;
    tOrdemCompraItemQtdEntregue: TFloatField;
    tOrdemCompraItemQtdRestante: TFloatField;
    tOrdemCompraItemCodMaterial: TIntegerField;
    tOrdemCompraItemCodCor: TIntegerField;
    tOrdemCompraItemVlrUnitario: TFloatField;
    tOrdemCompraItemAliqIPI: TFloatField;
    tOrdemCompraItemVlrIPI: TFloatField;
    tOrdemCompraItemDtEntrega: TDateField;
    tOrdemCompraItemVlrTotal: TFloatField;
    tOrdemCompraItemCodGrade: TIntegerField;
    tOrdemCompraItemUnidade: TStringField;
    dsOrdemCompraItem: TDataSource;
    tOrdemCompraItemlkNomeMaterial: TStringField;
    tOrdemCompraItemlkNomeCor: TStringField;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    tOrdemCompraItemGradeFilial: TIntegerField;
    tOrdemCompraItemFilial: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure VDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Verifica_Entregue;
  public
    { Public declarations }
  end;

var
  fBaixaItOC: TfBaixaItOC;
  vSelecionado : Boolean;
  vPedido : integer;

implementation

uses UDM1, UEmissaoNotaFiscal, UNotaEntrada, UEntrExtOC;

{$R *.DFM}

procedure TfBaixaItOC.Verifica_Entregue;
var
  Entregue : Boolean;
begin
  Entregue := True;
  DM1.tOrdemCompraItem.First;
  while not DM1.tOrdemCompraItem.Eof do
    begin
      if DM1.tOrdemCompraItemQtdRestante.AsFloat > 0 then
        Entregue := False;
      DM1.tOrdemCompraItem.Next;
    end;
  DM1.tOrdemCompra.Edit;
  DM1.tOrdemCompraEntregue.AsBoolean := Entregue;
  DM1.tOrdemCompra.Post;
end;

procedure TfBaixaItOC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Verifica_Entregue;
  Action := CaFree;
end;

procedure TfBaixaItOC.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfBaixaItOC.FormCreate(Sender: TObject);
begin
  tOrdemCompraItem.Filtered := False;
  tOrdemCompraItem.Filter   := 'Codigo = '''+DM1.tOrdemCompraItemCodigo.AsString+''' and Item = '''+DM1.tOrdemCompraItemItem.AsString+'''';
  tOrdemCompraItem.Filtered := True;
  if tOrdemCompraItemCodGrade.AsInteger > 0 then
    begin
      CurrencyEdit1.Enabled := False;
      CurrencyEdit2.Enabled := False;
      BitBtn1.Enabled       := False;
      BitBtn2.Enabled       := False;
    end
  else
    begin
      CurrencyEdit1.Enabled := True;
      CurrencyEdit2.Enabled := True;
      BitBtn1.Enabled       := True;
      BitBtn2.Enabled       := True;
    end;
end;

procedure TfBaixaItOC.BitBtn1Click(Sender: TObject);
begin
  if (CurrencyEdit1.Value + tOrdemCompraItemQtdEntregue.AsFloat <= tOrdemCompraItemQtd.AsFloat) and (CurrencyEdit1.Value <= tOrdemCompraItemQtd.AsFloat) then
    begin
      DM1.tOrdemCompraItem.Edit;
      DM1.tOrdemCompraItemQtdEntregue.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdEntregue.AsFloat)) + StrToFloat(FormatFloat('0.00000',CurrencyEdit1.Value));
      DM1.tOrdemCompraItemQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdRestante.AsFloat)) - StrToFloat(FormatFloat('0.00000',CurrencyEdit1.Value));
      DM1.tOrdemCompraItem.Post;
      DM1.tOrdemCompraItem.Refresh;
      tOrdemCompraItem.Refresh;
      CurrencyEdit1.Clear;
      CurrencyEdit1.SetFocus;
    end
  else
    begin
      ShowMessage('A Qtd. Entregue não pode ser maior que a Qtd. Restante!');
      CurrencyEdit1.SetFocus;
    end;
end;

procedure TfBaixaItOC.BitBtn2Click(Sender: TObject);
begin
  if CurrencyEdit2.Value <= tOrdemCompraItemQtdEntregue.AsFloat then
    begin
      DM1.tOrdemCompraItem.Edit;
      DM1.tOrdemCompraItemQtdEntregue.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdEntregue.AsFloat)) - StrToFloat(FormatFloat('0.00000',CurrencyEdit2.Value));
      DM1.tOrdemCompraItemQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdRestante.AsFloat)) + StrToFloat(FormatFloat('0.00000',CurrencyEdit2.Value));
      DM1.tOrdemCompraItem.Post;
      tOrdemCompraItem.Refresh;
      CurrencyEdit2.Clear;
      CurrencyEdit2.SetFocus;
    end
  else
    begin
      ShowMessage('A Qtd. de Extorno não pode ser maior que a Qtd. Entregue!');
      CurrencyEdit2.SetFocus;
    end;
end;

procedure TfBaixaItOC.VDBGrid1DblClick(Sender: TObject);
begin
  fEntrExtOC := TfEntrExtOc.Create(Self);
  fEntrExtOc.ShowModal;
end;

end.
