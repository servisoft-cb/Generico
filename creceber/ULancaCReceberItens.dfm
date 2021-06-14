object fLancaCReceberItens: TfLancaCReceberItens
  Left = 317
  Top = 138
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Digita'#231#227'o de Itens'
  ClientHeight = 395
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 31
    Top = 188
    Width = 74
    Height = 13
    Caption = 'Plano Conta:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 41
    Top = 212
    Width = 64
    Height = 13
    Caption = 'Sub-Conta:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton8: TSpeedButton
    Left = 351
    Top = 177
    Width = 25
    Height = 25
    Hint = 'Abre o cadastro do plano de contas'
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
      000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
      00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
      8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
      8888880BB088888888888800008888888888}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton8Click
  end
  object Label1: TLabel
    Left = 57
    Top = 19
    Width = 48
    Height = 13
    Caption = 'Parcela:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 36
    Top = 42
    Width = 66
    Height = 13
    Caption = 'Data Vcto.:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 71
    Top = 66
    Width = 34
    Height = 13
    Caption = 'Valor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 64
    Top = 90
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'Banco:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 18
    Top = 116
    Width = 87
    Height = 13
    Caption = 'Nosso N'#250'mero:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 46
    Top = 140
    Width = 59
    Height = 13
    Caption = 'Vendedor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 34
    Top = 164
    Width = 71
    Height = 13
    Caption = '% Comiss'#227'o:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 17
    Top = 237
    Width = 88
    Height = 13
    Caption = 'Tipo Cobran'#231'a:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 351
    Top = 226
    Width = 25
    Height = 25
    Hint = 'Abre o cadastro do plano de contas'
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
      000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
      00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
      8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
      8888880BB088888888888800008888888888}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 358
    Width = 395
    Height = 37
    Align = alBottom
    TabOrder = 11
    object SpeedButton7: TSpeedButton
      Left = 194
      Top = 5
      Width = 135
      Height = 28
      Hint = 'Cancela a inser'#231#227'o do produto'
      Caption = 'Cancelar/Fechar'
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
      Left = 59
      Top = 5
      Width = 135
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
  end
  object CurrencyEdit2: TCurrencyEdit
    Left = 106
    Top = 12
    Width = 60
    Height = 21
    AutoSize = False
    DisplayFormat = '0'
    TabOrder = 0
  end
  object DateEdit1: TDateEdit
    Left = 106
    Top = 36
    Width = 90
    Height = 21
    Hint = 'Selecione uma data'
    CalendarHints.Strings = (
      'Ano Anterior'
      'M'#234's Anterior'
      'Pr'#243'ximo M'#234's'
      'Pr'#243'ximo Ano')
    GlyphKind = gkCustom
    Glyph.Data = {
      E2020000424DE20200000000000042000000280000001C0000000C0000000100
      100003000000A002000000000000000000000000000000000000007C0000E003
      00001F0000001F7C1F7C1F7CEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
      EF3D1F7C1F7CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F7C
      1F7C000000000F0000000F000F0000000F00000000000F00EF3D1F7CEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DFF7F1F7C1F7CFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0F00EF3D1F7CEF3DFF7F1F7CFF7FFF7FFF7F
      1F7CFF7FFF7FFF7F1F7CEF3DFF7F1F7C1F7CFF7F000000000000FF7F00000000
      0000F75EFF7F0F00EF3D1F7CEF3DFF7FEF3DEF3DEF3D1F7CEF3DEF3DEF3D1F7C
      FF7FEF3DFF7F1F7C1F7CFF7FFF7F0000FF7FFF7FF75EFF7FF75E0000FF7F0F00
      EF3D1F7CEF3DFF7F1F7CEF3DFF7F1F7C1F7C1F7C1F7CEF3DFF7FEF3DFF7F1F7C
      1F7CFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7F0F00EF3D1F7CEF3DFF7F
      1F7CEF3DFF7F1F7C1F7CFF7FFF7FEF3D1F7CEF3DFF7F1F7C1F7CFF7FFF7F0000
      FF7FFF7F000000000000F75EFF7F0F00EF3D1F7CEF3DFF7F1F7CEF3DFF7F1F7C
      EF3DEF3DEF3D1F7C1F7CEF3DFF7F1F7C1F7CFF7F00000000FF7FFF7F0000FF7F
      FF7FFF7FFF7F0F00EF3D1F7CEF3DFF7FEF3DEF3DFF7F1F7CEF3DFF7FFF7FFF7F
      FF7FEF3DFF7F1F7C1F7CFF7FFF7F0000FF7FFF7F0000000000000000FF7F0F00
      EF3D1F7CEF3DFF7F1F7CEF3D1F7C1F7CEF3DEF3DEF3DEF3D1F7CEF3DFF7F1F7C
      1F7CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0F00EF3D1F7CEF3DFF7F
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CEF3DFF7F1F7C1F7CFF7FF75EF75E
      F75EF75EF75EF75EF75EF75EFF7F0F00EF3D1F7CEF3DFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FEF3DFF7F1F7C1F7C0000000000000000000000000000
      0000000000001F7C1F7C1F7CEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
      EF3DEF3D1F7C}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    StartOfWeek = Sun
    TabOrder = 1
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 106
    Top = 60
    Width = 90
    Height = 21
    AutoSize = False
    DisplayFormat = '0.00'
    TabOrder = 2
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 106
    Top = 84
    Width = 277
    Height = 21
    DropDownCount = 18
    LookupField = 'CodConta'
    LookupDisplay = 'NomeConta'
    LookupSource = DM1.dsContas
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    OnCloseUp = RxDBLookupCombo1Exit
    OnExit = RxDBLookupCombo1Exit
  end
  object RxDBLookupCombo3: TRxDBLookupCombo
    Left = 106
    Top = 180
    Width = 244
    Height = 21
    DropDownCount = 18
    DropDownWidth = 500
    LookupField = 'Codigo'
    LookupDisplay = 'Descricao;Inativo'
    LookupSource = DM1.dsPlanoContas
    ParentShowHint = False
    ShowHint = False
    TabOrder = 7
  end
  object RxDBLookupCombo6: TRxDBLookupCombo
    Left = 106
    Top = 204
    Width = 244
    Height = 21
    DropDownCount = 8
    LookupField = 'CodItem'
    LookupDisplay = 'Nome'
    LookupSource = DM1.dsPlanoContasItens
    TabOrder = 8
    OnEnter = RxDBLookupCombo6Enter
  end
  object Edit1: TEdit
    Left = 106
    Top = 108
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object RxDBLookupCombo5: TRxDBLookupCombo
    Left = 106
    Top = 132
    Width = 277
    Height = 21
    DropDownCount = 8
    Color = clWhite
    LookupField = 'Codigo'
    LookupDisplay = 'Nome'
    LookupSource = DM1.dsVendedor
    TabOrder = 5
  end
  object CurrencyEdit3: TCurrencyEdit
    Left = 106
    Top = 156
    Width = 60
    Height = 21
    AutoSize = False
    Color = clWhite
    DisplayFormat = '0.00'
    TabOrder = 6
  end
  object RxDBLookupCombo2: TRxDBLookupCombo
    Left = 106
    Top = 229
    Width = 244
    Height = 21
    DropDownCount = 18
    LookupField = 'Codigo'
    LookupDisplay = 'Nome'
    LookupSource = DM1.dsTipoCobranca
    ParentShowHint = False
    ShowHint = False
    TabOrder = 9
    OnEnter = RxDBLookupCombo2Enter
  end
  object gbxVendedor: TRzGroupBox
    Left = 5
    Top = 273
    Width = 387
    Height = 66
    BorderColor = clNavy
    BorderInner = fsButtonUp
    BorderOuter = fsBump
    Caption = ' Impress'#227'o da Duplicata '
    Ctl3D = True
    FlatColor = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 10
    VisualStyle = vsGradient
    object Label83: TLabel
      Left = 14
      Top = 24
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desconto de:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label21: TLabel
      Left = 59
      Top = 47
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'At'#233':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit2: TEdit
      Left = 80
      Top = 16
      Width = 265
      Height = 21
      MaxLength = 20
      TabOrder = 0
    end
    object Edit3: TEdit
      Left = 81
      Top = 40
      Width = 265
      Height = 21
      MaxLength = 20
      TabOrder = 1
    end
  end
  object RxFilterPlanoContas: TRxDBFilter
    DataSource = DM1.dsPlanoContas
    Filter.Strings = (
      'Inativo <> True')
    Left = 300
    Top = 23
  end
end
