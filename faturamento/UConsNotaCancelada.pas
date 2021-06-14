unit UConsNotaCancelada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, Buttons, Grids, DBGrids, SMDBGrid, DB,
  DBTables, RxLookup;

type
  TfConsNotaCancelada = class(TForm)
    Label1: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label2: TLabel;
    SMDBGrid1: TSMDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    qNota: TQuery;
    qNotaFilial: TIntegerField;
    qNotaNumNota: TIntegerField;
    qNotaCodCli: TIntegerField;
    qNotaNomeCliente: TStringField;
    qNotaDtEmissao: TDateField;
    qNotaCodNatOper: TSmallintField;
    qNotaVlrTotalNota: TFloatField;
    qNotaBaseIcms: TFloatField;
    qNotaVlrTotalItens: TFloatField;
    qNotaVlrIpi: TFloatField;
    qNotaVlrIcms: TFloatField;
    qNotaVlrFrete: TFloatField;
    qNotaVlrSeguro: TFloatField;
    qNotaMotivoCanc: TStringField;
    qNotaVlrTotalDupl: TFloatField;
    dsqNota: TDataSource;
    qNotalkFilial: TStringField;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    vSql : String;
    procedure Monta_SQL;
  public
    { Public declarations }
  end;

var
  fConsNotaCancelada: TfConsNotaCancelada;

implementation

uses UDM2, URelNotaCancelada, UDM1;

{$R *.dfm}

procedure TfConsNotaCancelada.Monta_SQL;
begin
  qNota.Close;
  qNota.SQL.Clear;
  qNota.SQL.Add(vSql);
  if DateEdit1.Date > 0 then
    begin
      qNota.SQL.Add(' AND (dbNotaFiscal.DtEmissao >= :DtInicial) ');
      qNota.ParamByName('DtInicial').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qNota.SQL.Add(' AND (dbNotaFiscal.DtEmissao <= :DtFinal) ');
      qNota.ParamByName('DtFinal').AsDate := DateEdit2.Date;
    end;
  if RxDBLookupCombo1.Text <> '' then
    qNota.SQL.Add(' AND DBNOTAFISCAL.Filial = ' + RxDBLookupCombo1.KeyValue);

  qNota.SQL.Add('ORDER BY dbNotaFiscal.Filial, dbNotaFiscal.NumNota');
  qNota.Open;
end;

procedure TfConsNotaCancelada.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qNota.Close;
  Action := Cafree;
end;

procedure TfConsNotaCancelada.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsNotaCancelada.FormShow(Sender: TObject);
begin
  DM1.tFilial.Open;
  vSql := qNota.SQL.Text;
end;

procedure TfConsNotaCancelada.BitBtn1Click(Sender: TObject);
begin
  Monta_SQL;
end;

procedure TfConsNotaCancelada.BitBtn2Click(Sender: TObject);
begin
  fRelNotaCancelada := TfRelNotaCancelada.Create(Self);
  fRelNotaCancelada.RLReport1.Preview;
  fRelNotaCancelada.RLReport1.Free;
  FreeAndNil(fRelNotaCancelada);
end;

end.
