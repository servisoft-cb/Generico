unit UGrupoCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup,
  DBFilter;

type
  TfGrupoCliente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    tGrupoCliente2: TTable;
    tGrupoCliente2Codigo: TIntegerField;
    tGrupoCliente2Nome: TStringField;
    RxDBFilter1: TRxDBFilter;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Habilita;
    procedure Verifica_Cliente;
    { Private declarations }
  public
    { Public declarations }
    vTipoGrupo : String;
  end;

var
  fGrupoCliente: TfGrupoCliente;
  vExcluir : Boolean;

implementation

uses UDM1, UDM2;

{$R *.DFM}

procedure TfGrupoCliente.Habilita;
begin
  Panel2.Enabled       := not(Panel2.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
end;

procedure TfGrupoCliente.Verifica_Cliente;
begin
  if DM1.tCliente.Locate('CodGrupo',DM1.tGrupoClienteCodigo.AsInteger,[loCaseInsensitive]) then
    begin
      vExcluir := False;
      ShowMessage('Este grupo não pode ser excluído está no cliente ' + DM1.tClienteNome.AsString);
    end;
end;

procedure TfGrupoCliente.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfGrupoCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tGrupoCliente2.Close;
  if Screen.FormCount < 3 then
    DM1.tGrupoCliente.Close;
  RxDBFilter1.Active := False;
  Action := Cafree;
end;

procedure TfGrupoCliente.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if DM1.tUsuarioInsGrupoCliente.AsBoolean then
    begin
      DM1.tGrupoCliente.IndexFieldNames  := 'Codigo';
      DM1.tGrupoCliente.Refresh;
      DM1.tGrupoCliente.Last;
      vCodAux := DM1.tGrupoClienteCodigo.AsInteger;

      DM1.tGrupoCliente.Insert;
      DM1.tGrupoClienteCodigo.AsInteger := vCodAux + 1;
      DM1.tGrupoCliente.Post;
      DM1.tGrupoCliente.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfGrupoCliente.BitBtn5Click(Sender: TObject);
begin
  if DM1.tGrupoClienteNome.AsString = '' then
    ShowMessage('Falta informar o nome')
  else
    begin
      DM1.tGrupoCliente.Post;
      BitBtn2.Tag := 0;
      Habilita;
      BitBtn1.SetFocus;
    end;
end;

procedure TfGrupoCliente.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tGrupoCliente.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tGrupoCliente.Cancel;
  Habilita;
end;

procedure TfGrupoCliente.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltGrupoCliente.AsBoolean then
    begin
      DM1.tGrupoCliente.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfGrupoCliente.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcGrupoCliente.AsBoolean then
    begin
      vExcluir := True;
      Verifica_Cliente;
      if vExcluir then
        if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
          DM1.tGrupoCliente.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfGrupoCliente.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tGrupoCliente.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o registro antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfGrupoCliente.DBEdit1Exit(Sender: TObject);
begin
  if DBEdit1.Text <> '' then
    begin
      if tGrupoCliente2.Locate('Nome',DM1.tGrupoClienteNome.AsString,[loCaseInsensitive]) then
        begin
          if tGrupoCliente2Codigo.AsInteger <> DM1.tGrupoClienteCodigo.AsInteger then
            begin
              ShowMessage('Grupo já cadastrado!');
              DM1.tGrupoClienteNome.Clear;
              DBEdit1.SetFocus;
            end;
        end;
    end;
end;

procedure TfGrupoCliente.FormShow(Sender: TObject);
begin
  DM1.tGrupoCliente.Open;
  DM1.tCliente.Open;
  tGrupoCliente2.Open;
  tGrupoCliente2.Refresh;
end;

procedure TfGrupoCliente.FormCreate(Sender: TObject);
begin
  RxDBFilter1.Active := False;
  RxDBFilter1.Filter.Text := 'Tipo = ' + QuotedStr(vTipoGrupo);
  RxDBFilter1.Active := True;
end;

end.
