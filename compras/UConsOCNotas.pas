unit UConsOCNotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXCtrls, Mask, ToolEdit, CurrEdit, Grids, DBGrids, RXDBCtrl,
  Db, DBTables, Buttons, ExtCtrls;

type
  TfConsOCNotas = class(TForm)
    RxLabel1: TRxLabel;
    CurrencyEdit1: TCurrencyEdit;
    RxLabel2: TRxLabel;
    Edit1: TEdit;
    qNotas: TQuery;
    qNotasFilial: TIntegerField;
    qNotasCodForn: TIntegerField;
    qNotasNumNEntr: TIntegerField;
    qNotasCodMaterial: TIntegerField;
    qNotasNome: TStringField;
    qNotasReferencia: TStringField;
    qNotasItem: TSmallintField;
    qNotasNumOC: TIntegerField;
    qNotasItemOC: TIntegerField;
    qNotasQtd: TFloatField;
    qNotasVlrUnit: TFloatField;
    qNotasVlrTotalItens: TFloatField;
    qNotasTamanho: TStringField;
    qNotasCodCor: TIntegerField;
    dsqNotas: TDataSource;
    RxDBGrid1: TRxDBGrid;
    qNotaslkNomeCor: TStringField;
    BitBtn6: TBitBtn;
    Bevel1: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsOCNotas: TfConsOCNotas;

implementation

uses UDM1;

{$R *.DFM}

procedure TfConsOCNotas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qNotas.Close;
  Action := Cafree;
end;

procedure TfConsOCNotas.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsOCNotas.FormShow(Sender: TObject);
begin
  CurrencyEdit1.AsInteger := DM1.tOrdemCompraCodigo.AsInteger;
  Edit1.Text              := DM1.tOrdemCompralkFornecedor.AsString;
  qNotas.Close;
  qNotas.ParamByName('Filial').AsInteger := DM1.tOrdemCompraFilial.AsInteger;
  qNotas.ParamByName('NumOC').AsInteger  := DM1.tOrdemCompraCodigo.AsInteger;
  qNotas.Open;
end;

end.
