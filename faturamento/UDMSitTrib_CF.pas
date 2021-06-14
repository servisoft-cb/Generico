unit UDMSitTrib_CF;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TDMSitTrib_CF = class(TDataModule)
    sdsSitTrib_CF: TSQLDataSet;
    dspSitTrib_CF: TDataSetProvider;
    cdsSitTrib_CF: TClientDataSet;
    dsSitTrib_CF: TDataSource;
    sdsSitTrib_CFID: TIntegerField;
    sdsSitTrib_CFPERCENTUAL: TFloatField;
    cdsSitTrib_CFID: TIntegerField;
    cdsSitTrib_CFPERCENTUAL: TFloatField;
    sdsSitTrib_CFCODIGO: TStringField;
    cdsSitTrib_CFCODIGO: TStringField;
    procedure dspSitTrib_CFUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMSitTrib_CF: TDMSitTrib_CF;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMSitTrib_CF.dspSitTrib_CFUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  Response := rrAbort;
  raise exception.Create(E.Message);
end;

end.
