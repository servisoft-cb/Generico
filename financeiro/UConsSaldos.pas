unit UConsSaldos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, DB, DBTables, StdCtrls, Buttons,
  DBClient, ExtCtrls, RzTabs, Mask, ToolEdit, RunText, ComCtrls;

type
  TfConsSaldos = class(TForm)
    qContas: TQuery;
    qContasCodConta: TIntegerField;
    qContasNomeConta: TStringField;
    qContasNumConta: TStringField;
    qContasFilial: TIntegerField;
    qContasVlrMovDebito: TFloatField;
    qContasVlrMovCredito: TFloatField;
    qContasclVlrMovimento: TFloatField;
    qCheques: TQuery;
    qCReceber: TQuery;
    qChequesCodConta: TIntegerField;
    qChequesVlrTotal: TFloatField;
    qCReceberCodBancoBoleto: TIntegerField;
    qCReceberRestParcela: TFloatField;
    Panel1: TPanel;
    BitBtn6: TBitBtn;
    RzPageControl1: TRzPageControl;
    TabSheet2: TRzTabSheet;
    mSaldoPorData: TClientDataSet;
    dsmSaldoPorData: TDataSource;
    mSaldoPorDataCodConta: TIntegerField;
    mSaldoPorDataSaldo: TFloatField;
    mSaldoPorDataVlrChequePagar: TFloatField;
    mSaldoPorDataVlrContasReceber: TFloatField;
    mSaldoPorDataVlrContasPagar: TFloatField;
    mSaldoPorDataData: TDateField;
    mSaldoConta: TClientDataSet;
    mSaldoContaCodConta: TIntegerField;
    mSaldoContaNomeConta: TStringField;
    mSaldoContaSaldo: TFloatField;
    mSaldoContaVlrChequeAtrasado: TFloatField;
    mSaldoContaVlrCReceberAtrasado: TFloatField;
    mSaldoContaVlrCPagarAtrasado: TFloatField;
    mSaldoContaSubSaldo: TFloatField;
    mSaldoContaVlrCheque: TFloatField;
    mSaldoContaVlrCReceber: TFloatField;
    mSaldoContaVlrCPagar: TFloatField;
    dsmSaldoConta: TDataSource;
    mSaldoContaSaldoGeral: TFloatField;
    SMDBGrid2: TSMDBGrid;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label2: TLabel;
    qCReceberDtVencimento2: TDateField;
    qCPagar: TQuery;
    qCPagarDtVencCPagar: TDateField;
    qCPagarCodConta: TIntegerField;
    qCPagarRestParcela: TFloatField;
    qChequesDtPrevista: TDateField;
    mSaldoPorDataSaldoGeral: TFloatField;
    Label3: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    Splitter1: TSplitter;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    StaticText1: TStaticText;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure qContasCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_SQLs;
    procedure Le_SQLs;
    procedure Grava_mSaldoPorData(Tipo : String; Data : TDateTime; Valor : Real; CodConta : Integer);
    procedure Le_mSaldo;
  public
    { Public declarations }
  end;

var
  fConsSaldos: TfConsSaldos;

implementation

uses UContasReceber2, UContasPagar2, UPrevCheque, URelSaldos;

{$R *.dfm}

procedure TfConsSaldos.Le_mSaldo;
var
  vSaldoInicial : Real;
begin
  ProgressBar2.Max      := mSaldoConta.RecordCount;
  ProgressBar2.Position := 0;

  mSaldoConta.First;
  while not mSaldoConta.Eof do
    begin
      ProgressBar2.Position := ProgressBar2.Position + 1;
      
      mSaldoConta.Edit;
      mSaldoContaSubSaldo.AsFloat   := mSaldoContaSaldo.AsFloat + mSaldoContaVlrCReceberAtrasado.AsFloat
                                     - mSaldoContaVlrChequeAtrasado.AsFloat - mSaldoContaVlrCPagarAtrasado.AsFloat;
      mSaldoContaSaldoGeral.AsFloat := mSaldoContaSubSaldo.AsFloat + mSaldoContaVlrCReceber.AsFloat
                                     - mSaldoContaVlrCheque.AsFloat - mSaldoContaVlrCPagar.AsFloat;
      mSaldoConta.Post;

      vSaldoInicial := 0;
      case ComboBox1.ItemIndex of
        0 : vSaldoInicial := mSaldoContaSaldo.AsFloat;
        1 : vSaldoInicial := mSaldoContaSubSaldo.AsFloat;
        2 : vSaldoInicial := mSaldoContaSaldo.AsFloat - mSaldoContaVlrChequeAtrasado.AsFloat;
        3 : vSaldoInicial := mSaldoContaSaldo.AsFloat + mSaldoContaVlrCReceberAtrasado.AsFloat;
        4 : vSaldoInicial := mSaldoContaSaldo.AsFloat + mSaldoContaVlrCPagarAtrasado.AsFloat;
        5 : vSaldoInicial := mSaldoContaSaldo.AsFloat + mSaldoContaVlrCReceberAtrasado.AsFloat - mSaldoContaVlrChequeAtrasado.AsFloat;
        6 : vSaldoInicial := mSaldoContaSaldo.AsFloat - mSaldoContaVlrCPagarAtrasado.AsFloat - mSaldoContaVlrChequeAtrasado.AsFloat;
      end;

      mSaldoPorData.First;
      while not mSaldoPorData.Eof do
        begin
          mSaldoPorData.Edit;
          mSaldoPorDataSaldo.AsFloat := vSaldoInicial;
          vSaldoInicial := vSaldoInicial + mSaldoPorDataVlrContasReceber.AsFloat
                         - mSaldoPorDataVlrChequePagar.AsFloat - mSaldoPorDataVlrContasPagar.AsFloat;
          mSaldoPorDataSaldoGeral.AsFloat := vSaldoInicial;
          mSaldoPorData.Post;
          mSaldoPorData.Next;
        end;

      mSaldoConta.Next;
    end;
end;

procedure TfConsSaldos.Grava_mSaldoPorData(Tipo : String; Data : TDateTime; Valor : Real; CodConta : Integer);
begin
  if mSaldoPorData.FindKey([CodConta,Data]) then
    mSaldoPorData.Edit
  else
    begin
      mSaldoPorData.Insert;
      mSaldoPorDataCodConta.AsInteger := CodConta;
      mSaldoPorDataData.AsDateTime    := Data;
    end;
  if Tipo = 'R' then
    mSaldoPorDataVlrContasReceber.AsFloat := mSaldoPorDataVlrContasReceber.AsFloat + Valor
  else
  if Tipo = 'C' then
    mSaldoPorDataVlrChequePagar.AsFloat := mSaldoPorDataVlrChequePagar.AsFloat + Valor
  else
  if Tipo = 'P' then
    mSaldoPorDataVlrContasPagar.AsFloat := mSaldoPorDataVlrContasPagar.AsFloat + Valor;
  mSaldoPorData.Post;
end;

procedure TfConsSaldos.Le_SQLs;
var
  vCodAux : Integer;
begin
  mSaldoConta.EmptyDataSet;
  mSaldoPorData.EmptyDataSet;
  ProgressBar1.Max      := qContas.RecordCount + qCheques.RecordCount + qCReceber.RecordCount + qCPagar.RecordCount;
  ProgressBar1.Position := 0;

  qContas.First;
  while not qContas.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;

      mSaldoConta.Insert;
      mSaldoContaCodConta.AsInteger := qContasCodConta.AsInteger;
      mSaldoContaNomeConta.AsString := qContasNomeConta.AsString;
      mSaldoContaSaldo.AsFloat      := qContasclVlrMovimento.AsFloat;
      mSaldoConta.Post;
      qContas.Next;
    end;

  qCReceber.First;
  while not qCReceber.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      vCodAux := qCReceberCodBancoBoleto.AsInteger;
      if qCReceberCodBancoBoleto.AsInteger < 1 then
        vCodAux := 0;
      if mSaldoConta.FindKey([vCodAux]) then
        mSaldoConta.Edit
      else
        begin
          mSaldoConta.Insert;
          mSaldoContaCodConta.AsInteger := vCodAux;
        end;
      if qCReceberDtVencimento2.AsDateTime < DateEdit1.Date then
        mSaldoContaVlrCReceberAtrasado.AsFloat := mSaldoContaVlrCReceberAtrasado.AsFloat + qCReceberRestParcela.AsFloat
      else
        begin
          mSaldoContaVlrCReceber.AsFloat := mSaldoContaVlrCReceber.AsFloat + qCReceberRestParcela.AsFloat;
          Grava_mSaldoPorData('R',qCReceberDtVencimento2.AsDateTime,qCReceberRestParcela.AsFloat,vCodAux);
        end;
      mSaldoConta.Post;
      qCReceber.Next;
    end;

  qCPagar.First;
  while not qCPagar.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      vCodAux := qCPagarCodConta.AsInteger;
      if qCPagarCodConta.AsInteger < 1 then
        vCodAux := 0;
      if mSaldoConta.FindKey([vCodAux]) then
        mSaldoConta.Edit
      else
        begin
          mSaldoConta.Insert;
          mSaldoContaCodConta.AsInteger := vCodAux;
        end;
      if qCPagarDtVencCPagar.AsDateTime < DateEdit1.Date then
        mSaldoContaVlrCPagarAtrasado.AsFloat := mSaldoContaVlrCPagarAtrasado.AsFloat + qCPagarRestParcela.AsFloat
      else
        begin
          mSaldoContaVlrCPagar.AsFloat := mSaldoContaVlrCPagar.AsFloat + qCPagarRestParcela.AsFloat;
          Grava_mSaldoPorData('P',qCPagarDtVencCPagar.AsDateTime,qCPagarRestParcela.AsFloat,vCodAux);
        end;
      mSaldoConta.Post;
      qCPagar.Next;
    end;

  qCheques.First;
  while not qCheques.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      if mSaldoConta.FindKey([qChequesCodConta.AsInteger]) then
        mSaldoConta.Edit
      else
        begin
          mSaldoConta.Insert;
          mSaldoContaCodConta.AsInteger := qChequesCodConta.AsInteger;
        end;
      if qChequesDtPrevista.AsDateTime < DateEdit1.Date then
        mSaldoContaVlrChequeAtrasado.AsFloat := mSaldoContaVlrChequeAtrasado.AsFloat + qChequesVlrTotal.AsFloat
      else
        begin
          mSaldoContaVlrCheque.AsFloat := mSaldoContaVlrCheque.AsFloat + qChequesVlrTotal.AsFloat;
          Grava_mSaldoPorData('C',qChequesDtPrevista.AsDateTime,qChequesVlrTotal.AsFloat,qChequesCodConta.AsInteger);
        end;
      mSaldoConta.Post;

      qCheques.Next;
    end;

  Le_mSaldo;
end;

procedure TfConsSaldos.Monta_SQLs;
begin
  qContas.Close;
  qContas.Open;

  qCReceber.Close;
  qCReceber.ParamByName('DtVencimento2').AsDate := DateEdit2.Date;
  qCReceber.Open;

  qCPagar.Close;
  qCPagar.ParamByName('DtVencCPagar').AsDate := DateEdit2.Date;
  qCPagar.Open;

  qCheques.Close;
  qCheques.ParamByName('DtPrevista').AsDate := DateEdit2.Date;
  qCheques.Open;
end;

procedure TfConsSaldos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qContas.Close;
  qCReceber.Close;
  qCheques.Close;
  qCPagar.Close;
  Action := Cafree;
end;

procedure TfConsSaldos.BitBtn6Click(Sender: TObject);
begin
  if (DateEdit1.Date < 10) or (DateEdit2.Date < 10) then
    begin
      ShowMessage('É obrigatório informar um período!');
      exit;
    end;

  SMDBGrid1.DisableScroll;
  SMDBGrid2.DisableScroll;
  Monta_SQLs;
  Le_SQLs;
  SMDBGrid1.EnableScroll;
  SMDBGrid2.EnableScroll;
end;

procedure TfConsSaldos.qContasCalcFields(DataSet: TDataSet);
begin
  qContasclVlrMovimento.AsFloat := qContasVlrMovCredito.AsFloat - qContasVlrMovDebito.AsFloat;
end;

procedure TfConsSaldos.FormShow(Sender: TObject);
begin
  Top   := 0;
  Left  := 0;
  Width := Screen.Width;
  Height := Screen.Height - 35;
end;

procedure TfConsSaldos.BitBtn1Click(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  SMDBGrid2.DisableScroll;
  Le_mSaldo;
  SMDBGrid1.EnableScroll;
  SMDBGrid2.EnableScroll;
end;

procedure TfConsSaldos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_F3 then
    begin
      fContasReceber2 := TfContasReceber2.Create(Self);
      fContasReceber2.ShowModal;
    end
  else
  if Key = Vk_F4 then
    begin
      fContasPagar2 := TfContasPagar2.Create(Self);
      fContasPagar2.ShowModal;
    end
  else
  if Key = Vk_F5 then
    begin
      fPrevCheque := TfPrevCheque.Create(Self);
      fPrevCheque.ShowModal;
    end;
end;

procedure TfConsSaldos.BitBtn2Click(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  SMDBGrid2.DisableScroll;
  fRelSaldos := TfRelSaldos.Create(Self);
  fRelSaldos.RLReport1.Preview;
  fRelSaldos.RLReport1.Free;
  SMDBGrid1.EnableScroll;
  SMDBGrid2.EnableScroll;
end;

end.
