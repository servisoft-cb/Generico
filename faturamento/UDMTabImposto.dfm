object DMTabImposto: TDMTabImposto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 404
  Top = 188
  Height = 381
  Width = 505
  object tTabPis: TTable
    Active = True
    AfterPost = tTabPisAfterPost
    DatabaseName = 'Tabelas'
    TableName = 'dbTabPis.DB'
    Left = 40
    Top = 24
    object tTabPisCodigo: TStringField
      FieldName = 'Codigo'
      Size = 2
    end
    object tTabPisNome: TStringField
      FieldName = 'Nome'
      Size = 150
    end
  end
  object dsTabPis: TDataSource
    DataSet = tTabPis
    Left = 72
    Top = 24
  end
  object tTabCofins: TTable
    Active = True
    AfterPost = tTabCofinsAfterPost
    DatabaseName = 'Tabelas'
    TableName = 'dbTabCofins.DB'
    Left = 56
    Top = 104
    object tTabCofinsCodigo: TStringField
      FieldName = 'Codigo'
      Size = 2
    end
    object tTabCofinsNome: TStringField
      FieldName = 'Nome'
      Size = 150
    end
  end
  object dsTabCofins: TDataSource
    DataSet = tTabCofins
    Left = 104
    Top = 104
  end
  object tRegimeTrib: TTable
    Active = True
    AfterPost = tRegimeTribAfterPost
    DatabaseName = 'Tabelas'
    TableName = 'dbRegimeTrib.db'
    Left = 80
    Top = 184
    object tRegimeTribCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tRegimeTribNome: TStringField
      FieldName = 'Nome'
      Size = 70
    end
  end
  object dsRegimeTrib: TDataSource
    DataSet = tRegimeTrib
    Left = 136
    Top = 184
  end
  object tOrigemProd: TTable
    Active = True
    AfterPost = tOrigemProdAfterPost
    DatabaseName = 'Tabelas'
    TableName = 'dbOrigemProd.db'
    Left = 272
    Top = 72
    object tOrigemProdOrigem: TStringField
      FieldName = 'Origem'
      Size = 1
    end
    object tOrigemProdNome: TStringField
      FieldName = 'Nome'
      Size = 230
    end
  end
  object dsOrigemProd: TDataSource
    DataSet = tOrigemProd
    Left = 312
    Top = 72
  end
end
