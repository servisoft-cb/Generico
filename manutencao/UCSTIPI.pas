unit UCSTIPI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup;

type
  TfCSTIPI = class(TForm)
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
    tCSTIPIIns: TTable;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    tCSTIPIInsCodigo: TStringField;
    tCSTIPIInsNome: TStringField;
    DBCheckBox1: TDBCheckBox;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCSTIPI: TfCSTIPI;

implementation

uses UDM1, UDM2;

{$R *.DFM}

procedure TfCSTIPI.Habilita;
begin
  Panel2.Enabled := not (Panel2.Enabled);
  Panel4.Enabled := not (Panel4.Enabled);
  BitBtn1.Enabled := not (BitBtn1.Enabled);
  BitBtn2.Enabled := not (BitBtn2.Enabled);
  BitBtn3.Enabled := not (BitBtn3.Enabled);
  BitBtn4.Enabled := not (BitBtn4.Enabled);
  BitBtn5.Enabled := not (BitBtn5.Enabled);
  BitBtn6.Enabled := not (BitBtn6.Enabled);
  DBNavigator1.Enabled := not (DBNavigator1.Enabled);
end;

procedure TfCSTIPI.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfCSTIPI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tCSTIPI.Close;
  Action := Cafree;
end;

procedure TfCSTIPI.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsSitTrib.AsBoolean then
    begin
      DBEdit1.ReadOnly := False;
      BitBtn2.Tag := 0;                  
      tCSTIPIIns.IndexFieldNames  := 'Codigo';
      DM1.tCSTIPI.IndexFieldNames := 'Codigo';
      tCSTIPIIns.Refresh;
      tCSTIPIIns.Last;
      DM1.tCSTIPI.Refresh;
      DM1.tCSTIPI.Insert;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfCSTIPI.BitBtn5Click(Sender: TObject);
begin
  if DM1.tCSTIPICodigo.AsString = '' then
    begin
      ShowMessage('Código não pode ser em branco');
      exit;
    end;
  if DM1.tCSTIPINome.AsString = '' then
    begin
      ShowMessage('É obrigatório informar o nome!');
      exit;
    end;

  if (BitBtn2.Tag <> 1) and (tCSTIPIIns.Locate('Codigo', DM1.tCSTIPICodigo.AsString, [loCaseInsensitive])) then
    begin
      if tCSTIPIInsCodigo.AsString <> DM1.tCSTIPICodigo.AsString then
        begin
          ShowMessage('Código já lançado cadastrada!');
          exit;
        end;
    end;
  DM1.tCSTIPI.Post;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfCSTIPI.BitBtn4Click(Sender: TObject);
begin
  DM1.tCSTIPI.Cancel;
  Habilita;
end;

procedure TfCSTIPI.BitBtn2Click(Sender: TObject);
begin
  if DM1.tCSTIPICodigo.AsString = '' then
    begin
      ShowMessage('Código inexistente!');
      exit;
    end;

  if DM1.tUsuarioAltSitTrib.AsBoolean then
    begin
      DBEdit1.ReadOnly := True;
      DM1.tCSTIPI.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfCSTIPI.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcSitTrib.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation, [mbOk, mbNo], 0) = mrOk then
        DM1.tCSTIPI.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfCSTIPI.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tCSTIPI.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o registro antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfCSTIPI.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tCSTIPI.Refresh;
  DM1.tCSTIPI.IndexFieldNames := 'Codigo';
end;

procedure TfCSTIPI.FormShow(Sender: TObject);
begin
  DM1.tCSTIPI.Open;
  tCSTIPIIns.Open;
end;

end.
