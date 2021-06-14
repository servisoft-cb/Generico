unit uProdutoCartoC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, Grids, DBGrids, SMDBGrid,
  ExtCtrls, uDmProdutoCarto, rsDBUtils, DB, DBTables, FMTBcd, DBClient, Provider, SqlExpr;

type
  TfProdutoCartoC = class(TForm)
    Panel1: TPanel;
    SMDBGrid1: TSMDBGrid;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    tProdutoIns: TTable;
    tProdutoInsCodigo: TIntegerField;
    BitBtn3: TBitBtn;
    sdsProduto: TSQLDataSet;
    sdsProdutoCODIGO: TIntegerField;
    sdsProdutoREFERENCIA: TStringField;
    sdsProdutoNOME: TStringField;
    sdsProdutoINATIVO: TStringField;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    cdsProdutoCODIGO: TIntegerField;
    cdsProdutoREFERENCIA: TStringField;
    cdsProdutoNOME: TStringField;
    cdsProdutoINATIVO: TStringField;
    dsProduto: TDataSource;
    BitBtn1: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    fDmProdutoCarto: TdmProdutoCarto;
  public
    { Public declarations }
  end;

var
  fProdutoCartoC: TfProdutoCartoC;

implementation

uses DmdDatabase, uProdutoCarto, UDM1, uIntegracao, uProdutoCartoR;

{$R *.dfm}

procedure TfProdutoCartoC.BitBtn4Click(Sender: TObject);
begin
  fProdutoCarto := TfProdutoCarto.Create(Self);
  fProdutoCarto.dmProdutoCarto := fdmProdutoCarto;

  tProdutoIns.Open;
  tProdutoIns.IndexFieldNames  := 'Codigo';
  tProdutoIns.Last;
  dm1.tProduto.Insert;
  DM1.tProdutoCodigo.AsInteger        := tProdutoInsCodigo.AsInteger + 1;

  dm1.tProdutoProdMat.AsString        := 'P';
  dm1.tProdutoMaterialOutros.AsString := 'P';
  dm1.tProdutoInativo.AsBoolean       := False;
  dm1.tProdutoOrigemProd.AsString     := '0';
  tProdutoIns.Close;
  dm1.tProduto.Post;

  Prc_Gravar_Produto_FB(DM1.tProdutoCodigo.AsInteger);

  dm1.tProduto.Edit;
  fdmProdutoCarto.cdsProduto.Close;
  fdmProdutoCarto.cdsProduto.Open;
  fdmProdutoCarto.cdsProduto.IndexFieldNames := 'Codigo';
  if fdmProdutoCarto.cdsProduto.FindKey([dm1.tProdutoCodigo.AsInteger]) then
  begin
    fdmProdutoCarto.cdsProduto.Edit;
    fdmProdutoCarto.cdsProdutoCarto.Edit;
    fdmProdutoCarto.cdsProdutoCartoFACA.AsString := '0';
  end;

  fProdutoCarto.ShowModal;

  fdmProdutoCarto.cdsProduto.Close;
  fdmProdutoCarto.cdsProdutoCarto.Close;
  fdmProdutoCarto.cdsProdutoCartoFD.Close;
  fdmProdutoCarto.cdsProduto.Open;
  fdmProdutoCarto.cdsProduto.First;
end;

procedure TfProdutoCartoC.SMDBGrid1DblClick(Sender: TObject);
begin
  dm1.tProduto.IndexFieldNames := 'Codigo';
  dm1.tProduto.FindKey([cdsProdutoCODIGO.AsInteger]);
  dm1.tProduto.Edit;

  fdmProdutoCarto.cdsProduto.Open;
  fdmProdutoCarto.cdsProduto.IndexFieldNames := 'Codigo';
  if fdmProdutoCarto.cdsProduto.FindKey([dm1.tProdutoCodigo.AsInteger]) then
    fdmProdutoCarto.cdsProduto.Edit;

  fProdutoCarto := TfProdutoCarto.Create(Self);
  fProdutoCarto.dmProdutoCarto := fdmProdutoCarto;
  fdmProdutoCarto.cdsProdutoCarto.Edit;
  fProdutoCarto.ShowModal;

  fdmProdutoCarto.cdsProduto.Close;
  fdmProdutoCarto.cdsProdutoCarto.Close;
  fdmProdutoCarto.cdsProdutoCartoFD.Close;
  fdmProdutoCarto.cdsProduto.Open;
  fdmProdutoCarto.cdsProduto.First;
end;

procedure TfProdutoCartoC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDmProdutoCarto.Owner.ClassName = Self.ClassName then
    FreeAndNil(fDmProdutoCarto);
  Action := caFree;
end;

procedure TfProdutoCartoC.FormCreate(Sender: TObject);
begin
  if not Assigned(DmDatabase) then
    DmDatabase := TDmDatabase.Create(Self);
  if not Assigned(fDmProdutoCarto) then
    fDmProdutoCarto := TDmProdutoCarto.Create(Self);

  dm1.tProduto.Open;
  cdsProduto.Open;
end;

procedure TfProdutoCartoC.BitBtn5Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,[mbOk,mbNo],0) = mrOk then
  begin
    dm1.tProduto.IndexFieldNames := 'Codigo';
    dm1.tProduto.FindKey([fdmProdutoCarto.cdsProdutoCODIGO.AsInteger]);
    Dm1.tProduto.Delete;

    fDmProdutoCarto.cdsProdutoCarto.First;
    fDmProdutoCarto.cdsProdutoCartoFD.First;
    while not fDmProdutoCarto.cdsProdutoCarto.IsEmpty do
      fDmProdutoCarto.cdsProdutoCarto.Delete;
    while not fDmProdutoCarto.cdsProdutoCartoFD.IsEmpty do
      fDmProdutoCarto.cdsProdutoCartoFD.Delete;
    fDmProdutoCarto.cdsProduto.Delete;
    fDmProdutoCarto.cdsProduto.ApplyUpdates(0);
  end;
end;

procedure TfProdutoCartoC.BitBtn3Click(Sender: TObject);
var
  vCod: Integer;
begin
  vCod := fDmProdutoCarto.cdsProdutoCODIGO.AsInteger;
  fProdutoCartoR := TfProdutoCartoR.Create(Self);
  fProdutoCartoR.dmProdutoCarto := fdmProdutoCarto;
  fProdutoCartoR.RLReport1.Preview;
  fdmProdutoCarto.cdsProduto.Close;
  fdmProdutoCarto.cdsProduto.Open;
  fdmProdutoCarto.cdsProduto.IndexFieldNames := 'CODIGO';
  fdmProdutoCarto.cdsProduto.FindKey([vCod]);
end;

procedure TfProdutoCartoC.BitBtn1Click(Sender: TObject);
begin
  cdsProduto.Close;
  cdsProduto.Open;
end;

end.
