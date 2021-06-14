unit UBuscaDuplicata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, DB, DBTables, StdCtrls;

type
  TfBuscaDuplicata = class(TForm)
    SMDBGrid1: TSMDBGrid;
    qDuplicatas: TQuery;
    dsqDuplicatas: TDataSource;
    qDuplicatasCodForn: TIntegerField;
    qDuplicatasNomeForn: TStringField;
    qDuplicatasFilial: TIntegerField;
    qDuplicatasNumCPagar: TIntegerField;
    qDuplicatasParcCPagar: TIntegerField;
    qDuplicatasDtVencCPagar: TDateField;
    qDuplicatasVlrParcCPagar: TFloatField;
    qDuplicatasRestParcela: TFloatField;
    qDuplicatasPlanoContas: TIntegerField;
    qDuplicatasCodPlanoContasItens: TIntegerField;
    qDuplicatasNroDuplicata: TIntegerField;
    StaticText1: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Monta_SQLDuplicatas;
  public
    { Public declarations }
  end;

var
  fBuscaDuplicata: TfBuscaDuplicata;

implementation

uses UChequeCPagar;

{$R *.dfm}

procedure TfBuscaDuplicata.Monta_SQLDuplicatas;
begin
  qDuplicatas.Close;
  qDuplicatas.SQL.Clear;
  qDuplicatas.SQL.Add('SELECT Dbcpagarparc.CodForn, Dbfornecedores.NomeForn, Dbcpagarparc.Filial, Dbcpagarparc.NumCPagar, Dbcpagarparc.ParcCPagar, Dbcpagarparc.DtVencCPagar, ');
  qDuplicatas.SQL.Add(' Dbcpagarparc.VlrParcCPagar, Dbcpagarparc.RestParcela, Dbcpagarparc.PlanoContas, Dbcpagarparc.CodPlanoContasItens, Dbcpagarparc.NroDuplicata ');
  qDuplicatas.SQL.Add('FROM "dbCPagarParc.DB" Dbcpagarparc');
  qDuplicatas.SQL.Add('   INNER JOIN "dbFornecedores.DB" Dbfornecedores');
  qDuplicatas.SQL.Add('   ON  (Dbcpagarparc.CodForn = Dbfornecedores.CodForn)');
  qDuplicatas.SQL.Add('WHERE  (Dbcpagarparc.RestParcela > 0)');
  if fChequeCPagar.RxDBLookupCombo10.Text <> '' then
    begin
      qDuplicatas.SQL.Add('  AND  (Dbcpagarparc.CodForn = :CodForn)');
      qDuplicatas.ParamByName('CodForn').AsInteger := fChequeCPagar.RxDBLookupCombo10.KeyValue;
    end;
  qDuplicatas.SQL.Add('ORDER BY Dbcpagarparc.DtVencCPagar, Dbcpagarparc.NroDuplicata, Dbcpagarparc.ParcCPagar');
  qDuplicatas.Open;
end;

procedure TfBuscaDuplicata.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qDuplicatas.Close;
  Action := Cafree;
end;

procedure TfBuscaDuplicata.FormShow(Sender: TObject);
begin
  Monta_SQLDuplicatas;
end;

procedure TfBuscaDuplicata.SMDBGrid1DblClick(Sender: TObject);
begin
  if qDuplicatasCodForn.AsInteger > 0 then
    begin
      fChequeCPagar.RxDBLookupCombo1.KeyValue  := qDuplicatasFilial.AsInteger;
      fChequeCPagar.RxDBLookupCombo10.KeyValue := qDuplicatasCodForn.AsInteger;
      fChequeCPagar.CurrencyEdit8.AsInteger    := qDuplicatasNroDuplicata.AsInteger;
      fChequeCPagar.CurrencyEdit1.AsInteger    := qDuplicatasNumCPagar.AsInteger;
      fChequeCPagar.CurrencyEdit7.AsInteger    := qDuplicatasParcCPagar.AsInteger;
      fChequeCPagar.CurrencyEdit9.Value        := qDuplicatasRestParcela.AsFloat;
      fChequeCPagar.CurrencyEdit10.Value       := qDuplicatasRestParcela.AsFloat;
      Close;
    end;
end;

procedure TfBuscaDuplicata.SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    SMDBGrid1DblClick(Sender);
end;

end.
