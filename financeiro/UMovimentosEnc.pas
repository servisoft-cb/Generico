unit UMovimentosEnc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls, DB;

type
  TfMovimentosEnc = class(TForm)
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label3: TLabel;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMovimentosEnc: TfMovimentosEnc;

implementation

uses UDM1;

{$R *.dfm}

procedure TfMovimentosEnc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfMovimentosEnc.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMovimentosEnc.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DateEdit1.Clear;
  DateEdit2.Clear;
  if (RxDBLookupCombo1.Text <> '') and (DM1.tContas.Locate('CodConta',RxDBLookupCombo1.KeyValue,[loCaseInsensitive])) then
    DateEdit1.Date := DM1.tContasDtEncerramento.AsDateTime;
end;

procedure TfMovimentosEnc.BitBtn1Click(Sender: TObject);
begin
  if DateEdit2.Date < 10 then
  begin
    ShowMessage('Data de encerramento não pode ser zerada!');
    exit;
  end;

  if DateEdit2.Date < DateEdit1.Date then
    if MessageDlg('Data de encerramento menor que a anterior, confirmar?',mtconfirmation,[mbok,mbno],0) = mrNo then
      exit;

  DM1.tContas.Edit;
  DM1.tContasDtEncerramento.AsDateTime := DateEdit2.Date;
  DM1.tContas.Post;

  Close;
end;

end.
