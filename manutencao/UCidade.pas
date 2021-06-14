unit UCidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Buttons, RxLookup, ExtCtrls, DB, DBTables, Variants;

type
  TfCidade = class(TForm)
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
    Label8: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    SpeedButton1: TSpeedButton;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    tCidade2: TTable;
    tCidade2Codigo: TIntegerField;
    tCidade2Nome: TStringField;
    tCidade2Estado: TStringField;
    tCidade2Prefixo: TStringField;
    tCidade2Cep: TStringField;
    qFornecedor: TQuery;
    qFornecedorCodCidade: TIntegerField;
    qCliente: TQuery;
    qClienteCodCidade: TIntegerField;
    qClienteCodCidadeE: TIntegerField;
    qClienteCodCidadeP: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
  public
    { Public declarations }
  end;

var
  fCidade: TfCidade;
  vExcluir: boolean;

implementation

uses UDM1, UDM2, UUf;

{$R *.DFM}

procedure TfCidade.Habilita;
begin
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
  Panel2.Enabled       := not(Panel2.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
end;

procedure TfCidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfCidade.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCidade.IndexFieldNames := 'Nome';
end;

procedure TfCidade.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  if DM1.tUsuarioInsCidade.AsBoolean then
    begin
      DM1.tCidade.IndexFieldNames := 'Codigo';
      DM1.tCidade.Refresh;
      DM1.tCidade.Last;
      vCodAux := DM1.tCidadeCodigo.AsInteger;

      DM1.tCidade.Insert;
      DM1.tCidadeCodigo.AsInteger := vCodAux + 1;
      DM1.tCidade.Post;
      DM1.tCidade.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('O usuário '+DM1.tUsuarioUsuario.AsString+' não está autorizado a fazer inserção!');
end;

procedure TfCidade.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltCidade.AsBoolean then
    begin
      DM1.tCidade.Edit;
      Habilita;
      BitBtn2.Tag := 1;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('O usuário '+DM1.tUsuarioUsuario.AsString+' não está autorizado a fazer alteração!');
end;

procedure TfCidade.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcCidade.AsBoolean then
    begin
      vExcluir := True;
      qFornecedor.Close;
      qFornecedor.Params[0].AsInteger := DM1.tCidadeCodigo.AsInteger;
      qFornecedor.Open;
      if qFornecedor.RecordCount > 0 then
        vExcluir := False
      else
        begin
          qCliente.Close;
          qCliente.Params[0].AsInteger := DM1.tCidadeCodigo.AsInteger;
          qCliente.Params[1].AsInteger := DM1.tCidadeCodigo.AsInteger;
          qCliente.Params[2].AsInteger := DM1.tCidadeCodigo.AsInteger;
          qCliente.Open;
          if qCliente.RecordCount > 0 then
            vExcluir := False;
        end;
      if vExcluir then
        begin
          if not DM1.tCidade.IsEmpty then
            begin
              if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
                DM1.tCidade.Delete;
            end
          else
            ShowMessage('Não há registro p/ ser excluído!');
        end
      else
        ShowMessage('Esta cidade já está sendo usada no Fornecedor ou Cliente!');
    end
  else
    ShowMessage('O usuário '+DM1.tUsuarioUsuario.AsString+' não está autorizado a fazer exclusão!');
end;

procedure TfCidade.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tCidade.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tCidade.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfCidade.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfCidade.BitBtn5Click(Sender: TObject);
begin
  if (DBEdit1.Text <> '') and (RxDBLookupCombo6.Text <> '') then
    begin
      if tCidade2.Locate('Nome;Estado',VarArrayOf([DBEdit1.Text,RxDBLookupCombo6.Text]),[locaseinsensitive]) then
        begin
          if tCidade2Codigo.AsInteger <> DM1.tCidadeCodigo.AsInteger then
            begin
              ShowMessage('Já existe cadastro desta cidade p/ este Estado!');
              DBEdit1.SetFocus;
            end
          else
            begin
              DM1.tCidade.Post;
              Habilita;
              BitBtn2.Tag := 0;
              BitBtn1.SetFocus;
            end;
        end
      else
        begin
          DM1.tCidade.Post;
          Habilita;
          BitBtn2.Tag := 0;
          BitBtn1.SetFocus;
        end;
    end
  else
    begin
      ShowMessage('Você deve informar "Cidade" e "Estado" p/ confirmar o registro!');
      DBEdit1.SetFocus;
    end;
end;

procedure TfCidade.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioUf.AsBoolean then
    begin
      fUf := TfUf.Create(Self);
      fUf.ShowModal;
    end
  else
    ShowMessage('O usuário '+DM1.tUsuarioUsuario.AsString+' não está autorizado a abrir este formulário!');
end;

procedure TfCidade.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tCidade.State in [dsEdit,dsInsert] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar a Cidade antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfCidade.FormShow(Sender: TObject);
begin
  DM1.tCidade.Open;
  DM1.tUF.Open;
  DM1.tPais.Open;
end;

end.
