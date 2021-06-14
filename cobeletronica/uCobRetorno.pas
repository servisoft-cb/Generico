unit uCobRetorno; //ABCR Novo

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Grids, DBGrids, SMDBGrid,
  ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, RxLookup, ACBrBase, ACBrBoleto, NxCollection, UDMCobEletronica,
  rsDBUtils, db, uDm1, uUtilPadrao;

type
  TfCobRetorno = class(TForm)
    ACBrBoleto1: TACBrBoleto;
    Panel3: TPanel;
    Label6: TLabel;
    Label1: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    FilenameEdit1: TFilenameEdit;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    Shape1: TShape;
    Label33: TLabel;
    Shape2: TShape;
    Label2: TLabel;
    Shape3: TShape;
    Label3: TLabel;
    Shape4: TShape;
    Label4: TLabel;
    btnLocalizar: TNxButton;
    NxButton1: TNxButton;
    Shape5: TShape;
    Label5: TLabel;
    Shape6: TShape;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure prc_ConfiguraACBR;
    procedure btnLocalizarClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FilenameEdit1Change(Sender: TObject);
    procedure RxDBLookupCombo3Change(Sender: TObject);
  private
    { Private declarations }
    fDmCob_Eletronica: TDmCobEletronica;
    fDm1: TDm1;
    vFilial: Integer;
    vNumMov, vNumMovJuros : Integer;
    procedure prc_Monta_Ocorrencia;
    procedure prc_Monta_Erro_Liq(Codigo, Tipo: String);
    procedure prc_Posiciona_Duplicata;
    procedure prc_Liquidacao;
    procedure prc_mRetorno_Atualizado;

    procedure Grava_Historico(Tipo, Historico : String); //E- Entrada  L- Liquidação  P-Protestado
    procedure Grava_ExtComissao;

  public
    { Public declarations }
    vID_BancoLoc : Integer;
  end;

var
  fCobRetorno: TfCobRetorno;

implementation

uses UDM2;

{$R *.dfm}

procedure TfCobRetorno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  vID_BancoLoc := 0;
  FreeAndNil(fDmCob_Eletronica);
  Action := caFree;
end;

procedure TfCobRetorno.FormShow(Sender: TObject);
begin
  fDmCob_Eletronica := TDmCobEletronica.Create(Self);
  oDBUtils.SetDataSourceProperties(Self,fDmCob_Eletronica);
  fDMCob_Eletronica.tContas.Open;

  if vID_BancoLoc > 0 then
    RxDBLookupCombo3.KeyValue := vID_BancoLoc
  else
  if (fDmCob_Eletronica.tContas.RecordCount < 2) and (fDmCob_Eletronica.tContasCodConta.AsInteger > 0) then
    RxDBLookupCombo3.KeyValue := fDmCob_Eletronica.tContasCodConta.AsInteger;
end;

procedure TfCobRetorno.RxDBLookupCombo3Enter(Sender: TObject);
begin
  fDmCob_Eletronica.tContas.IndexFieldNames := 'NomeConta';
end;

procedure TfCobRetorno.NxButton1Click(Sender: TObject);
begin
  if fDMCob_Eletronica.mRetorno.IsEmpty then
  begin
    MessageDlg('*** Não existe título para atualizar!', mtInformation, [mbOk], 0);
    exit;
  end;

//  if not Assigned(fDm1) then
//    fDm1 := TDM1.Create(Self);

  fDMCob_Eletronica.mRetorno.First;
  while not fDMCob_Eletronica.mRetorno.Eof do
  begin
    fDMCob_Eletronica.vNossoNumero := '';

    if fDmCob_Eletronica.mRetornoCodCliente.AsInteger > 0 then
    begin
      if ((fDMCob_Eletronica.mRetornoTipo_Ret.AsString = 'LIQ') or
         (fDMCob_Eletronica.mRetornoTipo_Ret.AsString = 'LNO') or
         (fDMCob_Eletronica.mRetornoTipo_Ret.AsString = 'LCA') or
         (trim(fDMCob_Eletronica.mRetornoDescLiquidacao.AsString) <> '')) then
      begin
        prc_Posiciona_Duplicata;
        if not (fDmCob_Eletronica.tCReceberParc.IsEmpty) and ((fDMCob_Eletronica.mRetornoTipo_Ret.AsString = 'LIQ') or
               (fDMCob_Eletronica.mRetornoTipo_Ret.AsString = 'LNO') or
               (fDMCob_Eletronica.mRetornoTipo_Ret.AsString = 'LCA') or
               (trim(fDMCob_Eletronica.mRetornoDescLiquidacao.AsString) <> '')) and
               (StrToFloat(FormatFloat('0.00',fDmCob_Eletronica.tCReceberParcRestParcela.AsFloat)) > 0)
               and (fDmCob_Eletronica.vExiste_Rec) then
          prc_Liquidacao
      end
      else
      begin
        if fDMCob_Eletronica.mRetornoAtualizar.AsString = 'S' then
        begin
          try
            prc_Posiciona_Duplicata;
            if fDmCob_Eletronica.vExiste_Rec then
            begin
              if fDMCob_Eletronica.mRetornoTipo_Ret.AsString = 'PRO' then
                fDMCob_Eletronica.prc_Gravar_Duplicata('PRO')
              else
              begin
                fDMCob_Eletronica.vNossoNumero := fDMCob_Eletronica.mRetornoNossoNumero.AsString;
                fDmCob_Eletronica.xNossoNum    := fDmCob_Eletronica.mRetornoNossoNumero.AsVariant;
                fDMCob_Eletronica.prc_Gravar_Duplicata('NNU');
              end;
              prc_mRetorno_Atualizado;
            end;
          except
          end;
        end;
      end;
    end;
    fDMCob_Eletronica.mRetorno.Next;
  end;
  FreeAndNil(fDm1);
  MessageDlg('*** Concluído!', mtInformation, [mbOk], 0);
end;

procedure TfCobRetorno.prc_ConfiguraACBR;
begin
  ACBrBoleto1.ListadeBoletos.Clear;
  if fDmCob_Eletronica.tContasACBR_LAYOUTREMESSA.AsString = 'C240' then
    ACBrBoleto1.LayoutRemessa := C240
  else
    ACBrBoleto1.LayoutRemessa := C400;

  case fDmCob_Eletronica.tContasACBR_TIPOCOBRANCA.AsInteger of
     1: ACBrBoleto1.Banco.TipoCobranca := cobBancoDoBrasil;
     2: ACBrBoleto1.Banco.TipoCobranca := cobBancoDoNordeste;
     3: ACBrBoleto1.Banco.TipoCobranca := cobBancoMercantil;
     4: ACBrBoleto1.Banco.TipoCobranca := cobBancoob;
     5: ACBrBoleto1.Banco.TipoCobranca := cobBanestes;
     6: ACBrBoleto1.Banco.TipoCobranca := cobBanrisul;
     7: ACBrBoleto1.Banco.TipoCobranca := cobBicBanco;
     8: ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
     9: ACBrBoleto1.Banco.TipoCobranca := cobBradescoSICOOB;
    10: ACBrBoleto1.Banco.TipoCobranca := cobBRB;
    11: ACBrBoleto1.Banco.TipoCobranca := cobCaixaEconomica;
    12: ACBrBoleto1.Banco.TipoCobranca := cobCaixaSicob;
    13: ACBrBoleto1.Banco.TipoCobranca := cobHSBC;
    14: ACBrBoleto1.Banco.TipoCobranca := cobItau;
    15: ACBrBoleto1.Banco.TipoCobranca := cobNenhum;
    16: ACBrBoleto1.Banco.TipoCobranca := cobSantander;
    17: ACBrBoleto1.Banco.TipoCobranca := cobSicred;
  end;
  ACBrBoleto1.Cedente.Nome          := fDmCob_Eletronica.tFilialEmpresa.AsString;
  ACBrBoleto1.Cedente.CodigoCedente := fDmCob_Eletronica.tContasCodCedente.AsString;
  ACBrBoleto1.Cedente.Agencia       := fDmCob_Eletronica.tContasAgencia.AsString;
  ACBrBoleto1.Cedente.AgenciaDigito := fDmCob_Eletronica.tContasAgencia_Dig.AsString;
  ACBrBoleto1.Cedente.Conta         := fDmCob_Eletronica.tContasNumConta.AsString;
  ACBrBoleto1.Cedente.ContaDigito   := fDmCob_Eletronica.tContasDigConta.AsString;
  ACBrBoleto1.Cedente.UF            := fDmCob_Eletronica.tFilialEstado.AsString;
  ACBrBoleto1.DirArqRemessa         := fDmCob_Eletronica.tContasEnd_Arq_Rem.AsString;
  ACBrBoleto1.NomeArqRetorno        := 'COB_' + FormatDateTime('YYYYMMDD_HHMMSS',Now)+'.TXT';
  ACBrBoleto1.Cedente.CNPJCPF       := fDmCob_Eletronica.tFilialCNPJ.AsString;
  ACBrBoleto1.Cedente.TipoInscricao := pJuridica;
end;

procedure TfCobRetorno.btnLocalizarClick(Sender: TObject);
var
  i: Integer;
  vDir: String;
  vNomeArq: String;
  i2: Integer;
  vTexto: String;
begin
  fDmCob_Eletronica.mRetorno.EmptyDataSet;
  prc_ConfiguraACBR;

  fDMCob_Eletronica.qContas_Retorno.Close;
  fDMCob_Eletronica.qContas_Retorno.ParamByName('ID').AsInteger := fDMCob_Eletronica.tContasCodConta.AsInteger;
  fDMCob_Eletronica.qContas_Retorno.Open;

  fDMCob_Eletronica.cdsRet_Cadastro.Close;
  fDMCob_Eletronica.sdsRet_Cadastro.ParamByName('ID_BANCO').AsInteger := fDMCob_Eletronica.tContasIdBanco.AsInteger;
  fDMCob_Eletronica.cdsRet_Cadastro.Open;

  fDmCob_Eletronica.tContas.IndexFieldNames := 'CODCONTA';
  fDmCob_Eletronica.tContas.FindKey([RxDBLookupCombo3.KeyValue]);
  vFilial := fDmCob_Eletronica.tContasFILIAL.AsInteger;

  ACBrBoleto1.Banco.Numero := fDmCob_Eletronica.tContasCodBanco.AsInteger;
  ACBrBoleto1.Banco.Nome   := fDmCob_Eletronica.tContasAcbr_TipoCobranca.AsString;// 'Banco do Estado do Rio Grande do Sul S.A.';
  vNomeArq := FilenameEdit1.Text;
  if copy(vNomeArq,1,1) = '"' then
  begin
    delete(vNomeArq,1,1);
    delete(vNomeArq,Length(vDir),1);
  end;
  vDir := ExtractFilePath(vNomeArq);
  delete(vDir,Length(vDir),1);
  ACBrBoleto1.DirArqRetorno  := vDir;
  ACBrBoleto1.NomeArqRetorno := Copy(vNomeArq,Length(ACBrBoleto1.DirArqRetorno) + 2,
                                     Length(vNomeArq) + 1 - Length(ACBrBoleto1.DirArqRetorno));
  vNomeArq := ACBrBoleto1.NomeArqRetorno;
  if copy(vNomeArq,Length(vNomeArq),1) = '"' then
    delete(vNomeArq,Length(vNomeArq),1);

  ACBrBoleto1.NomeArqRetorno := vNomeArq;

  ACBrBoleto1.LerRetorno;

  for i := 0 to acbrboleto1.ListadeBoletos.Count - 1 do
  begin
    with acbrboleto1.ListadeBoletos.Objects[I] do
    begin
      fDMCob_Eletronica.mRetorno.Insert;
      fDmCob_Eletronica.mRetornoNomeCliente.AsString := Sacado.NomeSacado;
      fDmCob_Eletronica.mRetornoNossoNumero.AsString := NossoNumero;
      fDmCob_Eletronica.mRetornoSeuNumero.AsString    := SeuNumero;
      fDmCob_Eletronica.mRetornoID_Duplicata.AsString := IdentTituloEmpresa;
      vTexto := trim(NumeroDocumento);
      i2 := pos('/',vTexto);
      if i2 > 0 then
      begin
        fDmCob_Eletronica.mRetornoNumNota.AsString := copy(vTexto,3,i2-1);
        fDmCob_Eletronica.mRetornoParcela.AsString := copy(vTexto,i2+1,Length(vTexto) - i2+1);
      end
      else
        fDmCob_Eletronica.mRetornoNumNota.AsString := NumeroDocumento;
      fDmCob_Eletronica.mRetornoDtOcorrencia.AsDateTime   := DataOcorrencia;
      fDmCob_Eletronica.mRetornoCodOcorrenciaRet.AsString :=  OcorrenciaOriginal.CodigoBanco;

      prc_Monta_Ocorrencia;
      fDmCob_Eletronica.mRetornoVlrTitulo.AsCurrency     := ValorDocumento;
      fDmCob_Eletronica.mRetornoVlrPago.AsCurrency       := ValorRecebido;
      fDmCob_Eletronica.mRetornoNomeCliente.AsString     := Sacado.NomeSacado;
      fDmCob_Eletronica.mRetornoVlrJurosPagos.AsCurrency := ValorMoraJuros;
      fDmCob_Eletronica.mRetornoVlrAbatimento.AsCurrency := ValorAbatimento;
      fDmCob_Eletronica.mRetornoVlrDesconto.AsCurrency   := ValorDesconto;
      fDmCob_Eletronica.mRetornoNomeCliente.AsString     := Sacado.NomeSacado;

      fDmCob_Eletronica.mRetornoVlrDespesaCobranca.AsCurrency := ValorDespesaCobranca;

      vTexto := trim(fDmCob_Eletronica.mRetornoID_Duplicata.AsString);
      i2 := pos('.',vTexto);
      if i2 > 0 then
      begin
        fDmCob_Eletronica.mRetornoID_Duplicata.AsString := copy(vTexto,i2+1,Length(vTexto) - i2+1);
        fDmCob_Eletronica.mRetornoID_Duplicata.AsString := Copy(fDmCob_Eletronica.mRetornoID_Duplicata.AsString,1,
                                                           Length(fDmCob_Eletronica.mRetornoID_Duplicata.AsString)-2);
        fDmCob_Eletronica.mRetornoFilial.AsString       := copy(vTexto,1,i2-1);
      end;
      if trim(vTexto) <> '' then
      begin
        if fDmCob_Eletronica.mRetornoID_Duplicata.AsInteger > 0 then
        begin
          prc_Posiciona_Duplicata;

//          fDmCob_Eletronica.prc_Duplicata(0,fDmCob_Eletronica.mRetornoID_Duplicata.AsInteger,0,0,0,'','');
          if not fDmCob_Eletronica.tCReceberParc.IsEmpty then
          begin
//            fDmCob_Eletronica.mRetornoNomeCliente.AsString := fDmCob_Eletronica.tCReceberParcNomeCliente.AsString;
            fDmCob_Eletronica.mRetornoDtVenc.AsString      := fDmCob_Eletronica.tCReceberParcDtVencCReceber.AsString;
            fDmCob_Eletronica.mRetornoCodCliente.AsInteger := fDmCob_Eletronica.tCReceberParcCodCli.AsInteger;
          end;
        end;
      end;
      if fDMCob_Eletronica.mRetornoTipo_Ret.AsString = 'PRO' then
        fDmCob_Eletronica.mRetornoAtualizar.AsString := 'S'
      else
      if fDmCob_Eletronica.mRetornoCodOcorrenciaRet.AsString = '02' then
        fDmCob_Eletronica.mRetornoAtualizar.AsString := 'S';

      fDMCob_Eletronica.mRetorno.Post;
    end;
  end;
end;

procedure TfCobRetorno.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDmCob_Eletronica.mRetorno.IsEmpty then
    exit;
  if (fDMCob_Eletronica.mRetornoAtualizado.AsString = 'S') then
    Background := $00D7D7D7
  else
  if fDmCob_Eletronica.mRetornoCodCliente.AsInteger <= 0 then
  begin
    Background  := clMaroon;
    AFont.Color := clWhite;
  end
  else
  if fDMCob_Eletronica.mRetornoTipo_Ret.AsString = 'ERR' then
  begin
    Background  := clRed;
    AFont.Color := clWhite;
  end
  else
  if (fDMCob_Eletronica.mRetornoTipo_Ret.AsString = 'LIQ') or
     (fDMCob_Eletronica.mRetornoTipo_Ret.AsString = 'LCA') or
     (fDMCob_Eletronica.mRetornoTipo_Ret.AsString = 'LNO') then
    Background := clMoneyGreen
  else
  if (fDMCob_Eletronica.mRetornoTipo_Ret.AsString = 'PRO') then
    Background := clYellow
  else
  if (fDMCob_Eletronica.mRetornoAtualizar.AsString = 'S') then
    Background := $00FFCB97;
end;

procedure TfCobRetorno.prc_Monta_Ocorrencia;
begin
  if (fDMCob_Eletronica.cdsRet_Cadastro.Locate('CODIGO;TIPO_REG',
     VarArrayOf([fDMCob_Eletronica.mRetornoCodOcorrenciaRet.AsString,'OCO']),
     [locaseinsensitive])) then
  begin
    fDMCob_Eletronica.mRetornoNomeOcorrenciaRet.AsString := fDMCob_Eletronica.cdsRet_CadastroNOME.AsString;
    fDMCob_Eletronica.mRetornoTipo_Ret.AsString          := fDmCob_Eletronica.cdsRet_CadastroTIPO_RET.AsString;
  end;
end;

procedure TfCobRetorno.prc_Monta_Erro_Liq(Codigo, Tipo: String);
var
  vCodErro: array[1..4] of String;
  i: Integer;
  vIndiceErro: Integer;
  vIErro: Integer;
begin
  fDmCob_Eletronica.qRet_Erro.Open;

  vIndiceErro := 0;
  vIErro      := fDMCob_Eletronica.qContas_RetornoQTD_ERRO_CADASTRO.AsInteger;
  if vIErro <= 0 then
    vIErro := 2;
  for i := 1 to 4 do
    vCodErro[i] := '';
  i := vIErro;
  if copy(Codigo,1,vIErro) <> '' then
    vCodErro[1] := copy(Codigo,1,vIErro);
  i := i + 1;
  if copy(Codigo,i,vIErro) <> '' then
    vCodErro[2] := copy(Codigo,i,vIErro);
  i := i + vIErro;
  if copy(Codigo,i,vIErro) <> '' then
    vCodErro[3] := copy(Codigo,i,vIErro);
  i := i + vIErro;
  if copy(Codigo,i,vIErro) <> '' then
    vCodErro[4] := copy(Codigo,i,vIErro);
  fDMCob_Eletronica.mRetornoTipo_Ret.AsString := Tipo;
  for i := 1 to 4 do
  begin
    if trim(vCodErro[i]) <> '' then
    begin
      vIndiceErro := vIndiceErro + 1;
      fDMCob_Eletronica.qRet_Erro.Close;
      fDMCob_Eletronica.qRet_Erro.ParamByName('CODIGO').AsString   := vCodErro[i];
      fDMCob_Eletronica.qRet_Erro.ParamByName('TIPO_REG').AsString := Tipo;
      fDMCob_Eletronica.qRet_Erro.Open;
      if not fDMCob_Eletronica.qRet_Erro.IsEmpty then
      begin
        if Tipo = 'LIQ' then
          fDMCob_Eletronica.mRetornoDescLiquidacao.AsString := fDMCob_Eletronica.qRet_ErroNOME.AsString
        else
          fDMCob_Eletronica.mRetorno.FieldByName('DescErro'+IntToStr(vIndiceErro)).AsString := fDMCob_Eletronica.qRet_ErroNOME.AsString;
      end;
    end;
  end;
end;

procedure TfCobRetorno.prc_Posiciona_Duplicata;
begin
  if (trim(fDMCob_Eletronica.mRetornoFilial.AsString) <> '') and
     (trim(fDMCob_Eletronica.mRetornoID_Duplicata.AsString) <> '') and
     (trim(fDMCob_Eletronica.mRetornoParcela.AsString) <> '') then
    fDmCob_Eletronica.prc_Localizar(fDMCob_Eletronica.mRetornoFilial.AsInteger,
                                    fDMCob_Eletronica.mRetornoID_Duplicata.AsInteger,
                                    fDMCob_Eletronica.mRetornoParcela.AsInteger);
  fDmCob_Eletronica.tCReceberParcHist.Close;
  fDmCob_Eletronica.tCReceberParcHist.Open;
  vFilial := fDmCob_Eletronica.tCReceberParcFILIAL.AsInteger;
end;

procedure TfCobRetorno.prc_Liquidacao;
var
  vHistAux: String;
  vComDesconto: String;
begin
  if StrToFloat(FormatFloat('0.00',fDmCob_Eletronica.tCReceberParcRestParcela.AsFloat)) > 0 then
  begin
    fDmCob_Eletronica.tCReceberParc.Edit;
    if (RxDBLookupCombo3.Text <> '') and (fDmCob_Eletronica.tCReceberParcCodConta.AsInteger <= 0) then
      fDmCob_Eletronica.tCReceberParcCodConta.AsInteger := RxDBLookupCombo3.KeyValue;

    fDmCob_Eletronica.tCReceberParcDespesas.AsFloat    := StrToFloat(FormatFloat('0.00',0));
//    fDmCob_Eletronica.tCReceberParcVLR_PAGO.AsFloat    := StrToFloat(FormatFloat('0.00',fDmCob_Eletronica.tCReceberParcRestParcela.AsFloat));
    fDmCob_Eletronica.tCReceberParcDesconto.AsFloat    := StrToFloat(FormatFloat('0.00',fDMCob_Eletronica.mRetornoVlrDesconto.AsFloat));
    fDmCob_Eletronica.tCReceberParcJurosPagos.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCob_Eletronica.mRetornoVlrJurosPagos.AsFloat));
    fDmCob_Eletronica.tCReceberParcPgtoParcial.AsFloat := StrToFloat(FormatFloat('0.00',fDmCob_Eletronica.tCReceberParcVlrParcCReceber.AsFloat -
                                                                                        fDMCob_Eletronica.mRetornoVlrDesconto.AsFloat));
    fDmCob_Eletronica.tCReceberParcDespesas.AsFloat    := StrToFloat(FormatFloat('0.00',fDMCob_Eletronica.mRetornoVlrDespesaCobranca.AsFloat));

    if trim(fDMCob_Eletronica.mRetornoDtLiquidacao.AsString) = '' then
      fDmCob_Eletronica.tCReceberParcDtPagParcCReceber.AsDateTime := fDMCob_Eletronica.mRetornoDtOcorrencia.AsDateTime
    else
      fDmCob_Eletronica.tCReceberParcDtPagParcCReceber.AsDateTime := fDMCob_Eletronica.mRetornoDtLiquidacao.AsDateTime;
    vHistAux := '';
    if fDMCob_Eletronica.mRetornoTipo_Ret.AsString = 'LCA' then
    begin
      vHistAux := 'LCA ';
      fDmCob_Eletronica.tCReceberParcPgCartorio.AsString := 'S';
    end;


    {fDm1.prc_Gravar_Dupicata_Hist('PAG',vHistAux + 'PAGAMENTO DE TITULO',fDmCob_Eletronica.tCReceberParcPgtoParcial.AsFloat,
                                             fDMCob_Eletronica.mRetornoVlrJurosPagos.AsFloat,fDMCob_Eletronica.mRetornoVlrDesconto.AsFloat,
                                             fDmCob_Eletronica.tCReceberParcVLR_DESPESAS.AsFloat,fDmCob_Eletronica.tCReceberParcVLR_TAXA_BANCARIA.AsFloat,
                                             fDmCob_Eletronica.tCReceberParcID_TIPOCOBRANCA.AsInteger);}
    vComDesconto := '';
    if StrToFloat(FormatFloat('0.00',fDMCob_Eletronica.mRetornoVlrDesconto.AsFloat)) > 0 then
      vComDesconto := 'S';
{    if StrToFloat(FormatFloat('0.00',fDmCob_Eletronica.tCReceberParcPgtoParcial.AsFloat)) > 0 then
      fDm1.prc_Gravar_Financeiro(fDmCob_Eletronica.tCReceberParcPgtoParcial.AsFloat,'P',fDmCob_Eletronica.tCReceberParcID_TIPOCOBRANCA.AsInteger,vComDesconto);
    if StrToFloat(FormatFloat('0.00',fDMCob_Eletronica.mRetornoVlrJurosPagos.AsFloat)) > 0 then
      fDm1.prc_Gravar_Financeiro(fDMCob_Eletronica.mRetornoVlrJurosPagos.AsFloat,'J',fDmCob_Eletronica.tCReceberParcID_TIPOCOBRANCA.AsInteger);
    if StrToFloat(FormatFloat('0.00',fDmCob_Eletronica.tCReceberParcVLR_DESPESAS.AsFloat)) > 0 then
      fDm1.prc_Gravar_Financeiro(fDmCob_Eletronica.tCReceberParcVLR_DESPESAS.AsFloat,'D',fDmCob_Eletronica.tCReceberParcID_TIPOCOBRANCA.AsInteger);
    if StrToFloat(FormatFloat('0.00',fDmCob_Eletronica.tCReceberParcVLR_TAXA_BANCARIA.AsFloat)) > 0 then
      fDm1.prc_Gravar_Financeiro(fDmCob_Eletronica.tCReceberParcVLR_TAXA_BANCARIA.AsFloat,'T',fDmCob_Eletronica.tCReceberParcID_TIPOCOBRANCA.AsInteger);
}
    fDmCob_Eletronica.tCReceberParcRestParcela.AsFloat := StrToFloat(FormatFloat('0.00',0));

    //vHistorico := 'PAGAMENTO TOTAL' + ' - ' + fDmCob_Eletronica.mRetornoNomeOcorrenciaRet.AsString;

  if StrToFloat(FormatFloat('0.00',fDmCob_Eletronica.tCReceberParcRestParcela.AsFloat)) <= 0 then
    fDmCob_Eletronica.tCReceberParcRestParcela.AsFloat := 0;
  if StrToFloat(FormatFloat('0.00',fDmCob_Eletronica.tCReceberParcRestParcela.AsFloat)) = 0 then
    fDmCob_Eletronica.tCReceberParcQuitParcCReceber.AsBoolean := True;

  if DMCobEletronica.mRetornoCodOcorrenciaRet.AsString = '17' then
    fDmCob_Eletronica.tCReceberParcPgCartorio.AsBoolean := True;
  fDmCob_Eletronica.tCReceberParcQuitParcCReceber.AsBoolean := True;

  DM1.tMovimentos.MasterSource.Enabled := False;

  DM2.tMovimentos2.Refresh;
  DM2.tMovimentos2.Filtered               := False;
  DM2.tMovimentos2.Filter                 := 'CodConta = '''+IntToStr(fDmCob_Eletronica.tCReceberParcCodConta.AsInteger)+'''';
  DM2.tMovimentos2.Filtered               := True;
  DM2.tMovimentos2.Last;
  DM1.tMovimentos.Insert;
  DM1.tMovimentosCodConta.AsInteger       := fDmCob_Eletronica.tCReceberParcCodConta.AsInteger;
  DM1.tMovimentosNumMovimento.AsInteger   := DM2.tMovimentos2NumMovimento.AsInteger + 1;
  DM1.tMovimentosNumCReceber.AsInteger    := fDmCob_Eletronica.tCReceberParcNumCReceber.AsInteger;
  //DM1.tMovimentosDtMovimento.AsDateTime   := fDmCob_Eletronica.mRetornoDtCredito.AsDateTime;
  DM1.tMovimentosDtMovimento.AsDateTime   := fDmCob_Eletronica.tCReceberParcDtPagParcCReceber.AsDateTime;
  DM1.tMovimentosNumNota.AsInteger        := fDmCob_Eletronica.tCReceberParcNumNota.AsInteger;
  DM1.tMovimentosCodCli.AsInteger         := fDmCob_Eletronica.tCReceberParcCodCli.AsInteger;
  DM1.tMovimentosPlanoContas.AsInteger    := fDmCob_Eletronica.tCReceberParcPlanoContas.AsInteger;
  //DM1.tMovimentosVlrMovCredito.AsCurrency := fDmCob_Eletronica.mRetornoVlrPago.AsFloat;
  DM1.tMovimentosVlrMovCredito.AsCurrency := StrToFloat(FormatFloat('0.00',fDmCob_Eletronica.tCReceberParcPgtoParcial.AsFloat));
  DM1.tMovimentosHistorico.AsString       := 'Rec.Parc.nº '+ fDmCob_Eletronica.tCReceberParcPgtoParcial.AsString +
                                             ' nf.nº ' + fDmCob_Eletronica.tCReceberParcNumNota.AsString +
                                             ' de ' + fDmCob_Eletronica.mRetornoNomeCliente.AsString;
  DM1.tMovimentos.Post;

  vNumMov := DM1.tMovimentosNumMovimento.AsInteger;

  //Lança os Juros no movimento financeiro
  if fDmCob_Eletronica.mRetornoVlrJurosPagos.AsFloat > 0 then
    begin
      DM2.tMovimentos2.Refresh;
      DM2.tMovimentos2.Filtered             := False;
      DM2.tMovimentos2.Filter               := 'CodConta = '''+IntToStr(fDmCob_Eletronica.tCReceberParcCodConta.AsInteger)+'''';
      DM2.tMovimentos2.Filtered             := True;
      DM2.tMovimentos2.Last;
      DM1.tMovimentos.Insert;
      DM1.tMovimentosCodConta.AsInteger     := fDmCob_Eletronica.tCReceberParcCodConta.AsInteger;
      DM1.tMovimentosNumMovimento.AsInteger := DM2.tMovimentos2NumMovimento.AsInteger + 1;
      DM1.tMovimentosNumCReceber.AsInteger  := fDmCob_Eletronica.tCReceberParcNumCReceber.AsInteger;
      DM1.tMovimentosDtMovimento.AsDateTime := fDmCob_Eletronica.mRetornoDtOcorrencia.AsDateTime;
      DM1.tMovimentosVlrMovCredito.AsFloat  := fDmCob_Eletronica.mRetornoVlrJurosPagos.AsFloat;
      DM1.tMovimentosNumNota.AsInteger      := fDmCob_Eletronica.tCReceberParcNumNota.AsInteger;
      DM1.tMovimentosCodCli.AsInteger       := fDmCob_Eletronica.tCReceberParcCodCli.AsInteger;
      DM1.tMovimentosPlanoContas.AsInteger  := fDmCob_Eletronica.tCReceberParcPlanoContas.AsInteger;
      DM1.tMovimentosHistorico.AsString     := 'Rec.Juros s/Parc.nº '+ fDmCob_Eletronica.tCReceberParcParcCReceber.AsString +
                                               ' nf.nº ' + fDmCob_Eletronica.tCReceberParcNumNota.AsString +
                                               ' de ' + fDmCob_Eletronica.mRetornoNomeCliente.AsString;
      DM1.tMovimentos.Post;
      DM1.tContas.FindKey([fDmCob_Eletronica.tCReceberParcCodConta.AsInteger]);
      vNumMovJuros := DM1.tMovimentosNumMovimento.AsInteger;
    end;
  fDmCob_Eletronica.tCReceberParcCodConta.AsInteger := fDmCob_Eletronica.tCReceberParcCodConta.AsInteger;
  if fDmCob_Eletronica.tCReceberParcDtPagParcCReceber.AsDateTime > fDmCob_Eletronica.tCReceberParcDtVencCReceber.AsDateTime then
    fDmCob_Eletronica.tCReceberParcDiasAtraso.AsFloat := fDmCob_Eletronica.tCReceberParcDtPagParcCReceber.AsDateTime - fDmCob_Eletronica.tCReceberParcDtVencCReceber.AsDateTime
  else
    fDmCob_Eletronica.tCReceberParcDiasAtraso.AsFloat := 0;
  //if fDmCob_Eletronica.tCReceberParcRestParcela.AsFloat > 0 then

    Grava_Historico('L','PAGAMENTO TOTAL');

    if (fDmCob_Eletronica.tCReceberParclkTipoComissao.AsString = 'D') and (fDmCob_Eletronica.tCReceberParcCodVendedor.AsInteger > 0) and
       (fDmCob_Eletronica.tCReceberParcPercComissao.AsFloat > 0) then
      Grava_ExtComissao;

    fDmCob_Eletronica.tCReceberParcHist.Post;
    fDmCob_Eletronica.tCReceberParc.Post;

    if fDmCob_Eletronica.tCReceberParc.State in [dsEdit,dsInsert] then
      fDmCob_Eletronica.tCReceberParc.Post;

    prc_mRetorno_Atualizado;
  end;
end;

procedure TfCobRetorno.prc_mRetorno_Atualizado;
begin
  fDmCob_Eletronica.mRetorno.Edit;
  fDmCob_Eletronica.mRetornoAtualizado.AsString := 'S';
  fDmCob_Eletronica.mRetorno.Post;
end;

procedure TfCobRetorno.FilenameEdit1Change(Sender: TObject);
begin
  if trim(FilenameEdit1.Text) <> '' then
    btnLocalizarClick(Sender);
end;

procedure TfCobRetorno.RxDBLookupCombo3Change(Sender: TObject);
begin
  if not fDmCob_Eletronica.tFilial.Active then
    fDmCob_Eletronica.tFilial.Open;
  fDmCob_Eletronica.tFilial.IndexFieldNames := 'Codigo';
  fDmCob_Eletronica.tFilial.FindKey([fDmCob_Eletronica.tContasFilial.AsInteger]);
end;

procedure TfCobRetorno.Grava_ExtComissao;
var
  vAux, vPercentual, vPercentual2 : Real;
  vItemAux : Integer;
begin
  DM1.tExtComissao.IndexFieldNames := 'NroLancamento';
  DM1.tExtComissao.Last;
  vItemAux := DM1.tExtComissaoNroLancamento.AsInteger;

  DM1.tExtComissao.Insert;
  DM1.tExtComissaoNroLancamento.AsInteger := vItemAux + 1;
  DM1.tExtComissaoCodVendedor.AsInteger   := fDmCob_Eletronica.tCReceberParcCodVendedor.AsInteger;
  DM1.tExtComissaoDtReferencia.AsDateTime := fDmCob_Eletronica.mRetornoDtOcorrencia.AsDateTime;
  DM1.tExtComissaoParcDoc.AsInteger       := fDmCob_Eletronica.tCReceberParcParcCReceber.AsInteger;
  DM1.tExtComissaoCodCliente.AsInteger    := fDmCob_Eletronica.tCReceberParcCodCli.AsInteger;
  DM1.tExtComissaoFuncao.AsString         := 'E';
  DM1.tExtComissaoNroDoc.AsInteger        := fDmCob_Eletronica.tCReceberParcNumNota.AsInteger;
  if StrToFloat(FormatFloat('0.00',fDmCob_Eletronica.mRetornoVlrPago.AsFloat)) > 0 then
    DM1.tExtComissaoVlrBase.AsCurrency      := fDmCob_Eletronica.mRetornoVlrPago.AsFloat
  else
    DM1.tExtComissaoVlrBase.AsCurrency      := fDmCob_Eletronica.mRetornoVlrTitulo.AsFloat;
  DM1.tExtComissaoPercDescDupl.AsFloat    := fDmCob_Eletronica.tCReceberParcDesconto.AsFloat;
  DM1.tExtComissaoPercComissao.AsFloat    := fDmCob_Eletronica.tCReceberParcPercComissao.AsFloat;
  if fDmCob_Eletronica.tCReceberParcPercComissao.AsFloat > 0 then
  begin
    vAux := 0;
    DM1.tNotaFiscal.IndexFieldNames := 'Filial;NumNota';
    DM1.tNotaFiscal.SetKey;
    DM1.tNotaFiscalFilial.AsInteger  := fDmCob_Eletronica.tCReceberParcFilial.AsInteger;
    DM1.tNotaFiscalNumNota.AsInteger := fDmCob_Eletronica.tCReceberParcNumNota.AsInteger;
    if DM1.tNotaFiscal.GotoKey then
    begin
      if DM1.tNotaFiscalVlrIpi.AsFloat > 0 then
        begin
          if fDmCob_Eletronica.tCReceberParc.RecordCount = 1 then
          begin
            vPercentual  := StrToFloat(FormatFloat('0.0000',(DM1.tExtComissaoVlrBase.AsFloat / fDmCob_Eletronica.tCReceberParcVlrParcCReceber.AsFloat) * 100));
            vAux         := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrIpi.AsFloat * vPercentual) / 100));
            DM1.tExtComissaoVlrBase.AsCurrency := DM1.tExtComissaoVlrBase.AsCurrency - vAux;
          end
          else
          begin
            vPercentual  := StrToFloat(FormatFloat('0.0000',(DM1.tExtComissaoVlrBase.AsFloat / fDmCob_Eletronica.tCReceberParcVlrParcCReceber.AsFloat) * 100));
            vPercentual2 := StrToFloat(FormatFloat('0.0000',(fDmCob_Eletronica.tCReceberParcVlrParcCReceber.AsFloat / DM1.tNotaFiscalVlrTotalDupl.AsFloat) * 100));
            vAux         := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalVlrIpi.AsFloat * vPercentual2) / 100));
            vAux         := StrToFloat(FormatFloat('0.00',(vAux * vPercentual) / 100));
            DM1.tExtComissaoVlrBase.AsCurrency := DM1.tExtComissaoVlrBase.AsCurrency - vAux;
          end;
        end;
      end;
    DM1.tExtComissaoVlrComissao.AsFloat := StrToFloat(FormatFloat('0.00',(DM1.tExtComissaoVlrBase.AsFloat * DM1.tExtComissaoPercComissao.AsFloat) / 100));
  end
  else
  if fDmCob_Eletronica.tCReceberParcVlrComissao.AsFloat > 0 then
  begin
    if fDmCob_Eletronica.tCReceberParcQuitParcCReceber.AsBoolean then
    begin
      DM1.tExtComissaoVlrComissao.AsFloat          := fDmCob_Eletronica.tCReceberParcVlrComissaoRestante.AsFloat;
      fDmCob_Eletronica.tCReceberParcVlrComissaoRestante.AsFloat := 0;
    end
    else
    begin
      vPercentual := StrToFloat(FormatFloat('0.0000',(DM1.tExtComissaoVlrBase.AsFloat / fDmCob_Eletronica.tCReceberParcVlrParcCReceber.AsFloat) * 100));
      vAux        := StrToFloat(FormatFloat('0.00',fDmCob_Eletronica.tCReceberParcVlrComissao.AsFloat * vPercentual / 100));
      DM1.tExtComissaoVlrComissao.AsFloat          := StrToFloat(FormatFloat('0.00',vAux));
      fDmCob_Eletronica.tCReceberParcVlrComissaoRestante.AsFloat := fDmCob_Eletronica.tCReceberParcVlrComissaoRestante.AsFloat - DM1.tExtComissaoVlrComissao.AsFloat;
      if fDmCob_Eletronica.tCReceberParcVlrComissaoRestante.AsFloat < 0 then
        fDmCob_Eletronica.tCReceberParcVlrComissaoRestante.AsFloat := 0;
    end;
  end;
  DM1.tExtComissaoTipo.AsString           := 'D';
  DM1.tExtComissaoSuspensa.AsBoolean      := False;
  DM1.tExtComissao.Post;
  if not(fDmCob_Eletronica.tCReceberParcHist.State in [dsEdit,dsInsert]) then
    fDmCob_Eletronica.tCReceberParcHist.Edit;
  fDmCob_Eletronica.tCReceberParcHistNroLancExtComissao.AsInteger := DM1.tExtComissaoNroLancamento.AsInteger;
end;

procedure TfCobRetorno.Grava_Historico(Tipo, Historico: String);
begin
  DM2.tCReceberParcHist2.Refresh;
  DM2.tCReceberParcHist2.Last;
  fDmCob_Eletronica.tCReceberParcHist.Insert;
  fDmCob_Eletronica.tCReceberParcHistNumCReceber.AsInteger   := fDmCob_Eletronica.tCReceberParcNumCReceber.AsInteger;
  fDmCob_Eletronica.tCReceberParcHistParcCReceber.AsInteger  := fDmCob_Eletronica.tCReceberParcParcCReceber.AsInteger;
  fDmCob_Eletronica.tCReceberParcHistItem.AsInteger          := DM2.tCReceberParcHist2Item.AsInteger + 1;
  fDmCob_Eletronica.tCReceberParcHistDtHistorico.AsDateTime  := Date;
  fDmCob_Eletronica.tCReceberParcHistCodHistorico.AsCurrency := 0;
  fDmCob_Eletronica.tCReceberParcHistHistorico.AsString      := Historico;
  fDmCob_Eletronica.tCReceberParcHistCodConta.AsInteger      := DM1.tContasCodConta.AsInteger;
  if Tipo = 'L' then
  begin
    fDmCob_Eletronica.tCReceberParcHistDtUltPgto.AsDateTime      := fDmCob_Eletronica.mRetornoDtOcorrencia.AsDateTime;
    if StrToFloat(FormatFloat('0.00',fDmCob_Eletronica.mRetornoVlrPago.AsFloat)) > 0 then
      fDmCob_Eletronica.tCReceberParcHistVlrUltPgto.AsCurrency     := fDmCob_Eletronica.mRetornoVlrPago.AsFloat
    else
      fDmCob_Eletronica.tCReceberParcHistVlrUltPgto.AsCurrency     := fDmCob_Eletronica.mRetornoVlrTitulo.AsFloat;
    fDmCob_Eletronica.tCReceberParcHistVlrUltJuros.AsFloat       := fDmCob_Eletronica.mRetornoVlrJurosPagos.AsFloat;
    fDmCob_Eletronica.tCReceberParcHistVlrUltDescontos.AsFloat   := fDmCob_Eletronica.mRetornoVlrDesconto.AsFloat;
    fDmCob_Eletronica.tCReceberParcHistVlrUltDespesas.AsFloat    := 0;
    fDmCob_Eletronica.tCReceberParcHistVlrUltAbatimentos.AsFloat := fDmCob_Eletronica.mRetornoVlrAbatimento.AsFloat;
    fDmCob_Eletronica.tCReceberParcHistJurosPagos.AsFloat        := fDmCob_Eletronica.mRetornoVlrJurosPagos.AsFloat;
    fDmCob_Eletronica.tCReceberParcHistPgto.AsBoolean            := True;
    fDmCob_Eletronica.tCReceberParcHistNumMov.AsInteger          := vNumMov;
    fDmCob_Eletronica.tCReceberParcHistNumMovJuros.AsInteger     := vNumMovJuros;
    fDmCob_Eletronica.tCReceberParcHistJurosCalc.AsFloat         := fDmCob_Eletronica.mRetornoVlrJurosPagos.AsFloat;
    fDmCob_Eletronica.tCReceberParcHistTipo.AsString             := 'PAG';
  end
  else
  begin
    fDmCob_Eletronica.tCReceberParcHistPgto.AsBoolean := False;
    fDmCob_Eletronica.tCReceberParcHistTipo.AsString  := 'DIV';
  end;
end;

end.

