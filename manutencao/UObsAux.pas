unit UObsAux;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls, Buttons, RxLookup, Mask, DB, DBTables;

type
  TfObsAux = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Panel4: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    BitBtn5: TBitBtn;
    DBText1: TDBText;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
  public
    { Public declarations }
  end;

var
  fObsAux: TfObsAux;

implementation

uses UDM1;

{$R *.DFM}

procedure TfObsAux.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tObsAux.Close;
      DM1.tObsAux2.Close;
    end;
  Action := Cafree;
end;

procedure tfObsAux.Habilita;
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

procedure TfObsAux.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tObsAux.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar a Observação antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfObsAux.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tObsAux.IndexFieldNames := 'Codigo';
end;

procedure TfObsAux.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tObsAux.IndexFieldNames := 'Nome';
end;

procedure TfObsAux.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tObsAux.IndexFieldNames := 'Codigo';
end;

procedure TfObsAux.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsObsAux.AsBoolean then
    begin
      DM1.tObsAux2.Refresh;
      DM1.tObsAux2.Last;
      DM1.tObsAux.Insert;
      DM1.tObsAuxCodigo.AsInteger := DM1.tObsAux2Codigo.AsInteger + 1;
      DM1.tObsAux.Post;
      DM1.tObsAux.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfObsAux.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltObsAux.AsBoolean then
    begin
      DM1.tObsAux.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfObsAux.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    begin
      DM1.tObsAux.Delete;
      Habilita;
      BitBtn1.SetFocus;
    end
  else
  if BitBtn2.Tag = 1 then
    begin
      DM1.tObsAux.Cancel;
      Habilita;
      BitBtn1.SetFocus;
    end;
  BitBtn2.Tag := 0;
end;

procedure TfObsAux.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcObsAux.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir esta Observação?',mtconfirmation,[mbok,mbno],0)=mrok then
        DM1.tObsAux.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfObsAux.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfObsAux.BitBtn5Click(Sender: TObject);
begin
  DM1.tObsAux.Post;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfObsAux.FormShow(Sender: TObject);
begin
  DM1.tObsAux.Open;
  DM1.tObsAux2.Open;
end;

end.
