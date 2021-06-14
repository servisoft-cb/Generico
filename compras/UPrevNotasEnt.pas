unit UPrevNotasEnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, DB,
  DBTables, CurrEdit, DBClient, ComCtrls, RxDBComb, Grids, DBGrids,
  SMDBGrid;

type
  TfPrevNotasEnt = class(TForm)
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    Label3: TLabel;
    DateEdit2: TDateEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    qProdutosFat: TQuery;
    Label4: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RadioGroup1: TRadioGroup;
    mAcumulado: TClientDataSet;
    mAcumuladoCodProduto: TIntegerField;
    mAcumuladoReferencia: TStringField;
    mAcumuladoNomeProduto: TStringField;
    mAcumuladoQtd: TFloatField;
    mAcumuladoUnidade: TStringField;
    mAcumuladoVlrTotal: TFloatField;
    mAcumuladoTamanho: TStringField;
    mAcumuladoCodCor: TIntegerField;
    mAcumuladoNomeCor: TStringField;
    BitBtn3: TBitBtn;
    ProgressBar1: TProgressBar;
    GroupBox1: TGroupBox;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    Label5: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Edit2: TEdit;
    Label10: TLabel;
    Label8: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    qProdutosFatFilial: TIntegerField;
    qProdutosFatNumNota: TIntegerField;
    qProdutosFatCodCor: TIntegerField;
    qProdutosFatUnidade: TStringField;
    qProdutosFatQtd: TFloatField;
    qProdutosFatReferencia: TStringField;
    qProdutosFatNome: TStringField;
    qProdutosFatDtEmissaoNEntr: TDateField;
    qProdutosFatTamanho: TStringField;
    qProdutosFatVlrUnit: TFloatField;
    qProdutosFatVlrTotal: TFloatField;
    qProdutosFatVlrDescontoItem: TFloatField;
    qProdutosFatVlrIpi: TFloatField;
    qProdutosFatlkNomeCor: TStringField;
    qProdutosFatCodProduto: TIntegerField;
    qProdutosFatPercDesc: TFloatField;
    qProdutosFatPercDescItem: TFloatField;
    DataSource1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mAcumuladoNewRecord(DataSet: TDataSet);
    procedure RxDBLookupCombo3Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private declarations }
    FTipo: String;
    procedure Monta_SQL;
    procedure Gera_Resumo;
  public
    { Public declarations }
  end;

var
  fPrevNotasEnt: TfPrevNotasEnt;

implementation

uses UDM1, Math, URelNotasEnt;

{$R *.dfm}

procedure TfPrevNotasEnt.Gera_Resumo;
var
  vVlrDescAux : Real;
  vVlrTotalAux : Real;
  vAux : Real;
  vDecimal, Texto1 : String;
  i : Integer;
begin
  ProgressBar1.Max      := qProdutosFat.RecordCount;
  ProgressBar1.Position := 0;
  mAcumulado.EmptyDataSet;
  qProdutosFat.First;
  while not qProdutosFat.Eof do
    begin
      ProgressBar1.Position := ProgressBar1.Position + 1;
      vVlrDescAux  := 0;
      vVlrTotalAux := qProdutosFatVlrTotal.AsFloat ;
      if qProdutosFatPercDesc.AsFloat > 0 then
        begin
          vVlrDescAux  := StrToFloat(FormatFloat('0.00',(qProdutosFatVlrTotal.AsFloat * qProdutosFatPercDesc.AsFloat) / 100));
          vVlrTotalAux := StrToFloat(FormatFloat('0.00',qProdutosFatVlrTotal.AsFloat - vVlrDescAux));
          vVlrDescAux  := vVlrDescAux + qProdutosFatVlrDescontoItem.AsFloat;
        end;
      mAcumulado.SetKey;
      mAcumuladoCodProduto.AsInteger := qProdutosFatCodProduto.AsInteger;
      mAcumuladoCodCor.AsInteger     := qProdutosFatCodCor.AsInteger;
      mAcumuladoTamanho.AsString     := qProdutosFatTamanho.AsString;
      mAcumuladoUnidade.AsString     := 'PC';
      if mAcumulado.GotoKey then
        mAcumulado.Edit
      else
        begin
          mAcumulado.Insert;
          mAcumuladoCodProduto.AsInteger := qProdutosFatCodProduto.AsInteger;
          mAcumuladoCodCor.AsInteger     := qProdutosFatCodCor.AsInteger;
          mAcumuladoTamanho.AsString     := qProdutosFatTamanho.AsString;
          mAcumuladoUnidade.AsString     := 'PC';
        end;
      mAcumuladoReferencia.AsString  := qProdutosFatReferencia.AsString;
      mAcumuladoNomeProduto.AsString := qProdutosFatNome.AsString;
      mAcumuladoNomeCor.AsString     := qProdutosFatlkNomeCor.AsString;
      vAux := qProdutosFatQtd.AsFloat;
      if (qProdutosFatUnidade.AsString = 'M') or
         (qProdutosFatUnidade.AsString = 'MH') or
         (qProdutosFatUnidade.AsString = 'MIL') or
         (qProdutosFatUnidade.AsString = 'ML') then
        vAux := qProdutosFatQtd.AsFloat * 1000
      else
      if (qProdutosFatUnidade.AsString = 'PR') or
         (qProdutosFatUnidade.AsString = 'PAR') or
         (qProdutosFatUnidade.AsString = 'PARS') or
         (qProdutosFatUnidade.AsString = 'PRS') then
        vAux := qProdutosFatQtd.AsFloat * 2
      else
        begin
          vDecimal := FormatFloat('0.00000',qProdutosFatQtd.AsFloat);
          i := Length(vDecimal) - 4;
          Texto1 := Copy(vDecimal,i,5);
          if Texto1 > '00000' then
            vAux := qProdutosFatQtd.AsFloat * 1000
          else
            vAux := qProdutosFatQtd.AsFloat;
        end;
      mAcumuladoQtd.AsFloat          := mAcumuladoQtd.AsFloat + vAux;
      mAcumuladoVlrTotal.AsFloat     := StrToFloat(FormatFloat('0.00',mAcumuladoVlrTotal.AsFloat + vVlrTotalAux));
      mAcumulado.Post;
      qProdutosFat.Next;
    end;
  mAcumulado.First;
end;

procedure TfPrevNotasEnt.Monta_SQL;
begin
  qProdutosFat.Close;
  qProdutosFat.SQL.Clear;
  qProdutosFat.SQL.Add('SELECT Dbnotafiscalitens.Filial, ');
  qProdutosFat.SQL.Add('		 Dbnotafiscalitens.NumNEntr NumNota, ');
  qProdutosFat.SQL.Add('		 Dbnotafiscalitens.CodMaterial CodProduto, ');
  qProdutosFat.SQL.Add('		 dbNotaFiscalItens.CodCor, ');
  qProdutosFat.SQL.Add('		 Dbnotafiscalitens.Unidade, ');
  qProdutosFat.SQL.Add('		 Dbnotafiscalitens.Qtd, ');
  qProdutosFat.SQL.Add('		 Dbproduto.Referencia, ');
  qProdutosFat.SQL.Add('		 Dbproduto.Nome, ');
  qProdutosFat.SQL.Add('		 Dbnotafiscal.DtEmissaoNEntr, ');
  qProdutosFat.SQL.Add('		 DbnotafiscalItens.Tamanho, ');
  qProdutosFat.SQL.Add('		 Dbnotafiscalitens.VlrUnit, ');
  qProdutosFat.SQL.Add('		 (Dbnotafiscalitens.VlrTotalItens + dbNotaFiscalItens.Ipi) VlrTotal, ');
  qProdutosFat.SQL.Add('		 Dbnotafiscal.PercDesc, ');
  qProdutosFat.SQL.Add('		 dbNotaFiscalItens."Desc" PercDescItem, ');
  qProdutosFat.SQL.Add('		 dbNotaFiscalItens.VlrDesc VlrDescontoItem, ');
  qProdutosFat.SQL.Add('		 dbNotaFiscalItens.VlrIpi ');
  qProdutosFat.SQL.Add('  FROM dbNEntradaItens.DB Dbnotafiscalitens ');
  qProdutosFat.SQL.Add('	 INNER JOIN dbProduto.DB Dbproduto ');
  qProdutosFat.SQL.Add('		ON  (Dbnotafiscalitens.CodMaterial = Dbproduto.Codigo) ');
  qProdutosFat.SQL.Add('	 INNER JOIN dbNEntrada.DB Dbnotafiscal ');
  qProdutosFat.SQL.Add('		ON  (Dbnotafiscal.Filial = Dbnotafiscalitens.Filial) ');
  qProdutosFat.SQL.Add('		AND (Dbnotafiscal.NumNEntr = Dbnotafiscalitens.NumNEntr) ');
  qProdutosFat.SQL.Add('		AND (Dbnotafiscal.CodForn = Dbnotafiscalitens.CodForn) ');
  qProdutosFat.SQL.Add('	 INNER JOIN dbFornecedores.DB DbFornec ');
  qProdutosFat.SQL.Add('		ON  (Dbnotafiscal.CodForn = DbFornec.CodForn) ');

  qProdutosFat.SQL.Add('WHERE   (Dbproduto.ProdMat = ' + QuotedStr(FTipo) + ' ) ' );
  //qProdutosFat.SQL.Add('   AND  (Dbnotafiscalitens.GeraDupl = True)');

  qProdutosFat.SQL.Add('   AND  (Dbnotafiscal.DtEmissaoNEntr BETWEEN :Data1 AND :Data2) ' );
  //and ((Dbnotafiscal.Cancelada = False) or (Dbnotafiscal.Cancelada is Null)) ');

  if RxDBLookupCombo1.Text <> '' then
    begin
      qProdutosFat.SQL.Add('   AND  (Dbnotafiscalitens.Filial = :Filial)');
      qProdutosFat.ParamByName('Filial').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if RxDBLookupCombo2.Text <> '' then
    begin
      qProdutosFat.SQL.Add('   AND  (Dbnotafiscal.CodForn = :CodForn)');
      qProdutosFat.ParamByName('CodForn').AsInteger := RxDBLookupCombo2.KeyValue;
    end;
  if Edit2.Text <> '' then
    qProdutosFat.SQL.Add(' AND dbProduto.Nome LIKE ''%' + Edit2.Text + '%''')
  else
  if RxDBLookupCombo3.Text <> '' then
    begin
      qProdutosFat.SQL.Add('   AND  (DbnotafiscalItens.CodMaterial = :CodProduto)');
      qProdutosFat.ParamByName('CodProduto').AsInteger := RxDBLookupCombo3.KeyValue;
    end;

  qProdutosFat.ParamByName('Data1').AsDate := DateEdit1.Date;
  qProdutosFat.ParamByName('Data2').AsDate := DateEdit2.Date;

  case RadioGroup1.ItemIndex of
    0 : qProdutosFat.SQL.Add('ORDER BY Dbproduto.Nome, dbNotaFiscalItens.CodCor, dbNotaFiscalItens.Tamanho, Dbnotafiscal.DtEmissaoNEntr, dbnotafiscalitens.numNEntr');
    1 : qProdutosFat.SQL.Add('ORDER BY Dbnotafiscal.DtEmissaoNEntr, dbnotafiscalitens.numNEntr, Dbproduto.Nome, dbNotaFiscalItens.CodCor, dbNotaFiscalItens.Tamanho');
    2 : qProdutosFat.SQL.Add('ORDER BY dbnotafiscalitens.numNEntr, Dbnotafiscal.DtEmissaoNEntr, Dbproduto.Nome, dbNotaFiscalItens.CodCor, dbNotaFiscalItens.Tamanho');
  end;

  qProdutosFat.Open;
  qProdutosFat.First;
end;

procedure TfPrevNotasEnt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tCliente.Close;
  DM1.tProduto.Close;
  DM1.tProdutoCor.Close;
  DM1.tProdutoGrade.Close;
  DM1.tProdutoTam.Close;
  DM1.tUnidade.Close;
  DM1.tFornecedores.Close;
  Action := Cafree;
end;

procedure TfPrevNotasEnt.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevNotasEnt.BitBtn1Click(Sender: TObject);
begin
  if (DateEdit1.Text = '  /  /    ') or (DateEdit2.Text = '  /  /    ') then
    ShowMessage('Falta informar as data!')
  else
    begin
      Screen.Cursor := crHourGlass;

      if Edit2.Text <> '' then
        begin
          RxDBLookupCombo3.ClearValue;
        end;

      Monta_SQL;
      Screen.Cursor   := crDefault;
      fRelNotasEnt := TfRelNotasEnt.Create(Self);
      fRelNotasEnt.QuickRep1.Preview;
      fRelNotasEnt.QuickRep1.Free;
    end;
end;

procedure TfPrevNotasEnt.RxDBLookupCombo2Enter(Sender: TObject);
begin                        
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfPrevNotasEnt.CurrencyEdit1Exit(Sender: TObject);
begin
  if CurrencyEdit1.AsInteger > 0 then
    begin
      DM1.tProduto.IndexFieldNames := 'Codigo';
      DM1.tProduto.SetKey;
      DM1.tProdutoCodigo.AsInteger := CurrencyEdit1.AsInteger;
      if DM1.tProduto.GotoKey then
        RxDBLookupCombo3.KeyValue := DM1.tProdutoCodigo.AsInteger
      else
        begin
          ShowMessage('Produto/Material não cadastrado!');
          CurrencyEdit1.SetFocus;
          CurrencyEdit1.Clear;
        end;
    end
  else
    RxDBLookupCombo3.ClearValue;
end;

procedure TfPrevNotasEnt.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tProduto.IndexFieldNames := 'Nome';
end;

procedure TfPrevNotasEnt.FormShow(Sender: TObject);
begin
  DM1.tCliente.Open;
  DM1.tProduto.Open;
  DM1.tProdutoCor.Open;
  DM1.tProdutoGrade.Open;
  DM1.tProdutoTam.Open;
  DM1.tUnidade.Open;
  DM1.tFornecedores.Open;
end;

procedure TfPrevNotasEnt.mAcumuladoNewRecord(DataSet: TDataSet);
begin
  mAcumuladoQtd.AsFloat      := 0;
  mAcumuladoVlrTotal.AsFloat := 0;
end;

procedure TfPrevNotasEnt.RxDBLookupCombo3Change(Sender: TObject);
begin
  if RxDBLookupCombo3.Text <> '' then
    CurrencyEdit1.AsInteger := RxDBLookupCombo3.KeyValue
  else
    CurrencyEdit1.Clear;
end;

procedure TfPrevNotasEnt.BitBtn3Click(Sender: TObject);
begin
  if (DateEdit1.Text = '  /  /    ') or (DateEdit2.Text = '  /  /    ') then
    ShowMessage('Falta informar as data!')
  else
    begin
      Screen.Cursor := crHourGlass;
      if Edit2.Text <> '' then
        begin
          RxDBLookupCombo3.ClearValue;
        end;
      Monta_SQL;
      Gera_Resumo;
      Screen.Cursor   := crDefault;
      fRelNotasEnt := TfRelNotasEnt.Create(Self);
      fRelNotasEnt.QuickRep2.Preview;
      fRelNotasEnt.QuickRep2.Free;
    end;
end;

procedure TfPrevNotasEnt.FormCreate(Sender: TObject);
begin
  FTipo := 'P';
end;

procedure TfPrevNotasEnt.RadioButton1Click(Sender: TObject);
begin

  if RadioButton1.Checked then
    FTipo := 'P'
  else
    FTipo := 'M';
  DM1.tProduto.Filtered := False;
  DM1.tProduto.Filter := 'ProdMat = ' + QuotedStr(FTipo);
  DM1.tProduto.Filtered := True;

  CurrencyEdit1.AsInteger := 0;
  RxDBLookupCombo3.ClearValue;
  CurrencyEdit1.SetFocus;
end;

end.
