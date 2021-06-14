object fRelCBarra: TfRelCBarra
  Left = 61
  Top = 185
  Width = 913
  Height = 480
  Caption = 'fRelCBarra'
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
    Left = 32
    Top = 8
    Width = 794
    Height = 1123
    DataSource = fConsCBarra.dsqConsulta
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
      Top = 84
      Width = 742
      Height = 319
      DataSource = fConsCBarra.dsqConsulta
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 742
        Height = 15
        object RLDBText1: TRLDBText
          Left = 1
          Top = 0
          Width = 89
          Height = 12
          AutoSize = False
          DataField = 'CodBarra'
          DataSource = fConsCBarra.dsqConsulta
        end
        object RLDBText2: TRLDBText
          Left = 92
          Top = 0
          Width = 130
          Height = 12
          AutoSize = False
          DataField = 'REFERENCIA'
          DataSource = fConsCBarra.dsqConsulta
        end
        object RLDBText3: TRLDBText
          Left = 225
          Top = 0
          Width = 232
          Height = 12
          AutoSize = False
          DataField = 'NOME'
          DataSource = fConsCBarra.dsqConsulta
        end
        object RLDBText4: TRLDBText
          Left = 464
          Top = 0
          Width = 208
          Height = 12
          AutoSize = False
          DataField = 'NomeCor'
          DataSource = fConsCBarra.dsqConsulta
        end
        object RLDBText5: TRLDBText
          Left = 674
          Top = 0
          Width = 66
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'Tamanho'
          DataSource = fConsCBarra.dsqConsulta
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 13
          Width = 742
          Height = 2
          Align = faBottom
          DrawKind = dkLine
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Pen.Style = psDot
        end
      end
    end
    object RLBand1: TRLBand
      Left = 26
      Top = 26
      Width = 742
      Height = 58
      BandType = btHeader
      BeforePrint = RLBand1BeforePrint
      object RLLabel1: TRLLabel
        Left = 168
        Top = 21
        Width = 335
        Height = 19
        Caption = 'Rela'#231#227'o de C'#243'digo de Barras dos Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 1
        Top = 3
        Width = 42
        Height = 12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 664
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
      object RLLabel22: TRLLabel
        Left = 649
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
        Left = 684
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
      object RLSystemInfo1: TRLSystemInfo
        Left = 684
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
      object RLLabel3: TRLLabel
        Left = 3
        Top = 44
        Width = 52
        Height = 11
        Caption = 'C'#243'd. Barra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 104
        Top = 44
        Width = 51
        Height = 11
        Caption = 'Refer'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 224
        Top = 44
        Width = 29
        Height = 11
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 464
        Top = 44
        Width = 20
        Height = 11
        Caption = 'Cor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 688
        Top = 44
        Width = 44
        Height = 11
        Caption = 'Tamanho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 56
        Width = 742
        Height = 2
        Align = faBottom
        DrawKind = dkLine
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
    end
  end
end
