unit UPercSimples;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, ExtCtrls, Mask, Db, DBTables, RxLookup,
  Grids, DBGrids, RXDBCtrl, RxDBComb, SMDBGrid, Variants;

type
  TfPercSimples = class(TForm)
    qPercSimples: TQuery;
    dsqPercSimples: TDataSource;
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Panel5: TPanel;
    BitBtn5: TBitBtn;
    Label4: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBComboBox1: TRxDBComboBox;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    qPercSimplesFilial: TIntegerField;
    qPercSimplesAno: TIntegerField;
    qPercSimplesMes: TIntegerField;
    qPercSimplesPercentual: TFloatField;
    qPercSimplesclMes: TStringField;
    SMDBGrid1: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qPercSimplesAfterScroll(DataSet: TDataSet);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure qPercSimplesCalcFields(DataSet: TDataSet);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPercSimples: TfPercSimples;

implementation

uses UDM1, DateUtils;

{$R *.DFM}

procedure TfPercSimples.Habilita;
begin
  Panel4.Enabled := not (Panel4.Enabled);
  BitBtn1.Enabled := not (BitBtn1.Enabled);
  BitBtn2.Enabled := not (BitBtn2.Enabled);
  BitBtn3.Enabled := not (BitBtn3.Enabled);
  BitBtn4.Enabled := not (BitBtn4.Enabled);
  BitBtn5.Enabled := not (BitBtn5.Enabled);
  BitBtn6.Enabled := not (BitBtn6.Enabled);
  DBNavigator1.Enabled := not (DBNavigator1.Enabled);
  SMDBGrid1.Enabled    := not(SMDBGrid1.Enabled);
end;

procedure TfPercSimples.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tPercSimples.Close;
  qPercSimples.Close;
  Action := Cafree;
end;

procedure TfPercSimples.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsPercSimples.AsBoolean then
    begin
      RxDBLookupCombo2.Enabled  := True;
      DBEdit1.Enabled           := True;
      RxDBComboBox1.Enabled     := True;
      BitBtn2.Tag := 0;
      Habilita;
      DM1.tPercSimples.Insert;
      DM1.tPercSimplesAno.AsInteger := YearOf(Date);
      RxDBLookupCombo2.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfPercSimples.BitBtn5Click(Sender: TObject);
begin
  DM1.tPercSimples.Post;
  qPercSimples.Close;
  qPercSimples.Open;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfPercSimples.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltPercSimples.AsBoolean then
    begin
      RxDBLookupCombo2.Enabled  := False;
      DBEdit1.Enabled           := False;
      RxDBComboBox1.Enabled     := False;

      BitBtn2.Tag := 1;
      DM1.tPercSimples.Edit;
      Habilita;
      DBEdit2.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfPercSimples.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tPercSimples.Delete
  else if BitBtn2.Tag = 1 then
    DM1.tPercSimples.Cancel;
  Habilita;
  BitBtn1.SetFocus;
  BitBtn2.Tag := 0;
end;

procedure TfPercSimples.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfPercSimples.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcPercSimples.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation, [mbOk, mbNo], 0) = mrOk then
        DM1.tPercSimples.Delete;
      qPercSimples.Close;
      qPercSimples.Open;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfPercSimples.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := UpCase(Key);
end;

procedure TfPercSimples.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tPercSimples.State in [dsEdit, dsInsert] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o registro antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfPercSimples.qPercSimplesAfterScroll(DataSet: TDataSet);
begin
  DM1.tPercSimples.Locate('Filial;Ano;Mes', VarArrayOf([qPercSimplesFilial.AsInteger,qPercSimplesAno.AsInteger,qPercSimplesMes.AsInteger]), [locaseinsensitive]);
end;

procedure TfPercSimples.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  qPercSimples.Locate('Filial;Ano;Mes', VarArrayOf([DM1.tPercSimplesFilial.AsInteger,DM1.tPercSimplesAno.AsInteger,DM1.tPercSimplesMes.AsInteger]), [locaseinsensitive]);
end;

procedure TfPercSimples.FormShow(Sender: TObject);
begin
  DM1.tFilial.Edit;
  DM1.tPercSimples.Open;
  qPercSimples.Open;
end;

procedure TfPercSimples.qPercSimplesCalcFields(DataSet: TDataSet);
begin
  case qPercSimplesMes.AsInteger of
    1  : qPercSimplesclMes.AsString := 'Janeiro';
    2  : qPercSimplesclMes.AsString := 'Fevereiro';
    3  : qPercSimplesclMes.AsString := 'Março';
    4  : qPercSimplesclMes.AsString := 'Abril';
    5  : qPercSimplesclMes.AsString := 'Maio';
    6  : qPercSimplesclMes.AsString := 'Junho';
    7  : qPercSimplesclMes.AsString := 'Julho';
    8  : qPercSimplesclMes.AsString := 'Agosto';
    9  : qPercSimplesclMes.AsString := 'Setembro';
    10 : qPercSimplesclMes.AsString := 'Outubro';
    11 : qPercSimplesclMes.AsString := 'Novembro';
    12 : qPercSimplesclMes.AsString := 'Dezembro';
  end;
end;

end.
