unit UOutros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Buttons, RxLookup, ExtCtrls, RxDBComb,
  VerificaCGC, VerificaCPF, DB, DBTables;

type
  TfOutros = class(TForm)
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
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label16: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    SpeedButton6: TSpeedButton;
    Label8: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    SpeedButton5: TSpeedButton;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    Label14: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label15: TLabel;
    Label17: TLabel;
    VerificaCPF1: TVerificaCPF;
    VerificaCGC1: TVerificaCGC;
    tOutrosIns: TTable;
    tOutrosInsCodigo: TIntegerField;
    tOutrosInsNome: TStringField;
    tOutrosInsContato: TStringField;
    tOutrosInsTelefone1: TStringField;
    tOutrosInsTelefone2: TStringField;
    tOutrosInsFax: TStringField;
    tOutrosInsEmail: TStringField;
    tOutrosInsCodCidade: TIntegerField;
    tOutrosInsEndereco: TStringField;
    tOutrosInsBairro: TStringField;
    tOutrosInsCep: TStringField;
    tOutrosInsUF: TStringField;
    tOutrosInsNumDoc: TStringField;
    tOutrosInsPessoa: TStringField;
    tOutrosInsHomePage: TStringField;
    tOutrosInsObs: TMemoField;
    Label18: TLabel;
    DBEdit12: TDBEdit;
    DBMemo1: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit9Enter(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
    Function Checa_Duplicidade : Boolean;
  public
    { Public declarations }
  end;

var
  fOutros: TfOutros;

implementation

uses UDM1, UDM2;

{$R *.DFM}

Function TfOutros.Checa_Duplicidade : Boolean;
begin
  Result := False;
  if (tOutrosIns.Locate('NumDoc',DBEdit9.Text,[loCaseInsensitive])) and
     (tOutrosInsCodigo.AsInteger <> DM1.toutrosCodigo.AsInteger) then
    begin
      ShowMessage('Cadastro ' + tOutrosInsNome.AsString + ', já está cadastrado com o documento digitado! ');
      Result := True;
      DBEdit9.Clear;
    end;
end;

procedure TfOutros.Habilita;
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
  DBMemo1.ReadOnly     := not(DBMemo1.ReadOnly);
end;

procedure TfOutros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tOutros.Close;
  Action := Cafree;
end;

procedure TfOutros.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tOutros.IndexFieldNames := 'Nome';
end;

procedure TfOutros.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tOutros.IndexFieldNames := 'Codigo';
end;

procedure TfOutros.BitBtn1Click(Sender: TObject);
var
  vCodAux : Integer;
begin
  DM1.tOutros.Refresh;
  DM1.tOutros.Last;
  vCodAux := DM1.tOutrosCodigo.AsInteger;
  DM1.tOutros.Insert;
  DM1.tOutrosCodigo.AsInteger := vCodAux + 1;
  DM1.tOutrosPessoa.AsString  := 'F';
  DM1.tOutros.Post;
  DM1.tOutros.Edit;
  Habilita;
  DBEdit1.SetFocus;
end;

procedure TfOutros.BitBtn2Click(Sender: TObject);
begin
  if not DM1.tOutros.IsEmpty then
    begin
      DM1.tOutros.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Não há registro p/ ser alterado!');
end;

procedure TfOutros.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 1 then
    DM1.tOutros.Cancel
  else
    begin
      DM1.tOutros.Post;
      DM1.tOutros.Delete;
    end;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfOutros.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir este registro?',mtconfirmation,[mbok,mbno],0)=mrok then
    DM1.tOutros.Delete;
end;

procedure TfOutros.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfOutros.BitBtn5Click(Sender: TObject);
begin
  DM1.tOutros.Post;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfOutros.FormShow(Sender: TObject);
begin
  DM1.tOutros.Open;
end;

procedure TfOutros.DBEdit9Exit(Sender: TObject);
begin
  if RxDBComboBox2.Text = 'J' then
  begin
    if (DBEdit9.Text <> '  .   .   /    -  ') and (DBEdit9.Text <> '00.000.000/0000-00') then
    begin
      VerificaCGC1.Entrada := DBEdit9.Text;
      if not VerificaCGC1.Resultado then
        begin
          ShowMessage('Número de CNPJ inválido!');
          DBEdit9.Clear;
          DBEdit9.SetFocus;
        end
      else
      if Checa_Duplicidade then
        BitBtn4Click(Sender);
    end;
  end
  else
  if RxDBComboBox2.Text = 'F' then
  begin
    if (DBEdit9.Text <> '   .   .   -  ') and (DBEdit9.Text <> '000.000.000-00') then
    begin
      VerificaCPF1.Entrada := DBEdit9.Text;
      if not VerificaCPF1.Resultado then
        begin
          ShowMessage('Número de CPF inválido!');
          DBEdit9.Clear;
          DBEdit9.SetFocus;
        end
      else
      if Checa_Duplicidade then
        BitBtn4Click(Sender);
    end
  end
  else
    DM1.tOutrosNumDoc.Clear;
end;

procedure TfOutros.DBEdit9Enter(Sender: TObject);
begin
 if RxDBComboBox2.Text = 'F' then
 begin
   DM1.tOutrosPessoa.AsString := 'F';
   DM1.tOutrosNumDoc.EditMask := '999.999.999-99';
 end
 else
 if RxDBComboBox2.Text = 'J' then
 begin
   DM1.tOutrosPessoa.AsString := 'J';
   DM1.tOutrosNumDoc.EditMask := '99.999.999/9999-99';
 end
 else
   DM1.tOutrosNumDoc.EditMask := '';
end;

end.
