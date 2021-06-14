unit UTabPis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup;

type
  TfTabPis = class(TForm)
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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBMemo2KeyPress(Sender: TObject; var Key: Char);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTabPis: TfTabPis;

implementation

uses UDM1, UDMTabImposto;

{$R *.DFM}

procedure TfTabPis.Habilita;
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

procedure TfTabPis.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfTabPis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DMTabImposto.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMTabImposto);

  Action := Cafree;
end;

procedure TfTabPis.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if DM1.tUsuarioInsTabPis.AsBoolean then
    begin
      DMTabImposto.tTabPis.IndexFieldNames := 'Codigo';

      DMTabImposto.tTabPis.Insert;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfTabPis.BitBtn5Click(Sender: TObject);
begin
  if Trim(DMTabImposto.tTabPisNome.AsString) = '' then
  begin
    ShowMessage('Nome não foi informado!');
    exit;
  end;

  DMTabImposto.tTabPis.Post;
  DMTabImposto.tTabPis.Refresh;

  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfTabPis.BitBtn4Click(Sender: TObject);
begin
  DMTabImposto.tTabPis.Cancel;
  DMTabImposto.tTabPis.Refresh;

  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfTabPis.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltTabPis.AsBoolean then
    begin
      DMTabImposto.tTabPis.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfTabPis.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcTabPis.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        DMTabImposto.tTabPis.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfTabPis.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DMTabImposto.tTabPis.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o registro antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfTabPis.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if (Shift = [ssCtrl]) and (Key = 76) then
//    DM1.Login;
end;

procedure TfTabPis.FormShow(Sender: TObject);
begin
  if not Assigned(DMTabImposto) then
    DMTabImposto := TDMTabImposto.Create(Self);
end;

procedure TfTabPis.DBMemo2KeyPress(Sender: TObject; var Key: Char);
begin
  //esse if ridiculo aqui não é para tirar mas nem a pau Juvenal (Cleomar 17/11/2010)
  //IF BLINDADO A PROVA DE QUALQUER MEXIDA
  if Key = #13 then
    Key := ' ';
  //**************************************************
end;

end.
