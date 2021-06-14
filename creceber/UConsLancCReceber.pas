unit UConsLancCReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, Mask, ToolEdit, RxLookup,
  ALed, ExtCtrls, Db, DBTables;

type
  TfConsLancCReceber = class(TForm)
    Panel1: TPanel;
    ALed1: TALed;
    Label8: TLabel;
    ALed2: TALed;
    Label9: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Edit1: TEdit;
    Edit2: TEdit;
    DateEdit1: TDateEdit;
    BitBtn1: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    qCReceber: TQuery;
    qCReceberNumCReceber: TIntegerField;
    qCReceberNumNota: TIntegerField;
    qCReceberQuitado: TBooleanField;
    qCReceberCodCli: TIntegerField;
    qCReceberTipoDoc: TStringField;
    qCReceberDtGerado: TDateField;
    qsReceber: TDataSource;
    qCReceberlkNomeCli: TStringField;
    Label5: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    qCReceberFilial: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  fConsLancCReceber: TfConsLancCReceber;

implementation

uses ULancaCReceber, UDM1;

{$R *.DFM}

procedure TfConsLancCReceber.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsLancCReceber.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
  Edit1.Clear;
  Edit2.Clear;
  DateEdit1.Clear;
  if RxDBLookupCombo2.Text <> '' then
    begin
      qCReceber.Active             := False;
      qCReceber.SQL.Clear;
      qCReceber.SQL.ADD('SELECT Filial, NumCReceber, NumNota, Quitado, CodCli, TipoDoc, DtGerado');
      qCReceber.SQL.ADD('FROM "dbCReceber.DB" Dbcreceber');
      qCReceber.SQL.ADD('Where Filial = :F1');
      qCReceber.Params[0].AsInteger := RxDBLookupCombo2.KeyValue;
      qCReceber.SQL.ADD('ORDER BY CodCli');
      qCReceber.Active             := True;
    end;
end;

procedure TfConsLancCReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tCReceber.IndexFieldNames := 'Filial;NumCReceber';
  DM1.tCReceber.FindKey([Dm1.tFilialCodigo.AsInteger,qCReceberNumCReceber.AsInteger]);
  fLancaCReceber.Caption := 'Lançamentos de Contas a Receber ' + Dm1.tFilialEmpresa.AsString;
  Action := Cafree;
end;

procedure TfConsLancCReceber.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qCReceberQuitado.AsBoolean then
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

procedure TfConsLancCReceber.RxDBLookupCombo1Change(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    qCReceber.Locate('CodCli',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
end;

procedure TfConsLancCReceber.Edit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  Edit2.Clear;
  DateEdit1.Clear;
  if RxDBLookupCombo2.Text <> '' then
    begin
      qCReceber.Active             := False;
      qCReceber.SQL.Clear;
      qCReceber.SQL.ADD('SELECT Filial, NumCReceber, NumNota, Quitado, CodCli, TipoDoc, DtGerado');
      qCReceber.SQL.ADD('FROM "dbCReceber.DB" Dbcreceber');
      qCReceber.SQL.ADD('Where Filial = :F1');
      qCReceber.Params[0].AsInteger := RxDBLookupCombo2.KeyValue;
      qCReceber.SQL.ADD('ORDER BY NumCReceber');
      qCReceber.Active             := True;
    end;
end;

procedure TfConsLancCReceber.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
    qCReceber.Locate('NumCReceber',StrToInt(Edit1.Text),[loCaseInsensitive]);
end;

procedure TfConsLancCReceber.Edit2Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  Edit1.Clear;
  DateEdit1.Clear;
  if RxDBLookupCombo2.Text <> '' then
    begin
      qCReceber.Active             := False;
      qCReceber.SQL.Clear;
      qCReceber.SQL.ADD('SELECT Filial, NumCReceber, NumNota, Quitado, CodCli, TipoDoc, DtGerado');
      qCReceber.SQL.ADD('FROM "dbCReceber.DB" Dbcreceber');
      qCReceber.SQL.ADD('Where Filial = :F1');
      qCReceber.Params[0].AsInteger := RxDBLookupCombo2.KeyValue;
      qCReceber.SQL.ADD('ORDER BY NumNota');
      qCReceber.Active             := True;
    end;
end;

procedure TfConsLancCReceber.Edit2Change(Sender: TObject);
begin
  if Edit2.Text <> '' then
    qCReceber.Locate('NumNota',StrToInt(Edit2.Text),[loCaseInsensitive]);
end;

procedure TfConsLancCReceber.DateEdit1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  Edit1.Clear;
  Edit2.Clear;
  if RxDBLookupCombo2.Text <> '' then
    begin
      qCReceber.Active             := False;
      qCReceber.SQL.Clear;
      qCReceber.SQL.ADD('SELECT Filial, NumCReceber, NumNota, Quitado, CodCli, TipoDoc, DtGerado');
      qCReceber.SQL.ADD('FROM "dbCReceber.DB" Dbcreceber');
      qCReceber.SQL.ADD('Where Filial = :F1');
      qCReceber.Params[0].AsInteger := RxDBLookupCombo2.KeyValue;
      qCReceber.SQL.ADD('ORDER BY DtGerado');
      qCReceber.Active             := True;
    end;
end;

procedure TfConsLancCReceber.DateEdit1Change(Sender: TObject);
begin
  if DateEdit1.Text <> '  /  /    ' then
    qCReceber.Locate('DtGerado',DateEdit1.Date,[loCaseInsensitive]);
end;

procedure TfConsLancCReceber.RxDBLookupCombo2Change(Sender: TObject);
begin
  if RxDBLookupCombo2.Text <> '' then
    begin
      qCReceber.Active             := False;
      qCReceber.SQL.Clear;
      qCReceber.SQL.ADD('SELECT Filial, NumCReceber, NumNota, Quitado, CodCli, TipoDoc, DtGerado');
      qCReceber.SQL.ADD('FROM "dbCReceber.DB" Dbcreceber');
      qCReceber.SQL.ADD('Where Filial = :F1');
      qCReceber.Params[0].AsInteger := RxDBLookupCombo2.KeyValue;
      qCReceber.SQL.ADD('ORDER BY CodCli');
      qCReceber.Active             := True;
    end
  else
    ShowMessage('Deve haver uma filial selecionada!');
end;

procedure TfConsLancCReceber.FormShow(Sender: TObject);
begin
  RxDBLookupCombo2.KeyValue := Dm1.tFilialCodigo.AsInteger;
end;

procedure TfConsLancCReceber.RxDBLookupCombo2Exit(Sender: TObject);
begin
  if RxDBLookupCombo2.Text = '' then
    begin
      ShowMessage('Deve haver uma filial seleciona!');
      RxDBLookupCombo2.SetFocus;
    end;
end;

end.
