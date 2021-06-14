unit UCadastroSimples;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup,
  DBFilter, Grids, DBGrids, SMDBGrid, RxDBComb;

type
  TfCadastroSimples = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    RxDBFilter1: TRxDBFilter;
    Panel6: TPanel;
    SMDBGrid1: TSMDBGrid;
    Label4: TLabel;
    BitBtn7: TBitBtn;
    RxDBComboBox1: TRxDBComboBox;
    qConsulta: TQuery;
    dsqConsulta: TDataSource;
    qConsultaCodigo: TIntegerField;
    qConsultaNome: TStringField;
    qConsultaTipo: TStringField;
    qConsultaclDescTipo: TStringField;
    Panel2: TPanel;
    ComboBox1: TComboBox;
    qVerifica: TQuery;
    qVerificaCodigo: TIntegerField;
    qVerificaCodTipoProduto: TIntegerField;
    qVerificaCodTipoMaterial: TIntegerField;
    qVerificaNome: TStringField;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    qConsultaAbreviatura: TStringField;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure qConsultaCalcFields(DataSet: TDataSet);
    procedure Panel6Enter(Sender: TObject);
    procedure qConsultaAfterScroll(DataSet: TDataSet);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadastroSimples: TfCadastroSimples;
  vExcluir : Boolean;

implementation

uses UDM1, UDM2;

{$R *.DFM}

procedure TfCadastroSimples.Habilita;
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
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
end;

procedure TfCadastroSimples.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfCadastroSimples.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DM1.tCadastroSimples.State in [dsEdit,dsInsert] then
    DM1.tCadastroSimples.Cancel;
  RxDBFilter1.Active := False;
  qConsulta.Close;
  if Screen.FormCount < 3 then
    DM1.tCadastroSimples.Close;
  Action := Cafree;
end;

procedure TfCadastroSimples.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsCadastroSimples.AsBoolean then
    begin
      DM2.tCadastroSimples.IndexFieldNames := 'Codigo';
      DM1.tCadastroSimples.IndexFieldNames := 'Codigo';
      DM2.tCadastroSimples.Refresh;
      DM2.tCadastroSimples.Last;
      DM1.tCadastroSimples.Refresh;
      DM1.tCadastroSimples.Insert;
      DM1.tCadastroSimplesCodigo.AsInteger :=  DM2.tCadastroSimplesCodigo.AsInteger + 1;
      case ComboBox1.ItemIndex of
        0 : DM1.tCadastroSimplesTipo.AsString := 'PRO';
        1 : DM1.tCadastroSimplesTipo.AsString := 'MAT';
      end;
      DM1.tCadastroSimples.Post;
      DM1.tCadastroSimples.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfCadastroSimples.BitBtn5Click(Sender: TObject);
begin
  if DM1.tCadastroSimplesNome.AsString = '' then
    begin
      ShowMessage('Falta informar o nome!');
      exit;
    end;
  DM1.tCadastroSimples.Post;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfCadastroSimples.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tCadastroSimples.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tCadastroSimples.Cancel;
  Habilita;
end;

procedure TfCadastroSimples.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltCadastroSimples.AsBoolean then
    begin
      DM1.tCadastroSimples.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfCadastroSimples.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcCadastroSimples.AsBoolean then
    begin
      vExcluir := True;
      qVerifica.Close;
      qVerifica.ParamByName('Codigo').AsInteger := DM1.tCadastroSimplesCodigo.AsInteger;
      qVerifica.Open;
      if (qVerifica.RecordCount > 0) and (qVerificaCodigo.AsInteger > 0) then
        begin
          vExcluir := False;
          ShowMessage('Registro está sendo usado e não pode ser excluído!');
        end;
      if vExcluir then
        if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
          DM1.tCadastroSimples.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfCadastroSimples.DBEdit1Exit(Sender: TObject);
begin
  if DBEdit1.Text <> '' then
    begin
      if DM2.tCadastroSimples.Locate('Nome',DM1.tCadastroSimplesNome.AsString,[loCaseInsensitive]) then
        begin
          if DM2.tCadastroSimplesCodigo.AsInteger <> DM1.tCadastroSimplesCodigo.AsInteger then
            begin
              ShowMessage('Descrição já cadastrada!');
              DM1.tCadastroSimplesNome.Clear;
              DBEdit1.SetFocus;
            end;
        end;
    end;
end;

procedure TfCadastroSimples.FormShow(Sender: TObject);
begin
  DM1.tCadastroSimples.Open;
  RxDBFilter1.Active := True;
  BitBtn7Click(Sender);
end;

procedure TfCadastroSimples.ComboBox1Change(Sender: TObject);
begin
  if DM1.tCadastroSimples.State in [dsBrowse] then
    begin
      RxDBFilter1.Active := False;
      case ComboBox1.ItemIndex of
        0 : RxDBFilter1.Filter.Text := 'Tipo = ''PRO''';
        1 : RxDBFilter1.Filter.Text := 'Tipo = ''MAT''';
      end;
      RxDBFilter1.Active := True;
      BitBtn7Click(Sender);
    end;
end;

procedure TfCadastroSimples.BitBtn7Click(Sender: TObject);
begin
  qConsulta.Close;
  case ComboBox1.ItemIndex of
    0 : qConsulta.ParamByName('Tipo').AsString := 'PRO';
    1 : qConsulta.ParamByName('Tipo').AsString := 'MAT';
  end;
  qConsulta.Open;
end;

procedure TfCadastroSimples.qConsultaCalcFields(DataSet: TDataSet);
begin
  qConsultaclDescTipo.AsString := ComboBox1.Text; 
end;

procedure TfCadastroSimples.Panel6Enter(Sender: TObject);
begin
  BitBtn7Click(Sender);
end;

procedure TfCadastroSimples.qConsultaAfterScroll(DataSet: TDataSet);
begin
  if (DM1.tCadastroSimples.State in [dsBrowse]) and (qConsultaCodigo.AsInteger > 0) then
    DM1.tCadastroSimples.Locate('Codigo',qConsultaCodigo.AsInteger,[loCaseInsensitive]);
end;

end.
