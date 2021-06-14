unit UCupomFiscalOpcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfCupomFiscalOpcoes = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCupomFiscalOpcoes: TfCupomFiscalOpcoes;

implementation

uses uUtilCupomFiscal, UDaruma_iMFLer_ECF, UDaruma_iMFLerSerial_ECF;

{$R *.dfm}

procedure TfCupomFiscalOpcoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfCupomFiscalOpcoes.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfCupomFiscalOpcoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
  begin
    ComboBox1.Visible := not(ComboBox1.Visible);
    ComboBox2.Visible := not(ComboBox2.Visible);
  end;
end;

procedure TfCupomFiscalOpcoes.BitBtn1Click(Sender: TObject);
begin
  prc_LeituraX_Daruma(ComboBox1.ItemIndex + 1);
end;

procedure TfCupomFiscalOpcoes.BitBtn2Click(Sender: TObject);
begin
  prc_ReducaoZ_Daruma;
end;

procedure TfCupomFiscalOpcoes.BitBtn3Click(Sender: TObject);
begin
  if ComboBox2.ItemIndex = 0 then
  begin
    fDaruma_iMFLer_ECF := TfDaruma_iMFLer_ECF.Create(Self);
    fDaruma_iMFLer_ECF.ShowModal;
  end
  else
  if ComboBox2.ItemIndex = 1 then
  begin
    fDaruma_iMFLerSerial_ECF := TfDaruma_iMFLerSerial_ECF.Create(Self);
    fDaruma_iMFLerSerial_ECF.ShowModal;
  end;
end;

end.
