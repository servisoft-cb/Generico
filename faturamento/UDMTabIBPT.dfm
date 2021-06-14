object DMTabIBPT: TDMTabIBPT
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 337
  Top = 197
  Height = 379
  Width = 544
  object sdsIBPT: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM TAB_IBPT'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 80
    Top = 40
    object sdsIBPTID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsIBPTCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 10
    end
    object sdsIBPTEX: TStringField
      FieldName = 'EX'
      Size = 2
    end
    object sdsIBPTTABELA: TStringField
      FieldName = 'TABELA'
      Size = 1
    end
    object sdsIBPTNOME: TStringField
      FieldName = 'NOME'
      Size = 250
    end
    object sdsIBPTPERC_NACIONAL: TFloatField
      FieldName = 'PERC_NACIONAL'
    end
    object sdsIBPTPERC_IMPORTACAO: TFloatField
      FieldName = 'PERC_IMPORTACAO'
    end
    object sdsIBPTPERC_ESTADUAL: TFloatField
      FieldName = 'PERC_ESTADUAL'
    end
    object sdsIBPTPERC_MUNICIPAL: TFloatField
      FieldName = 'PERC_MUNICIPAL'
    end
    object sdsIBPTDT_INICIO: TDateField
      FieldName = 'DT_INICIO'
    end
    object sdsIBPTDT_FINAL: TDateField
      FieldName = 'DT_FINAL'
    end
    object sdsIBPTCHAVE: TStringField
      FieldName = 'CHAVE'
    end
    object sdsIBPTVERSAO: TStringField
      FieldName = 'VERSAO'
      Size = 15
    end
    object sdsIBPTFONTE: TStringField
      FieldName = 'FONTE'
      Size = 30
    end
  end
  object dspIBPT: TDataSetProvider
    DataSet = sdsIBPT
    OnUpdateError = dspIBPTUpdateError
    Left = 160
    Top = 40
  end
  object cdsIBPT: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIBPT'
    Left = 248
    Top = 40
    object cdsIBPTID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsIBPTCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 10
    end
    object cdsIBPTEX: TStringField
      FieldName = 'EX'
      Size = 2
    end
    object cdsIBPTTABELA: TStringField
      FieldName = 'TABELA'
      Size = 1
    end
    object cdsIBPTNOME: TStringField
      FieldName = 'NOME'
      Size = 250
    end
    object cdsIBPTPERC_NACIONAL: TFloatField
      FieldName = 'PERC_NACIONAL'
    end
    object cdsIBPTPERC_IMPORTACAO: TFloatField
      FieldName = 'PERC_IMPORTACAO'
    end
    object cdsIBPTPERC_ESTADUAL: TFloatField
      FieldName = 'PERC_ESTADUAL'
    end
    object cdsIBPTPERC_MUNICIPAL: TFloatField
      FieldName = 'PERC_MUNICIPAL'
    end
    object cdsIBPTDT_INICIO: TDateField
      FieldName = 'DT_INICIO'
    end
    object cdsIBPTDT_FINAL: TDateField
      FieldName = 'DT_FINAL'
    end
    object cdsIBPTCHAVE: TStringField
      FieldName = 'CHAVE'
    end
    object cdsIBPTVERSAO: TStringField
      FieldName = 'VERSAO'
      Size = 15
    end
    object cdsIBPTFONTE: TStringField
      FieldName = 'FONTE'
      Size = 30
    end
  end
  object dsIBPT: TDataSource
    DataSet = cdsIBPT
    Left = 336
    Top = 40
  end
  object qIBPT: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT I.perc_nacional, I.perc_importacao,  I.perc_estadual, I.p' +
        'erc_municipal, I.Fonte, I.Versao'
      'FROM TAB_IBPT I')
    SQLConnection = dmDatabase.scoDados
    Left = 328
    Top = 136
    object qIBPTPERC_NACIONAL: TFloatField
      FieldName = 'PERC_NACIONAL'
    end
    object qIBPTPERC_IMPORTACAO: TFloatField
      FieldName = 'PERC_IMPORTACAO'
    end
    object qIBPTPERC_ESTADUAL: TFloatField
      FieldName = 'PERC_ESTADUAL'
    end
    object qIBPTPERC_MUNICIPAL: TFloatField
      FieldName = 'PERC_MUNICIPAL'
    end
    object qIBPTFONTE: TStringField
      FieldName = 'FONTE'
      Size = 30
    end
    object qIBPTVERSAO: TStringField
      FieldName = 'VERSAO'
      Size = 15
    end
  end
  object qIBPT_Contador: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT COUNT(1) CONTADOR'
      'FROM TAB_IBPT')
    SQLConnection = dmDatabase.scoDados
    Left = 192
    Top = 152
    object qIBPT_ContadorCONTADOR: TIntegerField
      FieldName = 'CONTADOR'
      Required = True
    end
  end
  object qFilial: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Codigo, Empresa, NomeInterno, Estado As UF'
      'FROM dbfilial')
    Left = 304
    Top = 232
    object qFilialCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'TABELAS."dbFilial.DB".Codigo'
    end
    object qFilialEmpresa: TStringField
      FieldName = 'Empresa'
      Origin = 'TABELAS."dbFilial.DB".Empresa'
      Size = 60
    end
    object qFilialNomeInterno: TStringField
      FieldName = 'NomeInterno'
      Origin = 'TABELAS."dbFilial.DB".NomeInterno'
      Size = 200
    end
    object qFilialUF: TStringField
      FieldName = 'UF'
      Origin = 'TABELAS."dbFilial.DB".Estado'
      Size = 3
    end
  end
end
