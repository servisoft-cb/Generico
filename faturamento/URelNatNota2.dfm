object fRelNatNota2: TfRelNatNota2
  Left = 3
  Top = 90
  Width = 1023
  Height = 436
  Caption = 'fRelNatNota2'
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
    Top = 16
    Width = 1123
    Height = 794
    DataSource = fPrevNotasNatOpe2.dsmNatureza
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 8.000000000000000000
    Margins.RightMargin = 8.000000000000000000
    PageSetup.Orientation = poLandscape
    ShowProgress = False
    object RLSubDetail1: TRLSubDetail
      Left = 30
      Top = 38
      Width = 1063
      Height = 355
      DataSource = fPrevNotasNatOpe2.dsmNatureza
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 1063
        Height = 47
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel1: TRLLabel
          Left = 80
          Top = 8
          Width = 722
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'RELA'#199#195'O DE NOTAS EMITIDAS POR NATUREZA - 01/08/2008 a 31/08/2008'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 1
          Top = 32
          Width = 33
          Height = 12
          Caption = 'Op'#231#227'o:'
        end
        object RLLabel21: TRLLabel
          Left = 965
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
          Left = 988
          Top = 2
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
          Left = 945
          Top = 15
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
          Left = 988
          Top = 16
          Width = 64
          Height = 11
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
          Left = 35
          Top = 32
          Width = 33
          Height = 12
          Caption = 'Op'#231#227'o:'
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 145
        Width = 1063
        Height = 15
        BandType = btSummary
        object RLLabel18: TRLLabel
          Left = 454
          Top = 1
          Width = 55
          Height = 11
          Alignment = taRightJustify
          Caption = 'Total Geral:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw2: TRLDraw
          Left = 410
          Top = 0
          Width = 650
          Height = 1
          Align = faTopOnly
          DrawKind = dkLine
        end
        object RLDBResult7: TRLDBResult
          Left = 578
          Top = 1
          Width = 57
          Height = 12
          Alignment = taRightJustify
          DataField = 'VTotal'
          DataSource = fPrevNotasNatOpe2.dsmNatureza
          DisplayMask = '###,###,###,##0.00'
          Info = riSum
        end
        object RLDBResult8: TRLDBResult
          Left = 644
          Top = 1
          Width = 82
          Height = 12
          Alignment = taRightJustify
          DataField = 'VMercadoria'
          DataSource = fPrevNotasNatOpe2.dsmNatureza
          DisplayMask = '###,###,###,##0.00'
          Info = riSum
        end
        object RLDBResult9: TRLDBResult
          Left = 759
          Top = 1
          Width = 58
          Height = 12
          Alignment = taRightJustify
          DataField = 'VBase'
          DataSource = fPrevNotasNatOpe2.dsmNatureza
          DisplayMask = '###,###,###,##0.00'
          Info = riSum
        end
        object RLDBResult10: TRLDBResult
          Left = 844
          Top = 1
          Width = 58
          Height = 12
          Alignment = taRightJustify
          DataField = 'VIcms'
          DataSource = fPrevNotasNatOpe2.dsmNatureza
          DisplayMask = '###,###,###,##0.00'
          Info = riSum
        end
        object RLDBResult11: TRLDBResult
          Left = 908
          Top = 1
          Width = 68
          Height = 12
          Alignment = taRightJustify
          DataField = 'VIsentas'
          DataSource = fPrevNotasNatOpe2.dsmNatureza
          DisplayMask = '###,###,###,##0.00'
          Info = riSum
        end
        object RLDBResult12: TRLDBResult
          Left = 996
          Top = 1
          Width = 65
          Height = 12
          Alignment = taRightJustify
          DataField = 'VOutras'
          DataSource = fPrevNotasNatOpe2.dsmNatureza
          DisplayMask = '###,###,###,##0.00'
          Info = riSum
        end
      end
      object RLGroup1: TRLGroup
        Left = 0
        Top = 47
        Width = 1063
        Height = 98
        DataFields = 'CodNatOper'
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 1063
          Height = 16
          BandType = btHeader
          object RLLabel4: TRLLabel
            Left = 0
            Top = 0
            Width = 38
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            Caption = 'Nat.'
          end
          object RLLabel5: TRLLabel
            Left = 63
            Top = 0
            Width = 28
            Height = 16
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            Caption = 'UF'
          end
          object RLLabel6: TRLLabel
            Left = 90
            Top = 0
            Width = 36
            Height = 16
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            Caption = 'C'#243'digo'
          end
          object RLLabel7: TRLLabel
            Left = 125
            Top = 0
            Width = 272
            Height = 16
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            Caption = 'Cliente'
          end
          object RLLabel8: TRLLabel
            Left = 417
            Top = 0
            Width = 50
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            Caption = 'N'#186' Nota'
          end
          object RLLabel9: TRLLabel
            Left = 485
            Top = 0
            Width = 60
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            Caption = 'Dt.Emiss'#227'o'
          end
          object RLLabel10: TRLLabel
            Left = 544
            Top = 0
            Width = 92
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            Caption = 'Vlr.Total'
          end
          object RLLabel11: TRLLabel
            Left = 635
            Top = 0
            Width = 92
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            Caption = 'Vlr.Mercadoria'
          end
          object RLLabel12: TRLLabel
            Left = 726
            Top = 0
            Width = 92
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            Caption = 'Base Icms'
          end
          object RLLabel13: TRLLabel
            Left = 817
            Top = 0
            Width = 87
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            Caption = 'Vlr.Icms'
          end
          object RLLabel14: TRLLabel
            Left = 903
            Top = 0
            Width = 76
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            Caption = 'Vlr.Isentas'
          end
          object RLLabel15: TRLLabel
            Left = 978
            Top = 0
            Width = 85
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            Caption = 'Vlr.Outras'
          end
          object RLLabel16: TRLLabel
            Left = 466
            Top = 0
            Width = 20
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            Caption = 'Fil.'
          end
          object RLLabel19: TRLLabel
            Left = 36
            Top = 0
            Width = 28
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            Caption = 'Int.'
          end
          object RLLabel20: TRLLabel
            Left = 396
            Top = 0
            Width = 22
            Height = 16
            Alignment = taCenter
            AutoSize = False
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            Caption = 'Ser'
          end
        end
        object RLBand3: TRLBand
          Left = 0
          Top = 16
          Width = 1063
          Height = 15
          object RLDBText1: TRLDBText
            Left = 0
            Top = 1
            Width = 38
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'CodNatOper'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
          end
          object RLDBText2: TRLDBText
            Left = 64
            Top = 1
            Width = 26
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'UF'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
          end
          object RLDBText3: TRLDBText
            Left = 91
            Top = 1
            Width = 34
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'CodCliente'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
          end
          object RLDBText4: TRLDBText
            Left = 126
            Top = 1
            Width = 269
            Height = 12
            AutoSize = False
            DataField = 'NomeCliente'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
          end
          object RLDBText5: TRLDBText
            Left = 419
            Top = 1
            Width = 46
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'Nota'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
          end
          object RLDBText6: TRLDBText
            Left = 466
            Top = 1
            Width = 18
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'Filial'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
          end
          object RLDBText7: TRLDBText
            Left = 485
            Top = 1
            Width = 56
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtEmissao'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
          end
          object RLDBText8: TRLDBText
            Left = 546
            Top = 1
            Width = 89
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VTotal'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
          end
          object RLDBText9: TRLDBText
            Left = 637
            Top = 1
            Width = 89
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VMercadoria'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
          end
          object RLDBText10: TRLDBText
            Left = 728
            Top = 1
            Width = 89
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VBase'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
          end
          object RLDBText11: TRLDBText
            Left = 818
            Top = 1
            Width = 84
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VIcms'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
          end
          object RLDBText12: TRLDBText
            Left = 904
            Top = 1
            Width = 73
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VIsentas'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
          end
          object RLDBText13: TRLDBText
            Left = 982
            Top = 1
            Width = 80
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VOutras'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
          end
          object RLDBText14: TRLDBText
            Left = 37
            Top = 1
            Width = 26
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'NatOper'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
          end
          object RLDBText15: TRLDBText
            Left = 398
            Top = 3
            Width = 18
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'Serie'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
          end
        end
        object RLBand4: TRLBand
          Left = 0
          Top = 31
          Width = 1063
          Height = 18
          BandType = btSummary
          object RLLabel17: TRLLabel
            Left = 424
            Top = 1
            Width = 85
            Height = 11
            Alignment = taRightJustify
            Caption = 'Total da Natureza:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDraw1: TRLDraw
            Left = 410
            Top = 0
            Width = 650
            Height = 1
            Align = faTopOnly
            DrawKind = dkLine
          end
          object RLDBResult1: TRLDBResult
            Left = 578
            Top = 1
            Width = 57
            Height = 12
            Alignment = taRightJustify
            DataField = 'VTotal'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
            DisplayMask = '###,###,###,##0.00'
            Info = riSum
          end
          object RLDBResult2: TRLDBResult
            Left = 644
            Top = 1
            Width = 82
            Height = 12
            Alignment = taRightJustify
            DataField = 'VMercadoria'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
            DisplayMask = '###,###,###,##0.00'
            Info = riSum
          end
          object RLDBResult3: TRLDBResult
            Left = 759
            Top = 1
            Width = 58
            Height = 12
            Alignment = taRightJustify
            DataField = 'VBase'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
            DisplayMask = '###,###,###,##0.00'
            Info = riSum
          end
          object RLDBResult4: TRLDBResult
            Left = 845
            Top = 1
            Width = 58
            Height = 12
            Alignment = taRightJustify
            DataField = 'VIcms'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
            DisplayMask = '###,###,###,##0.00'
            Info = riSum
          end
          object RLDBResult5: TRLDBResult
            Left = 909
            Top = 1
            Width = 68
            Height = 12
            Alignment = taRightJustify
            DataField = 'VIsentas'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
            DisplayMask = '###,###,###,##0.00'
            Info = riSum
          end
          object RLDBResult6: TRLDBResult
            Left = 996
            Top = 1
            Width = 65
            Height = 12
            Alignment = taRightJustify
            DataField = 'VOutras'
            DataSource = fPrevNotasNatOpe2.dsmNatureza
            DisplayMask = '###,###,###,##0.00'
            Info = riSum
          end
        end
      end
    end
  end
end
