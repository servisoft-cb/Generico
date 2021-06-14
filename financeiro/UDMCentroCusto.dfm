object DMCentroCusto: TDMCentroCusto
  OldCreateOrder = False
  Left = 227
  Top = 259
  Height = 257
  Width = 549
  object tCentroCusto: TTable
    AfterPost = tCentroCustoAfterPost
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Codigo'
    TableName = 'dbCentroCusto.db'
    Left = 152
    Top = 48
    object tCentroCustoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tCentroCustoNome: TStringField
      FieldName = 'Nome'
      Size = 25
    end
  end
  object dsCentroCusto: TDataSource
    DataSet = tCentroCusto
    Left = 200
    Top = 48
  end
  object tCentroCustoItem: TTable
    AfterPost = tCentroCustoItemAfterPost
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'CodCentroCusto;CodItem'
    MasterFields = 'Codigo'
    MasterSource = dsCentroCusto
    TableName = 'dbCentroCustoItem.db'
    Left = 200
    Top = 144
    object tCentroCustoItemCodCentroCusto: TIntegerField
      FieldName = 'CodCentroCusto'
    end
    object tCentroCustoItemCodItem: TIntegerField
      FieldName = 'CodItem'
    end
    object tCentroCustoItemNomeItem: TStringField
      FieldName = 'NomeItem'
      Size = 25
    end
  end
  object dsCentroCustoItem: TDataSource
    DataSet = tCentroCustoItem
    Left = 272
    Top = 144
  end
end
