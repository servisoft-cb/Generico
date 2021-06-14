unit UTransp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, VerificaCGC,
  RxLookup, ComCtrls, Grids, DBGrids, RXDBCtrl, RxDBComb, VerificaCPF;

type
  TfTransp = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    tTranspIns: TTable;
    tTranspInsCodigo: TIntegerField;
    tTranspInsNome: TStringField;
    tTranspInsEndereco: TStringField;
    tTranspInsBairro: TStringField;
    tTranspInsCidade: TStringField;
    tTranspInsCep: TStringField;
    tTranspInsUF: TStringField;
    tTranspInsFone: TStringField;
    tTranspInsFax: TStringField;
    tTranspInsCNPJ: TStringField;
    tTranspInsInscricao: TStringField;
    tTranspInsContato: TStringField;
    tTranspInsObs: TMemoField;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    VerificaCGC1: TVerificaCGC;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    SpeedButton2: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel6: TPanel;
    Label14: TLabel;
    DBMemo1: TDBMemo;
    Label17: TLabel;
    DBEdit4: TDBEdit;
    Label18: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    DBCheckBox1: TDBCheckBox;
    Label19: TLabel;
    DBEdit11: TDBEdit;
    Label20: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    Label21: TLabel;
    DBEdit12: TDBEdit;
    Label22: TLabel;
    DBEdit13: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    SpeedButton4: TSpeedButton;
    BitBtn5: TBitBtn;
    Label15: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    VerificaCPF1: TVerificaCPF;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Label57: TLabel;
    RxDBLookupCombo8: TRxDBLookupCombo;
    Label41: TLabel;
    RxDBLookupCombo13: TRxDBLookupCombo;
    SpeedButton7: TSpeedButton;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit8Exit(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure RxDBLookupCombo6Enter(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBComboBox1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTransp: TfTransp;

implementation

uses UDM1, UUf, UCidade, UDM2, UCopiaCli, UPais;

{$R *.DFM}

procedure TfTransp.Habilita;
begin
  Panel2.Enabled       := not(Panel2.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
  Panel6.Enabled       := not(Panel6.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  SpeedButton4.Enabled := not(SpeedButton4.Enabled);
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
end;

procedure TfTransp.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfTransp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tTransp.Close;
  DM2.qPais.Close;
  Action := Cafree;
end;

procedure TfTransp.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsTransp.AsBoolean then
    begin
      tTranspIns.IndexFieldNames  := 'Codigo';
      DM1.tTransp.IndexFieldNames := 'Codigo';
      tTranspIns.Refresh;
      tTranspIns.Last;
      DM1.tTransp.Refresh;
      DM1.tTransp.Insert;
      DM1.tTranspCodigo.AsInteger := tTranspInsCodigo.AsInteger + 1;
      dm1.tTranspIdPais.AsInteger := 1;
      DM1.tTransp.Post;
      DM1.tTransp.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfTransp.BitBtn5Click(Sender: TObject);
begin
  DM1.tTransp.Post;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfTransp.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tTransp.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tTransp.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfTransp.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltTransp.AsBoolean then
    begin
      DM1.tTransp.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfTransp.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcTransp.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        DM1.tTransp.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfTransp.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tTransp.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar a transportadora antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfTransp.DBEdit8Exit(Sender: TObject);
begin
  if (RxDBComboBox1.ItemIndex = 1) and (DBEdit8.Text <> '   .   .   -  ') then
  begin
    VerificaCPF1.Entrada := DBEdit8.Text;
    if not VerificaCPF1.Resultado then
    begin
      ShowMessage('Número de CPF inválido!');
      DBEdit8.SetFocus;
    end;
  end
  else
  if (RxDBComboBox1.ItemIndex = 0) and (DbEdit8.Text <> '  .   .   /    -  ') then
  begin
    VerificaCGC1.Entrada := DbEdit8.Text;
    if VerificaCGC1.Resultado = False then
    begin
      ShowMessage('CNPJ invalido!');
      DbEdit8.SetFocus;
    end;
  end;
end;

procedure TfTransp.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tTransp.Refresh;
  DM1.tTransp.IndexFieldNames := 'Nome';
end;

procedure TfTransp.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioUf.AsBoolean then
    begin
      fUf := TfUf.Create(Self);
      fUf.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfTransp.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioCidade.AsBoolean then
    begin
      fCidade := TfCidade.Create(Self);
      fCidade.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfTransp.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tCidade.IndexFieldNames := 'Nome';
end;

procedure TfTransp.RxDBLookupCombo3Exit(Sender: TObject);
begin
  if (RxDBLookupCombo2.Text = '') and (RxDBLookupCombo3.Text <> '') then
    begin
      DM1.tCidade.IndexFieldNames := 'Codigo';
      DM1.tCidade.SetKey;
      DM1.tCidadeCodigo.AsInteger := RxDBLookupCombo3.KeyValue;
      if DM1.tCidade.GotoKey then
        begin
          if DM1.tCidadeEstado.AsString <> '' then
            DM1.tTranspUF.AsString := DM1.tCidadeEstado.AsString;
          if (DBEdit5.Text = '') and (DM1.tCidadeCep.AsString <> '') then
            DM1.tTranspCep.AsString := DM1.tCidadeCep.AsString;
        end;
    end;
end;

procedure TfTransp.RxDBLookupCombo6Enter(Sender: TObject);
begin
  DM1.tTransp.IndexFieldNames := 'Fantasia';
end;

procedure TfTransp.SpeedButton4Click(Sender: TObject);
begin
  fCopiaCli := TfCopiaCli.Create(Self);
  fCopiaCli.ShowModal;
end;

procedure TfTransp.FormShow(Sender: TObject);
begin
  DM1.tTransp.Open;
  DM2.qPais.Open;
end;

procedure TfTransp.RxDBComboBox1Click(Sender: TObject);
begin
  if RxDBComboBox1.ItemIndex = 0 then
  begin
    DM1.tTranspPessoa.AsString := 'J';
    DM1.tTranspCNPJ.EditMask:='99.999.999/9999-99';
  end
  else
  begin
    DM1.tTranspPessoa.AsString := 'F';
    DM1.tTranspCNPJ.EditMask:='999.999.999-99';
  end;
end;

procedure TfTransp.SpeedButton7Click(Sender: TObject);
begin
  if DM1.tUsuarioUf.AsBoolean then
    begin
      fPais := TfPais.Create(Self);
      fPais.ShowModal;
      DM2.qPais.Close;
      DM2.qPais.Open;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

end.
