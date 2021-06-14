unit UFilial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DBCtrls, StdCtrls, Buttons, RxLookup, ExtCtrls, Mask, VerificaCGC, ExtDlgs, RxDBComb,
  RzTabs, ToolEdit, RXDBCtrl, DB, DBTables, Grids, DBGrids, SMDBGrid,
  VerificaCPF, NxCollection, RzPanel;

type
  TfFilial = class(TForm)
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
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    VerificaCGC1: TVerificaCGC;
    OpenPictureDialog2: TOpenPictureDialog;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    BitBtn5: TBitBtn;
    Label16: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    CheckBox1: TCheckBox;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    Panel6: TPanel;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label19: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    RxDBLookupCombo6: TRxDBLookupCombo;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    BitBtn20: TBitBtn;
    RxDBLookupCombo3: TRxDBLookupCombo;
    DBEdit15: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit5: TDBEdit;
    Panel7: TPanel;
    Label7: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo5: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    RxDBComboBox2: TRxDBComboBox;
    RxDBComboBox3: TRxDBComboBox;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Label29: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    Label30: TLabel;
    RxDBLookupCombo8: TRxDBLookupCombo;
    Label31: TLabel;
    DBEdit19: TDBEdit;
    Bevel1: TBevel;
    Label32: TLabel;
    Label33: TLabel;
    DBDateEdit1: TDBDateEdit;
    TabSheet3: TRzTabSheet;
    tFilial2: TTable;
    tFilial2Codigo: TIntegerField;
    tFilial2Empresa: TStringField;
    dsFilial2: TDataSource;
    SMDBGrid1: TSMDBGrid;
    Panel8: TPanel;
    Label34: TLabel;
    RxDBLookupCombo9: TRxDBLookupCombo;
    BitBtn7: TBitBtn;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    GroupBox1: TGroupBox;
    Label54: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    DBEdit35: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    TabSheet4: TRzTabSheet;
    Panel9: TPanel;
    Label35: TLabel;
    SpeedButton5: TSpeedButton;
    BitBtn6: TBitBtn;
    Label36: TLabel;
    ComboBox1: TComboBox;
    MaskEdit1: TMaskEdit;
    VerificaCPF1: TVerificaCPF;
    SMDBGrid2: TSMDBGrid;
    pnlConfig_Danfe_NFe: TPanel;
    gbxCertificado: TRzGroupBox;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    Edit1: TEdit;
    RzGroupBox1: TRzGroupBox;
    Label72: TLabel;
    Label71: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label77: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label76: TLabel;
    DBEdit48: TDBEdit;
    BitBtn8: TBitBtn;
    RxDBComboBox13: TRxDBComboBox;
    RxDBComboBox14: TRxDBComboBox;
    RxDBComboBox15: TRxDBComboBox;
    DBEdit47: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    DBEdit51: TDBEdit;
    Panel10: TPanel;
    btnConfirmar_Config_NFe: TNxButton;
    btnAlterar_Config_NFe: TNxButton;
    btnCancelar_Config_NFe: TNxButton;
    TS_Config_Danfe_NFe: TRzTabSheet;
    DBMemo1: TDBMemo;
    Label37: TLabel;
    Label38: TLabel;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    Label39: TLabel;
    Label40: TLabel;
    RxDBLookupCombo10: TRxDBLookupCombo;
    Label41: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
    procedure btnAlterar_Config_NFeClick(Sender: TObject);
    procedure btnConfirmar_Config_NFeClick(Sender: TObject);
    procedure btnCancelar_Config_NFeClick(Sender: TObject);
    procedure RxDBLookupCombo10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Habilita;
    procedure Excluir_Registro;
    procedure prc_Abrir_Config_NFe;
    procedure prc_Configurar_Danfe_Aut;
    
  public
    { Public declarations }
  end;

var
  fFilial: TfFilial;

implementation

uses UDM1, UDM2, UUf, UDMTabImposto, dmdNFeConfig, uUtil, UDMTabEnqIPI,
  USel_EnqIPI, uUtilPadrao;

{$R *.DFM}

procedure TfFilial.Habilita;
begin
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
  Panel2.Enabled       := not(Panel2.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
  Panel6.Enabled       := not(Panel6.Enabled);
  Panel7.Enabled       := not(Panel7.Enabled);
  Panel8.Enabled       := not(Panel8.Enabled);
  Panel9.Enabled       := not(Panel9.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
end;

procedure TfFilial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DMTabImposto.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMTabImposto);
  if DMTabEnqIPI.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMTabEnqIPI);
  FreeAndNil(DMNFeConfig);
  FreeAndNil(DMNFeConfig);
  DM1.tFilial_Download.Close;
  Action := Cafree;
end;

procedure TfFilial.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFilial.IndexFieldNames := 'Empresa';
end;

procedure TfFilial.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tFilial.IndexFieldNames := 'Codigo';
end;

procedure TfFilial.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioUf.AsBoolean then
    begin
      fUf := TfUf.Create(Self);
      fUf.ShowModal;
    end
  else
    ShowMessage('O usuário '+DM1.tUsuarioUsuario.AsString+' não está autorizado a abrir este formulário!');
end;

procedure TfFilial.DBEdit9Exit(Sender: TObject);
begin
  if DBEdit9.Text <> '  .   .   /    -  ' then
  begin
    VerificaCGC1.Entrada := DBEdit9.Text;
    if not VerificaCGC1.Resultado then
    begin
      ShowMessage('Número de CNPJ inválido!');
      DBEdit9.SetFocus;
    end;
  end;
end;

procedure TfFilial.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if DM1.tUsuarioInsFilial.AsBoolean then
    begin
      DM1.RxDBFilter1.Active := False;
      DM1.tFilial.IndexFieldNames := 'Codigo';
      DM1.tFilial.Refresh;
      DM1.tFilial.Last;
      vCodAux := DM1.tFilialCodigo.AsInteger;
      DM1.RxDBFilter1.Active := True;
      DM1.tFilial.Insert;
      DM1.tFilialCodigo.AsInteger  := vCodAux + 1;
      Dm1.tFilialSimples.AsBoolean := False;
      dm1.tFilialInativo.AsBoolean := False;
      DM1.tFilial.Post;
      DM1.tFilial.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('O usuário '+DM1.tUsuarioUsuario.AsString+' não está autorizado a fazer inserção!');
end;

procedure TfFilial.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltFilial.AsBoolean then
    begin
      DM1.tFilial.Edit;
      Habilita;
      BitBtn2.Tag := 1;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('O usuário '+DM1.tUsuarioUsuario.AsString+' não está autorizado a fazer alteração!');
end;

procedure TfFilial.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcFilial.AsBoolean then
  begin
    if not DM1.tCidade.IsEmpty then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        Excluir_Registro;
    end
    else
      ShowMessage('Não há registro p/ ser excluído!');
  end
  else
    ShowMessage('O usuário '+DM1.tUsuarioUsuario.AsString+' não está autorizado a fazer exclusão!');
end;

procedure TfFilial.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    Excluir_Registro
  else
  if BitBtn2.Tag = 1 then
    DM1.tFilial.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfFilial.BitBtn5Click(Sender: TObject);
begin
  DM1.tFilialCidade.AsString := RxDBLookupCombo3.Text;
  DM1.tFilial.Post;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfFilial.BitBtn20Click(Sender: TObject);
begin
  OpenPictureDialog2.Execute;
  DM1.tFilialEndLogo.AsString := OpenPictureDialog2.FileName;
end;

procedure TfFilial.CheckBox1Click(Sender: TObject);
begin
  dm1.RXDBFilter1.Active := not CheckBox1.Checked;
end;

procedure TfFilial.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tCidade.IndexFieldNames := 'Nome';
end;

procedure TfFilial.FormShow(Sender: TObject);
begin
  if not Assigned(DMTabImposto) then
    DMTabImposto := TDMTabImposto.Create(Self);
  if not Assigned(DMTabEnqIPI) then
    DMTabEnqIPI := TDMTabEnqIPI.Create(Self);
  DMNFeConfig      := TDMNFeConfig.Create(Self);

  DMTabEnqIPI.Abre_Tab_EnqIPI(0);
  DMTabImposto.tRegimeTrib.Open;
  DM1.tFilial.Open;
  //NFe 2.00
  DM1.tCSTIPI.Open;
  DM1.tSitTributaria.Open;
  DM1.tCidade.Open;
  DM1.tUf.Open;

  if DM1.tParametrosUsaGrupoFilial.AsBoolean then
    DM1.tFilialDep.Open;
  DM1.tFilial_Download.Open;

  TabSheet3.TabVisible := DM1.tParametrosUsaGrupoFilial.AsBoolean;
end;

procedure TfFilial.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
    DBDateEdit1.ReadOnly := not(DBDateEdit1.ReadOnly);
end;

procedure TfFilial.BitBtn7Click(Sender: TObject);
begin
  if RxDBLookupCombo9.Text = '' then
  begin
    ShowMessage('Filial não informada!');
    exit;
  end;

  if RxDBLookupCombo9.KeyValue = DM1.tFilialCodigo.AsInteger then
  begin
    ShowMessage('Filial informada não pode ser a mesma da principal!');
    exit;
  end;

  DM1.tFilialDep.Insert;
  DM1.tFilialDepCodFilial.AsInteger    := DM1.tFilialCodigo.AsInteger;
  DM1.tFilialDepCodFilialDep.AsInteger := RxDBLookupCombo9.KeyValue;
  DM1.tFilialDep.Post;

  RxDBLookupCombo9.ClearValue;
  RxDBLookupCombo9.SetFocus;
end;

procedure TfFilial.Excluir_Registro;
begin
  if DM1.tParametrosUsaGrupoFilial.AsBoolean then
  begin
    DM1.tFilialDep.First;
    while not DM1.tFilialDep.Eof do
      DM1.tFilialDep.Delete;
  end;
  DM1.tFilial.Delete;
end;

procedure TfFilial.SpeedButton4Click(Sender: TObject);
begin
  if (DM1.tFilialDep.IsEmpty) or (DM1.tFilialDepCodFilialDep.AsInteger < 1) then
  begin
    ShowMessage('Não existe registro para excluir!');
    exit;
  end;

  DM1.tFilialDep.Delete;
end;

procedure TfFilial.SpeedButton3Click(Sender: TObject);
begin
  RxDBLookupCombo9.ClearValue;
  RxDBLookupCombo9.SetFocus;
end;

procedure TfFilial.ComboBox1Exit(Sender: TObject);
begin
  MaskEdit1.EditMask := '';
  case ComboBox1.ItemIndex of
    0 : MaskEdit1.EditMask := '99.999.999/9999-99';
    1 : MaskEdit1.EditMask := '999.999.999-99';
  end;
end;

procedure TfFilial.MaskEdit1Exit(Sender: TObject);
begin
  if (ComboBox1.ItemIndex = 1) and (Copy(MaskEdit1.Text,1,2) <> '') then
  begin
    VerificaCPF1.Entrada := MaskEdit1.Text;
    if not VerificaCPF1.Resultado then
    begin
      ShowMessage('Número de CPF inválido!');
      MaskEdit1.SetFocus;
     end;
   end
  else
  if (ComboBox1.ItemIndex = 0) and (Copy(MaskEdit1.Text,1,2) <> '  ') then
  begin
     VerificaCGC1.Entrada := MaskEdit1.Text;
   if not VerificaCGC1.Resultado then
    begin
     ShowMessage('Número de CNPJ inválido!');
     MaskEdit1.SetFocus;
    end;
  end;
end;

procedure TfFilial.BitBtn6Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  DM1.tFilial_Download.Refresh;
  DM1.tFilial_Download.Last;
  vItemAux := DM1.tFilial_DownloadItem.AsInteger;

  DM1.tFilial_Download.Insert;
  DM1.tFilial_DownloadCodFilial.AsInteger := DM1.tFilialCodigo.AsInteger;
  DM1.tFilial_DownloadItem.AsInteger      := vItemAux + 1;
  case ComboBox1.ItemIndex of
    0 : DM1.tFilial_DownloadPessoa.AsString := 'J';
    1 : DM1.tFilial_DownloadPessoa.AsString := 'F';
  end;
  DM1.tFilial_DownloadCNPJ_CPF.AsString := MaskEdit1.Text;
  DM1.tFilial_Download.Post;

  ComboBox1.SetFocus;
  MaskEdit1.Clear;
end;

procedure TfFilial.SpeedButton5Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrNo then
    exit;

  DM1.tFilial_Download.Delete;
end;

procedure TfFilial.RzPageControl1Change(Sender: TObject);
begin
  if (RzPageControl1.ActivePage = TS_Config_Danfe_NFe) then
  begin
    prc_Abrir_Config_NFe;
    if  DMNFeConfig.cdsConfig_NFeAMBIENTE.AsInteger = 0 then
      Edit1.Text := 'Produção'
    else
      Edit1.Text := 'Homologação';
  end;
end;

procedure TfFilial.prc_Abrir_Config_NFe;
begin
  DMNFeConfig.cdsConfig_NFe.Close;
  if (DM1.tFilial.Active) then
  begin
    DMNFeConfig.sdsConfig_NFe.ParamByName('CNPJ_TITULAR').AsString := Monta_Numero(DM1.tFilialCNPJ.AsString,0);
    DMNFeConfig.cdsConfig_NFe.Open;
  end;
end;

procedure TfFilial.prc_Configurar_Danfe_Aut;
begin
  if (DMNFeConfig.cdsConfig_NFeDANFE_QUADRO_RECIBO.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_QUADRO_RECIBO.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_QUADRO_RECIBO.AsString := 'S';
  if (DMNFeConfig.cdsConfig_NFeDANFE_QUADRO_FATURA.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_QUADRO_FATURA.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_QUADRO_FATURA.AsString := 'S';
  if (DMNFeConfig.cdsConfig_NFeDANFE_QUADRO_ISSQN.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_QUADRO_ISSQN.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_QUADRO_ISSQN.AsString := 'S';
  if (DMNFeConfig.cdsConfig_NFeDANFE_SEPARADOR_ITEM.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_SEPARADOR_ITEM.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_SEPARADOR_ITEM.AsString := 'l';
  if DMNFeConfig.cdsConfig_NFeDANFE_QTRIBDEC.AsInteger <= 0 then
    DMNFeConfig.cdsConfig_NFeDANFE_QTRIBDEC.AsInteger := 4;
  if DMNFeConfig.cdsConfig_NFeDANFE_ALTQUADRORECIBO.AsInteger <= 0 then
    DMNFeConfig.cdsConfig_NFeDANFE_ALTQUADRORECIBO.AsInteger := 18;
  if (DMNFeConfig.cdsConfig_NFeDANFE_SEM_COLUNA_DESCONTO.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_SEM_COLUNA_DESCONTO.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_SEM_COLUNA_DESCONTO.AsString := 'S';
  if (DMNFeConfig.cdsConfig_NFeDANFE_COM_FATURA.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_COM_FATURA.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_COM_FATURA.AsString := 'N';
  if (DMNFeConfig.cdsConfig_NFeDANFE_SEM_DADOS_EMITENTE.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_SEM_DADOS_EMITENTE.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_SEM_DADOS_EMITENTE.AsString := 'N';
  if (DMNFeConfig.cdsConfig_NFeDANFE_SEM_QUADRO_EMITENTE.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_SEM_QUADRO_EMITENTE.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_SEM_QUADRO_EMITENTE.AsString := 'N';
  if (DMNFeConfig.cdsConfig_NFeDANFE_SALTAR_LINHA.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_SALTAR_LINHA.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_SALTAR_LINHA.AsString := 'S';
  if (DMNFeConfig.cdsConfig_NFeDANFE_CARACTER_SALTAR_LINHA.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_CARACTER_SALTAR_LINHA.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_CARACTER_SALTAR_LINHA.AsString := ';';
  if (DMNFeConfig.cdsConfig_NFeDANFE_MOSTRAR_ST.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_MOSTRAR_ST.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_MOSTRAR_ST.AsString := 'N';
  if (DMNFeConfig.cdsConfig_NFeDANFE_OMITIR_RESER_AO_FISCO.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_OMITIR_RESER_AO_FISCO.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_OMITIR_RESER_AO_FISCO.AsString := 'N';
  if (DMNFeConfig.cdsConfig_NFeDANFE_IMP_COLUNA_TRIB_SEM_INF.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_IMP_COLUNA_TRIB_SEM_INF.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_IMP_COLUNA_TRIB_SEM_INF.AsString := 'N';
  if (DMNFeConfig.cdsConfig_NFeDANFE_NAO_GERAR_ZEROS_ICMS.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_NAO_GERAR_ZEROS_ICMS.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_NAO_GERAR_ZEROS_ICMS.AsString := 'N';
  if (DMNFeConfig.cdsConfig_NFeDANFE_NAO_GERAR_ZEROS_IPI.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_NAO_GERAR_ZEROS_IPI.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_NAO_GERAR_ZEROS_IPI.AsString := 'N';
  if (DMNFeConfig.cdsConfig_NFeDANFE_NAO_GERAR_DADOS_ENTREGA.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_NAO_GERAR_DADOS_ENTREGA.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_NAO_GERAR_DADOS_ENTREGA.AsString := 'N';
  if (DMNFeConfig.cdsConfig_NFeDANFE_NAO_GERAR_DADOS_RETIRADA.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_NAO_GERAR_DADOS_RETIRADA.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_NAO_GERAR_DADOS_RETIRADA.AsString := 'N';
  if (DMNFeConfig.cdsConfig_NFeDANFE_MOSTRAR_FCI.IsNull) or (trim(DMNFeConfig.cdsConfig_NFeDANFE_MOSTRAR_FCI.AsString) = '') then
    DMNFeConfig.cdsConfig_NFeDANFE_MOSTRAR_FCI.AsString := 'S';
end;

procedure TfFilial.btnAlterar_Config_NFeClick(Sender: TObject);
begin
  if not DMNFeConfig.cdsConfig_NFe.Active then
    exit;
  if DMNFeConfig.cdsConfig_NFe.IsEmpty then
  begin
    MessageDlg('*** NFeConfig não esta configurado com o certificado do cnpj ' + DM1.tFilialCNPJ.AsString , mtInformation, [mbOk], 0);
    exit;
  end;

  DMNFeConfig.cdsConfig_NFe.Edit;
  prc_Configurar_Danfe_Aut;
  pnlConfig_Danfe_NFe.Enabled     := not(pnlConfig_Danfe_NFe.Enabled);
  btnConfirmar_Config_NFe.Enabled := not(btnConfirmar_Config_NFe.Enabled);
  btnCancelar_Config_NFe.Enabled  := not(btnCancelar_Config_NFe.Enabled);
  btnAlterar_Config_NFe.Enabled   := not(btnAlterar_Config_NFe.Enabled);
end;

procedure TfFilial.btnConfirmar_Config_NFeClick(Sender: TObject);
begin
  if MessageDlg('Deseja confirmar as alterações da configuração da impressão do Danfe?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  if not (DMNFeConfig.cdsConfig_NFe.State in [dsEdit]) then
    DMNFeConfig.cdsConfig_NFe.Edit;

  DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Clear;

  if DMNFeConfig.cdsConfig_NFeDANFE_SEM_COLUNA_DESCONTO.AsString = 'S' then
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[SEM COLUNA DESCONTO]';

  if trim(DMNFeConfig.cdsConfig_NFeDANFE_RODAPE.AsString) <> '' then
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[RODAPE=' + QuotedStr(DMNFeConfig.cdsConfig_NFeDANFE_RODAPE.AsString) + ']';

  if DMNFeConfig.cdsConfig_NFeDANFE_COM_FATURA.AsString = 'S' then
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[COM FATURA]';

  if DMNFeConfig.cdsConfig_NFeDANFE_QTRIBDEC.AsInteger > 0 then
  begin
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[qComDEC='+ IntToStr(DMNFeConfig.cdsConfig_NFeDANFE_QTRIBDEC.AsInteger) +']';
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[qTribDEC='+ IntToStr(DMNFeConfig.cdsConfig_NFeDANFE_QTRIBDEC.AsInteger) +']';
  end;

  //25/11/2014
  if DMNFeConfig.cdsConfig_NFeDANFE_ALTQUADRORECIBO.AsInteger > 0 then
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[AltQuadroRECIBO='+IntToStr(DMNFeConfig.cdsConfig_NFeDANFE_ALTQUADRORECIBO.AsInteger)+']';

  if DMNFeConfig.cdsConfig_NFeDANFE_SEM_DADOS_EMITENTE.AsString = 'S' then
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[SEM DADOS EMITENTE]';

  if DMNFeConfig.cdsConfig_NFeDANFE_SEM_QUADRO_EMITENTE.AsString = 'S' then
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[SEM QUADRO EMITENTE]';

  if (DMNFeConfig.cdsConfig_NFeDANFE_SALTAR_LINHA.AsString = 'S') and (trim(DMNFeConfig.cdsConfig_NFeDANFE_CARACTER_SALTAR_LINHA.AsString) <> '') then
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[SALTALINHA='+DMNFeConfig.cdsConfig_NFeDANFE_CARACTER_SALTAR_LINHA.AsString + ']';

  if DMNFeConfig.cdsConfig_NFeDANFE_MOSTRAR_ST.AsString = 'S' then
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[MOSTRARICMSST]';

  if DMNFeConfig.cdsConfig_NFeDANFE_OMITIR_RESER_AO_FISCO.AsString = 'S' then
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[FSSEMESTAMPAFISCAL]';

  if DMNFeConfig.cdsConfig_NFeDANFE_IMP_COLUNA_TRIB_SEM_INF.AsString = 'S' then
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[COLUNAVALORTRIBUTO]';

  if DMNFeConfig.cdsConfig_NFeDANFE_NAO_GERAR_ZEROS_ICMS.AsString = 'S' then
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[NAOGERARZEROSICMS]';

  if DMNFeConfig.cdsConfig_NFeDANFE_NAO_GERAR_ZEROS_IPI.AsString = 'S' then
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[NAOGERARZEROSIPI]';

  if DMNFeConfig.cdsConfig_NFeDANFE_NAO_GERAR_DADOS_ENTREGA.AsString = 'S' then
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[NAOGERARENDERECOENTREGA]';

  if DMNFeConfig.cdsConfig_NFeDANFE_NAO_GERAR_DADOS_RETIRADA.AsString = 'S' then
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[NAOGERARENDERECORETIRADA]';

  if DMNFeConfig.cdsConfig_NFeDANFE_MOSTRAR_FCI.AsString = 'S' then
    DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value := DMNFeConfig.cdsConfig_NFeDANFE_CONF_PDF.Value + '[MOSTRARFCI]';

  DMNFeConfig.cdsConfig_NFe.Post;
  DMNFeConfig.cdsConfig_NFe.ApplyUpdates(0);
  
  pnlConfig_Danfe_NFe.Enabled     := not(pnlConfig_Danfe_NFe.Enabled);
  btnConfirmar_Config_NFe.Enabled := not(btnConfirmar_Config_NFe.Enabled);
  btnCancelar_Config_NFe.Enabled  := not(btnCancelar_Config_NFe.Enabled);
  btnAlterar_Config_NFe.Enabled   := not(btnAlterar_Config_NFe.Enabled);
end;

procedure TfFilial.btnCancelar_Config_NFeClick(Sender: TObject);
begin
  if not(DMNFeConfig.cdsConfig_NFe.State in [dsEdit]) then
    exit;
  if MessageDlg('Deseja cancelar alteração da configuração da impressão do Danfe?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  DMNFeConfig.cdsConfig_NFe.Cancel;
  pnlConfig_Danfe_NFe.Enabled     := False;
  btnConfirmar_Config_NFe.Enabled := False;
  btnAlterar_Config_NFe.Enabled   := True;
  btnCancelar_Config_NFe.Enabled  := False;
end;

procedure TfFilial.RxDBLookupCombo10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F5 then
  begin
    vID_EnqIPI_Pos := 0;
    fSel_EnqIPI := TfSel_EnqIPI.Create(Self);
    fSel_EnqIPI.ShowModal;
    if vID_EnqIPI_Pos > 0 then
      RxDBLookupCombo10.KeyValue := vID_EnqIPI_Pos;
  end;
end;

end.
