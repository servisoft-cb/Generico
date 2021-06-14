unit UEstPagamentoPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBFilter, ExtCtrls, DBCtrls, StdCtrls, Grids, DBGrids, Buttons, Variants, DB;

type
  TfEstPagamentoPagar = class(TForm)
    RxDBFilter1: TRxDBFilter;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBGrid1: TDBGrid;
    Bevel3: TBevel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    DBText5: TDBText;
    RxDBFilter2: TRxDBFilter;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    vEstornoOK : Boolean;
    procedure Exclui_Movimento;
  public
    { Public declarations }
  end;

var
  fEstPagamentoPagar: TfEstPagamentoPagar;

implementation

uses UDM1;

{$R *.DFM}

procedure TfEstPagamentoPagar.Exclui_Movimento;
begin
  vEstornoOK := True;
  DM1.tMovimentos.MasterSource.Enabled := False;
  DM1.tMovimentos.Filtered := False;
  DM1.tMovimentos.Filter   := 'NumMovimento = '''+IntToStr(DM1.tCPagarParcHistNumMov.AsInteger)+''' OR NumMovimento = '''+IntToStr(DM1.tCPagarParcHistNumMovJuros.AsInteger)+'''';
  DM1.tMovimentos.Filtered := True;
  while not DM1.tMovimentos.Eof do
  begin
    DM1.tContas.FindKey([DM1.tMovimentosCodConta.AsInteger]);
    if DM1.tMovimentosDtMovimento.AsDateTime <= DM1.tContasDtEncerramento.AsDateTime then
    begin
      vEstornoOK := False;
      DM1.tMovimentos.Last;
    end;
    if vEstornoOK then
      DM1.tMovimentos.Delete;
  end;
  DM1.tMovimentos.Filtered             := False;
  DM1.tMovimentos.MasterSource.Enabled := True;
end;

procedure TfEstPagamentoPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  Action := caFree;
end;

procedure TfEstPagamentoPagar.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfEstPagamentoPagar.FormShow(Sender: TObject);
begin
  DM1.tCPagarParcHist.Refresh;
  DM1.tCPagarParcHist.Last;
end;

procedure TfEstPagamentoPagar.BitBtn3Click(Sender: TObject);
var
  vAux : Boolean;
  vAchouCheque : Boolean;
begin
  DM1.tCPagarParcHist.Last;
  if MessageDlg('Deseja realmente realizar este estorno!',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    vAux := True;
    if Dm1.tCPagarParcHistNumCheque.AsInteger > 0 then
    begin
      vAchouCheque := False;
      Dm1.tCheque.SetKey;
      if (DM1.tCheque.Locate('CodConta;NumCheque',VarArrayOf([Dm1.tCPagarParcCodConta.AsInteger,Dm1.tCPagarParcHistNumCheque.AsInteger]),[locaseinsensitive])) then
      begin
        vAchouCheque := True;
        if (Dm1.tChequeDtEntrada.AsDateTime > 0)then
        begin
          vAux := False;
          ShowMessage('Cheque já compensado!');
        end
        else
        begin
          if DM1.tChequeCPagar.RecordCount > 1 then
          begin
            ShowMessage('Esta duplicata foi paga pelo lançto de cheques!');
            vAux := False;
          end;
        end;
      end;
    end;
    if vaux then
    begin
      Exclui_Movimento;
      if not vEstornoOK then
        ShowMessage('Data de encerramento é maior que a data do movimento financeiro!')
      else
      begin
        if vAchouCheque then
        begin
          DM1.tChequeCPagar.First;
          while not DM1.tChequeCPagar.Eof do
            DM1.tChequeCPagar.Delete;
          Dm1.tCheque.Delete;
        end;

        DM1.tCPagarParc.Edit;
        DM1.tCPagarParcQuitParcCPagar.AsBoolean   := False;
        DM1.tCPagarParcJurosParcCPagar.AsFloat    := DM1.tCPagarParcJurosParcCPagar.AsFloat - DM1.tCPagarParcHistVlrUltJuros.AsFloat;
        if DM1.tCPagarParcHist.RecordCount = 1 then
        begin
          DM1.tCPagarParcJurosParcCPagar.AsFloat := 0;
          DM1.tCPagarParcJurosPagos.AsFloat      := 0;
        end;
        DM1.tCPagarParcRestParcela.AsFloat := DM1.tCPagarParcRestParcela.AsFloat + DM1.tCPagarParcHistVlrUltPgto.AsFloat +
                                              DM1.tCPagarParcHistVlrUltAbatimentos.AsFloat + DM1.tCPagarParcHistVlrUltDescontos.AsFloat;
        DM1.tCPagarParcAbatimentos.AsFloat := DM1.tCPagarParcAbatimentos.AsFloat - DM1.tCPagarParcHistVlrUltAbatimentos.AsFloat;
        DM1.tCPagarParcDesconto.AsFloat    := DM1.tCPagarParcDesconto.AsFloat - DM1.tCPagarParcHistVlrUltDescontos.AsFloat;
        DM1.tCPagarParcDespesas.AsFloat    := DM1.tCPagarParcDespesas.AsFloat - DM1.tCPagarParcHistVlrUltDespesas.AsFloat;
        DM1.tCPagarParcPgtoParcial.AsFloat := DM1.tCPagarParcPgtoParcial.AsFloat - DM1.tCPagarParcHistVlrUltPgto.AsFloat;
        DM1.tCPagarParcHist.Delete;
        if DM1.tCPagarParcHist.Eof then
        begin
          DM1.tCPagarParcDtPagParcCPagar.Clear;
          DM1.tCPagarParcPgtoParcial.Clear;
        end
        else
          DM1.tCPagarParcDtPagParcCPagar.AsDateTime   := DM1.tCPagarParcHistDtUltPgto.AsDateTime;
        DM1.tCPagarParc.Post;
      end;
    end;
  end;
  Close;
end;

procedure TfEstPagamentoPagar.BitBtn2Click(Sender: TObject);
var
  vVlrUltPgto : Currency;
begin
  DM1.tCPagarParcHist.Last;
  if MessageDlg('Deseja realmente realizar este estorno?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      DM1.tCPagarParc.Edit;
      DM1.tCPagarParcQuitParcCPagar.AsBoolean := False;
      DM1.tCPagarParcRestParcela.AsFloat      := DM1.tCPagarParcRestParcela.AsFloat + DM1.tCPagarParcHistVlrDevolucao.AsFloat;
      vVlrUltPgto                             := DM1.tCPagarParcHistVlrDevolucao.AsFloat;
      DM1.tCPagarParcHist.Delete;
      if DM1.tCPagarParcHist.Eof then
        DM1.tCPagarParcVlrDevolucao.Clear
      else
        DM1.tCPagarParcVlrDevolucao.AsFloat := DM1.tCPagarParcVlrDevolucao.AsFloat - vVlrUltPgto;
      DM1.tCPagarParc.Post;
    end;
  Close;
end;

end.
