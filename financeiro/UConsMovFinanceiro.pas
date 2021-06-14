unit UConsMovFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, ExtCtrls, DB, DBTables, RxLookup,
  Buttons, Grids, DBGrids, SMDBGrid, CurrEdit;

type
  TfConsMovFinanceiro = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    Label1: TLabel;
    DateEdit2: TDateEdit;
    Label3: TLabel;
    DateEdit3: TDateEdit;
    Label4: TLabel;
    DateEdit4: TDateEdit;
    Label5: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    tContas: TTable;
    tContasCodConta: TIntegerField;
    tContasNomeConta: TStringField;
    dsContas: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qConsulta: TQuery;
    qConsultaCodConta: TIntegerField;
    qConsultaNumMovimento: TIntegerField;
    qConsultaDtMovimento: TDateField;
    qConsultaVlrMovDebito: TFloatField;
    qConsultaVlrMovCredito: TFloatField;
    qConsultaHistorico: TStringField;
    qConsultaFilial: TIntegerField;
    qConsultaDtUsuario: TDateField;
    qConsultaHrUsuario: TTimeField;
    qConsultaUsuario: TStringField;
    qConsultaNomeConta: TStringField;
    dsqConsulta: TDataSource;
    SMDBGrid1: TSMDBGrid;
    Label6: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label7: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label8: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    vSQL : String;

    procedure Monta_SQL;

  public
    { Public declarations }
  end;

var
  fConsMovFinanceiro: TfConsMovFinanceiro;

implementation

uses UDM1;

{$R *.dfm}

procedure TfConsMovFinanceiro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConsMovFinanceiro.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsMovFinanceiro.FormShow(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;

  vSQL := qConsulta.SQL.Text;
end;

procedure TfConsMovFinanceiro.BitBtn1Click(Sender: TObject);
var
  vVlrDebito, vVlrCredito, vVlrTotal : Real;
begin
  if (DateEdit1.Date < 10) and (DateEdit2.Date < 10) and
     (DateEdit3.Date < 10) and (DateEdit4.Date < 10) then
  begin
    ShowMessage('É obrigatório informar uma opção da data!');
    exit;
  end;

  Monta_SQL;

  vVlrDebito  := 0;
  vVlrCredito := 0;
  vVlrTotal   := 0;
  qConsulta.First;
  while not qConsulta.Eof do
  begin
    vVlrDebito  := vVlrDebito + qConsultaVlrMovDebito.AsFloat;
    vVlrCredito := vVlrCredito + qConsultaVlrMovCredito.AsFloat;

    qConsulta.Next;
  end;

  vVlrTotal := StrToFloat(FormatFloat('0.00',vVlrCredito - vVlrDebito));

  CurrencyEdit1.Value := StrToFloat(FormatFloat('0.00',vVlrDebito));
  CurrencyEdit2.Value := StrToFloat(FormatFloat('0.00',vVlrCredito));
  CurrencyEdit3.Value := StrToFloat(FormatFloat('0.00',vVlrTotal));
end;

procedure TfConsMovFinanceiro.Monta_SQL;
begin
  qConsulta.Close;
  qConsulta.SQL.Text := vSQL;
  if RxDBLookupCombo1.Text <> '' then
  begin
    qConsulta.SQL.Add(' AND (dbMovimentos.CodConta = :CodConta)');
    qConsulta.ParamByName('CodConta').AsInteger := RxDBLookupCombo1.KeyValue;
  end;
  if DateEdit1.Date > 10 then
  begin
    qConsulta.SQL.Add(' AND (dbMovimentos.DtUsuario >= :DtUsuarioIni)');
    qConsulta.ParamByName('DtUsuarioIni').AsDate := DateEdit1.Date;
  end;
  if DateEdit2.Date > 10 then
  begin
    qConsulta.SQL.Add(' AND (dbMovimentos.DtUsuario <= :DtUsuarioFin)');
    qConsulta.ParamByName('DtUsuarioFin').AsDate := DateEdit2.Date;
  end;
  if DateEdit3.Date > 10 then
  begin
    qConsulta.SQL.Add(' AND (dbMovimentos.DtMovimento >= :DtMovimentoIni)');
    qConsulta.ParamByName('DtMovimentoIni').AsDate := DateEdit3.Date;
  end;
  if DateEdit4.Date > 10 then
  begin
    qConsulta.SQL.Add(' AND (dbMovimentos.DtMovimento <= :DtMovimentoFin)');
    qConsulta.ParamByName('DtMovimentoFin').AsDate := DateEdit4.Date;
  end;
  qConsulta.SQL.Add('ORDER BY Dbcontas.NomeConta, Dbmovimentos.DtUsuario, Dbmovimentos.NumMovimento');
  qConsulta.Open;
end;

end.
