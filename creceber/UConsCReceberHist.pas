unit UConsCReceberHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids, DBGrids, RXDBCtrl, ExtCtrls, StdCtrls, Buttons,
  Mask, DBCtrls;

type
  TfConsCReceberHist = class(TForm)
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
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText4: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText3: TDBText;
    Label7: TLabel;
    DBText5: TDBText;
    Label12: TLabel;
    DBText10: TDBText;
    Label13: TLabel;
    DBText11: TDBText;
    Label14: TLabel;
    DBText12: TDBText;
    Label15: TLabel;
    DBEdit3: TDBEdit;
    Label16: TLabel;
    DBEdit4: TDBEdit;
    Label17: TLabel;
    DBText13: TDBText;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsCReceberHist: TfConsCReceberHist;

implementation

Uses UDM1, UConsCReceberRem, URelReciboRec2;

{$R *.DFM}

procedure TfConsCReceberHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConsCReceberHist.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsCReceberHist.RxDBGrid3DblClick(Sender: TObject);
begin
  fConsCReceberRem := tfConsCReceberRem.Create(Self);
  fConsCReceberRem.ShowModal;
end;

procedure TfConsCReceberHist.BitBtn1Click(Sender: TObject);
begin
  if DM1.tCReceberParcHist.IsEmpty then
    exit;
  if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcHistVlrUltPgto.AsFloat)) <= 0 then
  begin
    ShowMessage('Para imprimir o recibo, posicione o cursor no registro do pagamento');
    exit;
  end;

  fRelReciboRec2 := TfRelReciboRec2.Create(Self);
  fRelReciboRec2.RLReport1.Preview;
  fRelReciboRec2.RLReport1.Free;
end;

end.
