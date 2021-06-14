object fRelCReceberTipoCobrRed: TfRelCReceberTipoCobrRed
  Left = 42
  Top = 118
  Width = 828
  Height = 573
  Caption = 'fRelCReceberTipoCobrRed'
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
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = fConsCReceber.dsmTipoCobrancaRed
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
    object RLBand1: TRLBand
      Left = 30
      Top = 30
      Width = 734
      Height = 66
      BandType = btHeader
      BeforePrint = RLBand1BeforePrint
      object RLLabel1: TRLLabel
        Left = 128
        Top = 8
        Width = 439
        Height = 19
        Caption = 'Relat'#243'rio do Contas a Receber Por Cobran'#231'a (Resumido)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 640
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
        Left = 664
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
        Left = 620
        Top = 16
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
        Left = 664
        Top = 16
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
      object RLLabel12: TRLLabel
        Left = 4
        Top = 50
        Width = 29
        Height = 12
        Caption = 'Banco'
      end
      object RLLabel13: TRLLabel
        Left = 266
        Top = 50
        Width = 43
        Height = 12
        Caption = 'Cobran'#231'a'
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 65
        Width = 734
        Height = 1
        Align = faBottom
        DrawKind = dkLine
      end
      object RLLabel6: TRLLabel
        Left = 2
        Top = 41
        Width = 732
        Height = 7
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.Style = bsHorizontal
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '---------------------------------------------------'
      end
      object RLLabel10: TRLLabel
        Left = 3
        Top = 36
        Width = 30
        Height = 10
        Caption = 'Op'#231#245'es:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rlOpcao: TRLLabel
        Left = 35
        Top = 36
        Width = 694
        Height = 10
        AutoSize = False
        Caption = 'Op'#231#245'es:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 682
        Top = 51
        Width = 24
        Height = 12
        Caption = 'Valor'
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 30
      Top = 96
      Width = 734
      Height = 192
      DataSource = fConsCReceber.dsmTipoCobrancaRed
      object RLGroup1: TRLGroup
        Left = 0
        Top = 0
        Width = 734
        Height = 83
        DataFields = 'NomeBanco'
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 734
          Height = 16
          object RLDBText1: TRLDBText
            Left = 2
            Top = 2
            Width = 38
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'CodBanco'
            DataSource = fConsCReceber.dsmTipoCobrancaRed
          end
          object RLDBText4: TRLDBText
            Left = 617
            Top = 2
            Width = 92
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'Valor'
            DataSource = fConsCReceber.dsmTipoCobrancaRed
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText2: TRLDBText
            Left = 40
            Top = 2
            Width = 195
            Height = 12
            AutoSize = False
            DataField = 'NomeBanco'
            DataSource = fConsCReceber.dsmTipoCobrancaRed
          end
          object RLDBText3: TRLDBText
            Left = 307
            Top = 2
            Width = 195
            Height = 12
            AutoSize = False
            DataField = 'NomeCobranca'
            DataSource = fConsCReceber.dsmTipoCobrancaRed
          end
          object RLDBText5: TRLDBText
            Left = 266
            Top = 2
            Width = 38
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'CodCobranca'
            DataSource = fConsCReceber.dsmTipoCobrancaRed
          end
        end
        object RLBand5: TRLBand
          Left = 0
          Top = 16
          Width = 734
          Height = 19
          BandType = btSummary
          BeforePrint = RLBand5BeforePrint
          object RLDBResult4: TRLDBResult
            Left = 608
            Top = 2
            Width = 102
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'Valor'
            DataSource = fConsCReceber.dsmTipoCobrancaRed
            DisplayMask = '###,###,###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            Info = riSum
            ParentFont = False
          end
          object RLLabel20: TRLLabel
            Left = 536
            Top = 2
            Width = 68
            Height = 12
            Alignment = taRightJustify
            Caption = 'Valor da Conta:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object RLDraw2: TRLDraw
            Left = 0
            Top = 0
            Width = 734
            Height = 1
            Align = faTop
            DrawKind = dkLine
            Pen.Style = psDot
          end
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 83
        Width = 734
        Height = 18
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 607
          Top = 4
          Width = 103
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Valor'
          DataSource = fConsCReceber.dsmTipoCobrancaRed
          DisplayMask = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Info = riSum
          ParentFont = False
        end
        object RLLabel14: TRLLabel
          Left = 553
          Top = 4
          Width = 52
          Height = 12
          Caption = 'Valor Geral:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object RLDraw3: TRLDraw
          Left = 0
          Top = 0
          Width = 734
          Height = 1
          Align = faTop
          DrawKind = dkLine
          Pen.Style = psDot
        end
      end
    end
  end
end
