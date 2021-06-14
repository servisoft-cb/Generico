unit UIndexador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Mask, Db, DBTables,
  RXLookup, Grids, DBGrids, RXDBCtrl, ToolEdit;

type
  TfIndexador = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel4: TPanel;
    BitBtn6: TBitBtn;
    Panel5: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    RxDBGrid1: TRxDBGrid;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    tIndexadorIns: TTable;
    tIndexadorInsData: TDateField;
    tIndexadorInsTaxa: TFloatField;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBDateEdit1Exit(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
  public
    { Public declarations }
  end;

var
  fIndexador: TfIndexador;

implementation

uses UDM1;

{$R *.DFM}

procedure TfIndexador.Habilita;
begin
  Panel3.Enabled       := not Panel3.Enabled;
  Panel5.Enabled       := not Panel5.Enabled;
  BitBtn1.Enabled      := not BitBtn1.Enabled;
  BitBtn2.Enabled      := not BitBtn2.Enabled;
  BitBtn3.Enabled      := not BitBtn3.Enabled;
  BitBtn4.Enabled      := not BitBtn4.Enabled;
  BitBtn5.Enabled      := not BitBtn5.Enabled;
  BitBtn6.Enabled      := not BitBtn6.Enabled;
  DBNavigator1.Enabled := not DBNavigator1.Enabled;
  RxDBGrid1.Enabled    := not RxDBGrid1.Enabled;
end;

procedure TfIndexador.BitBtn4Click(Sender: TObject);
begin
  DM1.tIndexador.Cancel;
  Close;
end;

procedure TfIndexador.BitBtn5Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tIndexador.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tIndexador.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  DBDateEdit1.Enabled := True;
  BitBtn1.SetFocus;
end;

procedure TfIndexador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tIndexador.Close;
  Action := Cafree;
end;

procedure TfIndexador.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsIndexador.AsBoolean then
    begin
      tIndexadorIns.Refresh;
      DM1.tIndexador.Insert;
      Habilita;
      DBDateEdit1.Enabled := True;
      DBDateEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfIndexador.BitBtn6Click(Sender: TObject);
begin
  if (DM1.tIndexadorData.AsString <> '') and (DM1.tIndexadorTaxa.AsCurrency > 0) then
    begin
      DM1.tIndexador.Post;
      BitBtn2.Tag := 0;
      Habilita;
      BitBtn1.SetFocus;
      DBDateEdit1.Enabled := True;
    end
  else
    begin
      ShowMessage('Data e Valor de Índice não podem ser vazios ou igual ou menor que "0"!');
      DBDateEdit1.SetFocus;
    end;
end;

procedure TfIndexador.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcIndexador.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este Índice?',mtconfirmation,
                [mbok,mbno],0) = mrok then
        DM1.tIndexador.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfIndexador.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltIndexador.AsBoolean then
    begin
      DM1.tIndexador.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBDateEdit1.Enabled := False;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfIndexador.FormShow(Sender: TObject);
begin
  DM1.tIndexador.Open;
  DM1.tIndexador.Refresh;
  DM1.tIndexador.Last;
end;

procedure TfIndexador.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tIndexador.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfIndexador.DBDateEdit1Exit(Sender: TObject);
begin
  try
    tIndexadorIns.SetKey;
    tIndexadorInsData.AsDateTime := DBDateEdit1.Date;
    if tIndexadorIns.GotoKey then
      begin
        ShowMessage('Já existe esta data gravada! Esta inserção será cancelada!');
        BitBtn5.Click;
      end;
  except
    ShowMessage('Verifique a data digitada!');
  end;
end;

procedure TfIndexador.RxDBLookupCombo1Change(Sender: TObject);
begin
  try
    DM1.tIndexador.FindKey([RxDBLookupCombo1.KeyValue]);
  except
  end;
end;

end.
