unit URelDuplicata;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, QuickRpt, Qrctrls, ValorPor, DB;

type
  TfRelDuplicata = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel19: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape17: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape18: TQRShape;
    QRLabel35: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    ValorPorExtenso1: TValorPorExtenso;
    QRDBText24: TQRDBText;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel41: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText3: TQRDBText;
    QRImage1: TQRImage;
    QRLabel46: TQRLabel;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1AfterPrint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    vNumCopias : Integer;
    vNumNota, vParcela : Integer;
  public
    { Public declarations }
  end;

var
  fRelDuplicata: TfRelDuplicata;

implementation

uses UDM1, UPrevDuplicatas;

{$R *.DFM}

procedure TfRelDuplicata.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel44.Caption := '';
  if DM1.tCidade.Locate('Codigo',DM1.tFilialCodCidade.AsInteger,[loCaseInsensitive]) then
    QRLabel44.Caption := DM1.tCidadeNome.AsString;

//aqui tem erro quando chama de outro form
  PrintBand := ((DM1.tCReceberParcParcCReceber.AsInteger >= fPrevDuplicatas.CurrencyEdit2.AsInteger) and (DM1.tCReceberParcParcCReceber.AsInteger <= fPrevDuplicatas.CurrencyEdit3.AsInteger));
  ValorPorExtenso1.Valor := DM1.tCReceberParcVlrParcCReceber.AsFloat;
  QRLabel36.Caption := Copy(ValorPorExtenso1.texto,1,75);
  QRLabel37.Caption := Copy(ValorPorExtenso1.texto,76,151);
  QRLabel38.Caption := Copy(ValorPorExtenso1.texto,152,227);
  QRLabel39.Caption := '';
  QRLabel40.Caption := '';
  QRLabel46.Caption := '';
  if DM1.tCliente.Locate('Codigo',DM1.tCReceberParcCodCli.AsInteger,[loCaseInsensitive]) then
  begin
    QRLabel39.Caption := DM1.tClientelkCidade.AsString;
    QRLabel40.Caption := DM1.tClientelkCidadeP.AsString;
    QRLabel46.Caption := '(' + DM1.tClienteDDDFone1.AsString + ') ' + DM1.tClienteTelefone.AsString;
  end;
  QRImage1.Picture := nil;
  if fPrevDuplicatas.CheckBox1.Checked then
  begin
    if FileExists(DM1.tFilialEndLogo.AsString) Then
      QRImage1.Picture.LoadFromFile(Dm1.tFilialEndLogo.AsString);
  end;
  QRLabel7.Caption := UpperCase(fPrevDuplicatas.ComboBox1.Text);

end;

procedure TfRelDuplicata.QuickRep1AfterPrint(Sender: TObject);
begin
  fPrevDuplicatas.Grava_Historico;
end;

procedure TfRelDuplicata.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelDuplicata.FormCreate(Sender: TObject);
begin
  vNumCopias := 0;
end;

end.
