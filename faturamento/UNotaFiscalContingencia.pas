unit UNotaFiscalContingencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, RXCtrls, StdCtrls, DBCtrls, ExtCtrls, Mask, Buttons, ToolEdit, RXDBCtrl,
  RzEdit, RzDBEdit;

type
  TfNotaFiscalContingencia = class(TForm)
    RxLabel2: TRxLabel;
    BitBtn5: TBitBtn;
    DBMemo2: TDBMemo;
    RxLabel1: TRxLabel;
    DBDateEdit1: TDBDateEdit;
    RxLabel3: TRxLabel;
    RzDBDateTimeEdit2: TRzDBDateTimeEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBMemo2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNotaFiscalContingencia: TfNotaFiscalContingencia;

implementation

uses UDM1;

{$R *.DFM}

procedure TfNotaFiscalContingencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfNotaFiscalContingencia.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfNotaFiscalContingencia.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not DBMemo2.ReadOnly then
  begin
    if DM1.tNotaFiscalDtContingencia.AsDateTime < 10 then
    begin
      ShowMessage('Data da contingência não foi informada!');
      CanClose := False;
    end
    else
    if Length(DM1.tNotaFiscalMotivoContingencia.AsString) < 1 then
    begin
      ShowMessage('Motivo da contingência não foi informado!');
      CanClose := False;
    end
    else
      CanClose := True;
  end
  else
    CanClose := True;
end;

procedure TfNotaFiscalContingencia.DBMemo2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    Key := ' ';
end;

end.
