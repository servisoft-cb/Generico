unit UContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask,
  db, DBTables, RXLookup, ToolEdit, RXDBCtrl, RxDBComb, RzTabs, ComCtrls;

type
  TfContas = class(TForm)
    tContas: TTable;
    tContasCodConta: TIntegerField;
    tContasNomeConta: TStringField;
    tContasSaldoConta: TFloatField;
    tContasTipoConta: TStringField;
    tContasIns: TTable;
    tContasInsCodConta: TIntegerField;
    tContasInsNomeConta: TStringField;
    tContasInsSaldoConta: TFloatField;
    tContasInsTipoConta: TStringField;
    tContasInsCodBanco: TStringField;
    tContasCodBanco: TStringField;
    qMovimentos: TQuery;
    qMovimentosCodConta: TIntegerField;
    qCReceberParc: TQuery;
    qCReceberParcCodBancoBoleto: TIntegerField;
    qCReceberParcCodConta: TIntegerField;
    qCPagarParc: TQuery;
    qCPagarParcCodConta: TIntegerField;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    Panel5: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    Label41: TLabel;
    Label42: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    RxDBComboBox3: TRxDBComboBox;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Label13: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit7: TDBEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Panel6: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    RxDBComboBox11: TRxDBComboBox;
    DBDateEdit1: TDBDateEdit;
    DBEdit6: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label15: TLabel;
    Label17: TLabel;
    DBEdit12: TDBEdit;
    Label18: TLabel;
    DBEdit11: TDBEdit;
    DirectoryEdit1: TDirectoryEdit;
    DirectoryEdit2: TDirectoryEdit;
    DBText1: TDBText;
    BitBtn6: TBitBtn;
    Label7: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label16: TLabel;
    Label19: TLabel;
    DBEdit10: TDBEdit;
    Label20: TLabel;
    DBEdit13: TDBEdit;
    Label21: TLabel;
    DBEdit14: TDBEdit;
    Label22: TLabel;
    RxDBComboBox4: TRxDBComboBox;
    Label23: TLabel;
    DBEdit15: TDBEdit;
    DBEdit3: TDBEdit;
    Label24: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure DBLookupComboBox1DropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Habilita(Estado : Boolean);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn6Enter(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    vExcluir: Boolean;
    procedure Exclui_Registro;
    procedure Verifica_Conta;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fContas: TfContas;
  Saldo: Real;

implementation

uses UDM1, UContasBoletoManual, UBcoItau, UBancoCNAB, UBcoBrasil, UBcoSantander, uDmBanco;

{$R *.DFM}

procedure TfContas.Verifica_Conta;
begin
  vExcluir := False;
  qMovimentos.Close;
  qMovimentos.ParamByName('CodConta').AsInteger := DM1.tContasCodConta.AsInteger;
  qMovimentos.Open;
  if (qMovimentos.RecordCount > 0) and (qMovimentosCodConta.AsInteger = DM1.tContasCodConta.AsInteger) then
    begin
      ShowMessage('Conta possui movimentos, não pode ser excluída!');
      exit;
    end;
  qCReceberParc.Close;
  qCReceberParc.Open;
  if qCReceberParc.Locate('CodConta',DM1.tContasCodConta.AsInteger,[loCaseInsensitive]) then
    begin
      ShowMessage('Conta está no contas a receber!');
      exit;
    end;
  if qCReceberParc.Locate('CodBancoBoleto',DM1.tContasCodConta.AsInteger,[loCaseInsensitive]) then
    begin
      ShowMessage('Conta está no contas a receber como banco!');
      exit;
    end;
  qCPagarParc.Close;
  qCPagarParc.ParamByName('CodConta').AsInteger := DM1.tContasCodConta.AsInteger;
  qCPagarParc.Open;
  if (qCPagarParc.RecordCount > 0) and (qCPagarParcCodConta.AsInteger = DM1.tContasCodConta.AsInteger) then
    begin
      ShowMessage('Conta está cadastrada no contas a pagar!');
      exit;
    end;
  vExcluir := True;
end;

procedure TfContas.Exclui_Registro;
begin
  DM1.tMovimentos.First;
  while not DM1.tMovimentos.EOF do
    DM1.tMovimentos.Delete;

  DM1.tContas.delete;
end;

procedure TfContas.Habilita(Estado : Boolean);
begin
  TabSheet1.Enabled        := Estado;
  TabSheet2.Enabled        := Estado;
  BitBtn1.Enabled          := not Estado;
  BitBtn2.Enabled          := not Estado;
  BitBtn3.Enabled          := not Estado;
  BitBtn5.Enabled          := Estado;
  BitBtn6.Enabled          := Estado;
  DBNavigator1.Enabled     := not Estado;
  RxDbLookUpCombo1.Enabled := not Estado;
end;

procedure TfContas.BitBtn5Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    Exclui_Registro
  else
  if BitBtn2.Tag = 1 then
    DM1.tContas.Cancel;
  BitBtn2.Tag := 0;
  Habilita(False);
  BitBtn1.SetFocus;
end;

procedure TfContas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qMovimentos.Close;
  qCReceberParc.Close;
  DM1.tContas.Edit;
  DM1.tContas.Post;
  if Screen.FormCount < 3 then
  begin
    DM1.tMovimentos.Close;
    DM1.tCondPgto.Close;
    DM1.tCondPgtoItem.Close;
  end;
  Action := Cafree;
end;

procedure TfContas.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsContas.AsBoolean then
    begin
      tContasIns.IndexFieldNames    := 'CodConta';
      tContasIns.Refresh;
      tContasIns.Last;
      DM1.tContas.IndexFieldNames   := 'CodConta';
      DM1.tContas.Insert;
      DM1.tContasCodConta.AsInteger := tContasInsCodConta.AsInteger + 1;
      DM1.tContasTipoConta.AsString := 'B';
      DM1.tContas.Post;
      DM1.tContas.Edit;
      Habilita(True);
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfContas.BitBtn6Click(Sender: TObject);
begin
  if (DM1.tContasCNAB.AsString <> '') and (DM1.tContasFilial.AsInteger <= 0) then
    begin
      ShowMessage('Falta informar a filial!');
      exit;
    end;

  dm1.tContasBANCO_LOGO.AsString  := DirectoryEdit1.Text;
  dm1.tContasEnd_Arq_Rem.AsString := DirectoryEdit2.Text;

  if DBEdit1.Text <> '' then
    begin
      DM1.tContas.Post;
      Habilita(False);
      BitBtn2.Tag := 0;
      BitBtn1.SetFocus;
    end
  else
    begin
      DBEdit1.SetFocus;
      ShowMessage('Deve haver o nome da conta!');
    end;
end;

procedure TfContas.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcContas.AsBoolean then
    begin
      Verifica_Conta;
      qMovimentos.Close;
      qCPagarParc.Close;
      qCReceberParc.Close;
      if vExcluir then
        begin
          if DM1.tContasCodConta.AsInteger = 1 then
            ShowMessage('Conta 1 não pode ser excluída!')
          else
          if MessageDlg(' Esta operação apagará todos os movimentos desta conta. Deseja realmente excluir a conta?',mtconfirmation,
                    [mbok,mbno],0) = mrOK then
            Exclui_Registro
        end;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfContas.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltContas.AsBoolean then
    begin
      DM1.tContas.IndexFieldNames := 'CodConta';
      DM1.tContas.Edit;
      Habilita(True);
      BitBtn2.Tag := 1;
      Saldo := DM1.tContasSaldoConta.AsFloat;
      DBEdit1.SetFocus;

      RzPageControl1.ActivePageIndex := 0;
      DirectoryEdit1.Text  := dm1.tContasBANCO_LOGO.AsString;
      DirectoryEdit2.Text  := dm1.tContasEnd_Arq_Rem.AsString;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfContas.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  Habilita(False);
  DM1.tContas.IndexFieldNames := 'CodConta';
end;

procedure TfContas.DBLookupComboBox1DropDown(Sender: TObject);
begin
  DM1.tContas.IndexFieldNames := 'NomeConta';
end;

procedure TfContas.FormShow(Sender: TObject);
begin
  DMBanco := TDMBanco.Create(Self);

  DM1.tContas.Open;
  DM1.tContasParametros.Open;
  DM1.tMovimentos.Open;
  DM1.tCondPgto.Open;
  DM1.tCondPgtoItem.Open;
  DM1.tContas.Refresh;

  dm1.tBanco.Open;
  tContas.Open;
  tContasIns.Open;

  DM1.tContas.Last;
  Habilita(False);

  DBDateEdit1.ReadOnly := not(DM1.tUsuarioEncerrarContaPeriodo.AsBoolean);
end;

procedure TfContas.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tContas.IndexFieldNames := 'NomeConta';
end;

procedure TfContas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if DM1.tContas.State in [dsInsert,dsEdit] then
    begin
     ShowMessage('Você deve Cancelar ou Confirmar antes de fechar esta janela!');
     CanClose := False;
    end
 else
    CanClose := True;
end;

procedure TfContas.BitBtn6Enter(Sender: TObject);
begin
  if DM1.tContas.State in [dsInsert] then
    begin
      tContasIns.IndexFieldNames := 'NomeConta';
      tContasIns.Refresh;
      tContasIns.SetKey;
      tContasIns.FieldByName('NomeConta').AsString := DBEdit1.Text;
      if tContasIns.GotoKey then
        begin
          ShowMessage('Conta já cadastrada!');
          DM1.tContas.Cancel;
          DM1.tContas.Insert;
          DBEdit1.SetFocus;
        end;
    end;
end;

procedure TfContas.BitBtn8Click(Sender: TObject);
begin
  fContasBoletoManual := TfContasBoletoManual.Create(Self);
  fContasBoletoManual.GroupBox1.Enabled := (DM1.tContas.State in [dsEdit,dsInsert]);
  fContasBoletoManual.ShowModal;
end;

procedure TfContas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
    BitBtn8.Visible := not(BitBtn8.Visible);
end;

procedure TfContas.BitBtn7Click(Sender: TObject);
begin
  if DM1.tContasCNAB.AsString = 'ITAU400' then
  begin
    fBcoItau := TfBcoItau.Create(Self);
    fBcoItau.ShowModal;
  end
  else
  if (DM1.tContasCNAB.AsString = 'SANTANDER240') then
  begin
    fBcoSantander := TfBcoSantander.Create(Self);
    fBcoSantander.ShowModal;
  end
  else
  begin
    fBcoBrasil := TfBcoBrasil.Create(Self);
    fBcoBrasil.ShowModal;
    {fBancoCNAB := TfBancoCNAB.Create(Self);
    fBancoCNAB.vCodConta := DM1.tContasCodConta.AsInteger;
    fBancoCNAB.ShowModal;}
  end;

end;

procedure TfContas.RxDBLookupCombo1Change(Sender: TObject);
begin
  DirectoryEdit1.Text  := dm1.tContasBANCO_LOGO.AsString;
  DirectoryEdit2.Text  := dm1.tContasEnd_Arq_Rem.AsString;
end;

procedure TfContas.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DMBanco);
end;

end.
