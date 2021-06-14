unit UCupomFiscalC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  Grids, DBGrids, SMDBGrid, DB, FMTBcd, DBClient, Provider, SqlExpr;

type
  TfCupomFiscalC = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label2: TLabel;
    SMDBGrid1: TSMDBGrid;
    StaticText1: TStaticText;
    BitBtn5: TBitBtn;
    sdsCupomFiscal: TSQLDataSet;
    dspCupomFiscal: TDataSetProvider;
    cdsCupomFiscal: TClientDataSet;
    dsCupomFiscal: TDataSource;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    qVerificaUlt: TSQLQuery;
    qVerificaUltNUMCUPOM: TIntegerField;
    sdsCupomFiscalID_CUPOM: TIntegerField;
    sdsCupomFiscalNUMCUPOM: TIntegerField;
    sdsCupomFiscalDTEMISSAO: TDateField;
    sdsCupomFiscalHREMISSAO: TTimeField;
    sdsCupomFiscalCODCLIENTE: TIntegerField;
    sdsCupomFiscalTIPOPGTO: TStringField;
    sdsCupomFiscalCODCONDPGTO: TIntegerField;
    sdsCupomFiscalCODVENDEDOR: TIntegerField;
    sdsCupomFiscalPERCVENDEDOR: TFloatField;
    sdsCupomFiscalBASEICMS: TFloatField;
    sdsCupomFiscalVLRICMS: TFloatField;
    sdsCupomFiscalVLRPRODUTOS: TFloatField;
    sdsCupomFiscalVLRDESCONTO: TFloatField;
    sdsCupomFiscalVLRTOTAL: TFloatField;
    sdsCupomFiscalCANCELADO: TStringField;
    sdsCupomFiscalVLRRECEBIDO: TFloatField;
    sdsCupomFiscalVLRTROCO: TFloatField;
    sdsCupomFiscalNUMMOVFINANCEIRO: TIntegerField;
    sdsCupomFiscalCODCONTA: TIntegerField;
    sdsCupomFiscalFILIAL: TIntegerField;
    sdsCupomFiscalCODTIPOCOBRANCA: TIntegerField;
    cdsCupomFiscalID_CUPOM: TIntegerField;
    cdsCupomFiscalNUMCUPOM: TIntegerField;
    cdsCupomFiscalDTEMISSAO: TDateField;
    cdsCupomFiscalHREMISSAO: TTimeField;
    cdsCupomFiscalCODCLIENTE: TIntegerField;
    cdsCupomFiscalTIPOPGTO: TStringField;
    cdsCupomFiscalCODCONDPGTO: TIntegerField;
    cdsCupomFiscalCODVENDEDOR: TIntegerField;
    cdsCupomFiscalPERCVENDEDOR: TFloatField;
    cdsCupomFiscalBASEICMS: TFloatField;
    cdsCupomFiscalVLRICMS: TFloatField;
    cdsCupomFiscalVLRPRODUTOS: TFloatField;
    cdsCupomFiscalVLRDESCONTO: TFloatField;
    cdsCupomFiscalVLRTOTAL: TFloatField;
    cdsCupomFiscalCANCELADO: TStringField;
    cdsCupomFiscalVLRRECEBIDO: TFloatField;
    cdsCupomFiscalVLRTROCO: TFloatField;
    cdsCupomFiscalNUMMOVFINANCEIRO: TIntegerField;
    cdsCupomFiscalCODCONTA: TIntegerField;
    cdsCupomFiscalFILIAL: TIntegerField;
    cdsCupomFiscalCODTIPOCOBRANCA: TIntegerField;
    BitBtn6: TBitBtn;
    sdsCupomFiscalNOMECLIENTE: TStringField;
    cdsCupomFiscalNOMECLIENTE: TStringField;
    BitBtn7: TBitBtn;
    ckTeste: TCheckBox;
    ckMostrarSitTrib: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
    ctCupomFiscalLoc : String;

    procedure Monta_sqlCupomFiscal;
    procedure Monta_sqlCupomFiscalDM(ID, NumCupom: Integer);
    procedure Excluir_CReceber;
    procedure Excluir_MovFinanceiro;
  public
    { Public declarations }

    function fnc_Posiciona_CReceber(Filial, NumNota, Parcela, NumCReceber : Integer; Serie : String): Boolean;
  end;

var
  fCupomFiscalC: TfCupomFiscalC;

implementation

uses UDM1, uIntegracao, DateUtils, UDMCupom, UDMSitTrib_CF, UCupomFiscal, uImpFiscal_Daruma, uUtilCupomFiscal, DmdDatabase,
  UCupomFiscalOpcoes, UCupomFiscalCli;

{$R *.dfm}

procedure TfCupomFiscalC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tMovimentos.Close;
  DM1.tContas.Close;
  DM1.tContasParametros.Close;
  DM1.tCliente.Close;
  DM1.tCReceberParcRem.Close;
  DM1.tCReceberParcHist.Close;
  DM1.tCReceberParc.Close;
  DM1.tCReceber.Close;
  DM1.tTipoCobranca.Close;

  if DMCupom.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMCupom);
  if DMSitTrib_CF.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMSitTrib_CF);
  Action := Cafree;
end;

procedure TfCupomFiscalC.BitBtn3Click(Sender: TObject);
begin
  if (DateEdit1.Date < 10) or (DateEdit2.Date < 10) then
  begin
    ShowMessage('É obrigatório informar a data inicial e final!');
    exit;
  end;
  Monta_sqlCupomFiscal;
end;

procedure TfCupomFiscalC.Monta_sqlCupomFiscal;
begin
  cdsCupomFiscal.Close;
  sdsCupomFiscal.CommandText := ctCupomFiscalLoc
                                                + ' WHERE 0=0 ';
  if DateEdit1.Date > 0 then
    sdsCupomFiscal.CommandText := sdsCupomFiscal.CommandText + ' AND DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 0 then
    sdsCupomFiscal.CommandText := sdsCupomFiscal.CommandText + ' AND DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));

  sdsCupomFiscal.CommandText := sdsCupomFiscal.CommandText + ' ORDER BY DTEMISSAO DESC, ID_CUPOM DESC';
  cdsCupomFiscal.Open;
end;

function TfCupomFiscalC.fnc_Posiciona_CReceber(Filial, NumNota, Parcela, NumCReceber : Integer;
  Serie: String): Boolean;
begin
  Result := False;
  if DM1.tFilialCodigo.AsInteger <> Filial then
    if not DM1.tFilial.FindKey([Filial]) then
      exit;

  if not DM1.tCReceber.Locate('Filial;NumNota;Serie;NumCReceber',VarArrayOf([Filial,NumNota,Serie,NumCReceber]),[locaseinsensitive]) then
    exit;

  if not DM1.tCReceberParc.Locate('ParcCReceber',Parcela,[loCaseInsensitive]) then
    exit;
  Result := True;
end;

procedure TfCupomFiscalC.BitBtn1Click(Sender: TObject);
begin
  if not ckTeste.Checked then
  begin
    if rVerificarImpressoraLigada_ECF_Daruma() <> 1 then
    begin
      ShowMessage('Impressora desligada!');
      Exit;
    end;
  end;

  if not ckTeste.Checked then
  begin
    if prc_Iniciar_Cupom_Daruma() <> 1 then
    begin
      DarumaFramework_Mostrar_Retorno(prc_Iniciar_Cupom_Daruma);
      Exit;
    end;
  end;

  Monta_sqlCupomFiscalDM(0,0);
  prc_Inserir_Cupom_Fiscal;

  fCupomFiscalCli := TfCupomFiscalCli.Create(Self);
  fCupomFiscalCli.ShowModal;

  fCupomFiscal := TfCupomFiscal.Create(Self);
  fCupomFiscal.ShowModal;
  BitBtn3.Click;
end;

procedure TfCupomFiscalC.FormShow(Sender: TObject);
var
  vData : TDateTime;
begin
  ctCupomFiscalLoc := sdsCupomFiscal.CommandText;
  if not Assigned(DMCupom) then
    DMCupom := TDMCupom.Create(Self);
  if not Assigned(DMSitTrib_CF) then
    DMSitTrib_CF := TDMSitTrib_CF.Create(Self);
  DM1.tFilial.Open;
  DM1.tFilial.IndexFieldNames := 'Codigo';

  DM1.tContas.Open;
  DM1.tContasParametros.Open;
  DM1.tCliente.Open;
  DM1.tCReceber.Open;
  DM1.tCReceberParc.Open;
  DM1.tCReceberParcHist.Open;
  DM1.tCReceberParcRem.Open;
  DM1.tTipoCobranca.Open;
  DM1.tMovimentos.Open;
  DM1.tProduto.Open;
  DM1.tProdutoCor.Open;
  DM1.tEstoqueMatMov.Open;
  DM1.tCondPgto.Open;
  DM1.tCondPgtoItem.Open;

  vData := EncodeDate(YearOf(Date),MonthOf(Date),01);
  DateEdit1.Date := vData;
  DateEdit2.Date := Date;
  Monta_sqlCupomFiscal;
end;

procedure TfCupomFiscalC.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfCupomFiscalC.Monta_sqlCupomFiscalDM(ID, NumCupom: Integer);
begin
  if ID < 1 then
    ID := 0;
  if NumCupom < 1 then
    NumCupom := 0;
  DMCupom.cdsCupomFiscal.Close;
  DMCupom.sdsCupomFiscal.CommandText := ctCupomFiscal;
  if NumCupom > 0 then
    DMCupom.sdsCupomFiscal.CommandText := DMCupom.sdsCupomFiscal.CommandText + ' WHERE NUMCUPOM = ' + IntToStr(NumCupom)
  else
    DMCupom.sdsCupomFiscal.CommandText := DMCupom.sdsCupomFiscal.CommandText + ' WHERE ID_CUPOM = ' + IntToStr(ID);
  DMCupom.cdsCupomFiscal.Open;
end;

procedure TfCupomFiscalC.BitBtn4Click(Sender: TObject);
begin
  if fnc_Imp_Ligada_Daruma = 1 then
    Exit;

  if not DM1.tUsuarioCupomFiscalLeitRed.AsBoolean then
  begin
    ShowMessage('Usuário ' + DM1.tUsuarioUsuario.AsString + ', não esta autorizado para esta opção!');
    exit;
  end;
  fCupomFiscalOpcoes := TfCupomFiscalOpcoes.Create(Self);
  fCupomFiscalOpcoes.ShowModal;
end;

procedure TfCupomFiscalC.BitBtn2Click(Sender: TObject);
var
  vNumCupomAux: Integer;
begin
//  if fnc_Imp_Ligada_Daruma = 1 then
//    Exit;

  if MessageDlg('Deseja cancelar o último cupom?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  if not fCupomFiscalC.ckTeste.Checked then
  begin
    vNumCupomAux := fnc_Busca_Ultimo_Cupom_Daruma;
    if vNumCupomAux <= 0 then
      Raise Exception.Create('Não encontrou cupom fiscal!');
  end;

  qVerificaUlt.Close;
  qVerificaUlt.Open;

  if vNumCupomAux <> qVerificaUltNUMCUPOM.AsInteger then
    Raise Exception.Create('Cupom Fiscal não é o último!');

  if not ckTeste.Checked then
    prc_Cancelar_Cupom_Daruma;

  Monta_sqlCupomFiscalDM(0,qVerificaUltNUMCUPOM.AsInteger);
  
  DMCupom.cdsCupomFiscal.Edit;
  DMCupom.cdsCupomFiscalCANCELADO.AsString := 'S';
  DMCupom.cdsCupomFiscal.Post;
  DMCupom.cdsCupomFiscal.ApplyUpdates(0);

  try
    Excluir_CReceber;
    Excluir_MovFinanceiro;
  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível o item, ' + E.Message + '! Clique para continuar!');
      DMCupom.cdsCupomFiscalIt.CancelUpdates;
    end;
  end;

end;

procedure TfCupomFiscalC.Excluir_CReceber;
begin
  DM1.tCReceber.Filtered := False;
  if DMCupom.cdsCupomFiscalCODCLIENTE.AsInteger > 0 then
    DM1.tCReceber.Filter   := 'NumSeqNota = '''+DMCupom.cdsCupomFiscalID_CUPOM.AsString+''' and CodCli = '''+DMCupom.cdsCupomFiscalCODCLIENTE.AsString+''' and Filial = '''+DMCupom.cdsCupomFiscalFILIAL.AsString+''''
  else
    DM1.tCReceber.Filter   := 'NumSeqNota = '''+DMCupom.cdsCupomFiscalID_CUPOM.AsString+''' and Filial = '''+DMCupom.cdsCupomFiscalFILIAL.AsString+'''';
  DM1.tCReceber.Filtered := True;
  DM1.tCReceber.First;
  while not DM1.tCReceber.Eof do
  begin
    if DM1.tCReceberTipoDoc.AsString = 'CF' then
    begin
       DM1.tCReceberParc.First;
       while not DM1.tCReceberParc.Eof do
       begin
         DM1.tCReceberParcHist.First;
         while not DM1.tCReceberParcHist.Eof do
         begin
           DM1.tCReceberParcRem.First;
           while not DM1.tCReceberParcRem.Eof do
             DM1.tCReceberParcRem.Delete;
           DM1.tCReceberParcHist.Delete;
         end;
         DM1.tCReceberParc.Delete;
       end;
       DM1.tCReceber.Delete;
    end
    else
      DM1.tCReceber.Next;
  end;
  DM1.tCReceber.Filtered := False;
end;

procedure TfCupomFiscalC.Excluir_MovFinanceiro;
begin
  if DMCupom.cdsCupomFiscalNUMMOVFINANCEIRO.AsInteger <= 0 then
    exit;

  DM1.tContas.IndexFieldNames := 'CodConta';
  if not DM1.tContas.FindKey([1]) then
    exit;

  if DM1.tMovimentos.Locate('CodConta;NumMovimento',VarArrayOf([1,DMCupom.cdsCupomFiscalNUMMOVFINANCEIRO.AsInteger]),[locaseinsensitive]) then
    DM1.tMovimentos.Delete;
end;

procedure TfCupomFiscalC.BitBtn6Click(Sender: TObject);
begin
  prc_Abrir_Gaveta_Daruma;
end;

procedure TfCupomFiscalC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F12) then
    BitBtn6Click(Sender);
  if (Shift = [ssCtrl]) and (Key = 87) then
    ckTeste.Visible := not(ckTeste.Visible);
end;

procedure TfCupomFiscalC.BitBtn7Click(Sender: TObject);
begin
  iCFCancelar_ECF_Daruma();
end;

procedure TfCupomFiscalC.SMDBGrid1DblClick(Sender: TObject);
begin
  fCupomFiscal := TfCupomFiscal.Create(Self);
  Monta_sqlCupomFiscalDM(cdsCupomFiscalID_CUPOM.AsInteger,0);
  fCupomFiscal.Panel2.Enabled := False;
  fCupomFiscal.ShowModal;
end;

procedure TfCupomFiscalC.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if cdsCupomFiscalCANCELADO.AsString = 'S' then
    AFont.Color := clRed;
end;

end.
