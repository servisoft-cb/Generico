object DMVendedorMeta: TDMVendedorMeta
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 242
  Top = 215
  Height = 310
  Width = 544
  object sdsVendedor_Meta: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT VM.*, V.NOME NOMEVENDEDOR, CL.NOME NOMEMARCA'#13#10'FROM VENDED' +
      'OR_META VM'#13#10'INNER JOIN VENDEDOR V'#13#10'ON VM.CODIGO = V.CODIGO'#13#10'INNE' +
      'R JOIN CLIENTE CL'#13#10'ON VM.CODMARCA = CL.CODIGO'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 136
    Top = 40
    object sdsVendedor_MetaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsVendedor_MetaCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
      Required = True
    end
    object sdsVendedor_MetaMETA_QTD: TIntegerField
      FieldName = 'META_QTD'
    end
    object sdsVendedor_MetaNOMEVENDEDOR: TStringField
      FieldName = 'NOMEVENDEDOR'
      ProviderFlags = []
      Size = 40
    end
    object sdsVendedor_MetaNOMEMARCA: TStringField
      FieldName = 'NOMEMARCA'
      ProviderFlags = []
      Size = 60
    end
  end
  object dspVendedor_Meta: TDataSetProvider
    DataSet = sdsVendedor_Meta
    OnUpdateError = dspVendedor_MetaUpdateError
    Left = 216
    Top = 40
  end
  object cdsVendedor_Meta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendedor_Meta'
    Left = 304
    Top = 40
    object cdsVendedor_MetaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsVendedor_MetaCODMARCA: TIntegerField
      FieldName = 'CODMARCA'
      Required = True
    end
    object cdsVendedor_MetaMETA_QTD: TIntegerField
      FieldName = 'META_QTD'
    end
    object cdsVendedor_MetaNOMEVENDEDOR: TStringField
      FieldName = 'NOMEVENDEDOR'
      ProviderFlags = []
      Size = 40
    end
    object cdsVendedor_MetaNOMEMARCA: TStringField
      FieldName = 'NOMEMARCA'
      ProviderFlags = []
      Size = 60
    end
  end
  object dsVendedor_Meta: TDataSource
    DataSet = cdsVendedor_Meta
    Left = 392
    Top = 40
  end
end
