unit URelCPagarPlano;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RLReport, db;

type
  TfRelCPagarPlano = class(TForm)
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
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLDraw5: TRLDraw;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel17: TRLLabel;
    RLDBText9: TRLDBText;
    RLGroup2: TRLGroup;
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
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDraw4: TRLDraw;
    RLDBText12: TRLDBText;
    RLLabel30: TRLLabel;
    RLBand6: TRLBand;
    RLLabel31: TRLLabel;
    RLDBResult7: TRLDBResult;
    RLLabel32: TRLLabel;
    RLDBResult8: TRLDBResult;
    RLDBResult9: TRLDBResult;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLDraw6: TRLDraw;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    vNomeCentro : String;
  public
    { Public declarations }
  end;

var
  fRelCPagarPlano: TfRelCPagarPlano;

implementation

uses UDM1, UContasPagar2;

{$R *.dfm}

procedure TfRelCPagarPlano.RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLLabel11.Caption := Trim(fContasPagar2.qParcelasNroDuplicata.AsString) + '/' + fContasPagar2.qParcelasParcCPagar.AsString;
  if fContasPagar2.qParcelasRestParcela.AsFloat > 0 then
    RLLabel12.Caption := fContasPagar2.qParcelasclDiasAtraso.AsString
  else
    RLLabel12.Caption := '';
  RLLabel30.Caption := '';
  if DM1.tParametrosUsaCentroCusto.AsBoolean then
    RLLabel30.Caption := fContasPagar2.qParcelasCodCentroCusto.AsString + '-' + fContasPagar2.qParcelasCodCentroCustoItem.AsString;
  vNomeCentro := fContasPagar2.qParcelasNomeCentroCusto.AsString;
end;

procedure TfRelCPagarPlano.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCPagarPlano.FormCreate(Sender: TObject);
begin
  vNomeCentro := '';
  if fContasPagar2.CheckBox1.Checked then
    RLGroup1.DataFields := 'Filial'
  else
    RLGroup1.DataFields := '';

  if fContasPagar2.CheckBox3.Checked then
    RLGroup2.DataFields := 'NomeCentroCusto'
  else
    RLGroup2.DataFields := '';
end;

procedure TfRelCPagarPlano.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := fContasPagar2.CheckBox1.Checked;
end;

procedure TfRelCPagarPlano.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := fContasPagar2.CheckBox1.Checked;
end;

procedure TfRelCPagarPlano.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel28.Caption := '';
  if fContasPagar2.RxDBLookupCombo2.Text <> '' then
    RLLabel28.Caption := RLLabel28.Caption + '(Filial: ' + fContasPagar2.RxDBLookupCombo2.Text + ')';
  if (fContasPagar2.DateEdit1.Date > 10) and (fContasPagar2.DateEdit2.Date > 10) then
    RLLabel28.Caption := RLLabel28.Caption + '(Dt.Vecto: ' + fContasPagar2.DateEdit1.Text + ' a ' + fContasPagar2.DateEdit2.Text + ')'
  else
  if fContasPagar2.DateEdit1.Date > 10 then
    RLLabel28.Caption := RLLabel28.Caption + '(Dt.Vecto inicial: ' + fContasPagar2.DateEdit1.Text + ')'
  else
  if fContasPagar2.DateEdit2.Date > 10 then
    RLLabel28.Caption := RLLabel28.Caption + '(Dt.Vecto Final: ' + fContasPagar2.DateEdit2.Text + ')';
  if (fContasPagar2.DateEdit3.Date > 10) and (fContasPagar2.DateEdit4.Date > 10) then
    RLLabel28.Caption := RLLabel28.Caption + '(Dt.Vecto: ' + fContasPagar2.DateEdit3.Text + ' a ' + fContasPagar2.DateEdit4.Text + ')'
  else
  if fContasPagar2.DateEdit3.Date > 10 then
    RLLabel28.Caption := RLLabel28.Caption + '(Dt.Emissão inicial: ' + fContasPagar2.DateEdit3.Text + ')'
  else
  if fContasPagar2.DateEdit4.Date > 10 then
    RLLabel28.Caption := RLLabel28.Caption + '(Dt.Vecto Final: ' + fContasPagar2.DateEdit4.Text + ')';
  RLLabel29.Visible := DM1.tParametrosUsaCentroCusto.AsBoolean;
end;

procedure TfRelCPagarPlano.RLBand6BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := fContasPagar2.CheckBox3.Checked;
  if not PrintIt then
    exit;

  RLLabel34.Caption := 'C.Custo: ' + vNomeCentro;
end;

end.
