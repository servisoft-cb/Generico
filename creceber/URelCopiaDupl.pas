unit URelCopiaDupl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelCopiaDupl = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLDraw1: TRLDraw;
    RLLabel4: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText4: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLDBText8: TRLDBText;
    RLDraw2: TRLDraw;
    RLLabel15: TRLLabel;
    RLDBText9: TRLDBText;
    RLLabel16: TRLLabel;
    RLDBText10: TRLDBText;
    RLLabel17: TRLLabel;
    RLDBText11: TRLDBText;
    RLLabel18: TRLLabel;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLLabel19: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel20: TRLLabel;
    RLDBText14: TRLDBText;
    RLLabel21: TRLLabel;
    RLDBText15: TRLDBText;
    RLLabel22: TRLLabel;
    RLDBText16: TRLDBText;
    RLLabel23: TRLLabel;
    RLDBText17: TRLDBText;
    RLLabel24: TRLLabel;
    RLDBText18: TRLDBText;
    RLSubDetail2: TRLSubDetail;
    RLBand2: TRLBand;
    RLLabel25: TRLLabel;
    RLDraw4: TRLDraw;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLDraw5: TRLDraw;
    RLDetailGrid1: TRLDetailGrid;
    RLLabel33: TRLLabel;
    RLDBText19: TRLDBText;
    RLLabel34: TRLLabel;
    RLDBText20: TRLDBText;
    RLLabel35: TRLLabel;
    RLDraw6: TRLDraw;
    RLBand3: TRLBand;
    RLDraw7: TRLDraw;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel36: TRLLabel;
    RLDBText21: TRLDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDetailGrid1BeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelCopiaDupl: TfRelCopiaDupl;

implementation

uses UConsCReceber, DB, UDM1;

{$R *.dfm}

procedure TfRelCopiaDupl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCopiaDupl.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel2.Caption := fConsCReceber.qConsultaNumNota.AsString + '/' + fConsCReceber.qConsultaParcCReceber.AsString;
  RLLabel3.Caption := 'FL:' + FormatFloat('00',fConsCReceber.qConsultaFilial.AsFloat);
  if fConsCReceber.qConsultaPessoa.AsString = 'F' then
    RLLabel5.Caption := 'CPF:'
  else
    RLLabel5.Caption := 'CNPJ:';

  RLLabel10.Caption := '';
  if DM1.tCidade.Locate('Codigo',fConsCReceber.qConsultaCodCidade.AsInteger,[loCaseInsensitive]) then
    RLLabel10.Caption := DM1.tCidadeNome.AsString;

  RLLabel13.Caption := '';
  if DM1.tFilial2.Locate('Codigo',fConsCReceber.qConsultaFilial.AsInteger,[loCaseInsensitive]) then
    RLLabel13.Caption := DM1.tFilial2Empresa.AsString;

end;

procedure TfRelCopiaDupl.RLDetailGrid1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel33.Caption := '';
  RLLabel35.Caption := '';
  if fConsCReceber.tCReceberParcHistPgto.AsBoolean then
    begin
      RLLabel33.Caption := 'LIQUIDAÇÃO';
      RLLabel35.Caption := FormatFloat('###,###,##0.00',fConsCReceber.tCReceberParcHistVlrUltPgto.AsFloat);
    end
  else
  if fConsCReceber.tCReceberParcHistDevolucao.AsBoolean then
    begin
      RLLabel33.Caption := 'DEVOLUÇÃO';
      RLLabel35.Caption := FormatFloat('###,###,##0.00',fConsCReceber.tCReceberParcHistVlrDevolucao.AsFloat);
    end;
  RLLabel34.Caption := '';
  if DM1.tContas.Locate('CodConta',fConsCReceber.tCReceberParcHistCodConta.AsInteger,[loCaseInsensitive]) then
    RLLabel34.Caption := DM1.tContasNomeConta.AsString;
end;

procedure TfRelCopiaDupl.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := (fConsCReceber.tCReceberParcHist.RecordCount > 0);
end;

end.
