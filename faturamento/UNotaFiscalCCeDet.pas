unit UNotaFiscalCCeDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, RXCtrls, StdCtrls, DBCtrls, ExtCtrls, Mask, Buttons, ToolEdit, RXDBCtrl,
  RzEdit, RzDBEdit, Grids, DBGrids, SMDBGrid, DB;

type
  TfNotaFiscalCCeDet = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    DBMemo1: TDBMemo;
    GroupBox2: TGroupBox;
    DBMemo2: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNotaFiscalCCeDet: TfNotaFiscalCCeDet;

implementation

uses UDMNFeFB;

{$R *.DFM}

procedure TfNotaFiscalCCeDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfNotaFiscalCCeDet.BitBtn2Click(Sender: TObject);
begin
  Close;
end;


end.
