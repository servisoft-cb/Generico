unit UNotaFiscalReboque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RxLookup, ToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, Buttons,
  ExtCtrls, CurrEdit, Grids, DBGrids, SMDBGrid, DB;

type
  TfNotaFiscalReboque = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNotaFiscalReboque: TfNotaFiscalReboque;

implementation

uses UDM1, UDMNotaFiscal;

{$R *.dfm}

procedure TfNotaFiscalReboque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfNotaFiscalReboque.FormShow(Sender: TObject);
begin
  BitBtn1.Enabled := (DM1.tNotaFiscal.State in [dsEdit,dsInsert]);
  BitBtn3.Enabled := (DM1.tNotaFiscal.State in [dsEdit,dsInsert]);
end;

procedure TfNotaFiscalReboque.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfNotaFiscalReboque.BitBtn1Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  if (Edit1.Text = '') or (RxDBLookupCombo1.Text = '') then
  begin
    ShowMessage('Placa ou Estado não informado!');
    Exit;
  end;

  DMNotaFiscal.tNotaFiscalReboque.Last;
  vItemAux := DMNotaFiscal.tNotaFiscalReboqueItem.AsInteger;

  DMNotaFiscal.tNotaFiscalReboque.Insert;
  DMNotaFiscal.tNotaFiscalReboqueFilial.AsInteger := DM1.tNotaFiscalFilial.AsInteger;
  DMNotaFiscal.tNotaFiscalReboqueNumSeq.AsInteger := DM1.tNotaFiscalNumSeq.AsInteger;
  DMNotaFiscal.tNotaFiscalReboqueItem.AsInteger   := vItemAux + 1;
  DMNotaFiscal.tNotaFiscalReboquePlaca.AsString   := Edit1.Text;
  DMNotaFiscal.tNotaFiscalReboqueUF.AsString      := RxDBLookupCombo1.Text;
  DMNotaFiscal.tNotaFiscalReboqueRNTC.AsString    := Edit3.Text;
  DMNotaFiscal.tNotaFiscalReboque.Post;

  Edit1.Clear;
  Edit3.Clear;
  RxDBLookupCombo1.ClearValue;
  Edit1.SetFocus;
end;

procedure TfNotaFiscalReboque.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tUf.IndexFieldNames := 'Sigla';
end;

procedure TfNotaFiscalReboque.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o reboque?',mtWarning,[mbOK,mbNO],0) = mrNO then
    Exit;
  DMNotaFiscal.tNotaFiscalReboque.Delete;
end;

end.
