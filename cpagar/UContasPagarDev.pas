unit UContasPagarDev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, CurrEdit, Mask, ToolEdit,
  RxLookup, Buttons, ExtCtrls, DBCtrls, Db, DBTables, DBFilter, Variants;

type
  TfContasPagarDev = class(TForm)
    Panel1: TPanel;
    Label15: TLabel;
    DBText5: TDBText;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    Label2: TLabel;
    DBText2: TDBText;
    Label3: TLabel;
    DBText3: TDBText;
    Label1: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    Label5: TLabel;
    Label6: TLabel;
    DBText6: TDBText;
    Label7: TLabel;
    Bevel1: TBevel;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DateEdit1: TDateEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Edit1: TEdit;
    tHistorico: TTable;
    dsHistorico: TDataSource;
    tHistoricoCodigo: TIntegerField;
    tHistoricoNome: TStringField;
    tHistoricoTipo: TStringField;
    RxDBFilter1: TRxDBFilter;
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
    procedure Pgto_Total;
    procedure Pgto_Parcial;
  public
    { Public declarations }
  end;

var
  fContasPagarDev: TfContasPagarDev;
  vParc, vCPagar : Integer;
implementation

uses UDM1, UDM2, UHistorico;

{$R *.DFM}

procedure TfContasPagarDev.Grava_Historico;
var
  vItemAux : Integer;
begin
  DM1.tCPagarParcHist.Refresh;
  DM1.tCPagarParcHist.Last;
  vItemAux := DM1.tCPagarParcHistItem.AsInteger;
  DM1.tCPagarParcHist.Insert;
  Dm1.tCPagarParcHistFilial.AsInteger        := Dm1.tCPagarParcFilial.AsInteger;
  DM1.tCPagarParcHistNumCPagar.AsInteger     := DM1.tCPagarParcNumCPagar.AsInteger;
  DM1.tCPagarParcHistParcCPagar.AsInteger    := DM1.tCPagarParcParcCPagar.AsInteger;
  DM1.tCPagarParcHistItem.AsInteger          := vItemAux + 1;
  DM1.tCPagarParcHistDtHistorico.AsDateTime  := Date;
  DM1.tCPagarParcHistCodHistorico.AsCurrency := 0;
  if Edit1.Text <> '' then
    DM1.tCPagarParcHistHistorico.AsString      := Edit1.Text
  else
    DM1.tCPagarParcHistHistorico.AsString      := 'VALOR REF. DEVOLUCAO';
  DM1.tCPagarParcHistDtUltPgto.AsDateTime      := DateEdit1.Date;;
  DM1.tCPagarParcHistVlrUltPgto.AsCurrency     := 0;
  DM1.tCPagarParcHistVlrUltJuros.AsFloat       := DM1.tCPagarParcJurosParcCPagar.AsFloat;
  DM1.tCPagarParcHistVlrUltDescontos.AsFloat   := DM1.tCPagarParcDesconto.AsFloat;
  DM1.tCPagarParcHistVlrUltDespesas.AsFloat    := DM1.tCPagarParcDespesas.AsFloat;
  DM1.tCPagarParcHistVlrUltAbatimentos.AsFloat := DM1.tCPagarParcAbatimentos.AsFloat;
  DM1.tCPagarParcHistVlrDevolucao.AsFloat      := CurrencyEdit1.Value;
  DM1.tCPagarParcHistPgto.AsBoolean            := False;
  DM1.tCPagarParcHistDevolucao.AsBoolean       := True;
  DM1.tCPagarParcHistTipo.AsString             := 'DEV';
  DM1.tCPagarParcHist.Post;
end;

procedure TfContasPagarDev.Pgto_Total;
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
  end
end;
begin
  DM1.tCPagarParcVlrDevolucao.AsFloat     := DM1.tCPagarParcVlrDevolucao.AsFloat + CurrencyEdit1.Value;
  DM1.tCPagarParcQuitParcCPagar.AsBoolean := True;
  DM1.tCPagarParcRestParcela.AsFloat      := StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsFloat - CurrencyEdit1.Value));
  if DM1.tCPagarParcDtVencCPagar.AsString = '' then
    DM1.tCPagarParcDtVencCPagar.AsDateTime := DM1.tCPagarParcDtPagParcCPagar.AsDateTime;
  Grava_Historico;
  DM1.tCPagarParc.Post;
  QuitaContaPagar;
  DM1.tCPagarParc.Locate('NumCPagar;ParcCPagar',VarArrayOf([vCPagar,vParc]),[loCaseInsensitive]);
  Close;
end;

procedure TfContasPagarDev.Pgto_Parcial;
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
      //DM1.tCPagar.MasterSource.Enabled := False;
      DM1.tCPagar.Edit;
      DM1.tCPagarQuitado.AsBoolean := True;
      DM1.tCPagar.Post;
      //DM1.tCPagar.MasterSource.Enabled := True;
    end;
end;
begin
  DM1.tCPagarParcVlrDevolucao.AsFloat         := DM1.tCPagarParcVlrDevolucao.AsFloat + CurrencyEdit1.Value;
  DM1.tCPagarParcRestParcela.AsCurrency       := StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsCurrency - CurrencyEdit1.Value));
  if StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsFloat)) <= 0 then
    DM1.tCPagarParcQuitParcCPagar.AsBoolean := True;
  if DM1.tCPagarParcDtVencCPagar.AsString = '' then
    DM1.tCPagarParcDtVencCPagar.AsDateTime := DM1.tCPagarParcDtPagParcCPagar.AsDateTime;
  Grava_Historico;
  DM1.tCPagarParc.Post;
  QuitaContaPagar;
  DM1.tCPagarParc.Locate('NumCPagar;ParcCPagar',VarArrayOf([vCPagar,vParc]),[loCaseInsensitive]);
  Close;
end;

procedure TfContasPagarDev.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM1.tCPagarParc.State in [dsInsert,dsEdit] then
    DM1.tCPagarParc.Cancel;
  Action := Cafree;
end;

procedure TfContasPagarDev.FormShow(Sender: TObject);
begin
  vParc   := Dm1.tCPagarParcParcCPagar.AsInteger;
  vCPagar := Dm1.tCPagarParcNumCPagar.AsInteger;
  DM1.tCPagarParc.Edit;
  CurrencyEdit1.Value := DM1.tCPagarParcRestParcela.AsCurrency;
  DateEdit1.Date      := Date;
  CurrencyEdit2.Value := 0;
  Edit1.Text := '';
end;

procedure TfContasPagarDev.BitBtn1Click(Sender: TObject);
begin
  if CurrencyEdit1.Value > StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsFloat)) then
    ShowMessage('Valor da devolução não pode ser maior que restante a pagar!')
  else
  if CurrencyEdit1.value <= 0 then
    ShowMessage('Valor de devolução não pode ser zero!')
  else
  if (CurrencyEdit1.value = StrToFloat(FormatFloat('0.00',(DM1.tCPagarParcVlrParcCPagar.AsFloat)))) and
     (CurrencyEdit1.value = StrToFloat(FormatFloat('0.00',(DM1.tCPagarParcRestParcela.AsFloat)))) then
    Pgto_Total
  else
    Pgto_Parcial;
end;

procedure TfContasPagarDev.CurrencyEdit2Enter(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Codigo';
end;

procedure TfContasPagarDev.CurrencyEdit2Exit(Sender: TObject);
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

procedure TfContasPagarDev.Edit1Change(Sender: TObject);
begin
  try
    tHistorico.IndexFieldNames := 'Nome';
    tHistorico.FindNearest([Edit1.Text]);
    CurrencyEdit2.Text := tHistoricoCodigo.AsString;
  except
  end;
end;

procedure TfContasPagarDev.RxDBLookupCombo1Change(Sender: TObject);
begin
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit2.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasPagarDev.RxDBLookupCombo1Enter(Sender: TObject);
begin
  tHistorico.IndexFieldNames := 'Nome';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit2.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasPagarDev.RxDBLookupCombo1Exit(Sender: TObject);
begin
  tHistorico.IndexFieldNames := 'Codigo';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit2.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasPagarDev.SpeedButton1Click(Sender: TObject);
begin
  fHistorico := TfHistorico.Create(Self);
  fHistorico.ShowModal;
end;

procedure TfContasPagarDev.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F10 then
    BitBtn1Click(Sender);
end;

procedure TfContasPagarDev.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

end.
