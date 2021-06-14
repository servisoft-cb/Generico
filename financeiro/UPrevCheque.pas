unit UPrevCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, ExtCtrls, Buttons, Db, DBTables, RxLookup;

type
  TfPrevCheque = class(TForm)
    Panel1: TPanel;
    qCheque: TQuery;
    qsCheque: TDataSource;
    qChequeNomeConta: TStringField;
    qChequeNumCheque: TIntegerField;
    qChequeDtEmissao: TDateField;
    qChequeVlrTotal: TFloatField;
    qChequeDtEntrada: TDateField;
    qChequeDtPrevista: TDateField;
    qChequeNominal: TStringField;
    tChequeCPagar: TTable;
    tChequeCPagarCodConta: TIntegerField;
    tChequeCPagarNumCheque: TIntegerField;
    tChequeCPagarNumCPagar: TIntegerField;
    tChequeCPagarParcela: TIntegerField;
    tChequeCPagarNumNota: TIntegerField;
    tChequeCPagarCodFornecedor: TIntegerField;
    tChequeCPagarValor: TFloatField;
    tChequeCPagarVlrJuros: TFloatField;
    tChequeCPagarVlrDesconto: TFloatField;
    dsChequeCPagar: TDataSource;
    qChequeCodConta: TIntegerField;
    tChequeCPagarlkFornecedor: TStringField;
    qChequeFilial: TIntegerField;
    qChequeNumMov: TIntegerField;
    tChequeCPagarNumMov: TIntegerField;
    tChequeCPagarFilial: TIntegerField;
    tChequeCPagarNumDuplicata: TStringField;
    Label2: TLabel;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrevCheque: TfPrevCheque;

implementation

uses URelCheque, UDM1;

{$R *.DFM}

procedure TfPrevCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfPrevCheque.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevCheque.BitBtn2Click(Sender: TObject);
begin
  DateEdit1.Clear;
  DateEdit2.Clear;
end;

procedure TfPrevCheque.BitBtn1Click(Sender: TObject);
begin
  if (DateEdit1.Date > DateEdit2.Date) then
  begin
    ShowMessage('Data inicial não pode ser maior que a data final!');
    exit;
  end;
  if (DateEdit2.Date > 10) and (DateEdit1.Date < 10) then
  begin
    ShowMessage('Data inicial não foi informada');
    exit;
  end;
  qCheque.Close;
  qCheque.SQL.Clear;
  qCheque.SQL.Add('SELECT Dbcontas.NomeConta, Dbcheque.NumCheque, Dbcheque.DtEmissao, Dbcheque.VlrTotal, Dbcheque.DtEntrada, Dbcheque.DtPrevista, Dbcheque.Nominal, Dbcontas.CodConta, dbCheque.Filial, Dbcheque.NumMov');
  qCheque.SQL.Add('FROM "dbCheque.db" Dbcheque');
  qCheque.SQL.Add('   INNER JOIN "dbContas.DB" Dbcontas');
  qCheque.SQL.Add('   ON  (Dbcheque.CodConta = Dbcontas.CodConta)');
  qCheque.SQL.Add('WHERE (0 = 0)');
  if DateEdit1.Date > 10 then
  begin
    case ComboBox1.ItemIndex of
      0 : qCheque.SQL.Add('AND (Dbcheque.DtEmissao Between :D1 and :D2)');
      1 : qCheque.SQL.Add('AND (Dbcheque.DtPrevista Between :D1 and :D2)');
      2 : qCheque.SQL.Add('AND (Dbcheque.DtEntrada Between :D1 and :D2)');
    end;
    qCheque.ParamByName('D1').AsDate := DateEdit1.Date;
    qCheque.ParamByName('D2').AsDate := DateEdit2.Date;
  end;
  case RadioGroup1.ItemIndex of
    0 : qCheque.SQL.Add('AND (Dbcheque.DtEntrada Is Null)');
    1 : qCheque.SQL.Add('AND (Dbcheque.DtEntrada Is Not Null)');
  end;
  if RxDBLookupCombo1.Text <> '' then
  begin
    qCheque.SQL.Add(' AND (dbCheque.CodConta = :CodConta)');
    qCheque.ParamByName('CodConta').AsInteger := RxDBLookupCombo1.KeyValue;
  end;
  qCheque.SQL.Add('ORDER BY dbContas.NomeConta, dbcheque.DtPrevista');
  qCheque.Open;
  fRelCheque := TfRelCheque.Create(Self);
  fRelCheque.RLReport1.Preview();
end;

procedure TfPrevCheque.FormShow(Sender: TObject);
begin
  DM1.tContas.Open;
  DM1.tContas.IndexFieldNames := 'NOMECONTA';
end;

end.
