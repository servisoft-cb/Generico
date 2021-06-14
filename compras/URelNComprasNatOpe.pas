unit URelNComprasNatOpe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelNComprasNatOpe = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel21: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLBand2: TRLBand;
    RLSubDetail2: TRLSubDetail;
    RLBand3: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLBand4: TRLBand;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLDraw1: TRLDraw;
    RLDBText3: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDraw2: TRLDraw;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLDraw3: TRLDraw;
    RLDBText1: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLBand5: TRLBand;
    RLLabel20: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLDraw4: TRLDraw;
    RLLabel28: TRLLabel;
    RLDBText17: TRLDBText;
    RLLabel29: TRLLabel;
    RLDBText18: TRLDBText;
    RLLabel30: TRLLabel;
    RLDBText19: TRLDBText;
    RLDBText20: TRLDBText;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLSubDetail2BeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelNComprasNatOpe: TfRelNComprasNatOpe;

implementation

uses UPrevNComprasNatOpe, DB;

{$R *.dfm}

procedure TfRelNComprasNatOpe.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel15.Caption := FormatFloat('###,###,##0.00',fPrevNComprasNatOpe.mAuxResumoVlrTotal.AsFloat);
  RLLabel16.Caption := FormatFloat('###,###,##0.00',fPrevNComprasNatOpe.mAuxResumoVlrMercadoria.AsFloat);
  RLLabel17.Caption := FormatFloat('###,###,##0.00',fPrevNComprasNatOpe.mAuxResumoVlrBase.AsFloat);
  RLLabel18.Caption := FormatFloat('###,###,##0.00',fPrevNComprasNatOpe.mAuxResumoVlrIcms.AsFloat);
  RLLabel19.Caption := FormatFloat('###,###,##0.00',fPrevNComprasNatOpe.mAuxResumoVlrOutras.AsFloat);
  RLLabel31.Caption := FormatFloat('###,###,##0.00',fPrevNComprasNatOpe.mAuxResumoBaseIPI.AsFloat);
  RLLabel32.Caption := FormatFloat('###,###,##0.00',fPrevNComprasNatOpe.mAuxResumoVlrIPI.AsFloat);
end;

procedure TfRelNComprasNatOpe.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel2.Caption := fPrevNComprasNatOpe.RxDBLookupCombo1.Text;
  RLLabel3.Caption := 'Período: ' + fPrevNComprasNatOpe.DateEdit1.Text + ' a ' + fPrevNComprasNatOpe.DateEdit2.Text;
  if fPrevNComprasNatOpe.RadioGroup2.ItemIndex = 0 then
    begin
      RLLabel5.Visible     := False;
      RLLabel6.Visible     := False;
      RLLabel7.Visible     := False;
      RLLabel8.Visible     := False;
    end
  else
    begin
      RLLabel5.Visible     := True;
      RLLabel6.Visible     := True;
      RLLabel7.Visible     := True;
      RLLabel8.Visible     := True;
    end;
end;

procedure TfRelNComprasNatOpe.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  fPrevNComprasNatOpe.vVlrTotal      := fPrevNComprasNatOpe.vVlrTotal + fPrevNComprasNatOpe.mAuxResumoVlrTotal.AsFloat;
  fPrevNComprasNatOpe.vVlrMercadoria := fPrevNComprasNatOpe.vVlrMercadoria + fPrevNComprasNatOpe.mAuxResumoVlrMercadoria.AsFloat;
  fPrevNComprasNatOpe.vBase          := fPrevNComprasNatOpe.vBase + fPrevNComprasNatOpe.mAuxResumoVlrBase.AsFloat;
  fPrevNComprasNatOpe.vIcms          := fPrevNComprasNatOpe.vIcms + fPrevNComprasNatOpe.mAuxResumoVlrIcms.AsFloat;
  fPrevNComprasNatOpe.vOutras        := fPrevNComprasNatOpe.vOutras + fPrevNComprasNatOpe.mAuxResumoVlrOutras.AsFloat;
  fPrevNComprasNatOpe.vVlrIPI        := fPrevNComprasNatOpe.vVlrIPI + fPrevNComprasNatOpe.mAuxResumoVlrIPI.AsFloat;
  fPrevNComprasNatOpe.vBaseIPI       := fPrevNComprasNatOpe.vBaseIPI + fPrevNComprasNatOpe.mAuxResumoBaseIPI.AsFloat;
  case fPrevNComprasNatOpe.RadioGroup2.ItemIndex of
    0 : PrintIt := True;
    1 : PrintIt := False;
  end;
end;

procedure TfRelNComprasNatOpe.RLSubDetail2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  case fPrevNComprasNatOpe.RadioGroup2.ItemIndex of
    0 : PrintIt := False;
    1 : PrintIt := True;
  end;
end;

procedure TfRelNComprasNatOpe.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel23.Caption := FormatFloat('###,###,##0.00',fPrevNComprasNatOpe.vVlrTotal);
  RLLabel24.Caption := FormatFloat('###,###,##0.00',fPrevNComprasNatOpe.vVlrMercadoria);
  RLLabel25.Caption := FormatFloat('###,###,##0.00',fPrevNComprasNatOpe.vBase);
  RLLabel26.Caption := FormatFloat('#,###,##0.00',fPrevNComprasNatOpe.vIcms);
  RLLabel27.Caption := FormatFloat('###,###,##0.00',fPrevNComprasNatOpe.vOutras);
  RLLabel33.Caption := FormatFloat('###,###,##0.00',fPrevNComprasNatOpe.vBaseIPI);
  RLLabel34.Caption := FormatFloat('###,###,##0.00',fPrevNComprasNatOpe.vVlrIPI);

  fPrevNComprasNatOpe.vVlrTotal      := 0;
  fPrevNComprasNatOpe.vVlrMercadoria := 0;
  fPrevNComprasNatOpe.vBase          := 0;
  fPrevNComprasNatOpe.vIcms          := 0;
  fPrevNComprasNatOpe.vOutras        := 0;
  fPrevNComprasNatOpe.vVlrIPI        := 0;
  fPrevNComprasNatOpe.vBaseIPI       := 0;
end;

end.
