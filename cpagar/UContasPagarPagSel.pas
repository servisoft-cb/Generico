unit UContasPagarPagSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Mask, ToolEdit, ExtCtrls, CurrEdit, Buttons;

type
  TfContasPagarPagSel = class(TForm)
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    Label3: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Shape1: TShape;
    Label4: TLabel;
    DateEdit2: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label12: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    SpeedButton8: TSpeedButton;
    Label15: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DateEdit1Exit(Sender: TObject);
    procedure RxDBLookupCombo3DropDown(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
  private
    { Private declarations }
    vContador, vNumMov : Integer;
    procedure Pagamento;
    procedure Grava_Cheque;
    procedure Grava_ChequeItens;
    procedure Grava_Historico;
  public
    { Public declarations }
  end;

var
  fContasPagarPagSel: TfContasPagarPagSel;

implementation

uses UDM1, UContasPagar2, DB;

{$R *.dfm}

procedure TfContasPagarPagSel.Grava_Historico;
var
  i : Integer;
begin
  DM1.tCPagarParcHist.Refresh;
  DM1.tCPagarParcHist.Last;
  i := DM1.tCPagarParcHistItem.AsInteger;
  DM1.tCPagarParcHist.Insert;
  Dm1.tCPagarParcHistFilial.AsInteger        := Dm1.tCPagarParcFilial.AsInteger;
  DM1.tCPagarParcHistNumCPagar.AsInteger     := DM1.tCPagarParcNumCPagar.AsInteger;
  DM1.tCPagarParcHistParcCPagar.AsInteger    := DM1.tCPagarParcParcCPagar.AsInteger;
  DM1.tCPagarParcHistItem.AsInteger          := i + 1;
  DM1.tCPagarParcHistDtHistorico.AsDateTime  := Date;
  DM1.tCPagarParcHistCodHistorico.AsCurrency := 0;
  DM1.tCPagarParcHistHistorico.AsString      := 'PAGAMENTO TOTAL';
  DM1.tCPagarParcHistDtUltPgto.AsDateTime    := DM1.tCPagarParcDtPagParcCPagar.AsDateTime;
  DM1.tCPagarParcHistVlrUltPgto.AsCurrency   := fContasPagar2.qParcelasRestParcela.AsFloat;
  DM1.tCPagarParcHistPgto.AsBoolean          := True;
  DM1.tCPagarParcHistNumMov.AsInteger        := vNumMov;
  DM1.tCPagarParcHistCodConta.AsInteger      := RxDBLookupCombo1.KeyValue;
  DM1.tCPagarParcHistTipo.AsString           := 'PAG';
  if CurrencyEdit1.AsInteger > 0 then
    begin                                        
      Dm1.tCPagarParcHistNumCheque.AsInteger     := CurrencyEdit1.AsInteger;
      Dm1.tCPagarParcHistDtPrevCheque.AsDateTime := DateEdit2.Date;
    end;
  DM1.tCPagarParcHist.Post;
end;

procedure TfContasPagarPagSel.Grava_ChequeItens;
begin
  DM1.tChequeCPagar.Insert;
  DM1.tChequeCPagarNumMov.AsInteger        := DM1.tChequeNumMov.AsInteger;
  DM1.tChequeCPagarCodConta.AsInteger      := DM1.tChequeCodConta.AsInteger;
  DM1.tChequeCPagarNumCheque.AsInteger     := DM1.tChequeNumCheque.AsInteger;
  DM1.tChequeCPagarFilial.AsInteger        := DM1.tCPagarParcFilial.AsInteger;
  DM1.tChequeCPagarNumCPagar.AsInteger     := DM1.tCPagarParcNumCPagar.AsInteger;
  DM1.tChequeCPagarParcela.AsInteger       := DM1.tCPagarParcParcCPagar.AsInteger;
  DM1.tChequeCPagarNumNota.AsString        := DM1.tCPagarParcNroDuplicata.AsString;
  DM1.tChequeCPagarCodFornecedor.AsInteger := DM1.tCPagarParcCodForn.AsInteger;
  DM1.tChequeCPagarValor.AsFloat           := fContasPagar2.qParcelasRestParcela.AsFloat;
  DM1.tChequeCPagarVlrJuros.AsFloat        := 0;
  DM1.tChequeCPagarVlrDesconto.AsFloat     := 0;
  DM1.tChequeCPagar.Post;

  if DM1.tCheque.State in [dsBrowse] then
    DM1.tCheque.Edit;

  DM1.tChequeVlrTotal.AsFloat := DM1.tChequeVlrTotal.AsFloat + DM1.tChequeCPagarValor.AsFloat;
end;

procedure TfContasPagarPagSel.Grava_Cheque;
var
  vNumMovAux : Integer;
begin
  DM1.tCheque.Refresh;
  DM1.tCheque.Last;
  vNumMovAux := DM1.tChequeNumMov.AsInteger;

  DM1.tCheque.Insert;
  DM1.tChequeNumMov.AsInteger      := vNumMovAux + 1;
  DM1.tChequeFilial.AsInteger      := DM1.tCPagarParcFilial.AsInteger;
  DM1.tChequeCodConta.AsInteger    := RxDBLookupCombo1.KeyValue;
  DM1.tChequeNumCheque.AsInteger   := CurrencyEdit1.AsInteger;
  DM1.tChequeVlrTotal.AsFloat      := 0;
  DM1.tChequeAutomatico.AsBoolean  := True;
  DM1.tChequeDtEmissao.AsDateTime  := DateEdit1.Date;
  DM1.tChequeDtPrevista.AsDateTime := DateEdit2.Date;
  DM1.tChequeNominal.AsString      := 'PAGAMENTO DE CONTAS';
  DM1.tCheque.Post;
  DM1.tCheque.Edit;
end;

procedure TfContasPagarPagSel.Pagamento;
var
  Texto1 : String;
begin
  vNumMov := 0;
  DM1.tMovimentos.Insert;
  DM1.tMovimentosCodConta.AsInteger       := RxDBLookupCombo1.KeyValue;
  DM1.tMovimentosNumCPagar.AsInteger      := DM1.tCPagarNumCPagar.AsInteger;
  DM1.tMovimentosDtMovimento.AsDateTime   := DateEdit1.Date;
  DM1.tMovimentosNumNotaEnt.AsInteger     := DM1.tCPagarParcNumNotaEnt.AsInteger;
  Texto1 := '';
  if DM1.tCPagarParcNumNotaEnt.AsInteger > 0 then
    Texto1 := ' nf.nº ' + DM1.tCPagarNumNotaEnt.AsString
  else
  if DM1.tCPagarParcNroDuplicata.AsString <> '' then
    Texto1 := ' Dupl.nº ' + Trim(DM1.tCPagarNroDuplicata.AsString);
  DM1.tMovimentosCodForn.AsInteger             := DM1.tCPagarParcCodForn.AsInteger;
  if DM1.tCPagarParcPlanoContas.AsInteger > 0 then
    begin
      DM1.tMovimentosPlanoContas.AsInteger         := DM1.tCPagarParcPlanoContas.AsInteger;
      DM1.tMovimentosCodPlanoContasItens.AsInteger := DM1.tCPagarParcCodPlanoContasItens.AsInteger;
    end
  else
  if RxDBLookupCombo3.Text <> '' then
    begin
      DM1.tMovimentosPlanoContas.AsInteger         := RxDBLookupCombo3.KeyValue;
      if RxDBLookupCombo4.Text <> '' then
        DM1.tMovimentosCodPlanoContasItens.AsInteger := RxDBLookupCombo4.KeyValue;
    end;
  DM1.tMovimentosVlrMovDebito.AsCurrency       := DM1.tCPagarParcRestParcela.AsFloat;
  DM1.tMovimentosHistorico.AsString := 'Pg.Parc.nº '+ DM1.tCPagarParcParcCPagar.AsString +
                                       Texto1 + ' de ' + DM1.tCPagarlkNomeForn.AsString;
  DM1.tMovimentosCodCentroCusto.AsInteger     := DM1.tCPagarParcCodCentroCusto.AsInteger;
  DM1.tMovimentosCodCentroCustoItem.AsInteger := DM1.tCPagarParcCodCentroCustoItem.AsInteger;
  DM1.tMovimentos.Post;
  vNumMov := DM1.tMovimentosNumMovimento.AsInteger;

  DM1.tCPagarParc.Edit;
  DM1.tCPagarParcRestParcela.AsCurrency     := StrToFloat(FormatFloat('0.00',0));
  DM1.tCPagarParcDtPagParcCPagar.AsDateTime := DateEdit1.Date;
  DM1.tCPagarParcCodConta.AsInteger         := RxDBLookupCombo1.KeyValue;
  DM1.tCPagarParcQuitParcCPagar.AsBoolean   := True;
  DM1.tCPagarParcDiasAtraso.AsFloat         := DM1.tCPagarParcDtPagParcCPagar.AsFloat - DM1.tCPagarParcDtVencCPagar.AsFloat;
  if DM1.tCPagarParcclDiasAtraso.AsFloat < 0 then
    DM1.tCPagarParcclDiasAtraso.AsFloat := 0;
  DM1.tCPagarParcPgtoParcial.AsCurrency := DM1.tCPagarParcPgtoParcial.AsCurrency + fContasPagar2.qParcelasRestParcela.AsFloat;
  DM1.tCPagarParc.Post;

  Grava_Historico;
  vContador := vContador + 1;
end;

procedure TfContasPagarPagSel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfContasPagarPagSel.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tContas.IndexFieldNames := 'NomeConta';
end;

procedure TfContasPagarPagSel.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfContasPagarPagSel.BitBtn1Click(Sender: TObject);
var
  vFlag, vPaga : Boolean;
begin
  if RxDBLookupCombo1.Text = '' then
  begin
    ShowMessage('É obrigatório informar a conta!');
    exit;
  end;
  if DateEdit1.Date < 10 then
  begin
    ShowMessage('É obrigatório informar a data de pagamento!');
    exit;
  end;
  DM1.tContas.IndexFieldNames := 'CodConta';
  DM1.tContas.FindKey([RxDBLookupCombo1.KeyValue]);
  if DateEdit1.Date <= DM1.tContasDtEncerramento.AsDateTime then
  begin
    ShowMessage('Data de encerramento ' + DM1.tContasDtEncerramento.AsString + ', é maior que a informada!');
    exit;
  end;
  
  if (DM1.tContasTipoConta.AsString <> 'B') and (CurrencyEdit1.AsInteger > 0) then
  begin
    ShowMessage('Conta não é banco, não pode ter nº de cheque!');
    exit;
  end;
  if CurrencyEdit1.Value > 0 then
  begin
    if (DM1.tCheque.Locate('CodConta;NumCheque',VarArrayOf([RxDBLookupCombo1.KeyValue,CurrencyEdit1.AsInteger]),[locaseinsensitive])) then
    begin
      ShowMessage('Já existe este cheque!');
      exit;
    end;
  end;

  fContasPagar2.SMDBGrid1.DisableScroll;
  vFlag := False;
  fContasPagar2.qParcelas.First;
  while not fContasPagar2.qParcelas.Eof do
  begin
    if fContasPagar2.SMDBGrid1.SelectedRows.CurrentRowSelected then
    begin
      vPaga := True;
      if not DM1.tCPagar.Locate('Filial;NumCPagar',VarArrayOf([fContasPagar2.qParcelasFilial.AsInteger,fContasPagar2.qParcelasNumCPagar.AsInteger]),[locaseinsensitive]) then
        vPaga := False;
      if not DM1.tCPagarParc.Locate('Filial;NumCPagar;ParcCPagar',VarArrayOf([fContasPagar2.qParcelasFilial.AsInteger,fContasPagar2.qParcelasNumCPagar.AsInteger,fContasPagar2.qParcelasParcCPagar.AsInteger]),[locaseinsensitive]) then
        vPaga := False
      else
      if StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsFloat)) <= 0 then
        vPaga := False;
      if vPaga then
      begin
        try
          if (CurrencyEdit1.AsInteger > 0) and not(vFlag) then
            Grava_Cheque;
          if CurrencyEdit1.AsInteger > 0 then
            Grava_ChequeItens;
          Pagamento;
          vFlag := True;
        except
          on E: Exception do
            ShowMessage('Erro no pagamento, ' + E.Message);
        end;
      end;
    end;
    fContasPagar2.qParcelas.Next;
  end;
  if DM1.tCheque.State in [dsEdit] then
  begin
    if vContador = 1 then
      DM1.tChequeNominal.AsString := DM1.tCPagarlkNomeForn.AsString;
    DM1.tCheque.Post;
  end;
  if vContador > 0 then
    ShowMessage(IntToStr(vContador) + ' titulo(s) pago(s)!')
  else
    ShowMessage('Não foi selecionado títulos para pagamento');
  fContasPagar2.SMDBGrid1.EnableScroll;
  Close;
end;

procedure TfContasPagarPagSel.DateEdit1Exit(Sender: TObject);
begin
  DateEdit2.Date := DateEdit1.Date;
end;

procedure TfContasPagarPagSel.RxDBLookupCombo3DropDown(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfContasPagarPagSel.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfContasPagarPagSel.RxDBLookupCombo4Enter(Sender: TObject);
begin
  if RxDBLookupCombo3.Text <> '' then
    RxDBLookupCombo4.ReadOnly := False
  else
    RxDBLookupCombo4.ReadOnly := True;
end;

end.
