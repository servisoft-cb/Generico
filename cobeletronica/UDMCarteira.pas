unit UDMCarteira;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TDMCarteira = class(TDataModule)
    sdsCarteira: TSQLDataSet;
    dspCarteira: TDataSetProvider;
    cdsCarteira: TClientDataSet;
    dsCarteira: TDataSource;
    sdsCarteiraID: TIntegerField;
    sdsCarteiraCODCARTEIRA: TStringField;
    sdsCarteiraCODBANCO: TStringField;
    sdsCarteiraNOMEBANCO: TStringField;
    cdsCarteiraID: TIntegerField;
    cdsCarteiraCODCARTEIRA: TStringField;
    cdsCarteiraCODBANCO: TStringField;
    cdsCarteiraNOMEBANCO: TStringField;
    sdsCarteiraNOMECARTEIRA: TStringField;
    cdsCarteiraNOMECARTEIRA: TStringField;
    sdsCarteiraGERARNOSSONUMERO: TStringField;
    cdsCarteiraGERARNOSSONUMERO: TStringField;
    sdsCarteiraGERARREMESSA: TStringField;
    cdsCarteiraGERARREMESSA: TStringField;
    sdsCarteiraCODCARTEIRA_IMP: TStringField;
    cdsCarteiraCODCARTEIRA_IMP: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspCarteiraUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCarteira: TDMCarteira;
  ctCarteira : String;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMCarteira.DataModuleCreate(Sender: TObject);
begin
  ctCarteira := sdsCarteira.CommandText;
end;

procedure TDMCarteira.dspCarteiraUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  Response := rrAbort;
  raise exception.Create(E.Message);
end;

end.
