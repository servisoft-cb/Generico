unit UGeraSintegra;

interface                      

uses                 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Buttons, Db, DBTables, MemTable, ExtCtrls,
  RxLookup, Variants;

type
  TfGeraSintegra = class(TForm)
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    DirectoryEdit1: TDirectoryEdit;
    mReg50: TMemoryTable;
    mReg50CNPJ: TStringField;
    mReg50InscEstadual: TStringField;
    mReg50DtEmissao: TDateField;
    mReg50UF: TStringField;
    mReg50Modelo: TStringField;
    mReg50Serie: TStringField;
    mReg50NumNota: TIntegerField;
    mReg50CodNatOper: TStringField;
    mReg50Emitente: TStringField;
    mReg50VlrTotal: TFloatField;
    mReg50VlrIcms: TFloatField;
    mReg50BaseIcms: TFloatField;
    mReg50VlrIsento: TFloatField;
    mReg50VlrOutras: TFloatField;
    mReg50AliqICMS: TFloatField;
    mReg50Situacao: TStringField;
    mReg54: TMemoryTable;
    mReg54CNPJ: TStringField;
    mReg54Serie: TStringField;
    mReg54Modelo: TStringField;
    mReg54CodNatOper: TStringField;
    mReg54CodSitTrib: TStringField;
    mReg54ItemNota: TIntegerField;
    mReg54CodProduto: TStringField;
    mReg54Qtde: TFloatField;
    mReg54VlrTotal: TFloatField;
    mReg54VlrDesconto: TFloatField;
    mReg54BaseIcms: TFloatField;
    mReg54VlrIPI: TFloatField;
    mReg54AliqICMS: TFloatField;
    mReg54NumNota: TIntegerField;
    mReg75: TMemoryTable;
    mReg75CodProduto: TStringField;
    mReg75ClasFiscal: TStringField;
    mReg75NomeProduto: TStringField;
    mReg75Unidade: TStringField;
    mReg75CodSitTrib: TStringField;
    mReg75AliqIPI: TFloatField;
    mReg75AliqICMS: TFloatField;
    mReg75PercRedBaseCalculo: TFloatField;
    mReg75TipoRegistro: TStringField;
    Label3: TLabel;
    Edit1: TEdit;
    mReg54GeraDupl: TBooleanField;
    qItNotaFiscal: TQuery;
    qItNotaFiscalNumNota: TIntegerField;
    qItNotaFiscalItem: TSmallintField;
    qItNotaFiscalGeraDupl: TBooleanField;
    Bevel1: TBevel;
    BitBtn5: TBitBtn;
    mReg54CodCor: TIntegerField;
    mReg75CodCor: TIntegerField;
    mReg51: TMemoryTable;
    mReg51CNPJ: TStringField;
    mReg51InscEstadual: TStringField;
    mReg51DtEmissao: TDateField;
    mReg51UF: TStringField;
    mReg51Serie: TStringField;
    mReg51NumNota: TIntegerField;
    mReg51CodNatOper: TStringField;
    mReg51VlrTotal: TFloatField;
    mReg51VlrIPI: TFloatField;
    mReg51VlrIpiIsento: TFloatField;
    mReg51VlrIpiOutros: TFloatField;
    mReg51Situacao: TStringField;
    mReg54Tamanho: TStringField;
    mReg75Tamanho: TStringField;
    Label4: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mReg50NewRecord(DataSet: TDataSet);
    procedure mReg54NewRecord(DataSet: TDataSet);
    procedure DateEdit1Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure mReg51NewRecord(DataSet: TDataSet);
    procedure mReg50BeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
  private
    { Private declarations }
    vQtdReg50 : Integer;
    vQtdReg51 : Integer;
    vQtdReg54 : Integer;
    vQtdReg75 : Integer;
    vQtdReg90 : Integer;
    vQtdGeral : Integer;
    vAliqICMS : Real;
    vBaseIcms, vVlrIcms, vVlrNota : Real;
    vItem54 : Integer;
    F : TextFile;

  public
    { Public declarations }
    procedure Gera_Reg10;
    procedure Gera_Reg11;
    procedure Le_NEntrada;
    procedure Le_NotaFiscal;
    procedure Calcula_Desconto;
    procedure Gera_Reg50;
    procedure Gera_Reg51;
    procedure Gera_Reg54;
    procedure Gera_Reg75;
    procedure Gera_Reg90;
    procedure Grava_mReg50(Altera, TipoEmitente, CodNatOper: String; AliqICMS, VlrTotal, BaseICMS, VlrICMS, VlrOutras : Real);
    procedure Grava_mReg51(Altera, TipoEmitente, CodNatOper: String; VlrTotal, VlrIPI, VlrOutras : Real);
    procedure Grava_mReg54(TipoEmitente, TipoProduto : String; GeraDupl : Boolean);
    procedure Grava_mReg75(TipoProduto, CodProduto, CodCor, Tamanho : String);
                           //TipoEmitente = "T" Terceiro   "P" Proprio
                           //TipoProduto = "P" Produto  "S" Serviço  "O" Outras Despesas
                           //              "M" Material "G" Seguro "F" Frete
  end;

var
  fGeraSintegra: TfGeraSintegra;

implementation

uses UDM1;

{$R *.DFM}

procedure TfGeraSintegra.Calcula_Desconto;
var
  vVlrDesconto, vAux : Real;
  vAuxVlrICMS, vAuxBaseICMS : Real;
  vContador : Integer;
begin
  qItNotaFiscal.Close;
  qItNotaFiscal.Params[0].AsInteger := DM1.tNotaFiscalNumNota.AsInteger;
  qItNotaFiscal.Open;
  vVlrDesconto := DM1.tNotaFiscalVlrTotalDesc.AsFloat;
  vContador    := 0;
  qItNotaFiscal.First;
  while not qItNotaFiscal.Eof do
    begin
      if qItNotaFiscalGeraDupl.AsBoolean then
        Inc(vContador);
      qItNotaFiscal.Next;
    end;

  qItNotaFiscal.First;
  while not qItNotaFiscal.Eof do
    begin
      if mReg54.Locate('NumNota;ItemNota',VarArrayOf([qItNotaFiscalNumNota.AsString,IntToStr(qItNotaFiscal.RecNo)]),[locaseinsensitive]) then
        begin
          Dec(vContador);
          mReg54.Edit;
          if vContador =  0 then
            vAux := StrToFloat(FormatFloat('0.00',vVlrDesconto))
          else
            vAux         := StrToFloat(FormatFloat('0.00',mReg54VlrTotal.AsFloat * DM1.tNotaFiscalPercDesc.AsFloat / 100));
          if mReg54AliqICMS.AsFloat > 0 then
            begin
              vAuxBaseICMS := StrToFloat(FormatFloat('0.00',mReg54BaseIcms.AsFloat * DM1.tNotaFiscalPercDesc.AsFloat / 100));
              mReg54BaseIcms.AsFloat := StrToFloat(FormatFloat('0.00',mReg54BaseIcms.AsFloat)) - StrToFloat(FormatFloat('0.00',vAuxBaseICMS));
              vAuxVlrICMS  := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',vAuxBaseICMS)) * mReg54AliqICMS.AsFloat / 100));
            end
          else
            begin
              vAuxBaseICMS := 0;
              vAuxVlrICMS  := 0;
            end;
          mReg54VlrDesconto.AsFloat := vAux;
          vVlrDesconto := StrToFloat(FormatFloat('0.00',vVlrDesconto)) - StrToFloat(FormatFloat('0.00',vAux));
          if mReg50.Locate('CodNatOper;AliqIcms',VarArrayOf([mReg54CodNatOper.AsString,mReg54AliqICMS.AsString]),[locaseinsensitive]) then
            begin
              mReg50.Edit;
              mReg50VlrTotal.AsFloat  := StrToFloat(FormatFloat('0.00',mReg50VlrTotal.AsFloat)) -
                                         StrToFloat(FormatFloat('0.00',vAux));
              mReg50BaseIcms.AsFloat  := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',mReg50BaseIcms.AsFloat)) -
                                         StrToFloat(FormatFloat('0.00',vAuxBaseICMS))));
              mReg50VlrIcms.AsFloat   := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',mReg50VlrIcms.AsFloat)) -
                                         StrToFloat(FormatFloat('0.00',vAuxVlrICMS))));
              //aquimReg50VlrOutras.AsFloat := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',mReg50VlrTotal.AsFloat)) -
              //                           StrToFloat(FormatFloat('0.00',mReg50BaseIcms.AsFloat))));
              mReg50.Post;

              vVlrNota  := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',vVlrNota)) -
                           StrToFloat(FormatFloat('0.00',vAux))));
              vBaseIcms := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',vBaseIcms)) -
                           StrToFloat(FormatFloat('0.00',vAuxBaseICMS))));
              vVlrIcms  := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',vVlrIcms)) -
                           StrToFloat(FormatFloat('0.00',vAuxVlrICMS))));
            end;
          mReg54.Post;
        end;
      qItNotaFiscal.Next;
    end;
  qItNotaFiscal.Close;
end;

procedure TfGeraSintegra.Grava_mReg50(Altera, TipoEmitente, CodNatOper: String; AliqICMS, VlrTotal, BaseICMS, VlrICMS, VlrOutras : Real);
begin
  if Altera = 'S' then
    mReg50.Edit
  else
    mReg50.Insert;
  mReg50CodNatOper.AsString  := CodNatOper;
  mReg50AliqICMS.AsFloat     := AliqICMS;
  mReg50Situacao.AsString    := 'N';
  if TipoEmitente = 'T' then
    begin
      if copy(CodNatOper,1,1) = '3' then
        begin
          mReg50UF.AsString           := 'EX';
          mReg50InscEstadual.AsString := 'ISENTO';
          mReg50CNPJ.AsString         := '';
        end
      else
        begin
          mReg50CNPJ.AsString         := DM1.tNEntradalkCGC.AsString;
          mReg50InscEstadual.AsString := DM1.tNEntradalkInscEstadual.AsString;
          mReg50UF.AsString           := DM1.tNEntradalkUf.AsString;
        end;
      if DM1.tNEntradaModelo.AsString = '' then
        mReg50Modelo.AsString := '1'
      else
        mReg50Modelo.AsString       := DM1.tNEntradaModelo.AsString;
      mReg50DtEmissao.AsDateTime  := DM1.tNEntradaDtEntrada.AsDateTime;
      mReg50Serie.AsString        := DM1.tNEntradaSerie.AsString;
      mReg50NumNota.AsString      := Copy(DM1.tNEntradaNumNEntr.AsString,1,6);
    end
  else
    begin
      if DM1.tNotaFiscalCancelada.AsBoolean then
        begin
          VlrICMS   := 0;
          BaseICMS  := 0;
          VlrICMS   := 0;
          VlrOutras := 0;
          VlrTotal  := 0;
        end;
      if (copy(CodNatOper,1,1) = '7') or (copy(CodNatOper,1,1) = '3') then
        begin
          mReg50UF.AsString           := 'EX';
          mReg50InscEstadual.AsString := 'ISENTO';
          mReg50CNPJ.AsString         := '';
        end
      else
        begin
          mReg50UF.AsString           := DM1.tNotaFiscallkUf.AsString;
          mReg50CNPJ.AsString         := DM1.tNotaFiscallkCgcCli.AsString;
          if DM1.tNotaFiscallkPessoa.AsString = 'F' then
            mReg50InscEstadual.AsString := 'ISENTO'
          else
            mReg50InscEstadual.AsString := DM1.tNotaFiscallkInscCli.AsString;
        end;
      mReg50Modelo.AsString       := '01';
      mReg50DtEmissao.AsDateTime  := DM1.tNotaFiscalDtEmissao.AsDateTime;
      mReg50NumNota.AsInteger     := DM1.tNotaFiscalNumNota.AsInteger;
      if DM1.tNotaFiscalCancelada.AsBoolean then
        mReg50Situacao.AsString   := 'S';
    end;

  mReg50Emitente.AsString    := TipoEmitente;
  mReg50VlrTotal.AsFloat     := StrToFloat(FormatFloat('0.00',mReg50VlrTotal.AsFloat)) + StrToFloat(FormatFloat('0.00',VlrTotal));
  mReg50BaseIcms.AsFloat     := StrToFloat(FormatFloat('0.00',mReg50BaseIcms.AsFloat)) + StrToFloat(FormatFloat('0.00',BaseICMS));
  mReg50VlrIcms.AsFloat      := StrToFloat(FormatFloat('0.00',mReg50VlrIcms.AsFloat)) + StrToFloat(FormatFloat('0.00',VlrICMS));
  mReg50VlrIsento.AsFloat    := 0;
  mReg50VlrOutras.AsFloat    := StrToFloat(FormatFloat('0.00',mReg50VlrOutras.AsFloat)) + StrToFloat(FormatFloat('0.00',VlrOutras));
  mReg50.Post;
end;

procedure TfGeraSintegra.Grava_mReg51(Altera, TipoEmitente, CodNatOper : String; VlrTotal, VlrIpi, VlrOutras : Real);
begin
  if Altera = 'S' then
    mReg51.Edit
  else
    mReg51.Insert;
  mReg51CodNatOper.AsString  := CodNatOper;
  mReg51Situacao.AsString    := 'N';
  if TipoEmitente = 'T' then
    begin
      if copy(CodNatOper,1,1) = '3' then
        begin
          mReg51UF.AsString           := 'EX';
          mReg51InscEstadual.AsString := 'ISENTO';
          mReg51CNPJ.AsString         := '';
        end
      else
        begin
          mReg51CNPJ.AsString         := DM1.tNEntradalkCGC.AsString;
          mReg51InscEstadual.AsString := DM1.tNEntradalkInscEstadual.AsString;
          mReg51UF.AsString           := DM1.tNEntradalkUf.AsString;
        end;
      mReg51DtEmissao.AsDateTime  := DM1.tNEntradaDtEntrada.AsDateTime;
      mReg51Serie.AsString        := DM1.tNEntradaSerie.AsString;
      mReg51NumNota.AsString      := Copy(DM1.tNEntradaNumNEntr.AsString,1,6);
    end
  else
    begin
      if DM1.tNotaFiscalCancelada.AsBoolean then
        begin
          VlrTotal  := 0;
          VlrIPI    := 0;
          VlrOutras := 0;
        end;

      if (copy(CodNatOper,1,1) = '7') or (copy(CodNatOper,1,1) = '3') then
        begin
          mReg51UF.AsString           := 'EX';
          mReg51InscEstadual.AsString := 'ISENTO';
          mReg51CNPJ.AsString         := '';
        end
      else
        begin
          mReg51UF.AsString           := DM1.tNotaFiscallkUf.AsString;
          mReg51CNPJ.AsString         := DM1.tNotaFiscallkCgcCli.AsString;
          if DM1.tNotaFiscallkPessoa.AsString = 'F' then
            mReg51InscEstadual.AsString := 'ISENTO'
          else
            mReg51InscEstadual.AsString := DM1.tNotaFiscallkInscCli.AsString;
        end;
      mReg51DtEmissao.AsDateTime  := DM1.tNotaFiscalDtEmissao.AsDateTime;
      mReg51NumNota.AsInteger     := DM1.tNotaFiscalNumNota.AsInteger;
      if DM1.tNotaFiscalCancelada.AsBoolean then
        mReg51Situacao.AsString   := 'S';
    end;
  //if VlrIPI > 0 then
  mReg51VlrTotal.AsFloat     := mReg51VlrTotal.AsFloat + StrToFloat(FormatFloat('0.00',VlrTotal));
  mReg51VlrIPI.AsFloat       := mReg51VlrIPI.AsFloat + StrToFloat(FormatFloat('0.00',VlrIPI));
  mReg51VlrIPIIsento.AsFloat := 0;
  mReg51VlrIpiOutros.AsFloat := mReg51VlrIpiOutros.AsFloat + StrToFloat(FormatFloat('0.00',VlrOutras));
  mReg51.Post;
end;

procedure TfGeraSintegra.Grava_mReg54(TipoEmitente, TipoProduto : String; GeraDupl : Boolean);
var
  vCodAux : String;
  vGera : Boolean;
begin          //TipoEmitente = "P" nota fiscal   "T" nota de entrada
               //TipoProduto = "P" Produto  "S" Serviço  "O" Outras Despesas
               //              "M" Material "G" Seguro "F" Frete
  {***************************************************************}
  {*** Se o tipo for "T" então vai buscar das notas de entrada ***}
  {***************************************************************}
  if TipoEmitente = 'T' then
    begin
      mReg54.Insert;
      mReg54CNPJ.AsString        := DM1.tNEntradalkCGC.AsString;
      mReg54Serie.AsString       := DM1.tNEntradaSerie.AsString;
      mReg54Modelo.AsString      := '01';
      mReg54NumNota.AsString     := Copy(DM1.tNEntradaNumNEntr.AsString,1,6);
      mReg54GeraDupl.AsBoolean   := GeraDupl;
      //Itens da nota de entrada
      if TipoProduto = 'P' then
        begin
          mReg54CodNatOper.AsString  := DM1.tNEntradaItenslkCodNatOper.AsString;
          mReg54CodSitTrib.AsString  := DM1.tNEntradaItenslkCodSitTrib.AsString;
          mReg54ItemNota.AsInteger   := DM1.tNEntradaItens.RecNo;
          //Troquei essas 4 linhas pelas linhas abaixo no dia 17/04/2006
          {if DM1.tNEntradaItensCodCor.AsInteger > 0 then
            mReg54CodProduto.AsString  := DM1.tNEntradaItensCodMaterial.AsString + '.' + DM1.tNEntradaItensCodCor.AsString + '.' + DM1.tNEntradaItensMatProd.AsString + '.' + DM1.tNEntradaItensTamanho.AsString
          else
            mReg54CodProduto.AsString  := DM1.tNEntradaItensCodMaterial.AsString + '.0.' + DM1.tNEntradaItensMatProd.AsString + '.' + DM1.tNEntradaItensTamanho.AsString;}
          mReg54CodProduto.AsString  := DM1.tNEntradaItensCodMaterial.AsString + '.' + DM1.tNEntradaItensCodCor.AsString + '.' + TipoProduto;
          if DM1.tNEntradaItensTamanho.AsString <> '' then
            mReg54CodProduto.AsString  := mReg54CodProduto.AsString + '.' + DM1.tNEntradaItensTamanho.AsString;
          mReg54Qtde.AsFloat         := DM1.tNEntradaItensQtd.AsFloat;
          mReg54VlrTotal.AsFloat     := StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensQtd.AsFloat * DM1.tNEntradaItensVlrUnit.AsFloat));
          mReg54VlrDesconto.AsFloat  := StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensVlrDesc.AsFloat));
          mReg54BaseIcms.AsFloat     := StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensBaseIcms.AsFloat));
          mReg54VlrIPI.AsFloat       := StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensVlrIpi.AsFloat));
          mReg54AliqICMS.AsFloat     := StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensIcms.AsFloat));
          mReg54.Post;
        end
      else
      //Serviços da nota de entrada
      if TipoProduto = 'S' then
        begin
          mReg54CodNatOper.AsString  := DM1.tNEntradaItensMobralkCodNatOper.AsString;
          mReg54CodSitTrib.AsString  := '0';
          mReg54ItemNota.AsInteger   := DM1.tNEntradaItensMobra.RecNo;
          mReg54CodProduto.AsString  := DM1.tNEntradaItensMobraCodigo.AsString + '.0.S';
          mReg54Qtde.AsFloat         := DM1.tNEntradaItensMobraQtd.AsFloat;
          mReg54VlrTotal.AsFloat     := StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensMobraQtd.AsFloat *
                                        DM1.tNEntradaItensMobraVlrUnit.AsFloat));
          mReg54VlrDesconto.AsFloat  := 0;
          mReg54BaseIcms.AsFloat     := 0;
          mReg54VlrIPI.AsFloat       := 0;
          mReg54AliqICMS.AsFloat     := 0;
          mReg54.Post;
        end
      else
      //Outras despesas da nota de entrada
      if TipoProduto = 'O' then
        begin
          mReg54CodSitTrib.AsString  := '0';
          mReg54ItemNota.AsInteger   := 999;
          mReg54CodProduto.AsInteger := 0;
          mReg54Qtde.AsFloat         := 1;
          mReg54VlrTotal.AsFloat     := StrToFloat(FormatFloat('0.00',DM1.tNEntradaOutrasDesp.AsFloat));
          mReg54VlrDesconto.AsFloat  := 0;
          mReg54BaseIcms.AsFloat     := 0;
          mReg54VlrIPI.AsFloat       := 0;
          mReg54AliqICMS.AsFloat     := 0;
          mReg54.Post;
        end;
    end;

  {************************************************************}
  {*** Se o tipo for "P" então vai buscar das notas fiscais ***}
  {************************************************************}
  if TipoEmitente = 'P' then
    begin
      DM1.tNotaFiscalNumNota.AsString;
      vGera := True;
      if (TipoProduto = 'P') or (TipoProduto = 'M') then
        begin
          //Troquei as 4 linhas pelas 4 de baixo dia 17/04/2006
          {if DM1.tNotaFiscalItensCodCor.AsInteger > 0 then
            vCodAux := DM1.tNotaFiscalItensCodProduto.AsString + '.' + DM1.tNotaFiscalItensCodCor.AsString + '.' + TipoProduto + DM1.
          else
            vCodAux := DM1.tNotaFiscalItensCodProduto.AsString + '.0.' + TipoProduto;}
          vCodAux := DM1.tNotaFiscalItensCodProduto.AsString + '.' + DM1.tNotaFiscalItensCodCor.AsString + '.' + TipoProduto;
          if DM1.tNotaFiscalItensTamanho.AsString <> '' then
          vCodAux := vCodAux + '.' + DM1.tNotaFiscalItensTamanho.AsString;
          if mReg54.Locate('NumNota;CodNatOper;CodProduto;AliqICMS',VarArrayOf([DM1.tNotaFiscalNumNota.AsInteger,DM1.tNotaFiscalItenslkCodNatOper.AsString,vCodAux,DM1.tNotaFiscalItensIcms.AsFloat]),[locaseinsensitive]) then
            begin
              vGera := False;
              mReg54.Edit;
              mReg54Qtde.AsFloat         := mReg54Qtde.AsFloat + DM1.tNotaFiscalItensQtd.AsFloat;
              mReg54VlrTotal.AsFloat     := mReg54VlrTotal.AsFloat + StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensQtd.AsFloat * DM1.tNotaFiscalItensVlrUnit.AsFloat));
              mReg54VlrDesconto.AsFloat  := mReg54VlrDesconto.AsFloat + DM1.tNotaFiscalItensVlrDesconto.AsFloat;
              mReg54BaseIcms.AsFloat     := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',mReg54BaseIcms.AsFloat)) + StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensBaseIcms.AsFloat))));
              mReg54VlrIPI.AsFloat       := mReg54VlrIPI.AsFloat + StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrIpi.AsFloat));
              mReg54.Post;
            end;
        end;
      if vGera then
        begin
          mReg54.Insert;
          mReg54CNPJ.AsString        := DM1.tNotaFiscallkCgcCli.AsString;
          mReg54Serie.AsString       := '';
          mReg54Modelo.AsString      := '01';
          mReg54NumNota.AsInteger    := DM1.tNotaFiscalNumNota.AsInteger;
          mReg54GeraDupl.AsBoolean   := GeraDupl;
          //Itens da nota fiscal
          if (TipoProduto = 'P') or (TipoProduto = 'M') then
            begin
              mReg54CodNatOper.AsString  := DM1.tNotaFiscalItenslkCodNatOper.AsString;
              mReg54CodSitTrib.AsString  := DM1.tNotaFiscalItenslkSitTributaria.AsString;
              //mReg54ItemNota.AsInteger   := DM1.tNotaFiscalItens.RecNo;
              mReg54ItemNota.AsInteger   := 0;
              mReg54CodProduto.AsString := DM1.tNotaFiscalItensCodProduto.AsString + '.' + DM1.tNotaFiscalItensCodCor.AsString + '.' + TipoProduto;
              if DM1.tNotaFiscalItensTamanho.AsString <> '' then
                mReg54CodProduto.AsString := mReg54CodProduto.AsString + '.' + DM1.tNotaFiscalItensTamanho.AsString;
              mReg54Qtde.AsFloat         := DM1.tNotaFiscalItensQtd.AsFloat;
              mReg54VlrTotal.AsFloat     := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensQtd.AsFloat * DM1.tNotaFiscalItensVlrUnit.AsFloat));
              mReg54VlrDesconto.AsFloat  := DM1.tNotaFiscalItensVlrDesconto.AsFloat;
              mReg54BaseIcms.AsFloat     := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensBaseIcms.AsFloat));
              mReg54VlrIPI.AsFloat       := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrIpi.AsFloat));
              mReg54AliqICMS.AsFloat     := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensIcms.AsFloat));
              mReg54.Post;
            end
          else
          //Outras despesas da nota fiscal
          if TipoProduto = 'O' then
            begin
              mReg54CodSitTrib.AsString  := '0';
              mReg54ItemNota.AsInteger   := 999;
              mReg54Qtde.AsFloat         := 1;
              mReg54VlrTotal.AsFloat     := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalOutrasDesp.AsFloat));
              if DM1.tNotaFiscalBaseIcms.AsFloat > 0 then
                begin
                  mReg54BaseIcms.AsFloat     := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalOutrasDesp.AsFloat));
                  mReg54AliqICMS.AsFloat     := vAliqICMS;
                end;
              mReg54.Post;
            end
          else
          //Valor do Seguro da nota fiscal
          if TipoProduto = 'G' then
            begin
              mReg54CodSitTrib.AsString  := '0';
              mReg54ItemNota.AsInteger   := 992;
              mReg54Qtde.AsFloat         := 1;
              mReg54VlrTotal.AsFloat     := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrSeguro.AsFloat));
              mReg54.Post;
            end;
          //Valor do Frete da nota fiscal
          if TipoProduto = 'F' then
            begin
              mReg54CodSitTrib.AsString  := '0';
              mReg54ItemNota.AsInteger   := 991;
              mReg54Qtde.AsFloat         := 1;
              mReg54VlrTotal.AsFloat     := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrFrete.AsFloat));
              if DM1.tNotaFiscalBaseIcms.AsFloat > 0 then
                begin
                  mReg54BaseIcms.AsFloat     := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrFrete.AsFloat));
                  mReg54AliqICMS.AsFloat     := vAliqICMS;
                end;
              mReg54.Post;
            end;
        end;
    end;
end;

procedure TfGeraSintegra.Grava_mReg75(TipoProduto, CodProduto, CodCor, Tamanho : String);
var
  vCodProd : String;
  vNomeCor : String;
begin          //TipoProduto = "P" Produto  "S" Serviço  "M" Material
               //CodProduto = Indentifica se vai le a tabela dbProduto, dbMaterial ou dbMaoObra
  {*** Se o tipo for "T" então vai buscar das notas de entrada ***}
  {***************************************************************}
 if Tamanho <> '' then
   vCodProd := CodProduto + '.' + CodCor + '.' + TipoProduto + '.' +Tamanho
 else
   vCodProd := CodProduto + '.' + CodCor + '.' + TipoProduto;
 if not mReg75.Locate('CodProduto;TipoRegistro',VarArrayOf([vCodProd,TipoProduto]),[locaseinsensitive]) then
   begin
     vNomeCor := '';
     if CodCor <> '' then
       begin
         DM1.tCor.IndexFieldNames := 'Codigo';
         DM1.tCor.SetKey;
         DM1.tCorCodigo.AsInteger := StrToInt(CodCor);
         if DM1.tCor.GotoKey then
           vNomeCor := DM1.tCorNome.AsString;
       end;
     mReg75.Insert;
     mReg75CodProduto.AsString   := vCodProd;
     mReg75TipoRegistro.AsString := TipoProduto;
     //quando o tipo for "M" lê os materiais
     {if TipoProduto = 'M' then
       begin
         DM1.tMaterial.IndexFieldNames := 'Codigo';
         DM1.tMaterial.SetKey;
         DM1.tMaterialCodigo.AsString := CodProduto;
         if DM1.tMaterial.GotoKey then
           begin
             mReg75ClasFiscal.AsString   := DM1.tMaterialClasFiscal.AsString;
             mReg75NomeProduto.AsString  := DM1.tMaterialNome.AsString + ' ' + vNomeCor;
             mReg75Unidade.AsString      := DM1.tMaterialUnidade.AsString;
             mReg75CodSitTrib.AsString   := DM1.tMateriallkCodSitTrib.AsString;
             mReg75AliqIPI.AsFloat       := DM1.tMaterialIPI.AsFloat;
             mReg75AliqICMS.AsFloat      := DM1.tMaterialICMS.AsFloat;
             if (DM1.tMaterialCodSitTrib.AsInteger > 0) and (DM1.tMateriallkPercSitTributaria.AsFloat > 0) then
               mReg75PercRedBaseCalculo.AsFloat := 100 - DM1.tMateriallkPercSitTributaria.AsFloat;
           end;
       end
     else}
     //quando o tipo for "P" lê os produtos
     if TipoProduto = 'P' then
       begin
         DM1.tProduto.IndexFieldNames := 'Codigo';
         DM1.tProduto.SetKey;
         DM1.tProdutoCodigo.AsString  := CodProduto;
         if DM1.tProduto.GotoKey then
           begin
             mReg75ClasFiscal.AsString  := DM1.tProdutoCodClasFiscal.AsString;
             mReg75NomeProduto.AsString := DM1.tProdutoNome.AsString + ' ' + vNomeCor;
             mReg75Unidade.AsString     := DM1.tProdutoUnidade.AsString;
             mReg75CodSitTrib.AsString  := DM1.tProdutolkCodSitTrib.AsString;
             mReg75AliqIPI.AsFloat      := DM1.tProdutoAliqIPI.AsFloat;
             mReg75AliqICMS.AsFloat     := DM1.tProdutoAliqIcms.AsFloat;
             //if (DM1.tProdutoCodSitTrib.AsInteger > 0) and (DM1.tProdutolkSitTributaria.AsFloat > 0) then
             if DM1.tProdutoCodSitTrib.AsInteger > 0 then
               begin
                 DM1.tSitTributaria.IndexFieldNames := 'Codigo';
                 DM1.tSitTributaria.SetKey;
                 DM1.tSitTributariaCodigo.AsInteger := DM1.tProdutoCodSitTrib.AsInteger;
                 if DM1.tSitTributaria.GotoKey then
                   if DM1.tSitTributariaSitTributaria.AsFloat > 0 then
                 //if DM1.tProdutolkSitTributaria.AsFloat > 0 then
                 //mReg75PercRedBaseCalculo.AsFloat := 100 - StrToFloat(FormatFloat('0.00',DM1.tProdutolkSitTributaria.AsFloat));
                   mReg75PercRedBaseCalculo.AsFloat := 100 - DM1.tSitTributariaSitTributaria.AsFloat;
               end;
           end;
       end
     else
     //quando o tipo for "S" lê as mão de obras
     if TipoProduto = 'S' then
       begin
         DM1.tMaoDeObra.IndexFieldNames := 'Codigo';
         DM1.tMaoDeObra.SetKey;
         DM1.tMaoDeObraCodigo.AsString := CodProduto;
         if DM1.tMaoDeObra.GotoKey then
           begin
             mReg75ClasFiscal.AsString  := '';
             mReg75NomeProduto.AsString := DM1.tMaoDeObraDescricao.AsString;
             mReg75Unidade.AsString     := 'UN';
             mReg75CodSitTrib.AsString  := '';
             mReg75AliqIPI.AsFloat      := 0;
             mReg75AliqICMS.AsFloat     := 0;
           end;
       end;
     mReg75.Post;
   end;
end;

procedure TfGeraSintegra.Gera_Reg10;
var
  Texto1, Texto2 : String;
  vAux : String;
  Ano,Mes,Dia : Word;
  i : integer;
begin
  //Tipo do Registro   - Tamanho 2   Posição 1 a 2
  texto1 := '10';
  //CGC da empresa     - Tamanho 14  Posição 3 a 16
  texto2   := '';
  vAux     := DM1.tFilialCNPJ.AsString;
  for i    := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := Texto1 + texto2;

  //Inscrição Estadual da empresa - Tamanho 14   Posição 17 a 30
  texto2   := '';
  vAux     := DM1.tFilialInscr.AsString;
  for i    := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/')  and (Copy(vAux,i,1) <> '\') then
      Texto2 := Texto2 + Copy(vAux,i,1);
  for i := 1 to 14 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := Texto1 + texto2;

  //Nome da empresa - Tamanho 35   Posição 31 a 65
  texto2 := copy(DM1.tFilialEmpresa.AsString,1,35);
  for i := 1 to 35 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := Texto1 + texto2;

  //Cidade da empresa - Tamanho 30   Posição 66 a 95
  texto2 := DM1.tFilialCidade.AsString;
  for i := 1 to 30 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := Texto1 + texto2;

  //UF da empresa - Tamanho 2   Posição 96 a 97
  texto2 := DM1.tFilialEstado.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := Texto1 + texto2;

  //Fax da empresa - Tamanho 10  Posição 98 a 107
  texto2   := '';
  vAux     := DM1.tFilialFax.AsString;
  for i    := 1 to Length(vAux) do
    begin
      if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/')
         and (Copy(vAux,i,1) <> '(') and (Copy(vAux,i,1) <> ')') then
        Texto2 := Texto2 + Copy(vAux,i,1);
    end;
  for i := 1 to 10 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Data Inicial da empresa - Tamanho 8  Posição 108 a 115
  DecodeDate(DateEdit1.Date,Ano,Mes,Dia);
  texto1 := texto1 + IntToStr(Ano) + FormatFloat('00',Mes) + FormatFloat('00',Dia);

  //Data Final da empresa - Tamanho 8  Posição 116 a 123
  DecodeDate(DateEdit2.Date,Ano,Mes,Dia);
  texto1 := texto1 + IntToStr(Ano) + FormatFloat('00',Mes) + FormatFloat('00',Dia);

  //Convênio com o Sintegra - Tamanho 1  Posição 124 a 124
  texto1 := texto1 + DM1.tEmpresaConvenio.AsString;

  //Código de identificação da natureza das operações informadas - Tamanho 1  Posição 125 a 125
  texto1 := texto1 + '3';

  //Código da finalidade do arquivo magnético - Tamanho 1  Posição 126 a 126
  texto1 := texto1 + '1';

  Writeln(F,texto1);
  inc(vQtdGeral);
end;

procedure TfGeraSintegra.Gera_Reg11;
var
  Texto1, Texto2, vAux : String;
  i : integer;
begin
  //Tipo do Registro   - Tamanho 2   Posição 1 a 2
  texto1 := '11';

  //Logradouro do responsável  - Tamanho 34  Posição 3 a 36
  texto2 := DM1.tEmpresaEndResp.AsString;
  for i := 1 to 34 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Número do endereço do responsável  - Tamanho 5  Posição 37 a 41
  texto2 := DM1.tEmpresaNumRuaResp.AsString;
  for i := 1 to 5 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Complemento do endereço do responsável  - Tamanho 22 Posição 42 a 63
  texto2 := ' ';
  for i := 1 to 22 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Bairro do responsável  - Tamanho 15 Posição 64 a 78
  texto2 := DM1.tEmpresaBaiResp.AsString;
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Cep do responsável  - Tamanho 8 Posição 79 a 86
  texto2   := '';
  vAux     := DM1.tEmpresaCepResp.AsString;
  for i    := 1 to Length(vAux) do
    begin       
      if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/')
         and (Copy(vAux,i,1) <> '(') and (Copy(vAux,i,1) <> ')') then
        Texto2 := Texto2 + Copy(vAux,i,1);
    end;
  for i := 1 to 8 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Nome do responsável  - Tamanho 28 Posição 87 a 114
  texto2 := DM1.tEmpresaNomeResp.AsString;
  for i := 1 to 28 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Telefone do responsável - Tamanho 12 Posição 115 a 126
  texto2 := DM1.tEmpresaPFone.AsString;
  for i := 1 to 4 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  texto2   := '';
  vAux     := DM1.tEmpresaNFone.AsString;
  for i    := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') and (Copy(vAux,i,1) <> '\') and
      (Copy(vAux,i,1) <> '(') and (Copy(vAux,i,1) <> ')') then
      Texto2 := Texto2 + Copy(vAux,i,1);
  for i := 1 to 8 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := Texto1 + texto2;

  Writeln(F,texto1);
  inc(vQtdGeral);
end;

procedure TfGeraSintegra.Le_NEntrada;
var
  vBaseIcms, vVlrIcms, vVlrNota, vAux : Real;
begin                               
  DM1.tNEntrada.Filtered := False;
  DM1.tNEntrada.Filter   := 'DtEntrada >= '''+DateEdit1.Text+''' and DtEntrada <= '''+DateEdit2.Text+'''';
  DM1.tNEntrada.Filtered := True;
  DM1.tNEntrada.First;
  while not DM1.tNEntrada.Eof do    
    begin
      vBaseIcms   := 0;
      vVlrIcms    := 0;
      vVlrNota    := 0;
      //Lê os itens da nota para gravar a memo e somar os valores para depois comparar com o da nota
      mReg50.EmptyTable;
      DM1.tNEntradaItens.First;
      while not DM1.tNEntradaItens.Eof do
        begin
          vAux := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensVlrTotalItens.AsFloat)) -
                  StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensBaseIcms.AsFloat))));
          //Localiza o registro 50
          Dm1.tNEntradaItensNumNEntr.AsInteger;
          Dm1.tNEntradaItensItem.AsInteger;
          if mReg50.Locate('CodNatOper;AliqICMS',VarArrayOf([DM1.tNEntradaItenslkCodNatOper.AsInteger,DM1.tNEntradaItensIcms.AsFloat]),[locaseinsensitive]) then
            Grava_mReg50('S','T',DM1.tNEntradaItenslkCodNatOper.AsString,DM1.tNEntradaItensIcms.AsFloat,
                         StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensVlrTotalItens.AsFloat)),StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensBaseIcms.AsFloat)),
                         StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensVlrIcms.AsFloat)),StrToFloat(FormatFloat('0.00',vAux)))
          else
            Grava_mReg50('N','T',DM1.tNEntradaItenslkCodNatOper.AsString,DM1.tNEntradaItensIcms.AsFloat,
                         StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensVlrTotalItens.AsFloat)),StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensBaseIcms.AsFloat)),
                         StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensVlrIcms.AsFloat)),StrToFloat(FormatFloat('0.00',vAux)));
          vBaseIcms    := StrToFloat(FormatFloat('0.00',vBaseIcms)) + StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensBaseIcms.AsFloat));
          vVlrIcms     := StrToFloat(FormatFloat('0.00',vVlrIcms)) + StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensVlrIcms.AsFloat));
          vVlrNota     := StrToFloat(FormatFloat('0.00',vVlrNota)) + StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensVlrTotalItens.AsFloat));
          //Localiza o registro 51
          if DM1.tNEntradaItensIpi.AsFloat > 0 then
            vAux := 0
          else
            vAux := StrToFloat(FormatFloat('0.00',DM1.tNEntradaItensVlrTotalItens.AsFloat));
          if mReg51.Locate('NumNota;CNPJ;CodNatOper',VarArrayOf([Copy(DM1.tNEntradaNumNEntr.AsString,1,6),DM1.tNEntradalkCGC.AsString,DM1.tNEntradaItenslkCodNatOper.AsInteger]),[locaseinsensitive]) then
          //if mReg51.Locate('CodNatOper',DM1.tNEntradaItenslkCodNatOper.AsInteger,[loCaseInsensitive]) then
            Grava_mReg51('S','T',DM1.tNEntradaItenslkCodNatOper.AsString, DM1.tNEntradaItensVlrTotalItens.AsFloat,
                         DM1.tNEntradaItensVlrIpi.AsFloat,vAux)
          else
            Grava_mReg51('N','T',DM1.tNEntradaItenslkCodNatOper.AsString,DM1.tNEntradaItensVlrTotalItens.AsFloat,
                         DM1.tNEntradaItensVlrIpi.AsFloat,vAux);
          //Localiza Registro 54
          Grava_mReg54('T','P',DM1.tNEntradalkGeraDupl.AsBoolean);
          Grava_mReg75('P',DM1.tNEntradaItensCodMaterial.AsString,DM1.tNEntradaItensCodCor.AsString,DM1.tNEntradaItensTamanho.AsString);
          DM1.tNEntradaItens.Next;
        end;

      //Lê a mão de obra
      DM1.tNEntradaItensMobra.First;
      while not DM1.tNEntradaItensMobra.Eof do
        begin
          if mReg50.Locate('CodNatOper;AliqICMS',VarArrayOf([DM1.tNEntradaItensMobralkCodNatOper.AsInteger,0]),[locaseinsensitive]) then
            Grava_mReg50('S','T',DM1.tNEntradaItensMobralkCodNatOper.AsString,0,
                         DM1.tNEntradaItensMobraVlrTotal.AsFloat,0,
                         0,DM1.tNEntradaItensMobraVlrTotal.AsFloat)

          else
            Grava_mReg50('N','T',DM1.tNEntradaItensMobralkCodNatOper.AsString,0,
                         DM1.tNEntradaItensMobraVlrTotal.AsFloat,0,
                         0,DM1.tNEntradaItensMobraVlrTotal.AsFloat);
          vVlrNota     := vVlrNota + DM1.tNEntradaItensMobraVlrTotal.AsFloat;
          Grava_mReg54('T','S',DM1.tNEntradaItensMobralkGeraDupl.AsBoolean);
          Grava_mReg75('S',DM1.tNEntradaItensMobraCodigo.AsString,'0','');
          DM1.tNEntradaItensMobra.Next;
        end;
      //***Gera a memo para Outras Despesas, procura a aliquota do icms "0", se não existir esta
      //aliquota então é criado o registro
      if DM1.tNEntradaOutrasDesp.AsFloat > 0 then
        begin
          if mReg50.Locate('CodNatOper;AliqICMS',VarArrayOf([DM1.tNEntradalkCodNatOper.AsInteger,0]),[locaseinsensitive]) then
            Grava_mReg50('S','T',DM1.tNEntradalkCodNatOper.AsString,0,
                         DM1.tNEntradaOutrasDesp.AsFloat,0,
                         0,DM1.tNEntradaOutrasDesp.AsFloat)
          else
            Grava_mReg50('N','T',DM1.tNEntradalkCodNatOper.AsString,0,
                         DM1.tNEntradaOutrasDesp.AsFloat,0,
                         0,DM1.tNEntradaOutrasDesp.AsFloat);
          vVlrNota := vVlrNota + DM1.tNEntradaOutrasDesp.AsFloat;
          Grava_mReg54('T','O',DM1.tNEntradalkGeraDupl.AsBoolean);
        end;

      //*** Se for nota para acerto sem valor nenhum, então lança o registro 50 vázio
      if not mReg50.Locate('NumNota;Cnpj;Emitente',VarArrayOf([Copy(DM1.tNEntradaNumNEntr.AsString,1,6),DM1.tNEntradalkCGC.AsString,'T']),[locaseinsensitive]) then
        begin
          vAux := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',DM1.tNEntradaVlrTotalNEntr.AsFloat)) -
                  StrToFloat(FormatFloat('0.00',DM1.tNEntradaBaseIcms.AsFloat))));
          if vAux < 0 then
            vAux := 0;
          Grava_mReg50('N','T',DM1.tNEntradalkCodNatOper.AsString,0,
                       StrToFloat(FormatFloat('0.00',DM1.tNEntradaVlrTotalNEntr.AsFloat)),StrToFloat(FormatFloat('0.00',DM1.tNEntradaBaseIcms.AsFloat)),
                       StrToFloat(FormatFloat('0.00',DM1.tNEntradaVlrIcms.AsFloat)),StrToFloat(FormatFloat('0.00',vAux)));
          vVlrNota  := StrToFloat(FormatFloat('0.00',vVlrNota)) + StrToFloat(FormatFloat('0.00',DM1.tNEntradaVlrTotalNEntr.AsFloat));
          vBaseIcms := StrToFloat(FormatFloat('0.00',vBaseIcms)) + StrToFloat(FormatFloat('0.00',DM1.tNEntradaBaseIcms.AsFloat));
          vVlrIcms  := StrToFloat(FormatFloat('0.00',vVlrIcms)) + StrToFloat(FormatFloat('0.00',DM1.tNEntradaVlrIcms.AsFloat));
        end;

      //Verifica se a base do icms dos itens esta igual ao da nota
      if FormatFloat('0.00',vBaseIcms) <> FormatFloat('0.00',DM1.tNEntradaBaseIcms.AsFloat) then
        vBaseIcms := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',DM1.tNEntradaBaseIcms.AsFloat)) -
                     StrToFloat(FormatFloat('0.00',vBaseIcms))))
      else
        vBaseIcms := 0;
      //Verifica se o valor do icms dos itens esta igual ao da nota
      if FormatFloat('0.00',vVlrIcms) <> FormatFloat('0.00',DM1.tNEntradaVlrIcms.AsFloat) then
        vVlrIcms := StrToFloat(FormatFloat('0.00',DM1.tNEntradaVlrIcms.AsFloat)) -
                    StrToFloat(FormatFloat('0.00',vVlrIcms))
      else
        vVlrIcms := 0;
      //Verifica se o valor do item esta igual ao da nota
      if FormatFloat('0.00',vVlrNota) <> FormatFloat('0.00',DM1.tNEntradaVlrTotalNEntr.AsFloat) then
        vVlrNota := StrToFloat(FormatFloat('0.00',DM1.tNEntradaVlrTotalNEntr.AsFloat)) -
                    StrToFloat(FormatFloat('0.00',vVlrNota))
      else
        vVlrNota := 0;
      //Le a memo para ajustar os valores
      mReg50.First;
      while not mReg50.Eof do
        begin
          if (StrToFloat(FormatFloat('0.00',vBaseIcms)) <> 0) and (StrToFloat(FormatFloat('0.00',mReg50BaseIcms.AsFloat)) > 0) then
            begin
              mReg50.Edit;
              mReg50BaseIcms.AsFloat := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',mReg50BaseIcms.AsFloat)) + StrToFloat(FormatFloat('0.00',vBaseIcms))));
              mReg50.Post;
              vBaseIcms := 0;
            end;
          if (StrToFloat(FormatFloat('0.00',vVlrIcms)) <> 0) and (StrToFloat(FormatFloat('0.00',mReg50VlrIcms.AsFloat)) > 0) then
            begin
              mReg50.Edit;               
              mReg50VlrIcms.AsFloat := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',mReg50VlrIcms.AsFloat)) + StrToFloat(FormatFloat('0.00',vVlrIcms))));
              mReg50.Post;
              vVlrIcms := 0;
            end;
          if (StrToFloat(FormatFloat('0.00',vVlrNota)) <> 0) and (StrToFloat(FormatFloat('0.00',mReg50VlrTotal.AsFloat)) > 0) then
            begin
              mReg50.Edit;
              mReg50VlrTotal.AsFloat := StrToFloat(FormatFloat('0.00',mReg50VlrTotal.AsFloat)) + StrToFloat(FormatFloat('0.00',vVlrNota));
              mReg50.Post;
              vVlrNota := 0;
            end;
          mReg50.Next;
        end;

      //Gera os registros
      mReg50.First;
      while not mReg50.Eof do
        begin
          Gera_Reg50;
          mReg50.Next;
        end;
      DM1.tNEntrada.Next;
    end;
  DM1.tNEntrada.Filtered := False;
end;

procedure TfGeraSintegra.Le_NotaFiscal;
var                                   
  vAux, vValor : Real;
  vBaseIcmsAux, vVlrIcmsAux, vOutrasAux : Real;
begin
  DM1.tNotaFiscal.Filtered := False;
  DM1.tNotaFiscal.Filter   := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+'''';
  DM1.tNotaFiscal.Filtered := True;
  DM1.tNotaFiscal.First;
  while not DM1.tNotaFiscal.Eof do
    begin
      DM1.tNotaFiscalNumNota.AsString;
      if DM1.tNotaFiscalNumNota.AsInteger > 0 then
        begin
          vAliqICMS := 0;
          DM1.tUF.SetKey;
          DM1.tUFSigla.AsString := DM1.tNotaFiscallkUF.AsString;
          if DM1.tUF.GotoKey then
            vAliqICMS := DM1.tUFPercentual.AsFloat;
          vBaseIcms   := 0;
          vVlrIcms    := 0;
          vVlrNota    := 0;
          mReg50.EmptyTable;

          //Lê os itens da nota para gravar a memo e somar os valores para depois comparar com o da nota
          DM1.tNotaFiscalItens.First;
          while not DM1.tNotaFiscalItens.Eof do
            begin
              //Localiza registro 50
              vAux := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrTotal.AsFloat)) -
                      StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensBaseIcms.AsFloat))));
              if mReg50.Locate('CodNatOper;AliqICMS',VarArrayOf([DM1.tNotaFiscalItenslkCodNatOper.AsString,DM1.tNotaFiscalItensIcms.AsFloat]),[locaseinsensitive]) then
                Grava_mReg50('S','P',DM1.tNotaFiscalItenslkCodNatOper.AsString,DM1.tNotaFiscalItensIcms.AsFloat,
                             StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrTotal.AsFloat)),StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensBaseIcms.AsFloat)),
                             StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrIcms.AsFloat)),StrToFloat(FormatFloat('0.00',vAux)))
              else
                Grava_mReg50('N','P',DM1.tNotaFiscalItenslkCodNatOper.AsString,DM1.tNotaFiscalItensIcms.AsFloat,
                             StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrTotal.AsFloat)),StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensBaseIcms.AsFloat)),
                             StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrIcms.AsFloat)),StrToFloat(FormatFloat('0.00',vAux)));
              vBaseIcms    := StrToFloat(FormatFloat('0.00',vBaseIcms)) + StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensBaseIcms.AsFloat));
              vVlrIcms     := StrToFloat(FormatFloat('0.00',vVlrIcms)) + StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrIcms.AsFloat));
              vVlrNota     := StrToFloat(FormatFloat('0.00',vVlrNota)) + StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrTotal.AsFloat));
              //Localiza o registro 51
              //if DM1.tNotaFiscalItensIpi.AsFloat > 0 then
              //  vAux := 0
              //else
                vAux := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrTotal.AsFloat));
              if mReg51.Locate('NumNota;CNPJ;CodNatOper',VarArrayOf([DM1.tNotaFiscalNumNota.AsInteger,DM1.tNotaFiscallkCgcCli.AsString,DM1.tNotaFiscalItenslkCodNatOper.AsInteger]),[locaseinsensitive]) then
              //if mReg51.Locate('CodNatOper',DM1.tNotaFiscalItenslkCodNatOper.AsInteger,[loCaseInsensitive]) then
                Grava_mReg51('S','P',DM1.tNotaFiscalItenslkCodNatOper.AsString, StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrTotal.AsFloat)),
                             StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrIpi.AsFloat)),StrToFloat(FormatFloat('0.00',vAux)))
              else
                Grava_mReg51('N','P',DM1.tNotaFiscalItenslkCodNatOper.AsString,StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrTotal.AsFloat)),
                             StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalItensVlrIpi.AsFloat)),StrToFloat(FormatFloat('0.00',vAux)));
              //Localiza o registro 54
              if not DM1.tNotaFiscalCancelada.AsBoolean then
                begin
                  Grava_mReg54('P','P',DM1.tNotaFiscalItensGeraDupl.AsBoolean);
                  Grava_mReg75('P',DM1.tNotaFiscalItensCodProduto.AsString,DM1.tNotaFiscalItensCodCor.AsString,DM1.tNotaFiscalItensTamanho.AsString)
                end;
              DM1.tNotaFiscalItens.Next;
            end;

          //Gera a memo para Valor do seguro, procura a aliquota do icms "0", se não existir esta
          //aliquota então é criado o registro
          if DM1.tNotaFiscalVlrSeguro.AsFloat > 0 then
            begin
              if mReg50.Locate('CodNatOper;AliqICMS',VarArrayOf([DM1.tNotaFiscallkCodNatOper.AsInteger,0]),[locaseinsensitive]) then
                Grava_mReg50('S','P',DM1.tNotaFiscallkCodNatOper.AsString,0,
                             DM1.tNotaFiscalVlrSeguro.AsFloat,0,
                             0,DM1.tNotaFiscalVlrSeguro.AsFloat)
              else
                Grava_mReg50('N','P',DM1.tNotaFiscallkCodNatOper.AsString,0,
                             DM1.tNotaFiscalVlrSeguro.AsFloat,0,
                             0,DM1.tNotaFiscalVlrSeguro.AsFloat);
              vVlrNota := vVlrNota + DM1.tNotaFiscalVlrSeguro.AsFloat;
              if not DM1.tNotaFiscalCancelada.AsBoolean then
                Grava_mReg54('P','G',True);
            end;
          //Gera a memo para Outras Despesas, procura a aliquota do icms "0", se não existir esta
          //aliquota então é criado o registro
          vValor := StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrFrete.AsFloat + DM1.tNotaFiscalOutrasDesp.AsFloat));
          if DM1.tNotaFiscalBaseIcms.AsFloat > 0 then
            begin
              vAux         := vAliqICMS;
              vBaseIcmsAux := StrToFloat(FormatFloat('0.00',vValor));
              vVlrIcmsAux  := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',vBaseIcmsAux)) * vAliqICMS / 100));
              vOutrasAux   := 0;
            end
          else
            begin
              vAux         := 0;
              vBaseIcmsAux := 0;
              vVlrIcmsAux  := 0;
              vOutrasAux   := StrToFloat(FormatFloat('0.00',vValor));
            end;
          if vValor > 0 then
            begin
              if mReg50.Locate('CodNatOper;AliqICMS',VarArrayOf([DM1.tNotaFiscallkCodNatOper.AsInteger,vAux]),[locaseinsensitive]) then
                Grava_mReg50('S','P',DM1.tNotaFiscallkCodNatOper.AsString,StrToFloat(FormatFloat('0.00',vAux)),
                             StrToFloat(FormatFloat('0.00',vValor)),StrToFloat(FormatFloat('0.00',vBaseIcmsAux)),StrToFloat(FormatFloat('0.00',vVlrIcmsAux)),
                             StrToFloat(FormatFloat('0.00',vOutrasAux)))
              else
                Grava_mReg50('N','P',DM1.tNotaFiscallkCodNatOper.AsString,vAux,
                             StrToFloat(FormatFloat('0.00',vValor)),StrToFloat(FormatFloat('0.00',vBaseIcmsAux)),
                             StrToFloat(FormatFloat('0.00',vVlrIcmsAux)),StrToFloat(FormatFloat('0.00',vOutrasAux)));
              vVlrNota  := StrToFloat(FormatFloat('0.00',vVlrNota)) + StrToFloat(FormatFloat('0.00',vValor));
              vBaseIcms := StrToFloat(FormatFloat('0.00',vBaseIcms)) + StrToFloat(FormatFloat('0.00',vBaseIcmsAux));
              vVlrIcms  := StrToFloat(FormatFloat('0.00',vVlrIcms)) + StrToFloat(FormatFloat('0.00',vVlrIcmsAux));
              if not DM1.tNotaFiscalCancelada.AsBoolean then
                begin
                  if DM1.tNotaFiscalVlrFrete.AsFloat > 0 then
                    Grava_mReg54('P','F',True);
                  if DM1.tNotaFiscalOutrasDesp.AsFloat > 0 then
                    Grava_mReg54('P','O',True);
                end;
            end;

          //*** Se for nota para acerto sem valor nenhum então lança o registro 50 vázio
          if not mReg50.Locate('NumNota;Cnpj;Emitente',VarArrayOf([DM1.tNotaFiscalNumNota.AsString,DM1.tNotaFiscallkCgcCli.AsString,'P']),[locaseinsensitive]) then
            begin      
              vAux := DM1.tNotaFiscalVlrTotalNota.AsFloat - DM1.tNotaFiscalBaseIcms.AsFloat;
              if vAux < 0 then
                vAux := 0;
              Grava_mReg50('N','P',DM1.tNotaFiscallkCodNatOper.AsString,0,
                           StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat)),StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalBaseIcms.AsFloat)),
                           StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrIcms.AsFloat)),StrToFloat(FormatFloat('0.00',vAux)));
              vVlrNota  := StrToFloat(FormatFloat('0.00',vVlrNota)) + StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat));
              vBaseIcms := StrToFloat(FormatFloat('0.00',vBaseIcms)) + StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalBaseIcms.AsFloat));
              vVlrIcms  := StrToFloat(FormatFloat('0.00',vVlrIcms)) + StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrIcms.AsFloat));
            end;

          //Se a nota possuir desconto no total das notas
          if (DM1.tNotaFiscalVlrTotalDesc.AsFloat > 0) and not(DM1.tNotaFiscalCancelada.AsBoolean) then
            Calcula_Desconto;

          //Verifica se a base do icms dos itens esta igual ao da nota
          if DM1.tNotaFiscalCancelada.AsBoolean then
            vBaseIcms := 0
          else
          if FormatFloat('0.00',vBaseIcms) <> FormatFloat('0.00',DM1.tNotaFiscalBaseIcms.AsFloat) then
            vBaseIcms := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalBaseIcms.AsFloat)) -
                         StrToFloat(FormatFloat('0.00',vBaseIcms))))
          else
            vBaseIcms := 0;
          //Verifica se o valor do icms dos itens esta igual ao da nota
          if DM1.tNotaFiscalCancelada.AsBoolean then
            vVlrIcms := 0
          else
          if FormatFloat('0.00',vVlrIcms) <> FormatFloat('0.00',DM1.tNotaFiscalVlrIcms.AsFloat) then
            vVlrIcms := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrIcms.AsFloat)) -
                        StrToFloat(FormatFloat('0.00',vVlrIcms))))
          else
            vVlrIcms := 0;
          //Verifica se o valor do item esta igual ao da nota
          if DM1.tNotaFiscalCancelada.AsBoolean then
            vVlrNota := 0
          else
          if FormatFloat('0.00',vVlrNota) <> FormatFloat('0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat) then
            vVlrNota := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat)) -
                        StrToFloat(FormatFloat('0.00',vVlrNota))))
          else
            vVlrNota := 0;
          //Le a memo para ajustar os valores
          if not DM1.tNotaFiscalCancelada.AsBoolean then
            begin
              mReg50.First;
              while not mReg50.Eof do
                begin
                  if (StrToFloat(FormatFloat('0.00',vBaseIcms)) <> 0) and (StrToFloat(FormatFloat('0.00',mReg50BaseIcms.AsFloat)) > 0) then
                    begin
                      mReg50.Edit;
                      mReg50BaseIcms.AsFloat := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',mReg50BaseIcms.AsFloat)) + StrToFloat(FormatFloat('0.00',vBaseIcms))));
                      mReg50.Post;
                      vBaseIcms := 0;
                    end;
                  if (StrToFloat(FormatFloat('0.00',vVlrIcms)) <> 0) and (StrToFloat(FormatFloat('0.00',mReg50VlrIcms.AsFloat)) > 0) then
                    begin
                      mReg50.Edit;
                      mReg50VlrIcms.AsFloat := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',mReg50VlrIcms.AsFloat)) + StrToFloat(FormatFloat('0.00',vVlrIcms))));
                      mReg50.Post;
                      vVlrIcms := 0;
                    end;
                  if (StrToFloat(FormatFloat('0.00',vVlrNota)) <> 0) and (StrToFloat(FormatFloat('0.00',mReg50VlrTotal.AsFloat)) > 0) then
                    begin
                      mReg50.Edit;
                      mReg50VlrTotal.AsFloat := StrToFloat(FormatFloat('0.00',StrToFloat(FormatFloat('0.00',mReg50VlrTotal.AsFloat)) + StrToFloat(FormatFloat('0.00',vVlrNota))));
                      mReg50.Post;
                      vVlrNota := 0;
                    end;
                  mReg50.Next;
                end;
            end;

          //Gera os registros
          mReg50.First;
          while not mReg50.Eof do
            begin
              Gera_Reg50;
              mReg50.Next;
            end;
        end;
      DM1.tNotaFiscal.Next;
    end;
  DM1.tNotaFiscal.Filtered := False;
end;

procedure TfGeraSintegra.Gera_Reg50;
var
  Texto1, Texto2, vAux : String;
  i : integer;
  Ano,Mes,Dia : Word;
begin
  //Tipo do Registro   - Tamanho 2   Posição 1 a 2
  texto1 := '50';

  //CNPJ do Fornecedor ou Cliente - Tamanho 14   Posição 13 a 16
  texto2 := '';
  vAux   := mReg50CNPJ.AsString;
  for i := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
      Texto2 := Texto2 + Copy(vAux,i,1);
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := Texto1 + texto2;

  //Inscrição Estadual do Fornecedor ou Cliente - Tamanho 14   Posição 17 a 30
  if mReg50InscEstadual.AsString = '' then
    texto2 := 'ISENTO'
  else
    begin
      texto2   := '';
      vAux     := mReg50InscEstadual.AsString;
      for i    := 1 to Length(vAux) do
        if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') and (Copy(vAux,i,1) <> '\')then
          Texto2 := Texto2 + Copy(vAux,i,1);
    end;
  for i := 1 to 14 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := Texto1 + texto2;

  //Data da Entrada da nota - Tamanho 8   Posição 31 a 38
  DecodeDate(mReg50DtEmissao.AsDateTime,Ano,Mes,Dia);
  texto1 := texto1 + IntToStr(Ano) + FormatFloat('00',Mes) + FormatFloat('00',Dia);

  //UF do Fornecedor ou Cliente - Tamanho 2   Posição 39 a 40
  texto2 := mReg50UF.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Modelo da Nota - Tamanho 2   Posição 41 a 42
  texto2 := mReg50Modelo.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Série da Nota - Tamanho 3   Posição 43 a 45
  //texto2 := mReg50Serie.AsString;
  texto2 := '';
  for i := 1 to 3 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Número da Nota - Tamanho 6   Posição 46 a 51
  texto2 := mReg50NumNota.AsString;
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Código da Natureza de Operação - Tamanho 4   Posição 52 a 55
  texto2 := mReg50CodNatOper.AsString;
  for i := 1 to 4 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Emitente (P-Próprio  T-Terceiro)  - Tamanho 1   Posição 56 a 56
  texto1 := texto1 + mReg50Emitente.AsString;

  //Valor Total da Nota - Tamanho 13  Posição 57 a 69
  texto2 := FormatFloat('00000000000.00',mReg50VlrTotal.AsFloat);
  Delete(Texto2,12,1);
  texto1 := texto1 + texto2;

  //Base de Cálculo do ICMS - Tamanho 13  Posição 70 a 82
  texto2 := FormatFloat('00000000000.00',mReg50BaseIcms.AsFloat);
  Delete(Texto2,12,1);
  texto1 := texto1 + texto2;

  //Valor do ICMS - Tamanho 13  Posição 83 a 95
  texto2 := FormatFloat('00000000000.00',mReg50VlrIcms.AsFloat);
  Delete(Texto2,12,1);
  texto1 := texto1 + texto2;

  //Valor Insento ou não tributado - Tamanho 13  Posição 96 a 108
  texto2 := FormatFloat('00000000000.00',mReg50VlrIsento.AsFloat);
  Delete(Texto2,12,1);
  texto1 := texto1 + texto2;

  //Valor que não confira débito ou crédito no ICMS - Tamanho 13  Posição 109 a 121
  texto2 := FormatFloat('00000000000.00',mReg50VlrOutras.AsFloat);
  Delete(Texto2,12,1);
  texto1 := texto1 + texto2;

  //Aliquota do ICMS - Tamanho 4  Posição 122 a 125
  texto2 := FormatFloat('00.00',mReg50AliqICMS.AsFloat);
  Delete(Texto2,3,1);
  texto1 := texto1 + texto2;

  //Situação da Nota "S" Nota Cancelada   "N" Não Cancelada - Tamanho 1  Posição 126 a 126
  texto1 := texto1 + mReg50Situacao.AsString;

  Writeln(F,texto1);
  inc(vQtdReg50);
  inc(vQtdGeral);
end;

procedure TfGeraSintegra.Gera_Reg51;
var
  Texto1, Texto2, vAux : String;
  i : integer;
  ano, mes, dia : Word;
begin
  //Tipo do Registro   - Tamanho 2   Posição 1 a 2
  Texto1 := '51';

  //CNPJ do Remetente nas entradas e do destinatario - Tamanho 14   Posição 3 a 16
  texto2   := '';
  vAux     := mReg51CNPJ.AsString;
  for i    := 1 to Length(vAux) do
    begin
      if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
        Texto2 := Texto2 + Copy(vAux,i,1);
    end;
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := Texto1 + texto2;

  //Inscr Estadual do rementente nas entradas - Tamanho 14   Posição 17 a 30
  texto2   := '';
  vAux     := mReg51InscEstadual.AsString;
  for i    := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/')  and (Copy(vAux,i,1) <> '\') then
      Texto2 := Texto2 + Copy(vAux,i,1);
  for i := 1 to 14 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := Texto1 + texto2;

  //Data de emissao recebimento - Tamanho 8   Posição 31 a 38
  DecodeDate(mReg51DtEmissao.AsDateTime,Ano,Mes,Dia);
  texto1 := texto1 + FormatFloat('0000',Ano) + FormatFloat('00',Mes) + FormatFloat('00',Dia);

  //UF do remetente - Tamanho 2   Posição 39 a 40
  texto2 := mReg51UF.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Série da Nota - Tamanho 3   Posição 41 a 43
  //texto2 := mReg51Serie.AsString;
  texto2 := '';
  for i := 1 to 3 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Número da Nota - Tamanho 6   Posição 44 a 49
  texto2 := mReg51NumNota.AsString;
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Código da Natureza de Operação - Tamanho 4   Posição 50 a 53
  texto2 := mReg51CodNatOper.AsString;
  for i := 1 to 4 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Valor Total da Nota - Tamanho 13  Posição 54 a 66
  texto2 := FormatFloat('00000000000.00',mReg51VlrTotal.AsFloat);
  Delete(Texto2,12,1);
  texto1 := texto1 + texto2;

  //Valor do IPI - Tamanho 13  Posição 67 a 79
  texto2 := FormatFloat('00000000000.00',mReg51VlrIPI.AsFloat);
  Delete(Texto2,12,1);
  texto1 := texto1 + texto2;

  //Valor do IPI ISENTO- Tamanho 13  Posição 80 a 92
  texto2 := FormatFloat('00000000000.00',mReg51VlrIpiIsento.AsFloat);
  Delete(Texto2,12,1);
  texto1 := texto1 + texto2;

  //Valor do IPI Outros- Tamanho 13  Posição 93 a 105
  texto2 := FormatFloat('00000000000.00',mReg51VlrIpiOutros.AsFloat);
  Delete(Texto2,12,1);
  texto1 := texto1 + texto2;

  //Brancos - Tamanho 20  Posição 106 a 125
  texto1 := texto1 + '                    ';

  //Situacao do documento - Tamanho 1  Posição 126 a 126
  Texto1 := Texto1 + mReg51Situacao.AsString;

  Writeln(F,texto1);
  inc(vQtdReg51);
  inc(vQtdGeral);
end;

procedure TfGeraSintegra.Gera_Reg54;
var
  Texto1, Texto2, vAux : String;
  i : integer;
begin
  //Tipo do Registro   - Tamanho 2   Posição 1 a 2
  texto1 := '54';

  //CNPJ do Fornecedor ou Cliente - Tamanho 14   Posição 13 a 16
  texto2   := '';
  vAux     := mReg54CNPJ.AsString;
  for i    := 1 to Length(vAux) do
    begin
      if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
        Texto2 := Texto2 + Copy(vAux,i,1);
    end;
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := Texto1 + texto2;

  //Código do modelo da nota - Tamanho 2   Posição 17 a 18
  texto2 := mReg54Modelo.AsString;
  for i := 1 to 2 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Série da nota - Tamanho 3   Posição 19 a 21
  //texto2 := mReg54Serie.AsString;
  texto2 := '';
  for i := 1 to 3 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Número da nota - Tamanho 6   Posição 22 a 27
  texto2 := mReg54NumNota.AsString;
  for i := 1 to 6 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Código fiscal de operação e prestação - Tamanho 4   Posição 28 a 31
  texto2 := mReg54CodNatOper.AsString;
  for i := 1 to 4 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Código da Situação Tributária - Tamanho 3   Posição 32 a 34
  texto2 := mReg54CodSitTrib.AsString;
  for i := 1 to 3 - Length(texto2) do
    texto2 := '0' + texto2;
  if mReg54ItemNota.AsInteger >= 990 then
    texto1 := texto1 + '   '
  else
    texto1 := texto1 + texto2;

  //Número de ordem do item da nota - Tamanho 3   Posição 35 a 37
  if mReg54ItemNota.AsInteger > 0 then
    texto2 := mReg54ItemNota.AsString
  else
    texto2 := IntToStr(vItem54);
  for i := 1 to 3 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  //Código do produto ou serviço - Tamanho 14   Posição 38 a 51
  if mReg54ItemNota.AsInteger > 900 then
    texto2 := ''
  else
    texto2 := mReg54CodProduto.AsString;
  for i := 1 to 14 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Quantidade do produto ou servico - Tamanho 11   Posição 52 a 62
  texto2 := FormatFloat('00000000.000',mReg54Qtde.AsFloat);
  Delete(Texto2,9,1);
  texto1 := texto1 + texto2;

  //Valor bruto do produto - Tamanho 12   Posição 63 a 74
  texto2 := FormatFloat('0000000000.00',mReg54VlrTotal.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Valor do desconto concedido - Tamanho 12   Posição 75 a 86
  texto2 := FormatFloat('0000000000.00',mReg54VlrDesconto.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Base de cálculo do icms - Tamanho 12   Posição 87 a 98
  texto2 := FormatFloat('0000000000.00',mReg54BaseIcms.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Base de cálculo do ICMS de retenção na Substituição Tributária - Tamanho 12 Posição 99 a 110
  texto1 := texto1 + '000000000000';

  //Valor do IPI - Tamanho 12 Posição 111 a 122
  texto2 := FormatFloat('0000000000.00',mReg54VlrIPI.AsFloat);
  Delete(Texto2,11,1);
  texto1 := texto1 + texto2;

  //Aliquota do ICMS - Tamanho 4 Posição 123 a 126
  texto2 := FormatFloat('00.00',mReg54AliqICMS.AsFloat);
  Delete(Texto2,3,1);
  texto1 := texto1 + texto2;

  Writeln(F,texto1);
  inc(vQtdReg54);
  inc(vQtdGeral);
end;

procedure TfGeraSintegra.Gera_Reg75;
var
  Texto1, Texto2, vAux : String;
  i : integer;
  Ano,Mes,Dia : Word;
begin
  //Tipo do Registro   - Tamanho 2   Posição 1 a 2
  texto1 := '75';

  //Data Inicial das informações - Tamanho 8   Posição 3 a 10
  DecodeDate(DateEdit1.Date,ano,mes,dia);
  texto1 := texto1 + IntToStr(Ano) + FormatFloat('00',Mes) + FormatFloat('00',Dia);

  //Data Final das informações - Tamanho 8   Posição 11 a 18
  DecodeDate(DateEdit2.Date,ano,mes,dia);
  texto1 := texto1 + IntToStr(Ano) + FormatFloat('00',Mes) + FormatFloat('00',Dia);

  //Código do produto ou serviço - Tamanho 14   Posição 19 a 32
  texto2 := mReg75CodProduto.AsString;
  for i := 1 to 14 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Classificação fiscal  - Tamanho 8   Posição 33 a 40
  texto2   := '';
  vAux     := mReg75ClasFiscal.AsString;
  for i    := 1 to Length(vAux) do
    begin
      if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') and (Copy(vAux,i,1) <> '\') then
        Texto2 := Texto2 + Copy(vAux,i,1);
    end;
  for i := 1 to 8 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := Texto1 + texto2;

  //Descrição do produto ou serviço  - Tamanho 53   Posição 41 a 93
  texto2 := mReg75NomeProduto.AsString;
  for i := 1 to 53 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Unidade de Medida  - Tamanho 6   Posição 94 a 99
  texto2 := mReg75Unidade.AsString;
  for i := 1 to 6 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;

  //Aliquota do IPI  - Tamanho 5   Posição 100 a 104
  texto2 := FormatFloat('000.00',mReg75AliqIPI.AsFloat);
  Delete(Texto2,4,1);
  texto1 := texto1 + texto2;

  //Aliquota do ICMS  - Tamanho 4   Posição 105 a 108
  texto2 := FormatFloat('00.00',mReg75AliqICMS.AsFloat);
  Delete(Texto2,3,1);
  texto1 := texto1 + texto2;

  //% de redução na base de cálculo  - Tamanho 5 Posição 109 a 113
  texto2 := FormatFloat('000.00',mReg75PercRedBaseCalculo.AsFloat);
  Delete(Texto2,4,1);
  texto1 := texto1 + texto2;

  //Base de cálculo do icms da substituição tributária  - Tamanho 13  Posição 114 a 126
  texto1 := texto1 + '0000000000000';

  Writeln(F,texto1);
  inc(vQtdReg75);
  inc(vQtdGeral);
end;

procedure TfGeraSintegra.Gera_Reg90;
var
  Texto1, Texto2, vAux : String;
  i : integer;
begin
  //Tipo do Registro   - Tamanho 2   Posição 1 a 2
  texto1 := '90';

  //CNPJ do Fornecedor ou Cliente - Tamanho 14   Posição 13 a 16
  texto2   := '';
  vAux     := DM1.tFilialCNPJ.AsString;
  for i    := 1 to Length(vAux) do
    begin
      if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/') then
        Texto2 := Texto2 + Copy(vAux,i,1);
    end;
  for i := 1 to 14 - Length(texto2) do
    texto2 := '0' + texto2;
  texto1 := Texto1 + texto2;
  
  //Inscrição Estadual - Tamanho 14   Posição 17 a 30
  texto2   := '';
  vAux     := DM1.tFilialInscr.AsString;
  for i    := 1 to Length(vAux) do
    if (Copy(vAux,i,1) <> '.') and (Copy(vAux,i,1) <> '-') and (Copy(vAux,i,1) <> '/')  and (Copy(vAux,i,1) <> '\') then
      Texto2 := Texto2 + Copy(vAux,i,1);
  for i := 1 to 14 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := Texto1 + texto2;

  //Tipo a ser totalizado e a quantidade do tipo posicao do 31 ao 40
  if vQtdReg50 > 0 then
    begin
      texto1 := texto1 + '50';
      texto2 := IntToStr(vQtdReg50);
      for i := 1 to 8 - length(texto2) do
        texto2 := '0' + texto2;
      texto1 := texto1 + texto2;
    end;

  //Tipo a ser totalizado e a quantidade do tipo posicao do 31 ao 40
  if vQtdReg51 > 0 then
    begin
      texto1 := texto1 + '51';
      texto2 := IntToStr(vQtdReg51);
      for i := 1 to 8 - length(texto2) do
        texto2 := '0' + texto2;
      texto1 := texto1 + texto2;
    end;

  if vQtdReg54 > 0 then
    begin
      texto1 := texto1 + '54';
      texto2 := IntToStr(vQtdReg54);
      for i := 1 to 8 - length(texto2) do
        texto2 := '0' + texto2;
      texto1 := texto1 + texto2;
    end;

  if vQtdReg75 > 0 then
    begin
      texto1 := texto1 + '75';
      texto2 := IntToStr(vQtdReg75);
      for i := 1 to 8 - length(texto2) do
        texto2 := '0' + texto2;
      texto1 := texto1 + texto2;
    end;

  inc(vQtdGeral);
  texto1 := texto1 + '99';
  texto2 := IntToStr(vQtdGeral);
  for i := 1 to 8 - length(texto2) do
    texto2 := '0' + texto2;
  texto1 := texto1 + texto2;

  for i := 1 to 125 - Length(texto1) do
    texto1 := texto1 + ' ';
  texto1 := texto1 + '1';
                         
  Writeln(F,texto1);
end;

procedure TfGeraSintegra.BitBtn1Click(Sender: TObject);
var
  ano, mes, dia : Word;
  vNumNota : Integer;
  vAliqAux : Real;
  vCodNatOper : String;
begin
  if (DateEdit1.Text = '  /  /    ') or (DateEdit2.Text = '  /  /    ') or (DirectoryEdit1.Text = '') or
     (RxDBLookupCombo1.Text = '') then
    ShowMessage('Falta informar a Filial, data inicial ou final')
  else
    begin
      Screen.Cursor := crHourglass;
      mReg51.EmptyTable;
      mReg54.EmptyTable;
      mReg75.EmptyTable;
      vQtdReg50 := 0;
      vQtdReg51 := 0;
      vQtdReg54 := 0;
      vQtdReg75 := 0;
      vQtdReg90 := 0;
      vQtdGeral := 0;
      DecodeDate(DateEdit1.Date,ano,mes,dia);
      if RxDBLookupCombo1.KeyValue = 1 then
        AssignFile(F,DirectoryEdit1.Text + '\'+ 'M'+FormatFloat('00',Mes)+Copy(IntToStr(Ano),3,2)+'.Txt')
      else
        AssignFile(F,DirectoryEdit1.Text + '\'+ 'F'+FormatFloat('00',Mes)+Copy(IntToStr(Ano),3,2)+'.Txt');
      Rewrite(F);
      Gera_Reg10;
      Gera_Reg11;
      Le_NEntrada;
      Le_NotaFiscal;
      mReg51.First;
      while not mReg51.Eof do
        begin
          Gera_Reg51;
          mReg51.Next;
        end;
      vItem54 := 0;
      mReg54.First;
      vNumNota    := mReg54NumNota.AsInteger;
      vAliqAux    := mReg54AliqICMS.AsFloat;
      vCodNatOper := mReg54CodNatOper.AsString;
      while not mReg54.Eof do
        begin
          if (mReg54NumNota.AsInteger = vNumNota) and
             //(mReg54AliqICMS.AsFloat = vAliqAux) and
             (mReg54CodNatOper.AsString = vCodNatOper) then
            Inc(vItem54)
          else
            vItem54 := 1;
          Gera_Reg54;
          vNumNota    := mReg54NumNota.AsInteger;
          vAliqAux    := mReg54AliqICMS.AsFloat;
          vCodNatOper := mReg54CodNatOper.AsString;
          mReg54.Next;
        end;
      mReg75.First;
      while not mReg75.Eof do
        begin
          Gera_Reg75;
          mReg75.Next;
        end;
      Gera_Reg90;
      CloseFile(F);
      DateEdit1.Clear;
      DateEdit2.Clear;
      Screen.Cursor := crDefault;
      ShowMessage('Sintegra Gerado!');
    end;
end;

procedure TfGeraSintegra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tNotaFiscal.Close;
  DM1.tNotaFiscalItens.Close;
  DM1.tNEntrada.Close;
  DM1.tNEntradaItens.Close;
  DM1.tCliente.Close;
  DM1.tNatOperacao.Close;
  DM1.tProduto.Close;
  DM1.tProdutoCor.Close;
  DM1.tProdutoGrade.Close;
  DM1.tProdutoTam.Close;
  DM1.tSitTributaria.Close;
  DM1.tNEntradaItensMobra.Close;
  DM1.tMaoDeObra.Close;
  Action := Cafree;
end;

procedure TfGeraSintegra.mReg50NewRecord(DataSet: TDataSet);
begin
  mReg50AliqICMS.AsFloat  := 0;
  mReg50BaseIcms.AsFloat  := 0;
  mReg50VlrIcms.AsFloat   := 0;
  mReg50VlrIsento.AsFloat := 0;
  mReg50VlrOutras.AsFloat := 0;
  mReg50VlrTotal.AsFloat  := 0;
end;

procedure TfGeraSintegra.mReg54NewRecord(DataSet: TDataSet);
begin
  mReg54AliqICMS.AsFloat     := 0;
  mReg54BaseIcms.AsFloat     := 0;
  mReg54VlrDesconto.AsFloat  := 0;
  mReg54Qtde.AsFloat         := 0;
  mReg54VlrIPI.AsFloat       := 0;
  mReg54VlrTotal.AsFloat     := 0;
  mReg54CodProduto.AsInteger := 0;
end;

procedure TfGeraSintegra.DateEdit1Exit(Sender: TObject);
var
  ano, mes, dia : Word;
begin
  DecodeDate(DateEdit1.Date,ano,mes,dia);
  dateEdit2.Date := IncMonth(EncodeDate(ano,mes,1),1) - 1;
  if RxDBLookupCombo1.Text <> '' then
    begin
      if RxDBLookupCombo1.KeyValue = 1 then
        Edit1.Text := 'M'+FormatFloat('00',Mes)+Copy(IntToStr(Ano),3,2)+'.Txt'
      else
        Edit1.Text := 'F'+FormatFloat('00',Mes)+Copy(IntToStr(Ano),3,2)+'.Txt';
    end
  else
    begin
      ShowMessage('Falta informar a Filial!');
      RxDBLookupCombo1.SetFocus;
    end;
end;

procedure TfGeraSintegra.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfGeraSintegra.mReg51NewRecord(DataSet: TDataSet);
begin
  mReg51VlrIPI.AsFloat       := 0;
  mReg51VlrIpiIsento.AsFloat := 0;
  mReg51VlrIpiOutros.AsFloat := 0;
  mReg51VlrTotal.AsFloat     := 0;
end;

procedure TfGeraSintegra.mReg50BeforePost(DataSet: TDataSet);
begin
  if mReg50VlrTotal.AsFloat - mReg50BaseIcms.AsFloat < 0 then //teste adicionado em 12/04/06 Juca
    mReg50VlrOutras.AsFloat := 0
  else
    mReg50VlrOutras.AsFloat := StrToFloat(FormatFloat('0.00',mReg50VlrTotal.AsFloat)) -
                               StrToFloat(FormatFloat('0.00',mReg50BaseIcms.AsFloat));
end;

procedure TfGeraSintegra.FormShow(Sender: TObject);
begin
  DM1.tNotaFiscal.Open;
  DM1.tNotaFiscalItens.Open;
  DM1.tNEntrada.Open;
  DM1.tNEntradaItens.Open;
  DM1.tCliente.Open;
  DM1.tNatOperacao.Open;
  DM1.tProduto.Open;
  DM1.tProdutoCor.Open;
  DM1.tProdutoGrade.Open;
  DM1.tProdutoTam.Open;
  DM1.tSitTributaria.Open;
  DM1.tNEntradaItensMobra.Open;
  DM1.tMaoDeObra.Open;
  RxDBLookupCombo1.KeyValue := DM1.tFilialCodigo.AsInteger;
end;

procedure TfGeraSintegra.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DateEdit1.SetFocus;
end;

end.
