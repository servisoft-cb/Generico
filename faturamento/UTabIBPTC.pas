unit UTabIBPTC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  DateUtils, Grids, DBGrids, SMDBGrid, DB, ComCtrls, UDMTabIBPT;

type
  TfTabIBPTC = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    StaticText1: TStaticText;
    BitBtn5: TBitBtn;
    Panel3: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    FilenameEdit1: TFilenameEdit;
    BitBtn4: TBitBtn;
    ProgressBar1: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    fDMCadTab_IBPT: TDMTabIBPT;
    vContador : Integer;

    txt : TextFile;

    vRegistro_CSV: String;
    vTabVazia : Boolean;

    procedure Monta_sqlTabIBPT;
    procedure prc_Gravar_Tab_IBPT;
    procedure prc_Inserir;
    function fnc_Montar_Campo: String;
    function Monta_Numero(Campo: String; Tamanho: Integer): String;
    function fnc_Montar_Valor(Campo: String): String;
    function fnc_verifica_Arquivo(NomeArquivo, Le_Grava : String) : String;
  public
    { Public declarations }
  end;

var
  fTabIBPTC: TfTabIBPTC;

implementation

uses UDM1, uIntegracao, DmdDatabase, UTabIBPT, rsDBUtils, uUtil;

{$R *.dfm}

procedure TfTabIBPTC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMCadTab_IBPT);
  Action := Cafree;
end;

procedure TfTabIBPTC.BitBtn3Click(Sender: TObject);
begin
  Monta_sqlTabIBPT;
end;

procedure TfTabIBPTC.Monta_sqlTabIBPT;
begin
  fDMCadTab_IBPT.cdsIBPT.Close;
  fDMCadTab_IBPT.sdsIBPT.CommandText := fDMCadTab_IBPT.ctIBPT;
  fDMCadTab_IBPT.cdsIBPT.Open;
end;

procedure TfTabIBPTC.BitBtn2Click(Sender: TObject);
begin
  if fDMCadTab_IBPT.cdsIBPT.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadTab_IBPT.cdsIBPT.Delete;
  fDMCadTab_IBPT.cdsIBPT.ApplyUpdates(0);
end;

procedure TfTabIBPTC.BitBtn1Click(Sender: TObject);
begin
  prc_Inserir;
  fTabIBPT := TfTabIBPT.Create(Self);
  fTabIBPT.fDMCadTab_IBPT := fDMCadTab_IBPT;
  fTabIBPT.ShowModal;
end;

procedure TfTabIBPTC.FormShow(Sender: TObject);
var
  vData: TDateTime;
begin
  fDMCadTab_IBPT := TDMTabIBPT.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadTab_IBPT);

  Monta_sqlTabIBPT;
end;

procedure TfTabIBPTC.SMDBGrid1DblClick(Sender: TObject);
begin
  if fDMCadTab_IBPT.cdsIBPT.IsEmpty then
    exit;
  fDMCadTab_IBPT.cdsIBPT.Edit;
  fTabIBPT := TfTabIBPT.Create(Self);
  fTabIBPT.fDMCadTab_IBPT := fDMCadTab_IBPT;
  fTabIBPT.ShowModal;
end;

procedure TfTabIBPTC.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfTabIBPTC.BitBtn4Click(Sender: TObject);
var
  vContAux : Integer;
  aList: TStringList;
  vEnd_Arq : String;
  vAux : String;
begin
  if trim(FilenameEdit1.Text) = '' then
  begin
    MessageDlg('*** Arquivo não informado!', mtInformation, [mbOk], 0);
    exit;
  end;
  vEnd_Arq := fnc_verifica_Arquivo(FileNameEdit1.FileName,'L');
  fDMCadTab_IBPT.qFilial.Close;
  fDMCadTab_IBPT.qFilial.Open;
  vAux :=  ExtractFileName(vEnd_Arq);
  vAux := UpperCase(copy(vAux,13,2));
  if vAux <> fDMCadTab_IBPT.qFilialUF.AsString then
  begin
    MessageDlg('*** Arquivo não pertence a UF da empresa!', mtInformation, [mbOk], 0);
    exit;
  end;
  
  Label10.Visible := True;
  Label10.Refresh;
  Refresh;
  SMDBGrid1.DataSource := nil;
  fDMCadTab_IBPT.qIBPT_Contador.Close;
  fDMCadTab_IBPT.qIBPT_Contador.Open;
  vTabVazia := (fDMCadTab_IBPT.qIBPT_ContadorCONTADOR.AsInteger <= 0);
  if vTabVazia then
    fDMCadTab_IBPT.Abre_Tab_IBPT(0,'','');
  fDMCadTab_IBPT.qIBPT_Contador.Close;

  vContador := 0;
  vContAux  := 0;

  AssignFile(txt,vEnd_Arq);
  aList := TStringList.Create;
  aList.LoadFromFile(vEnd_Arq);
  ProgressBar1.Max      := aList.Count;
  ProgressBar1.Position := 0;

  vContador := 0;
  Reset(txt);
  while not Eof(txt) do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    vContAux  := vContAux + 1;
    vContador := vContador + 1;
    ReadLn(txt,vRegistro_CSV);
    if copy(vRegistro_CSV,1,6) <> 'codigo' then
      prc_Gravar_Tab_IBPT;
  end;
  if vContador > 0 then
    fDMCadTab_IBPT.cdsIBPT.ApplyUpdates(0);
  CloseFile(txt);
  FreeAndNil(aList);
  MessageDlg('Atualização concluída, Registros atualizados: ' + IntToStr(vContAux)  , mtInformation, [mbOk], 0);
  Label10.Visible := False;
  FilenameEdit1.Clear;
  SMDBGrid1.DataSource := fDMCadTab_IBPT.dsIBPT;
end;

procedure TfTabIBPTC.prc_Gravar_Tab_IBPT;
var
  vCodigo : String;
  vValor : String;
  vFlag : Boolean;
  vEx, vTabela, vNome : String;
  vEdit : Boolean;
  vAux : String;

begin
  vCodigo := fnc_Montar_Campo;
  vCodigo := Monta_Numero(vCodigo,0);
  if trim(vCodigo) = '' then
    exit;

  try
    vEx     := fnc_Montar_Campo;
    vTabela := fnc_Montar_Campo;
    vNome   := fnc_Montar_Campo;
    vEdit   := False;
    if not vTabVazia then
    begin
      fDMCadTab_IBPT.Abre_Tab_IBPT(0,vCodigo,vEx);
      if not fDMCadTab_IBPT.cdsIBPT.IsEmpty then
        vEdit := True;
    end;
    if vEdit then
      fDMCadTab_IBPT.cdsIBPT.Edit
    else
    begin
      prc_Inserir;
      fDMCadTab_IBPT.cdsIBPTCODIGO.AsString          := vCodigo;
      fDMCadTab_IBPT.cdsIBPTEX.AsString              := vEx;
      fDMCadTab_IBPT.cdsIBPTTABELA.AsString          := vTabela;
      fDMCadTab_IBPT.cdsIBPTNOME.AsString            := vNome;
    end;
    vValor := fnc_Montar_Campo; //Percentual Nacional
    vValor := Replace(vValor,'.',',');
    fDMCadTab_IBPT.cdsIBPTPERC_NACIONAL.AsString := vValor;
    
    vValor := fnc_Montar_Campo; //Percentual Importação
    vValor := Replace(vValor,'.',',');
    fDMCadTab_IBPT.cdsIBPTPERC_IMPORTACAO.AsString := vValor;
    
    vValor := fnc_Montar_Campo; //Percentual Estadual
    vValor := Replace(vValor,'.',',');
    fDMCadTab_IBPT.cdsIBPTPERC_ESTADUAL.AsString := vValor;

    vValor := fnc_Montar_Campo; //Percentual Municipal
    vValor := Replace(vValor,'.',',');
    fDMCadTab_IBPT.cdsIBPTPERC_MUNICIPAL.AsString := vValor;

    vAux := fnc_Montar_Campo;
    fDMCadTab_IBPT.cdsIBPTDT_INICIO.AsString := vAux;

    vAux := fnc_Montar_Campo;
    fDMCadTab_IBPT.cdsIBPTDT_FINAL.AsString := vAux;

    fDMCadTab_IBPT.cdsIBPTCHAVE.AsString  := fnc_Montar_Campo;
    fDMCadTab_IBPT.cdsIBPTVERSAO.AsString := fnc_Montar_Campo;
    fDMCadTab_IBPT.cdsIBPTFONTE.AsString  := fnc_Montar_Campo;

    fDMCadTab_IBPT.cdsIBPT.Post;
    if not(vTabVazia) or (vContador >= 100) then
    begin
      fDMCadTab_IBPT.cdsIBPT.ApplyUpdates(0);
      vContador := 0;
    end;

  except
    on e: Exception do
      ShowMessage('Ocorreu o seguinte erro ao executar: ' + #13 + e.Message + #13 + ' NCM/NBS = ' + vCodigo);
  end;
end;

function TfTabIBPTC.fnc_Montar_Campo: String;
var
  i, X: Integer;
  vTexto: String;
begin
  Result := '';
  i      := pos(';',vRegistro_CSV);
  if i = 0 then
    i := Length(vRegistro_CSV) + 1;
  Result := Copy(vRegistro_CSV,1,i-1);
  vTexto := Result;
  Delete(vRegistro_CSV,1,i);
  for x := 1 to Length(vTexto) do
  begin
    if Pos(vTexto[x],'''"') > 0 then
    begin
      vTexto[x] := ' ';
    end;
  end;
  if trim(copy(vTexto,1,1)) = '' then
    Delete(vTexto,1,1);
  if trim(copy(vTexto,Length(vTexto),1)) = '' then
    Delete(vTexto,Length(vTexto),1);
  Result := vTexto;
end;

function TfTabIBPTC.Monta_Numero(Campo: String; Tamanho: Integer): String;
var
  texto2: String;
  i: Integer;
begin
  texto2 := '';
  for i := 1 to Length(Campo) do
    if Campo[i] in ['0','1','2','3','4','5','6','7','8','9'] then
      Texto2 := Texto2 + Copy(Campo,i,1);
  for i := 1 to Tamanho - Length(texto2) do
    texto2 := '0' + texto2;
  Result := texto2;
end;

procedure TfTabIBPTC.prc_Inserir;
var
  vNumAux: Integer;
begin
  vNumAux := ProximaSequencia('TAB_IBPT',0);

  //fDMCadTab_IBPT.cdsIBPT.Last;
  vNumAux := vNumAux + 1;

  fDMCadTab_IBPT.cdsIBPT.Insert;
  fDMCadTab_IBPT.cdsIBPTID.AsInteger := vNumAux;
end;

function TfTabIBPTC.fnc_Montar_Valor(Campo: String): String;
var
  vTexto: String;
  i: Integer;
begin
  Result := '';
  vTexto := '';
  for i := 1 to Length(Campo) do
  begin
    if (copy(Campo,i,1) = '0')
      or (copy(Campo,i,1) = '1')
      or (copy(Campo,i,1) = '2')
      or (copy(Campo,i,1) = '3')
      or (copy(Campo,i,1) = '4')
      or (copy(Campo,i,1) = '5')
      or (copy(Campo,i,1) = '6')
      or (copy(Campo,i,1) = '7')
      or (copy(Campo,i,1) = '8')
      or (copy(Campo,i,1) = '9')
      or (copy(Campo,i,1) = ',')
      or (copy(Campo,i,1) = '.') then
    begin
      if (copy(Campo,i,1) = '.') then
        vTexto := vTexto + ','
      else
        vTexto := vTexto + copy(Campo,i,1);
    end;
  end;
  Result := vTexto;
end;

function TfTabIBPTC.fnc_verifica_Arquivo(NomeArquivo, Le_Grava : String) : String;
begin
  if copy(NomeArquivo,1,1) = '"' then
    delete(NomeArquivo,1,1);
  if copy(NomeArquivo,Length(NomeArquivo),1) = '"' then
    delete(NomeArquivo,Length(NomeArquivo),1);
  if (Le_Grava = 'G') and (copy(NomeArquivo,Length(NomeArquivo),1) = '\') then
    delete(NomeArquivo,Length(NomeArquivo),1);
  Result := NomeArquivo;
end;

end.
