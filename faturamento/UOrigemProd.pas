unit UOrigemProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, RxLookup;

type
  TfOrigemProd = class(TForm)
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
    BitBtn5: TBitBtn;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    BitBtn7: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
  private
    procedure Habilita;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOrigemProd: TfOrigemProd;

implementation

uses UDM1, UDMTabImposto;

{$R *.DFM}

procedure TfOrigemProd.Habilita;
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

procedure TfOrigemProd.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfOrigemProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DMTabImposto.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMTabImposto);

  Action := Cafree;
end;

procedure TfOrigemProd.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsRegimeTrib.AsBoolean then
    begin
      DMTabImposto.tOrigemProd.Insert;
      BitBtn2.Tag := 0;
      Habilita;
      DBEdit2.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfOrigemProd.BitBtn5Click(Sender: TObject);
begin
  if Trim(DMTabImposto.tOrigemProdNome.AsString) = '' then
  begin
    ShowMessage('Nome não foi informado!');
    exit;
  end;

  DMTabImposto.tOrigemProd.Post;
  DMTabImposto.tOrigemProd.Refresh;

  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfOrigemProd.BitBtn4Click(Sender: TObject);
begin
  DMTabImposto.tOrigemProd.Cancel;

  BitBtn2.Tag := 0;
  Habilita;
  BitBtn1.SetFocus;
end;

procedure TfOrigemProd.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltRegimeTrib.AsBoolean then
    begin
      DMTabImposto.tOrigemProd.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit2.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfOrigemProd.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcRegimeTrib.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        DMTabImposto.tOrigemProd.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfOrigemProd.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DMTabImposto.tOrigemProd.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o registro antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfOrigemProd.FormShow(Sender: TObject);
begin
  if not Assigned(DMTabImposto) then
    DMTabImposto := TDMTabImposto.Create(Self);
end;

procedure TfOrigemProd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and ((Key = 87) or (Key = 82)) then
    BitBtn7.Visible := not BitBtn7.Visible;
end;

procedure TfOrigemProd.BitBtn7Click(Sender: TObject);
var
  i : Integer;
begin
  i := 0;
  while i <= 8 do
  begin
    if DMTabImposto.tOrigemProd.Locate('Origem',FormatFloat('0',i),[loCaseInsensitive]) then
      DMTabImposto.tOrigemProd.Edit
    else
    begin
      DMTabImposto.tOrigemProd.Insert;
      DMTabImposto.tOrigemProdOrigem.AsString := FormatFloat('0',i);
    end;
    if DMTabImposto.tOrigemProdOrigem.AsString = '0' then
      DMTabImposto.tOrigemProdNome.AsString := 'NACIONAL, EXCETO AS INDICADAS NOS CÓDIGOS 3 A 5'
    else
    if DMTabImposto.tOrigemProdOrigem.AsString = '1' then
      DMTabImposto.tOrigemProdNome.AsString := 'ESTRANGEIRA - IMPORTAÇÃO DIRETA, EXCETO A INDICADA NO CÓDIGO 6'
    else
    if DMTabImposto.tOrigemProdOrigem.AsString = '2' then
      DMTabImposto.tOrigemProdNome.AsString := 'ESTRANGEIRA - ADQUIRIDA NO MERCADO INTERNO, EXCETO A INDICADA NO CÓDIGO 7'
    else
    if DMTabImposto.tOrigemProdOrigem.AsString = '3' then
      DMTabImposto.tOrigemProdNome.AsString := 'NACIONAL, MERCADORIA OU BEM COM CONTEÚDO DE IMPORTAÇÃO SUPERIOR A 40% (QUARENTA POR CENTO)'
    else
    if DMTabImposto.tOrigemProdOrigem.AsString = '4' then
      DMTabImposto.tOrigemProdNome.AsString := 'NACIONAL, CUJA PRODUÇÃO TENHA SIDO FEITA EM CONFORMIDADE COM OS PROCESSOS PRODUTIVOS BÁSICOS DE QUE TRATAM O DECRETO-LEI Nº 288/67, E AS LEIS NºS 8.248/91, 8.387/91, 10.176/01 E 11 . 4 8 4 / 0 7'
    else
    if DMTabImposto.tOrigemProdOrigem.AsString = '5' then
      DMTabImposto.tOrigemProdNome.AsString := 'NACIONAL, MERCADORIA OU BEM COM CONTEÚDO DE IMPORTAÇÃO INFERIOR OU IGUAL A 40% (QUARENTA POR CENTO)'
    else
    if DMTabImposto.tOrigemProdOrigem.AsString = '6' then
      DMTabImposto.tOrigemProdNome.AsString := 'ESTRANGEIRA - IMPORTAÇÃO DIRETA, SEM SIMILAR NACIONAL, CONSTANTE EM LISTA DE RESOLUÇÃO CAMEX'
    else
    if DMTabImposto.tOrigemProdOrigem.AsString = '7' then
      DMTabImposto.tOrigemProdNome.AsString := 'ESTRANGEIRA - ADQUIRIDA NO MERCADO INTERNO, SEM SIMILAR NACIONAL, CONSTANTE EM LISTA DE RESOLUÇÃO CAMEX'
    else
    if DMTabImposto.tOrigemProdOrigem.AsString = '8' then
      DMTabImposto.tOrigemProdNome.AsString := 'NACIONAL, MERCADORIA OU BEM COM CONTEUDO DE IMPORTACAO SUPERIOR A 70% (SETENTA POR CENTO)';
    DMTabImposto.tOrigemProd.Post;
    i := i + 1;
  end;
end;

end.
