object fAgendaTelef: TfAgendaTelef
  Left = 127
  Top = 108
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Agenda Telef'#244'nica'
  ClientHeight = 563
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 563
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 780
      Height = 561
      ActivePage = TabSheet5
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 772
          Height = 533
          Align = alClient
          BevelOuter = bvLowered
          Color = clInactiveBorder
          TabOrder = 0
          object SpeedButton1: TSpeedButton
            Left = 573
            Top = 4
            Width = 84
            Height = 25
            Hint = 'Abre o cadastro de Clientes'
            Caption = 'Clientes'
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000C40E0000C40E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
              000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
              00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
              8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
              8888880BB088888888888800008888888888}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton1Click
          end
          object Bevel1: TBevel
            Left = 0
            Top = 32
            Width = 777
            Height = 2
            Style = bsRaised
          end
          object Label2: TLabel
            Left = 66
            Top = 40
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object DBText1: TDBText
            Left = 108
            Top = 40
            Width = 432
            Height = 13
            Color = clBtnFace
            DataField = 'Nome'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label3: TLabel
            Left = 556
            Top = 40
            Width = 44
            Height = 13
            Caption = 'C'#243'digo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText2: TDBText
            Left = 604
            Top = 40
            Width = 68
            Height = 13
            DataField = 'Codigo'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 48
            Top = 85
            Width = 55
            Height = 13
            Caption = 'Telefone:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText3: TDBText
            Left = 156
            Top = 85
            Width = 101
            Height = 13
            DataField = 'Telefone'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 324
            Top = 85
            Width = 66
            Height = 13
            Caption = 'Telefone 2:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText4: TDBText
            Left = 438
            Top = 85
            Width = 121
            Height = 13
            DataField = 'Telefone2'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 575
            Top = 85
            Width = 25
            Height = 13
            Caption = 'Fax:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText5: TDBText
            Left = 645
            Top = 85
            Width = 121
            Height = 13
            DataField = 'Fax'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 14
            Top = 62
            Width = 89
            Height = 13
            Caption = 'Nome Fantasia:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText6: TDBText
            Left = 108
            Top = 62
            Width = 230
            Height = 13
            Color = clBtnFace
            DataField = 'Fantasia'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label8: TLabel
            Left = 341
            Top = 62
            Width = 49
            Height = 13
            Caption = 'Contato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText7: TDBText
            Left = 394
            Top = 62
            Width = 224
            Height = 13
            DataField = 'Contato'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText32: TDBText
            Left = 108
            Top = 85
            Width = 37
            Height = 13
            Alignment = taCenter
            DataField = 'DDDFone1'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText34: TDBText
            Left = 394
            Top = 85
            Width = 37
            Height = 13
            Alignment = taCenter
            DataField = 'DDDFone2'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText35: TDBText
            Left = 604
            Top = 85
            Width = 37
            Height = 13
            Alignment = taCenter
            DataField = 'DDDFax'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label37: TLabel
            Left = 67
            Top = 102
            Width = 36
            Height = 13
            Caption = 'CNPJ:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText36: TDBText
            Left = 108
            Top = 101
            Width = 135
            Height = 13
            DataField = 'CgcCpf'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label39: TLabel
            Left = 72
            Top = 122
            Width = 31
            Height = 13
            Caption = 'End.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText37: TDBText
            Left = 108
            Top = 121
            Width = 509
            Height = 13
            DataField = 'Endereco'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label40: TLabel
            Left = 59
            Top = 138
            Width = 44
            Height = 13
            Caption = 'Cidade:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText38: TDBText
            Left = 108
            Top = 138
            Width = 221
            Height = 13
            DataField = 'NomeCidade'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText39: TDBText
            Left = 394
            Top = 138
            Width = 29
            Height = 13
            DataField = 'Uf'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label41: TLabel
            Left = 369
            Top = 138
            Width = 21
            Height = 13
            Caption = 'UF:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label42: TLabel
            Left = 304
            Top = 102
            Width = 86
            Height = 13
            Caption = 'Insc. Estadual:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText40: TDBText
            Left = 394
            Top = 101
            Width = 135
            Height = 13
            DataField = 'InscrEst'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 65
            Top = 154
            Width = 38
            Height = 13
            Caption = 'Bairro:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText41: TDBText
            Left = 108
            Top = 154
            Width = 221
            Height = 13
            DataField = 'Bairro'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label43: TLabel
            Left = 361
            Top = 154
            Width = 29
            Height = 13
            Caption = 'CEP:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText42: TDBText
            Left = 394
            Top = 154
            Width = 77
            Height = 13
            DataField = 'Cep'
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SMDBGrid1: TSMDBGrid
            Left = 1
            Top = 176
            Width = 770
            Height = 356
            Align = alBottom
            DataSource = qsCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Flat = False
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'MS Sans Serif'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clWindow
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 11
            DefaultRowHeight = 17
            ScrollBars = ssHorizontal
            ColCount = 18
            RowCount = 2
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Codigo'
                Title.Alignment = taCenter
                Title.Caption = 'C'#243'digo'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Nome'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Fantasia'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'DDDFone1'
                Title.Alignment = taCenter
                Title.Caption = 'DDD'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Telefone'
                Title.Alignment = taCenter
                Title.Caption = 'Fone'
                Width = 92
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'DDDFone2'
                Title.Alignment = taCenter
                Title.Caption = 'DDD'
                Width = 28
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Telefone2'
                Title.Alignment = taCenter
                Title.Caption = 'Fone'
                Width = 90
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'DDDFax'
                Title.Alignment = taCenter
                Title.Caption = 'DDD'
                Width = 32
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Fax'
                Title.Alignment = taCenter
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Contato'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Bairro'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Endereco'
                Title.Alignment = taCenter
                Title.Caption = 'Endere'#231'o'
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Uf'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Cep'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CgcCpf'
                Title.Alignment = taCenter
                Title.Caption = 'CNPJ/CPF'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'InscrEst'
                Title.Alignment = taCenter
                Title.Caption = 'Inscr. Estadual'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeCidade'
                Title.Alignment = taCenter
                Title.Caption = 'Cidade'
                Visible = True
              end>
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Fornecedores'
        ImageIndex = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 772
          Height = 533
          Align = alClient
          BevelOuter = bvLowered
          Color = clInactiveBorder
          TabOrder = 0
          object Label10: TLabel
            Left = 52
            Top = 17
            Width = 106
            Height = 13
            Caption = 'Procurar p/ Nome:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton2: TSpeedButton
            Left = 549
            Top = 4
            Width = 116
            Height = 25
            Hint = 'Abre o cadastro de Fornecedores'
            Caption = 'Fornecedores'
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000C40E0000C40E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
              000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
              00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
              8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
              8888880BB088888888888800008888888888}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton2Click
          end
          object Bevel2: TBevel
            Left = 0
            Top = 40
            Width = 770
            Height = 2
            Style = bsRaised
          end
          object Label11: TLabel
            Left = 62
            Top = 43
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object DBText9: TDBText
            Left = 101
            Top = 43
            Width = 432
            Height = 13
            Color = clBtnFace
            DataField = 'NomeForn'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label12: TLabel
            Left = 571
            Top = 43
            Width = 44
            Height = 13
            Caption = 'C'#243'digo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText10: TDBText
            Left = 619
            Top = 43
            Width = 68
            Height = 13
            DataField = 'CodForn'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 44
            Top = 77
            Width = 55
            Height = 13
            Caption = 'Telefone:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText11: TDBText
            Left = 101
            Top = 77
            Width = 121
            Height = 13
            DataField = 'Tel1Forn'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 324
            Top = 77
            Width = 66
            Height = 13
            Caption = 'Telefone 2:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText12: TDBText
            Left = 394
            Top = 77
            Width = 133
            Height = 13
            DataField = 'Tel2Forn'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 590
            Top = 77
            Width = 25
            Height = 13
            Caption = 'Fax:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText13: TDBText
            Left = 619
            Top = 77
            Width = 121
            Height = 13
            DataField = 'FaxForn'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 10
            Top = 59
            Width = 89
            Height = 13
            Caption = 'Nome Fantasia:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText14: TDBText
            Left = 101
            Top = 59
            Width = 228
            Height = 13
            Color = clBtnFace
            DataField = 'Fantasia'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label20: TLabel
            Left = 341
            Top = 59
            Width = 49
            Height = 13
            Caption = 'Contato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText18: TDBText
            Left = 394
            Top = 59
            Width = 343
            Height = 13
            DataField = 'ContatoForn'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label28: TLabel
            Left = 60
            Top = 96
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'E-mail:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText24: TDBText
            Left = 101
            Top = 96
            Width = 421
            Height = 13
            DataField = 'Email'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label44: TLabel
            Left = 34
            Top = 113
            Width = 65
            Height = 13
            Caption = 'CNPJ/CPF:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText43: TDBText
            Left = 100
            Top = 112
            Width = 135
            Height = 13
            DataField = 'CGC'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label45: TLabel
            Left = 66
            Top = 129
            Width = 31
            Height = 13
            Caption = 'End.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText44: TDBText
            Left = 100
            Top = 128
            Width = 509
            Height = 13
            DataField = 'EndForn'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label46: TLabel
            Left = 53
            Top = 145
            Width = 44
            Height = 13
            Caption = 'Cidade:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText45: TDBText
            Left = 100
            Top = 145
            Width = 221
            Height = 13
            DataField = 'NomeCidade'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText46: TDBText
            Left = 420
            Top = 145
            Width = 29
            Height = 13
            DataField = 'EstadoForn'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label47: TLabel
            Left = 397
            Top = 145
            Width = 21
            Height = 13
            Caption = 'UF:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label49: TLabel
            Left = 59
            Top = 161
            Width = 38
            Height = 13
            Caption = 'Bairro:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText48: TDBText
            Left = 100
            Top = 161
            Width = 221
            Height = 13
            DataField = 'BairroForn'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label50: TLabel
            Left = 389
            Top = 161
            Width = 29
            Height = 13
            Caption = 'CEP:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText49: TDBText
            Left = 420
            Top = 161
            Width = 77
            Height = 13
            DataField = 'CEPForn'
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SMDBGrid2: TSMDBGrid
            Left = 1
            Top = 179
            Width = 770
            Height = 353
            Align = alBottom
            DataSource = qsFornecedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Flat = False
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'MS Sans Serif'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clWindow
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 11
            DefaultRowHeight = 17
            ScrollBars = ssHorizontal
            ColCount = 15
            RowCount = 2
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CodForn'
                Title.Alignment = taCenter
                Title.Caption = 'C'#243'digo'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeForn'
                Title.Alignment = taCenter
                Title.Caption = 'Fornecedor'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Fantasia'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Tel1Forn'
                Title.Alignment = taCenter
                Title.Caption = 'Fone 1'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Tel2Forn'
                Title.Alignment = taCenter
                Title.Caption = 'Fone 2'
                Width = 92
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FaxForn'
                Title.Alignment = taCenter
                Title.Caption = 'Fax'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ContatoForn'
                Title.Alignment = taCenter
                Title.Caption = 'Contato'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BairroForn'
                Title.Alignment = taCenter
                Title.Caption = 'Bairro'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EndForn'
                Title.Alignment = taCenter
                Title.Caption = 'Endere'#231'o'
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'EstadoForn'
                Title.Alignment = taCenter
                Title.Caption = 'Estado'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CEPForn'
                Title.Alignment = taCenter
                Title.Caption = 'Cep'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CGC'
                Title.Alignment = taCenter
                Title.Caption = 'CNPJ/CPF'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Insc'
                Title.Alignment = taCenter
                Title.Caption = 'Inscr. Estadual'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeCidade'
                Title.Alignment = taCenter
                Title.Caption = 'Cidade'
                Visible = True
              end>
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Transportadoras'
        ImageIndex = 2
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 772
          Height = 533
          Align = alClient
          BevelOuter = bvLowered
          Color = clInactiveBorder
          TabOrder = 0
          object SpeedButton3: TSpeedButton
            Left = 525
            Top = 5
            Width = 132
            Height = 25
            Hint = 'Abre o cadastro de Transportadoras'
            Caption = 'Transportadora'
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000C40E0000C40E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
              000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
              00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
              8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
              8888880BB088888888888800008888888888}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton3Click
          end
          object Bevel3: TBevel
            Left = 0
            Top = 35
            Width = 770
            Height = 2
            Style = bsRaised
          end
          object Label22: TLabel
            Left = 47
            Top = 44
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object DBText19: TDBText
            Left = 86
            Top = 44
            Width = 432
            Height = 13
            Color = clBtnFace
            DataField = 'Nome'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label23: TLabel
            Left = 613
            Top = 44
            Width = 44
            Height = 13
            Caption = 'C'#243'digo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText20: TDBText
            Left = 661
            Top = 44
            Width = 68
            Height = 13
            DataField = 'Codigo'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 29
            Top = 76
            Width = 55
            Height = 13
            Caption = 'Telefone:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText21: TDBText
            Left = 86
            Top = 76
            Width = 121
            Height = 13
            DataField = 'Fone'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label25: TLabel
            Left = 288
            Top = 76
            Width = 25
            Height = 13
            Caption = 'Fax:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText22: TDBText
            Left = 322
            Top = 76
            Width = 133
            Height = 13
            DataField = 'Fax'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label30: TLabel
            Left = 35
            Top = 60
            Width = 49
            Height = 13
            Caption = 'Contato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText27: TDBText
            Left = 86
            Top = 60
            Width = 247
            Height = 13
            DataField = 'Contato'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label29: TLabel
            Left = 45
            Top = 92
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'E-mail:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText55: TDBText
            Left = 86
            Top = 92
            Width = 421
            Height = 13
            DataField = 'Email'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label56: TLabel
            Left = 48
            Top = 109
            Width = 36
            Height = 13
            Caption = 'CNPJ:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText56: TDBText
            Left = 86
            Top = 108
            Width = 135
            Height = 13
            DataField = 'CNPJ'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label57: TLabel
            Left = 53
            Top = 125
            Width = 31
            Height = 13
            Caption = 'End.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText57: TDBText
            Left = 86
            Top = 124
            Width = 509
            Height = 13
            DataField = 'Endereco'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label58: TLabel
            Left = 40
            Top = 141
            Width = 44
            Height = 13
            Caption = 'Cidade:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText58: TDBText
            Left = 86
            Top = 141
            Width = 221
            Height = 13
            DataField = 'NomeCidade'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText59: TDBText
            Left = 404
            Top = 141
            Width = 37
            Height = 13
            DataField = 'UF'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label59: TLabel
            Left = 381
            Top = 141
            Width = 21
            Height = 13
            Caption = 'UF:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label60: TLabel
            Left = 46
            Top = 157
            Width = 38
            Height = 13
            Caption = 'Bairro:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText60: TDBText
            Left = 86
            Top = 157
            Width = 221
            Height = 13
            DataField = 'Bairro'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label61: TLabel
            Left = 373
            Top = 157
            Width = 29
            Height = 13
            Caption = 'CEP:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText61: TDBText
            Left = 404
            Top = 157
            Width = 77
            Height = 13
            DataField = 'Cep'
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SMDBGrid4: TSMDBGrid
            Left = 1
            Top = 179
            Width = 770
            Height = 353
            Align = alBottom
            DataSource = qsTransp
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Flat = False
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'MS Sans Serif'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clWindow
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 11
            DefaultRowHeight = 17
            ScrollBars = ssHorizontal
            ColCount = 14
            RowCount = 2
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Codigo'
                Title.Alignment = taCenter
                Title.Caption = 'C'#243'digo'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Nome'
                Title.Alignment = taCenter
                Title.Caption = 'Fornecedor'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Fantasia'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Fone'
                Title.Alignment = taCenter
                Title.Caption = 'Fone 1'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Fax'
                Title.Alignment = taCenter
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Contato'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Bairro'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Endereco'
                Title.Alignment = taCenter
                Title.Caption = 'Endere'#231'o'
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'UF'
                Title.Alignment = taCenter
                Title.Caption = 'Estado'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Cep'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CNPJ'
                Title.Alignment = taCenter
                Title.Caption = 'CNPJ/CPF'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Inscricao'
                Title.Alignment = taCenter
                Title.Caption = 'Inscr. Estadual'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeCidade'
                Title.Alignment = taCenter
                Title.Caption = 'Cidade'
                Visible = True
              end>
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Vendedores'
        ImageIndex = 3
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 772
          Height = 533
          Align = alClient
          BevelOuter = bvLowered
          Color = clInactiveBorder
          TabOrder = 0
          object Label9: TLabel
            Left = 52
            Top = 17
            Width = 106
            Height = 13
            Caption = 'Procurar p/ Nome:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton4: TSpeedButton
            Left = 501
            Top = 7
            Width = 25
            Height = 25
            Hint = 'Abre o cadastro de Vendedores'
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000C40E0000C40E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
              000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
              00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
              8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
              8888880BB088888888888800008888888888}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton4Click
          end
          object Bevel4: TBevel
            Left = 0
            Top = 40
            Width = 770
            Height = 2
            Style = bsRaised
          end
          object Label17: TLabel
            Left = 10
            Top = 56
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object DBText8: TDBText
            Left = 52
            Top = 56
            Width = 432
            Height = 13
            Color = clBtnFace
            DataField = 'Nome'
            DataSource = qsVendedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label18: TLabel
            Left = 501
            Top = 56
            Width = 44
            Height = 13
            Caption = 'C'#243'digo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText15: TDBText
            Left = 549
            Top = 56
            Width = 68
            Height = 13
            DataField = 'Codigo'
            DataSource = qsVendedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 10
            Top = 101
            Width = 55
            Height = 13
            Caption = 'Telefone:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText16: TDBText
            Left = 70
            Top = 101
            Width = 121
            Height = 13
            DataField = 'Fone'
            DataSource = qsVendedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label26: TLabel
            Left = 269
            Top = 101
            Width = 25
            Height = 13
            Caption = 'Fax:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText17: TDBText
            Left = 303
            Top = 101
            Width = 133
            Height = 13
            DataField = 'Fax'
            DataSource = qsVendedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 10
            Top = 78
            Width = 49
            Height = 13
            Caption = 'Contato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText23: TDBText
            Left = 62
            Top = 78
            Width = 247
            Height = 13
            DataField = 'Contato'
            DataSource = qsVendedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RxDBLookupCombo4: TRxDBLookupCombo
            Left = 161
            Top = 9
            Width = 337
            Height = 21
            DropDownCount = 8
            LookupField = 'Codigo'
            LookupDisplay = 'Nome'
            LookupSource = qsVendedores
            TabOrder = 0
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Outros'
        ImageIndex = 4
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 772
          Height = 533
          Align = alClient
          BevelOuter = bvLowered
          Color = clInactiveBorder
          TabOrder = 0
          object SpeedButton5: TSpeedButton
            Left = 583
            Top = 5
            Width = 84
            Height = 25
            Hint = 'Abre o cadastro de outros p/ Agenda Telef'#244'nica'
            Caption = 'Outros'
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000C40E0000C40E00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
              000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
              00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
              8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
              8888880BB088888888888800008888888888}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton5Click
          end
          object Bevel5: TBevel
            Left = 0
            Top = 40
            Width = 770
            Height = 2
            Style = bsRaised
          end
          object Label31: TLabel
            Left = 28
            Top = 46
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object DBText25: TDBText
            Left = 70
            Top = 46
            Width = 432
            Height = 13
            Color = clBtnFace
            DataField = 'Nome'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label32: TLabel
            Left = 573
            Top = 46
            Width = 44
            Height = 13
            Caption = 'C'#243'digo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText26: TDBText
            Left = 621
            Top = 46
            Width = 68
            Height = 13
            DataField = 'Codigo'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label33: TLabel
            Left = 10
            Top = 79
            Width = 55
            Height = 13
            Caption = 'Telefone:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText28: TDBText
            Left = 70
            Top = 79
            Width = 121
            Height = 13
            DataField = 'Telefone1'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label34: TLabel
            Left = 261
            Top = 79
            Width = 66
            Height = 13
            Caption = 'Telefone 2:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText29: TDBText
            Left = 335
            Top = 79
            Width = 133
            Height = 13
            DataField = 'Telefone2'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label35: TLabel
            Left = 592
            Top = 79
            Width = 25
            Height = 13
            Caption = 'Fax:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText30: TDBText
            Left = 621
            Top = 79
            Width = 121
            Height = 13
            DataField = 'Fax'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label36: TLabel
            Left = 16
            Top = 62
            Width = 49
            Height = 13
            Caption = 'Contato:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText31: TDBText
            Left = 70
            Top = 62
            Width = 271
            Height = 13
            Color = clBtnFace
            DataField = 'Contato'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label38: TLabel
            Left = 26
            Top = 97
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'E-mail:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText33: TDBText
            Left = 70
            Top = 97
            Width = 421
            Height = 13
            DataField = 'Email'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label48: TLabel
            Left = 5
            Top = 116
            Width = 65
            Height = 13
            Caption = 'CNPJ/CPF:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText47: TDBText
            Left = 71
            Top = 115
            Width = 135
            Height = 13
            DataField = 'NumDoc'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label51: TLabel
            Left = 37
            Top = 132
            Width = 31
            Height = 13
            Caption = 'End.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText50: TDBText
            Left = 71
            Top = 131
            Width = 509
            Height = 13
            DataField = 'Endereco'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label52: TLabel
            Left = 24
            Top = 148
            Width = 44
            Height = 13
            Caption = 'Cidade:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText51: TDBText
            Left = 71
            Top = 148
            Width = 221
            Height = 13
            DataField = 'NomeCidade'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText52: TDBText
            Left = 391
            Top = 148
            Width = 29
            Height = 13
            DataField = 'UF'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label53: TLabel
            Left = 368
            Top = 148
            Width = 21
            Height = 13
            Caption = 'UF:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label54: TLabel
            Left = 30
            Top = 164
            Width = 38
            Height = 13
            Caption = 'Bairro:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText53: TDBText
            Left = 71
            Top = 164
            Width = 221
            Height = 13
            DataField = 'Bairro'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label55: TLabel
            Left = 360
            Top = 164
            Width = 29
            Height = 13
            Caption = 'CEP:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBText54: TDBText
            Left = 391
            Top = 164
            Width = 77
            Height = 13
            DataField = 'Cep'
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SMDBGrid3: TSMDBGrid
            Left = 1
            Top = 183
            Width = 770
            Height = 349
            Align = alBottom
            DataSource = qsOutros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Flat = False
            BandsFont.Charset = DEFAULT_CHARSET
            BandsFont.Color = clWindowText
            BandsFont.Height = -11
            BandsFont.Name = 'MS Sans Serif'
            BandsFont.Style = []
            Groupings = <>
            GridStyle.Style = gsCustom
            GridStyle.OddColor = clWindow
            GridStyle.EvenColor = clWindow
            TitleHeight.PixelCount = 24
            FooterColor = clBtnFace
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 11
            DefaultRowHeight = 17
            ScrollBars = ssHorizontal
            ColCount = 14
            RowCount = 2
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Codigo'
                Title.Alignment = taCenter
                Title.Caption = 'C'#243'digo'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Nome'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Fantasia'
                Title.Alignment = taCenter
                Title.Caption = 'Nome Fantasia'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Telefone1'
                Title.Alignment = taCenter
                Title.Caption = 'Fone 1'
                Width = 92
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Telefone2'
                Title.Alignment = taCenter
                Title.Caption = 'Fone 2'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Fax'
                Title.Alignment = taCenter
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Contato'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Bairro'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Endereco'
                Title.Alignment = taCenter
                Title.Caption = 'Endere'#231'o'
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'UF'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Cep'
                Title.Alignment = taCenter
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NumDoc'
                Title.Alignment = taCenter
                Title.Caption = 'CNPJ/CPF'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeCidade'
                Title.Alignment = taCenter
                Title.Caption = 'Cidade'
                Visible = True
              end>
          end
        end
      end
    end
    object BitBtn1: TBitBtn
      Left = 680
      Top = 30
      Width = 90
      Height = 25
      Hint = 'Fecha a janela atual'
      Caption = '&Fechar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0038383838380E
        038383838383830E603800000000380E660033333330830E660333333330000E
        660333330030330E660333330E00330E660300000EE0330E06030EEEEEE6030E
        660300000E60330E660333330600330E660333330030330E6603333333303330
        E6033333333033330E0333333330000000033333333333333333}
    end
  end
  object qCliente: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbcliente.Codigo, Dbcliente.Nome, Dbcliente.Telefone, Dbc' +
        'liente.Telefone2, Dbcliente.Fax, Dbcliente.Contato, Dbcliente.Fa' +
        'ntasia, Dbcliente.Bairro, Dbcliente.Endereco, Dbcliente.Uf, Dbcl' +
        'iente.Cep, Dbcliente.CgcCpf, Dbcliente.InscrEst, Dbcliente.DDDFa' +
        'x, Dbcliente.DDDFone2, Dbcliente.DDDFone1, Dbcliente.CodCidade, ' +
        'Dbcidade.Nome NomeCidade'
      'FROM "dbCliente.DB" Dbcliente'
      '   INNER JOIN "dbCidade.DB" Dbcidade'
      '   ON  (Dbcliente.CodCidade = Dbcidade.Codigo)  '
      'ORDER BY Dbcliente.Nome')
    Left = 245
    Top = 323
    object qClienteCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'TABELAS."dbCliente.DB".Codigo'
    end
    object qClienteNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbCliente.DB".Nome'
      Size = 60
    end
    object qClienteTelefone: TStringField
      FieldName = 'Telefone'
      Origin = 'TABELAS."dbCliente.DB".Telefone'
      Size = 15
    end
    object qClienteTelefone2: TStringField
      FieldName = 'Telefone2'
      Origin = 'TABELAS."dbCliente.DB".Telefone2'
      Size = 15
    end
    object qClienteFax: TStringField
      FieldName = 'Fax'
      Origin = 'TABELAS."dbCliente.DB".Fax'
      Size = 15
    end
    object qClienteContato: TStringField
      FieldName = 'Contato'
      Origin = 'TABELAS."dbCliente.DB".Contato'
      Size = 30
    end
    object qClienteFantasia: TStringField
      FieldName = 'Fantasia'
      Origin = 'TABELAS."dbCliente.DB".Fantasia'
      Size = 30
    end
    object qClienteBairro: TStringField
      FieldName = 'Bairro'
      Origin = 'TABELAS."dbCliente.DB".Bairro'
      Size = 25
    end
    object qClienteEndereco: TStringField
      FieldName = 'Endereco'
      Origin = 'TABELAS."dbCliente.DB".Endereco'
      Size = 60
    end
    object qClienteUf: TStringField
      FieldName = 'Uf'
      Origin = 'TABELAS."dbCliente.DB".Uf'
      Size = 2
    end
    object qClienteCep: TStringField
      FieldName = 'Cep'
      Origin = 'TABELAS."dbCliente.DB".Cep'
      Size = 10
    end
    object qClienteCgcCpf: TStringField
      FieldName = 'CgcCpf'
      Origin = 'TABELAS."dbCliente.DB".CgcCpf'
      Size = 18
    end
    object qClienteInscrEst: TStringField
      FieldName = 'InscrEst'
      Origin = 'TABELAS."dbCliente.DB".InscrEst'
      Size = 18
    end
    object qClienteDDDFax: TIntegerField
      FieldName = 'DDDFax'
      Origin = 'TABELAS."dbCliente.DB".DDDFax'
    end
    object qClienteDDDFone2: TIntegerField
      FieldName = 'DDDFone2'
      Origin = 'TABELAS."dbCliente.DB".DDDFone2'
    end
    object qClienteDDDFone1: TIntegerField
      FieldName = 'DDDFone1'
      Origin = 'TABELAS."dbCliente.DB".DDDFone1'
    end
    object qClienteCodCidade: TIntegerField
      FieldName = 'CodCidade'
      Origin = 'TABELAS."dbCliente.DB".CodCidade'
    end
    object qClienteNomeCidade: TStringField
      FieldName = 'NomeCidade'
      Origin = 'TABELAS."dbCidade.DB".Nome'
      Size = 26
    end
  end
  object qsCliente: TDataSource
    DataSet = qCliente
    Left = 253
    Top = 315
  end
  object qFornecedores: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbfornecedores.CodForn, Dbfornecedores.NomeForn, Dbfornec' +
        'edores.Tel1Forn, Dbfornecedores.Tel2Forn, Dbfornecedores.FaxForn' +
        ', Dbfornecedores.ContatoForn, Dbfornecedores.Fantasia, Dbfornece' +
        'dores.Email, Dbcidade.Nome NomeCidade, Dbfornecedores.EndForn, D' +
        'bfornecedores.BairroForn, Dbfornecedores.CEPForn, Dbfornecedores' +
        '.EstadoForn, Dbfornecedores.CGC, Dbfornecedores.Insc'
      'FROM "dbFornecedores.DB" Dbfornecedores'
      '   LEFT OUTER JOIN "dbCidade.DB" Dbcidade'
      '   ON  (Dbfornecedores.CodCidade = Dbcidade.Codigo)  '
      'ORDER BY Dbfornecedores.NomeForn')
    Left = 283
    Top = 323
    object qFornecedoresCodForn: TIntegerField
      FieldName = 'CodForn'
      Origin = 'TABELAS."dbFornecedores.DB".CodForn'
    end
    object qFornecedoresNomeForn: TStringField
      FieldName = 'NomeForn'
      Origin = 'TABELAS."dbFornecedores.DB".NomeForn'
      Size = 40
    end
    object qFornecedoresTel1Forn: TStringField
      FieldName = 'Tel1Forn'
      Origin = 'TABELAS."dbFornecedores.DB".Tel1Forn'
      Size = 15
    end
    object qFornecedoresTel2Forn: TStringField
      FieldName = 'Tel2Forn'
      Origin = 'TABELAS."dbFornecedores.DB".Tel2Forn'
      Size = 15
    end
    object qFornecedoresFaxForn: TStringField
      FieldName = 'FaxForn'
      Origin = 'TABELAS."dbFornecedores.DB".FaxForn'
      Size = 15
    end
    object qFornecedoresContatoForn: TStringField
      FieldName = 'ContatoForn'
      Origin = 'TABELAS."dbFornecedores.DB".ContatoForn'
      Size = 40
    end
    object qFornecedoresFantasia: TStringField
      FieldName = 'Fantasia'
      Origin = 'TABELAS."dbFornecedores.DB".Fantasia'
      Size = 60
    end
    object qFornecedoresEmail: TStringField
      FieldName = 'Email'
      Origin = 'TABELAS."dbFornecedores.DB".Email'
      Size = 40
    end
    object qFornecedoresNomeCidade: TStringField
      FieldName = 'NomeCidade'
      Origin = 'TABELAS."dbCidade.DB".Nome'
      Size = 26
    end
    object qFornecedoresEndForn: TStringField
      FieldName = 'EndForn'
      Origin = 'TABELAS."dbFornecedores.DB".EndForn'
      Size = 40
    end
    object qFornecedoresBairroForn: TStringField
      FieldName = 'BairroForn'
      Origin = 'TABELAS."dbFornecedores.DB".BairroForn'
      Size = 30
    end
    object qFornecedoresCEPForn: TStringField
      FieldName = 'CEPForn'
      Origin = 'TABELAS."dbFornecedores.DB".CEPForn'
      Size = 9
    end
    object qFornecedoresEstadoForn: TStringField
      FieldName = 'EstadoForn'
      Origin = 'TABELAS."dbFornecedores.DB".EstadoForn'
      Size = 2
    end
    object qFornecedoresCGC: TStringField
      FieldName = 'CGC'
      Origin = 'TABELAS."dbFornecedores.DB".CGC'
      Size = 18
    end
    object qFornecedoresInsc: TStringField
      FieldName = 'Insc'
      Origin = 'TABELAS."dbFornecedores.DB".Insc'
    end
  end
  object qsFornecedores: TDataSource
    DataSet = qFornecedores
    Left = 289
    Top = 315
  end
  object qTransp: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbtransp.Nome, Dbtransp.Codigo, Dbtransp.Fone, Dbtransp.F' +
        'ax, Dbtransp.Contato, Dbtransp.Endereco, Dbtransp.Bairro, Dbtran' +
        'sp.CNPJ, Dbtransp.Inscricao, Dbtransp.Fantasia, Dbtransp.CodCida' +
        'de, Dbcidade.Nome NomeCidade, Dbtransp.UF, Dbtransp.Cep, Dbtrans' +
        'p.Email, Dbtransp.HomePage'
      'FROM "dbTransp.DB" Dbtransp'
      '   LEFT OUTER JOIN "dbCidade.DB" Dbcidade'
      '   ON  (Dbtransp.CodCidade = Dbcidade.Codigo)  '
      'ORDER BY Dbtransp.Nome')
    Left = 319
    Top = 323
    object qTranspNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbTransp.DB".Nome'
      Size = 40
    end
    object qTranspCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'TABELAS."dbTransp.DB".Codigo'
    end
    object qTranspFone: TStringField
      FieldName = 'Fone'
      Origin = 'TABELAS."dbTransp.DB".Fone'
      Size = 15
    end
    object qTranspFax: TStringField
      FieldName = 'Fax'
      Origin = 'TABELAS."dbTransp.DB".Fax'
      Size = 15
    end
    object qTranspContato: TStringField
      FieldName = 'Contato'
      Origin = 'TABELAS."dbTransp.DB".Contato'
      Size = 40
    end
    object qTranspEndereco: TStringField
      FieldName = 'Endereco'
      Origin = 'TABELAS."dbTransp.DB".Endereco'
      Size = 40
    end
    object qTranspBairro: TStringField
      FieldName = 'Bairro'
      Origin = 'TABELAS."dbTransp.DB".Bairro'
      Size = 25
    end
    object qTranspCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'TABELAS."dbTransp.DB".CNPJ'
      Size = 18
    end
    object qTranspInscricao: TStringField
      FieldName = 'Inscricao'
      Origin = 'TABELAS."dbTransp.DB".Inscricao'
    end
    object qTranspFantasia: TStringField
      FieldName = 'Fantasia'
      Origin = 'TABELAS."dbTransp.DB".Fantasia'
      Size = 40
    end
    object qTranspCodCidade: TIntegerField
      FieldName = 'CodCidade'
      Origin = 'TABELAS."dbTransp.DB".CodCidade'
    end
    object qTranspNomeCidade: TStringField
      FieldName = 'NomeCidade'
      Origin = 'TABELAS."dbCidade.DB".Nome'
      Size = 26
    end
    object qTranspUF: TStringField
      FieldName = 'UF'
      Origin = 'TABELAS."dbTransp.DB".UF'
      Size = 2
    end
    object qTranspCep: TStringField
      FieldName = 'Cep'
      Origin = 'TABELAS."dbTransp.DB".Cep'
      Size = 9
    end
    object qTranspEmail: TStringField
      FieldName = 'Email'
      Origin = 'TABELAS."dbTransp.DB".Email'
      Size = 200
    end
    object qTranspHomePage: TStringField
      FieldName = 'HomePage'
      Origin = 'TABELAS."dbTransp.DB".HomePage'
      Size = 200
    end
  end
  object qsTransp: TDataSource
    DataSet = qTransp
    Left = 325
    Top = 315
  end
  object qVendedores: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Codigo, Nome, Fone, Fax, Contato'
      'FROM "dbVendedor.DB" Dbvendedor'
      'ORDER BY Nome')
    Left = 354
    Top = 323
    object qVendedoresCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'TABELAS."dbVendedor.DB".Codigo'
    end
    object qVendedoresNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbVendedor.DB".Nome'
      Size = 40
    end
    object qVendedoresFone: TStringField
      FieldName = 'Fone'
      Origin = 'TABELAS."dbVendedor.DB".Fone'
      Size = 15
    end
    object qVendedoresFax: TStringField
      FieldName = 'Fax'
      Origin = 'TABELAS."dbVendedor.DB".Fax'
      Size = 15
    end
    object qVendedoresContato: TStringField
      FieldName = 'Contato'
      Origin = 'TABELAS."dbVendedor.DB".Contato'
      Size = 50
    end
  end
  object qsVendedores: TDataSource
    DataSet = qVendedores
    Left = 359
    Top = 315
  end
  object qOutros: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dboutros.Codigo, Dboutros.Nome, Dboutros.Contato, Dboutro' +
        's.Telefone1, Dboutros.Telefone2, Dboutros.Fax, Dboutros.Email, D' +
        'bcidade.Nome NomeCidade, Dboutros.CodCidade, Dboutros.Endereco, ' +
        'Dboutros.Bairro, Dboutros.Cep, Dboutros.UF, Dboutros.NumDoc, Dbo' +
        'utros.Pessoa, Dboutros.Obs, dbOutros.Fantasia'
      'FROM "dbOutros.db" Dboutros'
      '   LEFT OUTER JOIN "dbCidade.DB" Dbcidade'
      '   ON  (Dboutros.CodCidade = Dbcidade.Codigo)  '
      'ORDER BY Dboutros.Nome')
    Left = 391
    Top = 322
    object qOutrosCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'TABELAS."dbOutros.DB".Codigo'
    end
    object qOutrosNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbOutros.DB".Nome'
      Size = 40
    end
    object qOutrosContato: TStringField
      FieldName = 'Contato'
      Origin = 'TABELAS."dbOutros.DB".Contato'
      Size = 30
    end
    object qOutrosTelefone1: TStringField
      FieldName = 'Telefone1'
      Origin = 'TABELAS."dbOutros.DB".Telefone1'
      Size = 15
    end
    object qOutrosTelefone2: TStringField
      FieldName = 'Telefone2'
      Origin = 'TABELAS."dbOutros.DB".Telefone2'
      Size = 15
    end
    object qOutrosFax: TStringField
      FieldName = 'Fax'
      Origin = 'TABELAS."dbOutros.DB".Fax'
      Size = 15
    end
    object qOutrosEmail: TStringField
      FieldName = 'Email'
      Origin = 'TABELAS."dbOutros.DB".Email'
      Size = 50
    end
    object qOutrosNomeCidade: TStringField
      FieldName = 'NomeCidade'
      Origin = 'TABELAS."dbCidade.DB".Nome'
      Size = 26
    end
    object qOutrosCodCidade: TIntegerField
      FieldName = 'CodCidade'
      Origin = 'TABELAS."dbOutros.DB".CodCidade'
    end
    object qOutrosEndereco: TStringField
      FieldName = 'Endereco'
      Origin = 'TABELAS."dbOutros.DB".Endereco'
      Size = 50
    end
    object qOutrosBairro: TStringField
      FieldName = 'Bairro'
      Origin = 'TABELAS."dbOutros.DB".Bairro'
      Size = 30
    end
    object qOutrosCep: TStringField
      FieldName = 'Cep'
      Origin = 'TABELAS."dbOutros.DB".Cep'
      Size = 9
    end
    object qOutrosUF: TStringField
      FieldName = 'UF'
      Origin = 'TABELAS."dbOutros.DB".UF'
      Size = 2
    end
    object qOutrosNumDoc: TStringField
      FieldName = 'NumDoc'
      Origin = 'TABELAS."dbOutros.DB".NumDoc'
      Size = 18
    end
    object qOutrosPessoa: TStringField
      FieldName = 'Pessoa'
      Origin = 'TABELAS."dbOutros.DB".Pessoa'
      Size = 1
    end
    object qOutrosObs: TMemoField
      FieldName = 'Obs'
      Origin = 'TABELAS."dbOutros.DB".Obs'
      BlobType = ftMemo
      Size = 1
    end
    object qOutrosFantasia: TStringField
      FieldName = 'Fantasia'
      Origin = 'TABELAS."dbOutros.DB".Fantasia'
      Size = 30
    end
  end
  object qsOutros: TDataSource
    DataSet = qOutros
    Left = 397
    Top = 314
  end
end
