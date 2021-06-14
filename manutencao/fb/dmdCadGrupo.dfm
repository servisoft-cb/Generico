object dmCadGrupo: TdmCadGrupo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 342
  Top = 314
  Height = 270
  Width = 384
  object sdsGrupo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM GRUPO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 24
    object sdsGrupoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsGrupoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object sdsGrupoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 3
    end
    object sdsGrupoCODSITTRIB: TIntegerField
      FieldName = 'CODSITTRIB'
    end
    object sdsGrupoPRECOAMOSTRA: TFloatField
      FieldName = 'PRECOAMOSTRA'
    end
    object sdsGrupoESTOQUE: TStringField
      FieldName = 'ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object sdsGrupoTIPOPRODUTO: TStringField
      FieldName = 'TIPOPRODUTO'
      Size = 1
    end
  end
  object dspGrupo: TDataSetProvider
    DataSet = sdsGrupo
    Left = 136
    Top = 24
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 224
    Top = 24
    object cdsGrupoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsGrupoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsGrupoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 3
    end
    object cdsGrupoCODSITTRIB: TIntegerField
      FieldName = 'CODSITTRIB'
    end
    object cdsGrupoPRECOAMOSTRA: TFloatField
      FieldName = 'PRECOAMOSTRA'
    end
    object cdsGrupoESTOQUE: TStringField
      FieldName = 'ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsGrupoTIPOPRODUTO: TStringField
      FieldName = 'TIPOPRODUTO'
      Size = 1
    end
  end
  object dsGrupo: TDataSource
    DataSet = cdsGrupo
    Left = 304
    Top = 24
  end
end
