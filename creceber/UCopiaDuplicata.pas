unit UCopiaDuplicata;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, Buttons, Db,
  DBTables, MemTable, ValorPor, RxLookup, RXCtrls, Menus;

type
  TfCopiaDuplicata = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label2: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    mDuplicata: TMemoryTable;
    mDuplicataNumNota: TIntegerField;
    mDuplicataParcela: TIntegerField;
    mDuplicataVcto: TDateTimeField;
    mDuplicataCodCliente: TIntegerField;
    mDuplicataVlrParcela: TFloatField;
    mDuplicataVlrTotal: TFloatField;
    mDuplicatalkNomeCliente: TStringField;
    mDuplicatalkEndereco: TStringField;
    mDuplicatalkBairro: TStringField;
    mDuplicatalkCidade: TStringField;
    mDuplicatalkUf: TStringField;
    mDuplicatalkCep: TStringField;
    mDuplicatalkEndPgto: TStringField;
    mDuplicatalkCidPgto: TStringField;
    mDuplicatalkUfPgto: TStringField;
    mDuplicatalkCepPgto: TStringField;
    mDuplicatalkCnpj: TStringField;
    mDuplicatalkInscrEst: TStringField;
    ValorPorExtenso1: TValorPorExtenso;
    mDuplicataDtEmissao: TDateTimeField;
    mDuplicatalkTelefone: TStringField;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    PopupMenu1: TPopupMenu;
    MSDOS1: TMenuItem;
    Windows1: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MSDOS1Click(Sender: TObject);
    procedure Windows1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Gera_Dados;
    procedure Imprime_Dup;
    procedure Imprimir_Dos;
    procedure Imprimir_Windows;
  public
    { Public declarations }
  end;

var
  fCopiaDuplicata: TfCopiaDuplicata;
  F: TextFile;

implementation

uses UDM1, UEscImpressora, URelDuplicata;

{$R *.DFM}

procedure TfCopiaDuplicata.Imprimir_Windows;
begin
  DM1.tCReceber.Filtered := False;
  DM1.tCReceber.Filter   := 'NumNota >= '''+CurrencyEdit1.Text+''' and NumNota <= '''+CurrencyEdit2.Text+'''';
  DM1.tCReceber.Filtered := True;

  fRelDuplicata := TfRelDuplicata.Create(Self);
  fRelDuplicata.QuickRep1.Preview;
  fRelDuplicata.QuickRep1.Free;
end;

procedure TfCopiaDuplicata.Imprimir_Dos;
var
  Texto : String;
begin
  if (CurrencyEdit1.Value > 0) and (Currencyedit2.Value > 0) then
    begin
      Gera_Dados;
      if not mDuplicata.IsEmpty then
        begin
          fEscImpressora := TfEscImpressora.Create(Self);
          fEscImpressora.ShowModal;
          AssignFile(F,DM1.tImpressoraEndereco.AsString);
          ReWrite(F);
          mDuplicata.First;
          while not mDuplicata.Eof do
            begin
              Imprime_Dup;
              mDuplicata.Next;
            end;
          CloseFile(F);
          if DM1.tImpressoraVisualizar.AsBoolean then
            begin
              Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
              WinExec(PChar(Texto),SW_MAXIMIZE);
            end;
        end;
    end
  else
    begin
      ShowMessage('Você deve informar Notas "Inicial" e "Final", p/ gerar a impressão!');
      CurrencyEdit1.SetFocus;
    end;
end;

procedure TfCopiaDuplicata.Gera_Dados;
begin
  mDuplicata.EmptyTable;
  DM1.tNotaFiscal.Filtered := False;
  DM1.tNotaFiscal.Filter   := 'NumNota >= '''+CurrencyEdit1.Text+''' and NumNota <= '''+CurrencyEdit2.Text+''' and Cancelada <> True';
  DM1.tNotaFiscal.Filtered := True;
  DM1.tNotaFiscal.First;
  while not DM1.tNotaFiscal.Eof do
    begin
      if DM1.tNotaFiscallkGeraDuplicata.AsBoolean then
        begin
          if DM1.tNotaFiscalCondPgto.AsString = 'P' then
            begin
              if DM1.tNotaFiscalEntrada.AsFloat > 0 then
                begin
                  mDuplicata.Insert;
                  mDuplicataCodCliente.AsInteger := DM1.tNotaFiscalCodCli.AsInteger;
                  mDuplicataDtEmissao.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
                  mDuplicataNumNota.AsInteger    := DM1.tNotaFiscalNumNota.AsInteger;
                  mDuplicataParcela.AsInteger    := 0;
                  mDuplicataVcto.AsDateTime      := DM1.tNotaFiscalDtEntr.AsDateTime;
                  mDuplicataVlrParcela.AsFloat   := DM1.tNotaFiscalEntrada.AsFloat;
                  mDuplicataVlrTotal.AsFloat     := DM1.tNotaFiscalVlrTotalNota.AsFloat;
                  mDuplicata.Post;
                end;
              DM1.tNotaFiscalParc.First;
              while not DM1.tNotaFiscalParc.Eof do
                begin
                  mDuplicata.Insert;
                  mDuplicataCodCliente.AsInteger := DM1.tNotaFiscalCodCli.AsInteger;
                  mDuplicataDtEmissao.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
                  mDuplicataNumNota.AsInteger    := DM1.tNotaFiscalNumNota.AsInteger;
                  mDuplicataParcela.AsInteger    := DM1.tNotaFiscalParcParcela.AsInteger;
                  mDuplicataVcto.AsDateTime      := DM1.tNotaFiscalParcDtVenc.AsDateTime;
                  mDuplicataVlrParcela.AsFloat   := DM1.tNotaFiscalParcVlrVenc.AsFloat;
                  mDuplicataVlrTotal.AsFloat     := DM1.tNotaFiscalVlrTotalNota.AsFloat;
                  mDuplicata.Post;
                  DM1.tNotaFiscalParc.Next;
                end;
            end
          else
          if DM1.tNotaFiscalCondPgto.AsString = 'V' then
            begin
              mDuplicata.Insert;
              mDuplicataCodCliente.AsInteger := DM1.tNotaFiscalCodCli.AsInteger;
              mDuplicataDtEmissao.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
              mDuplicataNumNota.AsInteger    := DM1.tNotaFiscalNumNota.AsInteger;
              mDuplicataParcela.AsInteger    := 0;
              mDuplicataVcto.AsDateTime      := DM1.tNotaFiscalDtEmissao.AsDateTime;
              mDuplicataVlrParcela.AsFloat   := DM1.tNotaFiscalVlrTotalNota.AsFloat;
              mDuplicataVlrTotal.AsFloat     := DM1.tNotaFiscalVlrTotalNota.AsFloat;
              mDuplicata.Post;
            end;
        end;
      DM1.tNotaFiscal.Next;
    end;
  DM1.tNotaFiscal.Filtered := False;
end;

procedure TfCopiaDuplicata.Imprime_Dup;
var
 i : Integer;
 texto1, texto2 : String;
begin
  Writeln(F,' ----------------------------------------------------------------------------------------------------------------------------------');
  texto1 := DM1.tFilialEmpresa.AsString;
  for i := 1 to 60 - Length(texto1) do
    texto1 := texto1 + ' ';
  texto1 := '| ' + texto1 + ' | ';
  texto2 := DM1.tFilialEndereco.AsString;
  for i := 1 to 60 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '      |';
  writeln(F,texto1);

  texto2 := '| CNPJ: ' + DM1.tFilialCNPJ.AsString;
  for i := 1 to 63 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto2 + '| ';
  texto2 := DM1.tFilialCidade.AsString;
  for i := 1 to 35 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '-     ';
  texto2 := DM1.tFilialEstado.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '                       |';
  writeln(F,texto1);

  texto2 := '| Inscricao Estadual: ' + DM1.tFilialInscr.AsString;
  for i := 1 to 63 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto2 + '| CEP: ';
  texto2 := DM1.tFilialCep.AsString;
  for i := 1 to 9 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '   Fone: ';
  texto2 := DM1.tFilialTel.AsString;
  for i := 1 to 16 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + 'Fax: ';
  texto2 := DM1.tFilialFax.AsString;
  for i := 1 to 22 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '|';
  writeln(F,texto1);

  writeln(F,'|----------------------------------------------------------------------------------------------------------------------------------');
  writeln(F,'|              F A T U R A           ||   D U P L I C A T A             ||      DATA      |  --------------------------------------');
  writeln(F,'|------------------------------------||---------------------------------||                | |              PARA USO DA             |');
  writeln(F,'|      VALOR      |   NUMERO         ||      VALOR     |     NUMERO     ||   VENCIMENTO   | |        INSTITUICAO FINANCEIRA        |');
  writeln(F,'|-----------------|------------------||----------------|----------------||                | |                                      |');

  texto2 := FormatFloat('###,###,##0.00',mDuplicataVlrTotal.AsFloat);
  for i := 1 to 14 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := '| ' + texto2 + '  |  ';
  texto2 := mDuplicataNumNota.AsString;
  for i := 1 to 8 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '        || ';
  texto2 := FormatFloat('###,###,##0.00',mDuplicataVlrParcela.AsFloat);
  for i := 1 to 14 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' | ';
  texto2 := mDuplicataNumNota.AsString;
  for i := 1 to 8 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' / ';
  texto2 := mDuplicataParcela.AsString;
  for i := 1 to 3 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + ' ||   ';
  texto2 := mDuplicataVcto.AsString;
  for i := 1 to 10 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '   | |                                      |';
  writeln(F,texto1);

  writeln(F,' -----------------------------------------------------------------------------------------  |                                      |');
  writeln(F,'| DESCONTO DE:                                      ATE:                                  | |                                      |');
  writeln(F,'| CONDICOES ESPECIAIS:                                                                    | |                                      |');
  writeln(F,' -----------------------------------------------------------------------------------------   --------------------------------------');

  texto1 := '|                  || Nome do Sacado: ';
  texto2 := mDuplicatalkNomeCliente.AsString;
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '                                        -  ';
  texto2 := mDuplicataCodCliente.AsString;
  for i := 1 to 6 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 +  '    |';
  writeln(F,texto1);

  texto1 := '|                  || Endereco......: ';
  texto2 := mDuplicatalkEndereco.AsString;
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '      ';
  texto2 := mDuplicatalkBairro.AsString;
  for i := 1 to 25 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '                      |';
  writeln(F,texto1);

  texto1 := '|           |      || Municipio.....: ';
  texto2 := mDuplicatalkCidade.AsString;
  for i := 1 to 26 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '                    Estado: ';
  texto2 := mDuplicatalkUf.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '             CEP: ';
  texto2 := mDuplicatalkCep.AsString;
  for i := 1 to 10 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '         |';
  writeln(F,texto1);

  texto1 := '|           |      || Praca de Pagto: ';
  texto2 := mDuplicatalkEndPgto.AsString;
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '      ';
  texto2 := mDuplicatalkCidPgto.AsString;
  for i := 1 to 26 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + ' - ';
  texto2 := mDuplicatalkUfPgto.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + ' - ';
  texto2 := mDuplicatalkCepPgto.AsString;
  for i := 1 to 10 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '   |';
  writeln(F,texto1);

  texto1 := '|           |      || Inscr. C.N.P.J: ';
  texto2 := mDuplicatalkCnpj.AsString;
  for i := 1 to 18 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '  Fone: ';
  Texto2 := mDuplicatalkTelefone.AsString;
  for i := 1 to 20 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + 'Inscr.Estadual: ';
  texto2 := mDuplicatalkInscrEst.AsString;
  for i := 1 to 14 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '                 |';
  writeln(F,texto1);

  writeln(F,'|           |      | --------------------------------------------------------------------------------------------------------------|');

  texto1 := '|           |      ||   VALOR  |';
  ValorPorExtenso1.Valor := mDuplicataVlrParcela.AsFloat;
  texto2 := ValorPorExtenso1.Texto;
  for i := 1 to 250 - Length(texto2) do
    texto2 := texto2 + '*';
  texto1 := texto1 + Copy(Texto2,1,90) + '         |';
  writeln(F,texto1);

  texto1 := '|           |      ||    POR   | ' + Copy(Texto2,91,90) + '        |';
  writeln(F,texto1);

  texto1 := '|           |      ||  EXTENSO | ' + Copy(Texto2,181,70) + '                            |';
  writeln(F,texto1);

  writeln(F,'|           |      | --------------------------------------------------------------------------------------------------------------');
  writeln(F,'|           |      || Reconheco(emos) a exatidao desta DUPLICATA DE VENDA MERCANTIL, na importancia acima, que pagarei(emos) a     |');

  texto1 := '|           |      || ';
  texto2 := DM1.tFilialEmpresa.AsString;
  for i := 1 to 60 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '., na praca e vencimento acima indicados         |';
  writeln(F,texto1);

  writeln(F,'|           |      ||                                                                                                              |');

  texto1 := '|           |      ||           ';
  texto2 := mDuplicataDtEmissao.AsString;
  for i := 1 to 10 - length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '                               ________________________________________________          |';
  writeln(F,texto1);
  //writeln(F,'|           |      ||   ___________/___________/___________              ________________________________________________          |');
  writeln(F,'|                  ||         Data do aceite                                           Assinatura do Sacado                        |');
  writeln(F,' ------------------  --------------------------------------------------------------------------------------------------------------');
  writeln(F);
  writeln(F);
  writeln(F);
end;

procedure TfCopiaDuplicata.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tCliente.Close;
  DM1.tNotaFiscal.Close;
  DM1.tNotaFiscalParc.Close;
  Action := Cafree;
end;

procedure TfCopiaDuplicata.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfCopiaDuplicata.BitBtn2Click(Sender: TObject);
begin
  CurrencyEdit1.Value := 0;
  CurrencyEdit2.Value := 0;
  CurrencyEdit1.SetFocus;
end;

procedure TfCopiaDuplicata.FormShow(Sender: TObject);
begin
  DM1.tCliente.Open;
  DM1.tNotaFiscal.Open;
  DM1.tNotaFiscalParc.Open;
  DM1.tCReceber.Open;
  DM1.tCReceberParc.Open;
end;

procedure TfCopiaDuplicata.MSDOS1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
    begin
      ShowMessage('É obrigatório informar a filial!');
      exit;
    end;
  Imprimir_Dos;
end;

procedure TfCopiaDuplicata.Windows1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
    begin
      ShowMessage('É obrigatório informar a filial!');
      exit;
    end;
  Imprimir_Windows;
end;

end.
