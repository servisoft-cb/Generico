unit UPrevNotasNatOpe2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, rsDBUtils, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, Db, DBTables,
  MemTable, RXLookup, DBFilter, ComCtrls, Grids, DBGrids, DBClient, Variants;

type
  TfPrevNotasNatOpe2 = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    RxDBFilter1: TRxDBFilter;
    ProgressBar1: TProgressBar;
    Bevel1: TBevel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    lcliente: TLabel;
    rxdbclientenotaprev: TRxDBLookupCombo;
    Label5: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    CheckBox1: TCheckBox;
    mNatureza: TClientDataSet;
    mNaturezaCodNatOper: TIntegerField;
    mNaturezaDtEmissao: TDateField;
    mNaturezaNota: TIntegerField;
    mNaturezaCodCliente: TIntegerField;
    mNaturezaVTotal: TFloatField;
    mNaturezaVMercadoria: TFloatField;
    mNaturezaVBase: TFloatField;
    mNaturezaVIcms: TFloatField;
    mNaturezaVIsentas: TFloatField;
    mNaturezaVOutras: TFloatField;
    mNaturezaUF: TStringField;
    mNaturezaNomeCliente: TStringField;
    dsmNatureza: TDataSource;
    mNaturezaFilial: TIntegerField;
    mNaturezaNatOper: TIntegerField;
    mNaturezaSerie: TStringField;
    mNaturezaVlrFrete: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure mNaturezaNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure rxdbclientenotaprevEnter(Sender: TObject);
  private
    { Private declarations }
    vBaseIcms: Real;
    vTotal, vMercadoria, vBase, vIcms, vOutras: Real;
    procedure Imprimir;
    procedure Imprime_Cabecalho;
    procedure Imprime_Detalhe;
    procedure Imprime_TotalNatOper;
    procedure Imprime_Rodape;
    procedure Calcula_Desconto;
  public
    { Public declarations }
  end;

var
  fPrevNotasNatOpe2: TfPrevNotasNatOpe2;
  linha, pagina, vCodNatOper: Integer;
  F: TextFile;
  TextoDet: string;

implementation

uses UDM1, UEscImpressora, URelNatNota2;

{$R *.DFM}

procedure TfPrevNotasNatOpe2.Calcula_Desconto;
var
  vBaseItemDesc: Real;
  vBaseAux: Real;
  vPercAux: Real;
  vAux: Real;
begin
  mNatureza.Edit;
  mNaturezaVTotal.AsFloat      := mNaturezaVTotal.AsFloat - DM1.tNotaFiscalVlrTotalDesc.AsFloat;
  mNaturezaVMercadoria.AsFloat := mNaturezaVMercadoria.AsFloat - DM1.tNotaFiscalVlrTotalDesc.AsFloat;
  mNaturezaVBase.AsFloat       := DM1.tNotaFiscalBaseIcms.AsFloat;
  mNaturezaVIcms.AsFloat       := DM1.tNotaFiscalVlrIcms.AsFloat;
  mNaturezaVOutras.AsFloat     := mNaturezaVTotal.AsFloat - mNaturezaVBase.AsFloat;
  if mNaturezaVOutras.AsFloat < 0 then
    mNaturezaVOutras.AsFloat := 0;
  mNatureza.Post;
end;

procedure TfPrevNotasNatOpe2.Imprimir;
var
  Texto: string;
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  linha := 99;
  pagina := 0;
  AssignFile(F, DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F, #15);
  vCodNatOper := 0;
  mNatureza.First;
  while not mNatureza.EOF do
    begin
      if (vCodNatOper > 0) and (vCodNatOper <> mNaturezaCodNatOper.AsInteger) then
        Imprime_TotalNatOper;
      if linha > 61 then
        Imprime_Cabecalho;
      Imprime_Detalhe;
      vCodNatOper := mNaturezaCodNatOper.AsInteger;
      mNatureza.Next;
    end;
  Imprime_TotalNatOper;
  Imprime_Rodape;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
    begin
      Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
      WinExec(PChar(Texto), SW_MAXIMIZE);
    end;
end;

procedure TfPrevNotasNatOpe2.Imprime_Cabecalho;
var
  i: Integer;
  texto1: string;
begin
  pagina := pagina + 1;
  if Pagina > 1 then
    begin
      while linha < 66 do
        begin
          Linha := Linha + 1;
          Writeln(F);
        end;
    end;

  DM1.tEmpresa.First;
  Texto1 := Copy(DM1.tEmpresaEmpresa.AsString, 1, 50);
  for i := 1 to 53 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'RELACAO DE NOTAS EMITIDAS                                   Pagina.: ' + IntToStr(pagina);
  Writeln(F, Texto1);

  Texto1 := 'Periodo: ' + DateEdit1.Text + ' a ' + DateEdit2.Text +
    '                                                                                 Emissao: ' + DateToStr(Date);
  Writeln(F, Texto1);
  Writeln(F, '------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F, 'Nat. UF Codigo Cliente               Nota Dt.Emissao      Vlr.Total Vlr.Mercadoria      Base ICMS     Vlr.ICMS    Insetas     Outras');
  Writeln(F, '------------------------------------------------------------------------------------------------------------------------------------');
  linha := 5;
end;

procedure TfPrevNotasNatOpe2.Imprime_Detalhe;
var
  i: Integer;
  Texto1: string;
begin
  Texto1 := '';
  Texto1 := mNaturezaCodNatOper.AsString;
  TextoDet := Texto1 + ' ';
  Texto1 := mNaturezaUF.AsString;
  for i := 1 to 2 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1 := mNaturezaCodCliente.AsString;
  for i := 1 to 6 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1 := copy(mNaturezaNomeCliente.AsString, 1, 18);
  for i := 1 to 18 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1 := mNaturezaNota.AsString;
  for i := 1 to 7 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  TextoDet := TextoDet + mNaturezaDtEmissao.AsString + ' ';
  Texto1 := FormatFloat('###,###,##0.00', mNaturezaVTotal.AsFloat);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1 := FormatFloat('###,###,##0.00', mNaturezaVMercadoria.AsFloat);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1 := FormatFloat('###,###,##0.00', mNaturezaVBase.AsFloat);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1 := FormatFloat('#,###,##0.00', mNaturezaVIcms.AsFloat);
  for i := 1 to 12 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1 := FormatFloat('#,###,##0.00', mNaturezaVIsentas.AsFloat);
  for i := 1 to 10 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1 := FormatFloat('###,##0.00', mNaturezaVOutras.AsFloat);
  for i := 1 to 10 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Writeln(F, TextoDet);
  Linha := Linha + 1;
  vTotal := vTotal + mNaturezaVTotal.AsFloat;
  vMercadoria := vMercadoria + mNaturezaVMercadoria.AsFloat;
  vBase := vBase + mNaturezaVBase.AsFloat;
  vIcms := vIcms + mNaturezaVIcms.AsFloat;
  vOutras := vOutras + mNaturezaVOutras.AsFloat;
end;

procedure TfPrevNotasNatOpe2.Imprime_TotalNatOper;
var
  i: Integer;
  Texto1: string;
begin
  Writeln(F, '                              ------------------------------------------------------------------------------------------------------');
  TextoDet := '                              Total da Natureza ';
  Texto1 := IntToStr(vCodNatOper);
  for i := 1 to 4 - Length(Texto1) do
    Texto1 := Texto1 + '.';
  TextoDet := TextoDet + Texto1 + ':';

  Texto1 := FormatFloat('###,###,##0.00', vTotal);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1 := FormatFloat('###,###,##0.00', vMercadoria);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1 := FormatFloat('###,###,##0.00', vBase);
  for i := 1 to 14 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1 := FormatFloat('#,###,##0.00', vIcms);
  for i := 1 to 12 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1 := '0,00';
  for i := 1 to 10 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Texto1 := FormatFloat('###,##0.00', vOutras);
  for i := 1 to 10 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoDet := TextoDet + Texto1 + ' ';
  Writeln(F, TextoDet);
  Writeln(F);
  Linha := Linha + 3;
  vTotal := 0;
  vMercadoria := 0;
  vBase := 0;
  vICMS := 0;
  vOutras := 0;
end;

procedure TfPrevNotasNatOpe2.Imprime_Rodape;
var
  i: Integer;
  Texto1: string;
  vVlrTotal2, vVlrMercadoria2, vBaseICMS2, vVlrICMS2, vVlrOutras2: Real;
begin
  vVlrTotal2 := 0;
  vVlrMercadoria2 := 0;
  vBaseICMS2 := 0;
  vVlrICMS2 := 0;
  vVlrOutras2 := 0;
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F, #18);
end;

procedure TfPrevNotasNatOpe2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tNotaFiscal.MasterSource.Enabled := True;
  DM1.tNotaFiscal.Filtered := False;
  oDBUtils.OpenTables(False,Self);
  Action := caFree;
end;

procedure TfPrevNotasNatOpe2.BitBtn6Click(Sender: TObject);
var
  vVlrDesconto: Real;
  vCodNatDesc: Integer;
begin
  if (DateEdit1.Date <= 0) or (DateEdit2.Date <= 0) then
    begin
      ShowMessage('Falta informar a data!');
      Exit;
    end
  else
  if DateEdit1.Date > DateEdit2.Date then
    ShowMessage('Data inicial maior que data final!')
  //else if RxDBLookupCombo1.Text = '' then
  //  ShowMessage('Falta informar a filial!')
  else
    begin
      if RxDBLookupCombo2.Text <> '' then
        CheckBox1.Checked := False;
      mNatureza.EmptyDataSet;

      // Aumenta o tamanho do form para aperecer o progressbar e o cursor fica uma ampulheta
      vTotal      := 0;
      vMercadoria := 0;
      vBase       := 0;
      vICMS       := 0;
      vOutras     := 0;
      Screen.Cursor := crHourglass;
      if RxDBLookupCombo1.Text <> '' then
        DM1.tNotaFiscal.MasterSource.Enabled := True
      else
        DM1.tNotaFiscal.MasterSource.Enabled := False;
      DM1.tNatOperacao.IndexFieldNames := 'Codigo';
      Dm1.tNotaFiscal.Filtered := False;
      if rxdbclientenotaprev.Text = '' then
        Dm1.tNotaFiscal.Filter := 'DtEmissao >= ''' + DateEdit1.Text + ''' and DtEmissao <= ''' + DateEdit2.Text + ''''
      else
        Dm1.tNotaFiscal.Filter := 'DtEmissao >= ''' + DateEdit1.Text + ''' and DtEmissao <= ''' + DateEdit2.Text + ''' and CodCli = ''' + IntToStr(rxdbclientenotaprev.KeyValue) + '''';
      Dm1.tNotaFiscal.Filtered := True;
      ProgressBar1.Position := 0;
      ProgressBar1.Max := DM1.tNotaFiscal.RecordCount;
      // Grava o auxiliar
      DM1.tNotaFiscal.Refresh;
      DM1.tNotaFiscal.First;
      while not DM1.tNotaFiscal.Eof do
        begin
          vVlrDesconto := DM1.tNotaFiscalVlrTotalDesc.AsFloat;
          vCodNatOper := 0;
          vCodNatDesc := 0;
          DM1.tNotaFiscalItens.First;
          while not DM1.tNotaFiscalItens.Eof do
            begin
              if (RxDBLookupCombo2.Text = '') or ((RxDBLookupCombo2.Text <> '') and
                (DM1.tNotaFiscalItensNatOper.AsInteger = RxDBLookupCombo2.KeyValue)) then
                begin
                  DM1.tNatOperacao.SetKey;
                  DM1.tNatOperacaoCodigo.AsInteger := DM1.tNotaFiscalItensNatOper.AsInteger;
                  if DM1.tNatOperacao.GotoKey then
                    vCodNatOper := DM1.tNatOperacaoCodNatOper.AsInteger;
                  if DM1.tNatOperacaoGeraDuplicata.AsBoolean then
                    vCodNatDesc := vCodNatOper;
                  if not (CheckBox1.Checked) or ((CheckBox1.Checked) and (DM1.tNatOperacaoGeraDuplicata.AsBoolean)) then
                    begin
                      if mNatureza.Locate('Filial;Nota;CodNatOper;Serie', VarArrayOf([DM1.tNotaFiscalFilial.AsInteger, DM1.tNotaFiscalNumNota.AsInteger, vCodNatOper,DM1.tNotaFiscalSerie.AsString]), [locaseinsensitive]) then
                        mNatureza.Edit
                      else
                        begin
                          mNatureza.Insert;
                          mNaturezafilial.AsInteger     := DM1.tNotaFiscalFilial.AsInteger;
                          mNaturezaNota.AsInteger       := DM1.tNotaFiscalNumNota.AsInteger;
                          mNaturezaDtEmissao.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
                          mNaturezaCodNatOper.AsInteger := vCodNatOper;
                          mNaturezaCodCliente.AsInteger := DM1.tNotaFiscalCodCli.AsInteger;
                          mNaturezaNomeCliente.AsString := DM1.tNotaFiscallkNomeCli.AsString;
                          mNaturezaUF.AsString          := DM1.tNotaFiscallkUf.AsString;
                          mNaturezaNatOper.AsInteger    := DM1.tNotaFiscalItensNatOper.AsInteger;
                          mNaturezaSerie.AsString       := DM1.tNotaFiscalSerie.AsString;
                        end;
                      mNaturezaVTotal.AsFloat   := mNaturezaVTotal.AsFloat + DM1.tNotaFiscalItensVlrTotal.AsFloat;
                      mNaturezaVlrFrete.AsFloat := mNaturezaVlrFrete.AsFloat + DM1.tNotaFiscalItensVlrFrete.AsFloat;
                      
                      if DM1.tNatOperacaoSomaMercNF.AsBoolean then
                      begin
                        mNaturezaVMercadoria.AsFloat := mNaturezaVMercadoria.AsFloat + DM1.tNotaFiscalItensVlrTotal.AsFloat;
                        mNaturezaVOutras.AsFloat     := mNaturezaVOutras.AsFloat + (DM1.tNotaFiscalItensVlrTotal.AsFloat - DM1.tNotaFiscalItensBaseIcms.AsFloat);
                      end
                      else
                        mNaturezaVOutras.AsFloat := 0;
                      mNaturezaVBase.AsFloat    := mNaturezaVBase.AsFloat + DM1.tNotaFiscalItensBaseIcms.AsFloat;
                      mNaturezaVIcms.AsFloat    := mNaturezaVIcms.AsFloat + DM1.tNotaFiscalItensVlrIcms.AsFloat;
                      mNaturezaVIsentas.AsFloat := 0;
                      mNatureza.Post;
                    end;
                end;
              DM1.tNotaFiscalItens.Next;
            end;
          ProgressBar1.Position := ProgressBar1.Position + 1;
          if (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDesc.AsFloat)) > 0) and (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalPercDesc.AsFloat)) > 0) then
          begin
            if mNatureza.Locate('Filial;Nota;CodNatOper;Serie', VarArrayOf([DM1.tNotaFiscalFilial.AsInteger, DM1.tNotaFiscalNumNota.AsInteger, vCodNatDesc,DM1.tNotaFiscalSerie.AsString]), [locaseinsensitive]) then
              Calcula_Desconto;
          end;
          DM1.tNotaFiscal.Next;
        end;
      mNatureza.First;
      if mNatureza.RecordCount > 0 then
        begin
          Screen.Cursor := crDefault;
          case RadioGroup1.ItemIndex of
            0: Imprimir;
            1:
              begin
                fRelNatNota2 := TfRelNatNota2.Create(Self);
                fRelNatNota2.RLReport1.Preview;
                fRelNatNota2.RLReport1.Free;
              end;
          end;
        end;
      Dm1.tNotaFiscal.Filtered := False;
      DM1.tNotaFiscal.IndexFieldNames := 'Filial;NumSeq';
    end;
end;

procedure TfPrevNotasNatOpe2.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevNotasNatOpe2.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tNatOperacao.IndexFieldNames := 'CodNatOper';
end;

procedure TfPrevNotasNatOpe2.mNaturezaNewRecord(DataSet: TDataSet);
begin
  mNaturezaVBase.AsFloat       := 0;
  mNaturezaVIcms.AsFloat       := 0;
  mNaturezaVIsentas.AsFloat    := 0;
  mNaturezaVMercadoria.AsFloat := 0;
  mNaturezaVOutras.AsFloat     := 0;
  mNaturezaVTotal.AsFloat      := 0;
end;

procedure TfPrevNotasNatOpe2.FormCreate(Sender: TObject);
begin
  oDBUtils.OpenTables(True,Self);
  oDBUtils.ActiveDataSet(True,DM1.tNotaFiscal,Name);
  oDBUtils.ActiveDataSet(True,DM1.tNotaFiscalItens,Name);
end;

procedure TfPrevNotasNatOpe2.rxdbclientenotaprevEnter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

end.

