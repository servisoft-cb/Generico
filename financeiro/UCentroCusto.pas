unit UCentroCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Mask, Db, DBTables,
  RXLookup, Grids, DBGrids, RXDBCtrl, RXCtrls;

type
  TfCentroCusto = class(TForm)
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
    DBEdit1: TDBEdit;
    DBText1: TDBText;
    Label7: TLabel;
    tCentroCustoIns: TTable;
    RxDBGrid1: TRxDBGrid;
    Bevel1: TBevel;
    StaticText1: TStaticText;
    Edit1: TEdit;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn16: TBitBtn;
    tCentroCustoInsCodigo: TIntegerField;
    tCentroCustoInsNome: TStringField;
    qCentroCusto: TQuery;
    dsqCentroCusto: TDataSource;
    qCentroCustoCodigo: TIntegerField;
    qCentroCustoNome: TStringField;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Panel5Enter(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
  private
    { Private declarations }
    vCodItem : Integer;
    
    procedure Habilita;
    procedure Excluir_Registro;

  public
    { Public declarations }
  end;

var
  fCentroCusto: TfCentroCusto;

implementation

uses UDM1, UDMCentroCusto;

{$R *.DFM}

procedure TfCentroCusto.Habilita;
begin
  Panel3.Enabled  := not(Panel3.Enabled);
  Panel5.Enabled  := not(Panel5.Enabled);
  BitBtn1.Enabled := not(BitBtn1.Enabled);
  BitBtn2.Enabled := not(BitBtn2.Enabled);
  BitBtn3.Enabled := not(BitBtn3.Enabled);
  BitBtn4.Enabled := not(BitBtn4.Enabled);
  BitBtn5.Enabled := not(BitBtn5.Enabled);
end;

procedure TfCentroCusto.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfCentroCusto.BitBtn5Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    Excluir_Registro
  else
  if BitBtn2.Tag = 1 then
    DMCentroCusto.tCentroCusto.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfCentroCusto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DMCentroCusto.Owner.ClassName = Self.ClassName then
    FreeAndNil(DMCentroCusto);

  Action := Cafree;
end;

procedure TfCentroCusto.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if DM1.tUsuarioInsPlanoCtas.AsBoolean then
  begin
    vCodItem := 0;
    DMCentroCusto.tCentroCusto.IndexFieldNames := 'Codigo';
    DMCentroCusto.tCentroCusto.Refresh;
    DMCentroCusto.tCentroCusto.Last;
    vCodAux := DMCentroCusto.tCentroCustoCodigo.AsInteger;

    DMCentroCusto.tCentroCusto.Insert;
    DMCentroCusto.tCentroCustoCodigo.AsInteger := vCodAux + 1;
    DMCentroCusto.tCentroCusto.Post;
    DMCentroCusto.tCentroCusto.Edit;
    Habilita;
    DBEdit1.SetFocus;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfCentroCusto.BitBtn6Click(Sender: TObject);
begin
  if trim(DMCentroCusto.tCentroCustoNome.AsString) = '' then
  begin
    ShowMessage('Nome não informado!');
    exit;
  end;

  DMCentroCusto.tCentroCusto.Post;
  DMCentroCusto.tCentroCustoItem.Refresh;
  DMCentroCusto.tCentroCusto.Refresh;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfCentroCusto.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcPlanoCtas.AsBoolean then
  begin
    if MessageDlg('Deseja realmente excluir esta conta?',mtconfirmation,[mbok,mbno],0)=mrok then
      Excluir_Registro;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfCentroCusto.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltPlanoCtas.AsBoolean then
  begin
    vCodItem := 0;
    DMCentroCusto.tCentroCusto.Edit;
    BitBtn2.Tag := 1;
    Habilita;
    DBEdit1.SetFocus;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfCentroCusto.FormShow(Sender: TObject);
begin
  if not Assigned(DMCentroCusto) then
    DMCentroCusto := TDMCentroCusto.Create(Self);

  DMCentroCusto.tCentroCusto.Open;
  DMCentroCusto.tCentroCustoItem.Open;
  DMCentroCusto.tCentroCusto.Last;

  tCentroCustoIns.Open;
  
  vCodItem := 0;
end;

procedure TfCentroCusto.RxDBLookupCombo1Enter(Sender: TObject);
begin
  if qCentroCusto.Active then
    if RxDBLookupCombo1.Text <> '' then
      DMCentroCusto.tCentroCusto.Locate('Codigo',RxDBLookupCombo1.KeyValue,([Locaseinsensitive]));
end;

procedure TfCentroCusto.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DMCentroCusto.tCentroCusto.State in [dsEdit] then
  begin
    ShowMessage('Você deve Cancelar ou Confirmar esta operação!');
    CanClose := False;
  end
  else
    CanClose := True;
end;

procedure TfCentroCusto.BitBtn7Click(Sender: TObject);
begin
  if trim(Edit1.Text) = '' then
  begin
    ShowMessage('Falta informa a descrição do item!');
    exit;
  end;

  if vCodItem > 0 then
    if DMCentroCusto.tCentroCustoItem.FindKey([DMCentroCusto.tCentroCustoCodigo.AsInteger,vCodItem]) then
      DMCentroCusto.tCentroCustoItem.Edit;

  if DMCentroCusto.tCentroCustoItem.State in [dsBrowse] then
  begin
    DMCentroCusto.tCentroCustoItem.Last;
    if vCodItem <= 0 then
      vCodItem := DMCentroCusto.tCentroCustoItemCodItem.AsInteger + 1;
    DMCentroCusto.tCentroCustoItem.Insert;
    DMCentroCusto.tCentroCustoItemCodCentroCusto.AsInteger := DMCentroCusto.tCentroCustoCodigo.AsInteger;
    DMCentroCusto.tCentroCustoItemCodItem.AsInteger        := vCodItem;
  end;

  DMCentroCusto.tCentroCustoItemNomeItem.AsString := Edit1.Text;
  DMCentroCusto.tCentroCustoItem.Post;

  vCodItem := 0;
  Edit1.Clear;
  Edit1.SetFocus;
end;

procedure TfCentroCusto.BitBtn16Click(Sender: TObject);
begin
  if DMCentroCusto.tCentroCustoItemCodItem.AsInteger > 0 then
  begin
    vCodItem   := DMCentroCusto.tCentroCustoItemCodItem.AsInteger;
    Edit1.Text := DMCentroCusto.tCentroCustoItemNomeItem.AsString;
    Edit1.SetFocus;
  end;
end;

procedure TfCentroCusto.BitBtn8Click(Sender: TObject);
begin
  vCodItem := 0;
  Edit1.Clear;
end;

procedure TfCentroCusto.BitBtn9Click(Sender: TObject);
begin
  if DMCentroCusto.tCentroCustoItem.RecordCount > 0 then
  begin
    if MessageDlg('Deseja realmente excluir este item?',mtconfirmation,[mbok,mbno],0)=mrok then
      DMCentroCusto.tCentroCustoItem.Delete;
  end;
end;

procedure TfCentroCusto.Panel5Enter(Sender: TObject);
begin
  qCentroCusto.Close;
  qCentroCusto.Open;
end;

procedure TfCentroCusto.RxDBLookupCombo1Change(Sender: TObject);
begin
  if qCentroCusto.Active then
    if RxDBLookupCombo1.Text <> '' then
      DMCentroCusto.tCentroCusto.Locate('Codigo',RxDBLookupCombo1.KeyValue,([Locaseinsensitive]));
end;

procedure TfCentroCusto.Excluir_Registro;
begin
  DMCentroCusto.tCentroCustoItem.First;
  while not DMCentroCusto.tCentroCustoItem.Eof do
    DMCentroCusto.tCentroCustoItem.Delete;
  DMCentroCusto.tCentroCusto.Delete;
end;

end.
