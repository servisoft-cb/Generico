unit URelReciboRec2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, ValorPor, jpeg;

type
  TfRelReciboRec2 = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLDraw1: TRLDraw;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLDraw2: TRLDraw;
    RLLabel2: TRLLabel;
    rlCliente: TRLLabel;
    rlCNPJ: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel3: TRLLabel;
    RLMemo1: TRLMemo;
    RLDraw4: TRLDraw;
    RLLabel4: TRLLabel;
    RLMemo2: TRLMemo;
    RLDraw5: TRLDraw;
    RLLabel5: TRLLabel;
    rlFilial: TRLLabel;
    rlCNPJFilial: TRLLabel;
    rlEndFilial: TRLLabel;
    rlCidFilial: TRLLabel;
    ValorPorExtenso2: TValorPorExtenso;
    RLDraw6: TRLDraw;
    rlCidade: TRLLabel;
    RLLabel6: TRLLabel;
    RLDraw7: TRLDraw;
    RLImage1: TRLImage;
    RLDraw8: TRLDraw;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelReciboRec2: TfRelReciboRec2;

implementation

uses UDM1, DB;

{$R *.dfm}

procedure TfRelReciboRec2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelReciboRec2.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  rlCliente.Caption := DM1.tCReceberParclkNomeCliente.AsString;
  rlCNPJ.Caption    := '';
  if (DM1.tCReceberParclkCgcCpf.AsString <> '   .   .   -  ') or
     (DM1.tCReceberParclkCgcCpf.AsString <> '  .   .   /    -  ') or
     (Trim(DM1.tCReceberParclkCgcCpf.AsString) <> '') then
  begin
    if DM1.tCReceberParclkPessoa.AsString = 'F' then
      rlCNPJ.Caption := 'CPF: ' + DM1.tCReceberParclkCgcCpf.AsString
    else
      rlCNPJ.Caption := 'CNPJ: ' + DM1.tCReceberParclkCgcCpf.AsString;
  end;

  ValorPorExtenso2.Valor := DM1.tCReceberParcHistVlrUltPgto.AsFloat;
  RLMemo1.Lines.Text     := ValorPorExtenso2.Texto;

  RLMemo2.Lines.Clear;
  RLMemo2.Lines.Text := DM1.tCReceberParcHistHistorico.AsString + ' Título: ' + DM1.tCReceberParcNumNota.AsString + ' / ' + DM1.tCReceberParcParcCReceber.AsString;

  rlFilial.Caption     := DM1.tFilialEmpresa.AsString;
  rlCNPJFilial.Caption := 'Cnpj: ' + DM1.tFilialCNPJ.AsString;
  rlEndFilial.Caption  := 'End: ' + DM1.tFilialEndereco.AsString + ', ' + DM1.tFilialNumEnd.AsString;
  rlCidFilial.Caption  := 'Cep: ' + DM1.tFilialCep.AsString + ' - ' + DM1.tFilialBairro.AsString
                        + ' - Cid: ' + DM1.tFilialCidade.AsString + ' - ' + DM1.tFilialEstado.AsString;

  rlCidade.Caption  := DM1.tFilialCidade.AsString + ', ' + DateToStr(Date);

  if FileExists(DM1.tFilialEndLogo.AsString) then
    RLImage1.Picture.LoadFromFile(DM1.tFilialEndLogo.AsString)
  else
    RLImage1.Picture := nil;
end;

end.
