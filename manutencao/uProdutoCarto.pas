unit uProdutoCarto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, DBCtrls, Buttons,
  ComCtrls, ExtCtrls, RxLookup, rsDBUtils, Grids, DBGrids, SMDBGrid, RxDBComb, uDmProdutoCarto, db, uIntegracao, FMTBcd,
  DBTables, DBClient, Provider, SqlExpr, ToolEdit, CurrEdit;                                                                                   

type
  TfProdutoCarto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    BitBtn3: TBitBtn;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label58: TLabel;
    DBEdit79: TDBEdit;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
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
    TabSheet1: TTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel4: TPanel;
    Label14: TLabel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    Label15: TLabel;
    DBCheckBox12: TDBCheckBox;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Panel6: TPanel;
    Label21: TLabel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    SMDBGrid2: TSMDBGrid;
    TabSheet4: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    Label27: TLabel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    SMDBGrid3: TSMDBGrid;
    Label28: TLabel;
    Label29: TLabel;
    Label17: TLabel;
    Label25: TLabel;
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
    Label37: TLabel;
    DBEdit15: TDBEdit;
    Label38: TLabel;
    DBEdit16: TDBEdit;
    Label39: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Label40: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    Label41: TLabel;
    RxDBLookupCombo8: TRxDBLookupCombo;
    Panel3: TPanel;
    Label1: TLabel;
    Label10: TLabel;
    Label18: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label11: TLabel;
    Label19: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox7: TRxDBComboBox;
    RxDBLookupCombo5: TRxDBLookupCombo;
    RxDBLookupCombo6: TRxDBLookupCombo;
    RxDBComboBox14: TRxDBComboBox;
    RxDBLookupCombo11: TRxDBLookupCombo;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    RxDBComboBox15: TRxDBComboBox;
    RxDBLookupCombo12: TRxDBLookupCombo;
    RxDBComboBox18: TRxDBComboBox;
    RxDBComboBox19: TRxDBComboBox;
    RxDBComboBox2: TRxDBComboBox;
    DBCheckBox28: TDBCheckBox;
    DBCheckBox29: TDBCheckBox;
    DBCheckBox30: TDBCheckBox;
    DBCheckBox31: TDBCheckBox;
    DBCheckBox32: TDBCheckBox;
    DBCheckBox33: TDBCheckBox;
    DBCheckBox34: TDBCheckBox;
    DBCheckBox35: TDBCheckBox;
    DBCheckBox36: TDBCheckBox;
    DBCheckBox37: TDBCheckBox;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    RxDBComboBox8: TRxDBComboBox;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    RxDBComboBox20: TRxDBComboBox;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    RxDBComboBox21: TRxDBComboBox;
    DBEdit29: TDBEdit;
    DBEdit31: TDBEdit;
    RxDBComboBox22: TRxDBComboBox;
    RxDBComboBox23: TRxDBComboBox;
    RxDBComboBox24: TRxDBComboBox;
    RxDBComboBox25: TRxDBComboBox;
    RxDBComboBox26: TRxDBComboBox;
    RxDBComboBox27: TRxDBComboBox;
    RxDBComboBox28: TRxDBComboBox;
    Label48: TLabel;
    DBCheckBox38: TDBCheckBox;
    qMaterial: TQuery;
    dsqMaterial: TDataSource;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    Label9: TLabel;
    Label20: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    RxDBComboBox3: TRxDBComboBox;
    RxDBComboBox6: TRxDBComboBox;
    RxDBLookupCombo13: TRxDBLookupCombo;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    RxDBComboBox16: TRxDBComboBox;
    RxDBLookupCombo14: TRxDBLookupCombo;
    RxDBComboBox17: TRxDBComboBox;
    RxDBComboBox29: TRxDBComboBox;
    RxDBComboBox30: TRxDBComboBox;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox39: TDBCheckBox;
    DBCheckBox40: TDBCheckBox;
    DBCheckBox41: TDBCheckBox;
    DBCheckBox42: TDBCheckBox;
    DBCheckBox43: TDBCheckBox;
    DBCheckBox44: TDBCheckBox;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    RxDBComboBox31: TRxDBComboBox;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    RxDBComboBox32: TRxDBComboBox;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    RxDBComboBox33: TRxDBComboBox;
    DBEdit43: TDBEdit;
    DBEdit46: TDBEdit;
    RxDBComboBox34: TRxDBComboBox;
    RxDBComboBox35: TRxDBComboBox;
    RxDBComboBox36: TRxDBComboBox;
    RxDBComboBox37: TRxDBComboBox;
    RxDBComboBox38: TRxDBComboBox;
    RxDBComboBox39: TRxDBComboBox;
    RxDBComboBox40: TRxDBComboBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label43: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    DBCheckBox19: TDBCheckBox;
    RxDBLookupCombo4: TRxDBLookupCombo;
    RxDBLookupCombo9: TRxDBLookupCombo;
    RxDBLookupCombo10: TRxDBLookupCombo;
    DBCheckBox22: TDBCheckBox;
    DBCheckBox23: TDBCheckBox;
    RxDBComboBox9: TRxDBComboBox;
    RxDBComboBox12: TRxDBComboBox;
    RxDBLookupCombo15: TRxDBLookupCombo;
    DBCheckBox24: TDBCheckBox;
    DBCheckBox25: TDBCheckBox;
    RxDBComboBox41: TRxDBComboBox;
    RxDBLookupCombo16: TRxDBLookupCombo;
    RxDBComboBox42: TRxDBComboBox;
    RxDBComboBox43: TRxDBComboBox;
    RxDBComboBox44: TRxDBComboBox;
    DBCheckBox26: TDBCheckBox;
    DBCheckBox27: TDBCheckBox;
    DBCheckBox45: TDBCheckBox;
    DBCheckBox46: TDBCheckBox;
    DBCheckBox47: TDBCheckBox;
    DBCheckBox48: TDBCheckBox;
    DBCheckBox49: TDBCheckBox;
    DBCheckBox50: TDBCheckBox;
    DBCheckBox51: TDBCheckBox;
    DBCheckBox52: TDBCheckBox;
    DBEdit47: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    RxDBComboBox45: TRxDBComboBox;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    RxDBComboBox46: TRxDBComboBox;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    RxDBComboBox47: TRxDBComboBox;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    RxDBComboBox48: TRxDBComboBox;
    RxDBComboBox49: TRxDBComboBox;
    RxDBComboBox50: TRxDBComboBox;
    RxDBComboBox51: TRxDBComboBox;
    RxDBComboBox52: TRxDBComboBox;
    RxDBComboBox53: TRxDBComboBox;
    RxDBComboBox54: TRxDBComboBox;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    Label79: TLabel;
    RxDBComboBox55: TRxDBComboBox;
    RxDBLookupCombo17: TRxDBLookupCombo;
    RxDBLookupCombo18: TRxDBLookupCombo;
    RxDBLookupCombo19: TRxDBLookupCombo;
    RxDBLookupCombo20: TRxDBLookupCombo;
    RxDBLookupCombo21: TRxDBLookupCombo;
    RxDBLookupCombo22: TRxDBLookupCombo;
    Label16: TLabel;
    Label42: TLabel;
    RxDBLookupCombo23: TRxDBLookupCombo;
    RxDBLookupCombo24: TRxDBLookupCombo;
    RxDBLookupCombo25: TRxDBLookupCombo;
    RxDBLookupCombo26: TRxDBLookupCombo;
    RxDBLookupCombo27: TRxDBLookupCombo;
    RxDBLookupCombo28: TRxDBLookupCombo;
    Label80: TLabel;
    Label81: TLabel;
    RxDBLookupCombo29: TRxDBLookupCombo;
    RxDBLookupCombo30: TRxDBLookupCombo;
    RxDBLookupCombo31: TRxDBLookupCombo;
    RxDBLookupCombo32: TRxDBLookupCombo;
    RxDBLookupCombo33: TRxDBLookupCombo;
    RxDBLookupCombo34: TRxDBLookupCombo;
    Label82: TLabel;
    Label83: TLabel;
    qGrupo: TQuery;
    dsqGrupo: TDataSource;
    Label84: TLabel;
    RxDBLookupCombo35: TRxDBLookupCombo;
    Label87: TLabel;
    DBMemo1: TDBMemo;
    SMDBGrid4: TSMDBGrid;
    sdsFacaFD: TSQLDataSet;
    IntegerField5: TIntegerField;
    dspFacaFD: TDataSetProvider;
    cdsFacaFD: TClientDataSet;
    dsFacaFD: TDataSource;
    sdsFacaFDFD_COMPR: TFMTBCDField;
    sdsFacaFDFD_LARGURA: TFMTBCDField;
    sdsFacaFDFD_ALTURA: TFMTBCDField;
    sdsFacaFDFD_ABA_INT_CAB: TFMTBCDField;
    sdsFacaFDFD_ABA_INT_LAT: TFMTBCDField;
    cdsFacaFDCODIGO: TIntegerField;
    cdsFacaFDFD_COMPR: TFMTBCDField;
    cdsFacaFDFD_LARGURA: TFMTBCDField;
    cdsFacaFDFD_ALTURA: TFMTBCDField;
    cdsFacaFDFD_ABA_INT_CAB: TFMTBCDField;
    cdsFacaFDFD_ABA_INT_LAT: TFMTBCDField;
    BitBtn11: TBitBtn;
    tProdutoIns: TTable;
    tProdutoInsCodigo: TIntegerField;
    Label85: TLabel;
    Label86: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    SMDBGrid5: TSMDBGrid;
    SMDBGrid6: TSMDBGrid;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    sdsFacaTP: TSQLDataSet;
    dspFacaTP: TDataSetProvider;
    cdsFacaTP: TClientDataSet;
    dsFacaTP: TDataSource;
    sdsFacaSP: TSQLDataSet;
    dspFacaSP: TDataSetProvider;
    cdsFacaSP: TClientDataSet;
    dsFacaSP: TDataSource;
    sdsFacaTPCODIGO: TIntegerField;
    sdsFacaTPTP_ABA_EXT_CAB: TFMTBCDField;
    sdsFacaTPTP_ABA_INT_CAB: TFMTBCDField;
    sdsFacaTPTP_ABA_EXT_LAT: TFMTBCDField;
    sdsFacaTPTP_ABA_INT_LAT: TFMTBCDField;
    cdsFacaTPCODIGO: TIntegerField;
    cdsFacaTPTP_ABA_EXT_CAB: TFMTBCDField;
    cdsFacaTPTP_ABA_INT_CAB: TFMTBCDField;
    cdsFacaTPTP_ABA_EXT_LAT: TFMTBCDField;
    cdsFacaTPTP_ABA_INT_LAT: TFMTBCDField;
    sdsFacaSPCODIGO: TIntegerField;
    sdsFacaSPSP_COMPR: TFMTBCDField;
    sdsFacaSPSP_LARGURA: TFMTBCDField;
    sdsFacaSPSP_ALTURA: TFMTBCDField;
    sdsFacaSPSP_ABA_INT_CAB: TFMTBCDField;
    sdsFacaSPSP_ABA_INT_LAT: TFMTBCDField;
    cdsFacaSPCODIGO: TIntegerField;
    cdsFacaSPSP_COMPR: TFMTBCDField;
    cdsFacaSPSP_LARGURA: TFMTBCDField;
    cdsFacaSPSP_ALTURA: TFMTBCDField;
    cdsFacaSPSP_ABA_INT_CAB: TFMTBCDField;
    cdsFacaSPSP_ABA_INT_LAT: TFMTBCDField;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    sdsFacaFDFD_COPIAS_L: TSmallintField;
    sdsFacaFDFD_COPIAS_C: TSmallintField;
    sdsFacaTPTP_COPIAS_C: TSmallintField;
    sdsFacaTPTP_COPIAS_L: TSmallintField;
    sdsFacaSPSP_COPIAS_C: TSmallintField;
    sdsFacaSPSP_COPIAS_L: TSmallintField;
    cdsFacaFDFD_COPIAS_L: TSmallintField;
    cdsFacaFDFD_COPIAS_C: TSmallintField;
    cdsFacaTPTP_COPIAS_C: TSmallintField;
    cdsFacaTPTP_COPIAS_L: TSmallintField;
    cdsFacaSPSP_COPIAS_C: TSmallintField;
    cdsFacaSPSP_COPIAS_L: TSmallintField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBCheckBox28Click(Sender: TObject);
    procedure DBCheckBox30Click(Sender: TObject);
    procedure DBCheckBox29Click(Sender: TObject);
    procedure DBCheckBox31Click(Sender: TObject);
    procedure DBCheckBox36Click(Sender: TObject);
    procedure DBCheckBox33Click(Sender: TObject);
    procedure DBCheckBox34Click(Sender: TObject);
    procedure DBCheckBox35Click(Sender: TObject);
    procedure DBCheckBox32Click(Sender: TObject);
    procedure DBCheckBox15Click(Sender: TObject);
    procedure DBCheckBox16Click(Sender: TObject);
    procedure DBCheckBox17Click(Sender: TObject);
    procedure DBCheckBox18Click(Sender: TObject);
    procedure DBCheckBox43Click(Sender: TObject);
    procedure DBCheckBox40Click(Sender: TObject);
    procedure DBCheckBox41Click(Sender: TObject);
    procedure DBCheckBox42Click(Sender: TObject);
    procedure DBCheckBox39Click(Sender: TObject);
    procedure RxDBComboBox6Change(Sender: TObject);
    procedure RxDBComboBox16Change(Sender: TObject);
    procedure RxDBComboBox14Change(Sender: TObject);
    procedure RxDBComboBox15Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxDBLookupCombo23Change(Sender: TObject);
    procedure RxDBLookupCombo25Change(Sender: TObject);
    procedure RxDBLookupCombo27Change(Sender: TObject);
    procedure RxDBLookupCombo17Change(Sender: TObject);
    procedure RxDBLookupCombo19Change(Sender: TObject);
    procedure RxDBLookupCombo21Change(Sender: TObject);
    procedure RxDBLookupCombo29Change(Sender: TObject);
    procedure RxDBLookupCombo31Change(Sender: TObject);
    procedure RxDBLookupCombo33Change(Sender: TObject);
    procedure RxDBLookupCombo24Change(Sender: TObject);
    procedure RxDBLookupCombo26Change(Sender: TObject);
    procedure RxDBLookupCombo28Change(Sender: TObject);
    procedure RxDBLookupCombo18Change(Sender: TObject);
    procedure RxDBLookupCombo20Change(Sender: TObject);
    procedure RxDBLookupCombo22Change(Sender: TObject);
    procedure RxDBLookupCombo30Change(Sender: TObject);
    procedure RxDBLookupCombo32Change(Sender: TObject);
    procedure RxDBLookupCombo34Change(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit30Exit(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure SMDBGrid4DblClick(Sender: TObject);
    procedure SMDBGrid5DblClick(Sender: TObject);
    procedure SMDBGrid6DblClick(Sender: TObject);
  private
    { Private declarations }
    fDmProdutoCarto: TdmProdutoCarto;
    fDmFaca: TdmProdutoCarto;
    ctFacaFD, ctFacaTP, ctFacaSP: String;
    procedure calcula;
    procedure procuraFacaFD;
    procedure procuraFacaTP;
    procedure procuraFacaSP;
  public
    { Public declarations }
    property DmProdutoCarto: TDmProdutoCarto read fDmProdutoCarto write fDmProdutoCarto;
  end;

var
  fProdutoCarto: TfProdutoCarto;

implementation

uses UDM1, uProdutoCartoCor, uProdutoCartoR, DmdDatabase, uFaca, uDmAux;

{$R *.dfm}

procedure TfProdutoCarto.calcula;
begin
  dmProdutoCarto.cdsProdutoCartoFD_DIMENSAO1.AsFloat := (dmProdutoCarto.cdsProdutoCartoFD_ALTURA.AsFloat * 2) +
                                                        (dmProdutoCarto.cdsProdutoCartoFD_ABA_INT_CAB.AsFloat * 2) +
                                                        dmProdutoCarto.cdsProdutoCartoFD_COMPR.AsFloat;
  dmProdutoCarto.cdsProdutoCartoFD_DIMENSAO2.AsFloat := (dmProdutoCarto.cdsProdutoCartoFD_ALTURA.AsFloat * 2) +
                                                        (dmProdutoCarto.cdsProdutoCartoFD_ABA_INT_LAT.AsFloat * 2) +
                                                        dmProdutoCarto.cdsProdutoCartoFD_LARGURA.AsFloat; 
  case RxDBComboBox5.ItemIndex of
    0: begin  //duplex
         dmProdutoCarto.cdsProdutoCartoTP_DIMENSAO1.AsFloat := (dmProdutoCarto.cdsProdutoCartoFD_COMPR.AsFloat + 0.4) +
                                                        (dmProdutoCarto.cdsProdutoCartoTP_ABA_EXT_CAB.AsFloat * 2) +
                                                        (dmProdutoCarto.cdsProdutoCartoTP_ABA_INT_CAB.AsFloat * 2);
         dmProdutoCarto.cdsProdutoCartoTP_DIMENSAO2.AsFloat := (dmProdutoCarto.cdsProdutoCartoFD_LARGURA.AsFloat + 0.3) +
                                                        (dmProdutoCarto.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat * 2) +
                                                        (dmProdutoCarto.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat * 2);
       end;
    1: begin  //micro
         dmProdutoCarto.cdsProdutoCartoTP_DIMENSAO1.AsFloat := (dmProdutoCarto.cdsProdutoCartoFD_COMPR.AsFloat + 0.7) +
                                                        (dmProdutoCarto.cdsProdutoCartoTP_ABA_EXT_CAB.AsFloat * 2) +
                                                        (dmProdutoCarto.cdsProdutoCartoTP_ABA_INT_CAB.AsFloat * 2);
         dmProdutoCarto.cdsProdutoCartoTP_DIMENSAO2.AsFloat := (dmProdutoCarto.cdsProdutoCartoFD_LARGURA.AsFloat + 0.5) +
                                                        (dmProdutoCarto.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat * 2) +
                                                        (dmProdutoCarto.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat * 2);
       end;
    2: begin  //cartao/cartao
         dmProdutoCarto.cdsProdutoCartoTP_DIMENSAO1.AsFloat := (dmProdutoCarto.cdsProdutoCartoFD_COMPR.AsFloat + 0.5) +
                                                        (dmProdutoCarto.cdsProdutoCartoTP_ABA_EXT_CAB.AsFloat * 2) +
                                                        (dmProdutoCarto.cdsProdutoCartoTP_ABA_INT_CAB.AsFloat * 2);
         dmProdutoCarto.cdsProdutoCartoTP_DIMENSAO2.AsFloat := (dmProdutoCarto.cdsProdutoCartoFD_LARGURA.AsFloat + 0.5) +
                                                        (dmProdutoCarto.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat * 2) +
                                                        (dmProdutoCarto.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat * 2);
       end;
    3: begin  //micro / abas internas
         dmProdutoCarto.cdsProdutoCartoTP_DIMENSAO1.AsFloat := (dmProdutoCarto.cdsProdutoCartoFD_COMPR.AsFloat + 0.7) +
                                                        (dmProdutoCarto.cdsProdutoCartoTP_ABA_EXT_CAB.AsFloat * 2) +
                                                        (dmProdutoCarto.cdsProdutoCartoTP_ABA_INT_CAB.AsFloat * 2);
         dmProdutoCarto.cdsProdutoCartoTP_DIMENSAO2.AsFloat := (dmProdutoCarto.cdsProdutoCartoFD_LARGURA.AsFloat + 0.5) +
                                                        (dmProdutoCarto.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat * 2) +
                                                        (dmProdutoCarto.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat * 2);
       end;
  end;
end;

procedure TfProdutoCarto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDmFaca.Owner.ClassName = Self.ClassName then
    FreeAndNil(fDmFaca);

  oActiveTables.OpenTables(False,Self);
  Action := caFree;
end;

procedure TfProdutoCarto.FormShow(Sender: TObject);
begin
  qMaterial.Open;
  PageControl1.ActivePageIndex := 0;
  RxDBLookupCombo23Change(Sender);
  RxDBLookupCombo25Change(Sender);
  RxDBLookupCombo27Change(Sender);
  RxDBLookupCombo24Change(Sender);
  RxDBLookupCombo26Change(Sender);
  RxDBLookupCombo28Change(Sender);
  RxDBLookupCombo17Change(Sender);
  RxDBLookupCombo19Change(Sender);
  RxDBLookupCombo21Change(Sender);
  RxDBLookupCombo18Change(Sender);
  RxDBLookupCombo20Change(Sender);
  RxDBLookupCombo22Change(Sender);
  RxDBLookupCombo29Change(Sender);
  RxDBLookupCombo30Change(Sender);
  RxDBLookupCombo31Change(Sender);
  RxDBLookupCombo32Change(Sender);
  RxDBLookupCombo33Change(Sender);
  RxDBLookupCombo34Change(Sender);

  ctFacaFd := sdsFacaFD.CommandText;
  ctFacaTp := sdsFacaTP.CommandText;
  ctFacaSp := sdsFacaSP.CommandText;

  procuraFacaFD;
  procuraFacaTP;
  procuraFacaSP;
end;

procedure TfProdutoCarto.BitBtn10Click(Sender: TObject);
begin
  if RxDBComboBox5.ItemIndex < 0 then
  begin
    ShowMessage('Selecione o material da tampa!');
    RxDBComboBox5.SetFocus;
    Exit;
  end;
  calcula;
end;

procedure TfProdutoCarto.BitBtn1Click(Sender: TObject);
begin
  dm1.tProduto.Post;
  Prc_Gravar_Produto_FB(DM1.tProdutoCodigo.AsInteger);
  fDmProdutoCarto.cdsProduto.Post;
  fDmProdutoCarto.cdsProduto.ApplyUpdates(0);
  Close;
end;

procedure TfProdutoCarto.BitBtn2Click(Sender: TObject);
begin
  dm1.tProduto.Cancel;
  fDmProdutoCarto.cdsProduto.Cancel;
  Close;
end;

procedure TfProdutoCarto.BitBtn4Click(Sender: TObject);
begin
  fProdutoCartoCor := TfProdutoCartoCor.Create(Self);
  fProdutoCarto.dmProdutoCarto := fdmProdutoCarto;
  fProdutoCartoCor.ShowModal;
end;

procedure TfProdutoCarto.BitBtn5Click(Sender: TObject);
begin
//  if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,[mbOk,mbNo],0) = mrOk then
  //  fDmProdutoCarto.cdsProdutoCartoCor.Post;
end;

procedure TfProdutoCarto.BitBtn3Click(Sender: TObject);
begin
  fProdutoCartoR := TfProdutoCartoR.Create(Self);
  fProdutoCartoR.dmProdutoCarto := fdmProdutoCarto;
  fProdutoCartoR.RLReport1.Preview;
  Close;
end;

procedure TfProdutoCarto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  if dmProdutoCarto.cdsProduto.State in [dsEdit] then
//    BitBtn1Click(Sender);
end;

procedure TfProdutoCarto.DBCheckBox28Click(Sender: TObject);
begin
  if not DBCheckBox28.Checked then
    RxDBComboBox2.ItemIndex := -1;
end;

procedure TfProdutoCarto.DBCheckBox30Click(Sender: TObject);
begin
  if not DBCheckBox30.Checked then
    RxDBComboBox20.ItemIndex := -1;
end;

procedure TfProdutoCarto.DBCheckBox29Click(Sender: TObject);
begin
  if not DBCheckBox29.Checked then
    RxDBComboBox8.ItemIndex := -1;
end;

procedure TfProdutoCarto.DBCheckBox31Click(Sender: TObject);
begin
  if not DBCheckBox31.Checked then
    RxDBComboBox21.ItemIndex := -1;
end;

procedure TfProdutoCarto.DBCheckBox36Click(Sender: TObject);
begin
  if not DBCheckBox36.Checked then
    RxDBComboBox22.ItemIndex := -1;
end;

procedure TfProdutoCarto.DBCheckBox33Click(Sender: TObject);
begin
  if not DBCheckBox31.Checked then
  begin
    RxDBComboBox23.ItemIndex := -1;
    RxDBComboBox28.ItemIndex := -1;
  end;
end;

procedure TfProdutoCarto.DBCheckBox34Click(Sender: TObject);
begin
  if not DBCheckBox34.Checked then
  begin
    RxDBComboBox24.ItemIndex := -1;
    RxDBComboBox27.ItemIndex := -1;
  end;
end;

procedure TfProdutoCarto.DBCheckBox35Click(Sender: TObject);
begin
  if not DBCheckBox35.Checked then
    RxDBComboBox25.ItemIndex := -1;
end;

procedure TfProdutoCarto.DBCheckBox32Click(Sender: TObject);
begin
  if not DBCheckBox32.Checked then
    RxDBComboBox26.ItemIndex := -1;
end;

procedure TfProdutoCarto.DBCheckBox15Click(Sender: TObject);
begin
  if not DBCheckBox15.Checked then
    RxDBComboBox30.ItemIndex := -1;
end;

procedure TfProdutoCarto.DBCheckBox16Click(Sender: TObject);
begin
  if not DBCheckBox16.Checked then
    RxDBComboBox31.ItemIndex := -1;
end;

procedure TfProdutoCarto.DBCheckBox17Click(Sender: TObject);
begin
  if not DBCheckBox17.Checked then
    RxDBComboBox32.ItemIndex := -1;
end;

procedure TfProdutoCarto.DBCheckBox18Click(Sender: TObject);
begin
  if not DBCheckBox18.Checked then
    RxDBComboBox33.ItemIndex := -1;
end;

procedure TfProdutoCarto.DBCheckBox43Click(Sender: TObject);
begin
  if not DBCheckBox43.Checked then
    RxDBComboBox32.ItemIndex := -1;
end;

procedure TfProdutoCarto.DBCheckBox40Click(Sender: TObject);
begin
  if not DBCheckBox40.Checked then
  begin
    RxDBComboBox35.ItemIndex := -1;
    RxDBComboBox40.ItemIndex := -1;
  end;
end;

procedure TfProdutoCarto.DBCheckBox41Click(Sender: TObject);
begin
  if not DBCheckBox41.Checked then
  begin
    RxDBComboBox36.ItemIndex := -1;
    RxDBComboBox39.ItemIndex := -1;
  end;
end;

procedure TfProdutoCarto.DBCheckBox42Click(Sender: TObject);
begin
  if not DBCheckBox42.Checked then
    RxDBComboBox37.ItemIndex := -1;
end;

procedure TfProdutoCarto.DBCheckBox39Click(Sender: TObject);
begin
  if not DBCheckBox39.Checked then
    RxDBComboBox38.ItemIndex := -1;
end;

procedure TfProdutoCarto.RxDBComboBox6Change(Sender: TObject);
begin
  if RxDBComboBox6.ItemIndex < 1 then
  begin
    RxDBLookupCombo13.ClearValue;
    RxDBComboBox17.ItemIndex := -1;
    DBCheckBox8.Checked      := False;
    DBCheckBox9.Checked      := False;
    RxDBLookupCombo13.ReadOnly := True;
    RxDBComboBox17.Enabled     := False;
    DBCheckBox8.ReadOnly       := True;
    DBCheckBox9.ReadOnly       := True;
  end
  else
  begin
    RxDBLookupCombo13.ReadOnly := False;
    RxDBComboBox17.Enabled     := True;
    DBCheckBox8.ReadOnly       := False;
    DBCheckBox9.ReadOnly       := False;
  end;
end;

procedure TfProdutoCarto.RxDBComboBox16Change(Sender: TObject);
begin
  if RxDBComboBox16.ItemIndex < 1 then
  begin
    RxDBLookupCombo14.ClearValue;
    RxDBComboBox29.ItemIndex := -1;
    DBCheckBox13.Checked      := False;
    DBCheckBox14.Checked      := False;
    RxDBLookupCombo14.ReadOnly := True;
    RxDBComboBox29.Enabled     := False;
    DBCheckBox13.ReadOnly       := True;
    DBCheckBox14.ReadOnly       := True;
  end
  else
  begin
    RxDBLookupCombo14.ReadOnly := False;
    RxDBComboBox29.Enabled     := True;
    DBCheckBox13.ReadOnly      := False;
    DBCheckBox14.ReadOnly      := False;
  end;
end;

procedure TfProdutoCarto.RxDBComboBox14Change(Sender: TObject);
begin
  if RxDBComboBox14.ItemIndex < 1 then
  begin
    RxDBLookupCombo11.ClearValue;
    RxDBComboBox18.ItemIndex := -1;
    DBCheckBox6.Checked      := False;
    DBCheckBox7.Checked      := False;
    RxDBLookupCombo11.ReadOnly := True;
    RxDBComboBox18.Enabled     := False;
    DBCheckBox6.ReadOnly       := True;
    DBCheckBox7.ReadOnly       := True;
  end
  else
  begin
    RxDBLookupCombo11.ReadOnly := False;
    RxDBComboBox18.Enabled     := True;
    DBCheckBox6.ReadOnly       := False;
    DBCheckBox7.ReadOnly       := False;
  end;
end;

procedure TfProdutoCarto.RxDBComboBox15Change(Sender: TObject);
begin
  if RxDBComboBox15.ItemIndex < 1 then
  begin
    RxDBLookupCombo12.ClearValue;
    RxDBComboBox19.ItemIndex  := -1;
    DBCheckBox10.Checked      := False;
    DBCheckBox11.Checked      := False;
    RxDBLookupCombo12.ReadOnly := True;
    RxDBComboBox19.Enabled     := False;
    DBCheckBox10.ReadOnly      := True;
    DBCheckBox11.ReadOnly      := True;
  end
  else
  begin
    RxDBLookupCombo12.ReadOnly := False;
    RxDBComboBox19.Enabled     := True;
    DBCheckBox10.ReadOnly      := False;
    DBCheckBox11.ReadOnly      := False;
  end;
end;

procedure TfProdutoCarto.FormCreate(Sender: TObject);
begin
  if not Assigned(DmAux) then
    DmAux := TDmAux.Create(Self);

  if not Assigned(fDmFaca) then
    fDmFaca := TDmProdutoCarto.Create(Self);

  oActiveTables.OpenTables(True,Self);
  qGrupo.Open;
  qMaterial.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo23Change(Sender: TObject);
begin
  DmAux.qGrupoItemFD1.Close;
  DmAux.qGrupoItemFD1.ParamByName('G1').AsInteger := fDmProdutoCarto.cdsProdutoCartoFDGRUPO1.AsInteger;
  DmAux.qGrupoItemFD1.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo25Change(Sender: TObject);
begin
  DmAux.qGrupoItemFD2.Close;
  DmAux.qGrupoItemFD2.ParamByName('G1').AsInteger := fDmProdutoCarto.cdsProdutoCartoFDGRUPO2.AsInteger;
  DmAux.qGrupoItemFD2.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo27Change(Sender: TObject);
begin
  DmAux.qGrupoItemFD3.Close;
  DmAux.qGrupoItemFD3.ParamByName('G1').AsInteger := fDmProdutoCarto.cdsProdutoCartoFDGRUPO3.AsInteger;
  DmAux.qGrupoItemFD3.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo17Change(Sender: TObject);
begin
  DmAux.qGrupoItemTP1.Close;
  DmAux.qGrupoItemTP1.ParamByName('G1').AsInteger := fDmProdutoCarto.cdsProdutoCartoTPGRUPO1.AsInteger;
  DmAux.qGrupoItemTP1.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo19Change(Sender: TObject);
begin
  DmAux.qGrupoItemTP2.Close;
  DmAux.qGrupoItemTP2.ParamByName('G1').AsInteger := fDmProdutoCarto.cdsProdutoCartoTPGRUPO2.AsInteger;
  DmAux.qGrupoItemTP2.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo21Change(Sender: TObject);
begin
  DmAux.qGrupoItemTP3.Close;
  DmAux.qGrupoItemTP3.ParamByName('G1').AsInteger := fDmProdutoCarto.cdsProdutoCartoTPGRUPO3.AsInteger;
  DmAux.qGrupoItemTP3.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo29Change(Sender: TObject);
begin
  DmAux.qGrupoItemSP1.Close;
  DmAux.qGrupoItemSP1.ParamByName('G1').AsInteger := fDmProdutoCarto.cdsProdutoCartoSPGRUPO1.AsInteger;
  DmAux.qGrupoItemSP1.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo31Change(Sender: TObject);
begin
  DmAux.qGrupoItemSP2.Close;
  DmAux.qGrupoItemSP2.ParamByName('G1').AsInteger := fDmProdutoCarto.cdsProdutoCartoSPGRUPO2.AsInteger;
  DmAux.qGrupoItemSP2.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo33Change(Sender: TObject);
begin
  DmAux.qGrupoItemSP3.Close;
  DmAux.qGrupoItemSP3.ParamByName('G1').AsInteger := fDmProdutoCarto.cdsProdutoCartoSPGRUPO3.AsInteger;
  DmAux.qGrupoItemSP3.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo24Change(Sender: TObject);
begin
  DmAux.qMaterialFD1.Close;
  DmAux.qMaterialFD1.ParamByName('G1').AsInteger  := fDmProdutoCarto.cdsProdutoCartoFDGRUPO1.AsInteger;
  DmAux.qMaterialFD1.ParamByName('SG1').AsInteger := fDmProdutoCarto.cdsProdutoCartoFDSUBGRUPO1.AsInteger;
  DmAux.qMaterialFD1.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo26Change(Sender: TObject);
begin
  DmAux.qMaterialFD2.Close;
  DmAux.qMaterialFD2.ParamByName('G1').AsInteger  := fDmProdutoCarto.cdsProdutoCartoFDGRUPO2.AsInteger;
  DmAux.qMaterialFD2.ParamByName('SG1').AsInteger := fDmProdutoCarto.cdsProdutoCartoFDSUBGRUPO2.AsInteger;
  DmAux.qMaterialFD2.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo28Change(Sender: TObject);
begin
  DmAux.qMaterialFD3.Close;
  DmAux.qMaterialFD3.ParamByName('G1').AsInteger  := fDmProdutoCarto.cdsProdutoCartoFDGRUPO3.AsInteger;
  DmAux.qMaterialFD3.ParamByName('SG1').AsInteger := fDmProdutoCarto.cdsProdutoCartoFDSUBGRUPO3.AsInteger;
  DmAux.qMaterialFD3.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo18Change(Sender: TObject);
begin
  DmAux.qMaterialTP1.Close;
  DmAux.qMaterialTP1.ParamByName('G1').AsInteger  := fDmProdutoCarto.cdsProdutoCartoTPGRUPO1.AsInteger;
  DmAux.qMaterialTP1.ParamByName('SG1').AsInteger := fDmProdutoCarto.cdsProdutoCartoTPSUBGRUPO1.AsInteger;
  DmAux.qMaterialTP1.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo20Change(Sender: TObject);
begin
  DmAux.qMaterialTP2.Close;
  DmAux.qMaterialTP2.ParamByName('G1').AsInteger  := fDmProdutoCarto.cdsProdutoCartoTPGRUPO2.AsInteger;
  DmAux.qMaterialTP2.ParamByName('SG1').AsInteger := fDmProdutoCarto.cdsProdutoCartoTPSUBGRUPO2.AsInteger;
  DmAux.qMaterialTP2.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo22Change(Sender: TObject);
begin
  DmAux.qMaterialTP3.Close;
  DmAux.qMaterialTP3.ParamByName('G1').AsInteger  := fDmProdutoCarto.cdsProdutoCartoTPGRUPO3.AsInteger;
  DmAux.qMaterialTP3.ParamByName('SG1').AsInteger := fDmProdutoCarto.cdsProdutoCartoTPSUBGRUPO3.AsInteger;
  DmAux.qMaterialTP3.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo30Change(Sender: TObject);
begin
  DmAux.qMaterialSP1.Close;
  DmAux.qMaterialSP1.ParamByName('G1').AsInteger  := fDmProdutoCarto.cdsProdutoCartoSPGRUPO1.AsInteger;
  DmAux.qMaterialSP1.ParamByName('SG1').AsInteger := fDmProdutoCarto.cdsProdutoCartoSPSUBGRUPO1.AsInteger;
  DmAux.qMaterialSP1.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo32Change(Sender: TObject);
begin
  DmAux.qMaterialSP2.Close;
  DmAux.qMaterialSP2.ParamByName('G1').AsInteger  := fDmProdutoCarto.cdsProdutoCartoSPGRUPO2.AsInteger;
  DmAux.qMaterialSP2.ParamByName('SG1').AsInteger := fDmProdutoCarto.cdsProdutoCartoSPSUBGRUPO2.AsInteger;
  DmAux.qMaterialSP2.Open;
end;

procedure TfProdutoCarto.RxDBLookupCombo34Change(Sender: TObject);
begin
  DmAux.qMaterialSP3.Close;
  DmAux.qMaterialSP3.ParamByName('G1').AsInteger  := fDmProdutoCarto.cdsProdutoCartoSPGRUPO3.AsInteger;
  DmAux.qMaterialSP3.ParamByName('SG1').AsInteger := fDmProdutoCarto.cdsProdutoCartoSPSUBGRUPO3.AsInteger;
  DmAux.qMaterialSP3.Open;
end;

procedure TfProdutoCarto.BitBtn11Click(Sender: TObject);
begin
  dm1.tProduto.Insert;
  DM1.tProdutoCodigo.AsInteger        := tProdutoInsCodigo.AsInteger + 1;
  dm1.tProdutoProdMat.AsString        := 'P';
  dm1.tProdutoMaterialOutros.AsString := 'P';
  dm1.tProdutoInativo.AsBoolean       := False;
  dm1.tProdutoOrigemProd.AsString     := '0';
  tProdutoIns.Close;
  dm1.tProduto.Post;

  Prc_Gravar_Produto_FB(DM1.tProdutoCodigo.AsInteger);

  fDmFaca.cdsProdutoCarto.Insert;
  fDmFaca.cdsProdutoCartoTIPO.AsString          := '5';
  fDmFaca.cdsProdutoCartoFD_TIPO_MAT.AsString   := fdmProdutoCarto.cdsProdutoCartoFD_TIPO_MAT.AsString;
  fDmFaca.cdsProdutoCartoFD_COMPR.AsFloat       := fDmProdutoCarto.cdsProdutoCartoFD_COMPR.AsFloat;
  fDmFaca.cdsProdutoCartoFD_LARGURA.AsFloat     := fDmProdutoCarto.cdsProdutoCartoFD_LARGURA.AsFloat;
  fDmFaca.cdsProdutoCartoFD_ALTURA.AsFloat      := fDmProdutoCarto.cdsProdutoCartoFD_ALTURA.AsFloat;
  fDmFaca.cdsProdutoCartoFD_ABA_INT_CAB.AsFloat := fDmProdutoCarto.cdsProdutoCartoFD_ABA_INT_CAB.AsFloat;
  fDmFaca.cdsProdutoCartoFD_ABA_INT_LAT.AsFloat := fDmProdutoCarto.cdsProdutoCartoFD_ABA_INT_LAT.AsFloat;

  fFaca := TfFaca.Create(Self);
  fFaca.dmFaca := fDmFaca;
  fFaca.ShowModal;
end;

procedure TfProdutoCarto.procuraFacaFD;
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
  if RxDBComboBox11.ItemIndex > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_TIPO_MAT = ' + vTipo;
  if fDmProdutoCarto.cdsProdutoCartoFD_COMPR.AsFloat > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_COMPR * 100 = ' + formatFloat('0',fDmProdutoCarto.cdsProdutoCartoFD_COMPR.AsFloat * 100);
  if fDmProdutoCarto.cdsProdutoCartoFD_LARGURA.AsFloat > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_LARGURA * 100 = ' + formatFloat('0',fDmProdutoCarto.cdsProdutoCartoFD_LARGURA.AsFloat * 100);
  if fDmProdutoCarto.cdsProdutoCartoFD_ALTURA.AsFloat > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_ALTURA * 100 = ' + formatFloat('0',fDmProdutoCarto.cdsProdutoCartoFD_ALTURA.AsFloat * 100);
  if fDmProdutoCarto.cdsProdutoCartoFD_ABA_INT_CAB.AsFloat > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_ABA_INT_CAB * 100 = ' + formatFloat('0',fDmProdutoCarto.cdsProdutoCartoFD_ABA_INT_CAB.AsFloat * 100);
  if fDmProdutoCarto.cdsProdutoCartoFD_ABA_INT_LAT.AsFloat > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_ABA_INT_LAT * 100 = ' + formatFloat('0',fDmProdutoCarto.cdsProdutoCartoFD_ABA_INT_LAT.AsFloat * 100);
  cdsFacaFD.Open;
end;

procedure TfProdutoCarto.DBEdit2Exit(Sender: TObject);
begin
  procuraFacaFD;
  procuraFacaTP;
  procuraFacaSP;
end;

procedure TfProdutoCarto.procuraFacaTP;
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
  if RxDBComboBox11.ItemIndex > 0 then
    sdsFacaTP.CommandText := sdsFacaTP.CommandText + ' AND TP_TIPO_MAT = ' + vTipo;

  if fDmProdutoCarto.cdsProdutoCartoFD_COMPR.AsFloat > 0 then
    sdsFacaTP.CommandText := sdsFacaTP.CommandText + ' AND FD_COMPR * 100 = ' + formatFloat('0',fDmProdutoCarto.cdsProdutoCartoFD_COMPR.AsFloat * 100);
  if fDmProdutoCarto.cdsProdutoCartoFD_LARGURA.AsFloat > 0 then
    sdsFacaTP.CommandText := sdsFacaTP.CommandText + ' AND FD_LARGURA * 100 = ' + formatFloat('0',fDmProdutoCarto.cdsProdutoCartoFD_LARGURA.AsFloat * 100);

  if fDmProdutoCarto.cdsProdutoCartoTP_ABA_EXT_CAB.AsFloat > 0 then
    sdsFacaTP.CommandText := sdsFacaTP.CommandText + ' AND TP_ABA_EXT_CAB * 100 = ' + formatFloat('0',fDmProdutoCarto.cdsProdutoCartoTP_ABA_EXT_CAB.AsFloat * 100);
  if fDmProdutoCarto.cdsProdutoCartoTP_ABA_INT_CAB.AsFloat > 0 then
    sdsFacaTP.CommandText := sdsFacaTP.CommandText + ' AND TP_ABA_INT_CAB * 100 = ' + formatFloat('0',fDmProdutoCarto.cdsProdutoCartoTP_ABA_INT_CAB.AsFloat * 100);
  if fDmProdutoCarto.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat > 0 then
    sdsFacaTP.CommandText := sdsFacaTP.CommandText + ' AND TP_ABA_INT_LAT * 100 = ' + formatFloat('0',fDmProdutoCarto.cdsProdutoCartoTP_ABA_INT_LAT.AsFloat * 100);
  if fDmProdutoCarto.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat > 0 then
    sdsFacaTP.CommandText := sdsFacaTP.CommandText + ' AND TP_ABA_EXT_LAT * 100 = ' + formatFloat('0',fDmProdutoCarto.cdsProdutoCartoTP_ABA_EXT_LAT.AsFloat * 100);
  cdsFacaTP.Open;
end;

procedure TfProdutoCarto.procuraFacaSP;
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
  if RxDBComboBox11.ItemIndex > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_TIPO_MAT = ' + vTipo;
  if fDmProdutoCarto.cdsProdutoCartoFD_COMPR.AsFloat > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_COMPR * 100 = ' + formatFloat('0',fDmProdutoCarto.cdsProdutoCartoFD_COMPR.AsFloat * 100);
  if fDmProdutoCarto.cdsProdutoCartoFD_LARGURA.AsFloat > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_LARGURA * 100 = ' + formatFloat('0',fDmProdutoCarto.cdsProdutoCartoFD_LARGURA.AsFloat * 100);
  if fDmProdutoCarto.cdsProdutoCartoFD_ALTURA.AsFloat > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_ALTURA * 100 = ' + formatFloat('0',fDmProdutoCarto.cdsProdutoCartoFD_ALTURA.AsFloat * 100);
  if fDmProdutoCarto.cdsProdutoCartoFD_ABA_INT_CAB.AsFloat > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_ABA_INT_CAB * 100 = ' + formatFloat('0',fDmProdutoCarto.cdsProdutoCartoFD_ABA_INT_CAB.AsFloat * 100);
  if fDmProdutoCarto.cdsProdutoCartoFD_ABA_INT_LAT.AsFloat > 0 then
    sdsFacaFD.CommandText := sdsFacaFD.CommandText + ' AND FD_ABA_INT_LAT * 100 = ' + formatFloat('0',fDmProdutoCarto.cdsProdutoCartoFD_ABA_INT_LAT.AsFloat * 100);
  cdsFacaFD.Open;
end;

procedure TfProdutoCarto.DBEdit6Exit(Sender: TObject);
begin
  procuraFacaTP;
end;

procedure TfProdutoCarto.DBEdit30Exit(Sender: TObject);
begin
  procuraFacaTP;
end;

procedure TfProdutoCarto.BitBtn12Click(Sender: TObject);
begin
  ShowMessage('Em desenvolvimento!');
end;

procedure TfProdutoCarto.BitBtn13Click(Sender: TObject);
begin
  ShowMessage('Em desenvolvimento!');
end;

procedure TfProdutoCarto.SMDBGrid4DblClick(Sender: TObject);
begin
  fDmProdutoCarto.cdsProdutoCartoFACA_FD.AsInteger := cdsFacaFDCODIGO.AsInteger;
end;

procedure TfProdutoCarto.SMDBGrid5DblClick(Sender: TObject);
begin
  fDmProdutoCarto.cdsProdutoCartoFACA_TP.AsInteger := cdsFacaTPCODIGO.AsInteger;
end;

procedure TfProdutoCarto.SMDBGrid6DblClick(Sender: TObject);
begin
  fDmProdutoCarto.cdsProdutoCartoFACA_SP.AsInteger := cdsFacaSPCODIGO.AsInteger;
end;

end.
