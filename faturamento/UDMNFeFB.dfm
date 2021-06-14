object DMNFeFB: TDMNFeFB
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 242
  Top = 215
  Height = 379
  Width = 544
  object sdsNotaFiscal_NFe: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM NOTAFISCAL_NFE'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 136
    Top = 40
    object sdsNotaFiscal_NFeFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object sdsNotaFiscal_NFeNUMSEQ: TIntegerField
      FieldName = 'NUMSEQ'
      Required = True
    end
    object sdsNotaFiscal_NFeITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsNotaFiscal_NFeTIPO: TStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object sdsNotaFiscal_NFeITEMTIPO: TIntegerField
      FieldName = 'ITEMTIPO'
    end
    object sdsNotaFiscal_NFeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 70
    end
    object sdsNotaFiscal_NFeMOTIVO: TMemoField
      FieldName = 'MOTIVO'
      BlobType = ftMemo
      Size = 1
    end
    object sdsNotaFiscal_NFeNFEPROTOCOLO: TStringField
      FieldName = 'NFEPROTOCOLO'
      Size = 45
    end
    object sdsNotaFiscal_NFeNFERECIBO: TStringField
      FieldName = 'NFERECIBO'
      Size = 45
    end
    object sdsNotaFiscal_NFeXML: TMemoField
      FieldName = 'XML'
      BlobType = ftMemo
      Size = 1
    end
    object sdsNotaFiscal_NFeDATAHORAAUT: TSQLTimeStampField
      FieldName = 'DATAHORAAUT'
    end
    object sdsNotaFiscal_NFeDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object sdsNotaFiscal_NFeHRCADASTRO: TTimeField
      FieldName = 'HRCADASTRO'
    end
  end
  object dspNotaFiscal_NFe: TDataSetProvider
    DataSet = sdsNotaFiscal_NFe
    OnUpdateError = dspNotaFiscal_NFeUpdateError
    Left = 216
    Top = 40
  end
  object cdsNotaFiscal_NFe: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'FILIAL;NUMSEQ;ITEM'
    Params = <>
    ProviderName = 'dspNotaFiscal_NFe'
    Left = 304
    Top = 40
    object cdsNotaFiscal_NFeFILIAL: TIntegerField
      FieldName = 'FILIAL'
      Required = True
    end
    object cdsNotaFiscal_NFeNUMSEQ: TIntegerField
      FieldName = 'NUMSEQ'
      Required = True
    end
    object cdsNotaFiscal_NFeITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsNotaFiscal_NFeTIPO: TStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object cdsNotaFiscal_NFeITEMTIPO: TIntegerField
      FieldName = 'ITEMTIPO'
    end
    object cdsNotaFiscal_NFeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 70
    end
    object cdsNotaFiscal_NFeMOTIVO: TMemoField
      FieldName = 'MOTIVO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsNotaFiscal_NFeNFEPROTOCOLO: TStringField
      FieldName = 'NFEPROTOCOLO'
      Size = 45
    end
    object cdsNotaFiscal_NFeNFERECIBO: TStringField
      FieldName = 'NFERECIBO'
      Size = 45
    end
    object cdsNotaFiscal_NFeXML: TMemoField
      FieldName = 'XML'
      BlobType = ftMemo
      Size = 1
    end
    object cdsNotaFiscal_NFeDATAHORAAUT: TSQLTimeStampField
      FieldName = 'DATAHORAAUT'
    end
    object cdsNotaFiscal_NFeDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object cdsNotaFiscal_NFeHRCADASTRO: TTimeField
      FieldName = 'HRCADASTRO'
    end
  end
  object dsNotaFiscal_NFe: TDataSource
    DataSet = cdsNotaFiscal_NFe
    Left = 392
    Top = 40
  end
  object qProximoItemTipo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMSEQ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT MAX(ITEMTIPO) ITEMTIPO'
      'FROM NOTAFISCAL_NFE'
      'WHERE FILIAL = :FILIAL'
      '      AND NUMSEQ = :NUMSEQ'
      '      AND TIPO = :TIPO')
    SQLConnection = dmDatabase.scoDados
    Left = 296
    Top = 128
    object qProximoItemTipoITEMTIPO: TIntegerField
      FieldName = 'ITEMTIPO'
    end
  end
  object sdsNFE_EMAIL: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM NFE_EMAIL'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 128
    Top = 240
    object sdsNFE_EMAILID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsNFE_EMAILNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object sdsNFE_EMAILEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 200
    end
  end
  object sdpNFE_EMAIL: TDataSetProvider
    DataSet = sdsNFE_EMAIL
    OnUpdateError = dspNotaFiscal_NFeUpdateError
    Left = 208
    Top = 240
  end
  object cdsNFE_EMAIL: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'sdpNFE_EMAIL'
    Left = 296
    Top = 240
    object cdsNFE_EMAILID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNFE_EMAILNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsNFE_EMAILEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 200
    end
  end
  object dsNFE_EMAIL: TDataSource
    DataSet = cdsNFE_EMAIL
    Left = 384
    Top = 240
  end
end
