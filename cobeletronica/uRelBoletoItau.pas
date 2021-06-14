unit uRelBoletoItau;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, db, Dialogs, RLReport, RLBarcode, jpeg;

type
  TfRelBoletoItau = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand2: TRLBand;
    RLDraw44: TRLDraw;
    RLBarcode2: TRLBarcode;
    RLDraw45: TRLDraw;
    RLLabel48: TRLLabel;
    RLLabel49: TRLLabel;
    RLDraw47: TRLDraw;
    RLLabel50: TRLLabel;
    RLDraw48: TRLDraw;
    RLLabel51: TRLLabel;
    RLDraw49: TRLDraw;
    RLLabel52: TRLLabel;
    RLDraw50: TRLDraw;
    RLLabel53: TRLLabel;
    RLDraw51: TRLDraw;
    RLLabel54: TRLLabel;
    RLDraw52: TRLDraw;
    RLLabel55: TRLLabel;
    RLDraw53: TRLDraw;
    RLLabel56: TRLLabel;
    RLDraw54: TRLDraw;
    RLLabel57: TRLLabel;
    RLDraw55: TRLDraw;
    RLDraw56: TRLDraw;
    RLLabel59: TRLLabel;
    RLDraw58: TRLDraw;
    RLLabel61: TRLLabel;
    RLDraw59: TRLDraw;
    RLLabel62: TRLLabel;
    RLDraw60: TRLDraw;
    RLLabel63: TRLLabel;
    RLDraw61: TRLDraw;
    RLDraw62: TRLDraw;
    RLDraw63: TRLDraw;
    RLDraw64: TRLDraw;
    RLDraw65: TRLDraw;
    RLDraw66: TRLDraw;
    RLLabel64: TRLLabel;
    RLDBText29: TRLDBText;
    RLDBText30: TRLDBText;
    RLDBText31: TRLDBText;
    RLLabel66: TRLLabel;
    RLDBText35: TRLDBText;
    RLDraw67: TRLDraw;
    RLDraw68: TRLDraw;
    RLLabel69: TRLLabel;
    RLLabel70: TRLLabel;
    RLLabel71: TRLLabel;
    RLLabel72: TRLLabel;
    RLLabel73: TRLLabel;
    RLLabel75: TRLLabel;
    RLDBText37: TRLDBText;
    RLDBText38: TRLDBText;
    RLLabel76: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText2: TRLDBText;
    RLDraw3: TRLDraw;
    RLLabel1: TRLLabel;
    RLLabel4: TRLLabel;
    RLDraw5: TRLDraw;
    RLLabel5: TRLLabel;
    RLDraw6: TRLDraw;
    RLLabel8: TRLLabel;
    RLDraw8: TRLDraw;
    RLLabel10: TRLLabel;
    RLDraw14: TRLDraw;
    RLLabel15: TRLLabel;
    RLDraw18: TRLDraw;
    RLDraw19: TRLDraw;
    RLDraw20: TRLDraw;
    RLDraw21: TRLDraw;
    RLDraw22: TRLDraw;
    RLDraw23: TRLDraw;
    RLLabel19: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel20: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel26: TRLLabel;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel30: TRLLabel;
    Inst1: TRLLabel;
    Inst2: TRLLabel;
    Inst3: TRLLabel;
    Inst4: TRLLabel;
    Inst5: TRLLabel;
    Inst1A: TRLLabel;
    Inst2A: TRLLabel;
    Inst3A: TRLLabel;
    Inst4A: TRLLabel;
    Inst5A: TRLLabel;
    RLDBText19: TRLDBText;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLLabel6: TRLLabel;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLLabel38: TRLLabel;
    RLLabel39: TRLLabel;
    RLDraw4: TRLDraw;
    RLDraw24: TRLDraw;
    RLLabel40: TRLLabel;
    RLLabel41: TRLLabel;
    RLDraw25: TRLDraw;
    RLLabel42: TRLLabel;
    RLDBText1: TRLDBText;
    RLDraw26: TRLDraw;
    RLLabel31: TRLLabel;
    RLLabel43: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel44: TRLLabel;
    RLLabel45: TRLLabel;
    RLLabel46: TRLLabel;
    RLDraw27: TRLDraw;
    RLLabel9: TRLLabel;
    RLDBText5: TRLDBText;
    RLDraw7: TRLDraw;
    RLLabel11: TRLLabel;
    RLDraw9: TRLDraw;
    RLLabel13: TRLLabel;
    RLDBText7: TRLDBText;
    RLDraw10: TRLDraw;
    RLLabel14: TRLLabel;
    RLDBText8: TRLDBText;
    RLDraw11: TRLDraw;
    RLLabel25: TRLLabel;
    RLDraw12: TRLDraw;
    RLLabel16: TRLLabel;
    RLDraw13: TRLDraw;
    RLDBText9: TRLDBText;
    RLLabel17: TRLLabel;
    RLDraw15: TRLDraw;
    RLLabel18: TRLLabel;
    RLLabel21: TRLLabel;
    RLDraw16: TRLDraw;
    RLLabel29: TRLLabel;
    RLDraw17: TRLDraw;
    RLLabel47: TRLLabel;
    RLDraw28: TRLDraw;
    RLDraw29: TRLDraw;
    RLDBText12: TRLDBText;
    RLLabel12: TRLLabel;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLLabel2: TRLLabel;
    RLDBText15: TRLDBText;
    RLLabel58: TRLLabel;
    RLDBText16: TRLDBText;
    RLLabel60: TRLLabel;
    RLLabel65: TRLLabel;
    RLLabel67: TRLLabel;
    RLDBText17: TRLDBText;
    RLLabel68: TRLLabel;
    RLLabel74: TRLLabel;
    RLLabel77: TRLLabel;
    RLLabel78: TRLLabel;
    RLLabel79: TRLLabel;
    RLLabel80: TRLLabel;
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelBoletoItau: TfRelBoletoItau;

implementation

uses UDM1, UCobEletronicaImp, uUtilBanco, UEnviarBanco;

{$R *.dfm}

procedure TfRelBoletoItau.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  i: Integer;
  vNumAux: String;
  vDigAux: String;
  texto2: String;
  vData: TDateTime;
  vAux: Real;
begin
  PrintIt := fCobEletronicaImp.SMDBGrid1.SelectedRows.CurrentRowSelected;
  if not PrintIt then
    exit;

  if fCobEletronicaImp.mBoletosNumCarteira.AsString = '112' then
  begin
    PrintIt := False;
    Exit;
  end
  else
    PrintIt := True;

  if Trim(fCobEletronicaImp.mBoletosNossoNumero.AsString) <> '' then
  begin
    vNumAux := copy(fCobEletronicaImp.mBoletosNossoNumero.AsString,1,8);
    vDigAux := copy(fCobEletronicaImp.mBoletosNossoNumero.AsString,9,1);
  end
  else
  begin
    ShowMessage('Nosso número não foi gerado!');
    PrintIt := False;
    Exit;
  end;

  RLLabel70.Caption  := MontaBoletoItau('L',vNumAux,fCobEletronicaImp.mBoletosNumCarteira.AsString,vDigAux,fCobEletronicaImp.mBoletosDtVencimento.AsDateTime,fCobEletronicaImp.mBoletosVlrParcela.AsCurrency);

  RLBarcode2.Caption := MontaBoletoItau('B',vNumAux,fCobEletronicaImp.mBoletosNumCarteira.AsString,vDigAux,fCobEletronicaImp.mBoletosDtVencimento.AsDateTime,fCobEletronicaImp.mBoletosVlrParcela.AsCurrency);

  RLLabel3.Caption   := DM1.tContasAgencia.AsString + '/' + DM1.tContasCodCedente.AsString + '-' + DM1.tContasDigConta.AsString;
  RLLabel28.Caption  := RLLabel3.Caption;

  RLLabel40.Caption := fCobEletronicaImp.mBoletosNumCarteira.AsString + '/' + copy(fCobEletronicaImp.mBoletosNossoNumero.AsString,1,8) + '-' + copy(fCobEletronicaImp.mBoletosNossoNumero.AsString,9,1);
  RLLabel34.Caption := RLLabel40.Caption;

  if fCobEletronicaImp.mBoletosPessoa.AsString = 'F' then
    RLLabel32.Caption := 'CPF:'
  else
    RLLabel32.Caption := 'CNPJ:';
  RLLabel33.Caption := RLLabel32.Caption;

  //Instruções
  for i := 1 to 5 do
  begin
    TRLLabel(FindComponent('Inst'+IntToStr(i))).Caption     := '';
    TRLLabel(FindComponent('Inst'+IntToStr(i)+'A')).Caption := '';
    TRLLabel(FindComponent('Inst'+IntToStr(i))).Visible     := False;
    TRLLabel(FindComponent('Inst'+IntToStr(i)+'A')).Visible := False;
  end;

  i := 1;
  if fCobEletronicaImp.mBoletosDiasProtesto.AsInteger > 0 then
  begin
    vData := fCobEletronicaImp.mBoletosDtVencimento.AsDateTime + fCobEletronicaImp.mBoletosDiasProtesto.AsInteger;
    TRLLabel(FindComponent('Inst'+IntToStr(i))).Visible     := True;
    TRLLabel(FindComponent('Inst'+IntToStr(i)+'A')).Visible := True;
    TRLLabel(FindComponent('Inst'+IntToStr(i))).Caption     := '- Protestar após ' + FormatDateTime('dd/mm/yyyy',vData);
    TRLLabel(FindComponent('Inst'+IntToStr(i)+'A')).Caption := '- Protestar após ' + FormatDateTime('dd/mm/yyyy',vData);
    inc(i);
  end;

  if fCobEletronicaImp.mBoletosVlrJurosPorDia.AsFloat > 0 then
  begin
    vAux := fCobEletronicaImp.mBoletosVlrJurosPorDia.AsFloat;
    TRLLabel(FindComponent('Inst'+IntToStr(i))).Visible     := True;
    TRLLabel(FindComponent('Inst'+IntToStr(i)+'A')).Visible := True;
    if fCobEletronicaImp.mBoletosTipoJuro.AsString = 'B' then
    begin
      TRLLabel(FindComponent('Inst'+IntToStr(i))).Caption     := '- Após vencimento cobrar Juros de R$ ' + FormatFloat('###,###,##0.00',vAux) + ' ao dia';
      TRLLabel(FindComponent('Inst'+IntToStr(i)+'A')).Caption := '- Após vencimento cobrar Juros de R$ ' + FormatFloat('###,###,##0.00',vAux) + ' ao dia';
    end;
    inc(i);
  end;

  if (fCobEletronicaImp.mBoletosVlrDesconto.AsFloat > 0) and (fCobEletronicaImp.mBoletosDtLimiteDesc.AsDateTime > 1) then
  begin
    vAux := fCobEletronicaImp.mBoletosVlrDesconto.AsFloat;
    if fCobEletronicaImp.mBoletosTipoDesconto.AsString = 'B' then
      vAux := StrToFloat(FormatFloat('###,###,##0.00',(fCobEletronicaImp.mBoletosVlrDesconto.AsFloat * fCobEletronicaImp.mBoletosVlrParcela.AsFloat)  / 100));
    TRLLabel(FindComponent('Inst'+IntToStr(i))).Visible     := True;
    TRLLabel(FindComponent('Inst'+IntToStr(i)+'A')).Visible := True;
    TRLLabel(FindComponent('Inst'+IntToStr(i))).Caption     := '- Até ' + fCobEletronicaImp.mBoletosDtLimiteDesc.AsString + ' Conceder desconto de R$ ' + FormatFloat('###,###,##0.00',vAux);
    TRLLabel(FindComponent('Inst'+IntToStr(i)+'A')).Caption := '- Até ' + fCobEletronicaImp.mBoletosDtLimiteDesc.AsString + ' Conceder desconto de R$ ' + FormatFloat('###,###,##0.00',vAux);
    inc(i);
  end;

  if (i < 6) and (StrToFloat(FormatFloat('0.00',fCobEletronicaImp.mBoletosVlrMulta.AsFloat)) > 0) then
  begin
    TRLLabel(FindComponent('Inst'+IntToStr(i))).Visible     := True;
    TRLLabel(FindComponent('Inst'+IntToStr(i)+'A')).Visible := True;
    TRLLabel(FindComponent('Inst'+IntToStr(i))).Caption     := '- Após vencimento Cobrar Multa de R$ ' + FormatFloat('###,###,##0.00',fCobEletronicaImp.mBoletosVlrMulta.AsFloat);
    TRLLabel(FindComponent('Inst'+IntToStr(i)+'A')).Caption := '- Após vencimento Cobrar Multa de R$ ' + FormatFloat('###,###,##0.00',fCobEletronicaImp.mBoletosVlrMulta.AsFloat);
    inc(i);
  end;

  {if (i < 6) and (StrToFloat(FormatFloat('0.00',fCobEletronicaImp.mBoletosVlrTaxaBanco.AsFloat)) > 0) then
  begin
    TRLLabel(FindComponent('Inst'+IntToStr(i))).Visible     := True;
    TRLLabel(FindComponent('Inst'+IntToStr(i)+'A')).Visible := True;
    TRLLabel(FindComponent('Inst'+IntToStr(i))).Caption     := '- Valor Taxa Banco R$ ' + FormatFloat('###,###,##0.00',fEnviarBanco.mBoletosVlrTaxaBanco.AsFloat);
    TRLLabel(FindComponent('Inst'+IntToStr(i)+'A')).Caption := '- Valor Taxa Banco R$ ' + FormatFloat('###,###,##0.00',fEnviarBanco.mBoletosVlrTaxaBanco.AsFloat);
    inc(i);
  end;}

  //Dados do sacado
  RLLabel31.Caption := fCobEletronicaImp.mBoletosEndereco.AsString;
  RLLabel43.Caption := fCobEletronicaImp.mBoletosCep.AsString + '    -     ' +
                       fCobEletronicaImp.mBoletosCidade.AsString + '  -  ' +
                       fCobEletronicaImp.mBoletosUf.AsString;
  RLLabel45.Caption := RLLabel31.Caption;
  RLLabel44.Caption := RLLabel43.Caption;
  RLLabel65.Caption := DM1.tFilialEndereco.AsString + ', ' + DM1.tFilialNumEnd.AsString;
  RLLabel74.Caption := DM1.tFilialEndereco.AsString + ', ' + DM1.tFilialNumEnd.AsString;

  RLLabel78.Caption := DM1.tFilialCep.AsString + '  Cid: ' + DM1.tFilialCidade.AsString + ' - ' + DM1.tFilialEstado.AsString;
  RLLabel80.Caption := DM1.tFilialCep.AsString + '  Cid: ' + DM1.tFilialCidade.AsString + ' - ' + DM1.tFilialEstado.AsString;
end;

procedure TfRelBoletoItau.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.
