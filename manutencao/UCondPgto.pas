unit UCondPgto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, Grids, DBGrids,
  DBVGrids, RxLookup;

type
  TfCondPgto = class(TForm)
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
    tCondPgtoIns: TTable;
    tCondPgtoItemIns: TTable;
    GroupBox1: TGroupBox;
    VDBGrid1: TVDBGrid;
    tCondPgtoInsCodigo: TIntegerField;
    tCondPgtoInsNome: TStringField;
    tCondPgtoItemInsCodigo: TIntegerField;
    tCondPgtoItemInsItem: TIntegerField;
    tCondPgtoItemInsQtdDias: TSmallintField;
    DBRadioGroup1: TDBRadioGroup;
    tCondPgtoInsPrazoVista: TStringField;
    tCondPgtoInsCusto: TFloatField;
    tCondPgtoInsEntrada: TBooleanField;
    DBCheckBox1: TDBCheckBox;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn7: TBitBtn;
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
    procedure GroupBox1Enter(Sender: TObject);
    procedure VDBGrid1ColExit(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCondPgto: TfCondPgto;

implementation

uses UDM1;

{$R *.DFM}

procedure TfCondPgto.Habilita;
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

procedure TfCondPgto.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfCondPgto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tCondPgto.Close;
      DM1.tCondPgtoItem.Close;
    end;
  Action := Cafree;
end;

procedure TfCondPgto.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsCondPgto.AsBoolean then
    begin
      tCondPgtoIns.IndexFieldNames   := 'Codigo';
      DM1.tCondPgto.IndexFieldNames  := 'Codigo';
      tCondPgtoIns.Refresh;
      tCondPgtoIns.Last;
      DM1.tCondPgto.Refresh;
      DM1.tCondPgto.Insert;
      DM1.tCondPgtoCodigo.AsInteger  := tCondPgtoInsCodigo.AsInteger + 1;
      DM1.tCondPgtoEntrada.AsBoolean := False;
      DM1.tCondPgto.Post;
      DM1.tCondPgto.Edit;
      Habilita;
      DBEdit1.SetFocus;
      DM1.tCondPgtoPrazoVista.AsString := 'P';
      VDBGrid1.Enabled := True;
      DBCheckBox1.Enabled := True;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfCondPgto.BitBtn5Click(Sender: TObject);
begin
  if DM1.tCondPgtoItem.State in [dsInsert,dsEdit] then
    DM1.tCondPgtoItem.Post;
  if (DM1.tCondPgtoPrazoVista.AsString = 'P') and (DM1.tCondPgtoItem.RecordCount < 1) then
    ShowMessage('Falta informar os dias!')
  else
    begin
      DM1.tCondPgto.Post;
      Habilita;
      BitBtn2.Tag := 0;
      BitBtn1.SetFocus;
    end;
end;

procedure TfCondPgto.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tCondPgto.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tCondPgto.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfCondPgto.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltCondPgto.AsBoolean then
    begin
      DM1.tCondPgto.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfCondPgto.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcCondPgto.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        begin
          DM1.tCondPgtoItem.First;
          while not DM1.tCondPgtoItem.Eof do
            DM1.tCondPgtoItem.Delete;
          DM1.tCondPgto.Delete;
        end;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfCondPgto.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tCondPgto.IndexFieldNames := 'Codigo';
end;

procedure TfCondPgto.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tCondPgto.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar a cond.de pagto. antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfCondPgto.GroupBox1Enter(Sender: TObject);
begin
  Case DBRadioGroup1.ItemIndex of
    0 : begin
          VDBGrid1.Enabled := True;
          DBCheckBox1.Enabled := True;
          VDBGrid1.SetFocus;
        end;
    1 : begin
          VDBGrid1.Enabled := False;
          DBCheckBox1.Enabled := False;
          BitBtn5.SetFocus;
        end;
  end;
end;

procedure TfCondPgto.VDBGrid1ColExit(Sender: TObject);
begin
  if not (DM1.tCondPgtoItemQtdDias.AsInteger) > 0 then
    abort;
end;

procedure TfCondPgto.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tCondPgto.Refresh;
  DM1.tCondPgto.IndexFieldNames := 'Nome';
end;

procedure TfCondPgto.FormShow(Sender: TObject);
begin
  DM1.tCondPgto.Open;
  DM1.tCondPgtoItem.Open;
end;

procedure TfCondPgto.BitBtn7Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbOk, mbNo], 0) = mrOk then
    DM1.tCondPgtoItem.Delete;
end;

end.
