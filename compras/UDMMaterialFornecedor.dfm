object DMMaterialFornecedor: TDMMaterialFornecedor
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 221
  Top = 221
  Height = 276
  Width = 581
  object tMaterialFornecedor: TTable
    AfterPost = tMaterialFornecedorAfterPost
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'CodMaterial;CodFornecedor;Item'
    TableName = 'dbMaterialFornecedor.db'
    Left = 56
    Top = 48
    object tMaterialFornecedorCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
    end
    object tMaterialFornecedorCodFornecedor: TIntegerField
      FieldName = 'CodFornecedor'
    end
    object tMaterialFornecedorItem: TIntegerField
      FieldName = 'Item'
    end
    object tMaterialFornecedorNomeMaterialForn: TStringField
      FieldName = 'NomeMaterialForn'
      Size = 60
    end
    object tMaterialFornecedorCodMaterialForn: TStringField
      FieldName = 'CodMaterialForn'
    end
    object tMaterialFornecedorCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tMaterialFornecedorCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object tMaterialFornecedorCodPosicao: TIntegerField
      FieldName = 'CodPosicao'
    end
    object tMaterialFornecedorTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object tMaterialFornecedorlkNomeFornecedor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeFornecedor'
      LookupDataSet = tFornecedores
      LookupKeyFields = 'CodForn'
      LookupResultField = 'NomeForn'
      KeyFields = 'CodFornecedor'
      Size = 40
      Lookup = True
    end
    object tMaterialFornecedorlkNomeCor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCor'
      LookupDataSet = tCor
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCor'
      Size = 40
      Lookup = True
    end
    object tMaterialFornecedorCodBarra: TStringField
      FieldName = 'CodBarra'
      Size = 14
    end
    object tMaterialFornecedorCodMaterialFornPadrao: TStringField
      FieldName = 'CodMaterialFornPadrao'
    end
  end
  object dsMaterialFornecedor: TDataSource
    DataSet = tMaterialFornecedor
    Left = 112
    Top = 48
  end
  object tFornecedores: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'DBFORNECEDORES.DB'
    Left = 96
    Top = 136
    object tFornecedoresCodForn: TIntegerField
      FieldName = 'CodForn'
    end
    object tFornecedoresNomeForn: TStringField
      FieldName = 'NomeForn'
      Size = 60
    end
  end
  object tCor: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'Dbcor.DB'
    Left = 216
    Top = 144
    object tCorCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tCorNome: TStringField
      FieldName = 'Nome'
      Size = 25
    end
  end
end
