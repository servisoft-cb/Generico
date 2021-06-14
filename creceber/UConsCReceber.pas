unit UConsCReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, Menus, RXCtrls, Printers,
  Db, DBTables, Grids, DBGrids, RxLookup, SMDBGrid, CurrEdit, DBFilter,
  DBClient, ComCtrls, Variants;

type
  TfConsCReceber = class(TForm)
    Panel1: TPanel;
    StaticText1: TStaticText;
    DateEdit1: TDateEdit;
    StaticText2: TStaticText;
    DateEdit2: TDateEdit;
    qConsulta: TQuery;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label3: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    GroupBox1: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label4: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    StaticText3: TStaticText;
    DateEdit3: TDateEdit;
    StaticText4: TStaticText;
    DateEdit4: TDateEdit;
    dsqConsulta: TDataSource;
    qConsultaFilial: TIntegerField;
    qConsultaCodCli: TIntegerField;
    qConsultaNomeCliente: TStringField;
    qConsultaNomeVendedor: TStringField;
    qConsultaCodVendedor: TIntegerField;
    qConsultaVlrParcCReceber: TFloatField;
    qConsultaParcCReceber: TIntegerField;
    qConsultaNumCReceber: TIntegerField;
    qConsultaDtVencCReceber: TDateField;
    qConsultaDtPagParcCReceber: TDateField;
    qConsultaPgtoParcial: TFloatField;
    qConsultaRestParcela: TFloatField;
    qConsultaPercComissao: TFloatField;
    qConsultaAbatimentos: TFloatField;
    qConsultaNomeConta: TStringField;
    qConsultaJurosPagos: TFloatField;
    qConsultaCancelado: TBooleanField;
    qConsultaDtGerado: TDateField;
    qConsultaVlrDevolucao: TFloatField;
    qConsultaTransferencia: TBooleanField;
    qConsultaNumTitBanco: TStringField;
    qConsultaNumCarteira: TStringField;
    qConsultaNumNota: TIntegerField;
    qConsultaCodBancoBoleto: TIntegerField;
    Label1: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    qConsultaCodConta: TIntegerField;
    qConsultaNomeBancoBoleto: TStringField;
    qConsultaclTransferencia: TStringField;
    Label5: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    qConsultaCodTipoCobranca: TIntegerField;
    qConsultaNomeCobranca: TStringField;
    ComboBox1: TComboBox;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    ComboBox2: TComboBox;
    Label6: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    qConsultaCgcCpf: TStringField;
    CurrencyEdit1: TCurrencyEdit;
    Label7: TLabel;
    qConsultaEndereco: TStringField;
    qConsultaBairro: TStringField;
    qConsultaUf: TStringField;
    qConsultaCep: TStringField;
    qConsultaFantasia: TStringField;
    qConsultaCodCidade: TIntegerField;
    qConsultaPessoa: TStringField;
    qConsultaDesconto: TFloatField;
    qConsultaDespesas: TFloatField;
    tCReceberParcHist: TTable;
    dsCReceberParcHist: TDataSource;
    tCReceberParcHistFilial: TIntegerField;
    tCReceberParcHistNumCReceber: TIntegerField;
    tCReceberParcHistParcCReceber: TIntegerField;
    tCReceberParcHistItem: TIntegerField;
    tCReceberParcHistCodHistorico: TIntegerField;
    tCReceberParcHistDtHistorico: TDateField;
    tCReceberParcHistHistorico: TStringField;
    tCReceberParcHistDtUltPgto: TDateField;
    tCReceberParcHistVlrUltPgto: TFloatField;
    tCReceberParcHistVlrUltJuros: TFloatField;
    tCReceberParcHistVlrUltDescontos: TFloatField;
    tCReceberParcHistVlrUltDespesas: TFloatField;
    tCReceberParcHistVlrUltAbatimentos: TFloatField;
    tCReceberParcHistPgto: TBooleanField;
    tCReceberParcHistJurosPagos: TFloatField;
    tCReceberParcHistNumMov: TIntegerField;
    tCReceberParcHistNumMovJuros: TIntegerField;
    tCReceberParcHistJurosCalc: TFloatField;
    tCReceberParcHistVlrDevolucao: TFloatField;
    tCReceberParcHistDevolucao: TBooleanField;
    tCReceberParcHistNroLancExtComissao: TIntegerField;
    tCReceberParcHistTipo: TStringField;
    tCReceberParcHistCodConta: TIntegerField;
    RxDBFilter1: TRxDBFilter;
    SMDBGrid1: TSMDBGrid;
    Label8: TLabel;
    CurrencyPagina: TCurrencyEdit;
    qConsultaNumEndEntrega: TStringField;
    qConsultaNumEnd: TStringField;
    qConsultaTelefone: TStringField;
    qConsultaDDDFone1: TIntegerField;
    qConsultaclDiasAtraso: TFloatField;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StaticText7: TStaticText;
    ComboBox3: TComboBox;
    qConsultaCodNoBanco: TStringField;
    mTipoCobrancaRed: TClientDataSet;
    dsmTipoCobrancaRed: TDataSource;
    mTipoCobrancaRedCodCobranca: TIntegerField;
    mTipoCobrancaRedNomeCobranca: TStringField;
    mTipoCobrancaRedValor: TFloatField;
    mTipoCobrancaRedCodConta: TIntegerField;
    ProgressBar1: TProgressBar;
    mTipoCobrancaRedCodBanco: TStringField;
    mTipoCobrancaRedNomeBanco: TStringField;
    CheckBox4: TCheckBox;
    StaticText8: TStaticText;
    ComboBox4: TComboBox;
    Label13: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    qConsultaTitProtestado: TBooleanField;
    Label12: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure qConsultaCalcFields(DataSet: TDataSet);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
    procedure RxDBLookupCombo6Enter(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mTipoCobrancaRedNewRecord(DataSet: TDataSet);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
    procedure Monta_SQL;
    procedure Le_qConsulta;
    procedure Monta_mTipoCobrancaRed;
  public
    { Public declarations }
  end;

var
  fConsCReceber: TfConsCReceber;

implementation

uses UDM1, URelCReceber2, URelCopiaDupl, URelRegDuplicatas, URelCReceberCliRed,
  URelCReceberTipoCobr, URelCReceberTipoCobrRed, UDM2;

{$R *.DFM}

procedure TfConsCReceber.Monta_SQL;
begin
  qConsulta.Close;
  qConsulta.SQL.Clear;
  qConsulta.SQL.Add('SELECT Dbcreceberparc.Filial, Dbcreceberparc.CodCli, Dbcliente.Nome NomeCliente, Dbvendedor.Nome NomeVendedor, ');
  qConsulta.SQL.Add(' Dbcreceberparc.CodVendedor, Dbcreceberparc.VlrParcCReceber, Dbcreceberparc.ParcCReceber, Dbcreceberparc.NumCReceber, ');
  qConsulta.SQL.Add(' Dbcreceberparc.DtVencCReceber, Dbcreceberparc.DtPagParcCReceber, Dbcreceberparc.PgtoParcial, Dbcreceberparc.RestParcela, ');
  qConsulta.SQL.Add(' Dbcreceberparc.PercComissao, Dbcreceberparc.Abatimentos, Dbcontas.NomeConta, Dbcreceberparc.JurosPagos, ');
  qConsulta.SQL.Add(' Dbcreceberparc.Cancelado, Dbcreceberparc.DtGerado, Dbcreceberparc.VlrDevolucao, Dbcreceberparc.Transferencia, ');
  qConsulta.SQL.Add(' Dbcreceberparc.NumTitBanco, Dbcreceberparc.NumCarteira, Dbcreceberparc.NumNota, ');
  qConsulta.SQL.Add(' Dbcreceberparc.CodBancoBoleto, Dbcreceberparc.CodConta, Dbcontas_1.NomeConta NomeBancoBoleto, Dbcontas_1.CodBanco CodNoBanco, ');
  qConsulta.SQL.Add(' dbCReceberParc.CodTipoCobranca, dbTipoCobranca.Nome NomeCobranca, dbCliente.CgcCpf, ');
  qConsulta.SQL.Add(' Dbcliente.Endereco, Dbcliente.Bairro, Dbcliente.Uf, Dbcliente.Cep, Dbcliente.Fantasia, Dbcliente.CodCidade,  ');
  qConsulta.SQL.Add(' Dbcliente.Pessoa, Dbcreceberparc.Desconto, Dbcreceberparc.Despesas, Dbcliente.NumEndEntrega, Dbcliente.NumEnd, ');
  qConsulta.SQL.Add(' Dbcliente.Telefone, Dbcliente.DDDFone1, dbCReceberParc.TitProtestado ');
  qConsulta.SQL.Add('FROM "dbCReceberParc.DB" Dbcreceberparc ');
  qConsulta.SQL.Add('INNER JOIN "dbCliente.DB" Dbcliente ON (Dbcreceberparc.CodCli = Dbcliente.Codigo) ');
  qConsulta.SQL.Add('FULL JOIN "dbVendedor.DB" Dbvendedor ON (Dbcreceberparc.CodVendedor = Dbvendedor.Codigo) ');
  qConsulta.SQL.Add('FULL JOIN "dbContas.DB" Dbcontas ON (Dbcreceberparc.CodConta = Dbcontas.CodConta) ');
  qConsulta.SQL.Add('FULL JOIN "dbContas.DB" Dbcontas_1 ON (Dbcreceberparc.CodBancoBoleto = Dbcontas_1.CodConta)');
  qConsulta.SQL.Add('FULL JOIN "dbTipoCobranca.DB" DbTipoCobranca ON (Dbcreceberparc.CodTipoCobranca = DbTipoCobranca.Codigo)');
  qConsulta.SQL.Add('WHERE ((dbCReceberParc.Cancelado = False) or (dbCReceberParc.Cancelado is NULL))');
  if CurrencyEdit1.AsInteger > 0 then
  begin
    qConsulta.SQL.Add(' AND (dbCReceberParc.NumNota = :NumNota) ');
    qConsulta.ParamByName('NumNota').AsInteger := CurrencyEdit1.AsInteger;
  end;

  if CheckBox4.Checked then
    qConsulta.SQL.Add(' AND (dbCReceberParc.NumTitBanco <> ' + QuotedStr('') + ')' );

  if RxDBLookupCombo2.Text <> '' then
  begin
    qConsulta.SQL.Add(' AND (dbCReceberParc.Filial = :Filial) ');
    qConsulta.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
  end;
  if RxDBLookupCombo1.Text <> '' then
  begin
    qConsulta.SQL.Add(' AND (dbCReceberParc.CodConta = :CodConta) ');
    qConsulta.ParamByName('CodConta').AsInteger := RxDBLookupCombo1.KeyValue;
  end;
  if RxDBLookupCombo3.Text <> '' then
  begin
    qConsulta.SQL.Add(' AND (dbCReceberParc.CodCli = :CodCli) ');
    qConsulta.ParamByName('CodCli').AsInteger := RxDBLookupCombo3.KeyValue;
  end;
  if RxDBLookupCombo4.Text <> '' then
  begin
    qConsulta.SQL.Add(' AND (dbCReceberParc.CodBancoBoleto = :CodBancoBoleto) ');
    qConsulta.ParamByName('CodBancoBoleto').AsInteger := RxDBLookupCombo4.KeyValue;
  end;
  if RxDBLookupCombo5.Text <> '' then
  begin
    qConsulta.SQL.Add(' AND (dbCReceberParc.CodTipoCobranca = :CodTipoCobranca) ');
    qConsulta.ParamByName('CodTipoCobranca').AsInteger := RxDBLookupCombo5.KeyValue;
  end;
  if RxDBLookupCombo6.Text <> '' then
  begin
    qConsulta.SQL.Add(' AND (dbCReceberParc.CodVendedor = :CodVendedor) ');
    qConsulta.ParamByName('CodVendedor').AsInteger := RxDBLookupCombo6.KeyValue;
  end;
  if DateEdit1.Date > 0 then
  begin
    qConsulta.SQL.Add(' AND (dbCReceberParc.DtGerado >= :DtGeradoIni)');
    qConsulta.ParamByName('DtGeradoIni').AsDate := DateEdit1.Date;
  end;
  if DateEdit2.Date > 0 then
  begin
    qConsulta.SQL.Add(' AND (dbCReceberParc.DtGerado <= :DtGeradoFin)');
    qConsulta.ParamByName('DtGeradoFin').AsDate := DateEdit2.Date;
  end;
  if DateEdit3.Date > 0 then
  begin
    qConsulta.SQL.Add(' AND (dbCReceberParc.DtVencCReceber >= :DtVencCReceberIni)');
    qConsulta.ParamByName('DtVencCReceberIni').AsDate := DateEdit3.Date;
  end;
  if DateEdit4.Date > 0 then
  begin
    qConsulta.SQL.Add(' AND (dbCReceberParc.DtVencCReceber <= :DtVencCReceberFin)');
    qConsulta.ParamByName('DtVencCReceberFin').AsDate := DateEdit4.Date;
  end;
  case ComboBox2.ItemIndex of
    0: qConsulta.SQL.Add(' AND (dbCReceberParc.RestParcela > 0) ');
    1: qConsulta.SQL.Add(' AND (dbCReceberParc.PgtoParcial > 0)');
  end;
  case ComboBox4.ItemIndex of
    0: qConsulta.SQL.Add(' AND (dbCReceberParc.TitProtestado = False) ');
    1: qConsulta.SQL.Add(' AND (dbCReceberParc.TitProtestado = True) ');
  end;
  if (CheckBox2.Checked) and not (CheckBox3.Checked) then
    qConsulta.SQL.Add(' and ((dbCReceberParc.Transferencia = False) or (dbCReceberParc.Transferencia IS NULL)) ')
  else
    if not (CheckBox2.Checked) and (CheckBox3.Checked) then
      qConsulta.SQL.Add(' and (dbCReceberParc.Transferencia = True) ');
  if (ComboBox3.ItemIndex = 0) or (ComboBox3.ItemIndex = 1) then
  begin
    case ComboBox1.ItemIndex of
      0: qConsulta.SQL.Add('ORDER BY dbTipoCobranca.Nome, Dbcontas_1.NomeConta, dbCReceberParc.DtVencCReceber, dbCReceberParc.NumNota, dbCReceberParc.ParcCReceber');
      1: qConsulta.SQL.Add('ORDER BY dbTipoCobranca.Nome, dbCReceberParc.DtVencCReceber, dbCReceberParc.NumNota, dbCReceberParc.ParcCReceber');
      2: qConsulta.SQL.Add('ORDER BY dbTipoCobranca.Nome, dbCliente.Nome, dbCReceberParc.CodCli, dbCReceberParc.DtVencCReceber, dbCReceberParc.NumNota, dbCReceberParc.ParcCReceber');
      3: qConsulta.SQL.Add('ORDER BY dbTipoCobranca.Nome, dbCReceberParc.DtVencCReceber, dbCReceberParc.NumNota, dbCReceberParc.ParcCReceber');
      4: qConsulta.SQL.Add('ORDER BY dbTipoCobranca.Nome, dbCReceberParc.DtGerado, dbCReceberParc.NumNota, dbCReceberParc.DtVencCReceber, dbCReceberParc.ParcCReceber');
      5: qConsulta.SQL.Add('ORDER BY dbTipoCobranca.Nome, dbVendedor.Nome, dbCReceberParc.DtVencCReceber, dbCReceberParc.NumNota, dbCReceberParc.ParcCReceber');
    end;
  end
  else
  begin
    case ComboBox1.ItemIndex of
      0: qConsulta.SQL.Add('ORDER BY Dbcontas_1.NomeConta, dbCReceberParc.DtVencCReceber, dbCReceberParc.NumNota, dbCReceberParc.ParcCReceber');
      1: qConsulta.SQL.Add('ORDER BY dbTipoCobranca.Nome, dbCReceberParc.DtVencCReceber, dbCReceberParc.NumNota, dbCReceberParc.ParcCReceber');
      2: qConsulta.SQL.Add('ORDER BY dbCliente.Nome, dbCReceberParc.CodCli, dbCReceberParc.DtVencCReceber, dbCReceberParc.NumNota, dbCReceberParc.ParcCReceber');
      3: qConsulta.SQL.Add('ORDER BY dbCReceberParc.DtVencCReceber, dbCReceberParc.NumNota, dbCReceberParc.ParcCReceber');
      4: qConsulta.SQL.Add('ORDER BY dbCReceberParc.DtGerado, dbCReceberParc.NumNota, dbCReceberParc.DtVencCReceber, dbCReceberParc.ParcCReceber');
      5: qConsulta.SQL.Add('ORDER BY dbVendedor.Nome, dbCReceberParc.DtVencCReceber, dbCReceberParc.NumNota, dbCReceberParc.ParcCReceber');
    end;
  end;

  qConsulta.Open;

  if DM1.tParametrosMostrarVale.AsBoolean then
  begin
    DM2.qVale.Close;
    DM2.qVale.Open;
    CurrencyEdit2.Value := StrToFloat(FormatFloat('###,###,##0.00',DM2.qValeVlrTotal.AsFloat));
  end;
end;

procedure TfConsCReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qConsulta.Close;
  DM1.tCliente.Close;
  DM1.tTipoCobranca.Close;
  DM1.tVendedor.Close;
  RxDBFilter1.Active := False;
  Action := caFree;
end;

procedure TfConsCReceber.FormShow(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;

  DM1.tContas.Open;
  DM1.tCliente.Open;
  DM1.tTipoCobranca.Open;
  DM1.tVendedor.Open;
  tCReceberParcHist.Open;
  RxDBFilter1.Active := True;

  Label12.Visible       := DM1.tParametrosMostrarVale.AsBoolean;
  CurrencyEdit2.Visible := DM1.tParametrosMostrarVale.AsBoolean;
end;

procedure TfConsCReceber.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfConsCReceber.BitBtn1Click(Sender: TObject);
begin
  if (ComboBox3.ItemIndex = 4) and (ComboBox1.ItemIndex <> 4) then
  begin
    ShowMessage('Para Imprimir o Registro, o campo "Ordenar Por", tem que esta marcado "Data Emissão"!');
    exit;
  end;
  Monta_SQL;
end;

procedure TfConsCReceber.BitBtn2Click(Sender: TObject);
begin
  if (qConsulta.Active) and (qConsulta.RecordCount > 0) then
  begin
    Screen.Cursor := crHourGlass;
    SMDBGrid1.DisableScroll;
    if ComboBox3.ItemIndex = 0 then
    begin
      fRelCReceberTipoCobr := TfRelCReceberTipoCobr.Create(Self);
      fRelCReceberTipoCobr.RLReport1.Preview;
      fRelCReceberTipoCobr.RLReport1.Free;
    end
    else
      if ComboBox3.ItemIndex = 1 then
      begin
        Le_qConsulta;
        fRelCReceberTipoCobrRed := TfRelCReceberTipoCobrRed.Create(Self);
        fRelCReceberTipoCobrRed.RLReport1.Preview;
        fRelCReceberTipoCobrRed.RLReport1.Free;
      end
      else
        if ComboBox3.ItemIndex = 2 then
        begin
          fRelCReceber2 := TfRelCReceber2.Create(Self);
          fRelCReceber2.RLReport1.Preview;
          fRelCReceber2.RLReport1.Free;
        end
        else
          if ComboBox3.ItemIndex = 3 then
          begin
            fRelCReceberCliRed := TfRelCReceberCliRed.Create(Self);
            fRelCReceberCliRed.RLReport1.Preview;
            fRelCReceberCliRed.RLReport1.Free;
          end
          else
            if ComboBox3.ItemIndex = 4 then
            begin
              fRelCopiaDupl := TfRelCopiaDupl.Create(Self);
              fRelCopiaDupl.RLReport1.Preview;
              fRelCopiaDupl.RLReport1.Free;
            end
            else
              if ComboBox3.ItemIndex = 5 then
              begin
                fRelRegDuplicatas := TfRelRegDuplicatas.Create(Self);
                fRelRegDuplicatas.RLReport1.Preview;
                fRelRegDuplicatas.RLReport1.Free;
              end;
    SMDBGrid1.EnableScroll;
    Screen.Cursor := crDefault;
  end
  else
    ShowMessage('Não existe registro para a impressão ou não foi feita a consulta!');
end;

procedure TfConsCReceber.qConsultaCalcFields(DataSet: TDataSet);
begin
  if qConsultaTransferencia.AsBoolean then
    qConsultaclTransferencia.AsString := 'T';
  if qConsultaRestParcela.AsFloat > 0 then
    qConsultaclDiasAtraso.AsFloat := Date - qConsultaDtVencCReceber.AsDateTime
  else
    qConsultaclDiasAtraso.AsFloat := qConsultaDtPagParcCReceber.AsDateTime - qConsultaDtVencCReceber.AsDateTime;
  if qConsultaclDiasAtraso.AsFloat <= 0 then
    qConsultaclDiasAtraso.AsFloat := 0;
end;

procedure TfConsCReceber.RxDBLookupCombo5Enter(Sender: TObject);
begin
  DM1.tTipoCobranca.IndexFieldNames := 'Nome';
end;

procedure TfConsCReceber.RxDBLookupCombo6Enter(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfConsCReceber.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit1.AsInteger > 0) then
    BitBtn1Click(Sender);
end;

procedure TfConsCReceber.Le_qConsulta;
begin
  ProgressBar1.Visible  := True;
  ProgressBar1.Max      := qConsulta.RecordCount;
  ProgressBar1.Position := 0;

  mTipoCobrancaRed.EmptyDataSet;
  qConsulta.First;
  while not qConsulta.Eof do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1; 
    Monta_mTipoCobrancaRed;
    qConsulta.Next;
  end;

  ProgressBar1.Visible := False;
end;

procedure TfConsCReceber.Monta_mTipoCobrancaRed;
var
  vCodContaAux, vCodCobrancaAux : Integer;
begin
  vCodContaAux    := 0;
  vCodCobrancaAux := 0;
  if qConsultaCodBancoBoleto.AsInteger > 0 then
    vCodContaAux    := qConsultaCodBancoBoleto.AsInteger;
  if qConsultaCodTipoCobranca.AsInteger > 0 then
    vCodCobrancaAux := qConsultaCodTipoCobranca.AsInteger;

  if mTipoCobrancaRed.Locate('CodConta;CodCobranca',VarArrayOf([vCodContaAux,vCodCobrancaAux]),[loCaseInsensitive]) then
    mTipoCobrancaRed.Edit
  else
  begin
    mTipoCobrancaRed.Insert;

    mTipoCobrancaRedCodConta.AsInteger    := vCodContaAux;
    mTipoCobrancaRedCodCobranca.AsInteger := vCodCobrancaAux;
    mTipoCobrancaRedCodBanco.AsString     := qConsultaCodNoBanco.AsString;
    mTipoCobrancaRedNomeBanco.AsString    := qConsultaNomeBancoBoleto.AsString;
    mTipoCobrancaRedNomeCobranca.AsString := qConsultaNomeCobranca.AsString;
  end;
  mTipoCobrancaRedValor.AsFloat := mTipoCobrancaRedValor.AsFloat + qConsultaVlrParcCReceber.AsFloat;
  mTipoCobrancaRed.Post;
end;

procedure TfConsCReceber.mTipoCobrancaRedNewRecord(DataSet: TDataSet);
begin
  mTipoCobrancaRedValor.AsFloat := 0;
end;

procedure TfConsCReceber.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qConsultaCancelado.AsBoolean then
    AFont.Color := clGray
  else
  if StrToFloat(FormatFloat('0.00', qConsultaRestParcela.AsFloat)) <= 0 then
    AFont.Color := clTeal
  else
  if qConsultaTitProtestado.AsBoolean then
   AFont.Color := clMaroon
  else
  if qConsultaclDiasAtraso.AsInteger > 0 then
   AFont.Color := clRed;
end;

end.

