unit UCupomFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, Grids, DBGrids, SMDBGrid, StdCtrls,
  RxLookup, DBFilter, Mask, ToolEdit, CurrEdit, FMTBcd, DB, Provider, DBClient, SqlExpr, DBCtrls, Buttons, DBTables;

type
  TfCupomFiscal = class(TForm)
    Panel1: TPanel;
    SMDBGrid1: TSMDBGrid;
    RxDBFilter1: TRxDBFilter;
    sdsSitTrib_CF: TSQLDataSet;
    cdsSitTrib_CF: TClientDataSet;
    dspSitTrib_CF: TDataSetProvider;
    dsSitTrib_CF: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    Panel4: TPanel;
    Label3: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label4: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label5: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label6: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Panel5: TPanel;
    Panel7: TPanel;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    sdsSitTrib_CFID: TIntegerField;
    sdsSitTrib_CFPERCENTUAL: TFloatField;
    cdsSitTrib_CFID: TIntegerField;
    cdsSitTrib_CFPERCENTUAL: TFloatField;
    Label10: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    qCor: TQuery;
    qCorCodProduto: TIntegerField;
    qCorNome: TStringField;
    qCorCodCor: TIntegerField;
    dsqCor: TDataSource;
    Panel8: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn1: TBitBtn;
    Panel9: TPanel;
    DBEdit2: TDBEdit;
    sdsSitTrib_CFCODIGO: TStringField;
    cdsSitTrib_CFCODIGO: TStringField;
    Label8: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure Panel8Exit(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    vAliqIcms : Real;
    procedure Move_Itens;
    procedure Limpa_Campos;
    procedure Gravar_Estoque;
  public
    { Public declarations }
    procedure Excluir_Estoque(Filial,NumMov: Integer);
  end;

var
  fCupomFiscal: TfCupomFiscal;

implementation

uses UDMCupom, UDMSitTrib_CF, UDM1, DmdDatabase, uUtilCupomFiscal, UCupomFiscalPgto, UCupomFiscalCanc,
  UCupomFiscalC, uIntegracao;

{$R *.dfm}

procedure TfCupomFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  cdsSitTrib_CF.Close;
  Action := Cafree;
end;

procedure TfCupomFiscal.FormShow(Sender: TObject);
begin
  Label6.Visible           := fCupomFiscalC.ckMostrarSitTrib.Checked;
  RxDBLookupCombo2.Visible := fCupomFiscalC.ckMostrarSitTrib.Checked;
  RxDBFilter1.Active       := True;
  cdsSitTrib_CF.Open;
end;

procedure TfCupomFiscal.Edit1Exit(Sender: TObject);
begin
  if (Trim(Edit1.Text) <> '') and not(DM1.tProduto.Locate('Codigo',Edit1.Text,[loCaseInsensitive])) then
  begin
    ShowMessage('Código não encontrado!');
    Edit1.Clear;
    Edit1.SetFocus;
  end
  else
  if Trim(Edit1.Text) <> '' then
    RxDBLookupCombo1.KeyValue := DM1.tProdutoCodigo.AsInteger;
end;

procedure TfCupomFiscal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DMCupom.cdsCupomFiscal.State in [dsEdit,dsInsert] then
  begin
    DMCupom.cdsCupomFiscal.Post;
  end;
end;

procedure TfCupomFiscal.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tProduto.IndexFieldNames := 'Nome';
end;

procedure TfCupomFiscal.BitBtn4Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  if RxDBLookupCombo1.Text = '' then
  begin
    ShowMessage('Produto não informado!');
    Edit1.SetFocus;
    exit;
  end;
  DM1.tProduto.Locate('Codigo',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
  if (DM1.tProdutoLancaCor.AsBoolean) and (RxDBLookupCombo3.Text = '') then
  begin
    ShowMessage('Neste produto é necessário informar a cor!');
    RxDBLookupCombo3.SetFocus;
    exit;
  end;
  if RxDBLookupCombo2.Text = '' then
  begin
    ShowMessage('Sit. Tributária não informada!');
    Edit1.SetFocus;
    exit;
  end;
  if CurrencyEdit1.Value <= 0 then
  begin
    ShowMessage('Quantidade não informada!');
    CurrencyEdit1.SetFocus;
    exit;
  end;
  if CurrencyEdit2.Value <= 0 then
  begin
    ShowMessage('Valor unitário não informado!');
    CurrencyEdit1.SetFocus;
    exit;
  end;

  if cdsSitTrib_CF.Locate('CODIGO',RxDBLookupCombo2.Value,[loCaseInsensitive]) then
    vAliqIcms := cdsSitTrib_CFPERCENTUAL.AsFloat;

  DMCupom.cdsCupomFiscalIt.Last;
  vItemAux := DMCupom.cdsCupomFiscalItITEM.AsInteger;

  try
    DMCupom.cdsCupomFiscalIt.Insert;
    DMCupom.cdsCupomFiscalItID_CUPOM.AsInteger   := DMCupom.cdsCupomFiscalID_CUPOM.AsInteger;
    DMCupom.cdsCupomFiscalItITEM.AsInteger       := vItemAux + 1;
    DMCupom.cdsCupomFiscalItCODPRODUTO.AsInteger := RxDBLookupCombo1.KeyValue;
    DMCupom.cdsCupomFiscalItCODCOR.AsInteger     := 0;
    if RxDBLookupCombo3.Text <> '' then
      DMCupom.cdsCupomFiscalItCODCOR.AsInteger := RxDBLookupCombo3.KeyValue;
    DMCupom.cdsCupomFiscalItQTD.AsFloat       := CurrencyEdit1.Value;
    DMCupom.cdsCupomFiscalItALIQICMS.AsFloat  := vAliqIcms;
    DMCupom.cdsCupomFiscalItSITTRIB.AsString  := RxDBLookupCombo2.Value;
    DMCupom.cdsCupomFiscalItVLRUNIT.AsFloat   := CurrencyEdit2.Value;
    DMCupom.cdsCupomFiscalItPERCDESCONTO.AsFloat := 0;
    DMCupom.cdsCupomFiscalItVLRDESCONTO.AsFloat  := 0;
    DMCupom.cdsCupomFiscalItVLRTOTAL.AsFloat     := CurrencyEdit3.Value;
    DMCupom.cdsCupomFiscalItBASEICMS.AsFloat     := 0;
    DMCupom.cdsCupomFiscalItVLRICMS.AsFloat      := 0;
    if StrToFloat(FormatFloat('0.00',DMCupom.cdsCupomFiscalItALIQICMS.AsFloat)) > 0 then
    begin
      DMCupom.cdsCupomFiscalItBASEICMS.AsFloat := CurrencyEdit3.Value;
      DMCupom.cdsCupomFiscalItVLRICMS.AsFloat  := StrToFloat(FormatFloat('0.00',DMCupom.cdsCupomFiscalItBASEICMS.AsFloat * DMCupom.cdsCupomFiscalItALIQICMS.AsFloat / 100));
    end;
    DMCupom.cdsCupomFiscalItCODNATOPER.AsInteger := 0;
    DMCupom.cdsCupomFiscalItNUMMOVEST.AsInteger  := 0;
    DMCupom.cdsCupomFiscalItUNIDADE.AsString     := DM1.tProdutoUnidade.AsString;
    DMCupom.cdsCupomFiscalItNOMEPRODUTO.AsString := DM1.tProdutoNome.AsString;
    DMCupom.cdsCupomFiscalItCANCELADO.AsString   := 'N';

    Gravar_Estoque;

    DMCupom.cdsCupomFiscalIt.Post;

    //Total
    DMCupom.cdsCupomFiscalVLRTOTAL.AsFloat    := DMCupom.cdsCupomFiscalVLRTOTAL.AsFloat + DMCupom.cdsCupomFiscalItVLRTOTAL.AsFloat;
    DMCupom.cdsCupomFiscalVLRICMS.AsFloat     := DMCupom.cdsCupomFiscalVLRICMS.AsFloat + DMCupom.cdsCupomFiscalItVLRICMS.AsFloat;
    DMCupom.cdsCupomFiscalVLRPRODUTOS.AsFloat := DMCupom.cdsCupomFiscalVLRPRODUTOS.AsFloat + DMCupom.cdsCupomFiscalItVLRTOTAL.AsFloat;
    DMCupom.cdsCupomFiscalBASEICMS.AsFloat    := DMCupom.cdsCupomFiscalBASEICMS.AsFloat + DMCupom.cdsCupomFiscalItBASEICMS.AsFloat;
    //*****

    DMCupom.cdsCupomFiscal.ApplyUpdates(0);
    DMCupom.cdsCupomFiscal.Edit;
    dmCupom.cdsCupomFiscalIt.Last;

    if not fCupomFiscalC.ckTeste.Checked then
      prc_Imprimir_Item_Cupom_Daruma(False);
  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível incluir o item, ' + E.Message + '! Clique para continuar!');
      DMCupom.cdsCupomFiscalIt.CancelUpdates;
    end;
  end;

  Edit1.SetFocus;
  Limpa_Campos;
end;

procedure TfCupomFiscal.CurrencyEdit1Exit(Sender: TObject);
begin
  CurrencyEdit3.Value := 0;
  if (CurrencyEdit2.Value > 0) and (CurrencyEdit1.Value > 0) then
    CurrencyEdit3.Value := StrToFloat(FormatFloat('0.00',CurrencyEdit2.Value * CurrencyEdit1.Value));
end;

procedure TfCupomFiscal.Panel8Exit(Sender: TObject);
begin
  Move_Itens;
end;

procedure TfCupomFiscal.Move_Itens;
begin
  if RxDBLookupCombo1.Text = '' then
    exit;
  if RxDBLookupCombo1.KeyValue <> DM1.tProdutoCodigo.AsInteger then
    DM1.tProduto.Locate('Codigo',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
  RxDBLookupCombo2.Value := '1';
  CurrencyEdit1.Value := 1;
  if not(DM1.tProdutoLancaCor.AsBoolean) or not(DM1.tProdutoPrecoCor.AsBoolean) then
    CurrencyEdit2.Value := DM1.tProdutoVlrVenda.AsFloat;
  CurrencyEdit1Exit(fCupomFiscal);
  qCor.Close;
  if DM1.tProdutoLancaCor.AsBoolean then
  begin
    qCor.ParamByName('CodProduto').AsInteger := DM1.tProdutoCodigo.AsInteger;
    qCor.Open;
  end;
  if DM1.tProdutoCodSitCF.AsString <> '' then
    RxDBLookupCombo2.Value := DM1.tProdutoCodSitCF.AsString;
end;

procedure TfCupomFiscal.RxDBLookupCombo2Exit(Sender: TObject);
begin
  vAliqIcms := cdsSitTrib_CFPERCENTUAL.AsFloat;
end;

procedure TfCupomFiscal.Limpa_Campos;
begin
  Edit1.Clear;
  RxDBLookupCombo1.ClearValue;
  RxDBLookupCombo2.ClearValue;
  RxDBLookupCombo2.ClearValue;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit3.Clear;
  vAliqIcms := 0;
end;

procedure TfCupomFiscal.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Encerrar o CUPOM?',mtconfirmation,[mbok,mbno],0) = mrNo then
    Exit;

  if not fCupomFiscalC.ckTeste.Checked then
    prc_Totalizar_Cupom_Daruma;
  fCupomFiscalPgto := TfCupomFiscalPgto.Create(Self);
  fCupomFiscalPgto.ShowModal;

  if not fCupomFiscalC.ckTeste.Checked then
    prc_Encerrar_Cupom_Daruma;

  if DMCupom.cdsCupomFiscal.State in [dsBrowse] then
    Close;
end;

procedure TfCupomFiscal.Gravar_Estoque;
var
  vNumMovEst : Integer;
begin
  vNumMovEst := 0;

  try
    DM1.tEstoqueMatMov.IndexFieldNames := 'Filial;NumMov';
    DM1.tEstoqueMatMov.Refresh;
    DM1.tEstoqueMatMov.Last;
    vNumMovEst := DM1.tEstoqueMatMovNumMov.AsInteger + 1;

    DM1.tEstoqueMatMov.Insert;
    Dm1.tEstoqueMatMovFilial.AsInteger      := DMCupom.cdsCupomFiscalFILIAL.AsInteger;
    DM1.tEstoqueMatMovNumMov.AsInteger      := vNumMovEst;
    DM1.tEstoqueMatMovCodMaterial.AsInteger := DMCupom.cdsCupomFiscalItCODPRODUTO.AsInteger;
    DM1.tEstoqueMatMovCodCor.AsInteger      := 0;
    if DMCupom.cdsCupomFiscalItCODCOR.AsInteger > 0 then
      DM1.tEstoqueMatMovCodCor.AsInteger    := DMCupom.cdsCupomFiscalItCODCOR.AsInteger;
    DM1.tEstoqueMatMovDtMov.AsDateTime      := DMCupom.cdsCupomFiscalDTEMISSAO.AsDateTime;
    DM1.tEstoqueMatMovES.AsString           := 'S';
    DM1.tEstoqueMatMovTipoMov.AsString      := 'CFI';
    DM1.tEstoqueMatMovNumNota.AsInteger     := DMCupom.cdsCupomFiscalNUMCUPOM.AsInteger;
    DM1.tEstoqueMatMovCodCliForn.AsInteger  := DMCupom.cdsCupomFiscalCODCLIENTE.AsInteger;
    DM1.tEstoqueMatMovVlrUnitario.AsFloat   := DMCupom.cdsCupomFiscalItVLRUNIT.AsFloat;
    DM1.tEstoqueMatMovQtd.AsFloat           := DMCupom.cdsCupomFiscalItQTD.AsFloat;
    DM1.tEstoqueMatMovQtd2.AsFloat          := StrToFloat(FormatFloat('0.00000',DMCupom.cdsCupomFiscalItQTD.AsFloat * -1));
    DM1.tEstoqueMatMovUnidade.AsString      := DMCupom.cdsCupomFiscalItUNIDADE.AsString;
    DM1.tEstoqueMatMovPercIcms.AsFloat      := DMCupom.cdsCupomFiscalItALIQICMS.AsFloat;
    DM1.tEstoqueMatMovPercIpi.AsFloat       := 0;
    DM1.tEstoqueMatMovVlrDesconto.AsFloat   := 0;
    DM1.tEstoqueMatMovTamanho.AsString      := '';
    if StrToFloat(FormatFloat('0.00',DMCupom.cdsCupomFiscalItALIQICMS.AsFloat)) > 0 then
      DM1.tEstoqueMatMovPercTributacao.AsFloat := 100
    else
      DM1.tEstoqueMatMovPercTributacao.AsFloat := 0;
    DM1.tEstoqueMatMovCodNatOper.AsInteger := DMCupom.cdsCupomFiscalItCODNATOPER.AsInteger;
    DM1.tEstoqueMatMovSerie.AsString       := 'CF';
    DM1.tEstoqueMatMovNumSeqNota.AsInteger := DMCupom.cdsCupomFiscalID_CUPOM.AsInteger;
    DM1.tEstoqueMatMov.Post;
    //02/05/2012
    if DM1.tParametrosUsaFB.AsBoolean then
      Prc_Gravar_Estoque_Mov_FB(dm1.tEstoqueMatMovFilial.AsInteger,dm1.tEstoqueMatMovNumMov.AsInteger);

    if DMCupom.cdsCupomFiscalIt.State in [dsBrowse] then
      DMCupom.cdsCupomFiscalIt.Edit;

    DMCupom.cdsCupomFiscalItNUMMOVEST.AsInteger := vNumMovEst;

  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível gravar o estoque, ' + E.Message + '! Clique para continuar!');
      DM1.tMovimentos.Cancel;
    end;
  end;
end;

procedure TfCupomFiscal.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if DMCupom.cdsCupomFiscalItCANCELADO.AsString = 'S' then
    AFont.Color := clRed;
end;

procedure TfCupomFiscal.Excluir_Estoque(Filial,NumMov : Integer);
var
  vFilialAux, vNumMovAux : Integer;
begin
  DM1.tEstoqueMatMov.IndexFieldNames := 'Filial;NumMov';
  if DM1.tEstoqueMatMov.FindKey([Filial,NumMov]) then
  begin
    vFilialAux := DM1.tEstoqueMatMovFilial.AsInteger;
    vNumMovAux := DM1.tEstoqueMatMovNumMov.AsInteger;

    DM1.tEstoqueMatMov.Delete;

    //02/05/2012
    if DM1.tParametrosUsaFB.AsBoolean then
      Prc_Excluir_Estoque_Mov_FB(vFilialAux,vNumMovAux);
  end;
end;

procedure TfCupomFiscal.BitBtn1Click(Sender: TObject);
begin
  fCupomFiscalCanc := TfCupomFiscalCanc.Create(Self);
  fCupomFiscalCanc.ShowModal;
end;

procedure TfCupomFiscal.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) and (Trim(Edit1.Text) <> '') then
    RxDBLookupCombo1.SetFocus;
end;

procedure TfCupomFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F10) and not(DMCupom.cdsCupomFiscalIt.IsEmpty) then
    BitBtn2Click(Sender);
  if (Shift = [ssCtrl]) and (Key = 87) then
  begin
    Label8.Visible        := not(Label8.Visible);
    CurrencyEdit4.Visible := not(CurrencyEdit4.Visible);
  end;
end;

end.
