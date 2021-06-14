unit UDMCobEletronica;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, DBTables, ACBrBoleto, ACBrBoletoFCFortesFr, ACBrBase,
  ACBrUtil, strUtils, Dialogs, dateUtils, Variants;

type
  TDMCobEletronica = class(TDataModule)
    sdsCobEletronica: TSQLDataSet;
    dspCobEletronica: TDataSetProvider;
    cdsCobEletronica: TClientDataSet;
    dsCobEletronica: TDataSource;
    sdsCobEletronicaID: TIntegerField;
    sdsCobEletronicaDTGERACAO: TDateField;
    sdsCobEletronicaUSUARIO: TStringField;
    sdsCobEletronicaHORA: TTimeField;
    sdsCobEletronicaQTDTITULOS: TIntegerField;
    sdsCobEletronicaVLRTITULOS: TFloatField;
    sdsCobEletronicaCODBANCO: TIntegerField;
    sdsCobEletronicaCODTIPOCOBRANCA: TIntegerField;
    sdsCobEletronicaFILIAL: TIntegerField;
    sdsCobEletronicaNOMEARQUIVO: TStringField;
    cdsCobEletronicaID: TIntegerField;
    cdsCobEletronicaDTGERACAO: TDateField;
    cdsCobEletronicaUSUARIO: TStringField;
    cdsCobEletronicaHORA: TTimeField;
    cdsCobEletronicaQTDTITULOS: TIntegerField;
    cdsCobEletronicaVLRTITULOS: TFloatField;
    cdsCobEletronicaCODBANCO: TIntegerField;
    cdsCobEletronicaCODTIPOCOBRANCA: TIntegerField;
    cdsCobEletronicaFILIAL: TIntegerField;
    cdsCobEletronicaNOMEARQUIVO: TStringField;
    dsCobEletronicaMestre: TDataSource;
    sdsCobEletronicaDTINICIAL: TDateField;
    sdsCobEletronicaDTFINAL: TDateField;
    cdsCobEletronicaDTINICIAL: TDateField;
    cdsCobEletronicaDTFINAL: TDateField;
    sdsCobEletronica_Nota: TSQLDataSet;
    sdsCobEletronica_NotaID: TIntegerField;
    sdsCobEletronica_NotaITEM: TIntegerField;
    sdsCobEletronica_NotaNUMNOTA: TIntegerField;
    sdsCobEletronica_NotaCODCLIENTE: TIntegerField;
    sdsCobEletronica_NotaSERIE: TStringField;
    sdsCobEletronica_NotaNUMSEQNOTA: TIntegerField;
    sdsCobEletronica_NotaVLRTITULO: TFloatField;
    sdsCobEletronica_NotaDTVENCIMENTO: TDateField;
    sdsCobEletronica_NotaPROCESSO: TStringField;
    sdsCobEletronica_NotaPARCELA: TIntegerField;
    sdsCobEletronica_NotaNUMCRECEBER: TIntegerField;
    sdsCobEletronica_NotaNOMECLIENTE: TStringField;
    cdsCobEletronica_Nota: TClientDataSet;
    cdsCobEletronicasdsCobEletronica_Nota: TDataSetField;
    cdsCobEletronica_NotaID: TIntegerField;
    cdsCobEletronica_NotaITEM: TIntegerField;
    cdsCobEletronica_NotaNUMNOTA: TIntegerField;
    cdsCobEletronica_NotaCODCLIENTE: TIntegerField;
    cdsCobEletronica_NotaSERIE: TStringField;
    cdsCobEletronica_NotaNUMSEQNOTA: TIntegerField;
    cdsCobEletronica_NotaVLRTITULO: TFloatField;
    cdsCobEletronica_NotaDTVENCIMENTO: TDateField;
    cdsCobEletronica_NotaPROCESSO: TStringField;
    cdsCobEletronica_NotaPARCELA: TIntegerField;
    cdsCobEletronica_NotaNUMCRECEBER: TIntegerField;
    cdsCobEletronica_NotaNOMECLIENTE: TStringField;
    dsCobEletronica_Nota: TDataSource;
    sdsCobEletronica_NotaFILIAL: TIntegerField;
    cdsCobEletronica_NotaFILIAL: TIntegerField;
    sdsCobEletronica_NotaNOSSONUMERO: TStringField;
    cdsCobEletronica_NotaNOSSONUMERO: TStringField;
    sdsCobEletronica_NotaCGCCPF: TStringField;
    cdsCobEletronica_NotaCGCCPF: TStringField;
    sdsCobEletronica_NotaESPECIEDOC: TStringField;
    sdsCobEletronica_NotaACEITE: TStringField;
    sdsCobEletronica_NotaNUMCARTEIRA: TStringField;
    cdsCobEletronica_NotaESPECIEDOC: TStringField;
    cdsCobEletronica_NotaACEITE: TStringField;
    cdsCobEletronica_NotaNUMCARTEIRA: TStringField;
    sdsCobEletronica_NotaPESSOA: TStringField;
    cdsCobEletronica_NotaPESSOA: TStringField;
    tContas: TTable;
    dsContas: TDataSource;
    tContasAcbr_TipoCobranca: TStringField;
    tContasCodCedente: TStringField;
    tContasCodConta: TIntegerField;
    tContasNomeConta: TStringField;
    tContasSaldoConta: TFloatField;
    tContasTipoConta: TStringField;
    tContasCodBanco: TStringField;
    tContasInstrucao1: TStringField;
    tContasInstrucao2: TStringField;
    tContasInstrucao3: TStringField;
    tContasInstrucao4: TStringField;
    tContasEspecie: TStringField;
    tContasLocalPagamento: TStringField;
    tContasQtdLinhasInst: TIntegerField;
    tContasAgencia: TStringField;
    tContasDescNota: TStringField;
    tContasDigConta: TStringField;
    tContasFilial: TIntegerField;
    tContasNumConta: TStringField;
    tContasCNAB: TStringField;
    tContasConvenioLider: TStringField;
    tContasCodTipoCobranca: TIntegerField;
    tContasDtEncerramento: TDateField;
    tContasAge_PossuiDigVerificador: TBooleanField;
    tContasBanco_logo: TStringField;
    tFilial: TTable;
    dsFilial: TDataSource;
    tFilialCodigo: TIntegerField;
    tFilialEmpresa: TStringField;
    tFilialEndereco: TStringField;
    tContasAgencia_Dig: TStringField;
    tFilialEstado: TStringField;
    tContasAcbr_LayOutRemessa: TStringField;
    tContasInicial_Nome_Arq_Rem: TStringField;
    tContasEnd_Arq_Rem: TStringField;
    tContasExtensao_Arq_Rem: TStringField;
    ACBrBoleto1: TACBrBoleto;
    ACBrBoletoFCFortes1: TACBrBoletoFCFortes;
    sdsContas_Calculo: TSQLDataSet;
    dspContas_Calculo: TDataSetProvider;
    cdsContas_Calculo: TClientDataSet;
    dsContas_Calculo: TDataSource;
    cdsContas_CalculoID: TIntegerField;
    cdsContas_CalculoANO: TIntegerField;
    cdsContas_CalculoITEM: TIntegerField;
    cdsContas_CalculoSEQ_NOSSONUMERO: TFMTBCDField;
    tContasNossoNumero_Por_Ano: TStringField;
    sdsCob_Tipo_Cadastro: TSQLDataSet;
    dspCob_Tipo_Cadastro: TDataSetProvider;
    cdsCob_Tipo_Cadastro: TClientDataSet;
    dsCob_Tipo_Cadastro: TDataSource;
    cdsCob_Tipo_CadastroID: TIntegerField;
    cdsCob_Tipo_CadastroCODIGO: TStringField;
    cdsCob_Tipo_CadastroNOME: TStringField;
    cdsCob_Tipo_CadastroTIPO_REG: TStringField;
    cdsCob_Tipo_CadastroID_BANCO: TIntegerField;
    cdsCob_Tipo_CadastroCOD_REDUZIDO: TStringField;
    cdsCob_Tipo_CadastroTIPO_INST: TStringField;
    cdsCob_Tipo_CadastroTIPO_PROTESTO: TStringField;
    cdsCob_Tipo_CadastroENVIAR_DIAS_PROTESTO: TStringField;
    cdsCob_Tipo_CadastroGERAR_NOSSONUMERO: TStringField;
    cdsCob_Tipo_CadastroGERAR_REMESSA: TStringField;
    sdsEspecie: TSQLDataSet;
    sdsEspecieID: TIntegerField;
    sdsEspecieCODIGO: TStringField;
    sdsEspecieNOME: TStringField;
    sdsEspecieTIPO_REG: TStringField;
    sdsEspecieID_BANCO: TIntegerField;
    dspEspecie: TDataSetProvider;
    cdsEspecie: TClientDataSet;
    cdsEspecieID: TIntegerField;
    cdsEspecieCODIGO: TStringField;
    cdsEspecieNOME: TStringField;
    cdsEspecieTIPO_REG: TStringField;
    cdsEspecieID_BANCO: TIntegerField;
    dsEspecie: TDataSource;
    tBcoSantander: TTable;
    dsBcoSantander: TDataSource;
    tBcoSantanderCodConta: TIntegerField;
    tBcoSantanderCodCedente: TStringField;
    tBcoSantanderCarteira: TStringField;
    tBcoSantanderAceite: TStringField;
    tBcoSantanderInstrucao: TStringField;
    tBcoSantanderDiasProtesto: TIntegerField;
    tBcoSantanderCaminho: TStringField;
    tBcoSantanderNome: TStringField;
    tBcoSantanderExtensao: TStringField;
    tBcoSantanderVlrDesconto: TFloatField;
    tBcoSantanderVlrJurosPorDia: TFloatField;
    tBcoSantanderEspecieDoc: TStringField;
    tBcoSantanderNumCarteira: TStringField;
    tBcoSantanderDtLimiteDesconto: TDateField;
    tBcoSantanderTipoJuro: TStringField;
    tBcoSantanderTipoDesconto: TStringField;
    tBcoSantanderTaxaMulta: TFloatField;
    tBcoSantanderCodTransmissao: TStringField;
    tBcoSantanderNumRemessa: TIntegerField;
    tBcoSantanderFormaCadastramento: TIntegerField;
    tBcoSantanderCodProtesto: TStringField;
    tBcoSantanderCodBaixa: TStringField;
    tBcoSantanderCodCompensacao: TStringField;
    tBcoSantanderTipoDocumento: TStringField;
    tBcoSantanderDiasBaixa: TIntegerField;
    tBcoSantanderVlrIOF: TFloatField;
    tBcoSantanderCodMulta: TStringField;
    tBcoSantanderDtMulta: TDateField;
    tBcoSantanderVlrMulta: TFloatField;
    tBcoSantanderTipoDesconto2: TStringField;
    tBcoSantanderDtLimiteDesconto2: TDateField;
    tBcoSantanderVlrDesconto2: TFloatField;
    tBcoSantanderMensagem1: TStringField;
    tBcoSantanderMensagem2: TStringField;
    tFilialBairro: TStringField;
    tFilialCep: TStringField;
    tFilialCidade: TStringField;
    tFilialCNPJ: TStringField;
    tFilialTel: TStringField;
    tFilialTel2: TStringField;
    tFilialFax: TStringField;
    tFilialInscr: TStringField;
    tFilialSimples: TBooleanField;
    tFilialEmail: TStringField;
    tFilialSimplesGaucho: TBooleanField;
    tFilialImpSimplesGaucho: TBooleanField;
    tFilialEndLogo: TStringField;
    tFilialNomeInterno: TStringField;
    tFilialCalculaIpi: TBooleanField;
    tFilialInativo: TBooleanField;
    tFilialCodCidade: TIntegerField;
    tFilialInscMunicipal: TStringField;
    tFilialCNAE: TStringField;
    tFilialNumEnd: TStringField;
    tFilialHomePage: TStringField;
    tFilialUsarICMSimples: TBooleanField;
    tFilialCodRegimeTrib: TIntegerField;
    tFilialCodPis: TStringField;
    tFilialCodCofins: TStringField;
    tFilialTipoPis: TStringField;
    tFilialTipoCofins: TStringField;
    tFilialPercCofins: TFloatField;
    tFilialPercPis: TFloatField;
    tFilialCodSitTrib: TIntegerField;
    tFilialCodCSTIPI: TStringField;
    tFilialDtEstoque: TDateField;
    tFilialEMailNFe: TStringField;
    tFilialPerc_Trib_NTS_Ind: TFloatField;
    tFilialPerc_Trib_NTS_Ven: TFloatField;
    tFilialPerc_Trib_NTS_Ind_Exp: TFloatField;
    tFilialPerc_Trib_NTS_Ven_Exp: TFloatField;
    tCReceberParc: TTable;
    tCReceberParcFilial: TIntegerField;
    tCReceberParcNumCReceber: TIntegerField;
    tCReceberParcParcCReceber: TIntegerField;
    tCReceberParcVlrParcCReceber: TFloatField;
    tCReceberParcDtVencCReceber: TDateField;
    tCReceberParcQuitParcCReceber: TBooleanField;
    tCReceberParcJurosParcCReceber: TFloatField;
    tCReceberParcDtPagParcCReceber: TDateField;
    tCReceberParcCodCli: TIntegerField;
    tCReceberParcNumNota: TIntegerField;
    tCReceberParcDesconto: TFloatField;
    tCReceberParcPgtoParcial: TFloatField;
    tCReceberParcRestParcela: TFloatField;
    tCReceberParcContaDupl: TSmallintField;
    tCReceberParcSelecionado: TBooleanField;
    tCReceberParcCodVendedor: TIntegerField;
    tCReceberParcBaixada: TBooleanField;
    tCReceberParcPercComissao: TFloatField;
    tCReceberParcVlrComissao: TFloatField;
    tCReceberParcPlanoContas: TIntegerField;
    tCReceberParcAgencia: TStringField;
    tCReceberParcTitPortador: TStringField;
    tCReceberParcCodTipoCobranca: TIntegerField;
    tCReceberParcDespesas: TFloatField;
    tCReceberParcAbatimentos: TFloatField;
    tCReceberParcCodConta: TIntegerField;
    tCReceberParcPgCartorio: TBooleanField;
    tCReceberParcDiasAtraso: TFloatField;
    tCReceberParcLetraCambio: TBooleanField;
    tCReceberParcJurosPagos: TFloatField;
    tCReceberParcCancelado: TBooleanField;
    tCReceberParcTitProtestado: TBooleanField;
    tCReceberParcDtGerado: TDateField;
    tCReceberParcTipoDoc: TStringField;
    tCReceberParcVlrDevolucao: TFloatField;
    tCReceberParcArqGerado: TBooleanField;
    tCReceberParcTransferencia: TBooleanField;
    tCReceberParcNumTitBanco: TStringField;
    tCReceberParcNroLancExtComissao: TIntegerField;
    tCReceberParcComissaoItem: TBooleanField;
    tCReceberParcVlrComissaoRestante: TFloatField;
    tCReceberParcCodPlanoContasItens: TIntegerField;
    tCReceberParcCodVendedor2: TIntegerField;
    tCReceberParcPercComissao2: TFloatField;
    tCReceberParcCodBancoBoleto: TIntegerField;
    tCReceberParcNumCarteira: TStringField;
    tCReceberParcNumSeqNossoNum: TIntegerField;
    tCReceberParcItemSeqNossoNum: TIntegerField;
    tCReceberParcDtVencimento2: TDateField;
    tCReceberParcSerie: TStringField;
    tCReceberParcNumSeqNota: TIntegerField;
    tCReceberParcCodBancoCheque: TIntegerField;
    tCReceberParcNumCheque: TIntegerField;
    tCReceberParcCodCartaoCredito: TIntegerField;
    tCReceberParcNumCartaoCredito: TStringField;
    tCReceberParcValidadeCartao: TStringField;
    tCReceberParcTipoCondicao: TStringField;
    tCReceberParcNumAutorizacaoCartao: TStringField;
    tCReceberParcIDCobEletronica: TIntegerField;
    tCReceberParcAceite: TStringField;
    tCReceberParcEspecieDoc: TStringField;
    tCReceberParcDescontoDe: TStringField;
    tCReceberParcDescontoAte: TStringField;
    dsCReceberParc: TDataSource;
    sdsCobEletronica_NotaDTEMISSAO: TDateField;
    cdsCobEletronica_NotaDTEMISSAO: TDateField;
    sdsEspecieCOD_REDUZIDO: TStringField;
    cdsEspecieCOD_REDUZIDO: TStringField;
    tContasACBR_Montar_NossoNumero: TStringField;
    tContasNum_Arq_Rem: TIntegerField;
    tContasDt_Remessa: TDateField;
    tContasSeq_Remessa_Dia: TSmallintField;
    tContasPercJuros: TFloatField;
    tContasPercMulta: TFloatField;
    tContasDiasProtesto: TSmallintField;
    tContasIdBanco: TIntegerField;
    tBcoSantanderComplemento: TStringField;
    tBcoSantanderGerarNossoNumero: TStringField;
    mRetorno: TClientDataSet;
    mRetornoCodCarteira: TStringField;
    mRetornoCodOcorrenciaRet: TStringField;
    mRetornoNomeOcorrenciaRet: TStringField;
    mRetornoDtOcorrencia: TStringField;
    mRetornoNumNota: TStringField;
    mRetornoDtVenc: TStringField;
    mRetornoVlrTitulo: TFloatField;
    mRetornoEspecieDoc: TStringField;
    mRetornoVlrDespesaCobranca: TFloatField;
    mRetornoVlrIOF: TFloatField;
    mRetornoVlrAbatimento: TFloatField;
    mRetornoVlrDesconto: TFloatField;
    mRetornoVlrPago: TFloatField;
    mRetornoVlrJurosPagos: TFloatField;
    mRetornoDtLiquidacao: TStringField;
    mRetornoInstrCancelada: TStringField;
    mRetornoNomeCliente: TStringField;
    mRetornoErros: TStringField;
    mRetornoCodLiquidacao: TStringField;
    mRetornoDescLiquidacao: TStringField;
    mRetornoAtualizado: TStringField;
    mRetornoCodCliente: TIntegerField;
    mRetornoParcela: TStringField;
    mRetornoDescErro1: TStringField;
    mRetornoDescErro2: TStringField;
    mRetornoDescErro3: TStringField;
    mRetornoDescErro4: TStringField;
    mRetornoDescErro5: TStringField;
    mRetornoDescErro6: TStringField;
    mRetornoCodInstrCancelada: TStringField;
    mRetornoConfNossoNumero: TStringField;
    mRetornoNossoNumero: TStringField;
    mRetornoSeuNumero: TStringField;
    mRetornoID_Duplicata: TStringField;
    mRetornoTitulo_OK: TBooleanField;
    mRetornoUsa_NumConta_Cedente: TStringField;
    mRetornoTipo_Ret: TStringField;
    mRetornoFilial: TIntegerField;
    mRetornoAtualizar: TStringField;
    dsmRetorno: TDataSource;
    dsCReceberParcHist: TDataSource;
    tCReceberParcHist: TTable;
    tCReceberParcHistFilial: TIntegerField;
    tCReceberParcHistNumCReceber: TIntegerField;
    tCReceberParcHistParcCReceber: TIntegerField;
    tCReceberParcHistItem: TIntegerField;
    tCReceberParcHistCodHistorico: TIntegerField;
    tCReceberParcHistDtHistorico: TDateField;
    tCReceberParcHistHistorico: TStringField;
    tCReceberParcHistDtUltPgto: TDateField;
    tCReceberParcHistVlrUltPgto: TFloatField;
    tCReceberParcHistVlrUltJuros: TFloatField;
    tCReceberParcHistVlrUltDescontos: TFloatField;
    tCReceberParcHistVlrUltDespesas: TFloatField;
    tCReceberParcHistVlrUltAbatimentos: TFloatField;
    tCReceberParcHistPgto: TBooleanField;
    tCReceberParcHistJurosPagos: TFloatField;
    tCReceberParcHistNumMov: TIntegerField;
    tCReceberParcHistNumMovJuros: TIntegerField;
    tCReceberParcHistJurosCalc: TFloatField;
    tCReceberParcHistVlrDevolucao: TFloatField;
    tCReceberParcHistDevolucao: TBooleanField;
    tCReceberParcHistNroLancExtComissao: TIntegerField;
    tCReceberParcHistTipo: TStringField;
    tCReceberParcHistCodConta: TIntegerField;
    tCReceberParcHistCodBancoCheque: TIntegerField;
    tCReceberParcHistNumCheque: TIntegerField;
    tCReceberParcHistCodCartaoCredito: TIntegerField;
    tCReceberParcHistNumCartaCredito: TStringField;
    tCReceberParcHistValidadeCartao: TStringField;
    tCReceberParcHistTipoCondicao: TStringField;
    sdsRet_Cadastro: TSQLDataSet;
    sdsRet_CadastroID: TIntegerField;
    sdsRet_CadastroCODIGO: TStringField;
    sdsRet_CadastroNOME: TStringField;
    sdsRet_CadastroTIPO_REG: TStringField;
    sdsRet_CadastroID_BANCO: TIntegerField;
    sdsRet_CadastroTIPO_RET: TStringField;
    sdsRet_CadastroTIPO_LIQ: TStringField;
    dspRet_Cadastro: TDataSetProvider;
    cdsRet_Cadastro: TClientDataSet;
    cdsRet_CadastroID: TIntegerField;
    cdsRet_CadastroCODIGO: TStringField;
    cdsRet_CadastroNOME: TStringField;
    cdsRet_CadastroTIPO_REG: TStringField;
    cdsRet_CadastroID_BANCO: TIntegerField;
    cdsRet_CadastroTIPO_RET: TStringField;
    cdsRet_CadastroTIPO_LIQ: TStringField;
    dsRet_Cadastro: TDataSource;
    qContas_Retorno: TSQLQuery;
    qContas_RetornoID: TIntegerField;
    qContas_RetornoPOS_NUM_NOTA: TIntegerField;
    qContas_RetornoQTD_NUM_NOTA: TIntegerField;
    qContas_RetornoPOS_NOSSO_NUMERO: TIntegerField;
    qContas_RetornoQTD_NOSSO_NUMERO: TIntegerField;
    qContas_RetornoPOS_ID_DUPLICATA: TIntegerField;
    qContas_RetornoQTD_ID_DUPLICATA: TIntegerField;
    qContas_RetornoPOS_OCORRENCIA: TIntegerField;
    qContas_RetornoPOS_DT_OCORRENCIA: TIntegerField;
    qContas_RetornoPOS_CONF_NOSSO_NUMERO: TIntegerField;
    qContas_RetornoQTD_CONF_NOSSO_NUMERO: TIntegerField;
    qContas_RetornoPOS_DT_VENCIMENTO: TIntegerField;
    qContas_RetornoPOS_VLR_TITULO: TIntegerField;
    qContas_RetornoQTD_VLR_TITULO: TIntegerField;
    qContas_RetornoPOS_ESPECIE: TIntegerField;
    qContas_RetornoPOS_VLR_DESPESA_COB: TIntegerField;
    qContas_RetornoQTD_VLR_DESPESA_COB: TIntegerField;
    qContas_RetornoPOS_VLR_IOF: TIntegerField;
    qContas_RetornoQTD_VLR_IOF: TIntegerField;
    qContas_RetornoPOS_VLR_ABATIMENTO: TIntegerField;
    qContas_RetornoQTD_VLR_ABATIMENTO: TIntegerField;
    qContas_RetornoPOS_VLR_DESCONTO: TIntegerField;
    qContas_RetornoQTD_VLR_DESCONTO: TIntegerField;
    qContas_RetornoPOS_VLR_PAGO: TIntegerField;
    qContas_RetornoQTD_VLR_PAGO: TIntegerField;
    qContas_RetornoPOS_VLR_JUROS_PAGO: TIntegerField;
    qContas_RetornoQTD_VLR_JUROS_PAGO: TIntegerField;
    qContas_RetornoPOS_DT_LIQUIDACAO: TIntegerField;
    qContas_RetornoPOS_INST_CANCELADA: TIntegerField;
    qContas_RetornoPOS_ERRO: TIntegerField;
    qContas_RetornoQTD_ERRO: TIntegerField;
    qContas_RetornoPOS_COD_LIQUIDACAO: TIntegerField;
    qContas_RetornoQTD_COD_LIQUIDACAO: TIntegerField;
    qContas_RetornoPOS_CARTEIRA: TIntegerField;
    qContas_RetornoPOS_NOME_CLIENTE: TIntegerField;
    qContas_RetornoQTD_NOME_CLIENTE: TIntegerField;
    qContas_RetornoPOS_NUMCONTA_RETORNO: TIntegerField;
    qContas_RetornoPOS_CODBANCO_RETORNO: TIntegerField;
    qContas_RetornoNUMCONTA_CEDENTE: TStringField;
    qContas_RetornoQTD_ERRO_CADASTRO: TIntegerField;
    qContas_RetornoQTD_CARTEIRA: TIntegerField;
    qRet_Erro: TSQLQuery;
    qRet_ErroID: TIntegerField;
    qRet_ErroCODIGO: TStringField;
    qRet_ErroNOME: TStringField;
    qRet_ErroTIPO_REG: TStringField;
    qRet_ErroID_BANCO: TIntegerField;
    qRet_ErroTABELA_REJ: TStringField;
    qRet_ErroTIPO_RET: TStringField;
    tVendedor: TTable;
    tVendedorCodigo: TIntegerField;
    tVendedorNome: TStringField;
    tVendedorPercComissao: TFloatField;
    tVendedorTipoComissao: TStringField;
    tCReceberParclkTipoComissao: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspCobEletronicaUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }
    ctCobTpCadastro: String;
  public
    { Public declarations }
    xNossoNum: Int64;
    vSeq_Remessa_Dia: Word;
    vCodCarteira: String;
    vGera_NossoNumero: String; //S= Sim   N= Não
    vNossoNumero: String;
    vNossoNumero_Montado: String;
    vNum_Remessa: Integer;
    vAceite: String;
    vExiste_Rec : Boolean;

    vGravou_Hist: Boolean;
    vID_Carteira: Integer;
    vCod_Carteira: String;

    procedure buscaNossoNumero;
    procedure prc_Verificar_Carteira;
    procedure prc_Gravar_Duplicata(Tipo: String);
    procedure prc_Localizar(vFilial, vCod, vParc: Integer);
    procedure geraCabecalhoAcbr;
    function geraRegistroAcbr(vDtVcto, vDtEmissao: TDateTime; vNN, vNumDupl, vCarteira,
          vNomeCli, vCnpjCli, vEndCli, vNumEndCli, vBairroCli, vCidadeCli, vUfCli, vCepCli, vPessoa, vAceite: String;
          vVlrParc: Real; vNumParc, vIdBanco, NumCReceber: Integer): String;
    procedure prc_Enviar_ACBR;
    procedure prc_ConfiguraACBR;
    function fnc_Busca_Num_Arquivo_Rem: Integer;
  end;

var
  DMCobEletronica: TDMCobEletronica;
  ctCobEletronica: String;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMCobEletronica.buscaNossoNumero;
begin
  cdsContas_calculo.Close;
  sdsContas_Calculo.ParamByName('ID').AsInteger := tContasCodConta.AsInteger;
  if tContasNOSSONUMERO_POR_ANO.AsString = 'S' then
    sdsContas_Calculo.ParamByName('ANO').AsInteger := StrToInt(FormatDateTime('YYYY',Date))
  else
    sdsContas_Calculo.ParamByName('ANO').AsInteger := 9999;
  sdsContas_Calculo.ParamByName('ITEM').AsInteger := 99;
  cdsContas_calculo.Open;

  if cdsContas_calculo.IsEmpty then
  begin
    cdsContas_calculo.Insert;
    cdsContas_calculoID.AsInteger   := tContasCodConta.AsInteger;
    if tContasNossoNumero_Por_Ano.AsString = 'S' then
      cdsContas_CalculoANO.AsInteger := StrToInt(FormatDateTime('YYYY',Date))
    else
      cdsContas_calculoANO.AsInteger := 9999;
    cdsContas_calculoITEM.AsInteger  := 99;
    cdsContas_calculoSEQ_NOSSONUMERO.AsInteger := 0;
    cdsContas_calculo.Post;
    cdsContas_calculo.ApplyUpdates(0);
  end;
  //xNossoNum := StrToInt(cdsContas_calculoSEQ_NOSSONUMERO.AsString);
  xNossoNum := StrToInt64(FormatFloat('0',cdsContas_calculoSEQ_NOSSONUMERO.AsFloat));
end;

procedure TDMCobEletronica.DataModuleCreate(Sender: TObject);
begin
  ctCobEletronica := sdsCobEletronica.CommandText;
  ctCobTpCadastro := sdsCob_Tipo_Cadastro.CommandText;
end;

procedure TDMCobEletronica.dspCobEletronicaUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  Response := rrAbort;
  raise exception.Create(E.Message);
end;

procedure TDMCobEletronica.geraCabecalhoAcbr;
begin
  ACBrBoleto1.Banco.Numero := tContasCodBanco.AsInteger;
  ACBrBoleto1.Banco.Nome   := tContasNomeConta.AsString;// 'Banco do Estado do Rio Grande do Sul S.A.';

  ACBrBoleto1.Cedente.Agencia           := tContasAGENCIA.AsString; // '0785';
  ACBrBoleto1.Cedente.AgenciaDigito     := tContasAgencia_Dig.AsString;
  ACBrBoleto1.Cedente.Conta             := tContasNumConta.AsString;// '06.022038.0';
  ACBrBoleto1.Cedente.ContaDigito       := tContasDigConta.AsString;// '3';
  ACBrBoleto1.Cedente.CNPJCPF           := tFilialCNPJ.AsString;// '09.348.462/0001-79';
  ACBrBoleto1.Cedente.CodigoCedente     := tContasCodCedente.AsString;// '0785022038017';
  ACBrBoleto1.Cedente.Logradouro        := tFilialEndereco.AsString;
  ACBrBoleto1.Cedente.Nome              := tFilialEmpresa.AsString;
  ACBrBoleto1.Cedente.NumeroRes         := tFilialNumEnd.AsString;
  ACBrBoleto1.Cedente.Telefone          := tFilialTel.AsString;
  ACBrBoleto1.Cedente.TipoInscricao     := pJuridica;
  ACBrBoleto1.Cedente.UF                := tFilialEstado.AsString;
  ACBrBoleto1.Cedente.Bairro            := tFilialBairro.AsString;
  ACBrBoleto1.Cedente.CEP               := tFilialCep.AsString;;
  ACBrBoleto1.Cedente.Cidade            := 'NOVO HAMBURGO';//tFilialCIDADE.AsString;;
  //ACBrBoleto1.Cedente.CodigoTransmissao := '157800007072171';
  ACBrBoleto1.Cedente.CodigoTransmissao := tBcoSantanderCodTransmissao.AsString;
  //ACBrBoleto1.Cedente.Complemento       := 'I82';//tFilialCOMPLEMENTO_END.AsString;
  ACBrBoleto1.Cedente.Complemento       := tBcoSantanderComplemento.AsString;
  ACBrBoleto1.Cedente.Modalidade        := '101';//101 = Cobrança Simples Rápida Com Registro
  //29/04/2015
  if tBcoSantanderNumCarteira.AsString = '1' then
    ACBrBoleto1.Cedente.CaracTitulo   := tcSimples //simples com registro
  else
  if tBcoSantanderNumCarteira.AsString = '3' then
    ACBrBoleto1.Cedente.CaracTitulo   := tcCaucionada
  else
  if tBcoSantanderNumCarteira.AsString = '5' then
    ACBrBoleto1.Cedente.CaracTitulo   := tcVinculada; //simples com registro
  if tBcoSantanderTipoDocumento.AsString = '1' then
    ACBrBoleto1.Cedente.TipoDocumento := Tradicional
  else
  if tBcoSantanderTipoDocumento.AsString = '2' then
    ACBrBoleto1.Cedente.TipoDocumento := Escritural;
end;

function TDMCobEletronica.geraRegistroAcbr(vDtVcto, vDtEmissao: TDateTime; vNN, vNumDupl, vCarteira,
          vNomeCli, vCnpjCli, vEndCli, vNumEndCli, vBairroCli, vCidadeCli, vUfCli, vCepCli, vPessoa, vAceite: String;
          vVlrParc: Real; vNumParc, vIdBanco, NumCReceber: Integer): String;
var
  Titulo: TACBrTitulo;
  vTamAux: Integer;
  vNossoNumAux: String;
begin
  vAceite := vAceite;
  if Assigned(Titulo) then
    FreeAndNil(Titulo);
  Titulo := ACBrBoleto1.CriarTituloNaLista;
  with Titulo do
  begin
    //05/12/2014
    TipoImpressao   := tipNormal;//se for carnê, tipCarne
    Vencimento      := vDtVcto;
    DataDocumento   := vDtEmissao;
    NumeroDocumento := vNumDupl + '/' + IntToStr(vNumParc);
//-------------------------
    if not cdsEspecie.Active then
    begin
      //sdsEspecie.ParamByName('ID_BANCO').AsInteger := 4; //Santander
      sdsEspecie.ParamByName('ID_BANCO').AsInteger := tContasIDBanco.AsInteger;
      cdsEspecie.Open;
    end;
    cdsEspecie.IndexFieldNames := 'ID;ID_BANCO';
    cdsEspecie.FindKey([tContasEspecie.AsInteger,tContasIDBanco.AsInteger]);
    if trim(cdsEspecieCOD_REDUZIDO.AsString) = '' then
      EspecieDoc := cdsEspecieCODIGO.AsString
    else
      EspecieDoc := cdsEspecieCOD_REDUZIDO.AsString;
//-------------------------

    if vAceite = 'A' then
      Aceite := atSim
    else
      Aceite := atNao;
    DataProcessamento := Now;
    //Carteira :=   vCarteira;
    Carteira := tBcoSantanderNumCarteira.AsString;
    prc_Verificar_Carteira;

    NossoNumero := vNN;
    if tBcoSantanderGerarNossoNumero.AsString <> 'B' then
    begin
      if (vNN = '') or (StrToInt(vNN) = 0) then
      begin
        if (vGera_NossoNumero = 'S')  then
        begin
          xNossoNum := xNossoNum + 1;
          vNossoNumAux := IntToStr(xNossoNum);
          vTamAux := ACBrBoleto.Banco.CalcularTamMaximoNossoNumero(Carteira,vNossoNumAux);
          NossoNumero := IntToStrZero(xNossoNum,vTamAux);
          if tContasACBR_Montar_NossoNumero.AsString = 'S' then
            vNossoNumero_Montado := ACBrBoleto.Banco.MontarCampoNossoNumero(Titulo)
          else
            vNossoNumero_Montado := NossoNumero;
        end;
      end;
    end;

    SeuNumero         := tContasFILIAL.AsString + '.' + vNumDupl + '/' + IntToStr(vNumParc);
    IdentTituloEmpresa := tContasFILIAL.AsString + '.' + IntToStr(NumCReceber) + '/' + IntToStr(vNumParc);
    ValorDocumento    := vVlrParc;
    Sacado.NomeSacado := vNomeCli;
    Sacado.CNPJCPF    := vCnpjCli;
    Sacado.Logradouro := Trim(vEndCli);
    Sacado.Numero     := Trim(vNumEndCli);
    Sacado.Bairro     := Trim(vBairroCli);
    Sacado.Cidade     := Trim(vCidadeCli);
    Sacado.UF         := Trim(vUfCli);
    Sacado.CEP        := Trim(vCepCli);
    if vPessoa = 'J' then
      Sacado.Pessoa := pJuridica
    else
    if vPessoa = 'F' then
      Sacado.Pessoa := pFisica
    else
    case StrToInt(vPessoa) of
      1: Sacado.Pessoa := pFisica;
      2: Sacado.Pessoa := pJuridica;
    end;
    ValorAbatimento   := 0;
    LocalPagamento    := tContasLocalPagamento.AsString;
    ValorMoraJuros    := tContasPercJuros.AsCurrency / 100 * vVlrParc;
    ValorDesconto     := 0;
    ValorAbatimento   := 0;
    DataMoraJuros     := vDtVcto + 0;
    DataDesconto      := 0;
    DataAbatimento    := 0;
    //DataProtesto      := vDtVcto + tContasDiasProtesto.AsInteger;
    DataProtesto      := 0;
    PercentualMulta   := tContasPercMulta.AsCurrency;
    Mensagem.Text     := tBcoSantanderMensagem1.AsString;

    cdsCob_Tipo_Cadastro.Close;
    sdsCob_Tipo_Cadastro.CommandText := ctCobTpCadastro + ' WHERE ID_BANCO = ' + IntToStr(vIdBanco);
    cdsCob_Tipo_Cadastro.Open;

    if trim(tBcoSantanderCodProtesto.AsString) = '' then
      Instrucao1 := '2'
    else
      Instrucao1 := tBcoSantanderCodProtesto.AsString;
    QtdDiaProtesto := tBcoSantanderDiasProtesto.AsInteger;

    Instrucao2 := '2'; //não baixar / não devolver
    Parcela    := 0;

    OcorrenciaOriginal.Tipo := toRemessaRegistrar;
  end;
  result := Titulo.NossoNumero;
end;

procedure TDMCobEletronica.prc_Gravar_Duplicata(Tipo: String);
var
  vItemAux: Integer;
begin
  vGravou_Hist := False;
  if (Tipo <> 'R') and (Tipo <> 'LIQ')  and (Tipo <> 'LCA') and (Tipo <> 'PRO') then
  begin
    if (trim(tCReceberParcNumTitBanco.AsString) <> '') and (tCReceberParcCodConta.AsInteger = tContasCodConta.AsInteger) and
       (tCReceberParcNumCarteira.AsInteger = vID_Carteira) then
    begin
      exit;
    end;
  end;

  try
    tCReceberParc.Edit;
    if (trim(tCReceberParcNumTitBanco.AsString) = '') and (trim(vNossoNumero) <> '') then
    begin
      //tCReceberParcNumTitBanco.AsString := vNossoNumero_Montado;
      tCReceberParcNumTitBanco.AsString := vNossoNumero;
//      if (Tipo = 'R') or (Tipo = 'I') or (Tipo = 'E') then
//        tCReceberParcNOSSONUMERO_GERADO.AsString := 'S'
//      else
//        cdsDuplicataNOSSONUMERO_GERADO.AsString := 'B';
    end;
    if (Tipo <> 'LIQ') AND (Tipo <> 'LCA') and (Tipo <> 'PRO') and (Tipo <> 'NNU') then
    begin
      tCReceberParcNumCarteira.AsString     := vCod_Carteira;
      tCReceberParcCodConta.AsInteger       := tContasCodConta.AsInteger;
      tCReceberParcCodBancoBoleto.AsInteger := tContasIdBanco.AsInteger;
    end;

    if Tipo = 'PRO' then
      tCReceberParcTitProtestado.AsBoolean := True;

    tCReceberParc.Post;

//    prc_Gravar_Historico(Tipo);

    vGravou_Hist := True;
  except
    raise;
  end;
end;

procedure TDMCobEletronica.prc_Verificar_Carteira;
begin
  vGera_NossoNumero := 'S';
{  if cdsDuplicataID_CARTEIRA.AsInteger > 0 then
  begin
    vGera_NossoNumero := cdsDuplicataGERAR_NOSSONUMERO.AsString;
    vID_Carteira      := cdsDuplicataID_CARTEIRA.AsInteger;
    vCod_Carteira     := cdsDuplicataCOD_CARTEIRA.AsString;
    vGeraRemessa      := cdsDuplicataGERAR_REMESSA.AsString;
  end
  else
  if cdsContasID_CARTEIRA.AsInteger > 0 then
  begin
    vGera_NossoNumero := cdsContasGERAR_NOSSONUMERO.AsString;
    vID_Carteira      := cdsContasID_CARTEIRA.AsInteger;
    vCod_Carteira     := cdsContasCOD_CARTEIRA.AsString;
    vGeraRemessa      := cdsContasGERAR_REMESSA.AsString;
  end;
  if cdsContasOPCAO_GERAR_NOSSNUMERO.AsString = 'E' then
    vGera_NossoNumero := cdsContasGERAR_NOSSONUMERO_ESP.AsString;
}
end;

procedure TDMCobEletronica.prc_Enviar_ACBR;
var
  vTitulo: TACBrTitulo;
  vGerar: Boolean;
  vContadorAux: Integer;
  vMsgAux: String;
begin
  tContas.Close;
  tContas.Open;
//  if not fnc_Verificar then
//    exit;

  //27/08/2014
  vNum_Remessa := fnc_Busca_Num_Arquivo_Rem;
  prc_ConfiguraACBR;

  ACBrBoleto1.ListadeBoletos.Clear;

///////////////////////////////// aqui tratar Juca 2015-03-19
{  mBoletos.First;
  while not mBoletos.Eof do
  begin
    if not SMDBGrid1.SelectedRows.CurrentRowSelected then
    begin
      mBoletos.Next;
      Continue;
    end;
    if (cdsDuplicataID_CONTA_BOLETO.IsNull) and (cdsDuplicataFILIAL.AsInteger = RxDBLookupCombo1.KeyValue) then
    begin
      cdsDuplicata.Edit;
      cdsDuplicataID_CONTA_BOLETO.AsInteger := RxDBLookupCombo2.KeyValue;
      cdsDuplicata.Post;
    end;

    mBoletos.Next;
  end;
  cdsDuplicata.ApplyUpdates(0);

  buscaNossoNumero;

  vMsgAux := '';
  vGerar  := False;
  cdsDuplicata.First;
  while not cdsDuplicata.Eof do
  begin
    if not SMDBGrid1.SelectedRows.CurrentRowSelected then
    begin
      cdsDuplicata.Next;
      Continue;
    end;

    if cdsDuplicataFILIAL.AsInteger = RxDBLookupCombo1.KeyValue then
    begin
      prc_Verificar_Carteira;
      if vGeraRemessa = 'S' then
      begin
        vGerar := True;
        cdsDuplicata.Last;
      end;
    end;

    if not vGerar then
    begin
      MessageDlg('Não há títulos selecionados ou carteira não corresponde' + #13 +
                 'à cobrança do banco definido para gerar remessa!', mtWarning, [mbOk], 0);
      cdsDuplicata.Last;
    end;

    cdsDuplicata.Next;
  end;

  //27/08/2014
  //vNum_Remessa := fnc_Busca_Num_Arquivo_Rem;

  vMsgAux      := '';
  vContadorAux := 0;
  geraCabecalhoAcbr;
  cdsDuplicata.First;
  while not cdsDuplicata.Eof do
  begin
    if SMDBGrid1.SelectedRows.CurrentRowSelected then
    begin

      if not(cdsDuplicataNUM_REMESSA.IsNull) and not(ckReenviar.Checked) then
      begin
        SMDBGrid1.SelectedRows.CurrentRowSelected := False;
        cdsDuplicata.Next;
        Continue;
      end;

      if cdsDuplicataFILIAL.AsInteger <> RxDBLookupCombo1.KeyValue then
        vMsgAux := 'Alguns títulos não foram gerados;' +#13 + 'Verifique se a Filial informada é a mesma do título;'
      else
      begin
        prc_Verificar_Carteira;
        if vGeraRemessa = 'S' then
        begin
          vContadorAux := vContadorAux + 1;
          vNossoNumero := geraRegistroACBR;
          //aqui
          prc_Gravar_Duplicata('R');
        end;
      end;
    end;

    cdsDuplicata.Next;
  end;

  if vContadorAux <= 0 then
  begin
    MessageDlg('*** Nenhum título na remessa!' +#13 +
               'Motivo:' +#13 +
               '   1) Verifique se foi selecionado algum título;' +#13 +
               '   2) Verifique se a carteira está marcada para gerar remessa;' +#13, mtInformation, [mbOk], 0);
    exit;
  end
  else
  if trim(vMsgAux) <> '' then
      MessageDlg(vMsgAux + #13, mtWarning, [mbOk], 0);

  FreeAndNil(vTitulo);

  cdsDuplicata.ApplyUpdates(0);}
///////////////////////////////// aqui tratar Juca 2015-03-19

  try //gera a remessa
    // captura o contador de remessa
    ACBrBoleto1.GerarRemessa(vNum_Remessa);

    // Atualiza a nosso numero no cadastro do banco
    cdsContas_calculo.Edit;
    cdsContas_calculoSEQ_NOSSONUMERO.AsString := IntToStr(xNossoNum);
    cdsContas_calculo.Post;
    cdsContas_calculo.ApplyUpdates(0);

    // Atualiza o contador de remesa na tabela de configuração
    tContas.Edit;
    tContasNum_Arq_Rem.AsInteger := vNum_Remessa;
    tContas.Post;

    MessageDlg('Geração concluída!' + #13, mtConfirmation, [mbOk], 0);

  except
    MessageDlg('Erro ao gerar arquivo de remessa!',mtWarning,[mbOK],0);
  end;
end;

function TDMCobEletronica.fnc_Busca_Num_Arquivo_Rem: Integer;
var
  sds: TSQLDataSet;
  i: Integer;
  vData: TDateTime;
begin
  i := tContasNUM_ARQ_REM.AsInteger + 1;
  Result := I;

  vSeq_Remessa_Dia := 0;
  if tContasDT_REMESSA.AsDateTime = Date then
    vSeq_Remessa_Dia := tContasSEQ_REMESSA_DIA.AsInteger;

  vSeq_Remessa_Dia := vSeq_Remessa_Dia + 1;

  tContas.Edit;
  tContasDt_Remessa.AsDateTime := Date;
  tContasSeq_Remessa_Dia.AsInteger := vSeq_Remessa_Dia;
  tContas.Post;

{  try
    sds := TSQLDataSet.Create(nil);
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'UPDATE DBCONTAS SET NUM_ARQ_REMESSA = ' + IntToStr(i)
                       + ' , DT_REMESSA = ' + QuotedStr(FormatDateTime('MM/DD/YYYY',Date))
                       + ' , SEQ_REMESSA_DIA = ' + IntToStr(vSeq_Remessa_Dia)
                       + ' WHERE CODCONTA = ' + tContasCodConta.AsString;
    sds.ExecSQL;

  finally
    FreeAndNil(sds);
  end;
}
end;

procedure TDMCobEletronica.prc_ConfiguraACBR;
var
  vExtensao: String;
begin
  if DmCobEletronica.tContasACBR_LAYOUTREMESSA.AsString = 'C240' then
    DmCobEletronica.ACBrBoleto1.LayoutRemessa := C240
  else
    DmCobEletronica.ACBrBoleto1.LayoutRemessa := C400;

  case DmCobEletronica.tContasACBR_TIPOCOBRANCA.AsInteger of
     1: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobBancoDoBrasil;
     2: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobBancoDoNordeste;
     3: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobBancoMercantil;
     4: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobBancoob;
     5: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobBanestes;
     6: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobBanrisul;
     7: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobBicBanco;
     8: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobBradesco;
     9: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobBradescoSICOOB;
    10: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobBRB;
    11: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobCaixaEconomica;
    12: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobCaixaSicob;
    13: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobHSBC;
    14: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobItau;
    15: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobNenhum;
    16: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobSantander;
    17: DmCobEletronica.ACBrBoleto1.Banco.TipoCobranca := cobSicred;
  end;

  DmCobEletronica.ACBrBoleto1.ACBrBoletoFC.DirLogo  := DmCobEletronica.tContasBANCO_LOGO.AsString;
//  ACBrBoleto1.ACBrBoletoFC.ArquivoLogo := fDmCob_Eletronica.cdsContasBANCO_LOGO.AsString;
  DmCobEletronica.ACBrBoleto1.ACBrBoletoFC.Filtro   := fiNenhum;
  DmCobEletronica.ACBrBoleto1.Cedente.Nome          := DmCobEletronica.tFilialEmpresa.AsString;
  DmCobEletronica.ACBrBoleto1.Cedente.CodigoCedente := DmCobEletronica.tContasCodCedente.AsString;
  DmCobEletronica.ACBrBoleto1.Cedente.Agencia       := DmCobEletronica.tContasAGENCIA.AsString;
  DmCobEletronica.ACBrBoleto1.Cedente.AgenciaDigito := DmCobEletronica.tContasAgencia_Dig.AsString;
  DmCobEletronica.ACBrBoleto1.Cedente.Conta         := DmCobEletronica.tContasNUMCONTA.AsString;
  DmCobEletronica.ACBrBoleto1.Cedente.ContaDigito   := DmCobEletronica.tContasDIGCONTA.AsString;
  DmCobEletronica.ACBrBoleto1.Cedente.Convenio      := DmCobEletronica.tContasConvenioLider.AsString;
  DmCobEletronica.ACBrBoleto1.Cedente.UF            := DmCobEletronica.tFilialEstado.AsString;
  DmCobEletronica.ACBrBoleto1.DirArqRemessa         := DmCobEletronica.tContasEnd_Arq_Rem.AsString;
  //ACBrBoleto1.NomeArqRemessa        := 'COB_' + FormatDateTime('YYYYMMDD_HHMMSS',Now)+'.TXT';


  DmCobEletronica.ACBrBoleto1.NomeArqRemessa := DmCobEletronica.tContasINICIAL_NOME_ARQ_REM.AsString +
                                                FormatFloat('00',DmCobEletronica.tContasFILIAL.AsInteger) +
                                                FormatFloat('00',MonthOf(Date)) + FormatFloat('00',DayOf(Date));
  if trim(DmCobEletronica.tContasExtensao_Arq_Rem.AsString) = '' then
    vExtensao := 'REM'
  else
    vExtensao := DmCobEletronica.tContasExtensao_Arq_Rem.AsString;

  vNum_Remessa := DMCobEletronica.fnc_Busca_Num_Arquivo_Rem;

  if DmCobEletronica.vSeq_Remessa_Dia = 1 then
    DmCobEletronica.ACBrBoleto1.NomeArqRemessa := DmCobEletronica.ACBrBoleto1.NomeArqRemessa + '.' + vExtensao
  else
  if DmCobEletronica.vSeq_Remessa_Dia < 100 then
    DmCobEletronica.ACBrBoleto1.NomeArqRemessa := DmCobEletronica.ACBrBoleto1.NomeArqRemessa + '.' + Copy(vExtensao,1,1) +
                                                  FormatFloat('00',DmCobEletronica.vSeq_Remessa_Dia)
  else
    DmCobEletronica.ACBrBoleto1.NomeArqRemessa := DmCobEletronica.ACBrBoleto1.NomeArqRemessa + '.' +
                                                  FormatFloat('000',DmCobEletronica.vSeq_Remessa_Dia);
end;

procedure TDMCobEletronica.prc_Localizar(vFilial, vCod, vParc: Integer);
begin
  vExiste_Rec := False;
  if not tCReceberParc.Active then
    tCReceberParc.Open;
  if (vFilial <> 0) and (vCod <> 0) and (vParc <> 0) then
    if tCReceberParc.Locate('Filial;NumCReceber;ParcCReceber',VarArrayOf([vFilial,vCod,vParc]),[loCaseInsensitive]) then
      vExiste_Rec := True;
//  if not tCReceberParc.Locate('Filial;NumCReceber;ParcCReceber',VarArrayOf([vFilial,vCod,vParc]),[loCaseInsensitive]) then
//    ShowMessage('Não localizou!');
end;

end.
