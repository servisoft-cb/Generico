unit UTabCofins;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup;

type
  TfTabCofins = class(TForm)
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
    DBMemo2: TDBMemo;
    BitBtn5: TBitBtn;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure DBMemo2KeyPress(Sender: TObject; var Key: Char);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTabCofins: TfTabCofins;

implementation

uses UDM1, UDMTabImposto;

{$R *.DFM}

procedure TfTabCofins.Habilita;
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

procedure TfTabCofins.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfTabCofins.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DMTabImposto.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMTabImposto);

  Action := Cafree;
end;

procedure TfTabCofins.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if DM1.tUsuarioInsTabCofins.AsBoolean then
    begin
      DMTabImposto.tTabCofins.IndexFieldNames := 'Codigo';

      DMTabImposto.tTabCofins.Insert;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfTabCofins.BitBtn5Click(Sender: TObject);
begin
  if Trim(DMTabImposto.tTabCofinsNome.AsString) = '' then
  begin
    ShowMessage('Nome não foi informado!');
    exit;
  end;

  DMTabImposto.tTabCofins.Post;
  DMTabImposto.tTabCofins.Refresh;

  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfTabCofins.BitBtn4Click(Sender: TObject);
begin
  DMTabImposto.tTabCofins.Cancel;
  DMTabImposto.tTabCofins.Refresh;

  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfTabCofins.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltTabCofins.AsBoolean then
    begin
      DMTabImposto.tTabCofins.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfTabCofins.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcTabCofins.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        DMTabImposto.tTabCofins.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfTabCofins.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DMTabImposto.tTabCofins.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o registro antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfTabCofins.FormShow(Sender: TObject);
begin
  if not Assigned(DMTabImposto) then
    DMTabImposto := TDMTabImposto.Create(Self);
end;

procedure TfTabCofins.DBMemo2KeyPress(Sender: TObject; var Key: Char);
begin
  //esse if ridiculo aqui não é para tirar mas nem a pau Juvenal (Cleomar 17/11/2010)
  //IF BLINDADO A PROVA DE QUALQUER MEXIDA
  if Key = #13 then
    Key := ' ';
  //**************************************************
end;

end.
