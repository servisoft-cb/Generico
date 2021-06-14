unit UEstPagamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DBFilter, ExtCtrls, DBCtrls, StdCtrls, Grids, DBGrids,
  Buttons;

type
  TfEstPagamento = class(TForm)
    RxDBFilter1: TRxDBFilter;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText6: TDBText;
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
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    vEstornoOK : Boolean;

    procedure DesFaz_ExtComissao;
    procedure Exclui_Movimento;
  public
    { Public declarations }
  end;

var
  fEstPagamento: TfEstPagamento;

implementation

uses UDM1;

{$R *.DFM}

procedure TfEstPagamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  Action := caFree;
end;

procedure TfEstPagamento.DesFaz_ExtComissao;
begin
  if DM1.tCReceberParcHistNroLancExtComissao.AsInteger > 0 then
  begin
    DM1.tExtComissao.SetKey;
    DM1.tExtComissaoNroLancamento.AsInteger := DM1.tCReceberParcHistNroLancExtComissao.AsInteger;
    if DM1.tExtComissao.GotoKey then
    begin
      if DM1.tCReceberParcComissaoItem.AsBoolean then
        DM1.tCReceberParcVlrComissaoRestante.AsFloat := DM1.tCReceberParcVlrComissaoRestante.AsFloat + DM1.tExtComissaoVlrComissao.AsFloat;
      DM1.tExtComissao.Delete;
    end;
  end;
end;

procedure TfEstPagamento.Exclui_Movimento;
begin
  vEstornoOK := True;
  DM1.tMovimentos.MasterSource.Enabled    := False;
  DM1.tMovimentos.Filtered := False;
  DM1.tMovimentos.Filter   := 'NumMovimento = '''+IntToStr(DM1.tCReceberParcHistNumMov.AsInteger)+''' OR NumMovimento = '''+IntToStr(DM1.tCReceberParcHistNumMovJuros.AsInteger)+'''';
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
  DM1.tMovimentos.Filtered := False;
  DM1.tMovimentos.MasterSource.Enabled    := True;
end;

procedure TfEstPagamento.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfEstPagamento.FormShow(Sender: TObject);
begin
  DM1.tCReceberParcHist.Refresh;
  DM1.tCReceberParcHist.Last;
end;

procedure TfEstPagamento.BitBtn3Click(Sender: TObject);
var
  vVlrUltPgto : Currency;
begin
  DM1.tCReceberParcHist.Last;
  if MessageDlg('Deseja realmente realizar este estorno!',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    Exclui_Movimento;
    if not vEstornoOK then
      ShowMessage('Data de encerramento é maior que a data do movimento financeiro!')
    else
    begin
      DM1.tCReceberParc.Edit;
      DM1.tCReceberParcPgCartorio.Clear;
      DM1.tCReceberParcQuitParcCReceber.AsBoolean := False;
      DM1.tCReceberParcJurosPagos.AsFloat         := DM1.tCReceberParcJurosPagos.AsFloat - DM1.tCReceberParcHistJurosPagos.AsFloat;
      DM1.tCReceberParcJurosParcCReceber.AsFloat  := DM1.tCReceberParcJurosParcCReceber.AsFloat - DM1.tCReceberParcHistJurosCalc.AsFloat;
      if DM1.tCReceberParcHist.RecordCount = 1 then
      begin
        DM1.tCReceberParcJurosParcCReceber.AsFloat := 0;
        DM1.tCReceberParcJurosPagos.AsFloat        := 0;
      end;
      DM1.tCReceberParcRestParcela.AsFloat := DM1.tCReceberParcRestParcela.AsFloat + DM1.tCReceberParcHistVlrUltPgto.AsFloat + DM1.tCReceberParcHistVlrUltDescontos.AsFloat;
      DM1.tCReceberParcDesconto.AsFloat    := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDesconto.AsFloat - DM1.tCReceberParcHistVlrUltDescontos.AsFloat));
      vVlrUltPgto := DM1.tCReceberParcHistVlrUltPgto.AsCurrency;
      DesFaz_ExtComissao;
      DM1.tCReceberParcHist.Delete;
      if DM1.tCReceberParcHist.Eof then
      begin
        DM1.tCReceberParcDtPagParcCReceber.Clear;
        DM1.tCReceberParcPgtoParcial.Clear;
      end
      else
      begin
        DM1.tCReceberParcAbatimentos.AsFloat          := DM1.tCReceberParcHistVlrUltAbatimentos.AsFloat;
        DM1.tCReceberParcDesconto.AsFloat             := DM1.tCReceberParcHistVlrUltDescontos.AsFloat;
        DM1.tCReceberParcDespesas.AsFloat             := DM1.tCReceberParcHistVlrUltDespesas.AsFloat;
        DM1.tCReceberParcDtPagParcCReceber.AsDateTime := DM1.tCReceberParcHistDtUltPgto.AsDateTime;
        DM1.tCReceberParcPgtoParcial.AsFloat          := DM1.tCReceberParcPgtoParcial.AsFloat - vVlrUltPgto;
      end;
      DM1.tCReceberParc.Post;
    end;
  end;
  Close;
end;

procedure TfEstPagamento.BitBtn2Click(Sender: TObject);
var
  vVlrUltPgto : Currency;
begin
  DM1.tCReceberParcHist.Last;
  if MessageDlg('Deseja realmente realizar este estorno?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      DM1.tCReceberParc.Edit;
      DM1.tCReceberParcQuitParcCReceber.AsBoolean := False;
      DM1.tCReceberParcRestParcela.AsFloat        := DM1.tCReceberParcRestParcela.AsFloat + DM1.tCReceberParcHistVlrDevolucao.AsFloat;
      vVlrUltPgto                                 := DM1.tCReceberParcHistVlrDevolucao.AsFloat;
      DM1.tCReceberParcHist.Delete;
      if DM1.tCReceberParcHist.Eof then
        DM1.tCReceberParcVlrDevolucao.Clear
      else
        DM1.tCReceberParcVlrDevolucao.AsFloat := DM1.tCReceberParcVlrDevolucao.AsFloat - vVlrUltPgto;
      DM1.tCReceberParc.Post;
    end;
  Close;
end;

procedure TfEstPagamento.BitBtn4Click(Sender: TObject);
var
  vVlrUltPgto : Currency;
begin
  DM1.tCReceberParcHist.Last;
  if MessageDlg('Deseja realmente realizar este estorno?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    Exclui_Movimento;
    if not vEstornoOK then
      ShowMessage('Data de encerramento é maior que a data do movimento financeiro!')
    else
    begin
      {DM1.tCReceberParc.Edit;
      DM1.tCReceberParcPgCartorio.Clear;
      DM1.tCReceberParcQuitParcCReceber.AsBoolean := False;
      DM1.tCReceberParcJurosPagos.AsFloat         := DM1.tCReceberParcJurosPagos.AsFloat - DM1.tCReceberParcHistJurosPagos.AsFloat;
      DM1.tCReceberParcJurosParcCReceber.AsFloat  := DM1.tCReceberParcJurosParcCReceber.AsFloat - DM1.tCReceberParcHistJurosCalc.AsFloat;
      if DM1.tCReceberParcHist.RecordCount = 1 then
        begin
          DM1.tCReceberParcJurosParcCReceber.AsFloat := 0;
          DM1.tCReceberParcJurosPagos.AsFloat        := 0;
        end;
      DM1.tCReceberParcRestParcela.AsFloat := DM1.tCReceberParcRestParcela.AsFloat + DM1.tCReceberParcHistVlrUltPgto.AsFloat + DM1.tCReceberParcHistVlrUltDescontos.AsFloat;
      DM1.tCReceberParcDesconto.AsFloat    := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDesconto.AsFloat - DM1.tCReceberParcHistVlrUltDescontos.AsFloat));
      vVlrUltPgto := DM1.tCReceberParcHistVlrUltPgto.AsCurrency;}
      if MessageDlg('Desfazer comissão?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        DesFaz_ExtComissao;
      DM1.tCReceberParcHist.Delete;
      {if DM1.tCReceberParcHist.Eof then
        begin
          DM1.tCReceberParcDtPagParcCReceber.Clear;
          DM1.tCReceberParcPgtoParcial.Clear;
        end
      else
        begin
          DM1.tCReceberParcAbatimentos.AsFloat          := DM1.tCReceberParcHistVlrUltAbatimentos.AsFloat;
          DM1.tCReceberParcDesconto.AsFloat             := DM1.tCReceberParcHistVlrUltDescontos.AsFloat;
          DM1.tCReceberParcDespesas.AsFloat             := DM1.tCReceberParcHistVlrUltDespesas.AsFloat;
          DM1.tCReceberParcDtPagParcCReceber.AsDateTime := DM1.tCReceberParcHistDtUltPgto.AsDateTime;
          DM1.tCReceberParcPgtoParcial.AsFloat          := DM1.tCReceberParcPgtoParcial.AsFloat - vVlrUltPgto;
        end;
      DM1.tCReceberParc.Post;}
    end;
  end;
  Close;
end;

procedure TfEstPagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
    BitBtn4.Enabled := not BitBtn4.Enabled;
end;

end.
