unit URelNotasEnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TfRelNotasEnt = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel17: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel18: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape3: TQRShape;
    QRLabel12: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel23: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape4: TQRShape;
    QuickRep2: TQuickRep;
    DetailBand2: TQRBand;
    PageHeaderBand2: TQRBand;
    SummaryBand2: TQRBand;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel39: TQRLabel;
    QRExpr1: TQRExpr;
    ChildBand1: TQRChildBand;
    QRLabel40: TQRLabel;
    QRExpr2: TQRExpr;
    QRShape9: TQRShape;
    ChildBand2: TQRChildBand;
    QRLabel41: TQRLabel;
    QRShape10: TQRShape;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    vVlrTotal, vTotalProduto : Real;
    vQtdTotal : Real;
    vQtdProduto : Real;
  public
    { Public declarations }
  end;

var
  fRelNotasEnt: TfRelNotasEnt;

implementation

uses UDM1, UPrevNotasEnt, DB;

{$R *.dfm}

procedure TfRelNotasEnt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelNotasEnt.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel1.Caption := 'Relatório de Notas Fiscais de Entrada por Material - ' + fPrevNotasEnt.DateEdit1.Text + ' a ' + fPrevNotasEnt.DateEdit2.Text;
  if fPrevNotasEnt.RxDBLookupCombo1.Text <> '' then
    QRLabel10.Caption := fPrevNotasEnt.RxDBLookupCombo1.Text
  else
    QRLabel10.Caption := 'Todas';
  QRLabel19.Caption := '';
  if fPrevNotasEnt.RxDBLookupCombo2.Text <> '' then
    QRLabel19.Caption := 'Fornecedor: ' + fPrevNotasEnt.RxDBLookupCombo2.Text + '   ';
  if fPrevNotasEnt.RxDBLookupCombo3.Text <> '' then
    QRLabel19.Caption := QRLabel19.Caption + 'Produto: ' + fPrevNotasEnt.RxDBLookupCombo3.Text + '   ';

{  if fPrevNotasEnt.RxDBLookupCombo4.Text <> '' then
    QRLabel19.Caption := QRLabel19.Caption + 'Cor: ' + fPrevNotasEnt.RxDBLookupCombo4.Text + '   ';

  if fPrevNotasEnt.RxDBLookupCombo5.Text <> '' then
    QRLabel19.Caption := QRLabel19.Caption + 'Tam: ' + fPrevNotasEnt.RxDBLookupCombo5.Text + '   ';
}
end;

procedure TfRelNotasEnt.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vVlrDescAux : Real;
  vVlrTotalAux : Real;
  vQtdAux : Real;
begin
  vVlrDescAux  := 0;
  vVlrTotalAux := fPrevNotasEnt.qProdutosFatVlrTotal.AsFloat ;

  if fPrevNotasEnt.qProdutosFatPercDesc.AsFloat > 0 then
    begin
      vVlrDescAux  := StrToFloat(FormatFloat('0.00',(fPrevNotasEnt.qProdutosFatVlrTotal.AsFloat * fPrevNotasEnt.qProdutosFatPercDesc.AsFloat) / 100));
      vVlrTotalAux := StrToFloat(FormatFloat('0.00',fPrevNotasEnt.qProdutosFatVlrTotal.AsFloat - vVlrDescAux));
      vVlrDescAux  := vVlrDescAux + fPrevNotasEnt.qProdutosFatVlrDescontoItem.AsFloat;
    end;
  QRLabel14.Caption := FormatFloat('###,###,##0.00',vVlrTotalAux);
  QRLabel21.Caption := FormatFloat('0.00',vVlrDescAux);

  QRLabel20.Caption := FormatFloat('0.00',fPrevNotasEnt.qProdutosFatPercDesc.AsFloat + fPrevNotasEnt.qProdutosFatPercDescItem.AsFloat);

  vVlrTotal     := vVlrTotal + vVlrTotalAux;
  vTotalProduto := vTotalProduto + vVlrTotalAux;

  vQtdAux := fPrevNotasEnt.qProdutosFatQtd.AsFloat;
  if (DM1.tUnidade.Locate('Unidade',fPrevNotasEnt.qProdutosFatUnidade.AsString,([LocaseInsensitive]))) and
     (DM1.tUnidadeConversor.AsFloat > 0) then
    vQtdAux := vQtdAux * DM1.tUnidadeConversor.AsFloat;
  QRLabel46.Caption := FormatFloat('###,###,##0.00000', vQtdAux);
  vQtdProduto := vQtdProduto + vQtdAux;
  vQtdTotal   := vQtdTotal + vQtdAux;

  {fPrevNotasEnt.mAcumulado.SetKey;
  fPrevNotasEnt.mAcumuladoCodProduto.AsInteger := fPrevNotasEnt.qProdutosFatCodProduto.AsInteger;
  fPrevNotasEnt.mAcumuladoCodCor.AsInteger     := fPrevNotasEnt.qProdutosFatCodCor.AsInteger;
  fPrevNotasEnt.mAcumuladoTamanho.AsString     := fPrevNotasEnt.qProdutosFatTamanho.AsString;
  fPrevNotasEnt.mAcumuladoUnidade.AsString     := fPrevNotasEnt.qProdutosFatUnidade.AsString;
  if fPrevNotasEnt.mAcumulado.GotoKey then
    fPrevNotasEnt.mAcumulado.Edit
  else
    begin
      fPrevNotasEnt.mAcumulado.Insert;
      fPrevNotasEnt.mAcumuladoCodProduto.AsInteger := fPrevNotasEnt.qProdutosFatCodProduto.AsInteger;
      fPrevNotasEnt.mAcumuladoCodCor.AsInteger     := fPrevNotasEnt.qProdutosFatCodCor.AsInteger;
      fPrevNotasEnt.mAcumuladoTamanho.AsString     := fPrevNotasEnt.qProdutosFatTamanho.AsString;
      fPrevNotasEnt.mAcumuladoUnidade.AsString     := fPrevNotasEnt.qProdutosFatUnidade.AsString;
    end;
  fPrevNotasEnt.mAcumuladoReferencia.AsString  := fPrevNotasEnt.qProdutosFatReferencia.AsString;
  fPrevNotasEnt.mAcumuladoNomeProduto.AsString := fPrevNotasEnt.qProdutosFatNome.AsString;
  fPrevNotasEnt.mAcumuladoNomeCor.AsString     := fPrevNotasEnt.qProdutosFatlkNomeCor.AsString;
  fPrevNotasEnt.mAcumuladoQtd.AsFloat          := fPrevNotasEnt.mAcumuladoQtd.AsFloat + fPrevNotasEnt.qProdutosFatQtd.AsFloat;
  fPrevNotasEnt.mAcumuladoVlrTotal.AsFloat     := StrToFloat(FormatFloat('0.00',fPrevNotasEnt.mAcumuladoVlrTotal.AsFloat + vVlrTotalAux));
  fPrevNotasEnt.mAcumulado.Post;}
end;

procedure TfRelNotasEnt.FormCreate(Sender: TObject);
begin
  vVlrTotal     := 0;
  vQtdTotal     := 0;
  vTotalProduto := 0;
  vQtdProduto   := 0;
end;

procedure TfRelNotasEnt.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel26.Caption := FormatFloat('###,###,##0.00',vVlrTotal);
  vVlrTotal         := 0;
  QRLabel42.Caption := FormatFloat('###,###,##0.00000',vQtdTotal);
  vQtdTotal         := 0;
end;

procedure TfRelNotasEnt.PageHeaderBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel24.Caption := 'Relatório de Notas Fiscais de Entrada por Material (Acumulado) - ' + fPrevNotasEnt.DateEdit1.Text + ' a ' + fPrevNotasEnt.DateEdit2.Text;
  if fPrevNotasEnt.RxDBLookupCombo1.Text <> '' then
    QRLabel29.Caption := fPrevNotasEnt.RxDBLookupCombo1.Text
  else
    QRLabel29.Caption := 'Todas';
  QRLabel31.Caption := '';
  if fPrevNotasEnt.RxDBLookupCombo2.Text <> '' then
    QRLabel31.Caption := 'Fornecedor: ' + fPrevNotasEnt.RxDBLookupCombo2.Text + '   ';
  if fPrevNotasEnt.RxDBLookupCombo3.Text <> '' then
    QRLabel31.Caption := QRLabel31.Caption + 'Produto: ' + fPrevNotasEnt.RxDBLookupCombo3.Text + '   ';

{  if fPrevNotasEnt.RxDBLookupCombo4.Text <> '' then
    QRLabel31.Caption := QRLabel31.Caption + 'Cor: ' + fPrevNotasEnt.RxDBLookupCombo4.Text + '   ';
  if fPrevNotasEnt.RxDBLookupCombo5.Text <> '' then
    QRLabel31.Caption := QRLabel31.Caption + 'Tam: ' + fPrevNotasEnt.RxDBLookupCombo5.Text + '   ';
}

end;

procedure TfRelNotasEnt.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vCodProd : Integer;
begin
  vCodProd := fPrevNotasEnt.mAcumuladoCodProduto.AsInteger;
  if fPrevNotasEnt.mAcumulado.Eof then
    PrintBand := True
  else
    begin
      fPrevNotasEnt.mAcumulado.Next;
      if fPrevNotasEnt.mAcumulado.Eof then
        PrintBand := True
      else
      if fPrevNotasEnt.mAcumuladoCodProduto.AsInteger <> vCodProd then
        begin
          PrintBand := True;
          fPrevNotasEnt.mAcumulado.Prior;
        end
      else
        begin
          PrintBand := False;
          fPrevNotasEnt.mAcumulado.Prior;
        end;
    end;
  if PrintBand then
    begin
      QRLabel44.Caption := FormatFloat('###,###,###,##0.00000',vQtdProduto);
      vQtdProduto       := 0;
    end;


end;

procedure TfRelNotasEnt.ChildBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  QRExpr2.ResetAfterPrint := True;
end;

procedure TfRelNotasEnt.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vCodProd : Integer;
begin
  vCodProd := fPrevNotasEnt.qProdutosFatCodProduto.AsInteger;
  if fPrevNotasEnt.qProdutosFat.Eof then
    PrintBand := True
  else
    begin
      fPrevNotasEnt.qProdutosFat.Next;
      if fPrevNotasEnt.qProdutosFat.Eof then
        PrintBand := True
      else
      if fPrevNotasEnt.qProdutosFatCodProduto.AsInteger <> vCodProd then
        begin
          PrintBand := True;
          fPrevNotasEnt.qProdutosFat.Prior;
        end
      else
        begin
          PrintBand := False;
          fPrevNotasEnt.qProdutosFat.Prior;
        end;
    end;
  if PrintBand then
    begin
      QRLabel43.Caption := FormatFloat('###,###,##0.00',vTotalProduto);
      QRLabel47.Caption := FormatFloat('###,###,##0.00000',vQtdProduto);
      vTotalProduto     := 0;
      vQtdProduto       := 0;
    end;
end;

procedure TfRelNotasEnt.DetailBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vQtdAux : Real;  
begin
  vQtdAux := fPrevNotasEnt.mAcumuladoQtd.AsFloat;
  if (DM1.tUnidade.Locate('Unidade',fPrevNotasEnt.mAcumuladoUnidade.AsString,([LocaseInsensitive]))) and
     (DM1.tUnidadeConversor.AsFloat > 0) then
    vQtdAux := vQtdAux * DM1.tUnidadeConversor.AsFloat;
  QRLabel48.Caption := FormatFloat('###,###,##0.00000', vQtdAux);
  vQtdProduto := vQtdProduto + vQtdAux;
  vQtdTotal   := vQtdTotal + vQtdAux;
end;

procedure TfRelNotasEnt.SummaryBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel45.Caption := FormatFloat('###,###,###,##0.00000',vQtdTotal);
end;

end.

