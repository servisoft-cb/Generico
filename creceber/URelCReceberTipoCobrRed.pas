unit URelCReceberTipoCobrRed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelCReceberTipoCobrRed = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel21: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel22: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLDraw1: TRLDraw;
    RLSubDetail1: TRLSubDetail;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
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
    RLLabel9: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText5: TRLDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    vCabecalho : String;
  public
    { Public declarations }
  end;

var
  fRelCReceberTipoCobrRed: TfRelCReceberTipoCobrRed;

implementation

uses UConsCReceber, DB, ToolEdit;

{$R *.dfm}

procedure TfRelCReceberTipoCobrRed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCReceberTipoCobrRed.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := True;
  //if (fConsCReceber.ComboBox1.ItemIndex = 3) or (fConsCReceber.ComboBox1.ItemIndex = 4) then
  if (fConsCReceber.ComboBox1.ItemIndex = 3)  then
    PrintIt := False;
end;

procedure TfRelCReceberTipoCobrRed.RLBand1BeforePrint(Sender: TObject;
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

end.
