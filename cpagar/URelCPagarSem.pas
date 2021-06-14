unit URelCPagarSem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfRelCPagarSem = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRDia2: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRDia3: TQRLabel;
    QRShape6: TQRShape;
    QRDia4: TQRLabel;
    QRShape7: TQRShape;
    QRDia5: TQRLabel;
    QRShape8: TQRShape;
    QRDia6: TQRLabel;
    QRShape9: TQRShape;
    QRDia7: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    ChildBand1: TQRChildBand;
    QRShape11: TQRShape;
    QRLabel4: TQRLabel;
    QRTSaldo2: TQRLabel;
    QRTSaldo3: TQRLabel;
    QRTSaldo4: TQRLabel;
    QRTSaldo5: TQRLabel;
    QRTSaldo6: TQRLabel;
    QRTSaldo7: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRTGSaldo2: TQRLabel;
    QRTGSaldo3: TQRLabel;
    QRTGSaldo4: TQRLabel;
    QRTGSaldo5: TQRLabel;
    QRTGSaldo6: TQRLabel;
    QRTGSaldo7: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRD2: TQRLabel;
    QRShape14: TQRShape;
    QRD3: TQRLabel;
    QRShape15: TQRShape;
    QRD4: TQRLabel;
    QRShape16: TQRShape;
    QRD5: TQRLabel;
    QRD6: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRD7: TQRLabel;
    QRShape19: TQRShape;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDia1: TQRLabel;
    QRShape10: TQRShape;
    QRTSaldo1: TQRLabel;
    QRD1: TQRLabel;
    QRShape20: TQRShape;
    QRTGSaldo1: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    vDataI, vDataF : TDate;
    vTotalSem : array[1..7] of Real;
    vTotalGer : array[1..7] of Real;
    vDia : array [1..7] of String;
  public
    { Public declarations }
  end;

var
  fRelCPagarSem: TfRelCPagarSem;

implementation

uses UPrevCPagarSem, UDM1;

{$R *.DFM}

procedure TfRelCPagarSem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCPagarSem.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vDataAux : TDate;
begin
  QRLabel1.Caption := 'Relatório do Contas a Pagar por Semana - ' + fPrevCPagarSem.DateEdit1.Text + ' a ' + fPrevCPagarSem.DateEdit2.Text;
  vDataAux := vDataI;
  while vDataAux <= vDataF do
    begin
      TQRLabel(FindComponent('QRDia'+IntToStr(DayOfWeek(vDataAux)))).Caption := vDia[DayOfWeek(vDataAux)] + ' ' + DateToStr(vDataAux);
      vDataAux := vDataAux + 1;
    end;
end;

procedure TfRelCPagarSem.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i : Integer;
begin
  for i := 1 to 7 do
    begin
      vTotalSem[i] := vTotalSem[i] + fPrevCPagarSem.mSemana.FieldByName('Saldo'+IntToStr(i)).AsFloat;
      vTotalGer[i] := vTotalGer[i] + fPrevCPagarSem.mSemana.FieldByName('Saldo'+IntToStr(i)).AsFloat;
    end;
end;

procedure TfRelCPagarSem.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i : Integer;
  vDataAux : TDate;
begin
  if fPrevCPagarSem.mSemana.RecordCount = fPrevCPagarSem.mSemana.RecNo then
    begin
      PrintBand         := True;
      ChildBand1.Height := 23;
    end
  else
    begin
      vDataAux := fPrevCPagarSem.mSemanaData1.AsDateTime;
      fPrevCPagarSem.mSemana.Next;
      if vDataAux = fPrevCPagarSem.mSemanaData1.AsDateTime then
        PrintBand := False
      else
        begin
          vDataI := fPrevCPagarSem.mSemanaData1.AsDateTime;
          vDataF := fPrevCPagarSem.mSemanaData7.AsDateTime;
          PrintBand := True;
          ChildBand1.Height := 47;
        end;
      fPrevCPagarSem.mSemana.Prior;
    end;
  if PrintBand then
    begin
      vDataAux := vDataI;
      for i := 1 to 7 do
        begin
          TQRLabel(FindComponent('QRTSaldo'+IntToStr(i))).Caption := FormatFloat('###,###,##0.00',vTotalSem[i]);
          vTotalSem[i] := 0;
          TQRLabel(FindComponent('QRD'+IntToStr(DayOfWeek(vDataAux)))).Caption := vDia[DayOfWeek(vDataAux)] + ' ' + DateToStr(vDataAux);
          vDataAux := vDataAux + 1;
        end;
    end;
end;

procedure TfRelCPagarSem.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i : Integer;
begin
  for i := 1 to 7 do
    begin
      TQRLabel(FindComponent('QRTGSaldo'+IntToStr(i))).Caption := FormatFloat('###,###,##0.00',vTotalGer[i]);
      vTotalGer[i] := 0;
    end;
end;

procedure TfRelCPagarSem.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  vDia[1] := 'Dom';
  vDia[2] := 'Seg';
  vDia[3] := 'Ter';
  vDia[4] := 'Qua';
  vDia[5] := 'Qui';
  vDia[6] := 'Sex';
  vDia[7] := 'Sab';
  for i := 1 to 7 do
    begin
      vTotalSem[i] := 0;
      vTotalGer[i] := 0;
    end;
end;

procedure TfRelCPagarSem.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  vDataI := fPrevCPagarSem.DateEdit1.Date;
  vDataF := fPrevCPagarSem.DateEdit1.Date + 6;
end;

end.
