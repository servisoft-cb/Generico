unit UCor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons,
  db, DBTables, RxLookup;

type
  TfCor = class(TForm)
    tCorIns: TTable;
    tCorInsCodigo: TIntegerField;
    tCorInsNome: TStringField;
    qCor: TQuery;
    dsqCor: TDataSource;
    tProdutoCor2: TTable;
    tProdutoCor2CodProduto: TIntegerField;
    tProdutoCor2CodCor: TIntegerField;
    tProdutoCor2lkReferencia: TStringField;
    Panel2: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Panel4: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit1Exit(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo2Change(Sender: TObject);
  private
    procedure Habilita;
    procedure Verifica_Produto;
    procedure Excluir_Registro;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCor: TfCor;
  vExcluir : Boolean;

implementation

uses UDM1, UDM2, uIntegracao;

{$R *.DFM}

procedure TfCor.Habilita;
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

procedure TfCor.Verifica_Produto;
begin
  if tProdutoCor2.Locate('CodCor',DM1.tCorCodigo.AsInteger,[loCaseInsensitive])  then
    begin
      vExcluir := False;
      ShowMessage('Esta cor não pode ser excluída, esta na referência ' + tProdutoCor2lkReferencia.AsString)
    end;
end;

procedure TfCor.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfCor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tProdutoCor2.Close;
  if Screen.FormCount < 3 then
    DM1.tCor.Close;
  Action := Cafree;
end;

procedure TfCor.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsCor.AsBoolean then
    begin
      tCorIns.IndexFieldNames  := 'Codigo';
      DM1.tCor.IndexFieldNames := 'Codigo';
      tCorIns.Open;
      tcorIns.Last;
      if tCorInsCodigo.AsInteger = 99999 then
        tCorIns.Prior;
      DM1.tcor.Refresh;
      DM1.tcor.Insert;
      if tCorInsCodigo.AsInteger = 99999 then
        DM1.tcorCodigo.AsInteger :=  1
      else
        DM1.tcorCodigo.AsInteger :=  tcorInsCodigo.AsInteger + 1;
      DM1.tcor.Post;
      DM1.tcor.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfCor.BitBtn5Click(Sender: TObject);
begin
  if Trim(DM1.tCorNome.AsString) = '' then
  begin
    ShowMessage('Nome não informador!');
    exit;
  end;
  DM1.tcor.Post;
  Prc_Gravar_Cor_FB(DM1.tCorCodigo.AsInteger);
  DM1.tcor.Refresh;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfCor.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    Excluir_Registro
  else
  if BitBtn2.Tag = 1 then
    DM1.tcor.Cancel;
  Habilita;
end;

procedure TfCor.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltcor.AsBoolean then
    begin
      DM1.tcor.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfCor.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcCor.AsBoolean then
  begin
    if DM1.tCorCodigo.AsInteger = 99999 then
      ShowMessage('Esta cor é do sistema, não pode ser excluída!')
    else
    begin
      vExcluir := True;
      Verifica_Produto;
      if (vExcluir) and (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk) then
        Excluir_Registro;
    end;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfCor.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tcor.IndexFieldNames := 'Codigo';
end;

procedure TfCor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tcor.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar a cor antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfCor.DBEdit1Exit(Sender: TObject);
begin
  if DBEdit1.Text <> '' then
    begin
      if tCorIns.Locate('Nome',DM1.tCorNome.AsString,[loCaseInsensitive]) then
        begin
          if tCorInsCodigo.AsInteger <> DM1.tCorCodigo.AsInteger then
            begin
              ShowMessage('Cor já cadastrada!');
              DM1.tCorNome.Clear;
              DBEdit1.SetFocus;
            end;
        end;
    end;
end;

procedure TfCor.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tCor.Refresh;
  DM1.tCor.IndexFieldNames := 'Nome';
end;

procedure TfCor.FormShow(Sender: TObject);
begin
  DM1.tCor.Open;
  tProdutoCor2.Open;
  tProdutoCor2.Refresh;
  tCorIns.Open;
  tCorIns.Refresh;
end;

procedure TfCor.RxDBLookupCombo2Change(Sender: TObject);
begin
  if (RxDBLookupCombo2.Text <> '') and (DM1.tcor.State in [dsBrowse]) then
    DM1.tCor.Locate('Pantone',RxDBLookupCombo2.Text,[loCaseInsensitive]);
end;

procedure TfCor.Excluir_Registro;
var
  vCodAux : Integer;
begin
  vCodAux := DM1.tCorCodigo.AsInteger;
  DM1.tCor.Delete;
  Prc_Excluir_Cor_FB(vCodAux);
end;

end.
