unit UUnidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup;

type
  TfUnidade = class(TForm)
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
    BitBtn5: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    tUnidade2: TTable;
    tUnidade2Unidade: TStringField;
    tUnidade2Conversor: TFloatField;
    qVerifica: TQuery;
    qVerificaUnidade: TStringField;
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
  private
    vErro : Boolean;
    procedure Habilita;
    procedure Verifica_Unidade;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fUnidade: TfUnidade;

implementation

uses UDM1;

{$R *.DFM}

procedure TfUnidade.Verifica_Unidade;
begin
  vErro := False;
  qVerifica.Close;
  qVerifica.ParamByName('Unidade').AsString := DM1.tUnidadeUnidade.AsString;
  qVerifica.Open;

  qVerifica.Last;
  if (qVerifica.RecordCount > 0) and (qVerificaUnidade.AsString <> '') then
    begin
      ShowMessage('Unidade já foi usada, processo cancelado!');
      vErro := True;
    end;
end;

procedure TfUnidade.Habilita;
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

procedure TfUnidade.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfUnidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tUnidade.Close;
  Action := Cafree;
end;

procedure TfUnidade.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsUnidade.AsBoolean then
    begin
      DM1.tUnidade.Refresh;
      DM1.tUnidade.Insert;
      Habilita;
      DBEdit1.Enabled := True;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfUnidade.BitBtn5Click(Sender: TObject);
begin
  if DM1.tUnidadeUnidade.AsString = '' then
    ShowMessage('Falta informar a unidade!')
  else
    begin
      DM1.tUnidade.Post;
      BitBtn2.Tag := 0;
      Habilita;
      BitBtn1.SetFocus;
    end;
end;

procedure TfUnidade.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tUnidade.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tUnidade.Cancel;
  Habilita;
end;

procedure TfUnidade.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltUnidade.AsBoolean then
    begin
      Verifica_Unidade;
      if vErro then
        Exit;
      DM1.tUnidade.Edit;
      //DBEdit1.Enabled := False;
      BitBtn2.Tag     := 1;

      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfUnidade.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcUnidade.AsBoolean then
    begin
      Verifica_Unidade;
      if vErro then
        Exit;
      if MessageDlg('Deseja excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        DM1.tUnidade.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfUnidade.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tUnidade.State in [dsEdit, dsInsert] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o registro antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfUnidade.DBEdit1Exit(Sender: TObject);
begin
  if DBEdit1.Text <> '' then
    begin
      if DM1.tUnidade.State in [dsInsert] then
        begin
          tUnidade2.Refresh;
          if tUnidade2.Locate('Unidade',DBEdit1.Text,[loCaseInsensitive]) then
            begin
              ShowMessage('Unidade já cadastrada!');
              DBEdit1.Clear;
              DBEdit1.SetFocus;
            end;
        end;
    end;
end;

procedure TfUnidade.FormShow(Sender: TObject);
begin
  DM1.tUnidade.Open;
end;

end.
