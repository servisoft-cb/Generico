unit UCobrancaEletronica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, Grids,
  DBGrids, RXDBCtrl, ALed, Db, DBTables, MemTable, RxLookup, CurrEdit, DBCtrls, DBClient, SMDBGrid, DBFilter;

type
  TfCobrancaEletronica = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    qBoletos: TQuery;
    qBoletosNumCReceber: TIntegerField;
    qBoletosParcCReceber: TIntegerField;
    qBoletosVlrParcCReceber: TFloatField;
    qBoletosDtVencCReceber: TDateField;
    qBoletosCodCli: TIntegerField;
    qBoletosNumNota: TIntegerField;
    qBoletosDtGerado: TDateField;
    qBoletosNome: TStringField;
    qBoletosEndereco: TStringField;
    qBoletosBairro: TStringField;
    qBoletosUf: TStringField;
    qBoletosCep: TStringField;
    qBoletosPessoa: TStringField;
    qBoletosCgcCpf: TStringField;
    qBoletosInscrEst: TStringField;
    qBoletosEndPgto: TStringField;
    qBoletosBairroPgto: TStringField;
    qBoletosCepPgto: TStringField;
    qBoletosUfPgto: TStringField;
    qBoletosCodCidade: TIntegerField;
    qBoletosCodCidadeP: TIntegerField;
    qBoletoslkCidade: TStringField;
    qBoletoslkCidadePgto: TStringField;
    qBoletosArqGerado: TBooleanField;
    msTitulos: TDataSource;
    Label5: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label27: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    qBoletosNumTitBanco: TStringField;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label3: TLabel;
    ALed1: TALed;
    qBoletosEmail: TStringField;
    qBoletosNumCarteira: TStringField;
    dsqBoletos: TDataSource;
    qBoletosFilial: TIntegerField;
    qBoletosRestParcela: TFloatField;
    mTitulos: TClientDataSet;
    mTitulosNumCReceber: TIntegerField;
    mTitulosParcela: TIntegerField;
    mTitulosNumNota: TIntegerField;
    mTitulosVlrParcela: TFloatField;
    mTitulosArqGerado: TBooleanField;
    mTitulosDtEmissao: TDateField;
    mTitulosDtVencimento: TDateField;
    SMDBGrid1: TSMDBGrid;
    mTitulosCodCliente: TIntegerField;
    mTitulosNomeCliente: TStringField;
    Panel3: TPanel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label8: TLabel;
    BitBtn6: TBitBtn;
    mTitulosCodConta: TIntegerField;
    mTitulosNomeConta: TStringField;
    Panel4: TPanel;
    Label6: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    BitBtn2: TBitBtn;
    qBoletosCodBancoBoleto: TIntegerField;
    RxDBFilter1: TRxDBFilter;
    Label4: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    mTitulosFilial: TIntegerField;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    qBoletosComplEndereco: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1ChangeSelection(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_MBoleto;
    procedure Grava_Historico(Tipo : String); //G= Geração   N= Nosso Número   B=Banco
    procedure Tela_CNAB(Codigo : Integer);

  public
    vDtInicialCob, vDtFinalCob : TDateTime;
    vCodClienteCob, vFilialCob, vFilialConta  : Integer;

    Function Monta_NomeArq(Caminho,Banco : String) : String;
    Procedure Monta_SQLqBoletos(CodConta : Integer);

    { Public declarations }
  end;

var
  fCobrancaEletronica: TfCobrancaEletronica;

implementation

uses UDM1, UBcoItau, UBcoBrasil, URelCobrancaEletronica, UDMBanco;

{$R *.DFM}

function TfCobrancaEletronica.Monta_NomeArq(Caminho,Banco : String) : String;
var
  Texto1, texto2 : String;
  vAux : Integer;
  Flag : Boolean;
  ano, mes, dia : Word;
begin
  DecodeDate(Date,ano,mes,dia);
  texto2 := Banco + FormatFloat('00',DM1.tFilialCodigo.AsFloat) + '_';
  {if DM1.tFilialCodigo.AsInteger = 1 then
    texto2 := Banco
  else
    texto2 := Banco + '2';}
  Texto1 := '';
  vAux := 0;
  flag := True;
  while Flag do
    begin
      inc(vAux);
      if copy(Caminho,Length(Caminho),1) = '\' then
        Texto1 := Caminho + 'REMESSA\' + texto2 + FormatFloat('00',ano) + FormatFloat('00',Mes) + FormatFloat('00',Dia) + IntToStr(vAux) + '.REM'
      else
        Texto1 := Caminho + '\REMESSA\' + texto2 + Copy(FormatFloat('0000',ano),3,2) + FormatFloat('00',Mes) + FormatFloat('00',Dia) + IntToStr(vAux) + '.REM';
      if not(FileExists(texto1)) then
        flag := False;
    end;
  Result := Texto1;
end;

procedure TfCobrancaEletronica.Tela_CNAB(Codigo : Integer);
begin
  DM1.tCReceber.MasterSource.Enabled   := False;
  DM1.tNotaFiscal.MasterSource.Enabled := False;

  vCodClienteCob := 0;
  if RxDBLookupCombo1.Text <> '' then
    vCodClienteCob := RxDBLookupCombo1.KeyValue;
  vDtInicialCob := DateEdit1.Date;
  vDtFinalCob   := DateEdit2.Date;
  vFilialCob    := 0;
  if RxDBLookupCombo2.Text <> '' then
    vFilialCob  := RxDBLookupCombo2.KeyValue;
  DM1.tContas.IndexFieldNames := 'CodConta';
  Dm1.tContas.SetKey;
  DM1.tContasCodConta.AsInteger := Codigo;
  if DM1.tContas.GotoKey then
    begin
      vFilialConta := DM1.tContasFilial.AsInteger;
      if DM1.tContasCNAB.AsString = 'ITAU400' then
        begin
          fBcoItau := TfBcoItau.Create(Self);
          fBcoItau.ShowModal;
        end
      {else
      if DM1.tContasCNAB.AsString = 'REAL400' then
        begin
          fBcoReal := TfBcoReal.Create(Self);
          fBcoReal.ShowModal;
        end
      else
      if (DM1.tContasCNAB.AsString = 'BRASIL400') or (DM1.tContasCNAB.AsString = 'BRASIL400-6') then
        begin
          fBcoBrasil := TfBcoBrasil.Create(Self);
          fBcoBrasil.ShowModal;
        end
      else
      if DM1.tContasCNAB.AsString = 'SAFRA400' then
        begin
          fParametroBcoSafra := TfParametroBcoSafra.Create(Self);
          fParametroBcoSafra.ShowModal;
        end
      else
      if DM1.tContasCNAB.AsString = 'SANTANDER240' then
        begin
          fBcoSantander := TfBcoSantander.Create(Self);
          fBcoSantander.ShowModal;
        end}
    end;
  vCodClienteCob := 0;
  vDtInicialCob  := 0;
  vDtFinalCob    := 0;
  vFilialCob     := 0;
  BitBtn6.Tag    := 0;
  DM1.tCReceber.MasterSource.Enabled   := True;
  DM1.tNotaFiscal.MasterSource.Enabled := True;
end;

procedure TfCobrancaEletronica.Grava_Historico(Tipo : String);
var
  vAux : Integer;
begin
  DM1.tCReceberParcHist.Refresh;
  DM1.tCReceberParcHist.Last;
  vAux := DM1.tCReceberParcHistItem.AsInteger;
  DM1.tCReceberParcHist.Insert;
  DM1.tCReceberParcHistFilial.AsInteger       := DM1.tCReceberParcFilial.AsInteger;
  DM1.tCReceberParcHistNumCReceber.AsInteger  := DM1.tCReceberParcNumCReceber.AsInteger;
  DM1.tCReceberParcHistParcCReceber.AsInteger := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tCReceberParcHistItem.AsInteger         := vAux + 1;
  DM1.tCReceberParcHistDtHistorico.AsDateTime := Date;
  if RxDBLookupCombo4.Text <> '' then
    DM1.tCReceberParcHistHistorico.AsString     := 'Confirmado duplicata no banco ' + RxDBLookupCombo4.Text
  else
    DM1.tCReceberParcHistHistorico.AsString     := 'Tirado o banco da duplicata';
  DM1.tCReceberParcHistPgto.AsBoolean         := False;
  DM1.tCReceberParcHistDevolucao.AsBoolean    := False;
  DM1.tCReceberParcHist.Post;
end;

procedure TfCobrancaEletronica.Monta_MBoleto;
begin
  qBoletos.First;
  while not qBoletos.Eof do
    begin
      mTitulos.Insert;
      mTitulosArqGerado.AsBoolean     := qBoletosArqGerado.AsBoolean;
      mTitulosNumCReceber.AsInteger   := qBoletosNumCReceber.AsInteger;
      mTitulosParcela.AsInteger       := qBoletosParcCReceber.AsInteger;
      mTitulosNumNota.AsInteger       := qBoletosNumNota.AsInteger;
      mTitulosVlrParcela.AsFloat      := qBoletosVlrParcCReceber.AsFloat;
      mTitulosDtEmissao.AsDateTime    := qBoletosDtGerado.AsDateTime;
      mTitulosDtVencimento.AsDateTime := qBoletosDtVencCReceber.AsDateTime;
      mTitulosCodCliente.AsInteger    := qBoletosCodCli.AsInteger;
      mTitulosNomeCliente.AsString    := qBoletosNome.AsString;
      mTitulosCodConta.AsInteger      := qBoletosCodBancoBoleto.AsInteger;
      mTitulosFilial.AsInteger        := qBoletosFilial.AsInteger;
      if (qBoletosCodBancoBoleto.AsInteger > 0) and
         (DM1.tContas.Locate('CodConta',qBoletosCodBancoBoleto.AsInteger,[loCaseInsensitive])) then
        mTitulosNomeConta.AsString := DM1.tContasNomeConta.AsString;
      mTitulos.Post;
      qBoletos.Next;
    end;
end;

procedure TfCobrancaEletronica.Monta_SQLqBoletos(CodConta : Integer);
begin
  qBoletos.Close;
  qBoletos.SQL.Clear;
  qBoletos.SQL.Add('SELECT Dbcreceberparc.NumCReceber, Dbcreceberparc.ParcCReceber, ');
  qBoletos.SQL.Add(' Dbcreceberparc.VlrParcCReceber, Dbcreceberparc.DtVencCReceber, ');
  qBoletos.SQL.Add(' Dbcreceberparc.CodCli, Dbcreceberparc.NumNota, Dbcreceberparc.DtGerado, ');
  qBoletos.SQL.Add(' Dbcliente.Nome, Dbcliente.Endereco||'', ''||Dbcliente.NumEnd as Endereco, Dbcliente.Bairro, Dbcliente.Uf, Dbcliente.Cep, Dbcliente.Pessoa, Dbcliente.CgcCpf, ');
  qBoletos.SQL.Add(' Dbcliente.InscrEst, Dbcliente.EndPgto, Dbcliente.BairroPgto, Dbcliente.CepPgto, Dbcliente.UfPgto, Dbcliente.CodCidade, ');
  qBoletos.SQL.Add(' Dbcliente.CodCidadeP, Dbcreceberparc.ArqGerado, Dbcreceberparc.NumTitBanco, dbCReceberParc.NumSeqNossoNum, ');
  qBoletos.SQL.Add(' dbCliente.Email, dbCReceberParc.NumCarteira, dbCReceberParc.Filial, Dbcreceberparc.RestParcela, Dbcreceberparc.CodBancoBoleto, dbCliente.ComplEndereco ');
  qBoletos.SQL.Add('FROM "DBCRECEBERPARC.DB" Dbcreceberparc');
  qBoletos.SQL.Add('   INNER JOIN "dbCliente.DB" Dbcliente');
  qBoletos.SQL.Add('   ON  (Dbcreceberparc.CodCli = Dbcliente.Codigo)');
  qBoletos.SQL.Add('WHERE ((Dbcreceberparc.cancelado = False) OR (Dbcreceberparc.Cancelado IS NULL))');
  qBoletos.SQL.Add('  AND ((Dbcreceberparc.Transferencia = False) OR (Dbcreceberparc.Transferencia IS NULL))');
  qBoletos.SQL.Add('  AND (Dbcreceberparc.DtGerado BETWEEN :D1 AND :D2)');
  qBoletos.SQL.Add('  AND (Dbcreceberparc.RestParcela > 0)');
  if RxDBLookupCombo2.Text <> '' then
    begin
      qBoletos.SQL.Add('  AND (Dbcreceberparc.Filial = :Filial)');
      qBoletos.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
    end;
  if CodConta > 0 then
    begin
      qBoletos.SQL.Add('  AND (Dbcreceberparc.CodBancoBoleto = :CodConta)');
      qBoletos.ParamByName('CodConta').AsInteger := CodConta;
    end
  else
    qBoletos.SQL.Add('  AND ((Dbcreceberparc.CodBancoBoleto = 0) or (Dbcreceberparc.CodBancoBoleto is Null)) ');
  qBoletos.ParamByName('D1').AsDate          := DateEdit1.Date;
  qBoletos.ParamByName('D2').AsDate          := DateEdit2.Date;
  if RxDBLookupCombo1.Text <> '' then
    begin
      qBoletos.SQL.Add('  AND (Dbcreceberparc.CodCli = :CodCli)');
      qBoletos.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  qBoletos.SQL.Add('ORDER BY Dbcreceberparc.DtGerado, Dbcreceberparc.NumCReceber, Dbcreceberparc.ParcCReceber, Dbcreceberparc.DtVencCReceber');
  qBoletos.Open;
end;

procedure TfCobrancaEletronica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  qBoletos.Close;
  if Screen.FormCount < 3 then
  begin
    DMBanco.tBcoBrasil.Close;
    DMBanco.tBcoItau.Close;
    DM1.tCReceber.Close;
    DM1.tCReceberParc.Close;
    DM1.tCReceberParcHist.Close;
  end;
  if DMBanco.Owner.ClassName = Self.ClassName then
    FreeAndNil(DMBanco);
  Action := Cafree;
end;

procedure TfCobrancaEletronica.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfCobrancaEletronica.BitBtn1Click(Sender: TObject);
begin
  if (DateEdit1.Date > 1) and (DateEdit2.Date > 1) then
    begin
      SMDBGrid1.UnSelectAllClick(fCobrancaEletronica);
      Screen.Cursor   := crHourGlass;
      mTitulos.EmptyDataSet;
      if RxDBLookupCombo3.Text <> '' then
        Monta_SQLqBoletos(RxDBLookupCombo3.KeyValue)
      else
        Monta_SQLqBoletos(0);
      Monta_MBoleto;
      BitBtn2.SetFocus;
      Screen.Cursor   := crDefault;
    end
  else
    begin
      ShowMessage('Você deve informar datas inicial, final e filial p/ gerar relação!');
      DateEdit1.SetFocus;
    end;
end;

procedure TfCobrancaEletronica.BitBtn4Click(Sender: TObject);
begin
  if not mTitulos.IsEmpty then
    if MessageDlg('Deseja realmente excluir este título?',mtconfirmation,[mbok,mbno],0)=mrok then
      mTitulos.Delete;
end;

procedure TfCobrancaEletronica.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if mTitulosArqGerado.AsBoolean then
    begin
      Background  := clGreen;
      AFont.Color := clWhite;
    end;
end;

procedure TfCobrancaEletronica.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tContas.IndexFieldNames := 'NomeConta';
end;

procedure TfCobrancaEletronica.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfCobrancaEletronica.BitBtn6Click(Sender: TObject);
var
  vContadorAux : Integer;
begin
  if RxDBLookupCombo4.Text = '' then
    begin
    if MessageDlg('Excluir o banco dos títulos?',mtconfirmation,[mbok,mbno],0)=mrno then
      exit;
    end;

  BitBtn6.Tag  := 1;
  vContadorAux := 0;
  mTitulos.First;
  while not mTitulos.Eof do
    begin
      if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
        begin
          DM1.tCReceber.IndexFieldNames := 'Filial;NumCReceber';
          Dm1.tCReceber.SetKey;
          DM1.tCReceberFilial.AsInteger      := DM1.tFilialCodigo.AsInteger;
          DM1.tCReceberNumCReceber.AsInteger := mTitulosNumCReceber.AsInteger;
          if DM1.tCReceber.GotoKey then
            begin
              //if (DM1.tCReceberParc.Locate('ParcCReceber',mTitulosParcela.AsInteger,[loCaseInsensitive])) and
                 //(DM1.tCReceberParcCodBancoBoleto.AsInteger <> RxDBLookupCombo4.KeyValue) then
              if DM1.tCReceberParc.Locate('ParcCReceber',mTitulosParcela.AsInteger,[loCaseInsensitive]) then
                begin
                  Inc(vContadorAux);
                  DM1.tCReceberParc.Edit;
                  if RxDBLookupCombo4.Text <> '' then
                    DM1.tCReceberParcCodBancoBoleto.AsInteger := RxDBLookupCombo4.KeyValue
                  else
                    DM1.tCReceberParcCodBancoBoleto.AsInteger := 0;
                  DM1.tCReceberParc.Post;

                  Grava_Historico('B');
                end;
            end;
          //SMDBGrid1.SelectedRows.CurrentRowSelected := False;
          //mTitulos.Delete;
        end;
        mTitulos.Next;
    end;

  DM1.tCReceberParc.Refresh;
  DM1.tCReceber.Refresh;

  if vContadorAux > 0 then
    ShowMessage(IntToStr(vContadorAux) + ' titulo(s) gravado(s)!')
  else
    ShowMessage('Não foi gravado nenhum título!');

  if (vContadorAux > 0) and (RxDBLookupCombo4.Text <> '') then
    Tela_CNAB(RxDBLookupCombo4.KeyValue);

  SMDBGrid1.UnSelectAllClick(fCobrancaEletronica);
  mTitulos.EmptyDataSet;
  CurrencyEdit1.Clear;
end;

procedure TfCobrancaEletronica.BitBtn2Click(Sender: TObject);
begin
  if RxDBLookupCombo3.Text <> '' then
    Tela_CNAB(RxDBLookupCombo3.KeyValue);
end;

procedure TfCobrancaEletronica.FormShow(Sender: TObject);
begin
  if not Assigned(DMBanco) then
    DMBanco := TDMBanco.Create(Self);

  DM1.tFilial.Open;
  DM1.tContas.Open;
  DMBanco.tBcoBrasil.Open;
  //DM1.tBcoReal.Open;
  DMBanco.tBcoItau.Open;
  //DM1.tBcoSantander.Open;
  DM1.tCReceber.Open;
  DM1.tCReceberParc.Open;
  DM1.tCReceberParcHist.Open;
  DM1.tTipoCobranca.Open;
  DM1.tFilial2.Open;

  DM1.tFilial.IndexFieldNames := 'Codigo';
  RxDBLookupCombo2.KeyValue   := DM1.tFilialCodigo.AsInteger;

  RxDBFilter1.Active := True;
end;

procedure TfCobrancaEletronica.SMDBGrid1ChangeSelection(Sender: TObject);
begin
  if SMDBGrid1.SelectedRows.CurrentRowSelected then
    CurrencyEdit1.Value := CurrencyEdit1.Value + mTitulosVlrParcela.AsFloat
  else
    CurrencyEdit1.Value := CurrencyEdit1.Value - mTitulosVlrParcela.AsFloat
end;

procedure TfCobrancaEletronica.BitBtn3Click(Sender: TObject);
begin
  fRelCobrancaEletronica := TfRelCobrancaEletronica.Create(Self);
  fRelCobrancaEletronica.RLReport1.Preview;
  fRelCobrancaEletronica.RLReport1.Free;
end;

end.

