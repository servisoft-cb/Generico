unit UEscAtelier;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RxLookup, Buttons;

type
  TfEscAtelier = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEscAtelier: TfEscAtelier;

implementation

uses UDM1, UAtelier;

{$R *.DFM}

procedure TfEscAtelier.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfEscAtelier.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tAtelier.IndexFieldNames := 'Atelier';
end;

procedure TfEscAtelier.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tAtelier.IndexFieldNames := 'Codigo';
end;

procedure TfEscAtelier.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioAtelier.AsBoolean then
    begin
      fAtelier := TfAtelier.Create(Self);
      fAtelier.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfEscAtelier.BitBtn1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
    begin
      ShowMessage('Deve ser escolhido um atelier!');
      RxDBLookupCombo1.SetFocus;
    end
  else
   Close;
end;

procedure TfEscAtelier.RxDBLookupCombo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (RxDBLookupCombo1.Text <> '')  then
    begin
      RxDBLookupCombo1.CloseUp(True);
      if RxDBLookupCombo1.Text <> '' then
        close;
    end;
end;

end.
