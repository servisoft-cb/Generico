unit UImpressora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Buttons, ExtCtrls, Db, DBTables, RxLookup;

type
  TfImpressora = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Panel4: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    DBEdit2: TDBEdit;
    tImpressora: TTable;
    tImpressoraCodigo: TIntegerField;
    Label5: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBEdit3: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
  public
    { Public declarations }
  end;

var
  fImpressora: TfImpressora;

implementation

uses UDM1;

{$R *.DFM}

procedure TfImpressora.Habilita;
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

procedure TfImpressora.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfImpressora.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tImpressora.IndexFieldNames := 'Codigo';
end;

procedure TfImpressora.FormShow(Sender: TObject);
begin
  DM1.tImpressora.Refresh;
  DM1.tImpressora.Last;
end;

procedure TfImpressora.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfImpressora.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsImpressoras.AsBoolean then
    begin
      tImpressora.IndexFieldNames     := 'Codigo';
      DM1.tImpressora.IndexFieldNames := 'Codigo';
      tImpressora.Refresh;
      tImpressora.Last;
      DM1.tImpressora.Refresh;
      DM1.tImpressora.Insert;
      DM1.tImpressoraCodigo.AsInteger     := tImpressoraCodigo.AsInteger + 1;
      DM1.tImpressoraVisualizar.AsBoolean := False;
      DM1.tImpressora.Post;
      DM1.tImpressora.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfImpressora.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltImpressoras.AsBoolean then
    begin
      DM1.tImpressora.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfImpressora.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tImpressora.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tImpressora.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfImpressora.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcImpressoras.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        DM1.tImpressora.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfImpressora.BitBtn5Click(Sender: TObject);
begin
  DM1.tImpressora.Post;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfImpressora.Edit1Exit(Sender: TObject);
var
Texto : String;
i     : Integer;
begin
  for i := 1 to length(DBEdit3.Text) do
    begin
      Texto := '';
      if copy(DBEdit3.Text,i,1) <> '.' then
        Texto := Texto + copy(DBEdit3.Text,i,1)
      else
        Break;
    end;
  DBEdit3.Text := Texto;  
end;

procedure TfImpressora.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tImpressora.State in [dsInsert, dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar esta impressora antes de Fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfImpressora.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tImpressora.IndexFieldNames := 'Codigo';
end;

procedure TfImpressora.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tImpressora.IndexFieldNames := 'Nome';
end;

end.
