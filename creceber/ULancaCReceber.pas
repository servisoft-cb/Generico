unit ULancaCReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids,
  ToolEdit, CurrEdit, Mask, RXLookup, RXDBCtrl, Db, DbTables, ComCtrls, ALed, RXCtrls, Variants;

type
  TfLancaCReceber = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    Panel4: TPanel;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    SpeedButton2: TSpeedButton;
    BitBtn9: TBitBtn;
    tCReceberIns: TTable;
    tCReceberInsNumCReceber: TIntegerField;
    tCReceberInsNumNota: TIntegerField;
    tCReceberInsQuitado: TBooleanField;
    tCReceberInsCodCli: TIntegerField;
    tCReceberInsTipoDoc: TStringField;
    tCReceberInsDtGerado: TDateField;
    tCReceberInsHistorico: TStringField;
    tCReceberParcIns: TTable;
    tCReceberParcInsNumCReceber: TIntegerField;
    tCReceberParcInsParcCReceber: TIntegerField;
    tCReceberParcInsVlrParcCReceber: TFloatField;
    tCReceberParcInsDtVencCReceber: TDateField;
    tCReceberParcInsQuitParcCReceber: TBooleanField;
    tCReceberParcInsJurosParcCReceber: TFloatField;
    tCReceberParcInsDtPagParcCReceber: TDateField;
    tCReceberParcInsCodCli: TIntegerField;
    tCReceberParcInsNumNota: TIntegerField;
    tCReceberParcInsDesconto: TFloatField;
    tCReceberParcInsPgtoParcial: TFloatField;
    tCReceberParcInsRestParcela: TFloatField;
    tCReceberParcInsContaDupl: TSmallintField;
    tCReceberParcInsSelecionado: TBooleanField;
    tCReceberParcInsCodVendedor: TIntegerField;
    tCReceberParcInsBaixada: TBooleanField;
    tCReceberParcInsPercComissao: TFloatField;
    tCReceberParcInsVlrComissao: TFloatField;
    tCReceberParcInsPlanoContas: TIntegerField;
    tCReceberParcInsTitPortador: TStringField;
    tCReceberParcInsCodTipoCobranca: TIntegerField;
    tCReceberParcInsDespesas: TFloatField;
    tCReceberParcInsAbatimentos: TFloatField;
    tCReceberParcInsCodConta: TIntegerField;
    tCReceberParcInsPgCartorio: TBooleanField;
    tCReceberParcInsDiasAtraso: TFloatField;
    tCReceberParcInsLetraCambio: TBooleanField;
    tCReceberParcInsAgencia: TStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label4: TLabel;
    Panel5: TPanel;
    Label5: TLabel;
    Edit1: TEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    tCReceberInsFilial: TIntegerField;
    tCReceberInsCancelado: TBooleanField;
    tCReceberInsDuplicataImp: TBooleanField;
    tCReceberInsVlrTotal: TFloatField;
    tCReceberParcInsFilial: TIntegerField;
    Bevel1: TBevel;
    RxDBGrid1: TRxDBGrid;
    BitBtn14: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn12: TBitBtn;
    StaticText4: TStaticText;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    ALed1: TALed;
    Label8: TLabel;
    ALed2: TALed;
    Label9: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SpeedButton8Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
    procedure Coloca_MasterSource;
    procedure Excluir_Registro;
  public
    vNumParcela : integer;
    vCodBoletoAlt : Integer;
    { Public declarations }
  end;

var
  fLancaCReceber: TfLancaCReceber;
  //vNumParcela : integer;

implementation

Uses UDM1, UCliente, UPlanoContas, UConsLancCReceber, UEscFilial,
  UContasReceber2, ULancaCReceberItens;

{$R *.DFM}

procedure TfLancaCReceber.Excluir_Registro;
begin
  DM1.tCReceberParc.First;
  while not DM1.tCReceberParc.EOF do
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
  DM1.tCReceber.Delete;
end;

procedure TfLancaCReceber.Habilita;
begin
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn9.Enabled      := not(BitBtn9.Enabled);
  Panel2.Enabled       := not(Panel2.Enabled);
  Panel5.Enabled       := not(Panel5.Enabled);
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
end;

procedure TfLancaCReceber.Coloca_MasterSource;
begin
  DM1.tMovimentos.IndexFieldNames := 'CodConta';
  DM1.tMovimentos.MasterSource    := DM1.dsContas;
  DM1.tMovimentos.MasterFields    := 'CodConta';
end;

procedure TfLancaCReceber.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioCReceberAltera.AsBoolean then
  begin
    vCodBoletoAlt        := 0;
    vNumParcela          := 0;
    fEscFilial := TfEscFilial.Create(Self);
    fEscFilial.ShowModal;
    fLancaCReceber.Caption := 'Lançamentos de Contas a Receber ' + Dm1.tFilialEmpresa.AsString;
    tCReceberIns.Refresh;
    tCReceberIns.Last;
    DM1.tCReceber.IndexFieldNames := 'Filial;NumCReceber';
    DM1.tCReceber.Insert;
    Dm1.tCReceberFilial.AsInteger      := Dm1.tFilialCodigo.AsInteger;
    DM1.tCReceberNumCReceber.AsInteger := tCReceberInsNumCReceber.AsInteger + 1;
    DM1.tCReceberTipoDoc.AsString      := 'AV';
    DM1.tCReceberSerie.AsString        := 'AV';
    DM1.tCReceberDtGerado.AsDateTime   := Date;
    DM1.tCReceberCancelado.AsBoolean   := False;
    DM1.tCReceber.Post;
    DM1.tCReceber.Edit;
    Habilita;
    RxDBLookupCombo1.Enabled := True;
    DBEdit6.Enabled          := True;
    RxDBLookupCombo1.ClearValue;
    //RxDBLookupCombo1.SetFocus;
    DBEdit6.SetFocus;
    DBEdit1.Enabled := True;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inclusão!');
end;

procedure TfLancaCReceber.BitBtn4Click(Sender: TObject);
var
  vVlrTotal : Real;
begin
  if DM1.tCReceberCodCli.AsInteger < 1 then
    ShowMessage('Falta o nome do cliente')
  else
    begin
      if not DM1.tCReceberParc.IsEmpty then
        begin
          vVlrTotal := 0;
          DM1.tCReceberParc.First;
          while not DM1.tCReceberParc.Eof do
            begin        
              DM1.tCReceberParc.Edit;
              DM1.tCReceberParcCodCli.AsInteger     := DM1.tCReceberCodCli.AsInteger;
              DM1.tCReceberParcNumNota.AsInteger    := DM1.tCReceberNumNota.AsInteger;
              DM1.tCReceberParcSerie.AsString       := DM1.tCReceberSerie.AsString;
              DM1.tCReceberParcNumSeqNota.AsInteger := DM1.tCReceberNumSeqNota.AsInteger;
              vVlrTotal := vVlrTotal + DM1.tCReceberParcVlrParcCReceber.AsFloat;
              DM1.tCReceberParcDtGerado.AsDateTime := DM1.tCReceberDtGerado.AsDateTime;

              DM1.tCReceberParc.Post;
              DM1.GravaEnt_tCReceberParcHist('ENT');

              DM1.tCReceberParc.Next;
            end;
          DM1.tCReceberVlrTotal.AsFloat := vVlrTotal;
          DM1.tCReceber.Post;
          Habilita;
          BitBtn9.Tag := 0;
        end
      else
        MessageDlg('Você não pode confirmar esta Conta a Receber com as parcelas vazias!',mtInformation,[mbOK],0);
    end;
end;

procedure TfLancaCReceber.BitBtn3Click(Sender: TObject);
var
  vExcluir : Boolean;
begin
  if DM1.tUsuarioCReceberAltera.AsBoolean then
  begin
    if MessageDlg('Deseja realmente excluir esta Conta a Receber?',mtConfirmation,[mbOK,mbNO],0) = mrOK then
    begin
      vExcluir := True;
      DM1.tCReceberParc.First;
      while not DM1.tCReceberParc.Eof do
      begin
        if DM1.tCReceberParcPgtoParcial.AsFloat > 0 then
        begin
          vExcluir := False;
          DM1.tCReceberParc.Last;
        end;
        DM1.tCReceberParc.Next;
      end;
      if vExcluir then
        Excluir_Registro
      else
        ShowMessage('Exclusão cancelada, Consta pagamento');
    end;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfLancaCReceber.BitBtn2Click(Sender: TObject);
var
  vVlrTotal : Real;
begin
  if BitBtn9.Tag = 1 then
    begin
      if DM1.tCReceberParc.State in [dsEdit,dsInsert] then
        DM1.tCReceberParc.Post;
      vVlrTotal := 0;
      DM1.tCReceberParc.First;
      while not DM1.tCReceberParc.Eof do
        begin
          DM1.tCReceberParc.Edit;
          DM1.tCReceberParcCodCli.AsInteger    := DM1.tCReceberCodCli.AsInteger;
          DM1.tCReceberParcNumNota.AsInteger   := DM1.tCReceberNumNota.AsInteger;
          DM1.tCReceberParcDtGerado.AsDateTime := DM1.tCReceberDtGerado.AsDateTime;
          DM1.tCReceberParc.Post;
          DM1.GravaEnt_tCReceberParcHist('ENT');

          vVlrTotal := vVlrTotal + DM1.tCReceberParcVlrParcCReceber.AsFloat;
          DM1.tCReceberParc.Next;
        end;
      DM1.tCReceberVlrTotal.AsFloat := vVlrTotal;
      DM1.tCReceber.Post;
    end
  else
    Excluir_Registro;
  Habilita;
  BitBtn9.Tag := 0;
end;

procedure TfLancaCReceber.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfLancaCReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Coloca_MasterSource;
  if Screen.FormCount < 3 then
  begin
    DM1.tCReceberParcRem.Close;
    DM1.tCReceberParcHist.Close;
    DM1.tCReceberParc.Close;
    DM1.tCReceber.Close;
    DM1.tPlanoContasItens.Close;
    DM1.tPlanoContas.Close;
    DM1.tMovimentos.Close;
    DM1.tCliente.Close;
  end;
  Action := Cafree;
end;

procedure TfLancaCReceber.FormShow(Sender: TObject);
begin
  DM1.tCReceber.Open;
  DM1.tCReceberParc.Open;
  DM1.tCReceberParcHist.Open;
  DM1.tCReceberParcRem.Open;
  DM1.tContas.Open;
  DM1.tPlanoContas.Open;
  DM1.tPlanoContasItens.Open;
  DM1.tMovimentos.Open;
  DM1.tCliente.Open;
  DM1.tTipoCobranca.Open;
  tCReceberIns.Open;
  tCReceberParcIns.Open;

  fLancaCReceber.Caption := 'Lançamentos de Contas a Receber ' + Dm1.tFilialEmpresa.AsString;
  DM1.tCReceber.Refresh;
  DM1.tCReceber.Last;
  if Tag = 1 then
    begin
      DM1.tFilial.Locate('Codigo',fContasReceber2.qConsultaFilial.AsInteger,[loCaseInsensitive]);
      DM1.tCReceber.Locate('Filial;NumCReceber',VarArrayOf([fContasReceber2.qConsultaFilial.AsInteger,fContasReceber2.qConsultaNumCReceber.AsInteger]),[loCaseInsensitive]);
    end;
end;

procedure TfLancaCReceber.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioClientes.AsBoolean then
    begin
      fCliente := TfCliente.Create(Self);
      fCliente.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de clientes!');
end;

procedure TfLancaCReceber.BitBtn9Click(Sender: TObject);
begin
  vCodBoletoAlt := 0;
  if DM1.tUsuarioCReceberAltera.AsBoolean then
  begin
    vNumParcela := 0;
    DM1.tCReceber.Edit;
    Habilita;
    RxDBLookupCombo1.Enabled := False;
    DBEdit6.Enabled          := False;
    DBEdit1.Enabled          := False;
    BitBtn16.SetFocus;
    BitBtn9.Tag := 1;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfLancaCReceber.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('QuitParcCReceber').AsBoolean then
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

procedure TfLancaCReceber.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioPlanoCtas.AsBoolean then
    begin
      fPlanoContas := TfPlanoContas.Create(Self);
      fPlanoContas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de plano de contas!');
end;

procedure TfLancaCReceber.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfLancaCReceber.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfLancaCReceber.RxDBLookupCombo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_F2 then
    begin
      if RxDBLookupCombo1.LookupDisplay = 'Nome;CgcCpf' then
        begin
           RxDBLookupCombo1.CloseUp(True);
           RxDBLookupCombo1.LookupDisplay    := 'Fantasia;CgcCpf';
           DM1.tCliente.IndexFieldNames := 'Fantasia';
           DM1.tCliente.Refresh;
           Label4.Caption := 'Consulta por Fantasia';
        end
      else
      if RxDBLookupCombo1.LookupDisplay = 'Fantasia;CgcCpf' then
        begin
          RxDBLookupCombo1.CloseUp(True);
          RxDBLookupCombo1.LookupDisplay    := 'Nome;CgcCpf';
          DM1.tCliente.IndexFieldNames := 'Nome';
          DM1.tCliente.Refresh;
          Label4.Caption := 'Consulta por Nome';
         end;
       if DM1.tClienteCodigo.AsInteger > 0 then
         RxDBLookupCombo1.KeyValue := DM1.tClienteCodigo.AsInteger;
       RxDBLookupCombo1.Refresh;
    end;
end;

procedure TfLancaCReceber.Edit1Change(Sender: TObject);
begin
  try
    DM1.tCReceber.IndexFieldNames := 'Filial;NumCReceber';
    DM1.tCReceber.FindNearest([DM1.tFilialCodigo.AsInteger,Edit1.Text]);
  except
    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfLancaCReceber.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tCReceber.State in [dsInsert,dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar esta Cta. a Receber antes de Fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfLancaCReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) and (DM1.tCReceber.State in [dsBrowse]) then
    begin
      fConsLancCReceber := TfConsLancCReceber.Create(Self);
      fConsLancCReceber.ShowModal;
      fLancaCReceber.Caption := 'Lançamentos de Contas a Receber ' + Dm1.tFilialEmpresa.AsString;
    end;
end;

procedure TfLancaCReceber.BitBtn14Click(Sender: TObject);
begin
  fLancaCReceberItens := TfLancaCReceberItens.Create(Self);
  BitBtn14.Tag := 0;
  fLancaCReceberItens.CurrencyEdit2.Enabled := True;
  fLancaCReceberItens.Limpa;
  fLancaCReceberItens.ShowModal;
end;

procedure TfLancaCReceber.BitBtn16Click(Sender: TObject);
begin
  if not DM1.tCReceberParc.IsEmpty then
  begin
    if DM1.tCReceberParcPgtoParcial.AsFloat > 0 then
      ShowMessage('Parcela já quitada, não pode ser alterada!')
    else
    begin
      BitBtn14.Tag := 1;
      fLancaCReceberItens  := TfLancaCReceberItens.Create(Self);
      vNumParcela                              := DM1.tCReceberParcParcCReceber.AsInteger;
      fLancaCReceberItens.CurrencyEdit1.Value  := DM1.tCReceberParcVlrParcCReceber.AsCurrency;
      fLancaCReceberItens.CurrencyEdit1.Value  := DM1.tCReceberParcRestParcela.AsCurrency;
      fLancaCReceberItens.CurrencyEdit2.Value  := DM1.tCReceberParcParcCReceber.AsInteger;
      if DM1.tCReceberParcCodConta.AsInteger > 0 then
        fLancaCReceberItens.RxDBLookupCombo1.KeyValue := DM1.tCReceberParcCodConta.AsInteger;
      fLancaCReceberItens.DateEdit1.Text              := DM1.tCReceberParcDtVencCReceber.AsString;
      if DM1.tCReceberParcPlanoContas.AsInteger > 0 then
        fLancaCReceberItens.RxDBLookupCombo3.KeyValue := DM1.tCReceberParcPlanoContas.AsInteger
      else
        fLancaCReceberItens.RxDbLookupCombo3.ClearValue;
      if DM1.tCReceberParcCodPlanoContasItens.AsInteger > 0 then
        fLancaCReceberItens.RxDBLookupCombo6.KeyValue := DM1.tCReceberParcCodPlanoContasItens.AsInteger
      else
        fLancaCReceberItens.RxDbLookupCombo6.ClearValue;
      if DM1.tCReceberParcCodTipoCobranca.AsInteger > 0 then
        fLancaCReceberItens.RxDBLookupCombo2.KeyValue := DM1.tCReceberParcCodTipoCobranca.AsInteger
      else
        fLancaCReceberItens.RxDbLookupCombo6.ClearValue;

      if DM1.tCReceberParcCodVendedor.AsInteger > 0 then
        fLancaCReceberItens.RxDBLookupCombo5.KeyValue := DM1.tCReceberParcCodVendedor.AsInteger
      else
        fLancaCReceberItens.RxDBLookupCombo5.ClearValue;
      fLancaCReceberItens.CurrencyEdit3.Value := DM1.tCReceberParcPercComissao.AsFloat;
      fLancaCReceberItens.Edit1.Text          := DM1.tCReceberParcNumTitBanco.AsString;
      fLancaCReceberItens.Edit2.Text          := DM1.tCReceberParcDescontoDe.AsString;
      fLancaCReceberItens.Edit3.Text          := DM1.tCReceberParcDescontoAte.AsString;

      fLancaCReceberItens.ShowModal;
    end;
  end
  else
    ShowMessage('Não há registro para ser alterado!');
end;

procedure TfLancaCReceber.BitBtn12Click(Sender: TObject);
begin
  vNumParcela := 0;
  if not DM1.tCReceberParc.IsEmpty then
    begin
      if DM1.tCReceberParcPgtoParcial.AsFloat > 0 then
        ShowMessage('Parcela já possui pagamento, não pode ser excluída!')
      else
        begin
          if MessageDlg('Deseja realmente excluir esta parcela?',mtConfirmation,[mbOK,mbNO],0) = mrOK then
            begin
              DM1.tCReceberVlrTotal.AsFloat := DM1.tCReceberVlrTotal.AsFloat - DM1.tCReceberParcVlrParcCReceber.AsFloat;
              DM1.tCReceberParcHist.First;
              while not DM1.tCReceberParcHist.Eof do
                DM1.tCReceberParcHist.Delete;
              DM1.tCReceberParc.Delete;
              BitBtn14.SetFocus;
            end;
        end;
    end
  else
    ShowMessage('Não há registro p/ ser excluído!');
end;

procedure TfLancaCReceber.DBEdit6Exit(Sender: TObject);
begin
  if Trim(DBEdit6.Text) <> '' then
    RxDBLookupCombo1.SetFocus;
end;

end.
