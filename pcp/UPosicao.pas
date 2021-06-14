unit UPosicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup,
  DBFilter;

type
  TfPosicao = class(TForm)
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
    qPosicao: TQuery;
    dsqPosicao: TDataSource;
    qPosicaoCodigo: TIntegerField;
    qPosicaoNome: TStringField;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel2Enter(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
  private
    { Private declarations }
    vExcluir : Boolean;
    
    procedure Habilita;
    procedure Excluir_Registro;
    
  public
    { Public declarations }
  end;

var
  fPosicao: TfPosicao;

implementation

uses UDM1, UDM2, uIntegracao;

{$R *.DFM}

procedure TfPosicao.Habilita;
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

procedure TfPosicao.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfPosicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DM1.tPosicao.State in [dsEdit,dsInsert] then
    DM1.tPosicao.Cancel;
  qPosicao.Close;
  if Screen.FormCount < 3 then
    DM1.tPosicao.Close;
  Action := Cafree;
end;

procedure TfPosicao.BitBtn1Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  if DM1.tUsuarioInsPosicao.AsBoolean then
    begin
      qPosicao.Close;
      qPosicao.Open;
      BitBtn2.Tag := 0;
      DM1.tPosicao.IndexFieldNames := 'Codigo';
      DM1.tPosicao.Refresh;
      DM1.tPosicao.Last;
      vItemAux := DM1.tPosicaoCodigo.AsInteger;
      DM1.tPosicao.Insert;
      DM1.tPosicaoCodigo.AsInteger :=  vItemAux + 1;
      DM1.tPosicao.Post;
      DM1.tPosicao.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfPosicao.BitBtn5Click(Sender: TObject);
begin
  if DM1.tPosicaoNome.AsString = '' then
    Raise Exception.Create('É obrigatório informar o nome!');

  DM1.tPosicao.Post;

  if DM1.tParametrosUsaFB.AsBoolean then
    Prc_Gravar_Posicao_FB(DM1.tPosicaoCodigo.AsInteger);

  DM1.tPosicao.Refresh;

  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfPosicao.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    Excluir_Registro
  else
  if BitBtn2.Tag = 1 then
    DM1.tPosicao.Cancel;
  Habilita;
end;

procedure TfPosicao.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltPosicao.AsBoolean then
    begin
      qPosicao.Close;
      qPosicao.Open;
      DM1.tPosicao.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfPosicao.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcPosicao.AsBoolean then
    begin
      vExcluir := True;
      if (vExcluir) and (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk) then
        Excluir_Registro;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfPosicao.DBEdit1Exit(Sender: TObject);
begin
  if DBEdit1.Text <> '' then
    begin
      if qPosicao.Locate('Nome',DM1.tPosicaoNome.AsString,[loCaseInsensitive]) then
        begin
          if qPosicaoCodigo.AsInteger <> DM1.tPosicaoCodigo.AsInteger then
            begin
              ShowMessage('Descrição já cadastrada!');
              DM1.tPosicaoNome.Clear;
              DBEdit1.SetFocus;
            end;
        end;
    end;
end;

procedure TfPosicao.FormShow(Sender: TObject);
begin
  if not DM1.tPosicao.Active then
    DM1.tPosicao.Open;
  DBCheckBox1.Visible := DM1.tParametrosUsaPedAmostra.AsBoolean;
end;

procedure TfPosicao.Panel2Enter(Sender: TObject);
begin
  qPosicao.Close;
  qPosicao.Open;
end;

procedure TfPosicao.RxDBLookupCombo1Change(Sender: TObject);
begin
  if (RxDBLookupCombo1.Text <> '') and (DM1.tPosicao.State in [dsBrowse])  then
    DM1.tPosicao.Locate('Codigo',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
end;

procedure TfPosicao.Excluir_Registro;
var
  vCodAux : Integer;
begin
  vCodAux := DM1.tPosicaoCodigo.AsInteger;
  DM1.tPosicao.Delete;

  if DM1.tParametrosUsaFB.AsBoolean then
    Prc_Excluir_Posicao_FB(vCodAux);
end;

end.
