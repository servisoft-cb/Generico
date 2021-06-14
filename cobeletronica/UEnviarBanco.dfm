object fEnviarBanco: TfEnviarBanco
  Left = 406
  Top = 48
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cobran'#231'a Eletr'#244'nica Brasil - Layout CNAB 400'
  ClientHeight = 566
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 566
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 860
      Height = 59
      Align = alTop
      BevelOuter = bvLowered
      Color = clMoneyGreen
      TabOrder = 0
      object Label12: TLabel
        Left = 4
        Top = 4
        Width = 91
        Height = 13
        Caption = 'Arquivo gerado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object BitBtn2: TBitBtn
        Left = 9
        Top = 30
        Width = 105
        Height = 25
        Hint = 'Gera arquivo cfe. rela'#231#227'o de t'#237'tulos abaixo'
        Caption = 'Gerar &Arquivo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
          07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
          0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
      end
      object BitBtn4: TBitBtn
        Left = 114
        Top = 30
        Width = 105
        Height = 25
        Hint = 'Exclui a parcela selecionada abaixo da rela'#231#227'o de t'#237'tulos'
        Caption = 'Exclui Parcela'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn4Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F77777703333333733F3F3F73F33330FF0808077
          0333337F37F7F7F37F33330FF0807077033333733737F73F73F330FF77808707
          703337F37F37F37F37F330FF08807807703037F37F37F37F37F700FF08808707
          700377F37337F37F377330FF778078077033373F73F7F3733733330FF0808077
          0333337F37F7F7F37F33330FF08070770333337FF7F7F7FF7F33330000000000
          03333377777777777F33330F888777770333337FFFFFFFFF7F33330000000000
          033333777777777773333333307770333333333337FFF7F33333333330000033
          3333333337777733333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object BitBtn5: TBitBtn
        Left = 431
        Top = 30
        Width = 95
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BitBtn5Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000CE0E0000D80E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0038383838380E
          038383838383830E603800000000380E660033333330830E660333333330000E
          660333330030330E660333330E00330E660300000EE0330E06030EEEEEE6030E
          660300000E60330E660333330600330E660333330030330E6603333333303330
          E6033333333033330E0333333330000000033333333333333333}
      end
      object CheckBox1: TCheckBox
        Left = 720
        Top = 37
        Width = 81
        Height = 17
        Caption = 'Teste'
        TabOrder = 3
      end
    end
    object RxDBGrid1: TRxDBGrid
      Left = 1
      Top = 60
      Width = 860
      Height = 488
      Align = alClient
      DataSource = msBoletos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = RxDBGrid1DblClick
      OnGetCellParams = RxDBGrid1GetCellParams
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtGerado'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Gerado'
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumNota'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Nota'
          Width = 49
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Parcela'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Parc.'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cliente'
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 262
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtVencto'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Vencto.'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrParcela'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Vlr.da Parcela'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NossoNumero'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Nosso N'#250'mero'
          Width = 95
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumCarteira'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Tipo Cobran'#231'a'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FormaCadastramento'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Forma de Cadastramento'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumCReceber'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Lan'#231'to.'
          Width = 73
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'GeraNossoNumero'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Gerar Nosso N'#250'mero'
          Visible = True
        end>
    end
    object StaticText1: TStaticText
      Left = 1
      Top = 548
      Width = 860
      Height = 17
      Align = alBottom
      BorderStyle = sbsSunken
      Caption = 'Duplo clique para Alterar/Consultar parcela'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 2
    end
  end
  object msBoletos: TDataSource
    DataSet = mBoletos
    Left = 208
    Top = 200
  end
  object mBoletos: TMemoryTable
    BeforePost = mBoletosBeforePost
    OnNewRecord = mBoletosNewRecord
    Left = 184
    Top = 200
    object mBoletosNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
    end
    object mBoletosParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object mBoletosNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mBoletosVlrParcela: TFloatField
      FieldName = 'VlrParcela'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mBoletosPessoa: TStringField
      FieldName = 'Pessoa'
      Size = 2
    end
    object mBoletosCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Size = 14
    end
    object mBoletosEndereco: TStringField
      FieldName = 'Endereco'
      Size = 52
    end
    object mBoletosBairro: TStringField
      FieldName = 'Bairro'
    end
    object mBoletosCep: TStringField
      FieldName = 'Cep'
      Size = 8
    end
    object mBoletosCidade: TStringField
      FieldName = 'Cidade'
      Size = 26
    end
    object mBoletosUf: TStringField
      FieldName = 'Uf'
      Size = 2
    end
    object mBoletosArqGerado: TBooleanField
      FieldName = 'ArqGerado'
    end
    object mBoletosCliente: TStringField
      FieldName = 'Cliente'
      Size = 40
    end
    object mBoletosNossoNumero: TStringField
      FieldName = 'NossoNumero'
    end
    object mBoletosInstrucao: TStringField
      FieldName = 'Instrucao'
      Size = 2
    end
    object mBoletosTaxaMulta: TFloatField
      FieldName = 'TaxaMulta'
    end
    object mBoletosEspecieDoc: TStringField
      FieldName = 'EspecieDoc'
      Size = 2
    end
    object mBoletosAceite: TStringField
      FieldName = 'Aceite'
      Size = 1
    end
    object mBoletosDiasProtesto: TIntegerField
      FieldName = 'DiasProtesto'
    end
    object mBoletosVlrJurosPorDia: TFloatField
      FieldName = 'VlrJurosPorDia'
    end
    object mBoletosVlrDesconto: TFloatField
      FieldName = 'VlrDesconto'
    end
    object mBoletosVlrAbatimento: TFloatField
      FieldName = 'VlrAbatimento'
    end
    object mBoletosCpfCnpjAvalista: TStringField
      FieldName = 'CpfCnpjAvalista'
      Size = 14
    end
    object mBoletosNomeAvalista: TStringField
      FieldName = 'NomeAvalista'
      Size = 41
    end
    object mBoletosEndAvalista: TStringField
      FieldName = 'EndAvalista'
      Size = 45
    end
    object mBoletosCidAvalista: TStringField
      FieldName = 'CidAvalista'
    end
    object mBoletosCepAvalista: TStringField
      FieldName = 'CepAvalista'
      Size = 8
    end
    object mBoletosUFAvalista: TStringField
      FieldName = 'UFAvalista'
      Size = 2
    end
    object mBoletosDtGerado: TStringField
      FieldName = 'DtGerado'
      Size = 10
    end
    object mBoletosDtVencto: TStringField
      FieldName = 'DtVencto'
      Size = 10
    end
    object mBoletosDtLimiteDesc: TStringField
      FieldName = 'DtLimiteDesc'
      Size = 10
    end
    object mBoletosImpBoleto: TStringField
      FieldName = 'ImpBoleto'
      Size = 1
    end
    object mBoletosCnpjCpfEditado: TStringField
      FieldName = 'CnpjCpfEditado'
      Size = 18
    end
    object mBoletosNumCarteira: TStringField
      FieldName = 'NumCarteira'
      Size = 3
    end
    object mBoletosBairroAvalista: TStringField
      FieldName = 'BairroAvalista'
      Size = 30
    end
    object mBoletosTipoDocumento: TStringField
      FieldName = 'TipoDocumento'
      Size = 5
    end
    object mBoletosVlrIOF: TFloatField
      FieldName = 'VlrIOF'
    end
    object mBoletosCodTransmissao: TStringField
      FieldName = 'CodTransmissao'
      Size = 15
    end
    object mBoletosCodComando: TStringField
      FieldName = 'CodComando'
      Size = 2
    end
    object mBoletosInstrucao2: TStringField
      FieldName = 'Instrucao2'
      Size = 2
    end
    object mBoletosMoeda: TStringField
      FieldName = 'Moeda'
      Size = 2
    end
    object mBoletosEmail: TStringField
      FieldName = 'Email'
      Size = 135
    end
    object mBoletosFilial: TIntegerField
      FieldName = 'Filial'
    end
    object mBoletosComplEndereco: TStringField
      FieldName = 'ComplEndereco'
    end
    object mBoletosCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object mBoletosSerie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object mBoletosInstrCobranca1: TStringField
      FieldName = 'InstrCobranca1'
      Size = 2
    end
    object mBoletosInstrCobranca2: TStringField
      FieldName = 'InstrCobranca2'
      Size = 2
    end
    object mBoletosTipoDesconto: TStringField
      FieldName = 'TipoDesconto'
      Size = 1
    end
    object mBoletosTipoJuro: TStringField
      FieldName = 'TipoJuro'
      Size = 1
    end
    object mBoletosBoletoPorEmail: TBooleanField
      FieldName = 'BoletoPorEmail'
    end
    object mBoletosVlrTaxaBanco: TFloatField
      FieldName = 'VlrTaxaBanco'
    end
    object mBoletosGeraNossoNumero: TStringField
      FieldName = 'GeraNossoNumero'
      Size = 1
    end
    object mBoletosGerarRemessa: TStringField
      FieldName = 'GerarRemessa'
      Size = 1
    end
    object mBoletosMensagem: TStringField
      FieldName = 'Mensagem'
      Size = 30
    end
    object mBoletosVlrJurosDia_Calculado: TFloatField
      FieldName = 'VlrJurosDia_Calculado'
    end
    object mBoletosCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object mBoletosCodBanco: TIntegerField
      FieldName = 'CodBanco'
    end
  end
  object tCReceberParcRem2: TTable
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Filial;NumCReceber;ParcCReceber;ItemHist;ItemRem'
    MasterFields = 'Filial;NumCReceber;ParcCReceber'
    MasterSource = DM1.dsCReceberParc
    TableName = 'dbCReceberParcRem.DB'
    Left = 432
    Top = 320
    object tCReceberParcRem2Filial: TIntegerField
      FieldName = 'Filial'
    end
    object tCReceberParcRem2NumCReceber: TIntegerField
      FieldName = 'NumCReceber'
    end
    object tCReceberParcRem2ParcCReceber: TIntegerField
      FieldName = 'ParcCReceber'
    end
    object tCReceberParcRem2ItemHist: TIntegerField
      FieldName = 'ItemHist'
    end
    object tCReceberParcRem2ItemRem: TIntegerField
      FieldName = 'ItemRem'
    end
    object tCReceberParcRem2CodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object tCReceberParcRem2Instrucao: TStringField
      FieldName = 'Instrucao'
      Size = 50
    end
    object tCReceberParcRem2CampoAlterado: TStringField
      FieldName = 'CampoAlterado'
      Size = 50
    end
    object tCReceberParcRem2EspDoc: TStringField
      FieldName = 'EspDoc'
      Size = 50
    end
    object tCReceberParcRem2CodAceite: TStringField
      FieldName = 'CodAceite'
      Size = 10
    end
    object tCReceberParcRem2InstProtesto: TStringField
      FieldName = 'InstProtesto'
      Size = 40
    end
    object tCReceberParcRem2DiasProtesto: TIntegerField
      FieldName = 'DiasProtesto'
    end
    object tCReceberParcRem2TaxaMulta: TFloatField
      FieldName = 'TaxaMulta'
    end
    object tCReceberParcRem2TipoJuros: TStringField
      FieldName = 'TipoJuros'
    end
    object tCReceberParcRem2VlrJuros: TFloatField
      FieldName = 'VlrJuros'
    end
    object tCReceberParcRem2TipoDesconto: TStringField
      FieldName = 'TipoDesconto'
    end
    object tCReceberParcRem2VlrDesconto: TFloatField
      FieldName = 'VlrDesconto'
    end
    object tCReceberParcRem2DtLimiteDesconto: TStringField
      FieldName = 'DtLimiteDesconto'
      Size = 10
    end
    object tCReceberParcRem2VlrDescAntecipacao: TFloatField
      FieldName = 'VlrDescAntecipacao'
    end
    object tCReceberParcRem2VlrAbatimento: TFloatField
      FieldName = 'VlrAbatimento'
    end
    object tCReceberParcRem2Avalista: TStringField
      FieldName = 'Avalista'
      Size = 40
    end
    object tCReceberParcRem2CnpjAvalista: TStringField
      FieldName = 'CnpjAvalista'
      Size = 18
    end
    object tCReceberParcRem2DtVecto: TStringField
      FieldName = 'DtVecto'
      Size = 10
    end
    object tCReceberParcRem2CodCedente: TStringField
      FieldName = 'CodCedente'
      Size = 15
    end
    object tCReceberParcRem2CepAvalista: TStringField
      FieldName = 'CepAvalista'
      Size = 9
    end
    object tCReceberParcRem2EndAvalista: TStringField
      FieldName = 'EndAvalista'
      Size = 45
    end
    object tCReceberParcRem2CidAvalista: TStringField
      FieldName = 'CidAvalista'
      Size = 30
    end
    object tCReceberParcRem2UFAvalista: TStringField
      FieldName = 'UFAvalista'
      Size = 2
    end
    object tCReceberParcRem2ImpBoleto: TStringField
      FieldName = 'ImpBoleto'
      Size = 15
    end
    object tCReceberParcRem2InstrCobranca1: TStringField
      FieldName = 'InstrCobranca1'
      Size = 50
    end
    object tCReceberParcRem2InstrCobranca2: TStringField
      FieldName = 'InstrCobranca2'
      Size = 50
    end
    object tCReceberParcRem2NumCarteira: TStringField
      FieldName = 'NumCarteira'
      Size = 50
    end
    object tCReceberParcRem2BairroAvalista: TStringField
      FieldName = 'BairroAvalista'
      Size = 30
    end
    object tCReceberParcRem2Email: TStringField
      FieldName = 'Email'
      Size = 100
    end
    object tCReceberParcRem2BoletoPorEmail: TBooleanField
      FieldName = 'BoletoPorEmail'
    end
    object tCReceberParcRem2NumTitBanco: TStringField
      FieldName = 'NumTitBanco'
    end
    object tCReceberParcRem2TipoDocumentoST: TStringField
      FieldName = 'TipoDocumentoST'
      Size = 50
    end
    object tCReceberParcRem2CodCompensacaoST: TStringField
      FieldName = 'CodCompensacaoST'
      Size = 3
    end
    object tCReceberParcRem2CodBaixaST: TStringField
      FieldName = 'CodBaixaST'
      Size = 50
    end
    object tCReceberParcRem2CodProtestoST: TStringField
      FieldName = 'CodProtestoST'
      Size = 50
    end
    object tCReceberParcRem2FormaCadastramentoST: TStringField
      FieldName = 'FormaCadastramentoST'
      Size = 50
    end
    object tCReceberParcRem2NumRemessaST: TIntegerField
      FieldName = 'NumRemessaST'
    end
    object tCReceberParcRem2CodTransmissaoST: TStringField
      FieldName = 'CodTransmissaoST'
      Size = 15
    end
    object tCReceberParcRem2DiasBaixa: TIntegerField
      FieldName = 'DiasBaixa'
    end
    object tCReceberParcRem2VlrIOF: TFloatField
      FieldName = 'VlrIOF'
    end
    object tCReceberParcRem2CodMulta: TStringField
      FieldName = 'CodMulta'
      Size = 15
    end
    object tCReceberParcRem2DtMulta: TStringField
      FieldName = 'DtMulta'
      Size = 10
    end
    object tCReceberParcRem2VlrMulta: TFloatField
      FieldName = 'VlrMulta'
    end
    object tCReceberParcRem2TipoDesconto2: TStringField
      FieldName = 'TipoDesconto2'
    end
    object tCReceberParcRem2DtLimiteDesconto2: TStringField
      FieldName = 'DtLimiteDesconto2'
      Size = 10
    end
    object tCReceberParcRem2VlrDesconto2: TFloatField
      FieldName = 'VlrDesconto2'
    end
    object tCReceberParcRem2IncidenciaMulta: TStringField
      FieldName = 'IncidenciaMulta'
      Size = 1
    end
    object tCReceberParcRem2QtdDiasMulta: TIntegerField
      FieldName = 'QtdDiasMulta'
    end
  end
  object RLBRemessa1: TRLBRemessa
    NumeroArquivo = 0
    LayoutArquivo = laCNAB400
    TipoMovimento = tmRetorno
    Left = 488
    Top = 368
  end
  object RLBTitulo1: TRLBTitulo
    BoletoLayout = blCarne
    PrintDialog = True
    TipoOcorrencia = toRemessaRegistrar
    LocalPagamento = 'PAG'#193'VEL EM QUALQUER BANCO AT'#201' O VENCIMENTO'
    Cedente.TipoInscricao = tiPessoaFisica
    Sacado.TipoInscricao = tiPessoaFisica
    AceiteDocumento = adNao
    EspecieDocumento = edDuplicataMercantil
    EmissaoBoleto = ebClienteEmite
    LayoutNN = lnC7_N10
    Versao = '1.1.5'
    Left = 523
    Top = 368
  end
  object qCarteira: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CODBANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODCARTEIRA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT C.CODCARTEIRA, C.GERARNOSSONUMERO, C.GERARREMESSA'
      'FROM CARTEIRA C'
      'WHERE C.CODBANCO = :CODBANCO'
      '  AND C.CODCARTEIRA = :CODCARTEIRA'
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 400
    Top = 232
    object qCarteiraCODCARTEIRA: TStringField
      FieldName = 'CODCARTEIRA'
      Size = 3
    end
    object qCarteiraGERARNOSSONUMERO: TStringField
      FieldName = 'GERARNOSSONUMERO'
      FixedChar = True
      Size = 1
    end
    object qCarteiraGERARREMESSA: TStringField
      FieldName = 'GERARREMESSA'
      FixedChar = True
      Size = 1
    end
  end
end
