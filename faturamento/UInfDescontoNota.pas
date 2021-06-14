unit UInfDescontoNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, ToolEdit, CurrEdit,
  Grids, DBGrids, SMDBGrid;

type
  TfInfDescontoNota = class(TForm)
    Label47: TLabel;
    Label54: TLabel;
    DBEdit23: TDBEdit;
    Label48: TLabel;
    BitBtn1: TBitBtn;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    cePercentual: TCurrencyEdit;
    BitBtn7: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure CurrencyEdit2Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fInfDescontoNota: TfInfDescontoNota;

implementation

uses UDM1, UEmissaoNotaFiscal, DB, UDMNotaFiscal, Math;

{$R *.dfm}

procedure TfInfDescontoNota.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfInfDescontoNota.BitBtn1Click(Sender: TObject);
var
  vVlrDescAux : Currency;
  vVlrDuplAux, vAux : Currency;
  vVlrDesconto : Currency;
begin
  vVlrDescAux := DM1.tNotaFiscalVlrTotalDesc.AsCurrency;

  vVlrDesconto := 0;
  if StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDupl.AsCurrency)) > 0 then
    vVlrDuplAux  := DM1.tNotaFiscalVlrTotalDupl.AsCurrency + DM1.tNotaFiscalVlrTotalDesc.AsFloat - DM1.tNotaFiscalVlrIpi.AsFloat
  else
    vVlrDuplAux  := DM1.tNotaFiscalVlrTotalNota.AsCurrency + DM1.tNotaFiscalVlrTotalDesc.AsFloat - DM1.tNotaFiscalVlrIpi.AsFloat;
  DMNotaFiscal.tNotaFiscalTBDesconto.First;
  while not DMNotaFiscal.tNotaFiscalTBDesconto.Eof do
    begin
      vAux := StrToFloat(FormatFloat('0.00',(vVlrDuplAux * DMNotaFiscal.tNotaFiscalTBDescontoPercDesconto.AsCurrency) / 100));
      vVlrDesconto := vVlrDesconto + vAux;
      vVlrDuplAux  := vVlrDuplAux - vAux;

      DMNotaFiscal.tNotaFiscalTBDesconto.Next;
    end;

  if vVlrDesconto > 0 then
  begin
    DMNotaFiscal.tNotaFiscalTBDesconto.First;
    CurrencyEdit2.Value := vVlrDesconto;
    if DMNotaFiscal.tNotaFiscalTBDesconto.RecordCount < 2 then
      CurrencyEdit1.Value := DMNotaFiscal.tNotaFiscalTBDescontoPercDesconto.AsFloat
    else
      CurrencyEdit2Exit(Sender);
  end;

  DM1.tNotaFiscalPercDesc.AsCurrency     := CurrencyEdit1.Value;
  DM1.tNotaFiscalVlrTotalDesc.AsCurrency := CurrencyEdit2.Value;

  //NFe 2.00 aqui 2
  {if DM1.tNotaFiscalVlrTotalDesc.AsCurrency <> 0 then
    fEmissaoNotaFiscal.Calcula_Desconto(True,vVlrDescAux)
  else
    fEmissaoNotaFiscal.Calcula_Desconto(False,vVlrDescAux);
  DM1.tNotaFiscalBaseIcms.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalBaseIcms.AsFloat));
  DM1.tNotaFiscalVlrIcms.AsFloat  := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrIcms.AsFloat));}

  if (CurrencyEdit1.Value > 0) and (CurrencyEdit2.Value > 0) and (DBEdit23.Text = '') then
    DM1.tNotaFiscalDescricaoDesc.AsString := 'Desconto: ';

  if DM1.tNotaFiscal.State in [dsEdit,dsInsert] then
  begin
    if StrToFloat(FormatFloat('0.0000',DM1.tNotaFiscalVlrTotalDesc.AsFloat)) > 0 then
      DM1.tNotaFiscalTipoDesconto.AsString := 'N'
    else
      DM1.tNotaFiscalTipoDesconto.AsString := '';
  end;

  Close;
end;

procedure TfInfDescontoNota.FormShow(Sender: TObject);
begin
  CurrencyEdit1.Value := DM1.tNotaFiscalPercDesc.AsCurrency;
  CurrencyEdit2.Value := DM1.tNotaFiscalVlrTotalDesc.AsCurrency;
  if (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDesc.AsFloat)) > 0) and (StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalPercDesc.AsFloat)) <= 0) then
    CurrencyEdit1.Value := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalPercDescontoOrig.AsFloat))
end;

procedure TfInfDescontoNota.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfInfDescontoNota.CurrencyEdit1Exit(Sender: TObject);
begin
  if CurrencyEdit1.Value > 0 then
  begin
    if StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDupl.AsCurrency)) > 0 then
      CurrencyEdit2.Value := (DM1.tNotaFiscalVlrTotalDupl.AsCurrency + DM1.tNotaFiscalVlrTotalDesc.AsCurrency - DM1.tNotaFiscalVlrIpi.AsFloat)* CurrencyEdit1.Value / 100
    else
      CurrencyEdit2.Value := (DM1.tNotaFiscalVlrTotalNota.AsCurrency + DM1.tNotaFiscalVlrTotalDesc.AsCurrency - DM1.tNotaFiscalVlrIpi.AsFloat)* CurrencyEdit1.Value / 100;
  end
  else
    CurrencyEdit2.Clear;
end;

procedure TfInfDescontoNota.CurrencyEdit2Exit(Sender: TObject);
begin
  if CurrencyEdit2.Value > 0 then
  begin
    if StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalDupl.AsCurrency)) > 0 then
      CurrencyEdit1.Value := CurrencyEdit2.Value * 100 / (DM1.tNotaFiscalVlrTotalDupl.AsCurrency + DM1.tNotaFiscalVlrTotalDesc.AsCurrency - DM1.tNotaFiscalVlrIpi.AsFloat)
    else
      CurrencyEdit1.Value := CurrencyEdit2.Value * 100 / (DM1.tNotaFiscalVlrTotalNota.AsCurrency + DM1.tNotaFiscalVlrTotalDesc.AsCurrency - DM1.tNotaFiscalVlrIpi.AsFloat);
  end
  else
    CurrencyEdit1.Clear;
end;

procedure TfInfDescontoNota.BitBtn7Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  if cePercentual.Value <= 0 then
  begin
    ShowMessage('Não foi informado o % de desconto!');
    exit;
  end;

  DMNotaFiscal.tNotaFiscalTBDesconto.Last;
  vItemAux := DMNotaFiscal.tNotaFiscalTBDescontoItem.AsInteger;
  DMNotaFiscal.tNotaFiscalTBDesconto.Insert;
  DMNotaFiscal.tNotaFiscalTBDescontoFilial.AsInteger := DM1.tNotaFiscalFilial.AsInteger;
  DMNotaFiscal.tNotaFiscalTBDescontoNumSeq.AsInteger := DM1.tNotaFiscalNumSeq.AsInteger;
  DMNotaFiscal.tNotaFiscalTBDescontoItem.AsInteger   := vItemAux + 1;
  DMNotaFiscal.tNotaFiscalTBDescontoPercDesconto.AsFloat := cePercentual.Value; 
  DMNotaFiscal.tNotaFiscalTBDesconto.Post;

  cePercentual.SetFocus;
end;

procedure TfInfDescontoNota.BitBtn3Click(Sender: TObject);
begin
  if DMNotaFiscal.tNotaFiscalTBDesconto.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir o percentual?',mtWarning,[mbOK,mbNO],0) = mrNo then
    exit;

  DMNotaFiscal.tNotaFiscalTBDesconto.Delete;
end;

end.
