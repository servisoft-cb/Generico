unit dmdCadPosicao;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, DBClient, Provider,
  arTypes;

type
  TdmCadPosicao = class(TDataModule)
    sdsPosicao: TSQLDataSet;
    dspPosicao: TDataSetProvider;
    cdsPosicao: TClientDataSet;
    dsPosicao: TDataSource;
    sdsPosicaoCODIGO: TIntegerField;
    sdsPosicaoNOME: TStringField;
    sdsPosicaoIMPAMOSTRA: TStringField;
    cdsPosicaoCODIGO: TIntegerField;
    cdsPosicaoNOME: TStringField;
    cdsPosicaoIMPAMOSTRA: TStringField;
    sdsPosicaoCABEDAL: TStringField;
    cdsPosicaoCABEDAL: TStringField;
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


{ TdmCadPosicao }


procedure TdmCadPosicao.AtualizaConsulta;
begin
  if cdsPosicao.Active then
  begin
    if not cdsPosicao.Eof then
      LocalizarRegistro(True)
    else
      LocalizarRegistro(False);
  end
  else
    LocalizarRegistro(False);
end;

procedure TdmCadPosicao.AutoEditar(Ativar: Boolean);
begin

end;

procedure TdmCadPosicao.CancelarRegistro;
var
  iCodigo: integer;
begin
  iCodigo := 0;
  if Estado = csEdit then
    iCodigo := cdsPosicaoCODIGO.AsInteger;

  if cdsPosicao.Active then
    cdsPosicao.CancelUpdates;
  AutoEditar(False);

  if (Estado = csEdit) and (cdsPosicaoCODIGO.AsInteger <> iCodigo) then
    cdsPosicao.Locate('CODIGO', iCodigo, []);

  AtualizaConsulta;
end;

procedure TdmCadPosicao.DataModuleCreate(Sender: TObject);
begin
  sCommandText := sdsPosicao.CommandText;
  AutoEditar(False);
end;

procedure TdmCadPosicao.EditarRegistro;
begin
  cdsPosicao.Edit;
  AutoEditar(True);

end;

procedure TdmCadPosicao.ExcluirRegistro;
var
  sBookmark: string;
begin
  sBookmark := cdsPosicao.Bookmark;
  try
    cdsPosicao.DisableControls;
    try
      cdsPosicao.Delete;
      if (cdsPosicao.ChangeCount > 0) and (cdsPosicao.ApplyUpdates(0) > 0) then
        Abort;
    except
      CancelarRegistro;
      cdsPosicao.Bookmark := sBookmark;
      raise;
    end;
  finally
    AtualizaConsulta;
    cdsPosicao.EnableControls;
  end;
end;

procedure TdmCadPosicao.ExecutaConsulta(SQL: string);
begin
  cdsPosicao.Close;
  sdsPosicao.CommandText := SQL;
  cdsPosicao.Open;
end;

procedure TdmCadPosicao.GravarRegistro;
begin
  if cdsPosicao.State in [dsEdit, dsInsert] then
    cdsPosicao.Post;

  if cdsPosicao.ApplyUpdates(0) > 0 then
    Abort;

  AutoEditar(False);
end;

procedure TdmCadPosicao.IncluirRegistro;
begin
  if not cdsPosicao.Active then
    LocalizarRegistro(False);
  cdsPosicao.Insert;
  AutoEditar(True);
end;

function TdmCadPosicao.LocalizarRegistro(bLocalizar: Boolean;
  Codigo: Integer): Boolean;
begin
  if not bLocalizar and not cdsPosicao.Active then
  begin
    ExecutaConsulta(sCommandText + ' WHERE CODIGO = ' + IntToStr(Codigo));
    Result := not cdsPosicao.IsEmpty;
  end
  else if (not cdsPosicao.IsEmpty) and (Codigo > 0) then
  begin
    cdsPosicao.First;
    Result := cdsPosicao.Locate('CODIGO', Codigo, []);
  end
  else
    Result := not cdsPosicao.IsEmpty;
end;

end.

