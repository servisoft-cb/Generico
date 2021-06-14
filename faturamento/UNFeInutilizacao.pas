unit UNFeInutilizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, Grids, DBGrids, SMDBGrid,
  StdCtrls, Mask, ToolEdit, CurrEdit, Buttons, RxLookup, DB, DBTables;

type
  TfNFeInutilizacao = class(TForm)
    Panel1: TPanel;
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    ceNotaIni: TCurrencyEdit;
    Label2: TLabel;
    ceNotaFin: TCurrencyEdit;
    Label3: TLabel;
    edMotivo: TEdit;
    btConfirmar: TBitBtn;
    btAlterar: TBitBtn;
    btCancelar: TBitBtn;
    btFechar: TBitBtn;
    btExcluir: TBitBtn;
    Label4: TLabel;
    RxDBFilial: TRxDBLookupCombo;
    tFilial2: TTable;
    dsFilial2: TDataSource;
    tFilial2Codigo: TIntegerField;
    tFilial2Empresa: TStringField;
    tFilial2NomeInterno: TStringField;
    Label5: TLabel;
    edSerie: TEdit;
    Label6: TLabel;
    ceAno: TCurrencyEdit;
    tNotaFiscal2: TTable;
    tNotaFiscal2Filial: TIntegerField;
    tNotaFiscal2NumSeq: TIntegerField;
    tNotaFiscal2DtEmissao: TDateField;
    tNotaFiscal2NumNota: TIntegerField;
    tNotaFiscal2NFeRecibo: TStringField;
    tNotaFiscal2NFeProtocolo: TStringField;
    tNotaFiscal2NFeChaveAcesso: TStringField;
    tNotaFiscal2NFeProtocoloCancelada: TStringField;
    tNotaFiscal2Serie: TStringField;
    qUltNota: TQuery;
    qUltNotaNumNota: TIntegerField;
    qProximoMov: TQuery;
    qProximoMovNumMov: TIntegerField;
    StaticText1: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
  private
    { Private declarations }
    vObsNota : String;
    function Verifica_Nota : Boolean;
    procedure Abrir_FormNFe;

  public
    { Public declarations }
  end;

var
  fNFeInutilizacao: TfNFeInutilizacao;

implementation

uses UDM1, UDMNFe, uNFe, UDMNotaFiscal;

{$R *.dfm}

procedure TfNFeInutilizacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMNFe.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMNFe);
  if DMNotaFiscal.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMNotaFiscal);

  Action := Cafree;
end;

procedure TfNFeInutilizacao.FormShow(Sender: TObject);
begin
  if not Assigned(DMNFe) then
    DMNFe := TDMNFe.Create(Self);
  if not Assigned(DMNotaFiscal) then
    DMNotaFiscal := TDMNotaFiscal.Create(Self);

  DM1.tFilial.Open;
  DM1.tUF.Open;

  btConfirmar.Enabled := DM1.tUsuarioInsNFeInutilizar.AsBoolean;
  btAlterar.Enabled   := DM1.tUsuarioAltNFeInutilizar.AsBoolean;
  btExcluir.Enabled   := DM1.tUsuarioExcNFeInutilizar.AsBoolean;

  DMNFe.tNFeInutilizacao.Open;
end;

procedure TfNFeInutilizacao.btConfirmarClick(Sender: TObject);
var
  vTexto : String;
  vNumAux : Integer;
begin
  vTexto := '';
  if RxDBFilial.Text = '' then
    vTexto := 'Filial n�o foi informada!'
  else
  if not tFilial2.Locate('Codigo',RxDBFilial.KeyValue,[loCaseInsensitive]) then
    vTexto := vTexto + #13 + 'Filial n�o encontrada!';
  if ceAno.AsInteger <= 0 then
    vTexto := vTexto + #13 + 'Ano n�o foi informado!';
  if ceAno.AsInteger < 2000 then
    vTexto := vTexto + #13 + 'Ano inv�lido!';
  if Trim(edSerie.Text) = '' then
    vTexto := vTexto + #13 + 'S�rie n�o foi informada!';
  if ceNotaIni.AsInteger <= 0 then
    vTexto := vTexto + #13 + 'Nota Inicial n�o foi informada!';
  if ceNotaFin.AsInteger <= 0 then
    vTexto := vTexto + #13 + 'Nota Final n�o foi informada!';
  if ceNotaIni.AsInteger > ceNotaFin.AsInteger then
    vTexto := vTexto + #13 + 'Nota inicial maior que nota final!';
  if Length(edMotivo.Text) < 15 then
    vTexto := vTexto + #13 + 'Motivo necessita no m�nimo de 15 caracteres!';
  if vTexto <> '' then
  begin
    ShowMessage(vTexto);
    exit;
  end;

  if not Verifica_Nota then
    exit;

  qProximoMov.Close;
  qProximoMov.ParamByName('Filial').AsInteger := RxDBFilial.KeyValue;
  qProximoMov.Open;
  qProximoMov.Last;
  vNumAux := qProximoMovNumMov.AsInteger;

  DMNFe.tNFeInutilizacao.Insert;
  DMNFe.tNFeInutilizacaoFilial.AsInteger := RxDBFilial.KeyValue;
  DMNFe.tNFeInutilizacaoNumMov.AsInteger := vNumAux + 1;
  DMNFe.tNFeInutilizacaoNumProtocolo.AsString := '';
  DMNFe.tNFeInutilizacaoMotivo.AsString       := edMotivo.Text;
  DMNFe.tNFeInutilizacaoNumNotaIni.AsInteger  := ceNotaIni.AsInteger;
  DMNFe.tNFeInutilizacaoNumNotaFin.AsInteger  := ceNotaFin.AsInteger;
  DMNFe.tNFeInutilizacaoUsuario.AsString      := DM1.tUsuarioUsuario.AsString;
  DMNFe.tNFeInutilizacaoDtUsuario.AsDateTime  := Date;
  DMNFe.tNFeInutilizacaoHrUsuario.AsDateTime  := Now;
  DMNFe.tNFeInutilizacaoModelo.AsString       := '55';
  DMNFe.tNFeInutilizacaoSerie.AsString        := edSerie.Text;
  DMNFe.tNFeInutilizacaoAno.AsInteger         := ceAno.AsInteger;
  DMNFe.tNFeInutilizacao.Post;

  Abrir_FormNFe;

  btCancelarClick(Sender);
end;

function TfNFeInutilizacao.Verifica_Nota: Boolean;
var
  i : Integer;

begin
  vObsNota := '';
  Result   := False;
  qUltNota.Close;
  qUltNota.ParamByName('Filial').AsInteger := RxDBFilial.KeyValue;
  qUltNota.ParamByName('Serie').AsString   := edSerie.Text;
  qUltNota.Open;
  if ceNotaIni.AsInteger > qUltNotaNumNota.AsInteger then
    vObsNota := '�ltima nota emitida � menor que a nota ' + ceNotaIni.Text
  else
  if ceNotaFin.AsInteger > qUltNotaNumNota.AsInteger then
    vObsNota := '�ltima nota emitida � menor que a nota ' + ceNotaFin.Text
  else
  begin
    i := ceNotaIni.AsInteger;
    while i <= ceNotaFin.AsInteger do
    begin
      if tNotaFiscal2.Locate('Filial;Serie;NumNota',VarArrayOf([RxDBFilial.KeyValue,edSerie.Text,i]),[loCaseInsensitive]) then
      begin
        if tNotaFiscal2NFeChaveAcesso.AsString <> '' then
          vObsNota := vObsNota + #13 + '(N� Nota ' + IntToStr(i) + ', j� foi usada) '
        else
          vObsNota := vObsNota + #13 + '(N� Nota ' + IntToStr(i) + ', consta no sistema, mas n�o possui chave de acesso) ';
      end;
      i := i + 1;
    end;
  end;
  if vObsNota <> '' then
    ShowMessage(vObsNota)
  else
    Result := True;
end;

procedure TfNFeInutilizacao.btCancelarClick(Sender: TObject);
begin
  RxDBFilial.ClearValue;
  ceAno.Clear;
  ceNotaFin.Clear;
  ceNotaIni.Clear;
  edSerie.Clear;
  edMotivo.Clear;
  
end;

procedure TfNFeInutilizacao.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfNFeInutilizacao.btExcluirClick(Sender: TObject);
begin
  if DM1.tUsuarioExcNFeInutilizar.AsBoolean then
  begin

    if DMNFe.tNFeInutilizacaoNumProtocolo.AsString <> '' then
    begin
      ShowMessage('Nota(s) j� inutilizadas!');
      exit;
    end;

    if MessageDlg('Deseja excluir o registro?',mtconfirmation,[mbok,mbno],0)=mrNo then
      exit;
    DMNFe.tNFeInutilizacao.Delete;
    DMNFe.tNFeInutilizacao.Refresh;
  end
  else
    ShowMessage('Usu�rio "' + DM1.tUsuarioUsuario.AsString + '" n�o autorizado a fazer exclus�o!');
end;

procedure TfNFeInutilizacao.SMDBGrid1DblClick(Sender: TObject);
begin
  Abrir_FormNFe;
end;

procedure TfNFeInutilizacao.Abrir_FormNFe;
begin
  if DMNFe.tNFeInutilizacaoNumProtocolo.AsString <> '' then
  begin
    ShowMessage('Notas j� inutilizadas!');
    exit;
  end;

  if not DM1.tFilial.Locate('Codigo',DMNFe.tNFeInutilizacaoFilial.AsInteger,[loCaseInsensitive]) then
  begin
    ShowMessage('Filial n�o encontrada!');
    exit;
  end;

  if not DM1.tUF.Locate('Sigla',DM1.tFilialEstado.AsString,[loCaseInsensitive]) then
  begin
    ShowMessage('UF n�o encontrada!');
    exit;
  end;

  try
    fNFe     := TfNFe.Create(fNFe);
    fNFe.Tag := 1;
    fNFe.ShowModal;
  finally
    FreeAndNil(fNFe);
  end;
end;

procedure TfNFeInutilizacao.btAlterarClick(Sender: TObject);
begin
  if not DM1.tUsuarioAltNFeInutilizar.AsBoolean then
  begin
    ShowMessage('Usu�rio n�o autorizado a fazer a altera��o!');
    exit;
  end;

  if DMNFe.tNFeInutilizacaoNumMov.AsInteger <= 0 then
    exit;

  if DMNFe.tNFeInutilizacaoNumProtocolo.AsString <> '' then
  begin
    ShowMessage('Nota(s) j� inutilizadas!');
    exit;
  end;

  if DMNFe.tNFeInutilizacaoFilial.AsInteger > 0 then
    RxDBFilial.KeyValue := DMNFe.tNFeInutilizacaoFilial.AsInteger
  else
    RxDBFilial.ClearValue;

  ceAno.AsInteger     := DMNFe.tNFeInutilizacaoAno.AsInteger;
  edSerie.Text        := DMNFe.tNFeInutilizacaoSerie.AsString;
  ceNotaIni.AsInteger := DMNFe.tNFeInutilizacaoNumNotaIni.AsInteger;
  ceNotaFin.AsInteger := DMNFe.tNFeInutilizacaoNumNotaFin.AsInteger;
  edMotivo.Text       := DMNFe.tNFeInutilizacaoMotivo.AsString;
  RxDBFilial.SetFocus;

  DMNFe.tNFeInutilizacao.Delete;
end;

end.
