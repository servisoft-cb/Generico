unit UAtividade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, RxLookup, ExtCtrls, DB, DBTables;

type
  TfAtividade = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Panel4: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
  public
    { Public declarations }
  end;

var
  fAtividade: TfAtividade;

implementation

uses UDM1;

{$R *.DFM}

procedure TfAtividade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tAtividade.Close;
  Action := Cafree;
end;

procedure tfAtividade.Habilita;
begin
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  Panel2.Enabled       := not(Panel2.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
end;

procedure TfAtividade.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tAtividade.IndexFieldNames := 'Nome';
end;

procedure TfAtividade.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tAtividade.IndexFieldNames := 'Codigo';
end;

procedure TfAtividade.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tAtividade.IndexFieldNames := 'Codigo';
end;

procedure TfAtividade.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfAtividade.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tAtividade.State in [dsEdit,dsInsert] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o Atividade antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfAtividade.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsAtividade.AsBoolean then
    begin
      DM1.tAtividade.Refresh;
      DM1.tAtividade2.Last;
      DM1.tAtividade.Insert;
      DM1.tAtividadeCodigo.AsInteger := DM1.tAtividade2Codigo.AsInteger + 1;
      DM1.tAtividade.Post;
      DM1.tAtividade.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfAtividade.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltAtividade.AsBoolean then
    begin
      DM1.tAtividade.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfAtividade.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    begin
      DM1.tAtividade.Delete;
      Habilita;
      BitBtn1.SetFocus;
    end
  else
  if BitBtn2.Tag = 1 then
    begin
      DM1.tAtividade.Cancel;
      Habilita;
      BitBtn1.SetFocus;
    end;
  BitBtn2.Tag := 0;
end;

procedure TfAtividade.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcAtividade.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir esta Atividade?',mtconfirmation,[mbok,mbno],0)=mrok then
        DM1.tAtividade.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfAtividade.BitBtn5Click(Sender: TObject);
begin
  DM1.tAtividade.Post;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfAtividade.FormShow(Sender: TObject);
begin
  DM1.tAtividade.Open;
end;

end.
