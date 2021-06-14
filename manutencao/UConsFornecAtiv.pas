unit UConsFornecAtiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RxLookup, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Db,
  DBTables;

type
  TfConsFornecAtiv = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn1: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    Query1: TQuery;
    dsQuery1: TDataSource;
    Query1NomeForn: TStringField;
    Query1EndForn: TStringField;
    Query1BairroForn: TStringField;
    Query1CidadeForn: TStringField;
    Query1EstadoForn: TStringField;
    Query1Tel1Forn: TStringField;
    Query1FaxForn: TStringField;
    Query1ContatoForn: TStringField;
    Query1CodAtiv: TIntegerField;
    Query1Nome: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsFornecAtiv: TfConsFornecAtiv;

implementation

uses UDM1;

{$R *.DFM}

procedure TfConsFornecAtiv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tAtividade.Close;
  Action := Cafree;
end;

procedure TfConsFornecAtiv.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tAtividade.IndexFieldNames := 'Nome';
end;

procedure TfConsFornecAtiv.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tAtividade.IndexFieldNames := 'Codigo';
end;

procedure TfConsFornecAtiv.BitBtn1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    begin
      Query1.Active   := False;
      Query1.Active   := True;
      Query1.Filtered := False;
      Query1.Filter   := 'CodAtiv = '''+IntToStr(RxDBLookupCombo1.KeyValue)+'''';
      Query1.Filtered := True;
    end
  else
    begin
      ShowMessage('Deve ser escolhido uma "Atividade" p/ executar a consulta!');
      RxDBLookupCombo1.SetFocus;
    end;
end;

procedure TfConsFornecAtiv.SpeedButton1Click(Sender: TObject);
begin
  Query1.Active := False;
  RxDBLookupCombo1.ClearValue;
  RxDBLookupCombo1.SetFocus;
end;

procedure TfConsFornecAtiv.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsFornecAtiv.FormShow(Sender: TObject);
begin
  DM1.tAtividade.Open;
end;

end.
