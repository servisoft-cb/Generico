unit URelCReceberTipoCobr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelCReceberTipoCobr = class(TForm)
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
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLDraw1: TRLDraw;
    RLSubDetail1: TRLSubDetail;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLLabel19: TRLLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText11: TRLDBText;
    RLLabel2: TRLLabel;
    RLDBText3: TRLDBText;
    RLBand3: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel14: TRLLabel;
    RLBand5: TRLBand;
    RLDBResult4: TRLDBResult;
    RLLabel20: TRLLabel;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLLabel6: TRLLabel;
    RLLabel10: TRLLabel;
    rlOpcao: TRLLabel;
    RLDBText4: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabel11: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel9: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel16: TRLLabel;
    RLDBText9: TRLDBText;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    vCabecalho : String;
  public
    { Public declarations }
    vVlrProtestados, vVlrProtestadosGeral : Real;
  end;

var
  fRelCReceberTipoCobr: TfRelCReceberTipoCobr;

implementation

uses UConsCReceber, DB, ToolEdit;

{$R *.dfm}

procedure TfRelCReceberTipoCobr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCReceberTipoCobr.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel17.Caption := fConsCReceber.qConsultaCodNoBanco.AsString;

  RLLabel2.Caption := fConsCReceber.qConsultaParcCReceber.AsString +
                      fConsCReceber.qConsultaclTransferencia.AsString;

  RLLabel18.Visible := fConsCReceber.qConsultaTitProtestado.AsBoolean;
  if fConsCReceber.qConsultaTitProtestado.AsBoolean then
  begin
    vVlrProtestados      := StrToFloat(FormatFloat('0.00',vVlrProtestados + fConsCReceber.qConsultaVlrParcCReceber.AsFloat));
    vVlrProtestadosGeral := StrToFloat(FormatFloat('0.00',vVlrProtestadosGeral + fConsCReceber.qConsultaVlrParcCReceber.AsFloat));
  end;
end;

procedure TfRelCReceberTipoCobr.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := True;
  RLLabel19.Caption := 'Tipo Cobrança: ' + fConsCReceber.qConsultaNomeCobranca.AsString;
end;

procedure TfRelCReceberTipoCobr.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := True;
  //if (fConsCReceber.ComboBox1.ItemIndex = 3) or (fConsCReceber.ComboBox1.ItemIndex = 4) then
  if (fConsCReceber.ComboBox1.ItemIndex = 3)  then
    PrintIt := False;
  RLLabel24.Caption := FormatFloat('###,###,###,##0.00',vVlrProtestados);
  vVlrProtestados      := 0;
end;

procedure TfRelCReceberTipoCobr.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  rlOpcao.Caption := '';
  if fConsCReceber.RxDBLookupCombo2.Text <> '' then
    rlOpcao.Caption := ' (Filial: ' + Copy(fConsCReceber.RxDBLookupCombo2.Text,1,20) + ')';
  if (fConsCReceber.DateEdit1.Date > 0) and (fConsCReceber.DateEdit2.Date > 0) then
    rlOpcao.Caption := rlOpcao.Caption + ' (Emissao: ' + fConsCReceber.DateEdit1.Text + ' a ' + fConsCReceber.DateEdit2.Text + ')';
  if (fConsCReceber.DateEdit3.Date > 0) and (fConsCReceber.DateEdit4.Date > 0) then
    rlOpcao.Caption := rlOpcao.Caption + ' (Vecto: ' + fConsCReceber.DateEdit3.Text + ' a ' + fConsCReceber.DateEdit4.Text + ')';
  if fConsCReceber.RxDBLookupCombo6.Text <> '' then
    rlOpcao.Caption := rlOpcao.Caption + ' (Vendedor: ' + Copy(fConsCReceber.RxDBLookupCombo6.Text,1,20) + ')';
end;

procedure TfRelCReceberTipoCobr.FormCreate(Sender: TObject);
begin
  vVlrProtestados      := 0;
  vVlrProtestadosGeral := 0;
end;

procedure TfRelCReceberTipoCobr.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel26.Caption    := FormatFloat('###,###,###,##0.00',vVlrProtestadosGeral);
  vVlrProtestadosGeral := 0;
end;

end.
