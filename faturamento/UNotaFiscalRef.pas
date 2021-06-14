unit UNotaFiscalRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ToolEdit, CurrEdit, StdCtrls, ExtCtrls, Buttons, DB,
  RxLookup, DBTables, RzTabs, DBCtrls;

type
  TfNotaFiscalRef = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    tUF2: TTable;
    tUF2Sigla: TStringField;
    dsUF2: TDataSource;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    Label4: TLabel;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    MaskEdit1: TMaskEdit;
    RxDBLookupCombo6: TRxDBLookupCombo;
    Label6: TLabel;
    qNotaRef: TQuery;
    qNotaRefItem: TIntegerField;
    TabSheet3: TRzTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    Label17: TLabel;
    Label16: TLabel;
    Edit6: TEdit;
    TabSheet4: TRzTabSheet;
    Label15: TLabel;
    Edit4: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Opcao;
  public
    { Public declarations }
  end;

var
  fNotaFiscalRef: TfNotaFiscalRef;

implementation

uses UDMNotaFiscal, UDM1, DateUtils, StdConvs;

{$R *.dfm}

procedure TfNotaFiscalRef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfNotaFiscalRef.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfNotaFiscalRef.BitBtn1Click(Sender: TObject);
var
  vItemAux : Integer;
  vTexto : String;
  vTipoAux : String;
begin
  if (RzPageControl1.ActivePage = TabSheet1) and (Length(Trim(Edit2.Text)) < 44) then
  begin
    ShowMessage('Chave de acesso não informada ou faltando caracteres!');
    exit;
  end;

  vTexto := '';
  if (RzPageControl1.ActivePage = TabSheet2) then
  begin
    if Edit1.Text = '' then
      vTexto := ' (Série não infomada) ';
    if CurrencyEdit1.AsInteger <= 0 then
      vTexto := ' (Nº nota não informada) ';
    if Edit3.Text = '' then
      vTexto := ' (Modelo não infomado) ';
    if RxDBLookupCombo6.Text = '' then
      vTexto := ' (UF não infomada) ';
    if Edit5.Text = '' then
      vTexto := ' (CNPJ não infomado) ';
    if Trim(copy(MaskEdit1.Text,1,2)) = '' then
      vTexto := ' (Mês não infomado) ';
    if Trim(copy(MaskEdit1.Text,4,2)) = '' then
      vTexto := ' (Ano não infomado) ';
  end;

  if (RzPageControl1.ActivePage = TabSheet3) then
  begin
    if CurrencyEdit2.AsInteger <= 0 then
      vTexto := ' (Número ECF não informado) ';
    if CurrencyEdit3.AsInteger <= 0 then
      vTexto := ' (Número COO não informado) ';
    if ComboBox1.ItemIndex <= 0 then
      vTexto := ' (Modelo não informado) ';
  end;

  if (RzPageControl1.ActivePage = TabSheet4) then
  begin
    if trim(Edit4.Text) = '' then
      vTexto := ' (Chave Acesso ñão informada) ';
  end;

  if vTexto <> '' then
  begin
    ShowMessage(vTexto);
    exit;
  end;

  //NFe 2.00
  //if (DM1.tNotaFiscalTipoNotaNFeRef.AsString = 'D') and (RxDBLookupCombo1.Text = '') then
  //  Raise Exception.Create('É obrigatório informar o fornecedor!')
  //else
  //if DM1.tNotaFiscalTipoNotaNFeRef.AsString = 'D' then
  //  if not DM1.tFornecedores.Locate('CodForn',RxDBLookupCombo1.KeyValue,([Locaseinsensitive])) then
  //    Raise Exception.Create('Não encontrou o fornecedor!');
  {if DM1.tNotaFiscalTipoNotaNFeRef.AsString <> 'D' then
    begin
      if not DMNotaFiscal.tNotaFiscalIns.Locate('Filial;NumNota;Serie',VarArrayOf([DM1.tFilialCodigo.AsInteger,CurrencyEdit1.AsInteger,Edit1.Text]),[locaseinsensitive]) then
        Raise Exception.Create('Nota não encontrada!')
    end
  else
  if not DM1.tNEntrada.Locate('Filial;NumNEntr;Serie;CodForn',VarArrayOf([DM1.tFilialCodigo.AsInteger,CurrencyEdit1.AsInteger,Edit1.Text,RxDBLookupCombo1.KeyValue]),[locaseinsensitive]) then
    Raise Exception.Create('Nota não encontrada!');}
  //***************

  vTipoAux := '';
  if (RzPageControl1.ActivePage = TabSheet1) then
    vTipoAux := '13'
  else
  if (RzPageControl1.ActivePage = TabSheet2) then
  begin
    if CheckBox1.Checked then
      vTipoAux := '20a'
    else
      vTipoAux := '14';
  end
  else
  if (RzPageControl1.ActivePage = TabSheet3) then
    vTipoAux := '20j'
  else
  if (RzPageControl1.ActivePage = TabSheet4) then
    vTipoAux := 'CTe';

  qNotaRef.Close;
  qNotaRef.ParamByName('Filial').AsInteger := DM1.tNotaFiscalFilial.AsInteger;
  qNotaRef.ParamByName('NumSeq').AsInteger := DM1.tNotaFiscalNumSeq.AsInteger;
  qNotaRef.ParamByName('Tipo').AsString    := vTipoAux;
  qNotaRef.Open;
  vItemAux := qNotaRefItem.AsInteger;
  qNotaRef.Close;

  DM1.tNotaFiscalRef.Insert;
  DM1.tNotaFiscalRefFilial.AsInteger           := DM1.tNotaFiscalFilial.AsInteger;
  DM1.tNotaFiscalRefNumSeq.AsInteger           := DM1.tNotaFiscalNumSeq.AsInteger;
  DM1.tNotaFiscalRefTipo.AsString              := vTipoAux;
  DM1.tNotaFiscalRefItem.AsInteger             := vItemAux + 1;
  if (RzPageControl1.ActivePage = TabSheet1) then
  begin
    DM1.tNotaFiscalRefNFeChaveAcessoRef.AsString := Edit2.Text;
    DM1.tNotaFiscalRefDescTipo.AsString          := 'NFe';
  end
  else
  if (RzPageControl1.ActivePage = TabSheet2) then
  begin
    DM1.tNotaFiscalRefNumSeqRef.AsInteger        := 0;
    DM1.tNotaFiscalRefNumNotaRef.AsInteger       := CurrencyEdit1.AsInteger;
    DM1.tNotaFiscalRefSerieRef.AsString          := Edit1.Text;
    DM1.tNotaFiscalRefCodUFEmitenteRef.AsString  := RxDBLookupCombo6.Text;
    DM1.tNotaFiscalRefMesEmissaoRef.AsInteger    := StrToInt(Copy(MaskEdit1.Text,1,2));
    DM1.tNotaFiscalRefAnoEmissaoRef.AsInteger    := StrToInt(Copy(MaskEdit1.Text,4,2));
    DM1.tNotaFiscalRefCNPJEmitenteRef.AsString   := Edit5.Text;
    DM1.tNotaFiscalRefModeloRef.AsString         := Edit3.Text;
    DM1.tNotaFiscalRefCodFornecedor.AsInteger    := 0;
    DM1.tNotaFiscalRefDescTipo.AsString          := 'Nota Fiscal';
    DM1.tNotaFiscalRefIE.AsString                := Edit6.Text;
  end
  else
  if (RzPageControl1.ActivePage = TabSheet3) then
  begin
    DM1.tNotaFiscalRefCupomNumECF.AsInteger := CurrencyEdit2.AsInteger;
    DM1.tNotaFiscalRefCupomNumCOO.AsInteger := CurrencyEdit3.AsInteger;
    case ComboBox1.ItemIndex of
      1 : DM1.tNotaFiscalRefCupomModelo.AsString := '2B';
      2 : DM1.tNotaFiscalRefCupomModelo.AsString := '2C';
      3 : DM1.tNotaFiscalRefCupomModelo.AsString := '2D';
    end;
    DM1.tNotaFiscalRefDescTipo.AsString          := 'Cupom Fiscal';
  end
  else
  if (RzPageControl1.ActivePage = TabSheet4) then
  begin
    DM1.tNotaFiscalRefCTECHAVEACESSO_REF.AsString := Edit4.Text;
    DM1.tNotaFiscalRefDescTipo.AsString           := 'CTe';
  end;
  DM1.tNotaFiscalRef.Post;
  DM1.tNotaFiscalRef.Refresh;

  Close;
end;

procedure TfNotaFiscalRef.FormShow(Sender: TObject);
begin
  if not DM1.tFornecedores.Active then
    DM1.tFornecedores.Open;
  if not DM1.tNEntrada.Active then
    DM1.tNEntrada.Open;
  Opcao;
end;

procedure TfNotaFiscalRef.Opcao;
begin
end;

procedure TfNotaFiscalRef.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    Label7.Caption := 'CNPJ/CPF do Produto:';
  Label16.Visible := CheckBox1.Checked;
  Edit6.Visible   := CheckBox1.Checked;
end;

end.
