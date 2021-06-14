unit UGeracoes;

interface

uses
  SysUtils, DB, DBTables, UDm1, UEscImpressora, Variants, Dialogs;

  procedure Grava_CReceber;
  procedure Grava_CReceberParc(Valor : Real ; DtVencimento : TDateTime; Parcela : Integer; Transf : Boolean);
  procedure Cancela_CReceber(Tipo : String); //C=Cancela   E=Exclui

  function Verifica_CReceber : Boolean;

Var
  vCodConta, vCodTipoCobranca : Integer;
  vPercComissao, vPercComissao2 : Real;

implementation

function Verifica_CReceber : Boolean;
begin
  Result := True;
  DM1.tCReceber.Filtered := False;
  DM1.tCReceber.Filter   := 'NumSeqNota = '''+DM1.tNotaFiscalNumSeq.AsString+''' and Filial = '''+Dm1.tNotaFiscalFilial.AsString+'''';
  DM1.tCReceber.Filtered := True;
  if (DM1.tCReceber.IsEmpty) and ((DM1.tNotaFiscalCondPgto.AsString = 'P') or
                                  (DM1.tNotaFiscalCondPgto.AsString = 'V')) then
    Result := False
  else
  if not(DM1.tCReceber.IsEmpty) and (DM1.tNotaFiscalCondPgto.AsString = 'N') then
    Result := False
  else
  if (DM1.tCReceber.IsEmpty) and (DM1.tNotaFiscalVlrTotalDupl.AsFloat > 0) then
    Result := False;
  DM1.tCReceber.Filtered := False;

  if not Result then
    ShowMessage('Contas a receber não confere, favor alterar a nota e ajustar!');
end;

procedure Cancela_CReceber(Tipo : String);
begin
  DM1.tCReceber.Filtered := False;
  DM1.tCReceber.Filter   := 'NumSeqNota = '''+DM1.tNotaFiscalNumSeq.AsString+''' and Filial = '''+Dm1.tNotaFiscalFilial.AsString+'''';
  DM1.tCReceber.Filtered := True;
  DM1.tCReceber.First;
  while not DM1.tCReceber.Eof do
    begin
      DM1.tCReceberParc.First;
      while not DM1.tCReceberParc.Eof do
        begin
          if Tipo = 'C' then
            begin
              DM1.tCReceberParc.Edit;
              DM1.tCReceberParcCancelado.AsBoolean := True;
              DM1.tCReceberParc.Post;

              DM1.GravaEnt_tCReceberParcHist('CAN'); //Novo, vai gravar o cancelamento (Cleomar 23/06/2010)

              DM1.tCReceberParc.Next;
            end
          else
            begin
              DM1.tCReceberParcHist.First;
              while not DM1.tCReceberParcHist.Eof do
                begin
                  DM1.tCReceberParcRem.First;
                  while not DM1.tCReceberParcRem.Eof do
                    DM1.tCReceberParcRem.Delete;
                  DM1.tCReceberParcHist.Delete;
                end;
              DM1.tCReceberParc.Delete;
            end;
        end;
      if Tipo = 'C' then
        begin
          DM1.tCReceber.Edit;
          DM1.tCReceberCancelado.AsBoolean := True;
          DM1.tCReceber.Post;
        end;
      if Tipo = 'C' then
        DM1.tCReceber.Next
      else
        DM1.tCReceber.Delete;
    end;
  DM1.tCReceber.Filtered := False;
end;

procedure Grava_CReceberParc(Valor : Real ; DtVencimento : TDateTime; Parcela : Integer; Transf : Boolean);
begin
  DM1.tCReceberParc.Insert;
  DM1.tCReceberParcFilial.AsInteger              := DM1.tCReceberFilial.AsInteger;
  DM1.tCReceberParcDtGerado.AsDateTime           := DM1.tCReceberDtGerado.AsDateTime;
  DM1.tCReceberParcNumCReceber.AsInteger         := DM1.tCReceberNumCReceber.AsInteger;
  DM1.tCReceberParcParcCReceber.AsInteger        := Parcela;
  DM1.tCReceberParcDtVencCReceber.AsDateTime     := DtVencimento;
  DM1.tCReceberParcVlrParcCReceber.AsCurrency    := Valor;
  DM1.tCReceberParcRestParcela.AsFloat           := Valor;
  DM1.tCReceberParcCodCli.AsInteger              := DM1.tCReceberCodCli.AsInteger;
  DM1.tCReceberParcNumNota.AsInteger             := DM1.tCReceberNumNota.AsInteger;
  DM1.tCReceberParcCodVendedor.AsInteger         := DM1.tNotaFiscalCodVendedor.AsInteger;
  DM1.tCReceberParcPercComissao.AsCurrency       := vPercComissao;
  DM1.tCReceberParcPercComissao2.AsCurrency      := vPercComissao2;
  DM1.tCReceberParcCodVendedor2.AsInteger        := DM1.tNotaFiscalCodVendedor2.AsInteger;
  DM1.tCReceberParcPlanoContas.AsInteger         := DM1.tNotaFiscalPlanoContas.AsInteger;
  DM1.tCReceberParcTipoDoc.AsString              := 'NF';
  DM1.tCReceberParcCodConta.AsInteger            := vCodConta;
  DM1.tCReceberParcCodBancoBoleto.AsInteger      := vCodConta;
  DM1.tCReceberParcCodTipoCobranca.AsInteger     := vCodTipoCobranca;
  DM1.tCReceberParcComissaoItem.AsBoolean        := False;
  DM1.tCReceberParcTitProtestado.AsBoolean       := False;
  DM1.tCReceberParcTransferencia.AsBoolean       := Transf;
  DM1.tCReceberParcSerie.AsString                := DM1.tCReceberSerie.AsString;
  DM1.tCReceberParcNumSeqNota.AsInteger          := DM1.tCReceberNumSeqNota.AsInteger;
  DM1.tCReceberParcCodPlanoContasItens.AsInteger := 0;
  if Copy(DM1.tNotaFiscallkCodNatOper.AsString,1,1) = '7' then
    DM1.tCReceberParcExportacao.AsBoolean        := True
  else
    DM1.tCReceberParcExportacao.AsBoolean        := False;
  DM1.tCReceberParc.Post;

  DM1.GravaEnt_tCReceberParcHist('ENT');

  DM1.tCReceberVlrTotal.AsFloat                  := DM1.tCReceberVlrTotal.AsFloat + DM1.tCReceberParcVlrParcCReceber.AsFloat;
end;

procedure Grava_CReceber;
var
  vNumAux : Integer;
  vFlag   : Boolean;
begin
  DM1.tCReceber.IndexFieldNames   := 'Filial;NumCReceber';
  Cancela_CReceber('E');
  DM1.tCReceber.Refresh;
  DM1.tCReceber.Last;
  vNumAux := DM1.tCReceberNumCReceber.AsInteger;

  vflag := False;
  while vflag = False do
    begin
      vNumAux := vNumAux + 1;
      DM1.tCReceber.Refresh;
      if not(vFlag) and not(DM1.tCReceber.Locate('Filial;NumCReceber',VarArrayOf([DM1.tNotaFiscalFilial.AsInteger,vNumAux]),[locaseinsensitive])) then
      begin
        try
          DM1.tCReceber.Insert;
          DM1.tCReceberFilial.AsInteger       := Dm1.tNotaFiscalFilial.AsInteger;
          DM1.tCReceberNumCReceber.AsInteger  := vNumAux;
          DM1.tCReceberNumNota.AsInteger      := DM1.tNotaFiscalNumNota.AsInteger;
          DM1.tCReceberCodCli.AsInteger       := DM1.tNotaFiscalCodCli.AsInteger;
          DM1.tCReceberNumSeqNota.AsInteger   := DM1.tNotaFiscalNumSeq.AsInteger;
          DM1.tCReceberSerie.AsString         := DM1.tNotaFiscalSerie.AsString;
          DM1.tCReceber.Post;
          DM1.tCReceber.Refresh;
          DM1.tCReceber.Locate('Filial;NumCReceber',VarArrayOf([DM1.tNotaFiscalFilial.AsInteger,vNumAux]),[locaseinsensitive]);
          DM1.tCReceber.Edit;
          vflag := True;
        except
          on E: Exception do
          begin
            if DM1.tCReceber.State in [dsInsert, dsEdit] then
              DM1.tCReceber.Cancel;
            vFlag := False;
          end;
      end;
    end;
  end;

  DM1.tCReceberNumNota.AsInteger      := DM1.tNotaFiscalNumNota.AsInteger;
  DM1.tCReceberCodCli.AsInteger       := DM1.tNotaFiscalCodCli.AsInteger;
  DM1.tCReceberTipoDoc.AsString       := 'NF';
  DM1.tCReceberDtGerado.AsDateTime    := DM1.tNotaFiscalDtEmissao.AsDateTime;
  DM1.tCReceberNumSeqNota.AsInteger   := DM1.tNotaFiscalNumSeq.AsInteger;
  DM1.tCReceberSerie.AsString         := DM1.tNotaFiscalSerie.AsString;
  DM1.tCReceberBoletoImp.AsBoolean    := False;
  DM1.tCReceberDuplicataImp.AsBoolean := False;
  DM1.tCReceberCancelado.AsBoolean    := False;

  vNumAux := 1;
  if DM1.tNotaFiscalCondPgto.AsString = 'P'  then
    begin
      if DM1.tNotaFiscalEntrada.AsFloat > 0 then
        Grava_CReceberParc(DM1.tNotaFiscalEntrada.AsFloat,DM1.tNotaFiscalDtEmissao.AsDateTime,0,False);
      DM1.tNotaFiscalParc.First;
      while not DM1.tNotaFiscalParc.Eof do
        begin
          Grava_CReceberParc(DM1.tNotaFiscalParcVlrVenc.AsFloat,DM1.tNotaFiscalParcDtVenc.AsDateTime,DM1.tNotaFiscalParcParcela.AsInteger,False);
          vNumAux := DM1.tNotaFiscalParcParcela.AsInteger;
          DM1.tNotaFiscalParc.Next;
        end;
    end
  else
    Grava_CReceberParc(DM1.tNotaFiscalVlrTotalDupl.AsFloat,DM1.tNotaFiscalDtEmissao.AsDateTime,1,False);

  if Dm1.tNotaFiscalVlrTransf.AsFloat > 0 then
    begin
      vNumAux := vNumAux + 1;
      if DM1.tParametrosCodBancoTransfIcms.AsInteger > 0 then
        vCodConta := DM1.tParametrosCodBancoTransfIcms.AsInteger;
      if DM1.tParametrosCodTipoCobrancaTransfIcms.AsInteger > 0 then
        vCodTipoCobranca := DM1.tParametrosCodTipoCobrancaTransfIcms.AsInteger;
      Grava_CReceberParc(DM1.tNotaFiscalVlrTransf.AsFloat,DM1.tNotaFiscalDtEmissao.AsDateTime,vNumAux,True);
    end;
  DM1.tCReceber.Post;
end;

end.
