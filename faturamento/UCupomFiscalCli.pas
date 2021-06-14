unit UCupomFiscalCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Buttons, ExtCtrls;

type
  TfCupomFiscalCli = class(TForm)
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
  private
    { Private declarations }
    vCodCliente : Integer;
  public
    { Public declarations }
  end;

var
  fCupomFiscalCli: TfCupomFiscalCli;

implementation

uses UDM1, UDMCupom;

{$R *.dfm}

procedure TfCupomFiscalCli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfCupomFiscalCli.FormShow(Sender: TObject);
begin
  vCodCliente := DMCupom.cdsCupomFiscalCODCLIENTE.AsInteger;
end;

procedure TfCupomFiscalCli.BitBtn2Click(Sender: TObject);
begin
  DMCupom.cdsCupomFiscalCODCLIENTE.AsInteger := vCodCliente;
  Close;
end;

procedure TfCupomFiscalCli.BitBtn1Click(Sender: TObject);
begin
  dm1.tCliente.IndexFieldNames := 'Codigo';
  dm1.tCliente.FindKey([RxDBLookupCombo1.KeyValue]);
  dmCupom.cdsCupomFiscalNOME_CLIENTE.AsString := RxDBLookupCombo1.Text;
  Close;
end;

procedure TfCupomFiscalCli.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := (DMCupom.cdsCupomFiscalCODCLIENTE.AsInteger > 0);
  if not CanClose then
    ShowMessage('É obrigatório informar o cliente!');
end;

procedure TfCupomFiscalCli.RxDBLookupCombo1Enter(Sender: TObject);
begin
  dm1.tCliente.IndexFieldNames := 'Nome';
end;

end.
