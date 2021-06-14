unit UCupomFiscalPgto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RxLookup, StdCtrls, Buttons, ExtCtrls, Mask,
  DB, DBTables, RxDBComb, DBCtrls;

type
  TfCupomFiscalPgto = class(TForm)
    Panel5: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    tCReceberIns: TTable;
    tCReceberInsFilial: TIntegerField;
    tCReceberInsNumCReceber: TIntegerField;
    tCReceberInsNumNota: TIntegerField;
    tCReceberInsQuitado: TBooleanField;
    tCReceberInsCodCli: TIntegerField;
    tCReceberInsTipoDoc: TStringField;
    tCReceberInsDtGerado: TDateField;
    tCReceberInsHistorico: TStringField;
    tCReceberInsCancelado: TBooleanField;
    Label6: TLabel;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    Label3: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Mostrar_Prazo(Tipo : String);
    procedure Gerar_Parcelas;
    procedure Gravar_CupomFiscalParc(Data : TDateTime; Valor : Real);
    procedure Le_CupomFiscalParc;
    procedure Gravar_CReceber;
    procedure Gravar_MovFinanceiro;
    procedure Calcula_Troco;
  public
    { Public declarations }
  end;

var
  fCupomFiscalPgto: TfCupomFiscalPgto;

implementation

uses UDM1, UDMCupom, UCupomFiscalCli, uUtilCupomFiscal, UCupomFiscalC;

{$R *.dfm}

procedure TfCupomFiscalPgto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tTipoCobranca.Filtered := False;
  dm1.tTipoCobranca.filter   := '';
  Action := Cafree;
end;

procedure TfCupomFiscalPgto.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfCupomFiscalPgto.BitBtn1Click(Sender: TObject);
begin
  if ((DMCupom.cdsCupomFiscalTIPOPGTO.AsString = 'P') or (StrToFloat(FormatFloat('0.00',DMCupom.cdsCupomFiscalVLRRECEBIDO.AsFloat)) <= 0)) and (RxDBLookupCombo2.Text = '')  then
    Raise Exception.Create('Condição de pagamento obrigatória!');

  Gerar_Parcelas;
  if DMCupom.cdsCupomFiscalTIPOPGTO.AsString = 'P' then
    Le_CupomFiscalParc
  else
    Gravar_MovFinanceiro;

  if DM1.tCReceber.State in [dsEdit,dsInsert] then
    DM1.tCReceber.Post;

  DMCupom.cdsCupomFiscal.Post;
  DMCupom.cdsCupomFiscal.ApplyUpdates(0);

  if not fCupomFiscalC.ckTeste.Checked then
    prc_Pgto_Cupom_Daruma(RxDBLookupCombo3.Text,RxDBLookupCombo2.Text,dmCupom.cdsCupomFiscalVLRTOTAL.AsCurrency);

  Close;
end;

procedure TfCupomFiscalPgto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := (DMCupom.cdsCupomFiscalCODCLIENTE.AsInteger > 0);
  if not CanClose then
    ShowMessage('É obrigatório informar o cliente!');
end;

procedure TfCupomFiscalPgto.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tCondPgto.IndexFieldNames := 'Nome';
end;

procedure TfCupomFiscalPgto.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tTipoCobranca.IndexFieldNames := 'Nome';
end;

procedure TfCupomFiscalPgto.BitBtn4Click(Sender: TObject);
begin
  Mostrar_Prazo('V');
  DBEdit1.SetFocus;
end;

procedure TfCupomFiscalPgto.Mostrar_Prazo(Tipo: String);
begin
  DMCupom.cdsCupomFiscalTIPOPGTO.AsString := Tipo;
  Panel3.Visible := (Tipo = 'P');
end;

procedure TfCupomFiscalPgto.DBEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Calcula_Troco;
end;

procedure TfCupomFiscalPgto.BitBtn3Click(Sender: TObject);
begin
  Mostrar_Prazo('P');
  DBEdit1.SetFocus;
end;

procedure TfCupomFiscalPgto.Gerar_Parcelas;
var
  vVlrParcelas: Real;
  vVlrRestante: Real;
  vDataAux: TDateTime;
begin
  if RxDBLookupCombo2.Text = '' then
    Gravar_CupomFiscalParc(DMCupom.cdsCupomFiscalDTEMISSAO.AsDateTime,DMCupom.cdsCupomFiscalVLRTOTAL.AsFloat)
  else
  if (DM1.tCondPgto.Locate('Codigo',RxDBLookupCombo2.KeyValue,[loCaseInsensitive])) then
  begin
    vVlrParcelas := StrToFloat(FormatFloat('0.00',DMCupom.cdsCupomFiscalVLRTOTAL.AsFloat / DM1.tCondPgtoItem.RecordCount));
    vVlrRestante := StrToFloat(FormatFloat('0.00',DMCupom.cdsCupomFiscalVLRTOTAL.AsFloat));
    DM1.tCondPgtoItem.First;
    while not DM1.tCondPgtoItem.Eof do
    begin
      if StrToFloat(FormatFloat('0.00',vVlrParcelas)) > StrToFloat(FormatFloat('0.00',vVlrRestante)) then
        vVlrParcelas := StrToFloat(FormatFloat('0.00',vVlrRestante));
      vDataAux := DMCupom.cdsCupomFiscalDTEMISSAO.AsDateTime + DM1.tCondPgtoItemQtdDias.AsInteger;
      Gravar_CupomFiscalParc(vDataAux,vVlrParcelas);
      vVlrRestante := StrToFloat(FormatFloat('0.00',vVlrRestante - vVlrParcelas));
      if StrToFloat(FormatFloat('0.00',vVlrRestante)) <= 0 then
        DM1.tCondPgtoItem.Last;
      DM1.tCondPgtoItem.Next;
    end;
  end;
end;

procedure TfCupomFiscalPgto.Gravar_CupomFiscalParc(Data: TDateTime;
  Valor: Real);
var
  vParcelaAux : Integer;
begin
  DMCupom.cdsCupomFiscalParc.Last;
  vParcelaAux := DMCupom.cdsCupomFiscalParcPARCELA.AsInteger;

  DMCupom.cdsCupomFiscalParc.Insert;
  DMCupom.cdsCupomFiscalParcID_CUPOM.AsInteger      := DMCupom.cdsCupomFiscalID_CUPOM.AsInteger;
  DMCupom.cdsCupomFiscalParcPARCELA.AsInteger       := vParcelaAux + 1;
  DMCupom.cdsCupomFiscalParcDTVENCIMENTO.AsDateTime := Data;
  DMCupom.cdsCupomFiscalParcVALOR.AsFloat           := Valor;
  DMCupom.cdsCupomFiscalParc.Post;
end;

procedure TfCupomFiscalPgto.Le_CupomFiscalParc;
begin
  DMCupom.cdsCupomFiscalParc.First;
  while not DMCupom.cdsCupomFiscalParc.Eof do
  begin
    Gravar_CReceber;
    DMCupom.cdsCupomFiscalParc.Next;
  end;

end;

procedure TfCupomFiscalPgto.Gravar_CReceber;
var
  vDtGerado : TDate;
  vParcela : Integer;
  vNumAux : Integer;
  vFlag : Boolean;
begin
  if DM1.tCReceber.State in [dsBrowse] then
  begin
    tCReceberIns.Close;
    tCReceberIns.Open;
    tCReceberIns.IndexFieldNames  := 'Filial;NumCReceber';
    DM1.tCReceber.IndexFieldNames := 'Filial;NumCReceber';
    tCReceberIns.Refresh;
    tCReceberIns.Last;

    DM1.tCReceber.Insert;
    Dm1.tCReceberFilial.AsInteger := DMCupom.cdsCupomFiscalFILIAL.AsInteger;
    vflag := False;
    vNumAux := tCReceberInsNumCReceber.AsInteger;
    while vflag = False do
    begin
      vNumAux := vNumAux + 1;
      try
        DM1.tCReceberNumCReceber.AsInteger := vNumAux;
        DM1.tCReceber.Post;
        DM1.tCReceber.Refresh;
        tCReceberIns.Refresh;
        DM1.tCReceber.Locate('Filial;NumCReceber',VarArrayOf([DMCupom.cdsCupomFiscalFILIAL.AsInteger,vNumAux]),[locaseinsensitive]);
        DM1.tCReceber.Edit;
        vflag := True;
      except
        on E: Exception do
        begin
          ShowMessage('Não foi possível gravar contas a receber, ' + E.Message + '! Clique para continuar!');
          vFlag := False;
        end;
      end;
    end;

    DM1.tCReceberNumNota.AsInteger    := DMCupom.cdsCupomFiscalNUMCUPOM.AsInteger;
    DM1.tCReceberNumSeqNota.AsInteger := DMCupom.cdsCupomFiscalID_CUPOM.AsInteger;
    DM1.tCReceberSerie.AsString       := 'CF';
    DM1.tCReceberCodCli.AsInteger     := DMCupom.cdsCupomFiscalCODCLIENTE.AsInteger;
    DM1.tCReceberTipoDoc.AsString     := 'CF';
    DM1.tCReceberDtGerado.AsDateTime  := DMCupom.cdsCupomFiscalDTEMISSAO.AsDateTime;
    DM1.tCReceberCancelado.AsBoolean  := False;
  end;
    
  DM1.tCReceberParc.Insert;
  DM1.tCReceberParcFilial.AsInteger           := DM1.tCReceberFilial.AsInteger;
  DM1.tCReceberParcDtGerado.AsDateTime        := DM1.tCReceberDtGerado.AsDateTime;
  DM1.tCReceberParcNumCReceber.AsInteger      := DM1.tCReceberNumCReceber.AsInteger;
  DM1.tCReceberParcParcCReceber.AsInteger     := DMCupom.cdsCupomFiscalParcPARCELA.AsInteger;
  DM1.tCReceberParcVlrParcCReceber.AsCurrency := DMCupom.cdsCupomFiscalParcVALOR.AsFloat;
  DM1.tCReceberParcRestParcela.AsFloat        := DMCupom.cdsCupomFiscalParcVALOR.AsFloat;
  DM1.tCReceberParcDtVencCReceber.AsDateTime  := DMCupom.cdsCupomFiscalParcDTVENCIMENTO.AsFloat;
  DM1.tCReceberParcCodCli.AsInteger           := DM1.tCReceberCodCli.AsInteger;
  DM1.tCReceberParcNumNota.AsInteger          := DM1.tCReceberNumNota.AsInteger;
  DM1.tCReceberParcSerie.AsString             := DM1.tCReceberSerie.AsString;
  DM1.tCReceberParcNumSeqNota.AsInteger       := DM1.tCReceberNumSeqNota.AsInteger;
  DM1.tCReceberParcCodVendedor.AsInteger      := DMCupom.cdsCupomFiscalCODVENDEDOR.AsInteger;
  DM1.tCReceberParcPercComissao.AsCurrency    := DMCupom.cdsCupomFiscalPERCVENDEDOR.AsFloat;
  DM1.tCReceberParcPlanoContas.AsInteger      := 0;
  DM1.tCReceberParcTipoDoc.AsString           := DM1.tCReceberTipoDoc.AsString;
  DM1.tCReceberParcComissaoItem.AsBoolean     := False;
  DM1.tCReceberParcCodTipoCobranca.AsInteger  := DMCupom.cdsCupomFiscalCODTIPOCOBRANCA.AsInteger;
  DM1.tCReceberParcCodConta.AsInteger         := 0;
  DM1.tCReceberParcCodBancoBoleto.AsInteger   := 0;
  DM1.tCReceberParc.Post;

  DM1.tCReceberVlrTotal.AsFloat               := DM1.tCReceberVlrTotal.AsFloat + DM1.tCReceberParcVlrParcCReceber.AsFloat;

  dm1.GravaEnt_tCReceberParcHist('ENT');
end;

procedure TfCupomFiscalPgto.Gravar_MovFinanceiro;
begin
  DM1.tMovimentos.MasterSource.Enabled := False;

  DM1.tMovimentos.Insert;
  DM1.tMovimentosCodConta.AsInteger             := 1;
  DM1.tMovimentosFilial.AsInteger               := DMCupom.cdsCupomFiscalFILIAL.AsInteger;
  DM1.tMovimentosDtMovimento.AsDateTime         := DMCupom.cdsCupomFiscalDTEMISSAO.AsDateTime;
  DM1.tMovimentosCodCli.AsInteger               := DMCupom.cdsCupomFiscalCODCLIENTE.AsInteger;
  DM1.tMovimentosPlanoContas.AsInteger          := 0;
  DM1.tMovimentosCodPlanoContasItens.AsInteger  := 0;
  DM1.tMovimentosVlrMovCredito.AsCurrency       := StrToFloat(FormatFloat('0.00',DMCupom.cdsCupomFiscalVLRTOTAL.AsFloat));
  DM1.tMovimentosHistorico.AsString             := 'Cupom Fiscal Nº ' + DMCupom.cdsCupomFiscalNUMCUPOM.AsString;
  DM1.tMovimentos.Post;

  DMCupom.cdsCupomFiscalNUMMOVFINANCEIRO.AsInteger := DM1.tMovimentosNumMovimento.AsInteger;

  DM1.tMovimentos.MasterSource.Enabled := True;
end;

procedure TfCupomFiscalPgto.BitBtn5Click(Sender: TObject);
begin
  fCupomFiscalCli := TfCupomFiscalCli.Create(Self);
  fCupomFiscalCli.ShowModal;
end;

procedure TfCupomFiscalPgto.DBEdit1Exit(Sender: TObject);
begin
  Calcula_Troco;
end;

procedure TfCupomFiscalPgto.FormCreate(Sender: TObject);
begin
  DM1.tTipoCobranca.Filtered := False;
  dm1.tTipoCobranca.filter   := 'MostrarNoCupom = True';
  DM1.tTipoCobranca.Filtered := True;
end;

procedure TfCupomFiscalPgto.Calcula_Troco;
var
  vVlrRecebidoAux: Real;
begin
  vVlrRecebidoAux := StrToFloat(DBEdit1.Text);
  DMCupom.cdsCupomFiscalVLRTROCO.AsFloat := StrToFloat(FormatFloat('0.00',0));
  if (StrToFloat(FormatFloat('0.00',vVlrRecebidoAux)) > 0) and
     (StrToFloat(FormatFloat('0.00',DMCupom.cdsCupomFiscalVLRTOTAL.AsFloat)) > StrToFloat(FormatFloat('0.00',vVlrRecebidoAux))) then
    Raise Exception.Create('Valor recebido não pode ser menor que valor total!');
  if (StrToFloat(FormatFloat('0.00',vVlrRecebidoAux)) > 0) then
  begin
    DMCupom.cdsCupomFiscalVLRTROCO.AsFloat := StrToFloat(FormatFloat('0.00',vVlrRecebidoAux - DMCupom.cdsCupomFiscalVLRTOTAL.AsFloat));
    Mostrar_Prazo('V');
    BitBtn1.SetFocus;
  end
  else
  if (StrToFloat(FormatFloat('0.00',vVlrRecebidoAux)) <= 0) then
  begin
    Mostrar_Prazo('P');
    RxDBLookupCombo2.SetFocus;
  end;
end;

end.
