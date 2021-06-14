object fChequeCPagar: TfChequeCPagar
  Left = 176
  Top = 186
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Digita'#231#227'o dos Itens'
  ClientHeight = 255
  ClientWidth = 521
  Color = clMoneyGreen
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
  object Shape1: TShape
    Left = 0
    Top = 124
    Width = 521
    Height = 4
    Brush.Color = clBlue
  end
  object Panel1: TPanel
    Left = 0
    Top = 218
    Width = 521
    Height = 37
    Align = alBottom
    TabOrder = 4
    object SpeedButton7: TSpeedButton
      Left = 188
      Top = 5
      Width = 117
      Height = 28
      Hint = 'Cancela a inser'#231#227'o do produto'
      Caption = 'Cancela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        B2050000424DB205000000000000360400002800000012000000130000000100
        0800000000007C010000C30E0000C30E00000001000000000000000000007B00
        0000BD000000FF0000007B7B000000FF0000FFFF000000315A0008427300084A
        730000007B007B007B00084A7B0008527B0021527B00007B7B007B7B7B00004A
        840008528400105284002963840008528C00085A8C00185A8C0018638C002963
        8C0008529400185A9400296B9400316B94002973940031739400085A9C001863
        9C0018739C0029739C0031739C0031849C00005AA5002173A5003973A500297B
        A500186BAD00106BB500317BB5002984B5004A8CB500086BBD000073BD001073
        BD001873BD00217BBD004284BD00318CBD004A8CBD005294BD005A9CBD00BDBD
        BD001073C600007BC600217BC600428CC6004A8CC6005A9CC6000084CE000884
        CE00398CCE005A9CCE00639CCE001884D6002184D600088CD600108CD6004294
        D600399CD6004A9CD600529CD6005A9CD6005AA5D60063ADD6001884DE002184
        DE00188CDE001094DE001894DE003194DE00299CDE004AA5DE005AA5DE004AB5
        DE00189CE700219CE700429CE7005AA5E7005AADE70063ADE7006BB5E70021A5
        EF0029A5EF0031A5EF0063B5EF006BBDEF0029ADF70031ADF7006BBDF7000000
        FF00FF00FF0031B5FF0039B5FF0042B5FF0039BDFF0042BDFF0042C6FF004AC6
        FF006BC6FF004ACEFF0052CEFF0052D6FF005ADEFF0063E7FF0000FFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00393939393939
        3939393939393939393939690000396939393939393939393939393939396939
        0000396969393910101010101010101010693939000039696969000000000000
        0000000069693939000039396969007879797978797979696939393900003939
        3969697903030303030379691039393900003939396969697978797979786969
        1039393900003939393969696903030369696900103939390000393939390069
        6969797869697900103939390000393939390079036969696903790010393939
        0000393939390079796969696978790010393939000039393939007903696969
        6900000010393939000039393939007869697900696979001039393900003939
        3939006969697900696969693939393900003939396969697978790079003969
        6939393900003969696969000000000000393939696939390000396969693939
        3939393939393939393969390000393939393939393939393939393939393969
        00003939393939393939393939393939393939390000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton7Click
    end
    object BitBtn6: TBitBtn
      Left = 70
      Top = 5
      Width = 117
      Height = 28
      Hint = 'Confirma a inser'#231#227'o do produto'
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn6Click
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000007777777777777777700000007777777774F77777700000007777
        7777444F77777000000077777774444F777770000000700000444F44F7777000
        000070FFF444F0744F777000000070F8884FF0774F777000000070FFFFFFF077
        74F77000000070F88888F077774F7000000070FFFFFFF0777774F000000070F8
        8777F07777774000000070FFFF00007777777000000070F88707077777777000
        000070FFFF007777777770000000700000077777777770000000777777777777
        777770000000}
    end
    object BitBtn1: TBitBtn
      Left = 306
      Top = 5
      Width = 117
      Height = 28
      Hint = 'Fecha a janela atual'
      Caption = '(F10) Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn1Click
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
  object StaticText11: TStaticText
    Left = 17
    Top = 163
    Width = 88
    Height = 17
    Alignment = taCenter
    BorderStyle = sbsSunken
    Caption = 'Valor Pagamento:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object CurrencyEdit10: TCurrencyEdit
    Left = 107
    Top = 160
    Width = 78
    Height = 21
    AutoSize = False
    DisplayFormat = '###,###,##0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnExit = CurrencyEdit10Exit
  end
  object StaticText12: TStaticText
    Left = 46
    Top = 186
    Width = 59
    Height = 17
    Alignment = taCenter
    BorderStyle = sbsSunken
    Caption = 'Valor Juros:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object CurrencyEdit11: TCurrencyEdit
    Left = 107
    Top = 183
    Width = 78
    Height = 21
    AutoSize = False
    DisplayFormat = '###,###,##0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object StaticText15: TStaticText
    Left = 25
    Top = 140
    Width = 80
    Height = 17
    Alignment = taCenter
    BorderStyle = sbsSunken
    Caption = 'Valor Desconto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object CurrencyEdit12: TCurrencyEdit
    Left = 107
    Top = 137
    Width = 78
    Height = 21
    AutoSize = False
    DisplayFormat = '###,###,##0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnExit = CurrencyEdit12Exit
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 521
    Height = 121
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    OnExit = Panel2Exit
    object StaticText8: TStaticText
      Left = 21
      Top = 32
      Width = 61
      Height = 17
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Fornecedor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object RxDBLookupCombo10: TRxDBLookupCombo
      Left = 84
      Top = 29
      Width = 307
      Height = 21
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'CodForn'
      LookupDisplay = 'NomeForn'
      LookupSource = DM1.dsFornecedores
      ParentFont = False
      TabOrder = 1
      OnEnter = RxDBLookupCombo10Enter
    end
    object BitBtn2: TBitBtn
      Left = 160
      Top = 53
      Width = 126
      Height = 26
      Caption = 'Busca duplicatas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn2Click
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
        FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
        0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
        870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
        FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
        0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
    end
    object CurrencyEdit7: TCurrencyEdit
      Left = 84
      Top = 84
      Width = 73
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 4
    end
    object StaticText6: TStaticText
      Left = 39
      Top = 87
      Width = 43
      Height = 17
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Parcela:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object StaticText9: TStaticText
      Left = 15
      Top = 60
      Width = 67
      Height = 17
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'N'#186' Duplicata:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object StaticText10: TStaticText
      Left = 243
      Top = 87
      Width = 68
      Height = 17
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Vlr. Restante:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object CurrencyEdit9: TCurrencyEdit
      Left = 313
      Top = 83
      Width = 80
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInfoBk
      DisplayFormat = '###,###,##0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object StaticText1: TStaticText
      Left = 439
      Top = 44
      Width = 78
      Height = 17
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'N'#186' Lan'#231'amento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 439
      Top = 62
      Width = 78
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clInfoBk
      DecimalPlaces = 0
      DisplayFormat = '0'
      ReadOnly = True
      TabOrder = 11
    end
    object StaticText2: TStaticText
      Left = 55
      Top = 7
      Width = 27
      Height = 17
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Filial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 84
      Top = 4
      Width = 307
      Height = 21
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'Codigo'
      LookupDisplay = 'Empresa'
      LookupSource = DM1.dsFilial
      ParentFont = False
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 85
      Top = 56
      Width = 74
      Height = 21
      TabOrder = 2
    end
  end
  object tCPagarParc2: TTable
    DatabaseName = 'Tabelas'
    TableName = 'dbCPagarParc.DB'
    Left = 280
    Top = 176
    object tCPagarParc2Filial: TIntegerField
      FieldName = 'Filial'
    end
    object tCPagarParc2NumCPagar: TIntegerField
      FieldName = 'NumCPagar'
    end
    object tCPagarParc2ParcCPagar: TIntegerField
      FieldName = 'ParcCPagar'
    end
    object tCPagarParc2DtVencCPagar: TDateField
      FieldName = 'DtVencCPagar'
    end
    object tCPagarParc2VlrParcCPagar: TFloatField
      FieldName = 'VlrParcCPagar'
    end
    object tCPagarParc2QuitParcCPagar: TBooleanField
      FieldName = 'QuitParcCPagar'
    end
    object tCPagarParc2DtPagParcCPagar: TDateField
      FieldName = 'DtPagParcCPagar'
    end
    object tCPagarParc2JurosParcCPagar: TFloatField
      FieldName = 'JurosParcCPagar'
    end
    object tCPagarParc2CodForn: TIntegerField
      FieldName = 'CodForn'
    end
    object tCPagarParc2NumNotaEnt: TIntegerField
      FieldName = 'NumNotaEnt'
    end
    object tCPagarParc2Desconto: TFloatField
      FieldName = 'Desconto'
    end
    object tCPagarParc2PgtoParcial: TFloatField
      FieldName = 'PgtoParcial'
    end
    object tCPagarParc2RestParcela: TFloatField
      FieldName = 'RestParcela'
    end
    object tCPagarParc2Banco: TStringField
      FieldName = 'Banco'
      Size = 40
    end
    object tCPagarParc2PlanoContas: TIntegerField
      FieldName = 'PlanoContas'
    end
    object tCPagarParc2NroDuplicata: TIntegerField
      FieldName = 'NroDuplicata'
    end
    object tCPagarParc2Despesas: TFloatField
      FieldName = 'Despesas'
    end
    object tCPagarParc2Abatimentos: TFloatField
      FieldName = 'Abatimentos'
    end
    object tCPagarParc2CodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object tCPagarParc2DiasAtraso: TFloatField
      FieldName = 'DiasAtraso'
    end
    object tCPagarParc2JurosPagos: TFloatField
      FieldName = 'JurosPagos'
    end
    object tCPagarParc2CodTipoCobranca: TIntegerField
      FieldName = 'CodTipoCobranca'
    end
    object tCPagarParc2NroFatura: TIntegerField
      FieldName = 'NroFatura'
    end
    object tCPagarParc2DtRecto: TDateField
      FieldName = 'DtRecto'
    end
    object tCPagarParc2VlrDevolucao: TFloatField
      FieldName = 'VlrDevolucao'
    end
    object tCPagarParc2VlrDevolucaoFrete: TFloatField
      FieldName = 'VlrDevolucaoFrete'
    end
    object tCPagarParc2CodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object tCPagarParc2CodPlanoContasItens: TIntegerField
      FieldName = 'CodPlanoContasItens'
    end
    object tCPagarParc2DtGerado: TDateField
      FieldName = 'DtGerado'
    end
    object tCPagarParc2CodAtelier: TIntegerField
      FieldName = 'CodAtelier'
    end
  end
end
