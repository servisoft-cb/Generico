unit UContasReceberPagSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Mask, ToolEdit, ExtCtrls, CurrEdit, Buttons;

type
  TfContasReceberPagSel = class(TForm)
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label12: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    SpeedButton8: TSpeedButton;
    Label15: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo3DropDown(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    vContador, vNumMov : Integer;
    vValorJuros : real;
    vJurosCalculado : Real;

    procedure Pagamento;
    procedure Grava_Historico;
    procedure Grava_ExtComissao;
    procedure Calcula_Juros;
  public
    { Public declarations }
  end;

var
  fContasReceberPagSel: TfContasReceberPagSel;

implementation

uses UDM1, UContasReceber2, DB, UPlanoContas;

{$R *.dfm}

procedure TfContasReceberPagSel.Grava_ExtComissao;
var
  vAux, vPercentual, vPercentual2 : Real;
  i : Integer;
begin
  DM1.tExtComissao.Refresh;
  DM1.tExtComissao.Last;
  i := DM1.tExtComissaoNroLancamento.AsInteger;
  DM1.tExtComissao.Insert;
  DM1.tExtComissaoNroLancamento.AsInteger := i + 1;
  DM1.tExtComissaoCodVendedor.AsInteger   := DM1.tCReceberParcCodVendedor.AsInteger;
  DM1.tExtComissaoDtReferencia.AsDateTime := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
  DM1.tExtComissaoParcDoc.AsInteger       := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tExtComissaoCodCliente.AsInteger    := DM1.tCReceberParcCodCli.AsInteger;
  DM1.tExtComissaoFuncao.AsString         := 'E';
  DM1.tExtComissaoNroDoc.AsInteger        := DM1.tCReceberParcNumNota.AsInteger;
  DM1.tExtComissaoVlrBase.AsCurrency      := DM1.tCReceberParcRestParcela.AsFloat;
  DM1.tExtComissaoPercDescDupl.AsFloat    := DM1.tCReceberParcDesconto.AsFloat;
  DM1.tExtComissaoPercComissao.AsFloat    := DM1.tCReceberParcPercComissao.AsFloat;
  if DM1.tCReceberParcPercComissao.AsFloat > 0 then
    begin
      DM1.tNotaFiscal.IndexFieldNames := 'Filial;NumNota';
      DM1.tNotaFiscal.SetKey;
      DM1.tNotaFiscalFilial.AsInteger  := DM1.tCReceberFilial.AsInteger;
      DM1.tNotaFiscalNumNota.AsInteger := DM1.tCReceberParcNumNota.AsInteger;
      if DM1.tNotaFiscal.GotoKey then
        begin
          if DM1.tNotaFiscalVlrIpi.AsFloat > 0 then
            begin
              if DM1.tCReceberParc.RecordCount = 1 then
                begin
                  vPercentual  := StrToFloat(FormatFloat('0.0000',(StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) / DM1.tCReceberParcVlrParcCReceber.AsFloat) * 100));
                  vAux         := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrIpi.AsFloat * vPercentual) / 100));
                  DM1.tExtComissaoVlrBase.AsCurrency := DM1.tExtComissaoVlrBase.AsCurrency - vAux;
                end
              else
                begin
                  vPercentual  := StrToFloat(FormatFloat('0.0000',(StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) / DM1.tCReceberParcVlrParcCReceber.AsFloat) * 100));
                  vPercentual2 := StrToFloat(FormatFloat('0.0000',(DM1.tCReceberParcVlrParcCReceber.AsFloat / DM1.tCReceberVlrTotal.AsFloat) * 100));
                  vAux         := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrIpi.AsFloat * vPercentual2) / 100));
                  vAux         := StrToFloat(FormatFloat('0.00',(vAux * vPercentual) / 100));
                  DM1.tExtComissaoVlrBase.AsCurrency := DM1.tExtComissaoVlrBase.AsCurrency - vAux;
                end;
            end;
        end;
      DM1.tExtComissaoVlrComissao.AsFloat     := StrToFloat(FormatFloat('0.00',(DM1.tExtComissaoVlrBase.AsFloat * DM1.tExtComissaoPercComissao.AsFloat) / 100));
    end
  else
  if DM1.tCReceberParcVlrComissao.AsFloat > 0 then
    begin
      if DM1.tCReceberParcQuitParcCReceber.AsBoolean then
        begin
          DM1.tExtComissaoVlrComissao.AsFloat      := DM1.tCReceberParcVlrComissaoRestante.AsFloat;
          DM1.tCReceberParcVlrComissaoRestante.AsFloat := 0;
        end
      else
        begin
          vPercentual := StrToFloat(FormatFloat('0.0000',(DM1.tCReceberParcHistVlrUltPgto.AsFloat / DM1.tCReceberParcVlrParcCReceber.AsFloat) * 100));
          vAux := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcVlrComissao.AsFloat * vPercentual / 100));
          DM1.tExtComissaoVlrComissao.AsFloat     := StrToFloat(FormatFloat('0.00',vAux));
          DM1.tCReceberParcVlrComissaoRestante.AsFloat := DM1.tCReceberParcVlrComissaoRestante.AsFloat - DM1.tExtComissaoVlrComissao.AsFloat;
          if DM1.tCReceberParcVlrComissaoRestante.AsFloat < 0 then
            DM1.tCReceberParcVlrComissaoRestante.AsFloat := 0;
        end;
    end;
  DM1.tExtComissaoTipo.AsString           := 'D';
  DM1.tExtComissaoSuspensa.AsBoolean      := False;
  DM1.tExtComissao.Post;
  DM1.tCReceberParcHistNroLancExtComissao.AsInteger := DM1.tExtComissaoNroLancamento.AsInteger;
end;

procedure TfContasReceberPagSel.Calcula_Juros;
var
  vJurosDia, vAux : Real;
  vQtdDia : Real;
  vJuros : Real;
  ano,mes,dia : Word;
begin
  vJurosCalculado     := DM1.tCReceberParcJurosParcCReceber.AsFloat - DM1.tCReceberParcJurosPagos.AsFloat;
  //CurrencyEdit5.Value := DM1.tCReceberParcJurosParcCReceber.AsFloat - DM1.tCReceberParcJurosPagos.AsFloat;
  if vJurosCalculado < 0 then
    vJurosCalculado := 0;
  if (Date > DM1.tCReceberParcDtVencCReceber.AsDateTime) and
     (Date > DM1.tCReceberParcDtPagParcCReceber.AsDateTime) then
    begin
      if DM1.tParametrosControlarJurosParam.AsBoolean then
        vJuros := DM1.tParametrosPercJuros.AsFloat
      else
        begin
          DecodeDate(Date, Ano, Mes, Dia);
          DM1.tJuros.SetKey;
          DM1.tJurosAno.AsInteger := Ano;
          DM1.tJurosMes.AsInteger := Mes;
          if not DM1.tJuros.GotoKey then
            begin
              ShowMessage('Juros não cadastrado para o mês de pagamento, sistema ira usar 3%!');
              vJuros := 0;
            end
          else
            vJuros := DM1.tJurosJuro.AsFloat;
        end;
      if vJuros <= 0 then
        vJuros := 3;
      if vJuros > 0 then
        begin
          vJurosDia := vJuros / 30;
          if DM1.tCReceberParcDtPagParcCReceber.AsDateTime > 0 then
            vQtdDia := Date - DM1.tCReceberParcDtPagParcCReceber.AsDateTime
          else
            vQtdDia := Date - DM1.tCReceberParcDtVencCReceber.AsDateTime;
          vAux := (vQtdDia * vJurosDia);
          vAux := ((DM1.tCReceberParcRestParcela.AsFloat + vJurosCalculado) * vAux) / 100;
          vValorJuros     := vAux;
          vJurosCalculado := vJurosCalculado + vAux;
        end;
    end;
end;

procedure TfContasReceberPagSel.Grava_Historico;
var
  i : Integer;
begin
  DM1.tCReceberParcHist.Refresh;
  DM1.tCReceberParcHist.Last;
  i := DM1.tCReceberParcHistItem.AsInteger;
  DM1.tCReceberParcHist.Insert;
  Dm1.tCReceberParcHistFilial.AsInteger          := Dm1.tCReceberParcFilial.AsInteger;
  DM1.tCReceberParcHistNumCReceber.AsInteger     := DM1.tCReceberParcNumCReceber.AsInteger;
  DM1.tCReceberParcHistParcCReceber.AsInteger    := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tCReceberParcHistItem.AsInteger            := i + 1;
  DM1.tCReceberParcHistDtHistorico.AsDateTime    := Date;
  DM1.tCReceberParcHistCodHistorico.AsCurrency   := 0;
  DM1.tCReceberParcHistHistorico.AsString        := 'PAGAMENTO TOTAL';
  DM1.tCReceberParcHistDtUltPgto.AsDateTime      := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
  DM1.tCReceberParcHistVlrUltPgto.AsCurrency     := fContasReceber2.qConsultaRestParcela.AsFloat;
  DM1.tCReceberParcHistVlrUltJuros.AsFloat       := DM1.tCReceberParcJurosParcCReceber.AsFloat;
  DM1.tCReceberParcHistVlrUltDescontos.AsFloat   := 0;
  DM1.tCReceberParcHistVlrUltDespesas.AsFloat    := 0;
  DM1.tCReceberParcHistVlrUltAbatimentos.AsFloat := 0;
  DM1.tCReceberParcHistPgto.AsBoolean            := True;
  DM1.tCReceberParcHistNumMov.AsInteger          := vNumMov;
  DM1.tCReceberParcHistNumMovJuros.AsInteger     := 0;
  DM1.tCReceberParcHistJurosCalc.AsFloat         := vValorJuros;
  DM1.tCReceberParcHistTipo.AsString             := 'PAG';
  DM1.tCReceberParcHistCodConta.AsInteger        := RxDBLookupCombo1.KeyValue;
end;

procedure TfContasReceberPagSel.Pagamento;
var
  vCodPlano, vCodPlanoItens : Integer;
begin
  vCodPlano      := 0;
  vCodPlanoItens := 0;
  if (DM1.tCReceberParcPlanoContas.AsInteger <= 0) and (RxDBLookupCombo3.Text <> '') then
  begin
    vCodPlano := RxDBLookupCombo3.KeyValue;
    if RxDBLookupCombo4.Text <> '' then
      vCodPlanoItens := RxDBLookupCombo4.KeyValue;
  end
  else
  begin
    vCodPlano      := DM1.tCReceberParcPlanoContas.AsInteger;
    vCodPlanoItens := DM1.tCReceberParcCodPlanoContasItens.AsInteger;
  end;

  vNumMov := 0;
  DM1.tMovimentos.Insert;
  DM1.tMovimentosCodConta.AsInteger             := RxDBLookupCombo1.KeyValue;
  DM1.tMovimentosNumCReceber.AsInteger          := DM1.tCReceberNumCReceber.AsInteger;
  DM1.tMovimentosFilial.AsInteger               := DM1.tCReceberFilial.AsInteger;
  DM1.tMovimentosParcela.AsInteger              := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tMovimentosDtMovimento.AsDateTime         := DateEdit1.Date;
  DM1.tMovimentosNumNota.AsInteger              := DM1.tCReceberParcNumNota.AsInteger;
  DM1.tMovimentosCodCli.AsInteger               := DM1.tCReceberParcCodCli.AsInteger;
  DM1.tMovimentosVlrMovCredito.AsCurrency       := DM1.tCReceberParcRestParcela.AsFloat;
  DM1.tMovimentosPlanoContas.AsInteger          := vCodPlano;
  DM1.tMovimentosCodPlanoContasItens.AsInteger  := vCodPlanoItens;
  DM1.tMovimentosHistorico.AsString             := 'Rec.Parc.nº '+ DM1.tCReceberParcParcCReceber.AsString
                                                 + ' nf.nº ' + DM1.tCReceberNumNota.AsString
                                                 + ' de ' + DM1.tCReceberlkNomeCli.AsString;

  //Cartão de Crédito
  if DM1.tCReceberParcCodCartaoCredito.AsInteger > 0 then
  begin
    if fContasReceber2.fnc_Achou_tExtCartao then
    begin
      fContasReceber2.Pagto_CartaoCredito;
      DM1.tMovimentosHistorico.AsString := DM1.tMovimentosHistorico.AsString
                                         + '(Cartão ' + DM1.tExtCartaolkCartaoCredito.AsString
                                         + ', Aut. ' + DM1.tExtCartaoNumAutorizacao.AsString + ')';
    end;
  end;
  //**************

  DM1.tMovimentos.Post;
  vNumMov := DM1.tMovimentosNumMovimento.AsInteger;

  DM1.tCReceberParc.Edit;
  if DM1.tCReceberParcPlanoContas.AsInteger < 1 then
  begin
    DM1.tCReceberParcPlanoContas.AsInteger         := vCodPlano;
    DM1.tCReceberParcCodPlanoContasItens.AsInteger := vCodPlanoItens;
  end;
  DM1.tCReceberParcCodConta.AsInteger           := RxDBLookupCombo1.KeyValue;
  DM1.tCReceberParcDtPagParcCReceber.AsDateTime := DateEdit1.Date;
  if DM1.tCReceberParcDtVencCReceber.AsDateTime < DateEdit1.Date then
    Calcula_Juros;

  DM1.tCReceberParcJurosParcCReceber.AsFloat    := DM1.tCReceberParcJurosParcCReceber.AsFloat + vJurosCalculado;
  DM1.tCReceberParcDiasAtraso.AsFloat :=  DM1.tCReceberParcDtPagParcCReceber.AsDateTime - DM1.tCReceberParcDtVencCReceber.AsDateTime;
  if DM1.tCReceberParcDiasAtraso.AsFloat < 0 then
    DM1.tCReceberParcDiasAtraso.AsFloat := 0;
  Grava_Historico;
  if (DM1.tCReceberParclkTipoComissao.AsString = 'D') and (DM1.tCReceberParcCodVendedor.AsInteger > 0) and
     ((DM1.tCReceberParcPercComissao.AsFloat > 0) or (DM1.tCReceberParcVlrComissao.AsFloat > 0))  then
    Grava_ExtComissao;
  DM1.tCReceberParcHist.Post;
  DM1.tCReceberParcPgtoParcial.AsCurrency     := DM1.tCReceberParcPgtoParcial.AsCurrency + DM1.tCReceberParcRestParcela.AsFloat;
  DM1.tCReceberParcRestParcela.AsFloat        := 0;
  DM1.tCReceberParcQuitParcCReceber.AsBoolean := True;
  DM1.tCReceberParc.Post;
  vContador := vContador + 1;
end;

procedure TfContasReceberPagSel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfContasReceberPagSel.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfContasReceberPagSel.BitBtn1Click(Sender: TObject);
var
  vPaga : Boolean;
begin
  if RxDBLookupCombo1.Text = '' then
  begin
    ShowMessage('É obrigatório informar a conta!');
    exit;
  end;
  if (DM1.tContas.Locate('CodConta',RxDBLookupCombo1.KeyValue,[loCaseInsensitive])) and
     (DateEdit1.Date <= DM1.tContasDtEncerramento.AsDateTime) then
  begin
    ShowMessage('Data de encerramento ' + DM1.tContasDtEncerramento.AsString + ', é maior que a informada!');
    exit;
  end;
  fContasReceber2.SMDBGrid1.DisableScroll;
  if DateEdit1.Date < 1 then
  begin
    ShowMessage('É obrigatório informar a data de pagamento!');
    exit;
  end;
  fContasReceber2.qConsulta.First;
  while not fContasReceber2.qConsulta.Eof do
  begin
    if fContasReceber2.SMDBGrid1.SelectedRows.CurrentRowSelected then
    begin
      vPaga := True;
      DM1.tFilial.Locate('Codigo',fContasReceber2.qConsultaFilial.AsInteger,[loCaseInsensitive]);
      if not DM1.tCReceber.Locate('Filial;NumCReceber',VarArrayOf([fContasReceber2.qConsultaFilial.AsInteger,fContasReceber2.qConsultaNumCReceber.AsInteger]),[locaseinsensitive]) then
        vPaga := False;
      if not DM1.tCReceberParc.Locate('Filial;NumCReceber;ParcCReceber',VarArrayOf([fContasReceber2.qConsultaFilial.AsInteger,fContasReceber2.qConsultaNumCReceber.AsInteger,fContasReceber2.qConsultaParcCReceber.AsInteger]),[locaseinsensitive]) then
        vPaga := False
      else
      if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) <= 0 then
        vPaga := False;
      if vPaga then
      begin
        try
          Pagamento;
        except
          on E: Exception do
            ShowMessage('Erro no pagamento, ' + E.Message);
        end;
      end;
    end;
    fContasReceber2.qConsulta.Next;
  end;
  if vContador > 0 then
    ShowMessage(IntToStr(vContador) + ' titulo(s) pago(s)!')
  else
    ShowMessage('Não foi selecionado títulos para pagamento');
  fContasReceber2.SMDBGrid1.EnableScroll;
  Close;
end;

procedure TfContasReceberPagSel.RxDBLookupCombo3DropDown(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfContasReceberPagSel.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfContasReceberPagSel.RxDBLookupCombo4Enter(Sender: TObject);
begin
  if RxDBLookupCombo3.Text <> '' then
    RxDBLookupCombo4.ReadOnly := False
  else
    RxDBLookupCombo4.ReadOnly := True;
end;

procedure TfContasReceberPagSel.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioPlanoCtas.AsBoolean then
    begin
      fPlanoContas := TfPlanoContas.Create(Self);
      fPlanoContas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasReceberPagSel.FormShow(Sender: TObject);
begin
//  DM1.tExtCartao.Open;
end;

end.
