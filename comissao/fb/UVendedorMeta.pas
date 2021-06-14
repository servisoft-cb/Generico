unit UVendedorMeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, RxLookup, ToolEdit,
  RXDBCtrl, Grids, DBGrids, SMDBGrid, RxDBComb, VerificaCPF, VerificaCGC,
  FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TfVendedorMeta = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label13: TLabel;
    Label6: TLabel;
    DBEdit9: TDBEdit;
    sdsVendedor: TSQLDataSet;
    dspVendedor: TDataSetProvider;
    cdsVendedor: TClientDataSet;
    dsVendedor: TDataSource;
    sdsMarca: TSQLDataSet;
    dspMarca: TDataSetProvider;
    cdsMarca: TClientDataSet;
    dsMarca: TDataSource;
    sdsVendedorCODIGO: TIntegerField;
    sdsVendedorNOME: TStringField;
    cdsVendedorCODIGO: TIntegerField;
    cdsVendedorNOME: TStringField;
    sdsMarcaCODIGO: TIntegerField;
    sdsMarcaNOME: TStringField;
    cdsMarcaCODIGO: TIntegerField;
    cdsMarcaNOME: TStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  fVendedorMeta: TfVendedorMeta;

implementation

uses UDMVendedorMeta, UDM1, UVendedorMetaC, DmdDatabase;

{$R *.dfm}

procedure TfVendedorMeta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsVendedor.Close;
  cdsMarca.Close;
  if DMVendedorMeta.cdsVendedor_Meta.State in [dsEdit,dsInsert] then
    DMVendedorMeta.cdsVendedor_Meta.CancelUpdates;
  Action := Cafree;
end;

procedure TfVendedorMeta.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a inclusão/alteração?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  Close;
end;

procedure TfVendedorMeta.BitBtn1Click(Sender: TObject);
begin
  if DMVendedorMeta.cdsVendedor_MetaCODIGO.AsInteger < 1 then
  begin
    ShowMessage('Representante não informado!');
    exit;
  end;
  if DMVendedorMeta.cdsVendedor_MetaCODMARCA.AsInteger < 1 then
  begin
    ShowMessage('Marca não informada!');
    exit;
  end;
  if DMVendedorMeta.cdsVendedor_MetaMETA_QTD.AsInteger < 1 then
  begin
    ShowMessage('Meta não informada!');
    exit;
  end;
  DMVendedorMeta.cdsVendedor_MetaNOMEVENDEDOR.AsString := RxDBLookupCombo3.Text;
  DMVendedorMeta.cdsVendedor_MetaNOMEMARCA.AsString    := RxDBLookupCombo1.Text;
  DMVendedorMeta.cdsVendedor_Meta.Post;
  DMVendedorMeta.cdsVendedor_Meta.ApplyUpdates(0);

  Close;
end;

procedure TfVendedorMeta.FormShow(Sender: TObject);
begin
  cdsVendedor.Open;
  cdsMarca.Open;
end;

end.
