unit URelPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelPlanoContas = class(TForm)
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
    RLDraw1: TRLDraw;
    RLBand5: TRLBand;
    RLLabel8: TRLLabel;
    RLDraw4: TRLDraw;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLGroup3: TRLGroup;
    RLGroup2: TRLGroup;
    RLBand3: TRLBand;
    RLLabel6: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLBand6: TRLBand;
    RLLabel13: TRLLabel;
    RLDBText3: TRLDBText;
    RLBand2: TRLBand;
    RLLabel5: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    vVlrEntradaTipo, vVlrEntradaGeral, vVlrSaidaTipo, vVlrSaidaGeral : Real;

  end;

var
  fRelPlanoContas: TfRelPlanoContas;

implementation

uses UConsPlanoContas;

{$R *.dfm}

procedure TfRelPlanoContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelPlanoContas.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  i : Integer;  
begin
  RLLabel5.Caption := fConsPlanoContas.mAuxPlanoNome.AsString;
  if fConsPlanoContas.mAuxPlanoSubItem.AsString = 'N' then
  begin
    for i := 1 to 74 - Length(RLLabel5.Caption) do
      RLLabel5.Caption := RLLabel5.Caption + '.';
  end
  else
  if fConsPlanoContas.mAuxPlanoSubItem.AsString = 'S' then
  begin
    if Trim(fConsPlanoContas.mAuxPlanoNomePlanoItens.AsString) <> '' then
      RLLabel5.Caption := fConsPlanoContas.mAuxPlanoNomePlanoItens.AsString;
    RLLabel5.Caption := '    ' + RLLabel5.Caption;
  end;
  RLDBText1.Visible := (StrToFloat(FormatFloat('0.00',fConsPlanoContas.mAuxPlanoVlrEntrada.AsFloat)) > 0);
  RLDBText2.Visible := (StrToFloat(FormatFloat('0.00',fConsPlanoContas.mAuxPlanoVlrSaida.AsFloat)) > 0);

  if fConsPlanoContas.mAuxPlanoSubItem.AsString = 'S' then
  begin
    vVlrEntradaTipo  := vVlrEntradaTipo + fConsPlanoContas.mAuxPlanoVlrEntrada.AsFloat;
    vVlrEntradaGeral := vVlrEntradaGeral + fConsPlanoContas.mAuxPlanoVlrEntrada.AsFloat;
    vVlrSaidaTipo    := vVlrSaidaTipo + fConsPlanoContas.mAuxPlanoVlrSaida.AsFloat;
    vVlrSaidaGeral   := vVlrSaidaGeral + fConsPlanoContas.mAuxPlanoVlrSaida.AsFloat;
  end;
end;

procedure TfRelPlanoContas.FormCreate(Sender: TObject);
begin
  vVlrEntradaTipo  := 0;
  vVlrEntradaGeral := 0;
  vVlrSaidaTipo    := 0;
  vVlrSaidaGeral   := 0;
end;

procedure TfRelPlanoContas.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel10.Caption := FormatFloat('###,###,##0.00',vVlrEntradaTipo);
  RLLabel9.Caption  := FormatFloat('###,###,##0.00',vVlrSaidaTipo);

  vVlrEntradaTipo   := 0;
  vVlrSaidaTipo     := 0;
end;

procedure TfRelPlanoContas.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel12.Caption := FormatFloat('###,###,##0.00',vVlrEntradaGeral);
  RLLabel11.Caption  := FormatFloat('###,###,##0.00',vVlrSaidaGeral);

  vVlrEntradaGeral   := 0;
  vVlrSaidaGeral     := 0;
end;

procedure TfRelPlanoContas.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel1.Caption := 'Relatório de Plano de Contas';
  if (fConsPlanoContas.DateEdit1.Date > 10) and (fConsPlanoContas.DateEdit2.Date > 10) then
    RLLabel1.Caption := RLLabel1.Caption + ' - ' + fConsPlanoContas.DateEdit1.Text + ' a ' + fConsPlanoContas.DateEdit2.Text;
end;

end.
