unit UNotaFiscalNumNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ToolEdit, CurrEdit, Buttons, ExtCtrls,
  DB, DBTables;

type
  TfNotaFiscalNumNota = class(TForm)
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label12: TLabel;
    Label15: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label46: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qNota: TQuery;
    qNotaFilial: TIntegerField;
    qNotaNumNota: TIntegerField;
    qNotaSerie: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNotaFiscalNumNota: TfNotaFiscalNumNota;

implementation

uses UDM1;

{$R *.dfm}

procedure TfNotaFiscalNumNota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfNotaFiscalNumNota.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfNotaFiscalNumNota.BitBtn1Click(Sender: TObject);
begin
  if CurrencyEdit1.AsInteger <= 0 then
  begin
    ShowMessage('Número da nota não informado!');
    exit;
  end;

  if MessageDlg('Confirma o número na nota?',mtConfirmation,[mbOK,mbNo],0) = mrNo then
    exit;

  if Trim(Edit1.Text) <> '' then
    DM1.tNotaFiscalSerie.AsString := Trim(Edit1.Text)
  else
    DM1.tNotaFiscalSerie.AsString    := DM1.tParametrosSerieNormal.AsString;

  DM1.tNotaFiscalNumNota.AsInteger              := CurrencyEdit1.AsInteger;
  DM1.tNotaFiscalInfNumNotaManual.AsBoolean     := True;
  DM1.tNotaFiscalNFeRecibo.AsString             :=  Edit2.Text;
  DM1.tNotaFiscalNFeProtocolo.AsString          :=  Edit3.Text;
  DM1.tNotaFiscalNFeChaveAcesso.AsString        :=  Edit4.Text;
  if Trim(Edit5.Text) <> '' then
    DM1.tNotaFiscalNFeProtocoloCancelada.AsString :=  Edit5.Text;
  DM1.tNotaFiscalNFeCodBarraCont.AsString       := Edit6.Text;
  DM1.tNotaFiscal.Post;

  DM1.tNotaFiscal.Edit;
  Close;
end;

procedure TfNotaFiscalNumNota.FormShow(Sender: TObject);
begin
  Edit1.Text := DM1.tParametrosSerieNormal.AsString;
end;

end.
