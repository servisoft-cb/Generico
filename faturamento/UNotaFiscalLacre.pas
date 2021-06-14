unit UNotaFiscalLacre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RxLookup, ToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, Buttons,
  ExtCtrls, CurrEdit, Grids, DBGrids, SMDBGrid, DB;

type
  TfNotaFiscalLacre = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNotaFiscalLacre: TfNotaFiscalLacre;

implementation

uses UDM1, UDMNotaFiscal;

{$R *.dfm}

procedure TfNotaFiscalLacre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfNotaFiscalLacre.FormShow(Sender: TObject);
begin
  BitBtn1.Enabled := (DM1.tNotaFiscal.State in [dsEdit,dsInsert]);
  BitBtn3.Enabled := (DM1.tNotaFiscal.State in [dsEdit,dsInsert]);
end;

procedure TfNotaFiscalLacre.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfNotaFiscalLacre.BitBtn1Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('Nº Lacre não foi informado!');
    Exit;
  end;

  DMNotaFiscal.tNotaFiscalLacre.Last;
  vItemAux := DMNotaFiscal.tNotaFiscalLacreItem.AsInteger;

  DMNotaFiscal.tNotaFiscalLacre.Insert;
  DMNotaFiscal.tNotaFiscalLacreFilial.AsInteger  := DM1.tNotaFiscalFilial.AsInteger;
  DMNotaFiscal.tNotaFiscalLacreNumSeq.AsInteger  := DM1.tNotaFiscalNumSeq.AsInteger;
  DMNotaFiscal.tNotaFiscalLacreItem.AsInteger    := vItemAux + 1;
  DMNotaFiscal.tNotaFiscalLacreNumLacre.AsString := Edit1.Text;
  DMNotaFiscal.tNotaFiscalLacre.Post;

  Edit1.Clear;
  Edit1.SetFocus;
end;

procedure TfNotaFiscalLacre.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro?',mtWarning,[mbOK,mbNO],0) = mrNO then
    Exit;
  DMNotaFiscal.tNotaFiscalLacre.Delete;
end;

end.
