unit UConsCPagarHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls;

type
  TfConsCPagarHist = class(TForm)
    Panel1: TPanel;
    RxDBGrid3: TRxDBGrid;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText3: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsCPagarHist: TfConsCPagarHist;

implementation

Uses UDM1;

{$R *.DFM}

procedure TfConsCPagarHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConsCPagarHist.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

end.
