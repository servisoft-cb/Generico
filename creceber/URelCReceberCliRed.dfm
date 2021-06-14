object fRelCReceberCliRed: TfRelCReceberCliRed
  Left = 7
  Top = 99
  Width = 962
  Height = 500
  Caption = 'fRelCReceberCliRed'
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
    Left = 32
    Top = 16
    Width = 794
    Height = 1123
    DataSource = fConsCReceber.dsqConsulta
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
      Height = 73
      BandType = btHeader
      BeforePrint = RLBand1BeforePrint
      object RLLabel1: TRLLabel
        Left = 200
        Top = 8
        Width = 325
        Height = 19
        Caption = 'Relat'#243'rio do Contas a Receber Por Cliente'
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
        Left = 2
        Top = 59
        Width = 52
        Height = 12
        Caption = 'Dt.Emiss'#227'o'
      end
      object RLLabel4: TRLLabel
        Left = 64
        Top = 59
        Width = 36
        Height = 12
        Caption = 'N'#186' Nota'
      end
      object RLLabel5: TRLLabel
        Left = 104
        Top = 59
        Width = 25
        Height = 12
        Caption = 'Parc.'
      end
      object RLLabel7: TRLLabel
        Left = 134
        Top = 59
        Width = 22
        Height = 12
        Caption = 'Filial'
      end
      object RLLabel8: TRLLabel
        Left = 159
        Top = 59
        Width = 46
        Height = 12
        Caption = 'Dt. Vecto.'
      end
      object RLLabel9: TRLLabel
        Left = 680
        Top = 59
        Width = 51
        Height = 12
        Caption = 'Vlr. Parcela'
      end
      object RLLabel12: TRLLabel
        Left = 211
        Top = 59
        Width = 29
        Height = 12
        Caption = 'Banco'
      end
      object RLLabel13: TRLLabel
        Left = 306
        Top = 59
        Width = 32
        Height = 12
        Caption = 'Cliente'
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 72
        Width = 734
        Height = 1
        Align = faBottom
        DrawKind = dkLine
      end
      object RLLabel6: TRLLabel
        Left = 2
        Top = 48
        Width = 732
        Height = 12
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
      object RLLabel11: TRLLabel
        Left = 554
        Top = 61
        Width = 24
        Height = 12
        Caption = 'Fone'
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 30
      Top = 103
      Width = 734
      Height = 192
      DataSource = fConsCReceber.dsqConsulta
      object RLGroup1: TRLGroup
        Left = 0
        Top = 0
        Width = 734
        Height = 83
        DataFields = 'NomeBancoBoleto'
        object RLBand4: TRLBand
          Left = 0
          Top = 0
          Width = 734
          Height = 19
          BandType = btHeader
          BeforePrint = RLBand4BeforePrint
          object RLLabel19: TRLLabel
            Left = 34
            Top = 3
            Width = 64
            Height = 14
            Caption = 'Dt.Emiss'#227'o'
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
          Width = 734
          Height = 16
          BeforePrint = RLBand2BeforePrint
          object RLDBText1: TRLDBText
            Left = 2
            Top = 2
            Width = 50
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtGerado'
            DataSource = fConsCReceber.dsqConsulta
          end
          object RLDBText2: TRLDBText
            Left = 54
            Top = 2
            Width = 50
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'NumNota'
            DataSource = fConsCReceber.dsqConsulta
          end
          object RLDBText5: TRLDBText
            Left = 132
            Top = 2
            Width = 24
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'Filial'
            DataSource = fConsCReceber.dsqConsulta
          end
          object RLDBText6: TRLDBText
            Left = 157
            Top = 2
            Width = 50
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtVencCReceber'
            DataSource = fConsCReceber.dsqConsulta
          end
          object RLDBText7: TRLDBText
            Left = 667
            Top = 2
            Width = 65
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrParcCReceber'
            DataSource = fConsCReceber.dsqConsulta
          end
          object RLDBText11: TRLDBText
            Left = 345
            Top = 2
            Width = 189
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
            Left = 105
            Top = 2
            Width = 25
            Height = 12
            Caption = 'Parc.'
          end
          object RLDBText3: TRLDBText
            Left = 306
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
          object RLDBText10: TRLDBText
            Left = 210
            Top = 2
            Width = 95
            Height = 12
            AutoSize = False
            DataField = 'NomeBancoBoleto'
            DataSource = fConsCReceber.dsqConsulta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText4: TRLDBText
            Left = 538
            Top = 2
            Width = 38
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'DDDFone1'
            DataSource = fConsCReceber.dsqConsulta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText8: TRLDBText
            Left = 578
            Top = 2
            Width = 87
            Height = 12
            AutoSize = False
            DataField = 'Telefone'
            DataSource = fConsCReceber.dsqConsulta
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
          Top = 35
          Width = 734
          Height = 22
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
        Height = 24
        BandType = btSummary
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
