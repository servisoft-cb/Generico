object fConsComissao: TfConsComissao
  Left = 89
  Top = 85
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta da comiss'#227'o dos vendedores'
  ClientHeight = 521
  ClientWidth = 787
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 292
      Top = 10
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Inicial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 473
      Top = 10
      Width = 25
      Height = 13
      Caption = 'Final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 28
      Top = 10
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Filial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 601
      Top = 10
      Width = 41
      Height = 13
      Caption = 'Ordenar:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DateEdit1: TDateEdit
      Left = 349
      Top = 2
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object DateEdit2: TDateEdit
      Left = 499
      Top = 2
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
      OnExit = DateEdit2Exit
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 51
      Top = 2
      Width = 214
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'NomeInterno'
      LookupSource = DM1.dsFilial
      TabOrder = 0
      OnChange = RxDBLookupCombo2Change
    end
    object ComboBox1: TComboBox
      Left = 643
      Top = 2
      Width = 100
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 3
      Text = 'Nota'
      Items.Strings = (
        'Data'
        'Nota')
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 41
    Width = 787
    Height = 363
    Align = alClient
    DataSource = dsmResumido
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid1DblClick
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
    ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 27
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 15
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodVendedor'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeVendedor'
        Title.Alignment = taCenter
        Title.Caption = 'Vendedor'
        Width = 213
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrTotalAnt'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr.Total Anterior'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrEntrada'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Entradas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrSaida'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Sa'#237'das'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrDevolucao'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Devolu'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrTotalPeriodo'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Total Per'#237'odo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrTotalAcumulado'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Total Acumulado'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PercIR'
        Title.Alignment = taCenter
        Title.Caption = '% IR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrIRAnt'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. IR Anterior'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrIRPeriodo'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. IR Per'#237'odo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrIRAcumulado'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. IR Acumulado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SaldoAnt'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo Anterior'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SaldoAcumulado'
        Title.Alignment = taCenter
        Title.Caption = 'Saldo Acumulado'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 421
    Width = 787
    Height = 100
    Align = alBottom
    Color = clSilver
    TabOrder = 2
    object GroupBox2: TGroupBox
      Left = 4
      Top = -1
      Width = 219
      Height = 101
      Caption = ' Saldo  no Per'#237'odo '
      TabOrder = 4
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
      Top = 35
      Width = 235
      Height = 64
      Caption = ' Saldo Anterior '
      TabOrder = 5
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
      Top = 35
      Width = 319
      Height = 64
      Caption = ' Acumulado '
      TabOrder = 6
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
    object BitBtn3: TBitBtn
      Left = 379
      Top = 7
      Width = 100
      Height = 29
      Hint = 'Abre a consulta'
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn3Click
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000070000000007777777000000070FFFFFFF07777700000000070F7
        7777F07777000000000070F77777F07770007000000070F77780008700077000
        000070F7700FFF0000777000000070F708FFFF0807777000000070F80E000F07
        08777000000070F0EFEFEF0770777000000070F0F0000F077077700000007000
        EFEFFF0770777000000077780000000708777000000077770077777807777000
        0000777770077700777770000000777777800087777770000000777777777777
        777770000000}
      Spacing = 1
    end
    object BitBtn2: TBitBtn
      Left = 680
      Top = 7
      Width = 100
      Height = 29
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
      TabOrder = 3
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
    object BitBtn1: TBitBtn
      Left = 480
      Top = 7
      Width = 100
      Height = 29
      Caption = 'Resumido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFF202020
        404040404040404040404040404040404040404040202020FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF00000060606060606060606060606060606060606050
        5050202020404040404040404040404040808080202020FFFFFF000000BFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF606060606060B0B0B0C0C0C0C0C0
        C04040408080802020205F5F5F505050B0B0B0909090A0A0A0B0B0B0808080C0
        C0C0CFCFCF4040405050506060606060604040404040408080807F7F7FC0C0C0
        606060606060606060606060606060606060606060606060C0C0C0DFDFDFCFCF
        CF808080202020FFFFFF7F7F7FC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C09090907F7F7FCFCFCF8080808080800000007F7F7FC0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C09090CF60609FC0C0
        C08080808080800000003F3F3FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9F9F9F808080000000FFFFFF303030
        B0B0B02020203F3F3F7F7F7F3F3F3F5F5F5F2020203F3F3F6F6F6F0000003030
        30CFCFCF9F9F9F000000FFFFFFFFFFFF303030505050202020FFFFFFDFDFDF5F
        5F5F000000DFDFDFFFFFFF404040606060606060505050000000FFFFFFFFFFFF
        FFFFFFFFFFFF0000009F9F9FFFFFFF4040405F5F5FFFFFFFFFFFFF9F9F9F0000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF202020EFEFEFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Spacing = 1
    end
    object BitBtn4: TBitBtn
      Left = 580
      Top = 7
      Width = 100
      Height = 29
      Caption = 'Detalhado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn4Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFF202020
        404040404040404040404040404040404040404040202020FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF00000060606060606060606060606060606060606050
        5050202020404040404040404040404040808080202020FFFFFF000000BFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF606060606060B0B0B0C0C0C0C0C0
        C04040408080802020205F5F5F505050B0B0B0909090A0A0A0B0B0B0808080C0
        C0C0CFCFCF4040405050506060606060604040404040408080807F7F7FC0C0C0
        606060606060606060606060606060606060606060606060C0C0C0DFDFDFCFCF
        CF808080202020FFFFFF7F7F7FC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C09090907F7F7FCFCFCF8080808080800000007F7F7FC0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C09090CF60609FC0C0
        C08080808080800000003F3F3FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9F9F9F808080000000FFFFFF303030
        B0B0B02020203F3F3F7F7F7F3F3F3F5F5F5F2020203F3F3F6F6F6F0000003030
        30CFCFCF9F9F9F000000FFFFFFFFFFFF303030505050202020FFFFFFDFDFDF5F
        5F5F000000DFDFDFFFFFFF404040606060606060505050000000FFFFFFFFFFFF
        FFFFFFFFFFFF0000009F9F9FFFFFFF4040405F5F5FFFFFFFFFFFFF9F9F9F0000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF202020EFEFEFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Spacing = 1
    end
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 404
    Width = 787
    Height = 17
    Align = alBottom
    BorderStyle = sbsSunken
    Caption = 'Duplo clique para mostrar o extrato por vendedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object qComissao: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT DtReferencia, CodCliente, ParcDoc, NroDoc, Funcao, VlrBas' +
        'e, PercDescDupl, PercComissao, VlrComissao, Tipo, Filial, CodVen' +
        'dedor'
      'FROM "dbExtComissao.db" Dbextcomissao')
    Left = 360
    Top = 104
    object qComissaoDtReferencia: TDateField
      FieldName = 'DtReferencia'
      Origin = 'TABELAS."dbExtComissao.DB".DtReferencia'
    end
    object qComissaoCodCliente: TIntegerField
      FieldName = 'CodCliente'
      Origin = 'TABELAS."dbExtComissao.DB".CodCliente'
    end
    object qComissaoParcDoc: TIntegerField
      FieldName = 'ParcDoc'
      Origin = 'TABELAS."dbExtComissao.DB".ParcDoc'
    end
    object qComissaoNroDoc: TIntegerField
      FieldName = 'NroDoc'
      Origin = 'TABELAS."dbExtComissao.DB".NroDoc'
    end
    object qComissaoFuncao: TStringField
      FieldName = 'Funcao'
      Origin = 'TABELAS."dbExtComissao.DB".Funcao'
      Size = 1
    end
    object qComissaoVlrBase: TFloatField
      FieldName = 'VlrBase'
      Origin = 'TABELAS."dbExtComissao.DB".VlrBase'
      DisplayFormat = '###,###,##0.00'
    end
    object qComissaoPercDescDupl: TFloatField
      FieldName = 'PercDescDupl'
      Origin = 'TABELAS."dbExtComissao.DB".PercDescDupl'
      DisplayFormat = '0.00'
    end
    object qComissaoPercComissao: TFloatField
      FieldName = 'PercComissao'
      Origin = 'TABELAS."dbExtComissao.DB".PercComissao'
      DisplayFormat = '0.00'
    end
    object qComissaoVlrComissao: TFloatField
      FieldName = 'VlrComissao'
      Origin = 'TABELAS."dbExtComissao.DB".VlrComissao'
      DisplayFormat = '###,###,##0.00'
    end
    object qComissaoTipo: TStringField
      FieldName = 'Tipo'
      Origin = 'TABELAS."dbExtComissao.DB".Tipo'
      Size = 1
    end
    object qComissaolkNomeCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCliente'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCliente'
      Size = 40
      Lookup = True
    end
    object qComissaoFilial: TIntegerField
      FieldName = 'Filial'
      Origin = 'TABELAS."dbExtComissao.DB".Filial'
    end
    object qComissaolkNomeFilial: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeFilial'
      LookupDataSet = DM1.tFilial2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Empresa'
      KeyFields = 'Filial'
      Size = 40
      Lookup = True
    end
  end
  object dsqComissao: TDataSource
    DataSet = qComissao
    Left = 376
    Top = 104
  end
  object qSaldoAnt: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbextcomissao.Funcao, SUM( Dbextcomissao.VlrComissao ) Vl' +
        'rComissao, Dbextcomissao.CodVendedor, Dbvendedor.Nome, Dbvendedo' +
        'r.PercImpRenda'
      'FROM "dbExtComissao.db" Dbextcomissao'
      '   INNER JOIN "dbVendedor.DB" Dbvendedor'
      '   ON  (Dbextcomissao.CodVendedor = Dbvendedor.Codigo)'
      'WHERE  Dbextcomissao.DtReferencia < :DtIni'
      '       AND Dbextcomissao.CodVendedor = :Codigo'
      
        'GROUP BY Dbextcomissao.Funcao, Dbextcomissao.CodVendedor, Dbvend' +
        'edor.Nome, Dbvendedor.PercImpRenda'
      'ORDER BY Dbextcomissao.CodVendedor'
      ' ')
    Left = 424
    Top = 102
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DtIni'
        ParamType = ptUnknown
        Value = 0d
      end
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptUnknown
        Value = 0
      end>
    object qSaldoAntFuncao: TStringField
      FieldName = 'Funcao'
      Origin = 'TABELAS."dbExtComissao.DB".Funcao'
      Size = 1
    end
    object qSaldoAntVlrComissao: TFloatField
      FieldName = 'VlrComissao'
      Origin = 'TABELAS."dbExtComissao.DB".VlrComissao'
    end
    object qSaldoAntCodVendedor: TIntegerField
      FieldName = 'CodVendedor'
      Origin = 'TABELAS."dbExtComissao.DB".CodVendedor'
    end
    object qSaldoAntNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbVendedor.DB".Nome'
      Size = 40
    end
    object qSaldoAntPercImpRenda: TFloatField
      FieldName = 'PercImpRenda'
      Origin = 'TABELAS."dbVendedor.DB".PercImpRenda'
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
  object mResumido: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CodVendedor'
        DataType = ftInteger
      end
      item
        Name = 'NomeVendedor'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'SaldoAnt'
        DataType = ftFloat
      end
      item
        Name = 'VlrIRAnt'
        DataType = ftFloat
      end
      item
        Name = 'VlrTotalAnt'
        DataType = ftFloat
      end
      item
        Name = 'VlrEntrada'
        DataType = ftFloat
      end
      item
        Name = 'VlrSaida'
        DataType = ftFloat
      end
      item
        Name = 'VlrDevolucao'
        DataType = ftFloat
      end
      item
        Name = 'VlrIRPeriodo'
        DataType = ftFloat
      end
      item
        Name = 'VlrTotalPeriodo'
        DataType = ftFloat
      end
      item
        Name = 'SaldoAcumulado'
        DataType = ftFloat
      end
      item
        Name = 'VlrIRAcumulado'
        DataType = ftFloat
      end
      item
        Name = 'VlrTotalAcumulado'
        DataType = ftFloat
      end
      item
        Name = 'PercIR'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 464
    Top = 243
    Data = {
      420100009619E0BD01000000180000000E00000000000300000042010B436F64
      56656E6465646F7204000100000000000C4E6F6D6556656E6465646F72010049
      00000001000557494454480200020028000853616C646F416E74080004000000
      000008566C724952416E7408000400000000000B566C72546F74616C416E7408
      000400000000000A566C72456E7472616461080004000000000008566C725361
      69646108000400000000000C566C724465766F6C7563616F0800040000000000
      0C566C724952506572696F646F08000400000000000F566C72546F74616C5065
      72696F646F08000400000000000E53616C646F4163756D756C61646F08000400
      000000000E566C7249524163756D756C61646F080004000000000011566C7254
      6F74616C4163756D756C61646F08000400000000000650657263495208000400
      000000000000}
    object mResumidoCodVendedor: TIntegerField
      FieldName = 'CodVendedor'
    end
    object mResumidoNomeVendedor: TStringField
      FieldName = 'NomeVendedor'
      Size = 40
    end
    object mResumidoSaldoAnt: TFloatField
      FieldName = 'SaldoAnt'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mResumidoVlrIRAnt: TFloatField
      FieldName = 'VlrIRAnt'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mResumidoVlrTotalAnt: TFloatField
      FieldName = 'VlrTotalAnt'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mResumidoVlrEntrada: TFloatField
      FieldName = 'VlrEntrada'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mResumidoVlrSaida: TFloatField
      FieldName = 'VlrSaida'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mResumidoVlrDevolucao: TFloatField
      FieldName = 'VlrDevolucao'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mResumidoVlrIRPeriodo: TFloatField
      FieldName = 'VlrIRPeriodo'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mResumidoVlrTotalPeriodo: TFloatField
      FieldName = 'VlrTotalPeriodo'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mResumidoSaldoAcumulado: TFloatField
      FieldName = 'SaldoAcumulado'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mResumidoVlrIRAcumulado: TFloatField
      FieldName = 'VlrIRAcumulado'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mResumidoVlrTotalAcumulado: TFloatField
      FieldName = 'VlrTotalAcumulado'
      DisplayFormat = '###,###,###,##0.00'
    end
    object mResumidoPercIR: TFloatField
      FieldName = 'PercIR'
    end
  end
  object dsmResumido: TDataSource
    DataSet = mResumido
    Left = 488
    Top = 243
  end
  object qPeriodo: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbvendedor.Nome, Dbextcomissao.Funcao, SUM( Dbextcomissao' +
        '.VlrComissao ) VlrComissao, Dbextcomissao.CodVendedor, Dbvendedo' +
        'r.PercImpRenda'
      'FROM "dbExtComissao.db" Dbextcomissao'
      '   INNER JOIN "dbVendedor.DB" Dbvendedor'
      '   ON  (Dbextcomissao.CodVendedor = Dbvendedor.Codigo)  '
      
        'GROUP BY Dbvendedor.Nome, Dbextcomissao.Funcao, Dbextcomissao.Co' +
        'dVendedor, Dbvendedor.PercImpRenda'
      'ORDER BY Dbvendedor.Nome'
      ' '
      ' '
      ' ')
    Left = 360
    Top = 184
    object qPeriodoNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbVendedor.DB".Nome'
      Size = 40
    end
    object qPeriodoFuncao: TStringField
      FieldName = 'Funcao'
      Origin = 'TABELAS."dbExtComissao.DB".Funcao'
      Size = 1
    end
    object qPeriodoVlrComissao: TFloatField
      FieldName = 'VlrComissao'
      Origin = 'TABELAS."dbExtComissao.DB".VlrComissao'
    end
    object qPeriodoCodVendedor: TIntegerField
      FieldName = 'CodVendedor'
      Origin = 'TABELAS."dbExtComissao.DB".CodVendedor'
    end
    object qPeriodoPercImpRenda: TFloatField
      FieldName = 'PercImpRenda'
      Origin = 'TABELAS."dbVendedor.DB".PercImpRenda'
    end
  end
end
