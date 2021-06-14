object fRelCopiaDupl: TfRelCopiaDupl
  Left = 8
  Top = 60
  Width = 793
  Height = 464
  HorzScrollBar.Position = 20
  VertScrollBar.Position = 6
  Caption = 'fRelCopiaDupl'
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
    Left = -12
    Top = 2
    Width = 794
    Height = 1123
    DataSource = fConsCReceber.dsqConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ShowProgress = False
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 38
      Width = 718
      Height = 579
      DataSource = fConsCReceber.dsqConsulta
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 321
        BeforePrint = RLBand1BeforePrint
        object RLDraw4: TRLDraw
          Left = 0
          Top = 0
          Width = 718
          Height = 321
          Align = faClient
        end
        object RLLabel1: TRLLabel
          Left = 16
          Top = 5
          Width = 122
          Height = 16
          Caption = 'Duplicata         N'#186': '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 140
          Top = 5
          Width = 122
          Height = 16
          Caption = 'Duplicata         N'#186': '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 560
          Top = 5
          Width = 122
          Height = 16
          Caption = 'Duplicata         N'#186': '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDraw1: TRLDraw
          Left = 0
          Top = 55
          Width = 717
          Height = 2
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLLabel4: TRLLabel
          Left = 4
          Top = 68
          Width = 45
          Height = 14
          Caption = 'Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 51
          Top = 68
          Width = 41
          Height = 14
          AutoSize = False
          DataField = 'CodCli'
          DataSource = fConsCReceber.dsqConsulta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 94
          Top = 68
          Width = 409
          Height = 14
          AutoSize = False
          DataField = 'NomeCliente'
          DataSource = fConsCReceber.dsqConsulta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 600
          Top = 68
          Width = 113
          Height = 14
          AutoSize = False
          DataField = 'CgcCpf'
          DataSource = fConsCReceber.dsqConsulta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 553
          Top = 68
          Width = 45
          Height = 14
          Alignment = taRightJustify
          Caption = 'Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 40
          Top = 87
          Width = 52
          Height = 14
          Caption = 'Endere'#231'o:'
        end
        object RLDBText4: TRLDBText
          Left = 94
          Top = 87
          Width = 459
          Height = 14
          AutoSize = False
          DataField = 'Endereco'
          DataSource = fConsCReceber.dsqConsulta
        end
        object RLLabel7: TRLLabel
          Left = 67
          Top = 102
          Width = 25
          Height = 14
          Caption = 'CEP:'
        end
        object RLDBText5: TRLDBText
          Left = 94
          Top = 102
          Width = 113
          Height = 14
          AutoSize = False
          DataField = 'Cep'
          DataSource = fConsCReceber.dsqConsulta
        end
        object RLLabel8: TRLLabel
          Left = 57
          Top = 117
          Width = 35
          Height = 14
          Caption = 'Bairro:'
        end
        object RLDBText6: TRLDBText
          Left = 94
          Top = 117
          Width = 211
          Height = 14
          AutoSize = False
          DataField = 'Bairro'
          DataSource = fConsCReceber.dsqConsulta
        end
        object RLLabel9: TRLLabel
          Left = 313
          Top = 117
          Width = 39
          Height = 14
          Caption = 'Cidade:'
        end
        object RLLabel10: TRLLabel
          Left = 353
          Top = 117
          Width = 39
          Height = 14
          Caption = 'Cidade:'
        end
        object RLLabel11: TRLLabel
          Left = 579
          Top = 117
          Width = 19
          Height = 14
          Caption = 'UF:'
        end
        object RLDBText7: TRLDBText
          Left = 600
          Top = 117
          Width = 113
          Height = 14
          AutoSize = False
          DataField = 'Uf'
          DataSource = fConsCReceber.dsqConsulta
        end
        object RLLabel12: TRLLabel
          Left = 14
          Top = 142
          Width = 48
          Height = 14
          Caption = 'Empresa:'
        end
        object RLLabel13: TRLLabel
          Left = 64
          Top = 142
          Width = 48
          Height = 14
          Caption = 'Empresa:'
        end
        object RLLabel14: TRLLabel
          Left = 8
          Top = 157
          Width = 54
          Height = 14
          Caption = 'Vendedor:'
        end
        object RLDBText8: TRLDBText
          Left = 64
          Top = 157
          Width = 161
          Height = 14
          AutoSize = False
          DataField = 'NomeVendedor'
          DataSource = fConsCReceber.dsqConsulta
        end
        object RLDraw2: TRLDraw
          Left = 1
          Top = 177
          Width = 717
          Height = 2
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLLabel15: TRLLabel
          Left = 4
          Top = 182
          Width = 87
          Height = 14
          Caption = 'Dt.Vencimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText9: TRLDBText
          Left = 93
          Top = 182
          Width = 121
          Height = 14
          AutoSize = False
          DataField = 'DtVencCReceber'
          DataSource = fConsCReceber.dsqConsulta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel16: TRLLabel
          Left = 32
          Top = 203
          Width = 59
          Height = 14
          Caption = 'Dt.Emiss'#227'o:'
        end
        object RLDBText10: TRLDBText
          Left = 93
          Top = 203
          Width = 121
          Height = 14
          AutoSize = False
          DataField = 'DtGerado'
          DataSource = fConsCReceber.dsqConsulta
        end
        object RLLabel17: TRLLabel
          Left = 22
          Top = 219
          Width = 69
          Height = 14
          Caption = 'Vlr.Desconto:'
        end
        object RLDBText11: TRLDBText
          Left = 93
          Top = 219
          Width = 121
          Height = 14
          AutoSize = False
          DataField = 'Desconto'
          DataSource = fConsCReceber.dsqConsulta
        end
        object RLLabel18: TRLLabel
          Left = 336
          Top = 182
          Width = 36
          Height = 14
          Caption = 'Saldo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText12: TRLDBText
          Left = 374
          Top = 182
          Width = 121
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'RestParcela'
          DataSource = fConsCReceber.dsqConsulta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText13: TRLDBText
          Left = 374
          Top = 203
          Width = 121
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VlrParcCReceber'
          DataSource = fConsCReceber.dsqConsulta
        end
        object RLLabel19: TRLLabel
          Left = 340
          Top = 203
          Width = 32
          Height = 14
          Caption = 'Valor:'
        end
        object RLDraw3: TRLDraw
          Left = 1
          Top = 256
          Width = 717
          Height = 2
          DrawKind = dkLine
          Pen.Style = psDot
        end
        object RLLabel20: TRLLabel
          Left = 54
          Top = 260
          Width = 37
          Height = 14
          Caption = 'Banco:'
        end
        object RLDBText14: TRLDBText
          Left = 93
          Top = 260
          Width = 324
          Height = 14
          AutoSize = False
          DataField = 'NomeBancoBoleto'
          DataSource = fConsCReceber.dsqConsulta
        end
        object RLLabel21: TRLLabel
          Left = 57
          Top = 274
          Width = 34
          Height = 14
          Caption = 'Conta:'
        end
        object RLDBText15: TRLDBText
          Left = 93
          Top = 274
          Width = 324
          Height = 14
          AutoSize = False
          DataField = 'NomeConta'
          DataSource = fConsCReceber.dsqConsulta
        end
        object RLLabel22: TRLLabel
          Left = 15
          Top = 288
          Width = 76
          Height = 14
          Caption = 'Tipo Cobran'#231'a:'
        end
        object RLDBText16: TRLDBText
          Left = 93
          Top = 288
          Width = 324
          Height = 14
          AutoSize = False
          DataField = 'NomeCobranca'
          DataSource = fConsCReceber.dsqConsulta
        end
        object RLLabel23: TRLLabel
          Left = 65
          Top = 29
          Width = 73
          Height = 15
          Caption = 'N'#186' no banco:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText17: TRLDBText
          Left = 140
          Top = 30
          Width = 161
          Height = 14
          AutoSize = False
          DataField = 'NumTitBanco'
          DataSource = fConsCReceber.dsqConsulta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel24: TRLLabel
          Left = 230
          Top = 219
          Width = 49
          Height = 14
          Caption = 'Despesa:'
        end
        object RLDBText18: TRLDBText
          Left = 281
          Top = 219
          Width = 88
          Height = 14
          AutoSize = False
          DataField = 'Despesas'
          DataSource = fConsCReceber.dsqConsulta
        end
        object RLLabel36: TRLLabel
          Left = 583
          Top = 87
          Width = 15
          Height = 14
          Caption = 'N'#186
        end
        object RLDBText21: TRLDBText
          Left = 600
          Top = 87
          Width = 113
          Height = 14
          AutoSize = False
          DataField = 'NumEnd'
          DataSource = fConsCReceber.dsqConsulta
        end
      end
      object RLSubDetail2: TRLSubDetail
        Left = 0
        Top = 321
        Width = 718
        Height = 64
        DataSource = fConsCReceber.dsCReceberParcHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 15
          BandType = btHeader
          BeforePrint = RLBand2BeforePrint
          object RLLabel25: TRLLabel
            Left = 5
            Top = 0
            Width = 20
            Height = 12
            Caption = 'Tipo'
          end
          object RLLabel26: TRLLabel
            Left = 88
            Top = 0
            Width = 28
            Height = 12
            Caption = 'Conta'
          end
          object RLLabel27: TRLLabel
            Left = 224
            Top = 0
            Width = 62
            Height = 12
            Caption = 'Dt.Movimento'
          end
          object RLLabel28: TRLLabel
            Left = 325
            Top = 0
            Width = 24
            Height = 12
            Caption = 'Valor'
          end
          object RLDraw5: TRLDraw
            Left = 0
            Top = 13
            Width = 718
            Height = 2
            Align = faBottom
            DrawKind = dkLine
            Pen.Style = psDot
          end
          object RLLabel29: TRLLabel
            Left = 365
            Top = 0
            Width = 20
            Height = 12
            Caption = 'Tipo'
          end
          object RLLabel30: TRLLabel
            Left = 448
            Top = 0
            Width = 28
            Height = 12
            Caption = 'Conta'
          end
          object RLLabel31: TRLLabel
            Left = 584
            Top = 0
            Width = 62
            Height = 12
            Caption = 'Dt.Movimento'
          end
          object RLLabel32: TRLLabel
            Left = 685
            Top = 0
            Width = 24
            Height = 12
            Caption = 'Valor'
          end
        end
        object RLDetailGrid1: TRLDetailGrid
          Left = 0
          Top = 15
          Width = 718
          Height = 14
          ColCount = 2
          BeforePrint = RLDetailGrid1BeforePrint
          object RLLabel33: TRLLabel
            Left = 4
            Top = 0
            Width = 81
            Height = 12
            AutoSize = False
            Caption = 'Tipo'
          end
          object RLDBText19: TRLDBText
            Left = 87
            Top = 0
            Width = 29
            Height = 12
            AutoSize = False
            DataField = 'CodConta'
            DataSource = fConsCReceber.dsCReceberParcHist
          end
          object RLLabel34: TRLLabel
            Left = 117
            Top = 0
            Width = 103
            Height = 12
            AutoSize = False
            Caption = 'Tipo'
          end
          object RLDBText20: TRLDBText
            Left = 224
            Top = 0
            Width = 64
            Height = 12
            Alignment = taCenter
            AutoSize = False
            DataField = 'DtUltPgto'
            DataSource = fConsCReceber.dsCReceberParcHist
          end
          object RLLabel35: TRLLabel
            Left = 291
            Top = 0
            Width = 60
            Height = 12
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Tipo'
          end
          object RLDraw6: TRLDraw
            Left = 355
            Top = 0
            Width = 4
            Height = 14
            Align = faRight
            Brush.Color = clBlack
            Color = clBlack
            ParentColor = False
            Transparent = False
          end
        end
        object RLBand3: TRLBand
          Left = 0
          Top = 29
          Width = 718
          Height = 12
          BandType = btFooter
          object RLDraw7: TRLDraw
            Left = 1
            Top = 4
            Width = 717
            Height = 5
            Pen.Style = psDot
          end
        end
      end
    end
  end
end
