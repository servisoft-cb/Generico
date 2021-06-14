object DMCarteira: TDMCarteira
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 242
  Top = 215
  Height = 192
  Width = 544
  object sdsCarteira: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM CARTEIRA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 136
    Top = 40
    object sdsCarteiraID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsCarteiraCODCARTEIRA: TStringField
      FieldName = 'CODCARTEIRA'
      Size = 3
    end
    object sdsCarteiraCODBANCO: TStringField
      FieldName = 'CODBANCO'
      Size = 5
    end
    object sdsCarteiraNOMEBANCO: TStringField
      FieldName = 'NOMEBANCO'
      Size = 30
    end
    object sdsCarteiraNOMECARTEIRA: TStringField
      FieldName = 'NOMECARTEIRA'
      Size = 100
    end
    object sdsCarteiraGERARNOSSONUMERO: TStringField
      FieldName = 'GERARNOSSONUMERO'
      FixedChar = True
      Size = 1
    end
    object sdsCarteiraGERARREMESSA: TStringField
      FieldName = 'GERARREMESSA'
      FixedChar = True
      Size = 1
    end
    object sdsCarteiraCODCARTEIRA_IMP: TStringField
      FieldName = 'CODCARTEIRA_IMP'
      Size = 3
    end
  end
  object dspCarteira: TDataSetProvider
    DataSet = sdsCarteira
    OnUpdateError = dspCarteiraUpdateError
    Left = 216
    Top = 40
  end
  object cdsCarteira: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCarteira'
    Left = 304
    Top = 40
    object cdsCarteiraID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCarteiraCODCARTEIRA: TStringField
      FieldName = 'CODCARTEIRA'
      Size = 3
    end
    object cdsCarteiraCODBANCO: TStringField
      FieldName = 'CODBANCO'
      Size = 5
    end
    object cdsCarteiraNOMEBANCO: TStringField
      FieldName = 'NOMEBANCO'
      Size = 30
    end
    object cdsCarteiraNOMECARTEIRA: TStringField
      FieldName = 'NOMECARTEIRA'
      Size = 100
    end
    object cdsCarteiraGERARNOSSONUMERO: TStringField
      FieldName = 'GERARNOSSONUMERO'
      FixedChar = True
      Size = 1
    end
    object cdsCarteiraGERARREMESSA: TStringField
      FieldName = 'GERARREMESSA'
      FixedChar = True
      Size = 1
    end
    object cdsCarteiraCODCARTEIRA_IMP: TStringField
      FieldName = 'CODCARTEIRA_IMP'
      Size = 3
    end
  end
  object dsCarteira: TDataSource
    DataSet = cdsCarteira
    Left = 392
    Top = 40
  end
end
