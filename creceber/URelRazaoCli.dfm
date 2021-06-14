object fRelRazaoCli: TfRelRazaoCli
  Left = 45
  Top = 68
  Width = 800
  Height = 486
  HorzScrollBar.Position = 26
  Caption = 'fRelRazaoCli'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = -2
    Top = 16
    Width = 794
    Height = 1123
    DataSource = fConsRazaoCli.dsmRazao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ShowProgress = False
    AfterPrint = RLReport1AfterPrint
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 100
      Width = 718
      Height = 395
      DataSource = fConsRazaoCli.dsmRazao
      object RLGroup1: TRLGroup
        Left = 0
        Top = 0
        Width = 718
        Height = 177
        DataFields = 'NomeCli;CodCli'
        object RLBand3: TRLBand
          Left = 0
          Top = 88
          Width = 718
          Height = 17
          BandType = btSummary
          BeforePrint = RLBand3BeforePrint
          object RLDBResult1: TRLDBResult
            Left = 480
            Top = 2
            Width = 73
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'Debito'
            DataSource = fConsRazaoCli.dsmRazao
            DisplayMask = '###,###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Info = riSum
            ParentFont = False
            ResetAfterPrint = True
          end
          object RLDBResult2: TRLDBResult
            Left = 555
            Top = 2
            Width = 74
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'Credito'
            DataSource = fConsRazaoCli.dsmRazao
            DisplayMask = '###,###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Info = riSum
            ParentFont = False
            ResetAfterPrint = True
          end
          object RLLabel11: TRLLabel
            Left = 405
            Top = 2
            Width = 71
            Height = 12
            Alignment = taRightJustify
            Caption = 'Total do Cliente:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDraw2: TRLDraw
            Left = 490
            Top = 0
            Width = 227
            Height = 2
            DrawKind = dkLine
            Pen.Style = psDot
          end
          object RLLabel12: TRLLabel
            Left = 645
            Top = 2
            Width = 71
            Height = 12
            Alignment = taRightJustify
            Caption = 'Total do Cliente:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
        object RLBand4: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 20
          BandType = btTitle
          BeforePrint = RLBand4BeforePrint
          object RLLabel14: TRLLabel
            Left = 40
            Top = 3
            Width = 45
            Height = 15
            Caption = 'Cliente:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBText8: TRLDBText
            Left = 138
            Top = 4
            Width = 375
            Height = 14
            AutoSize = False
            DataField = 'NomeCli'
            DataSource = fConsRazaoCli.dsmRazao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel5: TRLLabel
            Left = 520
            Top = 4
            Width = 71
            Height = 11
            Caption = 'Saldo Anterior:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel6: TRLLabel
            Left = 645
            Top = 3
            Width = 71
            Height = 11
            Alignment = taRightJustify
            Caption = 'Saldo Anterior:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBText9: TRLDBText
            Left = 87
            Top = 4
            Width = 45
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'CodCli'
            DataSource = fConsRazaoCli.dsmRazao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLGroup2: TRLGroup
          Left = 0
          Top = 20
          Width = 718
          Height = 68
          DataFields = 'Ano;Mes;NomeCli;CodCli'
          object RLBand5: TRLBand
            Left = 0
            Top = 0
            Width = 718
            Height = 20
            BandType = btHeader
            BeforePrint = RLBand5BeforePrint
            object RLLabel7: TRLLabel
              Left = 64
              Top = 2
              Width = 55
              Height = 15
              Caption = 'Mes/Ano:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBText2: TRLDBText
              Left = 122
              Top = 2
              Width = 35
              Height = 15
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'Mes'
              DataSource = fConsRazaoCli.dsmRazao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLLabel15: TRLLabel
              Left = 158
              Top = 2
              Width = 6
              Height = 15
              Caption = '/'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBText4: TRLDBText
              Left = 165
              Top = 2
              Width = 47
              Height = 15
              AutoSize = False
              DataField = 'Ano'
              DataSource = fConsRazaoCli.dsmRazao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object RLBand1: TRLBand
            Left = 0
            Top = 20
            Width = 718
            Height = 16
            BeforePrint = RLBand1BeforePrint
            object RLDBText1: TRLDBText
              Left = 1
              Top = 2
              Width = 54
              Height = 12
              Alignment = taCenter
              AutoSize = False
              DataField = 'Data'
              DataSource = fConsRazaoCli.dsmRazao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText5: TRLDBText
              Left = 58
              Top = 2
              Width = 412
              Height = 12
              AutoSize = False
              DataField = 'Historico'
              DataSource = fConsRazaoCli.dsmRazao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText6: TRLDBText
              Left = 480
              Top = 2
              Width = 74
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'Debito'
              DataSource = fConsRazaoCli.dsmRazao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText7: TRLDBText
              Left = 555
              Top = 2
              Width = 74
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'Credito'
              DataSource = fConsRazaoCli.dsmRazao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText3: TRLDBText
              Left = 642
              Top = 2
              Width = 74
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'Saldo'
              DataSource = fConsRazaoCli.dsmRazao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
          end
          object RLBand6: TRLBand
            Left = 0
            Top = 36
            Width = 718
            Height = 16
            BandType = btSummary
            BeforePrint = RLBand6BeforePrint
            object RLDBResult3: TRLDBResult
              Left = 480
              Top = 2
              Width = 73
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'Debito'
              DataSource = fConsRazaoCli.dsmRazao
              DisplayMask = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              Info = riSum
              ParentFont = False
              ResetAfterPrint = True
            end
            object RLDBResult4: TRLDBResult
              Left = 555
              Top = 2
              Width = 74
              Height = 12
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'Credito'
              DataSource = fConsRazaoCli.dsmRazao
              DisplayMask = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              Info = riSum
              ParentFont = False
              ResetAfterPrint = True
            end
            object RLLabel10: TRLLabel
              Left = 417
              Top = 2
              Width = 59
              Height = 12
              Alignment = taRightJustify
              Caption = 'Total do Mes:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDraw3: TRLDraw
              Left = 402
              Top = 0
              Width = 315
              Height = 2
              DrawKind = dkLine
              Pen.Style = psDot
            end
          end
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 177
        Width = 718
        Height = 29
        BandType = btSummary
        BeforePrint = RLBand7BeforePrint
        object RLDBResult5: TRLDBResult
          Left = 480
          Top = 13
          Width = 73
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Debito'
          DataSource = fConsRazaoCli.dsmRazao
          DisplayMask = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Info = riSum
          ParentFont = False
          ResetAfterPrint = True
        end
        object RLDBResult6: TRLDBResult
          Left = 555
          Top = 13
          Width = 74
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Credito'
          DataSource = fConsRazaoCli.dsmRazao
          DisplayMask = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Info = riSum
          ParentFont = False
          ResetAfterPrint = True
        end
        object RLLabel13: TRLLabel
          Left = 425
          Top = 13
          Width = 51
          Height = 12
          Alignment = taRightJustify
          Caption = 'Total Geral:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDraw4: TRLDraw
          Left = 490
          Top = 0
          Width = 227
          Height = 2
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLLabel16: TRLLabel
          Left = 645
          Top = 13
          Width = 71
          Height = 12
          Alignment = taRightJustify
          Caption = 'Total do Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel17: TRLLabel
          Left = 389
          Top = 1
          Width = 87
          Height = 12
          Alignment = taRightJustify
          Caption = 'Total Saldo Anterior:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel18: TRLLabel
          Left = 645
          Top = 1
          Width = 71
          Height = 12
          Alignment = taRightJustify
          Caption = 'Total do Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 62
      BandType = btHeader
      BeforePrint = RLBand2BeforePrint
      object RLLabel1: TRLLabel
        Left = 88
        Top = 25
        Width = 418
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Raz'#227'o de Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 625
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
        Left = 649
        Top = 2
        Width = 32
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
        Left = 605
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
        Left = 649
        Top = 15
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
      object RLLabel2: TRLLabel
        Left = 8
        Top = 47
        Width = 23
        Height = 12
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 64
        Top = 47
        Width = 40
        Height = 12
        Caption = 'Hist'#243'rico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 528
        Top = 47
        Width = 30
        Height = 12
        Caption = 'D'#233'bito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 618
        Top = 47
        Width = 33
        Height = 12
        Caption = 'Cr'#233'dito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 60
        Width = 718
        Height = 2
        DrawKind = dkLine
        Pen.Style = psDot
      end
      object RLLabel3: TRLLabel
        Left = 690
        Top = 47
        Width = 26
        Height = 12
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel19: TRLLabel
        Left = 2
        Top = 2
        Width = 503
        Height = 16
        AutoSize = False
        Caption = 'Raz'#227'o de Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
end