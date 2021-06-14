unit UMaterialFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, ExtCtrls, StdCtrls, RxLookup, Buttons,
  DB, DBTables;

type
  TfMaterialFornecedor = class(TForm)
    Panel1: TPanel;
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label3: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label4: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label5: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label6: TLabel;
    Edit2: TEdit;
    qCor: TQuery;
    qCorNome: TStringField;
    qCorCodCor: TIntegerField;
    dsqCor: TDataSource;
    qProximaItem: TQuery;
    qProximaItemItem: TIntegerField;
    BitBtn3: TBitBtn;
    Label7: TLabel;
    Edit3: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    vItemMatForn : Integer;
    vCodForn : Integer;
  public
    { Public declarations }
    vCodProduto : Integer;
    vTipoProdMat : String;

    vTabela : TTable;
    
  end;

var
  fMaterialFornecedor: TfMaterialFornecedor;

implementation

uses UDM1, UDMMaterialFornecedor;

{$R *.dfm}

procedure TfMaterialFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMMaterialFornecedor.tMaterialFornecedor.Filtered := False;
  Action := Cafree;
end;

procedure TfMaterialFornecedor.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfMaterialFornecedor.FormShow(Sender: TObject);
begin
  vItemMatForn    := 0;

  BitBtn1.Enabled := (vTabela.State in [dsEdit,dsInsert]);
  BitBtn2.Enabled := (vTabela.State in [dsEdit,dsInsert]);
  Panel1.Enabled  := (vTabela.State in [dsEdit,dsInsert]);

  {BitBtn1.Enabled := (DM1.tProduto.State in [dsEdit,dsInsert]);
  BitBtn2.Enabled := (DM1.tProduto.State in [dsEdit,dsInsert]);
  Panel1.Enabled  := (DM1.tProduto.State in [dsEdit,dsInsert]);}

  qCor.Close;
  qCor.ParamByName('CodProduto').AsInteger := vCodProduto;
  qCor.Open;

  DMMaterialFornecedor.tMaterialFornecedor.Filtered := False;
  DMMaterialFornecedor.tMaterialFornecedor.Filter   := 'CodMaterial = '''+IntToStr(vCodProduto)+'''';
  DMMaterialFornecedor.tMaterialFornecedor.Filtered := True;
end;

procedure TfMaterialFornecedor.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfMaterialFornecedor.BitBtn1Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  if RxDBLookupCombo3.Text = '' then
  begin
    ShowMessage('Fornecedor não foi informado!');
    exit;
  end;
  if Trim(Edit1.Text) = '' then
  begin
    ShowMessage('Cód. do produto do fornecedor não foi informado!');
    exit;
  end;
  if (not(qCor.IsEmpty)) and (RxDBLookupCombo4.Text = '') then
  begin
    ShowMessage('Cor não foi informada!');
    exit;
  end;
  if qCor.IsEmpty then
    RxDBLookupCombo4.ClearValue;
  //if (DM1.tProdutoLancaGrade.AsBoolean) and ((RxDBLookupCombo1.Text = '') or (RxDBLookupCombo2.Text = '')) then
  if (vTabela.FieldByName('LancaGrade').AsBoolean) and ((RxDBLookupCombo1.Text = '') or (RxDBLookupCombo2.Text = '')) then
  begin
    ShowMessage('Grade ou tamanho não foram informados!');
    exit;
  end;
  if not vTabela.FieldByName('LancaGrade').AsBoolean then
  begin
    RxDBLookupCombo1.ClearValue;
    RxDBLookupCombo2.ClearValue;
  end;

  if vCodForn <> RxDBLookupCombo2.KeyValue then
    vItemMatForn := 0;

  if DMMaterialFornecedor.tMaterialFornecedor.Locate('CodMaterial;CodFornecedor;CodMaterialForn',VarArrayOf([vCodProduto,RxDBLookupCombo3.KeyValue,Edit1.Text]),[locaseinsensitive]) then
  begin
    ShowMessage('Produto já lançado para este fornecedor!');
    exit;
  end;

  if vItemMatForn > 0 then
    vItemAux := vItemMatForn
  else
  begin
    qProximaItem.Close;
    qProximaItem.ParamByName('CodMaterial').AsInteger   := vCodProduto;
    qProximaItem.ParamByName('CodFornecedor').AsInteger := RxDBLookupCombo3.KeyValue;
    qProximaItem.Open;
    vItemAux := qProximaItemItem.AsInteger + 1;
  end;

  DMMaterialFornecedor.tMaterialFornecedor.Insert;
  DMMaterialFornecedor.tMaterialFornecedorCodMaterial.AsInteger     := vCodProduto;
  DMMaterialFornecedor.tMaterialFornecedorCodFornecedor.AsInteger   := RxDBLookupCombo3.KeyValue;
  DMMaterialFornecedor.tMaterialFornecedorItem.AsInteger            := vItemAux;
  DMMaterialFornecedor.tMaterialFornecedorNomeMaterialForn.AsString := Edit2.Text;
  DMMaterialFornecedor.tMaterialFornecedorCodMaterialForn.AsString  := Edit1.Text;
  DMMaterialFornecedor.tMaterialFornecedorCodBarra.AsString         := Edit3.Text;
  if RxDBLookupCombo1.Text <> '' then
    DMMaterialFornecedor.tMaterialFornecedorCodGrade.AsInteger := RxDBLookupCombo1.KeyValue
  else
    DMMaterialFornecedor.tMaterialFornecedorCodGrade.AsInteger := 0;
  if RxDBLookupCombo2.Text <> '' then
  begin
    DMMaterialFornecedor.tMaterialFornecedorCodPosicao.AsInteger := RxDBLookupCombo2.KeyValue;
    DMMaterialFornecedor.tMaterialFornecedorTamanho.AsString     := RxDBLookupCombo2.Text;
  end
  else
  begin
    DMMaterialFornecedor.tMaterialFornecedorCodPosicao.AsInteger := 0;
    DMMaterialFornecedor.tMaterialFornecedorTamanho.AsString     := '';
  end;
  if RxDBLookupCombo4.Text <> '' then
    DMMaterialFornecedor.tMaterialFornecedorCodCor.AsInteger := RxDBLookupCombo4.KeyValue
  else
    DMMaterialFornecedor.tMaterialFornecedorCodCor.AsInteger := 0;
  DMMaterialFornecedor.tMaterialFornecedor.Post;
  
  RxDBLookupCombo3.SetFocus;
  vItemMatForn := 0;
  //if not DM1.tProdutoLancaGrade.AsBoolean then
  if not vTabela.FieldByName('LancaGrade').AsBoolean then
  begin
    RxDBLookupCombo1.ClearValue;
    RxDBLookupCombo3.ClearValue;
    RxDBLookupCombo4.ClearValue;
  end;
  RxDBLookupCombo2.ClearValue;
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
end;

procedure TfMaterialFornecedor.BitBtn2Click(Sender: TObject);
begin
  if DMMaterialFornecedor.tMaterialFornecedor.IsEmpty then
  begin
    ShowMessage('Não existe registro para alterar!');
    exit;
  end;
  RxDBLookupCombo3.KeyValue := DMMaterialFornecedor.tMaterialFornecedorCodFornecedor.AsInteger;
  if DMMaterialFornecedor.tMaterialFornecedorCodCor.AsInteger > 0 then
    RxDBLookupCombo4.KeyValue := DMMaterialFornecedor.tMaterialFornecedorCodCor.AsInteger
  else                          
    RxDBLookupCombo4.ClearValue;
  if DMMaterialFornecedor.tMaterialFornecedorCodGrade.AsInteger > 0 then
    RxDBLookupCombo1.KeyValue := DMMaterialFornecedor.tMaterialFornecedorCodGrade.AsInteger
  else
    RxDBLookupCombo1.ClearValue;
  if DMMaterialFornecedor.tMaterialFornecedorCodPosicao.AsInteger > 0 then
    RxDBLookupCombo2.KeyValue := DMMaterialFornecedor.tMaterialFornecedorCodPosicao.AsInteger
  else
    RxDBLookupCombo2.ClearValue;
  Edit1.Text := DMMaterialFornecedor.tMaterialFornecedorCodMaterialForn.AsString;
  Edit2.Text := DMMaterialFornecedor.tMaterialFornecedorNomeMaterialForn.AsString;
  Edit3.Text := DMMaterialFornecedor.tMaterialFornecedorCodBarra.AsString;
  RxDBLookupCombo3.SetFocus;
  vItemMatForn := DMMaterialFornecedor.tMaterialFornecedorItem.AsInteger;
  vCodForn     := DMMaterialFornecedor.tMaterialFornecedorCodFornecedor.AsInteger;
  DMMaterialFornecedor.tMaterialFornecedor.Delete;
end;

end.
