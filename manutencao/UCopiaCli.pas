unit UCopiaCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RxLookup, StdCtrls, Buttons;

type
  TfCopiaCli = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCopiaCli: TfCopiaCli;

implementation

uses UDM1, UDM2;

{$R *.DFM}

procedure TfCopiaCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfCopiaCli.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfCopiaCli.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    RxDBLookupCombo2.KeyValue := RxDBLookupCombo1.KeyValue;
end;

procedure TfCopiaCli.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Fantasia';
end;

procedure TfCopiaCli.RxDBLookupCombo2Exit(Sender: TObject);
begin
  if RxDBLookupCombo2.Text <> '' then
    RxDBLookupCombo1.KeyValue := RxDBLookupCombo2.KeyValue;
end;

procedure TfCopiaCli.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfCopiaCli.BitBtn1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
  begin
    Screen.Cursor                   := crHourGlass;
    DM1.tCliente.IndexFieldNames := 'Codigo';
    DM1.tCliente.SetKey;
    DM1.tClienteCodigo.AsInteger := RxDBLookupCombo1.KeyValue;
    if DM1.tCliente.GotoKey then
    begin
      DM1.tTranspNome.AsString       := DM1.tClienteNome.AsString;
      DM1.tTranspEndereco.AsString   := DM1.tClienteEndereco.AsString + ', ' + DM1.tClienteNumEnd.AsString;
      DM1.tTranspBairro.AsString     := DM1.tClienteBairro.AsString;
      DM1.tTranspCep.AsString        := DM1.tClienteCep.AsString;
      DM1.tTranspUF.AsString         := DM1.tClienteUf.AsString;
      DM1.tTranspFone.AsString       := DM1.tClienteTelefone.AsString;
      DM1.tTranspFax.AsString        := DM1.tClienteFax.AsString;
      DM1.tTranspCNPJ.AsString       := DM1.tClienteCgcCpf.AsString;
      DM1.tTranspInscricao.AsString  := DM1.tClienteInscrEst.AsString;
      DM1.tTranspContato.AsString    := DM1.tClienteContato.AsString;
      DM1.tTranspCodCidade.AsInteger := DM1.tClienteCodCidade.AsInteger;
      DM1.tTranspFantasia.AsString   := DM1.tClienteFantasia.AsString;
      DM1.tTranspEmail.AsString      := DM1.tClienteEmail.AsString;
      Dm1.tTranspHomePage.AsString   := DM1.tClienteHomePage.AsString;
      DM1.tTranspCliente.AsBoolean   := True;
      DM1.tTranspPessoa.AsString     := DM1.tClientePessoa.AsString;
      dm1.tTranspIdPais.AsInteger    := dm1.tClienteIdPais.AsInteger;
    end;
    Screen.Cursor := crDefault;
    Close;
  end
  else
    begin
      ShowMessage('Deve ser selecionado um cliente para poder efetuar a cópia!');
      RxDBLookupCombo1.SetFocus;
    end;
end;

procedure TfCopiaCli.FormShow(Sender: TObject);
begin
  if not DM1.tCliente.Active then
    DM1.tCliente.Open;
end;

end.
