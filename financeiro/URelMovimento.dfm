object fRelMovimento: TfRelMovimento
  Left = 46
  Top = 105
  Width = 941
  Height = 572
  Caption = 'fRelMovimento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 40
    Top = 24
    Width = 794
    Height = 1123
    DataSource = fMovimentos2.dsMovimentos2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 38
      Width = 718
      Height = 243
      DataSource = fMovimentos2.dsMovimentos2
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 71
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel1: TRLLabel
          Left = 16
          Top = 3
          Width = 530
          Height = 19
          Alignment = taCenter
          AutoSize = False
          Caption = 'RELAT'#211'RIO MOVIMENTO FINANCEIRO (01/09/2008 a 31/08/2008)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel21: TRLLabel
          Left = 632
          Top = 2
          Width = 18
          Height = 10
          Caption = 'Pag:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 652
          Top = 2
          Width = 54
          Height = 10
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Info = itPageNumber
          ParentFont = False
        end
        object RLLabel22: TRLLabel
          Left = 617
          Top = 12
          Width = 33
          Height = 10
          Caption = 'Emiss'#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLSystemInfo2: TRLSystemInfo
          Left = 652
          Top = 12
          Width = 24
          Height = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 8
          Top = 56
          Width = 23
          Height = 12
          Caption = 'Data'
        end
        object RLLabel3: TRLLabel
          Left = 63
          Top = 56
          Width = 40
          Height = 12
          Caption = 'Hist'#243'rico'
        end
        object RLLabel4: TRLLabel
          Left = 525
          Top = 56
          Width = 40
          Height = 12
          Caption = 'Entradas'
        end
        object RLLabel5: TRLLabel
          Left = 608
          Top = 56
          Width = 31
          Height = 12
          Caption = 'Saidas'
        end
        object RLLabel6: TRLLabel
          Left = 688
          Top = 56
          Width = 26
          Height = 12
          Caption = 'Saldo'
        end
        object RLDraw1: TRLDraw
          Left = 0
          Top = 69
          Width = 718
          Height = 2
          Align = faBottom
          DrawKind = dkLine
        end
        object RLDraw2: TRLDraw
          Left = 547
          Top = 27
          Width = 169
          Height = 23
          Brush.Color = clSilver
          Color = clSilver
          ParentColor = False
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 555
          Top = 32
          Width = 70
          Height = 14
          Caption = 'Saldo Inicial:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel8: TRLLabel
          Left = 644
          Top = 32
          Width = 70
          Height = 14
          Alignment = taRightJustify
          Caption = 'Saldo Inicial:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw4: TRLDraw
          Left = 2
          Top = 28
          Width = 521
          Height = 20
        end
        object RLLabel15: TRLLabel
          Left = 52
          Top = 30
          Width = 456
          Height = 16
          AutoSize = False
          Caption = 'Conta:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel14: TRLLabel
          Left = 4
          Top = 30
          Width = 46
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Conta:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 71
        Width = 718
        Height = 18
        BeforePrint = RLBand2BeforePrint
        object RLDBText1: TRLDBText
          Left = 1
          Top = 3
          Width = 60
          Height = 12
          Alignment = taCenter
          DataField = 'DtMovimento'
          DataSource = fMovimentos2.dsMovimentos2
        end
        object RLMemo1: TRLMemo
          Left = 62
          Top = 3
          Width = 425
          Height = 12
        end
        object RLDBText2: TRLDBText
          Left = 506
          Top = 3
          Width = 62
          Height = 12
          Alignment = taRightJustify
          DataField = 'VlrMovCredito'
          DataSource = fMovimentos2.dsMovimentos2
        end
        object RLDBText3: TRLDBText
          Left = 581
          Top = 3
          Width = 59
          Height = 12
          Alignment = taRightJustify
          DataField = 'VlrMovDebito'
          DataSource = fMovimentos2.dsMovimentos2
        end
        object RLLabel9: TRLLabel
          Left = 641
          Top = 3
          Width = 74
          Height = 12
          Alignment = taRightJustify
        end
        object RLDraw3: TRLDraw
          Left = 0
          Top = 16
          Width = 718
          Height = 2
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 89
        Width = 718
        Height = 30
        BandType = btSummary
        BeforePrint = RLBand3BeforePrint
        object RLLabel10: TRLLabel
          Left = 395
          Top = 3
          Width = 82
          Height = 11
          Caption = 'Total do Per'#237'odo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 479
          Top = 2
          Width = 90
          Height = 12
          Alignment = taRightJustify
          DataField = 'VlrMovCredito'
          DataSource = fMovimentos2.dsMovimentos2
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
        object RLDBResult2: TRLDBResult
          Left = 570
          Top = 2
          Width = 71
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrMovDebito'
          DataSource = fMovimentos2.dsMovimentos2
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
        object RLLabel11: TRLLabel
          Left = 643
          Top = 2
          Width = 72
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Total:'
        end
        object RLLabel12: TRLLabel
          Left = 608
          Top = 16
          Width = 32
          Height = 11
          Caption = 'Saldo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 643
          Top = 15
          Width = 72
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Total:'
        end
      end
    end
  end
end
