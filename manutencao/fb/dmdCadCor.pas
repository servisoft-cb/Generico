unit dmdCadCor;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, DBClient, Provider,
  arTypes;

type
  TdmCadCor = class(TDataModule)
    sdsCor: TSQLDataSet;
    dspCor: TDataSetProvider;
    cdsCor: TClientDataSet;
    dsCor: TDataSource;
    sdsCorCODIGO: TIntegerField;
    sdsCorNOME: TStringField;
    sdsCorPANTONE: TStringField;
    cdsCorCODIGO: TIntegerField;
    cdsCorNOME: TStringField;
    cdsCorPANTONE: TStringField;
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


{ TdmCadCor }


procedure TdmCadCor.AtualizaConsulta;
begin
  if cdsCor.Active then
  begin
    if not cdsCor.Eof then
      LocalizarRegistro(True)
    else
      LocalizarRegistro(False);
  end
  else
    LocalizarRegistro(False);
end;

procedure TdmCadCor.AutoEditar(Ativar: Boolean);
begin

end;

procedure TdmCadCor.CancelarRegistro;
var
  iCodigo: integer;
begin
  iCodigo := 0;
  if Estado = csEdit then
    iCodigo := cdsCorCODIGO.AsInteger;

  if cdsCor.Active then
    cdsCor.CancelUpdates;
  AutoEditar(False);

  if (Estado = csEdit) and (cdsCorCODIGO.AsInteger <> iCodigo) then
    cdsCor.Locate('CODIGO', iCodigo, []);

  AtualizaConsulta;
end;

procedure TdmCadCor.DataModuleCreate(Sender: TObject);
begin
  sCommandText := sdsCor.CommandText;
  AutoEditar(False);
end;

procedure TdmCadCor.EditarRegistro;
begin
  cdsCor.Edit;
  AutoEditar(True);

end;

procedure TdmCadCor.ExcluirRegistro;
var
  sBookmark: string;
begin
  sBookmark := cdsCor.Bookmark;
  try
    cdsCor.DisableControls;
    try
      cdsCor.Delete;
      if (cdsCor.ChangeCount > 0) and (cdsCor.ApplyUpdates(0) > 0) then
        Abort;
    except
      CancelarRegistro;
      cdsCor.Bookmark := sBookmark;
      raise;
    end;
  finally
    AtualizaConsulta;
    cdsCor.EnableControls;
  end;
end;

procedure TdmCadCor.ExecutaConsulta(SQL: string);
begin
  cdsCor.Close;
  sdsCor.CommandText := SQL;
  cdsCor.Open;
end;

procedure TdmCadCor.GravarRegistro;
begin
  if cdsCor.State in [dsEdit, dsInsert] then
    cdsCor.Post;

  if cdsCor.ApplyUpdates(0) > 0 then
    Abort;

  AutoEditar(False);
end;

procedure TdmCadCor.IncluirRegistro;
begin
  if not cdsCor.Active then
    LocalizarRegistro(False);
  cdsCor.Insert;
  AutoEditar(True);
end;

function TdmCadCor.LocalizarRegistro(bLocalizar: Boolean;
  Codigo: Integer): Boolean;
begin
  if not bLocalizar and not cdsCor.Active then
  begin
    ExecutaConsulta(sCommandText + ' WHERE CODIGO = ' + IntToStr(Codigo));
    Result := not cdsCor.IsEmpty;
  end
  else if (not cdsCor.IsEmpty) and (Codigo > 0) then
  begin
    cdsCor.First;
    Result := cdsCor.Locate('CODIGO', Codigo, []);
  end
  else
    Result := not cdsCor.IsEmpty;
end;

end.

