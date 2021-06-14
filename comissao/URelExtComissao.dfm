object fRelExtComissao: TfRelExtComissao
  Left = 9
  Top = 115
  Width = 781
  Height = 436
  HorzScrollBar.Position = 348
  VertScrollBar.Position = 21
  Caption = 'fRelExtComissao'
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
    Left = -340
    Top = -13
    Width = 1123
    Height = 794
    DataSource = fConsComissao.dsmResumido
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 39
      BandType = btHeader
      BeforePrint = RLBand1BeforePrint
      object RLLabel1: TRLLabel
        Left = 72
        Top = 6
        Width = 674
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = 'RELAT'#211'RIO EXTRATO  DA COMISS'#195'O'
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
        Left = 3
        Top = 24
        Width = 33
        Height = 12
        Caption = 'Op'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 96
      Width = 1047
      Height = 576
      DataSource = fConsComissao.dsmResumido
      object RLGroup1: TRLGroup
        Left = 0
        Top = 0
        Width = 1047
        Height = 217
        DataFields = 'NomeVendedor;CodVendedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 1047
          Height = 19
          BandType = btHeader
          BeforePrint = RLBand2BeforePrint
          object RLDraw5: TRLDraw
            Left = 0
            Top = 3
            Width = 305
            Height = 16
          end
          object RLDraw4: TRLDraw
            Left = 1014
            Top = 3
            Width = 33
            Height = 16
          end
          object RLDraw3: TRLDraw
            Left = 849
            Top = 3
            Width = 166
            Height = 16
          end
          object RLDraw2: TRLDraw
            Left = 448
            Top = 3
            Width = 402
            Height = 16
          end
          object RLDraw1: TRLDraw
            Left = 304
            Top = 3
            Width = 145
            Height = 16
          end
          object RLLabel4: TRLLabel
            Left = 2
            Top = 5
            Width = 42
            Height = 12
            Caption = 'Vendedor'
          end
          object RLLabel5: TRLLabel
            Left = 324
            Top = 5
            Width = 49
            Height = 12
            Caption = 'Vlr.Anterior'
          end
          object RLLabel6: TRLLabel
            Left = 477
            Top = 5
            Width = 54
            Height = 12
            Caption = 'Vlr.Entradas'
          end
          object RLLabel7: TRLLabel
            Left = 571
            Top = 5
            Width = 45
            Height = 12
            Caption = 'Vlr.Saidas'
          end
          object RLLabel8: TRLLabel
            Left = 621
            Top = 5
            Width = 62
            Height = 12
            Caption = 'Vlr.Devolu'#231#227'o'
          end
          object RLLabel9: TRLLabel
            Left = 775
            Top = 5
            Width = 72
            Height = 12
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = False
            Caption = 'Vlr.Total Per'#237'odo'
          end
          object RLLabel10: TRLLabel
            Left = 926
            Top = 5
            Width = 86
            Height = 12
            Caption = 'Vlr.Total Acumulado'
          end
          object RLLabel11: TRLLabel
            Left = 1018
            Top = 5
            Width = 24
            Height = 12
            Caption = '% IR'
          end
          object RLLabel12: TRLLabel
            Left = 399
            Top = 5
            Width = 47
            Height = 12
            Caption = 'Vlr.IR Ant.'
          end
          object RLLabel13: TRLLabel
            Left = 695
            Top = 5
            Width = 62
            Height = 12
            Caption = 'Vlr.IR Per'#237'odo'
          end
          object RLLabel14: TRLLabel
            Left = 855
            Top = 5
            Width = 57
            Height = 12
            Caption = 'Vlr.IR Acum.'
          end
        end
        object RLBand3: TRLBand
          Left = 0
          Top = 19
          Width = 1047
          Height = 15
          BeforePrint = RLBand3BeforePrint
          object RLDBText1: TRLDBText
            Left = 0
            Top = 1
            Width = 304
            Height = 12
            AutoSize = False
            DataField = 'NomeVendedor'
            DataSource = fConsComissao.dsmResumido
          end
          object RLDBText2: TRLDBText
            Left = 307
            Top = 1
            Width = 68
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrTotalAnt'
            DataSource = fConsComissao.dsmResumido
          end
          object RLDBText3: TRLDBText
            Left = 449
            Top = 1
            Width = 82
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrEntrada'
            DataSource = fConsComissao.dsmResumido
          end
          object RLDBText4: TRLDBText
            Left = 534
            Top = 1
            Width = 82
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrSaida'
            DataSource = fConsComissao.dsmResumido
          end
          object RLDBText5: TRLDBText
            Left = 620
            Top = 1
            Width = 63
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrDevolucao'
            DataSource = fConsComissao.dsmResumido
          end
          object RLDBText6: TRLDBText
            Left = 767
            Top = 1
            Width = 80
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrTotalPeriodo'
            DataSource = fConsComissao.dsmResumido
          end
          object RLDBText7: TRLDBText
            Left = 916
            Top = 1
            Width = 96
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrTotalAcumulado'
            DataSource = fConsComissao.dsmResumido
          end
          object RLDBText8: TRLDBText
            Left = 1016
            Top = 1
            Width = 30
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'PercIR'
            DataSource = fConsComissao.dsmResumido
          end
          object RLDBText9: TRLDBText
            Left = 383
            Top = 1
            Width = 63
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrIRAnt'
            DataSource = fConsComissao.dsmResumido
          end
          object RLDBText10: TRLDBText
            Left = 695
            Top = 1
            Width = 63
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrIRPeriodo'
            DataSource = fConsComissao.dsmResumido
          end
          object RLDBText11: TRLDBText
            Left = 852
            Top = 1
            Width = 61
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrIRAcumulado'
            DataSource = fConsComissao.dsmResumido
          end
          object RLDraw6: TRLDraw
            Left = 344
            Top = 16
            Width = 48
            Height = 48
          end
        end
        object RLSubDetail2: TRLSubDetail
          Left = 0
          Top = 34
          Width = 1047
          Height = 111
          DataSource = fConsComissao.dsqComissao
          object RLBand4: TRLBand
            Left = 0
            Top = 0
            Width = 1047
            Height = 24
            BandType = btHeader
            object RLLabel3: TRLLabel
              Left = 175
              Top = 9
              Width = 36
              Height = 12
              Caption = 'N'#186' Nota'
            end
            object RLLabel15: TRLLabel
              Left = 216
              Top = 9
              Width = 34
              Height = 12
              Caption = 'Parcela'
            end
            object RLLabel16: TRLLabel
              Left = 256
              Top = 9
              Width = 22
              Height = 12
              Caption = 'Filial'
            end
            object RLLabel17: TRLLabel
              Left = 53
              Top = 9
              Width = 23
              Height = 12
              Caption = 'Data'
            end
            object RLLabel18: TRLLabel
              Left = 119
              Top = 9
              Width = 34
              Height = 12
              Caption = 'Fun'#231#227'o'
            end
            object RLLabel19: TRLLabel
              Left = 288
              Top = 9
              Width = 32
              Height = 12
              Caption = 'Cliente'
            end
            object RLLabel20: TRLLabel
              Left = 690
              Top = 9
              Width = 41
              Height = 12
              Caption = 'Vlr. Base'
            end
            object RLLabel23: TRLLabel
              Left = 737
              Top = 9
              Width = 56
              Height = 12
              Caption = '% Comiss'#227'o'
            end
            object RLLabel24: TRLLabel
              Left = 817
              Top = 9
              Width = 62
              Height = 12
              Caption = 'Vlr. Comiss'#227'o'
            end
            object RLLabel25: TRLLabel
              Left = 889
              Top = 9
              Width = 20
              Height = 12
              Caption = 'Tipo'
            end
            object RLDraw7: TRLDraw
              Left = 51
              Top = 22
              Width = 858
              Height = 2
              Align = faBottomOnly
              DrawKind = dkLine
              Pen.Style = psDot
            end
          end
          object RLBand5: TRLBand
            Left = 0
            Top = 24
            Width = 1047
            Height = 16
            BeforePrint = RLBand5BeforePrint
            object RLDBText12: TRLDBText
              Left = 52
              Top = 2
              Width = 60
              Height = 12
              Alignment = taCenter
              DataField = 'DtReferencia'
              DataSource = fConsComissao.dsqComissao
            end
            object RLLabel26: TRLLabel
              Left = 119
              Top = 2
              Width = 34
              Height = 12
              Caption = 'Fun'#231#227'o'
            end
            object RLDBText13: TRLDBText
              Left = 169
              Top = 2
              Width = 46
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'NroDoc'
              DataSource = fConsComissao.dsqComissao
            end
            object RLDBText14: TRLDBText
              Left = 217
              Top = 2
              Width = 22
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'ParcDoc'
              DataSource = fConsComissao.dsqComissao
            end
            object RLDBText15: TRLDBText
              Left = 256
              Top = 2
              Width = 22
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'Filial'
              DataSource = fConsComissao.dsqComissao
            end
            object RLDBText16: TRLDBText
              Left = 288
              Top = 2
              Width = 361
              Height = 12
              AutoSize = False
              DataField = 'lkNomeCliente'
              DataSource = fConsComissao.dsqComissao
            end
            object RLDBText17: TRLDBText
              Left = 652
              Top = 2
              Width = 79
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'VlrBase'
              DataSource = fConsComissao.dsqComissao
            end
            object RLDBText18: TRLDBText
              Left = 739
              Top = 2
              Width = 52
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'PercComissao'
              DataSource = fConsComissao.dsqComissao
            end
            object RLDBText19: TRLDBText
              Left = 799
              Top = 2
              Width = 80
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'VlrComissao'
              DataSource = fConsComissao.dsqComissao
            end
            object RLDBText20: TRLDBText
              Left = 887
              Top = 2
              Width = 22
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'Tipo'
              DataSource = fConsComissao.dsqComissao
            end
          end
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 217
        Width = 1047
        Height = 17
        BandType = btSummary
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Visible = False
        object RLLabel38: TRLLabel
          Left = 149
          Top = 3
          Width = 70
          Height = 11
          Alignment = taRightJustify
          Caption = 'Total Geral ==>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 299
          Top = 3
          Width = 76
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrTotalAnt'
          DataSource = fConsComissao.dsmResumido
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
        object RLDraw13: TRLDraw
          Left = 0
          Top = 0
          Width = 1047
          Height = 2
          Align = faTop
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLDBResult2: TRLDBResult
          Left = 378
          Top = 3
          Width = 78
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrEntrada'
          DataSource = fConsComissao.dsmResumido
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
        object RLDBResult3: TRLDBResult
          Left = 460
          Top = 3
          Width = 84
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrSaida'
          DataSource = fConsComissao.dsmResumido
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
        object RLDBResult4: TRLDBResult
          Left = 546
          Top = 3
          Width = 66
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrDevolucao'
          DataSource = fConsComissao.dsmResumido
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
        object RLDBResult5: TRLDBResult
          Left = 617
          Top = 3
          Width = 81
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrTotalPeriodo'
          DataSource = fConsComissao.dsmResumido
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
        object RLDBResult6: TRLDBResult
          Left = 700
          Top = 3
          Width = 96
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrTotalAcumulado'
          DataSource = fConsComissao.dsmResumido
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
        object RLDBResult7: TRLDBResult
          Left = 839
          Top = 3
          Width = 63
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrIRAnt'
          DataSource = fConsComissao.dsmResumido
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
        object RLDBResult8: TRLDBResult
          Left = 905
          Top = 3
          Width = 68
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrIRPeriodo'
          DataSource = fConsComissao.dsmResumido
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
        object RLDBResult9: TRLDBResult
          Left = 976
          Top = 3
          Width = 69
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrIRAcumulado'
          DataSource = fConsComissao.dsmResumido
          DisplayMask = '###,###,##0.00'
          Info = riSum
        end
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 77
      Width = 1047
      Height = 19
      BandType = btHeader
      BeforePrint = RLBand6BeforePrint
      object RLDraw8: TRLDraw
        Left = 0
        Top = 3
        Width = 305
        Height = 16
      end
      object RLDraw9: TRLDraw
        Left = 1014
        Top = 3
        Width = 33
        Height = 16
      end
      object RLDraw10: TRLDraw
        Left = 849
        Top = 3
        Width = 166
        Height = 16
      end
      object RLDraw11: TRLDraw
        Left = 448
        Top = 3
        Width = 402
        Height = 16
      end
      object RLDraw12: TRLDraw
        Left = 304
        Top = 3
        Width = 145
        Height = 16
      end
      object RLLabel27: TRLLabel
        Left = 2
        Top = 5
        Width = 42
        Height = 12
        Caption = 'Vendedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel28: TRLLabel
        Left = 324
        Top = 5
        Width = 49
        Height = 12
        Caption = 'Vlr.Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel29: TRLLabel
        Left = 477
        Top = 5
        Width = 54
        Height = 12
        Caption = 'Vlr.Entradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel30: TRLLabel
        Left = 571
        Top = 5
        Width = 45
        Height = 12
        Caption = 'Vlr.Saidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel31: TRLLabel
        Left = 621
        Top = 5
        Width = 62
        Height = 12
        Caption = 'Vlr.Devolu'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel32: TRLLabel
        Left = 775
        Top = 5
        Width = 72
        Height = 12
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'Vlr.Total Per'#237'odo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel33: TRLLabel
        Left = 924
        Top = 5
        Width = 86
        Height = 12
        Caption = 'Vlr.Total Acumulado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel34: TRLLabel
        Left = 1019
        Top = 5
        Width = 24
        Height = 12
        Caption = '% IR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel35: TRLLabel
        Left = 398
        Top = 5
        Width = 47
        Height = 12
        Caption = 'Vlr.IR Ant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel36: TRLLabel
        Left = 695
        Top = 5
        Width = 62
        Height = 12
        Caption = 'Vlr.IR Per'#237'odo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel37: TRLLabel
        Left = 854
        Top = 5
        Width = 57
        Height = 12
        Caption = 'Vlr.IR Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
end
