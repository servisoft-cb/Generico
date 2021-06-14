object fRelCReceberTipoCobr: TfRelCReceberTipoCobr
  Left = 25
  Top = 124
  Width = 828
  Height = 573
  Caption = 'fRelCReceberTipoCobr'
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
    DataSource = fConsCReceber.dsqConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 7.000000000000000000
    Margins.TopMargin = 8.000000000000000000
    Margins.RightMargin = 7.000000000000000000
    Margins.BottomMargin = 8.000000000000000000
    ShowProgress = False
    object RLBand1: TRLBand
      Left = 26
      Top = 30
      Width = 742
      Height = 63
      BandType = btHeader
      BeforePrint = RLBand1BeforePrint
      object RLLabel1: TRLLabel
        Left = 200
        Top = 8
        Width = 347
        Height = 19
        Caption = 'Relat'#243'rio do Contas a Receber Por Cobran'#231'a'
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
      object RLLabel3: TRLLabel
        Left = 80
        Top = 48
        Width = 40
        Height = 12
        Caption = 'Dt.Pagto'
      end
      object RLLabel4: TRLLabel
        Left = 134
        Top = 48
        Width = 36
        Height = 12
        Caption = 'N'#186' Nota'
      end
      object RLLabel5: TRLLabel
        Left = 174
        Top = 48
        Width = 25
        Height = 12
        Caption = 'Parc.'
      end
      object RLLabel7: TRLLabel
        Left = 204
        Top = 48
        Width = 13
        Height = 12
        Caption = 'Fil'
      end
      object RLLabel8: TRLLabel
        Left = 24
        Top = 48
        Width = 46
        Height = 12
        Caption = 'Dt. Vecto.'
      end
      object RLLabel12: TRLLabel
        Left = 221
        Top = 48
        Width = 29
        Height = 12
        Caption = 'Banco'
      end
      object RLLabel13: TRLLabel
        Left = 291
        Top = 48
        Width = 32
        Height = 12
        Caption = 'Cliente'
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 62
        Width = 742
        Height = 1
        Align = faBottom
        DrawKind = dkLine
      end
      object RLLabel6: TRLLabel
        Left = 2
        Top = 41
        Width = 738
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
          '-------------------------------------------------------'
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
      object RLLabel11: TRLLabel
        Left = 601
        Top = 50
        Width = 48
        Height = 12
        Caption = 'Vlr.Parcela'
      end
      object RLLabel15: TRLLabel
        Left = 654
        Top = 49
        Width = 58
        Height = 12
        Caption = 'Pagto/Devol.'
      end
      object RLLabel9: TRLLabel
        Left = 721
        Top = 49
        Width = 19
        Height = 12
        Caption = 'Atrz'
      end
      object RLLabel16: TRLLabel
        Left = 475
        Top = 50
        Width = 58
        Height = 12
        Caption = 'N'#186' Tit. Banco'
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 26
      Top = 93
      Width = 742
      Height = 192
      DataSource = fConsCReceber.dsqConsulta
      object RLGroup1: TRLGroup
        Left = 0
        Top = 0
        Width = 742
        Height = 83
        DataFields = 'NomeCobranca'
        object RLBand4: TRLBand
          Left = 0
          Top = 0
          Width = 742
          Height = 19
          BandType = btHeader
          BeforePrint = RLBand4BeforePrint
          object RLLabel19: TRLLabel
            Left = 90
            Top = 3
            Width = 82
            Height = 14
            Caption = 'Tipo Cobran'#231'a'
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
          Top = 19
          Width = 742
          Height = 15
          BeforePrint = RLBand2BeforePrint
          object RLDBText1: TRLDBText
            Left = 23
            Top = 2
            Width = 50
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtVencCReceber'
            DataSource = fConsCReceber.dsqConsulta
          end
          object RLDBText2: TRLDBText
            Left = 125
            Top = 2
            Width = 50
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'NumNota'
            DataSource = fConsCReceber.dsqConsulta
          end
          object RLDBText5: TRLDBText
            Left = 202
            Top = 2
            Width = 20
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'Filial'
            DataSource = fConsCReceber.dsqConsulta
          end
          object RLDBText6: TRLDBText
            Left = 74
            Top = 2
            Width = 50
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtPagParcCReceber'
            DataSource = fConsCReceber.dsqConsulta
          end
          object RLDBText11: TRLDBText
            Left = 329
            Top = 2
            Width = 139
            Height = 12
            AutoSize = False
            DataField = 'NomeCliente'
            DataSource = fConsCReceber.dsqConsulta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel2: TRLLabel
            Left = 176
            Top = 2
            Width = 25
            Height = 12
            Caption = 'Parc.'
          end
          object RLDBText3: TRLDBText
            Left = 290
            Top = 2
            Width = 38
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'CodCli'
            DataSource = fConsCReceber.dsqConsulta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText4: TRLDBText
            Left = 586
            Top = 2
            Width = 63
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrParcCReceber'
            DataSource = fConsCReceber.dsqConsulta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText8: TRLDBText
            Left = 650
            Top = 2
            Width = 63
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'PgtoParcial'
            DataSource = fConsCReceber.dsqConsulta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText7: TRLDBText
            Left = 714
            Top = 2
            Width = 27
            Height = 11
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'clDiasAtraso'
            DataSource = fConsCReceber.dsqConsulta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText9: TRLDBText
            Left = 469
            Top = 2
            Width = 116
            Height = 12
            AutoSize = False
            DataField = 'NumTitBanco'
            DataSource = fConsCReceber.dsqConsulta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel17: TRLLabel
            Left = 223
            Top = 3
            Width = 66
            Height = 10
            AutoSize = False
            Caption = 'Parc.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel18: TRLLabel
            Left = 2
            Top = 3
            Width = 19
            Height = 10
            AutoSize = False
            Caption = 'PR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
        object RLBand5: TRLBand
          Left = 0
          Top = 34
          Width = 742
          Height = 21
          BandType = btSummary
          BeforePrint = RLBand5BeforePrint
          object RLDBResult4: TRLDBResult
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
          object RLLabel20: TRLLabel
            Left = 20
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
          object RLDraw2: TRLDraw
            Left = 0
            Top = 0
            Width = 742
            Height = 1
            Align = faTop
            DrawKind = dkLine
            Pen.Style = psDot
          end
          object RLLabel23: TRLLabel
            Left = 300
            Top = 4
            Width = 89
            Height = 12
            Caption = 'Vlr. Tit. Protestados:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object RLLabel24: TRLLabel
            Left = 392
            Top = 4
            Width = 89
            Height = 12
            Caption = 'Vlr. Tit. Protestados:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 83
        Width = 742
        Height = 22
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
          Width = 742
          Height = 1
          Align = faTop
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLLabel25: TRLLabel
          Left = 276
          Top = 4
          Width = 114
          Height = 12
          Caption = 'Vlr. Geral Tit. Protestados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object RLLabel26: TRLLabel
          Left = 392
          Top = 4
          Width = 89
          Height = 12
          Caption = 'Vlr. Tit. Protestados:'
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
