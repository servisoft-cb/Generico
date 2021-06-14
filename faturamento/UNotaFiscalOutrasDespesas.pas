unit UNotaFiscalOutrasDespesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ToolEdit,
  CurrEdit, ExtCtrls, DB;

type
  TfNotaFiscalOutrasDespesas = class(TForm)
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Label21: TLabel;
    Label6: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label22: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit5: TDBEdit;
    Bevel4: TBevel;
    Label8: TLabel;
    CheckBox5: TCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    vVlrPis, vVlrCofins, vVlrTaxaCiscomex, vVlrOutros, vVlrOutrasDespesas, vVlrImpImportacao: Real;
    vVlrSeguro, vVlrFrete: Real;
    //NFe 2.00
    vBaseIcmsOutros, vVlrIcmsOutros, vVlrDuplicataOutros: Real;
  public
    { Public declarations }
  end;

var
  fNotaFiscalOutrasDespesas: TfNotaFiscalOutrasDespesas;

implementation

uses UDM1, UEmissaoNotaFiscal;

{$R *.dfm}

procedure TfNotaFiscalOutrasDespesas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfNotaFiscalOutrasDespesas.FormShow(Sender: TObject);
begin
  vVlrPis             := DM1.tNotaFiscalVlrPis.AsFloat;
  vVlrCofins          := DM1.tNotaFiscalVlrCofins.AsFloat;
  vVlrTaxaCiscomex    := DM1.tNotaFiscalVlrTaxaCiscomex.AsFloat;
  vVlrOutros          := DM1.tNotaFiscalVlrOutros.AsFloat;
  vVlrOutrasDespesas  := DM1.tNotaFiscalOutrasDesp.AsFloat;
  vVlrFrete           := DM1.tNotaFiscalVlrFrete.AsFloat;
  vVlrSeguro          := DM1.tNotaFiscalVlrSeguro.AsFloat;
  vBaseIcmsOutros     := DM1.tNotaFiscalBaseIcmsOutros.AsFloat;
  vVlrIcmsOutros      := DM1.tNotaFiscalVlrIcmsOutros.AsFloat;
  vVlrDuplicataOutros := DM1.tNotaFiscalVlrDuplicataOutros.AsFloat;
  if vAliqICMS > 0 then
    DM1.tNotaFiscalAliqICMS_OutrosValores.AsFloat := vAliqICMS
  else
    DM1.tNotaFiscalAliqICMS_OutrosValores.AsFloat := 17;
  DM1.tNotaFiscalAliqICMS_Frete.AsFloat := 0;
  CheckBox5.Checked := DM1.tNotaFiscalPisCofinsSomarOutrasDesp.AsBoolean;

  Panel1.Enabled := (DM1.tNotaFiscal.State in [dsEdit,dsInsert]);
end;

procedure TfNotaFiscalOutrasDespesas.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfNotaFiscalOutrasDespesas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  vVlrAux, vVlrIcmsAux : Real;
  vOutrasDespesasAux : Real;
  vBaseIcmsOutrosAux, vVlrIcmsOutrosAux, vVlrDuplicataAux : Real;
begin
  if DM1.tNotaFiscal.State in [dsEdit,dsInsert] then
  begin
    //NFe 2.00
    vOutrasDespesasAux := 0;
    vVlrDuplicataAux   := 0;
    vBaseIcmsOutrosAux := 0;
    vVlrIcmsOutrosAux  := 0;
    //Pis Cofins
    DM1.tNotaFiscalPisCofinsSomarOutrasDesp.AsBoolean := CheckBox5.Checked;
    if CheckBox5.Checked then
      vOutrasDespesasAux := vOutrasDespesasAux + DM1.tNotaFiscalVlrCofins.AsFloat + DM1.tNotaFiscalVlrPis.AsFloat;
    if DM1.tNotaFiscalGeraDupl_PisCofins.AsBoolean then
      vVlrDuplicataAux := vVlrDuplicataAux + DM1.tNotaFiscalVlrCofins.AsFloat + DM1.tNotaFiscalVlrPis.AsFloat;
                                           
    if (DM1.tNotaFiscalAliqICMS_PisCofins.AsFloat > 0) and (DM1.tNotaFiscalVlrPis.AsFloat > 0) and (DM1.tNotaFiscalVlrCofins.AsFloat > 0) then
    begin
      vVlrAux            := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrPis.AsFloat + DM1.tNotaFiscalVlrCofins.AsFloat) * DM1.tNotaFiscalAliqICMS_PisCofins.AsFloat / 100));
      vVlrIcmsOutrosAux  := vVlrIcmsOutrosAux + vVlrAux;
      vBaseIcmsOutrosAux := vBaseIcmsOutrosAux + DM1.tNotaFiscalVlrPis.AsFloat + DM1.tNotaFiscalVlrCofins.AsFloat;
    end;

    //Taxas
    vVlrAux            := DM1.tNotaFiscalVlrTaxaCiscomex.AsFloat + DM1.tNotaFiscalVlrImpImportacao.AsFloat + DM1.tNotaFiscalVlrOutros.AsFloat + DM1.tNotaFiscalVlrAduaneira.AsFloat;
    if DM1.tNotaFiscalGeraDupl_OutrosValores.AsBoolean then
      vVlrDuplicataAux := vVlrDuplicataAux + StrToFloat(FormatFloat('0.00',vVlrAux));
    vOutrasDespesasAux := vOutrasDespesasAux + StrToFloat(FormatFloat('0.00',vVlrAux));
    if StrToFloat(FormatFloat('0.00',vVlrAux)) > 0 then
    begin
      if DM1.tNotaFiscalAliqICMS_OutrosValores.AsFloat > 0 then
      begin
        vVlrIcmsAux        := StrToFloat(FormatFloat('0.00',vVlrAux * DM1.tNotaFiscalAliqICMS_OutrosValores.AsFloat / 100));
        vVlrIcmsOutrosAux  := vVlrIcmsOutrosAux + vVlrIcmsAux;
        vBaseIcmsOutrosAux := vBaseIcmsOutrosAux + vVlrAux;
      end;
    end;

    if DM1.tNotaFiscalVlrFrete.AsFloat > 0 then
    begin
      if DM1.tNotaFiscalAliqICMS_Frete.AsFloat > 0 then
      begin
        vVlrIcmsAux        := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrFrete.AsFloat * DM1.tNotaFiscalAliqICMS_Frete.AsFloat) / 100));
        vVlrIcmsOutrosAux  := vVlrIcmsOutrosAux + vVlrIcmsAux;
        vBaseIcmsOutrosAux := vBaseIcmsOutrosAux + vVlrAux;
      end;
      if DM1.tNotaFiscalGeraDupl_Frete.AsBoolean then
        vVlrDuplicataAux := vVlrDuplicataAux + DM1.tNotaFiscalVlrFrete.AsFloat;
    end;

    if (DM1.tNotaFiscalVlrSeguro.AsFloat > 0) and (DM1.tNotaFiscalGeraDupl_Seguro.AsBoolean) then
      vVlrDuplicataAux := vVlrDuplicataAux + DM1.tNotaFiscalVlrSeguro.AsFloat;

    DM1.tNotaFiscalVlrDuplicataOutros.AsFloat := vVlrDuplicataAux;
    DM1.tNotaFiscalVlrTotalDupl.AsFloat       := DM1.tNotaFiscalVlrTotalDupl.AsFloat + DM1.tNotaFiscalVlrDuplicataOutros.AsFloat - vVlrDuplicataOutros;

    DM1.tNotaFiscalBaseIcmsOutros.AsFloat := vBaseIcmsOutrosAux;
    DM1.tNotaFiscalBaseIcms.AsFloat       := DM1.tNotaFiscalBaseIcms.AsFloat + DM1.tNotaFiscalBaseIcmsOutros.AsFloat - vBaseIcmsOutros;

    DM1.tNotaFiscalVlrIcmsOutros.AsFloat := vVlrIcmsOutrosAux;
    DM1.tNotaFiscalVlrIcms.AsFloat       := DM1.tNotaFiscalVlrIcms.AsFloat + DM1.tNotaFiscalVlrIcmsOutros.AsFloat - vVlrIcmsOutros;

    DM1.tNotaFiscalOutrasDesp.AsFloat    := DM1.tNotaFiscalOutrasDesp.AsFloat + vOutrasDespesasAux - 
                                            vVlrOutrasDespesas;
  end;

end;

end.
