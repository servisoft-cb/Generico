object dmCadCor: TdmCadCor
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 342
  Top = 314
  Height = 270
  Width = 384
  object sdsCor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM COR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 24
    object sdsCorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsCorNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object sdsCorPANTONE: TStringField
      FieldName = 'PANTONE'
      Size = 15
    end
  end
  object dspCor: TDataSetProvider
    DataSet = sdsCor
    Left = 136
    Top = 24
  end
  object cdsCor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCor'
    Left = 224
    Top = 24
    object cdsCorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsCorNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsCorPANTONE: TStringField
      FieldName = 'PANTONE'
      Size = 15
    end
  end
  object dsCor: TDataSource
    DataSet = cdsCor
    Left = 304
    Top = 24
  end
end
