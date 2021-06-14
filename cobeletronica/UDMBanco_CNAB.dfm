object DMBanco_CNAB: TDMBanco_CNAB
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 242
  Top = 215
  Height = 192
  Width = 544
  object sdsBanco_CNAB: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM BANCO_CNAB'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 136
    Top = 40
    object sdsBanco_CNABCODCONTA: TIntegerField
      FieldName = 'CODCONTA'
      Required = True
    end
    object sdsBanco_CNABCODCEDENTE: TStringField
      FieldName = 'CODCEDENTE'
      Size = 12
    end
    object sdsBanco_CNABACEITE: TStringField
      FieldName = 'ACEITE'
      Size = 1
    end
    object sdsBanco_CNABINSTRUCAO: TStringField
      FieldName = 'INSTRUCAO'
      Size = 2
    end
    object sdsBanco_CNABDIASPROTESTO: TIntegerField
      FieldName = 'DIASPROTESTO'
    end
    object sdsBanco_CNABCAMINHO: TStringField
      FieldName = 'CAMINHO'
      Size = 150
    end
    object sdsBanco_CNABNOME: TStringField
      FieldName = 'NOME'
      Size = 8
    end
    object sdsBanco_CNABEXTENSAO: TStringField
      FieldName = 'EXTENSAO'
      Size = 3
    end
    object sdsBanco_CNABVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
    end
    object sdsBanco_CNABVLRJUROSPORDIA: TFloatField
      FieldName = 'VLRJUROSPORDIA'
    end
    object sdsBanco_CNABESPECIEDOC: TStringField
      FieldName = 'ESPECIEDOC'
      Size = 2
    end
    object sdsBanco_CNABNUMCARTEIRA: TStringField
      FieldName = 'NUMCARTEIRA'
      Size = 3
    end
    object sdsBanco_CNABDTLIMITEDESCONTO: TDateField
      FieldName = 'DTLIMITEDESCONTO'
    end
    object sdsBanco_CNABCODTRANSMISSAO: TStringField
      FieldName = 'CODTRANSMISSAO'
      Size = 15
    end
    object sdsBanco_CNABTIPODOCUMENTO: TIntegerField
      FieldName = 'TIPODOCUMENTO'
    end
    object sdsBanco_CNABMENSAGEM1: TStringField
      FieldName = 'MENSAGEM1'
      Size = 40
    end
    object sdsBanco_CNABMENSAGEM2: TStringField
      FieldName = 'MENSAGEM2'
      Size = 40
    end
    object sdsBanco_CNABNUMREMESSA: TIntegerField
      FieldName = 'NUMREMESSA'
    end
    object sdsBanco_CNABCODCOMANDO: TStringField
      FieldName = 'CODCOMANDO'
      Size = 2
    end
    object sdsBanco_CNABINSTRUCAO2: TStringField
      FieldName = 'INSTRUCAO2'
      Size = 2
    end
    object sdsBanco_CNABVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
    object sdsBanco_CNABMOEDA: TStringField
      FieldName = 'MOEDA'
      Size = 1
    end
    object sdsBanco_CNABVARIACAOCARTEIRA: TStringField
      FieldName = 'VARIACAOCARTEIRA'
      Size = 3
    end
    object sdsBanco_CNABCODTIPOCOBRANCA: TIntegerField
      FieldName = 'CODTIPOCOBRANCA'
    end
  end
  object dspBanco_CNAB: TDataSetProvider
    DataSet = sdsBanco_CNAB
    OnUpdateError = dspBanco_CNABUpdateError
    Left = 216
    Top = 40
  end
  object cdsBanco_CNAB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBanco_CNAB'
    Left = 304
    Top = 40
    object cdsBanco_CNABCODCONTA: TIntegerField
      FieldName = 'CODCONTA'
      Required = True
    end
    object cdsBanco_CNABCODCEDENTE: TStringField
      FieldName = 'CODCEDENTE'
      Size = 12
    end
    object cdsBanco_CNABACEITE: TStringField
      FieldName = 'ACEITE'
      Size = 1
    end
    object cdsBanco_CNABINSTRUCAO: TStringField
      FieldName = 'INSTRUCAO'
      Size = 2
    end
    object cdsBanco_CNABDIASPROTESTO: TIntegerField
      FieldName = 'DIASPROTESTO'
    end
    object cdsBanco_CNABCAMINHO: TStringField
      FieldName = 'CAMINHO'
      Size = 150
    end
    object cdsBanco_CNABNOME: TStringField
      FieldName = 'NOME'
      Size = 8
    end
    object cdsBanco_CNABEXTENSAO: TStringField
      FieldName = 'EXTENSAO'
      Size = 3
    end
    object cdsBanco_CNABVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
    end
    object cdsBanco_CNABVLRJUROSPORDIA: TFloatField
      FieldName = 'VLRJUROSPORDIA'
    end
    object cdsBanco_CNABESPECIEDOC: TStringField
      FieldName = 'ESPECIEDOC'
      Size = 2
    end
    object cdsBanco_CNABNUMCARTEIRA: TStringField
      FieldName = 'NUMCARTEIRA'
      Size = 3
    end
    object cdsBanco_CNABDTLIMITEDESCONTO: TDateField
      FieldName = 'DTLIMITEDESCONTO'
    end
    object cdsBanco_CNABCODTRANSMISSAO: TStringField
      FieldName = 'CODTRANSMISSAO'
      Size = 15
    end
    object cdsBanco_CNABTIPODOCUMENTO: TIntegerField
      FieldName = 'TIPODOCUMENTO'
    end
    object cdsBanco_CNABMENSAGEM1: TStringField
      FieldName = 'MENSAGEM1'
      Size = 40
    end
    object cdsBanco_CNABMENSAGEM2: TStringField
      FieldName = 'MENSAGEM2'
      Size = 40
    end
    object cdsBanco_CNABNUMREMESSA: TIntegerField
      FieldName = 'NUMREMESSA'
    end
    object cdsBanco_CNABCODCOMANDO: TStringField
      FieldName = 'CODCOMANDO'
      Size = 2
    end
    object cdsBanco_CNABINSTRUCAO2: TStringField
      FieldName = 'INSTRUCAO2'
      Size = 2
    end
    object cdsBanco_CNABVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
    object cdsBanco_CNABMOEDA: TStringField
      FieldName = 'MOEDA'
      Size = 1
    end
    object cdsBanco_CNABVARIACAOCARTEIRA: TStringField
      FieldName = 'VARIACAOCARTEIRA'
      Size = 3
    end
    object cdsBanco_CNABCODTIPOCOBRANCA: TIntegerField
      FieldName = 'CODTIPOCOBRANCA'
    end
  end
  object dsBanco_CNAB: TDataSource
    DataSet = cdsBanco_CNAB
    Left = 392
    Top = 40
  end
end
