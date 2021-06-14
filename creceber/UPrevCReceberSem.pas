unit UPrevCReceberSem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, Menus, RXCtrls, Printers,
  Db, DBTables, Grids, DBGrids, MemTable, RxLookup, Variants;

type
  TfPrevCReceberSem = class(TForm)
    Panel1: TPanel;
    StaticText1: TStaticText;
    DateEdit1: TDateEdit;
    StaticText2: TStaticText;
    DateEdit2: TDateEdit;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    qReceber: TQuery;
    BitBtn1: TBitBtn;
    mSemana: TMemoryTable;
    mSemanaNomeBanco: TStringField;
    mSemanaData1: TDateField;
    mSemanaSaldo1: TFloatField;
    mSemanaData2: TDateField;
    mSemanaSaldo2: TFloatField;
    mSemanaData3: TDateField;
    mSemanaSaldo3: TFloatField;
    mSemanaData4: TDateField;
    mSemanaSaldo4: TFloatField;
    mSemanaData5: TDateField;
    mSemanaSaldo5: TFloatField;
    mSemanaData6: TDateField;
    mSemanaSaldo6: TFloatField;
    mSemanaData7: TDateField;
    mSemanaSaldo7: TFloatField;
    qReceberNome: TStringField;
    qReceberDtVencCReceber: TDateField;
    qReceberNomeConta: TStringField;
    qReceberRestParcela: TFloatField;
    mSemanaNomeCliente: TStringField;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    dsmSemana: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Gera_Memo;
  public
    { Public declarations }
  end;

var
  fPrevCReceberSem: TfPrevCReceberSem;

implementation

uses UDM1, URelCReceberSem;

{$R *.DFM}

procedure TfPrevCReceberSem.Gera_Memo;
var
  vDataI, vDataF, vDataAux : TDate;
begin
  mSemana.EmptyTable;
  qReceber.First;
  while not qReceber.Eof do
    begin
      vDataI := qReceberDtVencCReceber.AsDateTime;
      vDataF := qReceberDtVencCReceber.AsDateTime;
      if DayOfWeek(vDataI) > 1 then
        vDataI := vDataI - (DayOfWeek(vDataI) - 1);
      if DayOfWeek(vDataF) < 7 then
        vDataF := vDataF + (7 - DayOfWeek(vDataF));
      if mSemana.Locate('NomeCliente;NomeBanco;Data1',VarArrayOf([qReceberNome.AsString,qReceberNomeConta.AsString,vDataI]),[locaseinsensitive]) then
        begin
          mSemana.Edit;
          mSemana.FieldByName('Data'+IntToStr(DayOfWeek(qReceberDtVencCReceber.AsDateTime))).AsDateTime := qReceberDtVencCReceber.AsDateTime;
          mSemana.FieldByName('Saldo'+IntToStr(DayOfWeek(qReceberDtVencCReceber.AsDateTime))).AsFloat   := mSemana.FieldByName('Saldo'+IntToStr(DayOfWeek(qReceberDtVencCReceber.AsDateTime))).AsFloat + qReceberRestParcela.AsFloat;
          mSemana.Post;
        end
      else
        begin
          vDataAux := vDataI;
          mSemana.Insert;
          mSemanaNomeCliente.AsString    := qReceberNome.AsString;
          mSemanaNomeBanco.AsString      := qReceberNomeConta.AsString;
          while vDataAux <= vDataF do
            begin
              mSemana.FieldByName('Data'+IntToStr(DayOfWeek(vDataAux))).AsDateTime := vDataAux;
              mSemana.FieldByName('Saldo'+IntToStr(DayOfWeek(vDataAux))).AsFloat   := 0;
              if vDataAux = qReceberDtVencCReceber.AsDateTime then
                mSemana.FieldByName('Saldo'+IntToStr(DayOfWeek(vDataAux))).AsFloat := qReceberRestParcela.AsFloat;
              vDataAux := vDataAux + 1;
            end;
          mSemana.Post;
        end;
      qReceber.Next;
    end;
end;

procedure TfPrevCReceberSem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qReceber.Close;
  Action := caFree;
end;

procedure TfPrevCReceberSem.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevCReceberSem.BitBtn1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
  begin
    ShowMessage('Filial não foi informada!');
    exit;
  end;

  if ((DateEdit1.text = '  /  /    ') or (DateEdit2.text = '  /  /    ')) and (RxDBLookupCombo1.Text = '') then
    ShowMessage('É obrigatório informar data inicial, final e filial!')
  else
  if DateEdit1.Date > DateEdit2.Date then
    ShowMessage('Data inicial maior que a final!')
  else
    begin
      if DayOfWeek(DateEdit1.Date) > 1 then
        DateEdit1.Date := DateEdit1.Date - (DayOfWeek(DateEdit1.Date) - 1);
      if DayOfWeek(DateEdit2.Date) < 7 then
        DateEdit2.Date := DateEdit2.Date + (7 - DayOfWeek(DateEdit2.Date));
      qReceber.Close;
      qReceber.Params[0].AsDate := DateEdit1.Date;
      qReceber.Params[1].AsDate := DateEdit2.Date;
      qReceber.Params[2].AsInteger := RxDBLookupCombo1.KeyValue;
      DateEdit1.Text;
      DateEdit2.Text;
      qReceber.Open;
      qReceber.First;
      if qReceber.RecordCount > 0 then
        begin
          Gera_Memo;
          fRelCReceberSem := TfRelCREceberSem.Create(Self);
          fRelCReceberSem.QuickRep1.Preview;
          fRelCReceberSem.QuickRep1.Free;
        end
      else
        ShowMessage('Não existe registro para a impressão!');
    end;
  DateEdit1.SetFocus;
end;

end.
