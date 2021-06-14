unit URelNatOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfRelNatOper = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel14: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel15: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelNatOper: TfRelNatOper;

implementation

uses UDM1;

{$R *.DFM}

procedure TfRelNatOper.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelNatOper.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if Dm1.tNatOperacaoIcms.AsBoolean then
    QRLabel7.Caption := 'S'
  else
    QRLabel7.Caption := 'N';
  if Dm1.tNatOperacaoIpi.AsBoolean then
    QRLabel8.Caption := 'S'
  else
    QRLabel8.Caption := 'N';
  if Dm1.tNatOperacaoGeraDuplicata.AsBoolean then
    QRLabel9.Caption := 'S'
  else
    QRLabel9.Caption := 'N';
  if Dm1.tNatOperacaoSomaMercNF.AsBoolean then
    QRLabel10.Caption := 'S'
  else
    QRLabel10.Caption := 'N'
end;

end.
