unit UVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Buttons, ExtCtrls, DBTables, DB, RXLookup,
  Grids, DBGrids, RXDBCtrl;

type
  TfVendedor = class(TForm)
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
    Label2: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    Bevel1: TBevel;
    Label15: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    Label16: TLabel;
    DBEdit13: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label17: TLabel;
    DBEdit14: TDBEdit;
    Label18: TLabel;
    DBEdit15: TDBEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    DBCheckBox1: TDBCheckBox;
    qVerifica: TQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RxDBLookupCombo2DropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    vExcluir : Boolean;
    procedure Habilita;
    procedure Verifica_Exclusao;
    procedure Excluir_Registro;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fVendedor: TfVendedor;

implementation

uses UDM1, URegioes, uIntegracao;

{$R *.DFM}

procedure TfVendedor.Verifica_Exclusao;
begin
  qVerifica.Close;
  qVerifica.SQL.Clear;
  qVerifica.SQL.Add('SELECT DISTINCT CodVendedor');
  qVerifica.SQL.Add('FROM "dbExtComissao.DB" Dbextcomissao');
  qVerifica.SQL.Add('WHERE CodVendedor = :CodVendedor');
  qVerifica.ParamByName('CodVendedor').AsInteger := DM1.tVendedorCodigo.AsInteger;
  qVerifica.Open;

  vExcluir := True;
  if (qVerifica.RecordCount > 0) and
     (qVerifica.ParamByName('CodVendedor').AsInteger = DM1.tVendedorCodigo.AsInteger) then
    vExcluir := False;

  if vExcluir then
    begin
      qVerifica.Close;
      qVerifica.SQL.Clear;
      qVerifica.SQL.Add('SELECT DISTINCT CodVendedor');
      qVerifica.SQL.Add('FROM "dbCReceberParc.DB" dbCReceberParc');
      qVerifica.SQL.Add('WHERE CodVendedor = :CodVendedor');
      qVerifica.ParamByName('CodVendedor').AsInteger := DM1.tVendedorCodigo.AsInteger;
      qVerifica.Open;
      if (qVerifica.RecordCount > 0) and
         (qVerifica.ParamByName('CodVendedor').AsInteger = DM1.tVendedorCodigo.AsInteger) then
        vExcluir := False;
    end;

  if not vExcluir then
    ShowMessage('Vendedor já lançado nas comissões ou no contas a receber!');
end;

procedure TfVendedor.Habilita;
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

procedure TfVendedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tVendedor.Close;
      DM1.tRegioes.Close;
    end;
  Action := Cafree;
end;

procedure TfVendedor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tVendedor.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o vendedor antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfVendedor.DBNavigator1BeforeAction(Sender: TObject;  Button: TNavigateBtn);
begin
  DM1.tVendedor.IndexFieldNames := 'Codigo';
end;

procedure TfVendedor.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsVendedor.AsBoolean then
    begin
      DM1.tVendedor2.IndexFieldNames := 'Codigo';
      DM1.tVendedor.IndexFieldNames := 'Codigo';
      DM1.tVendedor2.Refresh;
      DM1.tVendedor2.Last;
      DM1.tVendedor.Refresh;
      DM1.tVendedor.Insert;
      DM1.tVendedorCodigo.AsInteger := DM1.tVendedor2Codigo.AsInteger + 1;
      DM1.tVendedorTipoComissao.Clear;
      DM1.tVendedor.Post;
      DM1.tVendedor.Edit;
      Habilita;
      DBRadioGroup1.ReadOnly := False;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfVendedor.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltVendedor.AsBoolean then
    begin
      DM1.tVendedor.Edit;
      DBRadioGroup1.ReadOnly := True;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a faazer alteração!');
end;

procedure TfVendedor.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    Excluir_Registro
  else
  if BitBtn2.Tag = 1 then
    DM1.tVendedor.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfVendedor.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcVendedor.AsBoolean then
    begin
      Verifica_Exclusao;
      if (vExcluir) and
         (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk) then
        Excluir_Registro;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfVendedor.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfVendedor.BitBtn5Click(Sender: TObject);
begin
  if (DM1.tVendedorTipoComissao.AsString <> 'N') and
     (DM1.tVendedorTipoComissao.AsString <> 'D') then
    ShowMessage('Falta informar o tipo de comissão!'+#13+'Depois de Gerado nota para o vendedor, não pode mais alterar o tipo!')
  else
  begin
    DM1.tVendedor.Post;
    Prc_Gravar_Vendedor_FB(DM1.tVendedorCodigo.AsInteger);

    BitBtn2.Tag := 0;
    Habilita;
    BitBtn1.SetFocus;
  end;
end;

procedure TfVendedor.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tRegioes.IndexFieldNames := 'Nome';
end;

procedure TfVendedor.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tRegioes.IndexFieldNames := 'Codigo';
end;

procedure TfVendedor.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioRegioesVendas.AsBoolean then
    begin
      fRegioes := TfRegioes.Create(Self);
      fRegioes.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfVendedor.RxDBLookupCombo2DropDown(Sender: TObject);
begin
  DM1.tVendedor.Refresh;
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfVendedor.FormShow(Sender: TObject);
begin
  DM1.tVendedor2.Open;
  DM1.tVendedor.Open;
  DM1.tRegioes.Open;
end;

procedure TfVendedor.Excluir_Registro;
var
  vCodAux : Integer;
begin
  vCodAux := DM1.tVendedorCodigo.AsInteger;
  DM1.tVendedor.Delete;
  Prc_Excluir_Vendedor_FB(vCodAux);
end;

end.
