unit URelRazaoCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DB, ToolEdit, Dialogs, RLReport;

type
  TfRelRazaoCli = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel21: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel22: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLDraw1: TRLDraw;
    RLBand3: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLLabel11: TRLLabel;
    RLDraw2: TRLDraw;
    RLBand4: TRLBand;
    RLLabel14: TRLLabel;
    RLDBText8: TRLDBText;
    RLLabel3: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText9: TRLDBText;
    RLGroup2: TRLGroup;
    RLBand5: TRLBand;
    RLLabel7: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel15: TRLLabel;
    RLDBText4: TRLDBText;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText3: TRLDBText;
    RLBand6: TRLBand;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLLabel10: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel12: TRLLabel;
    RLBand7: TRLBand;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
    RLLabel13: TRLLabel;
    RLDraw4: TRLDraw;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormShow(Sender: TObject);
    procedure RLBand7BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RLReport1AfterPrint(Sender: TObject);
  private
    { Private declarations }
    vImprimir: Boolean;
    vTotalAnt: Real;
    vPagina: Boolean;
  public
    { Public declarations }
    vSaldoData: Real;
  end;

var
  fRelRazaoCli: TfRelRazaoCli;

implementation

uses UConsRazaoCli;

{$R *.dfm}

procedure TfRelRazaoCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelRazaoCli.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel1.Caption  := 'Razão de Clientes - Período: ' + fConsRazaoCli.DateEdit1.Text + ' a ' + fConsRazaoCli.DateEdit2.Text;
  RLLabel19.Caption := fConsRazaoCli.vNomeFilial;
end;

procedure TfRelRazaoCli.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  fConsRazaoCli.Le_qSaldoAnt(fConsRazaoCli.mRazaoCodCli.AsInteger);
  RLLabel6.Caption := FormatFloat('###,###,###,##0.00',fConsRazaoCli.vSaldoAnt);
  vTotalAnt        := vTotalAnt + fConsRazaoCli.vSaldoAnt;
end;

procedure TfRelRazaoCli.RLBand6BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel10.Caption := '';
  PrintIt := vImprimir;
  if not PrintIt then
    Exit;
  RLLabel10.Caption := 'Total do Mês ' + fConsRazaoCli.mRazaoMes.AsString + '/' + fConsRazaoCli.mRazaoAno.AsString + ':';
end;

procedure TfRelRazaoCli.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt   := (fConsRazaoCli.mRazaoAno.AsInteger > 0);
  vImprimir := PrintIt;
end;

procedure TfRelRazaoCli.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := vImprimir;
  if not PrintIt then
    Exit;

  RLLabel12.Caption := FormatFloat('###,###,##0.00',fConsRazaoCli.vSaldoAnt + RLDBResult1.Value - RLDBResult2.Value);

end;

procedure TfRelRazaoCli.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLDBText1.Visible := (fConsRazaoCli.mRazaoAno.AsInteger > 0);
  RLDBText3.Visible := (fConsRazaoCli.mRazaoAno.AsInteger > 0);
  RLDBText5.Visible := (fConsRazaoCli.mRazaoAno.AsInteger > 0);
  RLDBText6.Visible := (fConsRazaoCli.mRazaoAno.AsInteger > 0);
  RLDBText7.Visible := (fConsRazaoCli.mRazaoAno.AsInteger > 0);
end;

procedure TfRelRazaoCli.FormShow(Sender: TObject);
begin
  vTotalAnt := 0;
  vPagina   := False;
end;

procedure TfRelRazaoCli.RLBand7BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel18.Caption := FormatFloat('###,###,##0.00',vTotalAnt);
  RLLabel16.Caption := FormatFloat('###,###,##0.00',vTotalAnt + RLDBResult5.Value - RLDBResult6.Value);
end;

procedure TfRelRazaoCli.FormCreate(Sender: TObject);
begin
  RLReport1.FirstPageNumber := fConsRazaoCli.CurrencyPagina.AsInteger;
end;

procedure TfRelRazaoCli.RLReport1AfterPrint(Sender: TObject);
begin
  fConsRazaoCli.CurrencyPaginaFinal.AsInteger := RLReport1.PageNumber;
end;

end.
