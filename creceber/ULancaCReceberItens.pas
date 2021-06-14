unit ULancaCReceberItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, ToolEdit, StdCtrls, Mask, CurrEdit, Buttons, ExtCtrls, Db,
  DBFilter, RzPanel;

type
  TfLancaCReceberItens = class(TForm)
    Panel1: TPanel;
    SpeedButton7: TSpeedButton;
    BitBtn6: TBitBtn;
    CurrencyEdit2: TCurrencyEdit;
    DateEdit1: TDateEdit;
    CurrencyEdit1: TCurrencyEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label6: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label12: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    SpeedButton8: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    CurrencyEdit3: TCurrencyEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    RxFilterPlanoContas: TRxDBFilter;
    gbxVendedor: TRzGroupBox;
    Label83: TLabel;
    Label21: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure RxDBLookupCombo6Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
     procedure Limpa;
    { Public declarations }
  end;

var
  fLancaCReceberItens: TfLancaCReceberItens;

implementation

uses UDM1, UPlanoContas, ULancaCReceber, UTipoCobranca;

{$R *.dfm}

procedure TfLancaCReceberItens.Limpa;
begin
  fLancaCReceber.vNumParcela := 0;
  DateEdit1.Clear;
  RxDBLookupCombo1.ClearValue;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  RxDBLookupCombo3.ClearValue;
  RxDBLookupCombo6.ClearValue;
  Edit1.Clear;
  RxDBLookupCombo5.ClearValue;
  CurrencyEdit3.Clear;
end;

procedure TfLancaCReceberItens.BitBtn6Click(Sender: TObject);
begin
  if fLancaCReceber.vNumParcela > 0 then
  begin
    DM1.tCReceberParc.FindKey([Dm1.tFilialCodigo.AsInteger,DM1.tCReceberNumCReceber.AsInteger,fLancaCReceber.vNumParcela]);
    DM1.tCReceberParc.Edit;
  end
  else
  begin
    if DM1.tCReceberParc.Locate('Filial;NumCReceber;ParcCReceber',VarArrayOf([Dm1.tFilialCodigo.AsInteger,DM1.tCReceberNumCReceber.AsString,CurrencyEdit2.Text]),[loCaseInsensitive]) then
    begin
      ShowMessage('Parcela digitada já existe!');
      exit;
    end
    else
    if (CurrencyEdit2.Value = 0) or (DateEdit1.Text = '  /  /    ') or (CurrencyEdit1.Value = 0) then
    begin
      ShowMessage('Existem campos em branco: "Parcela, Data Vcto ou Valor"!');
      exit;
    end
    else
    begin
      fLancaCReceber.tCReceberParcIns.Refresh;
      fLancaCReceber.tCReceberParcIns.Last;
      DM1.tCReceberParc.Insert;
      Dm1.tCReceberParcFilial.AsInteger       := Dm1.tCReceberFilial.AsInteger;
      DM1.tCReceberParcNumCReceber.AsInteger  := DM1.tCReceberNumCReceber.AsInteger;
      DM1.tCReceberParcParcCReceber.AsInteger := CurrencyEdit2.AsInteger;
      DM1.tCReceberParcSerie.AsString         := DM1.tCReceberSerie.AsString;
    end;
  end;

  if RxDBLookupCombo3.Text <> '' then
    DM1.tCReceberParcPlanoContas.AsInteger := RxDBLookupCombo3.KeyValue;
  if RxDBLookupCombo6.Text <> '' then
    DM1.tCReceberParcCodPlanoContasItens.AsInteger := RxDBLookupCombo6.KeyValue
  else
    DM1.tCReceberParcCodPlanoContasItens.AsInteger := 0;

  if RxDBLookupCombo1.Text <> '' then
    DM1.tCReceberParcCodBancoBoleto.AsInteger := RxDBLookupCombo1.KeyValue
  else
    DM1.tCReceberParcCodBancoBoleto.AsInteger := 0;

  if RxDBLookupCombo5.Text <> '' then
    DM1.tCReceberParcCodVendedor.AsInteger := RxDBLookupCombo5.KeyValue
  else
    DM1.tCReceberParcCodVendedor.AsInteger := 0;

  DM1.tCReceberParcCodCli.AsInteger         := DM1.tCReceberCodCli.AsInteger;
  DM1.tCReceberParcVlrParcCReceber.AsFloat  := CurrencyEdit1.Value;
  DM1.tCReceberVlrTotal.AsFloat             := DM1.tCReceberVlrTotal.AsFloat + DM1.tCReceberParcVlrParcCReceber.AsFloat;
  DM1.tCReceberParcRestParcela.AsFloat      := CurrencyEdit1.Value;
  DM1.tCReceberParcDtVencCReceber.AsString  := DateEdit1.Text;
  DM1.tCReceberParcTipoDoc.AsString         := DM1.tCReceberTipoDoc.AsString;
  DM1.tCReceberParcNumTitBanco.AsString     := Edit1.Text;
  DM1.tCReceberParcPercComissao.AsFloat     := CurrencyEdit3.Value;
  DM1.tCReceberParcDtGerado.AsDateTime      := DM1.tCReceberDtGerado.AsDateTime;
  DM1.tCReceberParcDescontoDe.AsString      := Edit2.Text;
  DM1.tCReceberParcDescontoAte.AsString     := Edit3.Text;

  if RxDBLookupCombo2.Text <> '' then
    DM1.tCReceberParcCodTipoCobranca.AsInteger := RxDBLookupCombo2.KeyValue
  else
    DM1.tCReceberParcCodTipoCobranca.AsInteger := 0;
  DM1.tCReceberParc.Post;
  DM1.GravaEnt_tCReceberParcHist('ENT');

  if fLancaCReceber.BitBtn14.Tag = 0 then
    begin
     Limpa;
     CurrencyEdit2.SetFocus;
   end
  else
    Close;
end;

procedure TfLancaCReceberItens.SpeedButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TfLancaCReceberItens.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioPlanoCtas.AsBoolean then
    begin
      fPlanoContas := TfPlanoContas.Create(Self);
      fPlanoContas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado!');
end;

procedure TfLancaCReceberItens.RxDBLookupCombo6Enter(Sender: TObject);
begin
  if RxDBLookupCombo3.Text <> '' then
    RxDBLookupCombo6.ReadOnly := False
  else
    RxDBLookupCombo6.ReadOnly := True;
end;

procedure TfLancaCReceberItens.FormShow(Sender: TObject);
begin
  if fLancaCReceber.BitBtn14.Tag = 1 then
  begin
    CurrencyEdit2.Enabled := False;
    DateEdit1.SetFocus;
  end
  else
    CurrencyEdit2.SetFocus;
  if RxDBLookupCombo3.Text <> '' then
    RxFilterPlanoContas.Active := False
  else
    RxFilterPlanoContas.Active := True;
end;

procedure TfLancaCReceberItens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxFilterPlanoContas.Active := False;
  Action := caFree;
end;

procedure TfLancaCReceberItens.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tContas.IndexFieldNames := 'CodConta';
end;

procedure TfLancaCReceberItens.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tTipoCobranca.IndexFieldNames := 'Nome';
end;

procedure TfLancaCReceberItens.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioTiposCobr.AsBoolean then
  begin
    fTipoCobranca := TfTipoCobranca.Create(Self);
    fTipoCobranca.ShowModal;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado!');
end;

end.
