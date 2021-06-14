unit UGrade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, DBTables,
  Grids, DBGrids, Db, DBVGrids, RxLookup, ComCtrls, Variants, ToolEdit,
  CurrEdit;

type
  TfGrade = class(TForm)
    tGradeIns: TTable;
    tGradeInsCodigo: TIntegerField;
    tGradeInsNome: TStringField;
    tGradeItemIns: TTable;
    tGradeItemInsCodGrade: TIntegerField;
    tGradeItemInsPosicao: TIntegerField;
    tGradeItemInsTamanho: TStringField;
    tGradeInsCodLetra: TStringField;
    tGradeInsLargura: TStringField;
    tGradeItemInsMarcarTam: TStringField;
    tGradeItemInsQtdPar: TIntegerField;
    tGradeItemInsQtdNav: TFloatField;
    tGradeItemInsLargura: TFloatField;
    tGradeItemInsAltura: TFloatField;
    tProdutoGrade: TTable;
    tProdutoGradeCodProduto: TIntegerField;
    tProdutoGradeCodGrade: TIntegerField;
    qPedido: TQuery;
    qPedidoCodGrade: TIntegerField;
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
    VDBGrid1: TVDBGrid;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn7: TBitBtn;
    BitBtn16: TBitBtn;
    SpeedButton3: TSpeedButton;
    SpeedButton9: TSpeedButton;
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
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure VDBGrid1ColEnter(Sender: TObject);
    procedure VDBGrid1CellClick(Column: TColumn);
    procedure VDBGrid1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  private
    { Private declarations }
    vIncTamanho : Boolean;
    vPosGrade : Integer;

    procedure Habilita;
    procedure Excluir_Registro;
  public
    { Public declarations }
  end;

var
  fGrade: TfGrade;

implementation

uses UDM1;

{$R *.DFM}

procedure TfGrade.Habilita;
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
  BitBtn16.Enabled     := vIncTamanho;
  SpeedButton9.Enabled := vIncTamanho;
end;

procedure TfGrade.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfGrade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tGrade.Open;
      DM1.tGradeItem.Open;
    end;
  Action := Cafree;
end;

procedure TfGrade.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsGrade.AsBoolean then
  begin
    vIncTamanho := True;
    tGradeIns.IndexFieldNames  := 'Codigo';
    DM1.tGrade.IndexFieldNames := 'Codigo';
    tGradeIns.Refresh;
    tGradeIns.Last;
    DM1.tGrade.Refresh;
    DM1.tGrade.Insert;
    DM1.tGradeCodigo.AsInteger := tGradeInsCodigo.AsInteger + 1;
    DM1.tGradeTipoDig.AsString := 'P';
    DM1.tGrade.Post;
    DM1.tGrade.Edit;
    Habilita;
    DBEdit1.SetFocus;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfGrade.BitBtn5Click(Sender: TObject);
var
 vGravar : String[1];
begin
  vGravar := 'S';
  if ((DM1.tGradeCodLetra.AsString <> '') or (DM1.tGradeCodLetra.AsString <> '')) and (BitBtn2.Tag = 0) then
    begin
      if tGradeIns.Locate('CodLetra;Largura',VarArrayOf([DM1.tGradeCodLetra.AsString,DM1.tGradeLargura.AsString]),[locaseinsensitive]) then
        begin
          vGravar := 'N';
          ShowMessage('Cod.Letra e largura ja cadastrada');
          DBEdit1.SetFocus;
        end;
    end;
  if vGravar = 'S' then
    begin
      DM1.tGradeQtdParTotal.AsInteger := 0;
      DM1.tGradeItem.First;
      while not DM1.tGradeItem.Eof do
        begin
          DM1.tGradeQtdParTotal.AsInteger := DM1.tGradeQtdParTotal.AsInteger + DM1.tGradeItemQtdPar.AsInteger;
          DM1.tGradeItem.Next;
        end;
      DM1.tGrade.Post;
      BitBtn2.Tag := 0;
      Habilita;
      BitBtn1.SetFocus;
    end;
end;

procedure TfGrade.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    Excluir_Registro
  else
  if BitBtn2.Tag = 1 then
    DM1.tGrade.Cancel;
  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfGrade.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltGrade.AsBoolean then
  begin
    vIncTamanho := True;
    if tProdutoGrade.Locate('CodGrade',DM1.tGradeCodigo.AsInteger,[loCaseInsensitive]) then
      vIncTamanho := False
    else
    begin
      qPedido.Close;
      qPedido.Params[0].AsInteger := DM1.tGradeCodigo.AsInteger;
      qPedido.Open;
      if qPedido.RecordCount > 0 then
        vIncTamanho := False;
      qPedido.Close;
    end;
    DM1.tGrade.Edit;
    BitBtn2.Tag := 1;
    Habilita;
    DBEdit1.SetFocus;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfGrade.BitBtn3Click(Sender: TObject);
var
  vAlterar : Boolean;
begin
  if DM1.tUsuarioExcGrade.AsBoolean then
  begin
    vAlterar := True;
    if tProdutoGrade.Locate('CodGrade',DM1.tGradeCodigo.AsInteger,[loCaseInsensitive]) then
      vAlterar := False
    else
    begin
      qPedido.Close;
      qPedido.Params[0].AsInteger := DM1.tGradeCodigo.AsInteger;
      qPedido.Open;
      if qPedido.RecordCount > 0 then
        vAlterar := False;
      qPedido.Close;
    end;
    if vAlterar then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        Excluir_Registro;
    end
    else
      ShowMessage('Grade não pode ser excluída pois esta sendo usada!');
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfGrade.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tGrade.IndexFieldNames := 'Codigo';
end;

procedure TfGrade.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tGrade.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar a grade antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfGrade.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tGrade.Refresh;
  DM1.tGrade.IndexFieldNames := 'Nome';
end;

procedure TfGrade.VDBGrid1ColEnter(Sender: TObject);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfGrade.VDBGrid1CellClick(Column: TColumn);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfGrade.VDBGrid1Enter(Sender: TObject);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfGrade.FormShow(Sender: TObject);
begin
  if not DM1.tGradeItemIns.Active then
    DM1.tGradeItemIns.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  tGradeIns.Open;
  tGradeItemIns.Open;
  tProdutoGrade.Open;
end;

procedure TfGrade.Excluir_Registro;
begin
  DM1.tGradeItem.First;
  while not DM1.tGradeItem.Eof do
    DM1.tGradeItem.Delete;
  DM1.tGrade.Delete;
end;

procedure TfGrade.BitBtn7Click(Sender: TObject);
var
  vPosAux : Integer;
begin
  if Trim(Edit1.Text) = '' then
  begin
    ShowMessage('Tamanho não informado!');
    Edit1.SetFocus;
    exit;
  end;
  if DM1.tGradeItem.Locate('Tamanho',Edit1.Text,[loCaseInsensitive]) then
  begin
    ShowMessage('Tamanho já cadastrado!');
    exit;
  end;
  vPosAux := 0;
  if vPosGrade > 0 then
    if DM1.tGradeItem.Locate('Posicao',vPosGrade,[loCaseInsensitive]) then
      vPosAux := vPosGrade;
  if vPosAux > 0 then
    DM1.tGradeItem.Edit
  else
  begin
    DM1.tGradeItem.Refresh;
    DM1.tGradeItem.Last;
    if vPosGrade > 0 then
      vPosAux := vPosGrade
    else
      vPosAux := DM1.tGradeItemPosicao.AsInteger + 1;
    DM1.tGradeItem.Insert;
    DM1.tGradeItemCodGrade.AsInteger := DM1.tGradeCodigo.AsInteger;
    DM1.tGradeItemPosicao.AsInteger  := vPosAux;
  end;
  DM1.tGradeItemTamanho.AsString   := Edit1.Text;
  DM1.tGradeItemMarcarTam.AsString := Edit2.Text;
  if CurrencyEdit1.AsInteger > 0 then
    DM1.tGradeItemQtdPar.AsInteger := CurrencyEdit1.AsInteger
  else
    DM1.tGradeItemQtdPar.Clear;
  DM1.tGradeItem.Post;
  SpeedButton3Click(Sender);
  Edit1.SetFocus;
end;

procedure TfGrade.SpeedButton3Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  CurrencyEdit1.Clear;
  vPosGrade := 0;
end;

procedure TfGrade.BitBtn16Click(Sender: TObject);
begin
  if DM1.tGradeItem.IsEmpty then
    exit;
  vPosGrade  := DM1.tGradeItemPosicao.AsInteger;
  Edit1.Text := DM1.tGradeItemTamanho.AsString;
  Edit2.Text := DM1.tGradeItemMarcarTam.AsString;
  Edit1.SetFocus;
end;

procedure TfGrade.SpeedButton9Click(Sender: TObject);
begin
  if DM1.tGradeItem.IsEmpty then
    exit;
  if MessageDlg('Deseja excluir o tamanho?', mtConfirmation,[mbOk,mbNo],0)=mrNo then
    exit;
  DM1.tGradeItem.Delete;
end;

end.
