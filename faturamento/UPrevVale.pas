unit UPrevVale;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, CurrEdit, Mask, ToolEdit, RXLookup, Grids,
  DBGrids, Db, DBTables, RXDBCtrl;

type
  TfPrevVale = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    qVale: TQuery;
    dsqVale: TDataSource;
    qValeNumVale: TIntegerField;
    qValeDtEmissao: TDateField;
    qValeVlrTotal: TFloatField;
    qValeCodCliente: TIntegerField;
    qValeNome: TStringField;
    qValeFaturado: TBooleanField;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    BitBtn5: TBitBtn;
    Label3: TLabel;
    DateEdit2: TDateEdit;
    Bevel1: TBevel;
    BitBtn4: TBitBtn;
    qValeGeraCobranca: TBooleanField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrevVale: TfPrevVale;

implementation

uses UDM1, URelVale2;

{$R *.DFM}

procedure TfPrevVale.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qVale.Close;
  DM1.tCliente.Close;
  Action := CaFree;
end;

procedure TfPrevVale.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevVale.BitBtn5Click(Sender: TObject);
var
  vSeparador : String;
begin
  vSeparador := 'WHERE';
  qVale.Close;
  qVale.SQL.Clear;
  qVale.SQL.Add('SELECT Dbvale.NumVale, Dbvale.DtEmissao, Dbvale.VlrTotal, Dbvale.CodCliente, Dbcliente.Nome, Dbvale.Faturado, dbVale.GeraCobranca ');
  qVale.SQL.Add('FROM "dbVale.db" Dbvale');
  qVale.SQL.Add('   INNER JOIN "dbCliente.DB" Dbcliente');
  qVale.SQL.Add('   ON  (Dbvale.CodCliente = Dbcliente.Codigo)');
  if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') then
  begin
    qVale.SQL.Add(vSeparador + ' Dbvale.DtEmissao BETWEEN :Data1 AND :Data2');
    qVale.ParamByName('Data1').AsDate := DateEdit1.Date;
    qVale.ParamByName('Data2').AsDate := DateEdit2.Date;
    vSeparador := ' AND';
  end;
  if RxDBLookupCombo1.Text <> '' then
  begin
    qVale.SQL.Add(vSeparador +  ' Dbvale.CodCliente = :CodCliente');
    qVale.ParamByName('CodCliente').AsInteger := RxDBLookupCombo1.KeyValue;
    vSeparador := ' AND';
  end;
  case RadioGroup1.ItemIndex of
    0 : qVale.SQL.Add(vSeparador + ' (dbvale.Faturado = False and dbVale.GeraCobranca = False) ');
    1 : qVale.SQL.Add(vSeparador + ' (dbvale.Faturado = True or dbVale.GeraCobranca = True)');
  end;
  case RadioGroup2.ItemIndex of
    0 : qVale.SQL.Add('ORDER BY Dbvale.DtEmissao');
    1 : qVale.SQL.Add('ORDER BY Dbcliente.Nome');
  end;
  qVale.Open;
  if qVale.RecordCount > 0 then
  begin
    fRelVale2 := TfRelVale2.Create(Self);
    fRelVale2.QuickRep1.Preview;
    fRelVale2.Free;
  end
  else
    ShowMessage('Não existe registro para imprimir com estas opções!');
end;

procedure TfPrevVale.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfPrevVale.RxDBLookupCombo1Click(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfPrevVale.FormShow(Sender: TObject);
begin
  DM1.tCliente.Open;
end;

end.
