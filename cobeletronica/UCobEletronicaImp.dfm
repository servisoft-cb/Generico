object fCobEletronicaImp: TfCobEletronicaImp
  Left = 191
  Top = 71
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cobran'#231'a Eletr'#244'nica (Impress'#227'o Boleto)'
  ClientHeight = 550
  ClientWidth = 967
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 74
    Width = 967
    Height = 476
    Align = alClient
    DataSource = dsmBoletos
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Flat = False
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'MS Sans Serif'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 27
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 14
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'IDCobEletronica'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Mov. Remessa'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumCarteira'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Carteira'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumNota'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Nota'
        Width = 63
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Serie'
        Title.Alignment = taCenter
        Title.Caption = 'S'#233'rie'
        Width = 38
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Parcela'
        Title.Alignment = taCenter
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NossoNumero'
        Title.Alignment = taCenter
        Title.Caption = 'Nosso N'#186' (Banco)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrParcela'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Parcela'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtEmissao'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Emiss'#227'o'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtVencimento'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Vecto.'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeCliente'
        Title.Alignment = taCenter
        Title.Caption = 'Cliente'
        Width = 252
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeConta'
        Title.Alignment = taCenter
        Title.Caption = 'Banco'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodCliente'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Cliente'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumCReceber'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' C.Receber'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 967
    Height = 74
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 281
      Top = 24
      Width = 78
      Height = 13
      Caption = 'Tipo de Carteira:'
    end
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Label2'
    end
    object Label3: TLabel
      Left = 287
      Top = 56
      Width = 72
      Height = 13
      Caption = 'Tipo do Boleto:'
    end
    object BitBtn4: TBitBtn
      Left = 6
      Top = 40
      Width = 141
      Height = 28
      Hint = 'Confirma as altera'#231#245'es abaixo'
      Caption = 'Imprimir Boletos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn4Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888800000000000888808888888880808800000000000008080888888BBB88
        0008088888877788080800000000000008800888888888808080800000000008
        0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
        088888880FFFFFFFF08888888000000000888888888888888888}
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 360
      Top = 16
      Width = 257
      Height = 21
      DropDownCount = 8
      DropDownWidth = 500
      ListStyle = lsDelimited
      LookupField = 'CODCARTEIRA'
      LookupDisplay = 'CODCARTEIRA;NOMECARTEIRA'
      LookupSource = DMCarteira.dsCarteira
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 618
      Top = 12
      Width = 95
      Height = 25
      Caption = 'Alterar Carteira'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object ComboBox1: TComboBox
      Left = 360
      Top = 48
      Width = 161
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = 'Padr'#227'o (Folha A4)'
      Items.Strings = (
        'Padr'#227'o (Folha A4)'
        'Tipo Carne')
    end
    object BitBtn5: TBitBtn
      Left = 833
      Top = 21
      Width = 124
      Height = 28
      Hint = 'Fecha a janela atual'
      Caption = '&Fechar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
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
  end
  object dsmBoletos: TDataSource
    DataSet = mBoletos
    Left = 296
    Top = 192
  end
  object mBoletos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NumCReceber'
        DataType = ftInteger
      end
      item
        Name = 'Parcela'
        DataType = ftInteger
      end
      item
        Name = 'NumNota'
        DataType = ftInteger
      end
      item
        Name = 'VlrParcela'
        DataType = ftFloat
      end
      item
        Name = 'ArqGerado'
        DataType = ftBoolean
      end
      item
        Name = 'DtEmissao'
        DataType = ftDate
      end
      item
        Name = 'DtVencimento'
        DataType = ftDate
      end
      item
        Name = 'CodCliente'
        DataType = ftInteger
      end
      item
        Name = 'NomeCliente'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NomeConta'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CodConta'
        DataType = ftInteger
      end
      item
        Name = 'Filial'
        DataType = ftInteger
      end
      item
        Name = 'Serie'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NumSeqNota'
        DataType = ftInteger
      end
      item
        Name = 'IDCobEletronica'
        DataType = ftInteger
      end
      item
        Name = 'NossoNumero'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EspecieDoc'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Aceite'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CNPJCPF'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'NumCarteira'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Pessoa'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DiasProtesto'
        DataType = ftInteger
      end
      item
        Name = 'VlrJurosPorDia'
        DataType = ftFloat
      end
      item
        Name = 'TipoJuro'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VlrDesconto'
        DataType = ftFloat
      end
      item
        Name = 'DtLimiteDesc'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TipoDesconto'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Endereco'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Cep'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TipoCN'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VlrMulta'
        DataType = ftFloat
      end
      item
        Name = 'GeraNossoNumero'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'GerarRemessa'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Mensagem'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'VlrJurosDia_Calculado'
        DataType = ftFloat
      end
      item
        Name = 'NumCarteira_Imp'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NumEnd'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'NumNota;Parcela'
    Params = <>
    StoreDefs = True
    OnNewRecord = mBoletosNewRecord
    Left = 273
    Top = 193
    Data = {
      230400009619E0BD01000000180000002800000000000300000023040B4E756D
      435265636562657204000100000000000750617263656C610400010000000000
      074E756D4E6F746104000100000000000A566C7250617263656C610800040000
      0000000941727147657261646F0200030000000000094474456D697373616F04
      000600000000000C447456656E63696D656E746F04000600000000000A436F64
      436C69656E746504000100000000000B4E6F6D65436C69656E74650100490000
      000100055749445448020002002800094E6F6D65436F6E746101004900000001
      00055749445448020002001E0008436F64436F6E746104000100000000000646
      696C69616C040001000000000005536572696501004900000001000557494454
      480200020003000A4E756D5365714E6F746104000100000000000F4944436F62
      456C6574726F6E69636104000100000000000B4E6F73736F4E756D65726F0100
      4900000001000557494454480200020014000A45737065636965446F63010049
      0000000100055749445448020002000200064163656974650100490000000100
      05574944544802000200010007434E504A435046010049000000010005574944
      54480200020012000B4E756D4361727465697261010049000000010005574944
      544802000200030006506573736F610100490000000100055749445448020002
      0001000C4469617350726F746573746F04000100000000000E566C724A75726F
      73506F724469610800040000000000085469706F4A75726F0100490000000100
      0557494454480200020001000B566C72446573636F6E746F0800040000000000
      0C44744C696D697465446573630100490000000100055749445448020002000A
      000C5469706F446573636F6E746F010049000000010005574944544802000200
      020008456E64657265636F0100490000000100055749445448020002003C0003
      4365700100490000000100055749445448020002000900064369646164650100
      4900000001000557494454480200020028000255460100490000000100055749
      4454480200020002000642616972726F01004900000001000557494454480200
      02001E00065469706F434E010049000000010005574944544802000200010008
      566C724D756C746108000400000000000F476572614E6F73736F4E756D65726F
      01004900000001000557494454480200020001000C476572617252656D657373
      610100490000000100055749445448020002000100084D656E736167656D0100
      49000000010005574944544802000200280015566C724A75726F734469615F43
      616C63756C61646F08000400000000000F4E756D43617274656972615F496D70
      0100490000000100055749445448020002000300064E756D456E640100490000
      000100055749445448020002000A0001000D44454641554C545F4F5244455202
      00820000000000}
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
      DisplayFormat = '###,###,##0.00'
    end
    object mBoletosArqGerado: TBooleanField
      FieldName = 'ArqGerado'
    end
    object mBoletosDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object mBoletosDtVencimento: TDateField
      FieldName = 'DtVencimento'
    end
    object mBoletosCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object mBoletosNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 40
    end
    object mBoletosNomeConta: TStringField
      FieldName = 'NomeConta'
      Size = 30
    end
    object mBoletosCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object mBoletosFilial: TIntegerField
      FieldName = 'Filial'
    end
    object mBoletosSerie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object mBoletosNumSeqNota: TIntegerField
      FieldName = 'NumSeqNota'
    end
    object mBoletosIDCobEletronica: TIntegerField
      FieldName = 'IDCobEletronica'
    end
    object mBoletosNossoNumero: TStringField
      FieldName = 'NossoNumero'
    end
    object mBoletosEspecieDoc: TStringField
      FieldName = 'EspecieDoc'
      Size = 2
    end
    object mBoletosAceite: TStringField
      FieldName = 'Aceite'
      Size = 1
    end
    object mBoletosCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Size = 18
    end
    object mBoletosNumCarteira: TStringField
      FieldName = 'NumCarteira'
      Size = 3
    end
    object mBoletosPessoa: TStringField
      FieldName = 'Pessoa'
      Size = 1
    end
    object mBoletosDiasProtesto: TIntegerField
      FieldName = 'DiasProtesto'
    end
    object mBoletosVlrJurosPorDia: TFloatField
      FieldName = 'VlrJurosPorDia'
    end
    object mBoletosTipoJuro: TStringField
      FieldName = 'TipoJuro'
      Size = 1
    end
    object mBoletosVlrDesconto: TFloatField
      FieldName = 'VlrDesconto'
    end
    object mBoletosDtLimiteDesc: TStringField
      FieldName = 'DtLimiteDesc'
      Size = 10
    end
    object mBoletosTipoDesconto: TStringField
      FieldName = 'TipoDesconto'
      Size = 2
    end
    object mBoletosEndereco: TStringField
      FieldName = 'Endereco'
      Size = 60
    end
    object mBoletosCep: TStringField
      FieldName = 'Cep'
      Size = 9
    end
    object mBoletosCidade: TStringField
      FieldName = 'Cidade'
      Size = 40
    end
    object mBoletosUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object mBoletosBairro: TStringField
      FieldName = 'Bairro'
      Size = 30
    end
    object mBoletosTipoCN: TStringField
      FieldName = 'TipoCN'
      Size = 1
    end
    object mBoletosVlrMulta: TFloatField
      FieldName = 'VlrMulta'
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
      Size = 40
    end
    object mBoletosVlrJurosDia_Calculado: TFloatField
      FieldName = 'VlrJurosDia_Calculado'
    end
    object mBoletosNumCarteira_Imp: TStringField
      FieldName = 'NumCarteira_Imp'
      Size = 3
    end
    object mBoletosNumEnd: TStringField
      FieldName = 'NumEnd'
      Size = 10
    end
  end
  object RLBTitulo1: TRLBTitulo
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
    Left = 465
    Top = 225
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
      
        'SELECT C.CODCARTEIRA, C.GERARNOSSONUMERO, C.GERARREMESSA, C.CODC' +
        'ARTEIRA_IMP'
      'FROM CARTEIRA C'
      'WHERE C.CODBANCO = :CODBANCO'
      '  AND C.CODCARTEIRA = :CODCARTEIRA'
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 408
    Top = 280
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
    object qCarteiraCODCARTEIRA_IMP: TStringField
      FieldName = 'CODCARTEIRA_IMP'
      Size = 3
    end
  end
end
