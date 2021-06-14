object fRelCReceber3: TfRelCReceber3
  Left = 7
  Top = 99
  Width = 789
  Height = 362
  Caption = 'fRelCReceber3'
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
    Width = 1123
    Height = 794
    DataSource = fContasReceber2.dsqConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    ShowProgress = False
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 58
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 232
        Top = 16
        Width = 237
        Height = 19
        Caption = 'Relat'#243'rio do Contas a Receber'
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
        Top = 44
        Width = 52
        Height = 12
        Caption = 'Dt.Emiss'#227'o'
      end
      object RLLabel4: TRLLabel
        Left = 56
        Top = 44
        Width = 36
        Height = 12
        Caption = 'N'#186' Nota'
      end
      object RLLabel5: TRLLabel
        Left = 96
        Top = 44
        Width = 25
        Height = 12
        Caption = 'Parc.'
      end
      object RLLabel6: TRLLabel
        Left = 122
        Top = 44
        Width = 66
        Height = 12
        Caption = 'Nosso N'#250'mero'
      end
      object RLLabel7: TRLLabel
        Left = 194
        Top = 44
        Width = 14
        Height = 12
        Caption = 'Fl.'
      end
      object RLLabel8: TRLLabel
        Left = 215
        Top = 44
        Width = 46
        Height = 12
        Caption = 'Dt. Vecto.'
      end
      object RLLabel9: TRLLabel
        Left = 337
        Top = 44
        Width = 51
        Height = 12
        Caption = 'Vlr. Parcela'
      end
      object RLLabel10: TRLLabel
        Left = 462
        Top = 44
        Width = 59
        Height = 12
        Caption = 'Vlr. Pendente'
      end
      object RLLabel11: TRLLabel
        Left = 417
        Top = 44
        Width = 41
        Height = 12
        Caption = 'Vlr. Pago'
      end
      object RLLabel12: TRLLabel
        Left = 524
        Top = 44
        Width = 29
        Height = 12
        Caption = 'Banco'
      end
      object RLLabel13: TRLLabel
        Left = 855
        Top = 44
        Width = 32
        Height = 12
        Caption = 'Cliente'
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 57
        Width = 1047
        Height = 1
        Align = faBottom
        DrawKind = dkLine
      end
      object RLLabel17: TRLLabel
        Left = 627
        Top = 44
        Width = 63
        Height = 12
        Caption = 'Tipo Cobran'#231'a'
      end
      object RLLabel18: TRLLabel
        Left = 747
        Top = 44
        Width = 42
        Height = 12
        Caption = 'Vendedor'
      end
      object RLLabel25: TRLLabel
        Left = 263
        Top = 45
        Width = 59
        Height = 12
        Caption = 'Dt.Financeiro'
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 96
      Width = 1047
      Height = 192
      DataSource = fContasReceber2.dsqConsulta
      object RLGroup1: TRLGroup
        Left = 0
        Top = 0
        Width = 1047
        Height = 83
        DataFields = 'NomeBancoBoleto'
        object RLBand4: TRLBand
          Left = 0
          Top = 0
          Width = 1047
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
          Width = 1047
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
            DataSource = fContasReceber2.dsqConsulta
          end
          object RLDBText2: TRLDBText
            Left = 52
            Top = 2
            Width = 46
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'NumNota'
            DataSource = fContasReceber2.dsqConsulta
          end
          object RLDBText4: TRLDBText
            Left = 122
            Top = 2
            Width = 72
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'NumTitBanco'
            DataSource = fContasReceber2.dsqConsulta
          end
          object RLDBText5: TRLDBText
            Left = 193
            Top = 2
            Width = 16
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'Filial'
            DataSource = fContasReceber2.dsqConsulta
          end
          object RLDBText6: TRLDBText
            Left = 210
            Top = 2
            Width = 50
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtVencCReceber'
            DataSource = fContasReceber2.dsqConsulta
          end
          object RLDBText7: TRLDBText
            Left = 323
            Top = 2
            Width = 65
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrParcCReceber'
            DataSource = fContasReceber2.dsqConsulta
          end
          object RLDBText8: TRLDBText
            Left = 389
            Top = 2
            Width = 65
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'PgtoParcial'
            DataSource = fContasReceber2.dsqConsulta
          end
          object RLDBText9: TRLDBText
            Left = 455
            Top = 2
            Width = 65
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'RestParcela'
            DataSource = fContasReceber2.dsqConsulta
          end
          object RLDBText10: TRLDBText
            Left = 521
            Top = 2
            Width = 105
            Height = 12
            AutoSize = False
            DataField = 'NomeBancoBoleto'
            DataSource = fContasReceber2.dsqConsulta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText11: TRLDBText
            Left = 893
            Top = 3
            Width = 152
            Height = 12
            AutoSize = False
            DataField = 'NomeCliente'
            DataSource = fContasReceber2.dsqConsulta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel2: TRLLabel
            Left = 97
            Top = 2
            Width = 25
            Height = 12
            Caption = 'Parc.'
          end
          object RLDBText3: TRLDBText
            Left = 854
            Top = 3
            Width = 38
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'CodCli'
            DataSource = fContasReceber2.dsqConsulta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText12: TRLDBText
            Left = 627
            Top = 2
            Width = 117
            Height = 12
            AutoSize = False
            DataField = 'NomeCobranca'
            DataSource = fContasReceber2.dsqConsulta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText13: TRLDBText
            Left = 746
            Top = 3
            Width = 106
            Height = 12
            AutoSize = False
            DataField = 'NomeVendedor'
            DataSource = fContasReceber2.dsqConsulta
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText14: TRLDBText
            Left = 268
            Top = 1
            Width = 50
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtVencimento2'
            DataSource = fContasReceber2.dsqConsulta
          end
        end
        object RLBand5: TRLBand
          Left = 0
          Top = 35
          Width = 1047
          Height = 22
          BandType = btSummary
          BeforePrint = RLBand5BeforePrint
          object RLDBResult4: TRLDBResult
            Left = 92
            Top = 4
            Width = 103
            Height = 12
            DataField = 'VlrParcCReceber'
            DataSource = fContasReceber2.dsqConsulta
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
          object RLLabel23: TRLLabel
            Left = 239
            Top = 4
            Width = 50
            Height = 12
            Caption = 'Total Pago:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object RLDBResult5: TRLDBResult
            Left = 291
            Top = 4
            Width = 78
            Height = 12
            DataField = 'PgtoParcial'
            DataSource = fContasReceber2.dsqConsulta
            DisplayMask = '###,###,###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            Info = riSum
            ParentFont = False
          end
          object RLLabel24: TRLLabel
            Left = 447
            Top = 4
            Width = 68
            Height = 12
            Caption = 'Total Pendente:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object RLDBResult6: TRLDBResult
            Left = 517
            Top = 4
            Width = 82
            Height = 12
            DataField = 'RestParcela'
            DataSource = fContasReceber2.dsqConsulta
            DisplayMask = '###,###,###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            Info = riSum
            ParentFont = False
          end
          object RLDraw2: TRLDraw
            Left = 0
            Top = 0
            Width = 1047
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
        Width = 1047
        Height = 24
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 92
          Top = 4
          Width = 103
          Height = 12
          DataField = 'VlrParcCReceber'
          DataSource = fContasReceber2.dsqConsulta
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
        object RLLabel15: TRLLabel
          Left = 239
          Top = 4
          Width = 50
          Height = 12
          Caption = 'Total Pago:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object RLDBResult2: TRLDBResult
          Left = 291
          Top = 4
          Width = 78
          Height = 12
          DataField = 'PgtoParcial'
          DataSource = fContasReceber2.dsqConsulta
          DisplayMask = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Info = riSum
          ParentFont = False
        end
        object RLLabel16: TRLLabel
          Left = 447
          Top = 4
          Width = 68
          Height = 12
          Caption = 'Total Pendente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          ParentFont = False
        end
        object RLDBResult3: TRLDBResult
          Left = 517
          Top = 4
          Width = 82
          Height = 12
          DataField = 'RestParcela'
          DataSource = fContasReceber2.dsqConsulta
          DisplayMask = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Info = riSum
          ParentFont = False
        end
        object RLDraw3: TRLDraw
          Left = 0
          Top = 0
          Width = 1047
          Height = 1
          Align = faTop
          DrawKind = dkLine
          Pen.Style = psDot
        end
      end
    end
  end
end
