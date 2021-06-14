object fRelCompras: TfRelCompras
  Left = 51
  Top = 105
  Width = 958
  Height = 588
  Caption = 'fRelCompras'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 16
    Top = 8
    Width = 1123
    Height = 794
    DataSource = fConsCompras.dsmCompras
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 8.000000000000000000
    Margins.RightMargin = 8.000000000000000000
    PageSetup.Orientation = poLandscape
    object RLSubDetail1: TRLSubDetail
      Left = 30
      Top = 38
      Width = 1063
      Height = 387
      DataSource = fConsCompras.dsmCompras
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 1063
        Height = 26
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel1: TRLLabel
          Left = 136
          Top = 4
          Width = 658
          Height = 19
          Alignment = taCenter
          AutoSize = False
          Caption = 'Relat'#243'rio das Compras'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel21: TRLLabel
          Left = 974
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
          Left = 993
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
          Left = 959
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
          Left = 993
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
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 107
        Width = 1063
        Height = 15
        BandType = btSummary
        object RLLabel11: TRLLabel
          Left = 632
          Top = 2
          Width = 75
          Height = 11
          Caption = 'Total Geral ===>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 994
          Top = 2
          Width = 67
          Height = 11
          Alignment = taRightJustify
          DataField = 'VlrTotal'
          DataSource = fConsCompras.dsmCompras
          DisplayMask = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          ResetAfterPrint = True
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 0
          Width = 1063
          Height = 2
          Align = faTop
          DrawKind = dkLine
        end
        object RLDBResult2: TRLDBResult
          Left = 862
          Top = 2
          Width = 68
          Height = 11
          Alignment = taRightJustify
          DataField = 'VlrFrete'
          DataSource = fConsCompras.dsmCompras
          DisplayMask = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          ResetAfterPrint = True
        end
        object RLDBResult3: TRLDBResult
          Left = 745
          Top = 2
          Width = 57
          Height = 11
          Alignment = taRightJustify
          DataField = 'VlrIpi'
          DataSource = fConsCompras.dsmCompras
          DisplayMask = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          ResetAfterPrint = True
        end
      end
      object RLGroup1: TRLGroup
        Left = 0
        Top = 26
        Width = 1063
        Height = 81
        DataFields = 'Tipo'
        object RLBand4: TRLBand
          Left = 0
          Top = 16
          Width = 1063
          Height = 16
          BandType = btHeader
          object RLDraw1: TRLDraw
            Left = 0
            Top = 14
            Width = 1063
            Height = 2
            Align = faBottom
            DrawKind = dkLine
          end
          object RLLabel2: TRLLabel
            Left = 0
            Top = 1
            Width = 32
            Height = 12
            Caption = 'C'#243'digo'
          end
          object RLLabel3: TRLLabel
            Left = 33
            Top = 1
            Width = 50
            Height = 12
            Caption = 'Fornecedor'
          end
          object RLLabel9: TRLLabel
            Left = 311
            Top = 1
            Width = 36
            Height = 12
            Caption = 'N'#186' Nota'
          end
          object RLLabel8: TRLLabel
            Left = 361
            Top = 1
            Width = 48
            Height = 12
            Caption = 'Dt.Entrada'
          end
          object RLLabel4: TRLLabel
            Left = 418
            Top = 1
            Width = 32
            Height = 12
            Caption = 'C'#243'digo'
          end
          object RLLabel5: TRLLabel
            Left = 453
            Top = 1
            Width = 35
            Height = 12
            Caption = 'Material'
          end
          object RLLabel13: TRLLabel
            Left = 769
            Top = 2
            Width = 32
            Height = 12
            Caption = 'Vlr. IPI'
          end
          object RLLabel7: TRLLabel
            Left = 817
            Top = 1
            Width = 49
            Height = 12
            Caption = 'Vlr.Unit'#225'rio'
          end
          object RLLabel12: TRLLabel
            Left = 887
            Top = 1
            Width = 42
            Height = 12
            Caption = 'Vlr. Frete'
          end
          object RLLabel6: TRLLabel
            Left = 966
            Top = 1
            Width = 21
            Height = 12
            Caption = 'Qtd.'
          end
          object RLLabel10: TRLLabel
            Left = 1024
            Top = 1
            Width = 37
            Height = 12
            Caption = 'Vlr.Total'
          end
          object RLDraw3: TRLDraw
            Left = 0
            Top = 0
            Width = 1063
            Height = 2
            Align = faTop
            DrawKind = dkLine
          end
        end
        object RLBand5: TRLBand
          Left = 0
          Top = 0
          Width = 1063
          Height = 16
          BandType = btHeader
          BeforePrint = RLBand5BeforePrint
          object RLLabel14: TRLLabel
            Left = 32
            Top = 1
            Width = 42
            Height = 14
            Caption = 'C'#243'digo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
        end
        object RLBand2: TRLBand
          Left = 0
          Top = 32
          Width = 1063
          Height = 15
          object RLDBText1: TRLDBText
            Left = 0
            Top = 1
            Width = 32
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'CodFornecedor'
            DataSource = fConsCompras.dsmCompras
          end
          object RLDBText2: TRLDBText
            Left = 33
            Top = 1
            Width = 265
            Height = 12
            AutoSize = False
            DataField = 'NomeFornecedor'
            DataSource = fConsCompras.dsmCompras
          end
          object RLDBText3: TRLDBText
            Left = 301
            Top = 1
            Width = 58
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'NumNota'
            DataSource = fConsCompras.dsmCompras
          end
          object RLDBText4: TRLDBText
            Left = 361
            Top = 1
            Width = 50
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'Data'
            DataSource = fConsCompras.dsmCompras
          end
          object RLDBText5: TRLDBText
            Left = 413
            Top = 1
            Width = 38
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'CodMaterial'
            DataSource = fConsCompras.dsmCompras
          end
          object RLDBText6: TRLDBText
            Left = 452
            Top = 1
            Width = 277
            Height = 12
            AutoSize = False
            DataField = 'NomeProduto'
            DataSource = fConsCompras.dsmCompras
          end
          object RLDBText7: TRLDBText
            Left = 804
            Top = 1
            Width = 65
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrUnitario'
            DataSource = fConsCompras.dsmCompras
          end
          object RLDBText8: TRLDBText
            Left = 932
            Top = 1
            Width = 57
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'Qtd'
            DataSource = fConsCompras.dsmCompras
          end
          object RLDBText9: TRLDBText
            Left = 990
            Top = 1
            Width = 70
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrTotal'
            DataSource = fConsCompras.dsmCompras
          end
          object RLDBText10: TRLDBText
            Left = 870
            Top = 1
            Width = 61
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrFrete'
            DataSource = fConsCompras.dsmCompras
          end
          object RLDBText11: TRLDBText
            Left = 732
            Top = 1
            Width = 71
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrIpi'
            DataSource = fConsCompras.dsmCompras
          end
        end
        object RLBand6: TRLBand
          Left = 0
          Top = 47
          Width = 1063
          Height = 15
          BandType = btSummary
          object RLLabel15: TRLLabel
            Left = 635
            Top = 2
            Width = 72
            Height = 11
            Caption = 'Sub. Total ===>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBResult4: TRLDBResult
            Left = 994
            Top = 2
            Width = 67
            Height = 11
            Alignment = taRightJustify
            DataField = 'VlrTotal'
            DataSource = fConsCompras.dsmCompras
            DisplayMask = '###,###,###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
            ResetAfterPrint = True
          end
          object RLDraw4: TRLDraw
            Left = 0
            Top = 0
            Width = 1063
            Height = 2
            Align = faTop
            DrawKind = dkLine
          end
          object RLDBResult5: TRLDBResult
            Left = 862
            Top = 2
            Width = 68
            Height = 11
            Alignment = taRightJustify
            DataField = 'VlrFrete'
            DataSource = fConsCompras.dsmCompras
            DisplayMask = '###,###,###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
            ResetAfterPrint = True
          end
          object RLDBResult6: TRLDBResult
            Left = 745
            Top = 2
            Width = 57
            Height = 11
            Alignment = taRightJustify
            DataField = 'VlrIpi'
            DataSource = fConsCompras.dsmCompras
            DisplayMask = '###,###,###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
            ResetAfterPrint = True
          end
        end
      end
    end
  end
end
