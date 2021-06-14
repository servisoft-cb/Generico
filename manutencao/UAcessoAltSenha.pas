unit UAcessoAltSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RXCtrls, StdCtrls, Buttons;

type
  TfAcessoAltSenha = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxLabel3: TRxLabel;
    Edit3: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAcessoAltSenha: TfAcessoAltSenha;

implementation

uses UDM1;

{$R *.DFM}

procedure TfAcessoAltSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfAcessoAltSenha.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Edit3.SetFocus;
end;

procedure TfAcessoAltSenha.BitBtn1Click(Sender: TObject);
begin
  if Trim(Edit3.Text) = '' then
    begin
      ShowMessage('Não foi informada uma senha nova!');
      Edit3.SetFocus;
      exit;
    end;
  if Trim(Edit1.Text) = '' then
    begin
      ShowMessage('Não foi informado um usuário!');
      exit;
    end;

  DM1.tUsuario.SetKey;
  DM1.tUsuarioUsuario.AsString := Edit1.Text;
  if not DM1.tUsuario.GotoKey then
    begin
      ShowMessage('Usuário não cadastrado!');
      exit;
    end;
  if DM1.tUsuarioSenha.AsString <> Edit2.Text then
    begin
      ShowMessage('Senha não confere!');
      exit;
    end;

  DM1.tUsuario.Edit;
  DM1.tUsuarioSenha.AsString := Edit3.Text;
  DM1.tUsuario.Post;
  
  ShowMessage('Senha Alterada!');
  Close;
end;

procedure TfAcessoAltSenha.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Edit2.SetFocus;
end;

procedure TfAcessoAltSenha.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
