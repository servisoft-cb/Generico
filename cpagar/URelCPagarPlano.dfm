object fRelCPagarPlano: TfRelCPagarPlano
  Left = -2
  Top = 160
  Width = 1027
  Height = 546
  Caption = 'fRelCPagarPlano'
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
    Width = 1123
    Height = 794
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
    PageSetup.Orientation = poLandscape
    object RLSubDetail1: TRLSubDetail
      Left = 26
      Top = 26
      Width = 1071
      Height = 447
      DataSource = fContasPagar2.dsqParcelas
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 1071
        Height = 59
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
          Left = 977
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
          Left = 996
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
          Left = 962
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
          Left = 996
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
          Top = 46
          Width = 40
          Height = 12
          Caption = 'Dt.Vecto'
        end
        object RLLabel3: TRLLabel
          Left = 64
          Top = 46
          Width = 50
          Height = 12
          Caption = 'Fornecedor'
        end
        object RLLabel4: TRLLabel
          Left = 830
          Top = 46
          Width = 48
          Height = 12
          Caption = 'Vlr.Parcela'
        end
        object RLLabel5: TRLLabel
          Left = 911
          Top = 46
          Width = 38
          Height = 12
          Caption = 'Vlr.Pago'
        end
        object RLLabel6: TRLLabel
          Left = 1040
          Top = 46
          Width = 26
          Height = 12
          Caption = 'Saldo'
        end
        object RLLabel7: TRLLabel
          Left = 640
          Top = 46
          Width = 64
          Height = 12
          Caption = 'N'#186' Documento'
        end
        object RLLabel8: TRLLabel
          Left = 750
          Top = 46
          Width = 39
          Height = 12
          Caption = 'Emiss'#227'o'
        end
        object RLLabel9: TRLLabel
          Left = 718
          Top = 46
          Width = 22
          Height = 12
          Caption = 'Filial'
        end
        object RLDraw1: TRLDraw
          Left = 0
          Top = 57
          Width = 1071
          Height = 2
          Align = faBottom
          DrawKind = dkLine
        end
        object RLLabel10: TRLLabel
          Left = 794
          Top = 46
          Width = 30
          Height = 12
          Caption = 'Atraso'
        end
        object RLLabel13: TRLLabel
          Left = 958
          Top = 46
          Width = 40
          Height = 12
          Caption = 'Dt.Pagto'
        end
        object RLLabel23: TRLLabel
          Left = 307
          Top = 45
          Width = 85
          Height = 12
          Caption = 'Plano/Centro Custo'
        end
        object RLLabel26: TRLLabel
          Left = 570
          Top = 45
          Width = 61
          Height = 12
          Caption = 'N'#186' Solicita'#231#227'o'
        end
        object RLDraw5: TRLDraw
          Left = 0
          Top = 44
          Width = 1071
          Height = 2
          DrawKind = dkLine
        end
        object RLLabel27: TRLLabel
          Left = 3
          Top = 30
          Width = 26
          Height = 10
          Caption = 'Op'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel28: TRLLabel
          Left = 31
          Top = 30
          Width = 26
          Height = 10
          Caption = 'Op'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel29: TRLLabel
          Left = 246
          Top = 45
          Width = 38
          Height = 12
          Caption = 'C.Custo'
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 273
        Width = 1071
        Height = 21
        BandType = btSummary
        object RLLabel14: TRLLabel
          Left = 253
          Top = 2
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
          Left = 339
          Top = 2
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
          Left = 501
          Top = 2
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
          Left = 573
          Top = 2
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
          Left = 788
          Top = 2
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
          Left = 729
          Top = 2
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
          Width = 1071
          Height = 2
          Align = faTop
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLLabel25: TRLLabel
          Left = 118
          Top = 2
          Width = 55
          Height = 11
          Caption = 'Total Geral:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLGroup1: TRLGroup
        Left = 0
        Top = 59
        Width = 1071
        Height = 214
        object RLBand4: TRLBand
          Left = 0
          Top = 0
          Width = 1071
          Height = 27
          BandType = btHeader
          BeforePrint = RLBand4BeforePrint
          object RLLabel17: TRLLabel
            Left = 40
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
            Left = 83
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
        object RLBand5: TRLBand
          Left = 0
          Top = 91
          Width = 1071
          Height = 18
          BandType = btSummary
          BeforePrint = RLBand5BeforePrint
          object RLLabel18: TRLLabel
            Left = 255
            Top = 2
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
          object RLDBResult4: TRLDBResult
            Left = 342
            Top = 2
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
            Left = 504
            Top = 2
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
            Left = 576
            Top = 2
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
            Left = 791
            Top = 2
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
            Left = 732
            Top = 2
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
            Width = 1071
            Height = 2
            Align = faTop
            DrawKind = dkLine
            Pen.Style = psDot
          end
          object RLLabel24: TRLLabel
            Left = 142
            Top = 3
            Width = 73
            Height = 11
            Caption = 'Total Por Filial:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLGroup2: TRLGroup
          Left = 0
          Top = 27
          Width = 1071
          Height = 64
          object RLBand2: TRLBand
            Left = 0
            Top = 0
            Width = 1071
            Height = 17
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
              Width = 176
              Height = 12
              AutoSize = False
              DataField = 'NomeForn'
              DataSource = fContasPagar2.dsqParcelas
            end
            object RLDBText3: TRLDBText
              Left = 720
              Top = 1
              Width = 22
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'Filial'
              DataSource = fContasPagar2.dsqParcelas
            end
            object RLDBText4: TRLDBText
              Left = 742
              Top = 1
              Width = 50
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'DtGerado'
              DataSource = fContasPagar2.dsqParcelas
            end
            object RLDBText5: TRLDBText
              Left = 822
              Top = 1
              Width = 65
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'VlrParcCPagar'
              DataSource = fContasPagar2.dsqParcelas
            end
            object RLDBText6: TRLDBText
              Left = 888
              Top = 1
              Width = 65
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'PgtoParcial'
              DataSource = fContasPagar2.dsqParcelas
            end
            object RLDBText7: TRLDBText
              Left = 1005
              Top = 1
              Width = 65
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'RestParcela'
              DataSource = fContasPagar2.dsqParcelas
            end
            object RLLabel11: TRLLabel
              Left = 631
              Top = 1
              Width = 88
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'N'#186' Documento'
            end
            object RLLabel12: TRLLabel
              Left = 792
              Top = 1
              Width = 29
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'N'#186' Documento'
            end
            object RLDBText8: TRLDBText
              Left = 954
              Top = 1
              Width = 50
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'DtPagParcCPagar'
              DataSource = fContasPagar2.dsqParcelas
            end
            object RLDBText10: TRLDBText
              Left = 300
              Top = 1
              Width = 133
              Height = 12
              AutoSize = False
              DataField = 'NomePlanoContas'
              DataSource = fContasPagar2.dsqParcelas
            end
            object RLDBText11: TRLDBText
              Left = 434
              Top = 1
              Width = 130
              Height = 12
              AutoSize = False
              DataField = 'NomePlanoContasItens'
              DataSource = fContasPagar2.dsqParcelas
            end
            object RLDraw4: TRLDraw
              Left = 0
              Top = 15
              Width = 1071
              Height = 2
              Align = faBottom
              DrawKind = dkLine
              Pen.Style = psDot
            end
            object RLDBText12: TRLDBText
              Left = 564
              Top = 1
              Width = 66
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'NumSolicitacao'
              DataSource = fContasPagar2.dsqParcelas
            end
            object RLLabel30: TRLLabel
              Left = 235
              Top = 1
              Width = 64
              Height = 12
              Alignment = taCenter
              AutoSize = False
              Caption = 'N'#186' Documento'
            end
          end
          object RLBand6: TRLBand
            Left = 0
            Top = 17
            Width = 1071
            Height = 17
            BandType = btSummary
            BeforePrint = RLBand6BeforePrint
            object RLLabel31: TRLLabel
              Left = 255
              Top = 2
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
            object RLDBResult7: TRLDBResult
              Left = 342
              Top = 2
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
            object RLLabel32: TRLLabel
              Left = 504
              Top = 2
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
            object RLDBResult8: TRLDBResult
              Left = 576
              Top = 2
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
            object RLDBResult9: TRLDBResult
              Left = 791
              Top = 2
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
            object RLLabel33: TRLLabel
              Left = 732
              Top = 2
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
            object RLLabel34: TRLLabel
              Left = 142
              Top = 3
              Width = 73
              Height = 11
              Alignment = taRightJustify
              Caption = 'Total Por Filial:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDraw6: TRLDraw
              Left = 0
              Top = 15
              Width = 1071
              Height = 2
              Align = faBottom
              DrawKind = dkLine
              Pen.Style = psDot
            end
          end
        end
      end
    end
  end
end
