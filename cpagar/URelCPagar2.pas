unit URelCPagar2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelCPagar2 = class(TForm)
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
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLDraw1: TRLDraw;
    RLLabel10: TRLLabel;
    RLLabel13: TRLLabel;
    RLBand3: TRLBand;
    RLLabel14: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLLabel15: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLLabel16: TRLLabel;
    RLDraw2: TRLDraw;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLLabel17: TRLLabel;
    RLDBText9: TRLDBText;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLDBText8: TRLDBText;
    RLBand5: TRLBand;
    RLLabel18: TRLLabel;
    RLDBResult4: TRLDBResult;
    RLLabel19: TRLLabel;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
    RLLabel20: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelCPagar2: TfRelCPagar2;

implementation

uses UDM1, UContasPagar2;

{$R *.dfm}

procedure TfRelCPagar2.RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLLabel11.Caption := Trim(fContasPagar2.qParcelasNroDuplicata.AsString) + '/' + fContasPagar2.qParcelasParcCPagar.AsString;
  if fContasPagar2.qParcelasRestParcela.AsFloat > 0 then
    RLLabel12.Caption := fContasPagar2.qParcelasclDiasAtraso.AsString
  else
    RLLabel12.Caption := '';
  RLLabel24.Caption := '';
  if DM1.tParametrosUsaCentroCusto.AsBoolean then
    RLLabel24.Caption := fContasPagar2.qParcelasCodCentroCusto.AsString + '-' + fContasPagar2.qParcelasCodCentroCustoItem.AsString;
end;

procedure TfRelCPagar2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCPagar2.FormCreate(Sender: TObject);
begin
  if fContasPagar2.CheckBox1.Checked then
    RLGroup1.DataFields := 'Filial'
  else
    RLGroup1.DataFields := '';
end;

procedure TfRelCPagar2.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := ((fContasPagar2.CheckBox1.Checked) or (fContasPagar2.CheckBox2.Checked));
end;

procedure TfRelCPagar2.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := ((fContasPagar2.CheckBox1.Checked) or (fContasPagar2.CheckBox2.Checked));
end;

procedure TfRelCPagar2.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel23.Visible := DM1.tParametrosUsaCentroCusto.AsBoolean;
end;

end.
