unit UEscFilial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RxLookup, Buttons;

type
  TfEscFilial = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEscFilial: TfEscFilial;

implementation

uses UDM1, UDM2, UFilial;

{$R *.DFM}

procedure TfEscFilial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfEscFilial.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFilial.IndexFieldNames := 'Empresa';
end;

procedure TfEscFilial.FormShow(Sender: TObject);
begin
  DM1.tFilial.Open;

  RxDBLookupCombo1.KeyValue   := DM1.tFilialCodigo.AsInteger;
end;

procedure TfEscFilial.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioFilial.AsBoolean then
    begin
      fFilial := TfFilial.Create(Self);
      fFilial.ShowModal;
    end
  else
    ShowMessage('Usuário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a abrir o formulário de filiais!');
end;

procedure TfEscFilial.BitBtn1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    Close
  else
    begin
      ShowMessage('Você deve escolher uma "Filial" p/ confirmar a seleção!');
      RxDBLookupCombo1.SetFocus;
    end;
end;

procedure TfEscFilial.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  //NFe 2.00
  if RxDBLookupCombo1.Text <> '' then
  begin
    DM1.tNatOperacao.Filtered := False;
    if DM1.tFilialCodRegimeTrib.AsInteger < 3 then
      DM1.tNatOperacao.Filter := 'TipoEmpresa = '''+'A'+''' or TipoEmpresa = '''+'S'+''''
    else
      DM1.tNatOperacao.Filter := 'TipoEmpresa = '''+'A'+''' or TipoEmpresa = '''+'G'+'''';
    DM1.tNatOperacao.Filtered := True;
    CanClose := True;
  end
  else
    begin
      ShowMessage('Você deve selecionar uma "Filial" antes de fechar esta janela!');
      CanClose := False;
    end;
end;

end.
