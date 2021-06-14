unit UTipoCobranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Buttons, ExtCtrls, Db, DBTables, RxLookup,
  RxDBComb;

type
  TfTipoCobranca = class(TForm)
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
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    tTipoCobranca2: TTable;
    tTipoCobranca2Codigo: TIntegerField;
    tTipoCobranca2Nome: TStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    BitBtn7: TBitBtn;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    Label5: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTipoCobranca: TfTipoCobranca;

implementation

uses UDM1, UAtualizaDtVencto2;

{$R *.DFM}

procedure TfTipoCobranca.Habilita;
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

procedure TfTipoCobranca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tTipoCobranca.Close;
  Action := Cafree;
end;

procedure TfTipoCobranca.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tTipoCobranca.IndexFieldNames := 'Codigo';
end;

procedure TfTipoCobranca.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsTiposCobr.AsBoolean then
    begin
      tTipoCobranca2.IndexFieldNames     := 'Codigo';
      DM1.tTipoCobranca.IndexFieldNames := 'Codigo';
      tTipoCobranca2.Refresh;
      tTipoCobranca2.Last;
      DM1.tTipoCobranca.Refresh;
      DM1.tTipoCobranca.Insert;
      DM1.tTipoCobrancaCodigo.AsInteger     := tTipoCobranca2Codigo.AsInteger + 1;
      DM1.tTipoCobrancaDescontado.AsBoolean := False;
      DM1.tTipoCobrancaDeposito.AsBoolean   := False;
      DM1.tTipoCobrancaGeraBoleto.AsBoolean := False;
      DM1.tTipoCobranca.Post;
      DM1.tTipoCobranca.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfTipoCobranca.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltTiposCobr.AsBoolean then
    begin
      DM1.tTipoCobranca.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfTipoCobranca.BitBtn4Click(Sender: TObject);
begin
  If BitBtn2.Tag = 0 then
    DM1.tTipoCobranca.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tTipoCobranca.Cancel;
  BitBtn2.Tag := 0;
  habilita;
  BitBtn1.SetFocus;
end;

procedure TfTipoCobranca.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcTiposCobr.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        DM1.tTipoCobranca.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfTipoCobranca.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfTipoCobranca.BitBtn5Click(Sender: TObject);
begin
  DM1.tTipoCobranca.Post;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfTipoCobranca.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tTipoCobranca.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o tipo de cobrança antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfTipoCobranca.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tTipoCobranca.Refresh;
  DM1.tTipoCobranca.IndexFieldNames := 'Nome';
end;

procedure TfTipoCobranca.FormShow(Sender: TObject);
begin
  DM1.tTipoCobranca.Open;
end;

procedure TfTipoCobranca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
    BitBtn7.Visible := not(BitBtn7.Visible);
end;

procedure TfTipoCobranca.BitBtn7Click(Sender: TObject);
begin
  fAtualizaDtVencto2 := TfAtualizaDtVencto2.Create(Self);
  fAtualizaDtVencto2.ShowModal;
end;

end.
