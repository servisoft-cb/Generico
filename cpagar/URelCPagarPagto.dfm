object fRelCPagarPagto: TfRelCPagarPagto
  Left = 8
  Top = 95
  Width = 885
  Height = 446
  Caption = 'fRelCPagarPagto'
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
    Left = 48
    Top = 8
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 38
      Width = 718
      Height = 251
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 46
        BandType = btHeader
        BeforePrint = RLBand1BeforePrint
        object RLLabel1: TRLLabel
          Left = 104
          Top = 8
          Width = 490
          Height = 19
          Alignment = taCenter
          AutoSize = False
          Caption = 'RELAT'#211'RIO DO CONTAS A PAGAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLLabel21: TRLLabel
          Left = 633
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
          Left = 652
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
          Left = 618
          Top = 13
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
          Left = 652
          Top = 13
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
          Left = 381
          Top = 31
          Width = 40
          Height = 12
          Caption = 'Dt.Vecto'
        end
        object RLLabel3: TRLLabel
          Left = 56
          Top = 31
          Width = 50
          Height = 12
          Caption = 'Fornecedor'
        end
        object RLLabel5: TRLLabel
          Left = 655
          Top = 31
          Width = 60
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Vlr.Pago'
        end
        object RLLabel7: TRLLabel
          Left = 264
          Top = 31
          Width = 64
          Height = 12
          Caption = 'N'#186' Documento'
        end
        object RLLabel9: TRLLabel
          Left = 343
          Top = 31
          Width = 22
          Height = 12
          Caption = 'Filial'
        end
        object RLDraw1: TRLDraw
          Left = 0
          Top = 44
          Width = 718
          Height = 2
          Align = faBottom
          DrawKind = dkLine
        end
        object RLLabel13: TRLLabel
          Left = 3
          Top = 31
          Width = 37
          Height = 12
          Caption = 'Dt.Mov.'
        end
        object RLLabel6: TRLLabel
          Left = 428
          Top = 31
          Width = 39
          Height = 12
          Caption = 'Emiss'#227'o'
        end
        object RLLabel8: TRLLabel
          Left = 489
          Top = 31
          Width = 48
          Height = 12
          Caption = 'Vlr.Parcela'
        end
        object RLLabel4: TRLLabel
          Left = 541
          Top = 31
          Width = 57
          Height = 12
          Caption = 'Conta/Banco'
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 46
        Width = 718
        Height = 14
        BeforePrint = RLBand2BeforePrint
        object RLDBText1: TRLDBText
          Left = 367
          Top = 1
          Width = 54
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'DtVencCPagar'
        end
        object RLDBText2: TRLDBText
          Left = 55
          Top = 1
          Width = 193
          Height = 12
          AutoSize = False
          DataField = 'NomeForn'
        end
        object RLDBText3: TRLDBText
          Left = 341
          Top = 1
          Width = 26
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'Filial'
        end
        object RLDBText5: TRLDBText
          Left = 540
          Top = 1
          Width = 109
          Height = 12
          AutoSize = False
          DataField = 'NomeConta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel11: TRLLabel
          Left = 249
          Top = 1
          Width = 92
          Height = 12
          Alignment = taCenter
          AutoSize = False
          Caption = 'N'#186' Documento'
        end
        object RLDBText8: TRLDBText
          Left = 1
          Top = 1
          Width = 54
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'DtUltPgto'
        end
        object RLDBText4: TRLDBText
          Left = 422
          Top = 1
          Width = 54
          Height = 12
          Alignment = taCenter
          AutoSize = False
          DataField = 'DtGerado'
        end
        object RLDBText7: TRLDBText
          Left = 477
          Top = 1
          Width = 62
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrParcCPagar'
        end
        object RLLabel10: TRLLabel
          Left = 650
          Top = 1
          Width = 66
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Vlr.Pago'
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 60
        Width = 718
        Height = 17
        BandType = btSummary
        BeforePrint = RLBand3BeforePrint
        object RLLabel16: TRLLabel
          Left = 533
          Top = 2
          Width = 57
          Height = 11
          Caption = 'Saldo Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw2: TRLDraw
          Left = 0
          Top = 0
          Width = 718
          Height = 2
          Align = faTop
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLLabel12: TRLLabel
          Left = 600
          Top = 2
          Width = 116
          Height = 11
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Saldo Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
end
