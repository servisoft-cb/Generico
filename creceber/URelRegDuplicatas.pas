unit URelRegDuplicatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelRegDuplicatas = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel21: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel22: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel13: TRLLabel;
    RLDraw1: TRLDraw;
    RLSubDetail1: TRLSubDetail;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText11: TRLDBText;
    RLLabel2: TRLLabel;
    RLBand3: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel14: TRLLabel;
    RLBand5: TRLBand;
    RLLabel20: TRLLabel;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLLabel25: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel17: TRLLabel;
    RLDBResult4: TRLDBResult;
    RLLabel18: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel23: TRLLabel;
    RLDraw4: TRLDraw;
    RLLabel24: TRLLabel;
    RLDBText4: TRLDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    vCabecalho : String;
    vTotal1, vTotal2, vTotalGeral1, vTotalGeral2 : Real;
  public
    { Public declarations }
  end;

var
  fRelRegDuplicatas: TfRelRegDuplicatas;

implementation

uses UConsCReceber, DB, UDM1;

{$R *.dfm}

procedure TfRelRegDuplicatas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelRegDuplicatas.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel2.Caption := fConsCReceber.qConsultaParcCReceber.AsString +
                      fConsCReceber.qConsultaclTransferencia.AsString;
  RLLabel10.Caption := '';
  if DM1.tCidade.Locate('Codigo',fConsCReceber.qConsultaCodCidade.AsInteger,[loCaseInsensitive]) then
    RLLabel10.Caption := DM1.tCidadeEstado.AsString + '/' + DM1.tCidadeNome.AsString;

  if fConsCReceber.qConsultaFilial.AsInteger = 1 then
    vTotal1 := vTotal1 + fConsCReceber.qConsultaVlrParcCReceber.AsFloat
  else
    vTotal2 := vTotal2 + fConsCReceber.qConsultaVlrParcCReceber.AsFloat;
end;

procedure TfRelRegDuplicatas.FormCreate(Sender: TObject);
begin
  vTotal1 := 0;
  vTotal2 := 0;
  RLReport1.FirstPageNumber := fConsCReceber.CurrencyPagina.AsInteger;
end;

procedure TfRelRegDuplicatas.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel25.Caption := '';
  if DM1.tFilial2.Locate('Codigo',fConsCReceber.qConsultaFilial.AsInteger,[loCaseInsensitive]) then
    RLLabel25.Caption := DM1.tFilial2Empresa.AsString;
  RLLabel1.Caption := 'Registro de Duplicatas - ' + fConsCReceber.DateEdit1.Text + ' a ' + fConsCReceber.DateEdit2.Text;
end;

procedure TfRelRegDuplicatas.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel11.Caption := '';
  RLLabel17.Caption := '';
  RLLabel18.Caption := '';
  RLLabel12.Caption := '';
  if (vTotal1 > 0) and (vTotal2 > 0) then
    begin
      if vTotal1 > 0 then
        RLLabel11.Caption := FormatFloat('###,###,###,##0.00',vTotal1);
      if vTotal2 > 0 then
        RLLabel17.Caption := FormatFloat('###,###,###,##0.00',vTotal2);
      if RLLabel11.Caption <> '' then
        RLLabel18.Caption := 'Total dos Titulos:';
      if RLLabel17.Caption <> '' then
        RLLabel12.Caption := 'Total dos Titulos:';
    end;
  vTotalGeral1 := vTotalGeral1 + vTotal1;
  vTotalGeral2 := vTotalGeral2 + vTotal2;
  vTotal1 := 0;
  vTotal2 := 0;
end;

procedure TfRelRegDuplicatas.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel16.Caption := '';
  RLLabel23.Caption := '';
  RLLabel15.Caption := '';
  RLLabel19.Caption := '';
  if (vTotalGeral1 > 0) and (vTotalGeral2 > 0) then
    begin
      if vTotalGeral1 > 0 then
        RLLabel16.Caption := FormatFloat('###,###,###,##0.00',vTotalGeral1);
      if vTotalGeral2 > 0 then
        RLLabel23.Caption := FormatFloat('###,###,###,##0.00',vTotalGeral2);
      if RLLabel16.Caption <> '' then
        RLLabel15.Caption := 'Total dos Titulos:';
      if RLLabel23.Caption <> '' then
        RLLabel19.Caption := 'Total dos Titulos:';
    end;
  vTotalGeral1 := 0;
  vTotalGeral2 := 0;
end;

end.
