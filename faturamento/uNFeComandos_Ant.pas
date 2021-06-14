unit uNFeComandos;

interface

uses
  Classes, SysUtils;

procedure EnviaNFe(AServidor, ACnpj: string; ANFe: TStream; var ARecibo,
  ANroProtocolo, AChaveAcesso: string; AContingencia, AConvTXT2XML: Boolean;
  var ACodigoErro: integer; var AMensagemErro: string);

function EnviarNFe(AServidor, ACnpj: string; ANFe: TStream; AContingencia: Boolean): string;

procedure BuscarStatusNF(AServidor, ACnpj: string; AChaveAcesso: string;
  AContingencia: Boolean; ANFe: TStream; var ARecibo, ANroProtocolo: string;
  var ACodigoErro: integer; var AMensagemErro: string);

procedure CancelaNFe(AServidor, ACnpj, ANroProtocolo, AChaveAcesso,
  AJustificativa: string; var ANroProtocoloCancelamento: string;
  ANFe: TStream; AContingencia: Boolean);

function VerificaStatusNFe(AServidor, ACnpj: string; AContingencia: Boolean): Boolean;

function ConectadoInternet(AServidor, ACnpj: string): Boolean;

function CriaChaveNFe(AServidor, ACnpj: string; ADataEmissao: TDateTime; AUf, AModelo, ASerie, ANumero, ATipoEmissao: string; AVersaoAntiga: Boolean = False): string;

function NFe_Consultar(AServidor, ACnpj, AChaveNFe: string; AContingencia: Boolean): string;

procedure NFe_AdicionaProtNFe(AServidor, ACnpj: string; ANFe: TStream; AContingencia: Boolean);

procedure NFe_GerarDANFE(AServidor, ACnpj: string; ANFe, ADANFE: TStream);

function EnviarCartaCorrecao(AServidor, ACnpj: string; AChaveNFe, ATextoCorrecao: WideString;
  ANroCorrecao: Integer; AContingencia: Boolean; AXML: TStream): string;

function ConsultarNFeDestinada(AServidor, ACnpj: string; ANFeConsultada, AEmissorNFe: Integer;
  AUltNSU: string; AXml: TStream; var AIndCont: Integer): String;

procedure EnviarManifestacao(AServidor, ACnpj, AChaveAcesso: string; ATipoEvento: Integer; AJustificativa: string; AContingencia: Boolean; AXml: TStream; var AProtocolo, ADataProtocolo: string);

procedure ConsultarCadastro(AServidor, ACnpj: string; ATipoArgumento: Integer; AUF, AArgumento: string; AXML: TStream);

procedure DownloadNFe(AServidor, ACnpj, AChaveAcesso: string; AXML: TStream);

//08/10/2009
procedure SalvarUTF8(AXMLStream: TStream; AArquivo: string);

procedure InutilizaNFe(AServidor, ACnpj: string; AUf, AAno, AModelo, ASerie,
  ANfeInicial, ANfeFinal, AJustificativa: string; var ANroProtocoloInutilizacao: string;
  ANFe: TStream; AContingencia: Boolean);

function ConsultarNFe(AServidor, ACnpj: string; AChaveNFe: WideString; AXML: TStream; AContingencia: Boolean): WideString;

procedure EnviarEmail(AServidor, ACnpj, AEmailDestinatario, AEmailBCC, AAssunto, AMensagem: string; AListBoxAnexos: TStrings );

procedure ImportarNFeFornecedor(AServidor, ACnpj: string; ANFe: TStream);

type
  TTipoEmissao = (teContFS   = 2,
                  teContFSDA = 5);

  TICMS = (icComDestaque = 1, icSemDestaque = 2);

function GeraCodigoBarras(AServidor, ACNPJ, AUF, ACNPJBarras: string; AValorNF: Extended;
   ATipoEmissao: TTipoEmissao; AICMSProprio, AICMSSubstituicao: TICMS;
   ADataEmissao: TDateTime): string;

implementation

uses
  IdTCPClient, uNFeConsts, StrUtils, Dialogs, IdAntiFreeze,
  IdAntiFreezeBase, Forms, StdCtrls, JvTransparentForm, IdIOHandlerSocket,
  IdTCPConnection;

type
  IAguarde = interface
  end;

  TAguarde = class(TInterfacedObject, IAguarde)
  private
    FTela: TForm;
    FLabel: TLabel;
    FAntiFreeze: TIdAntiFreeze;
    FTransparent: TJvTransparentForm;
    FMensagem: string;
    WindowList: Pointer;
  public
    class function Mostrar(AMensagem: String): IAguarde;
  public
    constructor Create(AMensagem: string);
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

  TTCPClient = class(TIdTCPClient)
  private
    FAguarde: IAguarde;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

function CriarTCPClient(AServidor: string): TIdTCPClient;
begin
  Result      := TTCPClient.Create(nil);
  Result.Name := 'TCPClient';
  Result.Host := AServidor;
  Result.Port := 7001;

  Result.IOHandler      := TIdIOHandlerSocket.Create(Result);
  Result.IOHandler.Name := 'IdIOHandlerStack';
end;

procedure EnviaNFe(AServidor, ACnpj: string; ANFe: TStream; var ARecibo,
  ANroProtocolo, AChaveAcesso: string; AContingencia, AConvTXT2XML: Boolean;
  var ACodigoErro: integer; var AMensagemErro: string);
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
  Retorno: TStrings;
begin
  ACodigoErro := 0;
  AMensagemErro := EmptyStr;

  TCPClient := CriarTCPClient(AServidor);
  try
    try
      TCPClient.Connect(1000);
      TCPClient.WriteLn(ACnpj);
      TCPClient.WriteInteger(Integer(NFe_Envia));
      TCPClient.WriteStream(ANFe, True, True);
      TCPClient.WriteInteger(Integer(AContingencia));
      TCPClient.WriteInteger(Integer(AConvTXT2XML));
      Codigo := TCPClient.ReadInteger;
      if (Codigo = NFe_OK) then
      begin
        Retorno := TStringList.Create;
        try
          Retorno.Text  := TCPClient.ReadLn;
          Retorno.Text  := AnsiReplaceText(Retorno.Text, #8, sLineBreak);
          ARecibo       := Retorno[0];
          ANroProtocolo := Retorno[1];
          AChaveAcesso  := Retorno[2];
          TMemoryStream(ANFe).Clear;
          TCPClient.ReadStream(ANFe);
        finally
          FreeAndNil(Retorno);
        end;
      end
      else if (Codigo = NFe_ErrorEnvioNfe) then
      begin
        Retorno := TStringList.Create;
        try
          Retorno.Text  := TCPClient.ReadLn;
          Retorno.Text  := AnsiReplaceText(Retorno.Text, #8, sLineBreak);
          ARecibo       := Retorno[0];
          ANroProtocolo := Retorno[1];
          AChaveAcesso  := Retorno[2];
        finally
          FreeAndNil(Retorno);
        end;
        AMensagemErro := TCPClient.ReadLn;
        ACodigoErro := TCPClient.ReadInteger;
        TMemoryStream(ANFe).Clear;
        TCPClient.ReadStream(ANFe);
      end
      else if (Codigo = NFe_Error) then
        raise Exception.Create(TCPClient.ReadLn);
    finally
      TCPClient.Disconnect;
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

function EnviarNFe(AServidor, ACnpj: string; ANFe: TStream; AContingencia: Boolean): string;
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
begin
  Result := EmptyStr;
  TCPClient := CriarTCPClient(AServidor);
  try
    try
      TCPClient.Connect(1000);
      TCPClient.WriteLn(ACnpj);
      TCPClient.WriteInteger(Integer(NFe_EnviarNF));
      TCPClient.WriteStream(ANFe, True, True);
      TCPClient.WriteInteger(Integer(AContingencia));
      Codigo := TCPClient.ReadInteger;
      MessageDlg('Parte Código = ' + IntToStr(Codigo), mtError, [mbno], 0);

      if (Codigo = NFe_OK) then
      begin
        Result := TCPClient.ReadLn;
      end
      else if (Codigo = NFe_Error) then
        raise Exception.Create(TCPClient.ReadLn);
    finally
      TCPClient.Disconnect;
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

procedure BuscarStatusNF(AServidor, ACnpj: string; AChaveAcesso: string;
  AContingencia: Boolean; ANFe: TStream; var ARecibo, ANroProtocolo: string;
  var ACodigoErro: integer; var AMensagemErro: string);
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
  Retorno: TStrings;
begin
  ACodigoErro := 0;
  AMensagemErro := EmptyStr;

  TCPClient := CriarTCPClient(AServidor);
  try
    try
      TCPClient.Connect(1000);
      TCPClient.WriteLn(ACnpj);
      TCPClient.WriteInteger(Integer(NFe_BuscarStatusNF));
      TCPClient.WriteInteger(Integer(AContingencia));
      TCPClient.WriteLn(AChaveAcesso);
      Codigo := TCPClient.ReadInteger;
      if (Codigo = NFe_OK) then
      begin
        Retorno := TStringList.Create;
        try
          Retorno.Text  := TCPClient.ReadLn;
          Retorno.Text  := AnsiReplaceText(Retorno.Text, #8, sLineBreak);
          ARecibo       := Retorno[0];
          ANroProtocolo := Retorno[1];
          TMemoryStream(ANFe).Clear;
          TCPClient.ReadStream(ANFe);
        finally
          FreeAndNil(Retorno);
        end;
      end
      else if (Codigo = NFe_ErrorEnvioNfe) then
      begin
        Retorno := TStringList.Create;
        try
          Retorno.Text  := TCPClient.ReadLn;
          Retorno.Text  := AnsiReplaceText(Retorno.Text, #8, sLineBreak);
          ARecibo       := Retorno[0];
          ANroProtocolo := Retorno[1];
        finally
          FreeAndNil(Retorno);
        end;
        AMensagemErro := TCPClient.ReadLn;
        ACodigoErro := TCPClient.ReadInteger;
        TMemoryStream(ANFe).Clear;
        TCPClient.ReadStream(ANFe);
      end
      else if (Codigo = NFe_Error) then
        raise Exception.Create(TCPClient.ReadLn);
    finally
      TCPClient.Disconnect;
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

procedure CancelaNFe(AServidor, ACnpj, ANroProtocolo, AChaveAcesso,
  AJustificativa: string; var ANroProtocoloCancelamento: string;
  ANFe: TStream; AContingencia: Boolean);
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
  Dados: TStrings;
  DadosStream: TMemoryStream;
begin
  TCPClient := CriarTCPClient(AServidor);
  try
    Dados := TStringList.Create;
    DadosStream := TMemoryStream.Create;
    try
      Dados.Add(ANroProtocolo);
      Dados.Add(AChaveAcesso);
      Dados.Add(AJustificativa);
      Dados.SaveToStream(DadosStream);
      DadosStream.Position := 0;
      try
        TCPClient.Connect(1000);
        TCPClient.WriteLn(ACNPJ);
        TCPClient.WriteInteger(Integer(NFe_Cancela));
        TCPClient.WriteStream(DadosStream, True, True);
        TCPClient.WriteInteger(Integer(AContingencia));
        Codigo := TCPClient.ReadInteger;
        if (Codigo = NFe_OK) then
        begin
          ANroProtocoloCancelamento := TCPClient.ReadLn;
          TMemoryStream(ANFe).Clear;
          TCPClient.ReadStream(ANFe);
        end
        else if (Codigo = NFe_Error) then
          raise Exception.Create(TCPClient.ReadLn);

      finally
        TCPClient.Disconnect;
      end;
    finally
      FreeAndNil(DadosStream);
      FreeAndNil(Dados);
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

function VerificaStatusNFe(AServidor, ACnpj: string; AContingencia:Boolean): Boolean;
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
begin
  Result := False;
  TCPClient := CriarTCPClient(AServidor);
  try
    try
      TCPClient.Connect(1000);
      TCPClient.WriteLn(ACNPJ);
      if AContingencia then
        TCPClient.WriteInteger(Integer(NFe_VerificaContingencia))
      else
        TCPClient.WriteInteger(Integer(NFe_Verifica));
      Codigo := TCPClient.ReadInteger;
      if (Codigo = NFe_OK) then
        Result := StrToBool(TCPClient.ReadLn)
      else if (Codigo = NFe_Error) then
        raise Exception.Create(TCPClient.ReadLn);
    finally
      TCPClient.Disconnect;
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

function ConectadoInternet(AServidor, ACnpj: string): Boolean;
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
begin
  Result := False;
  TCPClient := CriarTCPClient(AServidor);
  try
    try
      TCPClient.Connect(1000);
      TCPClient.WriteLn(ACNPJ);
      TCPClient.WriteInteger(Integer(NFe_Conectado));
      Codigo := TCPClient.ReadInteger;
      if (Codigo = NFe_OK) then
        Result := StrToBool(TCPClient.ReadLn)
      else if (Codigo = NFe_Error) then
        raise Exception.Create(TCPClient.ReadLn);
    finally
      TCPClient.Disconnect;
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

function GeraCodigoBarras(AServidor, ACNPJ, AUF, ACNPJBarras: string; AValorNF: Extended;
   ATipoEmissao: TTipoEmissao; AICMSProprio, AICMSSubstituicao: TICMS;
   ADataEmissao: TDateTime): string;
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
  Dados: TStrings;
  DadosStream: TMemoryStream;
begin
  ACNPJ    := AnsiReplaceText(AnsiReplaceText(AnsiReplaceStr(ACNPJ, '-',''), '.', ''), '/', '');

  TCPClient := CriarTCPClient(AServidor);
  try
    Dados := TStringList.Create;
    DadosStream := TMemoryStream.Create;
    try
      Dados.Add(AUF);
      Dados.Add(IntToStr(Ord(ATipoEmissao)));
      Dados.Add(ACNPJBarras);
      Dados.Add(FormatFloat('0.00', AValorNF));
      Dados.Add(IntToStr(Ord(AICMSProprio)));
      Dados.Add(IntToStr(Ord(AICMSSubstituicao)));
      Dados.Add(FormatDateTime('dd/mm/yyyy', ADataEmissao));
      Dados.SaveToStream(DadosStream);
      DadosStream.Position := 0;
      try
        TCPClient.Connect(1000);
        TCPClient.WriteLn(ACnpj);
        TCPClient.WriteInteger(Integer(NFe_CodigoBarrasContingencia));
        TCPClient.WriteStream(DadosStream, True, True);
        Codigo := TCPClient.ReadInteger;
        if (Codigo = NFe_OK) then
        begin
          Result := TCPClient.ReadLn;
        end
        else if (Codigo = NFe_Error) then
          raise Exception.Create(TCPClient.ReadLn);

      finally
        TCPClient.Disconnect;
      end;
    finally
      FreeAndNil(DadosStream);
      FreeAndNil(Dados);
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

function CriaChaveNFe(AServidor, ACnpj: string; ADataEmissao: TDateTime; AUf,
   AModelo, ASerie, ANumero, ATipoEmissao: string; AVersaoAntiga: Boolean): string;
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
  Dados: TStrings;
  DadosStream: TMemoryStream;
begin
  TCPClient := CriarTCPClient(AServidor);
  try
    Dados := TStringList.Create;
    DadosStream := TMemoryStream.Create;
    try
      Dados.Add(AUF);
      Dados.Add(FormatDateTime('YY', ADataEmissao));
      Dados.Add(FormatDateTime('MM', ADataEmissao));
      Dados.Add(AModelo);
      Dados.Add(ASerie);
      Dados.Add(ANumero);
      Dados.Add(ATipoEmissao); //  1- Normal, 2-Contingência FS, 3-Contingência SCAN, 4-DPEC e 5-Contigência FS-DA
      Dados.SaveToStream(DadosStream);
      DadosStream.Position := 0;
      try
        TCPClient.Connect(1000);
        TCPClient.WriteLn(ACnpj);
        TCPClient.WriteInteger(Integer(NFe_ChaveAcesso));
        TCPClient.WriteStream(DadosStream, True, True);
        TCPClient.WriteInteger(Integer(AVersaoAntiga));
        Codigo := TCPClient.ReadInteger;
        if (Codigo = NFe_OK) then
        begin
          Result := TCPClient.ReadLn;
        end
        else if (Codigo = NFe_Error) then
          raise Exception.Create(TCPClient.ReadLn);

      finally
        TCPClient.Disconnect;
      end;
    finally
      FreeAndNil(DadosStream);
      FreeAndNil(Dados);
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

function NFe_Consultar(AServidor, ACnpj, AChaveNFe: string; AContingencia: Boolean): string;
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
begin
  TCPClient := CriarTCPClient(AServidor);
  try
    try
      TCPClient.Connect(1000);
      TCPClient.WriteLn(ACnpj);
      TCPClient.WriteInteger(Integer(uNFeConsts.NFe_Consultar));
      TCPClient.WriteLn(AChaveNFe);
      TCPClient.WriteInteger(Integer(AContingencia));
      Codigo := TCPClient.ReadInteger;
      if (Codigo = NFe_OK) then
      begin
        Result := TCPClient.ReadLn;
      end
      else if (Codigo = NFe_Error) then
        raise Exception.Create(TCPClient.ReadLn);
    finally
      TCPClient.Disconnect;
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

procedure NFe_AdicionaProtNFe(AServidor, ACnpj: string; ANFe: TStream; AContingencia: Boolean);
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
begin
  TCPClient := CriarTCPClient(AServidor);
  try
    try
      TCPClient.Connect(1000);
      TCPClient.WriteLn(ACnpj);
      TCPClient.WriteInteger(Integer(uNFeConsts.NFe_AdicionaProtNFe));
      TCPClient.WriteStream(ANFe, True, True);
      TCPClient.WriteInteger(Integer(AContingencia));
      Codigo := TCPClient.ReadInteger;
      if (Codigo = NFe_OK) then
      begin
        TCPClient.ReadLn;
        TMemoryStream(ANFe).Clear;
        TCPClient.ReadStream(ANFe);
      end
      else if (Codigo = NFe_Error) then
        raise Exception.Create(TCPClient.ReadLn);
    finally
      TCPClient.Disconnect;
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

procedure InutilizaNFe(AServidor, ACnpj: string; AUf, AAno, AModelo, ASerie,
  ANfeInicial, ANfeFinal, AJustificativa: string; var ANroProtocoloInutilizacao: string;
  ANFe: TStream; AContingencia: Boolean);
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
  Dados: TStrings;
  DadosStream: TMemoryStream;
begin
  TCPClient := CriarTCPClient(AServidor);
  try
    Dados := TStringList.Create;
    DadosStream := TMemoryStream.Create;
    try
      Dados.Add(AUf);
      Dados.Add(AAno);
      Dados.Add(AModelo);
      Dados.Add(ASerie);
      Dados.Add(ANfeInicial);
      Dados.Add(ANFeFinal);
      Dados.Add(AJustificativa);

      Dados.SaveToStream(DadosStream);
      DadosStream.Position := 0;
      try
        TCPClient.Connect(1000);
        TCPClient.WriteLn(ACNPJ);
        TCPClient.WriteInteger(Integer(NFe_Inutilizar));
        TCPClient.WriteStream(DadosStream, True, True);
        TCPClient.WriteInteger(Integer(AContingencia));
        Codigo := TCPClient.ReadInteger;
        if (Codigo = NFe_OK) then
        begin
          ANroProtocoloInutilizacao := TCPClient.ReadLn;
          TMemoryStream(ANFe).Clear;
          TCPClient.ReadStream(ANFe);
        end
        else if (Codigo = NFe_Error) then
          raise Exception.Create(TCPClient.ReadLn);

      finally
        TCPClient.Disconnect;
      end;
    finally
      FreeAndNil(DadosStream);
      FreeAndNil(Dados);
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

function ConsultarNFe(AServidor, ACnpj: string; AChaveNFe: WideString; AXML: TStream;
  AContingencia: Boolean): WideString;
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
begin
  TCPClient := CriarTCPClient(AServidor);
  try
    try
      TCPClient.Connect(1000);
      TCPClient.WriteLn(ACnpj);
      TCPClient.WriteInteger(Integer(uNFeConsts.NFe_ConsultarNFe));
      TCPClient.WriteLn(AChaveNFe);
      TCPClient.WriteInteger(Integer(AContingencia));
      Codigo := TCPClient.ReadInteger;
      if (Codigo = NFe_OK) then
      begin
        Result := TCPClient.ReadLn;
        TMemoryStream(AXML).Clear;
        TCPClient.ReadStream(AXML);
      end
      else if (Codigo = NFe_Error) then
        raise Exception.Create(TCPClient.ReadLn);
    finally
      TCPClient.Disconnect;
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

procedure NFe_GerarDANFE(AServidor, ACnpj: string; ANFe, ADANFE: TStream);
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
begin
  TCPClient := CriarTCPClient(AServidor);
  try
    try
      TCPClient.Connect(1000);
      TCPClient.WriteLn(ACnpj);
      TCPClient.WriteInteger(Integer(uNFeConsts.NFe_GerarDANFE));
      TCPClient.WriteStream(ANFe, True, True);
      Codigo := TCPClient.ReadInteger;
      if (Codigo = NFe_OK) then
      begin
        TCPClient.ReadLn;
        TMemoryStream(ADANFE).Clear;
        TCPClient.ReadStream(ADANFE);
      end
      else if (Codigo = NFe_Error) then
        raise Exception.Create(TCPClient.ReadLn);
    finally
      TCPClient.Disconnect;
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

function EnviarCartaCorrecao(AServidor, ACnpj: string; AChaveNFe, ATextoCorrecao: WideString;
  ANroCorrecao: Integer; AContingencia: Boolean; AXML: TStream): string;
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
begin
  TCPClient := CriarTCPClient(AServidor);
  try
    try
      TCPClient.Connect(1000);
      TCPClient.WriteLn(ACnpj);
      TCPClient.WriteInteger(Integer(uNFeConsts.NFe_EnviarCartaCorrecao));
      TCPClient.WriteLn(AChaveNFe);
      TCPClient.WriteLn(ATextoCorrecao);
      TCPClient.WriteInteger(Integer(ANroCorrecao));
      TCPClient.WriteInteger(Integer(AContingencia));
      Codigo := TCPClient.ReadInteger;
      if (Codigo = NFe_OK) then
      begin
        Result := TCPClient.ReadLn;
        TMemoryStream(AXML).Clear;
        TCPClient.ReadStream(AXML);
      end
      else if (Codigo = NFe_Error) then
        raise Exception.Create(TCPClient.ReadLn);
    finally
      TCPClient.Disconnect;
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

procedure SalvarUTF8(AXMLStream: TStream; AArquivo: string);
var
  F: System.TextFile;
  Texto: String;
  StrStream: TStringStream;
begin
  StrStream := TStringStream.Create('');
  try
    AXMLStream.Position := 0;
    StrStream.CopyFrom(AXMLStream, AXMLStream.Size);
    Texto := StrStream.DataString;
  finally
    FreeAndNil(StrStream);
  end;

  try
    if FileExists(AArquivo) then
      DeleteFile( AArquivo );
    AssignFile(f, AArquivo);
    Rewrite(f); // Criar Arquivo
    Write(f, #239+#187+#191);
    Writeln(F, UTF8Encode( Texto ));
  finally
    CloseFile(f);
  end;
end;

procedure EnviarEmail(AServidor, ACnpj, AEmailDestinatario, AEmailBCC,
  AAssunto, AMensagem: string; AListBoxAnexos: TStrings );
var
  TCPClient: TIdTCPClient;
  I, Codigo: Integer;
  Arquivo: TFileStream;
begin
  TCPClient := CriarTCPClient(AServidor);
  try
    try
      TCPClient.Connect(1000);
      TCPClient.WriteLn(ACnpj);
      TCPClient.WriteInteger(Integer(uNFeConsts.NFe_EnviarEmail));
      TCPClient.WriteLn(AEmailDestinatario);
      TCPClient.WriteLn(AEmailBCC);
      TCPClient.WriteLn(AAssunto);
      TCPClient.WriteLn(AMensagem);

      TCPClient.WriteInteger(Integer(AListBoxAnexos.Count));
      if AListBoxAnexos.Count > 0 then
      begin
        for I := 0 to AListBoxAnexos.Count - 1 do
        begin
          Arquivo := TFileStream.Create( AListBoxAnexos[I], fmOpenRead or fmShareDenyNone );
          try
            Arquivo.Seek(0, soEnd);
            Arquivo.Seek(0, soBeginning);
            Arquivo.Position := 0;
            TCPClient.WriteLn( ExtractFileName(AListBoxAnexos[I]) );
            TCPClient.WriteStream(Arquivo, True, True);
          finally
            FreeAndNil(Arquivo);
          end;
        end;
      end;

      Codigo := TCPClient.ReadInteger;
      if (Codigo = NFe_Error) then
        raise Exception.Create(TCPClient.ReadLn)
      else
        TCPClient.ReadLn;
    finally
      TCPClient.Disconnect;
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

procedure ImportarNFeFornecedor(AServidor, ACnpj: string; ANFe: TStream);
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
begin
  TCPClient := CriarTCPClient(AServidor);
  try
    try
      TCPClient.Connect(1000);
      TCPClient.WriteLn(ACnpj);
      TCPClient.WriteInteger(Integer(uNFeConsts.NFe_ImportarNFeFornecedor));
      TCPClient.WriteStream(ANFe, True, True);

      Codigo := TCPClient.ReadInteger;
      if (Codigo = NFe_Error) then
        raise Exception.Create(TCPClient.ReadLn)
      else
        TCPClient.ReadLn
    finally
      TCPClient.Disconnect;
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

function ConsultarNFeDestinada(AServidor, ACnpj: string; ANFeConsultada, AEmissorNFe: Integer;
  AUltNSU: string; AXml: TStream; var AIndCont: Integer): String;
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
begin
  TCPClient := CriarTCPClient(AServidor);
  try
    try
      TCPClient.Connect(1000);
      TCPClient.WriteLn(ACnpj);
      TCPClient.WriteInteger(Integer(uNFeConsts.NFe_ConsultarNFeDestinadas));
      TCPClient.WriteInteger(ANFeConsultada);
      TCPClient.WriteInteger(AEmissorNFe);
      TCPClient.WriteLn(AUltNSU);

      Codigo := TCPClient.ReadInteger;
      if (Codigo = NFe_OK) then
      begin
        Result   := TCPClient.ReadLn;
        AIndCont := TCPClient.ReadInteger;
        TMemoryStream(AXml).Clear;
        TCPClient.ReadStream(AXml);
      end
      else
        raise Exception.Create(TCPClient.ReadLn);
    finally
      TCPClient.Disconnect;
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

procedure EnviarManifestacao(AServidor, ACnpj, AChaveAcesso: string;
  ATipoEvento: Integer; AJustificativa: string; AContingencia: Boolean;
  AXml: TStream; var AProtocolo, ADataProtocolo: string);
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
begin
  TCPClient := CriarTCPClient(AServidor);
  try
    try
      TCPClient.Connect(1000);
      TCPClient.WriteLn(ACnpj);
      TCPClient.WriteInteger(Integer(uNFeConsts.NFe_EnviarManifestacao));
      TCPClient.WriteInteger(Integer(AContingencia));
      TCPClient.WriteLn(AChaveAcesso);
      TCPClient.WriteInteger(ATipoEvento);
      TCPClient.WriteLn(AJustificativa);

      Codigo := TCPClient.ReadInteger;
      if (Codigo = NFe_OK) then
      begin
        AProtocolo := TCPClient.ReadLn;
        ADataProtocolo := Copy(AProtocolo, Pos(#8, AProtocolo) + 1, Length(AProtocolo));
        AProtocolo := Copy(AProtocolo, 1, Pos(#8, AProtocolo) - 1);
        TMemoryStream(AXml).Clear;
        TCPClient.ReadStream(AXml);
      end
      else
        raise Exception.Create(TCPClient.ReadLn);
    finally
      TCPClient.Disconnect;
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

procedure ConsultarCadastro(AServidor, ACnpj: string; ATipoArgumento: Integer;
  AUF, AArgumento: string; AXML: TStream);
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
begin
  TCPClient := CriarTCPClient(AServidor);
  try
    try
      TCPClient.Connect(1000);
      TCPClient.WriteLn(ACnpj);
      TCPClient.WriteInteger(Integer(uNFeConsts.NFe_ConsultarContribuintes));
      TCPClient.WriteInteger(Integer(ATipoArgumento));
      TCPClient.WriteLn(AArgumento);
      TCPClient.WriteLn(AUF);

      Codigo := TCPClient.ReadInteger;
      if (Codigo = NFe_OK) then
      begin
        TMemoryStream(AXml).Clear;
        TCPClient.ReadStream(AXml);
      end
      else
        raise Exception.Create(TCPClient.ReadLn);
    finally
      TCPClient.Disconnect;
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

procedure DownloadNFe(AServidor, ACnpj, AChaveAcesso: string; AXML: TStream);
var
  TCPClient: TIdTCPClient;
  Codigo: Integer;
begin
  TCPClient := CriarTCPClient(AServidor);
  try
    try
      TCPClient.Connect(1000);
      TCPClient.WriteLn(ACnpj);
      TCPClient.WriteInteger(Integer(uNFeConsts.NFe_DownloadNFe));
      TCPClient.WriteLn(AChaveAcesso);

      Codigo := TCPClient.ReadInteger;
      if (Codigo = NFe_OK) then
      begin
        TMemoryStream(AXml).Clear;
        TCPClient.ReadStream(AXml);
      end
      else
        raise Exception.Create(TCPClient.ReadLn);
    finally
      TCPClient.Disconnect;
    end;
  finally
    FreeAndNil(TCPClient);
  end;
end;

{ TAguarde }

procedure TAguarde.AfterConstruction;
begin
  inherited AfterConstruction;
  FAntiFreeze := TIdAntiFreeze.Create(nil);

  FTela             := TForm.Create(nil);
  FTela.Name        := 'frmTelaAguarde';
  FTela.Position    := poMainFormCenter;
  FTela.Caption     := 'Aguarde!';
  FTela.BorderStyle := bsNone;
  FTela.FormStyle   := fsStayOnTop;

  FLabel          := TLabel.Create(nil);
  FLabel.Name     := 'lblMensagem';
  FLabel.AutoSize := False;
  FLabel.Parent   := FTela;
  FLabel.Left     := 0;
  FLabel.Top      := 0;
  FLabel.Caption  := FMensagem;
  FLabel.AutoSize := True;

  FTransparent := TJvTransparentForm.Create(FTela);
  FTransparent.Name := 'JvTransparentForm';
  FTransparent.Enable := False;
  FTransparent.AutoSize := False;

  FTela.BorderWidth := 30;
  FTela.AutoSize    := True;

  FTela.Show;

  WindowList := DisableTaskWindows(FTela.Handle);
//  Application.ProcessMessages;
end;

procedure TAguarde.BeforeDestruction;
begin
  inherited BeforeDestruction;
  EnableTaskWindows(WindowList);
  FreeAndNil(FTransparent);
  FreeAndNil(FLabel);
  FreeAndNil(FTela);
  FreeAndNil(FAntiFreeze);
end;

constructor TAguarde.Create(AMensagem: string);
begin
  inherited Create;
  FMensagem := AMensagem;
end;

class function TAguarde.Mostrar(AMensagem: String): IAguarde;
begin
  Result := Self.Create(AMensagem);
end;

{ TTCPClient }

procedure TTCPClient.AfterConstruction;
begin
  inherited;
  FAguarde := TAguarde.Mostrar('Conectando com o servidor.');
end;

procedure TTCPClient.BeforeDestruction;
begin
  inherited;
  FAguarde := nil;
end;

end.
