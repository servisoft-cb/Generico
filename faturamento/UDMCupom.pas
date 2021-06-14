unit UDMCupom;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TDMCupom = class(TDataModule)
    sdsCupomFiscal: TSQLDataSet;
    dspCupomFiscal: TDataSetProvider;
    cdsCupomFiscal: TClientDataSet;
    cdsCupomFiscalID_CUPOM: TIntegerField;
    cdsCupomFiscalNUMCUPOM: TIntegerField;
    cdsCupomFiscalDTEMISSAO: TDateField;
    cdsCupomFiscalHREMISSAO: TTimeField;
    cdsCupomFiscalTIPOPGTO: TStringField;
    cdsCupomFiscalCODCONDPGTO: TIntegerField;
    cdsCupomFiscalCODVENDEDOR: TIntegerField;
    cdsCupomFiscalPERCVENDEDOR: TFloatField;
    cdsCupomFiscalBASEICMS: TFloatField;
    cdsCupomFiscalVLRICMS: TFloatField;
    cdsCupomFiscalVLRPRODUTOS: TFloatField;
    cdsCupomFiscalVLRDESCONTO: TFloatField;
    cdsCupomFiscalVLRTOTAL: TFloatField;
    cdsCupomFiscalCANCELADO: TStringField;
    cdsCupomFiscalVLRRECEBIDO: TFloatField;
    cdsCupomFiscalVLRTROCO: TFloatField;
    cdsCupomFiscalNUMMOVFINANCEIRO: TIntegerField;
    cdsCupomFiscalCODCONTA: TIntegerField;
    cdsCupomFiscalFILIAL: TIntegerField;
    dsCupomFiscal: TDataSource;
    dsCupomFiscal_Mestre: TDataSource;
    sdsCupomFiscalIt: TSQLDataSet;
    sdsCupomFiscalItID_CUPOM: TIntegerField;
    sdsCupomFiscalItITEM: TIntegerField;
    sdsCupomFiscalItCODPRODUTO: TIntegerField;
    sdsCupomFiscalItCODCOR: TIntegerField;
    sdsCupomFiscalItQTD: TFloatField;
    sdsCupomFiscalItALIQICMS: TFloatField;
    sdsCupomFiscalItVLRUNIT: TFloatField;
    sdsCupomFiscalItPERCDESCONTO: TFloatField;
    sdsCupomFiscalItVLRDESCONTO: TFloatField;
    sdsCupomFiscalItBASEICMS: TFloatField;
    sdsCupomFiscalItVLRICMS: TFloatField;
    sdsCupomFiscalItVLRTOTAL: TFloatField;
    sdsCupomFiscalItCODNATOPER: TIntegerField;
    sdsCupomFiscalItNUMMOVEST: TIntegerField;
    sdsCupomFiscalItUNIDADE: TStringField;
    cdsCupomFiscalIt: TClientDataSet;
    cdsCupomFiscalsdsCupomFiscalIt: TDataSetField;
    cdsCupomFiscalItID_CUPOM: TIntegerField;
    cdsCupomFiscalItITEM: TIntegerField;
    cdsCupomFiscalItCODPRODUTO: TIntegerField;
    cdsCupomFiscalItCODCOR: TIntegerField;
    cdsCupomFiscalItQTD: TFloatField;
    cdsCupomFiscalItALIQICMS: TFloatField;
    cdsCupomFiscalItVLRUNIT: TFloatField;
    cdsCupomFiscalItPERCDESCONTO: TFloatField;
    cdsCupomFiscalItVLRDESCONTO: TFloatField;
    cdsCupomFiscalItBASEICMS: TFloatField;
    cdsCupomFiscalItVLRICMS: TFloatField;
    cdsCupomFiscalItVLRTOTAL: TFloatField;
    cdsCupomFiscalItCODNATOPER: TIntegerField;
    cdsCupomFiscalItNUMMOVEST: TIntegerField;
    cdsCupomFiscalItUNIDADE: TStringField;
    dsCupomFiscalIt: TDataSource;
    sdsCupomFiscalID_CUPOM: TIntegerField;
    sdsCupomFiscalNUMCUPOM: TIntegerField;
    sdsCupomFiscalDTEMISSAO: TDateField;
    sdsCupomFiscalHREMISSAO: TTimeField;
    sdsCupomFiscalTIPOPGTO: TStringField;
    sdsCupomFiscalCODCONDPGTO: TIntegerField;
    sdsCupomFiscalCODVENDEDOR: TIntegerField;
    sdsCupomFiscalPERCVENDEDOR: TFloatField;
    sdsCupomFiscalBASEICMS: TFloatField;
    sdsCupomFiscalVLRICMS: TFloatField;
    sdsCupomFiscalVLRPRODUTOS: TFloatField;
    sdsCupomFiscalVLRDESCONTO: TFloatField;
    sdsCupomFiscalVLRTOTAL: TFloatField;
    sdsCupomFiscalCANCELADO: TStringField;
    sdsCupomFiscalVLRRECEBIDO: TFloatField;
    sdsCupomFiscalVLRTROCO: TFloatField;
    sdsCupomFiscalNUMMOVFINANCEIRO: TIntegerField;
    sdsCupomFiscalCODCONTA: TIntegerField;
    sdsCupomFiscalFILIAL: TIntegerField;
    sdsCupomFiscalItNOMEPRODUTO: TStringField;
    sdsCupomFiscalCODCLIENTE: TIntegerField;
    cdsCupomFiscalCODCLIENTE: TIntegerField;
    cdsCupomFiscalItNOMEPRODUTO: TStringField;
    sdsCupomFiscalCODTIPOCOBRANCA: TIntegerField;
    cdsCupomFiscalCODTIPOCOBRANCA: TIntegerField;
    sdsCupomFicalParc: TSQLDataSet;
    sdsCupomFicalParcID_CUPOM: TIntegerField;
    sdsCupomFicalParcPARCELA: TIntegerField;
    cdsCupomFiscalParc: TClientDataSet;
    cdsCupomFiscalsdsCupomFicalParc: TDataSetField;
    cdsCupomFiscalParcID_CUPOM: TIntegerField;
    cdsCupomFiscalParcPARCELA: TIntegerField;
    dsCupomFiscalParc: TDataSource;
    sdsCupomFiscalItCANCELADO: TStringField;
    cdsCupomFiscalItCANCELADO: TStringField;
    sdsCupomFicalParcDTVENCIMENTO: TDateField;
    sdsCupomFicalParcVALOR: TFloatField;
    cdsCupomFiscalParcDTVENCIMENTO: TDateField;
    cdsCupomFiscalParcVALOR: TFloatField;
    sdsCupomFiscalNOME_CLIENTE: TStringField;
    cdsCupomFiscalNOME_CLIENTE: TStringField;
    sdsCupomFiscalItSITTRIB: TStringField;
    cdsCupomFiscalItSITTRIB: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspCupomFiscalUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCupom: TDMCupom;
  ctCupomFiscal : String;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMCupom.DataModuleCreate(Sender: TObject);
begin
  ctCupomFiscal := sdsCupomFiscal.CommandText;
end;

procedure TDMCupom.dspCupomFiscalUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  Response := rrAbort;
  raise exception.Create(E.Message);
end;

end.
