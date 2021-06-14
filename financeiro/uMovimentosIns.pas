unit uMovimentosIns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, ToolEdit,
  RXDBCtrl, CurrEdit, DBFilter;

type
  TfMovimentosIns = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label6: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DateEdit1: TDateEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Edit1: TEdit;
    Label8: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    SpeedButton2: TSpeedButton;
    RxFilterPlanoContas: TRxDBFilter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
  private
    { Private declarations }
    procedure Move_Campos;
    procedure Limpa_Campos;
  public
    { Public declarations }
  end;

var
  fMovimentosIns: TfMovimentosIns;

implementation

uses UDM1, UMovimentos2, DB, UPlanoContas, UHistorico;

{$R *.dfm}

procedure TfMovimentosIns.Limpa_Campos;
begin
  DateEdit1.Clear;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  Edit1.Clear;
  RxDBLookupCombo2.ClearValue;
  RxDBLookupCombo3.ClearValue;
  RxDBLookupCombo4.ClearValue;
end;

procedure TfMovimentosIns.Move_Campos;
begin
  RxDBLookupCombo1.KeyValue := DM1.tMovimentosCodConta.AsInteger;
  DateEdit1.Date            := DM1.tMovimentosDtMovimento.AsDateTime;
  CurrencyEdit1.Value       := DM1.tMovimentosVlrMovDebito.AsFloat;
  CurrencyEdit2.Value       := DM1.tMovimentosVlrMovCredito.AsFloat;
  Edit1.Text                := DM1.tMovimentosHistorico.AsString;
  if DM1.tMovimentosPlanoContas.AsInteger > 0 then
    RxDBLookupCombo2.KeyValue := DM1.tMovimentosPlanoContas.AsInteger;
  if DM1.tMovimentosCodPlanoContasItens.AsInteger > 0 then
    RxDBLookupCombo3.KeyValue := DM1.tMovimentosCodPlanoContasItens.AsInteger;
end;

procedure TfMovimentosIns.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tHistorico.Close;
  Action := Cafree;
end;

procedure TfMovimentosIns.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfMovimentosIns.BitBtn6Click(Sender: TObject);
begin
  if RxDBLookUpCombo1.Text = '' then
    ShowMessage('Uma conta deve ser selecionada!')
  else
  if DateEdit1.Date < 10 then
    ShowMessage('Uma data deve ser informada!')
  else
  if ((CurrencyEdit1.Value > 0) and (CurrencyEdit2.Value > 0)) or
     ((CurrencyEdit1.Value <= 0) and (CurrencyEdit2.Value <= 0)) then
    ShowMessage('Deve ser inserido somente Débito ou somente Crédito!')
  else
  if Edit1.Text = '' then
    ShowMessage('Deve ser inserido um Histórico!')
  else
  begin
    DM1.tContas.IndexFieldNames := 'CodConta';
    if DM1.tContasCodConta.AsInteger <> RxDBLookupCombo1.KeyValue then
      DM1.tContas.FindKey([RxDBLookupCombo1.KeyValue]);
    if DateEdit1.Date <= DM1.tContasDtEncerramento.AsDateTime then
    begin
      ShowMessage('Data de encerramento ' + DM1.tContasDtEncerramento.AsString + ', é maior que a informada!');
      exit;
    end;

    if fMovimentos2.BitBtn16.Tag = 0 then
    begin
      //DM1.tContas.FindKey([RxDBLookupCombo1.KeyValue]);
      DM1.tMovimentos.Insert;
      DM1.tMovimentosCodConta.AsInteger := RxDBLookupCombo1.KeyValue;
    end
    else
      DM1.tMovimentos.Edit;
    DM1.tMovimentosDtMovimento.AsDateTime := DateEdit1.Date;
    DM1.tMovimentosVlrMovDebito.AsFloat   := CurrencyEdit1.Value;
    DM1.tMovimentosVlrMovCredito.AsFloat  := CurrencyEdit2.Value;
    DM1.tMovimentosHistorico.AsString     := Edit1.Text;
    if RxDBLookupCombo2.Text <> '' then
      DM1.tMovimentosPlanoContas.AsInteger := RxDBLookupCombo2.KeyValue
    else
      DM1.tMovimentosPlanoContas.AsInteger := 0;
    if RxDBLookupCombo3.Text <> '' then
      DM1.tMovimentosCodPlanoContasItens.AsInteger := RxDBLookupCombo3.KeyValue
    else
      DM1.tMovimentosCodPlanoContasItens.AsInteger := 0;
    DM1.tMovimentos.Post;
    fMovimentos2.tMovimentos2.Last;
    Limpa_Campos;
    if fMovimentos2.BitBtn16.Tag = 1 then
      Close
    else
      RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfMovimentosIns.FormShow(Sender: TObject);
begin
  DM1.tHistorico.Open;
  if fMovimentos2.BitBtn16.Tag = 1 then
    Move_Campos
  else
  if fMovimentos2.qContasCodConta.AsInteger > 0 then
    RxDBLookupCombo1.KeyValue := fMovimentos2.qContasCodConta.AsInteger;
  Panel2.Enabled := (fMovimentos2.BitBtn16.Tag = 0);
  Panel2.Refresh;
  if not Panel2.Enabled then
    DateEdit1.SetFocus;
  if RxDBLookupCombo2.Text <> '' then
    RxFilterPlanoContas.Active := False
  else
    RxFilterPlanoContas.Active := True;
end;

procedure TfMovimentosIns.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioPlanoCtas.AsBoolean then
    begin
      fPlanoContas := TfPlanoContas.Create(Self);
      fPlanoContas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de plano de contas!');
end;

procedure TfMovimentosIns.RxDBLookupCombo3Enter(Sender: TObject);
begin
  RxDBLookupCombo3.ReadOnly := (RxDBLookupCombo2.Text = '');
  Tag := 1;
end;

procedure TfMovimentosIns.RxDBLookupCombo4Enter(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Nome';
end;

procedure TfMovimentosIns.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioHistoricos.AsBoolean then
    begin
      fHistorico := TfHistorico.Create(Self);
      fHistorico.ShowModal;
      DM1.tHistorico.IndexFieldNames := 'Nome';
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfMovimentosIns.RxDBLookupCombo4Exit(Sender: TObject);
begin
  if (Edit1.Text = '') and (RxDBLookupCombo4.Text <> '') then
    begin
      DM1.tHistorico.IndexFieldNames := 'Codigo';
      DM1.tHistorico.FindKey([RxDBLookupCombo4.KeyValue]);
      Edit1.Text := DM1.tHistoricoNome.AsString;
      Edit1.SelLength := 11;


    end;
end;

procedure TfMovimentosIns.Edit1Enter(Sender: TObject);
begin
  Edit1.SelLength := 0;
end;

procedure TfMovimentosIns.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

end.
