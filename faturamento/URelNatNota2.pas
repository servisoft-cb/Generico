unit URelNatNota2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelNatNota2 = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel21: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel22: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLBand5: TRLBand;
    RLLabel18: TRLLabel;
    RLDraw2: TRLDraw;
    RLDBResult7: TRLDBResult;
    RLDBResult8: TRLDBResult;
    RLDBResult9: TRLDBResult;
    RLDBResult10: TRLDBResult;
    RLDBResult11: TRLDBResult;
    RLDBResult12: TRLDBResult;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLBand4: TRLBand;
    RLLabel17: TRLLabel;
    RLDraw1: TRLDraw;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
    RLLabel19: TRLLabel;
    RLDBText14: TRLDBText;
    RLLabel20: TRLLabel;
    RLDBText15: TRLDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelNatNota2: TfRelNatNota2;

implementation

uses UDM1, UPrevNotasNatOpe2, ToolEdit, RxLookup;

{$R *.dfm}

procedure TfRelNatNota2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelNatNota2.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel1.Caption := 'RELAÇÃO DE NOTAS EMITIDAS POR NATUREZA - ' +
                      fPrevNotasNatOpe2.DateEdit1.Text + ' a ' + fPrevNotasNatOpe2.DateEdit2.Text;
  RLLabel2.Caption := 'Opção';
  RLLabel3.Caption := '';
  if fPrevNotasNatOpe2.RxDBLookupCombo2.Text <> '' then
    RLLabel3.Caption := RLLabel3.Caption + ' (Nat: ' + fPrevNotasNatOpe2.RxDBLookupCombo2.Text + ')';
  if fPrevNotasNatOpe2.RxDBLookupCombo1.Text <> '' then
    RLLabel3.Caption := RLLabel3.Caption + ' (Filial: ' + IntToStr(fPrevNotasNatOpe2.RxDBLookupCombo1.KeyValue) + ')';
  if fPrevNotasNatOpe2.rxdbclientenotaprev.Text <> '' then
    RLLabel3.Caption := RLLabel3.Caption + ' (Cliente: ' + fPrevNotasNatOpe2.rxdbclientenotaprev.Text + ')';
  if fPrevNotasNatOpe2.CheckBox1.Checked then
    RLLabel3.Caption := RLLabel3.Caption + ' (Só Faturadas)';
  if RLLabel3.Caption = '' then
    RLLabel2.Caption := '';
end;

end.
