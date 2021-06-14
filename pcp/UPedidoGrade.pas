unit UPedidoGrade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, ToolEdit, CurrEdit, Buttons, Db,
  DBTables, MemTable, Grids, DBVGrids, DBGrids;

type
  TfPedidoGrade = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    BitBtn5: TBitBtn;
    VDBGrid1: TVDBGrid;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VDBGrid1Enter(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBLookupComboBox4Exit(Sender: TObject);
    procedure VDBGrid1CellClick(Column: TColumn);
    procedure VDBGrid1ColEnter(Sender: TObject);
    procedure VDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    procedure MontaGrade;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPedidoGrade: TfPedidoGrade;

implementation

uses UPedido, UDM1, UPedidoItem;

{$R *.DFM}

procedure TfPedidoGrade.MontaGrade;
begin
  if fPedido.BitBtn14.Tag <> 2 then
    begin
      {if DM1.tGradeTipoDig.AsString = 'P' then
        begin
          CurrencyEdit1.ReadOnly := False;
          VDBGrid1.ReadOnly      := False;
        end
      else}
        //begin
          CurrencyEdit1.ReadOnly := False;
          VDBGrid1.ReadOnly      := False;
        //end;
    end;

  if (fPedido.BitBtn14.Tag = 0) or (fPedido.tAuxPedidoGrade.RecordCount < 1) then
    begin
      fPedido.tAuxPedidoGrade.First;
      while not fPedido.tAuxPedidoGrade.Eof do
        fPedido.tAuxPedidoGrade.delete;
      DM1.tProdutoTam.First;
      while not DM1.tProdutoTam.Eof do
        begin
          fPedido.tAuxPedidoGrade.Insert;
          fPedido.tAuxPedidoGradeCodGrade.AsInteger   := DM1.tProdutoTamCodGrade.AsInteger;
          fPedido.tAuxPedidoGradePosicao.AsInteger    := DM1.tProdutoTamPosicao.AsInteger;
          fPedido.tAuxPedidoGradeQtd.AsString         := '';
          fPedido.tAuxPedidoGradeVlrUnitario.AsString := '';
          fPedido.tAuxPedidoGradeVlrTotal.AsString    := '';
          fPedido.tAuxPedidoGrade.Post;
          DM1.tProdutoTam.Next;
        end;
    end;
  fPedido.tAuxPedidoGrade.First;
end;

procedure TfPedidoGrade.FormShow(Sender: TObject);
begin
  BitBtn5.Caption := 'Continuar';
  if fPedido.BitBtn14.Tag = 2 then
    begin
      BitBtn5.Caption := 'Fechar';
      DbLookupComboBox4.Enabled := False;
      CurrencyEdit1.Enabled     := False;
      VDBGrid1.ReadOnly         := True;
    end
  else
  if (fPedido.BitBtn14.Tag = 1) and (fPedido.tAuxPedidoGrade.RecordCount > 0) then
    begin
      DbLookupComboBox4.Enabled := False;
      CurrencyEdit1.Enabled     := True;
      VDBGrid1.ReadOnly         := False;
    end
  else
    begin
      DbLookupComboBox4.Enabled := True;
      CurrencyEdit1.Enabled     := True;
      VDBGrid1.ReadOnly         := False;
    end;

//  if DM1.tMaterialPrecoGrade.AsBoolean = false then
    vDBGrid1.Columns[2].Destroy;
  if fPedido.BitBtn14.Tag = 2 then
    begin
      DM1.tProduto.IndexFieldNames := 'Codigo';
      DM1.tProduto.FindKey([DM1.tPedidoItemCodProduto.AsInteger]);
      DM1.tProdutoGrade.FindKey([DM1.tPedidoItemCodProduto.AsInteger,DM1.tPedidoItemCodGrade.AsInteger]);
      DBLookupComboBox4.KeyValue := DM1.tPedidoItemCodGrade.AsInteger;
      CurrencyEdit1.AsInteger    := DM1.tPedidoItemQtdPares.AsInteger;
    end
  else
  if (fPedido.BitBtn14.Tag = 1) and (fPedido.tAuxPedidoGrade.RecordCount > 0) then
    begin
      fPedido.tAuxPedidoGrade.First;
      DM1.tProduto.IndexFieldNames := 'Codigo';
      DM1.tProduto.FindKey([DM1.tPedidoItemCodProduto.AsInteger]);
      DM1.tProdutoGrade.FindKey([DM1.tPedidoItemCodProduto.AsInteger,fPedido.tAuxPedidoGradeCodGrade.AsInteger]);
      DBLookupComboBox4.KeyValue := fPedido.tAuxPedidoGradeCodGrade.AsInteger;
    end
  else
    begin
      DM1.tProdutoGrade.First;
      DBLookupComboBox4.KeyValue := DM1.tProdutoGradeCodGrade.AsInteger;
    end;
  MontaGrade;
  if (fPedido.BitBtn14.Tag = 1) and (fPedido.tAuxPedidoGrade.RecordCount > 0) then
    CurrencyEdit1.Value := fPedidoItem.CurrencyEdit1.Value;
end;

procedure TfPedidoGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfPedidoGrade.VDBGrid1Enter(Sender: TObject);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfPedidoGrade.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfPedidoGrade.DBLookupComboBox4Exit(Sender: TObject);
begin
  MontaGrade;
end;

procedure TfPedidoGrade.VDBGrid1CellClick(Column: TColumn);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfPedidoGrade.VDBGrid1ColEnter(Sender: TObject);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;


procedure TfPedidoGrade.VDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := vk_Return;
end;

procedure TfPedidoGrade.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
 vQtd, vVlrTotal : Real;
begin
  if fPedido.BitBtn14.Tag <> 2 then
  begin
    vQtd      := 0;
    vVlrTotal := 0;
    fPedido.tAuxPedidoGrade.First;
    while not fPedido.tAuxPedidoGrade.Eof do
    begin
      vQtd      := vQtd + fPedido.tAuxPedidoGradeQtd.AsFloat;
      vVlrTotal := vVlrTotal + (fPedido.tAuxPedidoGradeQtd.AsFloat * fPedido.tAuxPedidoGradeVlrUnitario.AsFloat);
      fPedido.tAuxPedidoGrade.Next;
    end;
    if not(DM1.tParametrosControlarQtdGradePed.AsBoolean) then
      CurrencyEdit1.Value := vQtd;
    if FormatFloat('0.000',vQtd) <> FormatFloat('0.000',CurrencyEdit1.Value) then
    begin
      ShowMessage('Quantidade da grade diferente da quantidade total!');
      CanClose := False;
      CurrencyEdit1.SetFocus;
    end
    else
    begin
      fPedidoItem.CurrencyEdit1.Value := vQtd;
      CanClose := True;
    end;
  end
  else
  if fPedido.BitBtn14.Tag = 2 then
    CanClose := True;
end;

end.
