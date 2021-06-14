object fRelCPagarForn: TfRelCPagarForn
  Left = 116
  Top = 181
  Width = 874
  Height = 532
  Caption = 'fRelCPagarForn'
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
    Left = 24
    Top = 24
    Width = 794
    Height = 1123
    DataSource = fConsCPagar2.dsqParcelas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 7.000000000000000000
    Margins.TopMargin = 7.000000000000000000
    Margins.RightMargin = 7.000000000000000000
    Margins.BottomMargin = 7.000000000000000000
    object RLBand1: TRLBand
      Left = 26
      Top = 26
      Width = 742
      Height = 43
      BandType = btHeader
      BeforePrint = RLBand1BeforePrint
      object RLLabel1: TRLLabel
        Left = 200
        Top = 4
        Width = 342
        Height = 19
        Caption = 'Relat'#243'rio do Contas a Pagar Por Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 648
        Top = 2
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
      object RLSystemInfo1: TRLSystemInfo
        Left = 677
        Top = 1
        Width = 32
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
      end
      object RLLabel22: TRLLabel
        Left = 628
        Top = 15
        Width = 42
        Height = 12
        Caption = 'Emiss'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 677
        Top = 15
        Width = 64
        Height = 12
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 3
        Top = 28
        Width = 33
        Height = 12
        Caption = 'Op'#231#227'o:'
      end
      object RLMemo1: TRLMemo
        Left = 39
        Top = 28
        Width = 688
        Height = 12
        AutoSize = False
      end
    end
    object RLBand2: TRLBand
      Left = 26
      Top = 69
      Width = 742
      Height = 19
      BandType = btHeader
      object RLLabel3: TRLLabel
        Left = 8
        Top = 3
        Width = 50
        Height = 12
        Caption = 'Fornecedor'
      end
      object RLLabel4: TRLLabel
        Left = 392
        Top = 3
        Width = 40
        Height = 12
        Caption = 'Vlr. Total'
      end
      object RLLabel5: TRLLabel
        Left = 496
        Top = 3
        Width = 41
        Height = 12
        Caption = 'Vlr. Pago'
      end
      object RLLabel6: TRLLabel
        Left = 576
        Top = 3
        Width = 65
        Height = 12
        Caption = 'Vlr. Devolu'#231#227'o'
      end
      object RLLabel7: TRLLabel
        Left = 680
        Top = 3
        Width = 59
        Height = 12
        Caption = 'Vlr. Pendente'
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 17
        Width = 742
        Height = 2
        Align = faBottom
        DrawKind = dkLine
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 26
      Top = 88
      Width = 742
      Height = 204
      DataSource = fConsCPagar2.dsqParcelas
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 742
        Height = 16
        object RLDBText1: TRLDBText
          Left = 3
          Top = 1
          Width = 39
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'CodForn'
          DataSource = fConsCPagar2.dsqParcelas
        end
        object RLDBText2: TRLDBText
          Left = 51
          Top = 1
          Width = 246
          Height = 12
          AutoSize = False
          DataField = 'NomeForn'
          DataSource = fConsCPagar2.dsqParcelas
        end
        object RLDBText3: TRLDBText
          Left = 336
          Top = 1
          Width = 99
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrParcela'
          DataSource = fConsCPagar2.dsqParcelas
        end
        object RLDBText4: TRLDBText
          Left = 440
          Top = 1
          Width = 99
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrPago'
          DataSource = fConsCPagar2.dsqParcelas
        end
        object RLDBText5: TRLDBText
          Left = 540
          Top = 1
          Width = 99
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrDevolucao'
          DataSource = fConsCPagar2.dsqParcelas
        end
        object RLDBText6: TRLDBText
          Left = 641
          Top = 1
          Width = 99
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrRestante'
          DataSource = fConsCPagar2.dsqParcelas
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 14
          Width = 742
          Height = 2
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 16
        Width = 742
        Height = 18
        BandType = btSummary
        object RLLabel8: TRLLabel
          Left = 232
          Top = 2
          Width = 70
          Height = 11
          Caption = 'Total Geral ==>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 361
          Top = 2
          Width = 73
          Height = 12
          Alignment = taRightJustify
          DataField = 'VlrParcela'
          DataSource = fConsCPagar2.dsqParcelas
          DisplayMask = '#,###,###,##0.00'
          Info = riSum
          ResetAfterPrint = True
        end
        object RLDBResult2: TRLDBResult
          Left = 475
          Top = 2
          Width = 63
          Height = 12
          Alignment = taRightJustify
          DataField = 'VlrPago'
          DataSource = fConsCPagar2.dsqParcelas
          DisplayMask = '#,###,###,##0.00'
          Info = riSum
          ResetAfterPrint = True
        end
        object RLDBResult3: TRLDBResult
          Left = 552
          Top = 2
          Width = 87
          Height = 12
          Alignment = taRightJustify
          DataField = 'VlrDevolucao'
          DataSource = fConsCPagar2.dsqParcelas
          DisplayMask = '#,###,###,##0.00'
          Info = riSum
          ResetAfterPrint = True
        end
        object RLDBResult4: TRLDBResult
          Left = 660
          Top = 2
          Width = 80
          Height = 12
          Alignment = taRightJustify
          DataField = 'VlrRestante'
          DataSource = fConsCPagar2.dsqParcelas
          DisplayMask = '#,###,###,##0.00'
          Info = riSum
          ResetAfterPrint = True
        end
      end
    end
  end
end
