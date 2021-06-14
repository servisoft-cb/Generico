unit UCPagarAltera;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, RXLookup, CurrEdit, DBCtrls, Mask, ToolEdit, RXDBCtrl,
  ExtCtrls, Db, DBTables, Grids, DBGrids, DBFilter;

type
  TfCPagarAltera = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    DBText2: TDBText;
    Label2: TLabel;
    DBText3: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    DBText1: TDBText;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    DBDateEdit2: TDBDateEdit;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    tCPagarParcHistIns: TTable;
    DateEdit1: TDateEdit;
    Label7: TLabel;
    Label11: TLabel;
    DBEdit4: TDBEdit;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    SpeedButton3: TSpeedButton;
    Bevel1: TBevel;
    CurrencyEdit1: TCurrencyEdit;
    Edit2: TEdit;
    DBText4: TDBText;
    Label13: TLabel;
    Label14: TLabel;
    CurrencyEdit2: TCurrencyEdit;
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
    tCPagarParcHistInsVlrUltAbatimentos: TFloatField;
    tCPagarParcHistInsPgto: TBooleanField;
    tCPagarParcHistInsJurosPagos: TFloatField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Edit1: TEdit;
    RxDBFilter1: TRxDBFilter;
    Label8: TLabel;
    DBDateEdit1: TDBDateEdit;
    tCPagarParcHistInsFilial: TIntegerField;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure RxDBLookupCombo3DropDown(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCPagarAltera: TfCPagarAltera;
  vDespesa, vAbatimento, vDesconto : Real;

implementation

uses UDM1, UHistorico, UTipoCobranca, UContas;

{$R *.DFM}

procedure TfCPagarAltera.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM1.tCPagarParc.State in [dsInsert,dsEdit] then
    DM1.tCPagarParc.Cancel;
  RxDBFilter1.Active := False;
  Action := Cafree;
end;

procedure TfCPagarAltera.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioHistoricos.AsBoolean then
    begin
      fHistorico := TfHistorico.Create(Self);
      fHistorico.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfCPagarAltera.FormShow(Sender: TObject);
begin
  DM1.tCPagarParc.Edit;
  DateEdit1.Date      := Date;
  vDespesa            := DM1.tCPagarParcDespesas.AsFloat;
  vAbatimento         := DM1.tCPagarParcAbatimentos.AsFloat;
  vDesconto           := DM1.tCPagarParcDesconto.AsFloat;
  CurrencyEdit2.Value := DM1.tCPagarParcJurosParcCPagar.AsFloat;
  RxDBFilter1.Active  := True;
end;

procedure TfCPagarAltera.BitBtn1Click(Sender: TObject);
begin
  DM1.tCPagarParcHist.Insert;
  tCPagarParcHistIns.Refresh;
  tCPagarParcHistIns.Last;
  Dm1.tCPagarParcHistFilial.AsInteger        := Dm1.tCPagarParcFilial.AsInteger;   
  DM1.tCPagarParcHistNumCPagar.AsInteger     := DM1.tCPagarParcNumCPagar.AsInteger;
  DM1.tCPagarParcHistParcCPagar.AsInteger    := DM1.tCPagarParcParcCPagar.AsInteger;
  DM1.tCPagarParcHistItem.AsInteger          := tCPagarParcHistInsItem.AsInteger + 1;
  DM1.tCPagarParcHistDtHistorico.AsDateTime  := DateEdit1.Date;
  DM1.tCPagarParcHistCodHistorico.AsCurrency := CurrencyEdit1.Value;
  if Edit1.Text <> '' then
    DM1.tCPagarParcHistHistorico.AsString      := Edit1.Text
  else
    DM1.tCPagarParcHistHistorico.AsString      := 'ALTERACAO DA PARCELA';
  DM1.tCPagarParcHistTipo.AsString := 'ALT';
  vDesconto    := DM1.tCPagarParcDesconto.AsFloat - vDesconto;
  if StrToFloat(FormatFloat('0.00',vDesconto)) > 0 then
    DM1.tCPagarParcHistVlrUltDescontos.AsFloat := vDesconto;
  DM1.tCPagarParcHist.Post;
  vDespesa    := DM1.tCPagarParcDespesas.AsFloat - vDespesa;
  vAbatimento := DM1.tCPagarParcAbatimentos.AsFloat - vAbatimento;
  DM1.tCPagarParcRestParcela.AsFloat         := DM1.tCPagarParcRestParcela.AsFloat -
                                                vAbatimento - vDesconto;
  DM1.tCPagarParcJurosParcCPagar.AsFloat     := CurrencyEdit2.Value;
  DM1.tCPagarParc.Post;
  Close;
end;

procedure TfCPagarAltera.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfCPagarAltera.SpeedButton3Click(Sender: TObject);
begin
  if DM1.tUsuarioContas.AsBoolean then
    begin
      fContas := TfContas.Create(Self);
      fContas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfCPagarAltera.RxDBLookupCombo3DropDown(Sender: TObject);
begin
  DM1.tContas.IndexFieldNames := 'NomeConta';
  Edit2.Text := DM1.tContasCodBanco.AsString;
end;

procedure TfCPagarAltera.RxDBLookupCombo3Exit(Sender: TObject);
begin
  Edit2.Text := DM1.tContasCodBanco.AsString;
  DM1.tContas.IndexFieldNames := 'CodConta';
end;

procedure TfCPagarAltera.CurrencyEdit1Exit(Sender: TObject);
begin
  if CurrencyEdit1.Value > 0 then
    begin
      DM1.tHistorico.SetKey;
      DM1.tHistoricoCodigo.AsCurrency := CurrencyEdit1.Value;
      if DM1.tHistorico.GotoKey then
        Edit1.Text := DM1.tHistoricoNome.AsString
      else
        begin
          Edit1.Text := '';
          ShowMessage('Histórico não cadastrado!');
          CurrencyEdit1.SetFocus;
        end;
    end
  else
    Edit1.Text := '';
end;

procedure TfCPagarAltera.CurrencyEdit1Enter(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Codigo';
end;

procedure TfCPagarAltera.Edit2Change(Sender: TObject);
begin
  try
    DM1.tContas.IndexFieldNames := 'CodBanco';
    DM1.tContas.FindNearest([Edit2.Text]);
    RxDBLookupCombo3.KeyValue := DM1.tContasCodConta.AsInteger;
  except
    ShowMessage('Digite só números aqui!');
  end;
end;

procedure TfCPagarAltera.FormCreate(Sender: TObject);
begin
  DM1.tCPagarParc.Edit;
  DateEdit1.Date := Date;
  vDespesa    := DM1.tCPagarParcDespesas.AsFloat;
  vAbatimento := DM1.tCPagarParcAbatimentos.AsFloat;
  vDesconto   := DM1.tCPagarParcDesconto.AsFloat;
  CurrencyEdit1.Value := 0;
  Edit1.Text := '';
  Edit2.Text := DM1.tCPagarParclkCodBanco.AsString;
end;

procedure TfCPagarAltera.RxDBLookupCombo1Change(Sender: TObject);
begin
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := DM1.tHistoricoCodigo.AsString;
end;

procedure TfCPagarAltera.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Nome';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := DM1.tHistoricoCodigo.AsString;
end;

procedure TfCPagarAltera.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Nome';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := DM1.tHistoricoCodigo.AsString;
end;

procedure TfCPagarAltera.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Codigo';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := DM1.tHistoricoCodigo.AsString;
end;

end.
