unit UOutrosServicosNota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls, Buttons, DB, DBFilter,
  DBTables, Mask, ToolEdit, CurrEdit, RxLookup;

type
  TfOutrosServicosNota = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    tProdutoIns: TTable;
    SpeedButton4: TSpeedButton;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label17: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    tProdutoInsCodigo: TIntegerField;
    RxDBFilter2: TRxDBFilter;
    dsProdutoIns: TDataSource;
    RxDBFilter4: TRxDBFilter;
    BitBtn13: TBitBtn;
    Label23: TLabel;
    DBEdit3: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    RxDBLookupCombo8: TRxDBLookupCombo;
    SpeedButton3: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit3Enter(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    procedure Habilita;
    procedure Excluir_Registro;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOutrosServicosNota: TfOutrosServicosNota;

implementation

uses UDM1, uIntegracao, UClasFiscal, rsDataSetError, rsDBUtils;

{$R *.DFM}

procedure TfOutrosServicosNota.Excluir_Registro;
var
  vCodAux : Integer;
begin
  vCodAux := DM1.tProdutoCodigo.AsInteger;
  DM1.tProduto.Delete;

  //if DM1.tParametrosUsaFB.AsBoolean then
  //  Prc_Excluir_Produto_FB(vCodAux);
  DM1.tProduto.Refresh;
end;

procedure TfOutrosServicosNota.Habilita;
begin
  Panel2.Enabled       := not (Panel2.Enabled);
  Panel4.Enabled       := not (Panel4.Enabled);
  BitBtn1.Enabled      := not (BitBtn1.Enabled);
  BitBtn2.Enabled      := not (BitBtn2.Enabled);
  BitBtn3.Enabled      := not (BitBtn3.Enabled);
  BitBtn4.Enabled      := not (BitBtn4.Enabled);
  BitBtn5.Enabled      := not (BitBtn5.Enabled);
  BitBtn6.Enabled      := not (BitBtn6.Enabled);
  DBNavigator1.Enabled := not (DBNavigator1.Enabled);
end;

procedure TfOutrosServicosNota.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  oDBUtils.OpenTables(False,Self);
  RxDBFilter2.Active := False;
  Action := Cafree;
end;

procedure TfOutrosServicosNota.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfOutrosServicosNota.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioProduto.AsBoolean then
  begin
    BitBtn2.Tag := 0;
    tProdutoIns.IndexFieldNames := 'Codigo';
    tProdutoIns.Refresh;
    tProdutoIns.Last;
    DM1.tProduto.Insert;
    DM1.tProdutoCodigo.AsInteger    := tProdutoInsCodigo.AsInteger + 1;
    dm1.tProdutoProdMat.AsString    := 'N';
    dm1.tProdutoOrigemProd.AsString := '0';
    DM1.tProduto.Post;
    DM1.tProduto.Edit;
    Habilita;
    DBEdit1.SetFocus;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfOutrosServicosNota.BitBtn2Click(Sender: TObject);
begin
  DM1.tProduto.Edit;
  Habilita;
  BitBtn2.Tag := 1;
  DBEdit1.SetFocus;
end;

procedure TfOutrosServicosNota.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    Excluir_Registro
  else
  if BitBtn2.Tag = 1 then
    DM1.tProduto.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfOutrosServicosNota.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation, [mbOk, mbNo], 0) = mrOk then
    Excluir_Registro;
end;

procedure TfOutrosServicosNota.BitBtn5Click(Sender: TObject);
begin
  if DM1.tProduto.State in [dsEdit, dsInsert] then
  begin
    if Dm1.tProdutoUnidade.AsString = '' then
      ShowMessage('Falta informar a unidade!')
    else
    begin
      DM1.tProduto.Post;
      //if DM1.tParametrosUsaFB.AsBoolean then
      //  Prc_Gravar_Produto_FB(DM1.tProdutoCodigo.AsInteger);

      DM1.tProduto.Refresh;
      BitBtn2.Tag := 0;
      Habilita;
      BitBtn1.SetFocus;
    end;
  end;
end;

procedure TfOutrosServicosNota.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tProduto.State in [dsEdit, dsInsert] then
  begin
    ShowMessage('Você deve Cancelar ou Confirmar o material antes de fechar esta janela!');
    CanClose := False;
  end;
end;

procedure TfOutrosServicosNota.FormShow(Sender: TObject);
begin
  DM1.tProduto.Open;
  RxDBFilter2.Active := True;
end;

procedure TfOutrosServicosNota.CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    DM1.tProduto.IndexFieldNames := 'Codigo';
    DM1.tProduto.FindKey([CurrencyEdit3.AsInteger]);
  end;
end;

procedure TfOutrosServicosNota.CurrencyEdit3Enter(Sender: TObject);
begin
  RxDBLookupCombo3.ClearValue;
end;

procedure TfOutrosServicosNota.BitBtn13Click(Sender: TObject);
begin
  RxDBFilter4.Active := not (RxDBFilter4.Active);
end;

procedure TfOutrosServicosNota.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tProduto.IndexFieldNames := 'Codigo';
end;

procedure TfOutrosServicosNota.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tProduto.IndexFieldNames := 'Nome';
  CurrencyEdit3.Clear;
end;

procedure TfOutrosServicosNota.FormCreate(Sender: TObject);
begin
  oDBUtils.OpenTables(True,Self);
end;

procedure TfOutrosServicosNota.SpeedButton3Click(Sender: TObject);
begin
  if DM1.tUsuarioClasFiscal.AsBoolean then
  begin
    fClasFiscal := TfClasFiscal.Create(Self);
    fClasFiscal.ShowModal;
    DM1.tClasFiscal.Refresh;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de Clas.fiscal!');
end;

end.
