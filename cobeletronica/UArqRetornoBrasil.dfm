object fArqRetornoBrasil: TfArqRetornoBrasil
  Left = 6
  Top = 97
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busca Aquivo Retorno Brasil (CNAB 400)'
  ClientHeight = 535
  ClientWidth = 1008
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
    Width = 1008
    Height = 535
    Align = alClient
    TabOrder = 0
    object ALed1: TALed
      Left = 148
      Top = 515
      Width = 16
      Height = 16
      TrueColor = clTeal
      FalseColor = clTeal
    end
    object Label8: TLabel
      Left = 169
      Top = 518
      Width = 56
      Height = 13
      Caption = 'Liquidado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ALed2: TALed
      Left = 3
      Top = 515
      Width = 16
      Height = 16
      TrueColor = clTeal
      FalseColor = clAqua
    end
    object Label2: TLabel
      Left = 24
      Top = 518
      Width = 112
      Height = 13
      Caption = 'Entrada Confirmada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ALed3: TALed
      Left = 236
      Top = 515
      Width = 16
      Height = 16
      TrueColor = clTeal
      FalseColor = clRed
    end
    object Label3: TLabel
      Left = 257
      Top = 518
      Width = 97
      Height = 13
      Caption = 'T'#237'tulo a Protesto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 393
      Top = 518
      Width = 93
      Height = 13
      Caption = 'T'#237'tulo Rejeitado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ALed4: TALed
      Left = 372
      Top = 515
      Width = 16
      Height = 16
      TrueColor = clTeal
      FalseColor = clYellow
    end
    object RxLabel1: TRxLabel
      Left = 144
      Top = 46
      Width = 157
      Height = 13
      Caption = 'Arquivo de retorno da filial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ALed5: TALed
      Left = 494
      Top = 515
      Width = 16
      Height = 16
      TrueColor = clTeal
      FalseColor = clMaroon
    end
    object Label5: TLabel
      Left = 515
      Top = 518
      Width = 118
      Height = 13
      Caption = 'Vencimento Alterado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 1006
      Height = 36
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 263
        Top = 15
        Width = 39
        Height = 13
        Caption = 'Arquivo:'
      end
      object RxSpeedButton1: TRxSpeedButton
        Left = 823
        Top = 3
        Width = 91
        Height = 29
        Hint = 'Imprime o Arquivo Selecionado'
        DropDownMenu = PopupMenu1
        Caption = 'Imprimir'
        Glyph.Data = {
          0E030000424D0E030000000000003600000028000000110000000E0000000100
          180000000000D802000000000000000000000000000000000000BFBFBFBFBFBF
          BFBFBF0000000000000000000000000000000000000000000000000000000000
          00000000BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF000000BFBFBFBFBF
          BF00BFBFBF000000000000000000000000000000000000000000000000000000
          000000000000000000000000BFBFBF000000BFBFBF00BFBFBF000000BFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBF00FFFF00FFFF00FFFFBFBFBFBFBFBF000000
          000000000000BFBFBF00BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBF7F7F7F7F7F7F7F7F7FBFBFBFBFBFBF000000BFBFBF000000BFBFBF00BFBF
          BF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000BFBFBFBFBFBF00000000BFBFBF000000BFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF000000BF
          BFBF00000000BFBFBFBFBFBF0000000000000000000000000000000000000000
          00000000000000000000BFBFBF000000BFBFBF00000000000000BFBFBFBFBFBF
          BFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00BFBFBF000000BFBFBF00000000BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFF
          000000000000000000000000000000FFFFFF000000000000000000000000BFBF
          BF00BFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBF000000FFFFFF000000000000000000000000000000FFFFFF000000
          BFBFBFBFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBF00BFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00000000000000000000000000000000
          0000000000000000000000BFBFBFBFBFBF00}
        Layout = blGlyphLeft
      end
      object Label6: TLabel
        Left = 8
        Top = 16
        Width = 23
        Height = 13
        Caption = 'Filial:'
      end
      object FilenameEdit1: TFilenameEdit
        Left = 306
        Top = 7
        Width = 334
        Height = 21
        NumGlyphs = 1
        TabOrder = 1
      end
      object BitBtn1: TBitBtn
        Left = 641
        Top = 3
        Width = 91
        Height = 29
        Hint = 'Busca o arquivo selecionado ao lado'
        Caption = '&Buscar Arq.'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
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
        Left = 732
        Top = 3
        Width = 91
        Height = 29
        Hint = 'Cancela a sele'#231#227'o do arquivo'
        Caption = 'Ca&ncelar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BitBtn2Click
        Glyph.Data = {
          CE070000424DCE07000000000000360000002800000024000000120000000100
          18000000000098070000CE0E0000C40E00000000000000000000008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          0080800080800080800080800080800080808080808080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080FFFFFF008080008080008080008080008080008080
          0080800080800080800080800080800080800080800080800080800000FF0000
          800000808080800080800080800080800080800080800000FF80808000808000
          8080008080008080008080008080008080008080808080808080FFFFFF008080
          008080008080008080008080008080FFFFFF0080800080800080800080800080
          800080800080800000FF00008000008000008080808000808000808000808000
          00FF000080000080808080008080008080008080008080008080008080808080
          FFFFFF008080808080FFFFFF008080008080008080FFFFFF808080808080FFFF
          FF0080800080800080800080800080800080800000FF00008000008000008000
          00808080800080800000FF000080000080000080000080808080008080008080
          008080008080008080808080FFFFFF008080008080808080FFFFFF008080FFFF
          FF808080008080008080808080FFFFFF00808000808000808000808000808000
          80800000FF000080000080000080000080808080000080000080000080000080
          000080808080008080008080008080008080008080808080FFFFFF0080800080
          80008080808080FFFFFF808080008080008080008080008080808080FFFFFF00
          80800080800080800080800080800080800000FF000080000080000080000080
          0000800000800000800000808080800080800080800080800080800080800080
          80008080808080FFFFFF00808000808000808080808000808000808000808000
          8080FFFFFF808080008080008080008080008080008080008080008080008080
          0000FF0000800000800000800000800000800000808080800080800080800080
          80008080008080008080008080008080008080808080FFFFFF00808000808000
          8080008080008080008080FFFFFF808080008080008080008080008080008080
          0080800080800080800080800080800000800000800000800000800000808080
          8000808000808000808000808000808000808000808000808000808000808000
          8080808080FFFFFF008080008080008080008080008080808080008080008080
          0080800080800080800080800080800080800080800080800080800000FF0000
          8000008000008000008080808000808000808000808000808000808000808000
          8080008080008080008080008080008080808080FFFFFF008080008080008080
          8080800080800080800080800080800080800080800080800080800080800080
          800080800000FF00008000008000008000008000008080808000808000808000
          8080008080008080008080008080008080008080008080008080008080808080
          008080008080008080008080808080FFFFFF0080800080800080800080800080
          800080800080800080800080800000FF00008000008000008080808000008000
          0080000080808080008080008080008080008080008080008080008080008080
          008080008080808080008080008080008080008080008080808080FFFFFF0080
          800080800080800080800080800080800080800080800000FF00008000008000
          00808080800080800000FF000080000080000080808080008080008080008080
          008080008080008080008080008080808080008080008080008080808080FFFF
          FF008080008080808080FFFFFF00808000808000808000808000808000808000
          80800000FF0000800000808080800080800080800080800000FF000080000080
          000080808080008080008080008080008080008080008080808080FFFFFF0080
          80008080808080008080808080FFFFFF008080008080808080FFFFFF00808000
          80800080800080800080800080800080800000FF000080008080008080008080
          0080800080800000FF0000800000800000800080800080800080800080800080
          80008080808080FFFFFFFFFFFF808080008080008080008080808080FFFFFF00
          8080008080808080FFFFFF008080008080008080008080008080008080008080
          0080800080800080800080800080800080800080800000FF0000800000FF0080
          8000808000808000808000808000808000808080808080808000808000808000
          8080008080008080808080FFFFFFFFFFFFFFFFFF808080008080008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080808080808080808080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          008080008080008080008080008080008080}
        NumGlyphs = 2
      end
      object BitBtn3: TBitBtn
        Left = 913
        Top = 3
        Width = 91
        Height = 29
        Hint = 'Atualiza o Contas a Receber'
        Caption = '&Atualiza'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = BitBtn3Click
        Glyph.Data = {
          F2060000424DF20600000000000036040000280000001A000000190000000100
          080000000000BC020000CE0E0000C40E00000001000000000000000000004000
          00006000000080000000A0000000C0000000E0000000FF000000008000004080
          00006080000080800000A0800000C0800000E0800000FF80000000C0000040C0
          000060C0000080C00000A0C00000C0C00000E0C00000FFC0000000FF000040FF
          000060FF000080FF0000A0FF0000C0FF0000E0FF0000FFFF0000000040004000
          40006000400080004000A0004000C0004000E0004000FF004000008040004080
          40006080400080804000A0804000C0804000E0804000FF80400000C0400040C0
          400060C0400080C04000A0C04000C0C04000E0C04000FFC0400000FF400040FF
          400060FF400080FF4000A0FF4000C0FF4000E0FF4000FFFF4000000060004000
          60006000600080006000A0006000C0006000E0006000FF006000008060004080
          60006080600080806000A0806000C0806000E0806000FF80600000C0600040C0
          600060C0600080C06000A0C06000C0C06000E0C06000FFC0600000FF600040FF
          600060FF600080FF6000A0FF6000C0FF6000E0FF6000FFFF6000000080004000
          80006000800080008000A0008000C0008000E0008000FF008000008080004080
          80006080800080808000A0808000C0808000E0808000FF80800000C0800040C0
          800060C0800080C08000A0C08000C0C08000E0C08000FFC0800000FF800040FF
          800060FF800080FF8000A0FF8000C0FF8000E0FF8000FFFF80000000A0004000
          A0006000A0008000A000A000A000C000A000E000A000FF00A0000080A0004080
          A0006080A0008080A000A080A000C080A000E080A000FF80A00000C0A00040C0
          A00060C0A00080C0A000A0C0A000C0C0A000E0C0A000FFC0A00000FFA00040FF
          A00060FFA00080FFA000A0FFA000C0FFA000E0FFA000FFFFA0000000C0004000
          C0006000C0008000C000A000C000C000C000E000C000FF00C0000080C0004080
          C0006080C0008080C000A080C000C080C000E080C000FF80C00000C0C00040C0
          C00060C0C00080C0C000A0C0C000C0C0C000E0C0C000FFC0C00000FFC00040FF
          C00060FFC00080FFC000A0FFC000C0FFC000E0FFC000FFFFC0000000E0004000
          E0006000E0008000E000A000E000C000E000E000E000FF00E0000080E0004080
          E0006080E0008080E000A080E000C080E000E080E000FF80E00000C0E00040C0
          E00060C0E00080C0E000A0C0E000C0C0E000E0C0E000FFC0E00000FFE00040FF
          E00060FFE00080FFE000A0FFE000C0FFE000E0FFE000FFFFE0000000FF004000
          FF006000FF008000FF00A000FF00C000FF00E000FF00FF00FF000080FF004080
          FF006080FF008080FF00A080FF00C080FF00E080FF00FF80FF0000C0FF0040C0
          FF0060C0FF0080C0FF00A0C0FF00C0C0FF00E0C0FF00FFC0FF0000FFFF0040FF
          FF0060FFFF0080FFFF00A0FFFF00C0FFFF00E0FFFF00FFFFFF00DEDEDEDEDEDE
          DEDEDEDEDEDEDE94949494949494949494DEDEDE0000DEDEDEDEDEDEDEDEDEDE
          DEDEDE0000000000000000949494DEDE0000DEFFFFFFFFFFFFFFFFFFDEDE0080
          8080808080008400949494DE0000DEDEDEDEDEDEDEDEDEDEDEDE008080808080
          80008400949494940000DEDEDEDEDE0803DEDEDE008080808080800000000084
          8400DEDE0000DEDE181818080803DEDE0080808080808000F8F80084848400DE
          0000181808080808080303DE80808080808000F8F8F80000000000DE00000808
          0808080808080803000000000000000707F800DEDEDEDEDE0000080818DEDE08
          0808030300F8F8F8F8F8F8F8F8F800DEDEDEDEDE0000080818DEDE080303DEDE
          00F807070707070707F800DEDEDEDEDE0000080818DEDE0303DEDEDE00F8F8F8
          F8F8F8F8F8F800DEDEDEDEDE0000DEDEDEDEDEDEDEDEDEDE00F80707F8000000
          000000DEDEDEDEDE0000DEDEDEDEDEDEDEDEDEDEDE00F8F800DEDEDEDEDEDEDE
          DEDEDEDE00000000000000000000000000DE0000FFDEDEDEDEDEDE080808DEDE
          000000F8F8F8F8F8F8F8F8F800DEDEDEDE0303DEDEDE18080808DEDE000000F8
          F8F8F8F8F8F8F8F800DEDEDE030308DEDEDE18080808DEDE000000F807070707
          070707F800DE0303080808DEDEDE18080808DEDE000000F8F8F8F8F8F8F8F8F8
          00DE030808080808080808080818DEDE000000F807070707070707F800DEDE03
          0308080808080818DEDEDEDE000000F8F8F8F8F8F8F8F8F800DEDEDE03080818
          181818DEDEDEDEDE000000F80707F8000000000000DEDEDEDE0308DEDEDEDEDE
          DEDEDEDE0000DE00F8F800DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
          0000DEDE0000DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE0000DEDE
          DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE0000DEDEDEDEDEDE
          DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE0000}
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 33
        Top = 8
        Width = 193
        Height = 21
        DropDownCount = 8
        LookupField = 'CodConta'
        LookupDisplay = 'NomeConta'
        LookupSource = DM1.dsContas
        TabOrder = 0
        OnEnter = RxDBLookupCombo1Enter
      end
    end
    object RxDBGrid1: TRxDBGrid
      Left = 2
      Top = 63
      Width = 1002
      Height = 448
      DataSource = dsmArquivo
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnGetCellParams = RxDBGrid1GetCellParams
      Columns = <
        item
          Expanded = False
          FieldName = 'NumCReceber'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' CReceber'
          Width = 72
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Atualizado'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumTitBanco'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' T'#237'tulo no Banco'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumTitEmpresa'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' T'#237'tulo na Empresa'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeCliente'
          Title.Alignment = taCenter
          Title.Caption = 'Nome do Cliente'
          Width = 246
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtVenc'
          Title.Alignment = taCenter
          Title.Caption = 'Vencimento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NumNota'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Parcela'
          Width = 60
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtLiquidacao'
          Title.Alignment = taCenter
          Title.Caption = 'Liquida'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DtCredito'
          Title.Caption = 'Cr'#233'dito'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrTitulo'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. T'#237'tulo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrPago'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr.Pago'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeOcorrenciaRet'
          Title.Alignment = taCenter
          Title.Caption = 'Ocorr'#234'ncia Retorno'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrAbatimento'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr.Abatimento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrDesconto'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr.Desconto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrJurosPagos'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr.Juros Pago'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrDespesaCobranca'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr.Desp.Cobran'#231'a'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtOcorrencia'
          Title.Alignment = taCenter
          Title.Caption = 'Dt.Ocorr'#234'ncia'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CodMotRejeicao'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd.Rejei'#231#227'o'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CodOcorrenciaRet'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd.Ocorr'#234'ncia Retorno'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TipoCobranca'
          Title.Alignment = taCenter
          Title.Caption = 'T.Cobran'#231'a'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EspecieDoc'
          Title.Alignment = taCenter
          Title.Caption = 'Esp.Doc'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Protesto'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescErro1'
          Title.Alignment = taCenter
          Title.Caption = 'Erro (motivo da rejei'#231#227'o)'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescErro6'
          Title.Alignment = taCenter
          Title.Caption = 'Motivo da recusa ou dev. do t'#237'tulo pelo cart'#243'rio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescLiquidacao'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o da liquida'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CodLiquidacao'
          Title.Alignment = taCenter
          Title.Caption = 'Nat.Recebimento'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TipoCobranca'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo Cobran'#231'a'
          Visible = True
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 616
    Top = 32
    object Visualizar1: TMenuItem
      Caption = '&Detalhado'
      OnClick = Visualizar1Click
    end
    object Reduzido1: TMenuItem
      Caption = 'Reduzido'
      OnClick = Reduzido1Click
    end
  end
  object tExtComissaoIns: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbExtComissao.db'
    Left = 508
    Top = 262
    object tExtComissaoInsNroLancamento: TIntegerField
      FieldName = 'NroLancamento'
    end
    object tExtComissaoInsCodVendedor: TIntegerField
      FieldName = 'CodVendedor'
    end
    object tExtComissaoInsDtReferencia: TDateField
      FieldName = 'DtReferencia'
    end
    object tExtComissaoInsNroDoc: TIntegerField
      FieldName = 'NroDoc'
    end
    object tExtComissaoInsParcDoc: TIntegerField
      FieldName = 'ParcDoc'
    end
    object tExtComissaoInsCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object tExtComissaoInsFuncao: TStringField
      FieldName = 'Funcao'
      Size = 1
    end
    object tExtComissaoInsVlrBase: TFloatField
      FieldName = 'VlrBase'
    end
    object tExtComissaoInsPercDescDupl: TFloatField
      FieldName = 'PercDescDupl'
    end
    object tExtComissaoInsPercComissao: TFloatField
      FieldName = 'PercComissao'
    end
    object tExtComissaoInsVlrComissao: TFloatField
      FieldName = 'VlrComissao'
    end
    object tExtComissaoInsTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object tExtComissaoInsSuspensa: TBooleanField
      FieldName = 'Suspensa'
    end
  end
  object tCReceber: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbCReceber.DB'
    Left = 368
    Top = 296
    object tCReceberFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tCReceberNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
    end
    object tCReceberNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object tCReceberQuitado: TBooleanField
      FieldName = 'Quitado'
    end
    object tCReceberCodCli: TIntegerField
      FieldName = 'CodCli'
    end
    object tCReceberTipoDoc: TStringField
      FieldName = 'TipoDoc'
      Size = 2
    end
    object tCReceberDtGerado: TDateField
      FieldName = 'DtGerado'
    end
    object tCReceberHistorico: TStringField
      FieldName = 'Historico'
      Size = 100
    end
    object tCReceberCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tCReceberDuplicataImp: TBooleanField
      FieldName = 'DuplicataImp'
    end
    object tCReceberVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
    object tCReceberBoletoImp: TBooleanField
      FieldName = 'BoletoImp'
    end
    object tCReceberlkNomeCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCliente'
      LookupDataSet = tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCli'
      Size = 40
      Lookup = True
    end
  end
  object tCliente: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbCliente.DB'
    Left = 400
    Top = 296
    object tClienteCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tClienteNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tClienteEndereco: TStringField
      FieldName = 'Endereco'
      Size = 40
    end
    object tClienteBairro: TStringField
      FieldName = 'Bairro'
      Size = 25
    end
    object tClienteCidade: TStringField
      FieldName = 'Cidade'
      Size = 26
    end
    object tClienteUf: TStringField
      FieldName = 'Uf'
      Size = 2
    end
    object tClienteCep: TStringField
      FieldName = 'Cep'
      Size = 10
    end
    object tClienteTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object tClienteTelefone2: TStringField
      FieldName = 'Telefone2'
      Size = 15
    end
    object tClienteFax: TStringField
      FieldName = 'Fax'
      Size = 15
    end
    object tClientePessoa: TStringField
      FieldName = 'Pessoa'
      Size = 1
    end
    object tClienteCgcCpf: TStringField
      FieldName = 'CgcCpf'
      Size = 18
    end
    object tClienteInscrEst: TStringField
      FieldName = 'InscrEst'
      Size = 18
    end
    object tClienteContato: TStringField
      FieldName = 'Contato'
      Size = 30
    end
    object tClienteObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 1
    end
    object tClienteAprovCredito: TStringField
      FieldName = 'AprovCredito'
      Size = 1
    end
    object tClienteTipoAprov: TStringField
      FieldName = 'TipoAprov'
      Size = 1
    end
    object tClienteEndEntrega: TStringField
      FieldName = 'EndEntrega'
      Size = 40
    end
    object tClienteBairroEntrega: TStringField
      FieldName = 'BairroEntrega'
      Size = 26
    end
    object tClienteCidEntrega: TStringField
      FieldName = 'CidEntrega'
      Size = 26
    end
    object tClienteCepEntrega: TStringField
      FieldName = 'CepEntrega'
      Size = 10
    end
    object tClienteUfEntrega: TStringField
      FieldName = 'UfEntrega'
      Size = 2
    end
    object tClienteCgcCpfEntrega: TStringField
      FieldName = 'CgcCpfEntrega'
      Size = 18
    end
    object tClienteInscEntrega: TStringField
      FieldName = 'InscEntrega'
      Size = 18
    end
    object tClienteEndPgto: TStringField
      FieldName = 'EndPgto'
      Size = 40
    end
    object tClienteBairroPgto: TStringField
      FieldName = 'BairroPgto'
      Size = 26
    end
    object tClienteCidPgto: TStringField
      FieldName = 'CidPgto'
      Size = 26
    end
    object tClienteCepPgto: TStringField
      FieldName = 'CepPgto'
      Size = 10
    end
    object tClienteUfPgto: TStringField
      FieldName = 'UfPgto'
      Size = 2
    end
    object tClienteFantasia: TStringField
      FieldName = 'Fantasia'
    end
    object tClienteDtCadastro: TDateField
      FieldName = 'DtCadastro'
    end
    object tClienteCodVendedor: TIntegerField
      FieldName = 'CodVendedor'
    end
    object tClienteObsCtas: TMemoField
      FieldName = 'ObsCtas'
      BlobType = ftMemo
      Size = 1
    end
    object tClienteLojas: TIntegerField
      FieldName = 'Lojas'
    end
    object tClienteSelecionado: TBooleanField
      FieldName = 'Selecionado'
    end
    object tClienteCaixaPostal: TStringField
      FieldName = 'CaixaPostal'
      Size = 10
    end
    object tClienteRg: TStringField
      FieldName = 'Rg'
      Size = 10
    end
    object tClienteCodCidade: TIntegerField
      FieldName = 'CodCidade'
    end
    object tClienteCodCidadeE: TIntegerField
      FieldName = 'CodCidadeE'
    end
    object tClienteCodCidadeP: TIntegerField
      FieldName = 'CodCidadeP'
    end
    object tClienteEmail: TStringField
      FieldName = 'Email'
      Size = 50
    end
    object tClientePercTransf: TFloatField
      FieldName = 'PercTransf'
    end
    object tClienteCodCondPgto: TIntegerField
      FieldName = 'CodCondPgto'
    end
    object tClienteDtNascContato: TDateField
      FieldName = 'DtNascContato'
    end
    object tClienteNomeResp: TStringField
      FieldName = 'NomeResp'
      Size = 30
    end
    object tClienteContatoCliente: TStringField
      FieldName = 'ContatoCliente'
      Size = 40
    end
    object tClienteContatoModelagem: TStringField
      FieldName = 'ContatoModelagem'
      Size = 40
    end
    object tClienteImpItemNotaPorTam: TBooleanField
      FieldName = 'ImpItemNotaPorTam'
    end
    object tClienteCodBancoBoleto: TIntegerField
      FieldName = 'CodBancoBoleto'
    end
    object tClienteUsuario: TStringField
      FieldName = 'Usuario'
      Size = 15
    end
    object tClienteDtCad: TDateField
      FieldName = 'DtCad'
    end
    object tClienteHrCad: TTimeField
      FieldName = 'HrCad'
    end
  end
  object mArquivo: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NumTitEmpresa'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NumTitBanco'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CodCarteira'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CodOcorrenciaRet'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NomeOcorrenciaRet'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DtOcorrencia'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NumNota'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DtVenc'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'VlrTitulo'
        DataType = ftFloat
      end
      item
        Name = 'EspecieDoc'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'VlrDespesaCobranca'
        DataType = ftFloat
      end
      item
        Name = 'VlrIOF'
        DataType = ftFloat
      end
      item
        Name = 'VlrAbatimento'
        DataType = ftFloat
      end
      item
        Name = 'VlrDesconto'
        DataType = ftFloat
      end
      item
        Name = 'VlrPago'
        DataType = ftFloat
      end
      item
        Name = 'VlrJurosPagos'
        DataType = ftFloat
      end
      item
        Name = 'DtLiquidacao'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'InstrCancelada'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'NomeCliente'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Erros'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CodLiquidacao'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DescLiquidacao'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'Atualizado'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CodCliente'
        DataType = ftInteger
      end
      item
        Name = 'Parcela'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DescErro1'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'DescErro2'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'DescErro3'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'DescErro4'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'DescErro5'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'DescErro6'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'NumCReceber'
        DataType = ftInteger
      end
      item
        Name = 'CodInstrCancelada'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ConfNossoNumero'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'VlrOutrasDespesas'
        DataType = ftFloat
      end
      item
        Name = 'VlrJurosCartorioDesc'
        DataType = ftFloat
      end
      item
        Name = 'VlrMulta'
        DataType = ftFloat
      end
      item
        Name = 'VlrOutrosCreditos'
        DataType = ftFloat
      end
      item
        Name = 'FormadeCredito'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Filial'
        DataType = ftInteger
      end
      item
        Name = 'DtCredito'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CodNatRecebimento'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TipoCobranca'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 208
    Top = 296
    Data = {
      E60400009619E0BD01000000180000002B000000000003000000E6040D4E756D
      546974456D707265736101004900000001000557494454480200020019000B4E
      756D54697442616E636F01004900000001000557494454480200020014000B43
      6F64436172746569726101004900000001000557494454480200020003001043
      6F644F636F7272656E6369615265740100490000000100055749445448020002
      000200114E6F6D654F636F7272656E6369615265740100490000000100055749
      4454480200020064000C44744F636F7272656E63696101004900000001000557
      49445448020002000A00074E756D4E6F74610100490000000100055749445448
      020002000A0006447456656E630100490000000100055749445448020002000A
      0009566C72546974756C6F08000400000000000A45737065636965446F630100
      490000000100055749445448020002001E0012566C7244657370657361436F62
      72616E6361080004000000000006566C72494F4608000400000000000D566C72
      41626174696D656E746F08000400000000000B566C72446573636F6E746F0800
      04000000000007566C725061676F08000400000000000D566C724A75726F7350
      61676F7308000400000000000C44744C69717569646163616F01004900000001
      00055749445448020002000A000E496E73747243616E63656C61646101004900
      000001000557494454480200020046000B4E6F6D65436C69656E746501004900
      00000100055749445448020002001E00054572726F7301004900000001000557
      494454480200020008000D436F644C69717569646163616F0100490000000100
      0557494454480200020002000E446573634C69717569646163616F0100490000
      0001000557494454480200020046000A417475616C697A61646F010049000000
      01000557494454480200020001000A436F64436C69656E746504000100000000
      000750617263656C610100490000000100055749445448020002001400094465
      73634572726F310100490000000100055749445448020002005A000944657363
      4572726F320100490000000100055749445448020002005A0009446573634572
      726F330100490000000100055749445448020002005A0009446573634572726F
      340100490000000100055749445448020002005A0009446573634572726F3501
      00490000000100055749445448020002005A0009446573634572726F36010049
      0000000100055749445448020002005A000B4E756D4352656365626572040001
      000000000011436F64496E73747243616E63656C616461010049000000010005
      57494454480200020004000F436F6E664E6F73736F4E756D65726F0100490000
      00010005574944544802000200080011566C724F757472617344657370657361
      73080004000000000014566C724A75726F73436172746F72696F446573630800
      04000000000008566C724D756C7461080004000000000011566C724F7574726F
      734372656469746F7308000400000000000E466F726D6164654372656469746F
      01004900000001000557494454480200020014000646696C69616C0400010000
      0000000944744372656469746F0100490000000100055749445448020002000A
      0011436F644E61745265636562696D656E746F01004900000001000557494454
      480200020002000C5469706F436F6272616E6361010049000000010005574944
      54480200020001000000}
    object mArquivoNumTitEmpresa: TStringField
      FieldName = 'NumTitEmpresa'
      Size = 25
    end
    object mArquivoNumTitBanco: TStringField
      FieldName = 'NumTitBanco'
    end
    object mArquivoCodCarteira: TStringField
      FieldName = 'CodCarteira'
      Size = 3
    end
    object mArquivoCodOcorrenciaRet: TStringField
      FieldName = 'CodOcorrenciaRet'
      Size = 2
    end
    object mArquivoNomeOcorrenciaRet: TStringField
      FieldName = 'NomeOcorrenciaRet'
      Size = 100
    end
    object mArquivoDtOcorrencia: TStringField
      FieldName = 'DtOcorrencia'
      Size = 10
    end
    object mArquivoNumNota: TStringField
      FieldName = 'NumNota'
      Size = 10
    end
    object mArquivoDtVenc: TStringField
      FieldName = 'DtVenc'
      Size = 10
    end
    object mArquivoVlrTitulo: TFloatField
      FieldName = 'VlrTitulo'
    end
    object mArquivoEspecieDoc: TStringField
      FieldName = 'EspecieDoc'
      Size = 30
    end
    object mArquivoVlrDespesaCobranca: TFloatField
      FieldName = 'VlrDespesaCobranca'
    end
    object mArquivoVlrIOF: TFloatField
      FieldName = 'VlrIOF'
    end
    object mArquivoVlrAbatimento: TFloatField
      FieldName = 'VlrAbatimento'
    end
    object mArquivoVlrDesconto: TFloatField
      FieldName = 'VlrDesconto'
    end
    object mArquivoVlrPago: TFloatField
      FieldName = 'VlrPago'
    end
    object mArquivoVlrJurosPagos: TFloatField
      FieldName = 'VlrJurosPagos'
    end
    object mArquivoDtLiquidacao: TStringField
      FieldName = 'DtLiquidacao'
      Size = 10
    end
    object mArquivoInstrCancelada: TStringField
      FieldName = 'InstrCancelada'
      Size = 70
    end
    object mArquivoNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 30
    end
    object mArquivoErros: TStringField
      FieldName = 'Erros'
      Size = 8
    end
    object mArquivoCodLiquidacao: TStringField
      FieldName = 'CodLiquidacao'
      Size = 2
    end
    object mArquivoDescLiquidacao: TStringField
      FieldName = 'DescLiquidacao'
      Size = 70
    end
    object mArquivoAtualizado: TStringField
      FieldName = 'Atualizado'
      Size = 1
    end
    object mArquivoCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object mArquivoParcela: TStringField
      FieldName = 'Parcela'
    end
    object mArquivoDescErro1: TStringField
      FieldName = 'DescErro1'
      Size = 90
    end
    object mArquivoDescErro2: TStringField
      FieldName = 'DescErro2'
      Size = 90
    end
    object mArquivoDescErro3: TStringField
      FieldName = 'DescErro3'
      Size = 90
    end
    object mArquivoDescErro4: TStringField
      FieldName = 'DescErro4'
      Size = 90
    end
    object mArquivoDescErro5: TStringField
      FieldName = 'DescErro5'
      Size = 90
    end
    object mArquivoDescErro6: TStringField
      FieldName = 'DescErro6'
      Size = 90
    end
    object mArquivoNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
    end
    object mArquivoCodInstrCancelada: TStringField
      FieldName = 'CodInstrCancelada'
      Size = 4
    end
    object mArquivoConfNossoNumero: TStringField
      FieldName = 'ConfNossoNumero'
      Size = 8
    end
    object mArquivoVlrOutrasDespesas: TFloatField
      FieldName = 'VlrOutrasDespesas'
    end
    object mArquivoVlrJurosCartorioDesc: TFloatField
      FieldName = 'VlrJurosCartorioDesc'
    end
    object mArquivoVlrMulta: TFloatField
      FieldName = 'VlrMulta'
    end
    object mArquivoVlrOutrosCreditos: TFloatField
      FieldName = 'VlrOutrosCreditos'
    end
    object mArquivoFormadeCredito: TStringField
      FieldName = 'FormadeCredito'
    end
    object mArquivoFilial: TIntegerField
      FieldName = 'Filial'
    end
    object mArquivoDtCredito: TStringField
      FieldName = 'DtCredito'
      Size = 10
    end
    object mArquivoCodNatRecebimento: TStringField
      FieldName = 'CodNatRecebimento'
      Size = 2
    end
    object mArquivoTipoCobranca: TStringField
      FieldName = 'TipoCobranca'
      Size = 1
    end
  end
  object dsmArquivo: TDataSource
    DataSet = mArquivo
    Left = 232
    Top = 296
  end
  object tCReceberParc: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbCReceberParc.DB'
    Left = 368
    Top = 328
    object tCReceberParcFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tCReceberParcNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
    end
    object tCReceberParcParcCReceber: TIntegerField
      FieldName = 'ParcCReceber'
    end
    object tCReceberParcVlrParcCReceber: TFloatField
      FieldName = 'VlrParcCReceber'
    end
    object tCReceberParcDtVencCReceber: TDateField
      FieldName = 'DtVencCReceber'
    end
    object tCReceberParcQuitParcCReceber: TBooleanField
      FieldName = 'QuitParcCReceber'
    end
    object tCReceberParcJurosParcCReceber: TFloatField
      FieldName = 'JurosParcCReceber'
    end
    object tCReceberParcDtPagParcCReceber: TDateField
      FieldName = 'DtPagParcCReceber'
    end
    object tCReceberParcCodCli: TIntegerField
      FieldName = 'CodCli'
    end
    object tCReceberParcNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object tCReceberParcDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object tCReceberParcPgtoParcial: TFloatField
      FieldName = 'PgtoParcial'
    end
    object tCReceberParcRestParcela: TFloatField
      FieldName = 'RestParcela'
    end
    object tCReceberParcContaDupl: TSmallintField
      FieldName = 'ContaDupl'
    end
    object tCReceberParcSelecionado: TBooleanField
      FieldName = 'Selecionado'
    end
    object tCReceberParcCodVendedor: TIntegerField
      FieldName = 'CodVendedor'
    end
    object tCReceberParcBaixada: TBooleanField
      FieldName = 'Baixada'
    end
    object tCReceberParcPercComissao: TFloatField
      FieldName = 'PercComissao'
    end
    object tCReceberParcVlrComissao: TFloatField
      FieldName = 'VlrComissao'
    end
    object tCReceberParcPlanoContas: TIntegerField
      FieldName = 'PlanoContas'
    end
    object tCReceberParcAgencia: TStringField
      FieldName = 'Agencia'
      Size = 6
    end
    object tCReceberParcTitPortador: TStringField
      FieldName = 'TitPortador'
    end
    object tCReceberParcCodTipoCobranca: TIntegerField
      FieldName = 'CodTipoCobranca'
    end
    object tCReceberParcDespesas: TFloatField
      FieldName = 'Despesas'
    end
    object tCReceberParcAbatimentos: TFloatField
      FieldName = 'Abatimentos'
    end
    object tCReceberParcCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object tCReceberParcPgCartorio: TBooleanField
      FieldName = 'PgCartorio'
    end
    object tCReceberParcDiasAtraso: TFloatField
      FieldName = 'DiasAtraso'
    end
    object tCReceberParcLetraCambio: TBooleanField
      FieldName = 'LetraCambio'
    end
    object tCReceberParcNroLancExtComissao: TIntegerField
      FieldName = 'NroLancExtComissao'
    end
    object tCReceberParcJurosPagos: TFloatField
      FieldName = 'JurosPagos'
    end
    object tCReceberParcCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tCReceberParcTitProtestado: TBooleanField
      FieldName = 'TitProtestado'
    end
    object tCReceberParcDtGerado: TDateField
      FieldName = 'DtGerado'
    end
    object tCReceberParcTipoDoc: TStringField
      FieldName = 'TipoDoc'
      Size = 2
    end
    object tCReceberParcVlrDevolucao: TFloatField
      FieldName = 'VlrDevolucao'
    end
    object tCReceberParcArqGerado: TBooleanField
      FieldName = 'ArqGerado'
    end
    object tCReceberParcTransferencia: TBooleanField
      FieldName = 'Transferencia'
    end
    object tCReceberParcNumTitBanco: TStringField
      FieldName = 'NumTitBanco'
    end
    object tCReceberParcComissaoItem: TBooleanField
      FieldName = 'ComissaoItem'
    end
    object tCReceberParcVlrComissaoRestante: TFloatField
      FieldName = 'VlrComissaoRestante'
    end
    object tCReceberParcCodPlanoContasItens: TIntegerField
      FieldName = 'CodPlanoContasItens'
    end
    object tCReceberParcCodVendedor2: TIntegerField
      FieldName = 'CodVendedor2'
    end
    object tCReceberParcPercComissao2: TFloatField
      FieldName = 'PercComissao2'
    end
    object tCReceberParcCodBancoBoleto: TIntegerField
      FieldName = 'CodBancoBoleto'
    end
    object tCReceberParcNumCarteira: TStringField
      FieldName = 'NumCarteira'
      Size = 3
    end
    object tCReceberParcNumSeqNossoNum: TIntegerField
      FieldName = 'NumSeqNossoNum'
    end
    object tCReceberParcItemSeqNossoNum: TIntegerField
      FieldName = 'ItemSeqNossoNum'
    end
    object tCReceberParcDtVencimento2: TDateField
      FieldName = 'DtVencimento2'
    end
    object tCReceberParcSerie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object tCReceberParcNumSeqNota: TIntegerField
      FieldName = 'NumSeqNota'
    end
    object tCReceberParcNumCheque: TIntegerField
      FieldName = 'NumCheque'
    end
    object tCReceberParcCodBancoCheque: TIntegerField
      FieldName = 'CodBancoCheque'
    end
    object tCReceberParcCodCartaoCredito: TIntegerField
      FieldName = 'CodCartaoCredito'
    end
    object tCReceberParcNumCartaoCredito: TStringField
      FieldName = 'NumCartaoCredito'
    end
    object tCReceberParcValidadeCartao: TStringField
      FieldName = 'ValidadeCartao'
      Size = 8
    end
    object tCReceberParcTipoCondicao: TStringField
      FieldName = 'TipoCondicao'
      Size = 3
    end
    object tCReceberParcNumAutorizacaoCartao: TStringField
      FieldName = 'NumAutorizacaoCartao'
      Size = 15
    end
    object tCReceberParclkNomeCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCliente'
      LookupDataSet = tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCli'
      Size = 40
      Lookup = True
    end
  end
end
