object DMNFeConfig: TDMNFeConfig
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 362
  Top = 214
  Height = 370
  Width = 427
  object sdsConfig_NFe: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT CC.CNPJ_TITULAR, CC.chave_acesso, CC.validade_inicio, CC.' +
      'validade_fim, CN.*'#13#10'FROM CONFIG_NFE CN'#13#10'INNER JOIN CONFIG_CERTIF' +
      'ICADOS CC'#13#10'ON CN.ID_CERTIFICADO = CC.ID'#13#10'WHERE CC.CNPJ_TITULAR =' +
      ' :CNPJ_TITULAR'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CNPJ_TITULAR'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase_NFeBD.scoNFeBD
    Left = 64
    Top = 56
    object sdsConfig_NFeCNPJ_TITULAR: TStringField
      FieldName = 'CNPJ_TITULAR'
      ProviderFlags = []
    end
    object sdsConfig_NFeCHAVE_ACESSO: TMemoField
      FieldName = 'CHAVE_ACESSO'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 1
    end
    object sdsConfig_NFeVALIDADE_INICIO: TSQLTimeStampField
      FieldName = 'VALIDADE_INICIO'
      ProviderFlags = []
    end
    object sdsConfig_NFeVALIDADE_FIM: TSQLTimeStampField
      FieldName = 'VALIDADE_FIM'
      ProviderFlags = []
    end
    object sdsConfig_NFeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsConfig_NFeID_CERTIFICADO: TIntegerField
      FieldName = 'ID_CERTIFICADO'
      Required = True
    end
    object sdsConfig_NFeAMBIENTE: TIntegerField
      FieldName = 'AMBIENTE'
    end
    object sdsConfig_NFeCONTINGENCIA: TStringField
      FieldName = 'CONTINGENCIA'
      Size = 10
    end
    object sdsConfig_NFeLICENCA: TStringField
      FieldName = 'LICENCA'
      Size = 128
    end
    object sdsConfig_NFeTEMPO_ESPERA: TIntegerField
      FieldName = 'TEMPO_ESPERA'
    end
    object sdsConfig_NFeUF: TStringField
      FieldName = 'UF'
      Size = 10
    end
    object sdsConfig_NFeWEBSERVICE: TStringField
      FieldName = 'WEBSERVICE'
      Size = 10
    end
    object sdsConfig_NFeDANFE_DADOS_EMISSOR: TStringField
      FieldName = 'DANFE_DADOS_EMISSOR'
      Size = 200
    end
    object sdsConfig_NFeDANFE_QUADRO_RECIBO: TStringField
      FieldName = 'DANFE_QUADRO_RECIBO'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_QUADRO_FATURA: TStringField
      FieldName = 'DANFE_QUADRO_FATURA'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_QUADRO_ISSQN: TStringField
      FieldName = 'DANFE_QUADRO_ISSQN'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_SEPARADOR_ITEM: TStringField
      FieldName = 'DANFE_SEPARADOR_ITEM'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_CONF_PDF: TMemoField
      FieldName = 'DANFE_CONF_PDF'
      BlobType = ftMemo
      Size = 1
    end
    object sdsConfig_NFeDANFE_QTRIBDEC: TIntegerField
      FieldName = 'DANFE_QTRIBDEC'
    end
    object sdsConfig_NFeDANFE_RODAPE: TStringField
      FieldName = 'DANFE_RODAPE'
      Size = 50
    end
    object sdsConfig_NFeDANFE_SEM_COLUNA_DESCONTO: TStringField
      FieldName = 'DANFE_SEM_COLUNA_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_COM_FATURA: TStringField
      FieldName = 'DANFE_COM_FATURA'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_SEM_DADOS_EMITENTE: TStringField
      FieldName = 'DANFE_SEM_DADOS_EMITENTE'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_SEM_QUADRO_EMITENTE: TStringField
      FieldName = 'DANFE_SEM_QUADRO_EMITENTE'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_SALTAR_LINHA: TStringField
      FieldName = 'DANFE_SALTAR_LINHA'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_CARACTER_SALTAR_LINHA: TStringField
      FieldName = 'DANFE_CARACTER_SALTAR_LINHA'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_MOSTRAR_ST: TStringField
      FieldName = 'DANFE_MOSTRAR_ST'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_OMITIR_RESER_AO_FISCO: TStringField
      FieldName = 'DANFE_OMITIR_RESER_AO_FISCO'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_IMP_COLUNA_TRIB_SEM_INF: TStringField
      FieldName = 'DANFE_IMP_COLUNA_TRIB_SEM_INF'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_NAO_GERAR_ZEROS_ICMS: TStringField
      FieldName = 'DANFE_NAO_GERAR_ZEROS_ICMS'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_NAO_GERAR_ZEROS_IPI: TStringField
      FieldName = 'DANFE_NAO_GERAR_ZEROS_IPI'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_NAO_GERAR_DADOS_ENTREGA: TStringField
      FieldName = 'DANFE_NAO_GERAR_DADOS_ENTREGA'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_NAO_GERAR_DADOS_RETIRADA: TStringField
      FieldName = 'DANFE_NAO_GERAR_DADOS_RETIRADA'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_MOSTRAR_FCI: TStringField
      FieldName = 'DANFE_MOSTRAR_FCI'
      FixedChar = True
      Size = 1
    end
    object sdsConfig_NFeDANFE_ALTQUADRORECIBO: TIntegerField
      FieldName = 'DANFE_ALTQUADRORECIBO'
    end
  end
  object dspConfig_NFe: TDataSetProvider
    DataSet = sdsConfig_NFe
    Left = 136
    Top = 56
  end
  object cdsConfig_NFe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfig_NFe'
    Left = 200
    Top = 56
    object cdsConfig_NFeCNPJ_TITULAR: TStringField
      FieldName = 'CNPJ_TITULAR'
      ProviderFlags = []
    end
    object cdsConfig_NFeCHAVE_ACESSO: TMemoField
      FieldName = 'CHAVE_ACESSO'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 1
    end
    object cdsConfig_NFeVALIDADE_INICIO: TSQLTimeStampField
      FieldName = 'VALIDADE_INICIO'
      ProviderFlags = []
    end
    object cdsConfig_NFeVALIDADE_FIM: TSQLTimeStampField
      FieldName = 'VALIDADE_FIM'
      ProviderFlags = []
    end
    object cdsConfig_NFeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConfig_NFeID_CERTIFICADO: TIntegerField
      FieldName = 'ID_CERTIFICADO'
      Required = True
    end
    object cdsConfig_NFeAMBIENTE: TIntegerField
      FieldName = 'AMBIENTE'
    end
    object cdsConfig_NFeCONTINGENCIA: TStringField
      FieldName = 'CONTINGENCIA'
      Size = 10
    end
    object cdsConfig_NFeLICENCA: TStringField
      FieldName = 'LICENCA'
      Size = 128
    end
    object cdsConfig_NFeTEMPO_ESPERA: TIntegerField
      FieldName = 'TEMPO_ESPERA'
    end
    object cdsConfig_NFeUF: TStringField
      FieldName = 'UF'
      Size = 10
    end
    object cdsConfig_NFeWEBSERVICE: TStringField
      FieldName = 'WEBSERVICE'
      Size = 10
    end
    object cdsConfig_NFeDANFE_DADOS_EMISSOR: TStringField
      FieldName = 'DANFE_DADOS_EMISSOR'
      Size = 200
    end
    object cdsConfig_NFeDANFE_QUADRO_RECIBO: TStringField
      FieldName = 'DANFE_QUADRO_RECIBO'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_QUADRO_FATURA: TStringField
      FieldName = 'DANFE_QUADRO_FATURA'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_QUADRO_ISSQN: TStringField
      FieldName = 'DANFE_QUADRO_ISSQN'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_SEPARADOR_ITEM: TStringField
      FieldName = 'DANFE_SEPARADOR_ITEM'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_CONF_PDF: TMemoField
      FieldName = 'DANFE_CONF_PDF'
      BlobType = ftMemo
      Size = 1
    end
    object cdsConfig_NFeDANFE_QTRIBDEC: TIntegerField
      FieldName = 'DANFE_QTRIBDEC'
    end
    object cdsConfig_NFeDANFE_RODAPE: TStringField
      FieldName = 'DANFE_RODAPE'
      Size = 50
    end
    object cdsConfig_NFeDANFE_SEM_COLUNA_DESCONTO: TStringField
      FieldName = 'DANFE_SEM_COLUNA_DESCONTO'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_COM_FATURA: TStringField
      FieldName = 'DANFE_COM_FATURA'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_SEM_DADOS_EMITENTE: TStringField
      FieldName = 'DANFE_SEM_DADOS_EMITENTE'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_SEM_QUADRO_EMITENTE: TStringField
      FieldName = 'DANFE_SEM_QUADRO_EMITENTE'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_SALTAR_LINHA: TStringField
      FieldName = 'DANFE_SALTAR_LINHA'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_CARACTER_SALTAR_LINHA: TStringField
      FieldName = 'DANFE_CARACTER_SALTAR_LINHA'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_MOSTRAR_ST: TStringField
      FieldName = 'DANFE_MOSTRAR_ST'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_OMITIR_RESER_AO_FISCO: TStringField
      FieldName = 'DANFE_OMITIR_RESER_AO_FISCO'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_IMP_COLUNA_TRIB_SEM_INF: TStringField
      FieldName = 'DANFE_IMP_COLUNA_TRIB_SEM_INF'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_NAO_GERAR_ZEROS_ICMS: TStringField
      FieldName = 'DANFE_NAO_GERAR_ZEROS_ICMS'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_NAO_GERAR_ZEROS_IPI: TStringField
      FieldName = 'DANFE_NAO_GERAR_ZEROS_IPI'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_NAO_GERAR_DADOS_ENTREGA: TStringField
      FieldName = 'DANFE_NAO_GERAR_DADOS_ENTREGA'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_NAO_GERAR_DADOS_RETIRADA: TStringField
      FieldName = 'DANFE_NAO_GERAR_DADOS_RETIRADA'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_MOSTRAR_FCI: TStringField
      FieldName = 'DANFE_MOSTRAR_FCI'
      FixedChar = True
      Size = 1
    end
    object cdsConfig_NFeDANFE_ALTQUADRORECIBO: TIntegerField
      FieldName = 'DANFE_ALTQUADRORECIBO'
    end
  end
  object dsConfig_NFe: TDataSource
    DataSet = cdsConfig_NFe
    Left = 272
    Top = 56
  end
end
