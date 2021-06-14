object fRelArqRetBrasilRed: TfRelArqRetBrasilRed
  Left = 128
  Top = 164
  Width = 838
  Height = 543
  Caption = 'fRelArqRetBrasilRed'
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
    DataSource = fArqRetornoBrasil.dsmArquivo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 7.000000000000000000
    Margins.TopMargin = 8.000000000000000000
    Margins.RightMargin = 7.000000000000000000
    Margins.BottomMargin = 8.000000000000000000
    object RLBand1: TRLBand
      Left = 26
      Top = 30
      Width = 742
      Height = 54
      BandType = btHeader
      BeforePrint = RLBand1BeforePrint
      object RLLabel1: TRLLabel
        Left = 275
        Top = 5
        Width = 211
        Height = 16
        Caption = 'Arquivo Retorno Banco do Brasil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 656
        Top = 3
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
        Left = 676
        Top = 3
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
        Left = 641
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
        Left = 676
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
        Left = 2
        Top = 24
        Width = 43
        Height = 12
        Caption = 'Empresa:'
      end
      object rlFilial: TRLLabel
        Left = 47
        Top = 24
        Width = 43
        Height = 12
        Caption = 'Empresa:'
      end
      object RLLabel3: TRLLabel
        Left = 0
        Top = 39
        Width = 36
        Height = 12
        Caption = 'N'#186' Nota'
      end
      object RLLabel4: TRLLabel
        Left = 46
        Top = 39
        Width = 22
        Height = 12
        Caption = 'Parc'
      end
      object RLLabel5: TRLLabel
        Left = 72
        Top = 39
        Width = 61
        Height = 12
        Caption = 'Dt.Ocorr'#234'ncia'
      end
      object RLLabel6: TRLLabel
        Left = 252
        Top = 39
        Width = 40
        Height = 12
        Caption = 'Dt.Vecto'
      end
      object RLLabel7: TRLLabel
        Left = 580
        Top = 39
        Width = 40
        Height = 12
        Caption = 'Vlr.T'#237'tulo'
      end
      object RLLabel8: TRLLabel
        Left = 351
        Top = 39
        Width = 60
        Height = 12
        Caption = 'Nome Cliente'
      end
      object RLLabel9: TRLLabel
        Left = 644
        Top = 39
        Width = 41
        Height = 12
        Caption = 'Vlr. Pago'
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 52
        Width = 742
        Height = 2
        Align = faBottom
        DrawKind = dkLine
        Pen.Style = psDot
      end
      object RLLabel13: TRLLabel
        Left = 305
        Top = 39
        Width = 43
        Height = 12
        Caption = 'Dt.Liquid.'
      end
      object RLLabel18: TRLLabel
        Left = 147
        Top = 39
        Width = 66
        Height = 12
        Caption = 'Nosso N'#250'mero'
      end
      object RLLabel15: TRLLabel
        Left = 699
        Top = 39
        Width = 40
        Height = 12
        Caption = 'Despesa'
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 26
      Top = 84
      Width = 742
      Height = 311
      DataSource = fArqRetornoBrasil.dsmArquivo
      object RLGroup1: TRLGroup
        Left = 0
        Top = 0
        Width = 742
        Height = 97
        DataFields = 'TipoCobranca;CodOcorrenciaRet'
        object RLBand4: TRLBand
          Left = 0
          Top = 0
          Width = 742
          Height = 33
          BandType = btHeader
          BeforePrint = RLBand4BeforePrint
          object RLLabel20: TRLLabel
            Left = 23
            Top = 17
            Width = 56
            Height = 11
            Caption = 'Ocorr'#234'ncia:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
          object rlOcorrencia: TRLMemo
            Left = 80
            Top = 16
            Width = 649
            Height = 12
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object RLLabel16: TRLLabel
            Left = 79
            Top = 3
            Width = 56
            Height = 11
            Caption = 'Ocorr'#234'ncia:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
        end
        object RLBand2: TRLBand
          Left = 0
          Top = 33
          Width = 742
          Height = 17
          object RLDBText1: TRLDBText
            Left = 1
            Top = 1
            Width = 43
            Height = 12
            DataField = 'NumNota'
            DataSource = fArqRetornoBrasil.dsmArquivo
          end
          object RLDBText2: TRLDBText
            Left = 45
            Top = 1
            Width = 26
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'Parcela'
            DataSource = fArqRetornoBrasil.dsmArquivo
          end
          object RLDBText3: TRLDBText
            Left = 73
            Top = 1
            Width = 54
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtOcorrencia'
            DataSource = fArqRetornoBrasil.dsmArquivo
          end
          object RLDBText4: TRLDBText
            Left = 241
            Top = 1
            Width = 54
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtVenc'
            DataSource = fArqRetornoBrasil.dsmArquivo
          end
          object RLDBText5: TRLDBText
            Left = 296
            Top = 1
            Width = 54
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtLiquidacao'
            DataSource = fArqRetornoBrasil.dsmArquivo
          end
          object RLDBText6: TRLDBText
            Left = 351
            Top = 1
            Width = 208
            Height = 12
            AutoSize = False
            DataField = 'NomeCliente'
            DataSource = fArqRetornoBrasil.dsmArquivo
          end
          object RLDBText7: TRLDBText
            Left = 561
            Top = 1
            Width = 61
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrTitulo'
            DataSource = fArqRetornoBrasil.dsmArquivo
          end
          object RLDBText8: TRLDBText
            Left = 624
            Top = 1
            Width = 61
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrPago'
            DataSource = fArqRetornoBrasil.dsmArquivo
          end
          object RLDraw2: TRLDraw
            Left = 0
            Top = 15
            Width = 742
            Height = 2
            Align = faBottom
            DrawKind = dkLine
            Pen.Style = psDot
          end
          object RLDBText9: TRLDBText
            Left = 129
            Top = 1
            Width = 110
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'NumTitBanco'
            DataSource = fArqRetornoBrasil.dsmArquivo
          end
          object RLDBText10: TRLDBText
            Left = 686
            Top = 1
            Width = 54
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrDespesaCobranca'
            DataSource = fArqRetornoBrasil.dsmArquivo
          end
        end
        object RLBand5: TRLBand
          Left = 0
          Top = 50
          Width = 742
          Height = 16
          BandType = btSummary
          object RLLabel10: TRLLabel
            Left = 144
            Top = 2
            Width = 70
            Height = 12
            Caption = 'Total de T'#237'tulos:'
          end
          object RLDBResult3: TRLDBResult
            Left = 216
            Top = 2
            Width = 34
            Height = 12
            DataField = 'NumNota'
            DataSource = fArqRetornoBrasil.dsmArquivo
            Info = riCount
          end
          object RLDBResult4: TRLDBResult
            Left = 365
            Top = 2
            Width = 64
            Height = 12
            DataField = 'VlrTitulo'
            DataSource = fArqRetornoBrasil.dsmArquivo
            DisplayMask = '###,###,##0.00'
            Info = riSum
          end
          object RLLabel23: TRLLabel
            Left = 312
            Top = 2
            Width = 51
            Height = 12
            Caption = 'Vlr. T'#237'tulos:'
          end
          object RLDBResult5: TRLDBResult
            Left = 579
            Top = 2
            Width = 63
            Height = 12
            DataField = 'VlrPago'
            DataSource = fArqRetornoBrasil.dsmArquivo
            DisplayMask = '###,###,##0.00'
            Info = riSum
          end
          object RLLabel24: TRLLabel
            Left = 496
            Top = 2
            Width = 80
            Height = 12
            Caption = 'Vlr. T'#237'tulos Pagos:'
          end
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 97
        Width = 742
        Height = 16
        BandType = btSummary
        object RLLabel11: TRLLabel
          Left = 120
          Top = 2
          Width = 95
          Height = 12
          Caption = 'Total Geral de T'#237'tulos:'
        end
        object RLDBResult1: TRLDBResult
          Left = 216
          Top = 2
          Width = 34
          Height = 12
          DataField = 'NumNota'
          DataSource = fArqRetornoBrasil.dsmArquivo
          Info = riCount
        end
        object RLDBResult2: TRLDBResult
          Left = 365
          Top = 2
          Width = 64
          Height = 12
          DataField = 'VlrTitulo'
          DataSource = fArqRetornoBrasil.dsmArquivo
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
        object RLLabel12: TRLLabel
          Left = 312
          Top = 2
          Width = 51
          Height = 12
          Caption = 'Vlr. T'#237'tulos:'
        end
        object RLDBResult6: TRLDBResult
          Left = 579
          Top = 2
          Width = 63
          Height = 12
          DataField = 'VlrPago'
          DataSource = fArqRetornoBrasil.dsmArquivo
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
        object RLLabel14: TRLLabel
          Left = 496
          Top = 2
          Width = 80
          Height = 12
          Caption = 'Vlr. T'#237'tulos Pagos:'
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
