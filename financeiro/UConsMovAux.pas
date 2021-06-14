unit UConsMovAux;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, StdCtrls, Buttons, ExtCtrls, DB,
  DBTables;

type
  TfConsMovAux = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    qMovimento: TQuery;
    qMovimentoCodConta: TIntegerField;
    qMovimentoNumMovimento: TIntegerField;
    qMovimentoNumCReceber: TIntegerField;
    qMovimentoNumCPagar: TIntegerField;
    qMovimentoNumPedVenda: TIntegerField;
    qMovimentoDtMovimento: TDateField;
    qMovimentoVlrMovDebito: TFloatField;
    qMovimentoVlrMovCredito: TFloatField;
    qMovimentoHistorico: TStringField;
    qMovimentoNumChequePag: TIntegerField;
    qMovimentoPlanoContas: TIntegerField;
    qMovimentoNumNota: TIntegerField;
    qMovimentoCodCli: TIntegerField;
    qMovimentoCodForn: TIntegerField;
    qMovimentoNumNotaEnt: TIntegerField;
    qMovimentoSaldoCliente: TFloatField;
    qMovimentoSaldoFornecedor: TFloatField;
    qMovimentoSaldoPlanoContas: TFloatField;
    qMovimentoSaldoConta: TFloatField;
    qMovimentoCodPlanoContasItens: TIntegerField;
    qMovimentoCpagarHist: TIntegerField;
    qMovimentoFilial: TIntegerField;
    qMovimentoParcela: TIntegerField;
    qMovimentoDtUsuario: TDateField;
    qMovimentoHrUsuario: TTimeField;
    qMovimentoUsuario: TStringField;
    dsqMovimento: TDataSource;
    qMovimentonomeconta: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsMovAux: TfConsMovAux;

implementation

uses UMovimentos2, uMovimentosIns, UDM1;

{$R *.dfm}

procedure TfConsMovAux.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConsMovAux.BitBtn1Click(Sender: TObject);
begin
  qMovimento.Close;
  qMovimento.Open;
end;

procedure TfConsMovAux.SMDBGrid1DblClick(Sender: TObject);
var
  vExiste : Boolean;
begin
  if not qMovimento.Active then
    exit;
  if qMovimentoNumMovimento.AsInteger <= 0 then
    exit;

  vExiste := True;  

  if qMovimentoCodConta.AsInteger > 0 then
  begin
    if DM1.tContas.Locate('CodConta',qMovimentoCodConta.AsInteger,[loCaseInsensitive]) then
    begin
      if DM1.tMovimentos.Locate('NumMovimento',qMovimentoNumMovimento.AsInteger,[loCaseInsensitive]) then
        vExiste := True;
      if (vExiste) and (qMovimentoDtMovimento.AsDateTime <= DM1.tContasDtEncerramento.AsDateTime) then
      begin
        ShowMessage('Data de encerramento ' + DM1.tContasDtEncerramento.AsString + ', é maior que a informada!');
        vExiste := False;
      end;
    end;
  end;

  if vExiste then
  begin
    fMovimentos2.BitBtn16.Tag := 1;
    fMovimentosIns := TfMovimentosIns.Create(Self);
    fMovimentosIns.ShowModal;
    fMovimentos2.BitBtn16.Tag := 0;
  end;
end;

end.
