unit UDMVendedorMeta;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TDMVendedorMeta = class(TDataModule)
    sdsVendedor_Meta: TSQLDataSet;
    dspVendedor_Meta: TDataSetProvider;
    cdsVendedor_Meta: TClientDataSet;
    dsVendedor_Meta: TDataSource;
    sdsVendedor_MetaCODIGO: TIntegerField;
    sdsVendedor_MetaCODMARCA: TIntegerField;
    sdsVendedor_MetaMETA_QTD: TIntegerField;
    cdsVendedor_MetaCODIGO: TIntegerField;
    cdsVendedor_MetaCODMARCA: TIntegerField;
    cdsVendedor_MetaMETA_QTD: TIntegerField;
    sdsVendedor_MetaNOMEVENDEDOR: TStringField;
    sdsVendedor_MetaNOMEMARCA: TStringField;
    cdsVendedor_MetaNOMEVENDEDOR: TStringField;
    cdsVendedor_MetaNOMEMARCA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspVendedor_MetaUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVendedorMeta: TDMVendedorMeta;
  ctVendedorMeta : String;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMVendedorMeta.DataModuleCreate(Sender: TObject);
begin
  ctVendedorMeta := sdsVendedor_Meta.CommandText;
end;

procedure TDMVendedorMeta.dspVendedor_MetaUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  Response := rrAbort;
  raise exception.Create(E.Message);
end;

end.
