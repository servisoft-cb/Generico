unit URelCPagarForn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelCPagarForn = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel21: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel22: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLBand2: TRLBand;
    RLMemo1: TRLMemo;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLSubDetail1: TRLSubDetail;
    RLDraw1: TRLDraw;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDraw2: TRLDraw;
    RLBand4: TRLBand;
    RLLabel8: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelCPagarForn: TfRelCPagarForn;

implementation

uses UConsCPagar2, ToolEdit;

{$R *.dfm}

procedure TfRelCPagarForn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCPagarForn.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  vTexto2 : String;  
begin
  vTexto2 := '';
  RLMemo1.Lines.Clear;
  if fConsCPagar2.RxDBLookupCombo1.Text <> '' then
    vTexto2 := vTexto2 + '(Forn:' + Copy(fConsCPagar2.RxDBLookupCombo1.Text,1,25) + ')';
  if fConsCPagar2.RxDBLookupCombo2.Text <> '' then
    vTexto2 := vTexto2 + '(Filial:' + Copy(fConsCPagar2.RxDBLookupCombo2.Text,1,25) + ')';
  if (fConsCPagar2.DateEdit1.Date > 10) and (fConsCPagar2.DateEdit2.Date > 10) then
    vTexto2 := vTexto2 + '(Dt.Vecto:' + fConsCPagar2.DateEdit1.Text + ' a ' + fConsCPagar2.DateEdit2.Text + ')'
  else
  if (fConsCPagar2.DateEdit1.Date > 10) then
    vTexto2 := vTexto2 + '(Dt.Vecto Ini:' + fConsCPagar2.DateEdit1.Text + ')'
  else
  if (fConsCPagar2.DateEdit2.Date > 10) then
    vTexto2 := vTexto2 + '(Dt.Vecto Fin:' + fConsCPagar2.DateEdit2.Text + ')';

  if (fConsCPagar2.DateEdit3.Date > 10) and (fConsCPagar2.DateEdit4.Date > 10) then
    vTexto2 := vTexto2 + '(Dt.Emissão:' + fConsCPagar2.DateEdit3.Text + ' a ' + fConsCPagar2.DateEdit4.Text + ')'
  else
  if (fConsCPagar2.DateEdit3.Date > 10) then
    vTexto2 := vTexto2 + '(Dt.Emissão Ini:' + fConsCPagar2.DateEdit3.Text + ')'
  else
  if (fConsCPagar2.DateEdit4.Date > 10) then
    vTexto2 := vTexto2 + '(Dt.Emissão Fin:' + fConsCPagar2.DateEdit4.Text + ')';
  case fConsCPagar2.ComboBox1.ItemIndex of
    0 : vTexto2 := vTexto2 + '(Pendentes)';
    1 : vTexto2 := vTexto2 + '(Pagas)';
    2 : vTexto2 := vTexto2 + '(Todos)';
  end;
  RLMemo1.Lines.Text := vTexto2;
end;

end.
