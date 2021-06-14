unit UContasPagar2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Grids,
  DBGrids, RXDBCtrl, RXLookup, Db, DBTables, RXSplit, DBFilter, RXCtrls, Menus, Printers, Mask, ToolEdit, CurrEdit, ALed, Variants,
  SMDBGrid;

type
  TfContasPagar2 = class(TForm)
    qParcelas: TQuery;
    qParcelasFilial: TIntegerField;
    qParcelasNumCPagar: TIntegerField;
    qParcelasParcCPagar: TIntegerField;
    qParcelasNumNotaEnt: TIntegerField;
    qParcelasCodForn: TIntegerField;
    qParcelasPgtoParcial: TFloatField;
    qParcelasRestParcela: TFloatField;
    qParcelasDesconto: TFloatField;
    qParcelasDtPagParcCPagar: TDateField;
    qParcelasVlrParcCPagar: TFloatField;
    qParcelasDtVencCPagar: TDateField;
    qParcelasCodConta: TIntegerField;
    qParcelasDtRecto: TDateField;
    qParcelasDtGerado: TDateField;
    qParcelasVlrDevolucao: TFloatField;
    qParcelasDiasAtraso: TFloatField;
    qParcelasNomeForn: TStringField;
    qParcelasNomeConta: TStringField;
    dsqParcelas: TDataSource;
    qParcelasclDiasAtraso: TFloatField;
    qParcelasNroDuplicata: TIntegerField;
    Panel5: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label14: TLabel;
    Label27: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label22: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    CurrencyEdit2: TCurrencyEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    BitBtn7: TBitBtn;
    GroupBox2: TGroupBox;
    ALed1: TALed;
    Label9: TLabel;
    ALed2: TALed;
    Label10: TLabel;
    ALed3: TALed;
    Label11: TLabel;
    ALed4: TALed;
    Label12: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ProgressBar1: TProgressBar;
    CurrencyEdit1: TCurrencyEdit;
    Panel2: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn8: TBitBtn;
    Panel3: TPanel;
    Label5: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label4: TLabel;
    Label21: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    qParcelasNumSolicitacao: TIntegerField;
    Label19: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    tPlanoContas: TTable;
    tPlanoContasCodigo: TIntegerField;
    tPlanoContasDescricao: TStringField;
    tPlanoContasItens: TTable;
    tPlanoContasItensCodPlano: TIntegerField;
    tPlanoContasItensCodItem: TIntegerField;
    tPlanoContasItensNome: TStringField;
    qParcelasNomePlanoContas: TStringField;
    qParcelasNomePlanoContasItens: TStringField;
    tFilial: TTable;
    tFilialCodigo: TIntegerField;
    tFilialEmpresa: TStringField;
    CheckBox1: TCheckBox;
    qParcelaslkNomeFilial: TStringField;
    RxSpeedButton2: TRxSpeedButton;
    Label23: TLabel;
    ComboBox3: TComboBox;
    CheckBox2: TCheckBox;
    Panel1: TPanel;
    Label24: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    qCentroCusto: TQuery;
    dsqCentroCusto: TDataSource;
    qParcelasNomeCentroCusto: TStringField;
    qParcelasNomeCentroCustoItem: TStringField;
    qParcelasCodCentroCusto: TIntegerField;
    qParcelasCodCentroCustoItem: TIntegerField;
    CheckBox3: TCheckBox;
    qParcelasSerie: TStringField;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qParcelasCalcFields(DataSet: TDataSet);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure Panel1Enter(Sender: TObject);
  private
    { Private declarations }
    vSQL : String;
    vExiste : Boolean;
    vFilialDep : String;
    procedure Monta_SQLqParcelas;
    procedure Posiciona_Parcela;
    procedure Monta_FilialDep;
  public
    { Public declarations }
  end;

var
  fContasPagar2: TfContasPagar2;

implementation

uses UDM1, UContasPagarPag, UCPagarAltera, UConsCPagarHist, UEstPagamentoPagar, UContasPagarDev, URelCPagar2, UContasPagarPagSel,
  ULancaCPagar, URelCPagarPlano;

{$R *.DFM}

procedure TfContasPagar2.Posiciona_Parcela;
begin
  vExiste := False;                                    
  DM1.tFilial.Locate('Codigo',qParcelasFilial.AsInteger,[loCaseInsensitive]);
  if DM1.tCPagar.Locate('Filial;NumCPagar',VarArrayOf([qParcelasFilial.AsInteger,qParcelasNumCPagar.AsInteger]),[locaseinsensitive]) then
    if DM1.tCPagarParc.Locate('Filial;NumCPagar;ParcCPagar',VarArrayOf([qParcelasFilial.AsInteger,qParcelasNumCPagar.AsInteger,qParcelasParcCPagar.AsInteger]),[locaseinsensitive]) then
      vExiste := True;
  if not vExiste then
    ShowMessage('Parcela não encontrada no contas a pagar!');
end;

procedure TfContasPagar2.Monta_SQLqParcelas;
var
  vOrderAux : String;
begin
  Monta_FilialDep;

  {qParcelas.Close;
  qParcelas.SQL.Clear;
  qParcelas.SQL.Add('SELECT Dbcpagar.Filial, Dbcpagar.NumCPagar, Dbcpagarparc.ParcCPagar, Dbcpagarparc.NumNotaEnt, ');
  qParcelas.SQL.Add(' Dbcpagarparc.CodForn, Dbcpagarparc.PgtoParcial, Dbcpagarparc.RestParcela, Dbcpagarparc.Desconto, ');
  qParcelas.SQL.Add(' Dbcpagarparc.DtPagParcCPagar, Dbcpagarparc.VlrParcCPagar, Dbcpagarparc.DtVencCPagar, ');
  qParcelas.SQL.Add(' Dbcpagarparc.NroDuplicata, Dbcpagarparc.CodConta, Dbcpagarparc.DtRecto, Dbcpagarparc.DtGerado, ');
  qParcelas.SQL.Add(' Dbcpagarparc.VlrDevolucao, Dbcpagarparc.DiasAtraso, Dbfornecedores.NomeForn, Dbcontas.NomeConta, ');
  qParcelas.SQL.Add(' dbCPagarParc.NumSolicitacao, dbPlanoContas.Descricao NomePlanoContas, dbPlanoContasItens.Nome NomePlanoContasItens, ');
  qParcelas.SQL.Add(' dbCPagarParc.CodCentroCusto, dbCPagarParc.CodCentroCustoItem  ');
  if DM1.tParametrosUsaCentroCusto.AsBoolean then
    qParcelas.SQL.Add(' , dbCentroCusto.Nome NomeCentroCusto, dbCentroCustoItem.NomeItem NomeCentroCustoItem ');
  qParcelas.SQL.Add(' FROM "dbCPagar.DB" Dbcpagar');
  qParcelas.SQL.Add(' INNER JOIN "dbCPagarParc.DB" Dbcpagarparc');
  qParcelas.SQL.Add('   ON  (Dbcpagar.Filial = Dbcpagarparc.Filial)');
  qParcelas.SQL.Add('   AND  (Dbcpagar.NumCPagar = Dbcpagarparc.NumCPagar)');
  qParcelas.SQL.Add(' INNER JOIN "dbFornecedores.DB" Dbfornecedores');
  qParcelas.SQL.Add('   ON  (Dbcpagarparc.CodForn = Dbfornecedores.CodForn)');
  qParcelas.SQL.Add(' FULL OUTER JOIN "dbContas.DB" Dbcontas');
  qParcelas.SQL.Add('   ON  (Dbcpagarparc.CodConta = Dbcontas.CodConta)');
  qParcelas.SQL.Add(' FULL OUTER JOIN "dbPlanoContas.DB" dbPlanoContas');
  qParcelas.SQL.Add('   ON  (Dbcpagarparc.PlanoContas = dbPlanoContas.Codigo)');
  qParcelas.SQL.Add(' FULL OUTER JOIN "dbPlanoContasItens.DB" dbPlanoContasItens');
  qParcelas.SQL.Add('   ON  (Dbcpagarparc.PlanoContas = dbPlanoContasItens.CodPlano)');
  qParcelas.SQL.Add('   AND (Dbcpagarparc.CodPlanoContasItens = dbPlanoContasItens.CodItem)');}

  qParcelas.Close;
  qParcelas.SQL.Clear;
  qParcelas.SQL.Add(vSQL);
  {if DM1.tParametrosUsaCentroCusto.AsBoolean then
  begin
    qParcelas.SQL.Add(' FULL OUTER JOIN "dbCentroCusto.DB" dbCentroCusto ');
    qParcelas.SQL.Add('  ON  (Dbcpagarparc.CodCentroCusto = dbCentroCusto.Codigo) ');
    qParcelas.SQL.Add(' FULL OUTER JOIN "dbCentroCustoItem.DB" dbCentroCustoItem ');
    qParcelas.SQL.Add('  ON  (Dbcpagarparc.CodCentroCusto     = dbCentroCustoItem.CodCentroCusto) ');
    qParcelas.SQL.Add('  AND (Dbcpagarparc.CodCentroCustoItem = dbCentroCustoItem.CodItem) ');
  end;}
  qParcelas.SQL.Add(' WHERE  (0 = 0) ');
  if vFilialDep <> '' then
    qParcelas.SQL.Add(' AND (dbCPagarParc.Filial IN (' + vFilialDep + ') ) ')
  else
  if RxDBLookupCombo2.Text <> '' then
  begin
    qParcelas.SQL.Add(' AND (dbCPagarParc.Filial = :Filial) ');
    qParcelas.ParamByName('Filial').AsInteger := RxDBLookupCombo2.KeyValue;
  end;

  if RxDBLookupCombo3.Text <> '' then
  begin
    qParcelas.SQL.Add(' AND (dbCPagarParc.CodCentroCusto = :CodCentroCusto) ');
    qParcelas.ParamByName('CodCentroCusto').AsInteger := RxDBLookupCombo3.KeyValue;
  end;

  if RxDBLookupCombo1.Text <> '' then
  begin
    qParcelas.SQL.Add(' AND (dbCPagarParc.CodForn = :CodForn) ');
    qParcelas.ParamByName('CodForn').AsInteger := RxDBLookupCombo1.KeyValue;
  end;
  if CurrencyEdit1.AsInteger > 0 then
  begin
    qParcelas.SQL.Add(' AND (dbCPagarParc.NroDuplicata = :NroDuplicata) ');
    qParcelas.ParamByName('NroDuplicata').AsInteger := CurrencyEdit1.AsInteger;
  end;
  if CurrencyEdit3.AsInteger > 0 then
  begin
    qParcelas.SQL.Add(' AND (dbCPagarParc.NumSolicitacao = :NumSolicitacao) ');
    qParcelas.ParamByName('NumSolicitacao').AsInteger := CurrencyEdit3.AsInteger;
  end;
  if CurrencyEdit2.AsInteger > 0 then
  begin
    qParcelas.SQL.Add(' AND (dbCPagarParc.NumCPagar = :NumCPagar) ');
    qParcelas.ParamByName('NumCPagar').AsInteger := CurrencyEdit2.AsInteger;
  end;
  if DateEdit1.Date > 0 then
  begin
    qParcelas.SQL.Add(' AND (dbCPagarParc.DtVencCPagar >= :DtVectoIni) ');
    qParcelas.ParamByName('DtVectoIni').AsDate := DateEdit1.Date;
  end;
  if DateEdit2.Date > 0 then
  begin
    qParcelas.SQL.Add(' AND (dbCPagarParc.DtVencCPagar <= :DtVectoFin) ');
    qParcelas.ParamByName('DtVectoFin').AsDate := DateEdit2.Date;
  end;
  if DateEdit3.Date > 0 then
  begin
    qParcelas.SQL.Add(' AND (dbCPagarParc.DtGerado >= :DtEmissaoIni) ');
    qParcelas.ParamByName('DtEmissaoIni').AsDate := DateEdit3.Date;
  end;
  if DateEdit4.Date > 0 then
  begin
    qParcelas.SQL.Add(' AND (dbCPagarParc.DtGerado <= :DtEmissaoFin) ');
    qParcelas.ParamByName('DtEmissaoFin').AsDate := DateEdit4.Date;
  end;
  case ComboBox1.ItemIndex of
    0 : qParcelas.SQL.Add(' AND (dbCPagarParc.RestParcela > 0)');
    1 : qParcelas.SQL.Add(' AND (dbCPagarParc.PgtoParcial > 0)');
  end;
  case ComboBox3.ItemIndex of
    0 : qParcelas.SQL.Add(' AND (dbCPagarParc.NumSolicitacao <= 0)');
    1 : qParcelas.SQL.Add(' AND (dbCPagarParc.NumSolicitacao > 0)');
  end;

  if CheckBox3.Checked then
  begin
    CheckBox1.Checked := True;
    CheckBox2.Checked := True;
  end;

  vOrderAux := '';
  if (CheckBox1.Checked) or (CheckBox2.Checked) then
    vOrderAux := 'dbCPagar.Filial, '
  else
    vOrderAux := '';

  if CheckBox3.Checked then
    vOrderAux := vOrderAux + ' dbCentroCusto.Nome, dbCentroCustoItem.NomeItem, ';

  case ComboBox2.ItemIndex of
    0 : qParcelas.SQL.Add('ORDER BY ' + vOrderAux + 'dbCPagarParc.DtVencCPagar, dbFornecedores.NomeForn, dbCPagarParc.NroDuplicata');
    1 : qParcelas.SQL.Add('ORDER BY ' + vOrderAux + 'dbCPagarParc.DtGerado, dbFornecedores.NomeForn, dbCPagarParc.NroDuplicata');
    2 : qParcelas.SQL.Add('ORDER BY ' + vOrderAux + 'dbFornecedores.NomeForn, dbCPagarParc.DtVencCPagar, dbCPagarParc.NroDuplicata');
    3 : qParcelas.SQL.Add('ORDER BY ' + vOrderAux + 'dbCPagarParc.NroDuplicata, dbFornecedores.NomeForn, dbCPagarParc.DtVencCPagar');
    4 : qParcelas.SQL.Add('ORDER BY ' + vOrderAux + 'dbCPagarParc.VlrParcCPagar, dbFornecedores.NomeForn, dbCPagarParc.DtVencCPagar');
    5 : qParcelas.SQL.Add('ORDER BY ' + vOrderAux + 'dbPlanoContas.Descricao, dbPlanoContasItens.Nome, dbCPagarParc.DtVencCPagar');
  end;

  qParcelas.Open;
end;

procedure TfContasPagar2.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfContasPagar2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.GravaGrid(SMDBGrid1,Name);
  qCentroCusto.Close;
  if Screen.FormCount < 3 then
  begin
    Dm1.tCPagarParcHist.Close;
    Dm1.tCPagarParc.Close;
    Dm1.tCPagar.Close;
    Dm1.tFornecedores.Close;
    DM1.tJuros.Close;
    DM1.tMovimentos.Close;
    DM1.tContas.Close;
    DM1.tChequeCPagar.Close;
    DM1.tCheque.Close;
    DM1.tNEntrada.Close;
    DM1.tPlanoContasItens.Close;
    DM1.tPlanoContas.Close;
  end;
  Action := Cafree;
end;

procedure TfContasPagar2.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfContasPagar2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F4 then
    BitBtn7Click(Sender);
  if key = vk_F5 then
    BitBtn1Click(Sender);
  if key = vk_F6 then
    BitBtn2Click(Sender);
  if key = vk_F7 then
    BitBtn3Click(Sender);
  if key = vk_F8 then
    BitBtn5Click(Sender);
  if key = vk_F9 then
    BitBtn6Click(Sender);
end;

procedure TfContasPagar2.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioCPagarPag.AsBoolean then
    begin
      if qParcelasNumCPagar.AsInteger > 0 then
        Posiciona_Parcela;
      if not vExiste then
        exit;
      if DM1.tCPagarParcRestParcela.AsFloat > 0 then
        begin
          Application.CreateForm(TfContasPagarPag, fContasPagarPag);
          fContasPagarPag.ShowModal;
        end
      else
        begin
          ShowMessage('Parcela já quitada!');
          CurrencyEdit1.SetFocus;
        end;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;
procedure TfContasPagar2.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioCPagarAltera.AsBoolean then
  begin
    if qParcelasNumCPagar.AsInteger > 0 then
      Posiciona_Parcela;
    if not vExiste then
      exit;
    if  DM1.tCPagarParcRestParcela.AsFloat > 0 then
    begin
      fCPagarAltera := TfCPagarAltera.Create(self);
      fCPagarAltera.ShowModal;
    end
    else
    begin
      ShowMessage('Parcela já quitada!');
      CurrencyEdit1.SetFocus;
    end;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasPagar2.BitBtn1Click(Sender: TObject);
begin
  if qParcelasNumCPagar.AsInteger > 0 then
    Posiciona_Parcela;
  if not vExiste then
    exit;
  fConsCPagarHist := TfConsCPagarHist.Create(Self);
  fConsCPagarHist.ShowModal;
  CurrencyEdit1.SetFocus;
end;

procedure TfContasPagar2.BitBtn5Click(Sender: TObject);
begin
  if DM1.tUsuarioEstPgtoPagar.AsBoolean then
    begin
      if qParcelasNumCPagar.AsInteger > 0 then
        Posiciona_Parcela;
      if not vExiste then
        exit;
      fEstPagamentoPagar := TfEstPagamentoPagar.Create(Self);
      if MessageDlg('Deseja fazer estorno de Pgto?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      begin
        fEstPagamentoPagar.RxDBFilter1.Active := True;
        fEstPagamentoPagar.BitBtn2.Enabled    := False;
        fEstPagamentoPagar.BitBtn3.Enabled    := True;
        if DM1.tCPagarParcHist.RecordCount > 0 then
          fEstPagamentoPagar.ShowModal
        else
          ShowMessage('Não há pagamentos a estornar!');
      end
      else
      begin
        fEstPagamentoPagar.RxDBFilter2.Active := True;
        fEstPagamentoPagar.BitBtn3.Enabled    := False;
        fEstPagamentoPagar.BitBtn2.Enabled    := True;
        if DM1.tCPagarParcHist.RecordCount > 0 then
          fEstPagamentoPagar.ShowModal
        else
          ShowMessage('Não há devoluções a estornar!');
      end;
      fEstPagamentoPagar.RxDBFilter1.Active := False;
      fEstPagamentoPagar.RxDBFilter2.Active := False;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasPagar2.BitBtn6Click(Sender: TObject);
begin
  if DM1.tUsuarioCPagarPag.AsBoolean then
    begin
      if qParcelasNumCPagar.AsInteger > 0 then
        Posiciona_Parcela;
      if not vExiste then
        exit;
      if DM1.tCPagarParcRestParcela.AsFloat > 0 then
      begin
        fContasPagarDev := tfContasPagarDev.Create(Self);
        fContasPagarDev.ShowModal;
      end
      else
        ShowMessage('Parcela já quitada!');
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasPagar2.BitBtn7Click(Sender: TObject);
begin
  Monta_SQLqParcelas;
end;

procedure TfContasPagar2.FormCreate(Sender: TObject);
begin
  dm1.leGrid(SMDBGrid1,Name);

  DM1.tFilial.Open;
  DM1.tFilialDep.Open;

  Dm1.tCPagar.Open;
  Dm1.tCPagarParc.Open;
  Dm1.tCPagarParcHist.Open;
  Dm1.tFornecedores.Open;
  DM1.tContas.Open;
  DM1.tJuros.Open;
  DM1.tMovimentos.Open;
  DM1.tCheque.Open;
  DM1.tChequeCPagar.Open;
  DM1.tNEntrada.Open;
  DM1.tPlanoContas.Open;
  DM1.tPlanoContasItens.Open;
  tPlanoContas.Open;
  tPlanoContasItens.Open;
end;

procedure TfContasPagar2.qParcelasCalcFields(DataSet: TDataSet);
begin
  if StrToFloat(FormatFloat('0.00',qParcelasRestParcela.AsFloat)) > 0 then
    qParcelasclDiasAtraso.AsFloat := Date - qParcelasDtVencCPagar.AsDateTime
  else
    qParcelasclDiasAtraso.AsFloat := qParcelasDtPagParcCPagar.AsDateTime - qParcelasDtVencCPagar.AsDateTime;
  if qParcelasclDiasAtraso.AsFloat <= 0 then
    qParcelasclDiasAtraso.AsInteger := 0;
end;

procedure TfContasPagar2.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if StrToFloat(FormatFloat('0.00',qParcelasRestParcela.AsFloat)) <= 0 then
    begin
      Background  := clTeal;
      AFont.Color := clWhite;
    end
  else
  if qParcelasclDiasAtraso.AsFloat > 0 then
    begin
      Background  := clRed;
      AFont.Color := clWhite;
    end
  else
  if qParcelasDtRecto.AsDateTime > 1 then
    begin
      Background  := clYellow;
      AFont.Color := clBlack;
    end;
end;

procedure TfContasPagar2.FormShow(Sender: TObject);
var
  i: Integer;
begin
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;

  vSQL := qParcelas.SQL.Text;

  CheckBox2.Visible := DM1.tParametrosUsaGrupoFilial.AsBoolean;
  Panel1.Visible    := DM1.tParametrosUsaCentroCusto.AsBoolean;

  if not DM1.tParametrosUsaCentroCusto.AsBoolean then
  begin
    for i := 1 to SMDBGrid1.ColCount - 1 do
    begin
      if (SMDBGrid1.Columns[i-1].FieldName = 'NomeCentroCusto') or
         (SMDBGrid1.Columns[i-1].FieldName = 'NomeCentroCustoItem') then
        SMDBGrid1.Columns[i-1].Visible := False;
    end;
  end;
end;

procedure TfContasPagar2.RxSpeedButton1Click(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  fRelCPagar2 := TfRelCPagar2.Create(Self);
  fRelCPagar2.RLReport1.Preview;
  fRelCPagar2.RLReport1.Free;
  SMDBGrid1.EnableScroll;
end;

procedure TfContasPagar2.BitBtn8Click(Sender: TObject);
begin
  fContasPagarPagSel := tfContasPagarPagSel.Create(Self);
  fContasPagarPagSel.ShowModal;
end;

procedure TfContasPagar2.BitBtn9Click(Sender: TObject);
begin
  if DM1.tUsuarioLctoPagar.AsBoolean then
  begin
    fLancaCPagar := tfLancaCPagar.Create(Self);
    fLancaCPagar.ShowModal;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasPagar2.BitBtn10Click(Sender: TObject);
begin
  if DM1.tUsuarioLctoPagar.AsBoolean then
  begin
    if qParcelasNumCPagar.AsInteger > 0 then
      Posiciona_Parcela;
    if not vExiste then
      exit;
    fLancaCPagar := tfLancaCPagar.Create(Self);
    fLancaCPagar.Tag := 1;
    fLancaCPagar.ShowModal;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasPagar2.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit1.AsInteger > 0) then
  begin
    ComboBox1.ItemIndex := 2;
    BitBtn7Click(Sender);
  end;
end;

procedure TfContasPagar2.RxSpeedButton2Click(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  fRelCPagarPlano := TfRelCPagarPlano.Create(Self);
  fRelCPagarPlano.RLReport1.Preview;
  fRelCPagarPlano.RLReport1.Free;
  SMDBGrid1.EnableScroll;
end;

procedure TfContasPagar2.Monta_FilialDep;
var
  vObsAux : String;
begin
  vFilialDep := '';
  if (RxDBLookupCombo2.Text = '') or not(DM1.tParametrosUsaGrupoFilial.AsBoolean) then
    exit;

  if not DM1.tFilial.Locate('Codigo',RxDBLookupCombo2.KeyValue,[loCaseInsensitive]) then
    exit;

  DM1.tFilialDep.First;
  while not DM1.tFilialDep.Eof do
  begin
    if vFilialDep = '' then
      vFilialDep := DM1.tFilialDepCodFilialDep.AsString
    else
      vFilialDep := vFilialDep + ',' + DM1.tFilialDepCodFilialDep.AsString;
    DM1.tFilialDep.Next;
  end;

  if vFilialDep <> '' then
   vFilialDep := vFilialDep + ',' + IntToStr(RxDBLookupCombo2.KeyValue);
end;

procedure TfContasPagar2.Panel1Enter(Sender: TObject);
begin
  qCentroCusto.Close;
  qCentroCusto.Open;
end;

end.
