unit UPgtoComissao2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXLookup, DBCtrls, StdCtrls, Mask, Buttons, ExtCtrls, Db, DBTables,
  ComCtrls, ToolEdit, CurrEdit, Grids, DBGrids,
  RXDBCtrl, ALed, DBFilter;

type
  TfPgtoComissao2 = class(TForm)
    tExtComissaoIns: TTable;
    tExtComissaoInsNroLancamento: TIntegerField;
    tExtComissaoInsCodVendedor: TIntegerField;
    tExtComissaoInsDtReferencia: TDateField;
    tExtComissaoInsNroDoc: TIntegerField;
    tExtComissaoInsParcDoc: TIntegerField;
    tExtComissaoInsCodCliente: TIntegerField;
    tExtComissaoInsFuncao: TStringField;
    tExtComissaoInsVlrBase: TFloatField;
    tExtComissaoInsPercDescDupl: TFloatField;
    tExtComissaoInsPercComissao: TFloatField;
    tExtComissaoInsVlrComissao: TFloatField;
    tExtComissaoInsTipo: TStringField;
    tExtComissaoInsSuspensa: TBooleanField;
    Panel6: TPanel;
    Label4: TLabel;
    StaticText1: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    StaticText3: TStaticText;
    DateEdit1: TDateEdit;
    BitBtn6: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Atualiza_mResumido;
  public
    { Public declarations }
  end;

var
  fPgtoComissao2: TfPgtoComissao2;

implementation

uses UDM1, UConsComissao;

{$R *.DFM}

procedure TfPgtoComissao2.Atualiza_mResumido;
begin
  fConsComissao.mResumido.Edit;
  fConsComissao.mResumidoVlrSaida.AsFloat          := fConsComissao.mResumidoVlrSaida.AsFloat + CurrencyEdit5.Value;
  fConsComissao.mResumidoVlrTotalPeriodo.AsFloat   := fConsComissao.mResumidoVlrTotalPeriodo.AsFloat - CurrencyEdit5.Value;
  fConsComissao.mResumidoSaldoAcumulado.AsFloat    := fConsComissao.mResumidoSaldoAcumulado.AsFloat - CurrencyEdit5.Value;
  fConsComissao.mResumidoVlrTotalAcumulado.AsFloat := fConsComissao.mResumidoVlrTotalAcumulado.AsFloat - CurrencyEdit5.Value;
  fConsComissao.mResumido.Post;
end;

procedure TfPgtoComissao2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tVendedor.IndexFieldNames := 'Codigo';
  Action := Cafree;
end;

procedure TfPgtoComissao2.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfPgtoComissao2.BitBtn6Click(Sender: TObject);
begin
  if CurrencyEdit5.Value > 0 then
    begin
      if DateEdit1.Text <> '  /  /    ' then
        begin
          tExtComissaoIns.Refresh;
          tExtComissaoIns.Last;
          DM1.tExtComissao.Insert;
          DM1.tExtComissaoNroLancamento.AsInteger := tExtComissaoInsNroLancamento.AsInteger + 1;
          DM1.tExtComissaoCodVendedor.AsInteger   := fConsComissao.mResumidoCodVendedor.AsInteger;
          DM1.tExtComissaoDtReferencia.AsDateTime := DateEdit1.Date;
          DM1.tExtComissaoFuncao.AsString         := 'S';
          DM1.tExtComissaoVlrComissao.AsFloat     := CurrencyEdit5.Value;
          if fConsComissao.RxDBLookupCombo2.Text <> '' then
            DM1.tExtComissaoFilial.AsInteger        := fConsComissao.RxDBLookupCombo2.KeyValue
          else
            DM1.tExtComissaoFilial.AsInteger        := 1;
          DM1.tExtComissao.Post;

          Atualiza_mResumido;
          fConsComissao.vVlrPago := CurrencyEdit5.Value;
          CurrencyEdit1.Value                     := CurrencyEdit1.Value - CurrencyEdit5.Value;
          CurrencyEdit5.Clear;
          Close;
        end
      else
        begin
          ShowMessage('Não foi preenchido o campo data!');
          DateEdit1.SetFocus;
        end;      
    end;
end;

procedure TfPgtoComissao2.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if DM1.tExtComissaoSuspensa.AsBoolean then
    Background := ClRed;
end;

procedure TfPgtoComissao2.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := vk_Return;
end;

end.
