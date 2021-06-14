unit UVale;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, DBCtrls, StdCtrls, Mask, Grids, DBGrids, ComCtrls,
  RXCtrls, RXLookup, DbTables, Db, RxCalc, ToolEdit, CurrEdit,
  MemTable, DBFilter, Math, RXDBCtrl, RzTabs, SMDBGrid, Variants;

type
  TfVale = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    SpeedButton2: TSpeedButton;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel3: TPanel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    BitBtn7: TBitBtn;
    tPedidoItem: TTable;
    Label53: TLabel;
    RxDBLookupCombo8: TRxDBLookupCombo;
    Panel6: TPanel;
    Label1: TLabel;
    DBEdit35: TDBEdit;
    BitBtn14: TBitBtn;
    DBDateEdit2: TDBDateEdit;
    BitBtn18: TBitBtn;
    dsPedidoItem: TDataSource;
    RxLabel2: TRxLabel;
    DBEdit39: TDBEdit;
    tPedidoItemPedido: TIntegerField;
    tPedidoItemItem: TIntegerField;
    tPedidoItemCodProduto: TIntegerField;
    tPedidoItemCodCor: TIntegerField;
    tPedidoItemCodGrade: TIntegerField;
    tPedidoItemQtdPares: TFloatField;
    tPedidoItemQtdParesFat: TFloatField;
    tPedidoItemQtdParesRest: TFloatField;
    tPedidoItemPreco: TFloatField;
    tPedidoItemVlrTotal: TFloatField;
    tPedidoItemCancelado: TBooleanField;
    tPedidoItemCopiado: TBooleanField;
    tPedidoItemQtdParesCanc: TFloatField;
    tPedidoItemVlrDesconto: TFloatField;
    tPedidoItemSitTrib: TSmallintField;
    tPedidoItemQtdFatAut: TFloatField;
    tPedidoItemQtdFatMan: TFloatField;
    tPedidoItemReposicao: TBooleanField;
    tPedidoItemObsLote: TStringField;
    tPedidoItemNumOS: TStringField;
    tPedidoItemDtEmbarque: TDateField;
    tPedidoItemCodCia: TIntegerField;
    tPedidoItemDtReprogramacao: TDateField;
    tPedidoItemReprogramacao: TBooleanField;
    tPedidoItemDtBaixa: TDateField;
    tPedidoItemHrBaixa: TTimeField;
    tPedidoItemFabrica: TStringField;
    tPedidoItemQtdLote: TFloatField;
    tPedidoItemCodProdutoCli: TStringField;
    tPedidoItemProdCliPorTamanho: TBooleanField;
    tPedidoItemProducaoVenda: TStringField;
    tPedidoItemPosicao: TIntegerField;
    tPedidoItemTamanho: TStringField;
    tPedidoItemPercComissao: TFloatField;
    tPedidoItemUnidade: TStringField;
    tPedidoItemTalaoGerado: TBooleanField;
    tPedidoItemPercComissao2: TFloatField;
    tPedidoItemObsTalao: TStringField;
    tPedidoItemLargura: TStringField;
    tPedidoItemMateriaPrima: TBooleanField;
    tPedidoItemAmostraEntregue: TBooleanField;
    tPedidoItemDtEntregaAmostra: TDateField;
    tPedidoItemHrEntregaAmostra: TTimeField;
    tPedidoItemPlano: TStringField;
    tPedidoItemNumNotaEntrada: TIntegerField;
    tPedidoItemCodCombinacao: TIntegerField;
    tValeIns: TTable;
    tValeInsFilial: TIntegerField;
    tValeInsNumVale: TIntegerField;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    Panel4: TPanel;
    RxDBGrid1: TRxDBGrid;
    BitBtn6: TBitBtn;
    SpeedButton23: TSpeedButton;
    SpeedButton9: TSpeedButton;
    TabSheet2: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel5: TPanel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn8: TBitBtn;
    Label55: TLabel;
    RxDBLookupCombo16: TRxDBLookupCombo;
    Label14: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    SpeedButton5: TSpeedButton;
    SpeedButton24: TSpeedButton;
    BitBtn9: TBitBtn;
    StaticText1: TStaticText;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure GPE(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBEdit35Exit(Sender: TObject);
    procedure Panel6Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure RxDBLookupCombo8Enter(Sender: TObject);
    procedure RxDBLookupCombo8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Habilita_Desabilita;
    procedure Excluir_Registro;
    procedure Excluir_Item;
    procedure Gera_CReceber;
    procedure Excluir_CReceber;

  public
    { Public declarations }
    procedure Gravar_Estoque;
    procedure Excluir_Estoque;

  end;

var
  fVale: TfVale;
  vSiglaUF : String[2];
  vLetra : String[3];
  vItemVale : Integer;
  vCodSitTrib : Integer;
  vAliqIcms : Real;

implementation

uses UDM1, UDM2, UValeItens, UCliente, UUf, UProduto, UBuscaPedido, UEscImpressora,
     USitTributaria, URelVale, UConsVale, UEscFilial, ULancaCPagar,
  UCondPgto, UTipoCobranca, UContas, uIntegracao;

{$R *.DFM}

procedure TfVale.Habilita_Desabilita;
begin
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
  Panel1.Enabled       := not(Panel1.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
  Panel5.Enabled       := not(Panel5.Enabled);
  Panel6.Enabled       := not(Panel6.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn7.Enabled      := not(BitBtn7.Enabled);
  BitBtn14.Enabled     := not(BitBtn14.Enabled);
  SMDBGrid1.ReadOnly   := not(SMDBGrid1.ReadOnly);
end;

procedure TfVale.Gravar_Estoque;
var
  vNumMovEst : Integer;
  vNumAux : Integer;
begin
  DM1.tEstoqueMatMov.Refresh;
  DM1.tEstoqueMatMov.Last;
  vNumAux := DM1.tEstoqueMatMovNumMov.AsInteger + 1;
  
  vNumMovEst := vNumAux + 1;

  DM1.tEstoqueMatMov.Insert;
  Dm1.tEstoqueMatMovFilial.AsInteger       := Dm1.tValeItensFilial.AsInteger;
  DM1.tEstoqueMatMovNumMov.AsInteger       := vNumMovEst;
  DM1.tEstoqueMatMovCodMaterial.AsInteger  := DM1.tValeItensCodProduto.AsInteger;
  DM1.tEstoqueMatMovCodCor.AsInteger       := DM1.tValeItensCodCor.AsInteger;
  DM1.tEstoqueMatMovDtMov.AsDateTime       := DM1.tValeDtEmissao.AsDateTime;
  DM1.tEstoqueMatMovES.AsString            := 'S';
  DM1.tEstoqueMatMovTipoMov.AsString       := 'VAL';
  DM1.tEstoqueMatMovNumNota.AsInteger      := DM1.tValeNumVale.AsInteger;
  DM1.tEstoqueMatMovCodCliForn.AsInteger   := DM1.tValeCodCliente.AsInteger;
  DM1.tEstoqueMatMovVlrUnitario.AsFloat    := DM1.tValeItensVlrUnitario.AsFloat;
  DM1.tEstoqueMatMovQtd.AsFloat            := DM1.tValeItensQtd.AsFloat;
  DM1.tEstoqueMatMovQtd2.AsFloat           := StrToFloat(FormatFloat('0.00000',DM1.tValeItensQtd.AsFloat * -1));
  DM1.tEstoqueMatMovUnidade.AsString       := DM1.tValeItensUnidade.AsString;
  DM1.tEstoqueMatMovPercIcms.AsFloat       := DM1.tValeItensAliqIcms.AsFloat;
  DM1.tEstoqueMatMovPercIpi.AsFloat        := 0;
  DM1.tEstoqueMatMovVlrDesconto.AsFloat    := 0;
  DM1.tEstoqueMatMovPercTributacao.AsFloat := 0;
  {if DM1.tValeItensCodSitTrib.AsInteger > 0 then
    DM1.tEstoqueMatMovPercTributacao.AsFloat := DM1.tValeItenslkPercSitTrib.AsFloat
  else
    DM1.tEstoqueMatMovPercTributacao.AsFloat := 100;}
  DM1.tEstoqueMatMov.Post;
  //02/05/2012
  if DM1.tParametrosUsaFB.AsBoolean then
    Prc_Gravar_Estoque_Mov_FB(dm1.tEstoqueMatMovFilial.AsInteger,dm1.tEstoqueMatMovNumMov.AsInteger);

  DM1.tValeItens.Edit;
  DM1.tValeItensNumMovEst.AsInteger := vNumMovEst;
  DM1.tValeItens.Post;
end;

procedure TfVale.Excluir_Estoque;
var
  vFilialAux, vNumMovAux : Integer;
begin
  DM1.tEstoqueMatMov.IndexFieldNames := 'Filial;NumMov';
  DM1.tEstoqueMatMov.SetKey;
  Dm1.tEstoqueMatMovFilial.AsInteger := Dm1.tValeItensFilial.AsInteger;
  DM1.tEstoqueMatMovNumMov.AsInteger := DM1.tValeItensNumMovEst.AsInteger;
  if DM1.tEstoqueMatMov.GotoKey then
  begin
    vFilialAux := DM1.tEstoqueMatMovFilial.AsInteger;
    vNumMovAux := DM1.tEstoqueMatMovNumMov.AsInteger;

    DM1.tEstoqueMatMov.Delete;

    //02/05/2012
    if DM1.tParametrosUsaFB.AsBoolean then
      Prc_Excluir_Estoque_Mov_FB(vFilialAux,vNumMovAux);
  end;
end;

procedure TfVale.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tProduto.IndexFieldNames := 'Nome';
  DM1.tCliente.IndexFieldNames := 'Codigo';
  DM1.tVale.Close;
  DM1.tValeItens.Close;
  DM1.tValeParc.Close;
  DM1.tProduto.Close;
  DM1.tProdutoCor.Close;
  DM1.tCliente.Close;
  DM1.tTabPreco.Close;
  DM1.tPedido.Close;
  DM1.tPedidoItem.Close;
  DM1.tPedidoNota.Close;
  DM1.tEstoqueMatMov.Close;
  DM1.tGrade.Close;
  DM1.tGradeItem.Close;
  DM1.tCReceber.Close;
  DM1.tCReceberParc.Close;
  DM1.tCReceberParcHist.Close;
  DM1.tCReceberParcRem.Close;
  DM1.tCondPgto.Close;
  DM1.tCondPgtoItem.Close;

  Action := CaFree;
end;

procedure TfVale.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfVale.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioClientes.AsBoolean then
  begin
    fCliente := TfCliente.Create(Self);
    fCliente.ShowModal;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de clientes!');
end;

procedure TfVale.SpeedButton9Click(Sender: TObject);
begin
  if not DM1.tValeItens.IsEmpty then
  begin
    if MessageDlg('Deseja realmente excluir este produto do vale?',mtConfirmation,
       [mbOK,mbNo],0) = mrOK then
    begin
      DM1.tValeVlrTotal.AsFloat  := DM1.tValeVlrTotal.AsFloat - DM1.tValeItensVlrTotal.AsFloat;
      Excluir_Item;
    end;
  end
  else
    ShowMessage('Não existe item para apagar da nota!');
end;

procedure TfVale.BitBtn1Click(Sender: TObject);
var
  vNumAux : Integer;
begin
  if DM1.tUsuarioInsVale.AsBoolean then
    begin
      tValeIns.Close;
      tValeIns.Open;
      tValeIns.Refresh;
      BitBtn7.Tag := 0;
      vPedido     := 0;
      vItemPedido := 0;
      vCodSitTrib := 0;
      BitBtn18.Visible := False;
      Habilita_Desabilita;
      fEscFilial := TfEscFilial.Create(Self);
      fEscFilial.ShowModal;
      fVale.Caption := 'Vale ' + Dm1.tFilialEmpresa.AsString;
      DM1.tVale.IndexFieldNames := 'Filial;NumVale';
      DM1.tVale.Refresh;
      DM1.tVale.Last;
      vNumAux := DM1.tValeNumVale.AsInteger;

      DM1.tVale.Insert;
      Dm1.tValeFilial.AsInteger     := Dm1.tFilialCodigo.AsInteger;
      DM1.tValeNumVale.AsInteger    := vNumAux + 1;
      DM1.tValeDtEmissao.AsDateTime := Date;
      DM1.tValeFaturado.AsBoolean   := False;
      //DM1.tVale.Post;
      //DM1.tVale.Edit;
      //DBDateEdit2.SetFocus;
      DBEdit35.Enabled := True;
      DBEdit35.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inclusão!');
end;

procedure TfVale.BitBtn2Click(Sender: TObject);
begin
  if (RxDBLookupCombo8.Text = '') and (DBDateEdit2.Date < 1) then
    ShowMessage('Falta informar o cliente e a data de emissão!')
  else
  begin
    Habilita_Desabilita;
    BitBtn4.Enabled  := False;
    DBEdit35.Enabled := True;
    BitBtn7.Tag      := 0;

    DM1.tValeGeraFat.AsBoolean      := (DM1.tValeParc.RecordCount < 1);
    DM1.tValeGeraCobranca.AsBoolean := (DM1.tValeParc.RecordCount > 0);

    DM1.tVale.Post;
    DM1.tVale.Refresh;
    DM1.tValeItens.Refresh;

    Excluir_CReceber;

    if DM1.tValeParc.RecordCount > 0 then
      Gera_CReceber;

    tValeIns.Close;
    tValeIns.Open;
    tValeIns.Refresh;
  end;
  vItemVale := 0;
end;

procedure TfVale.BitBtn4Click(Sender: TObject);
begin
  Excluir_Registro;
  Habilita_Desabilita;
  vItemVale := 0;
  if DM1.tVale.RecordCount > 0 then
    BitBtn18.Visible := DM1.tValeFaturado.AsBoolean
  else
    BitBtn18.Visible := False;
end;

procedure TfVale.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    CanClose := True;
end;

procedure TfVale.GPE(Sender: TObject);
begin
  DM1.tVale.Open;
  DM1.tValeItens.Open;
  DM1.tValeParc.Open;
  DM1.tProduto.Open;
  DM1.tProdutoCor.Open;
  DM1.tCliente.Open;
  DM1.tTabPreco.Open;
  DM1.tPedido.Open;
  DM1.tPedidoItem.Open;
  DM1.tPedidoNota.Open;
  DM1.tEstoqueMatMov.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tCReceber.Open;
  DM1.tCReceberParc.Open;
  DM1.tCReceberParcHist.Open;
  DM1.tCReceberParcRem.Open;
  DM1.tCondPgto.Open;
  DM1.tCondPgtoItem.Open;

  fVale.Caption := 'Vale ' + Dm1.tFilialEmpresa.AsString;
  DM1.tVale.Refresh;
  DM1.tVale.Last;
  DM1.tProduto.IndexFieldNames := 'Nome';
  tValeIns.Open;
  if DM1.tVale.RecordCount > 0 then
    BitBtn18.Visible := DM1.tValeFaturado.AsBoolean
  else
    BitBtn18.Visible := False;
end;

procedure TfVale.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) and (DM1.tVale.State in [dsBrowse]) then
  begin
    fConsVale := TfConsVale.Create(Self);
    fConsVale.ShowModal;
    if DM1.tVale.RecordCount > 0 then
      BitBtn18.Visible := DM1.tValeFaturado.AsBoolean
    else
      BitBtn18.Visible := False;
    fVale.Caption := 'Vale ' + Dm1.tFilialEmpresa.AsString;
    fVale.Caption := 'Vale ' + Dm1.tFilialEmpresa.AsString;
  end;
end;

procedure TfVale.BitBtn7Click(Sender: TObject);
begin
  if DM1.tUsuarioAltVale.AsBoolean then
    begin
      if Dm1.tValeFaturado.AsBoolean then
        ShowMessage('Vale já foi Faturado, não é possível alterar!')
      else
        begin
          tValeIns.Close;
          tValeIns.Open;
          tValeIns.Refresh;
          vCodSitTrib := 0;
          BitBtn7.Tag := 1;
          DM1.tVale.Edit;
          Habilita_Desabilita;
          BitBtn4.Enabled := False;
          DBDateEdit2.SetFocus;
          DBEdit35.Enabled := False;
        end;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfVale.SpeedButton23Click(Sender: TObject);
begin
  if (DM1.tValeItensItem.AsInteger > 0) and (DM1.tValeItensNumPedido.AsInteger < 1) then
  begin
    fValeItens := TfValeItens.Create(Self);
    SpeedButton23.Tag := 1;
    vItemVale := DM1.tValeItensItem.AsInteger;
    if DM1.tValeItensTipoItem.AsString = 'V' then
      fValeItens.RadioGroup1.ItemIndex := 0
    else
    if DM1.tValeItensTipoItem.AsString = 'A' then
      fValeItens.RadioGroup1.ItemIndex := 1
    else
    if DM1.tValeItensTipoItem.AsString = 'R' then
      fValeItens.RadioGroup1.ItemIndex := 2
    else
    if DM1.tValeItensTipoItem.AsString = 'O' then
      fValeItens.RadioGroup1.ItemIndex := 3;

    fValeItens.CurrencyEdit1.AsInteger    := DM1.tValeItensCodProduto.AsInteger;
    fValeItens.RxDBLookupCombo2.KeyValue  := DM1.tValeItensCodProduto.AsInteger;
    fValeItens.RxDBLookupCombo1.KeyValue  := DM1.tValeItensCodProduto.AsInteger;
    if DM1.tValeItensCodCor.AsInteger > 0 then
      fValeItens.RxDBLookupCombo4.KeyValue := DM1.tValeItensCodCor.AsInteger;
    if DM1.tValeItensCodGrade.AsInteger > 0 then
    begin
      fValeItens.RxDBLookupCombo3.KeyValue := DM1.tValeItensCodGrade.AsInteger;
      fValeItens.RxDBLookupCombo6.KeyValue := DM1.tValeItensPosicao.AsInteger;
    end;
    fValeItens.Edit2.Text  := DM1.tValeItensUnidade.AsString;
    fValeItens.CurrencyEdit3.Value  := DM1.tValeItensQtd.AsFloat;
    fValeItens.Edit1.Text  := Dm1.tValeItensLargura.AsString;
    fValeItens.Edit4.Text  := DM1.tValeItensAliqIcms.AsString;
    fValeItens.Edit5.Text  := DM1.tValeItensAliqIPI.AsString;
    if DM1.tValeItensCodSitTrib.AsInteger > 0 then
      fValeItens.RxDBLookupCombo13.KeyValue := DM1.tValeItensCodSitTrib.AsInteger;
    fValeItens.CurrencyEdit4.Value := DM1.tValeItensVlrUnitario.AsFloat;
    fValeItens.CurrencyEdit5.Value := DM1.tValeItensVlrTotal.AsFloat;
    vNumPedido                     := DM1.tValeItensNumPedido.AsInteger;
    vItemPedido                    := DM1.tValeItensItemPedido.AsInteger;
    //**************************
    DM1.tValeVlrTotal.AsFloat      := DM1.tValeVlrTotal.AsFloat - DM1.tValeItensVlrTotal.AsFloat;
    Excluir_Item;
    fValeItens.ShowModal;
  end;
end;

procedure TfVale.BitBtn6Click(Sender: TObject);
begin
  if DM1.tValeCodCliente.AsInteger > 0 then
  begin
    SpeedButton23.Tag := 0;
    fValeItens := TfValeItens.Create(Self);
    fValeItens.ShowModal;
  end
  else
  begin
    ShowMessage('Falta informar o cliente!');
    RxDBLookupCombo8.SetFocus;
   end;
end;

procedure TfVale.BitBtn14Click(Sender: TObject);
begin
  if DM1.tUsuarioExcVale.AsBoolean then
    begin
    if Dm1.tValeFaturado.AsBoolean then
      ShowMessage('Vale já foi faturado e não pode ser excluído!')
    else
    if MessageDlg('Deseja realmente excluir o vale?',mtconfirmation,[mbok,mbno],0)=mrok then
    begin
      Excluir_Registro;
      DM1.tVale.Refresh;
      tValeIns.Close;
      tValeIns.Open;
      tValeIns.Refresh;
    end;
    if DM1.tVale.RecordCount > 0 then
      BitBtn18.Visible := DM1.tValeFaturado.AsBoolean
    else
      BitBtn18.Visible := False;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfVale.BitBtn3Click(Sender: TObject);
var
  vCodigo : integer;
begin
  vCodigo            := DM1.tValeNumVale.AsInteger;
  DM1.tVale.Filtered := False;
  DM1.tVale.Filter   := 'NumVale = '''+IntToStr(vCodigo)+'''';
  DM1.tVale.Filtered := True;
  fRelVale := TfRelVale.Create(Self);
  fRelVale.QuickRep1.Preview;
  fRelVale.QuickRep1.Free;
  DM1.tVale.Filtered := False;
  DM1.tVale.SetKey;
  DM1.tValeNumVale.AsInteger := vCodigo;
  DM1.tVale.GotoKey;
end;

procedure TfVale.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  if DM1.tVale.RecordCount > 0 then
    BitBtn18.Visible := DM1.tValeFaturado.AsBoolean
  else
    BitBtn18.Visible := False;
end;

procedure TfVale.DBEdit35Exit(Sender: TObject);
begin
  Panel1.Enabled := (DM1.tValeNumVale.AsInteger > 0);
  if DM1.tValeNumVale.AsInteger > 0 then
  begin
    if tValeIns.Locate('NumVale',DM1.tValeNumVale.AsInteger,([Locaseinsensitive])) then
    begin
      ShowMessage('Vale já lançado!');
      DBEdit35.SetFocus;
    end;
  end;
end;

procedure TfVale.Panel6Enter(Sender: TObject);
begin
  DBEdit35.Enabled := (DM1.tValeItens.RecordCount < 1);
end;

procedure TfVale.Excluir_Registro;
begin
  Excluir_CReceber;
  DM1.tValeItens.First;
  while not DM1.tValeItens.Eof do
  begin
    Excluir_Item;
  end;
  DM1.tVale.Delete;
end;

procedure TfVale.Excluir_Item;
begin
  if DM1.tValeItensNumPedido.AsInteger > 0 then
  begin
    DM1.tPedido.IndexFieldNames := 'Pedido';
    DM1.tPedido.SetKey;
    DM1.tPedidoPedido.AsInteger := DM1.tValeItensNumPedido.AsInteger;
    if DM1.tPedido.GotoKey then
    begin
      DM1.tPedido.Edit;
      DM1.tPedidoQtdParesFat.AsInteger  := DM1.tPedidoQtdParesFat.AsInteger - DM1.tValeItensQtd.AsInteger;
      DM1.tPedidoQtdParesRest.AsInteger := DM1.tPedidoQtdParesRest.AsInteger + DM1.tValeItensQtd.AsInteger;
      DM1.tPedidoQtdFatAut.AsInteger    := DM1.tPedidoQtdFatAut.AsInteger - DM1.tValeItensQtd.AsInteger;
      DM1.tPedidoCopiado.AsBoolean      := False;
      DM1.tPedido.Post;
      DM1.tPedidoItem.SetKey;
      DM1.tPedidoItemPedido.AsInteger := DM1.tValeItensNumPedido.AsInteger;
      DM1.tPedidoItemItem.AsInteger   := DM1.tValeItensItemPedido.AsInteger;
      if DM1.tPedidoItem.GotoKey then
      begin
        DM1.tPedidoItem.Edit;
        DM1.tPedidoItemQtdParesFat.AsInteger  := DM1.tPedidoItemQtdParesFat.AsInteger - DM1.tValeItensQtd.AsInteger;
        DM1.tPedidoItemQtdParesRest.AsInteger := DM1.tPedidoItemQtdParesRest.AsInteger + DM1.tValeItensQtd.AsInteger;
        DM1.tPedidoItemQtdFatAut.AsInteger    := DM1.tPedidoItemQtdFatAut.AsInteger - DM1.tValeItensQtd.AsInteger;
        DM1.tPedidoItemCopiado.AsBoolean      := False;
        DM1.tPedidoItem.Post;
        DM1.tPedidoNota.First;
        while not DM1.tPedidoNota.Eof do
        begin
          if (DM1.tPedidoNotaNumNota.AsInteger = DM1.tValeItensNumVale.AsInteger) and
             (DM1.tPedidoNotaItemNota.AsInteger = DM1.tValeItensItem.AsInteger) and
             (DM1.tPedidoNotaTipo.AsString = 'V') then
             DM1.tPedidoNota.Delete
          else
            DM1.tPedidoNota.Next;
        end;
      end;
    end;
  end;
  if DM1.tValeItensNumMovEst.AsInteger > 0 then
    Excluir_Estoque;

  DM1.tValeItens.Delete;
end;

procedure TfVale.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioCondPgto.AsBoolean then
  begin
    fCondPgto := TfCondPgto.Create(Self);
    fCondPgto.ShowModal;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário!');
end;

procedure TfVale.SpeedButton24Click(Sender: TObject);
begin
  if DM1.tUsuarioTiposCobr.AsBoolean then
  begin
    fTipoCobranca := TfTipoCobranca.Create(Self);
    fTipoCobranca.ShowModal;
  end
  else
    ShowMessage('Usuário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a abrir este formulário!');
end;

procedure TfVale.SpeedButton5Click(Sender: TObject);
begin
  if DM1.tUsuarioContas.AsBoolean then
  begin
    fContas := TfContas.Create(Self);
    fContas.ShowModal;
  end
  else
    ShowMessage('Usuário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a abrir este formulário!');
end;

procedure TfVale.BitBtn8Click(Sender: TObject);
var
  vValorDividir, vValorPrest, vValorVariavel : Currency;
  vValorVarTotal, vValorNotaTotal : string;
  vParcela : Integer;
begin
  if StrToFloat(FormatFloat('0.00',DM1.tValeVlrTotal.AsFloat)) <= StrToFloat(FormatFloat('0.00',0)) then
  begin
    ShowMessage('Valor total não informado!');
    exit;
  end;
  if RxDBLookupCombo1.Text = '' then
  begin
    ShowMessage('Deve haver um prazo de pagamento escolhido!');
    exit;
  end;
  DM1.tValeParc.First;
  while not DM1.tValeParc.Eof do
    DM1.tValeParc.Delete;
  vValorDividir := DM1.tValeVlrTotal.AsCurrency;
  vValorPrest   := vValorDividir / DM1.tCondPgtoItem.RecordCount;
  DM1.tCondPgtoItem.First;
  vParcela := 0;
  while not DM1.tCondPgtoItem.EOF do
  begin
    DM1.tValeParc.Insert;
    Inc(vParcela);
    DM1.tValeParcFilial.AsInteger        := DM1.tValeFilial.AsInteger;
    DM1.tValeParcNumVale.AsInteger       := DM1.tValeNumVale.AsInteger;
    DM1.tValeParcParcela.AsInteger       := vParcela;
    DM1.tValeParcValor.AsString          := FormatFloat('0.00',vValorPrest);
    DM1.tValeParcDtVencimento.AsDateTime := DM1.tValeDtEmissao.AsDateTime + DM1.tCondPgtoItemQtdDias.AsInteger;
    if RxDBLookupCombo16.Text <> '' then
      DM1.tValeParcCodTipoCobr.AsInteger := RxDBLookupCombo16.KeyValue;
    if RxDBLookupCombo2.Text <> '' then
      DM1.tValeParcCodConta.AsInteger := RxDBLookupCombo1.KeyValue;
    DM1.tValeParc.Post;
    DM1.tCondPgtoItem.Next;
  end;
  vValorVariavel := 0;
  DM1.tValeParc.First;
  while not DM1.tValeParc.Eof do
  begin
    vValorVariavel := vValorVariavel + DM1.tValeParcValor.AsCurrency;
    DM1.tValeParc.Next;
  end;
  vValorVarTotal  := FormatFloat('0.00',vValorVariavel);
  vValorNotaTotal := FormatFloat('0.00',vValorDividir);
  vValorVariavel  := StrToFloat(vValorNotaTotal) - StrToFloat(vValorVarTotal);

  DM1.tValeParc.Last;
  DM1.tValeParc.Edit;
  DM1.tValeParcValor.AsCurrency := DM1.tValeParcValor.AsCurrency + vValorVariavel;
  DM1.tValeParc.Post;

  DM1.tValeGeraFat.AsBoolean      := False;
  DM1.tValeGeraCobranca.AsBoolean := True;
end;

procedure TfVale.Gera_CReceber;
var
  vParcela : Integer;
  vNumAux : Integer;
  vFlag : Boolean;
begin
  DM1.tValeParc.First;

  DM1.tCReceber.IndexFieldNames := 'Filial;NumCReceber';
  DM1.tCReceber.Refresh;
  DM1.tCReceber.Last;
  vNumAux := DM1.tCReceberNumCReceber.AsInteger + 1;

  vflag := False;
  while vflag = False do
  begin
    vNumAux := vNumAux + 1;
    try
      DM1.tCReceber.Insert;
      Dm1.tCReceberFilial.AsInteger      := DM1.tValeFilial.AsInteger;
      DM1.tCReceberNumCReceber.AsInteger := vNumAux;
      DM1.tCReceber.Post;
      DM1.tCReceber.Refresh;
      DM1.tCReceber.Locate('Filial;NumCReceber',VarArrayOf([DM1.tValeFilial.AsInteger,vNumAux]),[locaseinsensitive]);
      DM1.tCReceber.Edit;
      vflag := True;
    except
      on E: Exception do
      begin
        ShowMessage('Não foi possível gravar contas a receber, ' + E.Message + '! Clique para continuar!');
        vFlag := False;
        DM1.tCReceber.Cancel;
      end;
    end;
  end;

  DM1.tCReceberNumNota.AsInteger    := DM1.tValeNumVale.AsInteger;
  DM1.tCReceberNumSeqNota.AsInteger := 0;
  DM1.tCReceberSerie.AsString       := '';
  DM1.tCReceberCodCli.AsInteger     := DM1.tValeCodCliente.AsInteger;
  DM1.tCReceberTipoDoc.AsString     := 'VL';
  DM1.tCReceberDtGerado.AsDateTime  := DM1.tValeDtEmissao.AsDateTime;
  DM1.tCReceberCancelado.AsBoolean  := False;

  DM1.tValeParc.First;
  while not DM1.tValeParc.Eof do
  begin
    DM1.tCReceberParc.Insert;
    Dm1.tCReceberParcFilial.AsInteger          := DM1.tValeFilial.AsInteger;
    DM1.tCReceberParcDtGerado.AsDateTime       := DM1.tValeDtEmissao.AsDateTime;
    DM1.tCReceberParcNumCReceber.AsInteger     := DM1.tCReceberNumCReceber.AsInteger;
    DM1.tCReceberParcParcCReceber.AsInteger    := DM1.tValeParcParcela.AsInteger;
    DM1.tCReceberParcVlrParcCReceber.AsFloat   := DM1.tValeParcValor.AsFloat;
    DM1.tCReceberVlrTotal.AsFloat              := DM1.tCReceberVlrTotal.AsFloat + DM1.tCReceberParcVlrParcCReceber.AsFloat;
    DM1.tCReceberParcRestParcela.AsFloat       := DM1.tValeParcValor.AsFloat;
    DM1.tCReceberParcDtVencCReceber.AsDateTime := DM1.tValeParcDtVencimento.AsDateTime;
    DM1.tCReceberParcCodCli.AsInteger          := DM1.tValeCodCliente.AsInteger;
    DM1.tCReceberParcNumNota.AsInteger         := DM1.tValeNumVale.AsInteger;
    DM1.tCReceberParcSerie.AsString            := '';
    DM1.tCReceberParcNumSeqNota.AsInteger      := 0;
    DM1.tCReceberParcCodVendedor.AsInteger     := 0;
    DM1.tCReceberParcPercComissao.AsCurrency   := 0;
    DM1.tCReceberParcPlanoContas.AsInteger     := 0;
    DM1.tCReceberParcTipoDoc.AsString          := 'VL';
    DM1.tCReceberParcComissaoItem.AsBoolean    := False;
    DM1.tCReceberParcCodTipoCobranca.AsInteger := DM1.tValeParcCodTipoCobr.AsInteger;
    DM1.tCReceberParcCodConta.AsInteger        := DM1.tValeParcCodConta.AsInteger;
    DM1.tCReceberParcCodBancoBoleto.AsInteger  := DM1.tValeParcCodConta.AsInteger;
    DM1.tCReceberParc.Post;
    dm1.GravaEnt_tCReceberParcHist('ENT');
    DM1.tValeParc.Next;
  end;

  DM1.tCReceber.Post;
end;

procedure TfVale.Excluir_CReceber;
var
  vTipo : String;
begin
  vTipo := 'VL';
  DM1.tCReceber.Filtered := False;
  if DM1.tValeCodCliente.AsInteger > 0 then
    DM1.tCReceber.Filter   := 'NumNota = '''+DM1.tValeNumVale.AsString+''' and CodCli = '''+DM1.tValeCodCliente.AsString+''' and Filial = '''+Dm1.tValeFilial.AsString+''' and TipoDoc = '''+vTipo+''''
  else
    DM1.tCReceber.Filter   := 'NumNota = '''+DM1.tValeNumVale.AsString+''' and Filial = '''+Dm1.tValeFilial.AsString+''' and TipoDoc = '''+vTipo+'''';
  DM1.tCReceber.Filtered := True;
  DM1.tCReceber.First;
  while not DM1.tCReceber.Eof do
  begin
    if DM1.tCReceberTipoDoc.AsString = 'VL' then
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

procedure TfVale.BitBtn9Click(Sender: TObject);
begin
  if DM1.tValeParc.RecordCount < 1 then
    exit;
  if MessageDlg('Deseja excluir a parcela?',mtconfirmation,[mbok,mbno],0)=mrNo then
    exit;
  DM1.tValeParc.Delete;
end;

procedure TfVale.RxDBLookupCombo8Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfVale.RxDBLookupCombo8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F2 then
  begin
    RxDBLookupCombo8.CloseUp(True);
    if RxDBLookupCombo8.LookupDisplay = 'Nome' then
    begin
       RxDBLookupCombo8.LookupDisplay := 'Fantasia';
       //DM1.tCliente.IndexFieldNames   := 'Fantasia';
    end
    else
    if RxDBLookupCombo8.LookupDisplay = 'Fantasia' then
    begin
      RxDBLookupCombo8.LookupDisplay := 'CGCCPF';
      //DM1.tCliente.IndexFieldNames   := 'CGCCPF';
    end
    else
    if RxDBLookupCombo8.LookupDisplay = 'CGCCPF' then
    begin
      //RxDBLookupCombo8.LookupDisplay := 'Nome';
      DM1.tCliente.IndexFieldNames   := 'Nome';
    end;
    DM1.tCliente.IndexFieldNames   := RxDBLookupCombo8.LookupDisplay;
    DM1.tCliente.Refresh;
    Label4.Caption := RxDBLookupCombo8.LookupDisplay;
  end;
end;

end.
