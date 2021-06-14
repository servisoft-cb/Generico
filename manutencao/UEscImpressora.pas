unit UEscImpressora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ExtCtrls, RxLookup;

type
  TfEscImpressora = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    SpeedButton1: TSpeedButton;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEscImpressora: TfEscImpressora;

implementation

uses UDM1, UImpressora;

{$R *.DFM}

procedure TfEscImpressora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfEscImpressora.BitBtn1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
    begin
      ShowMessage('Deve ser escolhido uma impressora!');
      RxDBLookupCombo1.SetFocus;
    end
  else
   Close;
end;

procedure TfEscImpressora.FormShow(Sender: TObject);
begin
  if not DM1.tImpressora.Active then
    DM1.tImpressora.Open;
  RxDBLookupCombo1.KeyValue := 1;
end;

procedure TfEscImpressora.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioImpressoras.AsBoolean then
    begin
      fImpressora := TfImpressora.Create(Self);
      fImpressora.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

end.
