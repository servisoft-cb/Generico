unit URelCobrancaEletronica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelCobrancaEletronica = class(TForm)
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
    RLDraw1: TRLDraw;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDraw2: TRLDraw;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLBand5: TRLBand;
    RLLabel11: TRLLabel;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLLabel23: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelCobrancaEletronica: TfRelCobrancaEletronica;

implementation

uses UCobrancaEletronica, UCobBrasil;

{$R *.dfm}

procedure TfRelCobrancaEletronica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCobrancaEletronica.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel10.Caption := '';
  if (fCobrancaEletronica.CheckBox1.Checked) and not(fCobrancaEletronica.mTitulosArqGerado.AsBoolean) then
    PrintIt := False
  else
    PrintIt := True;

  if fCobrancaEletronica.mTitulosArqGerado.AsBoolean then
    RLLabel10.Caption := 'Sim';
end;

procedure TfRelCobrancaEletronica.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel1.Caption := 'Relatório de Cobrança Eletrônica - ' + fCobrancaEletronica.RxDBLookupCombo2.Text;
end;

end.
