unit dmdCadVendedor;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, DBClient, Provider,
  arTypes;

type
  TdmCadVendedor = class(TDataModule)
    sdsVendedor: TSQLDataSet;
    dspVendedor: TDataSetProvider;
    cdsVendedor: TClientDataSet;
    dsVendedor: TDataSource;
    sdsVendedorCODIGO: TIntegerField;
    sdsVendedorNOME: TStringField;
    sdsVendedorPERCCOMISSAO: TFloatField;
    sdsVendedorENDERECO: TStringField;
    sdsVendedorBAIRRO: TStringField;
    sdsVendedorCIDADE: TStringField;
    sdsVendedorESTADO: TStringField;
    sdsVendedorCEP: TStringField;
    sdsVendedorFONE: TStringField;
    sdsVendedorFAX: TStringField;
    sdsVendedorPESSOA: TStringField;
    sdsVendedorCGCCPF: TStringField;
    sdsVendedorINSCEST: TStringField;
    sdsVendedorREGIOES: TIntegerField;
    sdsVendedorTIPOCOMISSAO: TStringField;
    sdsVendedorPERCIMPRENDA: TFloatField;
    sdsVendedorSELECIONADO: TStringField;
    sdsVendedorCONTATO: TStringField;
    sdsVendedorCAIXAPOSTAL: TStringField;
    sdsVendedorCODANT: TIntegerField;
    sdsVendedorINATIVO: TStringField;
    cdsVendedorCODIGO: TIntegerField;
    cdsVendedorNOME: TStringField;
    cdsVendedorPERCCOMISSAO: TFloatField;
    cdsVendedorENDERECO: TStringField;
    cdsVendedorBAIRRO: TStringField;
    cdsVendedorCIDADE: TStringField;
    cdsVendedorESTADO: TStringField;
    cdsVendedorCEP: TStringField;
    cdsVendedorFONE: TStringField;
    cdsVendedorFAX: TStringField;
    cdsVendedorPESSOA: TStringField;
    cdsVendedorCGCCPF: TStringField;
    cdsVendedorINSCEST: TStringField;
    cdsVendedorREGIOES: TIntegerField;
    cdsVendedorTIPOCOMISSAO: TStringField;
    cdsVendedorPERCIMPRENDA: TFloatField;
    cdsVendedorSELECIONADO: TStringField;
    cdsVendedorCONTATO: TStringField;
    cdsVendedorCAIXAPOSTAL: TStringField;
    cdsVendedorCODANT: TIntegerField;
    cdsVendedorINATIVO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    sCommandText: string;
    FEstado: TarCadState;
    procedure AtualizaConsulta;
  public

    procedure AutoEditar(Ativar: Boolean);
    procedure IncluirRegistro;
    procedure GravarRegistro;
    procedure EditarRegistro;
    procedure ExcluirRegistro;
    procedure CancelarRegistro;
    function LocalizarRegistro(bLocalizar: Boolean; Codigo: Integer = 0): Boolean;
    procedure ExecutaConsulta(SQL: string);
    property Estado: TarCadState read FEstado write FEstado;

  end;

implementation

{$R *.dfm}


{ TdmCadVendedor }


procedure TdmCadVendedor.AtualizaConsulta;
begin
  if cdsVendedor.Active then
  begin
    if not cdsVendedor.Eof then
      LocalizarRegistro(True)
    else
      LocalizarRegistro(False);
  end
  else
    LocalizarRegistro(False);
end;

procedure TdmCadVendedor.AutoEditar(Ativar: Boolean);
begin

end;

procedure TdmCadVendedor.CancelarRegistro;
var
  iCodigo: integer;
begin
  iCodigo := 0;
  if Estado = csEdit then
    iCodigo := cdsVendedorCODIGO.AsInteger;

  if cdsVendedor.Active then
    cdsVendedor.CancelUpdates;
  AutoEditar(False);

  if (Estado = csEdit) and (cdsVendedorCODIGO.AsInteger <> iCodigo) then
    cdsVendedor.Locate('CODIGO', iCodigo, []);

  AtualizaConsulta;
end;

procedure TdmCadVendedor.DataModuleCreate(Sender: TObject);
begin
  sCommandText := sdsVendedor.CommandText;
  AutoEditar(False);
end;

procedure TdmCadVendedor.EditarRegistro;
begin
  cdsVendedor.Edit;
  AutoEditar(True);

end;

procedure TdmCadVendedor.ExcluirRegistro;
var
  sBookmark: string;
begin
  sBookmark := cdsVendedor.Bookmark;
  try
    cdsVendedor.DisableControls;
    try
      cdsVendedor.Delete;
      if (cdsVendedor.ChangeCount > 0) and (cdsVendedor.ApplyUpdates(0) > 0) then
        Abort;
    except
      CancelarRegistro;
      cdsVendedor.Bookmark := sBookmark;
      raise;
    end;
  finally
    AtualizaConsulta;
    cdsVendedor.EnableControls;
  end;
end;

procedure TdmCadVendedor.ExecutaConsulta(SQL: string);
begin
  cdsVendedor.Close;
  sdsVendedor.CommandText := SQL;
  cdsVendedor.Open;
end;

procedure TdmCadVendedor.GravarRegistro;
begin
  if cdsVendedor.State in [dsEdit, dsInsert] then
    cdsVendedor.Post;

  if cdsVendedor.ApplyUpdates(0) > 0 then
    Abort;

  AutoEditar(False);
end;

procedure TdmCadVendedor.IncluirRegistro;
begin
  if not cdsVendedor.Active then
    LocalizarRegistro(False);
  cdsVendedor.Insert;
  AutoEditar(True);
end;

function TdmCadVendedor.LocalizarRegistro(bLocalizar: Boolean;
  Codigo: Integer): Boolean;
begin
  if not bLocalizar and not cdsVendedor.Active then
  begin
    ExecutaConsulta(sCommandText + ' WHERE CODIGO = ' + IntToStr(Codigo));
    Result := not cdsVendedor.IsEmpty;
  end
  else if (not cdsVendedor.IsEmpty) and (Codigo > 0) then
  begin
    cdsVendedor.First;
    Result := cdsVendedor.Locate('CODIGO', Codigo, []);
  end
  else
    Result := not cdsVendedor.IsEmpty;
end;

end.

