unit UAgendaTelef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, RxLookup, Db, DBTables, DBCtrls,
  Grids, DBGrids, SMDBGrid;

type
  TfAgendaTelef = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    qCliente: TQuery;
    qsCliente: TDataSource;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Label10: TLabel;
    SpeedButton2: TSpeedButton;
    Bevel2: TBevel;
    Label11: TLabel;
    DBText9: TDBText;
    Label12: TLabel;
    DBText10: TDBText;
    Label13: TLabel;
    DBText11: TDBText;
    Label14: TLabel;
    DBText12: TDBText;
    Label15: TLabel;
    DBText13: TDBText;
    Label16: TLabel;
    DBText14: TDBText;
    qFornecedores: TQuery;
    qsFornecedores: TDataSource;
    Label20: TLabel;
    DBText18: TDBText;
    TabSheet3: TTabSheet;
    Panel4: TPanel;
    SpeedButton3: TSpeedButton;
    Bevel3: TBevel;
    Label22: TLabel;
    DBText19: TDBText;
    Label23: TLabel;
    DBText20: TDBText;
    Label24: TLabel;
    DBText21: TDBText;
    Label25: TLabel;
    DBText22: TDBText;
    Label30: TLabel;
    DBText27: TDBText;
    qTransp: TQuery;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Bevel1: TBevel;
    Label2: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    DBText2: TDBText;
    Label4: TLabel;
    DBText3: TDBText;
    Label5: TLabel;
    DBText4: TDBText;
    Label6: TLabel;
    DBText5: TDBText;
    Label7: TLabel;
    DBText6: TDBText;
    Label8: TLabel;
    DBText7: TDBText;
    qClienteCodigo: TIntegerField;
    qClienteNome: TStringField;
    qClienteTelefone: TStringField;
    qClienteTelefone2: TStringField;
    qClienteFax: TStringField;
    qClienteContato: TStringField;
    qClienteFantasia: TStringField;
    qFornecedoresCodForn: TIntegerField;
    qFornecedoresNomeForn: TStringField;
    qFornecedoresTel1Forn: TStringField;
    qFornecedoresTel2Forn: TStringField;
    qFornecedoresFaxForn: TStringField;
    qFornecedoresContatoForn: TStringField;
    qFornecedoresFantasia: TStringField;
    qTranspNome: TStringField;
    qTranspCodigo: TIntegerField;
    qTranspFone: TStringField;
    qTranspFax: TStringField;
    qTranspContato: TStringField;
    qsTransp: TDataSource;
    TabSheet4: TTabSheet;
    qVendedores: TQuery;
    Panel5: TPanel;
    Label9: TLabel;
    SpeedButton4: TSpeedButton;
    Bevel4: TBevel;
    Label17: TLabel;
    DBText8: TDBText;
    Label18: TLabel;
    DBText15: TDBText;
    Label19: TLabel;
    DBText16: TDBText;
    Label26: TLabel;
    DBText17: TDBText;
    Label27: TLabel;
    DBText23: TDBText;
    RxDBLookupCombo4: TRxDBLookupCombo;
    qsVendedores: TDataSource;
    qVendedoresCodigo: TIntegerField;
    qVendedoresNome: TStringField;
    qVendedoresFone: TStringField;
    qVendedoresFax: TStringField;
    qVendedoresContato: TStringField;
    Label28: TLabel;
    DBText24: TDBText;
    qFornecedoresEmail: TStringField;
    TabSheet5: TTabSheet;
    Panel6: TPanel;
    SpeedButton5: TSpeedButton;
    Bevel5: TBevel;
    Label31: TLabel;
    DBText25: TDBText;
    Label32: TLabel;
    DBText26: TDBText;
    Label33: TLabel;
    DBText28: TDBText;
    Label34: TLabel;
    DBText29: TDBText;
    Label35: TLabel;
    DBText30: TDBText;
    Label36: TLabel;
    DBText31: TDBText;
    Label38: TLabel;
    DBText33: TDBText;
    qOutros: TQuery;
    qOutrosCodigo: TIntegerField;
    qOutrosNome: TStringField;
    qOutrosContato: TStringField;
    qOutrosTelefone1: TStringField;
    qOutrosTelefone2: TStringField;
    qOutrosFax: TStringField;
    qOutrosEmail: TStringField;
    qsOutros: TDataSource;
    DBText32: TDBText;
    qClienteBairro: TStringField;
    qClienteEndereco: TStringField;
    qClienteUf: TStringField;
    qClienteCep: TStringField;
    qClienteCgcCpf: TStringField;
    qClienteInscrEst: TStringField;
    qClienteDDDFax: TIntegerField;
    qClienteDDDFone2: TIntegerField;
    qClienteDDDFone1: TIntegerField;
    DBText34: TDBText;
    DBText35: TDBText;
    Label37: TLabel;
    DBText36: TDBText;
    Label39: TLabel;
    DBText37: TDBText;
    qClienteCodCidade: TIntegerField;
    qClienteNomeCidade: TStringField;
    Label40: TLabel;
    DBText38: TDBText;
    DBText39: TDBText;
    Label41: TLabel;
    SMDBGrid1: TSMDBGrid;
    Label42: TLabel;
    DBText40: TDBText;
    Label1: TLabel;
    DBText41: TDBText;
    Label43: TLabel;
    DBText42: TDBText;
    Label44: TLabel;
    DBText43: TDBText;
    Label45: TLabel;
    DBText44: TDBText;
    Label46: TLabel;
    DBText45: TDBText;
    DBText46: TDBText;
    Label47: TLabel;
    Label49: TLabel;
    DBText48: TDBText;
    Label50: TLabel;
    DBText49: TDBText;
    qFornecedoresNomeCidade: TStringField;
    qFornecedoresEndForn: TStringField;
    qFornecedoresBairroForn: TStringField;
    qFornecedoresCEPForn: TStringField;
    qFornecedoresEstadoForn: TStringField;
    qFornecedoresCGC: TStringField;
    qFornecedoresInsc: TStringField;
    Label48: TLabel;
    DBText47: TDBText;
    Label51: TLabel;
    DBText50: TDBText;
    Label52: TLabel;
    DBText51: TDBText;
    DBText52: TDBText;
    Label53: TLabel;
    Label54: TLabel;
    DBText53: TDBText;
    Label55: TLabel;
    DBText54: TDBText;
    qOutrosNomeCidade: TStringField;
    qOutrosCodCidade: TIntegerField;
    qOutrosEndereco: TStringField;
    qOutrosBairro: TStringField;
    qOutrosCep: TStringField;
    qOutrosUF: TStringField;
    qOutrosNumDoc: TStringField;
    qOutrosPessoa: TStringField;
    qOutrosObs: TMemoField;
    SMDBGrid2: TSMDBGrid;
    SMDBGrid3: TSMDBGrid;
    qOutrosFantasia: TStringField;
    SMDBGrid4: TSMDBGrid;
    Label29: TLabel;
    DBText55: TDBText;
    Label56: TLabel;
    DBText56: TDBText;
    Label57: TLabel;
    DBText57: TDBText;
    Label58: TLabel;
    DBText58: TDBText;
    DBText59: TDBText;
    Label59: TLabel;
    Label60: TLabel;
    DBText60: TDBText;
    Label61: TLabel;
    DBText61: TDBText;
    qTranspEndereco: TStringField;
    qTranspBairro: TStringField;
    qTranspCNPJ: TStringField;
    qTranspInscricao: TStringField;
    qTranspFantasia: TStringField;
    qTranspCodCidade: TIntegerField;
    qTranspNomeCidade: TStringField;
    qTranspUF: TStringField;
    qTranspCep: TStringField;
    qTranspEmail: TStringField;
    qTranspHomePage: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAgendaTelef: TfAgendaTelef;

implementation

uses UDM1, UCliente, UFornecedores, UTransp, UVendedor, UOutros;

{$R *.DFM}

procedure TfAgendaTelef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      Dm1.tCliente.Close;
      Dm1.tFornecedores.Close;
      Dm1.tTransp.Close;
      Dm1.tOutros.Close;
      Dm1.tVendedor.Close;
    end;
  qCliente.Close;
  qFornecedores.Close;
  qTransp.Close;
  qVendedores.Close;
  qOutros.Close;
  Action := Cafree;
end;

procedure TfAgendaTelef.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfAgendaTelef.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioClientes.AsBoolean then
    begin
      vCodClientePos := qClienteCodigo.AsInteger;
      DM1.tCliente.IndexFieldNames := 'Codigo';
      DM1.tCliente.FindKey([qClienteCodigo.AsInteger]);
      fCliente := TfCliente.Create(Self);
      fCliente.ShowModal;
      qCliente.Active := False;
      qCliente.Active := True;
      qCliente.Locate('Codigo',DM1.tClienteCodigo.AsInteger,[loCaseInsensitive]);
    end
  else
    ShowMessage('Usuário '+ DM1.tUsuarioUsuario.AsString+ ' não está autorizado a abrir este formulário!');
end;

procedure TfAgendaTelef.SpeedButton2Click(Sender: TObject);
var
  vNumero : Integer;
begin
  if DM1.tUsuarioFornecedores.AsBoolean then
    begin
      DM1.tFornecedores.IndexFieldNames := 'CodForn';
      DM1.tFornecedores.FindKey([qFornecedoresCodForn.AsInteger]);
      vNumero       := qFornecedoresCodForn.AsInteger;
      fFornecedores := TfFornecedores.Create(Self);
      fFornecedores.ShowModal;
      qFornecedores.Active := False;
      qFornecedores.Active := True;
      qFornecedores.Locate('CodForn',vNumero,[loCaseInsensitive]);
    end
  else
    ShowMessage('Usuário '+ DM1.tUsuarioUsuario.AsString+ ' não está autorizado a abrir este formulário!');
end;

procedure TfAgendaTelef.SpeedButton4Click(Sender: TObject);
var
  vNumero : Integer;
begin
  if DM1.tUsuarioVendedor.AsBoolean then
    begin
      DM1.tVendedor.IndexFieldNames := 'Codigo';
      DM1.tVendedor.FindKey([qVendedoresCodigo.AsInteger]);
      vNumero   := qVendedoresCodigo.AsInteger;
      fVendedor := TfVendedor.Create(Self);
      fVendedor.ShowModal;
      qVendedores.Active := False;
      qVendedores.Active := True;
      qVendedores.Locate('Codigo',vNumero,[loCaseInsensitive]);
    end
  else
    ShowMessage('Usuário '+ DM1.tUsuarioUsuario.AsString+ ' não está autorizado a abrir este formulário!');
end;

procedure TfAgendaTelef.SpeedButton5Click(Sender: TObject);
var
  vNumero : Integer;
begin
  DM1.tOutros.IndexFieldNames := 'Codigo';
  DM1.tOutros.FindKey([qOutrosCodigo.AsInteger]);
  vNumero := qOutrosCodigo.AsInteger;
  fOutros := TfOutros.Create(Self);
  fOutros.ShowModal;
  qOutros.Active := False;
  qOutros.Active := True;
  qOutros.Locate('Codigo',vNumero,[loCaseInsensitive]);
end;

procedure TfAgendaTelef.FormShow(Sender: TObject);
begin
  Dm1.tCliente.Open;
  Dm1.tFornecedores.Open;
  Dm1.tTransp.Open;
  Dm1.tOutros.Open;
  Dm1.tVendedor.Open;
  qCliente.open;
  qFornecedores.open;
  qTransp.open;
  qVendedores.open;
  qOutros.open;
end;

procedure TfAgendaTelef.SpeedButton3Click(Sender: TObject);
var
  vNumero : Integer;
begin
  if DM1.tUsuarioTransp.AsBoolean then
    begin
      DM1.tTransp.IndexFieldNames := 'Codigo';
      DM1.tTransp.FindKey([qTranspCodigo.AsInteger]);
      vNumero := qTranspCodigo.AsInteger;
      fTransp := TfTransp.Create(Self);
      fTransp.ShowModal;
      qTransp.Active := False;
      qTransp.Active := True;
      qTransp.Locate('Codigo',vNumero,[loCaseInsensitive]);
    end
  else
    ShowMessage('Usuário '+ DM1.tUsuarioUsuario.AsString+ ' não está autorizado a abrir este formulário!');
end;

end.
