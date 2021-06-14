object dmProdutoCarto: TdmProdutoCarto
  OldCreateOrder = False
  Left = 684
  Top = 183
  Height = 394
  Width = 411
  object sdsProdutoCarto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM PRODUTOCARTO'#13#10'WHERE CODIGO = :CODIGO'
    DataSource = dsProdutoMaster
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 80
    object sdsProdutoCartoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsProdutoCartoFD_LARGURA: TFMTBCDField
      FieldName = 'FD_LARGURA'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFD_COMPR: TFMTBCDField
      FieldName = 'FD_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFD_ALTURA: TFMTBCDField
      FieldName = 'FD_ALTURA'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFD_ABA_INT_CAB: TFMTBCDField
      FieldName = 'FD_ABA_INT_CAB'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFD_ABA_INT_LAT: TFMTBCDField
      FieldName = 'FD_ABA_INT_LAT'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTP_ABA_EXT_CAB: TFMTBCDField
      FieldName = 'TP_ABA_EXT_CAB'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTP_ABA_INT_CAB: TFMTBCDField
      FieldName = 'TP_ABA_INT_CAB'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTP_ABA_EXT_LAT: TFMTBCDField
      FieldName = 'TP_ABA_EXT_LAT'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTP_ABA_INT_LAT: TFMTBCDField
      FieldName = 'TP_ABA_INT_LAT'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSP_LARGURA: TFMTBCDField
      FieldName = 'SP_LARGURA'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSP_COMPR: TFMTBCDField
      FieldName = 'SP_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSP_ALTURA: TFMTBCDField
      FieldName = 'SP_ALTURA'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTP_LARGURA: TFMTBCDField
      FieldName = 'TP_LARGURA'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTP_COMPR: TFMTBCDField
      FieldName = 'TP_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTP_ALTURA: TFMTBCDField
      FieldName = 'TP_ALTURA'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFD_DIMENSAO1: TFMTBCDField
      FieldName = 'FD_DIMENSAO1'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFD_DIMENSAO2: TFMTBCDField
      FieldName = 'FD_DIMENSAO2'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTP_DIMENSAO1: TFMTBCDField
      FieldName = 'TP_DIMENSAO1'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTP_DIMENSAO2: TFMTBCDField
      FieldName = 'TP_DIMENSAO2'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTP_TIPO_MAT: TStringField
      FieldName = 'TP_TIPO_MAT'
      Size = 2
    end
    object sdsProdutoCartoSP_ABA_INT_CAB: TFMTBCDField
      FieldName = 'SP_ABA_INT_CAB'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSP_ABA_INT_LAT: TFMTBCDField
      FieldName = 'SP_ABA_INT_LAT'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFD_TIPO_MAT: TStringField
      FieldName = 'FD_TIPO_MAT'
      Size = 2
    end
    object sdsProdutoCartoSP_TIPO_MAT: TStringField
      FieldName = 'SP_TIPO_MAT'
      Size = 2
    end
    object sdsProdutoCartoSP_DIMENSAO1: TFMTBCDField
      FieldName = 'SP_DIMENSAO1'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSP_DIMENSAO2: TFMTBCDField
      FieldName = 'SP_DIMENSAO2'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFACA_FD: TIntegerField
      FieldName = 'FACA_FD'
    end
    object sdsProdutoCartoFACA_TP: TIntegerField
      FieldName = 'FACA_TP'
    end
    object sdsProdutoCartoFACA_SP: TIntegerField
      FieldName = 'FACA_SP'
    end
    object sdsProdutoCartoENDERECO: TStringField
      FieldName = 'ENDERECO'
    end
    object sdsProdutoCartoFACA_ID: TIntegerField
      FieldName = 'FACA_ID'
    end
    object sdsProdutoCartoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sdsProdutoCartoFD_INT_L: TFMTBCDField
      FieldName = 'FD_INT_L'
      Precision = 15
      Size = 1
    end
    object sdsProdutoCartoFD_INT_C: TFMTBCDField
      FieldName = 'FD_INT_C'
      Precision = 15
      Size = 1
    end
    object sdsProdutoCartoTP_INT_L: TFMTBCDField
      FieldName = 'TP_INT_L'
      Precision = 15
      Size = 1
    end
    object sdsProdutoCartoTP_INT_C: TFMTBCDField
      FieldName = 'TP_INT_C'
      Precision = 15
      Size = 1
    end
    object sdsProdutoCartoSP_INT_L: TFMTBCDField
      FieldName = 'SP_INT_L'
      Precision = 15
      Size = 1
    end
    object sdsProdutoCartoSP_INT_C: TFMTBCDField
      FieldName = 'SP_INT_C'
      Precision = 15
      Size = 1
    end
    object sdsProdutoCartoFD_COPIAS_C: TSmallintField
      FieldName = 'FD_COPIAS_C'
    end
    object sdsProdutoCartoTP_COPIAS_C: TSmallintField
      FieldName = 'TP_COPIAS_C'
    end
    object sdsProdutoCartoSP_COPIAS_C: TSmallintField
      FieldName = 'SP_COPIAS_C'
    end
    object sdsProdutoCartoFD_COPIAS_L: TSmallintField
      FieldName = 'FD_COPIAS_L'
    end
    object sdsProdutoCartoTP_COPIAS_L: TSmallintField
      FieldName = 'TP_COPIAS_L'
    end
    object sdsProdutoCartoSP_COPIAS_L: TSmallintField
      FieldName = 'SP_COPIAS_L'
    end
    object sdsProdutoCartoFACA: TStringField
      FieldName = 'FACA'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFD_FIO_C: TFMTBCDField
      FieldName = 'FD_FIO_C'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFD_FIO_L: TFMTBCDField
      FieldName = 'FD_FIO_L'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTP_FIO_C: TFMTBCDField
      FieldName = 'TP_FIO_C'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTP_FIO_L: TFMTBCDField
      FieldName = 'TP_FIO_L'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSP_FIO_C: TFMTBCDField
      FieldName = 'SP_FIO_C'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSP_FIO_L: TFMTBCDField
      FieldName = 'SP_FIO_L'
      Precision = 15
      Size = 2
    end
  end
  object cdsProdutoCarto: TClientDataSet
    Aggregates = <>
    DataSetField = cdsProdutosdsProdutoCarto
    Params = <>
    OnCalcFields = cdsProdutoCartoCalcFields
    Left = 120
    Top = 80
    object cdsProdutoCartoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsProdutoCartoFD_LARGURA: TFMTBCDField
      FieldName = 'FD_LARGURA'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFD_COMPR: TFMTBCDField
      FieldName = 'FD_COMPR'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFD_ALTURA: TFMTBCDField
      FieldName = 'FD_ALTURA'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFD_ABA_INT_CAB: TFMTBCDField
      FieldName = 'FD_ABA_INT_CAB'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFD_ABA_INT_LAT: TFMTBCDField
      FieldName = 'FD_ABA_INT_LAT'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTP_ABA_EXT_CAB: TFMTBCDField
      FieldName = 'TP_ABA_EXT_CAB'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTP_ABA_INT_CAB: TFMTBCDField
      FieldName = 'TP_ABA_INT_CAB'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTP_ABA_EXT_LAT: TFMTBCDField
      FieldName = 'TP_ABA_EXT_LAT'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTP_ABA_INT_LAT: TFMTBCDField
      FieldName = 'TP_ABA_INT_LAT'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSP_LARGURA: TFMTBCDField
      FieldName = 'SP_LARGURA'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSP_COMPR: TFMTBCDField
      FieldName = 'SP_COMPR'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSP_ALTURA: TFMTBCDField
      FieldName = 'SP_ALTURA'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTP_LARGURA: TFMTBCDField
      FieldName = 'TP_LARGURA'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTP_COMPR: TFMTBCDField
      FieldName = 'TP_COMPR'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTP_ALTURA: TFMTBCDField
      FieldName = 'TP_ALTURA'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFD_DIMENSAO1: TFMTBCDField
      FieldName = 'FD_DIMENSAO1'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFD_DIMENSAO2: TFMTBCDField
      FieldName = 'FD_DIMENSAO2'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTP_DIMENSAO1: TFMTBCDField
      FieldName = 'TP_DIMENSAO1'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTP_DIMENSAO2: TFMTBCDField
      FieldName = 'TP_DIMENSAO2'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTP_TIPO_MAT: TStringField
      FieldName = 'TP_TIPO_MAT'
      Size = 2
    end
    object cdsProdutoCartoSP_ABA_INT_CAB: TFMTBCDField
      FieldName = 'SP_ABA_INT_CAB'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSP_ABA_INT_LAT: TFMTBCDField
      FieldName = 'SP_ABA_INT_LAT'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFD_TIPO_MAT: TStringField
      FieldName = 'FD_TIPO_MAT'
      Size = 2
    end
    object cdsProdutoCartoSP_TIPO_MAT: TStringField
      FieldName = 'SP_TIPO_MAT'
      Size = 2
    end
    object cdsProdutoCartoSP_DIMENSAO1: TFMTBCDField
      FieldName = 'SP_DIMENSAO1'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSP_DIMENSAO2: TFMTBCDField
      FieldName = 'SP_DIMENSAO2'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoclTipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'clTipo'
      Size = 30
      Calculated = True
    end
    object cdsProdutoCartoFACA_FD: TIntegerField
      FieldName = 'FACA_FD'
    end
    object cdsProdutoCartoFACA_TP: TIntegerField
      FieldName = 'FACA_TP'
    end
    object cdsProdutoCartoFACA_SP: TIntegerField
      FieldName = 'FACA_SP'
    end
    object cdsProdutoCartoENDERECO: TStringField
      FieldName = 'ENDERECO'
    end
    object cdsProdutoCartoFACA_ID: TIntegerField
      FieldName = 'FACA_ID'
    end
    object cdsProdutoCartoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsProdutoCartoFD_INT_L: TFMTBCDField
      FieldName = 'FD_INT_L'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 1
    end
    object cdsProdutoCartoFD_INT_C: TFMTBCDField
      FieldName = 'FD_INT_C'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 1
    end
    object cdsProdutoCartoTP_INT_L: TFMTBCDField
      FieldName = 'TP_INT_L'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 1
    end
    object cdsProdutoCartoTP_INT_C: TFMTBCDField
      FieldName = 'TP_INT_C'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 1
    end
    object cdsProdutoCartoSP_INT_L: TFMTBCDField
      FieldName = 'SP_INT_L'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 1
    end
    object cdsProdutoCartoSP_INT_C: TFMTBCDField
      FieldName = 'SP_INT_C'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 1
    end
    object cdsProdutoCartoFD_COPIAS_C: TSmallintField
      FieldName = 'FD_COPIAS_C'
    end
    object cdsProdutoCartoTP_COPIAS_C: TSmallintField
      FieldName = 'TP_COPIAS_C'
    end
    object cdsProdutoCartoSP_COPIAS_C: TSmallintField
      FieldName = 'SP_COPIAS_C'
    end
    object cdsProdutoCartoFD_COPIAS_L: TSmallintField
      FieldName = 'FD_COPIAS_L'
    end
    object cdsProdutoCartoTP_COPIAS_L: TSmallintField
      FieldName = 'TP_COPIAS_L'
    end
    object cdsProdutoCartoSP_COPIAS_L: TSmallintField
      FieldName = 'SP_COPIAS_L'
    end
    object cdsProdutoCartoFACA: TStringField
      FieldName = 'FACA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFD_FIO_C: TFMTBCDField
      FieldName = 'FD_FIO_C'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFD_FIO_L: TFMTBCDField
      FieldName = 'FD_FIO_L'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTP_FIO_C: TFMTBCDField
      FieldName = 'TP_FIO_C'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTP_FIO_L: TFMTBCDField
      FieldName = 'TP_FIO_L'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSP_FIO_C: TFMTBCDField
      FieldName = 'SP_FIO_C'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSP_FIO_L: TFMTBCDField
      FieldName = 'SP_FIO_L'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
  end
  object dsProdutoCarto: TDataSource
    DataSet = cdsProdutoCarto
    Left = 152
    Top = 80
  end
  object sdsProdutoCartoFD: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM PRODUTOCARTO_FD'#13#10'WHERE CODIGO = :CODIGO'
    DataSource = dsProdutoMaster
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 128
    object sdsProdutoCartoFDCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsProdutoCartoFDMATERIAL1: TIntegerField
      FieldName = 'MATERIAL1'
    end
    object sdsProdutoCartoFDMATERIAL2: TIntegerField
      FieldName = 'MATERIAL2'
    end
    object sdsProdutoCartoFDMATERIAL3: TIntegerField
      FieldName = 'MATERIAL3'
    end
    object sdsProdutoCartoFDFECHAMENTO: TStringField
      FieldName = 'FECHAMENTO'
      Size = 2
    end
    object sdsProdutoCartoFDFECHAMENTO_CT: TStringField
      FieldName = 'FECHAMENTO_CT'
      Size = 2
    end
    object sdsProdutoCartoFDREVEST_FT: TStringField
      FieldName = 'REVEST_FT'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDREVEST_FT_MAT: TIntegerField
      FieldName = 'REVEST_FT_MAT'
    end
    object sdsProdutoCartoFDREVEST_FT_BRIL: TStringField
      FieldName = 'REVEST_FT_BRIL'
      Size = 2
    end
    object sdsProdutoCartoFDREVEST_FT_ATRITO: TStringField
      FieldName = 'REVEST_FT_ATRITO'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDREVEST_FT_LUZ: TStringField
      FieldName = 'REVEST_FT_LUZ'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDREVEST_VS: TStringField
      FieldName = 'REVEST_VS'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDREVEST_VS_MAT: TIntegerField
      FieldName = 'REVEST_VS_MAT'
    end
    object sdsProdutoCartoFDREVEST_VS_BRIL: TStringField
      FieldName = 'REVEST_VS_BRIL'
      Size = 2
    end
    object sdsProdutoCartoFDREVEST_VS_ATRITO: TStringField
      FieldName = 'REVEST_VS_ATRITO'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDREVEST_VS_LUZ: TStringField
      FieldName = 'REVEST_VS_LUZ'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDAR: TStringField
      FieldName = 'AR'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDAR_COMPR: TFMTBCDField
      FieldName = 'AR_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFDAR_LARG: TFMTBCDField
      FieldName = 'AR_LARG'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFDAR_LOCAL: TStringField
      FieldName = 'AR_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoFDBR: TStringField
      FieldName = 'BR'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDBR_COMPR: TFMTBCDField
      FieldName = 'BR_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFDBR_LARG: TFMTBCDField
      FieldName = 'BR_LARG'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFDBR_LOCAL: TStringField
      FieldName = 'BR_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoFDHS: TStringField
      FieldName = 'HS'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDHS_COMPR: TFMTBCDField
      FieldName = 'HS_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFDHS_LARG: TFMTBCDField
      FieldName = 'HS_LARG'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFDHS_LOCAL: TStringField
      FieldName = 'HS_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoFDVISOR: TStringField
      FieldName = 'VISOR'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDVISOR_COMPR: TFMTBCDField
      FieldName = 'VISOR_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFDVISOR_LARG: TFMTBCDField
      FieldName = 'VISOR_LARG'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFDVISOR_LOCAL: TStringField
      FieldName = 'VISOR_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoFDVERNIZUV: TStringField
      FieldName = 'VERNIZUV'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDVERNIZUV_COMPR: TFMTBCDField
      FieldName = 'VERNIZUV_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFDVERNIZUV_LARG: TFMTBCDField
      FieldName = 'VERNIZUV_LARG'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFDVERNIZUV_LOCAL: TStringField
      FieldName = 'VERNIZUV_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoFDPICOTE: TStringField
      FieldName = 'PICOTE'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDPICOTE_LOCAL: TStringField
      FieldName = 'PICOTE_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoFDPICOTE_TIPO: TStringField
      FieldName = 'PICOTE_TIPO'
      Size = 2
    end
    object sdsProdutoCartoFDPASSAFITA: TStringField
      FieldName = 'PASSAFITA'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDPASSAFITA_LOCAL: TStringField
      FieldName = 'PASSAFITA_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoFDPASSAFITA_TIPO: TStringField
      FieldName = 'PASSAFITA_TIPO'
      Size = 2
    end
    object sdsProdutoCartoFDILHOS: TStringField
      FieldName = 'ILHOS'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDILHOS_LOCAL: TStringField
      FieldName = 'ILHOS_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoFDALCA: TStringField
      FieldName = 'ALCA'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDALCA_LOCAL: TStringField
      FieldName = 'ALCA_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoFDVERNIZUV_TOTAL: TStringField
      FieldName = 'VERNIZUV_TOTAL'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDPINCA: TStringField
      FieldName = 'PINCA'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDTRAVA: TStringField
      FieldName = 'TRAVA'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDDISPLAY: TStringField
      FieldName = 'DISPLAY'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoFDPINCA_TAM: TFMTBCDField
      FieldName = 'PINCA_TAM'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoFDGRUPO1: TIntegerField
      FieldName = 'GRUPO1'
    end
    object sdsProdutoCartoFDSUBGRUPO1: TIntegerField
      FieldName = 'SUBGRUPO1'
    end
    object sdsProdutoCartoFDGRUPO2: TIntegerField
      FieldName = 'GRUPO2'
    end
    object sdsProdutoCartoFDSUBGRUPO2: TIntegerField
      FieldName = 'SUBGRUPO2'
    end
    object sdsProdutoCartoFDGRUPO3: TIntegerField
      FieldName = 'GRUPO3'
    end
    object sdsProdutoCartoFDSUBGRUPO3: TIntegerField
      FieldName = 'SUBGRUPO3'
    end
    object sdsProdutoCartoFDOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
  end
  object cdsProdutoCartoFD: TClientDataSet
    Aggregates = <>
    DataSetField = cdsProdutosdsProdutoCartoFD
    Params = <>
    OnNewRecord = cdsProdutoCartoFDNewRecord
    Left = 120
    Top = 128
    object cdsProdutoCartoFDCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsProdutoCartoFDMATERIAL1: TIntegerField
      FieldName = 'MATERIAL1'
    end
    object cdsProdutoCartoFDMATERIAL2: TIntegerField
      FieldName = 'MATERIAL2'
    end
    object cdsProdutoCartoFDMATERIAL3: TIntegerField
      FieldName = 'MATERIAL3'
    end
    object cdsProdutoCartoFDFECHAMENTO: TStringField
      FieldName = 'FECHAMENTO'
      Size = 2
    end
    object cdsProdutoCartoFDFECHAMENTO_CT: TStringField
      FieldName = 'FECHAMENTO_CT'
      Size = 2
    end
    object cdsProdutoCartoFDREVEST_FT: TStringField
      FieldName = 'REVEST_FT'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDREVEST_FT_MAT: TIntegerField
      FieldName = 'REVEST_FT_MAT'
    end
    object cdsProdutoCartoFDREVEST_FT_BRIL: TStringField
      FieldName = 'REVEST_FT_BRIL'
      Size = 2
    end
    object cdsProdutoCartoFDREVEST_FT_ATRITO: TStringField
      FieldName = 'REVEST_FT_ATRITO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDREVEST_FT_LUZ: TStringField
      FieldName = 'REVEST_FT_LUZ'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDREVEST_VS: TStringField
      FieldName = 'REVEST_VS'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDREVEST_VS_MAT: TIntegerField
      FieldName = 'REVEST_VS_MAT'
    end
    object cdsProdutoCartoFDREVEST_VS_BRIL: TStringField
      FieldName = 'REVEST_VS_BRIL'
      Size = 2
    end
    object cdsProdutoCartoFDREVEST_VS_ATRITO: TStringField
      FieldName = 'REVEST_VS_ATRITO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDREVEST_VS_LUZ: TStringField
      FieldName = 'REVEST_VS_LUZ'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDAR: TStringField
      FieldName = 'AR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDAR_COMPR: TFMTBCDField
      FieldName = 'AR_COMPR'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFDAR_LARG: TFMTBCDField
      FieldName = 'AR_LARG'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFDAR_LOCAL: TStringField
      FieldName = 'AR_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoFDBR: TStringField
      FieldName = 'BR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDBR_COMPR: TFMTBCDField
      FieldName = 'BR_COMPR'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFDBR_LARG: TFMTBCDField
      FieldName = 'BR_LARG'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFDBR_LOCAL: TStringField
      FieldName = 'BR_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoFDHS: TStringField
      FieldName = 'HS'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDHS_COMPR: TFMTBCDField
      FieldName = 'HS_COMPR'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFDHS_LARG: TFMTBCDField
      FieldName = 'HS_LARG'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFDHS_LOCAL: TStringField
      FieldName = 'HS_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoFDVISOR: TStringField
      FieldName = 'VISOR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDVISOR_COMPR: TFMTBCDField
      FieldName = 'VISOR_COMPR'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFDVISOR_LARG: TFMTBCDField
      FieldName = 'VISOR_LARG'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFDVISOR_LOCAL: TStringField
      FieldName = 'VISOR_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoFDVERNIZUV: TStringField
      FieldName = 'VERNIZUV'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDVERNIZUV_COMPR: TFMTBCDField
      FieldName = 'VERNIZUV_COMPR'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFDVERNIZUV_LARG: TFMTBCDField
      FieldName = 'VERNIZUV_LARG'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFDVERNIZUV_LOCAL: TStringField
      FieldName = 'VERNIZUV_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoFDPICOTE: TStringField
      FieldName = 'PICOTE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDPICOTE_LOCAL: TStringField
      FieldName = 'PICOTE_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoFDPICOTE_TIPO: TStringField
      FieldName = 'PICOTE_TIPO'
      Size = 2
    end
    object cdsProdutoCartoFDPASSAFITA: TStringField
      FieldName = 'PASSAFITA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDPASSAFITA_LOCAL: TStringField
      FieldName = 'PASSAFITA_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoFDPASSAFITA_TIPO: TStringField
      FieldName = 'PASSAFITA_TIPO'
      Size = 2
    end
    object cdsProdutoCartoFDILHOS: TStringField
      FieldName = 'ILHOS'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDILHOS_LOCAL: TStringField
      FieldName = 'ILHOS_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoFDALCA: TStringField
      FieldName = 'ALCA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDALCA_LOCAL: TStringField
      FieldName = 'ALCA_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoFDVERNIZUV_TOTAL: TStringField
      FieldName = 'VERNIZUV_TOTAL'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDPINCA: TStringField
      FieldName = 'PINCA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDTRAVA: TStringField
      FieldName = 'TRAVA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDDISPLAY: TStringField
      FieldName = 'DISPLAY'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoFDlkMaterial1: TStringField
      FieldKind = fkLookup
      FieldName = 'lkMaterial1'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'MATERIAL1'
      Size = 35
      Lookup = True
    end
    object cdsProdutoCartoFDlkMaterial2: TStringField
      FieldKind = fkLookup
      FieldName = 'lkMaterial2'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'MATERIAL2'
      Size = 35
      Lookup = True
    end
    object cdsProdutoCartoFDlkMaterial3: TStringField
      FieldKind = fkLookup
      FieldName = 'lkMaterial3'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'MATERIAL3'
      Size = 35
      Lookup = True
    end
    object cdsProdutoCartoFDlkRevest_vs: TStringField
      FieldKind = fkLookup
      FieldName = 'lkRevest_vs'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'REVEST_VS_MAT'
      Size = 35
      Lookup = True
    end
    object cdsProdutoCartoFDlkRevest_ft: TStringField
      FieldKind = fkLookup
      FieldName = 'lkRevest_ft'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'REVEST_FT_MAT'
      Size = 35
      Lookup = True
    end
    object cdsProdutoCartoFDPINCA_TAM: TFMTBCDField
      FieldName = 'PINCA_TAM'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoFDGRUPO1: TIntegerField
      FieldName = 'GRUPO1'
    end
    object cdsProdutoCartoFDSUBGRUPO1: TIntegerField
      FieldName = 'SUBGRUPO1'
    end
    object cdsProdutoCartoFDGRUPO2: TIntegerField
      FieldName = 'GRUPO2'
    end
    object cdsProdutoCartoFDSUBGRUPO2: TIntegerField
      FieldName = 'SUBGRUPO2'
    end
    object cdsProdutoCartoFDGRUPO3: TIntegerField
      FieldName = 'GRUPO3'
    end
    object cdsProdutoCartoFDSUBGRUPO3: TIntegerField
      FieldName = 'SUBGRUPO3'
    end
    object cdsProdutoCartoFDOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
  end
  object dsProdutoCartoFD: TDataSource
    DataSet = cdsProdutoCartoFD
    Left = 152
    Top = 128
  end
  object sdsProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.*'#13#10'FROM PRODUTO P'#13#10'LEFT JOIN PRODUTOCARTO PC ON (P.CODI' +
      'GO = PC.CODIGO)'#13#10'WHERE P.PRODMAT = '#39'P'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 24
    object sdsProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsProdutoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
    end
    object sdsProdutoCODSUBGRUPO: TIntegerField
      FieldName = 'CODSUBGRUPO'
    end
    object sdsProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object sdsProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object sdsProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 3
    end
    object sdsProdutoCODCLASFISCAL: TStringField
      FieldName = 'CODCLASFISCAL'
      Size = 12
    end
    object sdsProdutoCODSITTRIB: TIntegerField
      FieldName = 'CODSITTRIB'
    end
    object sdsProdutoLANCAGRADE: TStringField
      FieldName = 'LANCAGRADE'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCODGRADE: TIntegerField
      FieldName = 'CODGRADE'
    end
    object sdsProdutoQPARTALAO: TFloatField
      FieldName = 'QPARTALAO'
    end
    object sdsProdutoPESOLIQUIDO: TFloatField
      FieldName = 'PESOLIQUIDO'
    end
    object sdsProdutoPESOBRUTO: TFloatField
      FieldName = 'PESOBRUTO'
    end
    object sdsProdutoINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoALIQICMS: TFloatField
      FieldName = 'ALIQICMS'
    end
    object sdsProdutoALIQIPI: TFloatField
      FieldName = 'ALIQIPI'
    end
    object sdsProdutoNOMEEXP: TStringField
      FieldName = 'NOMEEXP'
      Size = 45
    end
    object sdsProdutoDESCMATERIAL: TStringField
      FieldName = 'DESCMATERIAL'
      Size = 40
    end
    object sdsProdutoREFERENCIA2: TStringField
      FieldName = 'REFERENCIA2'
    end
    object sdsProdutoVLRATELIER: TFloatField
      FieldName = 'VLRATELIER'
    end
    object sdsProdutoNOMEMODELO: TStringField
      FieldName = 'NOMEMODELO'
    end
    object sdsProdutoFOTOJPEG: TBlobField
      FieldName = 'FOTOJPEG'
      Size = 1
    end
    object sdsProdutoENDETIQ: TStringField
      FieldName = 'ENDETIQ'
      Size = 60
    end
    object sdsProdutoLANCACOR: TStringField
      FieldName = 'LANCACOR'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoPRECOGRADE: TStringField
      FieldName = 'PRECOGRADE'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoVLRVENDA: TFloatField
      FieldName = 'VLRVENDA'
    end
    object sdsProdutoPRODMAT: TStringField
      FieldName = 'PRODMAT'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoPRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
    end
    object sdsProdutoPOSSEMAT: TStringField
      FieldName = 'POSSEMAT'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoESTOQUE: TStringField
      FieldName = 'ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoDTALTERACAO: TDateField
      FieldName = 'DTALTERACAO'
    end
    object sdsProdutoMATERIALOUTROS: TStringField
      FieldName = 'MATERIALOUTROS'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoPRECOCOR: TStringField
      FieldName = 'PRECOCOR'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
    end
    object sdsProdutoESTMINIMO: TFloatField
      FieldName = 'ESTMINIMO'
    end
    object sdsProdutoESTMAXIMO: TFloatField
      FieldName = 'ESTMAXIMO'
    end
    object sdsProdutoPERCCOMISSAOVEND: TFloatField
      FieldName = 'PERCCOMISSAOVEND'
    end
    object sdsProdutoIMPTABPRECO: TStringField
      FieldName = 'IMPTABPRECO'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object sdsProdutoDTCAD: TDateField
      FieldName = 'DTCAD'
    end
    object sdsProdutoHRCAD: TTimeField
      FieldName = 'HRCAD'
    end
    object sdsProdutoCA: TStringField
      FieldName = 'CA'
    end
    object sdsProdutoVINCULARPRODUTO: TStringField
      FieldName = 'VINCULARPRODUTO'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCODPRODUTOEST: TIntegerField
      FieldName = 'CODPRODUTOEST'
    end
    object sdsProdutoPERCQUEBRATALOES: TFloatField
      FieldName = 'PERCQUEBRATALOES'
    end
    object sdsProdutoPERCCOMISSAOVEND2: TFloatField
      FieldName = 'PERCCOMISSAOVEND2'
    end
    object sdsProdutoFICHATECNICACONSPORTAM: TStringField
      FieldName = 'FICHATECNICACONSPORTAM'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoJUNTARLARGURAEDI: TStringField
      FieldName = 'JUNTARLARGURAEDI'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoIMPMATTALAO: TStringField
      FieldName = 'IMPMATTALAO'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 200
    end
    object sdsProdutoCODTIPOPRODUTO: TIntegerField
      FieldName = 'CODTIPOPRODUTO'
    end
    object sdsProdutoCODTIPOMATERIAL: TIntegerField
      FieldName = 'CODTIPOMATERIAL'
    end
    object sdsProdutoQTDVOLUME: TIntegerField
      FieldName = 'QTDVOLUME'
    end
    object sdsProdutoCODPROCESSO: TIntegerField
      FieldName = 'CODPROCESSO'
    end
    object sdsProdutoCODCSTIPI: TStringField
      FieldName = 'CODCSTIPI'
      FixedChar = True
      Size = 2
    end
    object sdsProdutoTAMCALCULO: TFloatField
      FieldName = 'TAMCALCULO'
    end
    object sdsProdutoORIGEMPROD: TStringField
      FieldName = 'ORIGEMPROD'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoLOCALCORREDOR: TStringField
      FieldName = 'LOCALCORREDOR'
      Size = 10
    end
    object sdsProdutoLOCALPOSICAO: TStringField
      FieldName = 'LOCALPOSICAO'
      Size = 25
    end
    object sdsProdutoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sdsProdutoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    OnUpdateError = dspProdutoUpdateError
    Left = 88
    Top = 24
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Codigo'
    Params = <>
    ProviderName = 'dspProduto'
    Left = 120
    Top = 24
    object cdsProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsProdutoCODGRUPO: TIntegerField
      FieldName = 'CODGRUPO'
    end
    object cdsProdutoCODSUBGRUPO: TIntegerField
      FieldName = 'CODSUBGRUPO'
    end
    object cdsProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 3
    end
    object cdsProdutoCODCLASFISCAL: TStringField
      FieldName = 'CODCLASFISCAL'
      Size = 12
    end
    object cdsProdutoCODSITTRIB: TIntegerField
      FieldName = 'CODSITTRIB'
    end
    object cdsProdutoLANCAGRADE: TStringField
      FieldName = 'LANCAGRADE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCODGRADE: TIntegerField
      FieldName = 'CODGRADE'
    end
    object cdsProdutoQPARTALAO: TFloatField
      FieldName = 'QPARTALAO'
    end
    object cdsProdutoPESOLIQUIDO: TFloatField
      FieldName = 'PESOLIQUIDO'
    end
    object cdsProdutoPESOBRUTO: TFloatField
      FieldName = 'PESOBRUTO'
    end
    object cdsProdutoINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoALIQICMS: TFloatField
      FieldName = 'ALIQICMS'
    end
    object cdsProdutoALIQIPI: TFloatField
      FieldName = 'ALIQIPI'
    end
    object cdsProdutoNOMEEXP: TStringField
      FieldName = 'NOMEEXP'
      Size = 45
    end
    object cdsProdutoDESCMATERIAL: TStringField
      FieldName = 'DESCMATERIAL'
      Size = 40
    end
    object cdsProdutoREFERENCIA2: TStringField
      FieldName = 'REFERENCIA2'
    end
    object cdsProdutoVLRATELIER: TFloatField
      FieldName = 'VLRATELIER'
    end
    object cdsProdutoNOMEMODELO: TStringField
      FieldName = 'NOMEMODELO'
    end
    object cdsProdutoFOTOJPEG: TBlobField
      FieldName = 'FOTOJPEG'
      Size = 1
    end
    object cdsProdutoENDETIQ: TStringField
      FieldName = 'ENDETIQ'
      Size = 60
    end
    object cdsProdutoLANCACOR: TStringField
      FieldName = 'LANCACOR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoPRECOGRADE: TStringField
      FieldName = 'PRECOGRADE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoVLRVENDA: TFloatField
      FieldName = 'VLRVENDA'
    end
    object cdsProdutoPRODMAT: TStringField
      FieldName = 'PRODMAT'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoPRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
    end
    object cdsProdutoPOSSEMAT: TStringField
      FieldName = 'POSSEMAT'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoESTOQUE: TStringField
      FieldName = 'ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoDTALTERACAO: TDateField
      FieldName = 'DTALTERACAO'
    end
    object cdsProdutoMATERIALOUTROS: TStringField
      FieldName = 'MATERIALOUTROS'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoPRECOCOR: TStringField
      FieldName = 'PRECOCOR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCODFORNECEDOR: TIntegerField
      FieldName = 'CODFORNECEDOR'
    end
    object cdsProdutoESTMINIMO: TFloatField
      FieldName = 'ESTMINIMO'
    end
    object cdsProdutoESTMAXIMO: TFloatField
      FieldName = 'ESTMAXIMO'
    end
    object cdsProdutoPERCCOMISSAOVEND: TFloatField
      FieldName = 'PERCCOMISSAOVEND'
    end
    object cdsProdutoIMPTABPRECO: TStringField
      FieldName = 'IMPTABPRECO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsProdutoDTCAD: TDateField
      FieldName = 'DTCAD'
    end
    object cdsProdutoHRCAD: TTimeField
      FieldName = 'HRCAD'
    end
    object cdsProdutoCA: TStringField
      FieldName = 'CA'
    end
    object cdsProdutoVINCULARPRODUTO: TStringField
      FieldName = 'VINCULARPRODUTO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCODPRODUTOEST: TIntegerField
      FieldName = 'CODPRODUTOEST'
    end
    object cdsProdutoPERCQUEBRATALOES: TFloatField
      FieldName = 'PERCQUEBRATALOES'
    end
    object cdsProdutoPERCCOMISSAOVEND2: TFloatField
      FieldName = 'PERCCOMISSAOVEND2'
    end
    object cdsProdutoFICHATECNICACONSPORTAM: TStringField
      FieldName = 'FICHATECNICACONSPORTAM'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoJUNTARLARGURAEDI: TStringField
      FieldName = 'JUNTARLARGURAEDI'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoIMPMATTALAO: TStringField
      FieldName = 'IMPMATTALAO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 200
    end
    object cdsProdutoCODTIPOPRODUTO: TIntegerField
      FieldName = 'CODTIPOPRODUTO'
    end
    object cdsProdutoCODTIPOMATERIAL: TIntegerField
      FieldName = 'CODTIPOMATERIAL'
    end
    object cdsProdutoQTDVOLUME: TIntegerField
      FieldName = 'QTDVOLUME'
    end
    object cdsProdutoCODPROCESSO: TIntegerField
      FieldName = 'CODPROCESSO'
    end
    object cdsProdutoCODCSTIPI: TStringField
      FieldName = 'CODCSTIPI'
      FixedChar = True
      Size = 2
    end
    object cdsProdutoTAMCALCULO: TFloatField
      FieldName = 'TAMCALCULO'
    end
    object cdsProdutoORIGEMPROD: TStringField
      FieldName = 'ORIGEMPROD'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoLOCALCORREDOR: TStringField
      FieldName = 'LOCALCORREDOR'
      Size = 10
    end
    object cdsProdutoLOCALPOSICAO: TStringField
      FieldName = 'LOCALPOSICAO'
      Size = 25
    end
    object cdsProdutoOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsProdutoCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object cdsProdutosdsProdutoCarto: TDataSetField
      FieldName = 'sdsProdutoCarto'
    end
    object cdsProdutosdsProdutoCartoFD: TDataSetField
      FieldName = 'sdsProdutoCartoFD'
    end
    object cdsProdutosdsProdutoCartoTP: TDataSetField
      FieldName = 'sdsProdutoCartoTP'
    end
    object cdsProdutosdsProdutoCartoSP: TDataSetField
      FieldName = 'sdsProdutoCartoSP'
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 152
    Top = 24
  end
  object dsProdutoMaster: TDataSource
    DataSet = sdsProduto
    Left = 224
    Top = 24
  end
  object sdsProdutoCartoTP: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM PRODUTOCARTO_TP'#13#10'WHERE CODIGO = :CODIGO'
    DataSource = dsProdutoMaster
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 176
    object sdsProdutoCartoTPCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsProdutoCartoTPMATERIAL1: TIntegerField
      FieldName = 'MATERIAL1'
    end
    object sdsProdutoCartoTPMATERIAL2: TIntegerField
      FieldName = 'MATERIAL2'
    end
    object sdsProdutoCartoTPMATERIAL3: TIntegerField
      FieldName = 'MATERIAL3'
    end
    object sdsProdutoCartoTPFECHAMENTO: TStringField
      FieldName = 'FECHAMENTO'
      Size = 2
    end
    object sdsProdutoCartoTPREVEST_FT: TStringField
      FieldName = 'REVEST_FT'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPREVEST_FT_MAT: TIntegerField
      FieldName = 'REVEST_FT_MAT'
    end
    object sdsProdutoCartoTPREVEST_FT_BRIL: TStringField
      FieldName = 'REVEST_FT_BRIL'
      Size = 2
    end
    object sdsProdutoCartoTPREVEST_FT_ATRITO: TStringField
      FieldName = 'REVEST_FT_ATRITO'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPREVEST_FT_LUZ: TStringField
      FieldName = 'REVEST_FT_LUZ'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPREVEST_VS: TStringField
      FieldName = 'REVEST_VS'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPREVEST_VS_MAT: TIntegerField
      FieldName = 'REVEST_VS_MAT'
    end
    object sdsProdutoCartoTPREVEST_VS_BRIL: TStringField
      FieldName = 'REVEST_VS_BRIL'
      Size = 2
    end
    object sdsProdutoCartoTPREVEST_VS_ATRITO: TStringField
      FieldName = 'REVEST_VS_ATRITO'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPREVEST_VS_LUZ: TStringField
      FieldName = 'REVEST_VS_LUZ'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPAR: TStringField
      FieldName = 'AR'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPAR_COMPR: TFMTBCDField
      FieldName = 'AR_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTPAR_LARG: TFMTBCDField
      FieldName = 'AR_LARG'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTPAR_LOCAL: TStringField
      FieldName = 'AR_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoTPBR: TStringField
      FieldName = 'BR'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPBR_COMPR: TFMTBCDField
      FieldName = 'BR_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTPBR_LARG: TFMTBCDField
      FieldName = 'BR_LARG'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTPBR_LOCAL: TStringField
      FieldName = 'BR_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoTPHS: TStringField
      FieldName = 'HS'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPHS_COMPR: TFMTBCDField
      FieldName = 'HS_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTPHS_LARG: TFMTBCDField
      FieldName = 'HS_LARG'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTPHS_LOCAL: TStringField
      FieldName = 'HS_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoTPVISOR: TStringField
      FieldName = 'VISOR'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPVISOR_COMPR: TFMTBCDField
      FieldName = 'VISOR_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTPVISOR_LARG: TFMTBCDField
      FieldName = 'VISOR_LARG'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTPVISOR_LOCAL: TStringField
      FieldName = 'VISOR_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoTPVERNIZUV: TStringField
      FieldName = 'VERNIZUV'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPVERNIZUV_COMPR: TFMTBCDField
      FieldName = 'VERNIZUV_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTPVERNIZUV_LARG: TFMTBCDField
      FieldName = 'VERNIZUV_LARG'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTPVERNIZUV_LOCAL: TStringField
      FieldName = 'VERNIZUV_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoTPPICOTE: TStringField
      FieldName = 'PICOTE'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPPICOTE_LOCAL: TStringField
      FieldName = 'PICOTE_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoTPPICOTE_TIPO: TStringField
      FieldName = 'PICOTE_TIPO'
      Size = 2
    end
    object sdsProdutoCartoTPPASSAFITA: TStringField
      FieldName = 'PASSAFITA'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPPASSAFITA_LOCAL: TStringField
      FieldName = 'PASSAFITA_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoTPPASSAFITA_TIPO: TStringField
      FieldName = 'PASSAFITA_TIPO'
      Size = 2
    end
    object sdsProdutoCartoTPILHOS: TStringField
      FieldName = 'ILHOS'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPILHOS_LOCAL: TStringField
      FieldName = 'ILHOS_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoTPALCA: TStringField
      FieldName = 'ALCA'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPALCA_LOCAL: TStringField
      FieldName = 'ALCA_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoTPVERNIZUV_TOTAL: TStringField
      FieldName = 'VERNIZUV_TOTAL'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPPINCA: TStringField
      FieldName = 'PINCA'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoTPPINCA_TAM: TFMTBCDField
      FieldName = 'PINCA_TAM'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoTPGRUPO1: TIntegerField
      FieldName = 'GRUPO1'
    end
    object sdsProdutoCartoTPSUBGRUPO1: TIntegerField
      FieldName = 'SUBGRUPO1'
    end
    object sdsProdutoCartoTPGRUPO2: TIntegerField
      FieldName = 'GRUPO2'
    end
    object sdsProdutoCartoTPSUBGRUPO2: TIntegerField
      FieldName = 'SUBGRUPO2'
    end
    object sdsProdutoCartoTPGRUPO3: TIntegerField
      FieldName = 'GRUPO3'
    end
    object sdsProdutoCartoTPSUBGRUPO3: TIntegerField
      FieldName = 'SUBGRUPO3'
    end
    object sdsProdutoCartoTPOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
  end
  object cdsProdutoCartoTP: TClientDataSet
    Aggregates = <>
    DataSetField = cdsProdutosdsProdutoCartoTP
    Params = <>
    Left = 120
    Top = 176
    object cdsProdutoCartoTPCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsProdutoCartoTPMATERIAL1: TIntegerField
      FieldName = 'MATERIAL1'
    end
    object cdsProdutoCartoTPMATERIAL2: TIntegerField
      FieldName = 'MATERIAL2'
    end
    object cdsProdutoCartoTPMATERIAL3: TIntegerField
      FieldName = 'MATERIAL3'
    end
    object cdsProdutoCartoTPFECHAMENTO: TStringField
      FieldName = 'FECHAMENTO'
      Size = 2
    end
    object cdsProdutoCartoTPREVEST_FT: TStringField
      FieldName = 'REVEST_FT'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoTPREVEST_FT_MAT: TIntegerField
      FieldName = 'REVEST_FT_MAT'
    end
    object cdsProdutoCartoTPREVEST_FT_BRIL: TStringField
      FieldName = 'REVEST_FT_BRIL'
      Size = 2
    end
    object cdsProdutoCartoTPREVEST_FT_ATRITO: TStringField
      FieldName = 'REVEST_FT_ATRITO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoTPREVEST_FT_LUZ: TStringField
      FieldName = 'REVEST_FT_LUZ'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoTPREVEST_VS: TStringField
      FieldName = 'REVEST_VS'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoTPREVEST_VS_MAT: TIntegerField
      FieldName = 'REVEST_VS_MAT'
    end
    object cdsProdutoCartoTPREVEST_VS_BRIL: TStringField
      FieldName = 'REVEST_VS_BRIL'
      Size = 2
    end
    object cdsProdutoCartoTPREVEST_VS_ATRITO: TStringField
      FieldName = 'REVEST_VS_ATRITO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoTPREVEST_VS_LUZ: TStringField
      FieldName = 'REVEST_VS_LUZ'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoTPAR: TStringField
      FieldName = 'AR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoTPAR_COMPR: TFMTBCDField
      FieldName = 'AR_COMPR'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTPAR_LARG: TFMTBCDField
      FieldName = 'AR_LARG'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTPAR_LOCAL: TStringField
      FieldName = 'AR_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoTPBR: TStringField
      FieldName = 'BR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoTPBR_COMPR: TFMTBCDField
      FieldName = 'BR_COMPR'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTPBR_LARG: TFMTBCDField
      FieldName = 'BR_LARG'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTPBR_LOCAL: TStringField
      FieldName = 'BR_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoTPHS: TStringField
      FieldName = 'HS'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoTPHS_COMPR: TFMTBCDField
      FieldName = 'HS_COMPR'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTPHS_LARG: TFMTBCDField
      FieldName = 'HS_LARG'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTPHS_LOCAL: TStringField
      FieldName = 'HS_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoTPVISOR: TStringField
      FieldName = 'VISOR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoTPVISOR_COMPR: TFMTBCDField
      FieldName = 'VISOR_COMPR'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTPVISOR_LARG: TFMTBCDField
      FieldName = 'VISOR_LARG'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTPVISOR_LOCAL: TStringField
      FieldName = 'VISOR_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoTPVERNIZUV: TStringField
      FieldName = 'VERNIZUV'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoTPVERNIZUV_COMPR: TFMTBCDField
      FieldName = 'VERNIZUV_COMPR'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTPVERNIZUV_LARG: TFMTBCDField
      FieldName = 'VERNIZUV_LARG'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTPVERNIZUV_LOCAL: TStringField
      FieldName = 'VERNIZUV_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoTPPICOTE: TStringField
      FieldName = 'PICOTE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoTPPICOTE_LOCAL: TStringField
      FieldName = 'PICOTE_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoTPPICOTE_TIPO: TStringField
      FieldName = 'PICOTE_TIPO'
      Size = 2
    end
    object cdsProdutoCartoTPPASSAFITA: TStringField
      FieldName = 'PASSAFITA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoTPPASSAFITA_LOCAL: TStringField
      FieldName = 'PASSAFITA_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoTPPASSAFITA_TIPO: TStringField
      FieldName = 'PASSAFITA_TIPO'
      Size = 2
    end
    object cdsProdutoCartoTPILHOS: TStringField
      FieldName = 'ILHOS'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoTPILHOS_LOCAL: TStringField
      FieldName = 'ILHOS_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoTPALCA: TStringField
      FieldName = 'ALCA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoTPALCA_LOCAL: TStringField
      FieldName = 'ALCA_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoTPVERNIZUV_TOTAL: TStringField
      FieldName = 'VERNIZUV_TOTAL'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoTPPINCA: TStringField
      FieldName = 'PINCA'
      FixedChar = True
      Size = 1
    end
    object StringField69: TStringField
      FieldKind = fkLookup
      FieldName = 'lkMaterial1'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'MATERIAL1'
      Size = 35
      Lookup = True
    end
    object StringField70: TStringField
      FieldKind = fkLookup
      FieldName = 'lkMaterial2'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'MATERIAL2'
      Size = 35
      Lookup = True
    end
    object StringField71: TStringField
      FieldKind = fkLookup
      FieldName = 'lkMaterial3'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'MATERIAL3'
      Size = 35
      Lookup = True
    end
    object StringField72: TStringField
      FieldKind = fkLookup
      FieldName = 'lkRevest_vs'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'REVEST_VS_MAT'
      Size = 35
      Lookup = True
    end
    object StringField73: TStringField
      FieldKind = fkLookup
      FieldName = 'lkRevest_ft'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'REVEST_FT_MAT'
      Size = 35
      Lookup = True
    end
    object cdsProdutoCartoTPPINCA_TAM: TFMTBCDField
      FieldName = 'PINCA_TAM'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoTPGRUPO1: TIntegerField
      FieldName = 'GRUPO1'
    end
    object cdsProdutoCartoTPSUBGRUPO1: TIntegerField
      FieldName = 'SUBGRUPO1'
    end
    object cdsProdutoCartoTPGRUPO2: TIntegerField
      FieldName = 'GRUPO2'
    end
    object cdsProdutoCartoTPSUBGRUPO2: TIntegerField
      FieldName = 'SUBGRUPO2'
    end
    object cdsProdutoCartoTPGRUPO3: TIntegerField
      FieldName = 'GRUPO3'
    end
    object cdsProdutoCartoTPSUBGRUPO3: TIntegerField
      FieldName = 'SUBGRUPO3'
    end
    object cdsProdutoCartoTPOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
  end
  object dsProdutoCartoTP: TDataSource
    DataSet = cdsProdutoCartoTP
    Left = 152
    Top = 176
  end
  object sdsProdutoCartoSP: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM PRODUTOCARTO_SP'#13#10'WHERE CODIGO = :CODIGO'
    DataSource = dsProdutoMaster
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 232
    object sdsProdutoCartoSPCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsProdutoCartoSPMATERIAL1: TIntegerField
      FieldName = 'MATERIAL1'
    end
    object sdsProdutoCartoSPMATERIAL2: TIntegerField
      FieldName = 'MATERIAL2'
    end
    object sdsProdutoCartoSPMATERIAL3: TIntegerField
      FieldName = 'MATERIAL3'
    end
    object sdsProdutoCartoSPFECHAMENTO: TStringField
      FieldName = 'FECHAMENTO'
      Size = 2
    end
    object sdsProdutoCartoSPREVEST_FT: TStringField
      FieldName = 'REVEST_FT'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPREVEST_FT_MAT: TIntegerField
      FieldName = 'REVEST_FT_MAT'
    end
    object sdsProdutoCartoSPREVEST_FT_BRIL: TStringField
      FieldName = 'REVEST_FT_BRIL'
      Size = 2
    end
    object sdsProdutoCartoSPREVEST_FT_ATRITO: TStringField
      FieldName = 'REVEST_FT_ATRITO'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPREVEST_FT_LUZ: TStringField
      FieldName = 'REVEST_FT_LUZ'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPREVEST_VS: TStringField
      FieldName = 'REVEST_VS'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPREVEST_VS_MAT: TIntegerField
      FieldName = 'REVEST_VS_MAT'
    end
    object sdsProdutoCartoSPREVEST_VS_BRIL: TStringField
      FieldName = 'REVEST_VS_BRIL'
      Size = 2
    end
    object sdsProdutoCartoSPREVEST_VS_ATRITO: TStringField
      FieldName = 'REVEST_VS_ATRITO'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPREVEST_VS_LUZ: TStringField
      FieldName = 'REVEST_VS_LUZ'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPAR: TStringField
      FieldName = 'AR'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPAR_COMPR: TFMTBCDField
      FieldName = 'AR_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSPAR_LARG: TFMTBCDField
      FieldName = 'AR_LARG'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSPAR_LOCAL: TStringField
      FieldName = 'AR_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoSPBR: TStringField
      FieldName = 'BR'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPBR_COMPR: TFMTBCDField
      FieldName = 'BR_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSPBR_LARG: TFMTBCDField
      FieldName = 'BR_LARG'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSPBR_LOCAL: TStringField
      FieldName = 'BR_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoSPHS: TStringField
      FieldName = 'HS'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPHS_COMPR: TFMTBCDField
      FieldName = 'HS_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSPHS_LARG: TFMTBCDField
      FieldName = 'HS_LARG'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSPHS_LOCAL: TStringField
      FieldName = 'HS_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoSPVISOR: TStringField
      FieldName = 'VISOR'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPVISOR_COMPR: TFMTBCDField
      FieldName = 'VISOR_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSPVISOR_LARG: TFMTBCDField
      FieldName = 'VISOR_LARG'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSPVISOR_LOCAL: TStringField
      FieldName = 'VISOR_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoSPVERNIZUV: TStringField
      FieldName = 'VERNIZUV'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPVERNIZUV_COMPR: TFMTBCDField
      FieldName = 'VERNIZUV_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSPVERNIZUV_LARG: TFMTBCDField
      FieldName = 'VERNIZUV_LARG'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSPVERNIZUV_LOCAL: TStringField
      FieldName = 'VERNIZUV_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoSPPICOTE: TStringField
      FieldName = 'PICOTE'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPPICOTE_LOCAL: TStringField
      FieldName = 'PICOTE_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoSPPICOTE_TIPO: TStringField
      FieldName = 'PICOTE_TIPO'
      Size = 2
    end
    object sdsProdutoCartoSPPASSAFITA: TStringField
      FieldName = 'PASSAFITA'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPPASSAFITA_LOCAL: TStringField
      FieldName = 'PASSAFITA_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoSPPASSAFITA_TIPO: TStringField
      FieldName = 'PASSAFITA_TIPO'
      Size = 2
    end
    object sdsProdutoCartoSPILHOS: TStringField
      FieldName = 'ILHOS'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPILHOS_LOCAL: TStringField
      FieldName = 'ILHOS_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoSPALCA: TStringField
      FieldName = 'ALCA'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPALCA_LOCAL: TStringField
      FieldName = 'ALCA_LOCAL'
      Size = 2
    end
    object sdsProdutoCartoSPVERNIZUV_TOTAL: TStringField
      FieldName = 'VERNIZUV_TOTAL'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPPINCA: TStringField
      FieldName = 'PINCA'
      FixedChar = True
      Size = 1
    end
    object sdsProdutoCartoSPPINCA_TAM: TFMTBCDField
      FieldName = 'PINCA_TAM'
      Precision = 15
      Size = 2
    end
    object sdsProdutoCartoSPGRUPO1: TIntegerField
      FieldName = 'GRUPO1'
    end
    object sdsProdutoCartoSPSUBGRUPO1: TIntegerField
      FieldName = 'SUBGRUPO1'
    end
    object sdsProdutoCartoSPGRUPO2: TIntegerField
      FieldName = 'GRUPO2'
    end
    object sdsProdutoCartoSPSUBGRUPO2: TIntegerField
      FieldName = 'SUBGRUPO2'
    end
    object sdsProdutoCartoSPGRUPO3: TIntegerField
      FieldName = 'GRUPO3'
    end
    object sdsProdutoCartoSPSUBGRUPO3: TIntegerField
      FieldName = 'SUBGRUPO3'
    end
    object sdsProdutoCartoSPOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
  end
  object cdsProdutoCartoSP: TClientDataSet
    Aggregates = <>
    DataSetField = cdsProdutosdsProdutoCartoSP
    Params = <>
    Left = 120
    Top = 232
    object cdsProdutoCartoSPCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsProdutoCartoSPMATERIAL1: TIntegerField
      FieldName = 'MATERIAL1'
    end
    object cdsProdutoCartoSPMATERIAL2: TIntegerField
      FieldName = 'MATERIAL2'
    end
    object cdsProdutoCartoSPMATERIAL3: TIntegerField
      FieldName = 'MATERIAL3'
    end
    object cdsProdutoCartoSPFECHAMENTO: TStringField
      FieldName = 'FECHAMENTO'
      Size = 2
    end
    object cdsProdutoCartoSPREVEST_FT: TStringField
      FieldName = 'REVEST_FT'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPREVEST_FT_MAT: TIntegerField
      FieldName = 'REVEST_FT_MAT'
    end
    object cdsProdutoCartoSPREVEST_FT_BRIL: TStringField
      FieldName = 'REVEST_FT_BRIL'
      Size = 2
    end
    object cdsProdutoCartoSPREVEST_FT_ATRITO: TStringField
      FieldName = 'REVEST_FT_ATRITO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPREVEST_FT_LUZ: TStringField
      FieldName = 'REVEST_FT_LUZ'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPlkMaterial1: TStringField
      FieldKind = fkLookup
      FieldName = 'lkMaterial1'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'MATERIAL1'
      Size = 35
      Lookup = True
    end
    object cdsProdutoCartoSPlkMaterial2: TStringField
      FieldKind = fkLookup
      FieldName = 'lkMaterial2'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'MATERIAL2'
      Size = 35
      Lookup = True
    end
    object cdsProdutoCartoSPlkMaterial3: TStringField
      FieldKind = fkLookup
      FieldName = 'lkMaterial3'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'MATERIAL3'
      Size = 35
      Lookup = True
    end
    object cdsProdutoCartoSPlkRevest_vs: TStringField
      FieldKind = fkLookup
      FieldName = 'lkRevest_vs'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'REVEST_VS_MAT'
      Size = 35
      Lookup = True
    end
    object cdsProdutoCartoSPlkRevest_ft: TStringField
      FieldKind = fkLookup
      FieldName = 'lkRevest_ft'
      LookupDataSet = DM1.tProduto2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'REVEST_FT_MAT'
      Size = 35
      Lookup = True
    end
    object cdsProdutoCartoSPREVEST_VS: TStringField
      FieldName = 'REVEST_VS'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPREVEST_VS_MAT: TIntegerField
      FieldName = 'REVEST_VS_MAT'
    end
    object cdsProdutoCartoSPREVEST_VS_BRIL: TStringField
      FieldName = 'REVEST_VS_BRIL'
      Size = 2
    end
    object cdsProdutoCartoSPREVEST_VS_ATRITO: TStringField
      FieldName = 'REVEST_VS_ATRITO'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPREVEST_VS_LUZ: TStringField
      FieldName = 'REVEST_VS_LUZ'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPAR: TStringField
      FieldName = 'AR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPAR_COMPR: TFMTBCDField
      FieldName = 'AR_COMPR'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSPAR_LARG: TFMTBCDField
      FieldName = 'AR_LARG'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSPAR_LOCAL: TStringField
      FieldName = 'AR_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoSPBR: TStringField
      FieldName = 'BR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPBR_COMPR: TFMTBCDField
      FieldName = 'BR_COMPR'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSPBR_LARG: TFMTBCDField
      FieldName = 'BR_LARG'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSPBR_LOCAL: TStringField
      FieldName = 'BR_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoSPHS: TStringField
      FieldName = 'HS'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPHS_COMPR: TFMTBCDField
      FieldName = 'HS_COMPR'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSPHS_LARG: TFMTBCDField
      FieldName = 'HS_LARG'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSPHS_LOCAL: TStringField
      FieldName = 'HS_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoSPVISOR: TStringField
      FieldName = 'VISOR'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPVISOR_COMPR: TFMTBCDField
      FieldName = 'VISOR_COMPR'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSPVISOR_LARG: TFMTBCDField
      FieldName = 'VISOR_LARG'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSPVISOR_LOCAL: TStringField
      FieldName = 'VISOR_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoSPVERNIZUV: TStringField
      FieldName = 'VERNIZUV'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPVERNIZUV_COMPR: TFMTBCDField
      FieldName = 'VERNIZUV_COMPR'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSPVERNIZUV_LARG: TFMTBCDField
      FieldName = 'VERNIZUV_LARG'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSPVERNIZUV_LOCAL: TStringField
      FieldName = 'VERNIZUV_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoSPPICOTE: TStringField
      FieldName = 'PICOTE'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPPICOTE_LOCAL: TStringField
      FieldName = 'PICOTE_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoSPPICOTE_TIPO: TStringField
      FieldName = 'PICOTE_TIPO'
      Size = 2
    end
    object cdsProdutoCartoSPPASSAFITA: TStringField
      FieldName = 'PASSAFITA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPPASSAFITA_LOCAL: TStringField
      FieldName = 'PASSAFITA_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoSPPASSAFITA_TIPO: TStringField
      FieldName = 'PASSAFITA_TIPO'
      Size = 2
    end
    object cdsProdutoCartoSPILHOS: TStringField
      FieldName = 'ILHOS'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPILHOS_LOCAL: TStringField
      FieldName = 'ILHOS_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoSPALCA: TStringField
      FieldName = 'ALCA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPALCA_LOCAL: TStringField
      FieldName = 'ALCA_LOCAL'
      Size = 2
    end
    object cdsProdutoCartoSPVERNIZUV_TOTAL: TStringField
      FieldName = 'VERNIZUV_TOTAL'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPPINCA: TStringField
      FieldName = 'PINCA'
      FixedChar = True
      Size = 1
    end
    object cdsProdutoCartoSPPINCA_TAM: TFMTBCDField
      FieldName = 'PINCA_TAM'
      Precision = 15
      Size = 2
    end
    object cdsProdutoCartoSPGRUPO1: TIntegerField
      FieldName = 'GRUPO1'
    end
    object cdsProdutoCartoSPSUBGRUPO1: TIntegerField
      FieldName = 'SUBGRUPO1'
    end
    object cdsProdutoCartoSPGRUPO2: TIntegerField
      FieldName = 'GRUPO2'
    end
    object cdsProdutoCartoSPSUBGRUPO2: TIntegerField
      FieldName = 'SUBGRUPO2'
    end
    object cdsProdutoCartoSPGRUPO3: TIntegerField
      FieldName = 'GRUPO3'
    end
    object cdsProdutoCartoSPSUBGRUPO3: TIntegerField
      FieldName = 'SUBGRUPO3'
    end
    object cdsProdutoCartoSPOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
  end
  object dsProdutoCartoSP: TDataSource
    DataSet = cdsProdutoCartoSP
    Left = 152
    Top = 232
  end
end
