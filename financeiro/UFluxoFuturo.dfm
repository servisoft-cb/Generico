object fFluxoFuturo: TfFluxoFuturo
  Left = 6
  Top = 45
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fluxo Futuro'
  ClientHeight = 480
  ClientWidth = 784
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 480
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 249
      Width = 259
      Height = 173
      Enabled = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 59
        Height = 20
        Caption = 'Atraso:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 37
        Width = 97
        Height = 13
        Caption = 'Total a Receber:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 31
        Top = 61
        Width = 82
        Height = 13
        Caption = 'Total a Pagar:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 59
        Top = 85
        Width = 54
        Height = 13
        Caption = 'Cheques:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 88
        Top = 114
        Width = 165
        Height = 26
        Alignment = taCenter
        Caption = 'Saldo em Atraso'#13#10'(Receber - Pagar - Cheque) :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 115
        Top = 29
        Width = 121
        Height = 21
        AutoSize = False
        Color = clInfoBk
        DisplayFormat = '###,###,##0.00'
        TabOrder = 0
      end
      object CurrencyEdit2: TCurrencyEdit
        Left = 115
        Top = 53
        Width = 121
        Height = 21
        AutoSize = False
        Color = clInfoBk
        DisplayFormat = '###,###,##0.00'
        TabOrder = 1
      end
      object CurrencyEdit3: TCurrencyEdit
        Left = 115
        Top = 77
        Width = 121
        Height = 21
        AutoSize = False
        Color = clInfoBk
        DisplayFormat = '###,###,##0.00'
        TabOrder = 2
      end
      object CurrencyEdit4: TCurrencyEdit
        Left = 115
        Top = 146
        Width = 121
        Height = 21
        AutoSize = False
        Color = clInfoBk
        DisplayFormat = '###,###,##0.00'
        TabOrder = 3
      end
    end
    object SMDBGrid1: TSMDBGrid
      Left = 261
      Top = 3
      Width = 520
      Height = 472
      DataSource = dsmFluxo
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
      ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
      OnGetCellParams = SMDBGrid1GetCellParams
      RegistryKey = 'Software\Scalabium'
      RegistrySection = 'SMDBGrid'
      WidthOfIndicator = 11
      DefaultRowHeight = 17
      ScrollBars = ssHorizontal
      ColCount = 6
      RowCount = 2
      Columns = <
        item
          Expanded = False
          FieldName = 'Data'
          Title.Alignment = taCenter
          Width = 85
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Receber'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Receber'
          Width = 91
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Pagar'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Pagar'
          Width = 93
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Cheques'
          Title.Alignment = taCenter
          Width = 92
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Saldo'
          Title.Alignment = taCenter
          Title.Caption = 'Saldo no dia'
          Width = 99
          Visible = True
        end>
    end
    object BitBtn1: TBitBtn
      Left = 24
      Top = 4
      Width = 161
      Height = 31
      Caption = 'Consulta Fluxo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        8A010000424D8A01000000000000760000002800000016000000170000000100
        0400000000001401000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFF00F88888888888888880008F00F88888888888888809F90F00F888
        8888888888809FF90F00F888888888888809FF990F00F88888888888809FF990
        8F00F8888888888809FF99088F00F888888888809FF990888F00F88888888809
        FF9908888F00F88888888000899088888F00F88888000000090888888F00F888
        00EFEFF0008888888F00F880FEFEFFFF088888888F00F880EFEFEFEF08888888
        8F00F80EFEFFFEFEF08888888F00F80FEFEFEFEFF08888888F00F80EFEFEFEFE
        F08888888F00F80FEFEFEFEFF08888888F00F880FEFFFEFE088888888F00F880
        EFEFEFEF088888888F00F88800FFFE00888888888F00F8888800008888888888
        8F00FFFFFFFFFFFFFFFFFFFFFF00}
    end
    object Panel3: TPanel
      Left = 2
      Top = 183
      Width = 257
      Height = 64
      TabOrder = 3
      object Label6: TLabel
        Left = 16
        Top = 16
        Width = 75
        Height = 13
        Caption = 'Saldo Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CurrencyEdit5: TCurrencyEdit
        Left = 93
        Top = 8
        Width = 121
        Height = 21
        AutoSize = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 0
      end
      object CheckBox1: TCheckBox
        Left = 54
        Top = 40
        Width = 163
        Height = 17
        Caption = 'Iniciar o fluxo com este saldo'
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 424
      Width = 257
      Height = 52
      Enabled = False
      TabOrder = 4
      object Label7: TLabel
        Left = 8
        Top = 16
        Width = 98
        Height = 26
        Alignment = taCenter
        Caption = 'Saldo Total'#13#10'(Inicial + Atraso):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CurrencyEdit6: TCurrencyEdit
        Left = 109
        Top = 24
        Width = 121
        Height = 21
        AutoSize = False
        Color = clInfoBk
        DisplayFormat = '###,###,##0.00'
        ReadOnly = True
        TabOrder = 0
      end
    end
    object BitBtn2: TBitBtn
      Left = 216
      Top = 129
      Width = 46
      Height = 21
      Caption = 'Contas a Receber'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      Visible = False
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
    object BitBtn3: TBitBtn
      Left = 216
      Top = 160
      Width = 46
      Height = 21
      Caption = 'Contas a Pagar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      Visible = False
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
    object BitBtn4: TBitBtn
      Left = 24
      Top = 66
      Width = 161
      Height = 31
      Caption = 'Cheques'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
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
    object BitBtn5: TBitBtn
      Left = 24
      Top = 35
      Width = 161
      Height = 31
      Caption = 'Fluxo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = BitBtn5Click
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
    object BitBtn6: TBitBtn
      Left = 24
      Top = 97
      Width = 161
      Height = 31
      Caption = 'Cons. Financeiro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = BitBtn6Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000303030404040
        4040404040404040404040404040404040404040404040404040404040404040
        404040404040402020207F7F7FBFBFBFA0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
        A0A0A0A0A0A0A0A0A0A0A09090904040406060608080804040407F7F7FDFDFDF
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0B0B0B0404040AFAF
        AF5050509090904040407F7F7FDFDFDFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0B0B0B0404040BFBFBFBFBFBF6F6F6FA0A0A04040407F7F7FDFDFDF
        C0C0C0C0C0C0B0B0B0A0A0A0A0A0A0B0B0B0B0B0B0404040BFBFBFBFBFBF6F6F
        6FC0C0C0A0A0A04040407F7F7FDFDFDFC0C0C090909040404040404040404080
        8080404040BFBFBFBFBFBF6F6F6FC0C0C0C0C0C0A0A0A04040407F7F7FDFDFDF
        707070606060909090606060909090606060707070CFCFCF6F6F6FC0C0C0C0C0
        C0C0C0C0A0A0A04040407F7F7F9F9F9F9090906F6F6F9F9F9FDFDFDFAFAFAF60
        6060B0B0B0202020B0B0B0C0C0C0C0C0C0C0C0C0A0A0A04040407F7F7F6F6F6F
        606060DFDFDFDFDFDFDFDFDFDFDFDFDFDFDF606060505050A0A0A0C0C0C0C0C0
        C0C0C0C0A0A0A04040407F7F7F6060606F6F6FDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDF6F6F6F606060A0A0A0C0C0C0C0C0C0C0C0C0A0A0A04040407F7F7F606060
        6F6F6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF7F7F7F606060A0A0A0C0C0C0C0C0
        C0C0C0C0A0A0A04040407F7F7F6060606F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF6F6F6F606060C0C0C0C0C0C0C0C0C0C0C0C0A0A0A04040407F7F7F7F7F7F
        909090404040404040404040404040404040909090606060C0C0C0C0C0C0C0C0
        C0C0C0C0A0A0A04040403F3F3F7F7F7F30303090909030303000000030303090
        90903030307F7F7FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF505050FFFFFFFFFFFF
        FFFFFF000000606060606060606060000000FFFFFF000000FF0000FF0000FF00
        00FF00007F0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFF}
    end
  end
  object mFluxo: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'Data'
    Params = <>
    OnNewRecord = mFluxoNewRecord
    Left = 400
    Top = 144
    Data = {
      630000009619E0BD010000001800000005000000000003000000630004446174
      6104000600000000000752656365626572080004000000000005506167617208
      00040000000000074368657175657308000400000000000553616C646F080004
      00000000000000}
    object mFluxoData: TDateField
      FieldName = 'Data'
    end
    object mFluxoReceber: TFloatField
      FieldName = 'Receber'
      DisplayFormat = '###,###,##0.00'
    end
    object mFluxoPagar: TFloatField
      FieldName = 'Pagar'
      DisplayFormat = '###,###,##0.00'
    end
    object mFluxoCheques: TFloatField
      FieldName = 'Cheques'
      DisplayFormat = '###,###,##0.00'
    end
    object mFluxoSaldo: TFloatField
      FieldName = 'Saldo'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsmFluxo: TDataSource
    DataSet = mFluxo
    Left = 424
    Top = 144
  end
  object qReceberAtraso: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT SUM( RestParcela ) RestParcela'
      'FROM "dbCReceberParc.DB" Dbcreceberparc'
      'WHERE   (DtVencimento2 < :Data)'
      '   AND  (RestParcela > 0)'
      '   AND  ((Cancelado = FALSE)  or (Cancelado is Null) ) '
      '   AND ((Transferencia = False) or (Transferencia is Null))'
      ' '
      ' ')
    Left = 368
    Top = 48
    ParamData = <
      item
        DataType = ftDate
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qReceberAtrasoRestParcela: TFloatField
      FieldName = 'RestParcela'
      Origin = 'TABELAS."dbCReceberParc.DB".RestParcela'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object qPagarAtraso: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT SUM( RestParcela ) RestParcela'
      'FROM "dbCPagarParc.DB" Dbcpagarparc'
      'WHERE   (DtVencCPagar < :Data)  '
      '   AND  (RestParcela > 0)  ')
    Left = 400
    Top = 48
    ParamData = <
      item
        DataType = ftDate
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qPagarAtrasoRestParcela: TFloatField
      FieldName = 'RestParcela'
      Origin = 'TABELAS."dbCPagarParc.DB".RestParcela'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object qChequeAtraso: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT SUM( VlrTotal ) VlrTotal'
      'FROM "dbCheque.DB" Dbcheque'
      'WHERE   (DtPrevista < :Data)  '
      '   AND  (DtEntrada IS NULL)  ')
    Left = 432
    Top = 48
    ParamData = <
      item
        DataType = ftDate
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qChequeAtrasoVlrTotal: TFloatField
      FieldName = 'VlrTotal'
      Origin = 'TABELAS."dbCheque.DB".VlrTotal'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object qFluxo: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT DISTINCT DtVencCPagar AS Data, SUM(RestParcela) AS Pagar,' +
        ' CAST (0 AS NUMERIC) AS Receber, CAST (0 AS NUMERIC) AS Cheques'
      'FROM dbCPagarParc'
      'WHERE (DtVencCPagar >= :Data) AND (RestParcela > 0)'
      'GROUP BY DtVencCPagar'
      ''
      'UNION ALL'
      
        'SELECT DISTINCT DtVencimento2 AS Data, CAST (0 AS NUMERIC) AS Pa' +
        'gar, SUM(RestParcela) AS Receber, CAST (0 AS NUMERIC) AS Cheques'
      'FROM dbCReceberParc'
      
        'WHERE (DtVencimento2 >= :Data) AND ((Cancelado = False) OR (Canc' +
        'elado IS NULL))'
      '     AND (RestParcela > 0)'
      'GROUP BY DtVencimento2'
      ''
      'UNION ALL'
      
        'SELECT DISTINCT DtPrevista AS Data,  CAST (0 AS NUMERIC) AS Paga' +
        'r, CAST (0 AS NUMERIC) AS Receber, SUM(VlrTotal) AS Cheques'
      'FROM dbCheque'
      'WHERE (DtPrevista >= :Data) and (DtEntrada Is Null)'
      'GROUP BY DtPrevista'
      ''
      'ORDER BY DATA'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 376
    Top = 217
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Data'
        ParamType = ptUnknown
        Value = 0d
      end
      item
        DataType = ftDateTime
        Name = 'Data'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Data'
        ParamType = ptUnknown
      end>
    object qFluxoData: TDateField
      FieldName = 'Data'
    end
    object qFluxoPagar: TFloatField
      FieldName = 'Pagar'
      DisplayFormat = '0.00'
    end
    object qFluxoReceber: TFloatField
      FieldName = 'Receber'
      DisplayFormat = '0.00'
    end
    object qFluxoCheques: TFloatField
      FieldName = 'Cheques'
      DisplayFormat = '0.00'
    end
  end
  object dsqFluxo: TDataSource
    DataSet = qFluxo
    Left = 392
    Top = 216
  end
end
