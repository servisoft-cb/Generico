unit UHistorico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DBCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  Db, DBTables, DBFilter, RxLookup;

type
  TfHistorico = class(TForm)
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
    tHistorico2: TTable;
    tHistorico2Codigo: TIntegerField;
    tHistorico2Nome: TStringField;
    DBRadioGroup1: TDBRadioGroup;
    tHistorico2Tipo: TStringField;
    RadioGroup1: TRadioGroup;
    RxDBFilter1: TRxDBFilter;
    RxDBFilter2: TRxDBFilter;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBFilter3: TRxDBFilter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RadioGroup1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fHistorico: TfHistorico;

implementation

uses UDM1, UContasPagarPag, UContasReceberPag, UCPagarAltera, UCReceberAltera;

{$R *.DFM}

procedure TfHistorico.Habilita;
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

procedure TfHistorico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  RxDBFilter2.Active := False;
  RxDBFilter3.Active := False;
  if Screen.FormCount < 3 then
    DM1.tHistorico.Close;
  Action := Cafree;
end;

procedure TfHistorico.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tHistorico.IndexFieldNames := 'Codigo';
end;

procedure TfHistorico.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsHistoricos.AsBoolean then
    begin
      RxDBFilter1.Active := False;
      RxDBFilter2.Active := False;
      RxDBFilter3.Active := False;
      tHistorico2.IndexFieldNames    := 'Codigo';
      DM1.tHistorico.IndexFieldNames := 'Codigo';
      tHistorico2.Refresh;
      tHistorico2.Last;
      DM1.tHistorico.Refresh;
      DM1.tHistorico.Insert;
      DM1.tHistoricoCodigo.AsInteger := tHistorico2Codigo.AsInteger + 1;
      DM1.tHistoricoTipo.AsString    := 'A';
      DM1.tHistorico.Post;
      DM1.tHistorico.Edit;
      Habilita;
      DBEdit1.Clear;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfHistorico.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltHistoricos.AsBoolean then
    begin
      DM1.tHistorico.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfHistorico.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tHistorico.Delete
  else
  if BitBtn2.tag = 1 then
    DM1.tHistorico.Cancel;
  BitBtn2.Tag := 0;
  habilita;
  BitBtn1.SetFocus;
end;

procedure TfHistorico.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcHistoricos.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        DM1.tHistorico.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfHistorico.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfHistorico.BitBtn5Click(Sender: TObject);
begin
  DM1.tHistorico.Post;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
  RadioGroup1Enter(Sender);
end;

procedure TfHistorico.RadioGroup1Enter(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : begin
          RxDBFilter1.Active := True;
          RxDBFilter2.Active := False;
          RxDBFilter3.Active := False;
        end;
    1 : begin
          RxDBFilter1.Active := False;
          RxDBFilter2.Active := True;
          RxDBFilter3.Active := False;
        end;
    2 : begin
          RxDBFilter1.Active := False;
          RxDBFilter2.Active := False;
          RxDBFilter3.Active := True;
        end;
    3 : begin
          RxDBFilter1.Active := False;
          RxDBFilter2.Active := False;
          RxDBFilter3.Active := False;
        end;
  end;
end;

procedure TfHistorico.FormShow(Sender: TObject);
var
  i : integer;
begin
  DM1.tHistorico.Open;

  for i := 0 to Screen.FormCount - 1 do
    begin
      if ((Screen.Forms[i] is TfContasPagarPag) and (fContasPagarPag.Showing)) or ((Screen.Forms[i] is TfCPagarAltera) and (fCPagarAltera.Showing)) then
        RadioGroup1.ItemIndex := 1
      else
      if ((Screen.Forms[i] is TfContasReceberPag) and (fContasReceberPag.Showing)) or ((Screen.Forms[i] is TfContasReceberPag) and (fCReceberAltera.Showing)) then
        RadioGroup1.ItemIndex := 0;
    end;
  case RadioGroup1.ItemIndex of
    0 : begin
          RxDBFilter1.Active := True;
          RxDBFilter2.Active := False;
          RxDBFilter3.Active := False;
        end;
    1 : begin
          RxDBFilter1.Active := False;
          RxDBFilter2.Active := True;
          RxDBFilter3.Active := False;
        end;
    2 : begin
          RxDBFilter1.Active := False;
          RxDBFilter2.Active := False;
          RxDBFilter3.Active := True;
        end;
    3 : begin
          RxDBFilter1.Active := False;
          RxDBFilter2.Active := False;
          RxDBFilter3.Active := False;
        end;
  end;

  tHistorico2.open;
  DM1.tHistorico.open;
  
end;

procedure TfHistorico.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tHistorico.State in [dsInsert,dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar este histórico antes de Fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfHistorico.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Codigo';
end;

procedure TfHistorico.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tHistorico.Refresh;
  DM1.tHistorico.IndexFieldNames := 'Nome';
end;

end.
