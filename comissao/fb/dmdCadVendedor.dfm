object dmCadVendedor: TdmCadVendedor
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 342
  Top = 314
  Height = 270
  Width = 384
  object sdsVendedor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'   FROM VENDEDOR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 24
    object sdsVendedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsVendedorNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object sdsVendedorPERCCOMISSAO: TFloatField
      FieldName = 'PERCCOMISSAO'
    end
    object sdsVendedorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object sdsVendedorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object sdsVendedorCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object sdsVendedorESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object sdsVendedorCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object sdsVendedorFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object sdsVendedorFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object sdsVendedorPESSOA: TStringField
      FieldName = 'PESSOA'
      Size = 1
    end
    object sdsVendedorCGCCPF: TStringField
      FieldName = 'CGCCPF'
      Size = 18
    end
    object sdsVendedorINSCEST: TStringField
      FieldName = 'INSCEST'
    end
    object sdsVendedorREGIOES: TIntegerField
      FieldName = 'REGIOES'
    end
    object sdsVendedorTIPOCOMISSAO: TStringField
      FieldName = 'TIPOCOMISSAO'
      Size = 1
    end
    object sdsVendedorPERCIMPRENDA: TFloatField
      FieldName = 'PERCIMPRENDA'
    end
    object sdsVendedorSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object sdsVendedorCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object sdsVendedorCAIXAPOSTAL: TStringField
      FieldName = 'CAIXAPOSTAL'
      Size = 10
    end
    object sdsVendedorCODANT: TIntegerField
      FieldName = 'CODANT'
    end
    object sdsVendedorINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dspVendedor: TDataSetProvider
    DataSet = sdsVendedor
    Left = 136
    Top = 24
  end
  object cdsVendedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendedor'
    Left = 224
    Top = 24
    object cdsVendedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsVendedorNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsVendedorPERCCOMISSAO: TFloatField
      FieldName = 'PERCCOMISSAO'
    end
    object cdsVendedorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object cdsVendedorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsVendedorCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object cdsVendedorESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object cdsVendedorCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsVendedorFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object cdsVendedorFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object cdsVendedorPESSOA: TStringField
      FieldName = 'PESSOA'
      Size = 1
    end
    object cdsVendedorCGCCPF: TStringField
      FieldName = 'CGCCPF'
      Size = 18
    end
    object cdsVendedorINSCEST: TStringField
      FieldName = 'INSCEST'
    end
    object cdsVendedorREGIOES: TIntegerField
      FieldName = 'REGIOES'
    end
    object cdsVendedorTIPOCOMISSAO: TStringField
      FieldName = 'TIPOCOMISSAO'
      Size = 1
    end
    object cdsVendedorPERCIMPRENDA: TFloatField
      FieldName = 'PERCIMPRENDA'
    end
    object cdsVendedorSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object cdsVendedorCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object cdsVendedorCAIXAPOSTAL: TStringField
      FieldName = 'CAIXAPOSTAL'
      Size = 10
    end
    object cdsVendedorCODANT: TIntegerField
      FieldName = 'CODANT'
    end
    object cdsVendedorINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dsVendedor: TDataSource
    DataSet = cdsVendedor
    Left = 304
    Top = 24
  end
end
