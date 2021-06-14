object DMSitTrib_CF: TDMSitTrib_CF
  OldCreateOrder = False
  Left = 212
  Top = 169
  Height = 380
  Width = 516
  object sdsSitTrib_CF: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM SITTRIB_CF'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 96
    Top = 48
    object sdsSitTrib_CFID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsSitTrib_CFPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object sdsSitTrib_CFCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 5
    end
  end
  object dspSitTrib_CF: TDataSetProvider
    DataSet = sdsSitTrib_CF
    OnUpdateError = dspSitTrib_CFUpdateError
    Left = 216
    Top = 48
  end
  object cdsSitTrib_CF: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODIGO'
    Params = <>
    ProviderName = 'dspSitTrib_CF'
    Left = 312
    Top = 48
    object cdsSitTrib_CFID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSitTrib_CFPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object cdsSitTrib_CFCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 5
    end
  end
  object dsSitTrib_CF: TDataSource
    DataSet = cdsSitTrib_CF
    Left = 392
    Top = 48
  end
end
