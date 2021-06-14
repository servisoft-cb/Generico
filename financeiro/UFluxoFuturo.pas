unit UFluxoFuturo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Grids, DBGrids,
  SMDBGrid, DB, DBClient, Buttons, DBTables;

type
  TfFluxoFuturo = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    SMDBGrid1: TSMDBGrid;
    mFluxo: TClientDataSet;
    mFluxoData: TDateField;
    mFluxoReceber: TFloatField;
    mFluxoPagar: TFloatField;
    mFluxoCheques: TFloatField;
    mFluxoSaldo: TFloatField;
    BitBtn1: TBitBtn;
    dsmFluxo: TDataSource;
    qReceberAtraso: TQuery;
    qReceberAtrasoRestParcela: TFloatField;
    qPagarAtraso: TQuery;
    qPagarAtrasoRestParcela: TFloatField;
    qChequeAtraso: TQuery;
    qChequeAtrasoVlrTotal: TFloatField;
    qFluxo: TQuery;
    qFluxoData: TDateField;
    qFluxoPagar: TFloatField;
    qFluxoReceber: TFloatField;
    qFluxoCheques: TFloatField;
    dsqFluxo: TDataSource;
    Panel3: TPanel;
    Label6: TLabel;
    CurrencyEdit5: TCurrencyEdit;
    CheckBox1: TCheckBox;
    Panel4: TPanel;
    Label7: TLabel;
    CurrencyEdit6: TCurrencyEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mFluxoNewRecord(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_Fluxo;
  public
    { Public declarations }
    vSaldoAntRec, vSaldoAntPag, vSaldoAntChe, vSaldoAnt : Real;
    vSQLReceberAtr : String;
    procedure Monta_Atraso(Data : TDate; Transf : Boolean);
  end;

var
  fFluxoFuturo: TfFluxoFuturo;

implementation

uses UPrevCheque, URelFluxoFuturo, UConsFinanceiro;

{$R *.dfm}

procedure TfFluxoFuturo.Monta_Fluxo;
var
  vSaldoAux : Real;

begin
  if CheckBox1.Checked then
    vSaldoAux := CurrencyEdit5.Value + CurrencyEdit4.Value
  else
    vSaldoAux := CurrencyEdit4.Value;

  //Contas a Receber
  qFluxo.Close;
  qFluxo.ParamByName('Data').AsDate := Date;
  qFluxo.Open;
  mFluxo.EmptyDataSet;

  qFluxo.First;
  while not qFluxo.EOf do
    begin
      if not(qFluxoData.IsNull) or (qFluxoData.AsDateTime > 0) then
        begin
          if mFluxo.Locate('Data',qFluxoData.AsDateTime,[loCaseInsensitive]) then
            mFluxo.Edit
          else
            begin
              mFluxo.Insert;
              mFluxoData.AsDateTime := qFluxoData.AsDateTime;
            end;
          vSaldoAux              := vSaldoAux + qFluxoReceber.AsFloat - qFluxoPagar.AsFloat - qFluxoCheques.AsFloat;
          mFluxoPagar.AsFloat    := mFluxoPagar.AsFloat + qFluxoPagar.AsFloat;
          mFluxoCheques.AsFloat  := mFluxoCheques.AsFloat + qFluxoCheques.AsFloat;
          mFluxoReceber.AsFloat  := mFluxoReceber.AsFloat + qFluxoReceber.AsFloat;
          mFluxoSaldo.AsFloat    := vSaldoAux;
          mFluxo.Post;
        end;
      qFluxo.Next;
    end;
  qFluxo.Close;

  CurrencyEdit6.Value := CurrencyEdit5.Value + CurrencyEdit4.Value;
end;

procedure TfFluxoFuturo.Monta_Atraso(Data : TDate; Transf : Boolean);
begin
  //Contas a Receber em atraso
  qReceberAtraso.Close;
  qReceberAtraso.SQL.Clear;
  qReceberAtraso.SQL.Text := vSQLReceberAtr;
  if not Transf then
    qReceberAtraso.SQL.Add(' AND ((Transferencia = False) or (Transferencia is Null))');
  qReceberAtraso.ParamByName('Data').AsDate := Data;
  qReceberAtraso.Open;
  vSaldoAntRec := qReceberAtrasoRestParcela.AsFloat;
  qReceberAtraso.Close;

  //Contas a Pagar em atraso
  qPagarAtraso.Close;
  qPagarAtraso.ParamByName('Data').AsDate := Data;
  qPagarAtraso.Open;
  vSaldoAntPag := qPagarAtrasoRestParcela.AsFloat;
  qPagarAtraso.Close;

  //Cheques não compensados
  qChequeAtraso.Close;
  qChequeAtraso.ParamByName('Data').AsDate := Data;
  qChequeAtraso.Open;
  vSaldoAntChe := qChequeAtrasoVlrTotal.AsFloat;
  qChequeAtraso.Close;

  //Saldo
  vSaldoAnt := vSaldoAntRec - vSaldoAntPag - vSaldoAntChe;
end;

procedure TfFluxoFuturo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qReceberAtraso.Close;
  qPagarAtraso.Close;
  qChequeAtraso.Close;
  qFluxo.Close;
  Action := Cafree;
end;

procedure TfFluxoFuturo.mFluxoNewRecord(DataSet: TDataSet);
begin
  mFluxoPagar.AsFloat   := 0;
  mFluxoReceber.AsFloat := 0;
  mFluxoCheques.AsFloat := 0;
  mFluxoSaldo.AsFloat   := 0;
end;

procedure TfFluxoFuturo.BitBtn1Click(Sender: TObject);
begin
  vSaldoAnt := 0;
  mFluxo.EmptyDataSet;
  Monta_Atraso(Date,False);
  CurrencyEdit1.Value := vSaldoAntRec;
  CurrencyEdit2.Value := vSaldoAntPag;
  CurrencyEdit3.Value := vSaldoAntChe;
  CurrencyEdit4.Value := vSaldoAnt;
  Monta_Fluxo;
end;

procedure TfFluxoFuturo.BitBtn4Click(Sender: TObject);
begin
  fPrevCheque := TfPrevCheque.Create(Self);
  fPrevCheque.ShowModal;
end;

procedure TfFluxoFuturo.BitBtn5Click(Sender: TObject);
begin
  if mFluxo.RecordCount > 0 then
    begin
      fRelFluxoFuturo := TfRelFluxoFuturo.Create(Self);
      fRelFluxoFuturo.QuickRep1.Preview;
      fRelFluxoFuturo.QuickRep1.Free;
    end
  else
    ShowMessage('Falta gerar a consulta!');
end;

procedure TfFluxoFuturo.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if StrToFloat(FormatFloat('00',mFluxoSaldo.AsFloat)) < 0 then
    AFont.Color := clRed;
end;

procedure TfFluxoFuturo.BitBtn6Click(Sender: TObject);
begin
  fConsFinanceiro := TfConsFinanceiro.Create(Self);
  fConsFinanceiro.ShowModal;
end;

procedure TfFluxoFuturo.FormCreate(Sender: TObject);
begin
  vSQLReceberAtr := qReceberAtraso.SQL.Text;
end;

end.
