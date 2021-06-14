unit UNatOperacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdConvs, RXLookup, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DB, DBTables,
  RxDBComb;

type
  TfNatOperacao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Panel4: TPanel;
    DBText1: TDBText;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    qVerifica: TQuery;
    qVerificaCodNatOper: TSmallintField;
    Label9: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    DBCheckBox10: TDBCheckBox;
    RxDBLookupCombo5: TRxDBLookupCombo;
    Label10: TLabel;
    Label12: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox2: TRxDBComboBox;
    Label13: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    Label11: TLabel;
    DBCheckBox11: TDBCheckBox;
    Label14: TLabel;
    RxDBComboBox3: TRxDBComboBox;
    BitBtn7: TBitBtn;
    Label15: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label16: TLabel;
    BitBtn6: TBitBtn;
    Panel6: TPanel;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    RadioGroup1: TRadioGroup;
    BitBtn4: TBitBtn;
    DBCheckBox15: TDBCheckBox;
    Label19: TLabel;
    RxDBComboBox15: TRxDBComboBox;
    DBCheckBox16: TDBCheckBox;
    Label4: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    Label17: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Habilita(Estado: Boolean);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBLookupCombo7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNatOperacao: TfNatOperacao;

implementation

uses UDM1, UDMTabImposto, URelNatOper, UDMTabEnqIPI, USel_EnqIPI,
  uUtilPadrao;

{$R *.DFM}

procedure TfNatOperacao.Habilita(Estado: Boolean);
begin
  Panel3.Enabled           := Estado;
  Panel6.Enabled           := not(Panel6.Enabled);
  BitBtn1.Enabled          := not Estado;
  BitBtn2.Enabled          := not Estado;
  BitBtn3.Enabled          := not Estado;
  BitBtn4.Enabled          := not Estado;
  BitBtn5.Enabled          := Estado;
  BitBtn6.Enabled          := Estado;
  DBNavigator1.Enabled     := not Estado;
  RxDbLookUpCombo1.Enabled := not Estado;
  RadioGroup1.Enabled      := not Estado;
end;

procedure TfNatOperacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMTabImposto.Owner.ClassName = Self.ClassName then
    FreeAndNil(DMTabImposto);
  if DMTabEnqIPI.Owner.ClassName = Self.ClassName then
    FreeAndNil(DMTabEnqIPI);

  if Screen.FormCount < 3 then
  begin
    DM1.tNatOperacao.Close;
    DM1.tSitTributaria.Close;
    DM1.tCSTIPI.Close;
  end;
  Action := Cafree;
end;

procedure TfNatOperacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tNatOperacao.State in [dsEdit] then
  begin
    ShowMessage('Você deve Cancelar ou Confirmar esta natureza de operação!');
    CanClose := False;
  end
  else
    CanClose := True;
end;

procedure TfNatOperacao.FormShow(Sender: TObject);
begin
  if not Assigned(DMTabImposto) then
    DMTabImposto := TDMTabImposto.Create(Self);
  if not Assigned(DMTabEnqIPI) then
    DMTabEnqIPI := TDMTabEnqIPI.Create(Self);

  if DM1.tNatOperacao.Filtered then
    DM1.tNatOperacao.Filtered := False;

  DM1.tNatOperacao.Open;
  DM1.tNatOperacao2.Open;
  DM1.tSitTributaria.Open;
  DM1.tCSTIPI.Open;

  DM1.tNatOperacao.Refresh;
  DM1.tNatOperacao.Last;

  DMTabEnqIPI.cdsEnqIPI.Close;
  DMTabEnqIPI.sdsEnqIPI.CommandText := DMTabEnqIPI.ctEnqIPI;
  DMTabEnqIPI.cdsEnqIPI.Open;

  Habilita(False);
  RxDBLookupCombo2.SetFocus;
end;

procedure TfNatOperacao.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tNatOperacao.IndexFieldNames := 'Descricao';
end;

procedure TfNatOperacao.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tNatOperacao.IndexFieldNames := 'Codigo';
end;

procedure TfNatOperacao.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  Habilita(False);
end;

procedure TfNatOperacao.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsNatOper.AsBoolean then
  begin
    DM1.tNatOperacao.IndexFieldNames := 'Codigo';
    DM1.tNatOperacao.Refresh;
    DM1.tNatOperacao.Last;
    DM1.tNatOperacao2.Refresh;
    DM1.tNatOperacao2.Last;
    DM1.tNatOperacao.Insert;
    DM1.tNatOperacaoCodigo.AsInteger := DM1.tNatOperacao2Codigo.AsInteger + 1;
    DM1.tNatOperacao.Post;
    DM1.tNatOperacao.Edit;
    DM1.tNatOperacaoGeraDuplicata.AsBoolean := False;
    DM1.tNatOperacaoIcms.AsBoolean          := False;
    DM1.tNatOperacaoIpi.AsBoolean           := False;
    DM1.tNatOperacaoRelFat.AsBoolean        := False;
    DM1.tNatOperacaoSomaMercNF.AsBoolean    := True;
    Habilita(True);
    DBEdit1.Enabled := True;
    DBEdit1.SetFocus;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfNatOperacao.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltNatOper.AsBoolean then
  begin
    DM1.tNatOperacao.IndexFieldNames := 'Codigo';
    DM1.tNatOperacao.Edit;
    BitBtn2.Tag := 1;
    Habilita(True);
    DBEdit1.Enabled := False;
    DBEdit2.SetFocus;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfNatOperacao.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcNatOper.AsBoolean then
  begin
    qVerifica.Close;
    qVerifica.ParamByName('CodNatOper').AsInteger := DM1.tNatOperacaoCodigo.AsInteger;
    qVerifica.Open;
    if qVerifica.RecordCount > 0 then
      ShowMessage('Natureza não pode ser excluída, já foi usada!')
    else
      if MessageDlg('Deseja realmente excluir esta natureza de operação?', mtconfirmation, [mbok, mbno], 0) = mrok then
        DM1.tNatOperacao.Delete;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfNatOperacao.BitBtn5Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tNatOperacao.Delete
  else
    if BitBtn2.Tag = 1 then
      DM1.tNatOperacao.Cancel;
  BitBtn2.Tag := 0;
  Habilita(False);
  BitBtn1.SetFocus;
end;

procedure TfNatOperacao.BitBtn6Click(Sender: TObject);
var
  Numeral: integer;
begin
  //NFe 2.00
  if (DM1.tNatOperacaoTipoEmpresa.AsString <> 'A')
    and (DM1.tNatOperacaoTipoEmpresa.AsString <> 'G')
    and (DM1.tNatOperacaoTipoEmpresa.AsString <> 'S') then
  begin
    ShowMessage('Tipo da empresa não foi escolhido!');
    exit;
  end;

  if DBEdit1.Text <> '' then
  begin
    Numeral := StrToInt(Copy(DM1.tNatOperacaoCodNatOper.AsString, 1, 1));
    case Numeral of
      1, 2, 3: DM1.tNatOperacaoEntradaSaida.AsBoolean := True;
      5, 6, 7: DM1.tNatOperacaoEntradaSaida.AsBoolean := False;
    end;
    DM1.tNatOperacao.Post;
    BitBtn2.Tag := 0;
    Habilita(False);
    BitBtn1.SetFocus;
  end
  else
  begin
    ShowMessage('Falta Natureza de Operação!');
    DBEdit1.SetFocus;
  end;
end;

procedure TfNatOperacao.RxDBLookupCombo2Exit(Sender: TObject);
begin
  DM1.tNatOperacao.IndexFieldNames := 'Codigo';
end;

procedure TfNatOperacao.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tNatOperacao.IndexFieldNames := 'CodNatOper';
end;

procedure TfNatOperacao.DBEdit1Change(Sender: TObject);
var
  Texto: string;
  i: Integer;
begin
  Texto := '';
  if Copy(DBEdit1.Text, Length(DBEdit1.Text), 1) = '.' then
  begin
    Texto := Copy(DBEdit1.Text,1,Length(DBEdit1.Text) - 1);
    DBEdit1.Text := Texto;
  end
  else
  begin
    Texto := '';
    for i := 1 to length(DBEdit1.Text) do
    begin
      if copy(DBEdit1.Text, i, 1) <> '.' then
        Texto := Texto + copy(DBEdit1.Text, i, 1);
    end;
    DBEdit1.Text := Texto;
  end;
end;

procedure TfNatOperacao.BitBtn7Click(Sender: TObject);
var
  vCodigo, vUltCodigo, x: Integer;
begin
  if not DM1.tUsuarioInsNatOper.AsBoolean then
  begin
    ShowMessage('Usuário ' + DM1.tUsuarioUsuario.AsString + ', não autorizado!');
    Exit;
  end;

  if MessageDlg('Deseja Duplicar o registro da natureza ' + DM1.tNatOperacaoCodNatOper.AsString + '?',mtconfirmation,[mbok, mbno],0) = mrNo then
    Exit;

  vCodigo := DM1.tNatOperacaoCodigo.AsInteger;

  try
    DM1.tNatOperacao2.IndexFieldNames := 'Codigo';
    DM1.tNatOperacao2.Last;
    vUltCodigo := DM1.tNatOperacao2Codigo.AsInteger + 1;
    DM1.tNatOperacao2.FindKey([vCodigo]);

    DM1.tNatOperacao.Insert;

    for x := 0 to (DM1.tNatOperacao2.FieldCount - 1) do
    begin
      if not (DM1.tNatOperacao2.Fields[x].FieldKind in [fkLookup, fkCalculated]) then
        DM1.tNatOperacao.FieldByName(DM1.tNatOperacao2.Fields[x].FieldName).AsVariant := DM1.tNatOperacao2.Fields[x].Value
    end;
    DM1.tNatOperacaoCodigo.AsInteger := vUltCodigo;
    if DM1.tNatOperacaoTipoEmpresa.AsString = 'S' then
      DM1.tNatOperacaoTipoEmpresa.AsString := 'G'
    else
      if DM1.tNatOperacaoTipoEmpresa.AsString = 'G' then
        DM1.tNatOperacaoTipoEmpresa.AsString := 'S';
    DM1.tNatOperacaoDescInterna.AsString := '';
    DM1.tNatOperacao.Post;

    DM1.tNatOperacao.Locate('Codigo', vUltCodigo, [loCaseInsensitive]);

    BitBtn2Click(Sender);

    ShowMessage('Registro duplicado!');
  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível duplicar o registro, ' + E.Message + '! Clique para continuar!');
    end;
  end;                          
end;

procedure TfNatOperacao.BitBtn4Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : Dm1.tNatOperacao.IndexFieldNames := 'CodNatOper';
    1 : Dm1.tNatOperacao.IndexFieldNames := 'Descricao';
  end;
  fRelNatOper := TfRelNatOper.Create(Self);
  fRelNatOper.QuickRep1.Preview;
  fRelNatOper.QuickRep1.Free;
end;

procedure TfNatOperacao.RxDBLookupCombo7KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_F5 then
  begin
    vID_EnqIPI_Pos := 0;
    fSel_EnqIPI := TfSel_EnqIPI.Create(Self);
    fSel_EnqIPI.ShowModal;
    if vID_EnqIPI_Pos > 0 then
      RxDBLookupCombo7.KeyValue := vID_EnqIPI_Pos;
  end;
end;

end.

