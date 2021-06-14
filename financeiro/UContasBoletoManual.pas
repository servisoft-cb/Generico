unit UContasBoletoManual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Mask, Db, DBTables,
  RXLookup, ToolEdit, RXDBCtrl;

type
  TfContasBoletoManual = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit6: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Label10: TLabel;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fContasBoletoManual : TfContasBoletoManual;

implementation

uses UDM1;

{$R *.DFM}

procedure TfContasBoletoManual.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfContasBoletoManual.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.
