unit ULancaCPagarItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, ToolEdit, CurrEdit,
  Mask, RXLookup, RXDBCtrl, Db, DbTables, ComCtrls, ALed, Variants, RzTabs;

type
  TfLancaCPagarItens = class(TForm)
    Panel1: TPanel;
    tCPagarIns: TTable;
    tCPagarInsNumCPagar: TIntegerField;
    tCPagarInsNumNotaEnt: TIntegerField;
    tCPagarInsCodForn: TIntegerField;
    tCPagarInsQuitado: TBooleanField;
    tCPagarInsTipoDoc: TStringField;
    tCPagarInsDtGerado: TDateField;
    tCPagarInsHistorico: TStringField;
    tCPagarInsNroDuplicata: TIntegerField;
    tCPagarInsNroFatura: TIntegerField;
    tCPagarInsFilial: TIntegerField;
    tCPagarInsCodAtelier: TIntegerField;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    SpeedButton8: TSpeedButton;
    Label6: TLabel;
    Label12: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    DateEdit1: TDateEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    CurrencyEdit2: TCurrencyEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo6: TRxDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label17: TLabel;
    CurrencyEdit6: TCurrencyEdit;
    Label13: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label14: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    CheckBox1: TCheckBox;
    Label16: TLabel;
    CurrencyEdit5: TCurrencyEdit;
    Label15: TLabel;
    DateEdit2: TDateEdit;
    BitBtn11: TBitBtn;
    BitBtn1: TBitBtn;
    tCPagarParcIns: TTable;
    tCPagarParcInsFilial: TIntegerField;
    tCPagarParcInsNumCPagar: TIntegerField;
    tCPagarParcInsParcCPagar: TIntegerField;
    tCPagarParcInsDtVencCPagar: TDateField;
    tCPagarParcInsVlrParcCPagar: TFloatField;
    tCPagarParcInsQuitParcCPagar: TBooleanField;
    tCPagarParcInsDtPagParcCPagar: TDateField;
    tCPagarParcInsJurosParcCPagar: TFloatField;
    tCPagarParcInsCodForn: TIntegerField;
    tCPagarParcInsNumNotaEnt: TIntegerField;
    tCPagarParcInsDesconto: TFloatField;
    tCPagarParcInsPgtoParcial: TFloatField;
    tCPagarParcInsRestParcela: TFloatField;
    tCPagarParcInsBanco: TStringField;
    tCPagarParcInsPlanoContas: TIntegerField;
    Label5: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label7: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    Label8: TLabel;
    CurrencyEdit7: TCurrencyEdit;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton8Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure RxDBLookupCombo6Enter(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Limpar_Campos;
    
  public
    { Public declarations }
    vNumParcela : integer;
  end;

var
  fLancaCPagarItens: TfLancaCPagarItens;

implementation

Uses UDM1, UPlanoContas;

{$R *.DFM}

procedure TfLancaCPagarItens.BitBtn6Click(Sender: TObject);
begin
  if vNumParcela > 0 then
  begin
    if DM1.tCPagarParc.FindKey([DM1.tFilialCodigo.AsInteger,DM1.tCPagarNumCPagar.AsInteger,vNumParcela])  then
      DM1.tCPagarParc.Edit;
  end
  else
  begin
    if DM1.tCPagarParc.Locate('Filial;NumCPagar;ParcCPagar',VarArrayOf([Dm1.tFilialCodigo.AsInteger,DM1.tCPagarNumCPagar.AsString,CurrencyEdit2.Text]),[loCaseInsensitive]) then
    begin
      ShowMessage('Parcela digitada já existe!');
      exit;
    end
    else
    if (CurrencyEdit2.Value = 0) or (DateEdit1.Date < 10) or (CurrencyEdit1.Value = 0) then
    begin
      ShowMessage('Existe campos em brancos, "Parcela","Data Vecto" ou "Valor"!');
      exit;
    end;
  end;

  if DM1.tCPagarParc.State in [dsBrowse] then
  begin
    tCPagarParcIns.Refresh;
    tCPagarParcIns.Last;
    DM1.tCPagarParc.Insert;
    Dm1.tCPagarParcFilial.AsInteger     := DM1.tCPagarFilial.AsInteger;
    DM1.tCPagarParcNumCPagar.AsInteger  := DM1.tCPagarNumCPagar.AsInteger;
    if vNumParcela > 0 then
      DM1.tCPagarParcParcCPagar.AsInteger := vNumParcela
    else
      DM1.tCPagarParcParcCPagar.AsInteger := CurrencyEdit2.AsInteger;
  end;

  if RxDBLookupCombo3.Text <> '' then
    DM1.tCPagarParcPlanoContas.AsInteger := RxDBLookupCombo3.KeyValue;
  DM1.tCPagarParcVlrParcCPagar.AsFloat   := CurrencyEdit1.Value;
  DM1.tCPagarParcRestParcela.AsFloat     := CurrencyEdit1.Value;
  If RxDBLookupCombo1.Text <> '' then
    DM1.tCPagarParcCodConta.AsInteger := RxDBLookupCombo1.KeyValue
  else
    DM1.tCPagarParcCodConta.AsInteger := 0;
  DM1.tCPagarParcDtVencCPagar.AsString := DateEdit1.Text;
  if RxDBLookupCombo4.Text <> '' then
    DM1.tCPagarParcCodForn.AsInteger   := RxDBLookupCombo4.KeyValue;
  if DM1.tCPagarNroDuplicata.IsNull then
    DM1.tCPagarParcNroDuplicata.AsString := '0'
  else
    DM1.tCPagarParcNroDuplicata.AsString := DM1.tCPagarNroDuplicata.AsString;
  DM1.tCPagarParcCodAtelier.AsInteger := DM1.tCPagarCodAtelier.AsInteger;
  if RxDBLookupCombo6.Text <> '' then
    DM1.tCPagarParcCodPlanoContasItens.AsInteger := RxDBLookupCombo6.KeyValue
  else
    DM1.tCPagarParcCodPlanoContasItens.AsInteger := 0;
  DM1.tCPagarParcDtGerado.AsDateTime          := DM1.tCPagarDtGerado.AsDateTime;
  DM1.tCPagarParcNumSolicitacao.AsInteger     := CurrencyEdit7.AsInteger;
  DM1.tCPagarParcCodCentroCusto.AsInteger     := DM1.tCPagarCodCentroCusto.AsInteger;
  DM1.tCPagarParcCodCentroCustoItem.AsInteger := DM1.tCPagarCodCentroCustoItem.AsInteger;
  DM1.tCPagarParcSerie.AsString               := DM1.tCPagarSerie.AsString;
  DM1.tCPagarParc.Post;
  DM1.GravaEnt_tCPagarParcHist;
  Limpar_Campos;
  CurrencyEdit2.SetFocus;
  vNumParcela := 0;
  if Tag = 1 then
    Close;
end;

procedure TfLancaCPagarItens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfLancaCPagarItens.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioPlanoCtas.AsBoolean then
  begin
    fPlanoContas := TfPlanoContas.Create(Self);
    fPlanoContas.ShowModal;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de plano de contas!');
end;

procedure TfLancaCPagarItens.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfLancaCPagarItens.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tContas.IndexFieldNames := 'NomeConta';
end;

procedure TfLancaCPagarItens.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tContas.IndexFieldNames := 'CodConta';
end;

procedure TfLancaCPagarItens.BitBtn11Click(Sender: TObject);
var
  i : Integer;
  vData : TDateTime;
  Dia, mes, ano : Word;
  vParcInicial : Integer;
begin
  if (CurrencyEdit3.Value > 0) and (CurrencyEdit4.Value > 0) and (CurrencyEdit5.Value > 0) and (DateEdit2.Date > 10) then
  begin
    vParcInicial := CurrencyEdit6.AsInteger;
    if CurrencyEdit6.AsInteger <= 0 then
      vParcInicial := 1;
    tCPagarParcIns.Refresh;
    tCPagarParcIns.Last;
    if tCPagarParcIns.Locate('Filial;NumCPagar;ParcCPagar',VarArrayOf([Dm1.tFilialCodigo.AsInteger,DM1.tCPagarNumCPagar.AsString,vParcInicial]),[loCaseInsensitive]) then
      begin
        ShowMessage('Geração cancelada, parcela inicial já existe!');
        exit;
      end;

    DM1.tCPagarParc.Insert;
    Dm1.tCPagarParcFilial.AsInteger     := Dm1.tCPagarFilial.AsInteger;
    DM1.tCPagarParcNumCPagar.AsInteger  := DM1.tCPagarNumCPagar.AsInteger;
    DM1.tCPagarParcParcCPagar.AsInteger := vParcInicial;
    DM1.tCPagarParcSerie.AsString       := DM1.tCPagarSerie.AsString;
    if RxDBLookupCombo2.Text <> '' then
      DM1.tCPagarParcPlanoContas.AsInteger := RxDBLookupCombo2.KeyValue
    else
      DM1.tCPagarParcPlanoContas.AsInteger := 0;
    if RxDBLookupCombo4.Text <> '' then
      DM1.tCPagarParcCodPlanoContasItens.AsInteger := RxDBLookupCombo4.KeyValue
    else
      DM1.tCPagarParcCodPlanoContasItens.AsInteger := 0;
    DM1.tCPagarParcCodConta.AsInteger       := 0;
    DM1.tCPagarParcCodForn.AsInteger        := DM1.tCPagarCodForn.AsInteger;
    if DM1.tCPagarNroDuplicata.AsInteger > 0 then
      DM1.tCPagarParcNroDuplicata.AsInteger := DM1.tCPagarNroDuplicata.AsInteger
    else
      DM1.tCPagarParcNroDuplicata.AsInteger := 0;
    if DM1.tCPagarCodAtelier.AsInteger > 0 then
      DM1.tCPagarParcCodAtelier.AsInteger := DM1.tCPagarCodAtelier.AsInteger
    else
      DM1.tCPagarParcCodAtelier.AsInteger := 0;
    DM1.tCPagarParcDtVencCPagar.AsDateTime  := DateEdit2.Date;
    DM1.tCPagarParcVlrParcCPagar.AsFloat    := CurrencyEdit3.Value;
    DM1.tCPagarParcRestParcela.AsFloat      := CurrencyEdit3.Value;
    DM1.tCPagarParcDtGerado.AsDateTime      := DM1.tCPagarDtGerado.AsDateTime;
    DM1.tCPagarParcCodCentroCusto.AsInteger     := DM1.tCPagarCodCentroCusto.AsInteger;
    DM1.tCPagarParcCodCentroCustoItem.AsInteger := DM1.tCPagarCodCentroCustoItem.AsInteger;
    DM1.tCPagarParc.Post;
    vParcInicial := vParcInicial + 1;

    DM1.GravaEnt_tCPagarParcHist;

    vData                                   := DateEdit2.Date;
    DecodeDate(DateEdit2.Date,ano,mes,dia);
    mes := mes - 1;
    if mes < 1 then
    begin
      mes := 12;
      ano := ano - 1;
    end;
    for i := 1 to (CurrencyEdit4.AsInteger - 1) do
    begin
      if CheckBox1.Checked then
        begin
          mes := mes + 1;
          if mes > 12 then
            begin
              mes := 01;
              ano := ano + 1;
            end;
          vData := EncodeDate(ano,mes,dia);
        end
      else
        vData                                   := vData + CurrencyEdit5.Value;
      tCPagarParcIns.Refresh;
      tCPagarParcIns.Last;
      DM1.tCPagarParc.Insert;
      Dm1.tCPagarParcFilial.AsInteger        := Dm1.tCPagarFilial.AsInteger;
      DM1.tCPagarParcNumCPagar.AsInteger     := DM1.tCPagarNumCPagar.AsInteger;
      DM1.tCPagarParcParcCPagar.AsInteger    := tCPagarParcInsParcCPagar.AsInteger + 1;
      DM1.tCPagarParcSerie.AsString          := DM1.tCPagarSerie.AsString;
      if RxDBLookupCombo2.Text <> '' then
        DM1.tCPagarParcPlanoContas.AsInteger := RxDBLookupCombo2.KeyValue
      else
        DM1.tCPagarParcPlanoContas.AsInteger := 0;
      if RxDBLookupCombo4.Text <> '' then
        DM1.tCPagarParcCodPlanoContasItens.AsInteger := RxDBLookupCombo4.KeyValue
      else
        DM1.tCPagarParcCodPlanoContasItens.AsInteger := 0;
      DM1.tCPagarParcCodConta.AsInteger       := 0;
      DM1.tCPagarParcCodForn.AsInteger        := DM1.tCPagarCodForn.AsInteger;
      if DM1.tCPagarNroDuplicata.AsInteger > 0 then
        DM1.tCPagarParcNroDuplicata.AsInteger := DM1.tCPagarNroDuplicata.AsInteger
      else
        DM1.tCPagarParcNroDuplicata.AsInteger := 0;
      if DM1.tCPagarCodAtelier.AsInteger > 0 then
        DM1.tCPagarParcCodAtelier.AsInteger := DM1.tCPagarCodAtelier.AsInteger
      else
        DM1.tCPagarParcCodAtelier.AsInteger := 0;
      DM1.tCPagarParcDtVencCPagar.AsDateTime      := vData;
      DM1.tCPagarParcVlrParcCPagar.AsFloat        := CurrencyEdit3.Value;
      DM1.tCPagarParcRestParcela.AsFloat          := CurrencyEdit3.Value;
      DM1.tCPagarParcDtGerado.AsDateTime          := DM1.tCPagarDtGerado.AsDateTime;
      DM1.tCPagarParcCodCentroCusto.AsInteger     := DM1.tCPagarCodCentroCusto.AsInteger;
      DM1.tCPagarParcCodCentroCustoItem.AsInteger := DM1.tCPagarCodCentroCustoItem.AsInteger;
      DM1.tCPagarParc.Post;
      DM1.GravaEnt_tCPagarParcHist;
    end;
    CurrencyEdit3.Clear;
    CurrencyEdit4.Clear;
    CurrencyEdit5.Clear;
    DateEdit2.Clear;
    Close;
  end
  else
  if (CurrencyEdit3.Value > 0) and (CurrencyEdit4.Value > 0) and (CurrencyEdit5.Value <= 0) and (DateEdit2.Date > 10) then
  begin
    vParcInicial := CurrencyEdit6.AsInteger;
    if CurrencyEdit6.AsInteger <= 0 then
      vParcInicial := 1;
    tCPagarParcIns.Refresh;
    tCPagarParcIns.Last;
    if tCPagarParcIns.Locate('Filial;NumCPagar;ParcCPagar',VarArrayOf([Dm1.tFilialCodigo.AsInteger,DM1.tCPagarNumCPagar.AsString,vParcInicial]),[loCaseInsensitive]) then
    begin
      ShowMessage('Geração cancelada, parcela inicial já existe!');
      exit;
    end;

    DM1.tCPagarParc.Insert;
    Dm1.tCPagarParcFilial.AsInteger        := Dm1.tCPagarFilial.AsInteger;
    DM1.tCPagarParcNumCPagar.AsInteger     := DM1.tCPagarNumCPagar.AsInteger;
    DM1.tCPagarParcParcCPagar.AsInteger    := vParcInicial;
    DM1.tCPagarParcSerie.AsString          := DM1.tCPagarSerie.AsString;
    if RxDBLookupCombo2.Text <> '' then
      DM1.tCPagarParcPlanoContas.AsInteger := RxDBLookupCombo2.KeyValue
    else
      DM1.tCPagarParcPlanoContas.AsInteger := 0;
    if RxDBLookupCombo4.Text <> '' then
      DM1.tCPagarParcCodPlanoContasItens.AsInteger := RxDBLookupCombo4.KeyValue
    else
      DM1.tCPagarParcCodPlanoContasItens.AsInteger := 0;
    DM1.tCPagarParcCodConta.AsInteger       := 0;
    DM1.tCPagarParcCodForn.AsInteger        := DM1.tCPagarCodForn.AsInteger;
    if DM1.tCPagarNroDuplicata.AsInteger > 0 then
      DM1.tCPagarParcNroDuplicata.AsInteger := DM1.tCPagarNroDuplicata.AsInteger
    else
      DM1.tCPagarParcNroDuplicata.AsInteger := 0;
    if DM1.tCPagarCodAtelier.AsInteger > 0 then
      DM1.tCPagarParcCodAtelier.AsInteger := DM1.tCPagarCodAtelier.AsInteger
    else
      DM1.tCPagarParcCodAtelier.AsInteger := 0;
    DM1.tCPagarParcDtVencCPagar.AsDateTime      := DateEdit2.Date;
    DM1.tCPagarParcVlrParcCPagar.AsFloat        := CurrencyEdit3.Value;
    DM1.tCPagarParcRestParcela.AsFloat          := CurrencyEdit3.Value;
    DM1.tCPagarParcDtGerado.AsDateTime          := DM1.tCPagarDtGerado.AsDateTime;
    DM1.tCPagarParcCodCentroCusto.AsInteger     := DM1.tCPagarCodCentroCusto.AsInteger;
    DM1.tCPagarParcCodCentroCustoItem.AsInteger := DM1.tCPagarCodCentroCustoItem.AsInteger;
    DM1.tCPagarParc.Post;
    vParcInicial := vParcInicial + 1;

    DM1.GravaEnt_tCPagarParcHist;
    vData                                   := DateEdit2.Date;
    for i := 1 to (CurrencyEdit4.AsInteger - 1) do
    begin
      vData                                  := IncMonth(vData,1);
      tCPagarParcIns.Refresh;
      tCPagarParcIns.Last;
      DM1.tCPagarParc.Insert;
      Dm1.tCPagarParcFilial.AsInteger        := Dm1.tCPagarFilial.AsInteger;
      DM1.tCPagarParcNumCPagar.AsInteger     := DM1.tCPagarNumCPagar.AsInteger;
      DM1.tCPagarParcParcCPagar.AsInteger    := tCPagarParcInsParcCPagar.AsInteger + 1;
      DM1.tCPagarParcSerie.AsString          := DM1.tCPagarSerie.AsString;
      if RxDBLookupCombo2.Text <> '' then
        DM1.tCPagarParcPlanoContas.AsInteger := RxDBLookupCombo2.KeyValue
      else
        DM1.tCPagarParcPlanoContas.AsInteger := 0;
      if RxDBLookupCombo4.Text <> '' then
        DM1.tCPagarParcCodPlanoContasItens.AsInteger := RxDBLookupCombo4.KeyValue
      else
        DM1.tCPagarParcCodPlanoContasItens.AsInteger := 0;
      DM1.tCPagarParcCodConta.AsInteger       := 0;
      DM1.tCPagarParcCodForn.AsInteger        := DM1.tCPagarCodForn.AsInteger;
      if DM1.tCPagarNroDuplicata.AsInteger > 0 then
        DM1.tCPagarParcNroDuplicata.AsInteger := DM1.tCPagarNroDuplicata.AsInteger
      else
        DM1.tCPagarParcNroDuplicata.AsInteger := 0;
      if DM1.tCPagarCodAtelier.AsInteger > 0 then
        DM1.tCPagarParcCodAtelier.AsInteger := DM1.tCPagarCodAtelier.AsInteger
      else
        DM1.tCPagarParcCodAtelier.AsInteger := 0;
      DM1.tCPagarParcDtVencCPagar.AsDateTime      := vData;
      DM1.tCPagarParcVlrParcCPagar.AsFloat        := CurrencyEdit3.Value;
      DM1.tCPagarParcRestParcela.AsFloat          := CurrencyEdit3.Value;
      DM1.tCPagarParcDtGerado.AsDateTime          := DM1.tCPagarDtGerado.AsDateTime;
      DM1.tCPagarParcCodCentroCusto.AsInteger     := DM1.tCPagarCodCentroCusto.AsInteger;
      DM1.tCPagarParcCodCentroCustoItem.AsInteger := DM1.tCPagarCodCentroCustoItem.AsInteger;

      DM1.tCPagarParc.Post;
      DM1.GravaEnt_tCPagarParcHist;
    end;
    CurrencyEdit3.Clear;
    CurrencyEdit4.Clear;
    CurrencyEdit5.Clear;
    DateEdit2.Clear;
    Close;
  end
  else
  begin
    ShowMessage('Deve ser informado "Valor", "Qtd. de Parcelas" e "Data Inicial", p/ executar esta função!');
    CurrencyEdit3.SetFocus;
  end;
end;

procedure TfLancaCPagarItens.RxDBLookupCombo6Enter(Sender: TObject);
begin
  if RxDBLookupCombo3.Text <> '' then
    RxDBLookupCombo6.ReadOnly := False
  else
    RxDBLookupCombo6.ReadOnly := True;
end;

procedure TfLancaCPagarItens.CheckBox1Click(Sender: TObject);
begin
  CurrencyEdit5.ReadOnly := CheckBox1.Checked;
  if CheckBox1.Checked then
    CurrencyEdit5.Clear;
end;

procedure TfLancaCPagarItens.BitBtn7Click(Sender: TObject);
begin
  Close;
end;

procedure TfLancaCPagarItens.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfLancaCPagarItens.FormShow(Sender: TObject);
begin
  TabSheet1.TabVisible := ((Tag = 0) or (Tag = 1));
  TabSheet2.TabVisible := (Tag = 10);

  if (Tag = 0) or (Tag = 1) then
    RzPageControl1.ActivePage := TabSheet1
  else
  if Tag = 10 then
    RzPageControl1.ActivePage := TabSheet2;
end;

procedure TfLancaCPagarItens.Limpar_Campos;
begin
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit3.Clear;
  CurrencyEdit4.Clear;
  CurrencyEdit5.Clear;
  CurrencyEdit6.Clear;
  DateEdit1.Clear;
  DateEdit2.Clear;
  RxDBLookupCombo1.ClearValue;
end;

end.
