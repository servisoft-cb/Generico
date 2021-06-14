object fRelRegDuplicatas: TfRelRegDuplicatas
  Left = 7
  Top = 99
  Width = 789
  Height = 362
  HorzScrollBar.Position = 37
  Caption = 'fRelRegDuplicatas'
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
    Left = -29
    Top = 8
    Width = 794
    Height = 1123
    DataSource = fConsCReceber.dsqConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 9.000000000000000000
    Margins.RightMargin = 9.000000000000000000
    ShowProgress = False
    object RLBand1: TRLBand
      Left = 34
      Top = 38
      Width = 726
      Height = 58
      BandType = btHeader
      BeforePrint = RLBand1BeforePrint
      object RLLabel1: TRLLabel
        Left = 128
        Top = 19
        Width = 402
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = 'Registo de Duplicatas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 624
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
        Left = 650
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
        Left = 602
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
        Left = 650
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
      object RLLabel3: TRLLabel
        Left = 102
        Top = 44
        Width = 52
        Height = 12
        Caption = 'Dt.Emiss'#227'o'
      end
      object RLLabel4: TRLLabel
        Left = 9
        Top = 44
        Width = 36
        Height = 12
        Caption = 'N'#186' Nota'
      end
      object RLLabel5: TRLLabel
        Left = 53
        Top = 44
        Width = 25
        Height = 12
        Caption = 'Parc.'
      end
      object RLLabel8: TRLLabel
        Left = 458
        Top = 44
        Width = 46
        Height = 12
        Caption = 'Dt. Vecto.'
      end
      object RLLabel9: TRLLabel
        Left = 167
        Top = 44
        Width = 51
        Height = 12
        Caption = 'Vlr. Parcela'
      end
      object RLLabel13: TRLLabel
        Left = 221
        Top = 45
        Width = 32
        Height = 12
        Caption = 'Cliente'
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 57
        Width = 726
        Height = 1
        Align = faBottom
        DrawKind = dkLine
      end
      object RLLabel25: TRLLabel
        Left = 2
        Top = 4
        Width = 54
        Height = 11
        Caption = 'Dt.Emiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 511
        Top = 44
        Width = 42
        Height = 12
        Caption = 'Dt. Baixa'
      end
      object RLLabel7: TRLLabel
        Left = 561
        Top = 44
        Width = 64
        Height = 12
        Caption = 'Estado/Cidade'
      end
      object RLLabel24: TRLLabel
        Left = 82
        Top = 45
        Width = 14
        Height = 12
        Caption = 'FL'
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 34
      Top = 96
      Width = 726
      Height = 192
      DataSource = fConsCReceber.dsqConsulta
      object RLGroup1: TRLGroup
        Left = 0
        Top = 0
        Width = 726
        Height = 83
        DataFields = 'DtGerado'
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 726
          Height = 16
          BeforePrint = RLBand2BeforePrint
          object RLDBText1: TRLDBText
            Left = 101
            Top = 2
            Width = 50
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtGerado'
            DataSource = fConsCReceber.dsqConsulta
          end
          object RLDBText2: TRLDBText
            Left = 1
            Top = 2
            Width = 50
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'NumNota'
            DataSource = fConsCReceber.dsqConsulta
          end
          object RLDBText6: TRLDBText
            Left = 448
            Top = 2
            Width = 58
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtVencCReceber'
            DataSource = fConsCReceber.dsqConsulta
          end
          object RLDBText7: TRLDBText
            Left = 155
            Top = 2
            Width = 63
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrParcCReceber'
            DataSource = fConsCReceber.dsqConsulta
          end
          object RLDBText11: TRLDBText
            Left = 220
            Top = 2
            Width = 226
            Height = 12
            AutoSize = False
            DataField = 'NomeCliente'
            DataSource = fConsCReceber.dsqConsulta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel2: TRLLabel
            Left = 52
            Top = 2
            Width = 25
            Height = 12
            Caption = 'Parc.'
          end
          object RLDBText3: TRLDBText
            Left = 508
            Top = 2
            Width = 50
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtPagParcCReceber'
            DataSource = fConsCReceber.dsqConsulta
          end
          object RLLabel10: TRLLabel
            Left = 561
            Top = 2
            Width = 162
            Height = 12
            AutoSize = False
            Caption = 'Parc.'
          end
          object RLDBText4: TRLDBText
            Left = 81
            Top = 2
            Width = 16
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'Filial'
            DataSource = fConsCReceber.dsqConsulta
          end
        end
        object RLBand5: TRLBand
          Left = 0
          Top = 16
          Width = 726
          Height = 19
          BandType = btSummary
          BeforePrint = RLBand5BeforePrint
          object RLLabel20: TRLLabel
            Left = 20
            Top = 4
            Width = 56
            Height = 12
            Caption = 'Total do Dia:'
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
            Width = 726
            Height = 1
            Align = faTop
            DrawKind = dkLine
            Pen.Style = psDot
          end
          object RLLabel11: TRLLabel
            Left = 390
            Top = 4
            Width = 70
            Height = 12
            Caption = 'Total do T'#237'tulos:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object RLLabel12: TRLLabel
            Left = 532
            Top = 4
            Width = 70
            Height = 12
            Alignment = taRightJustify
            Caption = 'Total do T'#237'tulos:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object RLLabel17: TRLLabel
            Left = 606
            Top = 4
            Width = 70
            Height = 12
            Caption = 'Total do T'#237'tulos:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object RLDBResult4: TRLDBResult
            Left = 104
            Top = 4
            Width = 103
            Height = 12
            DataField = 'VlrParcCReceber'
            DataSource = fConsCReceber.dsqConsulta
            DisplayMask = '###,###,###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            Info = riSum
            ParentFont = False
          end
          object RLLabel18: TRLLabel
            Left = 316
            Top = 4
            Width = 70
            Height = 12
            Alignment = taRightJustify
            Caption = 'Total do T'#237'tulos:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object RLDraw4: TRLDraw
            Left = 0
            Top = 18
            Width = 726
            Height = 1
            Align = faBottom
            DrawKind = dkLine
          end
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 83
        Width = 726
        Height = 18
        BandType = btSummary
        BeforePrint = RLBand3BeforePrint
        object RLDBResult1: TRLDBResult
          Left = 92
          Top = 4
          Width = 103
          Height = 12
          DataField = 'VlrParcCReceber'
          DataSource = fConsCReceber.dsqConsulta
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
          Left = 26
          Top = 4
          Width = 64
          Height = 12
          Caption = 'Total do Geral:'
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
          Width = 726
          Height = 1
          Align = faTop
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLLabel15: TRLLabel
          Left = 316
          Top = 4
          Width = 70
          Height = 12
          Alignment = taRightJustify
          Caption = 'Total do T'#237'tulos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object RLLabel16: TRLLabel
          Left = 391
          Top = 4
          Width = 70
          Height = 12
          Caption = 'Total do T'#237'tulos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object RLLabel19: TRLLabel
          Left = 532
          Top = 4
          Width = 70
          Height = 12
          Alignment = taRightJustify
          Caption = 'Total do T'#237'tulos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object RLLabel23: TRLLabel
          Left = 605
          Top = 4
          Width = 70
          Height = 12
          Caption = 'Total do T'#237'tulos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
      end
    end
  end
end
