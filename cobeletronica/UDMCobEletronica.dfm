object DMCobEletronica: TDMCobEletronica
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 242
  Top = 215
  Height = 512
  Width = 729
  object sdsCobEletronica: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM COBELETRONICA'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 136
    Top = 40
    object sdsCobEletronicaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsCobEletronicaDTGERACAO: TDateField
      FieldName = 'DTGERACAO'
    end
    object sdsCobEletronicaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object sdsCobEletronicaHORA: TTimeField
      FieldName = 'HORA'
    end
    object sdsCobEletronicaQTDTITULOS: TIntegerField
      FieldName = 'QTDTITULOS'
    end
    object sdsCobEletronicaVLRTITULOS: TFloatField
      FieldName = 'VLRTITULOS'
    end
    object sdsCobEletronicaCODBANCO: TIntegerField
      FieldName = 'CODBANCO'
    end
    object sdsCobEletronicaCODTIPOCOBRANCA: TIntegerField
      FieldName = 'CODTIPOCOBRANCA'
    end
    object sdsCobEletronicaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsCobEletronicaNOMEARQUIVO: TStringField
      FieldName = 'NOMEARQUIVO'
      Size = 200
    end
    object sdsCobEletronicaDTINICIAL: TDateField
      FieldName = 'DTINICIAL'
    end
    object sdsCobEletronicaDTFINAL: TDateField
      FieldName = 'DTFINAL'
    end
  end
  object dspCobEletronica: TDataSetProvider
    DataSet = sdsCobEletronica
    OnUpdateError = dspCobEletronicaUpdateError
    Left = 176
    Top = 40
  end
  object cdsCobEletronica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCobEletronica'
    Left = 216
    Top = 40
    object cdsCobEletronicaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCobEletronicaDTGERACAO: TDateField
      FieldName = 'DTGERACAO'
    end
    object cdsCobEletronicaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsCobEletronicaHORA: TTimeField
      FieldName = 'HORA'
    end
    object cdsCobEletronicaQTDTITULOS: TIntegerField
      FieldName = 'QTDTITULOS'
    end
    object cdsCobEletronicaVLRTITULOS: TFloatField
      FieldName = 'VLRTITULOS'
    end
    object cdsCobEletronicaCODBANCO: TIntegerField
      FieldName = 'CODBANCO'
    end
    object cdsCobEletronicaCODTIPOCOBRANCA: TIntegerField
      FieldName = 'CODTIPOCOBRANCA'
    end
    object cdsCobEletronicaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsCobEletronicaNOMEARQUIVO: TStringField
      FieldName = 'NOMEARQUIVO'
      Size = 200
    end
    object cdsCobEletronicaDTINICIAL: TDateField
      FieldName = 'DTINICIAL'
    end
    object cdsCobEletronicaDTFINAL: TDateField
      FieldName = 'DTFINAL'
    end
    object cdsCobEletronicasdsCobEletronica_Nota: TDataSetField
      FieldName = 'sdsCobEletronica_Nota'
    end
  end
  object dsCobEletronica: TDataSource
    DataSet = cdsCobEletronica
    Left = 264
    Top = 40
  end
  object dsCobEletronicaMestre: TDataSource
    DataSet = sdsCobEletronica
    Left = 80
    Top = 88
  end
  object sdsCobEletronica_Nota: TSQLDataSet
    CommandText = 
      'SELECT CB.*, CL.NOME NOMECLIENTE, CL.CGCCPF, CL.PESSOA'#13#10'FROM COB' +
      'ELETRONICA_NOTA CB'#13#10'FULL JOIN CLIENTE CL'#13#10'ON CB.CODCLIENTE = CL.' +
      'CODIGO'#13#10'WHERE ID = :ID'#13#10
    DataSource = dsCobEletronicaMestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 136
    Top = 112
    object sdsCobEletronica_NotaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsCobEletronica_NotaITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsCobEletronica_NotaNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object sdsCobEletronica_NotaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object sdsCobEletronica_NotaSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object sdsCobEletronica_NotaNUMSEQNOTA: TIntegerField
      FieldName = 'NUMSEQNOTA'
    end
    object sdsCobEletronica_NotaVLRTITULO: TFloatField
      FieldName = 'VLRTITULO'
    end
    object sdsCobEletronica_NotaDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object sdsCobEletronica_NotaPROCESSO: TStringField
      FieldName = 'PROCESSO'
      Size = 5
    end
    object sdsCobEletronica_NotaPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object sdsCobEletronica_NotaNUMCRECEBER: TIntegerField
      FieldName = 'NUMCRECEBER'
    end
    object sdsCobEletronica_NotaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsCobEletronica_NotaNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
    end
    object sdsCobEletronica_NotaESPECIEDOC: TStringField
      FieldName = 'ESPECIEDOC'
      Size = 2
    end
    object sdsCobEletronica_NotaACEITE: TStringField
      FieldName = 'ACEITE'
      Size = 1
    end
    object sdsCobEletronica_NotaNUMCARTEIRA: TStringField
      FieldName = 'NUMCARTEIRA'
      Size = 3
    end
    object sdsCobEletronica_NotaNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      ProviderFlags = []
      Size = 60
    end
    object sdsCobEletronica_NotaCGCCPF: TStringField
      FieldName = 'CGCCPF'
      ProviderFlags = []
      Size = 18
    end
    object sdsCobEletronica_NotaPESSOA: TStringField
      FieldName = 'PESSOA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object sdsCobEletronica_NotaDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
  end
  object cdsCobEletronica_Nota: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCobEletronicasdsCobEletronica_Nota
    Params = <>
    Left = 176
    Top = 112
    object cdsCobEletronica_NotaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCobEletronica_NotaITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsCobEletronica_NotaNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsCobEletronica_NotaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object cdsCobEletronica_NotaSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
    object cdsCobEletronica_NotaNUMSEQNOTA: TIntegerField
      FieldName = 'NUMSEQNOTA'
    end
    object cdsCobEletronica_NotaVLRTITULO: TFloatField
      FieldName = 'VLRTITULO'
    end
    object cdsCobEletronica_NotaDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object cdsCobEletronica_NotaPROCESSO: TStringField
      FieldName = 'PROCESSO'
      Size = 5
    end
    object cdsCobEletronica_NotaPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object cdsCobEletronica_NotaNUMCRECEBER: TIntegerField
      FieldName = 'NUMCRECEBER'
    end
    object cdsCobEletronica_NotaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsCobEletronica_NotaNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
    end
    object cdsCobEletronica_NotaESPECIEDOC: TStringField
      FieldName = 'ESPECIEDOC'
      Size = 2
    end
    object cdsCobEletronica_NotaACEITE: TStringField
      FieldName = 'ACEITE'
      Size = 1
    end
    object cdsCobEletronica_NotaNUMCARTEIRA: TStringField
      FieldName = 'NUMCARTEIRA'
      Size = 3
    end
    object cdsCobEletronica_NotaNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      ProviderFlags = []
      Size = 60
    end
    object cdsCobEletronica_NotaCGCCPF: TStringField
      FieldName = 'CGCCPF'
      ProviderFlags = []
      Size = 18
    end
    object cdsCobEletronica_NotaPESSOA: TStringField
      FieldName = 'PESSOA'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object cdsCobEletronica_NotaDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
  end
  object dsCobEletronica_Nota: TDataSource
    DataSet = cdsCobEletronica_Nota
    Left = 224
    Top = 112
  end
  object tContas: TTable
    DatabaseName = 'Tabelas'
    TableName = 'dbContas.DB'
    Left = 144
    Top = 184
    object tContasCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object tContasNomeConta: TStringField
      FieldName = 'NomeConta'
      Size = 40
    end
    object tContasSaldoConta: TFloatField
      FieldName = 'SaldoConta'
    end
    object tContasTipoConta: TStringField
      FieldName = 'TipoConta'
      Size = 1
    end
    object tContasCodBanco: TStringField
      FieldName = 'CodBanco'
      Size = 3
    end
    object tContasInstrucao1: TStringField
      FieldName = 'Instrucao1'
      Size = 40
    end
    object tContasInstrucao2: TStringField
      FieldName = 'Instrucao2'
      Size = 40
    end
    object tContasInstrucao3: TStringField
      FieldName = 'Instrucao3'
      Size = 40
    end
    object tContasInstrucao4: TStringField
      FieldName = 'Instrucao4'
      Size = 40
    end
    object tContasEspecie: TStringField
      FieldName = 'Especie'
      Size = 3
    end
    object tContasLocalPagamento: TStringField
      FieldName = 'LocalPagamento'
      Size = 60
    end
    object tContasQtdLinhasInst: TIntegerField
      FieldName = 'QtdLinhasInst'
    end
    object tContasAgencia: TStringField
      FieldName = 'Agencia'
      Size = 8
    end
    object tContasDescNota: TStringField
      FieldName = 'DescNota'
      Size = 30
    end
    object tContasDigConta: TStringField
      FieldName = 'DigConta'
      Size = 1
    end
    object tContasFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tContasNumConta: TStringField
      FieldName = 'NumConta'
      Size = 12
    end
    object tContasCNAB: TStringField
      FieldName = 'CNAB'
      Size = 15
    end
    object tContasConvenioLider: TStringField
      FieldName = 'ConvenioLider'
      Size = 6
    end
    object tContasCodTipoCobranca: TIntegerField
      FieldName = 'CodTipoCobranca'
    end
    object tContasDtEncerramento: TDateField
      FieldName = 'DtEncerramento'
    end
    object tContasAge_PossuiDigVerificador: TBooleanField
      FieldName = 'Age_PossuiDigVerificador'
    end
    object tContasAcbr_TipoCobranca: TStringField
      FieldName = 'Acbr_TipoCobranca'
      Size = 2
    end
    object tContasCodCedente: TStringField
      FieldName = 'CodCedente'
      Size = 15
    end
    object tContasBanco_logo: TStringField
      FieldName = 'Banco_logo'
      Size = 200
    end
    object tContasAgencia_Dig: TStringField
      FieldName = 'Agencia_Dig'
      Size = 1
    end
    object tContasAcbr_LayOutRemessa: TStringField
      FieldName = 'Acbr_LayOutRemessa'
      Size = 4
    end
    object tContasInicial_Nome_Arq_Rem: TStringField
      FieldName = 'Inicial_Nome_Arq_Rem'
      Size = 5
    end
    object tContasEnd_Arq_Rem: TStringField
      FieldName = 'End_Arq_Rem'
      Size = 200
    end
    object tContasExtensao_Arq_Rem: TStringField
      FieldName = 'Extensao_Arq_Rem'
      Size = 3
    end
    object tContasNossoNumero_Por_Ano: TStringField
      FieldName = 'NossoNumero_Por_Ano'
      Size = 1
    end
    object tContasACBR_Montar_NossoNumero: TStringField
      FieldName = 'ACBR_Montar_NossoNumero'
      Size = 1
    end
    object tContasNum_Arq_Rem: TIntegerField
      FieldName = 'Num_Arq_Rem'
    end
    object tContasDt_Remessa: TDateField
      FieldName = 'Dt_Remessa'
    end
    object tContasSeq_Remessa_Dia: TSmallintField
      FieldName = 'Seq_Remessa_Dia'
    end
    object tContasPercJuros: TFloatField
      FieldName = 'PercJuros'
    end
    object tContasPercMulta: TFloatField
      FieldName = 'PercMulta'
    end
    object tContasDiasProtesto: TSmallintField
      FieldName = 'DiasProtesto'
    end
    object tContasIdBanco: TIntegerField
      FieldName = 'IdBanco'
    end
  end
  object dsContas: TDataSource
    DataSet = tContas
    Left = 184
    Top = 184
  end
  object tFilial: TTable
    DatabaseName = 'Tabelas'
    TableName = 'dbFilial.DB'
    Left = 144
    Top = 280
    object tFilialCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tFilialEmpresa: TStringField
      FieldName = 'Empresa'
      Size = 60
    end
    object tFilialEndereco: TStringField
      FieldName = 'Endereco'
      Size = 60
    end
    object tFilialEstado: TStringField
      FieldName = 'Estado'
      Size = 3
    end
    object tFilialBairro: TStringField
      FieldName = 'Bairro'
      Size = 40
    end
    object tFilialCep: TStringField
      FieldName = 'Cep'
      Size = 9
    end
    object tFilialCidade: TStringField
      FieldName = 'Cidade'
      Size = 26
    end
    object tFilialCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object tFilialTel: TStringField
      FieldName = 'Tel'
      Size = 13
    end
    object tFilialTel2: TStringField
      FieldName = 'Tel2'
      Size = 13
    end
    object tFilialFax: TStringField
      FieldName = 'Fax'
      Size = 13
    end
    object tFilialInscr: TStringField
      FieldName = 'Inscr'
      Size = 18
    end
    object tFilialSimples: TBooleanField
      FieldName = 'Simples'
    end
    object tFilialEmail: TStringField
      FieldName = 'Email'
      Size = 50
    end
    object tFilialSimplesGaucho: TBooleanField
      FieldName = 'SimplesGaucho'
    end
    object tFilialImpSimplesGaucho: TBooleanField
      FieldName = 'ImpSimplesGaucho'
    end
    object tFilialEndLogo: TStringField
      FieldName = 'EndLogo'
      Size = 200
    end
    object tFilialNomeInterno: TStringField
      FieldName = 'NomeInterno'
      Size = 200
    end
    object tFilialCalculaIpi: TBooleanField
      FieldName = 'CalculaIpi'
    end
    object tFilialInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tFilialCodCidade: TIntegerField
      FieldName = 'CodCidade'
    end
    object tFilialInscMunicipal: TStringField
      FieldName = 'InscMunicipal'
      Size = 15
    end
    object tFilialCNAE: TStringField
      FieldName = 'CNAE'
      Size = 7
    end
    object tFilialNumEnd: TStringField
      FieldName = 'NumEnd'
      Size = 15
    end
    object tFilialHomePage: TStringField
      FieldName = 'HomePage'
      Size = 250
    end
    object tFilialUsarICMSimples: TBooleanField
      FieldName = 'UsarICMSimples'
    end
    object tFilialCodRegimeTrib: TIntegerField
      FieldName = 'CodRegimeTrib'
    end
    object tFilialCodPis: TStringField
      FieldName = 'CodPis'
      Size = 2
    end
    object tFilialCodCofins: TStringField
      FieldName = 'CodCofins'
      Size = 2
    end
    object tFilialTipoPis: TStringField
      FieldName = 'TipoPis'
      Size = 2
    end
    object tFilialTipoCofins: TStringField
      FieldName = 'TipoCofins'
      Size = 2
    end
    object tFilialPercCofins: TFloatField
      FieldName = 'PercCofins'
    end
    object tFilialPercPis: TFloatField
      FieldName = 'PercPis'
    end
    object tFilialCodSitTrib: TIntegerField
      FieldName = 'CodSitTrib'
    end
    object tFilialCodCSTIPI: TStringField
      FieldName = 'CodCSTIPI'
      Size = 2
    end
    object tFilialDtEstoque: TDateField
      FieldName = 'DtEstoque'
    end
    object tFilialEMailNFe: TStringField
      FieldName = 'EMailNFe'
      Size = 100
    end
    object tFilialPerc_Trib_NTS_Ind: TFloatField
      FieldName = 'Perc_Trib_NTS_Ind'
    end
    object tFilialPerc_Trib_NTS_Ven: TFloatField
      FieldName = 'Perc_Trib_NTS_Ven'
    end
    object tFilialPerc_Trib_NTS_Ind_Exp: TFloatField
      FieldName = 'Perc_Trib_NTS_Ind_Exp'
    end
    object tFilialPerc_Trib_NTS_Ven_Exp: TFloatField
      FieldName = 'Perc_Trib_NTS_Ven_Exp'
    end
  end
  object dsFilial: TDataSource
    DataSet = tFilial
    Left = 184
    Top = 280
  end
  object ACBrBoleto1: TACBrBoleto
    Banco.TamanhoMaximoNossoNum = 10
    Banco.TipoCobranca = cobNenhum
    Cedente.TipoInscricao = pJuridica
    NumeroArquivo = 0
    LayoutRemessa = c240
    ACBrBoletoFC = ACBrBoletoFCFortes1
    Left = 472
    Top = 296
  end
  object ACBrBoletoFCFortes1: TACBrBoletoFCFortes
    ACBrBoleto = ACBrBoleto1
    Left = 560
    Top = 304
  end
  object sdsContas_Calculo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM CONTAS_CALCULO '#13#10'WHERE ID = :ID'#13#10'  AND ANO = :ANO' +
      #13#10'  AND ITEM = :ITEM'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 408
    Top = 40
  end
  object dspContas_Calculo: TDataSetProvider
    DataSet = sdsContas_Calculo
    OnUpdateError = dspCobEletronicaUpdateError
    Left = 448
    Top = 40
  end
  object cdsContas_Calculo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContas_Calculo'
    Left = 488
    Top = 40
    object cdsContas_CalculoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsContas_CalculoANO: TIntegerField
      FieldName = 'ANO'
      Required = True
    end
    object cdsContas_CalculoITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsContas_CalculoSEQ_NOSSONUMERO: TFMTBCDField
      FieldName = 'SEQ_NOSSONUMERO'
      Precision = 15
      Size = 0
    end
  end
  object dsContas_Calculo: TDataSource
    DataSet = cdsContas_Calculo
    Left = 536
    Top = 40
  end
  object sdsCob_Tipo_Cadastro: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM COB_TIPO_CADASTRO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 408
    Top = 112
  end
  object dspCob_Tipo_Cadastro: TDataSetProvider
    DataSet = sdsCob_Tipo_Cadastro
    OnUpdateError = dspCobEletronicaUpdateError
    Left = 448
    Top = 112
  end
  object cdsCob_Tipo_Cadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCob_Tipo_Cadastro'
    Left = 496
    Top = 112
    object cdsCob_Tipo_CadastroID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCob_Tipo_CadastroCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object cdsCob_Tipo_CadastroNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsCob_Tipo_CadastroTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      Size = 3
    end
    object cdsCob_Tipo_CadastroID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object cdsCob_Tipo_CadastroCOD_REDUZIDO: TStringField
      FieldName = 'COD_REDUZIDO'
      Size = 3
    end
    object cdsCob_Tipo_CadastroTIPO_INST: TStringField
      FieldName = 'TIPO_INST'
      Size = 3
    end
    object cdsCob_Tipo_CadastroTIPO_PROTESTO: TStringField
      FieldName = 'TIPO_PROTESTO'
      Size = 1
    end
    object cdsCob_Tipo_CadastroENVIAR_DIAS_PROTESTO: TStringField
      FieldName = 'ENVIAR_DIAS_PROTESTO'
      FixedChar = True
      Size = 1
    end
    object cdsCob_Tipo_CadastroGERAR_NOSSONUMERO: TStringField
      FieldName = 'GERAR_NOSSONUMERO'
      FixedChar = True
      Size = 1
    end
    object cdsCob_Tipo_CadastroGERAR_REMESSA: TStringField
      FieldName = 'GERAR_REMESSA'
      FixedChar = True
      Size = 1
    end
  end
  object dsCob_Tipo_Cadastro: TDataSource
    DataSet = cdsCob_Tipo_Cadastro
    Left = 536
    Top = 112
  end
  object sdsEspecie: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM COB_TIPO_CADASTRO'#13#10'WHERE TIPO_REG = '#39'ESP'#39#13#10'   AND' +
      ' ID_BANCO = :ID_BANCO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_BANCO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 408
    Top = 168
    object sdsEspecieID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsEspecieCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object sdsEspecieNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object sdsEspecieTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      Size = 3
    end
    object sdsEspecieID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object sdsEspecieCOD_REDUZIDO: TStringField
      FieldName = 'COD_REDUZIDO'
      Size = 3
    end
  end
  object dspEspecie: TDataSetProvider
    DataSet = sdsEspecie
    Left = 456
    Top = 168
  end
  object cdsEspecie: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODIGO'
    Params = <>
    ProviderName = 'dspEspecie'
    Left = 504
    Top = 168
    object cdsEspecieID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsEspecieCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object cdsEspecieNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsEspecieTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      Size = 3
    end
    object cdsEspecieID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object cdsEspecieCOD_REDUZIDO: TStringField
      FieldName = 'COD_REDUZIDO'
      Size = 3
    end
  end
  object dsEspecie: TDataSource
    DataSet = cdsEspecie
    Left = 544
    Top = 168
  end
  object tBcoSantander: TTable
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'CodConta'
    MasterFields = 'CodConta'
    MasterSource = dsContas
    TableName = 'dbBcoSantander.DB'
    Left = 144
    Top = 232
    object tBcoSantanderCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object tBcoSantanderCodCedente: TStringField
      FieldName = 'CodCedente'
      Size = 12
    end
    object tBcoSantanderCarteira: TStringField
      FieldName = 'Carteira'
      Size = 1
    end
    object tBcoSantanderAceite: TStringField
      FieldName = 'Aceite'
      Size = 1
    end
    object tBcoSantanderInstrucao: TStringField
      FieldName = 'Instrucao'
      Size = 2
    end
    object tBcoSantanderDiasProtesto: TIntegerField
      FieldName = 'DiasProtesto'
    end
    object tBcoSantanderCaminho: TStringField
      FieldName = 'Caminho'
      Size = 50
    end
    object tBcoSantanderNome: TStringField
      FieldName = 'Nome'
      Size = 8
    end
    object tBcoSantanderExtensao: TStringField
      FieldName = 'Extensao'
      Size = 3
    end
    object tBcoSantanderVlrDesconto: TFloatField
      FieldName = 'VlrDesconto'
    end
    object tBcoSantanderVlrJurosPorDia: TFloatField
      FieldName = 'VlrJurosPorDia'
    end
    object tBcoSantanderEspecieDoc: TStringField
      FieldName = 'EspecieDoc'
      Size = 2
    end
    object tBcoSantanderNumCarteira: TStringField
      FieldName = 'NumCarteira'
      Size = 3
    end
    object tBcoSantanderDtLimiteDesconto: TDateField
      FieldName = 'DtLimiteDesconto'
    end
    object tBcoSantanderTipoJuro: TStringField
      FieldName = 'TipoJuro'
      Size = 1
    end
    object tBcoSantanderTipoDesconto: TStringField
      FieldName = 'TipoDesconto'
      Size = 1
    end
    object tBcoSantanderTaxaMulta: TFloatField
      FieldName = 'TaxaMulta'
    end
    object tBcoSantanderCodTransmissao: TStringField
      FieldName = 'CodTransmissao'
    end
    object tBcoSantanderNumRemessa: TIntegerField
      FieldName = 'NumRemessa'
    end
    object tBcoSantanderFormaCadastramento: TIntegerField
      FieldName = 'FormaCadastramento'
    end
    object tBcoSantanderCodProtesto: TStringField
      FieldName = 'CodProtesto'
      Size = 1
    end
    object tBcoSantanderCodBaixa: TStringField
      FieldName = 'CodBaixa'
      Size = 1
    end
    object tBcoSantanderCodCompensacao: TStringField
      FieldName = 'CodCompensacao'
      Size = 3
    end
    object tBcoSantanderTipoDocumento: TStringField
      FieldName = 'TipoDocumento'
      Size = 1
    end
    object tBcoSantanderDiasBaixa: TIntegerField
      FieldName = 'DiasBaixa'
    end
    object tBcoSantanderVlrIOF: TFloatField
      FieldName = 'VlrIOF'
    end
    object tBcoSantanderCodMulta: TStringField
      FieldName = 'CodMulta'
      Size = 1
    end
    object tBcoSantanderDtMulta: TDateField
      FieldName = 'DtMulta'
    end
    object tBcoSantanderVlrMulta: TFloatField
      FieldName = 'VlrMulta'
    end
    object tBcoSantanderTipoDesconto2: TStringField
      FieldName = 'TipoDesconto2'
      Size = 1
    end
    object tBcoSantanderDtLimiteDesconto2: TDateField
      FieldName = 'DtLimiteDesconto2'
    end
    object tBcoSantanderVlrDesconto2: TFloatField
      FieldName = 'VlrDesconto2'
    end
    object tBcoSantanderMensagem1: TStringField
      FieldName = 'Mensagem1'
      Size = 40
    end
    object tBcoSantanderMensagem2: TStringField
      FieldName = 'Mensagem2'
      Size = 40
    end
    object tBcoSantanderComplemento: TStringField
      FieldName = 'Complemento'
      Size = 3
    end
    object tBcoSantanderGerarNossoNumero: TStringField
      FieldName = 'GerarNossoNumero'
      Size = 1
    end
  end
  object dsBcoSantander: TDataSource
    DataSet = tBcoSantander
    Left = 184
    Top = 232
  end
  object tCReceberParc: TTable
    DatabaseName = 'Tabelas'
    TableName = 'dbCReceberParc.DB'
    Left = 140
    Top = 329
    object tCReceberParcFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tCReceberParcNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
    end
    object tCReceberParcParcCReceber: TIntegerField
      FieldName = 'ParcCReceber'
    end
    object tCReceberParcVlrParcCReceber: TFloatField
      FieldName = 'VlrParcCReceber'
      DisplayFormat = '0.00'
    end
    object tCReceberParcDtVencCReceber: TDateField
      FieldName = 'DtVencCReceber'
      EditMask = '99/99/9999'
    end
    object tCReceberParcQuitParcCReceber: TBooleanField
      FieldName = 'QuitParcCReceber'
    end
    object tCReceberParcJurosParcCReceber: TFloatField
      FieldName = 'JurosParcCReceber'
      DisplayFormat = '###,###,##0.00'
    end
    object tCReceberParcDtPagParcCReceber: TDateField
      FieldName = 'DtPagParcCReceber'
      EditMask = '99/99/9999'
    end
    object tCReceberParcCodCli: TIntegerField
      FieldName = 'CodCli'
    end
    object tCReceberParcNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object tCReceberParcDesconto: TFloatField
      FieldName = 'Desconto'
      DisplayFormat = '0.00'
    end
    object tCReceberParcPgtoParcial: TFloatField
      FieldName = 'PgtoParcial'
      DisplayFormat = '0.00'
    end
    object tCReceberParcRestParcela: TFloatField
      FieldName = 'RestParcela'
      DisplayFormat = '0.00'
    end
    object tCReceberParcContaDupl: TSmallintField
      FieldName = 'ContaDupl'
    end
    object tCReceberParcSelecionado: TBooleanField
      FieldName = 'Selecionado'
    end
    object tCReceberParcCodVendedor: TIntegerField
      FieldName = 'CodVendedor'
    end
    object tCReceberParcBaixada: TBooleanField
      FieldName = 'Baixada'
    end
    object tCReceberParcPercComissao: TFloatField
      FieldName = 'PercComissao'
      DisplayFormat = '0.00'
    end
    object tCReceberParcVlrComissao: TFloatField
      FieldName = 'VlrComissao'
      DisplayFormat = '0.00'
    end
    object tCReceberParcPlanoContas: TIntegerField
      FieldName = 'PlanoContas'
    end
    object tCReceberParcAgencia: TStringField
      FieldName = 'Agencia'
      Size = 6
    end
    object tCReceberParcTitPortador: TStringField
      FieldName = 'TitPortador'
    end
    object tCReceberParcCodTipoCobranca: TIntegerField
      FieldName = 'CodTipoCobranca'
    end
    object tCReceberParcDespesas: TFloatField
      FieldName = 'Despesas'
      DisplayFormat = '0.00'
    end
    object tCReceberParcAbatimentos: TFloatField
      FieldName = 'Abatimentos'
      DisplayFormat = '0.00'
    end
    object tCReceberParcCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object tCReceberParcPgCartorio: TBooleanField
      FieldName = 'PgCartorio'
    end
    object tCReceberParcDiasAtraso: TFloatField
      FieldName = 'DiasAtraso'
    end
    object tCReceberParcLetraCambio: TBooleanField
      FieldName = 'LetraCambio'
    end
    object tCReceberParcJurosPagos: TFloatField
      FieldName = 'JurosPagos'
      DisplayFormat = '###,###,##0.00'
    end
    object tCReceberParcCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tCReceberParcTitProtestado: TBooleanField
      FieldName = 'TitProtestado'
      DisplayValues = 'BXP;   '
    end
    object tCReceberParcDtGerado: TDateField
      FieldName = 'DtGerado'
    end
    object tCReceberParcTipoDoc: TStringField
      FieldName = 'TipoDoc'
      Size = 2
    end
    object tCReceberParcVlrDevolucao: TFloatField
      FieldName = 'VlrDevolucao'
      DisplayFormat = '0.00'
    end
    object tCReceberParcArqGerado: TBooleanField
      FieldName = 'ArqGerado'
    end
    object tCReceberParcTransferencia: TBooleanField
      FieldName = 'Transferencia'
    end
    object tCReceberParcNumTitBanco: TStringField
      FieldName = 'NumTitBanco'
    end
    object tCReceberParcNroLancExtComissao: TIntegerField
      FieldName = 'NroLancExtComissao'
    end
    object tCReceberParcComissaoItem: TBooleanField
      FieldName = 'ComissaoItem'
    end
    object tCReceberParcVlrComissaoRestante: TFloatField
      FieldName = 'VlrComissaoRestante'
      DisplayFormat = '0.00'
    end
    object tCReceberParcCodPlanoContasItens: TIntegerField
      FieldName = 'CodPlanoContasItens'
    end
    object tCReceberParcCodVendedor2: TIntegerField
      FieldName = 'CodVendedor2'
    end
    object tCReceberParcPercComissao2: TFloatField
      FieldName = 'PercComissao2'
    end
    object tCReceberParcCodBancoBoleto: TIntegerField
      FieldName = 'CodBancoBoleto'
    end
    object tCReceberParcNumCarteira: TStringField
      FieldName = 'NumCarteira'
      Size = 3
    end
    object tCReceberParcNumSeqNossoNum: TIntegerField
      FieldName = 'NumSeqNossoNum'
    end
    object tCReceberParcItemSeqNossoNum: TIntegerField
      FieldName = 'ItemSeqNossoNum'
    end
    object tCReceberParcDtVencimento2: TDateField
      FieldName = 'DtVencimento2'
    end
    object tCReceberParcSerie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object tCReceberParcNumSeqNota: TIntegerField
      FieldName = 'NumSeqNota'
    end
    object tCReceberParcCodBancoCheque: TIntegerField
      FieldName = 'CodBancoCheque'
    end
    object tCReceberParcNumCheque: TIntegerField
      FieldName = 'NumCheque'
    end
    object tCReceberParcCodCartaoCredito: TIntegerField
      FieldName = 'CodCartaoCredito'
    end
    object tCReceberParcNumCartaoCredito: TStringField
      FieldName = 'NumCartaoCredito'
    end
    object tCReceberParcValidadeCartao: TStringField
      FieldName = 'ValidadeCartao'
      Size = 8
    end
    object tCReceberParcTipoCondicao: TStringField
      FieldName = 'TipoCondicao'
      Size = 3
    end
    object tCReceberParcNumAutorizacaoCartao: TStringField
      FieldName = 'NumAutorizacaoCartao'
      Size = 15
    end
    object tCReceberParcIDCobEletronica: TIntegerField
      FieldName = 'IDCobEletronica'
    end
    object tCReceberParcAceite: TStringField
      FieldName = 'Aceite'
      Size = 1
    end
    object tCReceberParcEspecieDoc: TStringField
      FieldName = 'EspecieDoc'
      Size = 3
    end
    object tCReceberParcDescontoDe: TStringField
      FieldName = 'DescontoDe'
    end
    object tCReceberParcDescontoAte: TStringField
      FieldName = 'DescontoAte'
    end
    object tCReceberParclkTipoComissao: TStringField
      FieldKind = fkLookup
      FieldName = 'lkTipoComissao'
      LookupDataSet = tVendedor
      LookupKeyFields = 'Codigo'
      LookupResultField = 'TipoComissao'
      KeyFields = 'CodVendedor'
      Size = 1
      Lookup = True
    end
  end
  object dsCReceberParc: TDataSource
    DataSet = tCReceberParc
    Left = 186
    Top = 329
  end
  object mRetorno: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CodCarteira'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CodOcorrenciaRet'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NomeOcorrenciaRet'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DtOcorrencia'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DtVenc'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NumNota'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VlrTitulo'
        DataType = ftFloat
      end
      item
        Name = 'EspecieDoc'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'VlrDespesaCobranca'
        DataType = ftFloat
      end
      item
        Name = 'VlrIOF'
        DataType = ftFloat
      end
      item
        Name = 'VlrAbatimento'
        DataType = ftFloat
      end
      item
        Name = 'VlrDesconto'
        DataType = ftFloat
      end
      item
        Name = 'VlrPago'
        DataType = ftFloat
      end
      item
        Name = 'VlrJurosPagos'
        DataType = ftFloat
      end
      item
        Name = 'DtLiquidacao'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'InstrCancelada'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'NomeCliente'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Erros'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CodLiquidacao'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DescLiquidacao'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'Atualizado'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CodCliente'
        DataType = ftInteger
      end
      item
        Name = 'DescErro1'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'DescErro2'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'DescErro3'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'DescErro4'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'DescErro5'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'DescErro6'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'CodInstrCancelada'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ConfNossoNumero'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'NossoNumero'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SeuNumero'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ID_Duplicata'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Titulo_OK'
        DataType = ftBoolean
      end
      item
        Name = 'Parcela'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Usa_NumConta_Cedente'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Tipo_Ret'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Filial'
        DataType = ftInteger
      end
      item
        Name = 'Atualizar'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 512
    Top = 376
    Data = {
      7B0400009619E0BD0100000018000000270000000000030000007B040B436F64
      4361727465697261010049000000010005574944544802000200030010436F64
      4F636F7272656E63696152657401004900000001000557494454480200020002
      00114E6F6D654F636F7272656E63696152657401004900000001000557494454
      480200020064000C44744F636F7272656E636961010049000000010005574944
      5448020002000A0006447456656E630100490000000100055749445448020002
      000A00074E756D4E6F74610100490000000100055749445448020002000A0009
      566C72546974756C6F08000400000000000A45737065636965446F6301004900
      00000100055749445448020002001E0012566C7244657370657361436F627261
      6E6361080004000000000006566C72494F4608000400000000000D566C724162
      6174696D656E746F08000400000000000B566C72446573636F6E746F08000400
      0000000007566C725061676F08000400000000000D566C724A75726F73506167
      6F7308000400000000000C44744C69717569646163616F010049000000010005
      5749445448020002000A000E496E73747243616E63656C616461010049000000
      01000557494454480200020046000B4E6F6D65436C69656E7465010049000000
      0100055749445448020002001E00054572726F73010049000000010005574944
      54480200020008000D436F644C69717569646163616F01004900000001000557
      494454480200020002000E446573634C69717569646163616F01004900000001
      000557494454480200020046000A417475616C697A61646F0100490000000100
      0557494454480200020001000A436F64436C69656E7465040001000000000009
      446573634572726F310100490000000100055749445448020002005A00094465
      73634572726F320100490000000100055749445448020002005A000944657363
      4572726F330100490000000100055749445448020002005A0009446573634572
      726F340100490000000100055749445448020002005A0009446573634572726F
      350100490000000100055749445448020002005A0009446573634572726F3601
      00490000000100055749445448020002005A0011436F64496E73747243616E63
      656C61646101004900000001000557494454480200020004000F436F6E664E6F
      73736F4E756D65726F01004900000001000557494454480200020008000B4E6F
      73736F4E756D65726F0100490000000100055749445448020002001400095365
      754E756D65726F0100490000000100055749445448020002000A000C49445F44
      75706C69636174610100490000000100055749445448020002000A0009546974
      756C6F5F4F4B02000300000000000750617263656C6101004900000001000557
      49445448020002001400145573615F4E756D436F6E74615F436564656E746501
      00490000000100055749445448020002000100085469706F5F52657401004900
      000001000557494454480200020005000646696C69616C040001000000000009
      417475616C697A617201004900000001000557494454480200020001000000}
    object mRetornoCodCarteira: TStringField
      FieldName = 'CodCarteira'
      Size = 3
    end
    object mRetornoCodOcorrenciaRet: TStringField
      FieldName = 'CodOcorrenciaRet'
      Size = 2
    end
    object mRetornoNomeOcorrenciaRet: TStringField
      FieldName = 'NomeOcorrenciaRet'
      Size = 100
    end
    object mRetornoDtOcorrencia: TStringField
      FieldName = 'DtOcorrencia'
      Size = 10
    end
    object mRetornoDtVenc: TStringField
      FieldName = 'DtVenc'
      Size = 10
    end
    object mRetornoNumNota: TStringField
      FieldName = 'NumNota'
      Size = 10
    end
    object mRetornoVlrTitulo: TFloatField
      FieldName = 'VlrTitulo'
      DisplayFormat = '0.00'
    end
    object mRetornoEspecieDoc: TStringField
      FieldName = 'EspecieDoc'
      Size = 30
    end
    object mRetornoVlrDespesaCobranca: TFloatField
      FieldName = 'VlrDespesaCobranca'
      DisplayFormat = '0.00'
    end
    object mRetornoVlrIOF: TFloatField
      FieldName = 'VlrIOF'
      DisplayFormat = '0.00'
    end
    object mRetornoVlrAbatimento: TFloatField
      FieldName = 'VlrAbatimento'
      DisplayFormat = '0.00'
    end
    object mRetornoVlrDesconto: TFloatField
      FieldName = 'VlrDesconto'
      DisplayFormat = '0.00'
    end
    object mRetornoVlrPago: TFloatField
      FieldName = 'VlrPago'
      DisplayFormat = '0.00'
    end
    object mRetornoVlrJurosPagos: TFloatField
      FieldName = 'VlrJurosPagos'
      DisplayFormat = '0.00'
    end
    object mRetornoDtLiquidacao: TStringField
      FieldName = 'DtLiquidacao'
      Size = 10
    end
    object mRetornoInstrCancelada: TStringField
      FieldName = 'InstrCancelada'
      Size = 70
    end
    object mRetornoNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 30
    end
    object mRetornoErros: TStringField
      FieldName = 'Erros'
      Size = 8
    end
    object mRetornoCodLiquidacao: TStringField
      FieldName = 'CodLiquidacao'
      Size = 2
    end
    object mRetornoDescLiquidacao: TStringField
      FieldName = 'DescLiquidacao'
      Size = 70
    end
    object mRetornoAtualizado: TStringField
      FieldName = 'Atualizado'
      Size = 1
    end
    object mRetornoCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object mRetornoDescErro1: TStringField
      FieldName = 'DescErro1'
      Size = 90
    end
    object mRetornoDescErro2: TStringField
      FieldName = 'DescErro2'
      Size = 90
    end
    object mRetornoDescErro3: TStringField
      FieldName = 'DescErro3'
      Size = 90
    end
    object mRetornoDescErro4: TStringField
      FieldName = 'DescErro4'
      Size = 90
    end
    object mRetornoDescErro5: TStringField
      FieldName = 'DescErro5'
      Size = 90
    end
    object mRetornoDescErro6: TStringField
      FieldName = 'DescErro6'
      Size = 90
    end
    object mRetornoCodInstrCancelada: TStringField
      FieldName = 'CodInstrCancelada'
      Size = 4
    end
    object mRetornoConfNossoNumero: TStringField
      FieldName = 'ConfNossoNumero'
      Size = 8
    end
    object mRetornoNossoNumero: TStringField
      FieldName = 'NossoNumero'
    end
    object mRetornoSeuNumero: TStringField
      FieldName = 'SeuNumero'
      Size = 10
    end
    object mRetornoID_Duplicata: TStringField
      FieldName = 'ID_Duplicata'
      Size = 10
    end
    object mRetornoTitulo_OK: TBooleanField
      FieldName = 'Titulo_OK'
      DisplayValues = 'Sim'
    end
    object mRetornoParcela: TStringField
      FieldName = 'Parcela'
    end
    object mRetornoUsa_NumConta_Cedente: TStringField
      FieldName = 'Usa_NumConta_Cedente'
      Size = 1
    end
    object mRetornoTipo_Ret: TStringField
      FieldName = 'Tipo_Ret'
      Size = 5
    end
    object mRetornoFilial: TIntegerField
      FieldName = 'Filial'
    end
    object mRetornoAtualizar: TStringField
      FieldName = 'Atualizar'
      Size = 1
    end
  end
  object dsmRetorno: TDataSource
    DataSet = mRetorno
    Left = 536
    Top = 376
  end
  object dsCReceberParcHist: TDataSource
    DataSet = tCReceberParcHist
    Left = 190
    Top = 385
  end
  object tCReceberParcHist: TTable
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Filial;NumCReceber;ParcCReceber;Item'
    MasterFields = 'Filial;NumCReceber;ParcCReceber'
    MasterSource = dsCReceberParc
    TableName = 'dbCReceberParcHist.db'
    Left = 143
    Top = 385
    object tCReceberParcHistFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tCReceberParcHistNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
    end
    object tCReceberParcHistParcCReceber: TIntegerField
      FieldName = 'ParcCReceber'
    end
    object tCReceberParcHistItem: TIntegerField
      FieldName = 'Item'
    end
    object tCReceberParcHistCodHistorico: TIntegerField
      FieldName = 'CodHistorico'
    end
    object tCReceberParcHistDtHistorico: TDateField
      FieldName = 'DtHistorico'
    end
    object tCReceberParcHistHistorico: TStringField
      FieldName = 'Historico'
      Size = 70
    end
    object tCReceberParcHistDtUltPgto: TDateField
      FieldName = 'DtUltPgto'
    end
    object tCReceberParcHistVlrUltPgto: TFloatField
      FieldName = 'VlrUltPgto'
      DisplayFormat = '0.00'
    end
    object tCReceberParcHistVlrUltJuros: TFloatField
      FieldName = 'VlrUltJuros'
      DisplayFormat = '0.00'
    end
    object tCReceberParcHistVlrUltDescontos: TFloatField
      FieldName = 'VlrUltDescontos'
      DisplayFormat = '0.00'
    end
    object tCReceberParcHistVlrUltDespesas: TFloatField
      FieldName = 'VlrUltDespesas'
      DisplayFormat = '0.00'
    end
    object tCReceberParcHistVlrUltAbatimentos: TFloatField
      FieldName = 'VlrUltAbatimentos'
      DisplayFormat = '0.00'
    end
    object tCReceberParcHistPgto: TBooleanField
      FieldName = 'Pgto'
    end
    object tCReceberParcHistJurosPagos: TFloatField
      FieldName = 'JurosPagos'
      DisplayFormat = '0.00'
    end
    object tCReceberParcHistNumMov: TIntegerField
      FieldName = 'NumMov'
    end
    object tCReceberParcHistNumMovJuros: TIntegerField
      FieldName = 'NumMovJuros'
    end
    object tCReceberParcHistJurosCalc: TFloatField
      FieldName = 'JurosCalc'
      DisplayFormat = '0.00'
    end
    object tCReceberParcHistVlrDevolucao: TFloatField
      FieldName = 'VlrDevolucao'
      DisplayFormat = '0.00'
    end
    object tCReceberParcHistDevolucao: TBooleanField
      FieldName = 'Devolucao'
    end
    object tCReceberParcHistNroLancExtComissao: TIntegerField
      FieldName = 'NroLancExtComissao'
    end
    object tCReceberParcHistTipo: TStringField
      FieldName = 'Tipo'
      Size = 3
    end
    object tCReceberParcHistCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object tCReceberParcHistCodBancoCheque: TIntegerField
      FieldName = 'CodBancoCheque'
    end
    object tCReceberParcHistNumCheque: TIntegerField
      FieldName = 'NumCheque'
    end
    object tCReceberParcHistCodCartaoCredito: TIntegerField
      FieldName = 'CodCartaoCredito'
    end
    object tCReceberParcHistNumCartaCredito: TStringField
      FieldName = 'NumCartaCredito'
    end
    object tCReceberParcHistValidadeCartao: TStringField
      FieldName = 'ValidadeCartao'
      Size = 8
    end
    object tCReceberParcHistTipoCondicao: TStringField
      FieldName = 'TipoCondicao'
      Size = 3
    end
  end
  object sdsRet_Cadastro: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM RET_CADASTRO'#13#10'WHERE ID_BANCO = :ID_BANCO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_BANCO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 408
    Top = 216
    object sdsRet_CadastroID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsRet_CadastroCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object sdsRet_CadastroNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object sdsRet_CadastroTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      Size = 3
    end
    object sdsRet_CadastroID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object sdsRet_CadastroTIPO_RET: TStringField
      FieldName = 'TIPO_RET'
      Size = 3
    end
    object sdsRet_CadastroTIPO_LIQ: TStringField
      FieldName = 'TIPO_LIQ'
      Size = 3
    end
  end
  object dspRet_Cadastro: TDataSetProvider
    DataSet = sdsRet_Cadastro
    Left = 456
    Top = 216
  end
  object cdsRet_Cadastro: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspRet_Cadastro'
    Left = 504
    Top = 216
    object cdsRet_CadastroID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsRet_CadastroCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object cdsRet_CadastroNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object cdsRet_CadastroTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      Size = 3
    end
    object cdsRet_CadastroID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object cdsRet_CadastroTIPO_RET: TStringField
      FieldName = 'TIPO_RET'
      Size = 3
    end
    object cdsRet_CadastroTIPO_LIQ: TStringField
      FieldName = 'TIPO_LIQ'
      Size = 3
    end
  end
  object dsRet_Cadastro: TDataSource
    DataSet = cdsRet_Cadastro
    Left = 544
    Top = 216
  end
  object qContas_Retorno: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM CONTAS_RETORNO'
      'WHERE ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 408
    Top = 372
    object qContas_RetornoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qContas_RetornoPOS_NUM_NOTA: TIntegerField
      FieldName = 'POS_NUM_NOTA'
    end
    object qContas_RetornoQTD_NUM_NOTA: TIntegerField
      FieldName = 'QTD_NUM_NOTA'
    end
    object qContas_RetornoPOS_NOSSO_NUMERO: TIntegerField
      FieldName = 'POS_NOSSO_NUMERO'
    end
    object qContas_RetornoQTD_NOSSO_NUMERO: TIntegerField
      FieldName = 'QTD_NOSSO_NUMERO'
    end
    object qContas_RetornoPOS_ID_DUPLICATA: TIntegerField
      FieldName = 'POS_ID_DUPLICATA'
    end
    object qContas_RetornoQTD_ID_DUPLICATA: TIntegerField
      FieldName = 'QTD_ID_DUPLICATA'
    end
    object qContas_RetornoPOS_OCORRENCIA: TIntegerField
      FieldName = 'POS_OCORRENCIA'
    end
    object qContas_RetornoPOS_DT_OCORRENCIA: TIntegerField
      FieldName = 'POS_DT_OCORRENCIA'
    end
    object qContas_RetornoPOS_CONF_NOSSO_NUMERO: TIntegerField
      FieldName = 'POS_CONF_NOSSO_NUMERO'
    end
    object qContas_RetornoQTD_CONF_NOSSO_NUMERO: TIntegerField
      FieldName = 'QTD_CONF_NOSSO_NUMERO'
    end
    object qContas_RetornoPOS_DT_VENCIMENTO: TIntegerField
      FieldName = 'POS_DT_VENCIMENTO'
    end
    object qContas_RetornoPOS_VLR_TITULO: TIntegerField
      FieldName = 'POS_VLR_TITULO'
    end
    object qContas_RetornoQTD_VLR_TITULO: TIntegerField
      FieldName = 'QTD_VLR_TITULO'
    end
    object qContas_RetornoPOS_ESPECIE: TIntegerField
      FieldName = 'POS_ESPECIE'
    end
    object qContas_RetornoPOS_VLR_DESPESA_COB: TIntegerField
      FieldName = 'POS_VLR_DESPESA_COB'
    end
    object qContas_RetornoQTD_VLR_DESPESA_COB: TIntegerField
      FieldName = 'QTD_VLR_DESPESA_COB'
    end
    object qContas_RetornoPOS_VLR_IOF: TIntegerField
      FieldName = 'POS_VLR_IOF'
    end
    object qContas_RetornoQTD_VLR_IOF: TIntegerField
      FieldName = 'QTD_VLR_IOF'
    end
    object qContas_RetornoPOS_VLR_ABATIMENTO: TIntegerField
      FieldName = 'POS_VLR_ABATIMENTO'
    end
    object qContas_RetornoQTD_VLR_ABATIMENTO: TIntegerField
      FieldName = 'QTD_VLR_ABATIMENTO'
    end
    object qContas_RetornoPOS_VLR_DESCONTO: TIntegerField
      FieldName = 'POS_VLR_DESCONTO'
    end
    object qContas_RetornoQTD_VLR_DESCONTO: TIntegerField
      FieldName = 'QTD_VLR_DESCONTO'
    end
    object qContas_RetornoPOS_VLR_PAGO: TIntegerField
      FieldName = 'POS_VLR_PAGO'
    end
    object qContas_RetornoQTD_VLR_PAGO: TIntegerField
      FieldName = 'QTD_VLR_PAGO'
    end
    object qContas_RetornoPOS_VLR_JUROS_PAGO: TIntegerField
      FieldName = 'POS_VLR_JUROS_PAGO'
    end
    object qContas_RetornoQTD_VLR_JUROS_PAGO: TIntegerField
      FieldName = 'QTD_VLR_JUROS_PAGO'
    end
    object qContas_RetornoPOS_DT_LIQUIDACAO: TIntegerField
      FieldName = 'POS_DT_LIQUIDACAO'
    end
    object qContas_RetornoPOS_INST_CANCELADA: TIntegerField
      FieldName = 'POS_INST_CANCELADA'
    end
    object qContas_RetornoPOS_ERRO: TIntegerField
      FieldName = 'POS_ERRO'
    end
    object qContas_RetornoQTD_ERRO: TIntegerField
      FieldName = 'QTD_ERRO'
    end
    object qContas_RetornoPOS_COD_LIQUIDACAO: TIntegerField
      FieldName = 'POS_COD_LIQUIDACAO'
    end
    object qContas_RetornoQTD_COD_LIQUIDACAO: TIntegerField
      FieldName = 'QTD_COD_LIQUIDACAO'
    end
    object qContas_RetornoPOS_CARTEIRA: TIntegerField
      FieldName = 'POS_CARTEIRA'
    end
    object qContas_RetornoPOS_NOME_CLIENTE: TIntegerField
      FieldName = 'POS_NOME_CLIENTE'
    end
    object qContas_RetornoQTD_NOME_CLIENTE: TIntegerField
      FieldName = 'QTD_NOME_CLIENTE'
    end
    object qContas_RetornoPOS_NUMCONTA_RETORNO: TIntegerField
      FieldName = 'POS_NUMCONTA_RETORNO'
    end
    object qContas_RetornoPOS_CODBANCO_RETORNO: TIntegerField
      FieldName = 'POS_CODBANCO_RETORNO'
    end
    object qContas_RetornoNUMCONTA_CEDENTE: TStringField
      FieldName = 'NUMCONTA_CEDENTE'
      FixedChar = True
      Size = 1
    end
    object qContas_RetornoQTD_ERRO_CADASTRO: TIntegerField
      FieldName = 'QTD_ERRO_CADASTRO'
    end
    object qContas_RetornoQTD_CARTEIRA: TIntegerField
      FieldName = 'QTD_CARTEIRA'
    end
  end
  object qRet_Erro: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO_REG'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM RET_CADASTRO'
      'WHERE CODIGO = :CODIGO'
      '   AND TIPO_REG = :TIPO_REG')
    SQLConnection = dmDatabase.scoDados
    Left = 408
    Top = 326
    object qRet_ErroID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qRet_ErroCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object qRet_ErroNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object qRet_ErroTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      Size = 3
    end
    object qRet_ErroID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object qRet_ErroTABELA_REJ: TStringField
      FieldName = 'TABELA_REJ'
      Size = 10
    end
    object qRet_ErroTIPO_RET: TStringField
      FieldName = 'TIPO_RET'
      Size = 3
    end
  end
  object tVendedor: TTable
    DatabaseName = 'Tabelas'
    TableName = 'dbVendedor.DB'
    Left = 472
    Top = 424
    object tVendedorCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tVendedorNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tVendedorPercComissao: TFloatField
      FieldName = 'PercComissao'
    end
    object tVendedorTipoComissao: TStringField
      FieldName = 'TipoComissao'
      Size = 1
    end
  end
end
