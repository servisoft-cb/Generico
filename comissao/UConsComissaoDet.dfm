object fConsComissaoDet: TfConsComissaoDet
  Left = 98
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta da comiss'#227'o dos vendedores'
  ClientHeight = 521
  ClientWidth = 785
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
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 785
    Height = 391
    Align = alClient
    DataSource = fConsComissao.dsqComissao
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtReferencia'
        Title.Alignment = taCenter
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NroDoc'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Nota'
        Width = 56
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ParcDoc'
        Title.Alignment = taCenter
        Title.Caption = 'Parcela'
        Width = 41
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Funcao'
        Title.Alignment = taCenter
        Title.Caption = 'Fun'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkNomeCliente'
        Title.Alignment = taCenter
        Title.Caption = 'Nome do Cliente'
        Width = 242
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrBase'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr.Base'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PercComissao'
        Title.Alignment = taCenter
        Title.Caption = '% Com.'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrComissao'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr.Comiss'#227'o'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Tipo'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkNomeFilial'
        Title.Alignment = taCenter
        Title.Caption = 'Filial'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 391
    Width = 785
    Height = 130
    Align = alBottom
    Color = clSilver
    TabOrder = 1
    object Label1: TLabel
      Left = 152
      Top = 8
      Width = 73
      Height = 16
      Caption = 'Vendedor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 228
      Top = 8
      Width = 48
      Height = 16
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 26
      Width = 219
      Height = 101
      Caption = ' Saldo  no Per'#237'odo '
      Enabled = False
      TabOrder = 0
      object RxLabel2: TRxLabel
        Left = 19
        Top = 18
        Width = 57
        Height = 13
        Caption = 'Entradas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxLabel3: TRxLabel
        Left = 31
        Top = 35
        Width = 45
        Height = 13
        Caption = 'Saidas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxLabel4: TRxLabel
        Left = 2
        Top = 52
        Width = 74
        Height = 13
        Caption = 'Devolu'#231#245'es:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxLabel5: TRxLabel
        Left = 40
        Top = 86
        Width = 36
        Height = 13
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxLabel9: TRxLabel
        Left = 33
        Top = 69
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr.I.R:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CurrencyEdit2: TCurrencyEdit
        Left = 77
        Top = 13
        Width = 136
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '###,###,##0.00'
        ParentCtl3D = False
        TabOrder = 0
      end
      object CurrencyEdit3: TCurrencyEdit
        Left = 77
        Top = 30
        Width = 136
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '###,###,##0.00'
        ParentCtl3D = False
        TabOrder = 1
      end
      object CurrencyEdit4: TCurrencyEdit
        Left = 77
        Top = 47
        Width = 136
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '###,###,##0.00'
        ParentCtl3D = False
        TabOrder = 2
      end
      object CurrencyEdit5: TCurrencyEdit
        Left = 77
        Top = 81
        Width = 136
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '###,###,##0.00'
        ParentCtl3D = False
        TabOrder = 3
      end
      object CurrencyEdit9: TCurrencyEdit
        Left = 77
        Top = 64
        Width = 136
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '###,###,##0.00'
        ParentCtl3D = False
        TabOrder = 4
      end
    end
    object GroupBox3: TGroupBox
      Left = 225
      Top = 62
      Width = 235
      Height = 64
      Caption = ' Saldo Anterior '
      Enabled = False
      TabOrder = 1
      object RxLabel7: TRxLabel
        Left = 47
        Top = 32
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr. I.R:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxLabel1: TRxLabel
        Left = 7
        Top = 15
        Width = 87
        Height = 13
        Caption = 'Saldo Anterior:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxLabel10: TRxLabel
        Left = 58
        Top = 49
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CurrencyEdit7: TCurrencyEdit
        Left = 94
        Top = 27
        Width = 136
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '###,###,##0.00'
        ParentCtl3D = False
        TabOrder = 0
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 94
        Top = 10
        Width = 136
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '###,###,##0.00'
        ParentCtl3D = False
        TabOrder = 1
      end
      object CurrencyEdit10: TCurrencyEdit
        Left = 94
        Top = 44
        Width = 136
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '###,###,##0.00'
        ParentCtl3D = False
        TabOrder = 2
      end
    end
    object GroupBox4: TGroupBox
      Left = 461
      Top = 62
      Width = 319
      Height = 64
      Caption = ' Acumulado '
      Enabled = False
      TabOrder = 2
      object RxLabel6: TRxLabel
        Left = 4
        Top = 15
        Width = 173
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Saldo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxLabel8: TRxLabel
        Left = 134
        Top = 32
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr.I.R:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxLabel11: TRxLabel
        Left = 141
        Top = 49
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CurrencyEdit6: TCurrencyEdit
        Left = 179
        Top = 10
        Width = 136
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '###,###,##0.00'
        ParentCtl3D = False
        TabOrder = 0
      end
      object CurrencyEdit8: TCurrencyEdit
        Left = 179
        Top = 44
        Width = 136
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '###,###,##0.00'
        ParentCtl3D = False
        TabOrder = 1
      end
      object CurrencyEdit11: TCurrencyEdit
        Left = 179
        Top = 27
        Width = 136
        Height = 18
        AutoSize = False
        Ctl3D = False
        DisplayFormat = '###,###,##0.00'
        ParentCtl3D = False
        TabOrder = 2
      end
    end
    object BitBtn1: TBitBtn
      Left = 227
      Top = 30
      Width = 101
      Height = 29
      Hint = 'Verifica a comiss'#227'o'
      Caption = '&Verifica'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn1Click
      Glyph.Data = {
        F2060000424DF206000000000000360400002800000019000000190000000100
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
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE000000DEDEDEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEDE000000DEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDE000000DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDEDEDEDEDEDE000000DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE
        DEDEDE000000DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE00
        0000DEDE0000000000000000000000000000DEDEDEDEDEDEDEDEDE000000DEDE
        00F8F8F8F8F8F8F8F8F8F8F8F800DEDEDEDEDEDEDEDEDE000000DEDE00F8F8F8
        F8F8F8F8F8F8F8F8F800DEDEDEDEDEDEDEDEDE000000DEDE00F8070707070707
        07070707F800DEDEDEDEDEDE040404000000DEDE00F8F8F8F8F8F8F8F8F8F8F8
        F800000000000000000707000000DEDE00F80707070707949494949490949090
        94949490940007000000DEDE00F8F8F8F81F0000000000009490949094909494
        940007000000DEDE00F8070707F8001F0400DE00949490949094949094000700
        0000DEDEDE00F8F8F80000901F0400009490949094909494000004000000DEDE
        DEDE000000DE00DEDE1F04049494949490940000DEDEDE000000DEDEDEDEDEDE
        DEDE000090901F04009490909400DEDEDEDEDE000000DEDEDEDEDEDEDEDEDEDE
        00DE901F0400949400DEDEDEDEDEDE000000DEDEDEDEDEDEDEDEDEDEDE00DE90
        1F040400DEDEDEDEDEDEDE000000DEDEDEDEDEDEDEDEDEDEDEDE0000001F0404
        DEDEDEDEDEDEDE000000DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE1F04DEDEDEDE
        DEDEDE000000DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE00
        0000DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE000000DEDE
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE000000DEDEDEDEDEDE
        DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE000000}
    end
    object BitBtn2: TBitBtn
      Left = 653
      Top = 22
      Width = 128
      Height = 34
      Hint = 'Fecha a janela atual'
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BitBtn2Click
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
    object BitBtn4: TBitBtn
      Left = 525
      Top = 22
      Width = 128
      Height = 34
      Hint = 'Abre a consulta'
      Caption = 'Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BitBtn4Click
      Glyph.Data = {
        5E0B0000424D5E0B000000000000360000002800000022000000150000000100
        200000000000280B000000000000000000000000000000000000BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000BFBFBF00BFBFBF00BFBFBF0000000000007F000000000000007F00000000
        0000007F0000007F0000007F0000007F0000007F0000007F0000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000007F0000007F0000007F00000000000000000000000000000000
        0000000000000000000000000000BFBFBF00BFBFBF000000000000FF0000007F
        000000000000007F000000FF000000FF0000007F0000007F000000FF000000FF
        000000FF000000FF0000007F0000BFBFBF007F7F7F0000000000007F0000007F
        00000000000000FF000000FF00000000000000000000007F000000FF000000FF
        0000007F000000000000007F000000FF000000000000BFBFBF00BFBFBF000000
        0000007F000000000000FFFFFF000000000000FF0000000000000000000000FF
        0000000000000000000000FF000000FF000000000000BFBFBF00BFBFBF000000
        000000000000000000000000000000FF000000FF000000FF000000FF000000FF
        000000FF0000007F000000000000FFFFFF0000000000007F000000000000BFBF
        BF00BFBFBF000000000000FF000000000000FFFFFF000000000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000000000BFBF
        BF000000000000000000FFFFFF000000000000000000007F000000000000007F
        00000000000000000000007F0000007F000000000000FFFFFF000000000000FF
        000000000000BFBFBF00BFBFBF0000000000007F0000007F00000000000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF00000000000000000000FFFFFF0000000000000000000000000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF0000007F00000000
        0000007F0000007F000000000000BFBFBF00BFBFBF000000000000FF0000007F
        0000007F00000000000000FF000000FF000000FF00000000000000FF000000FF
        0000000000000000000000FF0000000000007F7F7F00FFFFFF007F7F7F000000
        000000FF000000FF000000FF000000000000007F0000007F000000FF000000FF
        000000FF0000007F0000007F000000FF000000000000BFBFBF00BFBFBF000000
        0000007F000000FF0000007F000000FF000000FF000000FF000000000000FFFF
        FF000000000000000000FFFFFF00FFFFFF0000000000000000007F7F7F007F7F
        7F007F7F7F000000000000FF000000FF000000FF000000FF00000000000000FF
        0000007F0000007F000000FF0000007F000000FF0000007F000000000000BFBF
        BF00BFBFBF0000000000007F0000007F000000000000007F000000FF000000FF
        00000000000000000000FFFFFF0000FFFF00FFFFFF00FFFFFF00000000000000
        0000BFBFBF00FFFFFF00BFBFBF000000000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF0000007F000000000000007F0000007F
        000000000000BFBFBF00BFBFBF000000000000FF000000000000FFFFFF000000
        00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        000000FF000000000000000000007F7F7F00000000000000000000FF00000000
        0000007F000000000000007F000000000000007F0000007F000000000000FFFF
        FF0000000000007F000000000000BFBFBF00BFBFBF0000000000007F00000000
        00000000000000000000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000
        00000000000000FF000000000000000000000000000000000000000000000000
        00000000000000FF000000FF000000FF000000FF000000FF000000FF0000007F
        000000000000FFFFFF0000000000007F000000000000BFBFBF00BFBFBF000000
        00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF000000000000000000007F00000000000000FF00000000000000FF00000000
        000000FF0000000000000000000000FF0000000000000000000000FF00000000
        000000FF000000FF0000007F000000000000007F000000FF000000000000BFBF
        BF00BFBFBF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000000000007F0000007F0000007F0000007F0000007F0000007F
        0000007F0000007F0000007F0000007F0000007F0000007F0000007F0000007F
        0000007F0000007F0000007F0000007F000000FF0000007F000000FF0000007F
        000000000000BFBFBF00BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000BFBFBF00BFBFBF0000FFFF00FFFFFF00FFFF
        FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000
        0000FFFFFF0000FFFF00FFFFFF0000000000BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FF
        FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000000000BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF0000000000000000000000000000000000BFBF
        BF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00FFFFFF000000000000000000BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00000000000000000000000000000000000000000000000000BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
        BF00}
    end
  end
  object mVerifica: TMemoryTable
    Active = True
    Left = 546
    Top = 240
    object mVerificaNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mVerificaParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object mVerificaFilial: TIntegerField
      FieldName = 'Filial'
    end
  end
end
