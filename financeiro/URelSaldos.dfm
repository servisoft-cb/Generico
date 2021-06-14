object fRelSaldos: TfRelSaldos
  Left = 49
  Top = 107
  Width = 944
  Height = 584
  Caption = 'fRelSaldos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 56
    Top = 8
    Width = 794
    Height = 1123
    DataSource = fConsSaldos.dsmSaldoConta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 7.000000000000000000
    Margins.TopMargin = 8.000000000000000000
    Margins.RightMargin = 7.000000000000000000
    Margins.BottomMargin = 8.000000000000000000
    object RLSubDetail1: TRLSubDetail
      Left = 26
      Top = 83
      Width = 742
      Height = 467
      DataSource = fConsSaldos.dsmSaldoConta
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 742
        Height = 15
        object RLDraw5: TRLDraw
          Left = 668
          Top = 0
          Width = 74
          Height = 14
        end
        object RLDraw6: TRLDraw
          Left = 399
          Top = 0
          Width = 67
          Height = 14
        end
        object RLDraw4: TRLDraw
          Left = 465
          Top = 0
          Width = 204
          Height = 14
        end
        object RLDraw3: TRLDraw
          Left = 208
          Top = 0
          Width = 192
          Height = 14
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 0
          Width = 209
          Height = 14
        end
        object RLDBText1: TRLDBText
          Left = 0
          Top = 1
          Width = 143
          Height = 12
          AutoSize = False
          DataField = 'NomeConta'
          DataSource = fConsSaldos.dsmSaldoConta
        end
        object RLDBText2: TRLDBText
          Left = 145
          Top = 1
          Width = 62
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Saldo'
          DataSource = fConsSaldos.dsmSaldoConta
        end
        object RLDBText3: TRLDBText
          Left = 210
          Top = 1
          Width = 61
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrChequeAtrasado'
          DataSource = fConsSaldos.dsmSaldoConta
        end
        object RLDBText4: TRLDBText
          Left = 273
          Top = 1
          Width = 61
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrCReceberAtrasado'
          DataSource = fConsSaldos.dsmSaldoConta
        end
        object RLDBText5: TRLDBText
          Left = 337
          Top = 1
          Width = 61
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrCPagarAtrasado'
          DataSource = fConsSaldos.dsmSaldoConta
        end
        object RLDBText6: TRLDBText
          Left = 401
          Top = 1
          Width = 62
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'SubSaldo'
          DataSource = fConsSaldos.dsmSaldoConta
        end
        object RLDBText7: TRLDBText
          Left = 468
          Top = 1
          Width = 61
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrCheque'
          DataSource = fConsSaldos.dsmSaldoConta
        end
        object RLDBText8: TRLDBText
          Left = 537
          Top = 1
          Width = 61
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrCReceber'
          DataSource = fConsSaldos.dsmSaldoConta
        end
        object RLDBText9: TRLDBText
          Left = 605
          Top = 1
          Width = 61
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrCPagar'
          DataSource = fConsSaldos.dsmSaldoConta
        end
        object RLDBText10: TRLDBText
          Left = 671
          Top = 1
          Width = 68
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'SaldoGeral'
          DataSource = fConsSaldos.dsmSaldoConta
        end
      end
      object RLSubDetail2: TRLSubDetail
        Left = 0
        Top = 15
        Width = 742
        Height = 74
        DataSource = fConsSaldos.dsmSaldoPorData
        object RLBand3: TRLBand
          Left = 0
          Top = 0
          Width = 742
          Height = 20
          BandType = btHeader
          BeforePrint = RLBand3BeforePrint
          object RLLabel18: TRLLabel
            Left = 352
            Top = 6
            Width = 23
            Height = 12
            Caption = 'Data'
          end
          object RLLabel19: TRLLabel
            Left = 416
            Top = 6
            Width = 53
            Height = 12
            Caption = 'Saldo Inicial'
          end
          object RLLabel20: TRLLabel
            Left = 488
            Top = 6
            Width = 40
            Height = 12
            Caption = 'Cheques'
          end
          object RLLabel23: TRLLabel
            Left = 551
            Top = 6
            Width = 47
            Height = 12
            Caption = 'A Receber'
          end
          object RLLabel24: TRLLabel
            Left = 629
            Top = 6
            Width = 36
            Height = 12
            Caption = 'A Pagar'
          end
          object RLLabel25: TRLLabel
            Left = 714
            Top = 6
            Width = 26
            Height = 12
            Caption = 'Saldo'
          end
        end
        object RLBand4: TRLBand
          Left = 0
          Top = 20
          Width = 742
          Height = 15
          BeforePrint = RLBand4BeforePrint
          object RLDBText11: TRLDBText
            Left = 328
            Top = 1
            Width = 73
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'Data'
            DataSource = fConsSaldos.dsmSaldoPorData
          end
          object RLDBText12: TRLDBText
            Left = 408
            Top = 1
            Width = 58
            Height = 12
            Alignment = taRightJustify
            DataField = 'Saldo'
            DataSource = fConsSaldos.dsmSaldoPorData
          end
          object RLDBText13: TRLDBText
            Left = 467
            Top = 1
            Width = 62
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrChequePagar'
            DataSource = fConsSaldos.dsmSaldoPorData
          end
          object RLDBText14: TRLDBText
            Left = 533
            Top = 1
            Width = 65
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrContasReceber'
            DataSource = fConsSaldos.dsmSaldoPorData
          end
          object RLDBText15: TRLDBText
            Left = 601
            Top = 1
            Width = 64
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VlrContasPagar'
            DataSource = fConsSaldos.dsmSaldoPorData
          end
          object RLDBText16: TRLDBText
            Left = 668
            Top = 1
            Width = 71
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'SaldoGeral'
            DataSource = fConsSaldos.dsmSaldoPorData
          end
          object RLDraw7: TRLDraw
            Left = 328
            Top = 0
            Width = 412
            Height = 2
            DrawKind = dkLine
            Pen.Style = psDot
          end
        end
      end
    end
    object RLBand1: TRLBand
      Left = 26
      Top = 30
      Width = 742
      Height = 53
      BandType = btHeader
      BeforePrint = RLBand1BeforePrint
      object RLLabel1: TRLLabel
        Left = 128
        Top = 5
        Width = 457
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Fluxo Por Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 5
        Top = 39
        Width = 28
        Height = 12
        Caption = 'Conta'
      end
      object RLLabel3: TRLLabel
        Left = 172
        Top = 40
        Width = 29
        Height = 11
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 224
        Top = 25
        Width = 43
        Height = 12
        Caption = 'Cheques '
      end
      object RLLabel5: TRLLabel
        Left = 224
        Top = 39
        Width = 46
        Height = 12
        Caption = 'em Atraso'
      end
      object RLLabel6: TRLLabel
        Left = 288
        Top = 25
        Width = 47
        Height = 12
        Caption = 'A Receber'
      end
      object RLLabel7: TRLLabel
        Left = 288
        Top = 39
        Width = 46
        Height = 12
        Caption = 'em Atraso'
      end
      object RLLabel8: TRLLabel
        Left = 357
        Top = 25
        Width = 36
        Height = 12
        Caption = 'A Pagar'
      end
      object RLLabel9: TRLLabel
        Left = 352
        Top = 39
        Width = 46
        Height = 12
        Caption = 'em Atraso'
      end
      object RLLabel10: TRLLabel
        Left = 411
        Top = 40
        Width = 50
        Height = 11
        Caption = 'Sub Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 483
        Top = 25
        Width = 43
        Height = 12
        Caption = 'Cheques '
      end
      object RLLabel12: TRLLabel
        Left = 480
        Top = 39
        Width = 50
        Height = 12
        Caption = 'No Per'#237'odo'
      end
      object RLLabel13: TRLLabel
        Left = 548
        Top = 25
        Width = 47
        Height = 12
        Caption = 'A Receber'
      end
      object RLLabel14: TRLLabel
        Left = 548
        Top = 39
        Width = 50
        Height = 12
        Caption = 'No Per'#237'odo'
      end
      object RLLabel15: TRLLabel
        Left = 620
        Top = 25
        Width = 36
        Height = 12
        Caption = 'A Pagar'
      end
      object RLLabel16: TRLLabel
        Left = 615
        Top = 39
        Width = 50
        Height = 12
        Caption = 'No Per'#237'odo'
      end
      object RLLabel17: TRLLabel
        Left = 682
        Top = 40
        Width = 56
        Height = 11
        Caption = 'Saldo Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
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
    end
  end
end
