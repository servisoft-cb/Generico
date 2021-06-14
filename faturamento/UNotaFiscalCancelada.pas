unit UNotaFiscalCancelada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXCtrls, StdCtrls, DBCtrls, ExtCtrls, Mask, Buttons;

type
  TfNotaFiscalCancelada = class(TForm)
    RxLabel1: TRxLabel;
    DBText1: TDBText;
    Bevel1: TBevel;
    RxLabel2: TRxLabel;
    DBEdit1: TDBEdit;
    BitBtn5: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNotaFiscalCancelada: TfNotaFiscalCancelada;

implementation

uses UDM1;

{$R *.DFM}

procedure TfNotaFiscalCancelada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfNotaFiscalCancelada.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfNotaFiscalCancelada.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not DBEdit1.ReadOnly then
  begin
    if Length(DM1.tNotaFiscalMotivoCanc.AsString) < 16 then
      begin
        ShowMessage('Motivo do cancelamento deve ter no minimo 16 caracteres!');
        CanClose := False;
      end
    else
      CanClose := True;
  end
  else
    CanClose := True;
end;

end.
