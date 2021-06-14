unit UChequeCPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ToolEdit, Buttons, RxLookup, Mask, CurrEdit, Db,
  DBTables, DBFilter, Variants;

type
  TfChequeCPagar = class(TForm)
    Panel1: TPanel;
    SpeedButton7: TSpeedButton;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    StaticText11: TStaticText;
    CurrencyEdit10: TCurrencyEdit;
    StaticText12: TStaticText;
    CurrencyEdit11: TCurrencyEdit;
    StaticText15: TStaticText;
    CurrencyEdit12: TCurrencyEdit;
    Shape1: TShape;
    tCPagarParc2: TTable;
    Panel2: TPanel;
    StaticText8: TStaticText;
    RxDBLookupCombo10: TRxDBLookupCombo;
    BitBtn2: TBitBtn;
    CurrencyEdit7: TCurrencyEdit;
    StaticText6: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    CurrencyEdit9: TCurrencyEdit;
    StaticText1: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    StaticText2: TStaticText;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Edit1: TEdit;
    tCPagarParc2Filial: TIntegerField;
    tCPagarParc2NumCPagar: TIntegerField;
    tCPagarParc2ParcCPagar: TIntegerField;
    tCPagarParc2DtVencCPagar: TDateField;
    tCPagarParc2VlrParcCPagar: TFloatField;
    tCPagarParc2QuitParcCPagar: TBooleanField;
    tCPagarParc2DtPagParcCPagar: TDateField;
    tCPagarParc2JurosParcCPagar: TFloatField;
    tCPagarParc2CodForn: TIntegerField;
    tCPagarParc2NumNotaEnt: TIntegerField;
    tCPagarParc2Desconto: TFloatField;
    tCPagarParc2PgtoParcial: TFloatField;
    tCPagarParc2RestParcela: TFloatField;
    tCPagarParc2Banco: TStringField;
    tCPagarParc2PlanoContas: TIntegerField;
    tCPagarParc2NroDuplicata: TIntegerField;
    tCPagarParc2Despesas: TFloatField;
    tCPagarParc2Abatimentos: TFloatField;
    tCPagarParc2CodConta: TIntegerField;
    tCPagarParc2DiasAtraso: TFloatField;
    tCPagarParc2JurosPagos: TFloatField;
    tCPagarParc2CodTipoCobranca: TIntegerField;
    tCPagarParc2NroFatura: TIntegerField;
    tCPagarParc2DtRecto: TDateField;
    tCPagarParc2VlrDevolucao: TFloatField;
    tCPagarParc2VlrDevolucaoFrete: TFloatField;
    tCPagarParc2CodCliente: TIntegerField;
    tCPagarParc2DtGerado: TDateField;
    tCPagarParc2CodPlanoContasItens: TIntegerField;
    tCPagarParc2CodAtelier: TIntegerField;
    procedure RxDBLookupCombo10Enter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure CurrencyEdit10Exit(Sender: TObject);
    procedure Panel2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CurrencyEdit12Exit(Sender: TObject);
  private
    { Private declarations }
    vNumMov : Integer;
    vNumMovJuros : Integer;
    vHistorico : String;
    procedure Grava_CPagar;
    procedure Grava_Historico;

  public
    { Public declarations }
  end;

var
  fChequeCPagar: TfChequeCPagar;

implementation

uses UDM1, UCheques, UBuscaDuplicata;

{$R *.DFM}

procedure TfChequeCPagar.Grava_Historico;
var
  vAux : Integer;
begin
  DM1.tCPagarParcHist.Refresh;
  DM1.tCPagarParcHist.Last;
  vAux := DM1.tCPagarParcHistItem.AsInteger + 1;
  DM1.tCPagarParcHist.Insert;
  Dm1.tCPagarParcHistFilial.AsInteger          := Dm1.tCPagarParcFilial.AsInteger;
  DM1.tCPagarParcHistNumCPagar.AsInteger       := DM1.tCPagarParcNumCPagar.AsInteger;
  DM1.tCPagarParcHistParcCPagar.AsInteger      := DM1.tCPagarParcParcCPagar.AsInteger;
  DM1.tCPagarParcHistItem.AsInteger            := vAux;
  DM1.tCPagarParcHistDtHistorico.AsDateTime    := Date;
  DM1.tCPagarParcHistCodHistorico.AsCurrency   := 0;
  DM1.tCPagarParcHistHistorico.AsString        := vHistorico;
  DM1.tCPagarParcHistDtUltPgto.AsDateTime      := DM1.tCPagarParcDtPagParcCPagar.AsDateTime;
  DM1.tCPagarParcHistVlrUltPgto.AsCurrency     := DM1.tChequeCPagarValor.AsFloat;
  DM1.tCPagarParcHistVlrUltJuros.AsFloat       := DM1.tChequeCPagarVlrJuros.AsFloat;
  DM1.tCPagarParcHistVlrUltDescontos.AsFloat   := DM1.tChequeCPagarVlrDesconto.AsFloat;
  DM1.tCPagarParcHistVlrUltDespesas.AsFloat    := 0;
  DM1.tCPagarParcHistVlrUltAbatimentos.AsFloat := 0;
  DM1.tCPagarParcHistJurosPagos.AsFloat        := 0;
  DM1.tCPagarParcHistPgto.AsBoolean            := True;
  DM1.tCPagarParcHistNumMov.AsInteger          := 0;
  DM1.tCPagarParcHistNumMovJuros.AsInteger     := 0;
  Dm1.tCPagarParcHistNumCheque.AsInteger       := DM1.tChequeNumCheque.AsInteger;
  Dm1.tCPagarParcHistDtPrevCheque.AsDateTime   := DM1.tChequeDtPrevista.AsDateTime;
  //DM1.tCPagarParcHistTipo.AsString             := 'PAG';

  DM1.tCPagarParcHist.Post;
end;

procedure TfChequeCPagar.Grava_CPagar;
procedure QuitaContaPagar;
var Achou : Boolean;    
begin
  Achou := False;
  DM1.tCPagarParc.First;
  while not DM1.tCPagarParc.EOF do
  begin
    if not DM1.tCPagarParcQuitParcCPagar.AsBoolean then
      Achou := True;
    DM1.tCPagarParc.Next;
  end;
  if not Achou then
  begin
    DM1.tCPagar.Edit;
    DM1.tCPagarQuitado.AsBoolean := True;
    DM1.tCPagar.Post;
  end;
end;
begin
  DM1.tCPagarParc.Edit;
  DM1.tCPagarParcRestParcela.AsCurrency := DM1.tCPagarParcRestParcela.AsCurrency -
                                           DM1.tChequeCPagarVlrDesconto.AsFloat -
                                           DM1.tChequeCPagarValor.AsFloat;
  vHistorico          := 'PAGAMENTO TOTAL COM CHEQUE';
  if DM1.tCPagarParcRestParcela.AsFloat <= 0 then
    DM1.tCPagarParcRestParcela.AsFloat := 0
  else
    vHistorico          := 'PAGAMENTO PARCIAL COM CHEQUE';

  DM1.tCPagarParcDtPagParcCPagar.AsDateTime := DM1.tChequeDtEmissao.AsDateTime;
  DM1.tCPagarParcCodConta.AsInteger         := DM1.tChequeCodConta.AsInteger;
  DM1.tCPagarParcDesconto.AsFloat           := DM1.tCPagarParcDesconto.AsFloat + DM1.tChequeCPagarVlrDesconto.AsFloat;
  if DM1.tCPagarParcRestParcela.AsFloat = 0 then
    DM1.tCPagarParcQuitParcCPagar.AsBoolean := True;
  DM1.tCPagarParcJurosParcCPagar.AsFloat    := DM1.tCPagarParcJurosParcCPagar.AsFloat + DM1.tChequeCPagarVlrJuros.AsFloat;
  DM1.tCPagarParcDiasAtraso.AsFloat          := DM1.tCPagarParcDtPagParcCPagar.AsFloat - DM1.tCPagarParcDtVencCPagar.AsFloat;
  if DM1.tCPagarParcclDiasAtraso.AsFloat < 0 then
    DM1.tCPagarParcclDiasAtraso.AsFloat := 0;
  DM1.tCPagarParcPgtoParcial.AsCurrency := DM1.tCPagarParcPgtoParcial.AsCurrency + DM1.tChequeCPagarValor.AsFloat;
  DM1.tCPagarParc.Post;
  Grava_Historico;
  QuitaContaPagar;
end;

procedure TfChequeCPagar.RxDBLookupCombo10Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfChequeCPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfChequeCPagar.BitBtn6Click(Sender: TObject);
var
  vQtdAux : Real;
  vAux : Currency;
begin
  if (RxDBLookupCombo10.Value = '') or ((CurrencyEdit1.AsInteger = 0) and
     (Edit1.Text = '')) or (CurrencyEdit10.Value = 0) or
     (RxDBLookupCombo1.Text = '') or (CurrencyEdit9.Value <= 0) then
  begin
    ShowMessage('É Obrigatório informar os campos <Fornecedor>, <Duplicata> e <Valor pagamento>!');
    RxDBLookupCombo10.SetFocus;
    exit;
  end;

  if not DM1.tCPagar.Locate('Filial;NumCPagar',VarArrayOf([DM1.tFilialCodigo.AsInteger,CurrencyEdit1.AsInteger]),[locaseinsensitive]) then
    begin
      ShowMessage('Duplicata não encontrada!');
      Exit;
    end;
  if not DM1.tCPagarParc.Locate('Filial;NumCPagar;ParcCPagar',VarArrayOf([DM1.tFilialCodigo.AsInteger,CurrencyEdit1.AsInteger,CurrencyEdit7.AsInteger]),[locaseinsensitive]) then
    begin
      ShowMessage('Parcela não encontrada!');
      Exit;
    end;
  if StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsFloat)) <= 0 then
    begin
      ShowMessage('Parcela já quitada!');
      Exit;
    end;

  if DM1.tChequeCPagar.Locate('Filial;NumCPagar;Parcela',VarArrayOf([DM1.tFilialCodigo.AsInteger,CurrencyEdit1.AsInteger,CurrencyEdit7.AsInteger]),[locaseinsensitive]) then
    begin
      ShowMessage('Duplicata já lançada neste cheque!');
      Exit;
    end;

  DM1.tChequeCPagar.Insert;
  DM1.tChequeCPagarNumMov.AsInteger        := DM1.tChequeNumMov.AsInteger;
  DM1.tChequeCPagarCodConta.AsInteger      := DM1.tChequeCodConta.AsInteger;
  DM1.tChequeCPagarNumCheque.AsInteger     := DM1.tChequeNumCheque.AsInteger;
  DM1.tChequeCPagarFilial.AsInteger        := DM1.tFilialCodigo.AsInteger;
  DM1.tChequeCPagarNumCPagar.AsInteger     := DM1.tCPagarParcNumCPagar.AsInteger;
  DM1.tChequeCPagarParcela.AsInteger       := DM1.tCPagarParcParcCPagar.AsInteger;
  DM1.tChequeCPagarNumNota.AsInteger       := DM1.tCPagarParcNumNotaEnt.AsInteger;
  DM1.tChequeCPagarNumDuplicata.AsString   := DM1.tCPagarParcNroDuplicata.AsString;
  DM1.tChequeCPagarCodFornecedor.AsInteger := DM1.tCPagarParcCodForn.AsInteger;
  DM1.tChequeCPagarValor.AsFloat           := CurrencyEdit10.Value;
  DM1.tChequeCPagarVlrJuros.AsFloat        := CurrencyEdit11.Value;
  DM1.tChequeCPagarVlrDesconto.AsFloat     := CurrencyEdit12.Value;
  DM1.tChequeCPagar.Post;

  Grava_CPagar;

  SpeedButton7Click(Sender);
  RxDBLookupCombo1.SetFocus;
end;

procedure TfChequeCPagar.SpeedButton7Click(Sender: TObject);
begin
  RxDBLookupCombo10.ClearValue;
  CurrencyEdit1.Clear;
  CurrencyEdit7.Clear;
  Edit1.Clear;
  CurrencyEdit9.Clear;
  CurrencyEdit10.Clear;
  CurrencyEdit11.Clear;
  CurrencyEdit12.Clear;
end;

procedure TfChequeCPagar.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfChequeCPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_F10 then
    Close;
end;

procedure TfChequeCPagar.BitBtn2Click(Sender: TObject);
begin
  fBuscaDuplicata := TfBuscaDuplicata.Create(Self);
  fBuscaDuplicata.ShowModal;
end;

procedure TfChequeCPagar.CurrencyEdit10Exit(Sender: TObject);
begin
  if (CurrencyEdit10.Value + CurrencyEdit12.Value) > CurrencyEdit9.Value then
  begin
    CurrencyEdit11.Value := (CurrencyEdit10.Value + CurrencyEdit12.Value) - CurrencyEdit9.Value;
    CurrencyEdit10.Value := CurrencyEdit9.Value - CurrencyEdit12.Value;
  end;
end;

procedure TfChequeCPagar.Panel2Exit(Sender: TObject);
var
  vAchou : Boolean;
begin
  CurrencyEdit9.Clear;
  CurrencyEdit10.Clear;
  if (RxDBLookupCombo10.Text = '') and ((CurrencyEdit1.AsInteger > 0) or
     (Edit1.Text <> '')) then
    begin
      ShowMessage('Falta informar o fornecedor!');
      Exit;
    end;
  if (Edit1.Text = '') and (RxDBLookupCombo1.Text = '') and (CurrencyEdit1.Value > 0) then
    begin
      ShowMessage('Falta informar a filial!');
      Exit;
    end;

  vAchou := False;  
  tCPagarParc2.Refresh;
  if Edit1.Text <> '' then
  begin
    if tCPagarParc2.Locate('CodForn;NroDuplicata;ParcCPagar',VarArrayOf([RxDBLookupCombo10.KeyValue,Edit1.Text,CurrencyEdit7.AsInteger]),[locaseinsensitive]) then
      vAchou := True;
  end
  else
  if CurrencyEdit1.Value > 0 then
    if tCPagarParc2.Locate('Filial;CodForn;NumCPagar;ParcCPagar',VarArrayOf([RxDBLookupCombo1.KeyValue,RxDBLookupCombo10.KeyValue,CurrencyEdit1.AsInteger,CurrencyEdit7.AsInteger]),[locaseinsensitive]) then
      vAchou := True;
  if (CurrencyEdit1.Value > 0) or (Edit1.Text <> '') then
  begin
    if not vAchou then
      ShowMessage('Duplicata não cadastrada!')
    else
    begin
      CurrencyEdit9.Value       := tCPagarParc2.FieldByName('RestParcela').AsFloat;
      CurrencyEdit10.Value      := tCPagarParc2.FieldByName('RestParcela').AsFloat;
      RxDBLookupCombo1.KeyValue := tCPagarParc2.FieldByName('Filial').AsInteger;
      CurrencyEdit1.Value       := tCPagarParc2.FieldByName('NumCPagar').AsInteger;
    end;
    if CurrencyEdit9.Value <= 0 then
      ShowMessage('Duplicata já quitada');
    DM1.tFilial.Locate('Codigo',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
  end;
end;

procedure TfChequeCPagar.FormShow(Sender: TObject);
begin
  tCPagarParc2.Fields.Clear;
  tCPagarParc2.Fields.Create(tCPagarParc2);

  tCPagarParc2.Open;
end;

procedure TfChequeCPagar.CurrencyEdit12Exit(Sender: TObject);
begin
  CurrencyEdit10.Value := CurrencyEdit9.Value - CurrencyEdit12.Value;
end;

end.

