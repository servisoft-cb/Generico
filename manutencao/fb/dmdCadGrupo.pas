unit dmdCadGrupo;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, DBClient, Provider,
  arTypes;

type
  TdmCadGrupo = class(TDataModule)
    sdsGrupo: TSQLDataSet;
    dspGrupo: TDataSetProvider;
    cdsGrupo: TClientDataSet;
    dsGrupo: TDataSource;
    sdsGrupoCODIGO: TIntegerField;
    sdsGrupoNOME: TStringField;
    sdsGrupoREFERENCIA: TStringField;
    sdsGrupoCODSITTRIB: TIntegerField;
    sdsGrupoPRECOAMOSTRA: TFloatField;
    sdsGrupoESTOQUE: TStringField;
    sdsGrupoTIPOPRODUTO: TStringField;
    cdsGrupoCODIGO: TIntegerField;
    cdsGrupoNOME: TStringField;
    cdsGrupoREFERENCIA: TStringField;
    cdsGrupoCODSITTRIB: TIntegerField;
    cdsGrupoPRECOAMOSTRA: TFloatField;
    cdsGrupoESTOQUE: TStringField;
    cdsGrupoTIPOPRODUTO: TStringField;
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


{ TdmCadGrupo }


procedure TdmCadGrupo.AtualizaConsulta;
begin
  if cdsGrupo.Active then
  begin
    if not cdsGrupo.Eof then
      LocalizarRegistro(True)
    else
      LocalizarRegistro(False);
  end
  else
    LocalizarRegistro(False);
end;

procedure TdmCadGrupo.AutoEditar(Ativar: Boolean);
begin

end;

procedure TdmCadGrupo.CancelarRegistro;
var
  iCodigo: integer;
begin
  iCodigo := 0;
  if Estado = csEdit then
    iCodigo := cdsGrupoCODIGO.AsInteger;

  if cdsGrupo.Active then
    cdsGrupo.CancelUpdates;
  AutoEditar(False);

  if (Estado = csEdit) and (cdsGrupoCODIGO.AsInteger <> iCodigo) then
    cdsGrupo.Locate('CODIGO', iCodigo, []);

  AtualizaConsulta;
end;

procedure TdmCadGrupo.DataModuleCreate(Sender: TObject);
begin
  sCommandText := sdsGrupo.CommandText;
  AutoEditar(False);
end;

procedure TdmCadGrupo.EditarRegistro;
begin
  cdsGrupo.Edit;
  AutoEditar(True);

end;

procedure TdmCadGrupo.ExcluirRegistro;
var
  sBookmark: string;
begin
  sBookmark := cdsGrupo.Bookmark;
  try
    cdsGrupo.DisableControls;
    try
      cdsGrupo.Delete;
      if (cdsGrupo.ChangeCount > 0) and (cdsGrupo.ApplyUpdates(0) > 0) then
        Abort;
    except
      CancelarRegistro;
      cdsGrupo.Bookmark := sBookmark;
      raise;
    end;
  finally
    AtualizaConsulta;
    cdsGrupo.EnableControls;
  end;
end;

procedure TdmCadGrupo.ExecutaConsulta(SQL: string);
begin
  cdsGrupo.Close;
  sdsGrupo.CommandText := SQL;
  cdsGrupo.Open;
end;

procedure TdmCadGrupo.GravarRegistro;
begin
  if cdsGrupo.State in [dsEdit, dsInsert] then
    cdsGrupo.Post;

  if cdsGrupo.ApplyUpdates(0) > 0 then
    Abort;

  AutoEditar(False);
end;

procedure TdmCadGrupo.IncluirRegistro;
begin
  if not cdsGrupo.Active then
    LocalizarRegistro(False);
  cdsGrupo.Insert;
  AutoEditar(True);
end;

function TdmCadGrupo.LocalizarRegistro(bLocalizar: Boolean;
  Codigo: Integer): Boolean;
begin
  if not bLocalizar and not cdsGrupo.Active then
  begin
    ExecutaConsulta(sCommandText + ' WHERE CODIGO = ' + IntToStr(Codigo));
    Result := not cdsGrupo.IsEmpty;
  end
  else if (not cdsGrupo.IsEmpty) and (Codigo > 0) then
  begin
    cdsGrupo.First;
    Result := cdsGrupo.Locate('CODIGO', Codigo, []);
  end
  else
    Result := not cdsGrupo.IsEmpty;
end;

end.

