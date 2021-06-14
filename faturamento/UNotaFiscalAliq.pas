unit UNotaFiscalAliq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, Buttons, RxLookup, ExtCtrls;

type
  TfNotaFiscalAliq = class(TForm)
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label4: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    RxDBCodPis: TRxDBLookupCombo;
    Label7: TLabel;
    Label23: TLabel;
    RXDBCodCofins: TRxDBLookupCombo;
    Label5: TLabel;
    cbTipoPis: TComboBox;
    cbTipoCofins: TComboBox;
    Label6: TLabel;
    Label8: TLabel;
    rxdbOrigem: TRxDBLookupCombo;
    Label9: TLabel;
    cbSomaTotal: TComboBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label10: TLabel;
    cePercImportacao: TCurrencyEdit;
    Label11: TLabel;
    ceDespAduaneira: TCurrencyEdit;
    ckSomaImportacao: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNotaFiscalAliq: TfNotaFiscalAliq;

implementation

uses UEmissaoNotaFiscal, UDMTabImposto;

{$R *.dfm}

procedure TfNotaFiscalAliq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfNotaFiscalAliq.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfNotaFiscalAliq.BitBtn1Click(Sender: TObject);
begin
  fEmissaoNotaFiscal.vPercPis             := CurrencyEdit1.Value;
  fEmissaoNotaFiscal.vPercCofins          := CurrencyEdit2.Value;
  fEmissaoNotaFiscal.vVlrPis              := CurrencyEdit3.Value;
  fEmissaoNotaFiscal.vVlrCofins           := CurrencyEdit4.Value;
  fEmissaoNotaFiscal.vPercImportacao      := cePercImportacao.Value;
  fEmissaoNotaFiscal.vVlrAduaneira        := ceDespAduaneira.Value;
  fEmissaoNotaFiscal.vSoma_Automatico_Imp := ckSomaImportacao.Checked;
  //fEmissaoNotaFiscal.vPercFederal   := ceFederal.Value;
  //fEmissaoNotaFiscal.vPercEstadual  := ceEstadual.Value;
  //fEmissaoNotaFiscal.vPercMunicipal := ceMunicipal.Value;


  if RxDBCodPis.Text <> '' then
    fEmissaoNotaFiscal.vCodPis     := RxDBCodPis.Value
  else
    fEmissaoNotaFiscal.vCodPis     := '';
  if RXDBCodCofins.Text <> '' then
    fEmissaoNotaFiscal.vCodCofins  := RXDBCodCofins.Value
  else
    fEmissaoNotaFiscal.vCodCofins  := '';
  if cbTipoPis.ItemIndex = 0 then
    fEmissaoNotaFiscal.vTipoPis := 'P'
  else
    fEmissaoNotaFiscal.vTipoPis := 'V';
  if cbTipoCofins.ItemIndex = 0 then
    fEmissaoNotaFiscal.vTipoCofins := 'P'
  else
    fEmissaoNotaFiscal.vTipoCofins := 'V';
  fEmissaoNotaFiscal.vOrigemMerc := rxdbOrigem.Value;

  if cbSomaTotal.ItemIndex = 0 then
    fEmissaoNotaFiscal.vSomaVlrTotalProd := True
  else
    fEmissaoNotaFiscal.vSomaVlrTotalProd := False;
  Close;
end;

end.
