object fRelDANFE: TfRelDANFE
  Left = 56
  Top = -14
  Width = 900
  Height = 753
  VertScrollBar.Position = 425
  Caption = 'fRelDANFE'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 40
    Top = -401
    Width = 794
    Height = 1123
    DataSource = DM1.dsNotaFiscal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 7.000000000000000000
    Margins.TopMargin = 7.000000000000000000
    Margins.RightMargin = 7.000000000000000000
    Margins.BottomMargin = 9.000000000000000000
    RecordRange = rrCurrentOnly
    ShowProgress = False
    object RLSubDetail1: TRLSubDetail
      Left = 26
      Top = 26
      Width = 742
      Height = 890
      DataSource = DM1.dsNotaFiscal
      RecordRange = rrCurrentOnly
      object RLSubDetail3: TRLSubDetail
        Left = 0
        Top = 795
        Width = 742
        Height = 158
        DataSource = fNFe.dsmiItensNFe
        object RLBand3: TRLBand
          Left = 0
          Top = 0
          Width = 742
          Height = 37
          BandType = btHeader
          BeforePrint = RLBand3BeforePrint
          object RLDraw15: TRLDraw
            Left = 494
            Top = 11
            Width = 56
            Height = 26
          end
          object RLDraw14: TRLDraw
            Left = 434
            Top = 11
            Width = 61
            Height = 26
          end
          object RLDraw13: TRLDraw
            Left = 686
            Top = 11
            Width = 55
            Height = 14
          end
          object RLDraw11: TRLDraw
            Left = 686
            Top = 24
            Width = 28
            Height = 13
          end
          object RLDraw9: TRLDraw
            Left = 346
            Top = 11
            Width = 28
            Height = 26
          end
          object RLDraw12: TRLDraw
            Left = 373
            Top = 11
            Width = 62
            Height = 26
          end
          object RLDraw8: TRLDraw
            Left = 246
            Top = 11
            Width = 44
            Height = 26
          end
          object RLDraw10: TRLDraw
            Left = 319
            Top = 11
            Width = 28
            Height = 26
          end
          object RLDraw7: TRLDraw
            Left = 40
            Top = 11
            Width = 207
            Height = 26
          end
          object RLDraw3: TRLDraw
            Left = 0
            Top = 11
            Width = 41
            Height = 26
          end
          object RLLabel21: TRLLabel
            Left = 4
            Top = 19
            Width = 34
            Height = 10
            Caption = 'C'#211'DIGO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel22: TRLLabel
            Left = 86
            Top = 19
            Width = 105
            Height = 10
            Caption = 'DESCRI'#199#195'O DO PRODUTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel24: TRLLabel
            Left = 251
            Top = 19
            Width = 34
            Height = 10
            Caption = 'NCM/SH'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel25: TRLLabel
            Left = 321
            Top = 19
            Width = 24
            Height = 10
            Caption = 'CFOP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel26: TRLLabel
            Left = 348
            Top = 19
            Width = 24
            Height = 10
            Caption = 'UNID.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel27: TRLLabel
            Left = 377
            Top = 19
            Width = 54
            Height = 10
            Caption = 'QUANTIDADE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel28: TRLLabel
            Left = 444
            Top = 19
            Width = 47
            Height = 10
            Caption = 'V.UNIT'#193'RIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel29: TRLLabel
            Left = 500
            Top = 19
            Width = 36
            Height = 10
            Caption = 'V. TOTAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel30: TRLLabel
            Left = 686
            Top = 26
            Width = 22
            Height = 10
            Caption = 'ICMS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel31: TRLLabel
            Left = 696
            Top = 13
            Width = 41
            Height = 10
            Caption = 'ALIQUOTA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDraw4: TRLDraw
            Left = 713
            Top = 24
            Width = 28
            Height = 13
          end
          object RLLabel20: TRLLabel
            Left = 720
            Top = 26
            Width = 11
            Height = 10
            Caption = 'IPI'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDraw67: TRLDraw
            Left = 643
            Top = 11
            Width = 44
            Height = 26
          end
          object RLLabel41: TRLLabel
            Left = 658
            Top = 19
            Width = 18
            Height = 10
            Caption = 'V.IPI'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDraw68: TRLDraw
            Left = 602
            Top = 11
            Width = 42
            Height = 26
          end
          object RLLabel61: TRLLabel
            Left = 610
            Top = 19
            Width = 29
            Height = 10
            Caption = 'V.ICMS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDraw69: TRLDraw
            Left = 549
            Top = 11
            Width = 54
            Height = 26
          end
          object RLLabel62: TRLLabel
            Left = 556
            Top = 19
            Width = 35
            Height = 10
            Caption = 'BC.ICMS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDraw70: TRLDraw
            Left = 289
            Top = 11
            Width = 31
            Height = 26
          end
          object RLLabel63: TRLLabel
            Left = 290
            Top = 19
            Width = 30
            Height = 11
            Alignment = taCenter
            AutoSize = False
            Caption = 'CSOSN'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel19: TRLLabel
            Left = 4
            Top = 1
            Width = 142
            Height = 10
            Caption = 'DADOS DOS PRODUTOS / SERVI'#199'OS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLBand4: TRLBand
          Left = 0
          Top = 61
          Width = 742
          Height = 11
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          BeforePrint = RLBand4BeforePrint
          object RLDBText14: TRLDBText
            Left = 0
            Top = 0
            Width = 42
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            DataField = 'CodProduto'
            DataSource = fNFe.dsmiItensNFe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object rlmNomeProduto: TRLMemo
            Left = 40
            Top = 0
            Width = 204
            Height = 10
            Behavior = [beSiteExpander]
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText6: TRLDBText
            Left = 289
            Top = 0
            Width = 32
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            DataField = 'CodSitTrib'
            DataSource = fNFe.dsmiItensNFe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText7: TRLDBText
            Left = 319
            Top = 0
            Width = 30
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            DataField = 'CodNatOper'
            DataSource = fNFe.dsmiItensNFe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText8: TRLDBText
            Left = 346
            Top = 0
            Width = 28
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            DataField = 'Unidade'
            DataSource = fNFe.dsmiItensNFe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText9: TRLDBText
            Left = 373
            Top = 0
            Width = 62
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            DataField = 'Qtd'
            DataSource = fNFe.dsmiItensNFe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText10: TRLDBText
            Left = 434
            Top = 0
            Width = 60
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            DataField = 'VlrUnitario'
            DataSource = fNFe.dsmiItensNFe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText11: TRLDBText
            Left = 495
            Top = 0
            Width = 54
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            DataField = 'VlrTotal'
            DataSource = fNFe.dsmiItensNFe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText12: TRLDBText
            Left = 550
            Top = 0
            Width = 52
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            DataField = 'BaseICMS'
            DataSource = fNFe.dsmiItensNFe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText13: TRLDBText
            Left = 602
            Top = 0
            Width = 42
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            DataField = 'VlrIcms'
            DataSource = fNFe.dsmiItensNFe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText15: TRLDBText
            Left = 644
            Top = 0
            Width = 40
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            DataField = 'VlrIpi'
            DataSource = fNFe.dsmiItensNFe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText16: TRLDBText
            Left = 686
            Top = 0
            Width = 28
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            DataField = 'AliqIcms'
            DataSource = fNFe.dsmiItensNFe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText17: TRLDBText
            Left = 713
            Top = 0
            Width = 28
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = True
            Borders.DrawBottom = False
            DataField = 'AliqIpi'
            DataSource = fNFe.dsmiItensNFe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText4: TRLDBText
            Left = 246
            Top = 0
            Width = 42
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            DataField = 'ClasFiscal'
            DataSource = fNFe.dsmiItensNFe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
        object RLBand10: TRLBand
          Left = 0
          Top = 37
          Width = 742
          Height = 24
          BandType = btHeader
          BeforePrint = RLBand10BeforePrint
          object RLDraw85: TRLDraw
            Left = 0
            Top = 0
            Width = 742
            Height = 24
            Align = faClient
            Brush.Color = clSilver
            Color = clWhite
            ParentColor = False
            Transparent = False
          end
          object RLLabel101: TRLLabel
            Left = 8
            Top = 4
            Width = 730
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Caption = 
              'DANFE em Conting'#234'ncia - impresso em decorr'#234'ncia de problemas t'#233'c' +
              'nicos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLBand11: TRLBand
          Left = 0
          Top = 72
          Width = 742
          Height = 2
          object RLDraw16: TRLDraw
            Left = 0
            Top = 1
            Width = 742
            Height = 1
            Align = faBottom
            DrawKind = dkLine
            Pen.Style = psDot
          end
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 59
        Width = 742
        Height = 198
        BandType = btHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BeforePrint = RLBand7BeforePrint
        object RLDraw50: TRLDraw
          Left = 0
          Top = 0
          Width = 437
          Height = 148
        end
        object RLImage1: TRLImage
          Left = 4
          Top = 28
          Width = 97
          Height = 89
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Picture.Data = {
            0A544A504547496D616765B4AB0000FFD8FFE000104A46494600010101006000
            600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
            0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
            3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
            3232323232323232323232323232323232323232323232323232323232323232
            32323232323232323232323232FFC0001108025903FF03012200021101031101
            FFC4001F0000010501010101010100000000000000000102030405060708090A
            0BFFC400B5100002010303020403050504040000017D01020300041105122131
            410613516107227114328191A1082342B1C11552D1F02433627282090A161718
            191A25262728292A3435363738393A434445464748494A535455565758595A63
            6465666768696A737475767778797A838485868788898A92939495969798999A
            A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
            D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
            01010101010101010000000000000102030405060708090A0BFFC400B5110002
            0102040403040705040400010277000102031104052131061241510761711322
            328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
            292A35363738393A434445464748494A535455565758595A636465666768696A
            737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
            A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
            E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FA
            28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
            28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
            28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A424019240A002
            90903BD721AF7C44D1F46DD14527DB6E471E5C27807DDBA0FD6BCCB5BF1EEB9A
            C964FB41B5B73D2280EDE3DDBA9AE7A9898434DCF53099462311ADACBBB3D775
            9F19E89A1865B9BB579C7FCB18BE67FCBB7E38AE7A3F8B9A3B1FDE595EA7B855
            3FD6BC709C9E68AE396326DE88F7E970FE1E31B4DB6CF718BE28786E4FBD34F1
            7FBD113FCB35762F881E189BEEEAA8BFEFC6CBFCC5780D142C6CFB04B87B0CF6
            935F71F4645E2BD0272026AF6649E80CCA0FEB5A70DD41709BA19A3917D5581A
            F982A48679ADE412432C91B8E8C8C54D5AC73EA8E69F0E47EC4FF03EA0A2BC1F
            45F887AEE94E8B34E6F6DC758E73938F66EBFCEBD83C3DE21B2F11E9CB7568D8
            2389233F791BD0FF008D7552C446A68B73C5C6E595F09ACF55DD1B3451456E79
            E1451450014514500254734B1C10BCD2B048D14B3331C003D6A4AF3CF8A9AEB5
            9E99169503624BAF9A4C75083B7E27F91A8A93508B933A30B879622B46947A98
            9E23F8A37935C3C1A205820538F3D972CFEE01E00AE3A7F136B972499755BC39
            EC252A3F21595457913AD393BB67DE50CBF0F46368C57EA5B3AAEA27ADFDC9FA
            CADFE34ABABEA4BF7750BA1F499BFC6A9D159F333A7D9436E53521F11EB701CC
            7AB5E8F633311FCEB4ADBE20789AD88C6A4CE3FBB246ADFD2B99A2A9549AD999
            4B098797C504FE48F41B3F8B5AB4447DAACEDA75FF00637213FCC7E95D3E9FF1
            5745BA216EE29ED18F52CBBD7F31CFE95E2F456B1C5545D4E2AB92E12A6D1B7A
            1F4BD86AD61AA45E6595DC33AFAC6E0E3EBE9576BE6082E27B5944B6F33C520E
            8F1B1047E22BB8D0BE28EA760562D4D05EC238DFF7641F8F43FE79AEAA78C8BD
            25A1E262B87EAC173517CDE5D4F67A2B2745F10E9BAFDB79D61701C8FBD19E1D
            3EA2B5ABB134D5D1E0CE1284B964ACC5A28A2992145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            145145001451450014514500251DAA96A3AA5969168D757D7090C4BDD8F5F603
            B9AF25F147C4ABCD4F7DAE93BED2D7A197A48FFF00C4FF003ACAAD68D35A9DB8
            3CBEB62A5682D3BF43D07C45E38D27C3CAD1C9279F763A5BC47247D4F6AF25F1
            078DF57F103B23CC6DED4F482238047B9EF5CE12598B31C93D49A4AF36AE2673
            D3647D760B28A186D5AE69777FA0514515CE7AC1451450014514500145145001
            5D97C33D4A4B2F16456DB8F9576A6365CF1903703FA1FCEB8DAE87C0C864F1A6
            98A3FE7A13F92935A5176A8AC71E3E119E1A6A5D99F42514515ED9F9D0514514
            005145140087804D7CF7E36D54EAFE2CBD9836628DBC98FD82F1FA9C9FC6BDBB
            C4DA9FF647872FAF41C34719D9FEF1E17F522BE71272493D6B831B3D144FA6E1
            DC3DE52ACFA69FE614514579E7D58514514005145140051451400514514013D9
            DE5CD85CA5CDA4EF0CC872AE8706BD7FC1FF001160D5BCBB0D50AC37A7E5593A
            24A7FA37B7FF00AABC6680715AD2AD2A6F43831D97D2C5C6D25AF467D49C7514
            579A7C3EF1C9BB29A3EAB2E671C41331FBFF00EC9F7F43DFEBD7D2EBD7A7514E
            3747C2E2B0B530D51D3A82D1451567385145140143517BE860F3AC63499D3930
            31DBE60F40DD8FE9FCEA968DE28D375BDD1C1298EE93892DA61B64423AF1FE15
            B78CF5AF3EF1FF00845EE81D7349564BF87E69045906403B8C7F10FD6B3A8E51
            F7A3A9D785852AAFD9D4766F67FE67A0D15E4DE18F8A12C052D75D0644E82E90
            7CC3FDE1DFEA3F5AF51B4BCB7BFB64B8B5992689C655D0E41A29D58D45A062B0
            55B0B2B545F3E859A28A2B439028A28A0028A28A0028A28A0028A28A0028A28A
            0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
            0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
            0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
            0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
            0028A28A0028A28A0028A29090A324E00A002B93F15F8E6C3C388D04645C5F91
            F2C2A785F763DBE9D6B9DF1A7C4611799A768720327DD92E8745F65F7F7FCABC
            ADDDE5919E472CEC72CCC7249AE2AF8A51F761B9F4596E4AEADAA57D176EE5ED
            635BBFD76F1AEAFE732367E55E8A83D00ED59F4515E73936EECFAC84234E2A30
            56414514522C28A28A0028A28A0028A28A0028A28A002BB5F85D69F68F17ACC4
            716F0B3E7DCFCBFD4D7155EB7F08F4FF002F4EBEBF61CCB208D491D9464FF3FD
            2B7C3479AA23CCCDEB2A783979E9F79E95451457B07C085145140051451401E6
            BF16F53F2B4EB3D351BE699CCAE07F757A7EA7F4AF24AEA3E20EA7FDA7E2FBAD
            AD98EDF102FF00C07AFEA4D72F5E3E227CD51B3EFF0029A1EC70B15D5EBF7851
            451581E905145140051451400514514005145140051451400E4768DC3A315653
            9047506BDDBC09E291E22D2364EC3EDF6D85987F78766FC7F9D783D6CF85F5C9
            3C3FAF5BDEA93E56764CBFDE43D7FC7F0ADF0F57D9CBC8F2F35C0AC55176F896
            DFE47D19454714A93C492C6C191D432B0E841A92BD83E09AB681451450014751
            451401E29F11FC2A348D43FB4ECD316772DF3281C46FFE07AFE75CF787BC4FA8
            F872E7CCB394B424FEF2073946FF0003EF5EFBABE9906B1A55C585CA831CCA46
            7B83D88F7079AF9D353D3E7D2B52B8B1B85C4B0B953EFE87F1EB5E66269BA53E
            789F6394E2A18CA0F0F5B56BF147BC7867C5DA778960CC0DE55D28CBDBB9F987
            B8F51EF5D0D7CC36B753D95CC7716D2BC534672AE87041AF60F077C428757F2E
            C3546582FBA2C9D125FF0003EDFF00EAAE8A18A53F765B9E6665934A85EA51D6
            3F8A3BFA28ED45759E0851451400514514005145140051451400514514005145
            1400514514005145140051451400514514005145140051451400514514005145
            1400514514005145140051451400514514005145140051451400514514005145
            1400514514005145140051451400514514005145140051451400514514005145
            1400514514005145140051451400514514005145140051451400514514005145
            31E458919DD82AA8C924E0014025712491228DA49182A28C9627000AF1EF1BF8
            FE4D51E4D374A9192C87CB24A38337B0F45FE750F8E7C7326B52BE9DA7B94D3D
            4E19C1C198FF00F13ED5C2D79D88C4DFDC81F5994E51C8956AEB5E8BB0514515
            C27D2851451400514514005145140051451400514514005145140057D15E12D3
            7FB27C2F6168CBB5C4419C7FB4DC9FD4D78778534CFED7F13585A1194690338F
            F65793FA0AFA2C0C002BD0C143791F2BC455F58515EBFE42D14515DE7CC05145
            1400550D62FD34BD1EEEF9FA43133E3D481C0ABD5C07C56D53ECBE1E86C51B0D
            772723FD95E4FEBB6B3A92E48391D184A3EDEBC69F7678ECB23CD33CB236E776
            2CC4F726994515E26E7E90924AC828A28A061451450014514500145145001451
            450014514500145145007B7FC32D60EA5E1916B23666B26F2B93CECEABFD47E1
            5DAF6AF13F85BA91B4F149B466C25DC6571FED2F23F40DF9D7B657AF869F3D34
            7C0E6F87F618A925B3D7EF168A28AE83CC0A28A28012BCB3E2C68601B7D6A14E
            4FEE67C7FE3A7F98FCABD4EB375FD31758D0AF2C180CCB190A4F66EA0FE78ACA
            B439E0D1D980C4BC3E22353A75F43E6DA0120E47069D22347232382ACA76907B
            1A6D78A7E889A6AE7A97823E21E4C7A5EB52F3F762B963FA3FF8FE75EA408232
            2BE5BAF4CF00F8F4C262D235797F77F7609D8FDDF4563E9E86BD0C3E27EC4CF9
            6CDB28B5EBD05EABFC8F59A2901C8CD2D779F301451450014514500145145001
            4514500145145001451450014514500145145001451450014514500145145001
            4514500145145001451450014514500145145001451450014514500145145001
            4514500145145001451450014514500145145001451450014514500145145001
            4514500145145001451450014514500145145001451450014514500145145001
            45145002678AF20F885E3737CF268FA649FE8CA713CAA7FD61FEE8F6FE7FCF6F
            E2378C0E9D01D1EC25C5D4ABFBE753CC6A7B7D4FF2FAD78FD7062ABDBDC89F4F
            92E597B622AAF45FA8514515E79F541451450014514500145145001451450014
            51450014514500145145007A5FC23D337DDDEEA8E388D44287DCF27F90FCEBD6
            6B99F01699FD99E11B3465C4930F39F8E72DC8FD315D357B3421C94D23F3CCCA
            BFB7C54E5D36FB85A28A2B638428A28A004278AF0EF89BA9FDBBC56F6E8D98ED
            104639E371E4FF00303F0AF6ABDB98ECAC67BA94E238636763EC066BE69BDBA9
            2F6FA7BA94FEF2691A46FA939AE2C6CED1513E8787A873569557F67F520A28A2
            BCD3EC028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00D
            1D06ECD878834FBA07023B842DF4CF3FA57D243902BE5C07041AFA6F4FB8175A
            75B5C0E92C4AFF0098CD7A1827A347CA711D35CD09FAA2D514515DE7CC851451
            40051DA8A2803E7EF1DE9C34DF17DF46AB8495BCE5FF0081727F5CD7375E95F1
            7AC825F69D7C07FAC468D8FF00BA723FF4235E6B5E3578F2D468FD0B2CABED70
            909797E5A051451589DE7ACFC3BF1B7DA563D175293F7CA316F2B1FBE3FBA7DF
            D3D7F9FA5D7CBA8ED1BABA31575390C0E0835EE7E04F16AF88B4D105CB81A85B
            80241D3CC5ECC3FAFBFD6BD2C2D7E6F7247C8675967B27EDE92F75EFE4761451
            45769F3A14514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            145145001451450014514500256178AFC45178734592E9B0D3B7C90467F89BFC
            075ADB765442CC40503249AF01F1AF88DBC45AEC92231FB1C198E019EA3BB7E3
            FE158622AFB38E9B9E96578278BAE93F856FFE4605CDCCD79732DC4EE6496462
            CEC7A926A2A28AF1DB6DDD9F7C928A4905145140C28A28A0028A28A0028A28A0
            028A28A0028A28A0028A28A002AFE89A7B6ADADD9D8819F3A50AD8ECBDCFE59A
            A15E83F09F4BFB4EB971A832E52D63DAA7FDA6FF00EB03F9D69461CF348E4C75
            7F6187954F23D863411C6A8A30AA3000ED4FA292BDB3F396EE2D145140051451
            401C5FC4DD53EC1E147814E24BB7110FA753FA0C7E35E1D5DF7C56D53ED5E208
            6C15B29691E48FF69B93FA6DAE06BC9C54F9AA35D8FBAC9287B2C226F796BFD7
            C828A28AE63D70A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A2
            8A2800AFA33C28DBFC27A51FFA758C7FE3A2BE73AFA23C1B9FF843F4BCFF00CF
            BAFF002AEDC13F799F37C46BF7507E66ED14515E91F24145145001451450079F
            FC59B7F33C376F30EB15C8CFD0823FC2BC6ABDDBE25461FC1178DFDC78C8FF00
            BEC0FEB5E135E5E315AA1F6BC3F2BE15AECD8514515C87B8157B48D52E746D4E
            1BEB5622489B38ECC3B83EC6A8D14D3B3BA2670538B8CB667D29A36AB6FAD697
            05FDB366395738EEA7B83EE2B42BC4FE1B7894E95ABFF675C3E2D2EDB0327849
            3B1FC7A7E55ED9D6BD8A355548DCFCFB31C1BC25670E9D05A28A2B638428A28A
            0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
            0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
            0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
            0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A29A
            CC110B120003249A00E17E26F883FB33451A7C0F8B8BCCA9C7558FBFE7D3F3AF
            16ADAF15EB4DAF788AE6F324C5BB6423D1074FCFAFE358B5E3E22A73CCFBFCAF
            08B0D8749FC4F56145145607A414514500145145001451450014514500145145
            00145145001451450015EE7F0D74CFECFF0009432B2E24BA63337D3A0FD003F8
            D78A585A49A86A36D671FDF9A458C7E2715F4B5ADBC7696B0DBC4BB63890228F
            4006057760A1AB91F37C455F969C68AEBAFDC4F451457A27C905145140094C96
            458A2791C80AA0924F614FAE5BE20EA7FD9BE10BBDAD892E07909EFBBAFE99A9
            94B962D9AD0A4EAD48D35D59E25AC5FB6A9AC5E5F31399A56600F619E07E5546
            8A2BC36EEEE7E95082845456C828A28A45051451400514514005145140051451
            40051451400514514005145140057D17E125D9E12D281FF9F58CFE6A2BE7415F
            4BE910FD9B47B2848C797022E3E8A2BBB03BB67CD711CBDC82F365EA28A2BD13
            E4C28A28A0028A28A00E5FE212EFF03EA23FD943F93AD78157BEFC436D9E07D4
            4FB20FFC7D6BC0ABCCC6FC6BD0FB1E1DFF007797AFE8828A28AE33E8028A28A0
            0012A4107047715EFDE07F107FC241E1E8E595B37507EEA6F723A1FC47F5AF01
            AEBFE1DEBA747F1224123E2DEF311383D037F09FCF8FC6BA70D539276E8CF233
            9C27B7C3B92DE3AAFD4F76A281D28AF58F850A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2800A28A2800A28A28012B92F889ABFF6578567546C4D74
            7C84FA1FBC7F2CFE75D6D78CFC56D53ED5E2086C15B29691E587FB6DCFF2C561
            889F2536CF472AC3FB7C5462F65AFDC7034514578E7E80145145001451450014
            514500145145001451450014514500145145001451450076DF0BF4CFB6F8A7ED
            4CB98ED232F9FF0068F03FA9FC2BDBAB84F857A67D8FC34F78CB87BB90B03FEC
            AF03F5CFE75DDD7AF86872D35E67C16715FDB62E5D969FD7CC5A28A2BA0F2C28
            A28A004AF23F8B7A9F9BA859E9A878890CAE3DCF03F407F3AF5B27009F4AF9CB
            C4DA97F6BF892FAF43651E5210FF00B2381FA015C98B9F2C2DDCF7321A1ED313
            CEFECA3268A28AF2CFB50A28A2800A28A2800A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2802D69D6FF006BD4ED2DB19F36648F1F52057D32A3E451
            ED5E05F0FECBEDBE33B10465222D2B7B6071FAE2BDFBA57A5828FBAD9F1FC455
            2F5A30ECBF3FF86168A28AED3E7828A28A0028A28A00E33E27CFE5783664FF00
            9EB2A2FEB9FE95E1B5EB9F17AEB6699A7DA6799263263FDD18FF00D9ABC8EBCA
            C63BD43EDB20838E12FDDBFF0020A28A2B94F6C28A28A0029558A30653860720
            8A4A2816E7D19E18D586B7E1EB3BEC8DEE98900ECE383FA8AD8AF2EF847A9E52
            FB4B76E844F18FD1BFF65AF51AF6A8CF9E099F9DE3E87B0C4CA9ADBA7A0B4514
            56A7185145140051451400514514005145140051451400514514005145140051
            4514005145140051451400514514005145140051451400514514005145140051
            4514005145140051451400514514005145140051451400514514005145140051
            45140051451400514514005145140051451400514514005145140051451400D6
            3B549F415F366B97E753D76F6F49C89A6665FF00773F2FE98AF7EF13DE1B0F0C
            EA372A70C903ED3EE4607EA6BE71AE0C6CB689F51C394BE3ABF20A28A2BCF3EA
            428A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002A48217
            B8B88E08D7749230451EA4F4A8EBABF875A67F6978BEDD99731DB033B71DC74F
            D48FCAAE9C79A4918626B2A346551F447B6E97629A76976B651FDD862541EF81
            D6AE51D0D15EDA5647E6D293936D8B451453105145140181E32D4FFB27C2B7D7
            21B1218FCB8FD773703F9E7F0AF9E6BD4FE2E6A7F258E9687924CF20FD17FF00
            66AF2CAF2F193BCEDD8FB5C8287B3C373BDE4C28A28AE43DC0A28A2800A28A28
            00A28A2800A28A2800A28A2800A28A2800A28A2800A28A2803D3BE1169DBA7D4
            35265E1556146FAF2DFC96BD5AB9BF03695FD93E14B389976CB2AF9D271DDB9F
            D0607E15D257B3423CB4D23F3CCCABFB7C54E6B6DBEE168A28AD8E10A28A2800
            A28A63B04466620003249A0373C67E2B6A1F69F1345680E56DA1008F466E4FE9
            8AE0EB475ED44EADAEDEDF139134AC57FDDE83F4C5675789565CD36CFD1B0347
            D8E1E10EC828A28ACCEB0A28A2800A28A2803A4F01EA074FF18D8B938499BC97
            F7DDC0FD715F4057CC16D3B5ADD45709F7E27575FA839AFA6AD675B8B58A6439
            5740C3E8466BD2C14BDD713E4788A95AAC2A7756FB89A8A28AED3E7028A28A00
            28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00
            28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00
            28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00
            28A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E3BE26DC793E0BB8
            4CE0CD2227FE3D9FE95E175EC7F1724C7876D23CFDEBA07F256FF1AF1CAF2B18
            EF50FB5C8236C2DFBB6145145729EE0514514005145140051451400514514005
            1451400514514005145140057AFF00C25D2FC9D26EB5175C35C49B10FF00B2BF
            FD727F2AF21552CC140C93C002BE90F0F69A348F0FD958E0068A201B1FDEEA7F
            526BB3070BCF9BB1E071057E4A0A9AFB4FF046A514515E99F1A145145002507B
            D1597E22D4C691E1FBDBEC80D1447667BB1E17F52293765765420E72515BB3C3
            FC6DA9FF006AF8B2FA60D98E37F253E8BC7F3C9FC6B9FA524B3162724F39A4AF
            0E72E69367E954292A54E34D74414514549A8514514005145140051451400514
            5140051451400514514005145140056E7847463AE7892D6D4AE620DE64DFEE2F
            5FCFA7E35875ECDF0C3403A7E8CFA9CE989EF30533D5631D3F3EBF956F87A7CF
            3479B9AE2D61B0CDADDE88EF9400A00ED4B4515EC1F001451450014514500257
            2BF103581A4F856E36B626B9FDC47F8F53F966BAAAF10F897AEFF6A7887EC713
            E6DECB29C777FE23FC87E158622A7241B3D2CAB0BF58C4C53D96ACE2A8A28AF1
            CFBF0A28A2800A28A2800A28A2800AFA27C213FDA3C25A5C99C9FB3AA9FA818F
            E95F3B57BCFC3872FE06B0CF254C83FF001F6AECC13B4DA3E7B88A17A119799D
            6514515E99F1E145145001451450014514500145145001451450014514500145
            1450014514500145145001451450014514500145145001451450014514500145
            1450014514500145145001451450014514500145145001451450014514500145
            1450014514500145145001451450014514500145145001451450014514500145
            1450079BFC5E3FF128B01DBCF3FF00A09AF22AF60F8BABFF00122B26F4B9C7FE
            3ADFE15E3F5E4E2FF8ACFB8C89FF00B1AF56145145731EC85145140051451400
            5145140051451400514514005145140051451401D0F8234CFED5F16D8C45731C
            6FE73FD179FE781F8D7D063B0AF2FF00845A6623BED51D7962208CFD396FFD97
            F2AF50AF57090E5A77EE7C3E795FDAE29C56D1D05A28A2BA8F1828A28A004EF5
            E73F16B53F274AB4D391BE6B8937B8FF00657FFAE47E55E8D5E0DF11353FED2F
            17DC056CC76C040BF875FD49AE6C54F969FA9EB64B43DAE2937B475394A28A2B
            C93EEC28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A2A482096EAE238218D9E59182A2AF524D095F4426D2577B1B7E10F0F3F88B5D
            8ADC83F668FF00793B0ECBE9F53D2BE828A3486258D142A2800003802B07C1FE
            1B8BC37A324040375261E771DDBD3E83FCF5AE86BD7C3D2F671D773E0F35C77D
            6AB7BBF0ADBFCC5A28A2BA0F2C28A28A0028A2A392458919DD82AA8C924F0050
            08C1F18EBEBE1ED026B9047DA5FF0077029EEE7BFE1D6BE7E77691D9DD8B331C
            927A935D1F8DBC4ADE23D6D9E363F63832900F51DDBF1FF0AE6ABC8C4D5E7959
            6C8FBBC9F03F56A3CD2F8A5BFF0090514515CE7AC14514500145145001451450
            015EE5F0C493E0B807A4AE07FDF55E1B5EEBF0D176F826D0FF0079E43FF8F9AE
            BC1FF10F07883FDD57AFF99D8514515EA1F18145145001451450014514500145
            1450014514500145145001451450014514500145145001451450014514500145
            1450014514500145145001451450014514500145145001451450014514500145
            1450014514500145145001451450014514500145145001451450014514500145
            1450014514500145145001451450070FF14E0F37C2064FF9E53A37E795FEB5E2
            55F42F8DED45E783B538F19C42641FF01F9BFA57CF55E66357BE99F65C3D34F0
            F28F66145145719EF85145140051451400514514005145140051451400514514
            0051456BF85F4CFED7F12D8D995CA3CA19C7FB2BC9FD0538AE67646756A2A707
            37B23DBFC1FA61D27C2D636CCBB6431F98FEBB9B93FCF1F856F0A00C003D28AF
            722B95591F9AD5A8EA4DCDEEC5A28A2A880A28A280296AB7C9A6E95757B27DD8
            626723D703A57CD534CF713C9348DBA4918BB1F526BD9BE2A6A7F64F0DA592B7
            CF77200467F85793FAEDFCEBC5ABCDC6CEF251EC7D7F0F50E5A32AAFABFC828A
            28AE23E8828A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
            03BD7B07C3AF061D3A25D63508F17722FEE6361FEAD4F73EE7F4159DE00F0216
            68F58D5A1C0186B781C75F4661FC857AAF4AF430B87B7BF23E4F39CD39EF428B
            D3ABFD05A28A2BBCF9A0A28A2800A28A28012BCBFE25F8B82AB6856327CC7FE3
            E9D4F41FDCFF001FCBD6B77C75E338FC3F686D2D1C36A332FCBDFCA5FEF1FE82
            BC42491E591A4918B3B1DCCC4E4935C58AAF65C913E8F25CB3DA49622AAD16DF
            E6368A28AF34FAE0A28A2800A28A2800A28A2800A28A2800AFA0BC0B0791E0CD
            313A663DFF00F7D127FAD7CFA065801D4D7D33A55A8B1D26D2D47486144FC801
            5DD825EF367CDF11CED4E10EEFF2FF00872E514515E89F241451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            145145001451450014514500145145001451450043710A5C5B4B0C8329229561
            EC457CCF796CF677D3DB3FDF86468CFD41C57D3B5E11F11F4CFECFF174F22AE2
            3BA5132F1DCF07F504FE35C58D8DE2A47D0F0ED6E5AD2A6FAAFC8E4A8A28AF34
            FB00A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800AF49F849A5F9
            97D7BA9B8F962510A1F73C9FD00FCEBCDABDF3E1FE99FD99E11B3057124E3CF7
            E3FBDD3F4C0AEAC2439AA5FB1E2E7B5FD9E17956F2D0EA68A28AF54F880A28A2
            80129692A1BBB88ED2D26B894ED8E246763E800C9A012BBB23C5FE286A7F6DF1
            4FD955B31DA4613FE04793FCC0FC2B89AB17F7725FEA1717727DF9A4690FE273
            55EBC3A93E69B91FA460E8FB0A11A7D905145150748514514005145140051451
            400514514005145140051455ED2B48BED6AF16D6C2DDA590F523A28F527B0A69
            36EC889CE305CD27645244677088A5998E0281C935EABE09F8782031EA7AD479
            97EF456CDD17DDBDFDAB77C25E03B2F0F2A5D5C62E750C7FAC23E58FFDD1FD7F
            957635E8D0C2F2FBD33E4F33CE9D5BD2A1B77FF200001C52D145769F3A145145
            001451450025725E32F19DBF86AD4C30959750907C91764FF69BFC3BD53F1978
            FE0D115EC74F659B503C13D561FAFA9F6FCEBC66E6E67BCB97B8B891A59A46DC
            CEC7249AE3C46254572C773DFCAF289566AAD6568F6EFF00F005BBBB9EFAEA4B
            9B995A59A46DCEEDD49A868A2BCC6DB7767D8C528AE55B05145140C28A28A002
            8A28A0028A28A0028A28A00D7F0BD89D4BC4FA75AE321A60CC3FD95F98FE80D7
            D183802BC7BE13699E7EB773A838F96DA3DAA4FF0079BFFAC0FE75EC55EA60E3
            685FB9F159FD6E7C4F22FB2BF3168A28AEB3C30A28A2800A28A2800A28A2800A
            28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
            28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
            28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
            28A2800A28A2800A28A2800A28A28012BCFBE2AE91F6BD0E1D4A35CBDA3E1BFD
            C6E3F9EDFD6BD06AADFD945A8E9F3D9CC3314D1946FA1151521CF1713A3095DD
            0AD1A8BA1F32D156B52B1974CD4AE2C671892090A1E3AFBD55AF11AB3B33F478
            494A2A4828A28A45051451400514514005145140051451400514514017B45D3D
            B55D6ACEC541FDF4A14E3B2E793F966BE938E358A258D400AA00007615E3BF0A
            34BFB56BF3DFB2E52D23C29FF69B8FE40D7B2D7A78385A1CDDCF8CE20AFCF885
            4D7D95F8B168A28AEC3C10A28A28012B8EF895A9FF0067F84A6854E24BB610AF
            D3A9FD011F8D763DEBC6FE2BEA9F69D76DF4F56CA5AC7B987FB4DFFD603F3AC3
            113E5A6CF472AA1EDB1715D16BF71E7F4514578E7E8014514500145145001451
            4500145145001451524304B712AC5044F248C70A88B927F0A12BE884DA4AEDD8
            8E9C91BCB22A468CEEC7015464935DC689F0C357D436C97ECB6309E70DF3487F
            0EDF8D7A6685E11D27C3E83EC96E1A7C61A793E673F8F6FC2BAA961672DF4478
            F8BCEF0F47483E67E5FE679BF86FE18DF6A252E3562D676DD7CBEB237FF13F8F
            E55EAFA5E9163A35A0B6B0B648631D40EAC7D49EE6AFD15E853A31A6B43E5317
            9857C53F7DE9DBA0B451456A71051451400945048039AE4BC47F10349D083451
            B8BBBC1C79511E14FF00B47B7F3A994E31576CD68D0A95A5CB4D5D9D45C5C456
            B03CD3CA91C4832CCE7000FAD79578BBE253DC07B1D0DCA47F75EEBA337FBBE9
            F5EB5C86BFE2AD4FC4536EBC9B6C20E5204E117F0EE7DCD62579F5B16E5EEC0F
            AACBF238D3B54AFABEDD3FE08A49662CC724F526928A2B88FA20A28A2800A28A
            2800A28A2800A28A2800A28A2800A28AD7F0C68EFAEF882D6C403E5B36E94FA2
            0E4FF87E34E31727646756A469C1CE5B23D83E1DE9074AF0A40CEB89AE8F9EE3
            EBD3F402BADA6222C6811400A06001DA9F5EE423CB1491F9BD7AAEB549547D45
            A28A2A8C828A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
            028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
            028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
            028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
            028A28A00F28F8ADE1F292C5AE40BC3622B8C763FC27FA7E55E635F4CEA7A7C1
            AAE9B3D8DCAEE8A642ADEDEFF515F3A6B1A5CFA36AB7161703F7913633D98762
            3EA2BCCC5D2E5973AEA7D8E458DF694BD84B78FE5FF00A345145719F40145145
            001451450014514500145145001451562C6D5EFAFEDED23FBF348B1AFD49C534
            AEEC4CA4A29C9F43DABE1A697F60F09C7330C4976E653F4E83F419FC6BB2A82C
            EDA3B3B386DA2188E2408A3D0018153D7B708F2C523F36C45575AB4AA3EAC5A2
            8A2ACC428A28A0063BAC68CEC70AA3249AF9B35BD41B55D6EF2F8927CE94B2E7
            B2F61F962BDBFC7DA9FF0065F846F1D5B124C3C94E7BB707F4C9FC2BC06BCFC6
            CF689F55C3B42D19567E8145145701F4E1451450014515674FB19F53D42DECAD
            D732CCE117D3EB4257D1132928C79995A8AF5EB5F847A6A28373A85CCA7BF960
            20FEB5BB67F0F3C356786FB009987799CB0FCBA7E95D71C1D47B9E2D4CFF000B
            1F86EFE5FE6783C50CB3C823863791DBA2A2E49AE934DF87FE22D4B0C2CBECF1
            9FE2B86D9FA7DEFD2BDD6D6C2CECA3D96B6B0C0BFDD8D028FD2AC63DAB78E0A3
            F699E6D6E22AB2D2946DEBA9E6DA4FC25B48B6BEAB78F70DDE38BE55FA67A9FD
            2BB8D3743D33488F658594307182557E63F53D4D68D15D30A5086C8F1B118DAF
            887FBC95FF002168A28AD0E50A28A69655192401F5A005A2B9FD4FC6BA0695B9
            67D4637907FCB38BE76CFE1D3F1AE2755F8B9236E4D2AC428ED2DC1C9FFBE47F
            8D653AF086ECEDA197626BFC11D3CF43D4DE448D4BBB2AA819249C015C8EB7F1
            1F45D2B747049F6E9C7F04272A3EADD3F2CD7906ABE23D5F5A726FAFA5917FE7
            983B507E038ACBAE3A98D6FE047BD86E1E8AD6BCAFE4BFCCEA35EF1EEB3AE6E8
            BCEFB2DB1FF96309C647BB753FCAB97A28AE394E53776CFA0A387A7423CB4D59
            051451526C14514500145145001451450014514500145145001451450015EC5F
            0B740365A5C9AB4E9896EF88F3D4463FC4FF00215E6FE16D064F116BB0D9A83E
            483BE771FC283AFE7D3F1AFA1A1892085218902C68A155474007415DD83A577C
            ECF9ACFF001BCB15878EEF7F425A28A2BD13E4C28A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A004AE0FE247858EADA7
            7F69DAA66F2D57E65039923EE3EA3AFE75DE52100820F4A99C14E3CACDF0D889
            E1EAAA90DD1F2E515DC7C42F089D16F8EA3669FE8370DC803889FD3E87B570F5
            E2D48384B959FA1617130C4D25521D428A28A83A028A28A0028A28A0028A28A0
            02BB4F861A67DBBC54B72CB98ED23321E38DC781FCC9FC2B8BAF67F855A67D93
            C3925F3AE1EEE5241FF61781FAEEAE8C3439AA23CACE2BFB1C24BBBD3EFF00F8
            077D451457AE7C18514514005145213804D007937C5BD4F7DE596988788D4CCE
            3DCF03F91FCEBCD2B67C55A9FF006BF89AFEEC1CA3485508FEEAFCA3F4158D5E
            2D79F3D46CFD0F2EA1EC30D0879051451591DC1451450015D47C3C96187C6D62
            D310036F5527FBC54E3FC3F1AE5E9D1C8F148B246E51D4EE5653820FAD5425CB
            24CC7114BDB52953EEAC7D45DA8AF13B7F8A9AFC10246E9693328C799221C9FA
            E0814ADF15BC40DD22B25FF7636FEAD5E9FD6E99F1BFD858CBDACBEF3DAE8AF0
            C97E27789641859E08FDD611FD735426F1E789A7187D5651FEE2AAFF002149E3
            69F6348F0F625EED2FBFFC8FA0770F5155EE2FECED1775CDD43081DE470BFCEB
            E749F5ED5EE789F54BC901EA1A6623F2CD502CCC4962493DCD66F1CBA23A69F0
            E4BEDCFF0003E80BBF1E786ED01DFAA44E4768817CFE55CF5E7C5BD3620459D8
            DC5C11D0B9080FF33FA578FD1594B1937B1DD4F87F0D1F89B7FD791DD5FF00C5
            5D6EE72B6B15BDA29E842EF61F89E3F4AE5B50D7B56D509FB6EA171303D559CE
            DFFBE7A56751584AACE5BB3D2A381C3D1F8209051451599D6145145001451450
            014514500145145001451450014514500145145001451450014E44691D5114B3
            31C003A934DAF4CF869E1132CABAE5FC7FBB5FF8F6461F78FF007FF0ED5A52A6
            EA4B951C98CC5C30B49D497FC39D7F81BC323C3BA28F3547DB6E30F39F4F45FC
            3F9E6BA9A28AF6611515647E7B5AB4AB547527BB168A28AA330A28A2800A28A2
            800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
            800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
            800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
            800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
            802A5FD8DBEA5652DA5D46248255DACA6BC0FC57E19B8F0D6A8D03E5EDA4CB41
            2E3EF0F43EE2BE86ACCD7344B3D7F4C92CAF23CAB72AC3AA37623DEB0AF41548
            F99E9E59984B09535F85EFFE67CDD456AF88340BCF0EEA6F6774B91D63940E24
            5F515955E44A2E2ECCFBBA7523522A70774C28A28A4585145140051451400F86
            279E68E18D773C8C1540EE4D7D29A4D8A699A4DAD927DD82254CFAE075AF11F8
            79A67F6978BED4B2E63B60676FA8E9FA915EF78E2BD1C1434723E4788ABF3548
            D25D35168A28AEE3E7028A28A004AC3F16EA7FD93E17BFBA0DB64119543FED37
            03F535B95E63F17353D96F63A62372EC66907B0E07F33F95655A7C906CECCBE8
            7B7C4C21E7F91E534514578A7E8A145145001451450014514500145145001451
            4500145145001451450014514500145145001451450014514500145145001451
            450014514500145145001451450014515D0F84FC2975E26D4022031DA467F7D3
            63A7B0F7AA8C5C9F2A32AD5A1460E737648B7E08F0849E23BF134EACBA742DFB
            C6E9BCFF00747F5AF748628E18922894246802AA818000ED5069FA7DB6976315
            9DA46238621855156FBD7AF468AA51B753E0B30C7CF195799ECB642D14515B1C
            0145145001451450014514500145145001451450014514500145145001451450
            0145145001451450014514500145145001451450014514500145145001451450
            0145145001451450014514500145145001451450014514500145145001451450
            0145145001451450014514500145145001451450014514500145145001451450
            014514500145145001451450014514500646BDA05978874E7B4BC8FDD241F790
            FA8AF08F10F876F7C39A835B5DA128798A603E5907A8FF000AFA36B3F57D1ECB
            5CB07B3BE884913743DD4FA83D8D73D7A0AA2BADCF572DCCE784972BD62FFAD0
            F9AE8AE93C55E0EBEF0D5C966066B263FBB9D47E8DE86B9BAF2A70717667DBD1
            AF0AD053A6EE9851451526A14515D2F83BC293F897535DCAC96313033C9EBFEC
            8F73FA55422E4EC8CAB5685083A937648EEFE14E8CF6BA55C6A7326D6BA60B1E
            7AEC5EFF0089CFE55E8951410476D02410A048A350AAAA380074152D7B54E1C9
            1513F3BC5E21E22B4AABEA2D1451567385145140099AF9FBC75A9FF6A78BAF64
            56CC7137929F45E0FEB935EDFAFEA2349D0AF6F89198622CB9EEDD87E78AF9B9
            98BB976392C7249AE1C6CF4513E9787685E72ACFA682514515E71F5814514500
            1451450014514500145145001451450014514500145145001451450014514500
            14514500145145001451450014514500145145001451450014515D8F83FC0973
            E2175BABA0F069C0FDEE8D2FB2FF008D5C2129BB230C46229E1E0EA5476451F0
            A7846F3C4F79F2E62B28CFEF6723F45F535EE9A5E9769A3E9F15959C4238A31C
            7A93EA7D4D3EC6C6DB4DB38ED6D2158A18C6151455AAF568D0549799F0F98665
            53193ED15B2168A28ADCF3428A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0082E6DA1BBB7782E22596271864719045792F8ABE19DCDACAD73A1A34F
            6EC79B7CFCE9F4CF51FAFD6BD828ACAA528D456675E131D5B092E6A6FE5D0F9A
            67D1754B662B369D77191FDE8587F4A5B7D0F55BB70B069D75213E90B57D2BB4
            1EC28DA07615CDF528F73D9FF58EA5BE057F53C7740F85B7F7722CDAC38B583A
            F9484348DFD07EB5EAFA7E9D69A5D947696702C30A0C055FF3C9AB9495D34E8C
            69AD0F1F178FAD8A77A8F4EDD05A28A2B538C28A28A0028A28A00F3CF8B3A835
            BE856B62848FB4CB96F755E71F995FCABC76BD43E30B1DFA40ED894FFE815E5F
            5E4E2DDEAB47DD647051C1C5AEB7FCC28A28AE63D70A28A2800A28A2800A28A2
            800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
            800A28A2800A28A2800A28A2800A7471BCB22C71A33BB1C2AA8C926B5B41F0CE
            A7E21B8D96501F2C1C3CCFC227E3FD057B2F863C13A7786E3122AFDA2F48F9AE
            1C723D947615BD2C3CAA7A1E5E3B35A38556DE5DBFCCE4FC21F0D0FEEEFF005D
            4FF692D3FF008BFF000FCFD2BD4238D628D51142A28C00060014FA2BD4A74A34
            D591F198AC655C54F9EA3FF802D14515A1CA1451450014514500145145001451
            4500145145001451450014514500145145001451450014514500145145001451
            4500145145001451450014514500145145001451450014514500145145001451
            4500145145001451450014514500145145001451450014514500145145001451
            4500145145001451450014514500145145001451450014514500145145001451
            4500145145001451450014514500145145001451450014514500145145001451
            4500145145007987C6180B5B6953F647913F300FFECB5E535EE7F1334E37DE11
            9A44525ED9D66007A743FA127F0AF0CAF2B191B54B9F6F90D452C228F66FFCC2
            8A28AE53DA0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
            800A28A2800A28A2800A28A2800A28A2800A28A2800A2A7B4B3B9BEB8582D209
            2695BA246A49AEFF0040F8557770566D666FB3C7D7C98C8673F53D07EB5A4294
            E7F0A393138DA18657A92FF3380B3B2BAD42E52DED2092699BA222E4D7A67873
            E15E025CEBB2027AFD9633C7FC09BFC3F3AF40D2B44D3B44B7F274FB54857B90
            3E66FA9EA6B46BBE961231D65A9F2F8DCF6AD6F768FBABF120B5B482CA0482DE
            248A24185445C0153D14B5D8B43C16DB77614514500145145001451450014514
            5001451450014514500145145001451450014514500145145001451450014514
            5001451450014514500145145001451450014514500145145001451450014514
            5001451450014514500145145001451450014514500145145001451450014514
            5001451450014514500145145001451450014514500145145001451450014514
            5001451450014514500145145001451450014514500145145001451450014514
            50014514500145145001451450041756F1DDDACD6F2AEE8E5428C0F70460D7CE
            5AEE933687ACDC69F303989BE56FEF2F63F957D275C7F8EFC223C476027B5555
            D42DC1D84F1E60FEE9FE9FFD7AE6C4D1F691BADD1EBE4F8E586ABCB3F865F81E
            17453E68A4B799E1991924462ACAC3041F4A65793B68CFB94D3574145145030A
            28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
            28AD3D3BC3BAC6AA47D8B4F9E553D1F6E17FEFA3C535172D1113AB0A6AF37646
            6515E89A57C26D427C3EA5771DB2FF007231BDBFC07EB5DBE93F0FBC3FA56D7F
            B27DA651FF002D2E0EEFD3A7E95D10C25496FA1E4D7CF30B4B48BE67E5FE678C
            E95E1BD5F5A602C6C65910FF00CB4236A0FC4F15E81A2FC268D76CBAC5D973FF
            003C60E07E2C79FCB15E9AA888A02A800700014EAECA78484757A9E0E273CC45
            5D21EEAFC7EF2869BA3E9FA441E4D85A470277DA393F53D4FE357E8A5AE9492D
            11E34A5293BC9DD8514514C41451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            14514500145145001451450014514500725E2AF0358789079CA45B5F0E932AE7
            77B30EF5E7F79F0AF5F8326DDADAE40E815F693F98C7EB5ED94561530F4E6EED
            1E8E1B35C4E1E3CB1775E67CE977E13D7EC89F3B49BA18EA51378FCD73593243
            2C2FB258DD187665C1AFA87AD4535AC13AED9A14914F66504560F04BA33D3A7C
            4735F1C3EE67CC1457D173F84B40B8C99348B4C9EEB1053FA5664DF0DFC31292
            458B464FF7267FF1AC9E0A5D19D90E22A0FE28B4783D15ED137C27D0A4E639EF
            22FF0076407F98AAAFF0874E3F7351B95FF7829FE952F0950DE39F611EEDFDC7
            90D15EACDF07A227E5D61C7D6007FAD467E0E8EDAD91FF006EDFFD954FD56AF6
            34FEDBC17F37E0FF00C8F2DA2BD4C7C1D1DF5B27E96DFF00D9548BF07E007E7D
            5E423D04207F5A3EAB57B07F6DE0BF9BF07FE4794515EBE9F0874D1F7F51BB3F
            4DA3FA55B87E14E811FF00AC92F25FF7A403F90154B0750CE59F6116D77F23C5
            68AF7A87E1CF8621C1FECE2E7D5E573FD6B4EDFC2DA15AE0C5A4D9A91DFCA04F
            E66A960A5D59CF3E22A2BE1837F71F3BC36D3DC3EC8219256F4452C6B62D3C1B
            E22BDC793A4DC807BC8BE58FFC7B15F41C704512858E34403B28C0A9318AD560
            A2B767254E23A8FE0825EBAFF91E2F65F0A35B9C83753DB5B2FA64BB7E9C7EB5
            D2587C24D361C35EDECF707BAA011A9FE67F5AF44A2B68E1A9AE879F5739C654
            FB56F430F4FF0008E83A6156B6D3200E3A3BAEF6FCCE4D6D8000C00052E28C56
            CA296C79D3A93A8EF377168A28AA2028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A334C69510659D40F73400FA
            2A359A27FB92A37D1B34FC8F5A005A28A2800A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2800A28A2800A28A2800A298D2220CB3AA8F73424B1C83E
            4911BFDD6CD003E8A33450014514500145145001451450014514500145145001
            4514500145145001451450014514500145145001451450073DE37BFD534BF076
            A17BA3233EA112A988245E61FBEA0FCBDF8CD7838F8DBE35B67293FD8CBAF056
            4B6DA7F422BE99ACFD4744D2B574D9A8E9D6B763A7EFE157C7E62819F3F2FC7C
            F15A8E6CF496FAC327FF00174F1F1FFC51DF4ED20FD2293FF8BAF44D7BE09F85
            B5485DAC22974CB923E5685CB267DD5B3C7D315F365EDA49617D71673604B04A
            D13E3FBCA70690CF513FB40789BB69BA4FFDFB93FF008BA69F8FFE29EDA7E91F
            F7EA4FFE395E535EEDE17F821A1EABE1FD3753BED43502F776D1CE6388A285DC
            A1B1CA9F5A01D8E74FC7DF159FF972D207FDB193FF008BA69F8F7E2C3FF2EDA5
            8FFB62FF00FC5D7A547F03FC1A806E86F24FF7AE0FF4C5327F81BE0E954844BE
            873DD2E338FF00BE81A05A1E729F1F3C56A7E6B4D29C7BC2FF00FC5D6BD87ED0
            978ACA350D0A0917B9B798A11F8106A5D6BF67E6589E4D1358DEE3EEC37698CF
            FC0D7FF89AF21D6F41D4FC3BA83D86AB6725B5C2F386E8C3D54F423DC503D0FA
            63C37F16BC2DE229120174D6374C7021BC01327D9BEEFEB9AEEFA8AF86EBD7BE
            14FC50B8D3AF20D035BB832584A4476F3C872606ECA4FF0074FE9F4A0563E86A
            F3EF8A9E21F11787748B2B9F0FA3B3B4AC272B6FE680BB78CF1C735E83494C47
            CCABF1BFC6719C3C966C7FDAB7FF00035613E3D78B54736FA5BFFBD0BFF47AF7
            DD4BC35A1EB00FF68E9367744FF1C90A96FF00BEBA8AF2DF887F08B40B2F0DDF
            6B1A34735A4F691F9A610E5E3751D7EF64838F7A43B9CC0F8FDE2AFF009F0D20
            FF00DB193FF8E5387C7FF13F7D3B493FF6CE4FFE2EBCA2AF689651EA5AF69D61
            29611DCDCC70B14FBC0330071F9D03B1E927E3FF0089FB69DA48FAC727FF0017
            4C3F1F7C547A596903E90C9FFC5D777FF0A07C2BFF003FDABFFDFE8FFF008DD1
            FF000A07C2BFF3FDABFF00DFE8FF00F88A05A1C01F8F5E2D3D2DF4B1F481BFF8
            BA61F8EBE2F3D174E1F480FF00F155E85FF0A07C2BFF003FDABFFDFE8FFF0088
            A3FE140F857FE7FB57FF00BFD1FF00F11406879C9F8E5E313D24B21F4B7FFEBD
            467E3778CCFF00CBCDA0FA5BAD7A33FC00F0D1FB9A96AABF578CFF00EC95CA78
            BBE06CFA46953EA3A2DFBDE8814BBDB4B1E1CA8EA548EA7DB140F4304FC6AF1B
            1FF97FB71F4B64FF000AFA4F45BA7BED0B4FBB94E649EDA3958818C96504FF00
            3AF8AABEC8F06BF9BE08D05FD74FB727FEFDAD084D1B95E63F163C53E28F0CB6
            9B26808FE43AC86E1FECDE628236EDC9C71D4D7A7525311F3227C70F19A7DE96
            CDBFDEB71FD2AC27C79F16AF5874C7FF007A06FE8D5EFBA8F86342D5C1FED0D2
            2CAE58FF001C90296FFBEBAD7907C4FF0084FA368DE1EB9D7B4532DB1B72A64B
            6672E8CACC17E5CF20F3EB486628F8FBE2A1D6C7483FF6C64FFE39520F8FFE26
            1D74DD24FD2393FF008BAF27AD9F0A6889E23F13D869124CD0A5D49B0C8AB92B
            C13D3F0A0763BE3F1FFC4FDB4ED27FEFDC9FFC5D35BE3EF8A8F4B1D207FDB193
            FF008E575F17ECFBA20FF5DAC5FBFF00B8A8BFD0D5D8BE0278513EFDD6AB21FF
            006A641FC92816879EBFC77F173748B4D5FA40DFFC553A2F8F5E2C8FEFDB6972
            FF00BD0B8FE4F5DDDD7C01F0D4887ECFA86A70BF62CE8EA3F0DA3F9D709E25F8
            1DAF69113DC6953A6AB028C9445F2E51FF0001C9CFE073ED40F43A0D2BF6843B
            D5757D0C6DFE292D25E47FC05BFF008AAF52F0D78D741F16425B4ABE5795465E
            07F9644FAA9FE6322BE3E7478E464752AEA70CA4608353595EDD69D7915E59CF
            24171136E49236C1534058FB728AE07E18F8FD7C69A43457655355B4004EA381
            20ECE07F3F43F515DF532428A28A0028A28A002ABDE5EDAE9F6AF75797115BC1
            18CBC92B0555FC4D725E3BF88DA5F82ADFCB900BAD4A45CC56A8D823FDA73FC2
            3F535F37789FC63ADF8B6F0CFAA5DB3A0398EDD3E58E3FF757FAF5A571D8F6DF
            11FC76D134E668746B693539471E69263887E2464FE5F8D79AEADF19FC63A93B
            79379158447F82DA21FF00A1364FEB5CA681E1AD5FC4F7C2D349B292E24FE361
            C220F566E82BD9FC3DF00ACA14597C41A84971263FD45AFC883EAC793FA503D0
            F17BCF136BDA831377ACEA13E7B4970EC3F2CD661676392589F535F5DE9FF0F3
            C23A62A8B7F0FD892BD1A68FCD6FCDF26B6A3D234D887EEF4FB44FF76151FD28
            B0AE8F8A72DEF572DF57D4ACF1F66D42EE1C74F2E665FE46BEC59F40D1AE94AD
            C69363283DA4B746FE62B9ED4FE15783354077E8B15BB9E8F6A4C58FC178FD28
            B05CF9F34FF89FE33D3B1E56BD73201DAE312E7FEFA06BA9D3FE3E7892DF0B79
            656176BEA15918FE20E3F4AD4F10FC019A2479BC3DA979D8E45BDD8DADF838E3
            F303EB5E43AAE91A86897EF63A95A4B6B729D639171F88F51EE2819EE561FB41
            E992606A3A25DC1EA609565FE7B6BD2FC33E26D3FC59A48D4B4C321B7DE633E6
            A6D2186323F5AF8D6BE98F8178FF008579EFF6C93F92D0268F4CA28A298828A2
            8A0028A28A0028A28A002BC4BE3CF8AA48058F87ACE76473FE937051B071C845
            FF00D08FE55ECF7571159DA4D753B848614323B9E8AA0649AF8E3C51AECDE24F
            135FEAD3641B894B229FE14E8ABF8281498D1EABF01FC5329D42FB40BC9DDFCE
            1F68B7DED9F9870C3F1183FF000135EF15F177877599BC3FE21B0D560CEFB599
            5F03F897F897F1191F8D7D9367750DF5941776EE1E19E3592361FC4AC320D081
            9628A28A620A28A2800A28A2803C37E20FC44F19F863C617F6D66A134C429E43
            CB6B953945270DDF9CD73B1FC78F1747C341A649FEFC0DFD1857D24CAAEA5580
            208E4115897FE0DF0D6A609BCD0AC2463D5FC850DFF7D019A43B9E1EBF1FFC4F
            FC5A76927E91C9FF00C5D35BE3F78A8FDDB1D217FED949FF00C72BA9F1DFC1BD
            0ADFC3F7FAA68626B4B8B589A7F24B978DD5465873C838E9CD780D03563D226F
            8E3E3297EE4B650FFB96FF00E24D7D07E16D722F127866C3568B1FE91102EA3F
            85C70CBF83022BE34AF72F805E23FF008FFF000E4EFF00F4F56E09FA071FFA09
            FCE8068F72A28A299214514500145145001451450015E55F173E21EA1E119F4E
            B0D1E5892F250D34C5D03613A28C1F53BBFEF9AF537758D19DC85551924F402B
            E3FF001CF884F89FC63A86A618985E4D9067B46BC2FE833F8D21A47570FC76F1
            7C5F7D34E97FDF81BFA30AB4BF1FFC4E07CDA76924FB4727FF00175E515BBE0E
            F0EBF8AFC5563A3AC86259D8F99201CAA282CC7EB8140EC76CFF001F3C56E3E5
            B3D253E90C9FD5E9B69F183C79AA5E24166B13BB30F92DECF79C7EB5EBDA4FC2
            8F06E90ABB7488EEA45EB25D9F34B7E07E5FD2BAEB6B3B5B288456B6F14118E8
            912051F90A044C3A52D145310514550D5B57B1D0F4D9B50D46E120B584659D8F
            E83D4FB5005FED5C078A7E2EF86BC36D2411CC751BD5E0C36C72AA7FDA7E83F0
            C9F6AF20F1DFC5AD53C5124965A734961A574D8AD89261FED91DBFD91FAD70FA
            4E8FA86BBA94761A6DAC9737321F95107EA4F61EE690D23D035AF8E5E29D4199
            74F16DA645DBCB4F31FF00166E3F202B8ABEF16F88B53666BCD6F509B3FC2676
            C7E59C57B2F857E03D8DBC4971E25B96BA98F3F66B762B1AFB16EADF863F1AF4
            FD33C31A168AAA34ED22CED8AFF1470AEE3F56EA6803E3B16B7D3832082E241D
            DB631A84F9B13F3BD187E06BEE0C0F41556F34DB0D423F2EF6CADEE53FBB344A
            E3F5A2C173E3DB1F14EBFA6B06B3D66FE0C764B8603F2CE2BB4D13E3878A74D6
            54BF36FA9C39E44A9B1F1ECCBFD41AF51F11FC16F0C6B31BBD846DA5DD1E43C1
            CC79F743C7E58AF09F17F8175AF065E797A843BED9CE22BA8866393F1EC7D8D0
            33E82F09FC58F0E78A5D2D8CAD617CDC082E48018FA2B743FA1F6AEF2BE1BAF5
            8F875F17EEF45961D2BC432BDCE99F712E1BE6920F4CFF00797F51DBD28B89A3
            E8CA2A28278AEADE39E0912586450E8E872194F420D4B4C467EB73DD5B683A84
            F64A4DDC76D23C2157712E1495E3BF38E2BE7A6F8CFE39D3E5F2AF22B6120EA9
            3DA943F96457D2B505C5A5B5E47E55CDBC53467F86440C3F5A00F9E13E3F78A0
            7DED3F496FFB6520FF00D9E9AFF1F7C52C30B63A4AFB88A427FF0043AF64D43E
            1A783B5307CFD06D518FF15B8311FF00C7715E33F14FE1859F83ECA0D574AB89
            5ACE597C97866219918824107D3E53D690CAB2FC71F1949F725B28BFDCB7FF00
            126BD7BE197C418FC69A4982ED91357B51FBF41C798BD9D47F3F43F515F2CD68
            E87ADDF787B58B7D534F97CBB881B70F461DD4FA83D281D8FB4E8AE7FC21E2AB
            1F17E8116A76676B1F967849C98A4EEA7FA1EE2BA0A6485145140056178C6F75
            1D3BC25A8DE690ACD7F147BA10B1EF24E47F0F7E335BB45007CCDFF0BAFC6D6B
            218E736BBD4E0ACB6BB48FE553A7C7CF1628E6D34A7FF7A17FE8F5F42DF693A7
            6A91ECBFB0B5BA4E9B67895C7EA2BCF7C63F083C377DA35E5CE976834FBF8A26
            9233093B18819DA57A60FB5219C08F8FFE26C73A76939FFAE727FF00174D6F8F
            BE2A3D2C7485FF00B6527FF1CAF2AAF5BF84BF0D34CF14E9B71AC6B42596DD26
            F261811F606C0058B11CF7038C77A065093E3A78C24FBA34F8FF00DDB73FD58D
            7A37C28F1778A3C51777EFAEAB7D91225681C5BF96A5B3CE1B1CD76DA6783FC3
            BA3053A7E8B6503AF490440BFF00DF479ADBC502168A28A620AF8E7C6CA13C77
            AF85181FDA33FF00E86D5F6357C75E39FF0091F75FFF00B084FF00FA19A4C68C
            0AFB23C1ABB7C11A02FA69D6E3FF0021AD7C6F5F66F85976F847465F4B1807FE
            38B42066BD14514C415CDF8D3C1F63E32D065B1BA455B8505ADAE31F344FEBF4
            F515D251401F11DF594FA75FDC595D46639EDE468A443D981C1AAFDEBD13E366
            9A961F1167950605E411DC11EFCA9FFD033F8D79DD4948FAD3E18F881FC47E03
            D3EEA672F730836F3313C964E327DCAED3F8D7615E3BFB3E4ECDE1ED5EDC9F95
            2E95C0F765C7FECA2BD8AA890AC3F19A799E07D7D7D74EB8FF00D16D5B9591E2
            A19F086B5FF5E13FFE8B6A00F8CAB6FC1ABBFC71A0AFAEA36E3FF222D625741E
            055DDE3ED007FD44213FF8F8A92CFB128A28AA2028A28A002908C8C1A5A2803E
            44F889E1E1E19F1BEA1611AEDB767F3A0F4F2DB903F0E57F0AFA43E1A5CFDABE
            1CE8726738B611FF00DF24AFF4AE3BE32780B54F13CFA6EA1A2D9FDA6EA25686
            750EAA767553F311D0EEFCEBABF861A56A7A1F812CB4CD5AD8DBDD40F20F2CB2
            B7CA5CB0E5491DE90CEC68A28A620AE43E282EEF86BAE0FF00A600FF00E3CB5D
            7D729F12C67E1C6BBFF5EC7F98A00F91ABAFF85A33F12B44FF00AEC7FF00416A
            E42BB2F85433F13344FF00AEADFF00A0354947D65451455121451450078B7C6C
            F02432D8BF8A74E842DC4440BC541C3AF40FF51C67DBE95E095F6B6AF611EA9A
            3DED84A331DCC0F137D1948FEB5F1511862293291D3FC3CD7A4F0EF8E34CBC0F
            B617944138EC637383F9707F0AFAF2BE1C524302320835F6E59CA67B1B799BAB
            C6AC7F11421327A28A29882B84F895F1060F0569622B7DB2EAD72A7C888F2107
            F7DBDBD3D4FE35D4EBDAD5AF87B43BBD56F5B105B465C8CF2C7B28F72703F1AF
            903C43AEDEF8975CB9D56FDF74D3B671D917B28F60295C68A97B7B73A8DECD79
            793C93DC4CDBA4924392C6BA7F00780EF7C6FAB7969BA1D3A120DCDCE3EE8FEE
            AFAB1FD2B9ED1B49BAD7358B5D32C937DC5CC8114761EE7D80E7F0AFAF7C31E1
            CB2F0B6836FA558AFC910CBB91CCAFDD8FB9A06C9743D074DF0E6991E9FA5DB2
            C16E83903AB1FEF31EE6B528A2992145145001451450015CAF8EBC1765E33D0A
            4B595116F6352D6B718E637F4CFF0074F715D551401F105CDBCB677535B4E852
            685CA3A1EAAC0E08AFA3FE03B6EF87F28FEEDF483FF1D4AF35F8DBA00D27C6E6
            FA24DB06A5189B8E9E60F95FFA1FF8157A0FC009777832FE227EE5FB1FCE34FF
            000A453D8F59A28A29921451450014514500145145007977C6FF0012FF006478
            4974A85F173A9B6C6C75112F2DF9FCA3F135F365763F13FC4BFF0009378E2F27
            8DF75A5B9FB35BFA6D5EADF8B64FE22BA9F0A7C37FED7F84DAB6A6F0E750B83E
            6D971CED8B3C0FF7BE61F95228F25AFA4FE07F88FF00B57C20DA5CCF9B8D35F6
            0C9E4C4D92BF91DC3F015F36576FF0A3C47FF08EF8EACDA57DB6B79FE8B367A0
            DDF74FE0DB7F0CD00CFAB68A28A6485145140051451400514514019BE2150FE1
            AD550F46B4947FE386BE2E3D4D7DA7AE0CE81A8FFD7AC9FF00A09AF8B3F8A931
            A06564628CA5594E083D456A786F5C9FC39E22B1D5ADF3BEDA50C547F12F465F
            C4645761F15FC2DFD9579A76B76E98B5D4ED919F03859828DDF98C1FAE6BCEA9
            0CFB72C6F60D46C2DEF6D9C3C1711ACB1B0EEA464558AF21F813E28FB7E853E8
            1712667B13E64209E4C4C7A7E0DFFA10AF5EAA2428A28A0028A28A0028A28A00
            F3DF8C3E271E1FF054D6D0BEDBCD4B36F181D427F1B7E5C7FC0857CBC1598310
            A48519623B0AEDFE2AF8A7FE127F1A5C342FBACACFFD1ADF1D0E0FCCDF8B67F0
            C56869BE15FB0FC16D73C45731E27BD686283239112CCB93FF000261FF008E8A
            4523CDEBD23E07A86F88D193FC36B29FE55E6F5E97F02C67E21E7D2CE4FE6B40
            1F4CD14514C90A28A2802AEA17D6DA6584F7D7932C36F021791D8F000AF957E2
            078F6F3C6DAB97F9E1D361245B5BE7A0FEF37FB47F4E95D9FC71F1A35DEA0BE1
            8B197FD1EDC87BB2A7EFC9D42FD17AFD4FB578E522922FE8BA3DE6BFABDB6976
            11F997370FB54761EA4FB01CD7D5BE0AF0569DE0BD1D2D6D5164BA700DCDC95F
            9A56FE8BE82B86F817E144B2D1A5F11DCC5FE91784C76E48FBB103C91FEF30FF
            00C747AD7B0D02614514531051451400552D534BB3D6B4D9F4FD42DD27B69D76
            BA37F9E0FBD5DA2803E47F881E09B9F04EBED6A77C963365ED6723EF2FF74FFB
            43BFE07BD7275F5DF8FF00C291F8BFC2973618517483CDB573FC320E9F81E9F8
            D7C8D246F0CAF148A55D18AB29EA08A4523D7BE0D7C417D3AFA3F0CEA9366CA7
            6C5A3B9FF5521FE1FF0075BF9FD6BE84AF8715991D5D09565390476AFADBE1CF
            89CF8AFC19697D2B03771FEE2E7FEBA2F7FC461BF1A109A3ADA28A29882BCD7E
            39461FE1D3B1FE0BA8987EA3FAD7A5579D7C6D19F86D727D2E22FF00D0A803E6
            0A2B7BC136B05EF8DB47B5BA8965B79AE92392361C3293822B5BE23F80EE3C15
            AD11187934BB824DACC7B7FB0DFED0FD47E3525157C05E34BAF056BE9771EE92
            CE5C25D400FDF5F51FED0EDFFD7AFABF4DD42D755D3ADEFECA659ADA740F1BAF
            422BE26AF4EF84BF10CF867511A3EA737FC4A6E9FE5763C5BC87F8BFDD3DFF00
            3F5A77068FA5A8A40C18020820F4229699214514500151CC8248648C8E194835
            2521E87E9401F0EB7DE35F4FFC135DBF0D6D0E3EF4F29FFC7ABE64BA5D977327
            F75D87EB5F4FFC1718F865A79F59263FF910D24533D028A28A6485145140057C
            77E3AFF91F7C41FF006109BFF4335F6257C77E3AFF0091FB5FFF00AFF9BFF433
            498D1CF8EBF8D7DA5E1E1B7C35A50F4B48BFF4015F170EA2BED3D0863C3FA68F
            FA758FFF00411420668514514C41451484E2803E71F8FB22B78E2C90754D3D32
            7FEDA495E555D67C49D793C47E3CD4AF617DD6C8E20848E85506DC8FA9C9FC6B
            94556760AA0966380077A96523E86FD9FED1A3F0AEA57446166BCD8BEFB507FF
            00155EBB5CD780BC3E7C33E0AD374D91713AC7E64FFF005D1BE661F8671F8574
            A6A8961593E28FF914B59FFAF19BFF004035AD595E26E7C2BABFFD794DFF00A0
            1A00F8C2BA5F87ABBBE216823FE9F633FAD7355D4FC3819F88BA17FD7D2D4947
            D77451455121451450065788F5DB7F0D787EF358BA5678AD903145EAC490001F
            891583E04F88569E3B6BFF00B2D8CF6DF63F2F719581DDBF76318FF74D735F1E
            F55FB2F842D34D56C3DEDC8247AA20C9FF00C78AD667ECF3162C35D9BFBD2C2B
            F906FF001A571D8F6BA28A298828A28A002B96F89033F0EB5DFF00AF56AEA6B9
            7F88A33F0F35DFFAF47A00F90EBB4F84C33F13B45FF7E4FF00D16D5C5D76DF08
            867E2868C3FDA97FF453D4A28FABA8A28AA2428A28A0086E665B7B59667202C6
            8CC49F402BE23762F2331EA4E6BEA6F8B3E258FC3DE07BB895C0BCBF536D02E7
            9C30F9CFE0B9E7D48AF95E93291359DB3DE5F5BDAC43324D22C683DC9C0AFB6A
            18C450C71AF4450A3F0AF997E0CF861F5CF19C5A84887EC7A662666C7064FE05
            FCFE6FF80D7D3D42130A28A0D311E0FF001F3C4A5EE6CBC3703FC918FB4DC63B
            B1C841F80C9FC45789D6E78CB586D7BC61AAEA45B72CD70DE59FF607CABFF8E8
            158752CA3DB7E00F871649EFFC453A03E57FA35B93D988CB9FCB68FC4D7BBD72
            1F0C74B1A47C3BD1E1DB87961170FEE5FE6FE440FC2BAFAA25B0A28A2800A28A
            2800A28A2800A28A2803CFFE2C782AF3C65A159A69AB1B5F5ACFB97CC6DA3630
            C30CFD42FE550FC24F086B1E0FD3351B6D5D22469E65923F2E4DDDB07FA57A35
            1400514514005145140051451400571BF13BC4BFF08C7822F2E237DB77703ECD
            6FEBB9BA9FC1727F0AECABE6BF8E1E25FED6F16A6930BE6DB4D5D8D8E8656E5B
            F2F947E0681A479F68BA54FAE6B767A65B0CCD752AC60FA64F27E83AD7D95A6E
            9F0695A65B69F6C9B60B6896241EC062BC2FE02786BED3AA5E788A74CC76ABE4
            4048FF00968C3E63F82F1FF02AF7FA4819F26FC4FF000DFF00C233E38BD8234D
            B6B727ED36F8E9B5BA8FC1B70FC2B8D070723AD7D23F1CBC37FDABE148F57853
            371A6BEE6C7531370DF91DA7F3AF9BA81A67D73F0EBC4A3C53E0BB2BE77DD751
            AF9173EBE62F527EA30DF8D7566BE71F817E25FECDF13CBA2CEF8B7D45731827
            812AF23F3191F957D1D4C9614514500145145001451450067EBA71E1ED48FA5A
            CBFF00A09AF8B3F8ABED1F109C786B543FF4E92FFE806BE2DEFF008D26347D5D
            AF78693C5DF0C21D3801F6836714B6CC7F86554057F3E9F426BE5392378A568E
            452AEA4AB291820D7D9DE1B3BBC2FA49F5B387FF004015F3DFC6AF0AFF006278
            B3FB4EDE3C59EA799781C2CA3EF8FC786FC4D008E4FC13E2393C2BE2CB1D5549
            F291F64EA3F8A36E187E5CFD40AFB0229527852689C3C6EA19197A107A1AF87E
            BE97F829E28FEDAF097F664F266EB4C223E4F2D11FB87F0E57F0142068F4DA28
            A298828A28A002B89F8A5E29FF00845FC177324526DBDBBFF47B7C1E4161CB7E
            033F8E2BB6AF977E30F8A7FE121F19496B049BACB4ECC11E3A33FF001B7E7C7F
            C0450348E53C33A14FE26F12596936F90D71205661FC0BD59BF01935F447C56B
            2834EF8417B656C8120B75B78E351D9448805739F01BC2BF67D3EE7C4B731FEF
            2E4982D723A203F337E2C31FF013EB5D67C64FF925FAAFFBD0FF00E8D5A40CF9
            5EBD3BE040CFC4093DAC64FF00D096BCC6BD47E028CF8FAE3DAC243FF8FA5036
            7D27451453242B2BC49ACC7E1EF0DEA1AB480116B0B3AA9FE26FE11F89C0AD5A
            F26F8F9AA9B5F08D9E9C8F86BDB9CB0FEF220C91FF007D15A011F3D5DDD4D7D7
            93DDDC399279A4692473D5989C934EB1B39750D42DACA0199AE2558907AB31C0
            FE755EBB6F84BA70D47E24E94AE3290B34E7FE02A4AFFE3DB6A4A3EA2D2B4F87
            49D26D34F807EEADA15893E8A315728A2A890A28A2800A28A2800A28A2800AF9
            6FE31E809A278FAE258576C1A820BA503A062487FF00C7813FF02AFA92BC67F6
            83D395F46D23530BF3C53B404FB32EEFFD93F5A434780D7B0FC00D68DBEBBA8E
            8EEDF25D4226407FBE879FCC37FE3B5E3D5D77C30BE6D3FE2468B2838124FE49
            F7DEA57FAD25B8CFADA8A28AA242BCEFE35FFC934BBCFF00CF78BFF42AF44AF3
            AF8DA71F0DAE47ADC45FFA15007817808E3E20681FF5FD17FE842BEADF10E816
            3E26D167D2F518B7C128E08EA8DD997D08AF943C0A71E3ED03FEBFE1FF00D0C5
            7D886921B3E37F16785EFBC23AECDA65F2E76FCD14A07CB2A7661FE78AC3AFAE
            7C79E0AB4F1AE84D692ED8EF22CBDADC6398DBD0FF00B27BFF00F5ABE51D4F4C
            BCD1F529F4FBF85A1B981F63A3763FE1EF40D33DB3E0E7C47F3D22F0BEB13FEF
            546DB19DCFDE1FF3CC9F5FEEFE5E95EDB5F0EC723C522C91B15753B9594E0835
            F4DFC2BF8889E2DD3069FA84806B16ABF3E78F3D3FBE3DFD7F3EF409A3D1E8A2
            8A620A43D0D2D21A00F89B521B754BB5F499C7FE3C6BE9EF83631F0BF4A3EAD3
            1FFC8AF5F32EB236EB97E3D2E241FF008F1AFA73E0F0FF008B5BA3FF00DB6FFD
            1CF4914CEEA8A28A6485145140057C79E3CFF91FB5FF00FAFF009BFF004335F6
            1D7C79E3BFF91FB5FF00FAFF009BFF00433498D1CF8FBD5F6AE8C31A1D80FF00
            A778FF00F4115F14D7A5E95F1C3C53A6C31412C76377146A14799115381EEA47
            F2A06CFA668AF0687F687B951FBFF0E44FFEE5D95FFD94D32E3F685BE6522DB4
            0B78CF6325C33FF2028B8AC7BE578E7C56F8A56F65633F87F42B8596F25063B9
            B88CE5615EEAA7FBDDBDBEBD3CC7C45F14FC57E238DE09EF85B5B3F0D05A2F96
            08F427EF1FA135CAD8E9F79A9DD2DB58DACD733B7DD8E242C4FE0280B15ABD7B
            E0DFC3D9352BF8BC4BA9C256C6DDB36B1B8FF5D20FE2FF00757F9FD0D5FF0003
            7C1094CB1EA1E2AC2229DCB608D92DFF005D187F21F9D7B9430C76F0A430C6B1
            C48A1511460281D00140364B45145310565F8939F0BEADFF005E737FE806B52B
            33C45FF22C6ABFF5E737FE806803E2EADDF06EAD6DA178BF4CD52F0486DEDA6D
            EFE58C9C63B0AC2AD0D0F489F5ED6ED34AB678D26BA90468D212141F7C035259
            F437FC2F7F08FF00CF3D47FEFC2FFF001547FC2F7F08FF00CF3D47FEFC2FFF00
            155C07FC280F13FF00D04749FF00BF927FF1147FC280F13FFD04749FFBF927FF
            00114C9D0EF8FC77F0881C45A91FA40BFF00C55579FE3F786117F7361AA48DE8
            63451FFA1D7127E0078A31C6A3A47FDFD93FF88A865F80DE2C45256E34B90FA2
            CEFF00D50501A1CB78EBC6B77E37D6C5ECF1082DE25D96F006DDB17BE4F727FC
            2BD6FF0067C5C7873567F5BB51FF008E0FF1AF10D7FC3BAA786752361AB5AB5B
            CF8DCB9390CBFDE523822BDC7F67D6CF863545F4BC07FF001C140D9EBF451453
            2428A28A002B9AF88433F0FB5EFF00AF293F9574B5CDF8FF00FE49FEBDFF005E
            32FF00E826803E3FAEE7E0F8CFC52D1BFEDB7FE897AE1AAC595EDE69F7697561
            7335B5CC79D92C0E51D78C1C11ED5251F6E515F22C1F11FC656E309E20BE3FF5
            D1F7FF00E859A9DBE2A78D9D769D7A703D9101FF00D069DC563EB2E95C978ABE
            23787BC270482EAF127BC030B690306909F7FEEFE35F335FF8D3C4DA9A14BCD7
            7509633D53CF60A7F01C541A0F86B57F145E35AE9168D75328DCE03050A3D492
            68B858B1E2EF16EA3E31D69F51BF6DAA3E586053F2C49E83FA9EF51F863C2BAA
            78B7564B0D3212C7AC929FB912FF00798FF9CD7A97873E014EEC93F88B5158D3
            A9B6B4E58FB173C0FC01FAD7B2E8BA0E99E1EB05B1D2ACE3B681792AA3963EA4
            F527DCD03B957C27E17B1F08E830E976433B7E6965239964EEC7FCF415BB4514
            C90AC9F12DE1D3BC2FAB5E06DAD059CB2291EA10915AD5CA7C4993CBF873AEB7
            FD3B11F9902803E4634AA373003924D254F678FB6C1BBA798B9FCEA4B3ED5B1B
            65B3D3EDAD94616189631F80C558A41D052D510145145001451450014515C97C
            44D535DD1FC2AD79E1E86496F566505520F34ECE7276FE5401D6D15F323FC69F
            1BDBC8D1CD25B2BAF557B5008A72FC73F182F5360DF5B7FF00EBD2B8EC7D3345
            7CD4BF1E3C5A3AC3A637D606FF00E2A95BE3CF8B5BA41A5AFD206FFE2A8B858F
            A528AF995BE39F8C5BA358AFD2DFFF00AF5D4F803E20F8DFC4BE2AB182EE1326
            96ECDE7C91DA61146D38CB638E714058F71A28A298828A28A00C7F146B90F86F
            C357FABCD8C5BC45914FF13F455FC588AF8EA69AE351BF92690B4B737129663D
            4B331FF135ECDF1F3C4DBE7B2F0DDBBF09FE93738F5E88BF964FE22B93F83BE1
            BFEDEF1C43732A6EB5D387DA24CF42DFC03FEFAE7FE0269148FA0BC11E1E5F0B
            F8434FD2F03CD48F7CE47791B96FD78FA015D0D145324AF79690DFD94F697281
            E09E368E443FC4A4608AF8DFC47A2CDE1DF115FE93383BEDA52809FE25FE16FC
            460FE35F6857847C7DF0DEC9EC7C470270E3ECD7047A8E50FE5B87E02931A3C6
            6CAF26D3EFA0BCB67293C122CB1B0ECCA722BEC8F0E6B50788BC3D63AB5BE365
            CC41CA8FE16E8CBF81C8FC2BE30AF73F807E26CA5EF86E77E9FE936D9FC9D7FF
            00413FF7D50367B8D14514C90A28A2800A28A28032FC4871E16D58FF00D39CDF
            FA01AF8BFBD7D9DE2838F096B27FE9C66FFD00D7C63DFF001A4C68FB37C2CDBB
            C23A31F5B183FF00401595F113C303C59E0EBBB1450D7718F3ED4FFD345E83F1
            195FC6B4BC2077782F423EBA7DBFFE8B5ADA34C47C38CA518AB02083820F6AEB
            3E1B789FFE115F1A59DDC8FB6D263E45CFA6C6EFF81C1FC2B63E327857FE11FF
            00183DEC11EDB2D4B3326070B27F1AFE673FF02AF3AA928FB8C1C8C8E94B5C0F
            C24F147FC249E0A82399F75EE9F8B69B2792A07C8DF8AF1F5535DF5512145145
            00729F113C4E3C29E0EBCBE470B7720F22D467FE5A3743F80CB7E15F2BE87A4D
            CF8875EB3D32DF2D3DDCA1371E71EAC7E8327F0AEF3E3678A7FB6BC5834AB793
            369A60319C1E1A53F7CFE1C2FE06BA3F809E17CB5DF89AE13A66DED723FEFB6F
            E43FEFAA456C7B4697A75BE91A5DAE9D68BB6DEDA358907B018FCEB8FF008C9F
            F24BF55FF7A1FF00D1AB5DE5707F193FE497EABFEF43FF00A3569927CAF5EA5F
            013FE47DB9FF00B07C9FFA1A5796D7A8FC05FF0091FAE3FEBC24FF00D0D29147
            D27451453242BE7DFDA0EE8BF88348B3ED15AB4BFF007D363FF64AFA0ABE6FF8
            FA49F1E5A03D069D1E3FEFE494868F2BAF54F80702C9E39BB95867CAB072BF52
            E83F966BCAEBD73F67E23FE12DD4C77FB0FF00ECEB40D9F44514514C90A28A28
            00A28A2800A28A2800AF3AF8DB6EB37C37B9908E61B88A41F5DDB7FF0066AF45
            AE17E31007E176AF9EDE4E3FEFEA5007CAB5AFE1690C3E2ED16507052FA16CFF
            00C0D6B22B53C329E678AB484FEF5EC23FF1F15259F68514515440579C7C7038
            F87130F5B98BF9D7A3D79B7C7238F874FEF7517F5A00F03F039C78F3C3FF00F6
            1183FF00435AFB16BE38F051C78EBC3FFF00612B7FFD18B5F63D243615E6FF00
            153E1DA78B74D3A869F181AC5AA7C98E3CF4FEE1F7F4FCBBF1E9145311F0EC91
            BC523472214753B59586083E956B4BD4EF346D4EDF51B099A1B981B7A38FF3D3
            DABDB3E31FC37FB424BE28D1E1FDF28DD7D020FBC3FE7A01EBEBF9FAD783D494
            7D77E05F1A5A78D7415BC876C7771E12EADF3CC6FF00FC49EC7FC2BA9AF8E7C2
            3E2ABEF07EBD0EA564D903E59A127E5953BA9FF1EC6BEB3D035DB1F1268D6FAA
            69D2F9904CB9C7746EEADE8453B899A741E94514C47C59AF8DBE23D507A5DCA3
            FF001F35F4DFC2018F85BA37D26FFD1CF5F3478986DF156B0BE97B30FF00C7CD
            7D33F08C63E17E8DFEECBFFA35E914CEDA8A28A6485145140057C77E3A39F1EF
            883FEC2137FE866BEC4AF8EBC6E73E3CF107FD8467FF00D0DA931A3047515F57
            8F86DE0FD4B4FB76B9D02D43B44A4B420C4738FF00608AF93C7515F6DD871A7D
            B7FD725FE5421B3CF67F819E0F94928B7F0E7B473F4FFBE81AACBF00FC281B26
            F35661E8668FFF0088AF54A299270161F06BC1564C19F4E92E987433CEC7F404
            0AEC74ED234ED220F274EB1B6B48FBAC1104CFD71D6AF5140051451400514514
            00565F893FE457D5BFEBCE6FFD00D6A565789BFE455D5FFEBCA6FF00D00D007C
            615D47C3838F889A17FD7D2D72F5D37C3B38F887A0FF00D7E27F3A928FAFA8A2
            8AA2428A28A00F20F8FF00A509FC37A76A8AB97B5B83131F4575FF00151F9D57
            FD9EA5CE91AD45FDD9E36FCD4FF857A078FF00419BC4BE09D474BB540F732A2B
            420903E7560C393F4C7E35C9FC1DF076BBE11FED85D6AD5605B9F24C5B6557CE
            DDF9FBA7DC52EA3E87A9D14514C41451450015CD7C4138F87DAF1FFA7293F957
            4B5CC7C4438F879AF7FD79BD007C855DC7C2038F8A3A367FE9B0FF00C82F5C3D
            76BF094EDF89FA29FF006A41FF00909EA56E51F50CFA469B747371A7DA4A4FFC
            F4855BF98AE63C5FF0E345F1168171696BA7D9D95EE37C1710C2A8438E81881C
            A9E86BB5A2A893E23BEB1B9D36FE7B2BC85A2B881CA491B75522AEF86FC437DE
            17D72DF55B07C4B0B7CC87A48BDD5BD8D7B87C67F007F6AD9378934D8737B6C9
            FE951A8E658C7F17D57F97D2BE7AA451F66F86FC4365E28D0ADF55B07CC528F9
            909F9A361D55BDC56BD7CA7F0CFC792F8335D0B3B336957442DCC7D76FA38F71
            FA8FC2BEA78278AE608E782459229143A3A9C8607A114C44B45145020AE57E24
            4665F875AEA819C5AB37E5CFF4AEAAB375FB23A9787353B15196B8B596203DD9
            48FEB401F16D3918ABAB0EA0E69A46091454967DBD693ADD59C170BF7658D5C7
            E23353572BF0E7531ABFC3ED1AE436E65B7585FD7727C873FF007CD755544051
            45140051451400514514014AFF0048D37558FCBD42C2D6ED3D27895FF98AF17F
            8B7F0D345D1BC3EFAF68D01B478A5559A156251958E3201E8738F6AF75AE1BE3
            00CFC2DD63DBC93FF91928047CA95D2F80BC331F8B3C6167A54F23476EFBA499
            93EF6D519C0FAF4FC6B9AAF4FF008111893E204AC7FE59D8C8C3FEFA41FD6A51
            47B8695E00F0AE8A17EC5A1DA075E924A9E63FFDF4D935D1AA850028000E8053
            A8AA2428A28A002AAEA17D0699A75C5F5D3EC82DE369646F45519356ABC8FE3B
            789BEC1E1FB7D0609313DFB6F9B1D444A7FAB63FEF934058F09D7F589FC41AFD
            EEAB719F32EA52F8FEE8FE15FC0607E15F47FC1CF0DFF60F8221B99536DDEA27
            ED0F9EA13F807E5CFF00C08D7CBD5D0C5E3CF15C31AA47E21D455146157ED0D8
            029147D87457C84BF11BC60BD3C437FF008C99A71F88FE313FF330DF7FDF745C
            563EBBC56278B7418FC4BE17BFD264C6678888D8FF000C83953F9815F2E1F887
            E303FF003316A1FF007F8D30F8FF00C5C7FE663D4FF0B86A2E163027864B6B89
            20990A4B1B94753D548E08AD1F0D6B93F873C4763AB5BE4BDB4A19947F12F465
            FC464567DC5C4D777325CDCCAF2CD2B179247392CC7A926A2A451F6E595E41A8
            58C1796CE1E09E3592371DD48C8AB15E49F02BC51FDA3E1E9F42B89333E9E774
            59EA6263FD1B3F98AF5BAA2028A28A0028A28A00C7F159C783F5B3FF004E13FF
            00E8B6AF8CEBECAF179C782B5D3FF50F9FFF0045B57C6B498D1F63F82CE7C0BE
            1F3FF50EB7FF00D16B5BB5CF7818E7C05E1FFF00B07C23FF001C15D0D311C6FC
            4CF0B7FC255E0DBAB789375E5BFF00A45B63A9651CAFFC08647E55F271183835
            F71D7CAFF16FC2FF00F08DF8D679218F6D95FE6E61C0E0127E75FC1BF422931A
            1BF09BC53FF08D78D2059A4DB657D8B79F278193F2B7E0DFA135F5557C37D2BE
            B1F863E291E29F065ACD2BEEBDB61F67B9CF52CA386FC460FD7342067662B9DF
            1BF8913C29E13BDD5091E72AEC814FF148DC2FF8FD01AE8ABE74F8E9E29FED2F
            10C3A0DBC99B7D3C6E9707869987F45E3F16A608F32B3B5BBD735886D61DD35D
            DE4C1064F2CCC7A9FCEBEC5F0FE8D6FE1ED02CB49B61FBAB6882671F78F76FC4
            E4FE35E21F01FC2FF6BD5AE7C4770998ACC7936F91D6461F31FC14FF00E3D5F4
            15240C2B83F8C9FF0024BF55FF007A1FFD1AB5DE5707F193FE497EABFEF43FFA
            356988F95EBD47E02FFC8FD3FF00D7849FFA1A579757A87C06FF0091FE7FFAF0
            93FF00424A4533E94A28A299215F3B7ED01095F17E9B3E3E57B0083F091CFF00
            ECD5F44D788FED0B605AD744D454708F240C7EA1597FF416A434784D7A8FC06B
            8F27C7D3C64FFAEB19147D77237F4AF2EAEC3E166A234DF891A34AED84925301
            F7DEA547EA4525B8CFAD28A28AA2428A28A0028A28A0028A28A002BCF3E354EB
            0FC34BC42799A68907FDF61BFF0065AF43AF1DFDA0B5111787F4AD341F9A7B96
            98FD1171FF00B3FE9401F3ED74DF0EED3ED9F10B428B19C5E24847FB8777FECB
            5CCD7A7FC0AD2DAF3C74F7C5731D8DB33EEF466F940FC8B7E5528A67D2B45145
            51215E67F1D0E3E1E63D6F23FE4D5E995E63F1DCE3E1F27BDEC63FF1D6A00F04
            F071C78DF413FF00511B7FFD18B5F64D7C67E136DBE32D11BD2FE03FF8FAD7D9
            9490D8514514C421018104641ED5F377C5BF8707C3B7ADADE950FF00C4AAE1BF
            791A8E2DDCF6FF0074F6F4E9E95F49557BDB3B7D46CA6B3BB8566B7994A491B0
            C8607B5007C475DC7C35F1F4DE0BD6764ECEFA4DCB017310E76FFB6BEE3F51F8
            543F117C0971E0AD6CA26E934CB825AD663E9FDC6FF687EBD6B8DA928FB7ADAE
            61BCB68AE6DA559609543C7221C8653D08A9ABE76F841F11FF00B16E53C3DABC
            D8D3A66C5BCCE7881CF63FEC9FD0FD4D7D13DAA893E34F168DBE32D717D2FE71
            FF008FB57D2DF09463E1868BFEE49FFA35EBE6BF18FF00C8EFAF7FD846E3FF00
            46357D2DF09C63E18E8BFF005CDFFF00463521BD8ECE8A28A620A28A2800AF8E
            3C6BCF8EFC41FF00612B8FFD18D5F63D7C6DE3339F1CEBE7FEA2571FFA31A931
            A3107515F6E589CE9F6C7FE992FF002AF8907515F6C69873A5599F5813FF0041
            142065BA28A298828A28A0028A28A0028A28A002B23C52DB7C23ACB7A58CE7FF
            001C35AF589E326DBE08D79BD34EB83FF90DA803E36AE93E1F1C7C41D07FEBF6
            3FFD0AB9BAE8FC0271F10340FF00AFE8BFF4215251F60D145154485145140051
            451400555BCD42CB4E8D64BDBB82DA363B434D20404FA64D5AAF977E2D78C4F8
            A7C54D6B6926ED3AC098A1DA7891FF0089FF003E07B0F7A067D356B7B6B7F0F9
            D67730DC444E37C4E1D73F51562B9EF04689FF0008EF8334BD30AE248E10D28F
            FA68DF337EA4D7434082B95F89071F0EB5DFFAF56AEAAB93F89671F0E35DFF00
            AF63FCC5007C8F5D8FC2A3B7E266887FE9AB0FFC71AB8EAEB7E181DBF127433F
            F4DFFF006535251F5BD145154488402082320D7CC9F16FC027C2DACFF6958458
            D26F5C9500710C9D4A7D3B8FC476AFA72B3B5CD16CBC41A35CE977F17996F709
            B5BD54F623D083CD033E2CAF69F831F10BECB2C7E16D566FDCC8DFE832B1FBAC
            7FE599F63DBDF8EE2BCC3C55E1ABCF09F882E34ABC19319CC726302443F7587F
            9EB9AC6566460CA48607208ED5233EE3A2BCDFE147C405F15E91FD9F7F28FED7
            B441BC9EB3A740FF005F5FCFBD7A45512145145007C7FE3ED14E81E38D56C369
            5884E648BFDC6F997F438FC2B9BAF7EF8EFE147BCD3EDBC496B1E5ED47937381
            C98C9F95BF0248FF00817B5780D2291EE5F00BC46BB2FF00C3933E1B3F6AB7CF
            7E81C7FE827F3AF72AF8AB44D5EEB40D6AD354B27DB716D2075F43EAA7D88C8F
            C6BEBBF0BF892CBC57A0C1AA58BFCB20C49193CC4FDD4FF9E7AD084CDAA28A29
            8828A28A0028A28A002B86F8C071F0B759FF00B63FFA392BB9AE13E319C7C2ED
            587A987FF46A5007CAD5EA9F00867C77787D34E93FF46475E575EA7F011B6F8F
            2E87F7B4F907FE3F1D2299F48D14514C90A28A2801AECB1A166202A8C927B57C
            85E3EF12378ABC637DA88626DF77956E3D235E17F3EBF8D7BD7C63F147F60783
            24B485F6DE6A59823C1E427F1B7E5C7FC0ABE65B6B696F2EE1B6810BCD33AC68
            A3AB313802931A47B1FC15F02D86AFA7DF6B3AC5845750B3882DD265CAF1CB36
            3F21F81AF58FF857FE111FF32E69BFF7E16AEF867448BC3BE1BB0D261C62DA20
            AC47F137563F8B126B5CD306CE74780BC243FE65CD33FF000197FC297FE104F0
            9FFD0B7A5FFE02A7F85743450239D3E02F091FF99734CFFC065FF0A69F87FE11
            3FF32E69BFF80EB5D251401E57F12FE1C68CDE09BCBAD1B4AB6B5BCB3FF48CC1
            1ED2E8BF794FB6327F0AF9BEBEE174596364750C8C08607A115F1F78DBC3EDE1
            8F176A1A5E088A3937424F78DB95FD0E3F0A4C698FF02F891FC2BE2FB1D4F711
            007F2EE00FE28DB86FCBAFD40AFAF924496359118323005483C115F0F57D3BF0
            67C4FF00DBBE0D4B199F75DE98440D93C98FF80FE595FF0080D0819E8F451453
            105145140183E366DBE05F101FFA875C7FE8B6AF8E6BEC2F1EB6DF006BE7FE9C
            251FF8E9AF8F693291F607800E7E1FE81FF5E317FE822BA4AE63E1E1DDF0F741
            3FF4E69FCABA7A6485701F173C2FFF00091F82A79618F75E69F9B98B0392A07C
            EBF8AF3F5515DFD21018104641A00F872BD0BE0FF8AFFE11CF18C76B3C9B6CB5
            2C41264F0AFF00C0DF99C7FC08D64FC47F0C1F0AF8CEF2CE34DB6929F3EDBD3C
            B6EDF81CAFE15CA0254820E08A928FB27C55AFC3E18F0CDF6AF360F911FEED0F
            F1B9E157F138AF9019AEF59D54B1DF3DE5E4D9F792466FEA4D763E36F88B71E2
            DF0D689A636F0F6D1EFBC63FF2D2519553FF007CF3F56F6AD7F81FE171AAF89E
            4D66E1336DA680533D1A66E9F90C9FAE2986C7BAF847C3F1785FC2F63A4C582D
            0C7FBD61FC721E58FE79ADCA28A6485707F193FE497EABFEF43FFA356BBCAE0B
            E327FC92FD53FDE87FF46AD007CB15E9FF0001CFFC57F2FF00D78C9FFA125798
            57A6FC0A6C7C4261EB6720FD569147D2F451453242B86F8B7A29D6BE1E6A0113
            74D698BA8FFE01F7BFF1D2D5DCD3248D258DA3750C8C08653D08A00F87AA5B6B
            892D2EA1B9858ACB0BABA1F460722B77C71E1997C27E2CBCD31C1F2437996EE7
            F8A26FBA7FA7D41AE76A4B3ED3D0F55875CD0AC753808F2EEA159401FC248E47
            E078AD1AF0FF00813E30530CDE16BC930EA5A6B324F51D5D3FF66FC5ABDC2A88
            6828A28A0028A28A0028A28A002BE62F8D9AE7F6AF8F1ED236CC3A7C4B00C74D
            FF0079BF9E3FE035F4078BBC476FE14F0D5E6AB3B2EE8D0AC284FF00AC90FDD5
            FCFF004CD7C7B757335E5DCD7570E649A67692473D5989C93498D1157D2BF03F
            C3CDA4F835B529936CDA949E60CF511AF0BFFB31FC457867827C2D3F8BFC516B
            A64418424EFB8917FE59C63EF1FE83DC8AFAF2DADA1B3B586D6DE311C30A08E3
            45E8AA0600A10364D451453100AF2DF8F6D8F015B8FEF6A118FF00C724AF5215
            E51F1FDB1E07B15F5D453FF45C94023C1BC34DB7C53A437A5EC27FF1F15F6857
            C57A0B6DF10E9ADE97511FFC7857DA83A52436145145310514514018FE25F0ED
            8F8A7439F4AD423CC528CAB8FBD1B7665F715F25F89BC397DE15D767D2EFD312
            46728E07CB227665F635F665719F117C0B078D74231A048F52B705AD663EBDD0
            FF00B27F4EB4AC347C9D5F417C1EF88FFDA7047E1BD5E6FF004D897169339FF5
            CA3F80FF00B43F51F4E7C12F2CEE2C2F26B4BB85A1B885CA491B8C1561D45320
            9E5B69E39E091A396360E8E8705587420D219ADE2FE7C6BAEFFD842E3FF46357
            D2DF09CE7E18E8BFEE49FF00A31ABE56BCBB9AFEF67BCB87DF3CF234B2363196
            63926BEA7F84673F0BF45FF765FF00D1AF4D033B6A28A29921451552F753B0D3
            62F32FAFADED53FBD3CAA83F5A00B75F1A78B9C3F8CF5C71D1AFE73FF911ABE8
            9D7BE30F85348B69BECB7DFDA17414EC8ADD4952DDB2DD31F4CD7CC3713BDCDC
            CB3CA7749231773EA49C9A4C6860EA2BED4D15C49A169EE3A35B467FF1D15F15
            57D1FE05F8B3E1A93C39A7E9FA9DEFD86FADA0485FCE53B1F68DBB830E39C77C
            5086CF55A2B3AC75ED1F53C7D8355B2BACF686757FE46B469921451450014514
            5001451450015CFF008E5B6F80B5F24E3FE25F38FF00C70D5ED475ED23485275
            1D4ECED78E934CAA7F226BCB3E24FC57F0FDD7866FB46D1AE1AF6E6E93CA3222
            111A2E7E6E4F5E3D2803C02BA1F021C78FB40FFAFF0087FF004315CF569F8775
            28B47F12E99A94C8EF15A5D4733AA752AAC09C7E55251F68D15E4BFF000D01E1
            BFFA066ABFF7C47FFC5D1FF0D01E1BFF00A066ABFF007C47FF00C5D50AC7AD51
            5E4BFF000D01E1BFFA066ABFF7C47FFC5D1FF0D01E1BFF00A066ABFF007C47FF
            00C5D0163D6A8AF236FDA07C3E3EE695A91FA88C7FECD597AAFED0719B575D27
            457139FBAF7520DABFF015EBF98A02C755F173C6ABE18F0E3585ACA06A9A8298
            E3DA798E3E8CFEDE83DFE95E1BF0DB43FF008483C7BA65ABA6E86393ED137A6D
            4F9B07EA703F1AC1D6359BFD7B539B51D4AE5EE2E6539676EDEC0761ED5ED3FB
            3F687B2DB53D7A44E64616B09F61F33FFECBF9521EC7B6D14514C90AE47E279C
            7C36D73FEB87FECC2B6752F1268BA383FDA3AB59DA91FC32CCAADF975AF20F8A
            7F14F45D63C393E83A24B25D35C3AF9D71B0AA2AAB06C0CF24E40ED8C5008F0F
            AEABE1A9DBF11B423FF4F43F91AE56B4342D564D0F5EB0D5224DEF6B3ACBB09C
            6EC1E47E35259F6A515C468BF15FC21AD4487FB563B399BAC579FBB2BFF023F2
            FEB5D85B5DDB5E4425B5B88A78CF4789C30FCC55104F4514500707F143C0CBE3
            0F0F992D907F6AD982F6EDD3CC1DE33F5EDEFF008D7CB2E8D1BB23A957538604
            60835F7157CF7F1B7C0DFD9D7FFF0009369F162D6E5F6DDA28FF005729FE2FA3
            7F3FAD2634CF2DD1B58BCD0756B6D4EC25315CDBBEE43D8FA83EA0F4AFAD7C1D
            E2CB2F18E810EA5684249F76E21CF3149DC7D3D0FA57C795BDE13F17EA9E0ED5
            7EDDA6C830C36CB0BF292AFA11FD681B3EC6A2BCBF40F8E3E1AD49123D4D66D3
            2E08F9B7AF991E7D9979FCC0AF40D3B5BD2F578F7E9DA8DADDAE33FB9955F1F9
            5326C59BBB482FAD26B4B98D65826429246DD1948C115F28FC41F03DD782F5D7
            8B6BBE9D392D6B39FE25FEE9FF00687FF5EBEB5ACBD7B40D3BC4BA4CBA6EA700
            9ADE4E7D191BB329EC45033E2FAE97C17E36D4BC15AB7DAECCF996F2604F6CE7
            E5957FA1F435A5E39F867ABF836779C235DE945BE4BA8D7EE8EC1C7F09FD2B88
            A919F61F857C65A3F8C2C05CE99720C8A079B6EFC4911F71FD4715D0D7C4961A
            85E6977897761732DB5C4672B244E548AF59F0E7C7BD46D1520D7EC52F5071F6
            88311C9F52BF74FE1B69DC563E82A2B85D33E2F78335355CEA86D243FF002CEE
            A364C7FC0B95FD6BA183C59E1DB95DD0EBBA6C83FD9BB43FD6988D9A2B2A4F12
            68510FDE6B5A727FBD7483FAD64DEFC4AF06D867CEF1059B63FE783197FF0040
            06803ABAE07E331C7C31D487ABC3FF00A316B0B56F8F9A0DA865D32C2EEF9C74
            67C4487F1E4FE95E5DE2FF008A7AFF008BECE4B0B816F6D60EC18C10A7DEC1C8
            CB1C9FCB14876387AF4CF814DB7E2130FEF59483F55AF33AF46F822FB7E23C03
            FBD6F28FD2819F4F514514C90A4270327A5453DC416B134D71347144BF79E460
            A07E26BC6FE27FC59B2FECD9F44F0E5D09E69C14B8BB88FC91AF7553DC9F51D3
            EBD003CE3E27F8AFFE12BF18DC4D0C9BAC6D7FD1EDB1D0A83CB7FC08E4FD315B
            5F047C39FDAFE323A94C99B6D313CCE7A191B84FFD99BFE022BCCABDDBE0B78A
            BC31A478725D3EF35082CF5096E5A47FB41D8186005C31E3B74CFAD228F6EA2A
            182E60BB884B6F3C7346DD1E370C0FE22A6A6485145140051451400578AFC7DF
            0EF9B6363E21853E785BECD391FDD3CA9FC0E47FC0857B3BC891A17765551C92
            C7005796FC58F1C7874F83EFF4686FA0BDBEB90A8B140E1C210C0EE623818C74
            EB40D1F38576BF0B7C4FFF0008C78DAD6495F6D9DDFF00A35C64F0031E1BF06C
            1FA66B8AA2A4A3EE4A2BC7BC03F1934A9B49B6D3BC4570D6B7B0A88FED2EA4C7
            281D0923EE9F5CF15EAF63A9596A7009EC2F20BA88FF001C32071F98AA20B545
            159BA8EBDA468E9BB52D4ED2D3DA699549FA0268031FE244A21F875AEB120036
            ACBF9F1FD6BE45AF6FF8AFF14346D63C3D2E83A1CEF726775F3E70A5502A9DD8
            19E49C81ED5E2148A47D71F0D24F33E1C686C3FE7D82FE448AEB2BC63E15FC4B
            F0FD8F84ED344D5AF459DD5B16556954EC752C581DDD075C73E95EB363AC699A
            A2EEB0D42D6E97AE60995FF91A6497A8A28A00F30F8D9E17FED9F090D5604CDD
            E984C871D5A23F7C7E1C37E06BE6AAFB826863B886486640F148A55D5BA303D4
            57C7DE34F0EC9E15F165F694E0F971BEE858FF001467953F97EA0D2634CC100B
            3050324F000AFAE7E1E78687857C196560E816E9D7CEB9FF00AE8DD47E030BF8
            5781FC22F0C7FC245E3682599375A69F8B9973D0B03F22FF00DF5CFD14D7D4D4
            20614514138A620AF3EF8D0C17E19DF8FEF4B08FFC7C574DA8F8BBC3BA4E7EDD
            ADD8C2C3AA19D4BFFDF239AF18F8B3F13347F12E8D1E8BA2B493A79E2596E190
            A2E141C2A83C9E4FE940D1E3B5E93F034E3E22A0F5B597FA579B574FE00F13C3
            E12F17DAEAB7113C96CA1A39563FBDB586323E9C1A9433EBDA2B93D2FE25F83F
            570BE46B96D1B9FE0B83E49CFA7CD8FD2BA78A78AE2212432A488DD1918106A8
            925A28A280380F8A7E04FF0084C3421359C6BFDAB660B407A798BDE327F97BFD
            4D7CBB2C52412BC52A32488C5591860A91D41AFB86BCB7E25FC288BC4C64D5B4
            658E0D5B199233F2A5C7D7D1BDFBF7F5A434CF9CECEF2E34FBC86F2D26686E21
            70F1C88705587435F51FC3AF88D65E33D3D609D920D6225FDF419C6FFF006D3D
            BDBB57CBD7D6177A65E4B677D6F25BDC44DB5E391769069B69777163751DD5A4
            D2413C4DB9248DB6B29F6340EC7DBD45784784BE3BB451C769E27B6693000FB6
            5BA8C9FF00793FA8FCABD634AF1B786B5B456B0D6ACE427FE59B4811FF00EF96
            C1A64D8DFA29A1958643020F706A0BBD42CAC22F36F2EE0B78C7F1CD2041F99A
            00B355EF6F6DB4FB496EEEE7482DE25DCF24870147D6B85F10FC63F0A688AE96
            D72753B90388ED394CFBBF4FCB35E15E32F887AD78D260B792082C91B7476909
            C20F76FEF1F73F86295C69177E2678FE4F1AEAE23B6DD1E956AC45BA1E0B9EEE
            DEE7B7A0FC6B8ED3EC2EB54BF86C6CA079EE667091C68396357FC3BE17D5FC53
            A82D9E9568F33FF1C9D1231EACDDABE95F00FC39D3FC136864CADCEA92AE25B9
            65E83FBA9E83F9FE801EC4BF0F3C0D078274210B159750B8C3DD4C0753D957FD
            91FE26BB2A28A648514514005790FED03263C2BA645FDEBDDDF9237F8D7A2EA5
            E2BF0FE8F9FED0D66C6065EA8F32EFFF00BE7AD780FC5EF1EE9DE2EBAB1B3D21
            9E4B4B4DECD33295123363A03CE001DFD690D1E77A749E4EA96927F72646FF00
            C7857DB43A0AF875495604751CD7D49E18F8B5E18D72C60FB56A10E9F7DB4096
            1B93B14377DAC7E523F1CD0819DFD1505B5DDB5EC425B5B88A78CF4789C30FCC
            54F4C414514500145145007937C5FF00875FDBB66FAFE950E752B75FDFC4839B
            88C77FF787EA38F4AF9D2BEE4AF9EBE317C3AFECBB993C49A4C38B299B377120
            E2173FC43FD927F23F5A434CF20AFAAFE0FB6EF85BA3FB79C3FF00233D7CA95F
            527C177DDF0CB4F1FDD9261FF9109FEB421B3D028A28A649CF78DECB55D43C1D
            A85A688F22EA322A885A397CB6FBEB9F9B231C66BC11BE0D78EAEE432DCC5099
            1BAB4B74189FE75F4E51401F34A7C08F1730C9974D5F633B7FF1352AFC03F159
            EB79A48FACD27FF115F48D14AC3B9F379F805E2B1D2F7493F49A4FFE22A26F80
            FE2D1D27D31BE93B7FF135F4AD1405CF98DFE0878CE3E522B37FF76E07F5AEF3
            E16F843C67E1BF11C8DADB4C34C36CCAA9F6B1226FDCB8F9777A679C57B0514C
            2E145145020A28A2800AF3EF8ABA1F8975ED26CADBC36D30712B19C477022CAE
            DE33C8CF35E8345007CBE3E0B78DA562CF696E189C92F72A6A74F819E306EA2C
            13FDEB8FF015F4CD14AC3B9F358F80DE2D3FF2DF4C1F59DBFF0089A78F807E2B
            3FF2F9A48FACD27FF115F48D14582E7CE07E00F8ABFE7FF47FFBFD27FF001BA6
            9F807E2B1D2F3493FF006DA4FF00E22BE91A28B05CF9B0FC05F160FF00978D2C
            FF00DB67FF00E22987E0478B87FCB5D34FD276FF00E26BE96A28B05CF991BE06
            F8C57A258B7D2E3FFAD5137C12F1A2F4B4B56FA5CAD7D4145160B9F2D37C18F1
            BAF4D3226FA5D47FFC557D09E08D00F867C1DA6E96EA1668A2CCD839FDE37CCD
            CF7E491F85743466983615E63F163C37E2BF11369B17875E5F21164FB4AADD08
            9493B76E46467BD7A751408F9893E08F8D2539786D109FEFDC0FE95617E03F8B
            5BACFA62FD676FFE26BE95A2958773E6F1F00BC567ADEE903EB349FF00C4535B
            E0278AC74BBD28FD267FFE22BE92A28B05CF9A1FE0578BD3EEB69CFF00EECE7F
            AAD470FC22F881A74DE6D944B1C83F8E0BD543F9E457D3745160B943478EEA0D
            12C22BD2C6ED2DE3598B36E25C28DD93DCE73CD5FA28A620AA7AAE9B6BAC6977
            3A75EC624B6B88CC6EBEC7FAD5CA2803E66B8F81FE2D1A85C456F1DB3DB2C844
            53BCEA37AE7838EA2A74F809E2C6EB75A527FBD33FF44AFA4A8A561DCF9B1FE0
            2F8B17A5CE96FF00EECCFF00D52AB9F82BE36B670F0476CCEBC868AE829FD715
            F4DD14582E72BF0F74ED6B4AF07DB59EBCD236A08EFB8C9379A76EE3B7E6C9ED
            5D55145310C911644649143A30C1561904579B789BE0AF8775B77B8D3CBE9574
            DCFEE577444FFB9DBFE02457A651401F316B1F04FC5DA692D6B0DBEA310EF6F2
            61B1FEEB63F4CD71D7BE17D7F4D62B79A2DFC18EEF6EC07E78AFB3A8A561DCF8
            74A3292194823B114983EF5F6FBC10CBFEB2247FF7941A8D6C2CD4E56D6007DA
            314582E7C4F1C134CDB628A491BD154935AD65E10F126A240B4D0B50947F785B
            B6DFCF18AFB1D63441854551E8053E8B05CF97F4DF829E32BFC19AD6DEC50F7B
            89C7F25DC6BB0D37F67B4186D535D63EB1DB438FFC798FF4AF70A28B05CF3FD3
            7E0CF8334FDA5EC25BC71FC573331FD1703F4AEBF4ED0B49D2171A76996969C6
            33042A87F302B468A620A28A2803E7DF17FC33F1CF88BC55A95D05F32CDEE5DA
            DBCFBB042C79F970327031DAB2E3F811E2E7196974D4F669DBFA2D7D2D4521DC
            F9BFFE14178AF6E7EDBA47D3CE93FF0088A824F813E2E4E55F4E93FDD9DBFAAD
            7D2F45160B9F38E87F0AFC7BA26B76773027951A4C8D2B4178AB950C33DC678A
            FA3A8A298828A28A0028A28A00F01F1B7C3AF1DF88BC55A8DC44AF2E9EF396B7
            12DE2ED55ED852DC561C7F037C62FF00792C53FDEB8FF015F4D5148773E6C5F8
            0BE2C6EB73A5AFD667FF00E229CDF00FC563A5EE92DF49A4FF00E22BE91A28B0
            5CF9A24F815E2F4FBADA73FF00BB39FEAB4ED37E13F8FB48D4E0B9B5884451D4
            B3DBDE2A9DB9E7B8AFA568A2C17389F89DA478835BF0BC567E1D6956ECDD2B49
            E5CFE5663DAD9C9C8C8C95E2BC657E09F8D6762D2C36AACDC9325C827F4CD7D3
            945304CF9AD7E03F8B5BACFA62FD676FFE26A4FF008505E2AC67EDDA47D3CE93
            FF008DD7D21452B05CF9ADBE0378B54713E98DF49DBFF89AAE7E0A78DADDC343
            15B3329C831DC807F5C57D3945160B9C4FC30D23C43A278626B4F11BCAD77F6A
            668FCCB8F37116D5C007270321B8AEDA8A29882BCDBE28FC37B8F1B7D86EF4D9
            6DA0BF8331BB5C1601E33C8E5413907FF4235E934500715F0D7C10FE08F0FC96
            D72F0CB7F712992792124AE070AA0900E00F6EAC6BB5A28A002BC87E2BF843C6
            1E27D76D8E8BE6369AB6AA9247F6A089E66F6CFCA4F3C15E715EBD45007CC71F
            C0FF00193FDE86CD3FDEB81FD2AC2FC06F169EB3E98BF59DBFF89AFA528A561D
            CF9BC7C02F151EB7BA40FACD27FF001BA6B7C04F160E975A51FA4CFF00FC457D
            2545160B9F33C9F02BC609F74E9EFF00EECE7FAAD3AC7E14FC43D26E926B2530
            B0604B5BDEAA1FFD0857D2D45160B883A52D1453105145140181E25F07689E2D
            B5F2756B2591D461275F9648FE8DFD3A578E7883E01EA76EEF2E837F15DC3D44
            371FBB93E99FBA7FF1DAFA0A8A4099F1E6A5E05F14E924FDB342BE551D5D2232
            2FFDF4B915832432C2E5248DD1C7665C1AFB8698F14720C3C68C3FDA5CD161DC
            F88D27B88C61259147A0622A6B7D3F50BF6FF46B4B9B827FE79C6CFF00CABED1
            5B1B44395B6854FA88C54E14018000A2C173E4FD2BE1578CB5665D9A3CB6D1B7
            592EC8882FE07E6FD2BD27C39F00ECEDDD67F10EA06E88E7ECF6D944FC58F27F
            0C57B4514582E52D334AB0D1AC92CB4DB48AD6DD3A244B81F53EA7DEAED14531
            0514514005792FC57F09F8BFC4BAB5A0D08CAD60B6FB6541742342FB8F552C33
            C639AF5AA2803E604F825E347FBD6B6ABFEF5CAFF4AB09F027C5EFD5F4E4FF00
            7A73FD16BE97A2958773E6E1F00BC56573F6DD247B79D27FF1BA8DFE03F8B57A
            4FA637D276FF00E26BE95A28B05CF99A3F83DE3ED3E5F36CD6249074782F021F
            CF8AFA0BC316F7F69E17D32DF55676BF8EDD16767937B17C7396EF5AF4531051
            45140051451400543716F0DDDB496D711ACB0CAA52447190CA7A835351401F2B
            7C44F87977E14F102C7630CB71A75E39FB21552CC0FF00CF33EE3F51F8D7B77C
            25D2751D1BC056F69A9DAC96B3F9B2388A4E18293C6476FA1AEE4A838C8071C8
            A7503B85145140828A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A00E43E21F8D53C11E1F5BD48927BB9A511C
            10B9C06EEC4FB01FA915CBF807E25788FC6FADFD99347B386CA101AE6E0173B0
            7603FDA3FE3E9595F137C15E32F1A78BA336B628BA55BAAC5048F708073CBB95
            CE7AFB74515E9FE13F0C58F84B40834BB25CEDF9A5948F9A573D58FF009E98A4
            33768A28A620A28A2800A28A2800A28A2800A28CD14005145140051451400514
            5140051451400514514005145140051451400514514005145140051451400514
            51400514991EB4B40051451400514514005145140051451400514991EB4B4005
            145140051451400514514005145140051499A5A0028A28A0028A28A0028A28A0
            028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
            028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
            028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E33E2A6
            A379A57C3BD4AF2C2E65B6B98CC5B2589B6B2E645079FA1AF9D62F1CF8CE76D9
            0EBDAAC8DD70933135F40FC63FF925FAAFFBD0FF00E8D4AF28F80BFF0023F5C7
            FD7849FF00A1A521A39AFF0084BBC79FF417D6BFEFB7A3FE133F1D45C9D63581
            FEF3BD7D6F81E828C0F41405CF96B4BF8C5E32D325532EA0B7B103CC773129CF
            E230DFAD7BA780BE2169FE38B17F2D0DB6A108CCF6ACD9C0FEF29EEBFCBF2CB7
            C7DE01D33C5BA35C916D1C7AA4685A0B945018B01C2B1EEA7A57CE9E01D6A6D0
            3C71A5DE46C4219D629403F7A363B587EB9FC0501B9F5FD14514C4141E94521E
            86803E523E39F157FC24E60FEDFD43CAFB66CD9E7B636EFC62BEAE1D2BE323FF
            002371FF00AFEFFDA95F660E82921B168A28A620A28A2800A28A2800A63BAC51
            B3BB054504B13D00A7D703F177C43FD83E02BA48DF6DCDF9FB2C78EB86FBE7FE
            F9CFE62803C47C41F127C4BA8F88350BAD3F58BFB7B26958C31452B2AA479C2F
            1DBB7E26BD7BE0C78C2E7C47E1FB9B2D4AE9EE350B29726491B2CF1B72093DF0
            770FCABCEBE10F8413C496DE2392741E5B599B48D9BB48FF0036E1FEEED1F9D6
            27C35D724F097C42B717598A295CD9DD29FE1C9C73F4600FE069147D5D451453
            2428A28A0029ACC141248007249A7570FF0016B569B48F877A8C96EC525B8DB6
            E18760C7E6FF00C773401C078E7E375CA5E4DA7785B6247192AD7CEBB8B9FF00
            601E31EE739AF3E8E6F1EF89F33C2FAF5FA37F1C7E6327E9C0AD9F839E14B2F1
            378AE593528D66B5B18BCDF25BA48E4E1437A8EA7F015F4E222471AA22854518
            5551800521EC7C94FA678FB445FB49B6D7ED157932A09542FE22BA2F0B7C6BF1
            068F711C3AC37F6A59670DBC01328F556EFF00F02FCC57D2D5E29F1B7C0F649A
            5FFC24FA7DBA433C7205BB08B8122B1C073FED6E207BE7DA8047AE68FABD96BD
            A541A9E9D309ADA75DCAC3F507D08ABF5E0DFB3FEB928BED4F427726168FED71
            03FC2C0856C7D772FF00DF35EF34C414514500796FC6AD535AD2F4AD2DF45BAB
            CB791E77121B666048DBDF15E33FF09778F3FE82FAD7FDF6F5F5C114981E9486
            7C8EFE32F1CC685DF59D6154752657005451F8EBC6533848B5FD51DCF659D89A
            FA4BE2501FF0AE35CE3FE5D8FF00315E0FF05FFE4A6587FD729BFF00406A0665
            FF00C25DE3CFFA0BEB5FF7DBD49078B7C74678C36AFACED2C33F3BD7D6781E82
            8C0F4140AE03A0A5A28A620A43D0D2D21E86803E52B7F1CF8A9BC4F14075FD40
            C46F0214F3DB1B77E315F570E95F195B7FC8DD0FFD7F2FFE8CAFB30741490D8B
            451453105145711F147C60DE10F09BC96CF8D42ECF936DFEC9C72FF80FD48A00
            CCF1EFC5BD3FC2733E9DA7A2DF6A8BC32EEFDDC27FDA23A9FF00647E62BC6AEB
            C6FE3BF17DDB456F7BA84A4FFCBBE9EACA00FA27247D734CF87DE0CB8F1DF88D
            A39E5916CE1FDEDE4FD5B93F741FEF373FA9AFA8748D134DD06C12C74BB48ADA
            DD070A8BD4FA93D49F73487B1F2F9F09FC4245F3FF00B375ACFA8DE5BF2CE6A4
            D2BE23F8D7C2B7BE4CF7B75279670F6BA8067FC3E6F997F022BEADAE67C65E0A
            D33C65A4496D7712A5D2A9FB3DD05F9E26EDCF75F51405CA9E05F883A6F8DEC5
            8C23ECFA842333DAB364A8FEF29FE25AEC6BE39D3AFB53F02F8C16600C779A7D
            C14963CF0E01C329F622BEBCD3EFA1D4F4DB6BEB76DD0DC44B2C67FD96191403
            2D514514C414515E63F18FC6B2F86F418F4CB094A6A1A80237A9F9A28BBB0F73
            D07E3E940153C7BF19AD741B8974CD0A38EF6FD0959267398A26F4E3EF1FD07E
            95E45378A3C73E2FBB648EFB54BC73FF002C2D37051FF014E2B47E197C3B7F1A
            EA12DCDE3BC5A55AB012B2FDE95BAEC53FCCFD3D6BE97D3348D3F45B24B3D36C
            E1B5B74E891AE3F13EA7DCD21EC7CB47C25F102DD7CF1A66B4BDF29BCB7E439A
            B1A4FC4DF19F862EFC99EF6E2E163387B6D40173F4CB7CCBF9D7D575CEF8ABC1
            9A378BEC1ADF52B653285C45728312447D8FA7B1E280B999E05F891A578DA031
            20FB2EA51AEE92D5DB391FDE43FC43F9576B5F1F6AFA66AFF0FBC60601298AF2
            CE412413A701D7F8587B1EE3EA2BEA2F0778961F16785ECF568C0579176CD183
            F7241C30FEA3D88A01A37E8A28A620A28AE5FE226AD3689E00D62FADD8ACCB0F
            968C3AA9760991EE3766803CF3E207C6992C2FA7D2BC322369222525BD71B806
            EE107438F53C7B77AF324BFF001E78A9DA6866D72FC13C987CC641FF007CFCA2
            ADFC2AF0C5A78ABC6B1DB5FAEFB5B789AE648FFE7A6D2A02FD32C2BEA88218AD
            E1486089228906D444501547A00290F63E4D6D1BC7FA50FB47D8F5FB70BC9911
            6518FC456D786BE32F89B43B848F5294EA9680E1A3B8FF005807B3F5CFFBD9AF
            A76BC8FE33F81ECAF7409BC47656E916A16B869CA2E3CE8F383BBDC6739F4CFB
            5008F47F0F78834FF1368D06A9A6CBBE097A83C32377561D88AD5AF9DBE02EB9
            35AF89EEB466726DEF21322AE7A48BDFFEF9DDF90AFA26989851451400514514
            0051451400514514005145140051451400514514005667882692DFC37AA4F0BB
            24B1DA4AE8EA7055821C115A7595E27FF915358FFAF29BFF00403401F3BF807C
            67E25BFF001DE8F6977AE5FCF6F2DC0578E49D8AB0F422BE9DAF917E1B7FC947
            D0BFEBE87F235F5D524361451453105145140087A1AF92E5F1778E84CE06AFAC
            E371FE37AFAD69303D2819F247FC25DE3CFF00A0BEB5FF007DBD43278EFC630B
            9493C41AA238EAAD3B035F5EE07A57CB1F197FE4A7EA7FEE43FF00A29690CCE4
            F18F8E6440E9ACEB2CA7A112390697FE12EF1E7FD05F5AFF00BEDEBE8FF87407
            FC2BBD0BFEBD12BA8C0F6A0573CBFE0AEA9AD6A9A46A6FAD5D5DDC4893A88CDC
            B31206DED9AF51A4029698828A28A00F9FFE31F8AB5ED1FC6EB6BA6EAF796B01
            B58DBCB8652A3396E715C2C7E32F1C4A81E3D6B58743D1965720D747F1D7FE4A
            12FF00D79C7FCDABD7FE1081FF000ABB45FA4BFF00A35E915D0F9FFF00E130F1
            DAF2758D647D5DEA483E2778DACA4CAEBB7448ED32ABFF00E840D7D6781E9556
            FB4BB0D4E130DFD95BDCC64636CD1871FAD02BA3C5BC25F1DE47B88ED3C4F6D1
            88D8E3ED96EB8DBEECBFD47E55EDF04F15D5BC73C122C90C8A191D0E4303D083
            5F3BFC58F8630F86D3FB7345461A6BBED9E0CE7C863D083FDD3D3D8FD6B63E05
            78C6533CBE16BC94B21532D9963F748E5907FE85F83500CF75A28A298828A28A
            002B3B5ED5A1D0B41BED5273FBBB585A4C7F7881C0FC4E07E35A35E3BF1EFC43
            F65D12CB4185F125E3F9D301FF003CD7A03F56FF00D06803C924F881E3095E49
            BFE120D45416C9D93305527B7B57D1DF0D7C4A7C51E0AB3BC9A4DF7710FB3DC9
            3D4BAF73EE460FE35E3FE18F051D4FE0B6BBA818B37324C2E2DCE392B0839C7F
            DF520A77C0AF11FF0067789E7D1667C41A8266304F495791F9AEEFC85219F46D
            14514C414514500707F18FFE497EABFEF43FFA352BCA3E02FF00C8FD71FF005E
            127FE8695EAFF18FFE497EABFEF43FFA352BE78F06F8BAEFC17ACBEA7676F0CF
            23C2D0ED9B38C120E783FECD21AD8FB0E8AF9E3FE1A075EFFA04E9DFF8FF00FF
            00154D93F680F1115223D2F4C56F56590FFECD45C2C7BDEAFA9DBE8DA45DEA57
            6E120B789A4724FA76FA9E95F20787ED64D57C59A6DB46B97B8BC8D703B65866
            B4BC47E3BF1378D192DAFAE59E1DDF25A5BA6D42DDB81CB1FAE6BD53E0FF00C3
            6BAD26E0788F5BB7686E7695B4B7718640472EC3B1C7007B9A0363D9C74A28A2
            988290F434B487A1A00F8CCFFC8DC7FEBFBFF6A57D983A0AF8CCFF00C8DC7FEB
            FBFF006A57D983A0A486C5A28A298828A28A0028A28A002BE6BF8E3E21FED4F1
            8A69713E6DF4D8F61C74F31B05BF4DA3F035F426B9AAC3A1E877BA9DC1FDD5AC
            2D291FDEC0E07E278FC6BE54F0A6993F8DBE215B4373990DDDCB5C5D37AAE773
            FE7D3F1A4C68FA1BE15F87FF00E11EF015844E9B6E2E87DAA6FABF41F82ED15E
            23F18F403A278F6E2E235DB6FA80FB5211FDE3F7C7FDF409FF008157D42A02A8
            00600E0015E67F1BFC3FFDABE0C1A944999F4D93CCE3AF96DC37FECA7FE03402
            3A3F873E23FF00849FC13617AEFBAE635F22E39E7CC5E093F5186FF8157575F3
            BFC07F11FD87C4373A14CF886FD3CC881ED2A0FEAB9FFBE457D114098514514C
            02B93F891E1F9BC4BE06D42C2D9775D051342A3F8994E76FE2323F1AEB28A00F
            913C0DE30BAF03788CDEAC06589D4C373013B4B2E7B7A10457D0BA27C57F07EB
            4A806A896733758AF079447FC08FCBFAD51F1A7C23D1BC5733DF5BB9D3B517C9
            79635CA4A7D597D7DC7EB5E43AC7C18F17E9659A1B48B50897F8AD64C9C7FBAD
            83F96690F73E9D8678AE62596095258DB957460C0FE351DE595AEA368F697B6F
            15C5BC9F7E295432B739E41AF8ED64F10F85AEB01B52D2A7CF4F9E127F9576DE
            1EF8DDE25D29D23D4FCAD52D87DE120D9263D987F5068B858FA1AC341D234B93
            CCD3F4AB2B47C6DDD05BAA1C7A640AD1AC1F0B78B34BF17E922FB4C94900ED96
            27C0789BD187F5ADEA620A28A2800A28A280394F897FF24E35CFFAF63FCC5783
            7C16FF00929B61FF005CA6FF00D01ABDE7E25FFC938D73FEBD8FF315E0DF05BF
            E4A6D87FD729BFF406A4347D494514531051451400521E869690F43401F19DB7
            FC8DD0FF00D7F2FF00E8CAFB307415F19DB7FC8DD0FF00D7F2FF00E8CAFB3074
            1490D8B4514531057CDFF1E7547BAF1A5BD806FDD59DAAF1FED39DC7F4DBF957
            D215F2B7C622C7E28EAD9E98871FF7E92931A3D7BE07E922C3C0297854092FE7
            7949EFB54EC03FF1D27F1AF4BAE4BE192AA7C37D0C2F4FB3E7F1DC735D6D3105
            1451401853783BC3973AB4DAA5C68D693DECC4179668C3E48000383C03802B6A
            38D218D638D151146155460014FA2800A28A2800AF953E2E6A8FAA7C47D4816C
            C76BB6DA31E81473FF008F16AFAAEBE38F1A3B49E3AD799B83FDA33F1FF6D1A9
            31A3E99F869A3A68BF0FB4985502C93422E65F52CFF373F8103F0AEBAA868CAA
            9A169E8A4155B68C0FFBE455FA620A28A2803C6BE3FE8A9368DA6EB489FBD826
            FB3B903AA302467E857FF1EACFFD9F3566F3758D219B28556E635F43F75BFF00
            65FCABB2F8D614FC35BBDDD44D16DFAEE1FF00D7AF30F8085878F6E40E874F93
            3FF7DA521AD8FA4A8A28A620AC0F1A688FE23F076A7A4C78F36787F759E9BD48
            65FD40ADFA2803E3EF0A788EFBC0BE2A4BE5B726484B43716F27CA597F894FA1
            C8FCC57D0BA1FC5DF086B2881F51FB04E7AC5783663FE05F77F5A5F1AFC2DD17
            C62ED77CD8EA47ADCC2B9DFF00EFAFF17D783EF5E39ACFC14F16E985DAD61835
            184746B7930D8FF75B1FA6690F73E98B7BAB7BC844D6D3C5344DD1E370C0FE22
            8B9B682F2DA5B6B9852686552AF1C8BB9587A115F1C345E21F0B5D659352D2A7
            F5F9E127F95761A07C6AF14E90E897B2C7A9DB03CA5C0C3E3D9C7F5CD170B1F4
            558F87745D326596C348B0B591780F05BA211F8815A75CD783FC6BA4F8D34D37
            3A7B949A3C09EDA4FBF11FEA3D0D74B4C4145145001451450014514500145145
            001451450014514500145145001595E27FF915358FFAF29BFF004035AB595E27
            FF00915358FF00AF29BFF403401F2D7C36FF00928FA17FD7D0FE46BEBAAF917E
            1B7FC947D0BFEBE87F235F5D52436145145310514514005145140057CB1F197F
            E4A86A9FEE43FF00A296BEA7AF963E32FF00C950D53FDC87FF00452D26347BFF
            00C39FF9277A17FD7A257515CBFC39FF009277A17FD7A257514C414514500145
            145007CD1F1D7FE4A12FFD79C7FCDABD83E10FFC92ED1BE92FFE8D7AF1EF8EBF
            F25097FEBCA3FE6D5EC3F087FE49768DF497FF0046BD21BD8EDE8A28A623375D
            D2E2D6B41BED32600A5CC0F1F23A12383F81E6BE4AF08EA1268BE34D26F012A6
            1BB40FFEEEEC30FC89AFB18F4AF8B2F79F10DC795FF3F4DB3FEFAE2931A3ED4A
            290741F4A5A620A28A2800AF92FC7FACCBE30F8857725B66546985ADAA8FE255
            3B571FEF1C9FF8157D0DF12BC43FF08DF81B50BB47DB712AFD9EDF9E77BF191F
            4196FC2BC3FE0BF87FFB67C751DE4A9BADF4D4FB4367A6FE883F3F9BFE034868
            FA23C3FA243A1F86AC74740AD1DBC0236E38738F98FE2727F1AF95FC436173E0
            7F1FDC436C4A3D8DD09AD98FF773B93F4C57D7D5E19F1FFC3FCE9DE21853FE9D
            6723F1643FFA10FCA8047B1E89AAC1AE68965A9DB1FDD5D44B201E991C8FC0F1
            5A15E39F013C49F6AD1EF3C3F33E64B46F3A007FE79B1F980FA373FF0002AF63
            A62614514500707F18FF00E497EABFEF43FF00A352BC5FE0FE83A6788BC61359
            EAD68B756EB66F2046247CC1906783EE6BDA3E31FF00C92FD57FDE87FF0046A5
            7947C05FF91FAE3FEBC24FFD0D290D6C7B0FFC2AAF04FF00D0061FFBF927FF00
            154E4F85BE0A8CE46816C7EACC7F99AEC28A6232B4CF0DE89A31074DD26CED5B
            A6F8A1556FFBEBAD6AD14500145145001487A1A5A43D0D007C667FE46E3FF5FD
            FF00B52BECC1D057C667FE46E3FF005FDFFB52BECC1D0524362D14514C414514
            5001451450078FFC7AF10FD9341B4D0A17C497AFE6CC01FF009669D01FAB63FE
            F9AF16F0FCDE23D3266D43414BD8DD94C666B788B71C12338F615A7F1235F6F1
            3F8F2FEE6262F046FF0066B7039CAAF1C7D4E4FE35F4BF82F415F0D78434DD2F
            6812450832FBC8DCB7EA4D21EC7CEBFF000967C4BFF9FBD6BFEFCB7FF13515CF
            88FE22DE5ACB6D7336B12C13214923681B0CA46083F2D7D5DC51C50173E2AB1B
            ABCD035BB6BC44786EED255942BA9520839C115F63E91A941AC69169A95B1CC3
            7512CABED91D3F0AF08F8F7E1DFB26BB67AF42988EF53CA988FF009E89D09FAA
            E3FEF9AE9BE03788FEDBA0DD68333E65B17F36107FE79B9E47E0D9FF00BE8500
            CF5FA28A29882B035FF19787FC2F2C71EB3A8A5AC922EF4528CC587AFCA0D6FD
            78D7C7ED0A5B9D274ED6E142C2D1DA19F03A2B6369FA6463FE0428047A9687AF
            69DE24D31751D2AE3CFB576650FB0AF20E0F04035A75F3EFC12F1CD9E90F71E1
            ED52E12086E24F36DA590E14498C3293DB3818FA1F5AFA041046472280688AE6
            D6DEF21686E608A689BEF2488194FE06BCABE207C20D22F34ABAD4B41B75B2BF
            850CBE4443F7730032576FF09F4C71FCEBD6EB9CF1A7896CBC2DE19BBBEBA950
            486364822279924238503F9FA0A011F3C7C23D767D17C7F6312B916F7CDF6699
            3B36EFBBF9363F5AFAAABE4DF85BA54DABFC45D29635252DA5FB4C8DFDD54E7F
            9E07E35F595243614514531051451401CA7C4BFF009271AE7FD7B1FE62BC1BE0
            B7FC94DB0FFAE537FE80D5EF3F12FF00E49C6B9FF5EC7F98AF06F82DFF002536
            C3FEB94DFF00A03521A3EA4A28A298828A28A00290F434B487A1A00F8CEDBFE4
            6E87FEBF97FF004657D983A0AF8CEDBFE46E87FEBF97FF004657D983A0A486C5
            A28A29882BE6CF8EFA6B5AF8EA2BCC7C9796AAD9FF006972A47E417F3AFA4EBC
            E3E327855FC43E11FB5DAC65EF34D6332A8192D19FBE07E40FFC0681A25F82FA
            9A5FFC38B4843664B396481FFEFADC3F4615E855F2F7C26F1D47E11D764B6D41
            CAE977B8595BAF94E3EEBFD39C1FFEB57D390CD15CC093432249148A191D1B21
            81EE08A01A25A28AC8F10F88B4EF0C69136A5A94C238A3076AE7E691BB2A8EE4
            D0230FC41F137C3BE18F107F63EA925C472F94B234A916F45CE7838E73DFA77A
            E9749D5AC75BD362D434DB85B8B4973B24504038383D7DF35F235FDDEA3E38F1
            8C93AC664BED46E3091AF3B73C2AFD00C7E02BEB3F0F68F1787FC3F63A4C2729
            6B0AC7BBFBCDFC4DF89C9FC690CD4A28A29882BE4BF8A3A63E97F11B5842B859
            A6FB421F50E377F327F2AFAD2BC87E39783E4D534A87C43671179EC54A5C2A8E
            4C3D777FC04E7F063E948699DDF80F544D63C0DA3DE23024DAA46F8ECEA36B7E
            A0D7466BE6EF843F1121F0CDD3E8DAB4BB34CB97DF1CC7A43274E7FD93FA63EB
            5F46A4892C6B246EAE8C32ACA7208A60C928A2B3F57D62C342D365D4352B94B7
            B688659D8FE80773ED408F34F8F9AAA5BF852CB4C0C3CDBAB9DE57BEC4073FAB
            2D73BFB3E69ACFABEAFAA15F922816DD4FA966DC7FF401F9D705E37F155D78EB
            C56D76913F9591059C006582678E3FBC49CFE35F46FC3AF0AFFC223E0FB6B194
            0FB64BFBFB923FE7A376FC0607E148675B451453100AC4D7FC59A1F85D616D66
            FD2D7CFDDE56E466DDB719C6D07D47E75B75E55F1DB429751F095B6A70A177D3
            A525C0ED1BE031FCC2D0077DE1FF0012693E28B17BDD1EEBED16E929899F6327
            CC0038C3007B8AD7AF9BBE0BF8DED7C3BA9DC693A9CEB0595E90D1CAFC2C728E
            393D811DFD857D1CACB2207460CA46411D0D0161B34115CC4D14F12491B70C8E
            A181FC2BCDBC6DF07F44D6AC67B9D1ADA3D3F53552D1AC236C5291FC257A0CFA
            8FD6BD3AB23C47E21B1F0CE8971A9DFCAA91C4A76A93CC8DD957DCD008F97BE1
            D6B771E1DF1E69B2AB32A4B3ADB5C27AA31DA73F4E0FE15F5C57C83E0CB09FC4
            5F1074D8917264BC59E5C0FBAAADB98FE40D7D7C3A5243614514531051451400
            5145140051451400514514005145140051451400565789FF00E454D63FEBCA6F
            FD00D6AD65789FFE454D63FEBCA6FF00D00D007CB5F0DBFE4A3E85FF005F43F9
            1AFAEABE45F86DFF00251F42FF00AFA1FC8D7D75490D8514514C414514500145
            1450015F2C7C65FF0092A1AA7FB90FFE8A5AFA9EBE58F8CBFF00254354FF0072
            1FFD14B498D1EFFF000E7FE49DE85FF5E895D4572FF0E7FE49DE85FF005E895D
            453105145140051451401F33FC75FF009284BFF5E51FF36AF61F843FF24BB46F
            A4BFFA35EBC7FE3AFF00C9425FFAF38FF9B57B07C21FF925DA37D25FFD1AF486
            F63B7A28A4240192702988A7ABDFC7A568D7BA84A46CB681E539FF0064135F21
            7862C9F59F18E9769C96B8BC8C39F6DD963F966BD5FE32FC45B4B9B26F0CE8F7
            093EF606F668DB2A0039080F7E7AFD31EB543E0478564B9D5E6F125C478B7B50
            61B7247DE9187CC47D14E3FE05ED4867D05DA8A28A620A28AAF7D790E9F61717
            B70DB20B78DA591BD15464D00781FC7BF10FDAF5DB3D0617CC7649E6CC01FF00
            968FD01FA2E3FEFAAE1341BDF17E8903BE86BA95BC571B599A085B1263A1CE39
            EA6A026F3C6FE38EFF0069D52F3EBB0337F251FA0AFAFACACE1B0B1B7B3B74DB
            0C11AC51AFA2A8C0A455EC7CBDFF000967C4BFF9FBD6BFEFCB7FF1354F54D5FC
            79AD583D96A4756B9B6720B47240C41C1C8FE1AFAD78A38A0573E41F027881BC
            2BE34B0D41C948564F2AE01FF9E6DC367E9D7F0AFAF15832865390790457CAFF
            0016FC3DFD81E3DBB68D36DB5F7FA5458E9F37DE1FF7D6EFCC57B87C26F11FFC
            243E05B412BEEBAB1FF459B3D4ED1F29FC571F8834033BAA28A4C8F5A62384F8
            C7CFC2FD57FDE87FF46A5794FC050478FAE383FF001E127FE8695F483FDDA627
            5A5D468968A28A620A28A2800A28A2800A43D0D2D1401F14EA2CF16B97522643
            ADCBB291D8EE35BFFF000B2FC69FF41FBCFD3FC2BEB0A290EE7C9FFF000B2FC6
            BFF41FBCFD3FC28FF8597E35FF00A0FDE7E9FE15F585140CE2BE126B1A8EB9E0
            85BCD52EA4B9B9FB4C89E649D7031815DE5313EED3E99215CA7C46F107FC237E
            07D46F51F6DC3A7916F83CF98FC023E832DFF01AEAE98F401F2A7C2AF0F9D7FC
            7D6292216B7B43F6A9B238C2FDDFCDB6D7D5D51A549490D8514514C4725F127C
            3DFF00092F81B50B444DD73127DA2DFD77A7381F5195FC6BE71F879E216F0BF8
            D6C2FDD8ADB33F9371E9E5B704FE1C37FC06BEBB350526344C0E46452D145310
            555BFB1B6D4AC27B2BC8566B79D0A488DD08356A8A00F997C6BF07B5AD02E64B
            9D2219752D349CAF94332C63D19475FA8FD2B9ED27C7BE2EF0D2FD9ACF56B98A
            38FE5F22702454F60AE0EDFC2BEBBAF27F8B5F707FD73A452773CCA6F8CDE379
            62D83528A3E31B92DA3CFEA2B22CF49F177C41D4C4AB1DEEA329F94DC4C4F971
            8FF78F0BF4A9BC3BFF0021C8FF00DFAFAA748FF9055AFF00D725FE5403D0E5FE
            1E7C3FB5F03E98E19D6E352B8C7DA27038F655FF00647EBFA0ED68A0D32428A2
            8A0028A28A00E53E257FC939D73FEBD8FF00315E0FF05C11F132C383FEAA6FFD
            01ABEA16FBB4C4FBD4868968A28A620A28A2800A43D0D2D1401F195B03FF0009
            743C1FF8FE5FFD0EBECC151FF154B490D8514514C41498CD2D1401E15F10FE0C
            4EF7536ADE16895D5C9796C01DA54F731FB7FB3F97A579CE97E2AF17F81E7369
            6F737765B4E5AD6E23F97FEF861C7E15F5DD713F123FE400DF8D21A678CC9F1C
            3C64F0EC596CA36FEFADBF3FA922B9DDBE2DF885AA8622F755B8E99C7C91E7FF
            001D41F954B69FF21AAFA83C2DFF0022ED9FFB940CE43E1B7C2F83C1C9FDA37E
            C971AC3AE372F29029EA17D4FA9FC3EBE91494B4C90A28A2800A63A2C8851D43
            2B0C10470453E8A00F08F1EFC139BCF9752F0AA2BC6C4B3D813B4AFF00D7327B
            7FB27F0F4AF3FD37C59E32F034BF628AE6F2C829C9B4BA8B2A3FE02C38FC2BEB
            7AE2BE257FC8B6DF53498D33C624F8E1E3278B62CB648DFDF5B719FD78AC12BE
            33F889A8292B7DAA480E012311C7FC957F4A9748FF0090EFFC0C57D47A17FC81
            6D7FDCA06F4380F873F096DFC2F2C7AAEAEF1DD6A8066345E63B7FA7F79BDFB7
            6F5AF51A4A5A6485145140054371045756F25BCF1AC90CAA51D1864329EA0D4D
            45007CDFE39F835AA691752DEF87E192FF004E6258429F34D0FB63F887B8E7F9
            D723A4F8D3C59E153F65B3D4EEED963E3ECF28DCABFF00007040AFAF857997C5
            6FF8F28FFDC34868F2893E3478DDE3D8351850FF007D6DA3CFF2AC68EDFC5FF1
            0752538BED526CEDDEF9D91FE3F7547E54ED23FE4369FEF0AFA9BC39FF00201B
            3FFAE6281EC72BF0DBE1C43E09B37B9BA749F57B85C4B22FDD8D7FB8BDFD327B
            E2BBFA4A5A648514514005145140051451400514514005145140051451400514
            51400565789FFE454D63FEBCA6FF00D00D6AD06803E24B1BDBBD32FA2BDB395E
            1B985B74722F5535D27FC2CBF1AFFD07EF3F4FF0AFAC28A562AE7C9FFF000B2F
            C6BFF41FBCFD3FC28FF8597E35FF00A0FDE7E9FE15F585140187E03BEBAD4BC0
            DA45EDECCD35CCD0069246EAC726BA3A45FBB4B4C90A28A2800AF963E32027E2
            7EA7C7F043FF00A296BEA7A89FEF52634739F0EBFE49DE85FF005E895D4522D2
            D3105145140051451401F347C7504FC42181FF002E71FF0036AE534DF1CF8A34
            7D3E2B0D3F57B9B7B58B3B224C6172493DBD49AFAF5FAD3690EE7C9C7E2578D5
            B8FEDFBCFC31FE1514BAA78D7C4A0DBBDCEB5A82370624323A9FF808E2BEB6A7
            A5160B9F397847E09EB7AADCC73EBCA74DB1072C8483338F403F87F1FCABE85D
            374DB4D234E82C2C20586DA04091C6BD87F9EF5728A109B0A28A29805797FC70
            F101D2FC1CBA642C44FA949B081D7CB5C16FD768FC4D7A854725008F9EBE03F8
            7FED9E26BAD6A64FDD5845B23247FCB47E3F45DDF98AFA269894FA4818514514
            C0F2DF8E5E1DFED4F0847AAC4999F4D9371C7531B6037EBB4FE06BCEFE08F888
            E91E323A6CCC56DB534F2F9E8245E50FFE84BFF0215F4A37DDA62D2EA3E851F1
            1315F0CEAACA4822CE5208FF0070D7C75FDA3A867FE3F2E7FEFEB57DB06A0A18
            23FFD9}
          Stretch = True
        end
        object RLLabel67: TRLLabel
          Left = 168
          Top = 4
          Width = 141
          Height = 14
          Caption = 'Identifica'#231#227'o do Emitente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw49: TRLDraw
          Left = 436
          Top = 0
          Width = 306
          Height = 75
        end
        object RLLabel68: TRLLabel
          Left = 461
          Top = 2
          Width = 86
          Height = 12
          Caption = 'CONTROLE FISCO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rlbcChaveAcesso1: TRLBarcode
          Left = 448
          Top = 15
          Width = 286
          Height = 55
          BarcodeType = bcCode128C
          Caption = '43090688065321000115550000000125100000125102'
          Margins.LeftMargin = 1.000000000000000000
          Margins.RightMargin = 1.000000000000000000
        end
        object RLLabel69: TRLLabel
          Left = 365
          Top = 3
          Width = 47
          Height = 16
          Caption = 'DANFE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel70: TRLLabel
          Left = 338
          Top = 20
          Width = 97
          Height = 12
          Caption = 'Documento Auxiliar da'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel71: TRLLabel
          Left = 338
          Top = 32
          Width = 95
          Height = 12
          Caption = 'Nota Fiscal Eletr'#244'nica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel72: TRLLabel
          Left = 338
          Top = 64
          Width = 51
          Height = 14
          Caption = '1 - SA'#205'DA'
        end
        object RLLabel73: TRLLabel
          Left = 338
          Top = 50
          Width = 68
          Height = 14
          Caption = '0 - ENTRADA'
        end
        object rllbSaidaEntrada1: TRLLabel
          Left = 410
          Top = 50
          Width = 21
          Height = 27
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = True
          Borders.DrawRight = True
          Borders.DrawBottom = True
          Caption = '1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbEnd1: TRLLabel
          Left = 106
          Top = 48
          Width = 230
          Height = 12
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbCidade1: TRLLabel
          Left = 106
          Top = 72
          Width = 230
          Height = 12
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbFone1: TRLLabel
          Left = 106
          Top = 84
          Width = 230
          Height = 12
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbCep1: TRLLabel
          Left = 106
          Top = 60
          Width = 230
          Height = 12
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbHome1: TRLLabel
          Left = 105
          Top = 103
          Width = 206
          Height = 12
          AutoSize = False
          Caption = 'Documento Auxiliar da'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel74: TRLLabel
          Left = 339
          Top = 92
          Width = 22
          Height = 16
          Caption = 'N'#186':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText49: TRLDBText
          Left = 364
          Top = 92
          Width = 62
          Height = 16
          DataField = 'NumNota'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbPagina: TRLLabel
          Left = 323
          Top = 134
          Width = 34
          Height = 12
          Caption = 'P'#225'gina:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 360
          Top = 133
          Width = 28
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Info = itPageNumber
          ParentFont = False
        end
        object RLLabel75: TRLLabel
          Left = 392
          Top = 134
          Width = 6
          Height = 12
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLSystemInfo2: TRLSystemInfo
          Left = 403
          Top = 133
          Width = 28
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Info = itLastPageNumber
          ParentFont = False
        end
        object RLDraw51: TRLDraw
          Left = 0
          Top = 147
          Width = 437
          Height = 29
        end
        object rllbNatOperacao1: TRLLabel
          Left = 3
          Top = 160
          Width = 431
          Height = 11
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel76: TRLLabel
          Left = 3
          Top = 149
          Width = 410
          Height = 12
          AutoSize = False
          Caption = 'NATUREZA DE OPERA'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw52: TRLDraw
          Left = 0
          Top = 175
          Width = 153
          Height = 23
        end
        object RLLabel77: TRLLabel
          Left = 3
          Top = 176
          Width = 89
          Height = 10
          Caption = 'INSCRI'#199#195'O ESTADUAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw53: TRLDraw
          Left = 152
          Top = 175
          Width = 251
          Height = 23
        end
        object RLLabel78: TRLLabel
          Left = 155
          Top = 176
          Width = 142
          Height = 10
          Caption = 'INSC.ESTADUAL SUBST.TRIBUT'#193'RIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw54: TRLDraw
          Left = 402
          Top = 175
          Width = 340
          Height = 23
        end
        object RLLabel79: TRLLabel
          Left = 405
          Top = 176
          Width = 23
          Height = 10
          Caption = 'CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw55: TRLDraw
          Left = 436
          Top = 74
          Width = 306
          Height = 31
        end
        object RLLabel23: TRLLabel
          Left = 542
          Top = 76
          Width = 76
          Height = 10
          Caption = 'CHAVE DE ACESSO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel97: TRLLabel
          Left = 339
          Top = 113
          Width = 46
          Height = 16
          Caption = 'S'#201'RIE:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText19: TRLDBText
          Left = 388
          Top = 113
          Width = 38
          Height = 16
          DataField = 'Serie'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw83: TRLDraw
          Left = 436
          Top = 104
          Width = 306
          Height = 44
        end
        object rllbTextoA1: TRLLabel
          Left = 446
          Top = 111
          Width = 179
          Height = 10
          Caption = 'Consulta de autenticidade no portal nacional da NF-e'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbTextoB1: TRLLabel
          Left = 446
          Top = 132
          Width = 211
          Height = 10
          Caption = 'www.nfe.fazenda.gov.br/portal ou no site da Sefaz Autorizadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw84: TRLDraw
          Left = 436
          Top = 147
          Width = 306
          Height = 29
        end
        object rllbTextoProt1: TRLLabel
          Left = 446
          Top = 149
          Width = 156
          Height = 10
          Caption = 'PROTOCOLO DE AUTORIZA'#199#195'O DE USO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbProtocolo1: TRLLabel
          Left = 442
          Top = 160
          Width = 298
          Height = 14
          Alignment = taCenter
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rlbcContingencia1: TRLBarcode
          Left = 446
          Top = 107
          Width = 66
          Height = 39
          BarcodeType = bcCode128C
          Caption = '1521'
          Margins.LeftMargin = 1.000000000000000000
          Margins.RightMargin = 1.000000000000000000
        end
        object rllbInscrEstadual1: TRLLabel
          Left = 3
          Top = 185
          Width = 106
          Height = 12
          Caption = 'INSCRI'#199#195'O ESTADUAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbCNPJ1: TRLLabel
          Left = 405
          Top = 185
          Width = 106
          Height = 12
          Caption = 'INSCRI'#199#195'O ESTADUAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbChaveAcesso1: TRLLabel
          Left = 438
          Top = 89
          Width = 302
          Height = 14
          Alignment = taCenter
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbEmpresa1: TRLLabel
          Left = 106
          Top = 24
          Width = 230
          Height = 12
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 571
        Width = 742
        Height = 60
        BandType = btTitle
        BeforePrint = RLBand1BeforePrint
        object RLDraw1: TRLDraw
          Left = 0
          Top = 0
          Width = 742
          Height = 60
          Align = faClient
        end
        object RLLabel2: TRLLabel
          Left = 3
          Top = 2
          Width = 43
          Height = 12
          Caption = 'N'#218'MERO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 70
          Top = 2
          Width = 64
          Height = 12
          Caption = 'VENCIMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 150
          Top = 2
          Width = 34
          Height = 12
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 259
          Top = 2
          Width = 43
          Height = 12
          Caption = 'N'#218'MERO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 326
          Top = 2
          Width = 64
          Height = 12
          Caption = 'VENCIMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 406
          Top = 2
          Width = 34
          Height = 12
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel8: TRLLabel
          Left = 515
          Top = 2
          Width = 43
          Height = 12
          Caption = 'N'#218'MERO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel9: TRLLabel
          Left = 582
          Top = 2
          Width = 64
          Height = 12
          Caption = 'VENCIMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel10: TRLLabel
          Left = 662
          Top = 2
          Width = 34
          Height = 12
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbNumNota1: TRLLabel
          Left = 3
          Top = 14
          Width = 21
          Height = 11
          Caption = '12/1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbVecto1: TRLLabel
          Left = 70
          Top = 14
          Width = 49
          Height = 11
          Caption = '99/99/9999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbValor1: TRLLabel
          Left = 150
          Top = 14
          Width = 39
          Height = 11
          Caption = '1.250,25'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbNumNota2: TRLLabel
          Left = 259
          Top = 14
          Width = 21
          Height = 11
          Caption = '12/1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbVecto2: TRLLabel
          Left = 326
          Top = 14
          Width = 49
          Height = 11
          Caption = '99/99/9999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbValor2: TRLLabel
          Left = 406
          Top = 14
          Width = 39
          Height = 11
          Caption = '1.250,25'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbNumNota3: TRLLabel
          Left = 515
          Top = 14
          Width = 21
          Height = 11
          Caption = '12/1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbVecto3: TRLLabel
          Left = 582
          Top = 14
          Width = 49
          Height = 11
          Caption = '99/99/9999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbValor3: TRLLabel
          Left = 662
          Top = 14
          Width = 39
          Height = 11
          Caption = '1.250,25'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbNumNota4: TRLLabel
          Left = 3
          Top = 25
          Width = 21
          Height = 11
          Caption = '12/1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbVecto4: TRLLabel
          Left = 70
          Top = 25
          Width = 49
          Height = 11
          Caption = '99/99/9999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbValor4: TRLLabel
          Left = 150
          Top = 25
          Width = 39
          Height = 11
          Caption = '1.250,25'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbNumNota5: TRLLabel
          Left = 259
          Top = 25
          Width = 21
          Height = 11
          Caption = '12/1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbVecto5: TRLLabel
          Left = 326
          Top = 25
          Width = 49
          Height = 11
          Caption = '99/99/9999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbValor5: TRLLabel
          Left = 406
          Top = 25
          Width = 39
          Height = 11
          Caption = '1.250,25'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbNumNota6: TRLLabel
          Left = 515
          Top = 25
          Width = 21
          Height = 11
          Caption = '12/1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbVecto6: TRLLabel
          Left = 582
          Top = 25
          Width = 49
          Height = 11
          Caption = '99/99/9999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbValor6: TRLLabel
          Left = 662
          Top = 25
          Width = 39
          Height = 11
          Caption = '1.250,25'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbNumNota7: TRLLabel
          Left = 3
          Top = 36
          Width = 21
          Height = 11
          Caption = '12/1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbVecto7: TRLLabel
          Left = 70
          Top = 36
          Width = 49
          Height = 11
          Caption = '99/99/9999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbValor7: TRLLabel
          Left = 150
          Top = 36
          Width = 39
          Height = 11
          Caption = '1.250,25'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbNumNota8: TRLLabel
          Left = 259
          Top = 36
          Width = 21
          Height = 11
          Caption = '12/1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbVecto8: TRLLabel
          Left = 326
          Top = 36
          Width = 49
          Height = 11
          Caption = '99/99/9999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbValor8: TRLLabel
          Left = 406
          Top = 36
          Width = 39
          Height = 11
          Caption = '1.250,25'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbNumNota9: TRLLabel
          Left = 515
          Top = 36
          Width = 21
          Height = 11
          Caption = '12/1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbVecto9: TRLLabel
          Left = 582
          Top = 36
          Width = 49
          Height = 11
          Caption = '99/99/9999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbValor9: TRLLabel
          Left = 662
          Top = 36
          Width = 39
          Height = 11
          Caption = '1.250,25'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbNumNota10: TRLLabel
          Left = 3
          Top = 47
          Width = 21
          Height = 11
          Caption = '12/1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbVecto10: TRLLabel
          Left = 70
          Top = 47
          Width = 49
          Height = 11
          Caption = '99/99/9999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbValor10: TRLLabel
          Left = 150
          Top = 47
          Width = 39
          Height = 11
          Caption = '1.250,25'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbNumNota11: TRLLabel
          Left = 259
          Top = 47
          Width = 21
          Height = 11
          Caption = '12/1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbVecto11: TRLLabel
          Left = 326
          Top = 47
          Width = 49
          Height = 11
          Caption = '99/99/9999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbValor11: TRLLabel
          Left = 406
          Top = 47
          Width = 39
          Height = 11
          Caption = '1.250,25'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbNumNota12: TRLLabel
          Left = 515
          Top = 47
          Width = 21
          Height = 11
          Caption = '12/1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbVecto12: TRLLabel
          Left = 582
          Top = 47
          Width = 49
          Height = 11
          Caption = '99/99/9999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbValor12: TRLLabel
          Left = 662
          Top = 47
          Width = 39
          Height = 11
          Caption = '1.250,25'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 631
        Width = 742
        Height = 164
        BandType = btTitle
        BeforePrint = RLBand2BeforePrint
        object RLLabel12: TRLLabel
          Left = 3
          Top = 3
          Width = 94
          Height = 10
          Caption = 'C'#193'LCULO DO IMPOSTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw20: TRLDraw
          Left = 0
          Top = 15
          Width = 134
          Height = 26
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
        end
        object RLLabel32: TRLLabel
          Left = 3
          Top = 17
          Width = 109
          Height = 10
          Caption = 'BASE DE C'#193'LCULO DE ICMS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText24: TRLDBText
          Left = 21
          Top = 29
          Width = 108
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'BaseIcms'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw26: TRLDraw
          Left = 134
          Top = 15
          Width = 121
          Height = 26
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
        end
        object RLLabel33: TRLLabel
          Left = 136
          Top = 17
          Width = 64
          Height = 10
          Caption = 'VALOR DO ICMS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText25: TRLDBText
          Left = 145
          Top = 28
          Width = 106
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrIcms'
          DataSource = DM1.dsNotaFiscal
          DisplayMask = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw27: TRLDraw
          Left = 596
          Top = 15
          Width = 146
          Height = 26
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
        end
        object RLLabel34: TRLLabel
          Left = 599
          Top = 17
          Width = 121
          Height = 10
          Caption = 'VALOR TOTAL DOS PRODUTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw28: TRLDraw
          Left = 0
          Top = 41
          Width = 108
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
        end
        object RLLabel36: TRLLabel
          Left = 3
          Top = 42
          Width = 70
          Height = 10
          Caption = 'VALOR DO FRETE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw30: TRLDraw
          Left = 596
          Top = 41
          Width = 146
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
        end
        object RLLabel37: TRLLabel
          Left = 599
          Top = 42
          Width = 92
          Height = 10
          Caption = 'VALOR TOTAL DA NOTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw5: TRLDraw
          Left = 108
          Top = 41
          Width = 112
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
        end
        object RLLabel35: TRLLabel
          Left = 112
          Top = 42
          Width = 78
          Height = 10
          Caption = 'VALOR DO SEGURO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText27: TRLDBText
          Left = 114
          Top = 54
          Width = 99
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrSeguro'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText28: TRLDBText
          Left = 12
          Top = 54
          Width = 92
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrFrete'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw6: TRLDraw
          Left = 255
          Top = 15
          Width = 190
          Height = 26
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
        end
        object RLDraw29: TRLDraw
          Left = 332
          Top = 41
          Width = 164
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
        end
        object RLDBText30: TRLDBText
          Left = 384
          Top = 54
          Width = 108
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'OutrasDesp'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel40: TRLLabel
          Left = 335
          Top = 42
          Width = 130
          Height = 10
          Caption = 'OUTRAS DESPESAS ACESS'#211'RIAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw32: TRLDraw
          Left = 445
          Top = 15
          Width = 151
          Height = 26
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
        end
        object RLDraw33: TRLDraw
          Left = 496
          Top = 41
          Width = 100
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
        end
        object RLDBText29: TRLDBText
          Left = 518
          Top = 54
          Width = 74
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrIpi'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel42: TRLLabel
          Left = 501
          Top = 42
          Width = 53
          Height = 10
          Caption = 'VALOR DO IPI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel14: TRLLabel
          Left = 259
          Top = 17
          Width = 170
          Height = 10
          Caption = 'BASE DE C'#193'LCULO DO ICMS SUBSTITUI'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel15: TRLLabel
          Left = 447
          Top = 17
          Width = 124
          Height = 10
          Caption = 'VALOR DO ICMS SUBSTITUI'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw2: TRLDraw
          Left = 220
          Top = 41
          Width = 112
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
        end
        object RLLabel16: TRLLabel
          Left = 224
          Top = 42
          Width = 47
          Height = 10
          Caption = 'DESCONTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 226
          Top = 54
          Width = 99
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrTotalDesc'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw34: TRLDraw
          Left = 0
          Top = 82
          Width = 302
          Height = 31
        end
        object RLLabel43: TRLLabel
          Left = 3
          Top = 84
          Width = 59
          Height = 10
          Caption = 'RAZ'#195'O SOCIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText32: TRLDBText
          Left = 3
          Top = 99
          Width = 297
          Height = 10
          AutoSize = False
          DataField = 'lkNomeTransp'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw36: TRLDraw
          Left = 624
          Top = 82
          Width = 118
          Height = 31
        end
        object RLDBText34: TRLDBText
          Left = 627
          Top = 97
          Width = 112
          Height = 11
          AutoSize = False
          DataField = 'lkCgcTransp'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel45: TRLLabel
          Left = 627
          Top = 84
          Width = 23
          Height = 10
          Caption = 'CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw37: TRLDraw
          Left = 0
          Top = 112
          Width = 362
          Height = 26
        end
        object RLLabel46: TRLLabel
          Left = 3
          Top = 114
          Width = 47
          Height = 10
          Caption = 'ENDERE'#199'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw38: TRLDraw
          Left = 624
          Top = 112
          Width = 118
          Height = 26
        end
        object RLLabel47: TRLLabel
          Left = 627
          Top = 114
          Width = 89
          Height = 10
          Caption = 'INSCRI'#199#195'O ESTADUAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText36: TRLDBText
          Left = 3
          Top = 125
          Width = 357
          Height = 10
          AutoSize = False
          DataField = 'lkEndTransp'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw40: TRLDraw
          Left = 301
          Top = 82
          Width = 106
          Height = 31
        end
        object RLLabel49: TRLLabel
          Left = 365
          Top = 112
          Width = 125
          Height = 12
          Caption = 'Outras Despesas Acess'#243'rias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw41: TRLDraw
          Left = 362
          Top = 112
          Width = 226
          Height = 26
        end
        object RLLabel50: TRLLabel
          Left = 365
          Top = 114
          Width = 44
          Height = 10
          Caption = 'MUNIC'#205'PIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw42: TRLDraw
          Left = 478
          Top = 82
          Width = 110
          Height = 31
        end
        object RLDBText39: TRLDBText
          Left = 627
          Top = 124
          Width = 112
          Height = 11
          AutoSize = False
          DataField = 'lkInscTransp'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel53: TRLLabel
          Left = 3
          Top = 71
          Width = 192
          Height = 10
          Caption = 'TRANSPORTADORA / VOLUMES TRANPORTADOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel44: TRLLabel
          Left = 303
          Top = 83
          Width = 77
          Height = 10
          Caption = 'FRETE POR CONTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel55: TRLLabel
          Left = 481
          Top = 84
          Width = 104
          Height = 10
          Caption = 'PLACA VE'#205'CULO/REBOQUE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText33: TRLDBText
          Left = 482
          Top = 98
          Width = 85
          Height = 10
          AutoSize = False
          DataField = 'Placa'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw35: TRLDraw
          Left = 588
          Top = 82
          Width = 36
          Height = 31
        end
        object RLLabel56: TRLLabel
          Left = 595
          Top = 84
          Width = 13
          Height = 10
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText40: TRLDBText
          Left = 590
          Top = 97
          Width = 32
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'UFPlaca'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw39: TRLDraw
          Left = 588
          Top = 112
          Width = 36
          Height = 26
        end
        object RLLabel48: TRLLabel
          Left = 595
          Top = 114
          Width = 13
          Height = 10
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText35: TRLDBText
          Left = 590
          Top = 124
          Width = 32
          Height = 11
          Alignment = taCenter
          AutoSize = False
          DataField = 'lkUfTransp'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw43: TRLDraw
          Left = 0
          Top = 138
          Width = 110
          Height = 24
        end
        object RLLabel51: TRLLabel
          Left = 3
          Top = 140
          Width = 54
          Height = 10
          Caption = 'QUANTIDADE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText38: TRLDBText
          Left = 4
          Top = 150
          Width = 102
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Qtd'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw44: TRLDraw
          Left = 111
          Top = 138
          Width = 124
          Height = 24
        end
        object RLLabel52: TRLLabel
          Left = 116
          Top = 140
          Width = 35
          Height = 10
          Caption = 'ESP'#201'CIE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText41: TRLDBText
          Left = 114
          Top = 150
          Width = 118
          Height = 10
          AutoSize = False
          DataField = 'Especie'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw45: TRLDraw
          Left = 235
          Top = 138
          Width = 127
          Height = 24
        end
        object RLLabel57: TRLLabel
          Left = 238
          Top = 140
          Width = 31
          Height = 10
          Caption = 'MARCA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText42: TRLDBText
          Left = 238
          Top = 150
          Width = 121
          Height = 10
          AutoSize = False
          DataField = 'Marca'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw46: TRLDraw
          Left = 362
          Top = 138
          Width = 153
          Height = 24
        end
        object RLLabel58: TRLLabel
          Left = 365
          Top = 140
          Width = 54
          Height = 10
          Caption = 'NUMERA'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText43: TRLDBText
          Left = 365
          Top = 150
          Width = 129
          Height = 10
          AutoSize = False
          DataField = 'Numero'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw47: TRLDraw
          Left = 515
          Top = 138
          Width = 109
          Height = 24
        end
        object RLLabel59: TRLLabel
          Left = 518
          Top = 140
          Width = 53
          Height = 10
          Caption = 'PESO BRUTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText44: TRLDBText
          Left = 518
          Top = 150
          Width = 102
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'PesoBruto'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw48: TRLDraw
          Left = 624
          Top = 138
          Width = 118
          Height = 24
        end
        object RLLabel60: TRLLabel
          Left = 627
          Top = 140
          Width = 57
          Height = 10
          Caption = 'PESO L'#205'QUIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText45: TRLDBText
          Left = 627
          Top = 150
          Width = 102
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'PesoLiquido'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel17: TRLLabel
          Left = 304
          Top = 96
          Width = 100
          Height = 13
          AutoSize = False
          Caption = '3 Pr'#243'prio C/Remet;'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw66: TRLDraw
          Left = 406
          Top = 82
          Width = 72
          Height = 31
        end
        object RLLabel18: TRLLabel
          Left = 408
          Top = 84
          Width = 57
          Height = 10
          Caption = 'C'#211'DIGO ANTT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbCidadeTransp: TRLLabel
          Left = 365
          Top = 124
          Width = 215
          Height = 11
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText20: TRLDBText
          Left = 323
          Top = 28
          Width = 106
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'IcmsBaseSubst'
          DataSource = DM1.dsNotaFiscal
          DisplayMask = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText21: TRLDBText
          Left = 466
          Top = 28
          Width = 106
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'IcmsVlrSubst'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rlVlrTotalItens: TRLLabel
          Left = 608
          Top = 28
          Width = 130
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rlVlrTotalNota: TRLLabel
          Left = 608
          Top = 54
          Width = 130
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand8: TRLBand
        Left = 0
        Top = 475
        Width = 742
        Height = 96
        BandType = btTitle
        BeforePrint = RLBand8BeforePrint
        object RLDraw57: TRLDraw
          Left = 604
          Top = -1
          Width = 138
          Height = 83
        end
        object RLLabel1: TRLLabel
          Left = 630
          Top = 1
          Width = 69
          Height = 11
          Caption = 'DATA EMISS'#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 636
          Top = 14
          Width = 51
          Height = 11
          DataField = 'DtEmissao'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel11: TRLLabel
          Left = 608
          Top = 26
          Width = 111
          Height = 12
          Caption = 'DATA SA'#205'DA / ENTRADA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText53: TRLDBText
          Left = 636
          Top = 38
          Width = 50
          Height = 12
          DataField = 'DtSaidaEnt'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText54: TRLDBText
          Left = 640
          Top = 69
          Width = 46
          Height = 12
          DataField = 'HoraSaida'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel80: TRLLabel
          Left = 634
          Top = 54
          Width = 61
          Height = 12
          Caption = 'HORA SA'#205'DA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel81: TRLLabel
          Left = 2
          Top = 1
          Width = 156
          Height = 10
          Caption = 'DADOS DO DESTINAT'#193'RIO/REMETENTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw56: TRLDraw
          Left = 0
          Top = 11
          Width = 452
          Height = 24
        end
        object RLLabel82: TRLLabel
          Left = 3
          Top = 12
          Width = 89
          Height = 10
          Caption = 'NOME / RAZ'#195'O SOCIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw58: TRLDraw
          Left = 451
          Top = 11
          Width = 149
          Height = 24
        end
        object RLDBText56: TRLDBText
          Left = 453
          Top = 22
          Width = 145
          Height = 11
          AutoSize = False
          DataField = 'CgcCpf'
          DataSource = DM1.dsCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel83: TRLLabel
          Left = 453
          Top = 12
          Width = 45
          Height = 10
          Caption = 'CNPJ / CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw59: TRLDraw
          Left = 0
          Top = 34
          Width = 370
          Height = 24
        end
        object RLLabel84: TRLLabel
          Left = 3
          Top = 35
          Width = 47
          Height = 10
          Caption = 'ENDERE'#199'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbEndCliente: TRLLabel
          Left = 3
          Top = 45
          Width = 364
          Height = 11
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw60: TRLDraw
          Left = 370
          Top = 34
          Width = 159
          Height = 24
        end
        object RLDBText57: TRLDBText
          Left = 372
          Top = 45
          Width = 155
          Height = 11
          AutoSize = False
          DataField = 'Bairro'
          DataSource = DM1.dsCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel85: TRLLabel
          Left = 372
          Top = 35
          Width = 75
          Height = 10
          Caption = 'BAIRRO / DISTRITO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw61: TRLDraw
          Left = 529
          Top = 34
          Width = 71
          Height = 24
        end
        object RLDBText58: TRLDBText
          Left = 531
          Top = 45
          Width = 67
          Height = 11
          AutoSize = False
          DataField = 'Cep'
          DataSource = DM1.dsCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel86: TRLLabel
          Left = 532
          Top = 35
          Width = 18
          Height = 10
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw62: TRLDraw
          Left = 0
          Top = 57
          Width = 277
          Height = 25
        end
        object RLLabel87: TRLLabel
          Left = 3
          Top = 58
          Width = 44
          Height = 10
          Caption = 'MUNIC'#205'PIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbCidadeCliente: TRLLabel
          Left = 3
          Top = 68
          Width = 272
          Height = 12
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw63: TRLDraw
          Left = 277
          Top = 57
          Width = 140
          Height = 25
        end
        object RLLabel88: TRLLabel
          Left = 279
          Top = 58
          Width = 45
          Height = 10
          Caption = 'FONE / FAX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbFoneCliente: TRLLabel
          Left = 279
          Top = 68
          Width = 135
          Height = 11
          AutoSize = False
          Caption = '51-3587-9405 / 51-35879405'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw64: TRLDraw
          Left = 417
          Top = 57
          Width = 36
          Height = 25
        end
        object RLLabel89: TRLLabel
          Left = 419
          Top = 58
          Width = 13
          Height = 10
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText59: TRLDBText
          Left = 419
          Top = 69
          Width = 30
          Height = 11
          Alignment = taCenter
          AutoSize = False
          DataField = 'Uf'
          DataSource = DM1.dsCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw65: TRLDraw
          Left = 453
          Top = 57
          Width = 147
          Height = 25
        end
        object RLDBText60: TRLDBText
          Left = 455
          Top = 68
          Width = 143
          Height = 11
          AutoSize = False
          DataField = 'InscrEst'
          DataSource = DM1.dsCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel90: TRLLabel
          Left = 455
          Top = 58
          Width = 89
          Height = 10
          Caption = 'INSCRI'#199#195'O ESTADUAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 2
          Top = 85
          Width = 34
          Height = 10
          Caption = 'FATURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbNomeCliente: TRLLabel
          Left = 2
          Top = 22
          Width = 447
          Height = 11
          AutoSize = False
          Caption = 'NOME / RAZ'#195'O SOCIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand9: TRLBand
        Left = 0
        Top = 0
        Width = 742
        Height = 59
        BandType = btHeader
        BeforePrint = RLBand9BeforePrint
        object RLDraw78: TRLDraw
          Left = 0
          Top = 0
          Width = 608
          Height = 17
        end
        object RLDraw79: TRLDraw
          Left = 610
          Top = 0
          Width = 132
          Height = 48
        end
        object RLLabel64: TRLLabel
          Left = 656
          Top = 6
          Width = 17
          Height = 14
          Caption = 'N'#186':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText18: TRLDBText
          Left = 676
          Top = 6
          Width = 52
          Height = 14
          DataField = 'NumNota'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel91: TRLLabel
          Left = 616
          Top = 4
          Width = 23
          Height = 14
          Caption = 'NFe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel92: TRLLabel
          Left = 638
          Top = 23
          Width = 35
          Height = 14
          Alignment = taRightJustify
          Caption = 'S'#233'rie:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel93: TRLLabel
          Left = 676
          Top = 23
          Width = 9
          Height = 14
          Caption = '1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel94: TRLLabel
          Left = 4
          Top = 3
          Width = 66
          Height = 12
          Caption = 'Recebemos de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw80: TRLDraw
          Left = 0
          Top = 16
          Width = 168
          Height = 32
        end
        object RLDraw81: TRLDraw
          Left = 167
          Top = 16
          Width = 441
          Height = 32
        end
        object RLLabel95: TRLLabel
          Left = 4
          Top = 18
          Width = 74
          Height = 10
          Caption = 'Data de Recebimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel96: TRLLabel
          Left = 172
          Top = 18
          Width = 429
          Height = 10
          AutoSize = False
          Caption = 'Identifica'#231#227'o e Assinatura do Recebedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw82: TRLDraw
          Left = 2
          Top = 52
          Width = 730
          Height = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Pen.Style = psDashDot
        end
      end
      object RLBand12: TRLBand
        Left = 0
        Top = 257
        Width = 742
        Height = 218
        BandType = btHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BeforePrint = RLBand12BeforePrint
        object RLDraw17: TRLDraw
          Left = 0
          Top = 0
          Width = 437
          Height = 167
        end
        object RLImage2: TRLImage
          Left = 12
          Top = 3
          Width = 317
          Height = 69
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Picture.Data = {
            0A544A504547496D616765B4AB0000FFD8FFE000104A46494600010101006000
            600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
            0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
            3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
            3232323232323232323232323232323232323232323232323232323232323232
            32323232323232323232323232FFC0001108025903FF03012200021101031101
            FFC4001F0000010501010101010100000000000000000102030405060708090A
            0BFFC400B5100002010303020403050504040000017D01020300041105122131
            410613516107227114328191A1082342B1C11552D1F02433627282090A161718
            191A25262728292A3435363738393A434445464748494A535455565758595A63
            6465666768696A737475767778797A838485868788898A92939495969798999A
            A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
            D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
            01010101010101010000000000000102030405060708090A0BFFC400B5110002
            0102040403040705040400010277000102031104052131061241510761711322
            328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
            292A35363738393A434445464748494A535455565758595A636465666768696A
            737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
            A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
            E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FA
            28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
            28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
            28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A424019240A002
            90903BD721AF7C44D1F46DD14527DB6E471E5C27807DDBA0FD6BCCB5BF1EEB9A
            C964FB41B5B73D2280EDE3DDBA9AE7A9898434DCF53099462311ADACBBB3D775
            9F19E89A1865B9BB579C7FCB18BE67FCBB7E38AE7A3F8B9A3B1FDE595EA7B855
            3FD6BC709C9E68AE396326DE88F7E970FE1E31B4DB6CF718BE28786E4FBD34F1
            7FBD113FCB35762F881E189BEEEAA8BFEFC6CBFCC5780D142C6CFB04B87B0CF6
            935F71F4645E2BD0272026AF6649E80CCA0FEB5A70DD41709BA19A3917D5581A
            F982A48679ADE412432C91B8E8C8C54D5AC73EA8E69F0E47EC4FF03EA0A2BC1F
            45F887AEE94E8B34E6F6DC758E73938F66EBFCEBD83C3DE21B2F11E9CB7568D8
            2389233F791BD0FF008D7552C446A68B73C5C6E595F09ACF55DD1B3451456E79
            E1451450014514500254734B1C10BCD2B048D14B3331C003D6A4AF3CF8A9AEB5
            9E99169503624BAF9A4C75083B7E27F91A8A93508B933A30B879622B46947A98
            9E23F8A37935C3C1A205820538F3D972CFEE01E00AE3A7F136B972499755BC39
            EC252A3F21595457913AD393BB67DE50CBF0F46368C57EA5B3AAEA27ADFDC9FA
            CADFE34ABABEA4BF7750BA1F499BFC6A9D159F333A7D9436E53521F11EB701CC
            7AB5E8F633311FCEB4ADBE20789AD88C6A4CE3FBB246ADFD2B99A2A9549AD999
            4B098797C504FE48F41B3F8B5AB4447DAACEDA75FF00637213FCC7E95D3E9FF1
            5745BA216EE29ED18F52CBBD7F31CFE95E2F456B1C5545D4E2AB92E12A6D1B7A
            1F4BD86AD61AA45E6595DC33AFAC6E0E3EBE9576BE6082E27B5944B6F33C520E
            8F1B1047E22BB8D0BE28EA760562D4D05EC238DFF7641F8F43FE79AEAA78C8BD
            25A1E262B87EAC173517CDE5D4F67A2B2745F10E9BAFDB79D61701C8FBD19E1D
            3EA2B5ABB134D5D1E0CE1284B964ACC5A28A2992145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            145145001451450014514500251DAA96A3AA5969168D757D7090C4BDD8F5F603
            B9AF25F147C4ABCD4F7DAE93BED2D7A197A48FFF00C4FF003ACAAD68D35A9DB8
            3CBEB62A5682D3BF43D07C45E38D27C3CAD1C9279F763A5BC47247D4F6AF25F1
            078DF57F103B23CC6DED4F482238047B9EF5CE12598B31C93D49A4AF36AE2673
            D3647D760B28A186D5AE69777FA0514515CE7AC1451450014514500145145001
            5D97C33D4A4B2F16456DB8F9576A6365CF1903703FA1FCEB8DAE87C0C864F1A6
            98A3FE7A13F92935A5176A8AC71E3E119E1A6A5D99F42514515ED9F9D0514514
            005145140087804D7CF7E36D54EAFE2CBD9836628DBC98FD82F1FA9C9FC6BDBB
            C4DA9FF647872FAF41C34719D9FEF1E17F522BE71272493D6B831B3D144FA6E1
            DC3DE52ACFA69FE614514579E7D58514514005145140051451400514514013D9
            DE5CD85CA5CDA4EF0CC872AE8706BD7FC1FF001160D5BCBB0D50AC37A7E5593A
            24A7FA37B7FF00AABC6680715AD2AD2A6F43831D97D2C5C6D25AF467D49C7514
            579A7C3EF1C9BB29A3EAB2E671C41331FBFF00EC9F7F43DFEBD7D2EBD7A7514E
            3747C2E2B0B530D51D3A82D1451567385145140143517BE860F3AC63499D3930
            31DBE60F40DD8FE9FCEA968DE28D375BDD1C1298EE93892DA61B64423AF1FE15
            B78CF5AF3EF1FF00845EE81D7349564BF87E69045906403B8C7F10FD6B3A8E51
            F7A3A9D785852AAFD9D4766F67FE67A0D15E4DE18F8A12C052D75D0644E82E90
            7CC3FDE1DFEA3F5AF51B4BCB7BFB64B8B5992689C655D0E41A29D58D45A062B0
            55B0B2B545F3E859A28A2B439028A28A0028A28A0028A28A0028A28A0028A28A
            0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
            0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
            0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
            0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
            0028A28A0028A28A0028A29090A324E00A002B93F15F8E6C3C388D04645C5F91
            F2C2A785F763DBE9D6B9DF1A7C4611799A768720327DD92E8745F65F7F7FCABC
            ADDDE5919E472CEC72CCC7249AE2AF8A51F761B9F4596E4AEADAA57D176EE5ED
            635BBFD76F1AEAFE732367E55E8A83D00ED59F4515E73936EECFAC84234E2A30
            56414514522C28A28A0028A28A0028A28A0028A28A002BB5F85D69F68F17ACC4
            716F0B3E7DCFCBFD4D7155EB7F08F4FF002F4EBEBF61CCB208D491D9464FF3FD
            2B7C3479AA23CCCDEB2A783979E9F79E95451457B07C085145140051451401E6
            BF16F53F2B4EB3D351BE699CCAE07F757A7EA7F4AF24AEA3E20EA7FDA7E2FBAD
            AD98EDF102FF00C07AFEA4D72F5E3E227CD51B3EFF0029A1EC70B15D5EBF7851
            451581E905145140051451400514514005145140051451400E4768DC3A315653
            9047506BDDBC09E291E22D2364EC3EDF6D85987F78766FC7F9D783D6CF85F5C9
            3C3FAF5BDEA93E56764CBFDE43D7FC7F0ADF0F57D9CBC8F2F35C0AC55176F896
            DFE47D19454714A93C492C6C191D432B0E841A92BD83E09AB681451450014751
            451401E29F11FC2A348D43FB4ECD316772DF3281C46FFE07AFE75CF787BC4FA8
            F872E7CCB394B424FEF2073946FF0003EF5EFBABE9906B1A55C585CA831CCA46
            7B83D88F7079AF9D353D3E7D2B52B8B1B85C4B0B953EFE87F1EB5E66269BA53E
            789F6394E2A18CA0F0F5B56BF147BC7867C5DA778960CC0DE55D28CBDBB9F987
            B8F51EF5D0D7CC36B753D95CC7716D2BC534672AE87041AF60F077C428757F2E
            C3546582FBA2C9D125FF0003EDFF00EAAE8A18A53F765B9E6665934A85EA51D6
            3F8A3BFA28ED45759E0851451400514514005145140051451400514514005145
            1400514514005145140051451400514514005145140051451400514514005145
            1400514514005145140051451400514514005145140051451400514514005145
            1400514514005145140051451400514514005145140051451400514514005145
            1400514514005145140051451400514514005145140051451400514514005145
            31E458919DD82AA8C924E0014025712491228DA49182A28C9627000AF1EF1BF8
            FE4D51E4D374A9192C87CB24A38337B0F45FE750F8E7C7326B52BE9DA7B94D3D
            4E19C1C198FF00F13ED5C2D79D88C4DFDC81F5994E51C8956AEB5E8BB0514515
            C27D2851451400514514005145140051451400514514005145140057D15E12D3
            7FB27C2F6168CBB5C4419C7FB4DC9FD4D78778534CFED7F13585A1194690338F
            F65793FA0AFA2C0C002BD0C143791F2BC455F58515EBFE42D14515DE7CC05145
            1400550D62FD34BD1EEEF9FA43133E3D481C0ABD5C07C56D53ECBE1E86C51B0D
            772723FD95E4FEBB6B3A92E48391D184A3EDEBC69F7678ECB23CD33CB236E776
            2CC4F726994515E26E7E90924AC828A28A061451450014514500145145001451
            450014514500145145007B7FC32D60EA5E1916B23666B26F2B93CECEABFD47E1
            5DAF6AF13F85BA91B4F149B466C25DC6571FED2F23F40DF9D7B657AF869F3D34
            7C0E6F87F618A925B3D7EF168A28AE83CC0A28A28012BCB3E2C68601B7D6A14E
            4FEE67C7FE3A7F98FCABD4EB375FD31758D0AF2C180CCB190A4F66EA0FE78ACA
            B439E0D1D980C4BC3E22353A75F43E6DA0120E47069D22347232382ACA76907B
            1A6D78A7E889A6AE7A97823E21E4C7A5EB52F3F762B963FA3FF8FE75EA408232
            2BE5BAF4CF00F8F4C262D235797F77F7609D8FDDF4563E9E86BD0C3E27EC4CF9
            6CDB28B5EBD05EABFC8F59A2901C8CD2D779F301451450014514500145145001
            4514500145145001451450014514500145145001451450014514500145145001
            4514500145145001451450014514500145145001451450014514500145145001
            4514500145145001451450014514500145145001451450014514500145145001
            4514500145145001451450014514500145145001451450014514500145145001
            45145002678AF20F885E3737CF268FA649FE8CA713CAA7FD61FEE8F6FE7FCF6F
            E2378C0E9D01D1EC25C5D4ABFBE753CC6A7B7D4FF2FAD78FD7062ABDBDC89F4F
            92E597B622AAF45FA8514515E79F541451450014514500145145001451450014
            51450014514500145145007A5FC23D337DDDEEA8E388D44287DCF27F90FCEBD6
            6B99F01699FD99E11B3465C4930F39F8E72DC8FD315D357B3421C94D23F3CCCA
            BFB7C54E5D36FB85A28A2B638428A28A004278AF0EF89BA9FDBBC56F6E8D98ED
            104639E371E4FF00303F0AF6ABDB98ECAC67BA94E238636763EC066BE69BDBA9
            2F6FA7BA94FEF2691A46FA939AE2C6CED1513E8787A873569557F67F520A28A2
            BCD3EC028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00D
            1D06ECD878834FBA07023B842DF4CF3FA57D243902BE5C07041AFA6F4FB8175A
            75B5C0E92C4AFF0098CD7A1827A347CA711D35CD09FAA2D514515DE7CC851451
            40051DA8A2803E7EF1DE9C34DF17DF46AB8495BCE5FF0081727F5CD7375E95F1
            7AC825F69D7C07FAC468D8FF00BA723FF4235E6B5E3578F2D468FD0B2CABED70
            909797E5A051451589DE7ACFC3BF1B7DA563D175293F7CA316F2B1FBE3FBA7DF
            D3D7F9FA5D7CBA8ED1BABA31575390C0E0835EE7E04F16AF88B4D105CB81A85B
            80241D3CC5ECC3FAFBFD6BD2C2D7E6F7247C8675967B27EDE92F75EFE4761451
            45769F3A14514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            145145001451450014514500256178AFC45178734592E9B0D3B7C90467F89BFC
            075ADB765442CC40503249AF01F1AF88DBC45AEC92231FB1C198E019EA3BB7E3
            FE158622AFB38E9B9E96578278BAE93F856FFE4605CDCCD79732DC4EE6496462
            CEC7A926A2A28AF1DB6DDD9F7C928A4905145140C28A28A0028A28A0028A28A0
            028A28A0028A28A0028A28A002AFE89A7B6ADADD9D8819F3A50AD8ECBDCFE59A
            A15E83F09F4BFB4EB971A832E52D63DAA7FDA6FF00EB03F9D69461CF348E4C75
            7F6187954F23D863411C6A8A30AA3000ED4FA292BDB3F396EE2D145140051451
            401C5FC4DD53EC1E147814E24BB7110FA753FA0C7E35E1D5DF7C56D53ED5E208
            6C15B29691E48FF69B93FA6DAE06BC9C54F9AA35D8FBAC9287B2C226F796BFD7
            C828A28AE63D70A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A2
            8A2800AFA33C28DBFC27A51FFA758C7FE3A2BE73AFA23C1B9FF843F4BCFF00CF
            BAFF002AEDC13F799F37C46BF7507E66ED14515E91F24145145001451450079F
            FC59B7F33C376F30EB15C8CFD0823FC2BC6ABDDBE25461FC1178DFDC78C8FF00
            BEC0FEB5E135E5E315AA1F6BC3F2BE15AECD8514515C87B8157B48D52E746D4E
            1BEB5622489B38ECC3B83EC6A8D14D3B3BA2670538B8CB667D29A36AB6FAD697
            05FDB366395738EEA7B83EE2B42BC4FE1B7894E95ABFF675C3E2D2EDB0327849
            3B1FC7A7E55ED9D6BD8A355548DCFCFB31C1BC25670E9D05A28A2B638428A28A
            0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
            0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
            0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
            0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A29A
            CC110B120003249A00E17E26F883FB33451A7C0F8B8BCCA9C7558FBFE7D3F3AF
            16ADAF15EB4DAF788AE6F324C5BB6423D1074FCFAFE358B5E3E22A73CCFBFCAF
            08B0D8749FC4F56145145607A414514500145145001451450014514500145145
            00145145001451450015EE7F0D74CFECFF0009432B2E24BA63337D3A0FD003F8
            D78A585A49A86A36D671FDF9A458C7E2715F4B5ADBC7696B0DBC4BB63890228F
            4006057760A1AB91F37C455F969C68AEBAFDC4F451457A27C905145140094C96
            458A2791C80AA0924F614FAE5BE20EA7FD9BE10BBDAD892E07909EFBBAFE99A9
            94B962D9AD0A4EAD48D35D59E25AC5FB6A9AC5E5F31399A56600F619E07E5546
            8A2BC36EEEE7E95082845456C828A28A45051451400514514005145140051451
            40051451400514514005145140057D17E125D9E12D281FF9F58CFE6A2BE7415F
            4BE910FD9B47B2848C797022E3E8A2BBB03BB67CD711CBDC82F365EA28A2BD13
            E4C28A28A0028A28A00E5FE212EFF03EA23FD943F93AD78157BEFC436D9E07D4
            4FB20FFC7D6BC0ABCCC6FC6BD0FB1E1DFF007797AFE8828A28AE33E8028A28A0
            0012A4107047715EFDE07F107FC241E1E8E595B37507EEA6F723A1FC47F5AF01
            AEBFE1DEBA747F1224123E2DEF311383D037F09FCF8FC6BA70D539276E8CF233
            9C27B7C3B92DE3AAFD4F76A281D28AF58F850A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2800A28A2800A28A28012B92F889ABFF6578567546C4D74
            7C84FA1FBC7F2CFE75D6D78CFC56D53ED5E2086C15B29691E587FB6DCFF2C561
            889F2536CF472AC3FB7C5462F65AFDC7034514578E7E80145145001451450014
            514500145145001451450014514500145145001451450076DF0BF4CFB6F8A7ED
            4CB98ED232F9FF0068F03FA9FC2BDBAB84F857A67D8FC34F78CB87BB90B03FEC
            AF03F5CFE75DDD7AF86872D35E67C16715FDB62E5D969FD7CC5A28A2BA0F2C28
            A28A004AF23F8B7A9F9BA859E9A878890CAE3DCF03F407F3AF5B27009F4AF9CB
            C4DA97F6BF892FAF43651E5210FF00B2381FA015C98B9F2C2DDCF7321A1ED313
            CEFECA3268A28AF2CFB50A28A2800A28A2800A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2802D69D6FF006BD4ED2DB19F36648F1F52057D32A3E451
            ED5E05F0FECBEDBE33B10465222D2B7B6071FAE2BDFBA57A5828FBAD9F1FC455
            2F5A30ECBF3FF86168A28AED3E7828A28A0028A28A00E33E27CFE5783664FF00
            9EB2A2FEB9FE95E1B5EB9F17AEB6699A7DA6799263263FDD18FF00D9ABC8EBCA
            C63BD43EDB20838E12FDDBFF0020A28A2B94F6C28A28A0029558A30653860720
            8A4A2816E7D19E18D586B7E1EB3BEC8DEE98900ECE383FA8AD8AF2EF847A9E52
            FB4B76E844F18FD1BFF65AF51AF6A8CF9E099F9DE3E87B0C4CA9ADBA7A0B4514
            56A7185145140051451400514514005145140051451400514514005145140051
            4514005145140051451400514514005145140051451400514514005145140051
            4514005145140051451400514514005145140051451400514514005145140051
            45140051451400514514005145140051451400514514005145140051451400D6
            3B549F415F366B97E753D76F6F49C89A6665FF00773F2FE98AF7EF13DE1B0F0C
            EA372A70C903ED3EE4607EA6BE71AE0C6CB689F51C394BE3ABF20A28A2BCF3EA
            428A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002A48217
            B8B88E08D7749230451EA4F4A8EBABF875A67F6978BEDD99731DB033B71DC74F
            D48FCAAE9C79A4918626B2A346551F447B6E97629A76976B651FDD862541EF81
            D6AE51D0D15EDA5647E6D293936D8B451453105145140181E32D4FFB27C2B7D7
            21B1218FCB8FD773703F9E7F0AF9E6BD4FE2E6A7F258E9687924CF20FD17FF00
            66AF2CAF2F193BCEDD8FB5C8287B3C373BDE4C28A28AE43DC0A28A2800A28A28
            00A28A2800A28A2800A28A2800A28A2800A28A2800A28A2803D3BE1169DBA7D4
            35265E1556146FAF2DFC96BD5AB9BF03695FD93E14B389976CB2AF9D271DDB9F
            D0607E15D257B3423CB4D23F3CCCABFB7C54E6B6DBEE168A28AD8E10A28A2800
            A28A63B04466620003249A0373C67E2B6A1F69F1345680E56DA1008F466E4FE9
            8AE0EB475ED44EADAEDEDF139134AC57FDDE83F4C5675789565CD36CFD1B0347
            D8E1E10EC828A28ACCEB0A28A2800A28A2803A4F01EA074FF18D8B938499BC97
            F7DDC0FD715F4057CC16D3B5ADD45709F7E27575FA839AFA6AD675B8B58A6439
            5740C3E8466BD2C14BDD713E4788A95AAC2A7756FB89A8A28AED3E7028A28A00
            28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00
            28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00
            28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00
            28A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E3BE26DC793E0BB8
            4CE0CD2227FE3D9FE95E175EC7F1724C7876D23CFDEBA07F256FF1AF1CAF2B18
            EF50FB5C8236C2DFBB6145145729EE0514514005145140051451400514514005
            1451400514514005145140057AFF00C25D2FC9D26EB5175C35C49B10FF00B2BF
            FD727F2AF21552CC140C93C002BE90F0F69A348F0FD958E0068A201B1FDEEA7F
            526BB3070BCF9BB1E071057E4A0A9AFB4FF046A514515E99F1A145145002507B
            D1597E22D4C691E1FBDBEC80D1447667BB1E17F52293765765420E72515BB3C3
            FC6DA9FF006AF8B2FA60D98E37F253E8BC7F3C9FC6B9FA524B3162724F39A4AF
            0E72E69367E954292A54E34D74414514549A8514514005145140051451400514
            5140051451400514514005145140056E7847463AE7892D6D4AE620DE64DFEE2F
            5FCFA7E35875ECDF0C3403A7E8CFA9CE989EF30533D5631D3F3EBF956F87A7CF
            3479B9AE2D61B0CDADDE88EF9400A00ED4B4515EC1F001451450014514500257
            2BF103581A4F856E36B626B9FDC47F8F53F966BAAAF10F897AEFF6A7887EC713
            E6DECB29C777FE23FC87E158622A7241B3D2CAB0BF58C4C53D96ACE2A8A28AF1
            CFBF0A28A2800A28A2800A28A2800AFA27C213FDA3C25A5C99C9FB3AA9FA818F
            E95F3B57BCFC3872FE06B0CF254C83FF001F6AECC13B4DA3E7B88A17A119799D
            6514515E99F1E145145001451450014514500145145001451450014514500145
            1450014514500145145001451450014514500145145001451450014514500145
            1450014514500145145001451450014514500145145001451450014514500145
            1450014514500145145001451450014514500145145001451450014514500145
            1450079BFC5E3FF128B01DBCF3FF00A09AF22AF60F8BABFF00122B26F4B9C7FE
            3ADFE15E3F5E4E2FF8ACFB8C89FF00B1AF56145145731EC85145140051451400
            5145140051451400514514005145140051451401D0F8234CFED5F16D8C45731C
            6FE73FD179FE781F8D7D063B0AF2FF00845A6623BED51D7962208CFD396FFD97
            F2AF50AF57090E5A77EE7C3E795FDAE29C56D1D05A28A2BA8F1828A28A004EF5
            E73F16B53F274AB4D391BE6B8937B8FF00657FFAE47E55E8D5E0DF11353FED2F
            17DC056CC76C040BF875FD49AE6C54F969FA9EB64B43DAE2937B475394A28A2B
            C93EEC28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A2A482096EAE238218D9E59182A2AF524D095F4426D2577B1B7E10F0F3F88B5D
            8ADC83F668FF00793B0ECBE9F53D2BE828A3486258D142A2800003802B07C1FE
            1B8BC37A324040375261E771DDBD3E83FCF5AE86BD7C3D2F671D773E0F35C77D
            6AB7BBF0ADBFCC5A28A2BA0F2C28A28A0028A2A392458919DD82AA8C924F0050
            08C1F18EBEBE1ED026B9047DA5FF0077029EEE7BFE1D6BE7E77691D9DD8B331C
            927A935D1F8DBC4ADE23D6D9E363F63832900F51DDBF1FF0AE6ABC8C4D5E7959
            6C8FBBC9F03F56A3CD2F8A5BFF0090514515CE7AC14514500145145001451450
            015EE5F0C493E0B807A4AE07FDF55E1B5EEBF0D176F826D0FF0079E43FF8F9AE
            BC1FF10F07883FDD57AFF99D8514515EA1F18145145001451450014514500145
            1450014514500145145001451450014514500145145001451450014514500145
            1450014514500145145001451450014514500145145001451450014514500145
            1450014514500145145001451450014514500145145001451450014514500145
            1450014514500145145001451450070FF14E0F37C2064FF9E53A37E795FEB5E2
            55F42F8DED45E783B538F19C42641FF01F9BFA57CF55E66357BE99F65C3D34F0
            F28F66145145719EF85145140051451400514514005145140051451400514514
            0051456BF85F4CFED7F12D8D995CA3CA19C7FB2BC9FD0538AE67646756A2A707
            37B23DBFC1FA61D27C2D636CCBB6431F98FEBB9B93FCF1F856F0A00C003D28AF
            722B95591F9AD5A8EA4DCDEEC5A28A2A880A28A280296AB7C9A6E95757B27DD8
            626723D703A57CD534CF713C9348DBA4918BB1F526BD9BE2A6A7F64F0DA592B7
            CF77200467F85793FAEDFCEBC5ABCDC6CEF251EC7D7F0F50E5A32AAFABFC828A
            28AE23E8828A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
            03BD7B07C3AF061D3A25D63508F17722FEE6361FEAD4F73EE7F4159DE00F0216
            68F58D5A1C0186B781C75F4661FC857AAF4AF430B87B7BF23E4F39CD39EF428B
            D3ABFD05A28A2BBCF9A0A28A2800A28A28012BCBFE25F8B82AB6856327CC7FE3
            E9D4F41FDCFF001FCBD6B77C75E338FC3F686D2D1C36A332FCBDFCA5FEF1FE82
            BC42491E591A4918B3B1DCCC4E4935C58AAF65C913E8F25CB3DA49622AAD16DF
            E6368A28AF34FAE0A28A2800A28A2800A28A2800A28A2800AFA0BC0B0791E0CD
            313A663DFF00F7D127FAD7CFA065801D4D7D33A55A8B1D26D2D47486144FC801
            5DD825EF367CDF11CED4E10EEFF2FF00872E514515E89F241451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            145145001451450014514500145145001451450043710A5C5B4B0C8329229561
            EC457CCF796CF677D3DB3FDF86468CFD41C57D3B5E11F11F4CFECFF174F22AE2
            3BA5132F1DCF07F504FE35C58D8DE2A47D0F0ED6E5AD2A6FAAFC8E4A8A28AF34
            FB00A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800AF49F849A5F9
            97D7BA9B8F962510A1F73C9FD00FCEBCDABDF3E1FE99FD99E11B3057124E3CF7
            E3FBDD3F4C0AEAC2439AA5FB1E2E7B5FD9E17956F2D0EA68A28AF54F880A28A2
            80129692A1BBB88ED2D26B894ED8E246763E800C9A012BBB23C5FE286A7F6DF1
            4FD955B31DA4613FE04793FCC0FC2B89AB17F7725FEA1717727DF9A4690FE273
            55EBC3A93E69B91FA460E8FB0A11A7D905145150748514514005145140051451
            400514514005145140051455ED2B48BED6AF16D6C2DDA590F523A28F527B0A69
            36EC889CE305CD27645244677088A5998E0281C935EABE09F8782031EA7AD479
            97EF456CDD17DDBDFDAB77C25E03B2F0F2A5D5C62E750C7FAC23E58FFDD1FD7F
            957635E8D0C2F2FBD33E4F33CE9D5BD2A1B77FF200001C52D145769F3A145145
            001451450025725E32F19DBF86AD4C30959750907C91764FF69BFC3BD53F1978
            FE0D115EC74F659B503C13D561FAFA9F6FCEBC66E6E67BCB97B8B891A59A46DC
            CEC7249AE3C46254572C773DFCAF289566AAD6568F6EFF00F005BBBB9EFAEA4B
            9B995A59A46DCEEDD49A868A2BCC6DB7767D8C528AE55B05145140C28A28A002
            8A28A0028A28A0028A28A00D7F0BD89D4BC4FA75AE321A60CC3FD95F98FE80D7
            D183802BC7BE13699E7EB773A838F96DA3DAA4FF0079BFFAC0FE75EC55EA60E3
            685FB9F159FD6E7C4F22FB2BF3168A28AEB3C30A28A2800A28A2800A28A2800A
            28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
            28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
            28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
            28A2800A28A2800A28A2800A28A28012BCFBE2AE91F6BD0E1D4A35CBDA3E1BFD
            C6E3F9EDFD6BD06AADFD945A8E9F3D9CC3314D1946FA1151521CF1713A3095DD
            0AD1A8BA1F32D156B52B1974CD4AE2C671892090A1E3AFBD55AF11AB3B33F478
            494A2A4828A28A45051451400514514005145140051451400514514017B45D3D
            B55D6ACEC541FDF4A14E3B2E793F966BE938E358A258D400AA00007615E3BF0A
            34BFB56BF3DFB2E52D23C29FF69B8FE40D7B2D7A78385A1CDDCF8CE20AFCF885
            4D7D95F8B168A28AEC3C10A28A28012B8EF895A9FF0067F84A6854E24BB610AF
            D3A9FD011F8D763DEBC6FE2BEA9F69D76DF4F56CA5AC7B987FB4DFFD603F3AC3
            113E5A6CF472AA1EDB1715D16BF71E7F4514578E7E8014514500145145001451
            4500145145001451524304B712AC5044F248C70A88B927F0A12BE884DA4AEDD8
            8E9C91BCB22A468CEEC7015464935DC689F0C357D436C97ECB6309E70DF3487F
            0EDF8D7A6685E11D27C3E83EC96E1A7C61A793E673F8F6FC2BAA961672DF4478
            F8BCEF0F47483E67E5FE679BF86FE18DF6A252E3562D676DD7CBEB237FF13F8F
            E55EAFA5E9163A35A0B6B0B648631D40EAC7D49EE6AFD15E853A31A6B43E5317
            9857C53F7DE9DBA0B451456A71051451400945048039AE4BC47F10349D083451
            B8BBBC1C79511E14FF00B47B7F3A994E31576CD68D0A95A5CB4D5D9D45C5C456
            B03CD3CA91C4832CCE7000FAD79578BBE253DC07B1D0DCA47F75EEBA337FBBE9
            F5EB5C86BFE2AD4FC4536EBC9B6C20E5204E117F0EE7DCD62579F5B16E5EEC0F
            AACBF238D3B54AFABEDD3FE08A49662CC724F526928A2B88FA20A28A2800A28A
            2800A28A2800A28A2800A28A2800A28AD7F0C68EFAEF882D6C403E5B36E94FA2
            0E4FF87E34E31727646756A469C1CE5B23D83E1DE9074AF0A40CEB89AE8F9EE3
            EBD3F402BADA6222C6811400A06001DA9F5EE423CB1491F9BD7AAEB549547D45
            A28A2A8C828A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
            028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
            028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
            028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
            028A28A00F28F8ADE1F292C5AE40BC3622B8C763FC27FA7E55E635F4CEA7A7C1
            AAE9B3D8DCAEE8A642ADEDEFF515F3A6B1A5CFA36AB7161703F7913633D98762
            3EA2BCCC5D2E5973AEA7D8E458DF694BD84B78FE5FF00A345145719F40145145
            001451450014514500145145001451562C6D5EFAFEDED23FBF348B1AFD49C534
            AEEC4CA4A29C9F43DABE1A697F60F09C7330C4976E653F4E83F419FC6BB2A82C
            EDA3B3B386DA2188E2408A3D0018153D7B708F2C523F36C45575AB4AA3EAC5A2
            8A2ACC428A28A0063BAC68CEC70AA3249AF9B35BD41B55D6EF2F8927CE94B2E7
            B2F61F962BDBFC7DA9FF0065F846F1D5B124C3C94E7BB707F4C9FC2BC06BCFC6
            CF689F55C3B42D19567E8145145701F4E1451450014515674FB19F53D42DECAD
            D732CCE117D3EB4257D1132928C79995A8AF5EB5F847A6A28373A85CCA7BF960
            20FEB5BB67F0F3C356786FB009987799CB0FCBA7E95D71C1D47B9E2D4CFF000B
            1F86EFE5FE6783C50CB3C823863791DBA2A2E49AE934DF87FE22D4B0C2CBECF1
            9FE2B86D9FA7DEFD2BDD6D6C2CECA3D96B6B0C0BFDD8D028FD2AC63DAB78E0A3
            F699E6D6E22AB2D2946DEBA9E6DA4FC25B48B6BEAB78F70DDE38BE55FA67A9FD
            2BB8D3743D33488F658594307182557E63F53D4D68D15D30A5086C8F1B118DAF
            887FBC95FF002168A28AD0E50A28A69655192401F5A005A2B9FD4FC6BA0695B9
            67D4637907FCB38BE76CFE1D3F1AE2755F8B9236E4D2AC428ED2DC1C9FFBE47F
            8D653AF086ECEDA197626BFC11D3CF43D4DE448D4BBB2AA819249C015C8EB7F1
            1F45D2B747049F6E9C7F04272A3EADD3F2CD7906ABE23D5F5A726FAFA5917FE7
            983B507E038ACBAE3A98D6FE047BD86E1E8AD6BCAFE4BFCCEA35EF1EEB3AE6E8
            BCEFB2DB1FF96309C647BB753FCAB97A28AE394E53776CFA0A387A7423CB4D59
            051451526C14514500145145001451450014514500145145001451450015EC5F
            0B740365A5C9AB4E9896EF88F3D4463FC4FF00215E6FE16D064F116BB0D9A83E
            483BE771FC283AFE7D3F1AFA1A1892085218902C68A155474007415DD83A577C
            ECF9ACFF001BCB15878EEF7F425A28A2BD13E4C28A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A004AE0FE247858EADA7
            7F69DAA66F2D57E65039923EE3EA3AFE75DE52100820F4A99C14E3CACDF0D889
            E1EAAA90DD1F2E515DC7C42F089D16F8EA3669FE8370DC803889FD3E87B570F5
            E2D48384B959FA1617130C4D25521D428A28A83A028A28A0028A28A0028A28A0
            02BB4F861A67DBBC54B72CB98ED23321E38DC781FCC9FC2B8BAF67F855A67D93
            C3925F3AE1EEE5241FF61781FAEEAE8C3439AA23CACE2BFB1C24BBBD3EFF00F8
            077D451457AE7C18514514005145213804D007937C5BD4F7DE596988788D4CCE
            3DCF03F91FCEBCD2B67C55A9FF006BF89AFEEC1CA3485508FEEAFCA3F4158D5E
            2D79F3D46CFD0F2EA1EC30D0879051451591DC1451450015D47C3C96187C6D62
            D310036F5527FBC54E3FC3F1AE5E9D1C8F148B246E51D4EE5653820FAD5425CB
            24CC7114BDB52953EEAC7D45DA8AF13B7F8A9AFC10246E9693328C799221C9FA
            E0814ADF15BC40DD22B25FF7636FEAD5E9FD6E99F1BFD858CBDACBEF3DAE8AF0
            C97E27789641859E08FDD611FD735426F1E789A7187D5651FEE2AAFF002149E3
            69F6348F0F625EED2FBFFC8FA0770F5155EE2FECED1775CDD43081DE470BFCEB
            E749F5ED5EE789F54BC901EA1A6623F2CD502CCC4962493DCD66F1CBA23A69F0
            E4BEDCFF0003E80BBF1E786ED01DFAA44E4768817CFE55CF5E7C5BD3620459D8
            DC5C11D0B9080FF33FA578FD1594B1937B1DD4F87F0D1F89B7FD791DD5FF00C5
            5D6EE72B6B15BDA29E842EF61F89E3F4AE5B50D7B56D509FB6EA171303D559CE
            DFFBE7A56751584AACE5BB3D2A381C3D1F8209051451599D6145145001451450
            014514500145145001451450014514500145145001451450014E44691D5114B3
            31C003A934DAF4CF869E1132CABAE5FC7FBB5FF8F6461F78FF007FF0ED5A52A6
            EA4B951C98CC5C30B49D497FC39D7F81BC323C3BA28F3547DB6E30F39F4F45FC
            3F9E6BA9A28AF6611515647E7B5AB4AB547527BB168A28AA330A28A2800A28A2
            800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
            800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
            800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
            800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
            802A5FD8DBEA5652DA5D46248255DACA6BC0FC57E19B8F0D6A8D03E5EDA4CB41
            2E3EF0F43EE2BE86ACCD7344B3D7F4C92CAF23CAB72AC3AA37623DEB0AF41548
            F99E9E59984B09535F85EFFE67CDD456AF88340BCF0EEA6F6774B91D63940E24
            5F515955E44A2E2ECCFBBA7523522A70774C28A28A4585145140051451400F86
            279E68E18D773C8C1540EE4D7D29A4D8A699A4DAD927DD82254CFAE075AF11F8
            79A67F6978BED4B2E63B60676FA8E9FA915EF78E2BD1C1434723E4788ABF3548
            D25D35168A28AEE3E7028A28A004AC3F16EA7FD93E17BFBA0DB64119543FED37
            03F535B95E63F17353D96F63A62372EC66907B0E07F33F95655A7C906CECCBE8
            7B7C4C21E7F91E534514578A7E8A145145001451450014514500145145001451
            4500145145001451450014514500145145001451450014514500145145001451
            450014514500145145001451450014515D0F84FC2975E26D4022031DA467F7D3
            63A7B0F7AA8C5C9F2A32AD5A1460E737648B7E08F0849E23BF134EACBA742DFB
            C6E9BCFF00747F5AF748628E18922894246802AA818000ED5069FA7DB6976315
            9DA46238621855156FBD7AF468AA51B753E0B30C7CF195799ECB642D14515B1C
            0145145001451450014514500145145001451450014514500145145001451450
            0145145001451450014514500145145001451450014514500145145001451450
            0145145001451450014514500145145001451450014514500145145001451450
            0145145001451450014514500145145001451450014514500145145001451450
            014514500145145001451450014514500646BDA05978874E7B4BC8FDD241F790
            FA8AF08F10F876F7C39A835B5DA128798A603E5907A8FF000AFA36B3F57D1ECB
            5CB07B3BE884913743DD4FA83D8D73D7A0AA2BADCF572DCCE784972BD62FFAD0
            F9AE8AE93C55E0EBEF0D5C966066B263FBB9D47E8DE86B9BAF2A70717667DBD1
            AF0AD053A6EE9851451526A14515D2F83BC293F897535DCAC96313033C9EBFEC
            8F73FA55422E4EC8CAB5685083A937648EEFE14E8CF6BA55C6A7326D6BA60B1E
            7AEC5EFF0089CFE55E8951410476D02410A048A350AAAA380074152D7B54E1C9
            1513F3BC5E21E22B4AABEA2D1451567385145140099AF9FBC75A9FF6A78BAF64
            56CC7137929F45E0FEB935EDFAFEA2349D0AF6F89198622CB9EEDD87E78AF9B9
            98BB976392C7249AE1C6CF4513E9787685E72ACFA682514515E71F5814514500
            1451450014514500145145001451450014514500145145001451450014514500
            14514500145145001451450014514500145145001451450014515D8F83FC0973
            E2175BABA0F069C0FDEE8D2FB2FF008D5C2129BB230C46229E1E0EA5476451F0
            A7846F3C4F79F2E62B28CFEF6723F45F535EE9A5E9769A3E9F15959C4238A31C
            7A93EA7D4D3EC6C6DB4DB38ED6D2158A18C6151455AAF568D0549799F0F98665
            53193ED15B2168A28ADCF3428A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0082E6DA1BBB7782E22596271864719045792F8ABE19DCDACAD73A1A34F
            6EC79B7CFCE9F4CF51FAFD6BD828ACAA528D456675E131D5B092E6A6FE5D0F9A
            67D1754B662B369D77191FDE8587F4A5B7D0F55BB70B069D75213E90B57D2BB4
            1EC28DA07615CDF528F73D9FF58EA5BE057F53C7740F85B7F7722CDAC38B583A
            F9484348DFD07EB5EAFA7E9D69A5D947696702C30A0C055FF3C9AB9495D34E8C
            69AD0F1F178FAD8A77A8F4EDD05A28A2B538C28A28A0028A28A00F3CF8B3A835
            BE856B62848FB4CB96F755E71F995FCABC76BD43E30B1DFA40ED894FFE815E5F
            5E4E2DDEAB47DD647051C1C5AEB7FCC28A28AE63D70A28A2800A28A2800A28A2
            800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
            800A28A2800A28A2800A28A2800A7471BCB22C71A33BB1C2AA8C926B5B41F0CE
            A7E21B8D96501F2C1C3CCFC227E3FD057B2F863C13A7786E3122AFDA2F48F9AE
            1C723D947615BD2C3CAA7A1E5E3B35A38556DE5DBFCCE4FC21F0D0FEEEFF005D
            4FF692D3FF008BFF000FCFD2BD4238D628D51142A28C00060014FA2BD4A74A34
            D591F198AC655C54F9EA3FF802D14515A1CA1451450014514500145145001451
            4500145145001451450014514500145145001451450014514500145145001451
            4500145145001451450014514500145145001451450014514500145145001451
            4500145145001451450014514500145145001451450014514500145145001451
            4500145145001451450014514500145145001451450014514500145145001451
            4500145145001451450014514500145145001451450014514500145145001451
            4500145145007987C6180B5B6953F647913F300FFECB5E535EE7F1334E37DE11
            9A44525ED9D66007A743FA127F0AF0CAF2B191B54B9F6F90D452C228F66FFCC2
            8A28AE53DA0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
            800A28A2800A28A2800A28A2800A28A2800A28A2800A2A7B4B3B9BEB8582D209
            2695BA246A49AEFF0040F8557770566D666FB3C7D7C98C8673F53D07EB5A4294
            E7F0A393138DA18657A92FF3380B3B2BAD42E52DED2092699BA222E4D7A67873
            E15E025CEBB2027AFD9633C7FC09BFC3F3AF40D2B44D3B44B7F274FB54857B90
            3E66FA9EA6B46BBE961231D65A9F2F8DCF6AD6F768FBABF120B5B482CA0482DE
            248A24185445C0153D14B5D8B43C16DB77614514500145145001451450014514
            5001451450014514500145145001451450014514500145145001451450014514
            5001451450014514500145145001451450014514500145145001451450014514
            5001451450014514500145145001451450014514500145145001451450014514
            5001451450014514500145145001451450014514500145145001451450014514
            5001451450014514500145145001451450014514500145145001451450014514
            50014514500145145001451450041756F1DDDACD6F2AEE8E5428C0F70460D7CE
            5AEE933687ACDC69F303989BE56FEF2F63F957D275C7F8EFC223C476027B5555
            D42DC1D84F1E60FEE9FE9FFD7AE6C4D1F691BADD1EBE4F8E586ABCB3F865F81E
            17453E68A4B799E1991924462ACAC3041F4A65793B68CFB94D3574145145030A
            28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
            28AD3D3BC3BAC6AA47D8B4F9E553D1F6E17FEFA3C535172D1113AB0A6AF37646
            6515E89A57C26D427C3EA5771DB2FF007231BDBFC07EB5DBE93F0FBC3FA56D7F
            B27DA651FF002D2E0EEFD3A7E95D10C25496FA1E4D7CF30B4B48BE67E5FE678C
            E95E1BD5F5A602C6C65910FF00CB4236A0FC4F15E81A2FC268D76CBAC5D973FF
            003C60E07E2C79FCB15E9AA888A02A800700014EAECA78484757A9E0E273CC45
            5D21EEAFC7EF2869BA3E9FA441E4D85A470277DA393F53D4FE357E8A5AE9492D
            11E34A5293BC9DD8514514C41451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            1451450014514500145145001451450014514500145145001451450014514500
            14514500145145001451450014514500725E2AF0358789079CA45B5F0E932AE7
            77B30EF5E7F79F0AF5F8326DDADAE40E815F693F98C7EB5ED94561530F4E6EED
            1E8E1B35C4E1E3CB1775E67CE977E13D7EC89F3B49BA18EA51378FCD73593243
            2C2FB258DD187665C1AFA87AD4535AC13AED9A14914F66504560F04BA33D3A7C
            4735F1C3EE67CC1457D173F84B40B8C99348B4C9EEB1053FA5664DF0DFC31292
            458B464FF7267FF1AC9E0A5D19D90E22A0FE28B4783D15ED137C27D0A4E639EF
            22FF0076407F98AAAFF0874E3F7351B95FF7829FE952F0950DE39F611EEDFDC7
            90D15EACDF07A227E5D61C7D6007FAD467E0E8EDAD91FF006EDFFD954FD56AF6
            34FEDBC17F37E0FF00C8F2DA2BD4C7C1D1DF5B27E96DFF00D9548BF07E007E7D
            5E423D04207F5A3EAB57B07F6DE0BF9BF07FE4794515EBE9F0874D1F7F51BB3F
            4DA3FA55B87E14E811FF00AC92F25FF7A403F90154B0750CE59F6116D77F23C5
            68AF7A87E1CF8621C1FECE2E7D5E573FD6B4EDFC2DA15AE0C5A4D9A91DFCA04F
            E66A960A5D59CF3E22A2BE1837F71F3BC36D3DC3EC8219256F4452C6B62D3C1B
            E22BDC793A4DC807BC8BE58FFC7B15F41C704512858E34403B28C0A9318AD560
            A2B767254E23A8FE0825EBAFF91E2F65F0A35B9C83753DB5B2FA64BB7E9C7EB5
            D2587C24D361C35EDECF707BAA011A9FE67F5AF44A2B68E1A9AE879F5739C654
            FB56F430F4FF0008E83A6156B6D3200E3A3BAEF6FCCE4D6D8000C00052E28C56
            CA296C79D3A93A8EF377168A28AA2028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
            A28A0028A28A0028A28A0028A28A0028A28A0028A334C69510659D40F73400FA
            2A359A27FB92A37D1B34FC8F5A005A28A2800A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28
            A2800A28A2800A28A2800A28A2800A28A2800A298D2220CB3AA8F73424B1C83E
            4911BFDD6CD003E8A33450014514500145145001451450014514500145145001
            4514500145145001451450014514500145145001451450073DE37BFD534BF076
            A17BA3233EA112A988245E61FBEA0FCBDF8CD7838F8DBE35B67293FD8CBAF056
            4B6DA7F422BE99ACFD4744D2B574D9A8E9D6B763A7EFE157C7E62819F3F2FC7C
            F15A8E6CF496FAC327FF00174F1F1FFC51DF4ED20FD2293FF8BAF44D7BE09F85
            B5485DAC22974CB923E5685CB267DD5B3C7D315F365EDA49617D71673604B04A
            D13E3FBCA70690CF513FB40789BB69BA4FFDFB93FF008BA69F8FFE29EDA7E91F
            F7EA4FFE395E535EEDE17F821A1EABE1FD3753BED43502F776D1CE6388A285DC
            A1B1CA9F5A01D8E74FC7DF159FF972D207FDB193FF008BA69F8F7E2C3FF2EDA5
            8FFB62FF00FC5D7A547F03FC1A806E86F24FF7AE0FF4C5327F81BE0E954844BE
            873DD2E338FF00BE81A05A1E729F1F3C56A7E6B4D29C7BC2FF00FC5D6BD87ED0
            978ACA350D0A0917B9B798A11F8106A5D6BF67E6589E4D1358DEE3EEC37698CF
            FC0D7FF89AF21D6F41D4FC3BA83D86AB6725B5C2F386E8C3D54F423DC503D0FA
            63C37F16BC2DE229120174D6374C7021BC01327D9BEEFEB9AEEFA8AF86EBD7BE
            14FC50B8D3AF20D035BB832584A4476F3C872606ECA4FF0074FE9F4A0563E86A
            F3EF8A9E21F11787748B2B9F0FA3B3B4AC272B6FE680BB78CF1C735E83494C47
            CCABF1BFC6719C3C966C7FDAB7FF00035613E3D78B54736FA5BFFBD0BFF47AF7
            DD4BC35A1EB00FF68E9367744FF1C90A96FF00BEBA8AF2DF887F08B40B2F0DDF
            6B1A34735A4F691F9A610E5E3751D7EF64838F7A43B9CC0F8FDE2AFF009F0D20
            FF00DB193FF8E5387C7FF13F7D3B493FF6CE4FFE2EBCA2AF689651EA5AF69D61
            29611DCDCC70B14FBC0330071F9D03B1E927E3FF0089FB69DA48FAC727FF0017
            4C3F1F7C547A596903E90C9FFC5D777FF0A07C2BFF003FDABFFDFE8FFF008DD1
            FF000A07C2BFF3FDABFF00DFE8FF00F88A05A1C01F8F5E2D3D2DF4B1F481BFF8
            BA61F8EBE2F3D174E1F480FF00F155E85FF0A07C2BFF003FDABFFDFE8FFF0088
            A3FE140F857FE7FB57FF00BFD1FF00F11406879C9F8E5E313D24B21F4B7FFEBD
            467E3778CCFF00CBCDA0FA5BAD7A33FC00F0D1FB9A96AABF578CFF00EC95CA78
            BBE06CFA46953EA3A2DFBDE8814BBDB4B1E1CA8EA548EA7DB140F4304FC6AF1B
            1FF97FB71F4B64FF000AFA4F45BA7BED0B4FBB94E649EDA3958818C96504FF00
            3AF8AABEC8F06BF9BE08D05FD74FB727FEFDAD084D1B95E63F163C53E28F0CB6
            9B26808FE43AC86E1FECDE628236EDC9C71D4D7A7525311F3227C70F19A7DE96
            CDBFDEB71FD2AC27C79F16AF5874C7FF007A06FE8D5EFBA8F86342D5C1FED0D2
            2CAE58FF001C90296FFBEBAD7907C4FF0084FA368DE1EB9D7B4532DB1B72A64B
            6672E8CACC17E5CF20F3EB486628F8FBE2A1D6C7483FF6C64FFE39520F8FFE26
            1D74DD24FD2393FF008BAF27AD9F0A6889E23F13D869124CD0A5D49B0C8AB92B
            C13D3F0A0763BE3F1FFC4FDB4ED27FEFDC9FFC5D35BE3EF8A8F4B1D207FDB193
            FF008E575F17ECFBA20FF5DAC5FBFF00B8A8BFD0D5D8BE0278513EFDD6AB21FF
            006A641FC92816879EBFC77F173748B4D5FA40DFFC553A2F8F5E2C8FEFDB6972
            FF00BD0B8FE4F5DDDD7C01F0D4887ECFA86A70BF62CE8EA3F0DA3F9D709E25F8
            1DAF69113DC6953A6AB028C9445F2E51FF0001C9CFE073ED40F43A0D2BF6843B
            D5757D0C6DFE292D25E47FC05BFF008AAF52F0D78D741F16425B4ABE5795465E
            07F9644FAA9FE6322BE3E7478E464752AEA70CA4608353595EDD69D7915E59CF
            24171136E49236C1534058FB728AE07E18F8FD7C69A43457655355B4004EA381
            20ECE07F3F43F515DF532428A28A0028A28A002ABDE5EDAE9F6AF75797115BC1
            18CBC92B0555FC4D725E3BF88DA5F82ADFCB900BAD4A45CC56A8D823FDA73FC2
            3F535F37789FC63ADF8B6F0CFAA5DB3A0398EDD3E58E3FF757FAF5A571D8F6DF
            11FC76D134E668746B693539471E69263887E2464FE5F8D79AEADF19FC63A93B
            79379158447F82DA21FF00A1364FEB5CA681E1AD5FC4F7C2D349B292E24FE361
            C220F566E82BD9FC3DF00ACA14597C41A84971263FD45AFC883EAC793FA503D0
            F17BCF136BDA831377ACEA13E7B4970EC3F2CD661676392589F535F5DE9FF0F3
            C23A62A8B7F0FD892BD1A68FCD6FCDF26B6A3D234D887EEF4FB44FF76151FD28
            B0AE8F8A72DEF572DF57D4ACF1F66D42EE1C74F2E665FE46BEC59F40D1AE94AD
            C69363283DA4B746FE62B9ED4FE15783354077E8B15BB9E8F6A4C58FC178FD28
            B05CF9F34FF89FE33D3B1E56BD73201DAE312E7FEFA06BA9D3FE3E7892DF0B79
            656176BEA15918FE20E3F4AD4F10FC019A2479BC3DA979D8E45BDD8DADF838E3
            F303EB5E43AAE91A86897EF63A95A4B6B729D639171F88F51EE2819EE561FB41
            E992606A3A25DC1EA609565FE7B6BD2FC33E26D3FC59A48D4B4C321B7DE633E6
            A6D2186323F5AF8D6BE98F8178FF008579EFF6C93F92D0268F4CA28A298828A2
            8A0028A28A0028A28A002BC4BE3CF8AA48058F87ACE76473FE937051B071C845
            FF00D08FE55ECF7571159DA4D753B848614323B9E8AA0649AF8E3C51AECDE24F
            135FEAD3641B894B229FE14E8ABF8281498D1EABF01FC5329D42FB40BC9DDFCE
            1F68B7DED9F9870C3F1183FF000135EF15F177877599BC3FE21B0D560CEFB599
            5F03F897F897F1191F8D7D9367750DF5941776EE1E19E3592361FC4AC320D081
            9628A28A620A28A2800A28A2803C37E20FC44F19F863C617F6D66A134C429E43
            CB6B953945270DDF9CD73B1FC78F1747C341A649FEFC0DFD1857D24CAAEA5580
            208E4115897FE0DF0D6A609BCD0AC2463D5FC850DFF7D019A43B9E1EBF1FFC4F
            FC5A76927E91C9FF00C5D35BE3F78A8FDDB1D217FED949FF00C72BA9F1DFC1BD
            0ADFC3F7FAA68626B4B8B589A7F24B978DD5465873C838E9CD780D03563D226F
            8E3E3297EE4B650FFB96FF00E24D7D07E16D722F127866C3568B1FE91102EA3F
            85C70CBF83022BE34AF72F805E23FF008FFF000E4EFF00F4F56E09FA071FFA09
            FCE8068F72A28A299214514500145145001451450015E55F173E21EA1E119F4E
            B0D1E5892F250D34C5D03613A28C1F53BBFEF9AF537758D19DC85551924F402B
            E3FF001CF884F89FC63A86A618985E4D9067B46BC2FE833F8D21A47570FC76F1
            7C5F7D34E97FDF81BFA30AB4BF1FFC4E07CDA76924FB4727FF00175E515BBE0E
            F0EBF8AFC5563A3AC86259D8F99201CAA282CC7EB8140EC76CFF001F3C56E3E5
            B3D253E90C9FD5E9B69F183C79AA5E24166B13BB30F92DECF79C7EB5EBDA4FC2
            8F06E90ABB7488EEA45EB25D9F34B7E07E5FD2BAEB6B3B5B288456B6F14118E8
            912051F90A044C3A52D145310514550D5B57B1D0F4D9B50D46E120B584659D8F
            E83D4FB5005FED5C078A7E2EF86BC36D2411CC751BD5E0C36C72AA7FDA7E83F0
            C9F6AF20F1DFC5AD53C5124965A734961A574D8AD89261FED91DBFD91FAD70FA
            4E8FA86BBA94761A6DAC9737321F95107EA4F61EE690D23D035AF8E5E29D4199
            74F16DA645DBCB4F31FF00166E3F202B8ABEF16F88B53666BCD6F509B3FC2676
            C7E59C57B2F857E03D8DBC4971E25B96BA98F3F66B762B1AFB16EADF863F1AF4
            FD33C31A168AAA34ED22CED8AFF1470AEE3F56EA6803E3B16B7D3832082E241D
            DB631A84F9B13F3BD187E06BEE0C0F41556F34DB0D423F2EF6CADEE53FBB344A
            E3F5A2C173E3DB1F14EBFA6B06B3D66FE0C764B8603F2CE2BB4D13E3878A74D6
            54BF36FA9C39E44A9B1F1ECCBFD41AF51F11FC16F0C6B31BBD846DA5DD1E43C1
            CC79F743C7E58AF09F17F8175AF065E797A843BED9CE22BA8866393F1EC7D8D0
            33E82F09FC58F0E78A5D2D8CAD617CDC082E48018FA2B743FA1F6AEF2BE1BAF5
            8F875F17EEF45961D2BC432BDCE99F712E1BE6920F4CFF00797F51DBD28B89A3
            E8CA2A28278AEADE39E0912586450E8E872194F420D4B4C467EB73DD5B683A84
            F64A4DDC76D23C2157712E1495E3BF38E2BE7A6F8CFE39D3E5F2AF22B6120EA9
            3DA943F96457D2B505C5A5B5E47E55CDBC53467F86440C3F5A00F9E13E3F78A0
            7DED3F496FFB6520FF00D9E9AFF1F7C52C30B63A4AFB88A427FF0043AF64D43E
            1A783B5307CFD06D518FF15B8311FF00C7715E33F14FE1859F83ECA0D574AB89
            5ACE597C97866219918824107D3E53D690CAB2FC71F1949F725B28BFDCB7FF00
            126BD7BE197C418FC69A4982ED91357B51FBF41C798BD9D47F3F43F515F2CD68
            E87ADDF787B58B7D534F97CBB881B70F461DD4FA83D281D8FB4E8AE7FC21E2AB
            1F17E8116A76676B1F967849C98A4EEA7FA1EE2BA0A6485145140056178C6F75
            1D3BC25A8DE690ACD7F147BA10B1EF24E47F0F7E335BB45007CCDFF0BAFC6D6B
            218E736BBD4E0ACB6BB48FE553A7C7CF1628E6D34A7FF7A17FE8F5F42DF693A7
            6A91ECBFB0B5BA4E9B67895C7EA2BCF7C63F083C377DA35E5CE976834FBF8A26
            9233093B18819DA57A60FB5219C08F8FFE26C73A76939FFAE727FF00174D6F8F
            BE2A3D2C7485FF00B6527FF1CAF2AAF5BF84BF0D34CF14E9B71AC6B42596DD26
            F261811F606C0058B11CF7038C77A065093E3A78C24FBA34F8FF00DDB73FD58D
            7A37C28F1778A3C51777EFAEAB7D91225681C5BF96A5B3CE1B1CD76DA6783FC3
            BA3053A7E8B6503AF490440BFF00DF479ADBC502168A28A620AF8E7C6CA13C77
            AF85181FDA33FF00E86D5F6357C75E39FF0091F75FFF00B084FF00FA19A4C68C
            0AFB23C1ABB7C11A02FA69D6E3FF0021AD7C6F5F66F85976F847465F4B1807FE
            38B42066BD14514C415CDF8D3C1F63E32D065B1BA455B8505ADAE31F344FEBF4
            F515D251401F11DF594FA75FDC595D46639EDE468A443D981C1AAFDEBD13E366
            9A961F1167950605E411DC11EFCA9FFD033F8D79DD4948FAD3E18F881FC47E03
            D3EEA672F730836F3313C964E327DCAED3F8D7615E3BFB3E4ECDE1ED5EDC9F95
            2E95C0F765C7FECA2BD8AA890AC3F19A799E07D7D7D74EB8FF00D16D5B9591E2
            A19F086B5FF5E13FFE8B6A00F8CAB6FC1ABBFC71A0AFAEA36E3FF222D625741E
            055DDE3ED007FD44213FF8F8A92CFB128A28AA2028A28A002908C8C1A5A2803E
            44F889E1E1E19F1BEA1611AEDB767F3A0F4F2DB903F0E57F0AFA43E1A5CFDABE
            1CE8726738B611FF00DF24AFF4AE3BE32780B54F13CFA6EA1A2D9FDA6EA25686
            750EAA767553F311D0EEFCEBABF861A56A7A1F812CB4CD5AD8DBDD40F20F2CB2
            B7CA5CB0E5491DE90CEC68A28A620AE43E282EEF86BAE0FF00A600FF00E3CB5D
            7D729F12C67E1C6BBFF5EC7F98A00F91ABAFF85A33F12B44FF00AEC7FF00416A
            E42BB2F85433F13344FF00AEADFF00A0354947D65451455121451450078B7C6C
            F02432D8BF8A74E842DC4440BC541C3AF40FF51C67DBE95E095F6B6AF611EA9A
            3DED84A331DCC0F137D1948FEB5F1511862293291D3FC3CD7A4F0EF8E34CBC0F
            B617944138EC637383F9707F0AFAF2BE1C524302320835F6E59CA67B1B799BAB
            C6AC7F11421327A28A29882B84F895F1060F0569622B7DB2EAD72A7C888F2107
            F7DBDBD3D4FE35D4EBDAD5AF87B43BBD56F5B105B465C8CF2C7B28F72703F1AF
            903C43AEDEF8975CB9D56FDF74D3B671D917B28F60295C68A97B7B73A8DECD79
            793C93DC4CDBA4924392C6BA7F00780EF7C6FAB7969BA1D3A120DCDCE3EE8FEE
            AFAB1FD2B9ED1B49BAD7358B5D32C937DC5CC8114761EE7D80E7F0AFAF7C31E1
            CB2F0B6836FA558AFC910CBB91CCAFDD8FB9A06C9743D074DF0E6991E9FA5DB2
            C16E83903AB1FEF31EE6B528A2992145145001451450015CAF8EBC1765E33D0A
            4B595116F6352D6B718E637F4CFF0074F715D551401F105CDBCB677535B4E852
            685CA3A1EAAC0E08AFA3FE03B6EF87F28FEEDF483FF1D4AF35F8DBA00D27C6E6
            FA24DB06A5189B8E9E60F95FFA1FF8157A0FC009777832FE227EE5FB1FCE34FF
            000A453D8F59A28A29921451450014514500145145007977C6FF0012FF006478
            4974A85F173A9B6C6C75112F2DF9FCA3F135F365763F13FC4BFF0009378E2F27
            8DF75A5B9FB35BFA6D5EADF8B64FE22BA9F0A7C37FED7F84DAB6A6F0E750B83E
            6D971CED8B3C0FF7BE61F95228F25AFA4FE07F88FF00B57C20DA5CCF9B8D35F6
            0C9E4C4D92BF91DC3F015F36576FF0A3C47FF08EF8EACDA57DB6B79FE8B367A0
            DDF74FE0DB7F0CD00CFAB68A28A6485145140051451400514514019BE2150FE1
            AD550F46B4947FE386BE2E3D4D7DA7AE0CE81A8FFD7AC9FF00A09AF8B3F8A931
            A06564628CA5594E083D456A786F5C9FC39E22B1D5ADF3BEDA50C547F12F465F
            C4645761F15FC2DFD9579A76B76E98B5D4ED919F03859828DDF98C1FAE6BCEA9
            0CFB72C6F60D46C2DEF6D9C3C1711ACB1B0EEA464558AF21F813E28FB7E853E8
            1712667B13E64209E4C4C7A7E0DFFA10AF5EAA2428A28A0028A28A0028A28A00
            F3DF8C3E271E1FF054D6D0BEDBCD4B36F181D427F1B7E5C7FC0857CBC1598310
            A48519623B0AEDFE2AF8A7FE127F1A5C342FBACACFFD1ADF1D0E0FCCDF8B67F0
            C56869BE15FB0FC16D73C45731E27BD686283239112CCB93FF000261FF008E8A
            4523CDEBD23E07A86F88D193FC36B29FE55E6F5E97F02C67E21E7D2CE4FE6B40
            1F4CD14514C90A28A2802AEA17D6DA6584F7D7932C36F021791D8F000AF957E2
            078F6F3C6DAB97F9E1D361245B5BE7A0FEF37FB47F4E95D9FC71F1A35DEA0BE1
            8B197FD1EDC87BB2A7EFC9D42FD17AFD4FB578E522922FE8BA3DE6BFABDB6976
            11F997370FB54761EA4FB01CD7D5BE0AF0569DE0BD1D2D6D5164BA700DCDC95F
            9A56FE8BE82B86F817E144B2D1A5F11DCC5FE91784C76E48FBB103C91FEF30FF
            00C747AD7B0D02614514531051451400552D534BB3D6B4D9F4FD42DD27B69D76
            BA37F9E0FBD5DA2803E47F881E09B9F04EBED6A77C963365ED6723EF2FF74FFB
            43BFE07BD7275F5DF8FF00C291F8BFC2973618517483CDB573FC320E9F81E9F8
            D7C8D246F0CAF148A55D18AB29EA08A4523D7BE0D7C417D3AFA3F0CEA9366CA7
            6C5A3B9FF5521FE1FF0075BF9FD6BE84AF8715991D5D09565390476AFADBE1CF
            89CF8AFC19697D2B03771FEE2E7FEBA2F7FC461BF1A109A3ADA28A29882BCD7E
            39461FE1D3B1FE0BA8987EA3FAD7A5579D7C6D19F86D727D2E22FF00D0A803E6
            0A2B7BC136B05EF8DB47B5BA8965B79AE92392361C3293822B5BE23F80EE3C15
            AD11187934BB824DACC7B7FB0DFED0FD47E3525157C05E34BAF056BE9771EE92
            CE5C25D400FDF5F51FED0EDFFD7AFABF4DD42D755D3ADEFECA659ADA740F1BAF
            422BE26AF4EF84BF10CF867511A3EA737FC4A6E9FE5763C5BC87F8BFDD3DFF00
            3F5A77068FA5A8A40C18020820F4229699214514500151CC8248648C8E194835
            2521E87E9401F0EB7DE35F4FFC135DBF0D6D0E3EF4F29FFC7ABE64BA5D977327
            F75D87EB5F4FFC1718F865A79F59263FF910D24533D028A28A6485145140057C
            77E3AFF91F7C41FF006109BFF4335F6257C77E3AFF0091FB5FFF00AFF9BFF433
            498D1CF8EBF8D7DA5E1E1B7C35A50F4B48BFF4015F170EA2BED3D0863C3FA68F
            FA758FFF00411420668514514C41451484E2803E71F8FB22B78E2C90754D3D32
            7FEDA495E555D67C49D793C47E3CD4AF617DD6C8E20848E85506DC8FA9C9FC6B
            94556760AA0966380077A96523E86FD9FED1A3F0AEA57446166BCD8BEFB507FF
            00155EBB5CD780BC3E7C33E0AD374D91713AC7E64FFF005D1BE661F8671F8574
            A6A8961593E28FF914B59FFAF19BFF004035AD595E26E7C2BABFFD794DFF00A0
            1A00F8C2BA5F87ABBBE216823FE9F633FAD7355D4FC3819F88BA17FD7D2D4947
            D77451455121451450065788F5DB7F0D787EF358BA5678AD903145EAC490001F
            891583E04F88569E3B6BFF00B2D8CF6DF63F2F719581DDBF76318FF74D735F1E
            F55FB2F842D34D56C3DEDC8247AA20C9FF00C78AD667ECF3162C35D9BFBD2C2B
            F906FF001A571D8F6BA28A298828A28A002B96F89033F0EB5DFF00AF56AEA6B9
            7F88A33F0F35DFFAF47A00F90EBB4F84C33F13B45FF7E4FF00D16D5C5D76DF08
            867E2868C3FDA97FF453D4A28FABA8A28AA2428A28A0086E665B7B59667202C6
            8CC49F402BE23762F2331EA4E6BEA6F8B3E258FC3DE07BB895C0BCBF536D02E7
            9C30F9CFE0B9E7D48AF95E93291359DB3DE5F5BDAC43324D22C683DC9C0AFB6A
            18C450C71AF4450A3F0AF997E0CF861F5CF19C5A84887EC7A662666C7064FE05
            FCFE6FF80D7D3D42130A28A0D311E0FF001F3C4A5EE6CBC3703FC918FB4DC63B
            B1C841F80C9FC45789D6E78CB586D7BC61AAEA45B72CD70DE59FF607CABFF8E8
            158752CA3DB7E00F871649EFFC453A03E57FA35B93D988CB9FCB68FC4D7BBD72
            1F0C74B1A47C3BD1E1DB87961170FEE5FE6FE440FC2BAFAA25B0A28A2800A28A
            2800A28A2800A28A2803CFFE2C782AF3C65A159A69AB1B5F5ACFB97CC6DA3630
            C30CFD42FE550FC24F086B1E0FD3351B6D5D22469E65923F2E4DDDB07FA57A35
            1400514514005145140051451400571BF13BC4BFF08C7822F2E237DB77703ECD
            6FEBB9BA9FC1727F0AECABE6BF8E1E25FED6F16A6930BE6DB4D5D8D8E8656E5B
            F2F947E0681A479F68BA54FAE6B767A65B0CCD752AC60FA64F27E83AD7D95A6E
            9F0695A65B69F6C9B60B6896241EC062BC2FE02786BED3AA5E788A74CC76ABE4
            4048FF00968C3E63F82F1FF02AF7FA4819F26FC4FF000DFF00C233E38BD8234D
            B6B727ED36F8E9B5BA8FC1B70FC2B8D070723AD7D23F1CBC37FDABE148F57853
            371A6BEE6C7531370DF91DA7F3AF9BA81A67D73F0EBC4A3C53E0BB2BE77DD751
            AF9173EBE62F527EA30DF8D7566BE71F817E25FECDF13CBA2CEF8B7D45731827
            812AF23F3191F957D1D4C9614514500145145001451450067EBA71E1ED48FA5A
            CBFF00A09AF8B3F8ABED1F109C786B543FF4E92FFE806BE2DEFF008D26347D5D
            AF78693C5DF0C21D3801F6836714B6CC7F86554057F3E9F426BE5392378A568E
            452AEA4AB291820D7D9DE1B3BBC2FA49F5B387FF004015F3DFC6AF0AFF006278
            B3FB4EDE3C59EA799781C2CA3EF8FC786FC4D008E4FC13E2393C2BE2CB1D5549
            F291F64EA3F8A36E187E5CFD40AFB0229527852689C3C6EA19197A107A1AF87E
            BE97F829E28FEDAF097F664F266EB4C223E4F2D11FB87F0E57F0142068F4DA28
            A298828A28A002B89F8A5E29FF00845FC177324526DBDBBFF47B7C1E4161CB7E
            033F8E2BB6AF977E30F8A7FE121F19496B049BACB4ECC11E3A33FF001B7E7C7F
            C0450348E53C33A14FE26F12596936F90D71205661FC0BD59BF01935F447C56B
            2834EF8417B656C8120B75B78E351D9448805739F01BC2BF67D3EE7C4B731FEF
            2E4982D723A203F337E2C31FF013EB5D67C64FF925FAAFFBD0FF00E8D5A40CF9
            5EBD3BE040CFC4093DAC64FF00D096BCC6BD47E028CF8FAE3DAC243FF8FA5036
            7D27451453242B2BC49ACC7E1EF0DEA1AB480116B0B3AA9FE26FE11F89C0AD5A
            F26F8F9AA9B5F08D9E9C8F86BDB9CB0FEF220C91FF007D15A011F3D5DDD4D7D7
            93DDDC399279A4692473D5989C934EB1B39750D42DACA0199AE2558907AB31C0
            FE755EBB6F84BA70D47E24E94AE3290B34E7FE02A4AFFE3DB6A4A3EA2D2B4F87
            49D26D34F807EEADA15893E8A315728A2A890A28A2800A28A2800A28A2800AF9
            6FE31E809A278FAE258576C1A820BA503A062487FF00C7813FF02AFA92BC67F6
            83D395F46D23530BF3C53B404FB32EEFFD93F5A434780D7B0FC00D68DBEBBA8E
            8EEDF25D4226407FBE879FCC37FE3B5E3D5D77C30BE6D3FE2468B2838124FE49
            F7DEA57FAD25B8CFADA8A28AA242BCEFE35FFC934BBCFF00CF78BFF42AF44AF3
            AF8DA71F0DAE47ADC45FFA15007817808E3E20681FF5FD17FE842BEADF10E816
            3E26D167D2F518B7C128E08EA8DD997D08AF943C0A71E3ED03FEBFE1FF00D0C5
            7D886921B3E37F16785EFBC23AECDA65F2E76FCD14A07CB2A7661FE78AC3AFAE
            7C79E0AB4F1AE84D692ED8EF22CBDADC6398DBD0FF00B27BFF00F5ABE51D4F4C
            BCD1F529F4FBF85A1B981F63A3763FE1EF40D33DB3E0E7C47F3D22F0BEB13FEF
            546DB19DCFDE1FF3CC9F5FEEFE5E95EDB5F0EC723C522C91B15753B9594E0835
            F4DFC2BF8889E2DD3069FA84806B16ABF3E78F3D3FBE3DFD7F3EF409A3D1E8A2
            8A620A43D0D2D21A00F89B521B754BB5F499C7FE3C6BE9EF83631F0BF4A3EAD3
            1FFC8AF5F32EB236EB97E3D2E241FF008F1AFA73E0F0FF008B5BA3FF00DB6FFD
            1CF4914CEEA8A28A6485145140057C79E3CFF91FB5FF00FAFF009BFF004335F6
            1D7C79E3BFF91FB5FF00FAFF009BFF00433498D1CF8FBD5F6AE8C31A1D80FF00
            A778FF00F4115F14D7A5E95F1C3C53A6C31412C76377146A14799115381EEA47
            F2A06CFA668AF0687F687B951FBFF0E44FFEE5D95FFD94D32E3F685BE6522DB4
            0B78CF6325C33FF2028B8AC7BE578E7C56F8A56F65633F87F42B8596F25063B9
            B88CE5615EEAA7FBDDBDBEBD3CC7C45F14FC57E238DE09EF85B5B3F0D05A2F96
            08F427EF1FA135CAD8E9F79A9DD2DB58DACD733B7DD8E242C4FE0280B15ABD7B
            E0DFC3D9352BF8BC4BA9C256C6DDB36B1B8FF5D20FE2FF00757F9FD0D5FF0003
            7C1094CB1EA1E2AC2229DCB608D92DFF005D187F21F9D7B9430C76F0A430C6B1
            C48A1511460281D00140364B45145310565F8939F0BEADFF005E737FE806B52B
            33C45FF22C6ABFF5E737FE806803E2EADDF06EAD6DA178BF4CD52F0486DEDA6D
            EFE58C9C63B0AC2AD0D0F489F5ED6ED34AB678D26BA90468D212141F7C035259
            F437FC2F7F08FF00CF3D47FEFC2FFF001547FC2F7F08FF00CF3D47FEFC2FFF00
            155C07FC280F13FF00D04749FF00BF927FF1147FC280F13FFD04749FFBF927FF
            00114C9D0EF8FC77F0881C45A91FA40BFF00C55579FE3F786117F7361AA48DE8
            63451FFA1D7127E0078A31C6A3A47FDFD93FF88A865F80DE2C45256E34B90FA2
            CEFF00D50501A1CB78EBC6B77E37D6C5ECF1082DE25D96F006DDB17BE4F727FC
            2BD6FF0067C5C7873567F5BB51FF008E0FF1AF10D7FC3BAA786752361AB5AB5B
            CF8DCB9390CBFDE523822BDC7F67D6CF863545F4BC07FF001C140D9EBF451453
            2428A28A002B9AF88433F0FB5EFF00AF293F9574B5CDF8FF00FE49FEBDFF005E
            32FF00E826803E3FAEE7E0F8CFC52D1BFEDB7FE897AE1AAC595EDE69F7697561
            7335B5CC79D92C0E51D78C1C11ED5251F6E515F22C1F11FC656E309E20BE3FF5
            D1F7FF00E859A9DBE2A78D9D769D7A703D9101FF00D069DC563EB2E95C978ABE
            23787BC270482EAF127BC030B690306909F7FEEFE35F335FF8D3C4DA9A14BCD7
            7509633D53CF60A7F01C541A0F86B57F145E35AE9168D75328DCE03050A3D492
            68B858B1E2EF16EA3E31D69F51BF6DAA3E586053F2C49E83FA9EF51F863C2BAA
            78B7564B0D3212C7AC929FB912FF00798FF9CD7A97873E014EEC93F88B5158D3
            A9B6B4E58FB173C0FC01FAD7B2E8BA0E99E1EB05B1D2ACE3B681792AA3963EA4
            F527DCD03B957C27E17B1F08E830E976433B7E6965239964EEC7FCF415BB4514
            C90AC9F12DE1D3BC2FAB5E06DAD059CB2291EA10915AD5CA7C4993CBF873AEB7
            FD3B11F9902803E4634AA373003924D254F678FB6C1BBA798B9FCEA4B3ED5B1B
            65B3D3EDAD94616189631F80C558A41D052D510145145001451450014515C97C
            44D535DD1FC2AD79E1E86496F566505520F34ECE7276FE5401D6D15F323FC69F
            1BDBC8D1CD25B2BAF557B5008A72FC73F182F5360DF5B7FF00EBD2B8EC7D3345
            7CD4BF1E3C5A3AC3A637D606FF00E2A95BE3CF8B5BA41A5AFD206FFE2A8B858F
            A528AF995BE39F8C5BA358AFD2DFFF00AF5D4F803E20F8DFC4BE2AB182EE1326
            96ECDE7C91DA61146D38CB638E714058F71A28A298828A28A00C7F146B90F86F
            C357FABCD8C5BC45914FF13F455FC588AF8EA69AE351BF92690B4B737129663D
            4B331FF135ECDF1F3C4DBE7B2F0DDBBF09FE93738F5E88BF964FE22B93F83BE1
            BFEDEF1C43732A6EB5D387DA24CF42DFC03FEFAE7FE0269148FA0BC11E1E5F0B
            F8434FD2F03CD48F7CE47791B96FD78FA015D0D145324AF79690DFD94F697281
            E09E368E443FC4A4608AF8DFC47A2CDE1DF115FE93383BEDA52809FE25FE16FC
            460FE35F6857847C7DF0DEC9EC7C470270E3ECD7047A8E50FE5B87E02931A3C6
            6CAF26D3EFA0BCB67293C122CB1B0ECCA722BEC8F0E6B50788BC3D63AB5BE365
            CC41CA8FE16E8CBF81C8FC2BE30AF73F807E26CA5EF86E77E9FE936D9FC9D7FF
            00413FF7D50367B8D14514C90A28A2800A28A28032FC4871E16D58FF00D39CDF
            FA01AF8BFBD7D9DE2838F096B27FE9C66FFD00D7C63DFF001A4C68FB37C2CDBB
            C23A31F5B183FF00401595F113C303C59E0EBBB1450D7718F3ED4FFD345E83F1
            195FC6B4BC2077782F423EBA7DBFFE8B5ADA34C47C38CA518AB02083820F6AEB
            3E1B789FFE115F1A59DDC8FB6D263E45CFA6C6EFF81C1FC2B63E327857FE11FF
            00183DEC11EDB2D4B3326070B27F1AFE673FF02AF3AA928FB8C1C8C8E94B5C0F
            C24F147FC249E0A82399F75EE9F8B69B2792A07C8DF8AF1F5535DF5512145145
            00729F113C4E3C29E0EBCBE470B7720F22D467FE5A3743F80CB7E15F2BE87A4D
            CF8875EB3D32DF2D3DDCA1371E71EAC7E8327F0AEF3E3678A7FB6BC5834AB793
            369A60319C1E1A53F7CFE1C2FE06BA3F809E17CB5DF89AE13A66DED723FEFB6F
            E43FEFAA456C7B4697A75BE91A5DAE9D68BB6DEDA358907B018FCEB8FF008C9F
            F24BF55FF7A1FF00D1AB5DE5707F193FE497EABFEF43FF00A3569927CAF5EA5F
            013FE47DB9FF00B07C9FFA1A5796D7A8FC05FF0091FAE3FEBC24FF00D0D29147
            D27451453242BE7DFDA0EE8BF88348B3ED15AB4BFF007D363FF64AFA0ABE6FF8
            FA49F1E5A03D069D1E3FEFE494868F2BAF54F80702C9E39BB95867CAB072BF52
            E83F966BCAEBD73F67E23FE12DD4C77FB0FF00ECEB40D9F44514514C90A28A28
            00A28A2800A28A2800AF3AF8DB6EB37C37B9908E61B88A41F5DDB7FF0066AF45
            AE17E31007E176AF9EDE4E3FEFEA5007CAB5AFE1690C3E2ED16507052FA16CFF
            00C0D6B22B53C329E678AB484FEF5EC23FF1F15259F68514515440579C7C7038
            F87130F5B98BF9D7A3D79B7C7238F874FEF7517F5A00F03F039C78F3C3FF00F6
            1183FF00435AFB16BE38F051C78EBC3FFF00612B7FFD18B5F63D243615E6FF00
            153E1DA78B74D3A869F181AC5AA7C98E3CF4FEE1F7F4FCBBF1E9145311F0EC91
            BC523472214753B59586083E956B4BD4EF346D4EDF51B099A1B981B7A38FF3D3
            DABDB3E31FC37FB424BE28D1E1FDF28DD7D020FBC3FE7A01EBEBF9FAD783D494
            7D77E05F1A5A78D7415BC876C7771E12EADF3CC6FF00FC49EC7FC2BA9AF8E7C2
            3E2ABEF07EBD0EA564D903E59A127E5953BA9FF1EC6BEB3D035DB1F1268D6FAA
            69D2F9904CB9C7746EEADE8453B899A741E94514C47C59AF8DBE23D507A5DCA3
            FF001F35F4DFC2018F85BA37D26FFD1CF5F3478986DF156B0BE97B30FF00C7CD
            7D33F08C63E17E8DFEECBFFA35E914CEDA8A28A6485145140057C77E3A39F1EF
            883FEC2137FE866BEC4AF8EBC6E73E3CF107FD8467FF00D0DA931A3047515F57
            8F86DE0FD4B4FB76B9D02D43B44A4B420C4738FF00608AF93C7515F6DD871A7D
            B7FD725FE5421B3CF67F819E0F94928B7F0E7B473F4FFBE81AACBF00FC281B26
            F35661E8668FFF0088AF54A299270161F06BC1564C19F4E92E987433CEC7F404
            0AEC74ED234ED220F274EB1B6B48FBAC1104CFD71D6AF5140051451400514514
            00565F893FE457D5BFEBCE6FFD00D6A565789BFE455D5FFEBCA6FF00D00D007C
            615D47C3838F889A17FD7D2D72F5D37C3B38F887A0FF00D7E27F3A928FAFA8A2
            8AA2428A28A00F20F8FF00A509FC37A76A8AB97B5B83131F4575FF00151F9D57
            FD9EA5CE91AD45FDD9E36FCD4FF857A078FF00419BC4BE09D474BB540F732A2B
            420903E7560C393F4C7E35C9FC1DF076BBE11FED85D6AD5605B9F24C5B6557CE
            DDF9FBA7DC52EA3E87A9D14514C41451450015CD7C4138F87DAF1FFA7293F957
            4B5CC7C4438F879AF7FD79BD007C855DC7C2038F8A3A367FE9B0FF00C82F5C3D
            76BF094EDF89FA29FF006A41FF00909EA56E51F50CFA469B747371A7DA4A4FFC
            F4855BF98AE63C5FF0E345F1168171696BA7D9D95EE37C1710C2A8438E81881C
            A9E86BB5A2A893E23BEB1B9D36FE7B2BC85A2B881CA491B75522AEF86FC437DE
            17D72DF55B07C4B0B7CC87A48BDD5BD8D7B87C67F007F6AD9378934D8737B6C9
            FE951A8E658C7F17D57F97D2BE7AA451F66F86FC4365E28D0ADF55B07CC528F9
            909F9A361D55BDC56BD7CA7F0CFC792F8335D0B3B336957442DCC7D76FA38F71
            FA8FC2BEA78278AE608E782459229143A3A9C8607A114C44B45145020AE57E24
            4665F875AEA819C5AB37E5CFF4AEAAB375FB23A9787353B15196B8B596203DD9
            48FEB401F16D3918ABAB0EA0E69A46091454967DBD693ADD59C170BF7658D5C7
            E23353572BF0E7531ABFC3ED1AE436E65B7585FD7727C873FF007CD755544051
            45140051451400514514014AFF0048D37558FCBD42C2D6ED3D27895FF98AF17F
            8B7F0D345D1BC3EFAF68D01B478A5559A156251958E3201E8738F6AF75AE1BE3
            00CFC2DD63DBC93FF91928047CA95D2F80BC331F8B3C6167A54F23476EFBA499
            93EF6D519C0FAF4FC6B9AAF4FF008111893E204AC7FE59D8C8C3FEFA41FD6A51
            47B8695E00F0AE8A17EC5A1DA075E924A9E63FFDF4D935D1AA850028000E8053
            A8AA2428A28A002AAEA17D0699A75C5F5D3EC82DE369646F45519356ABC8FE3B
            789BEC1E1FB7D0609313DFB6F9B1D444A7FAB63FEF934058F09D7F589FC41AFD
            EEAB719F32EA52F8FEE8FE15FC0607E15F47FC1CF0DFF60F8221B99536DDEA27
            ED0F9EA13F807E5CFF00C08D7CBD5D0C5E3CF15C31AA47E21D455146157ED0D8
            029147D87457C84BF11BC60BD3C437FF008C99A71F88FE313FF330DF7FDF745C
            563EBBC56278B7418FC4BE17BFD264C6678888D8FF000C83953F9815F2E1F887
            E303FF003316A1FF007F8D30F8FF00C5C7FE663D4FF0B86A2E163027864B6B89
            20990A4B1B94753D548E08AD1F0D6B93F873C4763AB5BE4BDB4A19947F12F465
            FC464567DC5C4D777325CDCCAF2CD2B179247392CC7A926A2A451F6E595E41A8
            58C1796CE1E09E3592371DD48C8AB15E49F02BC51FDA3E1E9F42B89333E9E774
            59EA6263FD1B3F98AF5BAA2028A28A0028A28A00C7F159C783F5B3FF004E13FF
            00E8B6AF8CEBECAF179C782B5D3FF50F9FFF0045B57C6B498D1F63F82CE7C0BE
            1F3FF50EB7FF00D16B5BB5CF7818E7C05E1FFF00B07C23FF001C15D0D311C6FC
            4CF0B7FC255E0DBAB789375E5BFF00A45B63A9651CAFFC08647E55F271183835
            F71D7CAFF16FC2FF00F08DF8D679218F6D95FE6E61C0E0127E75FC1BF422931A
            1BF09BC53FF08D78D2059A4DB657D8B79F278193F2B7E0DFA135F5557C37D2BE
            B1F863E291E29F065ACD2BEEBDB61F67B9CF52CA386FC460FD7342067662B9DF
            1BF8913C29E13BDD5091E72AEC814FF148DC2FF8FD01AE8ABE74F8E9E29FED2F
            10C3A0DBC99B7D3C6E9707869987F45E3F16A608F32B3B5BBD735886D61DD35D
            DE4C1064F2CCC7A9FCEBEC5F0FE8D6FE1ED02CB49B61FBAB6882671F78F76FC4
            E4FE35E21F01FC2FF6BD5AE7C4770998ACC7936F91D6461F31FC14FF00E3D5F4
            15240C2B83F8C9FF0024BF55FF007A1FFD1AB5DE5707F193FE497EABFEF43FFA
            356988F95EBD47E02FFC8FD3FF00D7849FFA1A579757A87C06FF0091FE7FFAF0
            93FF00424A4533E94A28A299215F3B7ED01095F17E9B3E3E57B0083F091CFF00
            ECD5F44D788FED0B605AD744D454708F240C7EA1597FF416A434784D7A8FC06B
            8F27C7D3C64FFAEB19147D77237F4AF2EAEC3E166A234DF891A34AED84925301
            F7DEA547EA4525B8CFAD28A28AA2428A28A0028A28A0028A28A002BCF3E354EB
            0FC34BC42799A68907FDF61BFF0065AF43AF1DFDA0B5111787F4AD341F9A7B96
            98FD1171FF00B3FE9401F3ED74DF0EED3ED9F10B428B19C5E24847FB8777FECB
            5CCD7A7FC0AD2DAF3C74F7C5731D8DB33EEF466F940FC8B7E5528A67D2B45145
            51215E67F1D0E3E1E63D6F23FE4D5E995E63F1DCE3E1F27BDEC63FF1D6A00F04
            F071C78DF413FF00511B7FFD18B5F64D7C67E136DBE32D11BD2FE03FF8FAD7D9
            9490D8514514C421018104641ED5F377C5BF8707C3B7ADADE950FF00C4AAE1BF
            791A8E2DDCF6FF0074F6F4E9E95F49557BDB3B7D46CA6B3BB8566B7994A491B0
            C8607B5007C475DC7C35F1F4DE0BD6764ECEFA4DCB017310E76FFB6BEE3F51F8
            543F117C0971E0AD6CA26E934CB825AD663E9FDC6FF687EBD6B8DA928FB7ADAE
            61BCB68AE6DA559609543C7221C8653D08A9ABE76F841F11FF00B16E53C3DABC
            D8D3A66C5BCCE7881CF63FEC9FD0FD4D7D13DAA893E34F168DBE32D717D2FE71
            FF008FB57D2DF09463E1868BFEE49FFA35EBE6BF18FF00C8EFAF7FD846E3FF00
            46357D2DF09C63E18E8BFF005CDFFF00463521BD8ECE8A28A620A28A2800AF8E
            3C6BCF8EFC41FF00612B8FFD18D5F63D7C6DE3339F1CEBE7FEA2571FFA31A931
            A3107515F6E589CE9F6C7FE992FF002AF8907515F6C69873A5599F5813FF0041
            142065BA28A298828A28A0028A28A0028A28A002B23C52DB7C23ACB7A58CE7FF
            001C35AF589E326DBE08D79BD34EB83FF90DA803E36AE93E1F1C7C41D07FEBF6
            3FFD0AB9BAE8FC0271F10340FF00AFE8BFF4215251F60D145154485145140051
            451400555BCD42CB4E8D64BDBB82DA363B434D20404FA64D5AAF977E2D78C4F8
            A7C54D6B6926ED3AC098A1DA7891FF0089FF003E07B0F7A067D356B7B6B7F0F9
            D67730DC444E37C4E1D73F51562B9EF04689FF0008EF8334BD30AE248E10D28F
            FA68DF337EA4D7434082B95F89071F0EB5DFFAF56AEAAB93F89671F0E35DFF00
            AF63FCC5007C8F5D8FC2A3B7E266887FE9AB0FFC71AB8EAEB7E181DBF127433F
            F4DFFF006535251F5BD145154488402082320D7CC9F16FC027C2DACFF6958458
            D26F5C9500710C9D4A7D3B8FC476AFA72B3B5CD16CBC41A35CE977F17996F709
            B5BD54F623D083CD033E2CAF69F831F10BECB2C7E16D566FDCC8DFE832B1FBAC
            7FE599F63DBDF8EE2BCC3C55E1ABCF09F882E34ABC19319CC726302443F7587F
            9EB9AC6566460CA48607208ED5233EE3A2BCDFE147C405F15E91FD9F7F28FED7
            B441BC9EB3A740FF005F5FCFBD7A45512145145007C7FE3ED14E81E38D56C369
            5884E648BFDC6F997F438FC2B9BAF7EF8EFE147BCD3EDBC496B1E5ED47937381
            C98C9F95BF0248FF00817B5780D2291EE5F00BC46BB2FF00C3933E1B3F6AB7CF
            7E81C7FE827F3AF72AF8AB44D5EEB40D6AD354B27DB716D2075F43EAA7D88C8F
            C6BEBBF0BF892CBC57A0C1AA58BFCB20C49193CC4FDD4FF9E7AD084CDAA28A29
            8828A28A0028A28A002B86F8C071F0B759FF00B63FFA392BB9AE13E319C7C2ED
            587A987FF46A5007CAD5EA9F00867C77787D34E93FF46475E575EA7F011B6F8F
            2E87F7B4F907FE3F1D2299F48D14514C90A28A2801AECB1A166202A8C927B57C
            85E3EF12378ABC637DA88626DF77956E3D235E17F3EBF8D7BD7C63F147F60783
            24B485F6DE6A59823C1E427F1B7E5C7FC0ABE65B6B696F2EE1B6810BCD33AC68
            A3AB313802931A47B1FC15F02D86AFA7DF6B3AC5845750B3882DD265CAF1CB36
            3F21F81AF58FF857FE111FF32E69BFF7E16AEF867448BC3BE1BB0D261C62DA20
            AC47F137563F8B126B5CD306CE74780BC243FE65CD33FF000197FC297FE104F0
            9FFD0B7A5FFE02A7F85743450239D3E02F091FF99734CFFC065FF0A69F87FE11
            3FF32E69BFF80EB5D251401E57F12FE1C68CDE09BCBAD1B4AB6B5BCB3FF48CC1
            1ED2E8BF794FB6327F0AF9BEBEE174596364750C8C08607A115F1F78DBC3EDE1
            8F176A1A5E088A3937424F78DB95FD0E3F0A4C698FF02F891FC2BE2FB1D4F711
            007F2EE00FE28DB86FCBAFD40AFAF924496359118323005483C115F0F57D3BF0
            67C4FF00DBBE0D4B199F75DE98440D93C98FF80FE595FF0080D0819E8F451453
            105145140183E366DBE05F101FFA875C7FE8B6AF8E6BEC2F1EB6DF006BE7FE9C
            251FF8E9AF8F693291F607800E7E1FE81FF5E317FE822BA4AE63E1E1DDF0F741
            3FF4E69FCABA7A6485701F173C2FFF00091F82A79618F75E69F9B98B0392A07C
            EBF8AF3F5515DFD21018104641A00F872BD0BE0FF8AFFE11CF18C76B3C9B6CB5
            2C41264F0AFF00C0DF99C7FC08D64FC47F0C1F0AF8CEF2CE34DB6929F3EDBD3C
            B6EDF81CAFE15CA0254820E08A928FB27C55AFC3E18F0CDF6AF360F911FEED0F
            F1B9E157F138AF9019AEF59D54B1DF3DE5E4D9F792466FEA4D763E36F88B71E2
            DF0D689A636F0F6D1EFBC63FF2D2519553FF007CF3F56F6AD7F81FE171AAF89E
            4D66E1336DA680533D1A66E9F90C9FAE2986C7BAF847C3F1785FC2F63A4C582D
            0C7FBD61FC721E58FE79ADCA28A6485707F193FE497EABFEF43FFA356BBCAE0B
            E327FC92FD53FDE87FF46AD007CB15E9FF0001CFFC57F2FF00D78C9FFA125798
            57A6FC0A6C7C4261EB6720FD569147D2F451453242B86F8B7A29D6BE1E6A0113
            74D698BA8FFE01F7BFF1D2D5DCD3248D258DA3750C8C08653D08A00F87AA5B6B
            892D2EA1B9858ACB0BABA1F460722B77C71E1997C27E2CBCD31C1F2437996EE7
            F8A26FBA7FA7D41AE76A4B3ED3D0F55875CD0AC753808F2EEA159401FC248E47
            E078AD1AF0FF00813E30530CDE16BC930EA5A6B324F51D5D3FF66FC5ABDC2A88
            6828A28A0028A28A0028A28A002BE62F8D9AE7F6AF8F1ED236CC3A7C4B00C74D
            FF0079BF9E3FE035F4078BBC476FE14F0D5E6AB3B2EE8D0AC284FF00AC90FDD5
            FCFF004CD7C7B757335E5DCD7570E649A67692473D5989C93498D1157D2BF03F
            C3CDA4F835B529936CDA949E60CF511AF0BFFB31FC457867827C2D3F8BFC516B
            A64418424EFB8917FE59C63EF1FE83DC8AFAF2DADA1B3B586D6DE311C30A08E3
            45E8AA0600A10364D451453100AF2DF8F6D8F015B8FEF6A118FF00C724AF5215
            E51F1FDB1E07B15F5D453FF45C94023C1BC34DB7C53A437A5EC27FF1F15F6857
            C57A0B6DF10E9ADE97511FFC7857DA83A52436145145310514514018FE25F0ED
            8F8A7439F4AD423CC528CAB8FBD1B7665F715F25F89BC397DE15D767D2EFD312
            46728E07CB227665F635F665719F117C0B078D74231A048F52B705AD663EBDD0
            FF00B27F4EB4AC347C9D5F417C1EF88FFDA7047E1BD5E6FF004D897169339FF5
            CA3F80FF00B43F51F4E7C12F2CEE2C2F26B4BB85A1B885CA491B8C1561D45320
            9E5B69E39E091A396360E8E8705587420D219ADE2FE7C6BAEFFD842E3FF46357
            D2DF09CE7E18E8BFEE49FF00A31ABE56BCBB9AFEF67BCB87DF3CF234B2363196
            63926BEA7F84673F0BF45FF765FF00D1AF4D033B6A28A29921451552F753B0D3
            62F32FAFADED53FBD3CAA83F5A00B75F1A78B9C3F8CF5C71D1AFE73FF911ABE8
            9D7BE30F85348B69BECB7DFDA17414EC8ADD4952DDB2DD31F4CD7CC3713BDCDC
            CB3CA7749231773EA49C9A4C6860EA2BED4D15C49A169EE3A35B467FF1D15F15
            57D1FE05F8B3E1A93C39A7E9FA9DEFD86FADA0485FCE53B1F68DBB830E39C77C
            5086CF55A2B3AC75ED1F53C7D8355B2BACF686757FE46B469921451450014514
            5001451450015CFF008E5B6F80B5F24E3FE25F38FF00C70D5ED475ED23485275
            1D4ECED78E934CAA7F226BCB3E24FC57F0FDD7866FB46D1AE1AF6E6E93CA3222
            111A2E7E6E4F5E3D2803C02BA1F021C78FB40FFAFF0087FF004315CF569F8775
            28B47F12E99A94C8EF15A5D4733AA752AAC09C7E55251F68D15E4BFF000D01E1
            BFFA066ABFF7C47FFC5D1FF0D01E1BFF00A066ABFF007C47FF00C5D50AC7AD51
            5E4BFF000D01E1BFFA066ABFF7C47FFC5D1FF0D01E1BFF00A066ABFF007C47FF
            00C5D0163D6A8AF236FDA07C3E3EE695A91FA88C7FECD597AAFED0719B575D27
            457139FBAF7520DABFF015EBF98A02C755F173C6ABE18F0E3585ACA06A9A8298
            E3DA798E3E8CFEDE83DFE95E1BF0DB43FF008483C7BA65ABA6E86393ED137A6D
            4F9B07EA703F1AC1D6359BFD7B539B51D4AE5EE2E6539676EDEC0761ED5ED3FB
            3F687B2DB53D7A44E64616B09F61F33FFECBF9521EC7B6D14514C90AE47E279C
            7C36D73FEB87FECC2B6752F1268BA383FDA3AB59DA91FC32CCAADF975AF20F8A
            7F14F45D63C393E83A24B25D35C3AF9D71B0AA2AAB06C0CF24E40ED8C5008F0F
            AEABE1A9DBF11B423FF4F43F91AE56B4342D564D0F5EB0D5224DEF6B3ACBB09C
            6EC1E47E35259F6A515C468BF15FC21AD4487FB563B399BAC579FBB2BFF023F2
            FEB5D85B5DDB5E4425B5B88A78CF4789C30FCC55104F4514500707F143C0CBE3
            0F0F992D907F6AD982F6EDD3CC1DE33F5EDEFF008D7CB2E8D1BB23A957538604
            60835F7157CF7F1B7C0DFD9D7FFF0009369F162D6E5F6DDA28FF005729FE2FA3
            7F3FAD2634CF2DD1B58BCD0756B6D4EC25315CDBBEE43D8FA83EA0F4AFAD7C1D
            E2CB2F18E810EA5684249F76E21CF3149DC7D3D0FA57C795BDE13F17EA9E0ED5
            7EDDA6C830C36CB0BF292AFA11FD681B3EC6A2BCBF40F8E3E1AD49123D4D66D3
            2E08F9B7AF991E7D9979FCC0AF40D3B5BD2F578F7E9DA8DADDAE33FB9955F1F9
            5326C59BBB482FAD26B4B98D65826429246DD1948C115F28FC41F03DD782F5D7
            8B6BBE9D392D6B39FE25FEE9FF00687FF5EBEB5ACBD7B40D3BC4BA4CBA6EA700
            9ADE4E7D191BB329EC45033E2FAE97C17E36D4BC15AB7DAECCF996F2604F6CE7
            E5957FA1F435A5E39F867ABF836779C235DE945BE4BA8D7EE8EC1C7F09FD2B88
            A919F61F857C65A3F8C2C05CE99720C8A079B6EFC4911F71FD4715D0D7C4961A
            85E6977897761732DB5C4672B244E548AF59F0E7C7BD46D1520D7EC52F5071F6
            88311C9F52BF74FE1B69DC563E82A2B85D33E2F78335355CEA86D243FF002CEE
            A364C7FC0B95FD6BA183C59E1DB95DD0EBBA6C83FD9BB43FD6988D9A2B2A4F12
            68510FDE6B5A727FBD7483FAD64DEFC4AF06D867CEF1059B63FE783197FF0040
            06803ABAE07E331C7C31D487ABC3FF00A316B0B56F8F9A0DA865D32C2EEF9C74
            67C4487F1E4FE95E5DE2FF008A7AFF008BECE4B0B816F6D60EC18C10A7DEC1C8
            CB1C9FCB14876387AF4CF814DB7E2130FEF59483F55AF33AF46F822FB7E23C03
            FBD6F28FD2819F4F514514C90A4270327A5453DC416B134D71347144BF79E460
            A07E26BC6FE27FC59B2FECD9F44F0E5D09E69C14B8BB88FC91AF7553DC9F51D3
            EBD003CE3E27F8AFFE12BF18DC4D0C9BAC6D7FD1EDB1D0A83CB7FC08E4FD315B
            5F047C39FDAFE323A94C99B6D313CCE7A191B84FFD99BFE022BCCABDDBE0B78A
            BC31A478725D3EF35082CF5096E5A47FB41D8186005C31E3B74CFAD228F6EA2A
            182E60BB884B6F3C7346DD1E370C0FE22A6A6485145140051451400578AFC7DF
            0EF9B6363E21853E785BECD391FDD3CA9FC0E47FC0857B3BC891A17765551C92
            C7005796FC58F1C7874F83EFF4686FA0BDBEB90A8B140E1C210C0EE623818C74
            EB40D1F38576BF0B7C4FFF0008C78DAD6495F6D9DDFF00A35C64F0031E1BF06C
            1FA66B8AA2A4A3EE4A2BC7BC03F1934A9B49B6D3BC4570D6B7B0A88FED2EA4C7
            281D0923EE9F5CF15EAF63A9596A7009EC2F20BA88FF001C32071F98AA20B545
            159BA8EBDA468E9BB52D4ED2D3DA699549FA0268031FE244A21F875AEB120036
            ACBF9F1FD6BE45AF6FF8AFF14346D63C3D2E83A1CEF726775F3E70A5502A9DD8
            19E49C81ED5E2148A47D71F0D24F33E1C686C3FE7D82FE448AEB2BC63E15FC4B
            F0FD8F84ED344D5AF459DD5B16556954EC752C581DDD075C73E95EB363AC699A
            A2EEB0D42D6E97AE60995FF91A6497A8A28A00F30F8D9E17FED9F090D5604CDD
            E984C871D5A23F7C7E1C37E06BE6AAFB826863B886486640F148A55D5BA303D4
            57C7DE34F0EC9E15F165F694E0F971BEE858FF001467953F97EA0D2634CC100B
            3050324F000AFAE7E1E78687857C196560E816E9D7CEB9FF00AE8DD47E030BF8
            5781FC22F0C7FC245E3682599375A69F8B9973D0B03F22FF00DF5CFD14D7D4D4
            20614514138A620AF3EF8D0C17E19DF8FEF4B08FFC7C574DA8F8BBC3BA4E7EDD
            ADD8C2C3AA19D4BFFDF239AF18F8B3F13347F12E8D1E8BA2B493A79E2596E190
            A2E141C2A83C9E4FE940D1E3B5E93F034E3E22A0F5B597FA579B574FE00F13C3
            E12F17DAEAB7113C96CA1A39563FBDB586323E9C1A9433EBDA2B93D2FE25F83F
            570BE46B96D1B9FE0B83E49CFA7CD8FD2BA78A78AE2212432A488DD1918106A8
            925A28A280380F8A7E04FF0084C3421359C6BFDAB660B407A798BDE327F97BFD
            4D7CBB2C52412BC52A32488C5591860A91D41AFB86BCB7E25FC288BC4C64D5B4
            658E0D5B199233F2A5C7D7D1BDFBF7F5A434CF9CECEF2E34FBC86F2D26686E21
            70F1C88705587435F51FC3AF88D65E33D3D609D920D6225FDF419C6FFF006D3D
            BDBB57CBD7D6177A65E4B677D6F25BDC44DB5E391769069B69777163751DD5A4
            D2413C4DB9248DB6B29F6340EC7DBD45784784BE3BB451C769E27B6693000FB6
            5BA8C9FF00793FA8FCABD634AF1B786B5B456B0D6ACE427FE59B4811FF00EF96
            C1A64D8DFA29A1958643020F706A0BBD42CAC22F36F2EE0B78C7F1CD2041F99A
            00B355EF6F6DB4FB496EEEE7482DE25DCF24870147D6B85F10FC63F0A688AE96
            D72753B90388ED394CFBBF4FCB35E15E32F887AD78D260B792082C91B7476909
            C20F76FEF1F73F86295C69177E2678FE4F1AEAE23B6DD1E956AC45BA1E0B9EEE
            DEE7B7A0FC6B8ED3EC2EB54BF86C6CA079EE667091C68396357FC3BE17D5FC53
            A82D9E9568F33FF1C9D1231EACDDABE95F00FC39D3FC136864CADCEA92AE25B9
            65E83FBA9E83F9FE801EC4BF0F3C0D078274210B159750B8C3DD4C0753D957FD
            91FE26BB2A28A648514514005790FED03263C2BA645FDEBDDDF9237F8D7A2EA5
            E2BF0FE8F9FED0D66C6065EA8F32EFFF00BE7AD780FC5EF1EE9DE2EBAB1B3D21
            9E4B4B4DECD33295123363A03CE001DFD690D1E77A749E4EA96927F72646FF00
            C7857DB43A0AF875495604751CD7D49E18F8B5E18D72C60FB56A10E9F7DB4096
            1B93B14377DAC7E523F1CD0819DFD1505B5DDB5EC425B5B88A78CF4789C30FCC
            54F4C414514500145145007937C5FF00875FDBB66FAFE950E752B75FDFC4839B
            88C77FF787EA38F4AF9D2BEE4AF9EBE317C3AFECBB993C49A4C38B299B377120
            E2173FC43FD927F23F5A434CF20AFAAFE0FB6EF85BA3FB79C3FF00233D7CA95F
            527C177DDF0CB4F1FDD9261FF9109FEB421B3D028A28A649CF78DECB55D43C1D
            A85A688F22EA322A885A397CB6FBEB9F9B231C66BC11BE0D78EAEE432DCC5099
            1BAB4B74189FE75F4E51401F34A7C08F1730C9974D5F633B7FF1352AFC03F159
            EB79A48FACD27FF115F48D14AC3B9F379F805E2B1D2F7493F49A4FFE22A26F80
            FE2D1D27D31BE93B7FF135F4AD1405CF98DFE0878CE3E522B37FF76E07F5AEF3
            E16F843C67E1BF11C8DADB4C34C36CCAA9F6B1226FDCB8F9777A679C57B0514C
            2E145145020A28A2800AF3EF8ABA1F8975ED26CADBC36D30712B19C477022CAE
            DE33C8CF35E8345007CBE3E0B78DA562CF696E189C92F72A6A74F819E306EA2C
            13FDEB8FF015F4CD14AC3B9F358F80DE2D3FF2DF4C1F59DBFF0089A78F807E2B
            3FF2F9A48FACD27FF115F48D14582E7CE07E00F8ABFE7FF47FFBFD27FF001BA6
            9F807E2B1D2F3493FF006DA4FF00E22BE91A28B05CF9B0FC05F160FF00978D2C
            FF00DB67FF00E22987E0478B87FCB5D34FD276FF00E26BE96A28B05CF991BE06
            F8C57A258B7D2E3FFAD5137C12F1A2F4B4B56FA5CAD7D4145160B9F2D37C18F1
            BAF4D3226FA5D47FFC557D09E08D00F867C1DA6E96EA1668A2CCD839FDE37CCD
            CF7E491F85743466983615E63F163C37E2BF11369B17875E5F21164FB4AADD08
            9493B76E46467BD7A751408F9893E08F8D2539786D109FEFDC0FE95617E03F8B
            5BACFA62FD676FFE26BE95A2958773E6F1F00BC567ADEE903EB349FF00C4535B
            E0278AC74BBD28FD267FFE22BE92A28B05CF9A1FE0578BD3EEB69CFF00EECE7F
            AAD470FC22F881A74DE6D944B1C83F8E0BD543F9E457D3745160B943478EEA0D
            12C22BD2C6ED2DE3598B36E25C28DD93DCE73CD5FA28A620AA7AAE9B6BAC6977
            3A75EC624B6B88CC6EBEC7FAD5CA2803E66B8F81FE2D1A85C456F1DB3DB2C844
            53BCEA37AE7838EA2A74F809E2C6EB75A527FBD33FF44AFA4A8A561DCF9B1FE0
            2F8B17A5CE96FF00EECCFF00D52AB9F82BE36B670F0476CCEBC868AE829FD715
            F4DD14582E72BF0F74ED6B4AF07DB59EBCD236A08EFB8C9379A76EE3B7E6C9ED
            5D55145310C911644649143A30C1561904579B789BE0AF8775B77B8D3CBE9574
            DCFEE577444FFB9DBFE02457A651401F316B1F04FC5DA692D6B0DBEA310EF6F2
            61B1FEEB63F4CD71D7BE17D7F4D62B79A2DFC18EEF6EC07E78AFB3A8A561DCF8
            74A3292194823B114983EF5F6FBC10CBFEB2247FF7941A8D6C2CD4E56D6007DA
            314582E7C4F1C134CDB628A491BD154935AD65E10F126A240B4D0B50947F785B
            B6DFCF18AFB1D63441854551E8053E8B05CF97F4DF829E32BFC19AD6DEC50F7B
            89C7F25DC6BB0D37F67B4186D535D63EB1DB438FFC798FF4AF70A28B05CF3FD3
            7E0CF8334FDA5EC25BC71FC573331FD1703F4AEBF4ED0B49D2171A76996969C6
            33042A87F302B468A620A28A2803E7DF17FC33F1CF88BC55A95D05F32CDEE5DA
            DBCFBB042C79F970327031DAB2E3F811E2E7196974D4F669DBFA2D7D2D4521DC
            F9BFFE14178AF6E7EDBA47D3CE93FF0088A824F813E2E4E55F4E93FDD9DBFAAD
            7D2F45160B9F38E87F0AFC7BA26B76773027951A4C8D2B4178AB950C33DC678A
            FA3A8A298828A28A0028A28A00F01F1B7C3AF1DF88BC55A8DC44AF2E9EF396B7
            12DE2ED55ED852DC561C7F037C62FF00792C53FDEB8FF015F4D5148773E6C5F8
            0BE2C6EB73A5AFD667FF00E229CDF00FC563A5EE92DF49A4FF00E22BE91A28B0
            5CF9A24F815E2F4FBADA73FF00BB39FEAB4ED37E13F8FB48D4E0B9B5884451D4
            B3DBDE2A9DB9E7B8AFA568A2C17389F89DA478835BF0BC567E1D6956ECDD2B49
            E5CFE5663DAD9C9C8C8C95E2BC657E09F8D6762D2C36AACDC9325C827F4CD7D3
            945304CF9AD7E03F8B5BACFA62FD676FFE26A4FF008505E2AC67EDDA47D3CE93
            FF008DD7D21452B05CF9ADBE0378B54713E98DF49DBFF89AAE7E0A78DADDC343
            15B3329C831DC807F5C57D3945160B9C4FC30D23C43A278626B4F11BCAD77F6A
            668FCCB8F37116D5C007270321B8AEDA8A29882BCDBE28FC37B8F1B7D86EF4D9
            6DA0BF8331BB5C1601E33C8E5413907FF4235E934500715F0D7C10FE08F0FC96
            D72F0CB7F712992792124AE070AA0900E00F6EAC6BB5A28A002BC87E2BF843C6
            1E27D76D8E8BE6369AB6AA9247F6A089E66F6CFCA4F3C15E715EBD45007CC71F
            C0FF00193FDE86CD3FDEB81FD2AC2FC06F169EB3E98BF59DBFF89AFA528A561D
            CF9BC7C02F151EB7BA40FACD27FF001BA6B7C04F160E975A51FA4CFF00FC457D
            2545160B9F33C9F02BC609F74E9EFF00EECE7FAAD3AC7E14FC43D26E926B2530
            B0604B5BDEAA1FFD0857D2D45160B883A52D1453105145140181E25F07689E2D
            B5F2756B2591D461275F9648FE8DFD3A578E7883E01EA76EEF2E837F15DC3D44
            371FBB93E99FBA7FF1DAFA0A8A4099F1E6A5E05F14E924FDB342BE551D5D2232
            2FFDF4B915832432C2E5248DD1C7665C1AFB8698F14720C3C68C3FDA5CD161DC
            F88D27B88C61259147A0622A6B7D3F50BF6FF46B4B9B827FE79C6CFF00CABED1
            5B1B44395B6854FA88C54E14018000A2C173E4FD2BE1578CB5665D9A3CB6D1B7
            592EC8882FE07E6FD2BD27C39F00ECEDDD67F10EA06E88E7ECF6D944FC58F27F
            0C57B4514582E52D334AB0D1AC92CB4DB48AD6DD3A244B81F53EA7DEAED14531
            0514514005792FC57F09F8BFC4BAB5A0D08CAD60B6FB6541742342FB8F552C33
            C639AF5AA2803E604F825E347FBD6B6ABFEF5CAFF4AB09F027C5EFD5F4E4FF00
            7A73FD16BE97A2958773E6E1F00BC56573F6DD247B79D27FF1BA8DFE03F8B57A
            4FA637D276FF00E26BE95A28B05CF99A3F83DE3ED3E5F36CD6249074782F021F
            CF8AFA0BC316F7F69E17D32DF55676BF8EDD16767937B17C7396EF5AF4531051
            45140051451400543716F0DDDB496D711ACB0CAA52447190CA7A835351401F2B
            7C44F87977E14F102C7630CB71A75E39FB21552CC0FF00CF33EE3F51F8D7B77C
            25D2751D1BC056F69A9DAC96B3F9B2388A4E18293C6476FA1AEE4A838C8071C8
            A7503B85145140828A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
            8A28A0028A28A0028A28A0028A28A00E43E21F8D53C11E1F5BD48927BB9A511C
            10B9C06EEC4FB01FA915CBF807E25788FC6FADFD99347B386CA101AE6E0173B0
            7603FDA3FE3E9595F137C15E32F1A78BA336B628BA55BAAC5048F708073CBB95
            CE7AFB74515E9FE13F0C58F84B40834BB25CEDF9A5948F9A573D58FF009E98A4
            33768A28A620A28A2800A28A2800A28A2800A28CD14005145140051451400514
            5140051451400514514005145140051451400514514005145140051451400514
            51400514991EB4B40051451400514514005145140051451400514991EB4B4005
            145140051451400514514005145140051499A5A0028A28A0028A28A0028A28A0
            028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
            028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
            028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00E33E2A6
            A379A57C3BD4AF2C2E65B6B98CC5B2589B6B2E645079FA1AF9D62F1CF8CE76D9
            0EBDAAC8DD70933135F40FC63FF925FAAFFBD0FF00E8D4AF28F80BFF0023F5C7
            FD7849FF00A1A521A39AFF0084BBC79FF417D6BFEFB7A3FE133F1D45C9D63581
            FEF3BD7D6F81E828C0F41405CF96B4BF8C5E32D325532EA0B7B103CC773129CF
            E230DFAD7BA780BE2169FE38B17F2D0DB6A108CCF6ACD9C0FEF29EEBFCBF2CB7
            C7DE01D33C5BA35C916D1C7AA4685A0B945018B01C2B1EEA7A57CE9E01D6A6D0
            3C71A5DE46C4219D629403F7A363B587EB9FC0501B9F5FD14514C4141E94521E
            86803E523E39F157FC24E60FEDFD43CAFB66CD9E7B636EFC62BEAE1D2BE323FF
            002371FF00AFEFFDA95F660E82921B168A28A620A28A2800A28A2800A63BAC51
            B3BB054504B13D00A7D703F177C43FD83E02BA48DF6DCDF9FB2C78EB86FBE7FE
            F9CFE62803C47C41F127C4BA8F88350BAD3F58BFB7B26958C31452B2AA479C2F
            1DBB7E26BD7BE0C78C2E7C47E1FB9B2D4AE9EE350B29726491B2CF1B72093DF0
            770FCABCEBE10F8413C496DE2392741E5B599B48D9BB48FF0036E1FEEED1F9D6
            27C35D724F097C42B717598A295CD9DD29FE1C9C73F4600FE069147D5D451453
            2428A28A0029ACC141248007249A7570FF0016B569B48F877A8C96EC525B8DB6
            E18760C7E6FF00C773401C078E7E375CA5E4DA7785B6247192AD7CEBB8B9FF00
            601E31EE739AF3E8E6F1EF89F33C2FAF5FA37F1C7E6327E9C0AD9F839E14B2F1
            378AE593528D66B5B18BCDF25BA48E4E1437A8EA7F015F4E222471AA22854518
            5551800521EC7C94FA678FB445FB49B6D7ED157932A09542FE22BA2F0B7C6BF1
            068F711C3AC37F6A59670DBC01328F556EFF00F02FCC57D2D5E29F1B7C0F649A
            5FFC24FA7DBA433C7205BB08B8122B1C073FED6E207BE7DA8047AE68FABD96BD
            A541A9E9D309ADA75DCAC3F507D08ABF5E0DFB3FEB928BED4F427726168FED71
            03FC2C0856C7D772FF00DF35EF34C414514500796FC6AD535AD2F4AD2DF45BAB
            CB791E77121B666048DBDF15E33FF09778F3FE82FAD7FDF6F5F5C114981E9486
            7C8EFE32F1CC685DF59D6154752657005451F8EBC6533848B5FD51DCF659D89A
            FA4BE2501FF0AE35CE3FE5D8FF00315E0FF05FFE4A6587FD729BFF00406A0665
            FF00C25DE3CFFA0BEB5FF7DBD49078B7C74678C36AFACED2C33F3BD7D6781E82
            8C0F4140AE03A0A5A28A620A43D0D2D21E86803E52B7F1CF8A9BC4F14075FD40
            C46F0214F3DB1B77E315F570E95F195B7FC8DD0FFD7F2FFE8CAFB30741490D8B
            451453105145711F147C60DE10F09BC96CF8D42ECF936DFEC9C72FF80FD48A00
            CCF1EFC5BD3FC2733E9DA7A2DF6A8BC32EEFDDC27FDA23A9FF00647E62BC6AEB
            C6FE3BF17DDB456F7BA84A4FFCBBE9EACA00FA27247D734CF87DE0CB8F1DF88D
            A39E5916CE1FDEDE4FD5B93F741FEF373FA9AFA8748D134DD06C12C74BB48ADA
            DD070A8BD4FA93D49F73487B1F2F9F09FC4245F3FF00B375ACFA8DE5BF2CE6A4
            D2BE23F8D7C2B7BE4CF7B75279670F6BA8067FC3E6F997F022BEADAE67C65E0A
            D33C65A4496D7712A5D2A9FB3DD05F9E26EDCF75F51405CA9E05F883A6F8DEC5
            8C23ECFA842333DAB364A8FEF29FE25AEC6BE39D3AFB53F02F8C16600C779A7D
            C14963CF0E01C329F622BEBCD3EFA1D4F4DB6BEB76DD0DC44B2C67FD96191403
            2D514514C414515E63F18FC6B2F86F418F4CB094A6A1A80237A9F9A28BBB0F73
            D07E3E940153C7BF19AD741B8974CD0A38EF6FD0959267398A26F4E3EF1FD07E
            95E45378A3C73E2FBB648EFB54BC73FF002C2D37051FF014E2B47E197C3B7F1A
            EA12DCDE3BC5A55AB012B2FDE95BAEC53FCCFD3D6BE97D3348D3F45B24B3D36C
            E1B5B74E891AE3F13EA7DCD21EC7CB47C25F102DD7CF1A66B4BDF29BCB7E439A
            B1A4FC4DF19F862EFC99EF6E2E163387B6D40173F4CB7CCBF9D7D575CEF8ABC1
            9A378BEC1ADF52B653285C45728312447D8FA7B1E280B999E05F891A578DA031
            20FB2EA51AEE92D5DB391FDE43FC43F9576B5F1F6AFA66AFF0FBC60601298AF2
            CE412413A701D7F8587B1EE3EA2BEA2F0778961F16785ECF568C0579176CD183
            F7241C30FEA3D88A01A37E8A28A620A28AE5FE226AD3689E00D62FADD8ACCB0F
            968C3AA9760991EE3766803CF3E207C6992C2FA7D2BC322369222525BD71B806
            EE107438F53C7B77AF324BFF001E78A9DA6866D72FC13C987CC641FF007CFCA2
            ADFC2AF0C5A78ABC6B1DB5FAEFB5B789AE648FFE7A6D2A02FD32C2BEA88218AD
            E1486089228906D444501547A00290F63E4D6D1BC7FA50FB47D8F5FB70BC9911
            6518FC456D786BE32F89B43B848F5294EA9680E1A3B8FF005807B3F5CFFBD9AF
            A76BC8FE33F81ECAF7409BC47656E916A16B869CA2E3CE8F383BBDC6739F4CFB
            5008F47F0F78834FF1368D06A9A6CBBE097A83C32377561D88AD5AF9DBE02EB9
            35AF89EEB466726DEF21322AE7A48BDFFEF9DDF90AFA26989851451400514514
            0051451400514514005145140051451400514514005667882692DFC37AA4F0BB
            24B1DA4AE8EA7055821C115A7595E27FF915358FFAF29BFF00403401F3BF807C
            67E25BFF001DE8F6977AE5FCF6F2DC0578E49D8AB0F422BE9DAF917E1B7FC947
            D0BFEBE87F235F5D524361451453105145140087A1AF92E5F1778E84CE06AFAC
            E371FE37AFAD69303D2819F247FC25DE3CFF00A0BEB5FF007DBD43278EFC630B
            9493C41AA238EAAD3B035F5EE07A57CB1F197FE4A7EA7FEE43FF00A29690CCE4
            F18F8E6440E9ACEB2CA7A112390697FE12EF1E7FD05F5AFF00BEDEBE8FF87407
            FC2BBD0BFEBD12BA8C0F6A0573CBFE0AEA9AD6A9A46A6FAD5D5DDC4893A88CDC
            B31206DED9AF51A4029698828A28A00F9FFE31F8AB5ED1FC6EB6BA6EAF796B01
            B58DBCB8652A3396E715C2C7E32F1C4A81E3D6B58743D1965720D747F1D7FE4A
            12FF00D79C7FCDABD7FE1081FF000ABB45FA4BFF00A35E915D0F9FFF00E130F1
            DAF2758D647D5DEA483E2778DACA4CAEBB7448ED32ABFF00E840D7D6781E9556
            FB4BB0D4E130DFD95BDCC64636CD1871FAD02BA3C5BC25F1DE47B88ED3C4F6D1
            88D8E3ED96EB8DBEECBFD47E55EDF04F15D5BC73C122C90C8A191D0E4303D083
            5F3BFC58F8630F86D3FB7345461A6BBED9E0CE7C863D083FDD3D3D8FD6B63E05
            78C6533CBE16BC94B21532D9963F748E5907FE85F83500CF75A28A298828A28A
            002B3B5ED5A1D0B41BED5273FBBB585A4C7F7881C0FC4E07E35A35E3BF1EFC43
            F65D12CB4185F125E3F9D301FF003CD7A03F56FF00D06803C924F881E3095E49
            BFE120D45416C9D93305527B7B57D1DF0D7C4A7C51E0AB3BC9A4DF7710FB3DC9
            3D4BAF73EE460FE35E3FE18F051D4FE0B6BBA818B37324C2E2DCE392B0839C7F
            DF520A77C0AF11FF0067789E7D1667C41A8266304F495791F9AEEFC85219F46D
            14514C414514500707F18FFE497EABFEF43FFA352BCA3E02FF00C8FD71FF005E
            127FE8695EAFF18FFE497EABFEF43FFA352BE78F06F8BAEFC17ACBEA7676F0CF
            23C2D0ED9B38C120E783FECD21AD8FB0E8AF9E3FE1A075EFFA04E9DFF8FF00FF
            00154D93F680F1115223D2F4C56F56590FFECD45C2C7BDEAFA9DBE8DA45DEA57
            6E120B789A4724FA76FA9E95F20787ED64D57C59A6DB46B97B8BC8D703B65866
            B4BC47E3BF1378D192DAFAE59E1DDF25A5BA6D42DDB81CB1FAE6BD53E0FF00C3
            6BAD26E0788F5BB7686E7695B4B7718640472EC3B1C7007B9A0363D9C74A28A2
            988290F434B487A1A00F8CCFFC8DC7FEBFBFF6A57D983A0AF8CCFF00C8DC7FEB
            FBFF006A57D983A0A486C5A28A298828A28A0028A28A002BE6BF8E3E21FED4F1
            8A69713E6DF4D8F61C74F31B05BF4DA3F035F426B9AAC3A1E877BA9DC1FDD5AC
            2D291FDEC0E07E278FC6BE54F0A6993F8DBE215B4373990DDDCB5C5D37AAE773
            FE7D3F1A4C68FA1BE15F87FF00E11EF015844E9B6E2E87DAA6FABF41F82ED15E
            23F18F403A278F6E2E235DB6FA80FB5211FDE3F7C7FDF409FF008157D42A02A8
            00600E0015E67F1BFC3FFDABE0C1A944999F4D93CCE3AF96DC37FECA7FE03402
            3A3F873E23FF00849FC13617AEFBAE635F22E39E7CC5E093F5186FF8157575F3
            BFC07F11FD87C4373A14CF886FD3CC881ED2A0FEAB9FFBE457D114098514514C
            02B93F891E1F9BC4BE06D42C2D9775D051342A3F8994E76FE2323F1AEB28A00F
            913C0DE30BAF03788CDEAC06589D4C373013B4B2E7B7A10457D0BA27C57F07EB
            4A806A896733758AF079447FC08FCBFAD51F1A7C23D1BC5733DF5BB9D3B517C9
            79635CA4A7D597D7DC7EB5E43AC7C18F17E9659A1B48B50897F8AD64C9C7FBAD
            83F96690F73E9D8678AE62596095258DB957460C0FE351DE595AEA368F697B6F
            15C5BC9F7E295432B739E41AF8ED64F10F85AEB01B52D2A7CF4F9E127F9576DE
            1EF8DDE25D29D23D4FCAD52D87DE120D9263D987F5068B858FA1AC341D234B93
            CCD3F4AB2B47C6DDD05BAA1C7A640AD1AC1F0B78B34BF17E922FB4C94900ED96
            27C0789BD187F5ADEA620A28A2800A28A280394F897FF24E35CFFAF63FCC5783
            7C16FF00929B61FF005CA6FF00D01ABDE7E25FFC938D73FEBD8FF315E0DF05BF
            E4A6D87FD729BFF406A4347D494514531051451400521E869690F43401F19DB7
            FC8DD0FF00D7F2FF00E8CAFB307415F19DB7FC8DD0FF00D7F2FF00E8CAFB3074
            1490D8B4514531057CDFF1E7547BAF1A5BD806FDD59DAAF1FED39DC7F4DBF957
            D215F2B7C622C7E28EAD9E98871FF7E92931A3D7BE07E922C3C0297854092FE7
            7949EFB54EC03FF1D27F1AF4BAE4BE192AA7C37D0C2F4FB3E7F1DC735D6D3105
            1451401853783BC3973AB4DAA5C68D693DECC4179668C3E48000383C03802B6A
            38D218D638D151146155460014FA2800A28A2800AF953E2E6A8FAA7C47D4816C
            C76BB6DA31E81473FF008F16AFAAEBE38F1A3B49E3AD799B83FDA33F1FF6D1A9
            31A3E99F869A3A68BF0FB4985502C93422E65F52CFF373F8103F0AEBAA868CAA
            9A169E8A4155B68C0FFBE455FA620A28A2803C6BE3FE8A9368DA6EB489FBD826
            FB3B903AA302467E857FF1EACFFD9F3566F3758D219B28556E635F43F75BFF00
            65FCABB2F8D614FC35BBDDD44D16DFAEE1FF00D7AF30F8085878F6E40E874F93
            3FF7DA521AD8FA4A8A28A620AC0F1A688FE23F076A7A4C78F36787F759E9BD48
            65FD40ADFA2803E3EF0A788EFBC0BE2A4BE5B726484B43716F27CA597F894FA1
            C8FCC57D0BA1FC5DF086B2881F51FB04E7AC5783663FE05F77F5A5F1AFC2DD17
            C62ED77CD8EA47ADCC2B9DFF00EFAFF17D783EF5E39ACFC14F16E985DAD61835
            184746B7930D8FF75B1FA6690F73E98B7BAB7BC844D6D3C5344DD1E370C0FE22
            8B9B682F2DA5B6B9852686552AF1C8BB9587A115F1C345E21F0B5D659352D2A7
            F5F9E127F95761A07C6AF14E90E897B2C7A9DB03CA5C0C3E3D9C7F5CD170B1F4
            558F87745D326596C348B0B591780F05BA211F8815A75CD783FC6BA4F8D34D37
            3A7B949A3C09EDA4FBF11FEA3D0D74B4C4145145001451450014514500145145
            001451450014514500145145001595E27FF915358FFAF29BFF004035AB595E27
            FF00915358FF00AF29BFF403401F2D7C36FF00928FA17FD7D0FE46BEBAAF917E
            1B7FC947D0BFEBE87F235F5D52436145145310514514005145140057CB1F197F
            E4A86A9FEE43FF00A296BEA7AF963E32FF00C950D53FDC87FF00452D26347BFF
            00C39FF9277A17FD7A257515CBFC39FF009277A17FD7A257514C414514500145
            145007CD1F1D7FE4A12FFD79C7FCDABD83E10FFC92ED1BE92FFE8D7AF1EF8EBF
            F25097FEBCA3FE6D5EC3F087FE49768DF497FF0046BD21BD8EDE8A28A623375D
            D2E2D6B41BED32600A5CC0F1F23A12383F81E6BE4AF08EA1268BE34D26F012A6
            1BB40FFEEEEC30FC89AFB18F4AF8B2F79F10DC795FF3F4DB3FEFAE2931A3ED4A
            290741F4A5A620A28A2800AF92FC7FACCBE30F8857725B66546985ADAA8FE255
            3B571FEF1C9FF8157D0DF12BC43FF08DF81B50BB47DB712AFD9EDF9E77BF191F
            4196FC2BC3FE0BF87FFB67C751DE4A9BADF4D4FB4367A6FE883F3F9BFE034868
            FA23C3FA243A1F86AC74740AD1DBC0236E38738F98FE2727F1AF95FC436173E0
            7F1FDC436C4A3D8DD09AD98FF773B93F4C57D7D5E19F1FFC3FCE9DE21853FE9D
            6723F1643FFA10FCA8047B1E89AAC1AE68965A9DB1FDD5D44B201E991C8FC0F1
            5A15E39F013C49F6AD1EF3C3F33E64B46F3A007FE79B1F980FA373FF0002AF63
            A62614514500707F18FF00E497EABFEF43FF00A352BC5FE0FE83A6788BC61359
            EAD68B756EB66F2046247CC1906783EE6BDA3E31FF00C92FD57FDE87FF0046A5
            7947C05FF91FAE3FEBC24FFD0D290D6C7B0FFC2AAF04FF00D0061FFBF927FF00
            154E4F85BE0A8CE46816C7EACC7F99AEC28A6232B4CF0DE89A31074DD26CED5B
            A6F8A1556FFBEBAD6AD14500145145001487A1A5A43D0D007C667FE46E3FF5FD
            FF00B52BECC1D057C667FE46E3FF005FDFFB52BECC1D0524362D14514C414514
            5001451450078FFC7AF10FD9341B4D0A17C497AFE6CC01FF009669D01FAB63FE
            F9AF16F0FCDE23D3266D43414BD8DD94C666B788B71C12338F615A7F1235F6F1
            3F8F2FEE6262F046FF0066B7039CAAF1C7D4E4FE35F4BF82F415F0D78434DD2F
            6812450832FBC8DCB7EA4D21EC7CEBFF000967C4BFF9FBD6BFEFCB7FF13515CF
            88FE22DE5ACB6D7336B12C13214923681B0CA46083F2D7D5DC51C50173E2AB1B
            ABCD035BB6BC44786EED255942BA9520839C115F63E91A941AC69169A95B1CC3
            7512CABED91D3F0AF08F8F7E1DFB26BB67AF42988EF53CA988FF009E89D09FAA
            E3FEF9AE9BE03788FEDBA0DD68333E65B17F36107FE79B9E47E0D9FF00BE8500
            CF5FA28A29882B035FF19787FC2F2C71EB3A8A5AC922EF4528CC587AFCA0D6FD
            78D7C7ED0A5B9D274ED6E142C2D1DA19F03A2B6369FA6463FE0428047A9687AF
            69DE24D31751D2AE3CFB576650FB0AF20E0F04035A75F3EFC12F1CD9E90F71E1
            ED52E12086E24F36DA590E14498C3293DB3818FA1F5AFA041046472280688AE6
            D6DEF21686E608A689BEF2488194FE06BCABE207C20D22F34ABAD4B41B75B2BF
            850CBE4443F7730032576FF09F4C71FCEBD6EB9CF1A7896CBC2DE19BBBEBA950
            486364822279924238503F9FA0A011F3C7C23D767D17C7F6312B916F7CDF6699
            3B36EFBBF9363F5AFAAABE4DF85BA54DABFC45D29635252DA5FB4C8DFDD54E7F
            9E07E35F595243614514531051451401CA7C4BFF009271AE7FD7B1FE62BC1BE0
            B7FC94DB0FFAE537FE80D5EF3F12FF00E49C6B9FF5EC7F98AF06F82DFF002536
            C3FEB94DFF00A03521A3EA4A28A298828A28A00290F434B487A1A00F8CEDBFE4
            6E87FEBF97FF004657D983A0AF8CEDBFE46E87FEBF97FF004657D983A0A486C5
            A28A29882BE6CF8EFA6B5AF8EA2BCC7C9796AAD9FF006972A47E417F3AFA4EBC
            E3E327855FC43E11FB5DAC65EF34D6332A8192D19FBE07E40FFC0681A25F82FA
            9A5FFC38B4843664B396481FFEFADC3F4615E855F2F7C26F1D47E11D764B6D41
            CAE977B8595BAF94E3EEBFD39C1FFEB57D390CD15CC093432249148A191D1B21
            81EE08A01A25A28AC8F10F88B4EF0C69136A5A94C238A3076AE7E691BB2A8EE4
            D0230FC41F137C3BE18F107F63EA925C472F94B234A916F45CE7838E73DFA77A
            E9749D5AC75BD362D434DB85B8B4973B24504038383D7DF35F235FDDEA3E38F1
            8C93AC664BED46E3091AF3B73C2AFD00C7E02BEB3F0F68F1787FC3F63A4C2729
            6B0AC7BBFBCDFC4DF89C9FC690CD4A28A29882BE4BF8A3A63E97F11B5842B859
            A6FB421F50E377F327F2AFAD2BC87E39783E4D534A87C43671179EC54A5C2A8E
            4C3D777FC04E7F063E948699DDF80F544D63C0DA3DE23024DAA46F8ECEA36B7E
            A0D7466BE6EF843F1121F0CDD3E8DAB4BB34CB97DF1CC7A43274E7FD93FA63EB
            5F46A4892C6B246EAE8C32ACA7208A60C928A2B3F57D62C342D365D4352B94B7
            B688659D8FE80773ED408F34F8F9AAA5BF852CB4C0C3CDBAB9DE57BEC4073FAB
            2D73BFB3E69ACFABEAFAA15F922816DD4FA966DC7FF401F9D705E37F155D78EB
            C56D76913F9591059C006582678E3FBC49CFE35F46FC3AF0AFFC223E0FB6B194
            0FB64BFBFB923FE7A376FC0607E148675B451453100AC4D7FC59A1F85D616D66
            FD2D7CFDDE56E466DDB719C6D07D47E75B75E55F1DB429751F095B6A70A177D3
            A525C0ED1BE031FCC2D0077DE1FF0012693E28B17BDD1EEBED16E929899F6327
            CC0038C3007B8AD7AF9BBE0BF8DED7C3BA9DC693A9CEB0595E90D1CAFC2C728E
            393D811DFD857D1CACB2207460CA46411D0D0161B34115CC4D14F12491B70C8E
            A181FC2BCDBC6DF07F44D6AC67B9D1ADA3D3F53552D1AC236C5291FC257A0CFA
            8FD6BD3AB23C47E21B1F0CE8971A9DFCAA91C4A76A93CC8DD957DCD008F97BE1
            D6B771E1DF1E69B2AB32A4B3ADB5C27AA31DA73F4E0FE15F5C57C83E0CB09FC4
            5F1074D8917264BC59E5C0FBAAADB98FE40D7D7C3A5243614514531051451400
            5145140051451400514514005145140051451400565789FF00E454D63FEBCA6F
            FD00D6AD65789FFE454D63FEBCA6FF00D00D007CB5F0DBFE4A3E85FF005F43F9
            1AFAEABE45F86DFF00251F42FF00AFA1FC8D7D75490D8514514C414514500145
            1450015F2C7C65FF0092A1AA7FB90FFE8A5AFA9EBE58F8CBFF00254354FF0072
            1FFD14B498D1EFFF000E7FE49DE85FF5E895D4572FF0E7FE49DE85FF005E895D
            453105145140051451401F33FC75FF009284BFF5E51FF36AF61F843FF24BB46F
            A4BFFA35EBC7FE3AFF00C9425FFAF38FF9B57B07C21FF925DA37D25FFD1AF486
            F63B7A28A4240192702988A7ABDFC7A568D7BA84A46CB681E539FF0064135F21
            7862C9F59F18E9769C96B8BC8C39F6DD963F966BD5FE32FC45B4B9B26F0CE8F7
            093EF606F668DB2A0039080F7E7AFD31EB543E0478564B9D5E6F125C478B7B50
            61B7247DE9187CC47D14E3FE05ED4867D05DA8A28A620A28AAF7D790E9F61717
            B70DB20B78DA591BD15464D00781FC7BF10FDAF5DB3D0617CC7649E6CC01FF00
            968FD01FA2E3FEFAAE1341BDF17E8903BE86BA95BC571B599A085B1263A1CE39
            EA6A026F3C6FE38EFF0069D52F3EBB0337F251FA0AFAFACACE1B0B1B7B3B74DB
            0C11AC51AFA2A8C0A455EC7CBDFF000967C4BFF9FBD6BFEFCB7FF1354F54D5FC
            79AD583D96A4756B9B6720B47240C41C1C8FE1AFAD78A38A0573E41F027881BC
            2BE34B0D41C948564F2AE01FF9E6DC367E9D7F0AFAF15832865390790457CAFF
            0016FC3DFD81E3DBB68D36DB5F7FA5458E9F37DE1FF7D6EFCC57B87C26F11FFC
            243E05B412BEEBAB1FF459B3D4ED1F29FC571F8834033BAA28A4C8F5A62384F8
            C7CFC2FD57FDE87FF46A5794FC050478FAE383FF001E127FE8695F483FDDA627
            5A5D468968A28A620A28A2800A28A2800A43D0D2D1401F14EA2CF16B97522643
            ADCBB291D8EE35BFFF000B2FC69FF41FBCFD3FC2BEB0A290EE7C9FFF000B2FC6
            BFF41FBCFD3FC28FF8597E35FF00A0FDE7E9FE15F585140CE2BE126B1A8EB9E0
            85BCD52EA4B9B9FB4C89E649D7031815DE5313EED3E99215CA7C46F107FC237E
            07D46F51F6DC3A7916F83CF98FC023E832DFF01AEAE98F401F2A7C2AF0F9D7FC
            7D6292216B7B43F6A9B238C2FDDFCDB6D7D5D51A549490D8514514C4725F127C
            3DFF00092F81B50B444DD73127DA2DFD77A7381F5195FC6BE71F879E216F0BF8
            D6C2FDD8ADB33F9371E9E5B704FE1C37FC06BEBB350526344C0E46452D145310
            555BFB1B6D4AC27B2BC8566B79D0A488DD08356A8A00F997C6BF07B5AD02E64B
            9D2219752D349CAF94332C63D19475FA8FD2B9ED27C7BE2EF0D2FD9ACF56B98A
            38FE5F22702454F60AE0EDFC2BEBBAF27F8B5F707FD73A452773CCA6F8CDE379
            62D83528A3E31B92DA3CFEA2B22CF49F177C41D4C4AB1DEEA329F94DC4C4F971
            8FF78F0BF4A9BC3BFF0021C8FF00DFAFAA748FF9055AFF00D725FE5403D0E5FE
            1E7C3FB5F03E98E19D6E352B8C7DA27038F655FF00647EBFA0ED68A0D32428A2
            8A0028A28A00E53E257FC939D73FEBD8FF00315E0FF05C11F132C383FEAA6FFD
            01ABEA16FBB4C4FBD4868968A28A620A28A2800A43D0D2D1401F195B03FF0009
            743C1FF8FE5FFD0EBECC151FF154B490D8514514C41498CD2D1401E15F10FE0C
            4EF7536ADE16895D5C9796C01DA54F731FB7FB3F97A579CE97E2AF17F81E7369
            6F737765B4E5AD6E23F97FEF861C7E15F5DD713F123FE400DF8D21A678CC9F1C
            3C64F0EC596CA36FEFADBF3FA922B9DDBE2DF885AA8622F755B8E99C7C91E7FF
            001D41F954B69FF21AAFA83C2DFF0022ED9FFB940CE43E1B7C2F83C1C9FDA37E
            C971AC3AE372F29029EA17D4FA9FC3EBE91494B4C90A28A2800A63A2C8851D43
            2B0C10470453E8A00F08F1EFC139BCF9752F0AA2BC6C4B3D813B4AFF00D7327B
            7FB27F0F4AF3FD37C59E32F034BF628AE6F2C829C9B4BA8B2A3FE02C38FC2BEB
            7AE2BE257FC8B6DF53498D33C624F8E1E3278B62CB648DFDF5B719FD78AC12BE
            33F889A8292B7DAA480E012311C7FC957F4A9748FF0090EFFC0C57D47A17FC81
            6D7FDCA06F4380F873F096DFC2F2C7AAEAEF1DD6A8066345E63B7FA7F79BDFB7
            6F5AF51A4A5A6485145140054371045756F25BCF1AC90CAA51D1864329EA0D4D
            45007CDFE39F835AA691752DEF87E192FF004E6258429F34D0FB63F887B8E7F9
            D723A4F8D3C59E153F65B3D4EEED963E3ECF28DCABFF00007040AFAF857997C5
            6FF8F28FFDC34868F2893E3478DDE3D8351850FF007D6DA3CFF2AC68EDFC5FF1
            0752538BED526CEDDEF9D91FE3F7547E54ED23FE4369FEF0AFA9BC39FF00201B
            3FFAE6281EC72BF0DBE1C43E09B37B9BA749F57B85C4B22FDD8D7FB8BDFD327B
            E2BBFA4A5A648514514005145140051451400514514005145140051451400514
            51400565789FFE454D63FEBCA6FF00D00D6AD06803E24B1BDBBD32FA2BDB395E
            1B985B74722F5535D27FC2CBF1AFFD07EF3F4FF0AFAC28A562AE7C9FFF000B2F
            C6BFF41FBCFD3FC28FF8597E35FF00A0FDE7E9FE15F585140187E03BEBAD4BC0
            DA45EDECCD35CCD0069246EAC726BA3A45FBB4B4C90A28A2800AF963E32027E2
            7EA7C7F043FF00A296BEA7A89FEF52634739F0EBFE49DE85FF005E895D4522D2
            D3105145140051451401F347C7504FC42181FF002E71FF0036AE534DF1CF8A34
            7D3E2B0D3F57B9B7B58B3B224C6172493DBD49AFAF5FAD3690EE7C9C7E2578D5
            B8FEDFBCFC31FE1514BAA78D7C4A0DBBDCEB5A82370624323A9FF808E2BEB6A7
            A5160B9F397847E09EB7AADCC73EBCA74DB1072C8483338F403F87F1FCABE85D
            374DB4D234E82C2C20586DA04091C6BD87F9EF5728A109B0A28A29805797FC70
            F101D2FC1CBA642C44FA949B081D7CB5C16FD768FC4D7A854725008F9EBE03F8
            7FED9E26BAD6A64FDD5845B23247FCB47E3F45DDF98AFA269894FA4818514514
            C0F2DF8E5E1DFED4F0847AAC4999F4D9371C7531B6037EBB4FE06BCEFE08F888
            E91E323A6CCC56DB534F2F9E8245E50FFE84BFF0215F4A37DDA62D2EA3E851F1
            1315F0CEAACA4822CE5208FF0070D7C75FDA3A867FE3F2E7FEFEB57DB06A0A18
            23FFD9}
          Stretch = True
        end
        object RLLabel39: TRLLabel
          Left = 112
          Top = 77
          Width = 141
          Height = 14
          Caption = 'Identifica'#231#227'o do Emitente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw18: TRLDraw
          Left = 436
          Top = 0
          Width = 306
          Height = 84
        end
        object RLLabel54: TRLLabel
          Left = 461
          Top = 2
          Width = 86
          Height = 12
          Caption = 'CONTROLE FISCO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rlbcChaveAcesso2: TRLBarcode
          Left = 448
          Top = 15
          Width = 286
          Height = 65
          BarcodeType = bcCode128C
          Caption = '43090688065321000115550000000125100000125102'
          Margins.LeftMargin = 1.000000000000000000
          Margins.RightMargin = 1.000000000000000000
        end
        object RLLabel102: TRLLabel
          Left = 365
          Top = 3
          Width = 47
          Height = 16
          Caption = 'DANFE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel103: TRLLabel
          Left = 338
          Top = 20
          Width = 97
          Height = 12
          Caption = 'Documento Auxiliar da'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel104: TRLLabel
          Left = 338
          Top = 32
          Width = 95
          Height = 12
          Caption = 'Nota Fiscal Eletr'#244'nica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel105: TRLLabel
          Left = 338
          Top = 64
          Width = 51
          Height = 14
          Caption = '1 - SA'#205'DA'
        end
        object RLLabel106: TRLLabel
          Left = 338
          Top = 50
          Width = 68
          Height = 14
          Caption = '0 - ENTRADA'
        end
        object rllbSaidaEntrada2: TRLLabel
          Left = 410
          Top = 50
          Width = 21
          Height = 27
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = True
          Borders.DrawRight = True
          Borders.DrawBottom = True
          Caption = '1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbEnd2: TRLLabel
          Left = 8
          Top = 106
          Width = 230
          Height = 12
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbCidade2: TRLLabel
          Left = 8
          Top = 130
          Width = 230
          Height = 12
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbFone2: TRLLabel
          Left = 8
          Top = 142
          Width = 230
          Height = 12
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbCep2: TRLLabel
          Left = 8
          Top = 118
          Width = 230
          Height = 12
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbHome2: TRLLabel
          Left = 8
          Top = 154
          Width = 304
          Height = 11
          AutoSize = False
          Caption = 'Documento Auxiliar da'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel113: TRLLabel
          Left = 339
          Top = 92
          Width = 22
          Height = 16
          Caption = 'N'#186':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText22: TRLDBText
          Left = 364
          Top = 92
          Width = 62
          Height = 16
          DataField = 'NumNota'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel114: TRLLabel
          Left = 323
          Top = 134
          Width = 34
          Height = 12
          Caption = 'P'#225'gina:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLSystemInfo3: TRLSystemInfo
          Left = 360
          Top = 133
          Width = 28
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Info = itPageNumber
          ParentFont = False
        end
        object RLLabel115: TRLLabel
          Left = 392
          Top = 134
          Width = 6
          Height = 12
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLSystemInfo4: TRLSystemInfo
          Left = 403
          Top = 133
          Width = 28
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Info = itLastPageNumber
          ParentFont = False
        end
        object RLDraw19: TRLDraw
          Left = 0
          Top = 166
          Width = 437
          Height = 29
        end
        object rllbNatOperacao2: TRLLabel
          Left = 3
          Top = 179
          Width = 431
          Height = 11
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel117: TRLLabel
          Left = 3
          Top = 168
          Width = 410
          Height = 12
          AutoSize = False
          Caption = 'NATUREZA DE OPERA'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw21: TRLDraw
          Left = 0
          Top = 194
          Width = 153
          Height = 23
        end
        object RLLabel118: TRLLabel
          Left = 3
          Top = 195
          Width = 89
          Height = 10
          Caption = 'INSCRI'#199#195'O ESTADUAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw22: TRLDraw
          Left = 152
          Top = 194
          Width = 251
          Height = 23
        end
        object RLLabel119: TRLLabel
          Left = 155
          Top = 195
          Width = 142
          Height = 10
          Caption = 'INSC.ESTADUAL SUBST.TRIBUT'#193'RIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw23: TRLDraw
          Left = 402
          Top = 194
          Width = 340
          Height = 23
        end
        object RLLabel120: TRLLabel
          Left = 405
          Top = 195
          Width = 23
          Height = 10
          Caption = 'CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw24: TRLDraw
          Left = 436
          Top = 83
          Width = 306
          Height = 33
        end
        object RLLabel121: TRLLabel
          Left = 542
          Top = 85
          Width = 76
          Height = 10
          Caption = 'CHAVE DE ACESSO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel122: TRLLabel
          Left = 339
          Top = 113
          Width = 46
          Height = 16
          Caption = 'S'#201'RIE:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText23: TRLDBText
          Left = 388
          Top = 113
          Width = 38
          Height = 16
          DataField = 'Serie'
          DataSource = DM1.dsNotaFiscal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw25: TRLDraw
          Left = 436
          Top = 115
          Width = 306
          Height = 52
        end
        object rllbTextoA2: TRLLabel
          Left = 446
          Top = 123
          Width = 179
          Height = 10
          Caption = 'Consulta de autenticidade no portal nacional da NF-e'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbTextoB2: TRLLabel
          Left = 446
          Top = 144
          Width = 211
          Height = 10
          Caption = 'www.nfe.fazenda.gov.br/portal ou no site da Sefaz Autorizadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw71: TRLDraw
          Left = 436
          Top = 166
          Width = 306
          Height = 29
        end
        object rllbTextoProt2: TRLLabel
          Left = 446
          Top = 168
          Width = 156
          Height = 10
          Caption = 'PROTOCOLO DE AUTORIZA'#199#195'O DE USO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbProtocolo2: TRLLabel
          Left = 442
          Top = 179
          Width = 298
          Height = 14
          Alignment = taCenter
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rlbcContingencia2: TRLBarcode
          Left = 446
          Top = 119
          Width = 66
          Height = 44
          BarcodeType = bcCode128C
          Caption = '1521'
          Margins.LeftMargin = 1.000000000000000000
          Margins.RightMargin = 1.000000000000000000
        end
        object rllbInscrEstadual2: TRLLabel
          Left = 3
          Top = 204
          Width = 106
          Height = 12
          Caption = 'INSCRI'#199#195'O ESTADUAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbCNPJ2: TRLLabel
          Left = 405
          Top = 204
          Width = 106
          Height = 12
          Caption = 'INSCRI'#199#195'O ESTADUAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object rllbChaveAcesso2: TRLLabel
          Left = 438
          Top = 98
          Width = 302
          Height = 14
          Alignment = taCenter
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rllbEmpresa2: TRLLabel
          Left = 8
          Top = 92
          Width = 321
          Height = 12
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object RLBand6: TRLBand
      Left = 26
      Top = 930
      Width = 742
      Height = 123
      BandType = btFooter
      BeforePrint = RLBand6BeforePrint
      object RLDraw76: TRLDraw
        Left = 0
        Top = 0
        Width = 413
        Height = 123
        Align = faLeft
      end
      object RLLabel65: TRLLabel
        Left = 2
        Top = 3
        Width = 141
        Height = 10
        Caption = 'INFORMA'#199#213'ES COMPLEMENTARES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLDraw77: TRLDraw
        Left = 415
        Top = 0
        Width = 327
        Height = 123
        Align = faRight
      end
      object RLLabel66: TRLLabel
        Left = 419
        Top = 3
        Width = 90
        Height = 10
        Caption = 'RESERVADO AO FISCO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rlmDadosAdicionais: TRLMemo
        Left = 3
        Top = 15
        Width = 392
        Height = 105
        AutoSize = False
        Behavior = [beSiteExpander]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        IntegralHeight = True
        ParentFont = False
      end
    end
    object RLBand5: TRLBand
      Left = 26
      Top = 916
      Width = 742
      Height = 14
      BandType = btFooter
      object RLLabel38: TRLLabel
        Left = 3
        Top = 3
        Width = 77
        Height = 10
        Caption = 'DADOS ADICIONAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw31: TRLDraw
        Left = 0
        Top = 0
        Width = 742
        Height = 1
        Align = faTop
        DrawKind = dkLine
      end
    end
  end
end
