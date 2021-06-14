unit UPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Mask, Db, DBTables,
  RXLookup, Grids, DBGrids, RXDBCtrl, RXCtrls, DBFilter;

type
  TfPlanoContas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel4: TPanel;
    BitBtn6: TBitBtn;
    Panel5: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBText1: TDBText;
    Label7: TLabel;
    tPlanoContasIns: TTable;
    tPlanoContasInsCodigo: TIntegerField;
    tPlanoContasInsDescricao: TStringField;
    RxDBGrid1: TRxDBGrid;
    Bevel1: TBevel;
    StaticText1: TStaticText;
    Edit1: TEdit;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn16: TBitBtn;
    RxSpeedButton2: TRxSpeedButton;
    DBCheckBox1: TDBCheckBox;
    RxSpeedButton3: TRxSpeedButton;
    RxDBFilter4: TRxDBFilter;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure Habilita(Estado : Boolean);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure RxSpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    vCodItem : Integer;
  public
    { Public declarations }
  end;

var
  fPlanoContas: TfPlanoContas;

implementation

uses UDM1, UConsPlanoContasCad;

{$R *.DFM}

procedure TfPlanoContas.Habilita(Estado : Boolean);
begin
  Panel3.Enabled  := Estado;
  BitBtn1.Enabled := not Estado;
  BitBtn2.Enabled := not Estado;
  BitBtn3.Enabled := not Estado;
  BitBtn4.Enabled := not Estado;
  BitBtn5.Enabled := Estado;
  BitBtn6.Enabled := Estado;
  Panel5.Enabled  := not Estado;
end;

procedure TfPlanoContas.BitBtn4Click(Sender: TObject);
begin
  DM1.tPlanoContas.Cancel;
  Close;
end;

procedure TfPlanoContas.BitBtn5Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    begin
      DM1.tPlanoContasItens.First;
      while not DM1.tPlanoContasItens.Eof do
        DM1.tPlanoContasItens.Delete;
      DM1.tPlanoContas.Delete;
    end
  else
  if BitBtn2.Tag = 1 then
    DM1.tPlanoContas.Cancel;
  BitBtn2.Tag := 0;
  Habilita(False);
  BitBtn1.SetFocus;
end;

procedure TfPlanoContas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RxDBFilter4.Active := False;
  if Screen.FormCount < 3 then
  begin
    DM1.tPlanoContas.Close;
    DM1.tPlanoContasItens.Close;
  end;
  Action := Cafree;
end;

procedure TfPlanoContas.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsPlanoCtas.AsBoolean then
    begin
      vCodItem := 0;
      DM1.tPlanoContas.IndexFieldNames := 'Codigo';
      DM1.tPlanoContas.Last;
      tPlanoContasIns.Refresh;
      tPlanoContasIns.Last;
      DM1.tPlanoContas.Refresh;
      tPlanoContasIns.Refresh;
      DM1.tPlanoContas.Insert;
      DM1.tPlanoContasCodigo.AsInteger := tPlanoContasInsCodigo.AsInteger + 1;
      DM1.tPlanoContas.Post;
      DM1.tPlanoContas.Edit;
      Habilita(True);
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfPlanoContas.BitBtn6Click(Sender: TObject);
begin
  DM1.tPlanoContas.Post;
  DM1.tPlanoContasItens.Refresh;
  DM1.tPlanoContas.Refresh;
  BitBtn2.Tag := 0;
  Habilita(False);
  BitBtn1.SetFocus;
end;

procedure TfPlanoContas.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcPlanoCtas.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir esta conta?',mtconfirmation,[mbok,mbno],0)=mrok then
        begin
          DM1.tPlanoContasItens.First;
          while not DM1.tPlanoContasItens.Eof do
            DM1.tPlanoContasItens.Delete;
          DM1.tPlanoContas.Delete;
        end;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfPlanoContas.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltPlanoCtas.AsBoolean then
    begin
      vCodItem := 0;
      DM1.tPlanoContas.IndexFieldNames := 'Codigo';
      DM1.tPlanoContas.Edit;
      BitBtn2.Tag := 1;
      Habilita(True);
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfPlanoContas.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  Habilita(False);
end;

procedure TfPlanoContas.FormShow(Sender: TObject);
begin
  DM1.tPlanoContas.Open;
  DM1.tPlanoContasItens.Open;
  DM1.tPlanoContas.Last;
  Habilita(False);
  vCodItem := 0;
end;

procedure TfPlanoContas.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfPlanoContas.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Codigo';
end;

procedure TfPlanoContas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tPlanoContas.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar esta operação!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfPlanoContas.BitBtn7Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    ShowMessage('Falta informa a descrição do item da conta!')
  else
    begin
      if vCodItem > 0 then
        begin
          DM1.tPlanoContasItens.SetKey;
          DM1.tPlanoContasItensCodPlano.AsInteger := DM1.tPlanoContasCodigo.AsInteger;
          DM1.tPlanoContasItensCodItem.AsInteger  := vCodItem;
          if DM1.tPlanoContasItens.GotoKey then
            begin
              DM1.tPlanoContasItens.Edit;
              DM1.tPlanoContasItensNome.AsString := Edit1.Text;
              DM1.tPlanoContasItens.Post;
            end;
        end
      else
        begin
          DM1.tPlanoContasItens.Last;
          vCodItem := DM1.tPlanoContasItensCodItem.AsInteger + 1;
          DM1.tPlanoContasItens.Insert;
          DM1.tPlanoContasItensCodPlano.AsInteger := DM1.tPlanoContasCodigo.AsInteger;
          DM1.tPlanoContasItensCodItem.AsInteger  := vCodItem;
          DM1.tPlanoContasItensNome.AsString      := Edit1.Text;
          DM1.tPlanoContasItens.Post;
        end;
      vCodItem := 0;
      Edit1.Clear;
    end;
  Edit1.SetFocus;
end;

procedure TfPlanoContas.BitBtn16Click(Sender: TObject);
begin
  if DM1.tPlanoContasItensCodItem.AsInteger > 0 then
    begin
      vCodItem   := DM1.tPlanoContasItensCodItem.AsInteger;
      Edit1.Text := DM1.tPlanoContasItensNome.AsString;
      Edit1.SetFocus;
    end;
end;

procedure TfPlanoContas.BitBtn8Click(Sender: TObject);
begin
  Edit1.Clear;
end;

procedure TfPlanoContas.BitBtn9Click(Sender: TObject);
begin
  if DM1.tPlanoContasItens.RecordCount > 0 then
    begin
      if MessageDlg('Deseja realmente excluir este item?',mtconfirmation,[mbok,mbno],0)=mrok then
        DM1.tPlanoContasItens.Delete;
    end;
end;

procedure TfPlanoContas.RxSpeedButton2Click(Sender: TObject);
begin
  fConsPlanoContasCad := TfConsPlanoContasCad.Create(Self);
  fConsPlanoContasCad.ShowModal;
end;

procedure TfPlanoContas.RxSpeedButton3Click(Sender: TObject);
begin
  if RxDBFilter4.Active then
    RxSpeedButton3.Caption := 'Ocultar Inativos'
  else
    RxSpeedButton3.Caption := 'Mostrar Todos';
  RxDBFilter4.Active := not(RxDBFilter4.Active);
end;

end.
