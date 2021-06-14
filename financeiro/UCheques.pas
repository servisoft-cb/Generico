unit UCheques;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit, DBCtrls, Buttons, RxLookup, ExtCtrls,
  RXDBCtrl, Db, DBTables, Grids, DBGrids, SMDBGrid, Variants, DBFilter;

type
  TfCheques = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Panel4: TPanel;
    Label2: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBEdit3: TDBEdit;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    DBCheckBox1: TDBCheckBox;
    tChequeIns: TTable;
    tChequeInsCodConta: TIntegerField;
    tChequeInsNumCheque: TIntegerField;
    tChequeInsDtEmissao: TDateField;
    tChequeInsVlrTotal: TFloatField;
    tChequeInsNominal: TStringField;
    tChequeInsDtEntrada: TDateField;
    tChequeInsDtPrevista: TDateField;
    tChequeInsAutomatico: TBooleanField;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    Shape1: TShape;
    SMDBGrid1: TSMDBGrid;
    BitBtn8: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn9: TBitBtn;
    Panel5: TPanel;
    Label9: TLabel;
    BitBtn11: TBitBtn;
    RxDBFilter1: TRxDBFilter;
    tChequeInsPlanoContas: TIntegerField;
    tChequeInsCodPlanoContasItens: TIntegerField;
    tChequeInsFilial: TIntegerField;
    Label10: TLabel;
    DBText1: TDBText;
    tChequeInsNumMov: TIntegerField;
    Label11: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label12: TLabel;
    DBMemo1: TDBMemo;
    SpeedButton13: TSpeedButton;
    Label13: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    Label30: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    DBText2: TDBText;
    qCheque: TQuery;
    dsqCheque: TDataSource;
    qChequeNumCheque: TIntegerField;
    qChequeNumMov: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
    procedure RxDBLookupCombo5Exit(Sender: TObject);
    procedure RxDBLookupCombo7Enter(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure qChequeAfterScroll(DataSet: TDataSet);
    procedure Panel2Enter(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
    procedure Estorna_Pagamento;
    procedure Exclui_CPagar;
    procedure Excluir_Compensacao;
    procedure Filtrar_Cheques;
    procedure Posiciona_PlanoContas;

  public
    { Public declarations }
  end;

var
  fCheques: TfCheques;

implementation

uses UDM1, UChequeComp, Math, UChequeCPagar, UDM2, UPlanoContas,
  UEscFilial;

{$R *.DFM}

procedure TfCheques.Excluir_Compensacao;
begin
  DM1.tContas.IndexFieldNames := 'CodConta';
  DM1.tContas.FindKey([DM1.tChequeCodConta.AsInteger]);
  if DM1.tMovimentos.Locate('CodConta;NumChequePag',VarArrayOf([DM1.tChequeCodConta.AsInteger,DM1.tChequeNumCheque.AsInteger]),[locaseinsensitive]) then
    DM1.tMovimentos.Delete;
  DM1.tMovimentos.Refresh;
  DM1.tCheque.Edit;
  DM1.tChequeDtEntrada.Clear;
  DM1.tCheque.Post;
end;

procedure TfCheques.Exclui_CPagar;
begin
  DM1.tFilial.Locate('Codigo',DM1.tChequeCPagarFilial.AsInteger,[loCaseInsensitive]);
  if DM1.tCPagar.Locate('Filial;NumCPagar',VarArrayOf([DM1.tFilialCodigo.AsInteger,DM1.tChequeCPagarNumCPagar.AsInteger]),[locaseinsensitive]) then
    if DM1.tCPagarParc.Locate('Filial;NumCPagar;ParcCPagar',VarArrayOf([DM1.tFilialCodigo.AsInteger,DM1.tChequeCPagarNumCPagar.AsInteger,DM1.tChequeCPagarParcela.AsInteger]),[locaseinsensitive]) then
      Estorna_Pagamento;
  DM1.tChequeCPagar.Delete;
end;

procedure TfCheques.Estorna_Pagamento;
begin
  if DM1.tCPagarParcHist.Locate('NumCheque',DM1.tChequeNumCheque.AsInteger,[loCaseInsensitive]) then
  begin
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
    if StrToFloat(FormatFloat('0.00',DM1.tCPagarParcRestParcela.AsFloat)) > StrToFloat(FormatFloat('0.00',DM1.tCPagarParcVlrParcCPagar.AsFloat)) then
      DM1.tCPagarParcRestParcela.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCPagarParcVlrParcCPagar.AsFloat));
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

    DM1.tCPagar.Edit;
    DM1.tCPagarQuitado.AsBoolean := False;
    DM1.tCPagar.Post;
  end;
end;

procedure TfCheques.Habilita;
begin
  Panel2.Enabled       := not(Panel2.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
end;

procedure TfCheques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tCheque.Filtered := False;
  RxDBFilter1.Active   := False;
  DM1.tContas.Filtered := False;
  if Screen.FormCount < 3 then
    begin
      DM1.tCheque.Close;
      DM1.tChequeCPagar.Close;
      DM1.tMovimentos.Close;
      DM1.tFornecedores.Close;
      DM1.tCPagar.Close;
      DM1.tCPagarParc.Close;
      DM1.tCPagarParcHist.Close;
    end;
  Action := Cafree;
end;

procedure TfCheques.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfCheques.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsCheque.AsBoolean then
  begin
    BitBtn2.Tag := 0;
    tChequeIns.Refresh;
    tChequeIns.Last;
    DM1.tCheque.Refresh;
    DM1.tCheque.Insert;
    DM1.tChequeNumMov.AsInteger     := tChequeInsNumMov.AsInteger + 1;
    DM1.tChequeAutomatico.AsBoolean := False;
    DM1.tChequeFilial.AsInteger     := DM1.tFilialCodigo.AsInteger;
    DM1.tCheque.Post;
    DM1.tCheque.Edit;

    Habilita;
    RxDBLookupCombo2.SetFocus;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfCheques.BitBtn2Click(Sender: TObject);
begin
  if not DM1.tCheque.IsEmpty then
    begin
      if DM1.tUsuarioAltCheque.AsBoolean then
        begin
          //if (Dm1.tChequeAutomatico.AsBoolean = False) and (Dm1.tChequeDtEntrada.AsDateTime < 1) then
          if Dm1.tChequeDtEntrada.AsDateTime < 10 then
            begin
              DM1.tCheque.Edit;
              BitBtn2.Tag := 1;
              Habilita;
              RxDBLookupCombo2.SetFocus;
            end
          else
            ShowMessage('Cheque já compensado!');
        end
      else
        ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
    end
  else
    ShowMessage('Não há registro p/ ser alterado!');
end;

procedure TfCheques.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcCheque.AsBoolean then
    begin
      //if (Dm1.tChequeAutomatico.AsBoolean = False) and (Dm1.tChequeDtEntrada.AsDateTime < 1) then
      if Dm1.tChequeDtEntrada.AsDateTime < 1 then
        begin
          if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
            begin
              DM1.tChequeCPagar.First;
              while not DM1.tChequeCPagar.Eof do
                Exclui_CPagar;
              DM1.tCheque.Delete;
            end;
        end
      else
        ShowMessage('Cheque já compensado ou automático!');
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfCheques.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    begin
      DM1.tChequeCPagar.First;
      while not DM1.tChequeCPagar.Eof do
        Exclui_CPagar;
      DM1.tCheque.Delete;
    end
  else
  if BitBtn2.Tag = 1 then
    DM1.tCheque.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfCheques.BitBtn5Click(Sender: TObject);
var
  vAux : Real;
begin
  if (RxDBLookupCombo2.Text = '') or (DBEdit1.Text = '') or (DM1.tChequeVlrTotal.AsFloat <= 0) then
  begin
    ShowMessage('Deve haver Banco, Nº do Cheque e valor!');
    exit;
  end;
  if DM1.tChequeDtEmissao.AsDateTime < 10 then
  begin
   ShowMessage('Data de emissão não informada!');
   exit;
  end;
  if DM1.tChequeDtPrevista.AsDateTime < 10 then
  begin
   ShowMessage('Data de prevista não informada!');
   exit;
  end;
  vAux := 0;
  if DM1.tChequeCPagar.RecordCount > 0 then
  begin
    DM1.tChequeCPagar.First;
    while not DM1.tChequeCPagar.Eof do
    begin
      vAux := StrToFloat(FormatFloat('0.00',vAux + DM1.tChequeCPagarValor.AsFloat));
      DM1.tChequeCPagar.Next;
    end;
  end;
  if (StrToFloat(FormatFloat('0.00',vAux)) > 0) and
     (StrToFloat(FormatFloat('0.00',DM1.tChequeVlrTotal.AsFloat)) < StrToFloat(FormatFloat('0.00',vAux))) then
  begin
    ShowMessage('Valor total menor que valor dos itens!');
    exit;
  end;
  if (StrToFloat(FormatFloat('0.00',vAux)) > 0) and
     (StrToFloat(FormatFloat('0.00',DM1.tChequeVlrTotal.AsFloat)) <> StrToFloat(FormatFloat('0.00',vAux))) then
    ShowMessage('Valor total diferente com o valor dos itens!');
  Dm1.tCheque.Post;
  Dm1.tCheque.Refresh;
  Habilita;
end;

procedure TfCheques.DBEdit1Exit(Sender: TObject);
begin
  if BitBtn2.Tag <> 1 then
    begin
      if RxDBLookupCombo2.Text <> '' then
        begin
          tChequeIns.Refresh;
          if tChequeIns.Locate('CodConta;NumCheque',VarArrayOf([RxDBLookupCombo2.KeyValue,DM1.tChequeNumCheque.AsInteger]),[locaseinsensitive]) then
            begin
              ShowMessage('Já foi dada entrada nesse cheque!');
              DBEdit1.SetFocus;
            end;
        end;
    end;
end;

procedure TfCheques.BitBtn7Click(Sender: TObject);
begin
  fChequeComp := TfChequeComp.Create(Self);
  fChequeComp.ShowModal;
end;

procedure TfCheques.FormCreate(Sender: TObject);
begin
  RxDBFilter1.Active := True;
end;

procedure TfCheques.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tCheque.State in [dsEdit,dsInsert] then
  begin
    ShowMessage('Você deve Cancelar ou Confirmar o cheque antes de fechar esta janela!');
    CanClose := False;
  end
  else
    CanClose := True;
end;

procedure TfCheques.FormShow(Sender: TObject);
begin
  DM1.tFilial.Open;
  DM1.tCheque.Open;
  DM1.tChequeCPagar.Open;
  DM1.tContas.Open;
  DM1.tMovimentos.Open;
  DM1.tFornecedores.Open;
  DM1.tCPagar.Open;
  DM1.tCPagarParc.Open;
  DM1.tCPagarParcHist.Open;
  if DM1.tFilialCodigo.AsInteger > 0 then
  begin
    //RxDBLookupCombo3.KeyValue := DM1.tFilialCodigo.AsInteger;
    //BitBtn11Click(Sender);
    Filtrar_Cheques;
  end;
end;

procedure TfCheques.BitBtn8Click(Sender: TObject);
begin
  if (DM1.tChequeCodConta.AsInteger > 0) and (DM1.tChequeNumCheque.AsInteger > 0) and
     (DM1.tChequeDtPrevista.AsDateTime > 0) and (DM1.tChequeDtEmissao.AsDateTime > 0) then
  begin
    fChequeCPagar := TfChequeCPagar.Create(Self);
    fChequeCPagar.ShowModal;
  end
  else
    ShowMessage('Falta informar o <Banco>, <Nº do cheque> ou <Dt. Prevista>!');
end;

procedure TfCheques.RxDBLookupCombo2Enter(Sender: TObject);
begin
  if DM1.tChequeCPagar.RecordCount > 0 then
    RxDBLookupCombo2.ReadOnly := True
  else
    RxDBLookupCombo2.ReadOnly := False;
end;

procedure TfCheques.DBEdit1Enter(Sender: TObject);
begin
  if DM1.tChequeCPagar.RecordCount > 0 then
    DBEdit1.ReadOnly := True
  else
    DBEdit1.ReadOnly := False;
end;

procedure TfCheques.BitBtn10Click(Sender: TObject);
begin
  if (DM1.tChequeCPagarNumCPagar.AsInteger > 0) and
     (MessageDlg('Deseja excluir o registro selecionado?', mtConfirmation,[mbOk,mbNo],0)=mrOk) then
    Exclui_CPagar;
end;

procedure TfCheques.BitBtn9Click(Sender: TObject);
begin
  if (DM1.tUsuarioExcCheque.AsBoolean) and
     (MessageDlg('Deseja excluir a compensação do cheque?', mtConfirmation,[mbOk,mbNo],0)=mrOk) then
    Excluir_Compensacao;
end;

procedure TfCheques.BitBtn11Click(Sender: TObject);
var
  vNumAux : Integer;
begin
  fEscFilial := TfEscFilial.Create(Self);
  fEscFilial.ShowModal;

  Filtrar_Cheques;


  {if RxDBLookupCombo3.Text = '' then
    ShowMessage('É obrigatório escolher uma filial!')
  else
  begin
    vNumAux := DM1.tCheque

    DM1.tContas.Filtered := False;
    DM1.tContas.Filter   := 'Filial = '''+IntToStr(RxDBLookupCombo3.KeyValue)+'''';
    DM1.tContas.Filtered := True;

    DM1.tCheque.Filtered := False;
    DM1.tCheque.Filter   := 'Filial = '''+IntToStr(RxDBLookupCombo3.KeyValue)+'''';
    DM1.tCheque.Filtered := True;


    DM1.tFilial.Locate('Codigo',DM1.tChequeCPagarFilial.AsInteger,[loCaseInsensitive]);

  end;}
end;

procedure TfCheques.SpeedButton13Click(Sender: TObject);
begin
  if DM1.tUsuarioCondPgto.AsBoolean then
    begin
      fPlanoContas := TfPlanoContas.Create(Self);
      fPlanoContas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfCheques.RxDBLookupCombo5Enter(Sender: TObject);
begin
  DM2.tPlanoContas2.IndexFieldNames := 'Descricao';
  //RxDBLookupCombo5.ReadOnly := not(DM1.tChequeCPagar.IsEmpty);
end;

procedure TfCheques.RxDBLookupCombo5Exit(Sender: TObject);
begin
  if RxDBLookupCombo5.Text = '' then
    RxDBLookupCombo7.ClearValue;
end;

procedure TfCheques.RxDBLookupCombo7Enter(Sender: TObject);
begin
  if RxDBLookupCombo5.Text = '' then
    RxDBLookupCombo7.ReadOnly := True
  else
    RxDBLookupCombo7.ReadOnly := False;
end;

procedure TfCheques.Filtrar_Cheques;
begin
  DM1.tContas.Filtered := False;
  DM1.tContas.Filter   := 'Filial = '''+IntToStr(DM1.tFilialCodigo.AsInteger)+'''';
  DM1.tContas.Filtered := True;

  DM1.tCheque.Filtered := False;
  DM1.tCheque.Filter   := 'Filial = '''+IntToStr(DM1.tFilialCodigo.AsInteger)+'''';
  DM1.tCheque.Filtered := True;
end;

procedure TfCheques.Posiciona_PlanoContas;
begin
  if DM1.tChequePlanoContas.AsInteger > 0 then
  begin
    DM2.tPlanoContas2.Locate('Codigo',DM1.tChequePlanoContas.AsInteger,[loCaseInsensitive]);
    DM2.tPlanoContasItens2.Locate('CodPlano;CodItem',VarArrayOf([DM1.tChequePlanoContas.AsInteger,DM1.tChequeCodPlanoContasItens.AsInteger]),[locaseinsensitive]);
  end;
end;

procedure TfCheques.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  Posiciona_PlanoContas;
end;

procedure TfCheques.qChequeAfterScroll(DataSet: TDataSet);
begin
  if qChequeNumMov.AsInteger > 0 then
  begin
    DM1.tCheque.FindKey([qChequeNumMov.AsInteger]);
    Posiciona_PlanoContas;
  end;
end;

procedure TfCheques.Panel2Enter(Sender: TObject);
begin
  qCheque.Close;
  qCheque.Open;
end;

procedure TfCheques.RxDBLookupCombo1Change(Sender: TObject);
begin
  if (RxDBLookupCombo1.Text <> '') and (qChequeNumMov.AsInteger > 0) then
  begin
    if qChequeNumMov.AsInteger <> DM1.tChequeNumMov.AsInteger then
    begin
      DM1.tCheque.FindKey([qChequeNumMov.AsInteger]);
      Posiciona_PlanoContas;
    end;
  end;
end;

end.

