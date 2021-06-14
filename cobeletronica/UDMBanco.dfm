object DMBanco: TDMBanco
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 409
  Top = 135
  Height = 508
  Width = 729
  object tBcoBrasil: TTable
    AfterPost = tBcoBrasilAfterPost
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'CodConta'
    MasterFields = 'CodConta'
    MasterSource = DM1.dsContas
    TableName = 'dbBcoBrasil.DB'
    Left = 208
    Top = 80
    object tBcoBrasilCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object tBcoBrasilCodCedente: TStringField
      FieldName = 'CodCedente'
      Size = 12
    end
    object tBcoBrasilAceite: TStringField
      FieldName = 'Aceite'
      Size = 1
    end
    object tBcoBrasilInstrucao: TStringField
      FieldName = 'Instrucao'
      Size = 2
    end
    object tBcoBrasilDiasProtesto: TIntegerField
      FieldName = 'DiasProtesto'
    end
    object tBcoBrasilCaminho: TStringField
      FieldName = 'Caminho'
      Size = 50
    end
    object tBcoBrasilNome: TStringField
      FieldName = 'Nome'
      Size = 8
    end
    object tBcoBrasilExtensao: TStringField
      FieldName = 'Extensao'
      Size = 3
    end
    object tBcoBrasilVlrDesconto: TFloatField
      FieldName = 'VlrDesconto'
    end
    object tBcoBrasilVlrJurosPorDia: TFloatField
      FieldName = 'VlrJurosPorDia'
    end
    object tBcoBrasilEspecieDoc: TStringField
      FieldName = 'EspecieDoc'
      Size = 2
    end
    object tBcoBrasilNumCarteira: TStringField
      FieldName = 'NumCarteira'
      Size = 3
    end
    object tBcoBrasilDtLimiteDesconto: TDateField
      FieldName = 'DtLimiteDesconto'
    end
    object tBcoBrasilCodTransmissao: TStringField
      FieldName = 'CodTransmissao'
      Size = 15
    end
    object tBcoBrasilTipoDocumento: TStringField
      FieldName = 'TipoDocumento'
      Size = 5
    end
    object tBcoBrasilMensagem1: TStringField
      FieldName = 'Mensagem1'
      Size = 40
    end
    object tBcoBrasilMensagem2: TStringField
      FieldName = 'Mensagem2'
      Size = 40
    end
    object tBcoBrasilNumRemessa: TIntegerField
      FieldName = 'NumRemessa'
    end
    object tBcoBrasilCodComando: TStringField
      FieldName = 'CodComando'
      Size = 2
    end
    object tBcoBrasilInstrucao2: TStringField
      FieldName = 'Instrucao2'
      Size = 2
    end
    object tBcoBrasilVlrIOF: TFloatField
      FieldName = 'VlrIOF'
    end
    object tBcoBrasilMoeda: TStringField
      FieldName = 'Moeda'
      Size = 1
    end
    object tBcoBrasilVariacaoCarteira: TStringField
      FieldName = 'VariacaoCarteira'
      Size = 3
    end
    object tBcoBrasilCodTipoCobranca: TIntegerField
      FieldName = 'CodTipoCobranca'
    end
  end
  object dsBcoBrasil: TDataSource
    DataSet = tBcoBrasil
    Left = 224
    Top = 80
  end
  object tBcoItau: TTable
    AfterPost = tBcoItauAfterPost
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'CodConta'
    MasterFields = 'CodConta'
    MasterSource = DM1.dsContas
    TableName = 'dbBcoItau.DB'
    Left = 208
    Top = 152
    object tBcoItauCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object tBcoItauCodCedente: TStringField
      FieldName = 'CodCedente'
      Size = 12
    end
    object tBcoItauCarteira: TStringField
      FieldName = 'Carteira'
      Size = 1
    end
    object tBcoItauAceite: TStringField
      FieldName = 'Aceite'
      Size = 1
    end
    object tBcoItauInstrucao: TStringField
      FieldName = 'Instrucao'
      Size = 2
    end
    object tBcoItauDiasProtesto: TIntegerField
      FieldName = 'DiasProtesto'
    end
    object tBcoItauCaminho: TStringField
      FieldName = 'Caminho'
      Size = 50
    end
    object tBcoItauNome: TStringField
      FieldName = 'Nome'
      Size = 8
    end
    object tBcoItauExtensao: TStringField
      FieldName = 'Extensao'
      Size = 3
    end
    object tBcoItauVlrDesconto: TFloatField
      FieldName = 'VlrDesconto'
    end
    object tBcoItauVlrJurosPorDia: TFloatField
      FieldName = 'VlrJurosPorDia'
    end
    object tBcoItauEspecieDoc: TStringField
      FieldName = 'EspecieDoc'
      Size = 2
    end
    object tBcoItauInstrCobranca1: TStringField
      FieldName = 'InstrCobranca1'
      Size = 2
    end
    object tBcoItauInstrCobranca2: TStringField
      FieldName = 'InstrCobranca2'
      Size = 2
    end
    object tBcoItauNumCarteira: TStringField
      FieldName = 'NumCarteira'
      Size = 3
    end
    object tBcoItauDtLimiteDesconto: TDateField
      FieldName = 'DtLimiteDesconto'
    end
    object tBcoItauTipoJuro: TStringField
      FieldName = 'TipoJuro'
      Size = 1
    end
    object tBcoItauTipoDesconto: TStringField
      FieldName = 'TipoDesconto'
      Size = 1
    end
    object tBcoItauTaxaMulta: TFloatField
      FieldName = 'TaxaMulta'
    end
    object tBcoItauVlrTaxaBoleto: TFloatField
      FieldName = 'VlrTaxaBoleto'
    end
  end
  object dsBcoItau: TDataSource
    DataSet = tBcoItau
    Left = 224
    Top = 152
  end
  object tBcoCaixa: TTable
    AfterPost = tBcoBrasilAfterPost
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'CodConta'
    MasterFields = 'CodConta'
    MasterSource = DM1.dsContas
    TableName = 'dbBcoCaixa.DB'
    Left = 432
    Top = 88
    object tBcoCaixaCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object tBcoCaixaAceite: TStringField
      FieldName = 'Aceite'
      Size = 1
    end
    object tBcoCaixaInstrucao: TStringField
      FieldName = 'Instrucao'
      Size = 2
    end
    object tBcoCaixaDiasProtesto: TIntegerField
      FieldName = 'DiasProtesto'
    end
    object tBcoCaixaCaminho: TStringField
      FieldName = 'Caminho'
      Size = 50
    end
    object tBcoCaixaNome: TStringField
      FieldName = 'Nome'
      Size = 8
    end
    object tBcoCaixaExtensao: TStringField
      FieldName = 'Extensao'
      Size = 3
    end
    object tBcoCaixaVlrJurosPorDia: TFloatField
      FieldName = 'VlrJurosPorDia'
    end
    object tBcoCaixaEspecieDoc: TStringField
      FieldName = 'EspecieDoc'
      Size = 2
    end
    object tBcoCaixaNumCarteira: TStringField
      FieldName = 'NumCarteira'
      Size = 3
    end
    object tBcoCaixaTipoDocumento: TStringField
      FieldName = 'TipoDocumento'
      Size = 5
    end
    object tBcoCaixaMensagem1: TStringField
      FieldName = 'Mensagem1'
      Size = 30
    end
    object tBcoCaixaNumRemessa: TIntegerField
      FieldName = 'NumRemessa'
    end
    object tBcoCaixaCodComando: TStringField
      FieldName = 'CodComando'
      Size = 2
    end
    object tBcoCaixaInstrucao2: TStringField
      FieldName = 'Instrucao2'
      Size = 2
    end
    object tBcoCaixaVlrIOF: TFloatField
      FieldName = 'VlrIOF'
    end
    object tBcoCaixaMoeda: TStringField
      FieldName = 'Moeda'
      Size = 1
    end
    object tBcoCaixaVariacaoCarteira: TStringField
      FieldName = 'VariacaoCarteira'
      Size = 3
    end
    object tBcoCaixaCodTipoCobranca: TIntegerField
      FieldName = 'CodTipoCobranca'
    end
    object tBcoCaixaComissaoPermanencia: TStringField
      FieldName = 'ComissaoPermanencia'
      Size = 2
    end
  end
  object dsBcoCaixa: TDataSource
    DataSet = tBcoCaixa
    Left = 472
    Top = 88
  end
  object tBcoSantander: TTable
    AfterPost = tBcoItauAfterPost
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'CodConta'
    MasterFields = 'CodConta'
    MasterSource = DM1.dsContas
    TableName = 'dbBcoSantander.DB'
    Left = 208
    Top = 224
    object tBcoSantanderCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object tBcoSantanderCodCedente: TStringField
      FieldName = 'CodCedente'
      Size = 12
    end
    object tBcoSantanderCarteira: TStringField
      FieldName = 'Carteira'
      Size = 1
    end
    object tBcoSantanderAceite: TStringField
      FieldName = 'Aceite'
      Size = 1
    end
    object tBcoSantanderInstrucao: TStringField
      FieldName = 'Instrucao'
      Size = 2
    end
    object tBcoSantanderDiasProtesto: TIntegerField
      FieldName = 'DiasProtesto'
    end
    object tBcoSantanderCaminho: TStringField
      FieldName = 'Caminho'
      Size = 50
    end
    object tBcoSantanderNome: TStringField
      FieldName = 'Nome'
      Size = 8
    end
    object tBcoSantanderExtensao: TStringField
      FieldName = 'Extensao'
      Size = 3
    end
    object tBcoSantanderVlrDesconto: TFloatField
      FieldName = 'VlrDesconto'
    end
    object tBcoSantanderVlrJurosPorDia: TFloatField
      FieldName = 'VlrJurosPorDia'
    end
    object tBcoSantanderEspecieDoc: TStringField
      FieldName = 'EspecieDoc'
      Size = 2
    end
    object tBcoSantanderNumCarteira: TStringField
      FieldName = 'NumCarteira'
      Size = 3
    end
    object tBcoSantanderDtLimiteDesconto: TDateField
      FieldName = 'DtLimiteDesconto'
    end
    object tBcoSantanderTipoJuro: TStringField
      FieldName = 'TipoJuro'
      Size = 1
    end
    object tBcoSantanderTipoDesconto: TStringField
      FieldName = 'TipoDesconto'
      Size = 1
    end
    object tBcoSantanderTaxaMulta: TFloatField
      FieldName = 'TaxaMulta'
    end
    object tBcoSantanderCodTransmissao: TStringField
      FieldName = 'CodTransmissao'
    end
    object tBcoSantanderNumRemessa: TIntegerField
      FieldName = 'NumRemessa'
    end
    object tBcoSantanderFormaCadastramento: TIntegerField
      FieldName = 'FormaCadastramento'
    end
    object tBcoSantanderCodProtesto: TStringField
      FieldName = 'CodProtesto'
      Size = 1
    end
    object tBcoSantanderCodBaixa: TStringField
      FieldName = 'CodBaixa'
      Size = 1
    end
    object tBcoSantanderCodCompensacao: TStringField
      FieldName = 'CodCompensacao'
      Size = 3
    end
    object tBcoSantanderTipoDocumento: TStringField
      FieldName = 'TipoDocumento'
      Size = 1
    end
    object tBcoSantanderDiasBaixa: TIntegerField
      FieldName = 'DiasBaixa'
    end
    object tBcoSantanderVlrIOF: TFloatField
      FieldName = 'VlrIOF'
    end
    object tBcoSantanderCodMulta: TStringField
      FieldName = 'CodMulta'
      Size = 1
    end
    object tBcoSantanderDtMulta: TDateField
      FieldName = 'DtMulta'
    end
    object tBcoSantanderVlrMulta: TFloatField
      FieldName = 'VlrMulta'
    end
    object tBcoSantanderTipoDesconto2: TStringField
      FieldName = 'TipoDesconto2'
      Size = 1
    end
    object tBcoSantanderDtLimiteDesconto2: TDateField
      FieldName = 'DtLimiteDesconto2'
    end
    object tBcoSantanderVlrDesconto2: TFloatField
      FieldName = 'VlrDesconto2'
    end
    object tBcoSantanderMensagem1: TStringField
      FieldName = 'Mensagem1'
      Size = 40
    end
    object tBcoSantanderMensagem2: TStringField
      FieldName = 'Mensagem2'
      Size = 40
    end
    object tBcoSantanderComplemento: TStringField
      FieldName = 'Complemento'
      Size = 3
    end
    object tBcoSantanderGerarNossoNumero: TStringField
      FieldName = 'GerarNossoNumero'
      Size = 1
    end
  end
  object dsBcoSantander: TDataSource
    DataSet = tBcoSantander
    Left = 224
    Top = 224
  end
  object sdsEspecie: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM COB_TIPO_CADASTRO'#13#10'WHERE TIPO_REG = '#39'ESP'#39#13#10'   AND' +
      ' ID_BANCO = :ID_BANCO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_BANCO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 208
    Top = 296
    object sdsEspecieID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsEspecieCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object sdsEspecieNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object sdsEspecieTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      Size = 3
    end
    object sdsEspecieID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object sdsEspecieCOD_REDUZIDO: TStringField
      FieldName = 'COD_REDUZIDO'
      Size = 3
    end
  end
  object dspEspecie: TDataSetProvider
    DataSet = sdsEspecie
    Left = 256
    Top = 296
  end
  object cdsEspecie: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODIGO'
    Params = <>
    ProviderName = 'dspEspecie'
    Left = 304
    Top = 296
    object cdsEspecieID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsEspecieCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object cdsEspecieNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsEspecieTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      Size = 3
    end
    object cdsEspecieID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
    end
    object cdsEspecieCOD_REDUZIDO: TStringField
      FieldName = 'COD_REDUZIDO'
      Size = 3
    end
  end
  object dsEspecie: TDataSource
    DataSet = cdsEspecie
    Left = 344
    Top = 296
  end
end
