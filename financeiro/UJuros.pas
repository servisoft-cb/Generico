unit UJuros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, RXLookup, Mask, Db, DBTables;

type
  TfJuros = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Panel4: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    tJuros: TTable;
    dsJuros: TDataSource;
    tJurosAno: TIntegerField;
    tJurosMes: TIntegerField;
    tJurosJuro: TFloatField;
    Panel5: TPanel;
    BitBtn6: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure Habilita;
  public
    { Public declarations }
  end;

var
  fJuros: TfJuros;

implementation

uses UDM1;

{$R *.DFM}

procedure TfJuros.Habilita;
begin
  Panel3.Enabled       := not(Panel3.Enabled);
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
end;

procedure TfJuros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tJuros.Close;
  Action := Cafree;
end;

procedure TfJuros.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tJuros.IndexFieldNames := 'Ano;Mes';
end;

procedure TfJuros.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tJuros.IndexFieldNames := 'Ano;Mes';
end;

procedure TfJuros.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfJuros.DBComboBox1Exit(Sender: TObject);
begin
  if DM1.tJuros.State in [dsInsert] then
    begin
      if (DM1.tJurosAno.AsInteger > 0) and (DM1.tJurosMes.AsInteger > 0) then
        begin
          tJuros.First;
          while not tJuros.EOF do
            begin
              tJuros.IndexFieldNames := 'Ano;Mes';
              tJuros.SetKey;
              tJurosAno.AsString := DBEdit1.Text;
              tJurosMes.AsString := DBComboBox1.Text;
              if tJuros.GotoKey then
                begin
                  ShowMessage('Já existe taxa de juros p/ esse período!');
                  BitBtn5.Click;
                  Break;
                end;
              tJuros.Next;
            end;
        end;
    end;
end;

procedure TfJuros.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsJuros.AsBoolean then
    begin
      DM1.tJuros.Insert;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfJuros.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltJuros.AsBoolean then
    begin
      DM1.tJuros.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfJuros.BitBtn5Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tJuros.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tJuros.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus; 
end;

procedure TfJuros.BitBtn6Click(Sender: TObject);
begin
  if (DM1.tJurosAno.AsInteger > 0) and (DM1.tJurosMes.AsInteger > 0) then
    begin
      DM1.tJuros.Post;
      BitBtn2.Tag := 0;
      Habilita;
      BitBtn1.SetFocus;
    end
  else
    ShowMessage('É obrigatório informar o mês e o ano!');
end;

procedure TfJuros.FormShow(Sender: TObject);
begin
  DM1.tJuros.Open;
  DM1.tJuros.Refresh;
  DM1.tJuros.Last;
end;

procedure TfJuros.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcJuros.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir esta taxa?',mtconfirmation,[mbok,mbno],0)=mrok then
        DM1.tJuros.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfJuros.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tJuros.State in [dsInsert,dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar este Juro de Mora antes de Fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

end.
