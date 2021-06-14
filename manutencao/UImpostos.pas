unit UImpostos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup;

type
  TfImpostos = class(TForm)
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
    qImpostos: TQuery;
    dsqImpostos: TDataSource;
    qImpostosNome: TStringField;
    qImpostosCodigo: TIntegerField;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    tImpostos2: TTable;
    tImpostos2Codigo: TIntegerField;
    tImpostos2Nome: TStringField;
    tImpostos2Percentual: TFloatField;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure Panel2Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImpostos: TfImpostos;

implementation

uses UDM1, UDM2;

{$R *.DFM}

procedure TfImpostos.Habilita;
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

procedure TfImpostos.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfImpostos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tImpostos.Close;
  qImpostos.Close;
  Action := Cafree;
end;

procedure TfImpostos.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if DM1.tUsuarioInsImposto.AsBoolean then
    begin
      DM1.tImpostos.IndexFieldNames  := 'Codigo';
      DM1.tImpostos.Refresh;
      DM1.tImpostos.Last;
      vCodAux := DM1.tImpostosCodigo.AsInteger;

      DM1.tImpostos.Refresh;
      DM1.tImpostos.Insert;
      DM1.tImpostosCodigo.AsInteger :=  vCodAux + 1;
      DM1.tImpostos.Post;
      DM1.tImpostos.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfImpostos.BitBtn5Click(Sender: TObject);
begin
  DM1.tImpostos.Post;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfImpostos.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tImpostos.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tImpostos.Cancel;
  Habilita;
end;

procedure TfImpostos.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltImposto.AsBoolean then
    begin
      DM1.tImpostos.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfImpostos.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcImposto.AsBoolean then
    if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
      DM1.tImpostos.Delete
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfImpostos.DBEdit1Exit(Sender: TObject);
begin
  if DBEdit1.Text <> '' then
    begin
      if tImpostos2.Locate('Nome',DM1.tImpostosNome.AsString,[loCaseInsensitive]) then
        begin
          if tImpostos2Codigo.AsInteger <> DM1.tImpostosCodigo.AsInteger then
            begin
              ShowMessage('Imposto já cadastrada!');
              DM1.tImpostosNome.Clear;
              DBEdit1.SetFocus;
            end;
        end;
    end;
end;

procedure TfImpostos.RxDBLookupCombo1Change(Sender: TObject);
begin
  if qImpostosCodigo.AsInteger > 0 then
    begin
      DM1.tImpostos.IndexFieldNames := 'Codigo';
      DM1.tImpostos.FindKey([qImpostosCodigo.AsInteger]);
    end;
end;

procedure TfImpostos.Panel2Enter(Sender: TObject);
begin
  qImpostos.Close;
  qImpostos.Open;
end;

procedure TfImpostos.FormShow(Sender: TObject);
begin
  DM1.tImpostos.Open;
end;

end.
