unit UPrevCPagarSem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, Menus, RXCtrls, Printers,
  Db, DBTables, Grids, DBGrids, MemTable, RxLookup, Variants;

type
  TfPrevCPagarSem = class(TForm)
    Panel1: TPanel;
    StaticText1: TStaticText;
    DateEdit1: TDateEdit;
    StaticText2: TStaticText;
    DateEdit2: TDateEdit;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    qPagar: TQuery;
    BitBtn1: TBitBtn;
    qPagarNomeForn: TStringField;
    qPagarDtVencCPagar: TDateField;
    qPagarNomeConta: TStringField;
    qPagarRestParcela: TFloatField;
    mSemana: TMemoryTable;
    mSemanaNomeFornecedor: TStringField;
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
    RxDBLookupCombo1: TRxDBLookupCombo;
    StaticText3: TStaticText;
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
  fPrevCPagarSem: TfPrevCPagarSem;

implementation

uses URelCPagarSem, UDM1, UEscImpressora;

{$R *.DFM}

procedure TfPrevCPagarSem.Gera_Memo;
var
  vDataI, vDataF, vDataAux : TDate;
  i : Integer;
begin
  mSemana.EmptyTable;
  qPagar.First;
  vDataAux := vDataI;
  while not qPagar.Eof do
    begin
      vDataI := qPagarDtVencCPagar.AsDateTime;
      vDataF := qPagarDtVencCPagar.AsDateTime;
      if DayOfWeek(vDataI) > 1 then
        vDataI := vDataI - (DayOfWeek(vDataI) - 1);
      if DayOfWeek(vDataF) < 7 then
        vDataF := vDataF + (7 - DayOfWeek(vDataF));
      if mSemana.Locate('NomeFornecedor;NomeBanco;Data1',VarArrayOf([qPagarNomeForn.AsString,qPagarNomeConta.AsString,vDataI]),[locaseinsensitive]) then
        begin
          mSemana.Edit;
          mSemana.FieldByName('Data'+IntToStr(DayOfWeek(qPagarDtVencCPagar.AsDateTime))).AsDateTime := qPagarDtVencCPagar.AsDateTime;
          mSemana.FieldByName('Saldo'+IntToStr(DayOfWeek(qPagarDtVencCPagar.AsDateTime))).AsFloat   := mSemana.FieldByName('Saldo'+IntToStr(DayOfWeek(qPagarDtVencCPagar.AsDateTime))).AsFloat + qPagarRestParcela.AsFloat;
          mSemana.Post;                                                                                                                                                               
        end
      else
        begin
          vDataAux := vDataI;
          mSemana.Insert;
          mSemanaNomeFornecedor.AsString := qPagarNomeForn.AsString;
          mSemanaNomeBanco.AsString      := qPagarNomeConta.AsString;
          while vDataAux <= vDataF do
            begin
              mSemana.FieldByName('Data'+IntToStr(DayOfWeek(vDataAux))).AsDateTime := vDataAux;
              mSemana.FieldByName('Saldo'+IntToStr(DayOfWeek(vDataAux))).AsFloat   := 0;
              if vDataAux = qPagarDtVencCPagar.AsDateTime then
                mSemana.FieldByName('Saldo'+IntToStr(DayOfWeek(vDataAux))).AsFloat := qPagarRestParcela.AsFloat;
              vDataAux := vDataAux + 1;
            end;
          mSemana.Post;
        end;
      qPagar.Next;
    end;
end;

procedure TfPrevCPagarSem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qPagar.Close;
  Action := caFree;
end;

procedure TfPrevCPagarSem.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevCPagarSem.BitBtn1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
    ShowMessage('Deve haver uma filial selecionada');
  if (DateEdit1.text = '  /  /    ') or (DateEdit2.text = '  /  /    ') then
    ShowMessage('É obrigatório informar data inicial e final!')
  else
  if DateEdit1.Date > DateEdit2.Date then
    ShowMessage('Data inicial maior que a final!')
  else
    begin
      if DayOfWeek(DateEdit1.Date) > 1 then
        DateEdit1.Date := DateEdit1.Date - (DayOfWeek(DateEdit1.Date) - 1);
      if DayOfWeek(DateEdit2.Date) < 7 then
        DateEdit2.Date := DateEdit2.Date + (7 - DayOfWeek(DateEdit2.Date));
      qPagar.Close;
      qPagar.Params[0].AsDate := DateEdit1.Date;
      qPagar.Params[1].AsDate := DateEdit2.Date;
      qPagar.Params[2].AsInteger := RxDBLookupCombo1.KeyValue;
      DateEdit1.Text;
      DateEdit2.Text;
      qPagar.Open;
      qPagar.First;
      if qPagar.RecordCount > 0 then
        begin
          Gera_Memo;
          fRelCPagarSem := TfRelCPagarSem.Create(Self);
          fRelCPagarSem.QuickRep1.Preview;
          fRelCPagarSem.Free;
        end
      else
        ShowMessage('Não existe registro para a impressão!');
    end;
  DateEdit1.SetFocus;
end;

end.
