unit UClasFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DBCtrls, StdCtrls, Buttons, ExtCtrls, Mask, Db, DBTables,
  RxLookup,  Grids, DBGrids, RXDBCtrl, SMDBGrid;

type
  TfClasFiscal = class(TForm)
    Panel5: TPanel;
    BitBtn5: TBitBtn;
    tClasFiscalIns: TTable;
    tClasFiscalInsClasFiscal: TStringField;
    qClasFiscal: TQuery;
    qsClasFiscal: TDataSource;
    qClasFiscalClasFiscal: TStringField;
    qClasFiscalNome: TStringField;
    SMDBGrid1: TSMDBGrid;
    Panel4: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit3: TDBEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Panel2: TPanel;
    BitBtn8: TBitBtn;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qClasFiscalAfterScroll(DataSet: TDataSet);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fClasFiscal: TfClasFiscal;

implementation

uses UDM1;

{$R *.DFM}

procedure TfClasFiscal.Habilita;
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
  SMDBGrid1.Enabled    := not(SMDBGrid1.Enabled);
end;

procedure TfClasFiscal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tClasFiscal.Close;
  qClasFiscal.Close;
  Action := Cafree;
end;

procedure TfClasFiscal.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsClasFiscal.AsBoolean then
    begin
      Habilita;
      DM1.tClasFiscal.IndexFieldNames := 'ClasFiscal';
      DM1.tClasFiscal.Insert;
      Dm1.tClasFiscalTipo.AsString := 'E';
      DbEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfClasFiscal.BitBtn5Click(Sender: TObject);
begin
  if Trim(DM1.tClasFiscalClasFiscal.AsString) = '' then
  begin
    ShowMessage('Não foi informado o código da classificação fiscal!');
    exit;
  end;
  try
    DM1.tClasFiscal.Post;
  except
    on E: Exception do
      ShowMessage('Não foi possível gravar, ' + E.Message + '! Clique para continuar!');
  end;

  qClasFiscal.Close;
  qClasFiscal.Open;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfClasFiscal.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltClasFiscal.AsBoolean then
    begin
      BitBtn2.Tag := 1;
      DM1.tClasFiscal.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfClasFiscal.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tClasFiscal.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tClasFiscal.Cancel;
  Habilita;
  BitBtn1.SetFocus;
  BitBtn2.Tag := 0;
end;

procedure TfClasFiscal.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfClasFiscal.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcClasFiscal.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
      begin
        DM1.tClasFiscal.Delete;
        qClasFiscal.Close;
        qClasFiscal.Open;
      end;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfClasFiscal.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TfClasFiscal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tClasFiscal.State in [dsEdit, dsInsert] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar a classificação fiscal antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfClasFiscal.qClasFiscalAfterScroll(DataSet: TDataSet);
begin
  Dm1.tClasFiscal.Locate('ClasFiscal',qClasFiscalClasFiscal.AsString,([LocaseInsensitive]));
end;

procedure TfClasFiscal.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  qClasFiscal.Locate('ClasFiscal',Dm1.tClasFiscalClasFiscal.AsString,([LocaseInsensitive]));
end;

procedure TfClasFiscal.FormShow(Sender: TObject);
begin
  DM1.tClasFiscal.Open;
  qClasFiscal.Open;
  if vCodClasFiscalPos <> '' then
    DM1.tClasFiscal.Locate('ClasFiscal',vCodClasFiscalPos,[loCaseInsensitive]);
end;

procedure TfClasFiscal.BitBtn8Click(Sender: TObject);
begin
  if DM1.tClasFiscalClasFiscal.AsInteger > 0 then
    vCodClasFiscalPos := DM1.tClasFiscalClasFiscal.AsString;
  Close;
end;

procedure TfClasFiscal.SMDBGrid1DblClick(Sender: TObject);
begin
  if BitBtn8.Visible then
    BitBtn8Click(Sender);
end;

end.
