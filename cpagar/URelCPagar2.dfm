object fRelCPagar2: TfRelCPagar2
  Left = 64
  Top = 131
  Width = 868
  Height = 466
  Caption = 'fRelCPagar2'
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
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = fContasPagar2.dsqParcelas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 7.000000000000000000
    Margins.TopMargin = 7.000000000000000000
    Margins.RightMargin = 7.000000000000000000
    Margins.BottomMargin = 7.000000000000000000
    object RLSubDetail1: TRLSubDetail
      Left = 26
      Top = 26
      Width = 742
      Height = 315
      DataSource = fContasPagar2.dsqParcelas
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 742
        Height = 46
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel1: TRLLabel
          Left = 176
          Top = 8
          Width = 274
          Height = 19
          Caption = 'RELAT'#211'RIO DO CONTAS A PAGAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel21: TRLLabel
          Left = 633
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
          Left = 618
          Top = 13
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
          Top = 13
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
          Left = 0
          Top = 32
          Width = 40
          Height = 12
          Caption = 'Dt.Vecto'
        end
        object RLLabel3: TRLLabel
          Left = 64
          Top = 32
          Width = 50
          Height = 12
          Caption = 'Fornecedor'
        end
        object RLLabel4: TRLLabel
          Left = 504
          Top = 32
          Width = 48
          Height = 12
          Caption = 'Vlr.Parcela'
        end
        object RLLabel5: TRLLabel
          Left = 583
          Top = 32
          Width = 38
          Height = 12
          Caption = 'Vlr.Pago'
        end
        object RLLabel6: TRLLabel
          Left = 712
          Top = 32
          Width = 26
          Height = 12
          Caption = 'Saldo'
        end
        object RLLabel7: TRLLabel
          Left = 246
          Top = 32
          Width = 64
          Height = 12
          Caption = 'N'#186' Documento'
        end
        object RLLabel8: TRLLabel
          Left = 410
          Top = 32
          Width = 39
          Height = 12
          Caption = 'Emiss'#227'o'
        end
        object RLLabel9: TRLLabel
          Left = 382
          Top = 32
          Width = 22
          Height = 12
          Caption = 'Filial'
        end
        object RLDraw1: TRLDraw
          Left = 0
          Top = 44
          Width = 742
          Height = 2
          Align = faBottom
          DrawKind = dkLine
        end
        object RLLabel10: TRLLabel
          Left = 453
          Top = 32
          Width = 30
          Height = 12
          Caption = 'Atraso'
        end
        object RLLabel13: TRLLabel
          Left = 629
          Top = 32
          Width = 40
          Height = 12
          Caption = 'Dt.Pagto'
        end
        object RLLabel23: TRLLabel
          Left = 326
          Top = 32
          Width = 41
          Height = 12
          Caption = 'C. Custo'
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 161
        Width = 742
        Height = 21
        BandType = btSummary
        object RLLabel14: TRLLabel
          Left = 24
          Top = 1
          Width = 85
          Height = 11
          Caption = 'Vlr.Total Parcelas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 110
          Top = 1
          Width = 98
          Height = 11
          DataField = 'VlrParcCPagar'
          DataSource = fContasPagar2.dsqParcelas
          DisplayMask = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
        end
        object RLLabel15: TRLLabel
          Left = 272
          Top = 1
          Width = 70
          Height = 11
          Caption = 'Vlr.Total Pago:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult2: TRLDBResult
          Left = 344
          Top = 1
          Width = 84
          Height = 11
          DataField = 'PgtoParcial'
          DataSource = fContasPagar2.dsqParcelas
          DisplayMask = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
        end
        object RLDBResult3: TRLDBResult
          Left = 559
          Top = 1
          Width = 85
          Height = 11
          DataField = 'RestParcela'
          DataSource = fContasPagar2.dsqParcelas
          DisplayMask = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
        end
        object RLLabel16: TRLLabel
          Left = 500
          Top = 1
          Width = 57
          Height = 11
          Caption = 'Saldo Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 0
          Width = 742
          Height = 2
          Align = faTop
          DrawKind = dkLine
          Pen.Style = psDot
        end
      end
      object RLGroup1: TRLGroup
        Left = 0
        Top = 46
        Width = 742
        Height = 115
        object RLBand4: TRLBand
          Left = 0
          Top = 0
          Width = 742
          Height = 27
          BandType = btHeader
          BeforePrint = RLBand4BeforePrint
          object RLLabel17: TRLLabel
            Left = 56
            Top = 8
            Width = 40
            Height = 16
            Caption = 'Filial:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
          object RLDBText9: TRLDBText
            Left = 99
            Top = 8
            Width = 598
            Height = 16
            AutoSize = False
            DataField = 'lkNomeFilial'
            DataSource = fContasPagar2.dsqParcelas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
        end
        object RLBand2: TRLBand
          Left = 0
          Top = 27
          Width = 742
          Height = 16
          BeforePrint = RLBand2BeforePrint
          object RLDBText1: TRLDBText
            Left = 0
            Top = 1
            Width = 58
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtVencCPagar'
            DataSource = fContasPagar2.dsqParcelas
          end
          object RLDBText2: TRLDBText
            Left = 58
            Top = 1
            Width = 177
            Height = 12
            AutoSize = False
            DataField = 'NomeForn'
            DataSource = fContasPagar2.dsqParcelas
          end
          object RLDBText3: TRLDBText
            Left = 383
            Top = 1
            Width = 20
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'Filial'
            DataSource = fContasPagar2.dsqParcelas
          end
          object RLDBText4: TRLDBText
            Left = 404
            Top = 1
            Width = 50
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtGerado'
            DataSource = fContasPagar2.dsqParcelas
          end
          object RLDBText5: TRLDBText
            Left = 486
            Top = 1
            Width = 67
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrParcCPagar'
            DataSource = fContasPagar2.dsqParcelas
          end
          object RLDBText6: TRLDBText
            Left = 554
            Top = 1
            Width = 67
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'PgtoParcial'
            DataSource = fContasPagar2.dsqParcelas
          end
          object RLDBText7: TRLDBText
            Left = 674
            Top = 1
            Width = 67
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'RestParcela'
            DataSource = fContasPagar2.dsqParcelas
          end
          object RLLabel11: TRLLabel
            Left = 236
            Top = 1
            Width = 77
            Height = 12
            Alignment = taCenter
            AutoSize = False
            Caption = 'N'#186' Documento'
          end
          object RLLabel12: TRLLabel
            Left = 455
            Top = 1
            Width = 30
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'N'#186' Documento'
          end
          object RLDBText8: TRLDBText
            Left = 623
            Top = 1
            Width = 50
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtPagParcCPagar'
            DataSource = fContasPagar2.dsqParcelas
          end
          object RLLabel24: TRLLabel
            Left = 317
            Top = 2
            Width = 58
            Height = 12
            Alignment = taCenter
            AutoSize = False
            Caption = 'N'#186' Documento'
          end
        end
        object RLBand5: TRLBand
          Left = 0
          Top = 43
          Width = 742
          Height = 21
          BandType = btSummary
          BeforePrint = RLBand5BeforePrint
          object RLLabel18: TRLLabel
            Left = 38
            Top = 1
            Width = 70
            Height = 11
            Caption = 'Vlr.Total Filial:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBResult4: TRLDBResult
            Left = 110
            Top = 1
            Width = 98
            Height = 11
            DataField = 'VlrParcCPagar'
            DataSource = fContasPagar2.dsqParcelas
            DisplayMask = '###,###,###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
          end
          object RLLabel19: TRLLabel
            Left = 272
            Top = 1
            Width = 70
            Height = 11
            Caption = 'Vlr.Total Pago:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBResult5: TRLDBResult
            Left = 344
            Top = 1
            Width = 84
            Height = 11
            DataField = 'PgtoParcial'
            DataSource = fContasPagar2.dsqParcelas
            DisplayMask = '###,###,###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
          end
          object RLDBResult6: TRLDBResult
            Left = 559
            Top = 1
            Width = 85
            Height = 11
            DataField = 'RestParcela'
            DataSource = fContasPagar2.dsqParcelas
            DisplayMask = '###,###,###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
          end
          object RLLabel20: TRLLabel
            Left = 500
            Top = 1
            Width = 57
            Height = 11
            Caption = 'Saldo Total:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDraw3: TRLDraw
            Left = 0
            Top = 0
            Width = 742
            Height = 2
            Align = faTop
            DrawKind = dkLine
            Pen.Style = psDot
          end
        end
      end
    end
  end
end
