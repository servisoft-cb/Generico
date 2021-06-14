unit UDMTabEnqIPI;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, DBTables;

type
  TDMTabEnqIPI = class(TDataModule)
    sdsEnqIPI: TSQLDataSet;
    dspEnqIPI: TDataSetProvider;
    cdsEnqIPI: TClientDataSet;
    dsEnqIPI: TDataSource;
    sdsEnqIPIID: TIntegerField;
    sdsEnqIPICODIGO: TStringField;
    sdsEnqIPITIPO: TStringField;
    sdsEnqIPIDESCRICAO: TStringField;
    cdsEnqIPIID: TIntegerField;
    cdsEnqIPICODIGO: TStringField;
    cdsEnqIPITIPO: TStringField;
    cdsEnqIPIDESCRICAO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspEnqIPIUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }
  public
    { Public declarations }
    ctEnqIPI: String;
    procedure Abre_Tab_EnqIPI(ID : Integer);
  end;

var
  DMTabEnqIPI: TDMTabEnqIPI;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMTabEnqIPI.Abre_Tab_EnqIPI(ID : Integer);
begin
  cdsEnqIPI.Close;
  sdsEnqIPI.CommandText := ctEnqIPI;
  if ID > 0 then
    sdsEnqIPI.CommandText := sdsEnqIPI.CommandText + ' WHERE ID = ' + IntToStr(ID);
  cdsEnqIPI.Open;
end;

procedure TDMTabEnqIPI.DataModuleCreate(Sender: TObject);
begin
  ctEnqIPI := sdsEnqIPI.CommandText;
end;

procedure TDMTabEnqIPI.dspEnqIPIUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  Response := rrAbort;
  raise exception.Create(E.Message);
end;

end.
