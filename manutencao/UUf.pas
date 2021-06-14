unit UUf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Mask, Db, DBTables, RXLookup;

type
  TfUf = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel4: TPanel;
    BitBtn6: TBitBtn;
    Panel5: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    tUFIns: TTable;
    tUFInsSigla: TStringField;
    tUFInsPercentual: TFloatField;
    tUFInsIDPais: TIntegerField;
    tUFInsCodUF: TStringField;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Habilitar;
  public
    { Public declarations }
  end;

var
  fUf: TfUf;

implementation

uses UDM1;

{$R *.DFM}

procedure TfUf.Habilitar;
begin
  Panel3.Enabled           := not(Panel3.Enabled);
  BitBtn1.Enabled          := not(BitBtn1.Enabled);
  BitBtn2.Enabled          := not(BitBtn2.Enabled);
  BitBtn3.Enabled          := not(BitBtn3.Enabled);
  BitBtn4.Enabled          := not(BitBtn4.Enabled);
  BitBtn5.Enabled          := not(BitBtn5.Enabled);
  BitBtn6.Enabled          := not(BitBtn6.Enabled);
  DBNavigator1.Enabled     := not(DBNavigator1.Enabled);
  RxDBLookupCombo1.Enabled := not(RxDBLookupCombo1.Enabled);
end;

procedure TfUf.BitBtn4Click(Sender: TObject);
begin
  DM1.tUf.Cancel;
  Close;
end;

procedure TfUf.BitBtn5Click(Sender: TObject);
begin
  if BitBtn5.Tag = 0 then
    begin
      DM1.tUf.Cancel;
      DM1.tUf.Refresh;
      DBEdit1.Enabled := True;
      Habilitar;
    end;
  if BitBtn5.Tag = 1 then
    begin
      BitBtn3Click(Sender);
      Habilitar;
    end;  
end;

procedure TfUf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfUf.BitBtn6Click(Sender: TObject);
begin
  if DBEdit1.Text <> '' then
    begin
      if BitBtn6.Tag = 1 then
        begin
          DM1.tUf.Post;
          Habilitar;
        end;
      if BitBtn6.Tag = 0 then
        begin
          DM1.tUf.Post;
          DBEdit1.Enabled := True;
          Habilitar;
        end;
    end
  else
    begin
      ShowMessage('Sigla do estado faltando!');
      DBEdit1.SetFocus;
    end;
end;

procedure TfUf.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltUF.AsBoolean then
    begin
      BitBtn6.Tag := 0;
      BitBtn5.Tag := 0;
      DM1.tUf.Edit;
      Habilitar;
      DBEdit1.Enabled := False;
      DBEdit2.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfUf.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tUf.IndexFieldNames := 'Sigla';
end;

procedure TfUf.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tUF.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar esta UF antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfUf.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsUF.AsBoolean then
    begin
      BitBtn6.Tag := 1;
      BitBtn5.Tag := 1;
      DM1.tUf.Insert;
      Habilitar;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer Insersão!');
end;

procedure TfUf.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcUf.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este Estado?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        DM1.tUF.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfUf.DBEdit1Exit(Sender: TObject);
begin
  if BitBtn6.Tag = 1 then
    begin
      if DBEdit1.Text <> '' then
        begin
          tUFIns.IndexFieldNames := 'Sigla';
          tUFIns.SetKey;
          tUFInsSigla.AsString := DBEdit1.Text;
          if tUFIns.GotoKey then
            begin
              ShowMessage('Sigla já cadastrada!');
              DBEdit1.Clear;
              DBEdit1.SetFocus;
            end;
        end;
    end;
end;

procedure TfUf.FormShow(Sender: TObject);
begin
  DM1.tPais.Open;
  DM1.tUF.Open;
end;

end.
