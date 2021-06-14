unit UConsComissaoDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit, RxLookup, Grids, DBGrids, RXDBCtrl,
  Db, DBTables, ExtCtrls, RXCtrls, CurrEdit, MemTable, Variants, SMDBGrid,
  DBClient, RzTabs;

type
  TfConsComissaoDet = class(TForm)
    mVerifica: TMemoryTable;
    mVerificaNumNota: TIntegerField;
    mVerificaParcela: TIntegerField;
    mVerificaFilial: TIntegerField;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel9: TRxLabel;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit9: TCurrencyEdit;
    GroupBox3: TGroupBox;
    RxLabel7: TRxLabel;
    RxLabel1: TRxLabel;
    RxLabel10: TRxLabel;
    CurrencyEdit7: TCurrencyEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit10: TCurrencyEdit;
    GroupBox4: TGroupBox;
    RxLabel6: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel11: TRxLabel;
    CurrencyEdit6: TCurrencyEdit;
    CurrencyEdit8: TCurrencyEdit;
    CurrencyEdit11: TCurrencyEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure DateEdit2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsComissaoDet: TfConsComissaoDet;

implementation

uses UDM1, UPgtoComissao2, UConsComissao;

{$R *.DFM}

procedure TfConsComissaoDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfConsComissaoDet.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsComissaoDet.DateEdit2Exit(Sender: TObject);
begin
  RxLabel6.Caption := 'Saldo até a data ' + fConsComissao.DateEdit2.Text;
end;

procedure TfConsComissaoDet.BitBtn1Click(Sender: TObject);
begin
  mVerifica.EmptyTable;
  fConsComissao.qComissao.First;
  while not fConsComissao.qComissao.Eof do
    begin
      if fConsComissao.qComissaoNroDoc.AsInteger > 0 then
        begin
          if mVerifica.Locate('NumNota;Parcela;Filial',VarArrayOf([fConsComissao.qComissaoNroDoc.AsInteger,fConsComissao.qComissaoParcDoc.AsInteger,fConsComissao.qComissaoFilial.AsInteger]),[locaseinsensitive]) then
            ShowMessage('O documento: ' + fConsComissao.qComissaoNroDoc.AsString + '  esta repetido, verificar!')
          else
            begin
              mVerifica.Insert;
              mVerificaNumNota.AsInteger := fConsComissao.qComissaoNroDoc.AsInteger;
              mVerificaParcela.AsInteger := fConsComissao.qComissaoParcDoc.AsInteger;
              mVerificaFilial.AsInteger  := fConsComissao.qComissaoFilial.AsInteger;
              mVerifica.Post;
            end;
        end;
      fConsComissao.qComissao.Next;
    end;
end;

procedure TfConsComissaoDet.BitBtn4Click(Sender: TObject);
begin
  fPgtoComissao2 := TfPgtoComissao2.Create(Self);
  fPgtoComissao2.CurrencyEdit1.Value := CurrencyEdit6.Value;
  fPgtoComissao2.ShowModal;
end;

procedure TfConsComissaoDet.FormShow(Sender: TObject);
begin
  Top   := 0;
  Left  := 0;
  Width := Screen.Width;
  Height := Screen.Height - 35;

  Label2.Caption := fConsComissao.mResumidoNomeVendedor.AsString;

  CurrencyEdit2.Value := fConsComissao.mResumidoVlrEntrada.AsFloat;
  CurrencyEdit3.Value := fConsComissao.mResumidoVlrSaida.AsFloat;
  CurrencyEdit4.Value := fConsComissao.mResumidoVlrDevolucao.AsFloat;
  CurrencyEdit9.Value := fConsComissao.mResumidoVlrIRPeriodo.AsFloat;
  CurrencyEdit5.Value := fConsComissao.mResumidoVlrTotalPeriodo.AsFloat;

  CurrencyEdit1.Value  := fConsComissao.mResumidoSaldoAnt.AsFloat;
  CurrencyEdit7.Value  := fConsComissao.mResumidoVlrIRAnt.AsFloat;
  CurrencyEdit10.Value := fConsComissao.mResumidoVlrTotalAnt.AsFloat;
  CurrencyEdit6.Value  := fConsComissao.mResumidoSaldoAcumulado.AsFloat;
  CurrencyEdit11.Value := fConsComissao.mResumidoVlrIRAcumulado.AsFloat;
  CurrencyEdit8.Value  := fConsComissao.mResumidoVlrTotalAcumulado.AsFloat;
end;

end.
