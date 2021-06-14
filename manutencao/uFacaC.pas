unit uFacaC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, Grids, DBGrids, SMDBGrid,
  ExtCtrls, uDmProdutoCarto, rsDBUtils, DB, DBTables, FMTBcd, DBClient, SqlExpr, Provider, Mask, DBCtrls;

type
  TfFacaC = class(TForm)
    Panel1: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    tProdutoIns: TTable;
    tProdutoInsCodigo: TIntegerField;
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
    sdsProdutoFD_LARGURA: TFMTBCDField;
    sdsProdutoFD_COMPR: TFMTBCDField;
    sdsProdutoFD_ALTURA: TFMTBCDField;
    sdsProdutoFD_ABA_INT_CAB: TFMTBCDField;
    sdsProdutoFD_ABA_INT_LAT: TFMTBCDField;
    sdsProdutoTP_ABA_EXT_CAB: TFMTBCDField;
    sdsProdutoTP_ABA_INT_CAB: TFMTBCDField;
    sdsProdutoTP_ABA_EXT_LAT: TFMTBCDField;
    sdsProdutoTP_ABA_INT_LAT: TFMTBCDField;
    sdsProdutoSP_COMPR: TFMTBCDField;
    sdsProdutoSP_LARGURA: TFMTBCDField;
    sdsProdutoSP_ALTURA: TFMTBCDField;
    sdsProdutoSP_ABA_INT_CAB: TFMTBCDField;
    sdsProdutoSP_ABA_INT_LAT: TFMTBCDField;
    sdsProdutoFD_TIPO_MAT: TStringField;
    sdsProdutoSP_TIPO_MAT: TStringField;
    sdsProdutoTP_TIPO_MAT: TStringField;
    cdsProdutoFD_LARGURA: TFMTBCDField;
    cdsProdutoFD_COMPR: TFMTBCDField;
    cdsProdutoFD_ALTURA: TFMTBCDField;
    cdsProdutoFD_ABA_INT_CAB: TFMTBCDField;
    cdsProdutoFD_ABA_INT_LAT: TFMTBCDField;
    cdsProdutoTP_ABA_EXT_CAB: TFMTBCDField;
    cdsProdutoTP_ABA_INT_CAB: TFMTBCDField;
    cdsProdutoTP_ABA_EXT_LAT: TFMTBCDField;
    cdsProdutoTP_ABA_INT_LAT: TFMTBCDField;
    cdsProdutoSP_COMPR: TFMTBCDField;
    cdsProdutoSP_LARGURA: TFMTBCDField;
    cdsProdutoSP_ALTURA: TFMTBCDField;
    cdsProdutoSP_ABA_INT_CAB: TFMTBCDField;
    cdsProdutoSP_ABA_INT_LAT: TFMTBCDField;
    cdsProdutoFD_TIPO_MAT: TStringField;
    cdsProdutoSP_TIPO_MAT: TStringField;
    cdsProdutoTP_TIPO_MAT: TStringField;
    cdsProdutoclFDTipoMat: TStringField;
    cdsProdutoclTPTipoMat: TStringField;
    cdsProdutoclSPTipoMat: TStringField;
    sdsProdutoFD_COPIAS_C: TSmallintField;
    sdsProdutoTP_COPIAS_C: TSmallintField;
    sdsProdutoSP_COPIAS_C: TSmallintField;
    sdsProdutoFD_COPIAS_L: TSmallintField;
    sdsProdutoTP_COPIAS_L: TSmallintField;
    sdsProdutoSP_COPIAS_L: TSmallintField;
    cdsProdutoFD_COPIAS_C: TSmallintField;
    cdsProdutoTP_COPIAS_C: TSmallintField;
    cdsProdutoSP_COPIAS_C: TSmallintField;
    cdsProdutoFD_COPIAS_L: TSmallintField;
    cdsProdutoTP_COPIAS_L: TSmallintField;
    cdsProdutoSP_COPIAS_L: TSmallintField;
    Query1: TQuery;
    Query1ULT: TStringField;
    sdsProdutoFD_FECHAMENTO: TStringField;
    sdsProdutoCT_FECHAMENTO: TStringField;
    sdsProdutoTP_FECHAMENTO: TStringField;
    sdsProdutoSP_FECHAMENTO: TStringField;
    cdsProdutoFD_FECHAMENTO: TStringField;
    cdsProdutoCT_FECHAMENTO: TStringField;
    cdsProdutoTP_FECHAMENTO: TStringField;
    cdsProdutoSP_FECHAMENTO: TStringField;
    Label1: TLabel;
    SMDBGrid2: TSMDBGrid;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    Label5: TLabel;
    procedure BitBtn4Click(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure cdsProdutoCalcFields(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fDmFaca: TdmProdutoCarto;
  public
    { Public declarations }
  end;

var
  fFacaC: TfFacaC;

implementation

uses DmdDatabase, uFaca, UDM1, uIntegracao;

{$R *.dfm}

procedure TfFacaC.BitBtn4Click(Sender: TObject);
begin
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

  Query1.Open;
  dm1.tProdutoReferencia.AsInteger    := Query1ULT.AsInteger + 1;
  Query1.Close;

  dm1.tProduto.Post;

  Prc_Gravar_Produto_FB(DM1.tProdutoCodigo.AsInteger);

  dm1.tProduto.Edit;
  fDmFaca.cdsProduto.Close;
  fDmFaca.cdsProduto.Open;
  fDmFaca.cdsProduto.IndexFieldNames := 'Codigo';
  if fDmFaca.cdsProduto.FindKey([dm1.tProdutoCodigo.AsInteger]) then
    fDmFaca.cdsProduto.Edit;

  fDmFaca.cdsProdutoCarto.Insert;
  fDmFaca.cdsProdutoCartoTIPO.AsString := '1';
  fDmFaca.cdsProdutoCartoFACA.AsString := '1';
  fDmFaca.cdsProdutoCartoFD_COPIAS_C.AsInteger := 1;
  fDmFaca.cdsProdutoCartoFD_COPIAS_L.AsInteger := 1;
  fDmFaca.cdsProdutoCartoTP_COPIAS_C.AsInteger := 1;
  fDmFaca.cdsProdutoCartoTP_COPIAS_L.AsInteger := 1;
  fDmFaca.cdsProdutoCartoSP_COPIAS_C.AsInteger := 1;
  fDmFaca.cdsProdutoCartoSP_COPIAS_L.AsInteger := 1;

  fFaca := TfFaca.Create(Self);
  fFaca.dmFaca := fDmFaca;
  fFaca.ShowModal;

  fDmFaca.cdsProduto.Close;

  fDmFaca.cdsProdutoCarto.Close;
  fDmFaca.cdsProdutoCartoFD.Close;
  fDmFaca.cdsProduto.Open;
  fDmFaca.cdsProduto.First;

  cdsProduto.Close;
  cdsProduto.Open;
end;

procedure TfFacaC.SMDBGrid1DblClick(Sender: TObject);
begin
  dm1.tProduto.IndexFieldNames := 'Codigo';
  dm1.tProduto.FindKey([cdsProdutoCODIGO.AsInteger]);
  dm1.tProduto.Edit;

  fDmFaca.cdsProduto.Open;
  fDmFaca.cdsProduto.IndexFieldNames := 'Codigo';
  if fDmFaca.cdsProduto.FindKey([dm1.tProdutoCodigo.AsInteger]) then
    fDmFaca.cdsProduto.Edit;

  fDmFaca.cdsProdutoCarto.Edit;

  fFaca := TfFaca.Create(Self);
  fFaca.dmFaca := fDmFaca;
  fFaca.ShowModal;

  cdsProduto.Close;
  cdsProduto.Open;
end;

procedure TfFacaC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDmFaca.Owner.ClassName = Self.ClassName then
    FreeAndNil(fDmFaca);
  Action := caFree;
end;

procedure TfFacaC.FormCreate(Sender: TObject);
begin
  if not Assigned(DmDatabase) then
    DmDatabase := TDmDatabase.Create(Self);
  if not Assigned(fDmFaca) then
    fDmFaca := TDmProdutoCarto.Create(Self);

  dm1.tProduto.Open;
  cdsProduto.Open;
end;

procedure TfFacaC.BitBtn5Click(Sender: TObject);
begin
  {if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,[mbOk,mbNo],0) = mrOk then
  begin
    fdmProdutoCarto.cdsFaca.Delete;
    fDmProdutoCarto.cdsFaca.ApplyUpdates(0);
  end;}
end;

procedure TfFacaC.cdsProdutoCalcFields(DataSet: TDataSet);
begin
  if not cdsProdutoFD_TIPO_MAT.IsNull then
    case cdsProdutoFD_TIPO_MAT.AsInteger of
      1: cdsProdutoclFDTipoMat.AsString := 'DUPLEX';
      2: cdsProdutoclFDTipoMat.AsString := 'MICRO';
      3: cdsProdutoclFDTipoMat.AsString := 'CARTÃO / CARTÃO';
      4: cdsProdutoclFDTipoMat.AsString := 'MICRO / ABAS INTERNAS';
    end;
  if not cdsProdutoTP_TIPO_MAT.IsNull then
    case cdsProdutoTP_TIPO_MAT.AsInteger of
      1: cdsProdutoclTPTipoMat.AsString := 'DUPLEX';
      2: cdsProdutoclTPTipoMat.AsString := 'MICRO';
      3: cdsProdutoclTPTipoMat.AsString := 'CARTÃO / CARTÃO';
      4: cdsProdutoclTPTipoMat.AsString := 'MICRO / ABAS INTERNAS';
    end;
  if not cdsProdutoSP_TIPO_MAT.IsNull then
    case cdsProdutoSP_TIPO_MAT.AsInteger of
      1: cdsProdutoclSPTipoMat.AsString := 'DUPLEX';
      2: cdsProdutoclSPTipoMat.AsString := 'MICRO';
      3: cdsProdutoclSPTipoMat.AsString := 'CARTÃO / CARTÃO';
      4: cdsProdutoclSPTipoMat.AsString := 'MICRO / ABAS INTERNAS';
    end;
end;

procedure TfFacaC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F5) then
  begin
    cdsProduto.Close;
    cdsProduto.Open;
  end;
end;

end.
