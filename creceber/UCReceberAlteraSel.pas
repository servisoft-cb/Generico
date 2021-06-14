unit UCReceberAlteraSel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, RXLookup, CurrEdit, DBCtrls, Mask,
  ToolEdit, RXDBCtrl, ExtCtrls, Db, DBTables, Grids, DBGrids, DBFilter, Variants;

type
  TfCReceberAlteraSel = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    RxDBFilter1: TRxDBFilter;
    Panel3: TPanel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    Label10: TLabel;
    Bevel1: TBevel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    CurrencyEdit1: TCurrencyEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Edit1: TEdit;
    RxDBLookupCombo4: TRxDBLookupCombo;
    RxDBLookupCombo5: TRxDBLookupCombo;
    CheckBox1: TCheckBox;
    CurrencyEdit3: TCurrencyEdit;
    tCReceberParcHistIns: TTable;
    tCReceberParcHistInsFilial: TIntegerField;
    tCReceberParcHistInsNumCReceber: TIntegerField;
    tCReceberParcHistInsParcCReceber: TIntegerField;
    tCReceberParcHistInsItem: TIntegerField;
    tCReceberParcHistInsCodHistorico: TIntegerField;
    tCReceberParcHistInsDtHistorico: TDateField;
    tCReceberParcHistInsHistorico: TStringField;
    GroupBox1: TGroupBox;
    ckTipoCobranca: TCheckBox;
    ckTituloProtestado: TCheckBox;
    ckBanco: TCheckBox;
    ckVendedor: TCheckBox;
    ckComissao: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure CurrencyEdit1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
    procedure ckTipoCobrancaClick(Sender: TObject);
    procedure ckTituloProtestadoClick(Sender: TObject);
    procedure ckBancoClick(Sender: TObject);
    procedure ckVendedorClick(Sender: TObject);
    procedure ckComissaoClick(Sender: TObject);
  private
    { Private declarations }
    vContador : Integer;
    function Achou_Parcela : Boolean;
    procedure Alterar;
    procedure Gravar_Historico;

  public
    { Public declarations }
  end;

var
  fCReceberAlteraSel: TfCReceberAlteraSel;

implementation

uses UDM1, UHistorico, UContasReceber2;

{$R *.DFM}

procedure TfCReceberAlteraSel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  Action := Cafree;
end;

procedure TfCReceberAlteraSel.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioHistoricos.AsBoolean then
  begin
    fHistorico := TfHistorico.Create(Self);
    fHistorico.ShowModal;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfCReceberAlteraSel.FormShow(Sender: TObject);
begin
  RxDBFilter1.Active := True;
  tCReceberParcHistIns.Open;
end;

procedure TfCReceberAlteraSel.BitBtn1Click(Sender: TObject);
begin
  if not(ckTipoCobranca.Checked) and
     not(ckTituloProtestado.Checked) and
     not(ckBanco.Checked) and
     not(ckVendedor.Checked) and
     not(ckComissao.Checked) then
  begin
    ShowMessage('Favor selecionar uma opção para a alteração!');
    exit;
  end;

  if MessageDlg('Confirmar alteração das parcelas selecionadas?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  vContador := 0;
  fContasReceber2.qConsulta.First;
  while not fContasReceber2.qConsulta.Eof do
  begin
    if fContasReceber2.SMDBGrid1.SelectedRows.CurrentRowSelected then
    begin
      if Achou_Parcela then
      begin
        try
          Alterar;
        except
          on E: Exception do
            ShowMessage('Erro no pagamento, ' + E.Message);
        end;
      end;
    end;
    fContasReceber2.qConsulta.Next;
  end;
  if vContador > 0 then
    ShowMessage(IntToStr(vContador) + ' titulo(s) alterado(s)!')
  else
    ShowMessage('Não foi selecionado títulos para alteração');
  Close;
end;

procedure TfCReceberAlteraSel.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfCReceberAlteraSel.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tTipoCobranca.IndexFieldNames := 'Nome';
end;

procedure TfCReceberAlteraSel.CurrencyEdit1Exit(Sender: TObject);
begin
  if CurrencyEdit1.Value > 0 then
  begin
    DM1.tHistorico.SetKey;
    DM1.tHistoricoCodigo.AsCurrency := CurrencyEdit1.Value;
    if DM1.tHistorico.GotoKey then
      Edit1.Text := DM1.tHistoricoNome.AsString
    else
    begin
      Edit1.Text := '';
      ShowMessage('Histórico não cadastrado!');
      CurrencyEdit1.SetFocus;
    end;
  end
  else
    Edit1.Text := '';
end;

procedure TfCReceberAlteraSel.CurrencyEdit1Enter(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Codigo';
end;

procedure TfCReceberAlteraSel.RxDBLookupCombo1Change(Sender: TObject);
begin
  Edit1.Text         := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := DM1.tHistoricoCodigo.AsString;
end;

procedure TfCReceberAlteraSel.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Nome';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := DM1.tHistoricoCodigo.AsString;
end;

procedure TfCReceberAlteraSel.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Nome';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := DM1.tHistoricoCodigo.AsString;
end;

procedure TfCReceberAlteraSel.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Codigo';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit1.Text := DM1.tHistoricoCodigo.AsString;
end;

procedure TfCReceberAlteraSel.RxDBLookupCombo4Enter(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfCReceberAlteraSel.RxDBLookupCombo5Enter(Sender: TObject);
begin
  DM1.tContas.IndexFieldNames := 'NomeConta';
end;

function TfCReceberAlteraSel.Achou_Parcela: Boolean;
begin
  Result := False;
  DM1.tFilial.Locate('Codigo',fContasReceber2.qConsultaFilial.AsInteger,[loCaseInsensitive]);
  if DM1.tCReceber.Locate('Filial;NumCReceber',VarArrayOf([fContasReceber2.qConsultaFilial.AsInteger,fContasReceber2.qConsultaNumCReceber.AsInteger]),[locaseinsensitive]) then
  begin
    if DM1.tCReceberParc.Locate('Filial;NumCReceber;ParcCReceber',VarArrayOf([fContasReceber2.qConsultaFilial.AsInteger,fContasReceber2.qConsultaNumCReceber.AsInteger,fContasReceber2.qConsultaParcCReceber.AsInteger]),[locaseinsensitive]) then
      if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) > 0 then
        Result := True;
  end;
end;

procedure TfCReceberAlteraSel.Alterar;
begin
  DM1.tCReceberParc.Edit;
  if ckTipoCobranca.Checked then
  begin
    if RxDBLookupCombo2.Text <> '' then
      DM1.tCReceberParcCodTipoCobranca.AsInteger := RxDBLookupCombo2.KeyValue
    else
      DM1.tCReceberParcCodTipoCobranca.AsInteger := 0;
  end;

  if ckTituloProtestado.Checked then
    DM1.tCReceberParcTitProtestado.AsBoolean := CheckBox1.Checked;

  if ckBanco.Checked then
  begin
    if RxDBLookupCombo5.Text <> '' then
      DM1.tCReceberParcCodBancoBoleto.AsInteger := RxDBLookupCombo5.KeyValue
    else
      DM1.tCReceberParcCodBancoBoleto.AsInteger := 0;
  end;

  if ckVendedor.Checked then
  begin
    if RxDBLookupCombo4.Text <> '' then
      DM1.tCReceberParcCodVendedor.AsInteger := RxDBLookupCombo4.KeyValue
    else
      DM1.tCReceberParcCodVendedor.AsInteger := 0;
  end;

  if ckComissao.Checked then
    DM1.tCReceberParcPercComissao.AsFloat := StrToFloat(FormatFloat('0.00',CurrencyEdit3.Value));

  DM1.tCReceberParc.Post;
  vContador := vContador + 1;
end;

procedure TfCReceberAlteraSel.ckTipoCobrancaClick(Sender: TObject);
begin
  Label10.Visible          := ckTipoCobranca.Checked;
  RxDBLookupCombo2.Visible := ckTipoCobranca.Checked;
end;

procedure TfCReceberAlteraSel.ckTituloProtestadoClick(Sender: TObject);
begin
  Label15.Visible   := ckTituloProtestado.Checked;
  CheckBox1.Visible := ckTituloProtestado.Checked;
end;

procedure TfCReceberAlteraSel.ckBancoClick(Sender: TObject);
begin
  Label19.Visible          := ckBanco.Checked;
  RxDBLookupCombo5.Visible := ckBanco.Checked;
end;

procedure TfCReceberAlteraSel.ckVendedorClick(Sender: TObject);
begin
  Label17.Visible          := ckVendedor.Checked;
  RxDBLookupCombo4.Visible := ckVendedor.Checked;
end;

procedure TfCReceberAlteraSel.ckComissaoClick(Sender: TObject);
begin
  Label18.Visible       := ckComissao.Checked;
  CurrencyEdit3.Visible := ckComissao.Checked;
end;

procedure TfCReceberAlteraSel.Gravar_Historico;
var
  vTexto : String;
begin
  vTexto := '';
  DM1.tCReceberParcHist.Insert;
  tCReceberParcHistIns.Refresh;
  tCReceberParcHistIns.Last;
  Dm1.tCReceberParcHistFilial.AsInteger        := Dm1.tCReceberParcFilial.AsInteger;
  DM1.tCReceberParcHistNumCReceber.AsInteger   := DM1.tCReceberParcNumCReceber.AsInteger;
  DM1.tCReceberParcHistParcCReceber.AsInteger  := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tCReceberParcHistItem.AsInteger          := tCReceberParcHistInsItem.AsInteger + 1;
  DM1.tCReceberParcHistDtHistorico.AsDateTime  := Date;
  DM1.tCReceberParcHistCodHistorico.AsCurrency := CurrencyEdit1.Value;
  DM1.tCReceberParcHistHistorico.AsString      := '';
  if Trim(Edit1.Text) <> '' then
    DM1.tCReceberParcHistHistorico.AsString      := Edit1.Text
  else
  begin
    vTexto := 'Alterado ';
    if ckTipoCobranca.Checked then
      vTexto := vTexto + '(Tipo Cob.)';
    if ckTituloProtestado.Checked then
    begin
      if CheckBox1.Checked then
        vTexto := vTexto + '(Tit.Prot.)'
      else
        vTexto := vTexto + '(Tit. Não Prot.)';
    end;
    if ckBanco.Checked then
      vTexto := vTexto + '(Banco)';
    if ckVendedor.Checked then
      vTexto := vTexto + '(Vendedor)';
    if ckComissao.Checked then
      vTexto := vTexto + '(Comissão ' + CurrencyEdit3.Text + ')';
    DM1.tCReceberParcHistHistorico.AsString := vTexto;
  end;

  DM1.tCReceberParcHistTipo.AsString := 'ALT';
  DM1.tCReceberParcHist.Post;
end;

end.
