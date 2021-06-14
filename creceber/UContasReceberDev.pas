unit UContasReceberDev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask, ToolEdit, CurrEdit, RxLookup,
  Db, DBTables, DBFilter, Variants;

type
  TfContasReceberDev = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    Label15: TLabel;
    DBText5: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    Label3: TLabel;
    DBText3: TDBText;
    Label1: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    Label5: TLabel;
    DateEdit1: TDateEdit;
    Label6: TLabel;
    DBText6: TDBText;
    Label7: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Bevel1: TBevel;
    Label11: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Edit1: TEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    tHistorico: TTable;
    tHistoricoCodigo: TIntegerField;
    tHistoricoNome: TStringField;
    tHistoricoTipo: TStringField;
    dsHistorico: TDataSource;
    RxDBFilter1: TRxDBFilter;
    tExtComissaoIns: TTable;
    tExtComissaoInsNroLancamento: TIntegerField;
    tExtComissaoInsCodVendedor: TIntegerField;
    tExtComissaoInsDtReferencia: TDateField;
    tExtComissaoInsNroDoc: TIntegerField;
    tExtComissaoInsParcDoc: TIntegerField;
    tExtComissaoInsCodCliente: TIntegerField;
    tExtComissaoInsFuncao: TStringField;
    tExtComissaoInsVlrBase: TFloatField;
    tExtComissaoInsPercDescDupl: TFloatField;
    tExtComissaoInsPercComissao: TFloatField;
    tExtComissaoInsVlrComissao: TFloatField;
    tExtComissaoInsTipo: TStringField;
    tExtComissaoInsSuspensa: TBooleanField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CurrencyEdit2Enter(Sender: TObject);
    procedure CurrencyEdit2Exit(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    procedure Grava_Historico;
    procedure Grava_ExtComissao;
    procedure Pgto_Total;
    procedure Pgto_Parcial;
  public
    { Public declarations }
  end;

var
  fContasReceberDev: TfContasReceberDev;
  vParc: Integer;
  vCReceber: Integer;

implementation

uses UDM1, UHistorico, UDM2;

{$R *.DFM}

procedure TfContasReceberDev.Grava_Historico;
var
  vItemAux: Integer;
begin
  DM1.tCReceberParcHist.Refresh;
  DM1.tCReceberParcHist.Last;
  vItemAux := DM1.tCReceberParcHistItem.AsInteger;

  DM1.tCReceberParcHist.Insert;
  Dm1.tCReceberParcHistFilial.AsInteger := Dm1.tCReceberParcFilial.AsInteger;
  DM1.tCReceberParcHistNumCReceber.AsInteger := DM1.tCReceberParcNumCReceber.AsInteger;
  DM1.tCReceberParcHistParcCReceber.AsInteger := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tCReceberParcHistItem.AsInteger := vItemAux + 1;
  DM1.tCReceberParcHistDtHistorico.AsDateTime := Date;
  DM1.tCReceberParcHistCodHistorico.AsCurrency := 0;
  if Edit1.Text <> '' then
    DM1.tCReceberParcHistHistorico.AsString := Edit1.Text
  else
    DM1.tCReceberParcHistHistorico.AsString := 'VALOR REF. DEVOLUCAO';
  DM1.tCReceberParcHistDtUltPgto.AsDateTime := DateEdit1.Date; ;
  DM1.tCReceberParcHistVlrUltPgto.AsCurrency := 0;
  DM1.tCReceberParcHistVlrUltJuros.AsFloat := DM1.tCReceberParcJurosParcCReceber.AsFloat;
  DM1.tCReceberParcHistVlrUltDescontos.AsFloat := DM1.tCReceberParcDesconto.AsFloat;
  DM1.tCReceberParcHistVlrUltDespesas.AsFloat := DM1.tCReceberParcDespesas.AsFloat;
  DM1.tCReceberParcHistVlrUltAbatimentos.AsFloat := DM1.tCReceberParcAbatimentos.AsFloat;
  DM1.tCReceberParcHistVlrDevolucao.AsFloat := CurrencyEdit1.Value;
  DM1.tCReceberParcHistPgto.AsBoolean := False;
  DM1.tCReceberParcHistDevolucao.AsBoolean := True;
  DM1.tCReceberParcHistTipo.AsString := 'DEV';
end;

procedure TfContasReceberDev.Grava_ExtComissao;
begin
  tExtComissaoIns.Refresh;
  tExtComissaoIns.Last;
  DM1.tExtComissao.Insert;
  DM1.tExtComissaoNroLancamento.AsInteger := tExtComissaoInsNroLancamento.AsInteger + 1;
  DM1.tExtComissaoCodVendedor.AsInteger := DM1.tCReceberParcCodVendedor.AsInteger;
  DM1.tExtComissaoDtReferencia.AsDateTime := DateEdit1.Date;
  DM1.tExtComissaoParcDoc.AsInteger := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tExtComissaoCodCliente.AsInteger := DM1.tCReceberParcCodCli.AsInteger;
  DM1.tExtComissaoFuncao.AsString := 'D';
  DM1.tExtComissaoNroDoc.AsInteger := DM1.tCReceberParcNumNota.AsInteger;
  DM1.tExtComissaoVlrBase.AsCurrency := CurrencyEdit1.Value;
  DM1.tExtComissaoPercDescDupl.AsFloat := DM1.tCReceberParcDesconto.AsFloat;
  DM1.tExtComissaoPercComissao.AsFloat := DM1.tCReceberParcPercComissao.AsFloat;
  DM1.tExtComissaoVlrComissao.AsFloat := StrToFloat(FormatFloat('0.00', (DM1.tExtComissaoVlrBase.AsFloat * DM1.tExtComissaoPercComissao.AsFloat / 100)));
  DM1.tExtComissaoTipo.AsString := 'N';
  DM1.tExtComissaoSuspensa.AsBoolean := False;
  DM1.tExtComissao.Post;
  DM1.tCReceberParcHistNroLancExtComissao.AsInteger := DM1.tExtComissaoNroLancamento.AsInteger;
end;

procedure TfContasReceberDev.Pgto_Total;
  procedure QuitaContaReceber;
  var Achou: Boolean;
  begin
    Achou := False;
    DM1.tCReceberParc.First;
    while not DM1.tCReceberParc.EOF do
    begin
      if not DM1.tCReceberParcQuitParcCReceber.AsBoolean then
        Achou := True;
      DM1.tCReceberParc.Next;
    end;
    if not Achou then
    begin
      if DM1.tCReceber.MasterSource.Enabled then
        DM1.tCReceber.MasterSource.Enabled := False;
      DM1.tCReceber.Edit;
      DM1.tCReceberQuitado.AsBoolean := True;
      DM1.tCReceber.Post;
      DM1.tCReceber.MasterSource.Enabled := True;
    end;
  end;
begin
  DM1.tCReceberParcVlrDevolucao.AsFloat := DM1.tCReceberParcVlrDevolucao.AsFloat + CurrencyEdit1.Value;
  DM1.tCReceberParcRestParcela.AsFloat := StrToFloat(FormatFloat('0.00', DM1.tCReceberParcRestParcela.AsFloat -
    CurrencyEdit1.Value));
  if DM1.tCReceberParcDtVencCReceber.AsString = '' then
    DM1.tCReceberParcDtVencCReceber.AsDateTime := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
  Grava_Historico;
  if DM1.tParametrosGeraComissaoDevol.AsBoolean then
  begin
    if (DM1.tCReceberParclkTipoComissao.AsString = 'N') and (DM1.tCReceberParcCodVendedor.AsInteger > 0) and
      (DM1.tCReceberParcPercComissao.AsFloat > 0) then
      Grava_ExtComissao;
  end;
  DM1.tCReceberParcHist.Post;
  DM1.tCReceberParcQuitParcCReceber.AsBoolean := True;
  DM1.tCReceberParc.Post;
  QuitaContaReceber;
  DM1.tCReceberParc.Locate('NumCReceber;ParcCReceber', VarArrayOf([vCReceber, vParc]), [loCaseInsensitive]);
  Close;
end;

procedure TfContasReceberDev.Pgto_Parcial;
  procedure QuitaContaReceber;
  var Achou: Boolean;
  begin
    Achou := False;
    DM1.tCReceberParc.First;
    while not DM1.tCReceberParc.EOF do
    begin
      if not DM1.tCReceberParcQuitParcCReceber.AsBoolean then
        Achou := True;
      DM1.tCReceberParc.Next;
    end;
    if not Achou then
    begin
      DM1.tCReceber.MasterSource.Enabled := False;
      DM1.tCReceber.Edit;
      DM1.tCReceberQuitado.AsBoolean := True;
      DM1.tCReceber.Post;
      DM1.tCReceber.MasterSource.Enabled := True;
    end;
  end;
begin
  DM1.tCReceberParcVlrDevolucao.AsFloat := DM1.tCReceberParcVlrDevolucao.AsFloat + CurrencyEdit1.Value;
  DM1.tCReceberParcRestParcela.AsCurrency := StrToFloat(FormatFloat('0.00', DM1.tCReceberParcRestParcela.AsCurrency - CurrencyEdit1.Value));
  if DM1.tCReceberParcDtVencCReceber.AsString = '' then
    DM1.tCReceberParcDtVencCReceber.AsDateTime := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
  Grava_Historico;
  if DM1.tParametrosGeraComissaoDevol.AsBoolean then
  begin
    if (DM1.tCReceberParclkTipoComissao.AsString = 'N') and (DM1.tCReceberParcCodVendedor.AsInteger > 0) and
      (DM1.tCReceberParcPercComissao.AsFloat > 0) then
      Grava_ExtComissao;
  end;
  DM1.tCReceberParcHist.Post;
  if StrToFloat(FormatFloat('0.00', DM1.tCReceberParcRestParcela.AsFloat)) = 0 then
    DM1.tCReceberParcQuitParcCReceber.AsBoolean := True;
  DM1.tCReceberParc.Post;
  QuitaContaReceber;
  DM1.tCReceberParc.Locate('NumCReceber;ParcCReceber', VarArrayOf([vCReceber, vParc]), [loCaseInsensitive]);
  Close;
end;

procedure TfContasReceberDev.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM1.tCReceberParc.State in [dsInsert, dsEdit] then
    DM1.tCReceberParc.Cancel;
  Action := Cafree;
end;

procedure TfContasReceberDev.FormShow(Sender: TObject);
begin
  vParc := Dm1.tCReceberParcParcCReceber.AsInteger;
  vCReceber := Dm1.tCReceberParcNumCReceber.AsInteger;
  DM1.tCReceberParc.Edit;
  CurrencyEdit1.Value := DM1.tCReceberParcRestParcela.AsCurrency;
  DateEdit1.Date := Date;
  CurrencyEdit2.Value := 0;
  Edit1.Text := '';
end;

procedure TfContasReceberDev.BitBtn1Click(Sender: TObject);
begin
  if CurrencyEdit1.Value > StrToFloat(FormatFloat('0.00', (DM1.tCReceberParcRestParcela.AsFloat))) then
    ShowMessage('Valor da devolução não pode ser maior que restante a receber!')
  else
    if CurrencyEdit1.value <= 0 then
      ShowMessage('Valor de devolução não pode ser zero!')
    else
      if (CurrencyEdit1.value = StrToFloat(FormatFloat('0.00', (DM1.tCReceberParcVlrParcCReceber.AsFloat)))) and
        (CurrencyEdit1.value = StrToFloat(FormatFloat('0.00', (DM1.tCReceberParcRestParcela.AsFloat)))) then
        Pgto_Total
      else
        Pgto_Parcial;
end;

procedure TfContasReceberDev.CurrencyEdit2Enter(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Codigo';
end;

procedure TfContasReceberDev.CurrencyEdit2Exit(Sender: TObject);
begin
  if CurrencyEdit2.Value > 0 then
  begin
    DM1.tHistorico.SetKey;
    DM1.tHistoricoCodigo.AsCurrency := CurrencyEdit2.Value;
    if DM1.tHistorico.GotoKey then
      Edit1.Text := DM1.tHistoricoNome.AsString
    else
    begin
      Edit1.Text := '';
      ShowMessage('Histórico não cadastrado!');
      CurrencyEdit2.SetFocus;
    end;
  end
  else
    Edit1.Text := '';
end;

procedure TfContasReceberDev.Edit1Change(Sender: TObject);
begin
  try
    tHistorico.IndexFieldNames := 'Nome';
    tHistorico.FindNearest([Edit1.Text]);
    CurrencyEdit2.Text := tHistoricoCodigo.AsString;
  except
  end;
end;

procedure TfContasReceberDev.RxDBLookupCombo1Change(Sender: TObject);
begin
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit2.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasReceberDev.RxDBLookupCombo1Enter(Sender: TObject);
begin
  tHistorico.IndexFieldNames := 'Nome';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit2.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasReceberDev.RxDBLookupCombo1Exit(Sender: TObject);
begin
  tHistorico.IndexFieldNames := 'Codigo';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit2.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasReceberDev.SpeedButton1Click(Sender: TObject);
begin
  fHistorico := TfHistorico.Create(Self);
  fHistorico.ShowModal;
end;

procedure TfContasReceberDev.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F10 then
    BitBtn1Click(Sender);
end;

procedure TfContasReceberDev.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

end.

