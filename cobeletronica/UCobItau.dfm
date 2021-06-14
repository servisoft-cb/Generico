object fCobItau: TfCobItau
  Left = 7
  Top = 10
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cobran'#231'a Eletr'#244'nica Ita'#250' - Layout CNAB 400'
  ClientHeight = 548
  ClientWidth = 780
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 548
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 778
      Height = 145
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 11
        Top = 34
        Width = 56
        Height = 13
        Caption = 'Data Inicial:'
      end
      object Label2: TLabel
        Left = 245
        Top = 34
        Width = 51
        Height = 13
        Caption = 'Data Final:'
      end
      object Label5: TLabel
        Left = 32
        Top = 56
        Width = 35
        Height = 13
        Caption = 'Cliente:'
      end
      object Bevel1: TBevel
        Left = 0
        Top = 94
        Width = 775
        Height = 2
        Shape = bsTopLine
        Style = bsRaised
      end
      object Bevel2: TBevel
        Left = 0
        Top = 124
        Width = 776
        Height = 2
        Shape = bsTopLine
        Style = bsRaised
      end
      object Label3: TLabel
        Left = 370
        Top = 130
        Width = 138
        Height = 13
        Caption = 'Parcela j'#225' gerada em arquivo'
      end
      object ALed1: TALed
        Left = 350
        Top = 127
        Width = 16
        Height = 16
        FalseColor = clGreen
      end
      object Label4: TLabel
        Left = 570
        Top = 130
        Width = 148
        Height = 13
        Caption = 'Parcela n'#227'o gerada em arquivo'
      end
      object ALed2: TALed
        Left = 550
        Top = 127
        Width = 16
        Height = 16
        FalseColor = clWhite
      end
      object Label6: TLabel
        Left = 26
        Top = 78
        Width = 41
        Height = 13
        Caption = 'N'#186' Nota:'
      end
      object Label7: TLabel
        Left = 424
        Top = 33
        Width = 75
        Height = 13
        Caption = 'Cliente (parcial):'
      end
      object Label8: TLabel
        Left = 403
        Top = 54
        Width = 96
        Height = 13
        Caption = 'N'#227'o Mostrar Cliente:'
      end
      object Bevel3: TBevel
        Left = 2
        Top = 21
        Width = 776
        Height = 2
        Shape = bsTopLine
        Style = bsRaised
      end
      object Label9: TLabel
        Left = 16
        Top = 6
        Width = 46
        Height = 13
        Caption = 'N'#186' Conta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 64
        Top = 6
        Width = 137
        Height = 13
        DataField = 'NumConta'
        DataSource = DM1.dsContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 240
        Top = 6
        Width = 34
        Height = 13
        Caption = 'Banco:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 280
        Top = 6
        Width = 488
        Height = 13
        AutoSize = False
        Caption = 'Banco:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 376
        Top = 77
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
      object DateEdit1: TDateEdit
        Left = 69
        Top = 26
        Width = 95
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object DateEdit2: TDateEdit
        Left = 298
        Top = 26
        Width = 95
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
      object BitBtn1: TBitBtn
        Left = 151
        Top = 68
        Width = 138
        Height = 24
        Hint = 'Gera rela'#231#227'o de t'#237'tulos cfe. sele'#231#227'o de datas'
        Caption = '&Filtrar as duplicatas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = BitBtn1Click
        Glyph.Data = {
          46050000424D460500000000000036040000280000000D000000110000000100
          08000000000010010000C30E0000C30E00000001000000000000000000008080
          8000000080000080800000800000808000008000000080008000408080004040
          0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
          FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
          80008000FF004080FF00C0DCC000F0CAA60060208000C0FFFF00E0E0A0008000
          60008080FF00C0800000FFC0C000FFCF0000FFFF6900E0FFE000B39CDD00EE8F
          B300F96F2A00CDB83F0036844800418C9500425E8E007A62A000AC4F6200BE2F
          1D007666280000450000013E450013286A006A39850085324A00040404000808
          08000C0C0C0011111100161616001C1C1C002222220029292900303030005F5F
          5F00555555004D4D4D0042424200393939000007000000000D008199B700B499
          840090BDBD00607F7F007F606000000E000000001B00000028002B090800001D
          0000000039009B00000000250000000049003B111100002F000000005D004517
          1700003A000011114900531C1C00FF160000FF002B006C212100141459000051
          00006A1A47006732190000610000FF310000FF0061007B20530067431600E22E
          2E001659260004465100492E68008F520700B8186A0015239000FF530000FF00
          A300124A6A006C3375009A414A000B653700152CA400B11F8300FF2C4E00B651
          2000926408000B566F00AD435900127236001733B00000A100001F5F77007147
          89001C43B0007D2DB70095860000236E7A00009F260001A9730000CA0000015B
          AC00C21D2000705294004CAA240089940A007B6E360090754400A800FF00FF71
          0000FF00DF004A915600F84834008232CC007041E40001CA680042BC3600FF9A
          0000B7229600337D85008CB72500ED5A360000FF5C000048FF00A29B22004DCF
          42005258C20095D32000E024A500B556730000A9A9003C6FD000589F67000BCF
          890000ACFF00FE2EA7007F59E20067DC4C00FF18FF00FF7D3A0018D0B10000FF
          C70000E2FF003D9ADF009F815600BA43C6008B71AF00C9A23800CE53D100659A
          FF00DBCA4600FF4DFF006AE9C800E0DE4C00FF98FF0082C0DF00A5ECE900CDF6
          F500FFD0FF005AACB100AE916300654C22003F4E8D0070705000FFFFD000FFE7
          FF00696969007777770086868600969696009D9D9D00A4A4A400B2B2B200CBCB
          CB00D7D7D700DDDDDD00E3E3E300EAEAEA00F1F1F100F8F8F80066C1B20078BF
          8000F0F0C600FFA4B200FFB3FF00A38ED10037DCC300549EA00070AE7600C19E
          7800BF648300D383A400323FD100007DFF0023784400605F24002C0E0E000000
          BE00001FFF00003931003E85D9008577020081D8B0001D21560030000000B3C8
          88000079A0008170EA0069F15100CD749100FF7CFF00FFFFA200F0FBFF00A4A0
          A000537F200029798A00326932007F05EC00AC112F00423FEE000F0F0F0F0001
          0F0F0F0F0F0F0F0000000F0F0F0F0000010F0F0F0F0F0F0000000F0F0F0F0F00
          00010F0F0F0F0F0000000F0F0F0F0F001100010F0F0F0F0000000F0F0F000000
          001100010F0F0F0000000F0F0F0011110E111100010F0F0000000F0F0F0F000E
          11000000000F0F0000000F0F0F0F00110E1100010F0F0F0000000F0000000000
          110E1100010F0F0000000F000E110E110E110E1100010F0000000F0F000E110E
          11000000000F0F0000000F0F00110E110E1100010F0F0F0000000F0F0F00110E
          110E1100010F0F0000000F0F0F000E0E0E110E0E00010F0000000F0F0F0F000E
          110E0E110E00010000000F0F0F0F0000000000000000000000000F0F0F0F0F0F
          0F0F0F0F0F0F0F000000}
      end
      object BitBtn2: TBitBtn
        Left = 218
        Top = 97
        Width = 105
        Height = 25
        Hint = 'Gera arquivo cfe. rela'#231#227'o de t'#237'tulos abaixo'
        Caption = 'Gerar &Arquivo'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
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
      object BitBtn3: TBitBtn
        Left = 324
        Top = 97
        Width = 105
        Height = 25
        Hint = 'Desfaz a rela'#231#227'o de t'#237'tulos abaixo'
        Caption = 'Desfaz Rela'#231#227'o'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = BitBtn3Click
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
      end
      object BitBtn4: TBitBtn
        Left = 429
        Top = 97
        Width = 105
        Height = 25
        Hint = 'Exclui a parcela selecionada abaixo da rela'#231#227'o de t'#237'tulos'
        Caption = 'Exclui Parcela'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
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
        Left = 639
        Top = 97
        Width = 95
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
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
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 69
        Top = 48
        Width = 324
        Height = 21
        DropDownCount = 8
        LookupField = 'Codigo'
        LookupDisplay = 'Nome'
        LookupSource = DM1.dsCliente
        TabOrder = 2
        OnDropDown = RxDBLookupCombo1Enter
        OnEnter = RxDBLookupCombo1Enter
        OnExit = RxDBLookupCombo1Exit
      end
      object BitBtn6: TBitBtn
        Left = 535
        Top = 97
        Width = 105
        Height = 25
        Hint = 'Exclui a parcela selecionada abaixo da rela'#231#227'o de t'#237'tulos'
        Caption = 'Arq.Retorno'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = BitBtn6Click
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFFFFF333FFFFF3330000000033300000333377777777F337777
          7FF330EFEFEF03307333703337F3FFFF7F37733377F330F4444E033333333033
          37F777737F333333F7F33099999903333330703337F333337F33333777FF309F
          FFF903333330000337F333337F33333777733099999903333330003337F3FF3F
          7F333337773330F44E0003333330033337F7737773333337733330EFEF003333
          3330333337FFFF7733333337333330000003333333333333377777733333FFFF
          FFFF3333333333300000000333333F3333377777777F333303333330EFEFEF03
          33337F333337F3FFFF7F333003333330F4444E0333377F333337F777737F3300
          03333330EFEFEF0333777F333337F3FFFF7F300003333330F4444E0337777F33
          3337F777737F330703333330EFEFEF03337773333337F3FF3F7F330333333330
          F44E0003337FF333FF37F7737773330733370330EFEF00333377FFF77337FFFF
          7733333000003330000003333337777733377777733333333333333333333333
          33333333333333333333}
        NumGlyphs = 2
      end
      object BitBtn7: TBitBtn
        Left = 115
        Top = 97
        Width = 105
        Height = 25
        Caption = 'Imp. Boleto'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        Visible = False
        OnClick = BitBtn7Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777700000000000777707777777770707700000000000007070777777BBB77
          0007077777788877070700000000000007700777777777707070700000000007
          0700770FFFFFFFF070707770F00000F000077770FFFFFFFF077777770F00000F
          077777770FFFFFFFF07777777000000000777777777777777777}
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 69
        Top = 70
        Width = 81
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        TabOrder = 5
      end
      object Edit1: TEdit
        Left = 502
        Top = 25
        Width = 243
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 3
      end
      object Edit2: TEdit
        Left = 502
        Top = 46
        Width = 243
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 4
      end
      object BitBtn8: TBitBtn
        Left = 13
        Top = 97
        Width = 101
        Height = 25
        Hint = 'Gera Nosso N'#250'mero'
        Caption = 'Gera Nosso N'#186
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
        Visible = False
        OnClick = BitBtn8Click
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFF404040
          4040404040404040404040404040404040404040404040404040404040404040
          40000000202020FFFFFF00000040404040404040404040404040404040404040
          4040404040404040404040404040202020000000404040FFFFFF000000EFEFEF
          DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF3F3F3F0000
          00606060000000FFFFFF000000EFEFEFDFDFDFDFDFDFDFDFDFCFCFCFDFDFDFDF
          DFDFDFDFDFDFDFDF303030000000606060202020FFFFFFFFFFFF000000EFEFEF
          EFEFEFEFEFEFFFFFFFDFDFDFDFDFDFDFDFDFDFDFDF3030300000006060604040
          40404040FFFFFFFFFFFF000000EFEFEFDFDFDFEFEFEFFFFFFFDFDFDFDFDFDFEF
          EFEF303030000000404040202020808080404040FFFFFFFFFFFF000000FFFFFF
          FFFFFFFFFFFFFFFFFFDFDFDFFFFFFFBFBFBF0000000000003F3F3F7F7F7F8080
          80404040FFFFFFFFFFFF000000EFEFEFDFDFDFDFDFDFDFDFDFDFDFDF9F9F9F00
          40603F3F9F7F7F7FDFDFDF7F7F7F808080404040FFFFFFFFFFFF000000EFEFEF
          9F9F9FDFDFDFEFEFEFAFAFAF0040603F3F9FDFDFDFDFDFDFDFDFDF7F7F7F8080
          80404040FFFFFFFFFFFF606060707070202020DFDFDF7F7F7F004060303090DF
          DFDFDFDFDFDFDFDFDFDFDF7F7F7F808080404040FFFFFFFFFFFF303030707070
          4040400020200060803F3F9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF7F7F7F8080
          80404040FFFFFFFFFFFF000000DFDFDF909090606060000040DFDFDFDFDFDFEF
          EFEFDFDFDFDFDFDFDFDFDF7F7F7F808080404040FFFFFFFFFFFF000000DFDFDF
          B0B0B0909090404040404040808080AFAFAFBFBFBFBFBFBFBFBFBF7F7F7F8080
          80404040FFFFFFFFFFFF000000BFBFBF808080A0A0A0A0A0A0A0A0A090909080
          80808080808080808080807F7F7F808080404040FFFFFFFFFFFF000000DFDFDF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F4040
          40202020FFFFFFFFFFFF00000000000000000000000000000000000000000000
          0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF}
      end
    end
    object RxDBGrid1: TRxDBGrid
      Left = 1
      Top = 146
      Width = 778
      Height = 384
      Align = alBottom
      DataSource = msBoletos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
      ReadOnly = True
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
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Gerado'
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumNota'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Nota'
          Width = 49
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Parcela'
          Title.Alignment = taCenter
          Title.Caption = 'Parc.'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cliente'
          Title.Alignment = taCenter
          Width = 262
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtVencto'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Vencto.'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrParcela'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr.da Parcela'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NossoNumero'
          Title.Alignment = taCenter
          Title.Caption = 'Nosso N'#250'mero'
          Width = 95
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumCarteira'
          Title.Alignment = taCenter
          Title.Caption = 'Carteira'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumCReceber'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Lan'#231'to.'
          Width = 73
          Visible = True
        end>
    end
    object StaticText1: TStaticText
      Left = 1
      Top = 530
      Width = 778
      Height = 17
      Align = alBottom
      BorderStyle = sbsSunken
      Caption = 'Duplo clique para Alterar/Consultar parcela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
    Active = True
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
      Size = 40
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
      Size = 9
    end
    object mBoletosInstrucao: TStringField
      FieldName = 'Instrucao'
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
      EditMask = '99/99/9999'
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
    object mBoletosInstrCobranca1: TStringField
      FieldName = 'InstrCobranca1'
      Size = 2
    end
    object mBoletosInstrCobranca2: TStringField
      FieldName = 'InstrCobranca2'
      Size = 2
    end
    object mBoletosEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
    object mBoletosBoletoPorEmail: TBooleanField
      FieldName = 'BoletoPorEmail'
    end
    object mBoletosBairroAvalista: TStringField
      FieldName = 'BairroAvalista'
      Size = 30
    end
    object mBoletosFilial: TIntegerField
      FieldName = 'Filial'
    end
  end
  object tCReceberParcRem2: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Filial;NumCReceber;ParcCReceber'
    MasterFields = 'Filial;NumCReceber;ParcCReceber'
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
  end
end
