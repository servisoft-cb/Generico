unit URelCReceberCliRed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelCReceberCliRed = class(TForm)
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
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLDraw1: TRLDraw;
    RLSubDetail1: TRLSubDetail;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLLabel19: TRLLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText11: TRLDBText;
    RLLabel2: TRLLabel;
    RLDBText3: TRLDBText;
    RLBand3: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel14: TRLLabel;
    RLBand5: TRLBand;
    RLDBResult4: TRLDBResult;
    RLLabel20: TRLLabel;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLDBText10: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel10: TRLLabel;
    rlOpcao: TRLLabel;
    RLLabel11: TRLLabel;
    RLDBText4: TRLDBText;
    RLDBText8: TRLDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    vCabecalho : String;
  public
    { Public declarations }
  end;

var
  fRelCReceberCliRed: TfRelCReceberCliRed;

implementation

uses UConsCReceber, DB, ToolEdit;

{$R *.dfm}

procedure TfRelCReceberCliRed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCReceberCliRed.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel2.Caption := fConsCReceber.qConsultaParcCReceber.AsString +
                      fConsCReceber.qConsultaclTransferencia.AsString;
end;

procedure TfRelCReceberCliRed.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := True;
  RLLabel19.Caption := '';
  case fConsCReceber.ComboBox1.ItemIndex of
    0 : RLLabel19.Caption := 'Banco: ' + fConsCReceber.qConsultaNomeBancoBoleto.AsString;
    1 : RLLabel19.Caption := 'Tipo Cobrança: ' + fConsCReceber.qConsultaNomeCobranca.AsString;
    2 : RLLabel19.Caption := 'Cliente: ' + fConsCReceber.qConsultaNomeCliente.AsString + '  ' + fConsCReceber.qConsultaCgcCpf.AsString;
    3,4 : PrintIt := False;
    //4 : RLLabel19.Caption := 'Cliente: ' + fConsCReceber.qConsultaNomeCliente.AsString + '  ' + fConsCReceber.qConsultaCgcCpf.AsString;
    5 : RLLabel19.Caption := 'Vendedor: ' + fConsCReceber.qConsultaNomeVendedor.AsString;
  end;
end;

procedure TfRelCReceberCliRed.FormCreate(Sender: TObject);
begin
  case fConsCReceber.ComboBox1.ItemIndex of
    0 : RLGroup1.DataFields := 'NomeBancoBoleto';
    1 : RLGroup1.DataFields := 'NomeCobranca';
    2 : RLGroup1.DataFields := 'NomeCliente;CodCli';
    3 : RLGroup1.DataFields := '';
    4 : RLGroup1.DataFields := 'DtGerado';
    5 : RLGroup1.DataFields := 'NomeVendedor';
  end;
end;

procedure TfRelCReceberCliRed.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  PrintIt := True;
  //if (fConsCReceber.ComboBox1.ItemIndex = 3) or (fConsCReceber.ComboBox1.ItemIndex = 4) then
  if (fConsCReceber.ComboBox1.ItemIndex = 3)  then
    PrintIt := False;
end;

procedure TfRelCReceberCliRed.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  rlOpcao.Caption := '';
  if fConsCReceber.RxDBLookupCombo2.Text <> '' then
    rlOpcao.Caption := ' (Filial: ' + Copy(fConsCReceber.RxDBLookupCombo2.Text,1,20) + ')';
  if (fConsCReceber.DateEdit1.Date > 0) and (fConsCReceber.DateEdit2.Date > 0) then
    rlOpcao.Caption := rlOpcao.Caption + ' (Emissao: ' + fConsCReceber.DateEdit1.Text + ' a ' + fConsCReceber.DateEdit2.Text + ')';
  if (fConsCReceber.DateEdit3.Date > 0) and (fConsCReceber.DateEdit4.Date > 0) then
    rlOpcao.Caption := rlOpcao.Caption + ' (Vecto: ' + fConsCReceber.DateEdit3.Text + ' a ' + fConsCReceber.DateEdit4.Text + ')';
  if fConsCReceber.RxDBLookupCombo6.Text <> '' then
    rlOpcao.Caption := rlOpcao.Caption + ' (Vendedor: ' + Copy(fConsCReceber.RxDBLookupCombo6.Text,1,20) + ')';
end;

end.
