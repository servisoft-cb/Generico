object fRelCheque: TfRelCheque
  Left = 52
  Top = 84
  Width = 812
  Height = 489
  HorzScrollBar.Position = 806
  BorderIcons = [biSystemMenu]
  Caption = 'fRelCheque'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = -803
    Top = 2
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = fPrevCheque.qCheque
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 67
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        177.270833333333300000
        1899.708333333333000000)
      BandType = rbPageHeader
      object QRShape5: TQRShape
        Left = 422
        Top = 44
        Width = 80
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1116.541666666670000000
          116.416666666667000000
          211.666666666667000000)
        Shape = qrsRectangle
      end
      object QRShape4: TQRShape
        Left = 501
        Top = 44
        Width = 113
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1325.562500000000000000
          116.416666666667000000
          298.979166666667000000)
        Shape = qrsRectangle
      end
      object QRShape3: TQRShape
        Left = 613
        Top = 44
        Width = 105
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1621.895833333330000000
          116.416666666667000000
          277.812500000000000000)
        Shape = qrsRectangle
      end
      object QRShape2: TQRShape
        Left = 104
        Top = 44
        Width = 217
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          275.166666666667000000
          116.416666666667000000
          574.145833333333000000)
        Shape = qrsRectangle
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 44
        Width = 105
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          116.416666666667000000
          277.812500000000000000)
        Shape = qrsRectangle
      end
      object QRLabel16: TQRLabel
        Left = 276
        Top = 19
        Width = 166
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          730.250000000000000000
          50.270833333333330000
          439.208333333333300000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Relat'#243'rio de Cheques'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRSysData4: TQRSysData
        Left = 646
        Top = 24
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1709.208333333330000000
          63.500000000000000000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsDate
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 8
      end
      object QRLabel18: TQRLabel
        Left = 600
        Top = 24
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1587.500000000000000000
          63.500000000000000000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Emiss'#227'o:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 607
        Top = 4
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1606.020833333333000000
          10.583333333333330000
          95.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'P'#225'gina:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRSysData3: TQRSysData
        Left = 646
        Top = 4
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1709.208333333330000000
          10.583333333333300000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 13
        Top = 46
        Width = 78
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          34.395833333333330000
          121.708333333333300000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data Prevista'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 191
        Top = 46
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          505.354166666666700000
          121.708333333333300000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Banco'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 431
        Top = 46
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1140.354166666667000000
          121.708333333333300000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#186' Cheque'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 507
        Top = 46
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1341.437500000000000000
          121.708333333333300000
          267.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data de Emiss'#227'o'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 650
        Top = 46
        Width = 31
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1719.791666666667000000
          121.708333333333300000
          82.020833333333320000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape7: TQRShape
        Left = 320
        Top = 44
        Width = 103
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          846.666666666667000000
          116.416666666667000000
          272.520833333333000000)
        Shape = qrsRectangle
      end
      object QRLabel7: TQRLabel
        Left = 326
        Top = 46
        Width = 91
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          862.541666666666800000
          121.708333333333300000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data Compens.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object DetailBand1: TQRBand
      Left = 38
      Top = 105
      Width = 718
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        60.854166666666670000
        1899.708333333333000000)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 12
        Top = 3
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          31.750000000000000000
          7.937500000000000000
          224.895833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = fPrevCheque.qCheque
        DataField = 'DtPrevista'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 108
        Top = 3
        Width = 213
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          285.750000000000000000
          7.937500000000000000
          563.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = fPrevCheque.qCheque
        DataField = 'NomeConta'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 425
        Top = 3
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1124.479166666670000000
          7.937500000000000000
          190.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = fPrevCheque.qCheque
        DataField = 'NumCheque'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 510
        Top = 3
        Width = 95
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1349.375000000000000000
          7.937500000000000000
          251.354166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = fPrevCheque.qCheque
        DataField = 'DtEmissao'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 640
        Top = 3
        Width = 74
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1693.333333333330000000
          7.937500000000000000
          195.791666666667000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = fPrevCheque.qCheque
        DataField = 'VlrTotal'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 327
        Top = 3
        Width = 91
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          865.187500000000000000
          7.937500000000000000
          240.770833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = fPrevCheque.qCheque
        DataField = 'DtEntrada'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object SummaryBand1: TQRBand
      Left = 38
      Top = 128
      Width = 718
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        1899.708333333333000000)
      BandType = rbSummary
      object QRLabel6: TQRLabel
        Left = 407
        Top = 8
        Width = 123
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1076.854166666667000000
          21.166666666666670000
          325.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor Total ==>>'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRShape6: TQRShape
        Left = 363
        Top = 3
        Width = 353
        Height = 2
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          5.291666666666670000
          960.437500000000000000
          7.937500000000000000
          933.979166666667000000)
        Shape = qrsRectangle
      end
      object QRExpr1: TQRExpr
        Left = 585
        Top = 8
        Width = 129
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666700000
          1547.812500000000000000
          21.166666666666700000
          341.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(VlrTotal)'
        Mask = '###,###,###,##0.00'
        FontSize = 12
      end
    end
  end
  object RLReport1: TRLReport
    Left = -6
    Top = 0
    Width = 794
    Height = 1123
    DataSource = fPrevCheque.qsCheque
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Margins.TopMargin = 5.000000000000000000
    ShowProgress = False
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 19
      Width = 718
      Height = 390
      DataSource = fPrevCheque.qsCheque
      BeforePrint = RLSubDetail1BeforePrint
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 46
        BandType = btHeader
        object RLDraw1: TRLDraw
          Left = 0
          Top = 27
          Width = 713
          Height = 17
        end
        object RLLabel1: TRLLabel
          Left = 261
          Top = 1
          Width = 196
          Height = 19
          Alignment = taCenter
          Caption = 'RELA'#199#195'O DE CHEQUES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 8
          Top = 28
          Width = 55
          Height = 14
          Caption = 'Dt.Prevista'
        end
        object RLLabel4: TRLLabel
          Left = 72
          Top = 28
          Width = 52
          Height = 14
          Caption = 'Descri'#231#227'o'
        end
        object RLLabel5: TRLLabel
          Left = 408
          Top = 28
          Width = 82
          Height = 14
          Caption = 'Dt. Compensado'
        end
        object RLLabel6: TRLLabel
          Left = 496
          Top = 28
          Width = 55
          Height = 14
          Caption = 'N'#186' Cheque'
        end
        object RLLabel7: TRLLabel
          Left = 560
          Top = 28
          Width = 59
          Height = 14
          Caption = 'Dt. Emiss'#227'o'
        end
        object RLLabel8: TRLLabel
          Left = 680
          Top = 28
          Width = 29
          Height = 14
          Caption = 'Valor'
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 650
          Top = 3
          Width = 63
          Height = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Info = itPageNumber
          ParentFont = False
        end
        object RLSystemInfo2: TRLSystemInfo
          Left = 650
          Top = 15
          Width = 29
          Height = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel9: TRLLabel
          Left = 627
          Top = 3
          Width = 22
          Height = 12
          Caption = 'Pag:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel10: TRLLabel
          Left = 623
          Top = 15
          Width = 26
          Height = 12
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLGroup1: TRLGroup
        Left = 0
        Top = 46
        Width = 718
        Height = 267
        DataFields = 'NomeConta'
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 18
          BandType = btHeader
          object RLLabel2: TRLLabel
            Left = 6
            Top = 2
            Width = 39
            Height = 14
            Caption = 'Banco:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
          object RLDBText1: TRLDBText
            Left = 48
            Top = 2
            Width = 67
            Height = 14
            DataField = 'NomeConta'
            DataSource = fPrevCheque.qsCheque
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
        end
        object RLBand3: TRLBand
          Left = 0
          Top = 18
          Width = 718
          Height = 18
          object RLDBText3: TRLDBText
            Left = 2
            Top = 1
            Width = 68
            Height = 14
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtPrevista'
            DataSource = fPrevCheque.qsCheque
          end
          object RLDBText4: TRLDBText
            Left = 70
            Top = 1
            Width = 40
            Height = 14
            DataField = 'Nominal'
            DataSource = fPrevCheque.qsCheque
          end
          object RLDBText6: TRLDBText
            Left = 496
            Top = 1
            Width = 62
            Height = 14
            Alignment = taCenter
            DataField = 'NumCheque'
            DataSource = fPrevCheque.qsCheque
          end
          object RLDBText7: TRLDBText
            Left = 416
            Top = 1
            Width = 68
            Height = 14
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtEntrada'
            DataSource = fPrevCheque.qsCheque
          end
          object RLDBText8: TRLDBText
            Left = 558
            Top = 1
            Width = 68
            Height = 14
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtEmissao'
            DataSource = fPrevCheque.qsCheque
          end
          object RLDBText10: TRLDBText
            Left = 626
            Top = 1
            Width = 40
            Height = 14
            DataField = 'VlrTotal'
            DataSource = fPrevCheque.qsCheque
          end
          object RLDraw2: TRLDraw
            Left = 0
            Top = 0
            Width = 718
            Height = 2
            Align = faTop
            DrawKind = dkLine
          end
        end
        object RLBand4: TRLBand
          Left = 0
          Top = 70
          Width = 718
          Height = 21
          BandType = btFooter
          object RLLabel11: TRLLabel
            Left = 533
            Top = 1
            Width = 69
            Height = 14
            Caption = 'Total Banco:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBResult1: TRLDBResult
            Left = 634
            Top = 1
            Width = 82
            Height = 14
            Alignment = taRightJustify
            DataField = 'VlrTotal'
            DataSource = fPrevCheque.qsCheque
            DisplayMask = '###,###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
            ResetAfterPrint = True
          end
        end
        object RLSubDetail2: TRLSubDetail
          Left = 0
          Top = 36
          Width = 718
          Height = 34
          DataSource = fPrevCheque.dsChequeCPagar
          object RLBand6: TRLBand
            Left = 0
            Top = 0
            Width = 718
            Height = 11
            BandType = btHeader
            object RLLabel13: TRLLabel
              Left = 3
              Top = 0
              Width = 45
              Height = 10
              Caption = 'Fornecedor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel15: TRLLabel
              Left = 160
              Top = 0
              Width = 59
              Height = 10
              Caption = 'N'#186' Lan'#231'amento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel16: TRLLabel
              Left = 233
              Top = 0
              Width = 28
              Height = 10
              Caption = 'Parcela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel17: TRLLabel
              Left = 282
              Top = 0
              Width = 31
              Height = 10
              Caption = 'N'#186' Nota'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel18: TRLLabel
              Left = 330
              Top = 0
              Width = 21
              Height = 10
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDraw4: TRLDraw
              Left = 0
              Top = 9
              Width = 718
              Height = 2
              Align = faBottom
              DrawKind = dkLine
              Pen.Style = psDot
            end
            object RLLabel14: TRLLabel
              Left = 358
              Top = -1
              Width = 45
              Height = 10
              Caption = 'Fornecedor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel19: TRLLabel
              Left = 515
              Top = -1
              Width = 59
              Height = 10
              Caption = 'N'#186' Lan'#231'amento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel20: TRLLabel
              Left = 588
              Top = -1
              Width = 28
              Height = 10
              Caption = 'Parcela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel21: TRLLabel
              Left = 637
              Top = -1
              Width = 31
              Height = 10
              Caption = 'N'#186' Nota'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel22: TRLLabel
              Left = 685
              Top = -1
              Width = 21
              Height = 10
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object RLDetailGrid1: TRLDetailGrid
            Left = 0
            Top = 11
            Width = 718
            Height = 14
            ColCount = 2
            object RLDBText2: TRLDBText
              Left = 331
              Top = 1
              Width = 20
              Height = 10
              Alignment = taRightJustify
              DataField = 'Valor'
              DataSource = fPrevCheque.dsChequeCPagar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText9: TRLDBText
              Left = 279
              Top = 1
              Width = 34
              Height = 10
              Alignment = taRightJustify
              DataField = 'NumNota'
              DataSource = fPrevCheque.dsChequeCPagar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText11: TRLDBText
              Left = 233
              Top = 1
              Width = 28
              Height = 10
              Alignment = taRightJustify
              DataField = 'Parcela'
              DataSource = fPrevCheque.dsChequeCPagar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText12: TRLDBText
              Left = 174
              Top = 1
              Width = 45
              Height = 10
              Alignment = taRightJustify
              DataField = 'NumCPagar'
              DataSource = fPrevCheque.dsChequeCPagar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText13: TRLDBText
              Left = 3
              Top = 1
              Width = 46
              Height = 10
              DataField = 'lkFornecedor'
              DataSource = fPrevCheque.dsChequeCPagar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
          end
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 313
        Width = 718
        Height = 19
        BandType = btFooter
        object RLLabel12: TRLLabel
          Left = 533
          Top = 1
          Width = 65
          Height = 14
          Caption = 'Total Geral:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult2: TRLDBResult
          Left = 634
          Top = 1
          Width = 82
          Height = 14
          Alignment = taRightJustify
          DataField = 'VlrTotal'
          DataSource = fPrevCheque.qsCheque
          DisplayMask = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
        end
        object RLDraw3: TRLDraw
          Left = 0
          Top = 0
          Width = 718
          Height = 2
          Align = faTop
          DrawKind = dkLine
        end
      end
    end
  end
end
