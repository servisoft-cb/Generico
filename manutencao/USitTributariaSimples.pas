unit USitTributariaSimples;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, Db, DbTables, RxLookup,
  DBFilter;

type
  TfSitTributariaSimples = class(TForm)
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
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    DBMemo1: TDBMemo;
    StaticText1: TStaticText;
    tSitTributariaIns: TTable;
    tSitTributariaInsCodigo: TIntegerField;
    tSitTributariaInsSitTributaria: TFloatField;
    tSitTributariaInsHistorico: TMemoField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Panel6: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    RxDBFilter1: TRxDBFilter;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSitTributariaSimples: TfSitTributariaSimples;

implementation

uses UDM1;

{$R *.DFM}

procedure TfSitTributariaSimples.Habilita;
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

procedure TfSitTributariaSimples.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tSitTributaria.Close;
  RxDBFilter1.Active := False;
  Action := Cafree;
end;

procedure TfSitTributariaSimples.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsSitTrib.AsBoolean then
    begin
      BitBtn2.Tag := 0;
      DM1.tSitTributaria.IndexFieldNames := 'Codigo';
      tSitTributariaIns.IndexFieldNames  := 'Codigo';
      tSitTributariaIns.Refresh;
      tSitTributariaIns.Last;
      DM1.tSitTributaria.Refresh;
      DM1.tSitTributaria.Insert;
      DM1.tSitTributariaCodigo.Asinteger      := tSitTributariaInsCodigo.AsInteger + 1;
      DM1.tSitTributariaTipo.AsString         := 'S';
      DM1.tSitTributariaNome.AsString         := '';
      DM1.tSitTributariaSitTributaria.AsFloat := 0;
      DM1.tSitTributaria.Post;
      DM1.tSitTributaria.Edit;
      Habilita;
      DBEdit2.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfSitTributariaSimples.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltSitTrib.AsBoolean then
    begin
      DM1.tSitTributaria.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit2.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfSitTributariaSimples.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tSitTributaria.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tSitTributaria.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfSitTributariaSimples.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfSitTributariaSimples.BitBtn5Click(Sender: TObject);
begin
  if Trim(DM1.tSitTributariaCodSit.AsString) = '' then
    begin
      ShowMessage('Você deve informar um "código de situação tributária" para confirmar!');
      exit;
    end;

  if Length(Trim(DM1.tSitTributariaCodSit.AsString)) < 3 then
    begin
      ShowMessage('Código da situação tributária inválido!');
      exit;
    end;

  if DM1.tSitTributariaNome.AsString <> '' then
  begin
    if copy(DM1.tSitTributariaCodSit.AsString,2,2) = '00' then
      DM1.tSitTributariaNome.AsString := 'Tributada integralmente'
    else
    if copy(DM1.tSitTributariaCodSit.AsString,2,2) = '10' then
      DM1.tSitTributariaNome.AsString := 'Tributada e com cobrança do ICMS por substituição tributária'
    else
    if copy(DM1.tSitTributariaCodSit.AsString,2,2) = '20' then
      DM1.tSitTributariaNome.AsString := 'Com redução de base de cálculo'
    else
    if copy(DM1.tSitTributariaCodSit.AsString,2,2) = '30' then
      DM1.tSitTributariaNome.AsString := 'Isenta ou não-tributada e com cobrança do ICMS por substituição tributária'
    else
    if copy(DM1.tSitTributariaCodSit.AsString,2,2) = '40' then
      DM1.tSitTributariaNome.AsString := 'Isenta'
    else
    if copy(DM1.tSitTributariaCodSit.AsString,2,2) = '41' then
      DM1.tSitTributariaNome.AsString := 'Não-tributada'
    else
    if copy(DM1.tSitTributariaCodSit.AsString,2,2) = '50' then
      DM1.tSitTributariaNome.AsString := 'Suspensão'
    else
    if copy(DM1.tSitTributariaCodSit.AsString,2,2) = '51' then
      DM1.tSitTributariaNome.AsString := 'Diferimento'
    else
    if copy(DM1.tSitTributariaCodSit.AsString,2,2) = '60' then
      DM1.tSitTributariaNome.AsString := 'ICMS cobrado anteriormente por substituição tributária'
    else
    if copy(DM1.tSitTributariaCodSit.AsString,2,2) = '70' then
      DM1.tSitTributariaNome.AsString := 'Com  redução  de  base  de  cálculo  e  cobrança  do  ICMS  por  substituição tributária'
    else
    if copy(DM1.tSitTributariaCodSit.AsString,2,2) = '90' then
      DM1.tSitTributariaNome.AsString := 'Outras';
  end;

  DM1.tSitTributaria.Post;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfSitTributariaSimples.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tSitTributaria.IndexFieldNames := 'Codigo';
end;

procedure TfSitTributariaSimples.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TfSitTributariaSimples.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tSitTributaria.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar a situação tributária antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfSitTributariaSimples.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcSitTrib.AsBoolean then
    begin
      if MessageDlg('Dejesa realmente excluir esta Sit. Tributária?',mtConfirmation,[mbOK,mbNo],0) = mrOK then
        DM1.tSitTributaria.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfSitTributariaSimples.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tSitTributaria.IndexFieldNames := 'CodSit;SitTributaria'
end;

procedure TfSitTributariaSimples.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tSitTributaria.IndexFieldNames := 'Codigo';
end;

procedure TfSitTributariaSimples.FormShow(Sender: TObject);
begin
  RxDBFilter1.Active := True;
  DM1.tSitTributaria.Open;
end;

end.
