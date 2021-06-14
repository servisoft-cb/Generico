unit uFaca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ComCtrls,
  rsDBUtils, uDmProdutoCarto, db, uIntegracao, DBTables, RxDBComb, ExtCtrls, FMTBcd, RxLookup, DBClient, Provider, SqlExpr;

type
  TfFaca = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    DBEdit75: TDBEdit;
    DBEdit76: TDBEdit;
    DBEdit78: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label28: TLabel;
    Label29: TLabel;
    Label17: TLabel;
    Label25: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    BitBtn10: TBitBtn;
    Label30: TLabel;
    RxDBComboBox5: TRxDBComboBox;
    Label31: TLabel;
    RxDBComboBox11: TRxDBComboBox;
    Label32: TLabel;
    RxDBComboBox13: TRxDBComboBox;
    Label35: TLabel;
    DBEdit13: TDBEdit;
    Label36: TLabel;
    DBEdit14: TDBEdit;
    Label1: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox2: TRxDBComboBox;
    Label5: TLabel;
    RxDBComboBox3: TRxDBComboBox;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit15: TDBEdit;
    Label13: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    RxDBComboBox4: TRxDBComboBox;
    RxDBComboBox6: TRxDBComboBox;
    RxDBComboBox7: TRxDBComboBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    RxDBComboBox8: TRxDBComboBox;
    Label79: TLabel;
    Label18: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Label19: TLabel;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    Label20: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    sdsFacaFD: TSQLDataSet;
    IntegerField5: TIntegerField;
    sdsFacaFDFD_COMPR: TFMTBCDField;
    sdsFacaFDFD_LARGURA: TFMTBCDField;
    sdsFacaFDFD_ALTURA: TFMTBCDField;
    sdsFacaFDFD_ABA_INT_CAB: TFMTBCDField;
    sdsFacaFDFD_ABA_INT_LAT: TFMTBCDField;
    dspFacaFD: TDataSetProvider;
    cdsFacaFD: TClientDataSet;
    cdsFacaFDCODIGO: TIntegerField;
    cdsFacaFDFD_COMPR: TFMTBCDField;
    cdsFacaFDFD_LARGURA: TFMTBCDField;
    cdsFacaFDFD_ALTURA: TFMTBCDField;
    cdsFacaFDFD_ABA_INT_CAB: TFMTBCDField;
    cdsFacaFDFD_ABA_INT_LAT: TFMTBCDField;
    dsFacaFD: TDataSource;
    sdsFacaTP: TSQLDataSet;
    sdsFacaTPCODIGO: TIntegerField;
    sdsFacaTPTP_ABA_EXT_CAB: TFMTBCDField;
    sdsFacaTPTP_ABA_INT_CAB: TFMTBCDField;
    sdsFacaTPTP_ABA_EXT_LAT: TFMTBCDField;
    sdsFacaTPTP_ABA_INT_LAT: TFMTBCDField;
    dspFacaTP: TDataSetProvider;
    cdsFacaTP: TClientDataSet;
    cdsFacaTPCODIGO: TIntegerField;
    cdsFacaTPTP_ABA_EXT_CAB: TFMTBCDField;
    cdsFacaTPTP_ABA_INT_CAB: TFMTBCDField;
    cdsFacaTPTP_ABA_EXT_LAT: TFMTBCDField;
    cdsFacaTPTP_ABA_INT_LAT: TFMTBCDField;
    dsFacaTP: TDataSource;
    Label21: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    sdsFacaFDFD_COPIAS_C: TSmallintField;
    sdsFacaFDFD_COPIAS_L: TSmallintField;
    sdsFacaFDREFERENCIA: TStringField;
    cdsFacaFDFD_COPIAS_C: TSmallintField;
    cdsFacaFDFD_COPIAS_L: TSmallintField;
    cdsFacaFDREFERENCIA: TStringField;
    sdsFacaTPTP_COPIAS_C: TSmallintField;
    sdsFacaTPTP_COPIAS_L: TSmallintField;
    sdsFacaTPREFERENCIA: TStringField;
    cdsFacaTPTP_COPIAS_C: TSmallintField;
    cdsFacaTPTP_COPIAS_L: TSmallintField;
    cdsFacaTPREFERENCIA: TStringField;
    Label22: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label24: TLabel;
    RxDBComboBox10: TRxDBComboBox;
    RxDBComboBox9: TRxDBComboBox;
    Label23: TLabel;
    Label26: TLabel;
    RxDBComboBox12: TRxDBComboBox;
    Label27: TLabel;
    RxDBComboBox14: TRxDBComboBox;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    Label33: TLabel;
    Label34: TLabel;
    Label37: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fdmFaca: TdmProdutoCarto;
    ctFacaFD, ctFacaTP, ctFacaSP: String;
    procedure calcula;
    procedure procuraFacaFD;
    procedure procuraFacaTP;
  public
    { Public declarations }
    property dmFaca: TDmProdutoCarto read fdmFaca write fdmFaca;
  end;

var
  fFaca: TfFaca;

implementation

uses UDM1;

{$R *.dfm}

procedure TfFaca.calcula;
begin
  if fdmFaca.cdsProdutoCartoTIPO.AsString = '2' then
  begin
    fdmFaca.cdsProdutoCartoFD_FIO_L.AsFloat := (fdmFaca.cdsProdutoCartoFD_ALTURA.AsFloat * 2) +
                                                fdmFaca.cdsProdutoCartoFD_LARGURA.AsFloat * 2 +
                                                0.3 + fdmFaca.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat +
                                                fdmFaca.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat;
    fdmFaca.cdsProdutoCartoFD_DIMENSAO2.AsFloat := ((fdmFaca.cdsProdutoCartoFD_ALTURA.AsFloat * 2) +
                                                   fdmFaca.cdsProdutoCartoFD_LARGURA.AsFloat * 2 +
                                                   0.3 + fdmFaca.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat +
                                                   fdmFaca.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat) *
                                                   fdmFaca.cdsProdutoCartoFD_COPIAS_L.AsFloat +
                                                   (fdmFaca.cdsProdutoCartoFD_INT_L.AsFloat *
                                                   (fdmFaca.cdsProdutoCartoFD_COPIAS_L.AsFloat - 1));

    fdmFaca.cdsProdutoCartoFD_FIO_C.AsFloat     := (fdmFaca.cdsProdutoCartoFD_ALTURA.AsFloat * 2) +
                                                   (fdmFaca.cdsProdutoCartoFD_ABA_INT_LAT.AsFloat * 2) +
                                                   (fdmFaca.cdsProdutoCartoFD_ABA_INT_CAB.AsFloat * 2) +
                                                    fdmFaca.cdsProdutoCartoFD_COMPR.AsFloat;
    fdmFaca.cdsProdutoCartoFD_DIMENSAO1.AsFloat := ((fdmFaca.cdsProdutoCartoFD_ALTURA.AsFloat * 2) +
                                                   (fdmFaca.cdsProdutoCartoFD_ABA_INT_LAT.AsFloat * 2) +
                                                   (fdmFaca.cdsProdutoCartoFD_ABA_INT_CAB.AsFloat * 2) +
                                                    fdmFaca.cdsProdutoCartoFD_COMPR.AsFloat) *
                                                    fdmFaca.cdsProdutoCartoFD_COPIAS_C.AsFloat +
                                                   (fdmFaca.cdsProdutoCartoFD_INT_C.AsFloat *
                                                   (fdmFaca.cdsProdutoCartoFD_COPIAS_C.AsFloat - 1));

    fdmFaca.cdsProdutoCartoTP_FIO_C.AsFloat     := 0;
    fdmFaca.cdsProdutoCartoTP_FIO_L.AsFloat     := 0;
    fdmFaca.cdsProdutoCartoTP_DIMENSAO1.AsFloat := 0;
    fdmFaca.cdsProdutoCartoTP_DIMENSAO2.AsFloat := 0;
    fdmFaca.cdsProdutoCartoTP_INT_C.AsFloat     := 0;
    fdmFaca.cdsProdutoCartoTP_INT_L.AsFloat     := 0;
    fdmFaca.cdsProdutoCartoTP_COPIAS_C.AsFloat  := 0;
    fdmFaca.cdsProdutoCartoTP_COPIAS_L.AsFloat  := 0;
    Exit;
  end;

  fdmFaca.cdsProdutoCartoFD_FIO_C.AsFloat     := (fdmFaca.cdsProdutoCartoFD_ALTURA.AsFloat * 2) +
                                                 (fdmFaca.cdsProdutoCartoFD_ABA_INT_CAB.AsFloat * 2) +
                                                  fdmFaca.cdsProdutoCartoFD_COMPR.AsFloat;
  fdmFaca.cdsProdutoCartoFD_DIMENSAO1.AsFloat := ((fdmFaca.cdsProdutoCartoFD_ALTURA.AsFloat * 2) +
                                                  (fdmFaca.cdsProdutoCartoFD_ABA_INT_CAB.AsFloat * 2) +
                                                   fdmFaca.cdsProdutoCartoFD_COMPR.AsFloat) *
                                                   fdmFaca.cdsProdutoCartoFD_COPIAS_C.AsFloat +
                                                  (fdmFaca.cdsProdutoCartoFD_INT_C.AsFloat *
                                                  (fdmFaca.cdsProdutoCartoFD_COPIAS_C.AsFloat - 1));

  fdmFaca.cdsProdutoCartoFD_FIO_L.AsFloat     := (fdmFaca.cdsProdutoCartoFD_ALTURA.AsFloat * 2) +
                                                 (fdmFaca.cdsProdutoCartoFD_ABA_INT_LAT.AsFloat * 2) +
                                                  fdmFaca.cdsProdutoCartoFD_LARGURA.AsFloat;
  fdmFaca.cdsProdutoCartoFD_DIMENSAO2.AsFloat := ((fdmFaca.cdsProdutoCartoFD_ALTURA.AsFloat * 2) +
                                                 (fdmFaca.cdsProdutoCartoFD_ABA_INT_LAT.AsFloat * 2) +
                                                  fdmFaca.cdsProdutoCartoFD_LARGURA.AsFloat) *
                                                  fdmFaca.cdsProdutoCartoFD_COPIAS_L.AsFloat +
                                                 (fdmFaca.cdsProdutoCartoFD_INT_L.AsFloat *
                                                 (fdmFaca.cdsProdutoCartoFD_COPIAS_L.AsFloat - 1));

  if (dmProdutoCarto.cdsProdutoCartoTIPO.AsInteger < 3) then //se for cartucho ou sacola, nao calcula tampa
    case RxDBComboBox5.ItemIndex of
      0: begin  //duplex
           fdmFaca.cdsProdutoCartoTP_FIO_C.AsFloat := (fdmFaca.cdsProdutoCartoFD_COMPR.AsFloat + 0.4) +
                                                      (fdmFaca.cdsProdutoCartoTP_ABA_EXT_CAB.AsFloat * 2) +
                                                      (fdmFaca.cdsProdutoCartoTP_ABA_INT_CAB.AsFloat * 2);
           fdmFaca.cdsProdutoCartoTP_FIO_L.AsFloat := (fdmFaca.cdsProdutoCartoFD_LARGURA.AsFloat + 0.3) +
                                                      (fdmFaca.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat * 2) +
                                                      (fdmFaca.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat * 2);
           fdmFaca.cdsProdutoCartoTP_DIMENSAO1.AsFloat := ((fdmFaca.cdsProdutoCartoFD_COMPR.AsFloat + 0.4) +
                                                          (fdmFaca.cdsProdutoCartoTP_ABA_EXT_CAB.AsFloat * 2) +
                                                          (fdmFaca.cdsProdutoCartoTP_ABA_INT_CAB.AsFloat * 2)) *
                                                           fdmFaca.cdsProdutoCartoTP_COPIAS_C.AsFloat +
                                                          (fdmFaca.cdsProdutoCartoTP_INT_C.AsFloat *
                                                          (fdmFaca.cdsProdutoCartoTP_COPIAS_C.AsFloat - 1));
           fdmFaca.cdsProdutoCartoTP_DIMENSAO2.AsFloat := ((fdmFaca.cdsProdutoCartoFD_LARGURA.AsFloat + 0.3) +
                                                          (fdmFaca.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat * 2) +
                                                          (fdmFaca.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat * 2)) *
                                                           fdmFaca.cdsProdutoCartoTP_COPIAS_L.AsFloat +
                                                          (fdmFaca.cdsProdutoCartoTP_INT_L.AsFloat *
                                                          (fdmFaca.cdsProdutoCartoTP_COPIAS_L.AsFloat - 1));
         end;
      1: begin  //micro
           fdmFaca.cdsProdutoCartoTP_FIO_C.AsFloat := (fdmFaca.cdsProdutoCartoFD_COMPR.AsFloat + 0.7) +
                                                      (fdmFaca.cdsProdutoCartoTP_ABA_EXT_CAB.AsFloat * 2) +
                                                      (fdmFaca.cdsProdutoCartoTP_ABA_INT_CAB.AsFloat * 2);
           fdmFaca.cdsProdutoCartoTP_FIO_L.AsFloat := (fdmFaca.cdsProdutoCartoFD_LARGURA.AsFloat + 0.5) +
                                                      (fdmFaca.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat * 2) +
                                                      (fdmFaca.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat * 2);
           fdmFaca.cdsProdutoCartoTP_DIMENSAO1.AsFloat := ((fdmFaca.cdsProdutoCartoFD_COMPR.AsFloat + 0.7) +
                                                          (fdmFaca.cdsProdutoCartoTP_ABA_EXT_CAB.AsFloat * 2) +
                                                          (fdmFaca.cdsProdutoCartoTP_ABA_INT_CAB.AsFloat * 2)) *
                                                           fdmFaca.cdsProdutoCartoTP_COPIAS_C.AsFloat +
                                                          (fdmFaca.cdsProdutoCartoTP_INT_C.AsFloat *
                                                          (fdmFaca.cdsProdutoCartoTP_COPIAS_C.AsFloat - 1));
           fdmFaca.cdsProdutoCartoTP_DIMENSAO2.AsFloat := ((fdmFaca.cdsProdutoCartoFD_LARGURA.AsFloat + 0.5) +
                                                          (fdmFaca.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat * 2) +
                                                          (fdmFaca.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat * 2)) *
                                                           fdmFaca.cdsProdutoCartoTP_COPIAS_L.AsFloat +
                                                          (fdmFaca.cdsProdutoCartoTP_INT_L.AsFloat *
                                                          (fdmFaca.cdsProdutoCartoTP_COPIAS_L.AsFloat - 1));
         end;
      2: begin  //cartao/cartao
           fdmFaca.cdsProdutoCartoTP_FIO_C.AsFloat := (fdmFaca.cdsProdutoCartoFD_COMPR.AsFloat + 0.5) +
                                                      (fdmFaca.cdsProdutoCartoTP_ABA_EXT_CAB.AsFloat * 2) +
                                                      (fdmFaca.cdsProdutoCartoTP_ABA_INT_CAB.AsFloat * 2);
           fdmFaca.cdsProdutoCartoTP_FIO_L.AsFloat := (fdmFaca.cdsProdutoCartoFD_LARGURA.AsFloat + 0.5) +
                                                      (fdmFaca.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat * 2) +
                                                      (fdmFaca.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat * 2);
           fdmFaca.cdsProdutoCartoTP_DIMENSAO1.AsFloat := ((fdmFaca.cdsProdutoCartoFD_COMPR.AsFloat + 0.5) +
                                                          (fdmFaca.cdsProdutoCartoTP_ABA_EXT_CAB.AsFloat * 2) +
                                                          (fdmFaca.cdsProdutoCartoTP_ABA_INT_CAB.AsFloat * 2)) *
                                                           fdmFaca.cdsProdutoCartoTP_COPIAS_C.AsFloat +
                                                          (fdmFaca.cdsProdutoCartoTP_INT_C.AsFloat *
                                                          (fdmFaca.cdsProdutoCartoTP_COPIAS_C.AsFloat - 1));
           fdmFaca.cdsProdutoCartoTP_DIMENSAO2.AsFloat := ((fdmFaca.cdsProdutoCartoFD_LARGURA.AsFloat + 0.5) +
                                                          (fdmFaca.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat * 2) +
                                                          (fdmFaca.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat * 2)) *
                                                           fdmFaca.cdsProdutoCartoTP_COPIAS_L.AsFloat +
                                                          (fdmFaca.cdsProdutoCartoTP_INT_L.AsFloat *
                                                          (fdmFaca.cdsProdutoCartoTP_COPIAS_L.AsFloat - 1));
         end;
      3: begin  //micro / abas internas
           fdmFaca.cdsProdutoCartoTP_FIO_C.AsFloat := (fdmFaca.cdsProdutoCartoFD_COMPR.AsFloat + 0.7) +
                                                      (fdmFaca.cdsProdutoCartoTP_ABA_EXT_CAB.AsFloat * 2) +
                                                      (fdmFaca.cdsProdutoCartoTP_ABA_INT_CAB.AsFloat * 2);
           fdmFaca.cdsProdutoCartoTP_FIO_L.AsFloat := (fdmFaca.cdsProdutoCartoFD_LARGURA.AsFloat + 0.5) +
                                                      (fdmFaca.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat * 2) +
                                                      (fdmFaca.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat * 2);
           fdmFaca.cdsProdutoCartoTP_DIMENSAO1.AsFloat := ((fdmFaca.cdsProdutoCartoFD_COMPR.AsFloat + 0.7) +
                                                          (fdmFaca.cdsProdutoCartoTP_ABA_EXT_CAB.AsFloat * 2) +
                                                          (fdmFaca.cdsProdutoCartoTP_ABA_INT_CAB.AsFloat * 2)) *
                                                           fdmFaca.cdsProdutoCartoTP_COPIAS_C.AsFloat +
                                                          (fdmFaca.cdsProdutoCartoTP_INT_C.AsFloat *
                                                          (fdmFaca.cdsProdutoCartoTP_COPIAS_C.AsFloat - 1));
           fdmFaca.cdsProdutoCartoTP_DIMENSAO2.AsFloat := ((fdmFaca.cdsProdutoCartoFD_LARGURA.AsFloat + 0.5) +
                                                          (fdmFaca.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat * 2) +
                                                          (fdmFaca.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat * 2)) *
                                                           fdmFaca.cdsProdutoCartoTP_COPIAS_L.AsFloat +
                                                          (fdmFaca.cdsProdutoCartoTP_INT_L.AsFloat *
                                                          (fdmFaca.cdsProdutoCartoTP_COPIAS_L.AsFloat - 1));
         end;
    end;
end;

procedure TfFaca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  oActiveTables.OpenTables(False,Self);
  Action := caFree;
end;

procedure TfFaca.BitBtn10Click(Sender: TObject);
begin
  //se for cartucho ou sacola, nao calcula tampa
  if (dmProdutoCarto.cdsProdutoCartoTIPO.AsInteger < 3) and (RxDBComboBox5.ItemIndex < 0) then
  begin
    ShowMessage('Selecione o material da tampa!');
    RxDBComboBox5.SetFocus;
    Exit;
  end;
  calcula;
end;

procedure TfFaca.BitBtn1Click(Sender: TObject);
begin
  if dmProdutoCarto.cdsProdutoREFERENCIA.IsNull then
  begin
    ShowMessage('Código deve ser preenchido!');
    Exit;
  end;
  if dmProdutoCarto.cdsProdutoCartoTIPO.IsNull then
  begin
    ShowMessage('Tipo deve ser preenchido!');
    Exit;
  end;
  dm1.tProduto.Post;
  Prc_Gravar_Produto_FB(DM1.tProdutoCodigo.AsInteger);
  fdmFaca.cdsProduto.Post;
  fdmFaca.cdsProduto.ApplyUpdates(0);
  Close;
end;

procedure TfFaca.BitBtn2Click(Sender: TObject);
var
  vProduto: Integer;
begin
  vProduto := dm1.tProdutoCodigo.AsInteger;
  dm1.tProduto.Cancel;
  fdmFaca.cdsProduto.Cancel;
  if not fdmFaca.cdsProduto.FindKey([vProduto]) then
  begin
    dm1.tProduto.FindKey([vProduto]);
    dm1.tProduto.Delete;
  end;
  Close;
end;

procedure TfFaca.BitBtn5Click(Sender: TObject);
begin
//  if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,[mbOk,mbNo],0) = mrOk then
  //  fdmFaca.cdsProdutoCartoCor.Post;
end;

procedure TfFaca.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if fdmFaca.cdsProdutoCarto.State in [dsEdit,dsInsert] then
    BitBtn2Click(Sender);
end;

procedure TfFaca.FormCreate(Sender: TObject);
begin
  oActiveTables.OpenTables(True,Self);

  cdsFacaFD.Close;
  cdsFacaTP.Close;

  ctFacaFd := sdsFacaFD.CommandText;
  ctFacaTp := sdsFacaTP.CommandText;
end;

procedure TfFaca.procuraFacaFD;
var
  vTipo: String;
begin
  case RxDBComboBox11.ItemIndex of
    0: vTipo := '1';
    1: vTipo := '2';
    2: vTipo := '3';
    3: vTipo := '4';
  end;

  cdsFacaFD.Close;
  sdsFacaFD.CommandText := ctFacaFD;
  sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND REFERENCIA <> ' + fdmFaca.cdsProdutoREFERENCIA.AsString;
  if RxDBComboBox11.ItemIndex > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_TIPO_MAT = ' + vTipo;
  if fdmFaca.cdsProdutoCartoFD_COMPR.AsFloat > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_COMPR * 100 = ' + formatFloat('0',fdmFaca.cdsProdutoCartoFD_COMPR.AsFloat * 100);
  if fdmFaca.cdsProdutoCartoFD_LARGURA.AsFloat > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_LARGURA * 100 = ' + formatFloat('0',fdmFaca.cdsProdutoCartoFD_LARGURA.AsFloat * 100);
  if fdmFaca.cdsProdutoCartoFD_ALTURA.AsFloat > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_ALTURA * 100 = ' + formatFloat('0',fdmFaca.cdsProdutoCartoFD_ALTURA.AsFloat * 100);
  if fdmFaca.cdsProdutoCartoFD_ABA_INT_CAB.AsFloat > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_ABA_INT_CAB * 100 = ' + formatFloat('0',fdmFaca.cdsProdutoCartoFD_ABA_INT_CAB.AsFloat * 100);
  if fdmFaca.cdsProdutoCartoFD_ABA_INT_LAT.AsFloat > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_ABA_INT_LAT * 100 = ' + formatFloat('0',fdmFaca.cdsProdutoCartoFD_ABA_INT_LAT.AsFloat * 100);
  cdsFacaFD.Open;
end;

procedure TfFaca.procuraFacaTP;
var
  vTipo: String;
begin
  case RxDBComboBox11.ItemIndex of
    0: vTipo := '1';
    1: vTipo := '2';
    2: vTipo := '3';
    3: vTipo := '4';
  end;

  cdsFacaTP.Close;
  sdsFacaTP.CommandText := ctFacaTP;
  sdsFacaTP.CommandText := sdsFacaTP.CommandText + ' AND REFERENCIA <> ' + fdmFaca.cdsProdutoREFERENCIA.AsString;
  if RxDBComboBox11.ItemIndex > 0 then
    sdsFacaTP.CommandText := sdsFacaTP.CommandText + ' AND TP_TIPO_MAT = ' + vTipo;

  if fdmFaca.cdsProdutoCartoFD_COMPR.AsFloat > 0 then
    sdsFacaTP.CommandText := sdsFacaTP.CommandText + ' AND FD_COMPR * 100 = ' + formatFloat('0',fdmFaca.cdsProdutoCartoFD_COMPR.AsFloat * 100);
  if fdmFaca.cdsProdutoCartoFD_LARGURA.AsFloat > 0 then
    sdsFacaTP.CommandText := sdsFacaTP.CommandText + ' AND FD_LARGURA * 100 = ' + formatFloat('0',fdmFaca.cdsProdutoCartoFD_LARGURA.AsFloat * 100);

  if fdmFaca.cdsProdutoCartoTP_ABA_EXT_CAB.AsFloat > 0 then
    sdsFacaTP.CommandText := sdsFacaTP.CommandText + ' AND TP_ABA_EXT_CAB * 100 = ' + formatFloat('0',fdmFaca.cdsProdutoCartoTP_ABA_EXT_CAB.AsFloat * 100);
  if fdmFaca.cdsProdutoCartoTP_ABA_INT_CAB.AsFloat > 0 then
    sdsFacaTP.CommandText := sdsFacaTP.CommandText + ' AND TP_ABA_INT_CAB * 100 = ' + formatFloat('0',fdmFaca.cdsProdutoCartoTP_ABA_INT_CAB.AsFloat * 100);
  if fdmFaca.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat > 0 then
    sdsFacaTP.CommandText := sdsFacaTP.CommandText + ' AND TP_ABA_INT_LAT * 100 = ' + formatFloat('0',fdmFaca.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat * 100);
  if fdmFaca.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat > 0 then
    sdsFacaTP.CommandText := sdsFacaTP.CommandText + ' AND TP_ABA_EXT_LAT * 100 = ' + formatFloat('0',fdmFaca.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat * 100);
  cdsFacaTP.Open;
end;

procedure TfFaca.DBEdit2Exit(Sender: TObject);
begin
  procuraFacaFD;
  procuraFacaTP;
  RxDBComboBox1.Text := cdsFacaFDREFERENCIA.AsString;
  RxDBComboBox2.Text := cdsFacaTPREFERENCIA.AsString;
end;

procedure TfFaca.FormShow(Sender: TObject);
begin
  procuraFacaFD;
  procuraFacaTP;
end;

end.
