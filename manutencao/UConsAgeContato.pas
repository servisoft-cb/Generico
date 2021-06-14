unit UConsAgeContato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, CurrEdit, Mask, ToolEdit, RXLookup, Grids,
  DBGrids, Db, DBTables, DBCtrls;

type
  TfConsAgeContato = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn8: TBitBtn;
    BitBtn1: TBitBtn;
    qAgeContato: TQuery;
    qAgeContatoData: TDateField;
    qAgeContatoHora: TTimeField;
    qAgeContatoNome: TStringField;
    qAgeContatoResponsavel: TStringField;
    qAgeContatoObs: TMemoField;
    dsqAgeContato: TDataSource;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    qAgeContatoNumMov: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure DateEdit1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsAgeContato: TfConsAgeContato;

implementation

uses UDM1;

{$R *.DFM}

procedure TfConsAgeContato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tAgeContato.IndexFieldNames := 'NumMov';
  DM1.tAgeContato.FindKey([qAgeContatoNumMov.AsInteger]);
  qAgeContato.Close;
  Action := CaFree;
end;

procedure TfConsAgeContato.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsAgeContato.BitBtn8Click(Sender: TObject);
begin
  if DateEdit1.Date > 0 then
    begin
      qAgeContato.Close;
      qAgeContato.SQL.Clear;
      qAgeContato.SQL.Add('SELECT Dbagecontato.NumMov, Dbagecontato.Data, Dbagecontato.Hora, Dbcliente.Nome, Dbagecontato.Responsavel, Dbagecontato.Obs');
      qAgeContato.SQL.Add('FROM "dbAgeContato.db" Dbagecontato');
      qAgeContato.SQL.Add('INNER JOIN "dbCliente.DB" Dbcliente');
      qAgeContato.SQL.Add('ON  (Dbagecontato.CodCliente = Dbcliente.Codigo)');
      qAgeContato.SQL.Add('Where Dbagecontato.Data = :Data');
      qAgeContato.SQL.Add('Order By Dbagecontato.Data');
      qAgeContato.Params[0].AsDate := DateEdit1.Date;
      qAgeContato.Open;
    end;
end;

procedure TfConsAgeContato.BitBtn1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
    ShowMessage('Falta informar o cliente')
  else
    begin
      qAgeContato.Close;
      qAgeContato.SQL.Clear;
      qAgeContato.SQL.Add('SELECT Dbagecontato.NumMov, Dbagecontato.Data, Dbagecontato.Hora, Dbcliente.Nome, Dbagecontato.Responsavel, Dbagecontato.Obs');
      qAgeContato.SQL.Add('FROM "dbAgeContato.db" Dbagecontato');
      qAgeContato.SQL.Add('INNER JOIN "dbCliente.DB" Dbcliente');
      qAgeContato.SQL.Add('ON  (Dbagecontato.CodCliente = Dbcliente.Codigo)');
      qAgeContato.SQL.Add('Where Dbagecontato.CodCliente = :Codigo');
      qAgeContato.SQL.Add('Order By Dbagecontato.Data');
      qAgeContato.Params[0].AsInteger := RxDBLookupCombo1.KeyValue;
      qAgeContato.Open;
    end;
end;

procedure TfConsAgeContato.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DateEdit1.Clear;
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfConsAgeContato.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Codigo';
end;

procedure TfConsAgeContato.DateEdit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
end;

end.
