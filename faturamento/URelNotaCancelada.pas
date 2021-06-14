unit URelNotaCancelada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelNotaCancelada = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel21: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel22: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLDBText1: TRLDBText;
    RLDraw1: TRLDraw;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLBand3: TRLBand;
    RLDraw2: TRLDraw;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLBand4: TRLBand;
    RLDraw3: TRLDraw;
    RLLabel6: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDBText5: TRLDBText;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    vTotalCanc, vTotalDeneg : Integer;
  public
    { Public declarations }
  end;

var
  fRelNotaCancelada: TfRelNotaCancelada;

implementation

uses UConsNotaCancelada, ToolEdit;

{$R *.dfm}

procedure TfRelNotaCancelada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelNotaCancelada.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel1.Caption := 'Relatório de Notas Canceladas/Denegadas';
  if (fConsNotaCancelada.DateEdit1.Date > 0) and (fConsNotaCancelada.DateEdit2.Date < 1) then
    RLLabel1.Caption := RLLabel1.Caption + ' (apartir de ' + fConsNotaCancelada.DateEdit1.Text + ')'
  else
  if (fConsNotaCancelada.DateEdit1.Date > 0) and (fConsNotaCancelada.DateEdit2.Date > 0) then
    RLLabel1.Caption := RLLabel1.Caption + ' ( ' + fConsNotaCancelada.DateEdit1.Text + ' a ' + fConsNotaCancelada.DateEdit2.Text + ' )'
  else
  if (fConsNotaCancelada.DateEdit1.Date < 1) and (fConsNotaCancelada.DateEdit2.Date > 0) then
    RLLabel1.Caption := RLLabel1.Caption + ' (até ' + fConsNotaCancelada.DateEdit2.Text + ')';
end;

procedure TfRelNotaCancelada.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if fConsNotaCancelada.qNotaCancelada.AsBoolean then
  begin
    RLLabel9.Caption  := 'Canc.';
    RLLabel10.Caption := fConsNotaCancelada.qNotaMotivoCanc.AsString;
    vTotalCanc        := vTotalCanc + 1; 
  end
  else
  if fConsNotaCancelada.qNotaNFeDenegada.AsBoolean then
  begin
    RLLabel9.Caption  := 'Deneg';
    RLLabel10.Caption := fConsNotaCancelada.qNotaNFeMotivoDenegada.AsString;
    vTotalDeneg       := vTotalDeneg + 1;
  end;
end;

procedure TfRelNotaCancelada.FormCreate(Sender: TObject);
begin
  vTotalCanc  := 0;
  vTotalDeneg := 0;
end;

procedure TfRelNotaCancelada.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel12.Caption := IntToStr(vTotalCanc);
  RLLabel14.Caption := IntToStr(vTotalDeneg);
  vTotalCanc        := 0;
  vTotalDeneg       := 0;
end;

end.
