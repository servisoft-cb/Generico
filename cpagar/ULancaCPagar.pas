unit ULancaCPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids,
  DBGrids, ToolEdit, CurrEdit, Mask, RXLookup, RXDBCtrl, Db, DbTables, ComCtrls, ALed, Variants;

type
  TfLancaCPagar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    Panel4: TPanel;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    tCPagarIns: TTable;
    tCPagarInsNumCPagar: TIntegerField;
    tCPagarInsNumNotaEnt: TIntegerField;
    tCPagarInsCodForn: TIntegerField;
    tCPagarInsQuitado: TBooleanField;
    tCPagarInsTipoDoc: TStringField;
    tCPagarInsDtGerado: TDateField;
    tCPagarInsHistorico: TStringField;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Panel5: TPanel;
    Label5: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Edit1: TEdit;
    Label7: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit4: TDBEdit;
    tCPagarInsNroDuplicata: TIntegerField;
    tCPagarInsNroFatura: TIntegerField;
    StaticText4: TStaticText;
    tCPagarInsFilial: TIntegerField;
    tCPagarInsCodAtelier: TIntegerField;
    tCPagar2: TTable;
    tCPagar2Filial: TIntegerField;
    tCPagar2NumCPagar: TIntegerField;
    tCPagar2NumNotaEnt: TIntegerField;
    tCPagar2CodForn: TIntegerField;
    tCPagar2Quitado: TBooleanField;
    tCPagar2TipoDoc: TStringField;
    tCPagar2DtGerado: TDateField;
    tCPagar2Historico: TStringField;
    tCPagar2NroFatura: TIntegerField;
    tCPagar2CodAtelier: TIntegerField;
    tCPagar2NroDuplicata: TIntegerField;
    Shape1: TShape;
    Shape2: TShape;
    Label9: TLabel;
    Label8: TLabel;
    BitBtn7: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    Panel6: TPanel;
    Label6: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label12: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    Label13: TLabel;
    DBEdit3: TDBEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure Edit1Change(Sender: TObject);
    procedure RxDBLookupCombo2Change(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure RxDBLookupCombo4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
    procedure Coloca_MasterSource;
    procedure Excluir_Registro;
    procedure Excluir_RegistroParc;

    procedure prc_Opcao;

    function fnc_Verifica_CentroCusto : Boolean;

  public
    { Public declarations }
  end;

var
  fLancaCPagar: TfLancaCPagar;

implementation

Uses UDM1, UFornecedores, UConsLancCPagar, UEscFilial, UContasPagar2, ULancaCPagarItens, UDMCentroCusto, UCentroCusto;

{$R *.DFM}

procedure TFLancaCPagar.Habilita;
begin
  BitBtn1.Enabled := not(BitBtn1.Enabled);
  BitBtn2.Enabled := not(BitBtn2.Enabled);
  BitBtn3.Enabled := not(BitBtn3.Enabled);
  BitBtn4.Enabled := not(BitBtn4.Enabled);
  BitBtn5.Enabled := not(BitBtn5.Enabled);
  BitBtn9.Enabled := not(BitBtn9.Enabled);
  Panel2.Enabled  := not(Panel2.Enabled);
  Panel5.Enabled  := not(Panel5.Enabled);
  Panel6.Enabled  := not(Panel6.Enabled);
  DBNavigator1.Enabled := not (DBNavigator1.Enabled);
end;

procedure TfLancaCPagar.Coloca_MasterSource;
begin
  DM1.tMovimentos.IndexFieldNames := 'CodConta;DtMovimento';
  DM1.tMovimentos.MasterSource    := DM1.dsContas;
  DM1.tMovimentos.MasterFields    := 'CodConta';
end;

procedure TfLancaCPagar.BitBtn1Click(Sender: TObject);
begin
  fEscFilial := TfEscFilial.Create(Self);
  fEscFilial.ShowModal;
  fLancaCPagar.Caption := 'Lançamentos de Contas a Pagar ' + Dm1.tFilialEmpresa.AsString;
  tCPagarIns.Refresh;
  tCPagarIns.Last;
  DM1.tCPagar.IndexFieldNames := 'Filial;NumCPagar';
  DM1.tCPagar.Insert;
  Dm1.tCPagarFilial.AsInteger    := Dm1.tFilialCodigo.AsInteger;
  DM1.tCPagarNumCPagar.AsInteger := tCPagarInsNumCPagar.AsInteger + 1;
  DM1.tCPagarTipoDoc.AsString    := 'AV';
  DM1.tCPagarDtGerado.AsDateTime := Date;
  DM1.tCPagar.Post;
  DM1.tCPagar.Edit;
  Habilita;
  RxDBLookupCombo4.Enabled  := True;
  RxDBLookupCombo4.ClearValue;
  RxDBLookupCombo4.SetFocus;
  DBEdit1.Enabled := True;
end;

procedure TfLancaCPagar.BitBtn4Click(Sender: TObject);
begin
  if (DM1.tCPagarCodForn.AsInteger < 1) OR (RxDBLookupCombo4.Text = '') then
    ShowMessage('É obrigatório informar o fornecedor')
  else
  if not DM1.tCPagarParc.IsEmpty then
  begin
    if DM1.tCPagarNroDuplicata.IsNull then
      DM1.tCPagarNroDuplicata.AsInteger := 0;
    if DM1.tCPagarCodCentroCusto.AsInteger <= 0 then
      DM1.tCPagarCodCentroCustoItem.AsInteger := 0;

    if not fnc_Verifica_CentroCusto then
      exit;

    DM1.tCPagarParc.First;
    while not DM1.tCPagarParc.Eof do
    begin
      DM1.tCPagarParc.Edit;
      DM1.tCPagarParcNroDuplicata.AsInteger       := DM1.tCPagarNroDuplicata.AsInteger;
      DM1.tCPagarParcCodForn.AsInteger            := DM1.tCPagarCodForn.AsInteger;
      DM1.tCPagarParcDtGerado.AsDateTime          := DM1.tCPagarDtGerado.AsDateTime;
      DM1.tCPagarParcCodCentroCusto.AsInteger     := DM1.tCPagarCodCentroCusto.AsInteger;
      DM1.tCPagarParcCodCentroCustoItem.AsInteger := DM1.tCPagarCodCentroCustoItem.AsInteger;
      DM1.tCPagarParcSerie.AsString               := DM1.tCPagarSerie.AsString;

      DM1.tCPagarParc.Post;
      DM1.GravaEnt_tCPagarParcHist;

      DM1.tCPagarParc.Next;
    end;
    DM1.tCPagar.Post;
    Habilita;
    DM1.tCPagar.Refresh;
    DM1.tCPagarParc.Refresh;
    DM1.tCPagarParcHist.Refresh;
    BitBtn9.Tag := 0;
  end
  else
    MessageDlg('Você não pode confirmar esta Conta a Pagar com as parcelas vazias!',mtInformation,[mbOK],0);
end;

procedure TfLancaCPagar.BitBtn8Click(Sender: TObject);
begin
  if not DM1.tCPagarParc.IsEmpty then
  begin
    if DM1.tCPagarParcPgtoParcial.AsFloat > 0 then
      ShowMessage('Parcela já quitada, não pode ser excluída!')
    else
    begin
      if MessageDlg('Deseja realmente excluir esta parcela?',mtConfirmation,[mbOK,mbNO],0) = mrOK then
        Excluir_RegistroParc;
    end;
  end
  else
    ShowMessage('Não há registro para ser excluído!');
end;

procedure TfLancaCPagar.BitBtn3Click(Sender: TObject);
var
  vExcluir : Boolean;
begin
  if MessageDlg('Deseja realmente excluir esta Conta a Pagar?',mtConfirmation,[mbOK,mbNO],0) = mrOK then
  begin
    vExcluir := True;
    DM1.tCPagarParc.First;
    while not DM1.tCPagarParc.Eof do
      begin
        if DM1.tCPagarParcPgtoParcial.AsFloat > 0 then
          vExcluir := False;
        DM1.tCPagarParc.Next;
      end;
    if vExcluir then
      Excluir_Registro
    else
      ShowMessage('Exclusão cancelada, consta pagamento');
  end;
end;

procedure TfLancaCPagar.BitBtn2Click(Sender: TObject);
begin
  if BitBtn9.Tag = 1 then
  begin
    DM1.tCPagar.Cancel;
    if DM1.tCPagarParc.State in [dsEdit,dsInsert] then
      DM1.tCPagarParc.Post;
  end
  else
    Excluir_Registro;
  DM1.tCPagar.Refresh;
  DM1.tCPagarParc.Refresh;
  DM1.tCPagarParcHist.Refresh;

  BitBtn9.Tag := 0;
  Habilita;
end;

procedure TfLancaCPagar.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfLancaCPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Coloca_MasterSource;
  if Screen.FormCount < 3 then
  begin
    DM1.tCPagar.Close;
    DM1.tCPagarParc.Close;
    DM1.tCPagarParcHist.Close;
    DM1.tFornecedores.Close;
    DM1.tContas.Close;
    DM1.tPlanoContas.Close;
    DM1.tPlanoContasItens.Close;
    DM1.tMovimentos.Close;
  end;

  if DMCentroCusto.Owner.ClassName = Self.ClassName then
    FreeAndNil(DMCentroCusto);

  fLancaCPagar.Tag := 0;
  Action := Cafree;
end;

procedure TfLancaCPagar.FormShow(Sender: TObject);
begin
  if not Assigned(DMCentroCusto) then
    DMCentroCusto := TDMCentroCusto.Create(Self);

  DMCentroCusto.tCentroCusto.Open;
  DMCentroCusto.tCentroCustoItem.Open;

  DM1.tCPagar.Open;
  DM1.tCPagarParc.Open;
  DM1.tCPagarParcHist.Open;
  DM1.tFornecedores.Open;
  DM1.tContas.Open;
  DM1.tPlanoContas.Open;
  DM1.tPlanoContasItens.Open;
  DM1.tMovimentos.Open;

  DM1.tCPagar.IndexFieldNames := 'Filial;NumCPagar';
  fLancaCPagar.Caption        := 'Lançamentos de Contas a Pagar ' + Dm1.tFilialEmpresa.AsString;
  Edit1.SetFocus;
  DM1.tCPagar.Refresh;
  DM1.tCPagar.Last;
  if Tag = 1 then
    DM1.tCPagar.Locate('Filial;NumCPagar',VarArrayOf([fcontasPagar2.qParcelasFilial.AsInteger,fContasPagar2.qParcelasNumCPagar.AsInteger]),[loCaseInsensitive]);

  Panel6.Visible := DM1.tParametrosUsaCentroCusto.AsBoolean;
end;

procedure TfLancaCPagar.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioFornecedores.AsBoolean then
  begin
    fFornecedores := TfFornecedores.Create(Self);
    fFornecedores.ShowModal;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de fornecedores!');
end;

procedure TfLancaCPagar.BitBtn9Click(Sender: TObject);
begin
  if DM1.tCPagar.IsEmpty then
  begin
    ShowMessage('Não existe registro para ser alterado!');
    exit;
  end;
  DM1.tCPagar.Edit;
  Habilita;
  RxDBLookupCombo4.Enabled := False;
  if DM1.tCPagarTipoDoc.AsString = 'AV' then
    DBEdit1.Enabled := True
  else
    DBEdit1.Enabled := False;
  BitBtn9.Tag := 1;
end;

procedure TfLancaCPagar.BitBtn10Click(Sender: TObject);
begin
  if not DM1.tCPagarParc.IsEmpty then
  begin
    if DM1.tCPagarParcPgtoParcial.AsFloat > 0 then
      ShowMessage('Parcela já quitada, não pode ser alterada!')
    else
    begin
      fLancaCPagarItens := TfLancaCPagarItens.Create(Self);
      fLancaCPagarItens.Tag := 1;
      fLancaCPagarItens.vNumParcela := DM1.tCPagarParcParcCPagar.AsInteger;
      fLancaCPagarItens.CurrencyEdit1.Value       := DM1.tCPagarParcVlrParcCPagar.AsCurrency;
      fLancaCPagarItens.CurrencyEdit2.Value       := DM1.tCPagarParcParcCPagar.AsInteger;
      if DM1.tCPagarParcCodConta.AsInteger > 0 then
        fLancaCPagarItens.RxDBLookupCombo1.KeyValue := DM1.tCPagarParcCodConta.AsInteger;
      fLancaCPagarItens.DateEdit1.Text            := DM1.tCPagarParcDtVencCPagar.AsString;
      if DM1.tCPagarParcPlanoContas.AsInteger > 0 then
        fLancaCPagarItens.RxDBLookupCombo3.KeyValue := DM1.tCPagarParcPlanoContas.AsInteger;
      if DM1.tCPagarParcCodPlanoContasItens.AsInteger > 0 then
        fLancaCPagarItens.RxDBLookupCombo6.KeyValue := DM1.tCPagarParcCodPlanoContasItens.AsInteger;
      fLancaCPagarItens.ShowModal;
    end;
  end
  else
    ShowMessage('Não há registro para ser alterado!');
end;

procedure TfLancaCPagar.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('QuitParcCPagar').AsBoolean then
    begin
      Background  := clTeal;
      AFont.Color := clWhite;
    end
  else
    begin
      Background  := clWhite;
      AFont.Color := clBlack;
    end;
end;

procedure TfLancaCPagar.Edit1Change(Sender: TObject);
begin
  try
    DM1.tCPagar.IndexFieldNames := 'Filial;NumCPagar';
    DM1.tCPagar.FindNearest([Dm1.tFilialCodigo.AsInteger,Edit1.Text]);
    prc_Opcao;
  except
    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfLancaCPagar.RxDBLookupCombo2Change(Sender: TObject);
begin
  Edit1.Text := RxDBLookupCombo2.Text;
  prc_Opcao;
end;

procedure TfLancaCPagar.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tCPagar.IndexFieldNames := 'Filial;NumCPagar';
  Edit1.Text                  := RxDBLookupCombo2.Text;
end;

procedure TfLancaCPagar.Edit1Exit(Sender: TObject);
begin
  RxDBLookupCombo2.Value := Edit1.Text;
end;

procedure TfLancaCPagar.RxDBLookupCombo4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_F2 then
    begin
      if RxDBLookupCombo4.LookupDisplay = 'NomeForn' then
        begin
           RxDBLookupCombo4.CloseUp(True);
           RxDBLookupCombo4.LookupDisplay    := 'Fantasia';
           DM1.tFornecedores.IndexFieldNames := 'Fantasia';
           DM1.tFornecedores.Refresh;
           Label7.Caption := 'Consulta por Fantasia';
        end
      else
      if RxDBLookupCombo4.LookupDisplay = 'Fantasia' then
        begin
          RxDBLookupCombo4.CloseUp(True);
          RxDBLookupCombo4.LookupDisplay    := 'NomeForn';
          DM1.tFornecedores.IndexFieldNames := 'NomeForn';
          DM1.tFornecedores.Refresh;
          Label7.Caption := 'Consulta por Nome';
         end;
       if DM1.tFornecedoresCodForn.AsInteger > 0 then
         RxDBLookupCombo4.KeyValue := DM1.tFornecedoresCodForn.AsInteger;
       RxDBLookupCombo4.Refresh;
    end;
end;

procedure TfLancaCPagar.RxDBLookupCombo4Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfLancaCPagar.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tCPagar.State in [dsInsert,dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar esta Cta. a Pagar antes de Fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfLancaCPagar.DBEdit1Exit(Sender: TObject);
begin
  if DBEdit1.Text <> '' then
    begin
      if (tCPagar2.Locate('CodForn;NroDuplicata;Filial',VarArrayOf([DM1.tCPagarCodForn.AsInteger,DM1.tCPagarNroDuplicata.AsInteger,DM1.tCPagarFilial.AsInteger]),[loCaseInsensitive])) and
         (tCPagar2NumCPagar.AsInteger <> DM1.tCPagarNumCPagar.AsInteger) then
        begin
          ShowMessage('Este Documento já existe no lançamento ' + tCPagar2NumCPagar.AsString + ' da Filial ' + tCPagar2Filial.AsString);
          DBEdit1.Clear;
          DBEdit1.SetFocus;
        end;
    end;
end;

procedure TfLancaCPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) and (DM1.tCPagar.State in [dsBrowse]) then
  begin
    fConsLancCPagar := TfConsLancCPagar.Create(Self);
    fConsLancCPagar.ShowModal;
    fLancaCPagar.Caption := 'Lançamentos de Contas a Pagar ' + Dm1.tFilialEmpresa.AsString;
    prc_Opcao;
  end;
end;

procedure TfLancaCPagar.BitBtn6Click(Sender: TObject);
begin
  fLancaCPagarItens := TfLancaCPagarItens.Create(Self);
  fLancaCPagarItens.Tag := 0;
  fLancaCPagarItens.ShowModal;
end;

procedure TfLancaCPagar.BitBtn7Click(Sender: TObject);
begin
  fLancaCPagarItens := TfLancaCPagarItens.Create(Self);
  fLancaCPagarItens.Tag := 10;
  fLancaCPagarItens.ShowModal;
end;

procedure TfLancaCPagar.Excluir_Registro;
begin
  DM1.tCPagarParc.First;
  while not DM1.tCPagarParc.EOF do
    Excluir_RegistroParc;
  DM1.tCPagar.Delete;
end;

procedure TfLancaCPagar.Excluir_RegistroParc;
begin
  DM1.tCPagarParcHist.First;
  while not DM1.tCPagarParcHist.Eof do
    DM1.tCPagarParcHist.Delete;
  DM1.tCPagarParc.Delete;
end;

procedure TfLancaCPagar.prc_Opcao;
begin
  if DM1.tParametrosUsaCentroCusto.AsBoolean then
    DMCentroCusto.tCentroCusto.Locate('Codigo',DM1.tCPagarCodCentroCusto.AsInteger,([Locaseinsensitive]));
end;

procedure TfLancaCPagar.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  prc_Opcao;
end;

procedure TfLancaCPagar.RxDBLookupCombo3Enter(Sender: TObject);
begin
  if DM1.tCPagarCodCentroCusto.AsInteger > 0 then
    DMCentroCusto.tCentroCusto.Locate('Codigo',DM1.tCPagarCodCentroCusto.AsInteger,([Locaseinsensitive]))
  else
    DM1.tCPagarCodCentroCustoItem.AsInteger := 0;
end;

function TfLancaCPagar.fnc_Verifica_CentroCusto: Boolean;
begin
  Result := True;
  if DM1.tCPagarCodCentroCusto.AsInteger <= 0 then
    exit;

  if not DMCentroCusto.tCentroCusto.Locate('Codigo',DM1.tCPagarCodCentroCusto.AsInteger,([Locaseinsensitive])) then
  begin
    ShowMessage('Centro de custo não encontrado!');
    Result := False;
    exit;
  end;

  if (DMCentroCusto.tCentroCustoItem.RecordCount > 0) and not(DMCentroCusto.tCentroCustoItem.Locate('CodCentroCusto;CodItem',VarArrayOf([DM1.tCPagarCodCentroCusto.AsInteger,DM1.tCPagarCodCentroCustoItem.AsInteger]),[loCaseInsensitive])) then
  begin
    ShowMessage('Item do centro de custo não encontrado!');
    Result := False;
    exit;
  end;
end;

procedure TfLancaCPagar.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioPlanoCtas.AsBoolean then
  begin
    fCentroCusto := TfCentroCusto.Create(Self);
    fCentroCusto.ShowModal;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir o formulário!');
end;

end.
