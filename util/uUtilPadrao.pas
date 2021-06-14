unit uUtilPadrao;

interface

uses
  Classes, SysUtils, DB, Dialogs, Variants, Forms, ShellApi, Windows, StrUtils;

  function Monta_Numero(Campo: String; Tamanho: Integer): String;
  function TirarAcento(texto: string): string;
  procedure AbreArquivo(arquivo: string);
  function Verifica_CBarra(Codigo: Integer): Boolean;
  procedure Gera_CodBarra(CodProduto,CodCor,CodCombinacao,CodGrade,Posicao: Integer; Tamanho: String);
  procedure Grava_CBarra(CodProduto,CodCor,CodCombinacao,CodGrade,Posicao: Integer; Tamanho: String);
  function Formatar_Campo(Campo: String; Tamanho: Integer): String;
  function fnc_Montar_Campo: String;
  function fnc_Montar_Valor(Campo: String): String;

var
  vCalcFrete, vCalcTotalNota, vCalcSeguro, vCalcOutrasDesp: Real;
  vContadorOutros: Integer;
  vFlagGeraDupl: Boolean;
  vRegistro_CSV : WideString;

  //vars de cod de barra
  vCodBarra, vCodMaximo: String;
  vCodSeq: Integer;
  vGeraCod: Boolean;
  vID_EnqIPI_Pos : Integer;

const
  vCodPrincipal = 66666;

implementation

uses
  uDm1, uDm2;

function Monta_Numero(Campo: String; Tamanho: Integer): String;
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

function TirarAcento(Texto: string): string;
var
  i: Integer;
begin
  Texto := Trim(AnsiUpperCase(Texto));
  for i := 1 to Length(texto) do
  begin
    if Pos(Texto[i], ' 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~''"!@#$%^&*()_-+=|/\{}[]:;,.<>') = 0 then
    begin
      case Texto[i] of
        'Á', 'À', 'Â', 'Ä', 'Ã': Texto[i] := 'A';
        'É', 'È', 'Ê', 'Ë': Texto[i] := 'E';
        'Í', 'Ì', 'Î', 'Ï': Texto[i] := 'I';
        'Ó', 'Ò', 'Ô', 'Ö', 'Õ': Texto[i] := 'O';
        'Ú', 'Ù', 'Û', 'Ü': Texto[i] := 'U';
        'Ç': Texto[i] := 'C';
        'Ñ': Texto[i] := 'N';
      else
        Texto[i] := ' ';
      end;
    end;
  end;
  Result := AnsiUpperCase(Texto);
end;

procedure AbreArquivo(arquivo: string);
begin
  if FileExists(arquivo) then
  begin
    arquivo := '"' + arquivo + '"';
      //fonte: http://www.mail-archive.com/delphi-br@yahoogrupos.com.br/msg58385.html
      //declar no uses ShellApi
    ShellExecute(Application.Handle, 'open', PChar(arquivo), nil, nil, SW_SHOWMAXIMIZED);
  end
  else
    ShowMessage('Arquivo não encontrado!');
end;

function Verifica_CBarra(Codigo: Integer): Boolean;
var
  i: Integer;
begin
  vCodMaximo := '';
  for i := 1 to (12 - Length(IntToStr(Codigo))) do
    vCodMaximo := vCodMaximo + '9';
  if vCodMaximo = '' then
    vCodMaximo := '0';
  vCodSeq       := 0;
  dm2.qIncBarra.Close;
  dm2.qIncBarra.Params[0].AsInteger := Codigo;
  dm2.qIncBarra.Open;
  if (dm2.qIncBarraCodSeq.AsInteger = StrToInt(vCodMaximo)) or ((dm2.qIncBarraCodSeq.AsInteger > StrToInt(vCodMaximo))) then
    Result := False
  else
  begin
    Result  := True;
    vCodSeq := dm2.qIncBarraCodSeq.AsInteger;
  end;
end;

procedure Gera_CodBarra(CodProduto,CodCor,CodCombinacao,CodGrade,Posicao: Integer; Tamanho: String);
begin
  dm1.tCBarra.Open;
  vGeraCod := True;
  if not DM1.tCBarra.Locate('CodProduto;CodCor;CodCombinacao;CodGrade;Posicao',
    VarArrayOf([CodProduto,CodCor,CodCombinacao,CodGrade,Posicao]),[locaseinsensitive]) then
  begin
    Grava_CBarra(CodProduto,CodCor,CodCombinacao,CodGrade,Posicao,Tamanho);
    if not Verifica_CBarra(vCodPrincipal) then
      Exit;
  end
  else
    vCodBarra := dm1.tCBarraCodBarra.AsString;
  if not vGeraCod then
    Exit;
end;

procedure Grava_CBarra(CodProduto,CodCor,CodCombinacao,CodGrade,Posicao: Integer; Tamanho: String);
var
  i: Integer;
  vTexto1, vDigito: String;
begin
  inc(vCodSeq);
  vGeraCod := True;
  dm2.qIncBarra.Close;
  dm2.qIncBarra.Params[0].AsInteger := 66666;//vCodPrincipal;
  dm2.qIncBarra.Open;
  vCodSeq := dm2.qIncBarraCodSeq.AsInteger + 1;
  dm2.qIncBarra.Close;
  if vGeraCod then
  begin
    vTexto1 := IntToStr(vCodSeq);
    for i := 1 to (Length('9999999999') - Length(vTexto1)) do
      vTexto1 := '0' + vTexto1;
    DM1.tCBarra.Insert;
    DM1.tCBarraCodBarra.AsString       := IntToStr(22) + vTexto1 + vDigito;
    DM1.tCBarraCodProduto.AsInteger    := CodProduto;
    DM1.tCBarraCodCor.AsInteger        := CodCor;
    DM1.tCBarraCodGrade.AsInteger      := CodGrade;
    DM1.tCBarraPosicao.AsInteger       := Posicao;
    DM1.tCBarraTamanho.AsString        := Tamanho;
    DM1.tCBarraCodPrincipal.AsInteger  := vCodPrincipal;
    DM1.tCBarraCodSeq.AsInteger        := vCodSeq;
    dm1.tcBarraCodCombinacao.AsInteger := CodCombinacao;
    DM1.tCBarra.Post;
    vCodBarra := DM1.tCBarraCodBarra.AsString;
  end;
end;

function Formatar_Campo(Campo: String; Tamanho: Integer): String;
var
  i : Integer;
  texto2 : String;
  vAux : Integer;
begin
  if Tamanho <= 0 then
    vAux := Length(Campo)
  else
    vAux := Tamanho;
  Result := '';
  texto2 := Campo;
  for i := 1 to vAux - Length(texto2) do
    texto2 := texto2 + ' ';
  Result := Texto2;
end;

function fnc_Montar_Campo: String;
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

function fnc_Montar_Valor(Campo: String): String;
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

end.
