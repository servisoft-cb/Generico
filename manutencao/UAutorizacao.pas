unit UAutorizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls;

type
  TfAutorizacao = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Autoriza_Data;
  public
    { Public declarations }
  end;

var
  fAutorizacao: TfAutorizacao;

implementation

uses UDM1, UMenuP;

{$R *.DFM}

procedure TfAutorizacao.Autoriza_Data;
var
  Digitos : Array[1..9] of integer;
  MesInicial, Ano, i : integer;
  Soma, Auto : string[15];
  Info : String[7];
begin
  Info       := FormatFloat('000',DM1.tEmpresaCodigo.AsInteger);
  Info       := Info + Copy(DateEdit1.Text,1,2) + Copy(DateEdit1.Text,4,2) + Copy(DateEdit1.Text,9,2);
  Auto       := '0';
  Soma       := '0';
  MesInicial := StrToInt(Copy(Info,4,3));
  Ano        := StrToInt(Copy(Info,7,3));
  Digitos[1] := StrToInt(Copy(Info,1,1));
  Digitos[2] := StrToInt(Copy(Info,2,1));
  Digitos[3] := StrToInt(Copy(Info,3,1));
  Digitos[4] := StrToInt(Copy(Info,4,1));
  Digitos[5] := StrToInt(Copy(Info,5,1));
  Digitos[6] := StrToInt(Copy(Info,4,1));
  Digitos[7] := StrToInt(Copy(Info,5,1));
  Digitos[8] := StrToInt(Copy(Info,6,1));
  Digitos[9] := StrToInt(Copy(Info,7,1));
  for i := 1 to 9 do
    begin
      Auto := Copy(FormatFloat('000000000000000',(StrToInt(Auto) + (Digitos[i] * 3))),10,6);
      Soma := Copy(FormatFloat('000000000000000',StrToInt(Soma) + (Digitos[i] * i)),10,6);
    end;
  Auto := Copy(FormatFloat('000000000000000',(StrToInt(Auto) * StrToInt(Soma))),10,6);
  if Ano > 0 then
    Auto := Copy(FormatFloat('000000000000000',(StrToInt(Auto) * Ano)),10,6);
  if Digitos[7] > 0 then
    Auto := Copy(FormatFloat('000000000000000',(StrToInt(Auto) * Digitos[7])),10,6);
  Auto := IntToStr(StrToInt(Auto) * MesInicial);
  if Digitos[9] > 0 then
    Auto := Copy(FormatFloat('000000000000000',(StrToInt(Auto) * Digitos[9])),10,6);
  if Length(Auto) > 6 then
    Delete(Auto,1,Length(Auto)-6);
  if Edit1.Text <> Auto then
    begin
      ShowMessage('Data não confere com senha colocada!');
      Application.Terminate;
    end
  else
    begin
      DM1.tEmpresa.Edit;
      DM1.tEmpresaData.AsDateTime := DateEdit1.Date - 10;
      DM1.tEmpresa.Post;
    end;
  Close;
end;

procedure TfAutorizacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfAutorizacao.BitBtn1Click(Sender: TObject);
begin
  Autoriza_Data;
end;

procedure TfAutorizacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssALt]) and (Key = vk_F4) then
    Application.Terminate;
end;

end.
