object fRelPlanoContasCad: TfRelPlanoContasCad
  Left = 103
  Top = 157
  Width = 857
  Height = 567
  Caption = 'fRelPlanoContasCad'
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
    Left = 16
    Top = -8
    Width = 794
    Height = 1123
    DataSource = fConsPlanoContasCad.dsmConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 8.000000000000000000
    Margins.TopMargin = 8.000000000000000000
    Margins.RightMargin = 8.000000000000000000
    Margins.BottomMargin = 8.000000000000000000
    object RLBand1: TRLBand
      Left = 30
      Top = 30
      Width = 734
      Height = 46
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 176
        Top = 4
        Width = 325
        Height = 19
        Caption = 'Rel'#225'torio do Cadastro do Plano de Contas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 648
        Top = 3
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
        Left = 671
        Top = 3
        Width = 56
        Height = 12
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
        Left = 628
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
        Left = 671
        Top = 17
        Width = 61
        Height = 12
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDraw2: TRLDraw
        Left = 0
        Top = 44
        Width = 734
        Height = 2
        Align = faBottom
        DrawKind = dkLine
        Pen.Style = psDot
      end
      object RLLabel5: TRLLabel
        Left = 192
        Top = 28
        Width = 80
        Height = 14
        Caption = 'Nome SubConta'
      end
      object RLLabel6: TRLLabel
        Left = 112
        Top = 28
        Width = 75
        Height = 14
        Caption = 'C'#243'd. SubConta'
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 30
      Top = 76
      Width = 734
      Height = 354
      DataSource = fConsPlanoContasCad.dsmConsulta
      object RLGroup1: TRLGroup
        Left = 0
        Top = 0
        Width = 734
        Height = 177
        DataFields = 'NomePlano'
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 734
          Height = 22
          BandType = btHeader
          object RLLabel2: TRLLabel
            Left = 32
            Top = 5
            Width = 38
            Height = 14
            Caption = 'Conta:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
          object RLDBText1: TRLDBText
            Left = 73
            Top = 5
            Width = 55
            Height = 14
            DataField = 'CodPlano'
            DataSource = fConsPlanoContasCad.dsmConsulta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
          object RLDBText2: TRLDBText
            Left = 129
            Top = 5
            Width = 65
            Height = 14
            DataField = 'NomePlano'
            DataSource = fConsPlanoContasCad.dsmConsulta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
        end
        object RLBand3: TRLBand
          Left = 0
          Top = 22
          Width = 734
          Height = 16
          object RLDBText3: TRLDBText
            Left = 114
            Top = 2
            Width = 70
            Height = 13
            Alignment = taCenter
            AutoSize = False
            DataField = 'CodSubConta'
            DataSource = fConsPlanoContasCad.dsmConsulta
          end
          object RLDBText4: TRLDBText
            Left = 193
            Top = 2
            Width = 456
            Height = 13
            AutoSize = False
            DataField = 'NomeSubConta'
            DataSource = fConsPlanoContasCad.dsmConsulta
          end
        end
        object RLBand4: TRLBand
          Left = 0
          Top = 38
          Width = 734
          Height = 4
          BandType = btFooter
          object RLDraw1: TRLDraw
            Left = 0
            Top = 2
            Width = 734
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
