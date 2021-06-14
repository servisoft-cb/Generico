object fRelFinanceiro: TfRelFinanceiro
  Left = -1
  Top = 117
  Width = 793
  Height = 429
  HorzScrollBar.Position = 363
  Caption = 'fRelFinanceiro'
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
    Left = -355
    Top = 16
    Width = 1123
    Height = 794
    DataSource = fConsFinanceiro.dsmFinanceiro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -8
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 40
      object RLLabel1: TRLLabel
        Left = 392
        Top = 4
        Width = 158
        Height = 19
        Caption = 'Relat'#243'rio Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 968
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
        Left = 988
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
        Left = 953
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
        Left = 988
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
        Left = 8
        Top = 28
        Width = 18
        Height = 10
        Caption = 'Data'
      end
      object RLLabel3: TRLLabel
        Left = 64
        Top = 28
        Width = 31
        Height = 10
        Caption = 'Dt.Vecto'
      end
      object RLLabel4: TRLLabel
        Left = 111
        Top = 28
        Width = 22
        Height = 10
        Caption = 'Nome'
      end
      object RLLabel5: TRLLabel
        Left = 728
        Top = 28
        Width = 17
        Height = 10
        Caption = 'Tipo'
      end
      object RLLabel6: TRLLabel
        Left = 827
        Top = 28
        Width = 39
        Height = 10
        Caption = 'Vlr.Cr'#233'dito'
      end
      object RLLabel7: TRLLabel
        Left = 928
        Top = 28
        Width = 36
        Height = 10
        Caption = 'Vlr.D'#233'bito'
      end
      object RLLabel8: TRLLabel
        Left = 1016
        Top = 28
        Width = 21
        Height = 10
        Caption = 'Saldo'
      end
      object RLLabel9: TRLLabel
        Left = 440
        Top = 28
        Width = 23
        Height = 10
        Caption = 'Banco'
      end
      object RLLabel10: TRLLabel
        Left = 595
        Top = 28
        Width = 52
        Height = 10
        Caption = 'Tipo Cobran'#231'a'
      end
      object RLLabel11: TRLLabel
        Left = 416
        Top = 28
        Width = 19
        Height = 10
        Caption = 'Filial'
      end
      object RLLabel12: TRLLabel
        Left = 336
        Top = 28
        Width = 29
        Height = 10
        Caption = 'N'#186' Nota'
      end
      object RLLabel13: TRLLabel
        Left = 393
        Top = 28
        Width = 20
        Height = 10
        Caption = 'Parc.'
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 38
        Width = 1047
        Height = 2
        Align = faBottom
        DrawKind = dkLine
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 78
      Width = 1047
      Height = 240
      DataSource = fConsFinanceiro.dsmFinanceiro
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 1047
        Height = 14
        object RLDraw2: TRLDraw
          Left = 0
          Top = 12
          Width = 1047
          Height = 2
          Align = faBottom
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLDBText1: TRLDBText
          Left = 0
          Top = 1
          Width = 52
          Height = 10
          Alignment = taCenter
          AutoSize = False
          DataField = 'Data'
          DataSource = fConsFinanceiro.dsmFinanceiro
        end
        object RLDBText2: TRLDBText
          Left = 54
          Top = 1
          Width = 53
          Height = 10
          Alignment = taCenter
          AutoSize = False
          DataField = 'DtVencimento'
          DataSource = fConsFinanceiro.dsmFinanceiro
        end
        object RLDBText3: TRLDBText
          Left = 109
          Top = 1
          Width = 220
          Height = 10
          AutoSize = False
          DataField = 'Nome'
          DataSource = fConsFinanceiro.dsmFinanceiro
        end
        object RLDBText4: TRLDBText
          Left = 331
          Top = 1
          Width = 62
          Height = 10
          Alignment = taCenter
          AutoSize = False
          DataField = 'NumNota'
          DataSource = fConsFinanceiro.dsmFinanceiro
        end
        object RLDBText5: TRLDBText
          Left = 394
          Top = 1
          Width = 19
          Height = 10
          Alignment = taCenter
          AutoSize = False
          DataField = 'Parcela'
          DataSource = fConsFinanceiro.dsmFinanceiro
        end
        object RLDBText6: TRLDBText
          Left = 437
          Top = 1
          Width = 156
          Height = 10
          AutoSize = False
          DataField = 'Banco'
          DataSource = fConsFinanceiro.dsmFinanceiro
        end
        object RLDBText7: TRLDBText
          Left = 594
          Top = 1
          Width = 108
          Height = 10
          AutoSize = False
          DataField = 'NomeTipoCobranca'
          DataSource = fConsFinanceiro.dsmFinanceiro
        end
        object RLDBText8: TRLDBText
          Left = 706
          Top = 1
          Width = 70
          Height = 10
          Alignment = taCenter
          AutoSize = False
          DataField = 'Tipo'
          DataSource = fConsFinanceiro.dsmFinanceiro
        end
        object RLDBText9: TRLDBText
          Left = 415
          Top = 1
          Width = 19
          Height = 10
          Alignment = taCenter
          AutoSize = False
          DataField = 'Filial'
          DataSource = fConsFinanceiro.dsmFinanceiro
        end
        object RLDBText10: TRLDBText
          Left = 785
          Top = 1
          Width = 84
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrCredito'
          DataSource = fConsFinanceiro.dsmFinanceiro
        end
        object RLDBText11: TRLDBText
          Left = 875
          Top = 1
          Width = 84
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrDebito'
          DataSource = fConsFinanceiro.dsmFinanceiro
        end
        object RLDBText12: TRLDBText
          Left = 961
          Top = 1
          Width = 84
          Height = 10
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Saldo'
          DataSource = fConsFinanceiro.dsmFinanceiro
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 14
        Width = 1047
        Height = 14
        BandType = btSummary
        object RLLabel14: TRLLabel
          Left = 737
          Top = 1
          Width = 41
          Height = 10
          Caption = 'Total ===>'
        end
        object RLDBResult1: TRLDBResult
          Left = 809
          Top = 0
          Width = 60
          Height = 10
          Alignment = taRightJustify
          DataField = 'VlrCredito'
          DataSource = fConsFinanceiro.dsmFinanceiro
          DisplayMask = '###,###,###,##0.00'
          Info = riSum
        end
        object RLDBResult2: TRLDBResult
          Left = 902
          Top = 0
          Width = 57
          Height = 10
          Alignment = taRightJustify
          DataField = 'VlrDebito'
          DataSource = fConsFinanceiro.dsmFinanceiro
          DisplayMask = '###,###,###,##0.00'
          Info = riSum
        end
        object RLDBResult3: TRLDBResult
          Left = 993
          Top = 0
          Width = 52
          Height = 10
          Alignment = taRightJustify
          DataField = 'Saldo'
          DataSource = fConsFinanceiro.dsmFinanceiro
          DisplayMask = '###,###,###,##0.00'
        end
      end
    end
  end
end
