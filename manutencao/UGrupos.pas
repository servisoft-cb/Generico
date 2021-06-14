unit UGrupos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup,
  Grids, DBGrids, SMDBGrid, RxDBComb;

type
  TfGrupos = class(TForm)
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
    tGrupoIns: TTable;
    tGrupoInsCodigo: TIntegerField;
    tGrupoInsNome: TStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    RxDBLookupCombo9: TRxDBLookupCombo;
    SpeedButton5: TSpeedButton;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Bevel1: TBevel;
    StaticText1: TStaticText;
    Edit1: TEdit;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn16: TBitBtn;
    CheckBox1: TCheckBox;
    StaticText2: TStaticText;
    DBCheckBox1: TDBCheckBox;
    SMDBGrid1: TSMDBGrid;
    Label6: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
  private
    vItemGrupo : Integer;
    procedure Habilita;
    procedure Excluir_Registro;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGrupos: TfGrupos;

implementation

uses UDM1, USitTributaria, uIntegracao;

{$R *.DFM}

procedure TfGrupos.Excluir_Registro;
var
  vCodAux : Integer;
begin
  vCodAux := DM1.tGrupoCodigo.AsInteger;
  DM1.tGrupoItem.First;
  while not DM1.tGrupoItem.Eof do
    DM1.tGrupoItem.Delete;
  DM1.tGrupo.Delete;
  if DM1.tParametrosUsaFB.AsBoolean then
    Prc_Excluir_Grupo_FB(vCodAux);
end;

procedure TfGrupos.Habilita;
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

procedure TfGrupos.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tGrupo.Close;
      DM1.tGrupoItem.Close;
      DM1.tSitTributaria.Close;
    end;
  Action := Cafree;
end;

procedure TfGrupos.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsGrupos.AsBoolean then
    begin
      tGrupoIns.IndexFieldNames   := 'Codigo';
      DM1.tGrupo.IndexFieldNames := 'Codigo';
      tGrupoIns.Refresh;
      tGrupoIns.Last;
      DM1.tGrupo.Refresh;
      DM1.tGrupo.Insert;
      DM1.tGrupoCodigo.AsInteger :=  tGrupoInsCodigo.AsInteger + 1;
      DM1.tGrupo.Post;
      DM1.tGrupo.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfGrupos.BitBtn5Click(Sender: TObject);
begin
  DM1.tGrupo.Post;
  if DM1.tParametrosUsaFB.AsBoolean then
    Prc_Gravar_Grupo_FB(DM1.tGrupoCodigo.AsInteger);
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfGrupos.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    Excluir_Registro
  else
  if BitBtn2.Tag = 1 then
    DM1.tGrupo.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfGrupos.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltGrupos.AsBoolean then
    begin
      DM1.tGrupo.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfGrupos.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcGrupos.AsBoolean then
  begin
    if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
      Excluir_Registro;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfGrupos.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tGrupo.IndexFieldNames := 'Codigo';
end;

procedure TfGrupos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tGrupo.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o grupo antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfGrupos.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tGrupo.Refresh;
  DM1.tGrupo.IndexFieldNames := 'Nome';
end;

procedure TfGrupos.FormShow(Sender: TObject);
begin
  DM1.tGrupo.Open;
  DM1.tGrupoItem.Open;
  DM1.tSitTributaria.Open;
end;

procedure TfGrupos.SpeedButton5Click(Sender: TObject);
begin
  if DM1.tUsuarioSitTrib.AsBoolean then
    begin
      fSitTributaria := TfSitTributaria.Create(Self);
      fSitTributaria.ShowModal;
      DM1.tSitTributaria.Refresh;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de Sit.Tributaria!');
end;

procedure TfGrupos.BitBtn7Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
      ShowMessage('Falta informar a descrição do sub-grupo!');
      exit;
    end;

  DM1.tGrupoItem.Refresh;
  DM1.tGrupoItem.Last;
  if vItemGrupo > 0 then
    begin
      if DM1.tGrupoItem.Locate('CodSubGrupo',vItemGrupo,[loCaseInsensitive]) then
        DM1.tGrupoItem.Edit
      else
        vItemGrupo := 0;
    end;
  if vItemGrupo = 0 then
    begin
      DM1.tGrupoItem.Last;
      vItemGrupo := DM1.tGrupoItemCodSubGrupo.AsInteger + 1;
      DM1.tGrupoItem.Insert;
      DM1.tGrupoItemCodGrupo.AsInteger    := DM1.tGrupoCodigo.AsInteger;
      DM1.tGrupoItemCodSubGrupo.AsInteger := vItemGrupo;
    end;
  DM1.tGrupoItemNome.AsString     := Edit1.Text;
  DM1.tGrupoItemEstoque.AsBoolean := CheckBox1.Checked;
  DM1.tGrupoItem.Post;

  BitBtn8Click(Sender);
  Edit1.SetFocus;
end;

procedure TfGrupos.BitBtn8Click(Sender: TObject);
begin
  vItemGrupo := 0;
  Edit1.Clear;
end;

procedure TfGrupos.BitBtn16Click(Sender: TObject);
begin
  if DM1.tGrupoItemCodSubGrupo.AsInteger > 0 then
    begin
      vItemGrupo        := DM1.tGrupoItemCodSubGrupo.AsInteger;
      Edit1.Text        := DM1.tGrupoItemNome.AsString;
      CheckBox1.Checked := DM1.tGrupoItemEstoque.AsBoolean;
      Edit1.SetFocus;
    end;
end;

procedure TfGrupos.BitBtn9Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
    DM1.tGrupoItem.Delete;
end;

end.
