object dmCadPosicao: TdmCadPosicao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 342
  Top = 314
  Height = 270
  Width = 384
  object sdsPosicao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM POSICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 24
    object sdsPosicaoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsPosicaoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object sdsPosicaoIMPAMOSTRA: TStringField
      FieldName = 'IMPAMOSTRA'
      FixedChar = True
      Size = 1
    end
    object sdsPosicaoCABEDAL: TStringField
      FieldName = 'CABEDAL'
      FixedChar = True
      Size = 1
    end
  end
  object dspPosicao: TDataSetProvider
    DataSet = sdsPosicao
    Left = 136
    Top = 24
  end
  object cdsPosicao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPosicao'
    Left = 224
    Top = 24
    object cdsPosicaoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPosicaoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsPosicaoIMPAMOSTRA: TStringField
      FieldName = 'IMPAMOSTRA'
      FixedChar = True
      Size = 1
    end
    object cdsPosicaoCABEDAL: TStringField
      FieldName = 'CABEDAL'
      FixedChar = True
      Size = 1
    end
  end
  object dsPosicao: TDataSource
    DataSet = cdsPosicao
    Left = 304
    Top = 24
  end
end
