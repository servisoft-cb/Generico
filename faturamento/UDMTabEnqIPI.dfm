object DMTabEnqIPI: TDMTabEnqIPI
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 337
  Top = 197
  Height = 379
  Width = 544
  object sdsEnqIPI: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM TAB_ENQIPI'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 80
    Top = 40
    object sdsEnqIPIID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsEnqIPICODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object sdsEnqIPITIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object sdsEnqIPIDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
  end
  object dspEnqIPI: TDataSetProvider
    DataSet = sdsEnqIPI
    OnUpdateError = dspEnqIPIUpdateError
    Left = 160
    Top = 40
  end
  object cdsEnqIPI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEnqIPI'
    Left = 248
    Top = 40
    object cdsEnqIPIID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsEnqIPICODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object cdsEnqIPITIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsEnqIPIDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
  end
  object dsEnqIPI: TDataSource
    DataSet = cdsEnqIPI
    Left = 336
    Top = 40
  end
end
