unit UDMTabImposto;

interface

uses
  SysUtils, Classes, DB, DBTables, DBIProcs;

type
  TDMTabImposto = class(TDataModule)
    tTabPis: TTable;
    tTabPisCodigo: TStringField;
    tTabPisNome: TStringField;
    dsTabPis: TDataSource;
    tTabCofins: TTable;
    dsTabCofins: TDataSource;
    tTabCofinsCodigo: TStringField;
    tTabCofinsNome: TStringField;
    tRegimeTrib: TTable;
    tRegimeTribCodigo: TIntegerField;
    tRegimeTribNome: TStringField;
    dsRegimeTrib: TDataSource;
    tOrigemProd: TTable;
    dsOrigemProd: TDataSource;
    tOrigemProdOrigem: TStringField;
    tOrigemProdNome: TStringField;
    procedure tTabPisAfterPost(DataSet: TDataSet);
    procedure tTabCofinsAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure tRegimeTribAfterPost(DataSet: TDataSet);
    procedure tOrigemProdAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTabImposto: TDMTabImposto;

implementation

{$R *.dfm}

procedure TDMTabImposto.tTabPisAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tTabPis.Handle);
end;

procedure TDMTabImposto.tTabCofinsAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tTabCofins.Handle);
end;

procedure TDMTabImposto.DataModuleCreate(Sender: TObject);
begin
  tTabCofins.Open;
  tTabPis.Open;
  tRegimeTrib.Open;
  tOrigemProd.Open;
end;

procedure TDMTabImposto.tRegimeTribAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tRegimeTrib.Handle);
end;

procedure TDMTabImposto.tOrigemProdAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tOrigemProd.Handle);
end;

end.
