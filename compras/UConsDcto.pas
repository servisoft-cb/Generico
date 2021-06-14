unit UConsDcto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, DBTables, Grids, DBGrids, RXDBCtrl, Mask, ToolEdit,
  StdCtrls, Buttons, RxLookup;

type
  TfConsDcto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    qDctoEst: TQuery;
    qsDctoEst: TDataSource;
    qDctoEstNumDcto: TIntegerField;
    qDctoEstData: TDateField;
    qDctoEstUsuario: TStringField;
    qDctoEstTipo: TStringField;
    qDctoEstTotal: TFloatField;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    Label3: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    RxDBGrid2: TRxDBGrid;
    tDctoEstItem: TTable;
    dsDctoEstItem: TDataSource;
    tDctoEstItemNumDcto: TIntegerField;
    tDctoEstItemItem: TIntegerField;
    tDctoEstItemCodMaterial: TIntegerField;
    tDctoEstItemCodCor: TIntegerField;
    tDctoEstItemCodGrade: TIntegerField;
    tDctoEstItemUnidade: TStringField;
    tDctoEstItemQtd: TFloatField;
    tDctoEstItemVlrUnit: TFloatField;
    tDctoEstItemVlrTotal: TFloatField;
    tDctoEstItemNumMovEst: TIntegerField;
    tDctoEstItemlkReferencia: TStringField;
    tDctoEstItemlkNomeProduto: TStringField;
    tDctoEstItemlkNomeCor: TStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label4: TLabel;
    qDctoEstFilial: TIntegerField;
    tDctoEstItemFilial: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DateEdit1Enter(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure qDctoEstBeforeClose(DataSet: TDataSet);
    procedure qDctoEstAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsDcto: TfConsDcto;

implementation

uses UDctoEst, UDM1;

{$R *.DFM}

procedure TfConsDcto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tDctoEst.FindKey([qDctoEstFilial.AsInteger,qDctoEstNumDcto.AsInteger]);
  qDctoEst.Close;
  Action := Cafree;
end;

procedure TfConsDcto.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsDcto.Edit1Enter(Sender: TObject);
begin
  Edit2.Clear;
  DateEdit1.Clear;
  qDctoEst.Active := False;
  qDctoEst.SQL.Clear;
  qDctoEst.SQL.Add('SELECT Filial, NumDcto, Data, Usuario, Tipo, Total');
  qDctoEst.SQL.Add('FROM "dbDctoEst.DB" Dbdctoest');
  qDctoEst.SQL.Add('WHERE Filial = :Filial');
  qDctoEst.Params[0].AsInteger := RxDBLookupCombo1.KeyValue;
  qDctoEst.SQL.Add('ORDER BY NumDcto');
  qDctoEst.Active := True;
end;

procedure TfConsDcto.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
    qDctoEst.Locate('NumDcto',StrToInt(Edit1.Text),[loCaseInsensitive]);
end;

procedure TfConsDcto.DateEdit1Enter(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  qDctoEst.Active := False;
  qDctoEst.SQL.Clear;
  qDctoEst.SQL.Add('SELECT Filial, NumDcto, Data, Usuario, Tipo, Total');
  qDctoEst.SQL.Add('FROM "dbDctoEst.DB" Dbdctoest');
  qDctoEst.SQL.Add('WHERE Filial = :Filial');
  qDctoEst.Params[0].AsInteger := RxDBLookupCombo1.KeyValue;
  qDctoEst.SQL.Add('ORDER BY Data');
  qDctoEst.Active := True;
end;

procedure TfConsDcto.DateEdit1Change(Sender: TObject);
begin
  if DateEdit1.Text <> '  /  /    ' then
    qDctoEst.Locate('Data',DateEdit1.Date,[loCaseInsensitive]);
end;

procedure TfConsDcto.Edit2Enter(Sender: TObject);
begin
  Edit1.Clear;
  DateEdit1.Clear;
  qDctoEst.Active := False;
  qDctoEst.SQL.Clear;
  qDctoEst.SQL.Add('SELECT Filial, NumDcto, Data, Usuario, Tipo, Total');
  qDctoEst.SQL.Add('FROM "dbDctoEst.DB" Dbdctoest');
  qDctoEst.SQL.Add('WHERE Filial = :Filial');
  qDctoEst.Params[0].AsInteger := RxDBLookupCombo1.KeyValue;
  qDctoEst.SQL.Add('ORDER BY Usuario');
  qDctoEst.Active := True;
end;

procedure TfConsDcto.Edit2Change(Sender: TObject);
begin
  if Edit2.Text <> '' then
    qDctoEst.Locate('Usuario',Edit2.Text,[loCaseInsensitive]);
end;

procedure TfConsDcto.RxDBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TfConsDcto.qDctoEstBeforeClose(DataSet: TDataSet);
begin
  RxDBGrid2.DataSource := nil;
end;

procedure TfConsDcto.qDctoEstAfterOpen(DataSet: TDataSet);
begin
 RxDBGrid2.DataSource := dsDctoEstItem;
end;

procedure TfConsDcto.FormShow(Sender: TObject);
begin
  RxDBLookupCombo1.KeyValue := Dm1.tFilialCodigo.AsInteger;
end;

procedure TfConsDcto.RxDBLookupCombo1Change(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    begin
      qDctoEst.Close;
      qDctoEst.Params[0].AsInteger := RxDBLookupCombo1.KeyValue;
      qDctoEst.Open;
    end
  else
    ShowMEssage('Deve haver uma filial selecionada!');  
end;

end.
