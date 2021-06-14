unit UMovimentos2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, RXLookup, Grids, DBGrids,
  RXDBCtrl, ToolEdit, Mask, RXCtrls, Db, DBTables, MemTable, DBFilter, Menus, SMDBGrid;

type
  TfMovimentos2 = class(TForm)
    Panel1: TPanel;
    Panel7: TPanel;
    RxLabel3: TRxLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn6: TBitBtn;
    qContas: TQuery;
    qContasCodConta: TIntegerField;
    qContasNomeConta: TStringField;
    qContasNumConta: TStringField;
    qContasFilial: TIntegerField;
    qContasVlrMovDebito: TFloatField;
    qContasVlrMovCredito: TFloatField;
    qContasclVlrMovimento: TFloatField;
    dsqContas: TDataSource;
    SMDBGrid2: TSMDBGrid;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label2: TLabel;
    qContasTipoConta: TStringField;
    BitBtn16: TBitBtn;
    tMovimentos2: TTable;
    dsMovimentos2: TDataSource;
    tMovimentos2CodConta: TIntegerField;
    tMovimentos2NumMovimento: TAutoIncField;
    tMovimentos2NumCReceber: TIntegerField;
    tMovimentos2NumCPagar: TIntegerField;
    tMovimentos2NumPedVenda: TIntegerField;
    tMovimentos2DtMovimento: TDateField;
    tMovimentos2VlrMovDebito: TFloatField;
    tMovimentos2VlrMovCredito: TFloatField;
    tMovimentos2Historico: TStringField;
    tMovimentos2NumChequePag: TIntegerField;
    tMovimentos2PlanoContas: TIntegerField;
    tMovimentos2NumNota: TIntegerField;
    tMovimentos2CodCli: TIntegerField;
    tMovimentos2CodForn: TIntegerField;
    tMovimentos2NumNotaEnt: TIntegerField;
    tMovimentos2SaldoCliente: TFloatField;
    tMovimentos2SaldoFornecedor: TFloatField;
    tMovimentos2SaldoPlanoContas: TFloatField;
    tMovimentos2SaldoConta: TFloatField;
    tMovimentos2CodPlanoContasItens: TIntegerField;
    qSaldoAnt: TQuery;
    qSaldoAntCodConta: TIntegerField;
    qSaldoAntVlrMovDebito: TFloatField;
    qSaldoAntVlrMovCredito: TFloatField;
    qSaldoAntclVlrMovimento: TFloatField;
    BitBtn7: TBitBtn;
    CheckBox1: TCheckBox;
    RxDBFilter1: TRxDBFilter;
    Panel2: TPanel;
    SMDBGrid1: TSMDBGrid;
    BitBtn8: TBitBtn;
    qContasDtEncerramento: TDateField;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure qContasCalcFields(DataSet: TDataSet);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure qSaldoAntCalcFields(DataSet: TDataSet);
    procedure BitBtn7Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure qContasAfterScroll(DataSet: TDataSet);
    procedure SMDBGrid2FilterChanged(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
  private
    { Private declarations }
    vExiste : Boolean;
    
    procedure Monta_Saldo;
    procedure Posiciona_Tabela;
  public
    vSaldoPedido : Real;
    //function SaldoGeral : Real;
    { Public declarations }

  end;

var
  fMovimentos2: TfMovimentos2;

implementation

uses UDM1, UContas, UFluxoFuturo, uMovimentosIns, URelMovimento, UConsSaldos, UMovimentosEnc, UConsMovFinanceiro,
  UConsMovAux;//, UConsMovAux;

{$R *.DFM}

{Function TfMovimentos2.SaldoGeral : Real;
var
  Saldo : Real;
begin
  Saldo := 0;
  SaldoGeral := Saldo;
end;}

procedure TfMovimentos2.Posiciona_Tabela;
begin
  vExiste := False;
  if qContasCodConta.AsInteger > 0 then
  begin
    if DM1.tContas.Locate('CodConta',qContasCodConta.AsInteger,[loCaseInsensitive]) then
    begin
      if (tMovimentos2NumMovimento.AsInteger > 0) and
         (tMovimentos2DtMovimento.AsDateTime > 0) and
         (DM1.tMovimentos.Locate('NumMovimento',tMovimentos2NumMovimento.AsInteger,[loCaseInsensitive])) then
        vExiste := True;
      if (vExiste) and (tMovimentos2DtMovimento.AsDateTime <= DM1.tContasDtEncerramento.AsDateTime) then
      begin
        ShowMessage('Data de encerramento ' + DM1.tContasDtEncerramento.AsString + ', é maior que a informada!');
        vExiste := False;
      end;
    end;
  end;
end;

procedure TfMovimentos2.Monta_Saldo;
begin
  Saldo := 0;
  qContas.First;
  While not qContas.EOF do
    begin
      if qContasTipoConta.AsString <> 'O' then //Foi colocado este if para não somar os saldos dos tipos iguais a O (por exemplo o ICMS)
        Saldo := Saldo + qContasclVlrMovimento.AsFloat;
      qContas.Next;
    end;
  Label7.Caption := FormatFloat('###,###,##0.00',Saldo);
end;

procedure TfMovimentos2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qContas.Close;
  qSaldoAnt.Close;
  if Screen.FormCount < 3 then
    begin
      RxDBFilter1.Active := False;
      DM1.tMovimentos.Close;
      DM1.tPlanoContas.Close;
      DM1.tPlanoContasItens.Close;
      DM1.tPedido.Close;
      DM1.tCondPgto.Close;
      DM1.tCondPgtoItem.Close;
      DM1.tProduto.Close;
    end;
  Action := Cafree;
end;

procedure TfMovimentos2.FormShow(Sender: TObject);
begin
  Top   := 0;
  Left  := 0;
  Width := Screen.Width;
  Height := Screen.Height - 35;
  qContas.Open;
  RxDBFilter1.Active := True;
  DM1.tMovimentos.Refresh;
  DM1.tMovimentos.Last;
  tMovimentos2.Refresh;
  tMovimentos2.Last;
  qContas.Close;
  qContas.Open;
  Monta_Saldo;

  DM1.tContas.First;
end;

procedure TfMovimentos2.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
    begin
      Posiciona_Tabela;
      if vExiste then
        DM1.tMovimentos.Delete;
      DM1.tMovimentos.Refresh;
      tMovimentos2.Refresh;
    end;
end;

procedure TfMovimentos2.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioEntrMov.AsBoolean then
  begin
    BitBtn16.Tag   := 0;
    fMovimentosIns := TfMovimentosIns.Create(Self);
    fMovimentosIns.ShowModal;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfMovimentos2.BitBtn3Click(Sender: TObject);
begin
  if DateEdit1.Date < 1 then
  begin
    ShowMessage('Deve ser informada uma data para a impressão!');
    exit;
  end;
  
  qSaldoAnt.Close;
  qSaldoAnt.ParamByName('Data').AsDate := DateEdit1.Date;
  qSaldoAnt.Open;

  tMovimentos2.Filtered := False;
  tMovimentos2.Filter   := 'DtMovimento >= '''+DateEdit1.Text+''' and DtMovimento <= '''+DateEdit2.Text+'''';
  tMovimentos2.Filtered := True;
  tMovimentos2.First;

  fRelMovimento := TfRelMovimento.Create(Self);
  fRelMovimento.RLReport1.Preview;
  fRelMovimento.RLReport1.Free;

  tMovimentos2.Filtered := False;
end;

procedure TfMovimentos2.FormCreate(Sender: TObject);
begin
  DM1.tContas.Open;
  DM1.tMovimentos.Open;
  DM1.tPlanoContas.Open;
  DM1.tPlanoContasItens.Open;
  DM1.tPedido.Open;
  DM1.tCondPgto.Open;
  DM1.tCondPgtoItem.Open;
  DM1.tProduto.Open;
end;

procedure TfMovimentos2.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfMovimentos2.BitBtn5Click(Sender: TObject);
begin
  fFluxoFuturo := TfFluxoFuturo.Create(Self);
  fFluxoFuturo.CurrencyEdit5.Text := Label7.Caption;
  fFluxoFuturo.ShowModal;
end;

procedure TfMovimentos2.BitBtn12Click(Sender: TObject);
begin
  if DM1.tUsuarioContas.AsBoolean then
    begin
      Application.CreateForm(TfContas,fContas);
      fContas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfMovimentos2.qContasCalcFields(DataSet: TDataSet);
begin
  qContasclVlrMovimento.AsFloat := qContasVlrMovCredito.AsFloat - qContasVlrMovDebito.AsFloat;
end;

procedure TfMovimentos2.BitBtn6Click(Sender: TObject);
var
  vCodigoAux : Integer;
begin
  vCodigoAux := qContasCodConta.AsInteger;
  qContas.Close;
  qContas.Open;
  Monta_Saldo;
  tMovimentos2.Refresh;
  tMovimentos2.Last;
  qContas.Locate('CodConta',vCodigoAux,[loCaseInsensitive]);
end;

procedure TfMovimentos2.BitBtn16Click(Sender: TObject);
begin
  if DM1.tUsuarioEntrMov.AsBoolean then
  begin
    BitBtn16.Tag := 1;
    Posiciona_Tabela;
    if vExiste then
    begin
      fMovimentosIns := TfMovimentosIns.Create(Self);
      fMovimentosIns.ShowModal;
    end;
    BitBtn16.Tag := 0;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfMovimentos2.qSaldoAntCalcFields(DataSet: TDataSet);
begin
  qSaldoAntclVlrMovimento.AsFloat := qSaldoAntVlrMovCredito.AsFloat - qSaldoAntVlrMovDebito.AsFloat;
end;

procedure TfMovimentos2.BitBtn7Click(Sender: TObject);
begin
  fConsSaldos := TfConsSaldos.Create(Self);
  fConsSaldos.ShowModal;
end;

procedure TfMovimentos2.CheckBox1Click(Sender: TObject);
begin
  RxDBFilter1.Active := not(CheckBox1.Checked);
end;

procedure TfMovimentos2.qContasAfterScroll(DataSet: TDataSet);
begin
  tMovimentos2.Last;
end;

procedure TfMovimentos2.SMDBGrid2FilterChanged(Sender: TObject);
begin
  if qContas.Active then
    Monta_Saldo;
end;

procedure TfMovimentos2.BitBtn8Click(Sender: TObject);
begin
  if not DM1.tUsuarioEncerrarContaPeriodo.AsBoolean then
    ShowMessage('Usuário ' + DM1.tUsuarioUsuario.AsString + ', não autorizado a usar este processo!')
  else
  begin
    fMovimentosEnc := TfMovimentosEnc.Create(Self);
    fMovimentosEnc.ShowModal;
  end;
end;

procedure TfMovimentos2.BitBtn9Click(Sender: TObject);
begin
  fConsMovFinanceiro := TfConsMovFinanceiro.Create(Self);
  fConsMovFinanceiro.ShowModal;
end;

procedure TfMovimentos2.BitBtn10Click(Sender: TObject);
begin
  fConsMovAux := TfConsMovAux.Create(Self);
  fConsMovAux.ShowModal;
end;

end.
