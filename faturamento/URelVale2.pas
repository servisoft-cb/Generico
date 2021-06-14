unit URelVale2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfRelVale2 = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRSysData4: TQRSysData;
    QRLabel14: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel13: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelVale2: TfRelVale2;

implementation

uses UDM1, UPrevVale;

{$R *.DFM}

procedure TfRelVale2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelVale2.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel2.Caption := 'Opção: ';
  case fPrevVale.RadioGroup1.ItemIndex of
    0 : QRLabel2.Caption := QRLabel2.Caption + ' Pendente';
    1 : QRLabel2.Caption := QRLabel2.Caption + ' Faturado';
    2 : QRLabel2.Caption := QRLabel2.Caption + ' Todos';
  end;
  if (fPrevVale.DateEdit1.Text <> '  /  /    ') and (fPrevVale.DateEdit2.Text <> '  /  /    ') then
    QRLabel2.Caption := QRLabel2.Caption + ' Período: ' + fPrevVale.DateEdit1.Text + ' a ' + fPrevVale.DateEdit2.Text;
  if fPrevVale.RxDBLookupCombo1.Text <> '' then
    QRLabel2.Caption := QRLabel2.Caption + '   Cliente: ' + fPrevVale.RxDBLookupCombo1.Text;
end;

procedure TfRelVale2.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel9.Caption := '';
  if (fPrevVale.qValeFaturado.AsBoolean) or (fPrevVale.qValeGeraCobranca.AsBoolean) then
    QRLabel9.Caption := 'Fat'
  else
    QRLabel9.Caption := 'Pend';
end;

end.
