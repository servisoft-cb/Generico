unit URegimeTrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup;

type
  TfRegimeTrib = class(TForm)
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
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
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
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRegimeTrib: TfRegimeTrib;

implementation

uses UDM1, UDMTabImposto;

{$R *.DFM}

procedure TfRegimeTrib.Habilita;
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

procedure TfRegimeTrib.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfRegimeTrib.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DMTabImposto.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMTabImposto);

  Action := Cafree;
end;

procedure TfRegimeTrib.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if DM1.tUsuarioInsRegimeTrib.AsBoolean then
    begin
      DMTabImposto.tRegimeTrib.IndexFieldNames := 'Codigo';
      DMTabImposto.tRegimeTrib.Refresh;
      DMTabImposto.tRegimeTrib.Last;
      vCodAux := DMTabImposto.tRegimeTribCodigo.AsInteger;

      DMTabImposto.tRegimeTrib.Insert;
      DMTabImposto.tRegimeTribCodigo.AsInteger := vCodAux + 1;
      DMTabImposto.tRegimeTrib.Post;
      DMTabImposto.tRegimeTrib.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfRegimeTrib.BitBtn5Click(Sender: TObject);
begin
  if Trim(DMTabImposto.tRegimeTribNome.AsString) = '' then
  begin
    ShowMessage('Nome não foi informado!');
    exit;
  end;

  DMTabImposto.tRegimeTrib.Post;
  DMTabImposto.tRegimeTrib.Refresh;

  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfRegimeTrib.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DMTabImposto.tRegimeTrib.Delete
  else
  if BitBtn2.Tag = 1 then
    DMTabImposto.tRegimeTrib.Cancel;
  DMTabImposto.tRegimeTrib.Refresh;

  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfRegimeTrib.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltRegimeTrib.AsBoolean then
    begin
      DMTabImposto.tRegimeTrib.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfRegimeTrib.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcRegimeTrib.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        DMTabImposto.tRegimeTrib.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfRegimeTrib.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DMTabImposto.tRegimeTrib.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o registro antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfRegimeTrib.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if (Shift = [ssCtrl]) and (Key = 76) then
//    DM1.Login;
end;

procedure TfRegimeTrib.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DMTabImposto.tRegimeTrib.Refresh;
end;

procedure TfRegimeTrib.FormShow(Sender: TObject);
begin
  if not Assigned(DMTabImposto) then
    DMTabImposto := TDMTabImposto.Create(Self);
end;

end.
