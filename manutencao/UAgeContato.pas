unit UAgeContato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup;

type
  TfAgeContato = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBMemo1: TDBMemo;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAgeContato: TfAgeContato;
  vExcluir : Boolean;

implementation

uses UDM1, UDM2, UConsAgeContato;

{$R *.DFM}

procedure TfAgeContato.Habilita;
begin
  Panel4.Enabled       := not(Panel4.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
end;

procedure TfAgeContato.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfAgeContato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      Dm1.tCliente.Close;
      Dm1.tAgeContato.Close;
    end;
  Action := Cafree;
end;

procedure TfAgeContato.BitBtn1Click(Sender: TObject);
var
  vNumAux : Integer;
begin
  if DM1.tUsuarioInsAgeContato.AsBoolean then
    begin
      DM1.tAgeContato.IndexFieldNames  := 'NumMov';
      DM1.tAgeContato.Refresh;
      DM1.tAgeContato.Last;
      vNumAux := DM1.tAgeContatoNumMov.AsInteger;

      DM1.tAgeContato.Insert;
      DM1.tAgeContatoNumMov.AsInteger :=  vNumAux + 1;
      DM1.tAgeContato.Post;
      DM1.tAgeContato.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfAgeContato.BitBtn5Click(Sender: TObject);
begin
  DM1.tAgeContato.Post;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfAgeContato.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tAgeContato.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tAgeContato.Cancel;
  Habilita;
end;

procedure TfAgeContato.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltAgeContato.AsBoolean then
    begin
      DM1.tAgeContato.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end              
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfAgeContato.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcAgeContato.AsBoolean then
    begin       
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        DM1.tAgeContato.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfAgeContato.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tAgeContato.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfAgeContato.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfAgeContato.RxDBLookupCombo2Exit(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Codigo';
end;

procedure TfAgeContato.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) and (DM1.tAgeContato.State in [dsBrowse]) then
    begin
      fConsAgeContato := TfConsAgeContato.Create(Self);
      fConsAgeContato.ShowModal;
    end;
end;

procedure TfAgeContato.FormShow(Sender: TObject);
begin
  Dm1.tCliente.Open;
  Dm1.tAgeContato.Open;
end;

end.
