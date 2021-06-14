unit UNotaFiscalImp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, ToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, Buttons,
  ExtCtrls, CurrEdit, Grids, DBGrids, SMDBGrid, DB, RzPanel, RxDBComb;

type
  TfNotaFiscalImp = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Panel2: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Edit2: TEdit;
    Label8: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn6: TBitBtn;
    SpeedButton9: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SMDBGrid1: TSMDBGrid;
    BitBtn3: TBitBtn;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    CurrencyEdit2: TCurrencyEdit;
    Label13: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox2: TRxDBComboBox;
    Label18: TLabel;
    Label14: TLabel;
    DBEdit6: TDBEdit;
    gbxVendedor: TRzGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RzGroupBox1: TRzGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit7: TDBEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label4: TLabel;
    DBDateEdit2: TDBDateEdit;
    Label17: TLabel;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Panel2Enter(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure RxDBComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNotaFiscalImp: TfNotaFiscalImp;

implementation

uses UDM1, UDMNotaFiscal;

{$R *.dfm}

procedure TfNotaFiscalImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfNotaFiscalImp.FormShow(Sender: TObject);
begin
  if not DMNotaFiscal.tNotaFiscalImp.Active then
    DMNotaFiscal.tNotaFiscalImp.Open;
  if DMNotaFiscal.tNotaFiscalImp.IsEmpty then
    begin
      DMNotaFiscal.tNotaFiscalImp.Insert;
      DMNotaFiscal.tNotaFiscalImpFilial.AsInteger := DM1.tFilialCodigo.AsInteger;
      DMNotaFiscal.tNotaFiscalImpNumSeq.AsInteger := DM1.tNotaFiscalNumSeq.AsInteger;
      DMNotaFiscal.tNotaFiscalImpItem.AsInteger   := 1;
    end
  else
    DMNotaFiscal.tNotaFiscalImp.Edit;
end;

procedure TfNotaFiscalImp.BitBtn2Click(Sender: TObject);
begin
  if DMNotaFiscal.tNotaFiscalImp.State in [dsEdit] then
    DMNotaFiscal.tNotaFiscalImp.Cancel;
  if DMNotaFiscal.tNotaFiscalImp.State in [dsInsert] then
    begin
      DMNotaFiscal.tNotaFiscalImpAdicao.First;
      while not DMNotaFiscal.tNotaFiscalImpAdicao.Eof do
        DMNotaFiscal.tNotaFiscalImpAdicao.Delete;
      DMNotaFiscal.tNotaFiscalImp.Cancel;
    end;
  Close;
end;

procedure TfNotaFiscalImp.BitBtn1Click(Sender: TObject);
begin
  if Trim(DMNotaFiscal.tNotaFiscalImpNumDI.AsString) = '' then
    begin
      ShowMessage('É obrigatório informar o número do documento!');
      exit;
    end;
  DMNotaFiscal.tNotaFiscalImp.Post;
end;

procedure TfNotaFiscalImp.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCidade.IndexFieldNames := 'Nome';
end;

procedure TfNotaFiscalImp.BitBtn6Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  if CurrencyEdit2.AsInteger < 0 then
    begin
      ShowMessage('Falta informar o número da adição!');
      exit;
    end;
  DMNotaFiscal.tNotaFiscalImpAdicao.Last;
  vItemAux := DMNotaFiscal.tNotaFiscalImpAdicaoItemAdicao.AsInteger;
  DMNotaFiscal.tNotaFiscalImpAdicao.Insert;
  DMNotaFiscal.tNotaFiscalImpAdicaoNumSeq.AsInteger        := DMNotaFiscal.tNotaFiscalImpNumSeq.AsInteger;
  DMNotaFiscal.tNotaFiscalImpAdicaoItemImp.AsInteger       := DMNotaFiscal.tNotaFiscalImpItem.AsInteger;
  DMNotaFiscal.tNotaFiscalImpAdicaoItemAdicao.AsInteger    := vItemAux + 1;
  DMNotaFiscal.tNotaFiscalImpAdicaoNumAdicao.AsInteger     := CurrencyEdit2.AsInteger;
  DMNotaFiscal.tNotaFiscalImpAdicaoCodFabricante.AsString  := Edit2.Text;
  DMNotaFiscal.tNotaFiscalImpAdicaoValorDescontoDI.AsFloat := CurrencyEdit1.Value;
  DMNotaFiscal.tNotaFiscalImpAdicaoNUM_DRAWBACK.AsString   := Edit1.Text;
  DMNotaFiscal.tNotaFiscalImpAdicao.Post;

  Edit2.Clear;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit1.SetFocus;
end;

procedure TfNotaFiscalImp.Panel2Enter(Sender: TObject);
begin
  if DMNotaFiscal.tNotaFiscalImp.IsEmpty then
    begin
      ShowMessage('Não foi confirmado os dados da importação!');
      DBEdit1.SetFocus;
    end;
  if DMNotaFiscal.tNotaFiscalImpNumDI.AsString = '' then
    begin
      ShowMessage('Não foi informado o número da importação DI!');
      DBEdit1.SetFocus;
    end;
end;

procedure TfNotaFiscalImp.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir os dados da importação?',mtWarning,[mbOK,mbNO],0) = mrNO then
    exit;
  DMNotaFiscal.tNotaFiscalImpAdicao.First;
  while not DMNotaFiscal.tNotaFiscalImpAdicao.Eof do
    DMNotaFiscal.tNotaFiscalImpAdicao.Delete;
  DMNotaFiscal.tNotaFiscalImp.Delete;
end;

procedure TfNotaFiscalImp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DMNotaFiscal.tNotaFiscalImp.State in [dsEdit, dsInsert] then
    DMNotaFiscal.tNotaFiscalImp.Cancel;
end;

procedure TfNotaFiscalImp.SpeedButton23Click(Sender: TObject);
begin
  if DMNotaFiscal.tNotaFiscalImpAdicao.IsEmpty then
    exit;
  CurrencyEdit2.AsInteger := DMNotaFiscal.tNotaFiscalImpAdicaoNumAdicao.AsInteger;
  Edit2.Text              := DMNotaFiscal.tNotaFiscalImpAdicaoCodFabricante.AsString;
  CurrencyEdit1.Value     := DMNotaFiscal.tNotaFiscalImpAdicaoValorDescontoDI.AsFloat;
  Edit1.Text              := DMNotaFiscal.tNotaFiscalImpAdicaoNUM_DRAWBACK.AsString;
  DMNotaFiscal.tNotaFiscalImpAdicao.Delete;
  CurrencyEdit2.SetFocus;
end;

procedure TfNotaFiscalImp.SpeedButton9Click(Sender: TObject);
begin
  if DMNotaFiscal.tNotaFiscalImpAdicao.IsEmpty then
    exit;
  if MessageDlg('Deseja excluir o registro selecionado?',mtWarning,[mbOK,mbNO],0) = mrNO then
    exit;

  DMNotaFiscal.tNotaFiscalImpAdicao.Delete;
end;

procedure TfNotaFiscalImp.RxDBComboBox1Change(Sender: TObject);
begin
  Label14.Visible := (RxDBComboBox1.ItemIndex = 0);
  DBEdit6.Visible := (RxDBComboBox1.ItemIndex = 0);
end;

end.
