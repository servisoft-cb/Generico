unit URelCReceber3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelCReceber3 = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel21: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel22: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLDraw1: TRLDraw;
    RLSubDetail1: TRLSubDetail;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLLabel19: TRLLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLLabel2: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLBand3: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLLabel16: TRLLabel;
    RLDBResult3: TRLDBResult;
    RLBand5: TRLBand;
    RLDBResult4: TRLDBResult;
    RLLabel20: TRLLabel;
    RLLabel23: TRLLabel;
    RLDBResult5: TRLDBResult;
    RLLabel24: TRLLabel;
    RLDBResult6: TRLDBResult;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLDBText14: TRLDBText;
    RLLabel25: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    vCabecalho : String;
  public
    { Public declarations }
  end;

var
  fRelCReceber3: TfRelCReceber3;

implementation

uses UContasReceber2, DB;

{$R *.dfm}

procedure TfRelCReceber3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCReceber3.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := not(fContasReceber2.qConsultaCancelado.AsBoolean);
  RLLabel2.Caption := fContasReceber2.qConsultaParcCReceber.AsString +
                      fContasReceber2.qConsultaclTransferencia.AsString;
end;

procedure TfRelCReceber3.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := True;
  RLLabel19.Caption := '';
  case fContasReceber2.ComboBox2.ItemIndex of
    0 : RLLabel19.Caption := 'Banco: ' + fContasReceber2.qConsultaNomeBancoBoleto.AsString;
    1 : RLLabel19.Caption := 'Tipo Cobrança: ' + fContasReceber2.qConsultaNomeCobranca.AsString;
    2 : RLLabel19.Caption := 'Cliente: ' + fContasReceber2.qConsultaNomeCliente.AsString + '  ' + fContasReceber2.qConsultaCgcCpf.AsString;
    3,4,6 : PrintIt := False;
    5 : RLLabel19.Caption := 'Vendedor: ' + fContasReceber2.qConsultaNomeVendedor.AsString;
  end;
end;

procedure TfRelCReceber3.FormCreate(Sender: TObject);
begin
  case fContasReceber2.ComboBox2.ItemIndex of
    0 : RLGroup1.DataFields := 'NomeBancoBoleto';
    1 : RLGroup1.DataFields := 'NomeCobranca';
    2 : RLGroup1.DataFields := 'NomeCliente;CodCli';
    3 : RLGroup1.DataFields := '';
    4 : RLGroup1.DataFields := '';
    5 : RLGroup1.DataFields := 'NomeVendedor';
    6 : RLGroup1.DataFields := '';
  end;
end;

procedure TfRelCReceber3.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := True;
  if (fContasReceber2.ComboBox2.ItemIndex = 3) or (fContasReceber2.ComboBox2.ItemIndex = 4) or
     (fContasReceber2.ComboBox2.ItemIndex = 6) then
    PrintIt := False;
end;

end.
