object fRelNotaCancelada: TfRelNotaCancelada
  Left = 46
  Top = 88
  Width = 870
  Height = 506
  Caption = 'fRelNotaCancelada'
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
    Left = 24
    Top = 32
    Width = 794
    Height = 1123
    DataSource = fConsNotaCancelada.dsqNota
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
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
      Height = 363
      DataSource = fConsNotaCancelada.dsqNota
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 742
        Height = 37
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel1: TRLLabel
          Left = 8
          Top = 8
          Width = 577
          Height = 16
          AutoSize = False
          Caption = 'RELAT'#211'RIO DE NOTAS CANCELADAS - 01/01/2008 a 31/08/2008'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel21: TRLLabel
          Left = 627
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
          Left = 652
          Top = 3
          Width = 32
          Height = 12
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
          Left = 607
          Top = 17
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
          Left = 652
          Top = 17
          Width = 64
          Height = 12
          AutoSize = False
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
        Top = 37
        Width = 742
        Height = 168
        DataFields = 'Filial'
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 742
          Height = 41
          BandType = btHeader
          object RLLabel2: TRLLabel
            Left = 5
            Top = 5
            Width = 63
            Height = 16
            Caption = 'Empresa:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBText1: TRLDBText
            Left = 69
            Top = 5
            Width = 47
            Height = 16
            DataField = 'lkFilial'
            DataSource = fConsNotaCancelada.dsqNota
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDraw1: TRLDraw
            Left = 0
            Top = 22
            Width = 739
            Height = 2
            DrawKind = dkLine
          end
          object RLLabel3: TRLLabel
            Left = 11
            Top = 25
            Width = 41
            Height = 14
            Caption = 'N'#186' Nota'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel4: TRLLabel
            Left = 91
            Top = 25
            Width = 50
            Height = 14
            Caption = 'Emiss'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel5: TRLLabel
            Left = 143
            Top = 25
            Width = 42
            Height = 14
            Caption = 'Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel7: TRLLabel
            Left = 54
            Top = 25
            Width = 32
            Height = 14
            Caption = 'S'#233'rie'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel8: TRLLabel
            Left = 454
            Top = 25
            Width = 40
            Height = 14
            Caption = 'Motivo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel15: TRLLabel
            Left = 421
            Top = 25
            Width = 27
            Height = 14
            Caption = 'Tipo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLBand3: TRLBand
          Left = 0
          Top = 41
          Width = 742
          Height = 16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          BeforePrint = RLBand3BeforePrint
          object RLDraw2: TRLDraw
            Left = 0
            Top = 0
            Width = 742
            Height = 2
            Align = faTop
            DrawKind = dkLine
            Pen.Style = psDot
          end
          object RLDBText2: TRLDBText
            Left = 1
            Top = 3
            Width = 52
            Height = 11
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'NumNota'
            DataSource = fConsNotaCancelada.dsqNota
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText3: TRLDBText
            Left = 84
            Top = 3
            Width = 57
            Height = 11
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'DtEmissao'
            DataSource = fConsNotaCancelada.dsqNota
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText4: TRLDBText
            Left = 142
            Top = 3
            Width = 277
            Height = 11
            AutoSize = False
            DataField = 'NomeCliente'
            DataSource = fConsNotaCancelada.dsqNota
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText5: TRLDBText
            Left = 54
            Top = 3
            Width = 28
            Height = 11
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'NumNota'
            DataSource = fConsNotaCancelada.dsqNota
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel9: TRLLabel
            Left = 420
            Top = 3
            Width = 30
            Height = 11
            Alignment = taCenter
            AutoSize = False
            Caption = 'Deneg'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel10: TRLLabel
            Left = 451
            Top = 3
            Width = 288
            Height = 11
            AutoSize = False
            Caption = 'Deneg'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
        object RLBand4: TRLBand
          Left = 0
          Top = 57
          Width = 742
          Height = 21
          BandType = btFooter
          BeforePrint = RLBand4BeforePrint
          object RLDraw3: TRLDraw
            Left = 0
            Top = 0
            Width = 742
            Height = 2
            Align = faTop
            DrawKind = dkLine
          end
          object RLLabel6: TRLLabel
            Left = 8
            Top = 4
            Width = 84
            Height = 14
            Caption = 'Total de Notas:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBResult1: TRLDBResult
            Left = 94
            Top = 4
            Width = 44
            Height = 14
            DataField = 'NumNota'
            DataSource = fConsNotaCancelada.dsqNota
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riCount
            ParentFont = False
          end
          object RLLabel11: TRLLabel
            Left = 253
            Top = 4
            Width = 92
            Height = 14
            Caption = 'Total Cancelada:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel12: TRLLabel
            Left = 347
            Top = 4
            Width = 92
            Height = 14
            Caption = 'Total Cancelada:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel13: TRLLabel
            Left = 494
            Top = 4
            Width = 90
            Height = 14
            Alignment = taRightJustify
            Caption = 'Total Denegada:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel14: TRLLabel
            Left = 587
            Top = 4
            Width = 92
            Height = 14
            Caption = 'Total Cancelada:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
  end
end
