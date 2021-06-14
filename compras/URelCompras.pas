unit URelCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelCompras = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel21: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel22: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLBand3: TRLBand;
    RLLabel11: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDraw2: TRLDraw;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLDraw1: TRLDraw;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel10: TRLLabel;
    RLBand5: TRLBand;
    RLLabel14: TRLLabel;
    RLDraw3: TRLDraw;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLBand6: TRLBand;
    RLLabel15: TRLLabel;
    RLDBResult4: TRLDBResult;
    RLDraw4: TRLDraw;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelCompras: TfRelCompras;

implementation

uses UConsCompras, ToolEdit;

{$R *.dfm}

procedure TfRelCompras.RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLLabel1.Caption := 'Relatório das Compras';
  if (fConsCompras.DateEdit1.Date > 0) and (fConsCompras.DateEdit2.Date > 0) then
    RLLabel1.Caption := RLLabel1.Caption + ' - ' + fConsCompras.DateEdit1.Text + ' a ' + fConsCompras.DateEdit2.Text
  else
  if fConsCompras.DateEdit1.Date > 0 then
    RLLabel1.Caption := RLLabel1.Caption + ' - Apartir de ' + fConsCompras.DateEdit1.Text
  else
  if fConsCompras.DateEdit2.Date > 0 then
    RLLabel1.Caption := RLLabel1.Caption + ' - Até ' + fConsCompras.DateEdit2.Text;
end;

procedure TfRelCompras.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if fConsCompras.mComprasTipo.AsString = 'Prod' then
    RLLabel14.Caption := 'PRODUTOS'
  else
    RLLabel14.Caption := 'MÃO DE OBRA';
end;

end.
