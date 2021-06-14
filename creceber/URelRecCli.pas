unit URelRecCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfRelRecCli = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel19: TQRLabel;
    QRExpr4: TQRExpr;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
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
  fRelRecCli: TfRelRecCli;

implementation

uses UPrevRecCli, UDM1;

{$R *.DFM}

procedure TfRelRecCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelRecCli.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if fPrevRecCli.RadioGroup2.ItemIndex = 0 then
    begin
      if fPrevRecCli.DateEdit2.Text = '  /  /    ' then
        begin
          QRLabel4.Caption := 'Até Dt.Emissão';
          QRLabel8.Enabled := False;
          QRLabel7.Enabled := False;
        end
      else
        begin
          QRLabel4.Caption := 'Dt.Emissão';
          QRLabel8.Enabled := True;
          QRLabel7.Enabled := True;
          QRLabel8.Caption := fPrevRecCli.DateEdit2.Text;
        end;
      QRLabel6.Enabled := True;
      QRLabel6.Caption := fPrevRecCli.DateEdit1.Text;
    end
  else
    begin
      Case fPrevRecCli.RadioGroup1.ItemIndex of
        0 : begin
              if fPrevRecCli.DateEdit2.Text = '  /  /    ' then
                begin
                  QRLabel4.Caption := 'A Vencer - Dt.Referência:';
                  QRLabel8.Enabled := False;
                  QRLabel7.Enabled := False;
                end
              else
                begin
                  QRLabel4.Caption := 'A Vencer';
                  QRLabel8.Enabled := True;
                  QRLabel7.Enabled := True;
                  QRLabel8.Caption := fPrevRecCli.DateEdit2.Text;
                end;
              QRLabel6.Enabled := True;
              QRLabel6.Caption := fPrevRecCli.DateEdit1.Text;
            end;
        1 : begin
              QRLabel4.Caption := 'Vencidas  até  ' + fPrevRecCli.DateEdit1.Text;
              QRLabel6.Enabled := False;
              QRLabel7.Enabled := False;
              QRLabel8.Enabled := False;
              //QRLabel8.Caption := fPrevRecCli.DateEdit1.Text;
            end;
      end;
    end;
  if fPrevRecCli.RadioGroup1.ItemIndex = 0 then
    QRLabel5.Caption := 'A Vencer'
  else
    QRLabel5.Caption := 'Vencidas';
end;

procedure TfRelRecCli.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if StrToFloat(FormatFloat('0.00',fPrevRecCli.tMemo1Valor.AsFloat)) > 0  then
    PrintBand := True
  else
    PrintBand := False;
end;

end.
