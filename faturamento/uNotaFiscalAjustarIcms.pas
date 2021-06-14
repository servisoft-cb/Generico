unit uNotaFiscalAjustarIcms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, RxLookup, RzPanel;

type
  TfNotaFiscalAjustarIcms = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    RxDBCodPis: TRxDBLookupCombo;
    Label23: TLabel;
    RXDBCodCofins: TRxDBLookupCombo;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    rxdbOrigem: TRxDBLookupCombo;
    Label15: TLabel;
    Label16: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label17: TLabel;
    DBEdit13: TDBEdit;
    Label18: TLabel;
    DBMemo1: TDBMemo;
    Label19: TLabel;
    DBEdit14: TDBEdit;
    Label20: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label21: TLabel;
    DBEdit15: TDBEdit;
    Label22: TLabel;
    DBEdit16: TDBEdit;
    Label24: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label25: TLabel;
    DBEdit17: TDBEdit;
    Label26: TLabel;
    DBEdit18: TDBEdit;
    Label27: TLabel;
    DBEdit19: TDBEdit;
    Label28: TLabel;
    DBEdit20: TDBEdit;
    RzGroupBox2: TRzGroupBox;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    Label29: TLabel;
    DBEdit21: TDBEdit;
    Label30: TLabel;
    DBEdit22: TDBEdit;
    Label31: TLabel;
    DBEdit23: TDBEdit;
    Label32: TLabel;
    DBEdit24: TDBEdit;
    Label33: TLabel;
    DBEdit25: TDBEdit;
    Label34: TLabel;
    DBEdit26: TDBEdit;
    Label35: TLabel;
    DBEdit27: TDBEdit;
    Label36: TLabel;
    DBEdit28: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    vBaseIcms, vVlrIcms, vBaseSimples, vVlrSimples, vBaseSubstTrib, vVlrSubstTrib, vVlrIPI, vVlrProduto : Real;
    vVlrPis, vVlrCofins, vVlrTributo, vVlrAduaneira, vVlrImportacao, vVlrOutrasDesp : Real;

    procedure Mover_ValoresAnt;
  public
    { Public declarations }
  end;

var
  fNotaFiscalAjustarIcms: TfNotaFiscalAjustarIcms;

implementation

uses UDM1, DB, UDMTabImposto;

{$R *.dfm}

procedure TfNotaFiscalAjustarIcms.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfNotaFiscalAjustarIcms.FormShow(Sender: TObject);
begin
  BitBtn1.Enabled := (DM1.tNotaFiscal.State in [dsInsert, dsEdit]);
  Panel1.Enabled  := (DM1.tNotaFiscal.State in [dsInsert, dsEdit]);
  Mover_ValoresAnt;
end;

procedure TfNotaFiscalAjustarIcms.Mover_ValoresAnt;
begin
  vBaseIcms      := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensBaseIcms.AsFloat));
  vVlrIcms       := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrIcms.AsFloat));
  vBaseSimples   := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensBaseIcmsSimples.AsFloat));
  vVlrSimples    := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrIcmsSimples.AsFloat));
  vBaseSubstTrib := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensIcmsBaseSubst.AsFloat));
  vVlrSubstTrib  := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensIcmsVlrSubst.AsFloat));
  vVlrIPI        := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrIpi.AsFloat));
  vVlrCofins     := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrCofins.AsFloat));
  vVlrPis        := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrPis.AsFloat));
  vVlrTributo    := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlr_Tributo.AsFloat));
  vVlrProduto    := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrTotal.AsFloat));
  vVlrImportacao := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrImportacao.AsFloat));
  vVlrAduaneira  := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrAduaneira.AsFloat));
  vVlrOutrasDesp := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrOutrasDespesas.AsFloat));
  if DM1.tNotaFiscal.State in [dsInsert, dsEdit] then
  begin
    DM1.tNotaFiscalItens.Edit;
  end;
end;             

procedure TfNotaFiscalAjustarIcms.BitBtn2Click(Sender: TObject);
begin
  if DM1.tNotaFiscalItens.State in [dsEdit] then
    DM1.tNotaFiscalItens.Cancel;
  Close;
end;

procedure TfNotaFiscalAjustarIcms.BitBtn1Click(Sender: TObject);
begin
  DM1.tNotaFiscalItens.Post;

  DM1.tNotaFiscalBaseIcms.AsFloat        := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalBaseIcms.AsFloat - vBaseIcms) + DM1.tNotaFiscalItensBaseIcms.AsFloat));
  DM1.tNotaFiscalVlrIcms.AsFloat         := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrIcms.AsFloat - vVlrIcms) + DM1.tNotaFiscalItensVlrIcms.AsFloat));

  DM1.tNotaFiscalBaseIcmsSimples.AsFloat := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalBaseIcmsSimples.AsFloat - vBaseSimples) + DM1.tNotaFiscalItensBaseIcmsSimples.AsFloat));
  DM1.tNotaFiscalVlrIcmsSimples.AsFloat  := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrIcmsSimples.AsFloat - vVlrSimples) + DM1.tNotaFiscalItensVlrIcmsSimples.AsFloat));

  DM1.tNotaFiscalICMSBaseSubst.AsFloat   := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalICMSBaseSubst.AsFloat - vBaseSubstTrib) + DM1.tNotaFiscalItensIcmsBaseSubst.AsFloat));
  DM1.tNotaFiscalICMSVlrSubst.AsFloat    := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalICMSVlrSubst.AsFloat - vVlrSubstTrib) + DM1.tNotaFiscalItensIcmsVlrSubst.AsFloat));

  DM1.tNotaFiscalVlrIpi.AsFloat          := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrIpi.AsFloat - vVlrIPI) + DM1.tNotaFiscalItensVlrIpi.AsFloat));

  DM1.tNotaFiscalVlrPis.AsFloat          := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrPis.AsFloat - vVlrPis) + DM1.tNotaFiscalItensVlrPis.AsFloat));
  DM1.tNotaFiscalVlrCofins.AsFloat       := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrCofins.AsFloat - vVlrCofins) + DM1.tNotaFiscalItensVlrCofins.AsFloat));

  DM1.tNotaFiscalVlr_Tributo.AsFloat     := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlr_Tributo.AsFloat - vVlrTributo) + DM1.tNotaFiscalItensVlr_Tributo.AsFloat));

  DM1.tNotaFiscalVlrTotalItens.AsFloat   := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrTotalItens.AsFloat - vVlrProduto) + DM1.tNotaFiscalItensVlrTotal.AsFloat));

  DM1.tNotaFiscalVlrImpImportacao.AsFloat := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrImpImportacao.AsFloat - vVlrImportacao) + DM1.tNotaFiscalItensVlrImportacao.AsFloat));
  DM1.tNotaFiscalVlrAduaneira.AsFloat     := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrAduaneira.AsFloat - vVlrAduaneira) + DM1.tNotaFiscalItensVlrAduaneira.AsFloat));
  DM1.tNotaFiscalOutrasDesp.AsFloat       := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalOutrasDesp.AsFloat - vVlrOutrasDesp) + DM1.tNotaFiscalItensVlrOutrasDespesas.AsFloat));
  Close;
end;

procedure TfNotaFiscalAjustarIcms.DBMemo1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    Key := ' ';
end;

end.
