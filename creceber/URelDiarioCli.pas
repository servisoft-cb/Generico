unit URelDiarioCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RLReport, DB, ToolEdit;

type
  TfRelDiarioCli = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLGroup1: TRLGroup;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel21: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel22: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLDraw1: TRLDraw;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand3: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLLabel11: TRLLabel;
    RLDraw2: TRLDraw;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLBand4: TRLBand;
    RLLabel14: TRLLabel;
    RLDBText8: TRLDBText;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLBand5: TRLBand;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLLabel17: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1AfterPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLReport1AfterPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vSaldoData: Real;
  end;

var
  fRelDiarioCli: TfRelDiarioCli;

implementation

uses UConsDiarioCli;

{$R *.dfm}

procedure TfRelDiarioCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelDiarioCli.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel10.Caption := fConsDiarioCli.mDiarioNumNota.AsString + '/' + fConsDiarioCli.mDiarioParcela.AsString;
end;

procedure TfRelDiarioCli.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel12.Caption := 'Saldo em ' + fConsDiarioCli.mDiarioData.AsString + ':';
  RLLabel13.Caption := FormatFloat('###,###,###,##0.00',vSaldoData);
end;

procedure TfRelDiarioCli.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel1.Caption  := 'Diário de Clientes - Período: ' + fConsDiarioCli.DateEdit1.Text + ' a ' + fConsDiarioCli.DateEdit2.Text;
  RLLabel15.Caption := FormatFloat('###,###,###,##0.00',vSaldoData);
  RLLabel20.Caption := fConsDiarioCli.vNomeFilial;
end;

procedure TfRelDiarioCli.RLBand1AfterPrint(Sender: TObject);
begin
  vSaldoData        := vSaldoData + fConsDiarioCli.mDiarioDebito.AsFloat - fConsDiarioCli.mDiarioCredito.AsFloat;
end;

procedure TfRelDiarioCli.FormCreate(Sender: TObject);
begin
  RLReport1.FirstPageNumber := fConsDiarioCli.CurrencyPagina.AsInteger;
end;

procedure TfRelDiarioCli.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel18.Caption := 'Saldo em ' + fConsDiarioCli.mDiarioData.AsString + ':';
  RLLabel19.Caption := FormatFloat('###,###,###,##0.00',vSaldoData);
end;

procedure TfRelDiarioCli.RLReport1AfterPrint(Sender: TObject);
begin
  fConsDiarioCli.CurrencyPaginaFinal.AsInteger := RLReport1.PageNumber;
end;

end.
                