unit uFacaItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ComCtrls,
  rsDBUtils, uDmProdutoCarto, db, uIntegracao, DBTables, RxDBComb, ExtCtrls;

type
  TfFacaItem = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fDmProdutoCarto: TdmProdutoCarto;
    procedure calcula;
  public
    { Public declarations }
    property DmProdutoCarto: TDmProdutoCarto read fDmProdutoCarto write fDmProdutoCarto;
  end;

var
  fFacaItem: TfFacaItem;

implementation

uses UDM1;

{$R *.dfm}

procedure TfFacaItem.calcula;
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

procedure TfFacaItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  oActiveTables.OpenTables(False,Self);
  Action := caFree;
end;

procedure TfFacaItem.BitBtn10Click(Sender: TObject);
begin
  if RxDBComboBox5.ItemIndex < 0 then
  begin
    ShowMessage('Selecione o material da tampa!');
    RxDBComboBox5.SetFocus;
    Exit;
  end;
  calcula;
end;

procedure TfFacaItem.BitBtn1Click(Sender: TObject);
begin
  dm1.tProduto.Post;
  Prc_Gravar_Produto_FB(DM1.tProdutoCodigo.AsInteger);
  fDmProdutoCarto.cdsProduto.Post;
  fDmProdutoCarto.cdsProduto.ApplyUpdates(0);
  Close;
end;

procedure TfFacaItem.BitBtn2Click(Sender: TObject);
var
  vProduto: Integer;
begin
  vProduto := dm1.tProdutoCodigo.AsInteger;
  dm1.tProduto.Cancel;
  fDmProdutoCarto.cdsProduto.Cancel;
  if not fDmProdutoCarto.cdsProduto.FindKey([vProduto]) then
  begin
    dm1.tProduto.FindKey([vProduto]);
    dm1.tProduto.Delete;
  end;
  Close;
end;

procedure TfFacaItem.BitBtn5Click(Sender: TObject);
begin
//  if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,[mbOk,mbNo],0) = mrOk then
  //  fDmProdutoCarto.cdsProdutoCartoCor.Post;
end;

procedure TfFacaItem.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  if dmProdutoCarto.cdsProduto.State in [dsEdit] then
//    BitBtn1Click(Sender);
end;

procedure TfFacaItem.FormCreate(Sender: TObject);
begin
  oActiveTables.OpenTables(True,Self);
end;

end.
