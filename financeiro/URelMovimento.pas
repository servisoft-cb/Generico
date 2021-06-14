unit URelMovimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelMovimento = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
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
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLMemo1: TRLMemo;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLLabel9: TRLLabel;
    RLDraw3: TRLDraw;
    RLBand3: TRLBand;
    RLLabel10: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLDraw4: TRLDraw;
    RLLabel15: TRLLabel;
    RLLabel14: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    vSaldoGeral : Real;
  public
    { Public declarations }
  end;

var
  fRelMovimento: TfRelMovimento;

implementation

uses UMovimentos2, DB;

{$R *.dfm}

procedure TfRelMovimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelMovimento.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel1.Caption := 'RELATÓRIO MOVIMENTO FINANCEIRO';
  if (fMovimentos2.DateEdit1.Date > 0) and (fMovimentos2.DateEdit2.Date <= 1) then
    RLLabel1.Caption := RLLabel1.Caption + ' (Início: ' + fMovimentos2.DateEdit1.Text + ')'
  else
  if (fMovimentos2.DateEdit1.Date > 0) and (fMovimentos2.DateEdit2.Date > 0) then
    RLLabel1.Caption := RLLabel1.Caption + ' (' + fMovimentos2.DateEdit1.Text + ' a ' + fMovimentos2.DateEdit2.Text + ')';
  RLLabel8.Caption  := FormatFloat('###,###,##0.00',fMovimentos2.qSaldoAntclVlrMovimento.AsFloat);
  RLLabel15.Caption := fMovimentos2.qContasNomeConta.AsString;
end;

procedure TfRelMovimento.FormCreate(Sender: TObject);
begin
  vSaldoGeral := 0;
  if fMovimentos2.qSaldoAnt.Locate('CodConta',fMovimentos2.qContasCodConta.AsInteger,[loCaseInsensitive]) then
    vSaldoGeral := fMovimentos2.qSaldoAntclVlrMovimento.AsFloat;
end;

procedure TfRelMovimento.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLMemo1.Lines.Clear;
  RLMemo1.Lines.Text := fMovimentos2.tMovimentos2Historico.AsString;
  vSaldoGeral        := vSaldoGeral + fMovimentos2.tMovimentos2VlrMovCredito.AsFloat - fMovimentos2.tMovimentos2VlrMovDebito.AsFloat;
  RLLabel9.Caption   := FormatFloat('###,###,##0.00',vSaldoGeral);
end;

procedure TfRelMovimento.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel11.Caption := FormatFloat('###,###,##0.00',RLDBResult1.Value - RLDBResult2.Value);
  RLLabel13.Caption := FormatFloat('###,###,##0.00',vSaldoGeral);
end;

end.
