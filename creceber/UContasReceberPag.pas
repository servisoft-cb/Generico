unit UContasReceberPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Mask,
  ToolEdit, RXDBCtrl, CurrEdit, Db, DbTables, RXLookup, DBFilter, Variants;

type
  TfContasReceberPag = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    DBText2: TDBText;
    Label2: TLabel;
    DBText3: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    DBText4: TDBText;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    DBText1: TDBText;
    CurrencyEdit1: TCurrencyEdit;
    Label12: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    SpeedButton8: TSpeedButton;
    tCReceberParcHistIns: TTable;
    tCReceberParcHistInsNumCReceber: TIntegerField;
    tCReceberParcHistInsParcCReceber: TIntegerField;
    tCReceberParcHistInsItem: TIntegerField;
    tCReceberParcHistInsCodHistorico: TIntegerField;
    tCReceberParcHistInsDtHistorico: TDateField;
    tCReceberParcHistInsHistorico: TStringField;
    DBCheckBox1: TDBCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    Label15: TLabel;
    DBText5: TDBText;
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
    Label16: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label17: TLabel;
    Bevel2: TBevel;
    DateEdit1: TDateEdit;
    tCReceberParcHistInsJurosPagos: TFloatField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    tHistorico: TTable;
    dsHistorico: TDataSource;
    tHistoricoCodigo: TIntegerField;
    tHistoricoNome: TStringField;
    tHistoricoTipo: TStringField;
    RxDBFilter1: TRxDBFilter;
    CurrencyEdit4: TCurrencyEdit;
    Label18: TLabel;
    DBEdit3: TDBEdit;
    CurrencyEdit5: TCurrencyEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    tCReceberParcHistInsFilial: TIntegerField;
    Label19: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label20: TLabel;
    DBText6: TDBText;
    Label21: TLabel;
    DBText7: TDBText;
    Label8: TLabel;
    CurrencyEdit6: TCurrencyEdit;
    Label13: TLabel;
    CurrencyEdit7: TCurrencyEdit;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure CurrencyEdit2Enter(Sender: TObject);
    procedure CurrencyEdit2Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateEdit1Exit(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure CurrencyEdit4Exit(Sender: TObject);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
  private
    { Private declarations }
    procedure Gravar_Pgto;
    procedure Grava_Historico;
    procedure Grava_ExtComissao;
    procedure Calcula_Juros;
    procedure Grava_Movimento(Valor : Real ; Tipo : String); //P=Pagamento  J=Juros  D=Despesa
  public
    { Public declarations }
  end;

var
  fContasReceberPag: TfContasReceberPag;
  vValorJuros : real;
  vDias : integer;
  Ano, Mes, Dia : Word;
  vHistorico : String;
  vNumMov, vNumMovJuros, vNumMovDespesa : Integer;

implementation

uses UDM1, UPlanoContas, UHistorico, UContasReceber2, URelReciboRec2;

{$R *.DFM}

procedure TfContasReceberPag.Calcula_Juros;
var
  vJurosDia, vAux : Real;
  vQtdDia : Real;
  vJuros : Real;
begin
  CurrencyEdit5.Value := DM1.tCReceberParcJurosParcCReceber.AsFloat - DM1.tCReceberParcJurosPagos.AsFloat;
  if CurrencyEdit5.Value < 0 then
    CurrencyEdit5.Value := 0;
  //CurrencyEdit1.Value := CurrencyEdit5.Value;
  CurrencyEdit1.Value := 0;
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
              ShowMessage('Juros não cadastrado para o mês de pagamento!');
              vJuros := 0;
            end
          else
            vJuros := DM1.tJurosJuro.AsFloat;
        end;
      if vJuros > 0 then
        begin
          vJurosDia := vJuros / 30;
          if DM1.tCReceberParcDtPagParcCReceber.AsDateTime > 0 then
            vQtdDia := Date - DM1.tCReceberParcDtPagParcCReceber.AsDateTime
          else
            vQtdDia := Date - DM1.tCReceberParcDtVencCReceber.AsDateTime;
          vAux := (vQtdDia * vJurosDia);
          vAux := ((DM1.tCReceberParcRestParcela.AsFloat + CurrencyEdit5.Value) * vAux) / 100;
          vValorJuros := vAux;
          CurrencyEdit5.Value := CurrencyEdit5.Value + vAux;
          CurrencyEdit1.Value := 0;
        end;
    end;
end;

procedure TfContasReceberPag.Grava_ExtComissao;
var
  vAux, vPercentual, vPercentual2 : Real;
begin
  tExtComissaoIns.Refresh;
  tExtComissaoIns.Last;
  DM1.tExtComissao.Insert;
  DM1.tExtComissaoNroLancamento.AsInteger := tExtComissaoInsNroLancamento.AsInteger + 1;
  DM1.tExtComissaoCodVendedor.AsInteger   := DM1.tCReceberParcCodVendedor.AsInteger;
  DM1.tExtComissaoDtReferencia.AsDateTime := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
  DM1.tExtComissaoParcDoc.AsInteger       := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tExtComissaoCodCliente.AsInteger    := DM1.tCReceberParcCodCli.AsInteger;
  DM1.tExtComissaoFuncao.AsString         := 'E';
  DM1.tExtComissaoNroDoc.AsInteger        := DM1.tCReceberParcNumNota.AsInteger;
  DM1.tExtComissaoVlrBase.AsCurrency      := CurrencyEdit4.Value;
  DM1.tExtComissaoPercDescDupl.AsFloat    := DM1.tCReceberParcDesconto.AsFloat;
  DM1.tExtComissaoPercComissao.AsFloat    := DM1.tCReceberParcPercComissao.AsFloat;
  if DM1.tCReceberParcPercComissao.AsFloat > 0 then
    begin
      DM1.tNotaFiscal.IndexFieldNames := 'Filial;NumSeq';
      DM1.tNotaFiscal.SetKey;
      DM1.tNotaFiscalFilial.AsInteger  := DM1.tCReceberFilial.AsInteger;
      DM1.tNotaFiscalNumSeq.AsInteger := DM1.tCReceberParcNumSeqNota.AsInteger;
      if DM1.tNotaFiscal.GotoKey then
        begin
          if DM1.tNotaFiscalVlrIpi.AsFloat > 0 then
            begin
              if DM1.tCReceberParc.RecordCount = 1 then
                begin
                  vPercentual  := StrToFloat(FormatFloat('0.0000',(CurrencyEdit4.Value / DM1.tCReceberParcVlrParcCReceber.AsFloat) * 100));
                  vAux         := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrIpi.AsFloat * vPercentual) / 100));
                  DM1.tExtComissaoVlrBase.AsCurrency := DM1.tExtComissaoVlrBase.AsCurrency - vAux;
                end
              else
                begin
                  vPercentual  := StrToFloat(FormatFloat('0.0000',(CurrencyEdit4.Value / DM1.tCReceberParcVlrParcCReceber.AsFloat) * 100));
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

procedure TfContasReceberPag.Grava_Historico;
begin
  DM1.tCReceberParcHist.Insert;
  tCReceberParcHistIns.Refresh;
  tCReceberParcHistIns.Last;
  Dm1.tCReceberParcHistFilial.AsInteger        := Dm1.tCReceberParcFilial.AsInteger;
  DM1.tCReceberParcHistNumCReceber.AsInteger   := DM1.tCReceberParcNumCReceber.AsInteger;
  DM1.tCReceberParcHistParcCReceber.AsInteger  := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tCReceberParcHistItem.AsInteger          := tCReceberParcHistInsItem.AsInteger + 1;
  DM1.tCReceberParcHistDtHistorico.AsDateTime  := Date;
  DM1.tCReceberParcHistCodHistorico.AsCurrency := 0;
  if Edit1.Text <> '' then
    DM1.tCReceberParcHistHistorico.AsString      := Edit1.Text
  else
    DM1.tCReceberParcHistHistorico.AsString      := vHistorico;
  DM1.tCReceberParcHistDtUltPgto.AsDateTime      := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
  DM1.tCReceberParcHistVlrUltPgto.AsCurrency     := CurrencyEdit4.Value;
  DM1.tCReceberParcHistVlrUltJuros.AsFloat       := DM1.tCReceberParcJurosParcCReceber.AsFloat;
  DM1.tCReceberParcHistVlrUltDescontos.AsFloat   := CurrencyEdit7.Value;
  DM1.tCReceberParcHistVlrUltDespesas.AsFloat    := CurrencyEdit6.Value;
  DM1.tCReceberParcHistVlrUltAbatimentos.AsFloat := DM1.tCReceberParcAbatimentos.AsFloat;
  DM1.tCReceberParcHistJurosPagos.AsFloat        := CurrencyEdit1.Value;
  DM1.tCReceberParcHistPgto.AsBoolean            := True;
  DM1.tCReceberParcHistNumMov.AsInteger          := vNumMov;
  DM1.tCReceberParcHistNumMovJuros.AsInteger     := vNumMovJuros;
  DM1.tCReceberParcHistJurosCalc.AsFloat         := vValorJuros;
  DM1.tCReceberParcHistTipo.AsString             := 'PAG';
  DM1.tCReceberParcHistCodConta.AsInteger        := RxDBLookupCombo2.KeyValue;
end;

procedure TfContasReceberPag.Gravar_Pgto;
begin
  vNumMov        := 0;
  vNumMovJuros   := 0;
  vNumMovDespesa := 0;
  DM1.tCReceberParcCodConta.AsInteger         := RxDBLookupCombo2.KeyValue;
  DM1.tCReceberParcRestParcela.AsCurrency     := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsCurrency -
                                                 CurrencyEdit4.Value));
  if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) <= 0 then
  begin
    DM1.tCReceberParcRestParcela.AsFloat        := StrToFloat(FormatFloat('0.00',0));
    DM1.tCReceberParcQuitParcCReceber.AsBoolean := True;
  end;
  DM1.tCReceberParcDtPagParcCReceber.AsDateTime := DateEdit1.Date;

  DM1.tMovimentos.MasterSource.Enabled          := False;

  vHistorico := 'Rec.Nota No. ' + DM1.tCReceberParcNumNota.AsString + '/' + DM1.tCReceberParcParcCReceber.AsString;
  if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsCurrency)) > 0 then
    vHistorico := vHistorico + ' (parcial) ';
  if DM1.tCReceberParcDesconto.AsFloat > 0 then
    vHistorico := vHistorico + ' c/desconto ';
  vHistorico := vHistorico + ' de ' + DM1.tCReceberlkNomeCli.AsString;

  //Cartão de Crédito
  if (DM1.tCReceberParcCodCartaoCredito.AsInteger > 0) and (StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) <= 0) then
  begin
    if fContasReceber2.fnc_Achou_tExtCartao then
    begin
      fContasReceber2.Pagto_CartaoCredito;
      vHistorico := vHistorico + '(Cartão ' + DM1.tExtCartaolkCartaoCredito.AsString + ', Aut. ' + DM1.tExtCartaoNumAutorizacao.AsString + ')';
    end;
  end;
  //**************

  Grava_Movimento((CurrencyEdit4.Value - CurrencyEdit7.Value),'P');

  if CurrencyEdit1.Value > 0 then
  begin
    vHistorico := 'Rec.Juros Nota No. '+ DM1.tCReceberParcNumNota.AsString +
                  '/' + DM1.tCReceberParcParcCReceber.AsString + ' de ' +
                  DM1.tCReceberParclkNomeCliente.AsString;
    Grava_Movimento(CurrencyEdit1.Value,'J');
  end;

  vHistorico := 'PAGAMENTO TOTAL';
  if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsCurrency)) > 0 then
    vHistorico := 'PAGAMENTO PARCIAL';
  DM1.tCReceberParcJurosParcCReceber.AsFloat    := DM1.tCReceberParcJurosParcCReceber.AsFloat + vValorJuros;
  DM1.tCReceberParcJurosPagos.AsFloat         := DM1.tCReceberParcJurosPagos.AsFloat + CurrencyEdit1.Value;
  DM1.tCReceberParcDesconto.AsFloat           := DM1.tCReceberParcDesconto.AsFloat
                                               + CurrencyEdit7.Value;
  if DM1.tCReceberParcParcCReceber.AsInteger > 0 then
    if DM1.tCReceberParcDtPagParcCReceber.AsDateTime > DM1.tCReceberParcDtVencCReceber.AsDateTime then
      begin
        vDias := DM1.tCReceberParcDtPagParcCReceber.AsVariant - DM1.tCReceberParcDtVencCReceber.AsVariant;
        DecodeDate(vDias, Ano, Mes, Dia);
      end;
  if DM1.tCReceberParcDtVencCReceber.AsString = '' then
    DM1.tCReceberParcDtVencCReceber.AsDateTime := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
  DM1.tCReceberParcDtPagParcCReceber.AsDateTime := DateEdit1.Date;
  DM1.tCReceberParcDiasAtraso.AsFloat :=  DM1.tCReceberParcDtPagParcCReceber.AsDateTime - DM1.tCReceberParcDtVencCReceber.AsDateTime;
  if DM1.tCReceberParcDiasAtraso.AsFloat < 0 then
    DM1.tCReceberParcDiasAtraso.AsFloat := 0;
  Grava_Historico;
  if (DM1.tCReceberParclkTipoComissao.AsString = 'D') and (DM1.tCReceberParcCodVendedor.AsInteger > 0) and
     ((DM1.tCReceberParcPercComissao.AsFloat > 0) or (DM1.tCReceberParcVlrComissao.AsFloat > 0))  then
    Grava_ExtComissao;
  DM1.tCReceberParcHist.Post;
  DM1.tCReceberParcPgtoParcial.AsCurrency := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcPgtoParcial.AsCurrency + CurrencyEdit4.Value));
  DM1.tCReceberParc.Post;
  DM1.tMovimentos.MasterSource.Enabled := True;
  //Close;
end;

procedure TfContasReceberPag.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfContasReceberPag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DM1.tCReceberParc.State in [dsInsert,dsEdit] then
    DM1.tCReceberParc.Cancel;
  DM1.tHistorico.Close;
  Action := Cafree;
end;

procedure TfContasReceberPag.FormShow(Sender: TObject);
begin
  if DM1.tCReceberParcCodConta.AsInteger > 0 then
    RxDBLookupCombo2.KeyValue := DM1.tCReceberParcCodConta.AsInteger;
  vValorJuros := 0;
  CurrencyEdit3.Value                           := DM1.tCReceberParcJurosPagos.AsFloat;
  DM1.tCReceberParc.Edit;
  DM1.tCReceberParcDesconto.AsFloat             := 0;
  CurrencyEdit4.Value := DM1.tCReceberParcRestParcela.AsCurrency;
  CurrencyEdit5.Value := DM1.tCReceberParcJurosParcCReceber.AsFloat - DM1.tCReceberParcJurosPagos.AsFloat;
  if CurrencyEdit5.Value < 0 then
    CurrencyEdit5.Value := 0;
  Calcula_Juros;
  DateEdit1.Date := Date;
  CurrencyEdit2.Value := 0;
  Edit1.Text := '';
//  DM1.tExtCartao.Open;
  DM1.tHistorico.Open;
  if not DM1.tContas.Active then
    DM1.tContas.Open;
end;

procedure TfContasReceberPag.BitBtn1Click(Sender: TObject);
begin
  if RxDBLookupCombo2.Text = '' then
    ShowMessage('Falta informar a conta!')
  else
  if CurrencyEdit4.Value > StrToFloat(FormatFloat('0.00',(DM1.tCReceberParcRestParcela.AsFloat))) then
    ShowMessage('Valor do pagamento não pode ser maior que restante a pagar!')
  else
  if CurrencyEdit4.value <= 0 then
    ShowMessage('Valor de pagamento não pode ser zero!')
  else
  if DateEdit1.Date < 10 then
    ShowMessage('É obrigatório informar a data de pagamento')
  else
  begin
    try
      DM1.tContas.IndexFieldNames := 'CodConta';
      DM1.tContas.FindKey([RxDBLookupCombo2.KeyValue]);
      if DateEdit1.Date <= DM1.tContasDtEncerramento.AsDateTime then
        ShowMessage('Data de encerramento ' + DM1.tContasDtEncerramento.AsString + ', é maior que a data informada!')
      else
        Gravar_Pgto;
      //DM1.tCReceberParc.Locate('NumCReceber;ParcCReceber',VarArrayOf([DM1.tCReceberParcNumCReceber.AsInteger,DM1.tCReceberParcParcCReceber.AsInteger]),[loCaseInsensitive]);
      //DM1.tCReceberParcHist.Last;

      if DM1.tParametrosImpReciboRec.AsBoolean then
      begin
        if MessageDlg('Imprimir o recibo?',mtconfirmation,[mbok,mbno],0)=mrok then
        begin
          fRelReciboRec2 := TfRelReciboRec2.Create(Self);
          fRelReciboRec2.RLReport1.Preview;
          fRelReciboRec2.RLReport1.Free;
        end;
      end;

    except
      on E: Exception do
        ShowMessage('Erro no pagamento, ' + E.Message);
    end;
    Close;
  end;
end;

procedure TfContasReceberPag.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioPlanoCtas.AsBoolean then
  begin
    fPlanoContas := TfPlanoContas.Create(Self);
    fPlanoContas.ShowModal;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasReceberPag.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfContasReceberPag.CurrencyEdit2Enter(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Codigo';
end;

procedure TfContasReceberPag.CurrencyEdit2Exit(Sender: TObject);
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
          CurrencyEdit2.Clear;
        end;
    end
  else
    Edit1.Text := '';
end;

procedure TfContasReceberPag.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioHistoricos.AsBoolean then
    begin
      fHistorico := TfHistorico.Create(Self);
      fHistorico.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasReceberPag.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F10 then
    BitBtn1Click(Sender);
end;

procedure TfContasReceberPag.DateEdit1Exit(Sender: TObject);
var
  vJurosDia, vAux : Real;
  vQtdDia : Real;
  vJuros : Real;
begin
  CurrencyEdit5.Value := DM1.tCReceberParcJurosParcCReceber.AsFloat - DM1.tCReceberParcJurosPagos.AsFloat;
  if CurrencyEdit5.Value < 0 then
    CurrencyEdit5.Value := 0;
  //CurrencyEdit1.Value := CurrencyEdit5.Value;
  CurrencyEdit1.Value := 0;
  if (DateEdit1.Date > DM1.tCReceberParcDtVencCReceber.AsDateTime) and
     (DateEdit1.Date > DM1.tCReceberParcDtPagParcCReceber.AsDateTime) then
    begin
      if DM1.tParametrosControlarJurosParam.AsBoolean then
        vJuros := DM1.tParametrosPercJuros.AsFloat
      else
        begin
          DecodeDate(DateEdit1.Date, Ano, Mes, Dia);
          DM1.tJuros.SetKey;
          DM1.tJurosAno.AsInteger := Ano;
          DM1.tJurosMes.AsInteger := Mes;
          if not DM1.tJuros.GotoKey then
            begin
              ShowMessage('Juros não cadastrado para o mês de pagamento');
              vJuros := 0;
            end
          else
            vJuros := DM1.tJurosJuro.AsFloat;
        end;
      if vJuros > 0 then
        begin
          vJurosDia := vJuros / 30;
          if DM1.tCReceberParcDtPagParcCReceber.AsDateTime > 0 then
            vQtdDia := DateEdit1.Date - DM1.tCReceberParcDtPagParcCReceber.AsDateTime
          else
            vQtdDia := DateEdit1.Date - DM1.tCReceberParcDtVencCReceber.AsDateTime;
          vAux := (vQtdDia * vJurosDia);
          vAux := ((DM1.tCReceberParcRestParcela.AsFloat + CurrencyEdit5.Value) * vAux) / 100;
          vValorJuros:= vAux;
          CurrencyEdit5.Value := CurrencyEdit5.Value + vAux;
          //CurrencyEdit1.Value := CurrencyEdit5.Value;
          CurrencyEdit1.Value := 0;
        end;
    end
  else
    vValorJuros := 0;
end;

procedure TfContasReceberPag.RxDBLookupCombo1Change(Sender: TObject);
begin
  //Edit1.Text         := RxDBLookupCombo1.Text;
  //CurrencyEdit2.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasReceberPag.RxDBLookupCombo1Enter(Sender: TObject);
begin
  tHistorico.IndexFieldNames := 'Nome';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit2.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasReceberPag.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    begin
      Edit1.Text := RxDBLookupCombo1.Text;
      CurrencyEdit2.Text := tHistoricoCodigo.AsString;
    end;
end;

procedure TfContasReceberPag.CurrencyEdit4Exit(Sender: TObject);
begin
  if CurrencyEdit4.Value > StrToFloat(FormatFloat('0.00',(DM1.tCReceberParcRestParcela.AsFloat))) then
    begin
      CurrencyEdit1.Value := CurrencyEdit4.Value -
                             DM1.tCReceberParcRestParcela.AsCurrency;
      CurrencyEdit4.Value := DM1.tCReceberParcRestParcela.AsCurrency;
    end;
end;

procedure TfContasReceberPag.RxDBLookupCombo4Enter(Sender: TObject);
begin
  if RxDBLookupCombo3.Text <> '' then
    RxDBLookupCombo4.ReadOnly := False
  else
    RxDBLookupCombo4.ReadOnly := True;
end;

procedure TfContasReceberPag.Grava_Movimento(Valor : Real ; Tipo : String); //P=Pagamento  J=Juros  D=Despesa
begin
  DM1.tMovimentos.Insert;
  DM1.tMovimentosCodConta.AsInteger             := RxDBLookupCombo2.KeyValue;
  DM1.tMovimentosNumCReceber.AsInteger          := DM1.tCReceberNumCReceber.AsInteger;
  DM1.tMovimentosFilial.AsInteger               := DM1.tCReceberFilial.AsInteger;
  DM1.tMovimentosParcela.AsInteger              := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tMovimentosDtMovimento.AsDateTime         := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
  DM1.tMovimentosNumNota.AsInteger              := DM1.tCReceberParcNumNota.AsInteger;
  DM1.tMovimentosCodCli.AsInteger               := DM1.tCReceberParcCodCli.AsInteger;
  DM1.tMovimentosPlanoContas.AsInteger          := DM1.tCReceberParcPlanoContas.AsInteger;
  DM1.tMovimentosCodPlanoContasItens.AsInteger  := DM1.tCReceberParcCodPlanoContasItens.AsInteger;
  DM1.tMovimentosVlrMovCredito.AsCurrency       := Valor;
  DM1.tMovimentosHistorico.AsString := vHistorico;
  DM1.tMovimentos.Post;
  if Tipo = 'P' then
    vNumMov := DM1.tMovimentosNumMovimento.AsInteger
  else
  if Tipo = 'J' then
    vNumMovJuros := DM1.tMovimentosNumMovimento.AsInteger
  else
  if Tipo = 'D' then
    vNumMovDespesa := DM1.tMovimentosNumMovimento.AsInteger;
end;

end.
