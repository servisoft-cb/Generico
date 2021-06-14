object fRelPlanoContas: TfRelPlanoContas
  Left = 38
  Top = 81
  Width = 954
  Height = 604
  Caption = 'fRelPlanoContas'
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
    Left = 40
    Top = 16
    Width = 794
    Height = 1123
    DataSource = fConsPlanoContas.dsmAuxPlano
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
      Top = 83
      Width = 742
      Height = 630
      DataSource = fConsPlanoContas.dsmAuxPlano
      object RLBand5: TRLBand
        Left = 0
        Top = 240
        Width = 742
        Height = 19
        BandType = btSummary
        BeforePrint = RLBand5BeforePrint
        object RLLabel8: TRLLabel
          Left = 373
          Top = 1
          Width = 147
          Height = 14
          Alignment = taRightJustify
          Caption = 'Vlr. Total Geral===>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw4: TRLDraw
          Left = 0
          Top = 17
          Width = 742
          Height = 2
          Align = faBottom
          DrawKind = dkLine
        end
        object RLLabel11: TRLLabel
          Left = 635
          Top = 1
          Width = 105
          Height = 14
          Alignment = taRightJustify
          Caption = '999.999.999,99'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel12: TRLLabel
          Left = 523
          Top = 1
          Width = 105
          Height = 14
          Alignment = taRightJustify
          Caption = '999.999.999,99'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLGroup3: TRLGroup
        Left = 0
        Top = 0
        Width = 742
        Height = 240
        DataFields = 'Filial'
        object RLGroup2: TRLGroup
          Left = 0
          Top = 22
          Width = 742
          Height = 129
          DataFields = 'Filial;Nome'
          object RLBand3: TRLBand
            Left = 0
            Top = 17
            Width = 742
            Height = 19
            BandType = btSummary
            BeforePrint = RLBand3BeforePrint
            object RLLabel6: TRLLabel
              Left = 400
              Top = 2
              Width = 112
              Height = 14
              Alignment = taRightJustify
              Caption = 'Vlr. Total ===>'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
            end
            object RLDraw3: TRLDraw
              Left = 0
              Top = 17
              Width = 742
              Height = 2
              Align = faBottom
              DrawKind = dkLine
            end
            object RLLabel9: TRLLabel
              Left = 635
              Top = 2
              Width = 105
              Height = 14
              Alignment = taRightJustify
              Caption = '999.999.999,99'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
            end
            object RLLabel10: TRLLabel
              Left = 523
              Top = 2
              Width = 105
              Height = 14
              Alignment = taRightJustify
              Caption = '999.999.999,99'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
            end
          end
          object RLBand2: TRLBand
            Left = 0
            Top = 0
            Width = 742
            Height = 17
            BeforePrint = RLBand2BeforePrint
            object RLLabel5: TRLLabel
              Left = 2
              Top = 1
              Width = 527
              Height = 14
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText1: TRLDBText
              Left = 534
              Top = 1
              Width = 95
              Height = 14
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'VlrEntrada'
              DataSource = fConsPlanoContas.dsmAuxPlano
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText2: TRLDBText
              Left = 643
              Top = 1
              Width = 95
              Height = 14
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'VlrSaida'
              DataSource = fConsPlanoContas.dsmAuxPlano
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
            end
          end
        end
        object RLBand6: TRLBand
          Left = 0
          Top = 0
          Width = 742
          Height = 22
          BandType = btHeader
          Color = clBtnFace
          ParentColor = False
          Transparent = False
          object RLLabel13: TRLLabel
            Left = 32
            Top = 3
            Width = 99
            Height = 16
            AutoSize = False
            Caption = 'Filial/Empresa:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
            Transparent = False
          end
          object RLDBText3: TRLDBText
            Left = 132
            Top = 3
            Width = 565
            Height = 14
            AutoSize = False
            DataField = 'NomeFilial'
            DataSource = fConsPlanoContas.dsmAuxPlano
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
            Transparent = False
          end
        end
      end
    end
    object RLBand1: TRLBand
      Left = 26
      Top = 26
      Width = 742
      Height = 57
      BandType = btHeader
      BeforePrint = RLBand1BeforePrint
      object RLLabel1: TRLLabel
        Left = 16
        Top = 5
        Width = 594
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = 'Relat'#243'rio de Plano de Contas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
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
      object RLLabel2: TRLLabel
        Left = 3
        Top = 40
        Width = 57
        Height = 14
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 570
        Top = 40
        Width = 66
        Height = 14
        Caption = 'Vlr. Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 684
        Top = 40
        Width = 54
        Height = 14
        Caption = 'Vlr. Saida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 55
        Width = 742
        Height = 2
        Align = faBottom
        DrawKind = dkLine
      end
    end
  end
end
