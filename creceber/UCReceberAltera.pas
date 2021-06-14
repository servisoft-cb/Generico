unit UCReceberAltera;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, RXLookup, CurrEdit, DBCtrls, Mask,
  ToolEdit, RXDBCtrl, ExtCtrls, Db, DBTables, Grids, DBGrids, DBFilter;

type
  TfCReceberAltera = class(TForm)
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
    tCReceberParcHistIns: TTable;
    tCReceberParcHistInsNumCReceber: TIntegerField;
    tCReceberParcHistInsParcCReceber: TIntegerField;
    tCReceberParcHistInsItem: TIntegerField;
    tCReceberParcHistInsCodHistorico: TIntegerField;
    tCReceberParcHistInsDtHistorico: TDateField;
    DateEdit1: TDateEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    SpeedButton2: TSpeedButton;
    Label11: TLabel;
    DBEdit4: TDBEdit;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    SpeedButton3: TSpeedButton;
    Bevel1: TBevel;
    tCReceberParcHistInsHistorico: TStringField;
    CurrencyEdit1: TCurrencyEdit;
    Edit2: TEdit;
    DBText4: TDBText;
    Label13: TLabel;
    Label14: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    DBCheckBox1: TDBCheckBox;
    Label15: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Edit1: TEdit;
    RxDBFilter1: TRxDBFilter;
    tCReceberParcHistInsFilial: TIntegerField;
    Label16: TLabel;
    DBEdit1: TDBEdit;
    Label17: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label18: TLabel;
    DBEdit6: TDBEdit;
    Label19: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    DBCheckBox2: TDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
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
    procedure RxDBLookupCombo4Enter(Sender: TObject);
  private
    { Private declarations }
    vDespesa, vAbatimento : Real;
    vDtVencimento : TDate;
    vTransfIcms : Boolean;
  public
    { Public declarations }
  end;

var
  fCReceberAltera: TfCReceberAltera;

implementation

uses UDM1, UHistorico, UTipoCobranca, UContas;

{$R *.DFM}

procedure TfCReceberAltera.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM1.tCReceberParc.State in [dsInsert,dsEdit] then
    DM1.tCReceberParc.Cancel;
  RxDBFilter1.Active := False;
  Action := Cafree;
end;

procedure TfCReceberAltera.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioHistoricos.AsBoolean then
    begin
      fHistorico := TfHistorico.Create(Self);
      fHistorico.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfCReceberAltera.FormShow(Sender: TObject);
Var Ano, Mes, Dia : Word;
    vJurosDia, vQtdDia, vAux, vJuros : Currency;
begin
  DM1.tCReceberParc.Edit;
  vTransfIcms    := DM1.tCReceberParcTransferencia.AsBoolean;
  DateEdit1.Date := Date;
  vDespesa       := DM1.tCReceberParcDespesas.AsFloat;
  vAbatimento    := DM1.tCReceberParcAbatimentos.AsFloat;
  vDtVencimento  := DM1.tCReceberParcDtVencCReceber.AsDateTime;
  CurrencyEdit1.Value := 0;
  Edit1.Text := '';
  Edit2.Text := DM1.tCReceberParclkCodBanco.AsString;
  if Date > DM1.tCReceberParcDtVencCReceber.AsDateTime then
    begin
      vJuros := 0;
      if DM1.tParametrosControlarJurosParam.AsBoolean then
        vJuros := DM1.tParametrosPercJuros.AsFloat
      else
        begin
          DecodeDate(Date, Ano, Mes, Dia);
          DM1.tJuros.SetKey;
          DM1.tJurosAno.AsInteger := Ano;
          DM1.tJurosMes.AsInteger := Mes;
          if not DM1.tJuros.GotoKey then
            ShowMessage('Juros não cadastrado para o mês de pagamento!')
          else
            vJuros := DM1.tJurosJuro.AsFloat;
        end;
      if vJuros > 0 then
        begin
          vJurosDia := vJuros / 30;
          vQtdDia := Date - DM1.tCReceberParcDtVencCReceber.AsDateTime;
          vAux := (vQtdDia * vJurosDia);
          vAux := (DM1.tCReceberParcRestParcela.AsFloat * vAux) / 100;
          CurrencyEdit2.Value := vAux;
        end;
    end;
  RxDBFilter1.Active := True;
end;

procedure TfCReceberAltera.BitBtn1Click(Sender: TObject);
begin
  vDespesa    := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDespesas.AsFloat - vDespesa));
  vAbatimento := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcAbatimentos.AsFloat - vAbatimento));

  DM1.tCReceberParcHist.Insert;
  tCReceberParcHistIns.Refresh;
  tCReceberParcHistIns.Last;
  Dm1.tCReceberParcHistFilial.AsInteger        := Dm1.tCReceberParcFilial.AsInteger;
  DM1.tCReceberParcHistNumCReceber.AsInteger   := DM1.tCReceberParcNumCReceber.AsInteger;
  DM1.tCReceberParcHistParcCReceber.AsInteger  := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tCReceberParcHistItem.AsInteger          := tCReceberParcHistInsItem.AsInteger + 1;
  DM1.tCReceberParcHistDtHistorico.AsDateTime  := DateEdit1.Date;
  DM1.tCReceberParcHistCodHistorico.AsCurrency := CurrencyEdit1.Value;
  DM1.tCReceberParcHistHistorico.AsString      := '';
  if Trim(Edit1.Text) <> '' then
    DM1.tCReceberParcHistHistorico.AsString := Edit1.Text
  else
  if vTransfIcms <> DM1.tCReceberParcTransferencia.AsBoolean then
    begin
      if vTransfIcms then
        DM1.tCReceberParcHistHistorico.AsString := 'ALTERADO PARA COBRANCA (ANT. TRANSF.)'
      else
      if DM1.tCReceberParcTransferencia.AsBoolean then
        DM1.tCReceberParcHistHistorico.AsString := 'ALTERADO PARA TRANSFERENCIA DE ICMS';
    end;
  if DM1.tCReceberParcHistHistorico.AsString = '' then
    DM1.tCReceberParcHistHistorico.AsString := 'ALTERACAO DA PARCELA';

  DM1.tCReceberParcHistVlrUltAbatimentos.AsFloat := vAbatimento;
  DM1.tCReceberParcHistVlrUltDespesas.AsFloat    := vDespesa;

  DM1.tCReceberParcHistTipo.AsString := 'ALT';

  DM1.tCReceberParcHist.Post;
  DM1.tCReceberParcRestParcela.AsFloat := DM1.tCReceberParcRestParcela.AsFloat - vAbatimento;
  DM1.tCReceberParc.Post;
  Close;
end;

procedure TfCReceberAltera.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfCReceberAltera.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tTipoCobranca.IndexFieldNames := 'Nome';
end;

procedure TfCReceberAltera.RxDBLookupCombo2Exit(Sender: TObject);
begin
  DM1.tTipoCobranca.IndexFieldNames := 'Codigo';
end;

procedure TfCReceberAltera.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioTiposCobr.AsBoolean then
    begin
      fTipoCobranca := TfTipoCobranca.Create(Self);
      fTipoCobranca.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfCReceberAltera.SpeedButton3Click(Sender: TObject);
begin
  if DM1.tUsuarioContas.AsBoolean then
    begin
      fContas := TfContas.Create(Self);
      fContas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfCReceberAltera.RxDBLookupCombo3DropDown(Sender: TObject);
begin
  DM1.tContas.IndexFieldNames := 'NomeConta';
end;

procedure TfCReceberAltera.RxDBLookupCombo3Exit(Sender: TObject);
begin
  Edit2.Text := DM1.tContasCodBanco.AsString;
  DM1.tContas.IndexFieldNames := 'CodConta';
end;

procedure TfCReceberAltera.CurrencyEdit1Exit(Sender: TObject);
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

procedure TfCReceberAltera.CurrencyEdit1Enter(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Codigo';
end;

procedure TfCReceberAltera.Edit2Change(Sender: TObject);
begin
  try
    DM1.tContas.IndexFieldNames := 'CodBanco';
    DM1.tContas.FindNearest([Edit2.Text]);
    RxDBLookupCombo3.KeyValue := DM1.tContasCodConta.AsInteger;
  except
    ShowMessage('Digite só números aqui!');
  end;
end;

procedure TfCReceberAltera.FormCreate(Sender: TObject);
begin
  DM1.tCReceberParc.Edit;
  DateEdit1.Date := Date;
  vDespesa    := DM1.tCReceberParcDespesas.AsFloat;
  vAbatimento := DM1.tCReceberParcAbatimentos.AsFloat;
  CurrencyEdit1.Value := 0;
  Edit1.Text := '';
  Edit2.Text := DM1.tCReceberParclkCodBanco.AsString;
end;

procedure TfCReceberAltera.RxDBLookupCombo1Change(Sender: TObject);
begin
  Edit1.Text         := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := DM1.tHistoricoCodigo.AsString;
end;

procedure TfCReceberAltera.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Nome';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := DM1.tHistoricoCodigo.AsString;
end;

procedure TfCReceberAltera.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Nome';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := DM1.tHistoricoCodigo.AsString;
end;

procedure TfCReceberAltera.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Codigo';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := DM1.tHistoricoCodigo.AsString;
end;

procedure TfCReceberAltera.RxDBLookupCombo4Enter(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

end.
