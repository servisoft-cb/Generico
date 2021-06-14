unit DmdDatabase_NFeBD;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, Forms, IniFiles, IdCoder, IdCoder3to4, IdCoderMIME, FMTBcd, IdBaseComponent,
  DBClient, Provider, Dialogs, MidasLib;

type
  TdmDatabase_NFeBD = class(TDataModule)
    scoNFeBD: TSQLConnection;
    Decoder64: TIdDecoderMIME;
    Encoder64: TIdEncoderMIME;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function Fnc_ArquivoConfiguracao: string;
  public
    procedure prc_UpdateError(Tabela: String; ukTipo: TUpdateKind; Emsg: EUpdateError);
  end;

var
  dmDatabase_NFeBD: TdmDatabase_NFeBD;

implementation

{$R *.dfm}

const
  cArquivoConfiguracao = 'Config.ini';

function TdmDatabase_NFeBD.Fnc_ArquivoConfiguracao: string;
begin
  Result := ExtractFilePath(Application.ExeName) + cArquivoConfiguracao;
end;

procedure TdmDatabase_NFeBD.DataModuleCreate(Sender: TObject);
var
  Config: TIniFile;
  dtLiberado: TDateTime;
begin
  scoNFeBD.Connected      := False;
  scoNFeBD.KeepConnection := True;

  if not FileExists(Fnc_ArquivoConfiguracao) then
    Exit;

  Config := TIniFile.Create(Fnc_ArquivoConfiguracao);
  scoNFeBD.LoadParamsFromIniFile(Fnc_ArquivoConfiguracao);

  try
//////////////////CONECTA AO BANCO DE DADOS DA APLICAÇÃO
    try
      scoNFeBD.Params.Values['DRIVERNAME'] := 'INTERBASE';
      scoNFeBD.Params.Values['SQLDIALECT'] := '3';
      scoNFeBD.Params.Values['DATABASE']   := Config.ReadString('NFeConfig', 'DATABASE', '');
      scoNFeBD.Params.Values['USER_NAME']  := Config.ReadString('NFeConfig', 'USERNAME', '');
      scoNFeBD.Params.Values['PASSWORD']   := Decoder64.DecodeString(Config.ReadString('NFeConfig', 'PASSWORD', ''));
      scoNFeBD.Connected := True;
    except
      on E: exception do
      begin
        raise Exception.Create('Erro ao conectar ao banco de dados:' + #13 +
                               'Mensagem: ' + E.Message + #13 +
                               'Classe: ' + E.ClassName + #13 + #13 +
                               'Dados da Conexao NFeConfig' + #13 +
                               'Banco de Dados: '  + scoNFeBD.Params.Values['Database'] + #13 +
                               'Usuário: '         + scoNFeBD.Params.Values['User_Name']);
      end;
    end;

  finally
    FreeAndNil(Config);
  end;

end;

procedure TdmDatabase_NFeBD.prc_UpdateError(Tabela: String;
  ukTipo: TUpdateKind; Emsg: EUpdateError);
begin
  if ukTipo = ukDelete  then
    //raise Exception.Create('Erro ao tentar excluir: ' + ' Tabela: ' + '(' + Tabela + ')'  + #13 + Emsg.Message)
    raise Exception.Create('Erro ao tentar excluir: ' + #13 + Emsg.Message)
  else
  if ukTipo = ukModify then
    //raise Exception.Create('Erro ao tentar gravar: ' + ' Tabela: ' + '(' + Tabela + ')'  + #13 + Emsg.Message);
    raise Exception.Create('Erro ao tentar gravar: ' + #13 + Emsg.Message);
end;

end.

