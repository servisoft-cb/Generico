object DMCupom: TDMCupom
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 443
  Top = 172
  Height = 380
  Width = 516
  object sdsCupomFiscal: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT CF.*, C.NOME NOME_CLIENTE'#13#10'FROM CUPOMFISCAL CF'#13#10'INNER JOI' +
      'N CLIENTE C ON (CF.CODCLIENTE = C.CODIGO)'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 96
    Top = 48
    object sdsCupomFiscalID_CUPOM: TIntegerField
      FieldName = 'ID_CUPOM'
      Required = True
    end
    object sdsCupomFiscalNUMCUPOM: TIntegerField
      FieldName = 'NUMCUPOM'
    end
    object sdsCupomFiscalDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object sdsCupomFiscalHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
    end
    object sdsCupomFiscalTIPOPGTO: TStringField
      FieldName = 'TIPOPGTO'
      FixedChar = True
      Size = 1
    end
    object sdsCupomFiscalCODCONDPGTO: TIntegerField
      FieldName = 'CODCONDPGTO'
    end
    object sdsCupomFiscalCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
    end
    object sdsCupomFiscalPERCVENDEDOR: TFloatField
      FieldName = 'PERCVENDEDOR'
    end
    object sdsCupomFiscalBASEICMS: TFloatField
      FieldName = 'BASEICMS'
    end
    object sdsCupomFiscalVLRICMS: TFloatField
      FieldName = 'VLRICMS'
    end
    object sdsCupomFiscalVLRPRODUTOS: TFloatField
      FieldName = 'VLRPRODUTOS'
    end
    object sdsCupomFiscalVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
    end
    object sdsCupomFiscalVLRTOTAL: TFloatField
      FieldName = 'VLRTOTAL'
    end
    object sdsCupomFiscalCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object sdsCupomFiscalVLRRECEBIDO: TFloatField
      FieldName = 'VLRRECEBIDO'
    end
    object sdsCupomFiscalVLRTROCO: TFloatField
      FieldName = 'VLRTROCO'
    end
    object sdsCupomFiscalNUMMOVFINANCEIRO: TIntegerField
      FieldName = 'NUMMOVFINANCEIRO'
    end
    object sdsCupomFiscalCODCONTA: TIntegerField
      FieldName = 'CODCONTA'
    end
    object sdsCupomFiscalFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsCupomFiscalCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object sdsCupomFiscalCODTIPOCOBRANCA: TIntegerField
      FieldName = 'CODTIPOCOBRANCA'
    end
    object sdsCupomFiscalNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      ProviderFlags = []
      Size = 60
    end
  end
  object dspCupomFiscal: TDataSetProvider
    DataSet = sdsCupomFiscal
    OnUpdateError = dspCupomFiscalUpdateError
    Left = 216
    Top = 48
  end
  object cdsCupomFiscal: TClientDataSet
    Aggregates = <>
    PacketRecords = 40
    Params = <>
    ProviderName = 'dspCupomFiscal'
    Left = 312
    Top = 48
    object cdsCupomFiscalID_CUPOM: TIntegerField
      FieldName = 'ID_CUPOM'
      Required = True
    end
    object cdsCupomFiscalNUMCUPOM: TIntegerField
      FieldName = 'NUMCUPOM'
    end
    object cdsCupomFiscalDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsCupomFiscalHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
    end
    object cdsCupomFiscalTIPOPGTO: TStringField
      FieldName = 'TIPOPGTO'
      FixedChar = True
      Size = 1
    end
    object cdsCupomFiscalCODCONDPGTO: TIntegerField
      FieldName = 'CODCONDPGTO'
    end
    object cdsCupomFiscalCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
    end
    object cdsCupomFiscalPERCVENDEDOR: TFloatField
      FieldName = 'PERCVENDEDOR'
    end
    object cdsCupomFiscalBASEICMS: TFloatField
      FieldName = 'BASEICMS'
      DisplayFormat = '0.00'
    end
    object cdsCupomFiscalVLRICMS: TFloatField
      FieldName = 'VLRICMS'
      DisplayFormat = '0.00'
    end
    object cdsCupomFiscalVLRPRODUTOS: TFloatField
      FieldName = 'VLRPRODUTOS'
      DisplayFormat = '0.00'
    end
    object cdsCupomFiscalVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
      DisplayFormat = '0.00'
    end
    object cdsCupomFiscalVLRTOTAL: TFloatField
      FieldName = 'VLRTOTAL'
      DisplayFormat = '0.00'
    end
    object cdsCupomFiscalCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object cdsCupomFiscalVLRRECEBIDO: TFloatField
      FieldName = 'VLRRECEBIDO'
      DisplayFormat = '0.00'
    end
    object cdsCupomFiscalVLRTROCO: TFloatField
      FieldName = 'VLRTROCO'
      DisplayFormat = '0.00'
    end
    object cdsCupomFiscalNUMMOVFINANCEIRO: TIntegerField
      FieldName = 'NUMMOVFINANCEIRO'
    end
    object cdsCupomFiscalCODCONTA: TIntegerField
      FieldName = 'CODCONTA'
    end
    object cdsCupomFiscalFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsCupomFiscalsdsCupomFiscalIt: TDataSetField
      FieldName = 'sdsCupomFiscalIt'
    end
    object cdsCupomFiscalCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object cdsCupomFiscalCODTIPOCOBRANCA: TIntegerField
      FieldName = 'CODTIPOCOBRANCA'
    end
    object cdsCupomFiscalsdsCupomFicalParc: TDataSetField
      FieldName = 'sdsCupomFicalParc'
    end
    object cdsCupomFiscalNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      ProviderFlags = []
      Size = 60
    end
  end
  object dsCupomFiscal: TDataSource
    DataSet = cdsCupomFiscal
    Left = 392
    Top = 48
  end
  object dsCupomFiscal_Mestre: TDataSource
    DataSet = sdsCupomFiscal
    Left = 56
    Top = 112
  end
  object sdsCupomFiscalIt: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT IT.*, P.NOME NOMEPRODUTO'#13#10'FROM CUPOMFISCALIT IT'#13#10#13#10'LEFT J' +
      'OIN PRODUTO P'#13#10'ON IT.CODPRODUTO = P.CODIGO'#13#10#13#10'WHERE IT.ID_CUPOM ' +
      '= :ID_CUPOM'
    DataSource = dsCupomFiscal_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CUPOM'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 96
    Top = 192
    object sdsCupomFiscalItID_CUPOM: TIntegerField
      FieldName = 'ID_CUPOM'
      Required = True
    end
    object sdsCupomFiscalItITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsCupomFiscalItCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object sdsCupomFiscalItCODCOR: TIntegerField
      FieldName = 'CODCOR'
    end
    object sdsCupomFiscalItQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsCupomFiscalItALIQICMS: TFloatField
      FieldName = 'ALIQICMS'
    end
    object sdsCupomFiscalItVLRUNIT: TFloatField
      FieldName = 'VLRUNIT'
    end
    object sdsCupomFiscalItPERCDESCONTO: TFloatField
      FieldName = 'PERCDESCONTO'
    end
    object sdsCupomFiscalItVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
    end
    object sdsCupomFiscalItBASEICMS: TFloatField
      FieldName = 'BASEICMS'
    end
    object sdsCupomFiscalItVLRICMS: TFloatField
      FieldName = 'VLRICMS'
    end
    object sdsCupomFiscalItVLRTOTAL: TFloatField
      FieldName = 'VLRTOTAL'
    end
    object sdsCupomFiscalItCODNATOPER: TIntegerField
      FieldName = 'CODNATOPER'
    end
    object sdsCupomFiscalItNUMMOVEST: TIntegerField
      FieldName = 'NUMMOVEST'
    end
    object sdsCupomFiscalItUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object sdsCupomFiscalItNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      ProviderFlags = []
      Size = 40
    end
    object sdsCupomFiscalItCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object sdsCupomFiscalItSITTRIB: TStringField
      FieldName = 'SITTRIB'
      Size = 5
    end
  end
  object cdsCupomFiscalIt: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCupomFiscalsdsCupomFiscalIt
    IndexFieldNames = 'ID_CUPOM;ITEM'
    Params = <>
    Left = 224
    Top = 192
    object cdsCupomFiscalItID_CUPOM: TIntegerField
      FieldName = 'ID_CUPOM'
      Required = True
    end
    object cdsCupomFiscalItITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsCupomFiscalItCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object cdsCupomFiscalItCODCOR: TIntegerField
      FieldName = 'CODCOR'
    end
    object cdsCupomFiscalItQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsCupomFiscalItALIQICMS: TFloatField
      FieldName = 'ALIQICMS'
    end
    object cdsCupomFiscalItVLRUNIT: TFloatField
      FieldName = 'VLRUNIT'
    end
    object cdsCupomFiscalItPERCDESCONTO: TFloatField
      FieldName = 'PERCDESCONTO'
    end
    object cdsCupomFiscalItVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
    end
    object cdsCupomFiscalItBASEICMS: TFloatField
      FieldName = 'BASEICMS'
    end
    object cdsCupomFiscalItVLRICMS: TFloatField
      FieldName = 'VLRICMS'
    end
    object cdsCupomFiscalItVLRTOTAL: TFloatField
      FieldName = 'VLRTOTAL'
    end
    object cdsCupomFiscalItCODNATOPER: TIntegerField
      FieldName = 'CODNATOPER'
    end
    object cdsCupomFiscalItNUMMOVEST: TIntegerField
      FieldName = 'NUMMOVEST'
    end
    object cdsCupomFiscalItUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsCupomFiscalItCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object cdsCupomFiscalItNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      ProviderFlags = []
      Size = 40
    end
    object cdsCupomFiscalItSITTRIB: TStringField
      FieldName = 'SITTRIB'
      Size = 5
    end
  end
  object dsCupomFiscalIt: TDataSource
    DataSet = cdsCupomFiscalIt
    Left = 336
    Top = 192
  end
  object sdsCupomFicalParc: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM CUPOMFISCALPARC'#13#10'WHERE ID_CUPOM = :ID_CUPOM'
    DataSource = dsCupomFiscal_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CUPOM'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 96
    Top = 272
    object sdsCupomFicalParcID_CUPOM: TIntegerField
      FieldName = 'ID_CUPOM'
      Required = True
    end
    object sdsCupomFicalParcPARCELA: TIntegerField
      FieldName = 'PARCELA'
      Required = True
    end
    object sdsCupomFicalParcDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object sdsCupomFicalParcVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object cdsCupomFiscalParc: TClientDataSet
    Aggregates = <>
    DataSetField = cdsCupomFiscalsdsCupomFicalParc
    IndexFieldNames = 'ID_CUPOM;PARCELA'
    Params = <>
    Left = 224
    Top = 280
    object cdsCupomFiscalParcID_CUPOM: TIntegerField
      FieldName = 'ID_CUPOM'
      Required = True
    end
    object cdsCupomFiscalParcPARCELA: TIntegerField
      FieldName = 'PARCELA'
      Required = True
    end
    object cdsCupomFiscalParcDTVENCIMENTO: TDateField
      FieldName = 'DTVENCIMENTO'
    end
    object cdsCupomFiscalParcVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object dsCupomFiscalParc: TDataSource
    DataSet = cdsCupomFiscalParc
    Left = 336
    Top = 272
  end
end
