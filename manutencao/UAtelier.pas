unit UAtelier;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Buttons, RxLookup, ExtCtrls, DB, DBTables,
  ToolEdit, CurrEdit, Grids, DBGrids, RXDBCtrl;

type
  TfAtelier = class(TForm)
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
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn7: TBitBtn;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    tProduto: TTable;
    dsProduto: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
    procedure Limpa_Edit;
  public
    { Public declarations }
  end;

var
  fAtelier: TfAtelier;
  vAltera : Boolean;
  vItem   : Integer;

implementation

uses UDM1, UProduto;

{$R *.DFM}

procedure TfAtelier.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tAtelier.Close;
      DM1.tAtelierPreco.Close;
    end;
  Action := Cafree;
end;

procedure TfAtelier.Limpa_Edit;
begin
  RxDBLookupCombo2.ClearValue;
  CurrencyEdit1.Clear;
end;

procedure tfAtelier.Habilita;
begin
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  Panel2.Enabled       := not(Panel2.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
end;

procedure TfAtelier.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tAtelier.State in [dsEdit,dsInsert] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o Atelier antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfAtelier.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tAtelier.IndexFieldNames := 'Atelier';
end;

procedure TfAtelier.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tAtelier.IndexFieldNames := 'Codigo';
end;

procedure TfAtelier.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tAtelier.IndexFieldNames := 'Codigo';
end;

procedure TfAtelier.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfAtelier.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsAtelier.AsBoolean then
    begin
      DM1.tAtelier.Refresh;
      DM1.tAtelier2.Last;
      DM1.tAtelier.Insert;
      DM1.tAtelierCodigo.AsInteger := DM1.tAtelier2Codigo.AsInteger + 1;
      DM1.tAtelier.Post;
      DM1.tAtelier.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfAtelier.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltAtelier.AsBoolean then
    begin
      DM1.tAtelier.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfAtelier.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    begin
      DM1.tAtelier.Delete;
      Habilita;
      BitBtn1.SetFocus;
    end
  else
  if BitBtn2.Tag = 1 then
    begin
      DM1.tAtelier.Cancel;
      Habilita;
      BitBtn1.SetFocus;
    end;
  Limpa_Edit;  
  BitBtn2.Tag := 0;
end;

procedure TfAtelier.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcAtelier.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este Atelier?',mtconfirmation,[mbok,mbno],0)=mrok then
        begin
          if not DM1.tAtelierPreco.IsEmpty then
            begin
              DM1.tAtelierPreco.First;
              while not DM1.tAtelierPreco.Eof do
                DM1.tAtelierPreco.Delete;
            end;
          DM1.tAtelier.Delete;
        end;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfAtelier.BitBtn5Click(Sender: TObject);
begin
  DM1.tAtelier.Post;
  Habilita;
  BitBtn2.Tag := 0;
  Limpa_Edit;
  BitBtn1.SetFocus;
end;

procedure TfAtelier.RxDBLookupCombo2Enter(Sender: TObject);
begin
  tProduto.IndexFieldNames := 'Referencia';
end;

procedure TfAtelier.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioProduto.AsBoolean then
    begin
      fProduto := TfProduto.Create(Self);
      fProduto.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfAtelier.BitBtn7Click(Sender: TObject);
begin
  if (RxDBLookupCombo2.Text <> '') and (CurrencyEdit1.Value > 0) then
    begin
      DM1.tAtelierPreco2.Refresh;
      DM1.tAtelierPreco2.Last;
      DM1.tAtelierPreco.Insert;
      DM1.tAtelierPrecoCodAtelier.AsInteger := DM1.tAtelierCodigo.AsInteger;
      if vAltera = True then
        DM1.tAtelierPrecoItem.AsInteger := vItem
      else
        DM1.tAtelierPrecoItem.AsInteger     := DM1.tAtelierPreco2Item.AsInteger + 1;
      DM1.tAtelierPrecoCodProduto.AsInteger := RxDBLookupCombo2.KeyValue;
      DM1.tAtelierPrecoPreco.AsFloat        := CurrencyEdit1.Value;
      DM1.tAtelierPreco.Post;
      vAltera                               := False;
      Limpa_Edit;
      RxDBLookupCombo2.SetFocus;
    end
  else
    begin
      ShowMessage('Devem haver "Referência" e "Preço p/ par" maio que "0" p/ confirmar a inserção!');
      RxDBLookupCombo2.SetFocus;
    end;
end;

procedure TfAtelier.SpeedButton2Click(Sender: TObject);
begin
  Limpa_Edit;
  vAltera := False;
  RxDBLookupCombo2.SetFocus;
end;

procedure TfAtelier.SpeedButton4Click(Sender: TObject);
begin
  if not DM1.tAtelierPreco.IsEmpty then
    begin
      if RxDBLookupCombo2.Text = '' then
        begin
          vAltera                   := True;
          vItem                     := DM1.tAtelierPrecoItem.AsInteger;
          RxDBLookupCombo2.KeyValue := DM1.tAtelierPrecoCodProduto.AsInteger;
          CurrencyEdit1.Value       := DM1.tAtelierPrecoPreco.AsFloat;
          DM1.tAtelierPreco.Delete;
        end
      else
        ShowMessage('Há um item pendente, você deve confirmar ou cancelar antes de alterar outro item!');
    end
  else
    ShowMessage('Não há registro p/ ser alterado!');
end;

procedure TfAtelier.SpeedButton3Click(Sender: TObject);
begin
  if not DM1.tAtelierPreco.IsEmpty then
    begin
      if MessageDlg('Deseja realmente excluir este Preço e Referência?',mtconfirmation,[mbok,mbno],0)=mrok then
        DM1.tAtelierPreco.Delete;
    end
  else
    ShowMessage('Não há registro p/ ser excluído!');
end;

procedure TfAtelier.FormShow(Sender: TObject);
begin
  DM1.tAtelier.Open;
  DM1.tAtelierPreco.Open;
end;

end.
