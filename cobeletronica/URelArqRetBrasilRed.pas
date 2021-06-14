unit URelArqRetBrasilRed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RLReport;

type
  TfRelArqRetBrasilRed = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel21: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel22: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    rlFilial: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLDraw1: TRLDraw;
    RLLabel13: TRLLabel;
    RLSubDetail1: TRLSubDetail;
    RLLabel18: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLLabel20: TRLLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDraw2: TRLDraw;
    RLDBText9: TRLDBText;
    rlOcorrencia: TRLMemo;
    RLBand5: TRLBand;
    RLLabel10: TRLLabel;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLLabel23: TRLLabel;
    RLDBResult5: TRLDBResult;
    RLLabel24: TRLLabel;
    RLBand3: TRLBand;
    RLLabel11: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLLabel12: TRLLabel;
    RLDBResult6: TRLDBResult;
    RLLabel14: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel15: TRLLabel;
    RLDBText10: TRLDBText;
    RLLabel16: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelArqRetBrasilRed: TfRelArqRetBrasilRed;

implementation

uses UArqRetornoBrasil, UDM1;

{$R *.dfm}

procedure TfRelArqRetBrasilRed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelArqRetBrasilRed.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  rlFilial.Caption := DM1.tFilialEmpresa.AsString;
end;

procedure TfRelArqRetBrasilRed.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel16.Caption := fArqRetornoBrasil.mArquivoTipoCobranca.AsString + ' - ';
  if fArqRetornoBrasil.mArquivoTipoCobranca.AsString = '1' then
    RLLabel16.Caption := RLLabel16.Caption + 'SIMPLES'
  else
  if fArqRetornoBrasil.mArquivoTipoCobranca.AsString = '2' then
    RLLabel16.Caption := RLLabel16.Caption + 'VINCULADA'
  else
  if fArqRetornoBrasil.mArquivoTipoCobranca.AsString = '4' then
    RLLabel16.Caption := RLLabel16.Caption + 'DESCONTADA'
  else
  if fArqRetornoBrasil.mArquivoTipoCobranca.AsString = '7' then
    RLLabel16.Caption := RLLabel16.Caption + 'COBRANCA SIMPLES CARTEIRA 17'
  else
  if fArqRetornoBrasil.mArquivoTipoCobranca.AsString = '8' then
    RLLabel16.Caption := RLLabel16.Caption + 'VENDOR';

  rlOcorrencia.Lines.Clear;
  rlOcorrencia.Lines.Text := fArqRetornoBrasil.mArquivoCodOcorrenciaRet.AsString + '-'
                           + fArqRetornoBrasil.mArquivoNomeOcorrenciaRet.AsString + ' ' + fArqRetornoBrasil.mArquivoDescLiquidacao.AsString;
  if fArqRetornoBrasil.mArquivoCodOcorrenciaRet.AsString = '03' then
    rlOcorrencia.Lines.Text := rlOcorrencia.Lines.Text + '  ('+ fArqRetornoBrasil.mArquivoDescErro1.AsString + ' ' +
                               fArqRetornoBrasil.mArquivoDescErro2.AsString + ' ' + fArqRetornoBrasil.mArquivoDescErro3.AsString + ')';
end;

end.
