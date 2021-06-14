unit UDMCentroCusto;

interface

uses
  SysUtils, Classes, DB, DBTables, DBIProcs;

type
  TDMCentroCusto = class(TDataModule)
    tCentroCusto: TTable;
    dsCentroCusto: TDataSource;
    tCentroCustoCodigo: TIntegerField;
    tCentroCustoNome: TStringField;
    tCentroCustoItem: TTable;
    dsCentroCustoItem: TDataSource;
    tCentroCustoItemCodCentroCusto: TIntegerField;
    tCentroCustoItemCodItem: TIntegerField;
    tCentroCustoItemNomeItem: TStringField;
    procedure tCentroCustoAfterPost(DataSet: TDataSet);
    procedure tCentroCustoItemAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCentroCusto: TDMCentroCusto;

implementation

{$R *.dfm}

procedure TDMCentroCusto.tCentroCustoAfterPost(DataSet: TDataSet);
begin
  DbiSaveChanges(tCentroCusto.Handle);
end;

procedure TDMCentroCusto.tCentroCustoItemAfterPost(DataSet: TDataSet);
begin
  DbiSaveChanges(tCentroCustoItem.Handle);
end;

end.
