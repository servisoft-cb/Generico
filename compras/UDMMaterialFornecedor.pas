unit UDMMaterialFornecedor;

interface

uses
  SysUtils, Classes, DB, DBTables, DBIProcs, Variants;

type
  TDMMaterialFornecedor = class(TDataModule)
    tMaterialFornecedor: TTable;
    dsMaterialFornecedor: TDataSource;
    tMaterialFornecedorCodMaterial: TIntegerField;
    tMaterialFornecedorCodFornecedor: TIntegerField;
    tMaterialFornecedorItem: TIntegerField;
    tMaterialFornecedorNomeMaterialForn: TStringField;
    tMaterialFornecedorCodMaterialForn: TStringField;
    tMaterialFornecedorCodGrade: TIntegerField;
    tMaterialFornecedorCodCor: TIntegerField;
    tMaterialFornecedorCodPosicao: TIntegerField;
    tMaterialFornecedorTamanho: TStringField;
    tFornecedores: TTable;
    tFornecedoresCodForn: TIntegerField;
    tFornecedoresNomeForn: TStringField;
    tMaterialFornecedorlkNomeFornecedor: TStringField;
    tCor: TTable;
    tCorCodigo: TIntegerField;
    tCorNome: TStringField;
    tMaterialFornecedorlkNomeCor: TStringField;
    tMaterialFornecedorCodBarra: TStringField;
    tMaterialFornecedorCodMaterialFornPadrao: TStringField;
    procedure tMaterialFornecedorAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Excluir_MaterialFornecedor(CodMaterial, CodCor, CodGrade : Integer);
    function fnc_Existe_MaterialFornecedor(CodMaterial, CodFornecedor, CodCor : Integer ; Tamanho : String) : Boolean;

  end;

var
  DMMaterialFornecedor: TDMMaterialFornecedor;

implementation

{$R *.dfm}

procedure TDMMaterialFornecedor.Excluir_MaterialFornecedor(CodMaterial,
  CodCor, CodGrade: Integer);
begin
  tMaterialFornecedor.Filtered := False;
  if (CodCor = 0) and (CodGrade = 0) then
    tMaterialFornecedor.Filter   := 'CodMaterial = '''+IntToStr(CodMaterial)+''''
  else
  if (CodCor > 0) and (CodGrade = 0) then
    tMaterialFornecedor.Filter   := 'CodMaterial = '''+IntToStr(CodMaterial)+''' and CodCor = '''+IntToStr(CodCor)+''''
  else
  if (CodCor = 0) and (CodGrade > 0) then
    tMaterialFornecedor.Filter   := 'CodMaterial = '''+IntToStr(CodMaterial)+''' and CodGrade = ''' + IntToStr(CodGrade)+''''
  else
  if (CodCor > 0) and (CodGrade > 0) then
    tMaterialFornecedor.Filter   := 'CodMaterial = '''+IntToStr(CodMaterial)+''' and CodCor = '''+IntToStr(CodCor)+''' and CodGrade = ''' + IntToStr(CodGrade)+'''';
  tMaterialFornecedor.Filtered := True;
  tMaterialFornecedor.First;
  while not tMaterialFornecedor.Eof do
    tMaterialFornecedor.Delete;
end;

procedure TDMMaterialFornecedor.tMaterialFornecedorAfterPost(
  DataSet: TDataSet);
begin
  DbiSaveChanges(tMaterialFornecedor.Handle);
end;

procedure TDMMaterialFornecedor.DataModuleCreate(Sender: TObject);
begin
  tMaterialFornecedor.Open;
  tFornecedores.Open;
  tCor.Open;
end;

function TDMMaterialFornecedor.fnc_Existe_MaterialFornecedor(CodMaterial,
  CodFornecedor, CodCor: Integer; Tamanho: String): Boolean;
begin
  Result := False;
  if CodCor <= 0 then
    CodCor := 0;
  if Trim(Tamanho) <> '' then
    if (tMaterialFornecedor.Locate('CodMaterial;CodFornecedor;CodCor;Tamanho',VarArrayOf([CodMaterial,CodFornecedor,CodCor,Tamanho]),[loCaseInsensitive])) then
      Result := True;

  if not(Result) then
    if (tMaterialFornecedor.Locate('CodMaterial;CodFornecedor;CodCor',VarArrayOf([CodMaterial,CodFornecedor,CodCor]),[loCaseInsensitive])) then
      Result := True;
     
  if not(Result) then
    if (tMaterialFornecedor.Locate('CodMaterial;CodFornecedor',VarArrayOf([CodMaterial,CodFornecedor]),[loCaseInsensitive])) then
      Result := True;
end;

end.
