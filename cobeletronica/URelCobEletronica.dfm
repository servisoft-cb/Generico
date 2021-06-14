object fRelCobEletronica: TfRelCobEletronica
  Left = 65
  Top = 99
  Width = 854
  Height = 585
  Caption = 'fRelCobEletronica'
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
    DataSource = DMCobEletronica.dsCobEletronica
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 8.000000000000000000
    Margins.TopMargin = 8.000000000000000000
    Margins.RightMargin = 8.000000000000000000
    Margins.BottomMargin = 8.000000000000000000
    ShowProgress = False
    object RLSubDetail1: TRLSubDetail
      Left = 30
      Top = 73
      Width = 734
      Height = 235
      DataSource = DMCobEletronica.dsCobEletronica_Nota
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 734
        Height = 16
        BeforePrint = RLBand2BeforePrint
        object RLDBText1: TRLDBText
          Left = 6
          Top = 1
          Width = 49
          Height = 12
          Alignment = taRightJustify
          DataField = 'NumNota'
          DataSource = DMCobEletronica.dsCobEletronica_Nota
        end
        object RLDBText2: TRLDBText
          Left = 60
          Top = 1
          Width = 34
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'Parcela'
          DataSource = DMCobEletronica.dsCobEletronica_Nota
        end
        object RLDBText3: TRLDBText
          Left = 100
          Top = 1
          Width = 31
          Height = 12
          DataField = 'FILIAL'
          DataSource = DMCobEletronica.dsCobEletronica
        end
        object RLDBText4: TRLDBText
          Left = 140
          Top = 1
          Width = 70
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'DTGERACAO'
          DataSource = DMCobEletronica.dsCobEletronica
        end
        object RLDBText5: TRLDBText
          Left = 228
          Top = 1
          Width = 70
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'DTVENCIMENTO'
          DataSource = DMCobEletronica.dsCobEletronica_Nota
        end
        object RLDBText6: TRLDBText
          Left = 305
          Top = 1
          Width = 301
          Height = 12
          AutoSize = False
          DataField = 'NOMECLIENTE'
          DataSource = DMCobEletronica.dsCobEletronica_Nota
        end
        object RLDBText7: TRLDBText
          Left = 608
          Top = 1
          Width = 74
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VLRTITULO'
          DataSource = DMCobEletronica.dsCobEletronica_Nota
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 14
          Width = 734
          Height = 2
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLLabel10: TRLLabel
          Left = 690
          Top = 1
          Width = 33
          Height = 12
          Caption = 'Gerado'
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 16
        Width = 734
        Height = 16
        BandType = btSummary
        BeforePrint = RLBand5BeforePrint
        object RLLabel11: TRLLabel
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
          DataSource = DMCobEletronica.dsCobEletronica_Nota
          Info = riCount
        end
        object RLDBResult4: TRLDBResult
          Left = 365
          Top = 2
          Width = 81
          Height = 12
          DataField = 'VLRTITULO'
          DataSource = DMCobEletronica.dsCobEletronica_Nota
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
      end
    end
    object RLBand1: TRLBand
      Left = 30
      Top = 30
      Width = 734
      Height = 43
      BandType = btTitle
      BeforePrint = RLBand1BeforePrint
      object RLLabel1: TRLLabel
        Left = 24
        Top = 5
        Width = 594
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = 'Relat'#243'rio de Cobran'#231'a Eletr'#244'nica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 657
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
        Left = 677
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
        Left = 642
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
        Left = 677
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
        Left = 18
        Top = 28
        Width = 36
        Height = 12
        Caption = 'N'#186' Nota'
      end
      object RLLabel3: TRLLabel
        Left = 61
        Top = 28
        Width = 34
        Height = 12
        Caption = 'Parcela'
      end
      object RLLabel4: TRLLabel
        Left = 101
        Top = 28
        Width = 22
        Height = 12
        Caption = 'Filial'
      end
      object RLLabel5: TRLLabel
        Left = 147
        Top = 28
        Width = 52
        Height = 12
        Caption = 'Dt.Emiss'#227'o'
      end
      object RLLabel6: TRLLabel
        Left = 233
        Top = 28
        Width = 65
        Height = 12
        Caption = 'Dt.Vencimento'
      end
      object RLLabel7: TRLLabel
        Left = 307
        Top = 28
        Width = 32
        Height = 12
        Caption = 'Cliente'
      end
      object RLLabel8: TRLLabel
        Left = 658
        Top = 28
        Width = 24
        Height = 12
        Caption = 'Valor'
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 41
        Width = 734
        Height = 2
        Align = faBottom
        DrawKind = dkLine
      end
      object RLLabel9: TRLLabel
        Left = 690
        Top = 28
        Width = 33
        Height = 12
        Caption = 'Gerado'
      end
    end
  end
end
