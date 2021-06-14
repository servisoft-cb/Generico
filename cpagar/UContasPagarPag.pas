unit UContasPagarPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Mask, ToolEdit, RXDBCtrl,
  RXLookup, Db, DBTables, CurrEdit, DBFilter, Variants;

type
  TfContasPagarPag = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    DBText2: TDBText;
    Label2: TLabel;
    DBText3: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    DBText1: TDBText;
    Label12: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    SpeedButton8: TSpeedButton;
    tCPagarParcHistIns: TTable;
    tCPagarParcHistInsNumCPagar: TIntegerField;
    tCPagarParcHistInsParcCPagar: TIntegerField;
    tCPagarParcHistInsItem: TIntegerField;
    tCPagarParcHistInsCodHistorico: TIntegerField;
    tCPagarParcHistInsDtHistorico: TDateField;
    tCPagarParcHistInsHistorico: TStringField;
    tCPagarParcHistInsDtUltPgto: TDateField;
    tCPagarParcHistInsVlrUltPgto: TFloatField;
    tCPagarParcHistInsVlrUltJuros: TFloatField;
    tCPagarParcHistInsVlrUltDescontos: TFloatField;
    tCPagarParcHistInsVlrUltDespesas: TFloatField;
    tCPagarParcHistInsPgto: TBooleanField;
    tCPagarParcHistInsJurosPagos: TFloatField;
    Bevel1: TBevel;
    CurrencyEdit1: TCurrencyEdit;
    SpeedButton1: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    DateEdit1: TDateEdit;
    CurrencyEdit2: TCurrencyEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Edit1: TEdit;
    tHistorico: TTable;
    dsHistorico: TDataSource;
    tHistoricoCodigo: TIntegerField;
    tHistoricoNome: TStringField;
    tHistoricoTipo: TStringField;
    RxDBFilter1: TRxDBFilter;
    DBText5: TDBText;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Bevel2: TBevel;
    Label13: TLabel;
    Label14: TLabel;
    CurrencyEdit6: TCurrencyEdit;
    DateEdit2: TDateEdit;
    tCPagarParcHistInsFilial: TIntegerField;
    Label15: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CurrencyEdit2Exit(Sender: TObject);
    procedure CurrencyEdit4Exit(Sender: TObject);
    procedure CurrencyEdit5Exit(Sender: TObject);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
  private
    { Private declarations }
//    procedure Pgto_Total;
    procedure Pgto;
    procedure Grava_Historico;
  public
    { Public declarations }
  end;

var
  fContasPagarPag: TfContasPagarPag;
  ValorJuros : real;
  vHistorico : String;
  vNumMov, vNumMovJuros : Integer;

implementation

uses UDM1, UPlanoContas, UHistorico;

{$R *.DFM}

procedure TfContasPagarPag.Grava_Historico;
var
  vItemAux : Integer;
begin
  tCPagarParcHistIns.Refresh;
  tCPagarParcHistIns.Last;
  vItemAux := tCPagarParcHistInsItem.AsInteger + 1;
  if DM1.tCPagarParcHist.Locate('ParcCPagar;Item',VarArrayOf([Dm1.tCPagarParcParcCPagar.AsInteger,vItemAux]),[locaseinsensitive]) then
    DM1.tCPagarParcHist.Edit
  else
  begin
    DM1.tCPagarParcHist.Insert;
    DM1.tCPagarParcHistFilial.AsInteger        := Dm1.tCPagarParcFilial.AsInteger;
    DM1.tCPagarParcHistNumCPagar.AsInteger     := DM1.tCPagarParcNumCPagar.AsInteger;
    DM1.tCPagarParcHistParcCPagar.AsInteger    := DM1.tCPagarParcParcCPagar.AsInteger;
    DM1.tCPagarParcHistItem.AsInteger          := tCPagarParcHistInsItem.AsInteger + 1;
  end;

  DM1.tCPagarParcHistDtHistorico.AsDateTime  := Date;
  DM1.tCPagarParcHistCodHistorico.AsCurrency := 0;
  if Edit1.Text <> '' then
    DM1.tCPagarParcHistHistorico.AsString      := Edit1.Text
  else
    DM1.tCPagarParcHistHistorico.AsString      := vHistorico;
  DM1.tCPagarParcHistDtUltPgto.AsDateTime      := DM1.tCPagarParcDtPagParcCPagar.AsDateTime;
  DM1.tCPagarParcHistVlrUltPgto.AsCurrency     := CurrencyEdit2.Value;
  DM1.tCPagarParcHistVlrUltJuros.AsFloat       := CurrencyEdit3.Value;
  DM1.tCPagarParcHistVlrUltDescontos.AsFloat   := CurrencyEdit5.Value;
  DM1.tCPagarParcHistVlrUltDespesas.AsFloat    := DM1.tCPagarParcDespesas.AsFloat;
  DM1.tCPagarParcHistVlrUltAbatimentos.AsFloat := CurrencyEdit4.Value;
  DM1.tCPagarParcHistJurosPagos.AsFloat        := 0;
  DM1.tCPagarParcHistPgto.AsBoolean            := True;
  DM1.tCPagarParcHistNumMov.AsInteger          := vNumMov;
  DM1.tCPagarParcHistNumMovJuros.AsInteger     := vNumMovJuros;
  Dm1.tCPagarParcHistNumCheque.AsInteger       := CurrencyEdit6.AsInteger;
  Dm1.tCPagarParcHistDtPrevCheque.AsDateTime   := DateEdit2.Date;
  DM1.tCPagarParcHistTipo.AsString             := 'PAG';
  DM1.tCPagarParcHistCodConta.AsInteger        := RxDBLookupCombo2.KeyValue;
  DM1.tCPagarParcHist.Post;
end;

procedure TfContasPagarPag.Pgto;
var
  NumCPagar, vNumCPagar, vParcCPagar : Integer;
  NumParcCPagar       : String[10];
  DataPagParcCPagar   : TDateTime;
  ValorParcCPagar     : Real;
  Texto1 : String;
  vGrava : Boolean;
  vNumMovCheque : Integer;
begin
  DM1.tContas.IndexFieldNames                := 'CodConta';
  if not DM1.tContas.FindKey([RxDBLookupCombo2.KeyValue]) then
  begin
    ShowMessage('Conta não encontrada!');
    exit;
  end;

  if DateEdit1.Date <= DM1.tContasDtEncerramento.AsDateTime then
  begin
    ShowMessage('Data de encerramento ' + DM1.tContasDtEncerramento.AsString + ', é maior que a informada!');
    exit;
  end;

  vGrava := False;
  vNumMov      := 0;
  vNumMovJuros := 0;
  if RxDBLookupCombo2.Text <> '' then
    begin
      NumCPagar         := 0;
      NumParcCPagar     := '';
      DataPagParcCPagar := 0;
      ValorParcCPagar   := 0;
      vNumCPagar        := DM1.tCPagarParcNumCPagar.AsInteger;
      vParcCPagar       := DM1.tCPagarParcParcCPagar.AsInteger;
      if CurrencyEdit6.Value > 0 then
        if Dm1.tContasTipoConta.AsString = 'B' then
          begin
            if DM1.tCheque.Locate('CodConta;NumCheque',VarArrayOf([RxDBLookupCombo2.KeyValue,CurrencyEdit6.AsInteger]),[locaseinsensitive]) then
              ShowMessage('Já existe este cheque!')
            else
              begin
                vGrava := True;
                DM1.tCheque.Refresh;
                DM1.tCheque.Last;
                vNumMovCheque := DM1.tChequeNumMov.AsInteger;

                Dm1.tCheque.Insert;
                DM1.tChequeNumMov.AsInteger      := vNumMovCheque + 1;
                DM1.tChequeFilial.AsInteger      := DM1.tCPagarParcFilial.AsInteger;
                Dm1.tChequeCodConta.AsInteger    := RxDBLookupCombo2.KeyValue;
                Dm1.tChequeNumCheque.AsInteger   := CurrencyEdit6.AsInteger;
                Dm1.tChequeVlrTotal.AsFloat      := CurrencyEdit2.Value + CurrencyEdit3.Value;
                Dm1.tChequeAutomatico.AsBoolean  := True;
                Dm1.tChequeDtEmissao.AsDateTime  := DateEdit1.Date;
                Dm1.tChequeDtPrevista.AsDateTime := DateEdit2.Date;
                Dm1.tChequeNominal.AsString      := Dm1.tCPagarParclkFornecedor.AsString;
                Dm1.tCheque.Post;

                DM1.tChequeCPagar.Insert;
                DM1.tChequeCPagarNumMov.AsInteger        := DM1.tChequeNumMov.AsInteger;
                DM1.tChequeCPagarCodConta.AsInteger      := DM1.tChequeCodConta.AsInteger;
                DM1.tChequeCPagarNumCheque.AsInteger     := DM1.tChequeNumCheque.AsInteger;
                DM1.tChequeCPagarFilial.AsInteger        := DM1.tCPagarParcFilial.AsInteger;
                DM1.tChequeCPagarNumCPagar.AsInteger     := DM1.tCPagarParcNumCPagar.AsInteger;
                DM1.tChequeCPagarParcela.AsInteger       := DM1.tCPagarParcParcCPagar.AsInteger;
                DM1.tChequeCPagarNumNota.AsInteger       := DM1.tCPagarParcNroDuplicata.AsInteger;
                DM1.tChequeCPagarCodFornecedor.AsInteger := DM1.tCPagarParcCodForn.AsInteger;
                DM1.tChequeCPagarValor.AsFloat           := CurrencyEdit2.Value;
                DM1.tChequeCPagarVlrJuros.AsFloat        := CurrencyEdit3.Value;
                DM1.tChequeCPagarVlrDesconto.AsFloat     := CurrencyEdit4.Value + CurrencyEdit5.Value;
                DM1.tChequeCPagar.Post;

                DM1.tChequeCPagar.Refresh;
                DM1.tCheque.Refresh;
              end;
          end
        else
          ShowMessage('Tipo de conta deve ser banco para efetuar o pagamento em cheque!')
      else
        begin
          vGrava := True;
          DM1.tMovimentos.MasterSource.Enabled    := False;
          DM1.tMovimentos.Insert;
          DM1.tMovimentosCodConta.AsInteger       := RxDBLookupCombo2.KeyValue;
          DM1.tMovimentosNumCPagar.AsInteger      := DM1.tCPagarNumCPagar.AsInteger;
          DM1.tMovimentosDtMovimento.AsDateTime   := DateEdit1.Date;
          DM1.tMovimentosNumNotaEnt.AsInteger     := DM1.tCPagarParcNumNotaEnt.AsInteger;
          Texto1 := '';
          if DM1.tCPagarParcNumNotaEnt.AsInteger > 0 then
            Texto1 := ' nf.nº ' + DM1.tCPagarNumNotaEnt.AsString
          else
          if DM1.tCPagarParcNroDuplicata.AsInteger > 0 then
            Texto1 := ' Dupl.nº ' + DM1.tCPagarNroDuplicata.AsString;
          DM1.tMovimentosCodForn.AsInteger             := DM1.tCPagarParcCodForn.AsInteger;
          DM1.tMovimentosPlanoContas.AsInteger         := DM1.tCPagarParcPlanoContas.AsInteger;
          DM1.tMovimentosCodPlanoContasItens.AsInteger := DM1.tCPagarParcCodPlanoContasItens.AsInteger;
          DM1.tMovimentosVlrMovDebito.AsCurrency := CurrencyEdit2.Value;
          if CurrencyEdit2.Value = DM1.tCPagarParcVlrParcCPagar.AsCurrency then
            DM1.tMovimentosHistorico.AsString := 'Pg.Parc.nº '+ DM1.tCPagarParcParcCPagar.AsString +
                                                  Texto1 + ' de ' + DM1.tCPagarlkNomeForn.AsString
          else
            DM1.tMovimentosHistorico.AsString := 'Pg.Parc.Parcial nº '+ DM1.tCPagarParcParcCPagar.AsString +
                                                  Texto1 + ' de ' + DM1.tCPagarlkNomeForn.AsString;
          if CurrencyEdit3.Value > 0 then
            begin
              NumCPagar         := DM1.tCPagarNumCPagar.AsInteger;
              DataPagParcCPagar := DM1.tCPagarParcDtPagParcCPagar.AsDateTime;
              ValorParcCPagar   := CurrencyEdit3.Value;
              NumParcCPagar     := DM1.tCPagarParcParcCPagar.AsString;
            end;
          DM1.tMovimentosCodCentroCusto.AsInteger     := DM1.tCPagarParcCodCentroCusto.AsInteger;
          DM1.tMovimentosCodCentroCustoItem.AsInteger := DM1.tCPagarParcCodCentroCustoItem.AsInteger;
          DM1.tMovimentos.Post;
          vNumMov := DM1.tMovimentosNumMovimento.AsInteger;
          if CurrencyEdit3.Value > 0 then
            begin
              DM1.tMovimentos.Insert;
              DM1.tMovimentosCodConta.AsInteger     := RxDBLookupCombo2.KeyValue;
              DM1.tMovimentosNumCPagar.AsInteger    := NumCPagar;
              DM1.tMovimentosDtMovimento.AsDateTime := DateEdit1.Date;
              DM1.tMovimentosVlrMovDebito.AsFloat   := ValorParcCPagar;
              DM1.tMovimentosNumNotaEnt.AsInteger   := DM1.tCPagarParcNumNotaEnt.AsInteger;
              DM1.tMovimentosCodForn.AsInteger      := DM1.tCPagarParcCodForn.AsInteger;
              DM1.tMovimentosPlanoContas.AsInteger         := DM1.tCPagarParcPlanoContas.AsInteger;
              DM1.tMovimentosCodPlanoContasItens.AsInteger := DM1.tCPagarParcCodPlanoContasItens.AsInteger;
              if CurrencyEdit2.Value = DM1.tCPagarParcVlrParcCPagar.AsCurrency then
                DM1.tMovimentosHistorico.AsString := 'Pg.Juros s/Parc.nº '+ NumParcCPagar +
                                                     Texto1 + ' de ' + DM1.tCPagarlkNomeForn.AsString
              else
                 DM1.tMovimentosHistorico.AsString   := 'Pg.Juros s/Parc.nº '+ NumParcCPagar +
                                                         Texto1 + ' de ' + DM1.tCPagarlkNomeForn.AsString;
              DM1.tMovimentosCodCentroCusto.AsInteger     := DM1.tCPagarParcCodCentroCusto.AsInteger;
              DM1.tMovimentosCodCentroCustoItem.AsInteger := DM1.tCPagarParcCodCentroCustoItem.AsInteger;
              DM1.tMovimentos.Post;
              vNumMovJuros := DM1.tMovimentosNumMovimento.AsInteger;
            end;
        end;
      if vGrava then
        begin
          DM1.tCPagarParcRestParcela.AsCurrency := StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsCurrency - CurrencyEdit4.Value - CurrencyEdit5.Value));
          if CurrencyEdit2.Value >= StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsCurrency)) then
            vHistorico          := 'PAGAMENTO TOTAL'
          else
            vHistorico          := 'PAGAMENTO PARCIAL';
          DM1.tCPagarParcDtPagParcCPagar.AsDateTime  := DateEdit1.Date;
          DM1.tCPagarParcCodConta.AsInteger         := RxDBLookupCombo2.KeyValue;
          DM1.tCPagarParcDesconto.AsFloat           := DM1.tCPagarParcDesconto.AsFloat + CurrencyEdit5.Value;
          DM1.tCPagarParcAbatimentos.AsFloat        := DM1.tCPagarParcAbatimentos.AsFloat + CurrencyEdit4.Value;
          DM1.tCPagarParcRestParcela.AsCurrency     := StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsCurrency -
                                                       CurrencyEdit2.Value));
          if StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsFloat)) < 0 then
            DM1.tCPagarParcRestParcela.AsFloat := StrToFloat(FormatFloat('0.00',0));
          if StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsFloat)) = 0 then
            DM1.tCPagarParcQuitParcCPagar.AsBoolean := True;
          DM1.tCPagarParcJurosParcCPagar.AsFloat    := ValorJuros +  CurrencyEdit3.Value;
          DM1.tCPagarParcDtPagParcCPagar.AsDateTime  := DateEdit1.Date;
          DM1.tCPagarParcDiasAtraso.AsFloat          := DM1.tCPagarParcDtPagParcCPagar.AsFloat - DM1.tCPagarParcDtVencCPagar.AsFloat;
          if DM1.tCPagarParcclDiasAtraso.AsFloat < 0 then
            DM1.tCPagarParcclDiasAtraso.AsFloat := 0;
          DM1.tCPagarParcPgtoParcial.AsCurrency := DM1.tCPagarParcPgtoParcial.AsCurrency + CurrencyEdit2.Value;
          DM1.tCPagarParc.Post;
          Grava_Historico;
          DM1.tMovimentos.MasterSource.Enabled    := True;
          DM1.tCPagarParc.SetKey;
          Dm1.tCPagarParcFilial.AsInteger     := Dm1.tCPagarFilial.AsInteger;
          DM1.tCPagarParcNumCPagar.AsInteger  := vNumCPagar;
          DM1.tCPagarParcParcCPagar.AsInteger := vParcCPagar;
          DM1.tCPagarParc.GotoKey;
          Close;
        end;
    end
  else
    ShowMessage('Você deve escolher uma conta!');
end;

procedure TfContasPagarPag.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfContasPagarPag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DM1.tCPagar.MasterFields <> '' then
    DM1.tCPagar.MasterSource.Enabled := True;
  Action := Cafree;
end;

procedure TfContasPagarPag.FormShow(Sender: TObject);
begin
  if not DM1.tContas.Active then
    DM1.tContas.Open;
  tCPagarParcHistIns.Open;
  tHistorico.Open;
  if DM1.tCPagar.MasterFields <> '' then
    DM1.tCPagar.MasterSource.Enabled          := False;
  DM1.tCPagarParc.Edit;
  if DM1.tCPagarParcCodConta.AsInteger > 0 then
    RxDBLookupCombo2.KeyValue := DM1.tCPagarParcCodConta.AsInteger;
  ValorJuros  := DM1.tCPagarParcJurosParcCPagar.AsFloat;
  CurrencyEdit2.Value := StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsCurrency));
  CurrencyEdit3.Clear;
  CurrencyEdit4.Clear;
  CurrencyEdit5.Clear;
  DateEdit1.Date := Date();
end;

procedure TfContasPagarPag.BitBtn1Click(Sender: TObject);
begin
  if CurrencyEdit2.Value > StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsFloat)) then
    ShowMessage('Valor do pagamento não pode ser maior que restante a pagar!')
  else
  if CurrencyEdit2.Value <= 0 then
    ShowMessage('Valor de pagamento não pode ser zero!')
  else
  if DateEdit1.Date < 10 then
    ShowMessage('É obrigatório informar a data de pagamento')
  else
  if (CurrencyEdit6.Value > 0) and (DateEdit2.Date < 0) then
    ShowMessage('Deve haver data de previsão!')
  else
  if RxDBLookupCombo2.Text = '' then
    ShowMessage('Conta deve ser informada!')
  else
    Pgto;
end;

procedure TfContasPagarPag.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioPlanoCtas.AsBoolean then
    begin
      fPlanoContas := TfPlanoContas.Create(Self);
      fPlanoContas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasPagarPag.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfContasPagarPag.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioHistoricos.AsBoolean then
    begin
      fHistorico := TfHistorico.Create(Self);
      fHistorico.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasPagarPag.CurrencyEdit1Enter(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Codigo';
end;

procedure TfContasPagarPag.CurrencyEdit1Exit(Sender: TObject);
begin
  if CurrencyEdit1.Text <> '' then
    begin
      DM1.tHistorico.SetKey;
      DM1.tHistoricoCodigo.AsInteger := StrToInt(CurrencyEdit1.Text);
      if DM1.tHistorico.GotoKey then
        Edit1.Text := DM1.tHistoricoNome.AsString;
    end;
end;

procedure TfContasPagarPag.RxDBLookupCombo1Enter(Sender: TObject);
begin
  tHistorico.IndexFieldNames := 'Nome';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasPagarPag.RxDBLookupCombo1Exit(Sender: TObject);
begin
  tHistorico.IndexFieldNames := 'Codigo';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasPagarPag.RxDBLookupCombo1Change(Sender: TObject);
begin
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasPagarPag.Edit1Change(Sender: TObject);
begin
  try
    tHistorico.IndexFieldNames := 'Nome';
    tHistorico.FindNearest([Edit1.Text]);
    CurrencyEdit1.Text := tHistoricoCodigo.AsString;
  except
//    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfContasPagarPag.CurrencyEdit2Exit(Sender: TObject);
var
 vAux : Real;
begin
  vAux := StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsCurrency - CurrencyEdit4.Value - CurrencyEdit5.Value));
  //if CurrencyEdit2.Value > DM1.tCPagarParcRestParcela.AsCurrency then
  if CurrencyEdit2.Value > vAux then
    begin
      //CurrencyEdit3.Value := CurrencyEdit2.Value - DM1.tCPagarParcRestParcela.AsCurrency;
      CurrencyEdit3.Value := CurrencyEdit2.Value - vAux;
      CurrencyEdit2.Value := vAux;
    end;
end;

procedure TfContasPagarPag.CurrencyEdit4Exit(Sender: TObject);
begin
  CurrencyEdit2.Value := StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsFloat - CurrencyEdit4.Value - CurrencyEdit5.Value));
end;

procedure TfContasPagarPag.CurrencyEdit5Exit(Sender: TObject);
begin
  CurrencyEdit2.Value := StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsFloat - CurrencyEdit5.Value - CurrencyEdit4.Value));
end;

procedure TfContasPagarPag.RxDBLookupCombo4Enter(Sender: TObject);
begin
  if RxDBLookupCombo3.Text <> '' then
    RxDBLookupCombo4.ReadOnly := False
  else
    RxDBLookupCombo4.ReadOnly := True;
end;

end.
