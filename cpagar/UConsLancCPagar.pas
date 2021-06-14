unit UConsLancCPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RxLookup, Mask, ToolEdit, Buttons, Grids, DBGrids,
  RXDBCtrl, Db, DBTables, ALed;

type
  TfConsLancCPagar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    DateEdit1: TDateEdit;
    BitBtn1: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    qCPagar: TQuery;
    qCPagarNumCPagar: TIntegerField;
    qCPagarCodForn: TIntegerField;
    qCPagarQuitado: TBooleanField;
    qCPagarDtGerado: TDateField;
    qCPagarNroDuplicata: TIntegerField;
    qCPagarTipoDoc: TStringField;
    qCPagarlkFornecedor: TStringField;
    qsCPagar: TDataSource;
    ALed1: TALed;
    Label8: TLabel;
    ALed2: TALed;
    Label9: TLabel;
    Label5: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure DateEdit1Enter(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure RxDBLookupCombo2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsLancCPagar: TfConsLancCPagar;

implementation

uses UDM1, ULancaCPagar;

{$R *.DFM}

procedure TfConsLancCPagar.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
  Edit1.Clear;
  Edit2.Clear;
  DateEdit1.Clear;
  if RxDBLookupCombo2.Text <> '' then
    begin
      qCPagar.Active             := False;
      qCPagar.SQL.Clear;
      qCPagar.SQL.ADD('SELECT Filial, NumCPagar, CodForn, Quitado, DtGerado, NroDuplicata, TipoDoc');
      qCPagar.SQL.ADD('FROM "dbCPagar.DB" Dbcpagar');
      qCPagar.SQL.ADD('Where Filial = :F1');
      qCPagar.Params[0].AsInteger := RxDBLookupCombo2.KeyValue;
      qCPagar.SQL.Add('ORDER BY CodForn');
      qCPagar.Active             := True;
    end;
end;

procedure TfConsLancCPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tCPagar.IndexFieldNames := 'Filial;NumCPagar';
  DM1.tCPagar.FindKey([Dm1.tFilialCodigo.AsInteger,qCPagarNumCPagar.AsInteger]);
  fLancaCPagar.Caption := 'Lançamentos de Contas a Pagar ' + Dm1.tFilialEmpresa.AsString;
  Action := Cafree;
end;

procedure TfConsLancCPagar.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsLancCPagar.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qCPagarQuitado.AsBoolean then
    begin
      AFont.Color := clWhite;
      Background  := clTeal;
    end
  else
    begin
      AFont.Color := clBlack;
      Background  := clWhite;
    end;
end;

procedure TfConsLancCPagar.RxDBLookupCombo1Change(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    qCPagar.Locate('CodForn',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
end;

procedure TfConsLancCPagar.Edit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  Edit2.Clear;
  DateEdit1.Clear;
  if RxDBLookupCombo2.Text <> '' then
    begin
      qCPagar.Active             := False;
      qCPagar.SQL.Clear;
      qCPagar.SQL.ADD('SELECT Filial, NumCPagar, CodForn, Quitado, DtGerado, NroDuplicata, TipoDoc');
      qCPagar.SQL.ADD('FROM "dbCPagar.DB" Dbcpagar');
      qCPagar.SQL.ADD('Where Filial = :F1');
      qCPagar.Params[0].AsInteger := RxDBLookupCombo2.KeyValue;
      qCPagar.SQL.Add('ORDER BY NumCPagar');
      qCPagar.Active             := True;
    end;
end;

procedure TfConsLancCPagar.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
    qCPagar.Locate('NumCPagar',StrToInt(Edit1.Text),[loCaseInsensitive]);
end;

procedure TfConsLancCPagar.Edit2Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  Edit1.Clear;
  DateEdit1.Clear;
  if RxDBLookupCombo2.Text <> '' then
    begin
      qCPagar.Active             := False;
      qCPagar.SQL.Clear;
      qCPagar.SQL.ADD('SELECT Filial, NumCPagar, CodForn, Quitado, DtGerado, NroDuplicata, TipoDoc');
      qCPagar.SQL.ADD('FROM "dbCPagar.DB" Dbcpagar');
      qCPagar.SQL.ADD('Where Filial = :F1');
      qCPagar.Params[0].AsInteger := RxDBLookupCombo2.KeyValue;
      qCPagar.SQL.Add('ORDER BY NroDuplicata');
      qCPagar.Active             := True;
    end;
end;

procedure TfConsLancCPagar.Edit2Change(Sender: TObject);
begin
  if Edit2.Text <> '' then
    qCPagar.Locate('NroDuplicata',StrToInt(Edit2.Text),[loCaseInsensitive]);
end;

procedure TfConsLancCPagar.DateEdit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  Edit1.Clear;
  Edit2.Clear;
  if RxDBLookupCombo2.Text <> '' then
    begin
      qCPagar.Active             := False;
      qCPagar.SQL.Clear;
      qCPagar.SQL.ADD('SELECT Filial, NumCPagar, CodForn, Quitado, DtGerado, NroDuplicata, TipoDoc');
      qCPagar.SQL.ADD('FROM "dbCPagar.DB" Dbcpagar');
      qCPagar.SQL.ADD('Where Filial = :F1');
      qCPagar.Params[0].AsInteger := RxDBLookupCombo2.KeyValue;
      qCPagar.SQL.ADD('ORDER BY NumCPagar');
      qCPagar.Active             := True;
    end;
end;

procedure TfConsLancCPagar.DateEdit1Change(Sender: TObject);
begin
  if DateEdit1.Text <> '  /  /    ' then
    qCPagar.Locate('DtGerado',DateEdit1.Date,[loCaseInsensitive]);
end;

procedure TfConsLancCPagar.RxDBLookupCombo2Change(Sender: TObject);
begin
  if RxDBLookupCombo2.Text <> '' then
    begin
      qCPagar.Active             := False;
      qCPagar.SQL.Clear;
      qCPagar.SQL.ADD('SELECT Filial, NumCPagar, CodForn, Quitado, DtGerado, NroDuplicata, TipoDoc');
      qCPagar.SQL.ADD('FROM "dbCPagar.DB" Dbcpagar');
      qCPagar.SQL.ADD('Where Filial = :F1');
      qCPagar.Params[0].AsInteger := RxDBLookupCombo2.KeyValue;
      qCPagar.SQL.ADD('ORDER BY NumCPagar');
      qCPagar.Active             := True;
    end
  else
    ShowMessage('Deve haver uma filial selecionada!');
end;

procedure TfConsLancCPagar.FormShow(Sender: TObject);
begin
  RxDBLookupCombo2.KeyValue := Dm1.tFilialCodigo.AsInteger;
end;

procedure TfConsLancCPagar.RxDBLookupCombo2Exit(Sender: TObject);
begin
  if RxDBLookupCombo2.Text = '' then
    begin
      ShowMessage('Deve haver uma filial seleciona!');
      RxDBLookupCombo2.SetFocus;
    end;
end;

end.
