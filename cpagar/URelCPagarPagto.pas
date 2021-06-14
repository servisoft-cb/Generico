unit URelCPagarPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelCPagarPagto = class(TForm)
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
    RLLabel5: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel9: TRLLabel;
    RLDraw1: TRLDraw;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText8: TRLDBText;
    RLLabel13: TRLLabel;
    RLBand3: TRLBand;
    RLLabel16: TRLLabel;
    RLDraw2: TRLDraw;
    RLLabel6: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText4: TRLDBText;
    RLDBText7: TRLDBText;
    RLLabel10: TRLLabel;
    RLLabel12: TRLLabel;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    vVlrTotal : Real;
    { Public declarations }
  end;

var
  fRelCPagarPagto: TfRelCPagarPagto;

implementation

uses UDM1, DB, UConsContasPagar;

{$R *.dfm}

procedure TfRelCPagarPagto.RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  RLLabel11.Caption := Trim(fConsContasPagar.qParcelasNroDuplicata.AsString) + '/' + fConsContasPagar.qParcelasParcCPagar.AsString;
  if fConsContasPagar.ComboBox1.ItemIndex = 0 then
    begin
      RLLabel10.Caption := FormatFloat('###,###,##0.00',fConsContasPagar.qParcelasVlrUltPgto.AsFloat);
      vVlrTotal         := vVlrTotal + fConsContasPagar.qParcelasVlrUltPgto.AsFloat;
    end
  else
    begin
      RLLabel10.Caption := FormatFloat('###,###,##0.00',fConsContasPagar.qParcelasVlrDevolucao.AsFloat);
      vVlrTotal         := vVlrTotal + fConsContasPagar.qParcelasVlrDevolucao.AsFloat;
    end;

  {RLLabel10.Caption := '';
  RLLabel12.Caption := '';
  if fConsContasPagar.qParcelasNumCheque.AsInteger > 0 then
    begin
      RLLabel10.Caption := fConsContasPagar.qParcelasNumCheque.AsString;
      RLLabel12.Caption := fConsContasPagar.qParcelasDtPrevCheque.AsString;
    end;}
end;

procedure TfRelCPagarPagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCPagarPagto.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if fConsContasPagar.ComboBox1.ItemIndex = 0 then
    begin
      RLLabel1.Caption := 'Relatório do Contas a Pagar (Pagamentos)';
      RLLabel5.Caption := 'Vlr.Pagto';
    end
  else
    begin
      RLLabel1.Caption := 'Relatório do Contas a Pagar (Devoluções)';
      RLLabel5.Caption := 'Vlr.Devol.';
    end;
end;

procedure TfRelCPagarPagto.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel12.Caption := FormatFloat('###,###,###,##0.00',vVlrTotal);
  vVlrTotal         := 0;
end;

end.
