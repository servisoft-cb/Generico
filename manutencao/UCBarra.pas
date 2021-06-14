unit UCBarra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, RxLookup, Buttons;

type
  TfCBarra = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    qCor: TQuery;
    qCorNomeCor: TStringField;
    qCorCodCor: TIntegerField;
    dsqCor: TDataSource;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCBarra: TfCBarra;

implementation

uses UDM1;

{$R *.dfm}

procedure TfCBarra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qCor.Close;
  Action := Cafree;
end;

procedure TfCBarra.FormShow(Sender: TObject);
begin
  qCor.Close;
  qCor.ParamByName('CodProduto').AsInteger := DM1.tProdutoCodigo.AsInteger;
  qCor.Open;
end;

procedure TfCBarra.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfCBarra.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if Trim(Edit1.Text) = '' then
  begin
    ShowMessage('Cód. de barra não informado!');
    exit;
  end;
  if qCor.IsEmpty then
    RxDBLookupCombo1.ClearValue;

  if not(qCor.IsEmpty) and (RxDBLookupCombo1.Text = '') then
  begin
    ShowMessage('Cor não informada!');
    exit;
  end;

  if DM1.tCBarra.Locate('CodBarra',Trim(Edit1.Text),[loCaseInsensitive]) then
  begin
    ShowMessage('Cód. de barra já gravado no produto ' + DM1.tCBarraCodProduto.AsString);
    exit;
  end;

  if RxDBLookupCombo1.Text <> '' then
    vCodAux := RxDBLookupCombo1.KeyValue
  else
    vCodAux := 0;

  if DM1.tCBarra.Locate('CodProduto;CodCor',VarArrayOf([DM1.tProdutoCodigo.AsInteger,vCodAux]),[loCaseInsensitive]) then
  begin
    ShowMessage('Produto/Cor já lançado!');
    exit;
  end;

  if DM1.tCBarra.Locate('CodBarra',Trim(Edit1.Text),[loCaseInsensitive]) then
  begin
    ShowMessage('Cód. de barra já gravado no produto ' + DM1.tCBarraCodProduto.AsString);
    exit;
  end;

  DM1.tCBarra.Insert;
  DM1.tCBarraCodBarra.AsString := Trim(Edit1.Text);
  DM1.tCBarraCodProduto.AsInteger := DM1.tProdutoCodigo.AsInteger;
  DM1.tCBarraCodCor.AsInteger     := 0;
  if RxDBLookupCombo1.Text <> '' then
    DM1.tCBarraCodCor.AsInteger   := RxDBLookupCombo1.KeyValue;
  DM1.tCBarraCodGrade.AsInteger     := 0;
  DM1.tCBarraPosicao.AsInteger      := 0;
  DM1.tCBarraTamanho.AsString       := '';
  DM1.tCBarraCodPrincipal.AsInteger := 0;
  DM1.tCBarraCodSeq.AsInteger       := 0;
  DM1.tCBarra.Post;
  Close;
end;

end.
