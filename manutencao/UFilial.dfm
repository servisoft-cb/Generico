object fFilial: TfFilial
  Left = 217
  Top = 15
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Filiais'
  ClientHeight = 666
  ClientWidth = 935
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 935
    Height = 666
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 933
      Height = 32
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 24
        Top = 9
        Width = 111
        Height = 16
        Caption = 'Procura pela Filial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 140
        Top = 5
        Width = 351
        Height = 21
        Hint = 'Efetua a procura de uma filial'
        DropDownCount = 8
        DropDownWidth = 260
        LookupField = 'Codigo'
        LookupDisplay = 'Empresa'
        LookupSource = DM1.dsFilial
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDropDown = RxDBLookupCombo1Enter
        OnEnter = RxDBLookupCombo1Enter
        OnExit = RxDBLookupCombo1Exit
      end
      object CheckBox1: TCheckBox
        Left = 501
        Top = 7
        Width = 97
        Height = 17
        Caption = 'Exibir inativas'
        TabOrder = 1
        OnClick = CheckBox1Click
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 33
      Width = 933
      Height = 27
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 157
        Top = 1
        Width = 85
        Height = 25
        Hint = 'Insere um novo registro'
        Caption = '&Inserir'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333FF33333333FF333993333333300033377F3333333777333993333333
          300033F77FFF3333377739999993333333333777777F3333333F399999933333
          33003777777333333377333993333333330033377F3333333377333993333333
          3333333773333333333F333333333333330033333333F33333773333333C3333
          330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
          333333333337733333FF3333333C333330003333333733333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
      end
      object DBNavigator1: TDBNavigator
        Left = 1
        Top = 1
        Width = 156
        Height = 25
        DataSource = DM1.dsFilial
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Hints.Strings = (
          'Vai para o primeiro registro'
          'Volta um registro'
          'Avan'#231'a um registro'
          'Vai para o '#250'ltimo registro')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object BitBtn2: TBitBtn
        Left = 242
        Top = 1
        Width = 85
        Height = 25
        Hint = 'Altera o registro selecionado'
        Caption = '&Alterar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BitBtn2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
      end
      object BitBtn3: TBitBtn
        Left = 327
        Top = 1
        Width = 85
        Height = 25
        Hint = 'Exclui o registro selecionado'
        Caption = '&Excluir'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BitBtn3Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
          03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
          33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
          0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
          3333333337FFF7F3333333333000003333333333377777333333}
        NumGlyphs = 2
      end
      object BitBtn4: TBitBtn
        Left = 412
        Top = 1
        Width = 85
        Height = 25
        Hint = 'Cancela a inclus'#227'o ou altera'#231#227'o de um registro'
        Caption = 'Ca&ncelar'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = BitBtn4Click
        Glyph.Data = {
          CE070000424DCE07000000000000360000002800000024000000120000000100
          18000000000098070000CE0E0000C40E00000000000000000000008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          0080800080800080800080800080800080808080808080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080FFFFFF008080008080008080008080008080008080
          0080800080800080800080800080800080800080800080800080800000FF0000
          800000808080800080800080800080800080800080800000FF80808000808000
          8080008080008080008080008080008080008080808080808080FFFFFF008080
          008080008080008080008080008080FFFFFF0080800080800080800080800080
          800080800080800000FF00008000008000008080808000808000808000808000
          00FF000080000080808080008080008080008080008080008080008080808080
          FFFFFF008080808080FFFFFF008080008080008080FFFFFF808080808080FFFF
          FF0080800080800080800080800080800080800000FF00008000008000008000
          00808080800080800000FF000080000080000080000080808080008080008080
          008080008080008080808080FFFFFF008080008080808080FFFFFF008080FFFF
          FF808080008080008080808080FFFFFF00808000808000808000808000808000
          80800000FF000080000080000080000080808080000080000080000080000080
          000080808080008080008080008080008080008080808080FFFFFF0080800080
          80008080808080FFFFFF808080008080008080008080008080808080FFFFFF00
          80800080800080800080800080800080800000FF000080000080000080000080
          0000800000800000800000808080800080800080800080800080800080800080
          80008080808080FFFFFF00808000808000808080808000808000808000808000
          8080FFFFFF808080008080008080008080008080008080008080008080008080
          0000FF0000800000800000800000800000800000808080800080800080800080
          80008080008080008080008080008080008080808080FFFFFF00808000808000
          8080008080008080008080FFFFFF808080008080008080008080008080008080
          0080800080800080800080800080800000800000800000800000800000808080
          8000808000808000808000808000808000808000808000808000808000808000
          8080808080FFFFFF008080008080008080008080008080808080008080008080
          0080800080800080800080800080800080800080800080800080800000FF0000
          8000008000008000008080808000808000808000808000808000808000808000
          8080008080008080008080008080008080808080FFFFFF008080008080008080
          8080800080800080800080800080800080800080800080800080800080800080
          800080800000FF00008000008000008000008000008080808000808000808000
          8080008080008080008080008080008080008080008080008080008080808080
          008080008080008080008080808080FFFFFF0080800080800080800080800080
          800080800080800080800080800000FF00008000008000008080808000008000
          0080000080808080008080008080008080008080008080008080008080008080
          008080008080808080008080008080008080008080008080808080FFFFFF0080
          800080800080800080800080800080800080800080800000FF00008000008000
          00808080800080800000FF000080000080000080808080008080008080008080
          008080008080008080008080008080808080008080008080008080808080FFFF
          FF008080008080808080FFFFFF00808000808000808000808000808000808000
          80800000FF0000800000808080800080800080800080800000FF000080000080
          000080808080008080008080008080008080008080008080808080FFFFFF0080
          80008080808080008080808080FFFFFF008080008080808080FFFFFF00808000
          80800080800080800080800080800080800000FF000080008080008080008080
          0080800080800000FF0000800000800000800080800080800080800080800080
          80008080808080FFFFFFFFFFFF808080008080008080008080808080FFFFFF00
          8080008080808080FFFFFF008080008080008080008080008080008080008080
          0080800080800080800080800080800080800080800000FF0000800000FF0080
          8000808000808000808000808000808000808080808080808000808000808000
          8080008080008080808080FFFFFFFFFFFFFFFFFF808080008080008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080808080808080808080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          008080008080008080008080008080008080}
        NumGlyphs = 2
      end
      object BitBtn5: TBitBtn
        Left = 497
        Top = 1
        Width = 90
        Height = 25
        Hint = 'Confirma a altera'#231#227'o ou inclus'#227'o de um registro'
        Caption = '&Confirmar'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = BitBtn5Click
        Glyph.Data = {
          CE070000424DCE07000000000000360000002800000024000000120000000100
          18000000000098070000CE0E0000D80E00000000000000000000008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080FFFFFF008080008080008080008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8080000080000000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080808080808080FFFFFF
          FFFFFF0080800080800080800080800080800080800080800080800080800080
          8000808000808000808080000000800000800080000000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          808080808080808080808080FFFFFFFFFFFF0080800080800080800080800080
          8000808000808000808000808000808000808080000000800000800000800000
          8000800000008080008080008080008080008080008080008080008080008080
          008080008080008080808080808080808080808080808080808080FFFFFFFFFF
          FF00808000808000808000808000808000808000808000808000808080000000
          8000008000008000008000008000008000800000008080008080008080008080
          0080800080800080800080800080800080808080808080808080808080808080
          80808080808080808080808080FFFFFF00808000808000808000808000808000
          808000808080000000800000800000800000FF00008000008000008000008000
          8000000080800080800080800080800080800080800080800080808080808080
          80808080808080FFFFFF808080808080808080808080808080FFFFFF00808000
          808000808000808000808000808000808000800000800000800000FF00008080
          00FF000080000080000080008000000080800080800080800080800080800080
          80008080008080808080808080808080FFFFFF008080FFFFFF80808080808080
          8080808080FFFFFFFFFFFF00808000808000808000808000808000808000FF00
          00800000FF0000808000808000808000FF000080000080000080008000000080
          80008080008080008080008080008080008080808080808080FFFFFF00808000
          8080008080FFFFFF808080808080808080808080FFFFFFFFFFFF008080008080
          00808000808000808000808000FF0000808000808000808000808000808000FF
          0000800000800000800080000000808000808000808000808000808000808000
          8080FFFFFF008080008080008080008080008080FFFFFF808080808080808080
          808080FFFFFFFFFFFF0080800080800080800080800080800080800080800080
          8000808000808000808000808000FF0000800000800000800080000000808000
          8080008080008080008080008080008080008080008080008080008080008080
          008080FFFFFF808080808080808080808080FFFFFFFFFFFF0080800080800080
          8000808000808000808000808000808000808000808000808000808000FF0000
          8000008000008000800000008080008080008080008080008080008080008080
          008080008080008080008080008080008080FFFFFF8080808080808080808080
          80FFFFFF00808000808000808000808000808000808000808000808000808000
          808000808000808000808000FF00008000008000008000800000008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          80FFFFFF808080808080808080808080FFFFFF00808000808000808000808000
          808000808000808000808000808000808000808000808000808000FF00008000
          0080000080008000000080800080800080800080800080800080800080800080
          80008080008080008080008080008080FFFFFF808080808080808080808080FF
          FFFF008080008080008080008080008080008080008080008080008080008080
          00808000808000808000FF000080000080008000000080800080800080800080
          80008080008080008080008080008080008080008080008080008080008080FF
          FFFF808080808080808080008080008080008080008080008080008080008080
          00808000808000808000808000808000808000808000808000FF000080000080
          0000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080FFFFFF808080808080008080008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000FF0000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080FFFFFF
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          008080008080008080008080008080008080}
        NumGlyphs = 2
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 60
      Width = 933
      Height = 77
      Align = alClient
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 2
      object Label2: TLabel
        Left = 14
        Top = 34
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Raz'#227'o Social:'
      end
      object Label15: TLabel
        Left = 13
        Top = 55
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome Interno:'
      end
      object Label16: TLabel
        Left = 45
        Top = 12
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'Inativa:'
      end
      object DBEdit1: TDBEdit
        Left = 82
        Top = 26
        Width = 370
        Height = 21
        AutoSize = False
        CharCase = ecUpperCase
        DataField = 'Empresa'
        DataSource = DM1.dsFilial
        TabOrder = 1
      end
      object DBEdit13: TDBEdit
        Left = 82
        Top = 47
        Width = 332
        Height = 21
        AutoSize = False
        CharCase = ecUpperCase
        DataField = 'NomeInterno'
        DataSource = DM1.dsFilial
        TabOrder = 2
      end
      object RxDBComboBox1: TRxDBComboBox
        Left = 82
        Top = 4
        Width = 145
        Height = 21
        Style = csDropDownList
        DataField = 'Inativo'
        DataSource = DM1.dsFilial
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'N'#227'o'
          'Sim')
        TabOrder = 0
        Values.Strings = (
          'False'
          'True')
      end
    end
    object RzPageControl1: TRzPageControl
      Left = 1
      Top = 137
      Width = 933
      Height = 528
      ActivePage = TabSheet1
      ActivePageDefault = TabSheet1
      Align = alBottom
      TabIndex = 0
      TabOrder = 3
      OnChange = RzPageControl1Change
      FixedDimension = 19
      object TabSheet1: TRzTabSheet
        Caption = 'Dados'
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 929
          Height = 505
          Align = alClient
          Enabled = False
          TabOrder = 0
          object SpeedButton1: TSpeedButton
            Left = 485
            Top = 70
            Width = 25
            Height = 25
            Hint = 'Abre o cadastro de Estados'
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
          object Label4: TLabel
            Left = 31
            Top = 14
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Endere'#231'o:'
          end
          object Label5: TLabel
            Left = 50
            Top = 58
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bairro:'
          end
          object Label6: TLabel
            Left = 373
            Top = 58
            Width = 22
            Height = 13
            Caption = 'Cep:'
          end
          object Label8: TLabel
            Left = 398
            Top = 80
            Width = 36
            Height = 13
            Caption = 'Estado:'
          end
          object Label9: TLabel
            Left = 53
            Top = 103
            Width = 27
            Height = 13
            Caption = 'Fone:'
          end
          object Label10: TLabel
            Left = 176
            Top = 103
            Width = 36
            Height = 13
            Caption = 'Fone 2:'
          end
          object Label11: TLabel
            Left = 376
            Top = 103
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fax:'
          end
          object Label12: TLabel
            Left = 50
            Top = 126
            Width = 30
            Height = 13
            Caption = 'CNPJ:'
          end
          object Label13: TLabel
            Left = 267
            Top = 126
            Width = 50
            Height = 13
            Caption = 'Inscr. Est.:'
          end
          object Label14: TLabel
            Left = 52
            Top = 197
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Email:'
          end
          object Label17: TLabel
            Left = 36
            Top = 241
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Logotipo:'
          end
          object Label18: TLabel
            Left = 44
            Top = 81
            Width = 36
            Height = 13
            Caption = 'Cidade:'
          end
          object Label21: TLabel
            Left = 65
            Top = 36
            Width = 15
            Height = 13
            Caption = 'N'#186':'
          end
          object Label20: TLabel
            Left = 3
            Top = 150
            Width = 77
            Height = 13
            Caption = 'Inscr. Municipal:'
          end
          object Label22: TLabel
            Left = 21
            Top = 174
            Width = 59
            Height = 13
            Caption = 'Home Page:'
          end
          object Label19: TLabel
            Left = 285
            Top = 150
            Width = 32
            Height = 13
            Caption = 'CNAE:'
          end
          object Label31: TLabel
            Left = 29
            Top = 219
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Email NFe:'
          end
          object Bevel1: TBevel
            Left = 0
            Top = 272
            Width = 584
            Height = 2
            Shape = bsTopLine
            Style = bsRaised
          end
          object Label32: TLabel
            Left = 9
            Top = 288
            Width = 68
            Height = 13
            Caption = 'Dt.Estoque:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label33: TLabel
            Left = 189
            Top = 276
            Width = 255
            Height = 26
            Caption = 
              'Esta data controla a entrada de materiais no estoque. '#13#10'S'#243' vai a' +
              'ceitar lan'#231'ar no estoque apartir desta data.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label38: TLabel
            Left = 9
            Top = 342
            Width = 134
            Height = 13
            Caption = 'Dt. Invent'#225'rio Materia Prima:'
          end
          object Label39: TLabel
            Left = 36
            Top = 366
            Width = 107
            Height = 13
            Caption = 'Dt. Invent'#225'rio Produto:'
          end
          object DBEdit2: TDBEdit
            Left = 82
            Top = 6
            Width = 332
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'Endereco'
            DataSource = DM1.dsFilial
            TabOrder = 0
          end
          object DBEdit3: TDBEdit
            Left = 82
            Top = 50
            Width = 252
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'Bairro'
            DataSource = DM1.dsFilial
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 398
            Top = 50
            Width = 83
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'Cep'
            DataSource = DM1.dsFilial
            TabOrder = 3
          end
          object RxDBLookupCombo6: TRxDBLookupCombo
            Left = 436
            Top = 72
            Width = 45
            Height = 21
            DropDownCount = 8
            DataField = 'Estado'
            DataSource = DM1.dsFilial
            LookupField = 'Sigla'
            LookupDisplay = 'Sigla'
            LookupSource = DM1.dsUF
            TabOrder = 5
          end
          object DBEdit6: TDBEdit
            Left = 82
            Top = 95
            Width = 83
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'Tel'
            DataSource = DM1.dsFilial
            TabOrder = 6
          end
          object DBEdit7: TDBEdit
            Left = 214
            Top = 95
            Width = 83
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'Tel2'
            DataSource = DM1.dsFilial
            TabOrder = 7
          end
          object DBEdit8: TDBEdit
            Left = 398
            Top = 95
            Width = 83
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'Fax'
            DataSource = DM1.dsFilial
            TabOrder = 8
          end
          object DBEdit9: TDBEdit
            Left = 82
            Top = 118
            Width = 162
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'CNPJ'
            DataSource = DM1.dsFilial
            TabOrder = 9
            OnExit = DBEdit9Exit
          end
          object DBEdit10: TDBEdit
            Left = 320
            Top = 118
            Width = 162
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'Inscr'
            DataSource = DM1.dsFilial
            TabOrder = 10
          end
          object DBEdit11: TDBEdit
            Left = 82
            Top = 189
            Width = 481
            Height = 21
            AutoSize = False
            DataField = 'Email'
            DataSource = DM1.dsFilial
            TabOrder = 14
          end
          object DBEdit12: TDBEdit
            Left = 107
            Top = 235
            Width = 456
            Height = 21
            AutoSize = False
            DataField = 'EndLogo'
            DataSource = DM1.dsFilial
            TabOrder = 16
          end
          object BitBtn20: TBitBtn
            Left = 81
            Top = 234
            Width = 25
            Height = 25
            Hint = 'Abre o caminho p/ localizar a foto'
            TabOrder = 18
            OnClick = BitBtn20Click
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
              55555575555555775F55509999999901055557F55555557F75F5001111111101
              105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
              01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
              8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
              0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
              0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
              05555555575FF777755555555500055555555555557775555555}
            NumGlyphs = 2
          end
          object RxDBLookupCombo3: TRxDBLookupCombo
            Left = 82
            Top = 73
            Width = 279
            Height = 21
            DropDownCount = 8
            DataField = 'CodCidade'
            DataSource = DM1.dsFilial
            LookupField = 'Codigo'
            LookupDisplay = 'Nome'
            LookupSource = DM1.dsCidade
            TabOrder = 4
            OnEnter = RxDBLookupCombo3Enter
          end
          object DBEdit15: TDBEdit
            Left = 82
            Top = 28
            Width = 83
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'NumEnd'
            DataSource = DM1.dsFilial
            TabOrder = 1
          end
          object DBEdit14: TDBEdit
            Left = 82
            Top = 142
            Width = 115
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'InscMunicipal'
            DataSource = DM1.dsFilial
            TabOrder = 11
          end
          object DBEdit16: TDBEdit
            Left = 82
            Top = 166
            Width = 481
            Height = 21
            AutoSize = False
            DataField = 'HomePage'
            DataSource = DM1.dsFilial
            TabOrder = 13
          end
          object DBEdit5: TDBEdit
            Left = 320
            Top = 142
            Width = 85
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'CNAE'
            DataSource = DM1.dsFilial
            TabOrder = 12
          end
          object DBEdit19: TDBEdit
            Left = 82
            Top = 211
            Width = 481
            Height = 21
            AutoSize = False
            DataField = 'EmailNFe'
            DataSource = DM1.dsFilial
            TabOrder = 15
          end
          object DBDateEdit1: TDBDateEdit
            Left = 80
            Top = 280
            Width = 104
            Height = 21
            TabStop = False
            DataField = 'DtEstoque'
            DataSource = DM1.dsFilial
            ReadOnly = True
            Color = clAqua
            NumGlyphs = 2
            TabOrder = 17
          end
          object DBDateEdit2: TDBDateEdit
            Left = 145
            Top = 336
            Width = 110
            Height = 21
            DataField = 'DtInventarioMat'
            DataSource = DM1.dsFilial
            NumGlyphs = 2
            TabOrder = 19
          end
          object DBDateEdit3: TDBDateEdit
            Left = 145
            Top = 360
            Width = 110
            Height = 21
            DataField = 'DtInventarioProd'
            DataSource = DM1.dsFilial
            NumGlyphs = 2
            TabOrder = 20
          end
        end
      end
      object TabSheet2: TRzTabSheet
        Caption = 'Tributos'
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 929
          Height = 505
          Align = alClient
          Enabled = False
          TabOrder = 0
          object Label7: TLabel
            Left = 4
            Top = 13
            Width = 86
            Height = 13
            Caption = 'Regime Tribut'#225'rio:'
          end
          object Label23: TLabel
            Left = 74
            Top = 183
            Width = 42
            Height = 13
            Caption = 'C'#243'd. Pis:'
          end
          object Label24: TLabel
            Left = 59
            Top = 227
            Width = 57
            Height = 13
            Caption = 'C'#243'd. Cofins:'
          end
          object Label25: TLabel
            Left = 422
            Top = 183
            Width = 41
            Height = 13
            Caption = 'Tipo Pis:'
          end
          object Label26: TLabel
            Left = 407
            Top = 227
            Width = 56
            Height = 13
            Caption = 'Tipo Cofins:'
          end
          object Label27: TLabel
            Left = 88
            Top = 205
            Width = 28
            Height = 13
            Caption = '% Pis:'
          end
          object Label28: TLabel
            Left = 73
            Top = 249
            Width = 43
            Height = 13
            Caption = '% Cofins:'
          end
          object Label29: TLabel
            Left = 24
            Top = 114
            Width = 92
            Height = 13
            Alignment = taRightJustify
            Caption = 'Situa'#231#227'o Tribut'#225'ria:'
          end
          object Label30: TLabel
            Left = 2
            Top = 136
            Width = 114
            Height = 13
            Alignment = taRightJustify
            Caption = 'Situa'#231#227'o Tribut'#225'ria (IPI):'
          end
          object Label37: TLabel
            Left = 80
            Top = 374
            Width = 41
            Height = 39
            Caption = 'Obs do'#13#10'Simples'#13#10'na Nota:'
          end
          object Label40: TLabel
            Left = 21
            Top = 159
            Width = 94
            Height = 13
            Alignment = taRightJustify
            Caption = 'Enquadramento IPI:'
          end
          object Label41: TLabel
            Left = 393
            Top = 155
            Width = 59
            Height = 13
            Caption = 'F5 Consultar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBCheckBox1: TDBCheckBox
            Left = 12
            Top = 36
            Width = 116
            Height = 17
            Caption = 'Simples Nacional'
            DataField = 'Simples'
            DataSource = DM1.dsFilial
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox4: TDBCheckBox
            Left = 12
            Top = 57
            Width = 98
            Height = 17
            Caption = 'Simpes Ga'#250'cho'
            DataField = 'SimplesGaucho'
            DataSource = DM1.dsFilial
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox5: TDBCheckBox
            Left = 12
            Top = 79
            Width = 133
            Height = 17
            Caption = 'Usar ICMS Simples'
            DataField = 'UsarICMSimples'
            DataSource = DM1.dsFilial
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox2: TDBCheckBox
            Left = 156
            Top = 57
            Width = 229
            Height = 17
            Caption = 'Imprime Corpo da Nota "Simpes Ga'#250'cho"'
            DataField = 'ImpSimplesGaucho'
            DataSource = DM1.dsFilial
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox3: TDBCheckBox
            Left = 388
            Top = 57
            Width = 98
            Height = 17
            Caption = 'C'#225'lcula IPI'
            DataField = 'CalculaIPI'
            DataSource = DM1.dsFilial
            TabOrder = 5
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object RxDBLookupCombo2: TRxDBLookupCombo
            Left = 92
            Top = 5
            Width = 445
            Height = 21
            DropDownCount = 8
            DataField = 'CodRegimeTrib'
            DataSource = DM1.dsFilial
            LookupField = 'Codigo'
            LookupDisplay = 'Codigo;Nome'
            LookupDisplayIndex = 1
            LookupSource = DMTabImposto.dsRegimeTrib
            TabOrder = 0
          end
          object RxDBLookupCombo5: TRxDBLookupCombo
            Left = 118
            Top = 175
            Width = 275
            Height = 21
            DropDownCount = 8
            DropDownWidth = 600
            DataField = 'CodPis'
            DataSource = DM1.dsFilial
            LookupField = 'Codigo'
            LookupDisplay = 'Codigo;Nome'
            LookupSource = DMTabImposto.dsTabPis
            TabOrder = 9
          end
          object RxDBLookupCombo4: TRxDBLookupCombo
            Left = 118
            Top = 219
            Width = 275
            Height = 21
            DropDownCount = 8
            DropDownWidth = 600
            DataField = 'CodCofins'
            DataSource = DM1.dsFilial
            LookupField = 'Codigo'
            LookupDisplay = 'Codigo;Nome'
            LookupSource = DMTabImposto.dsTabPis
            TabOrder = 12
          end
          object RxDBComboBox2: TRxDBComboBox
            Left = 465
            Top = 175
            Width = 120
            Height = 21
            Style = csDropDownList
            DataField = 'TipoPis'
            DataSource = DM1.dsFilial
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'Percentual'
              'Valor')
            TabOrder = 10
            Values.Strings = (
              'P'
              'V')
          end
          object RxDBComboBox3: TRxDBComboBox
            Left = 465
            Top = 219
            Width = 120
            Height = 21
            Style = csDropDownList
            DataField = 'TipoCofins'
            DataSource = DM1.dsFilial
            EnableValues = True
            ItemHeight = 13
            Items.Strings = (
              'Percentual'
              'Valor')
            TabOrder = 13
            Values.Strings = (
              'P'
              'V')
          end
          object DBEdit17: TDBEdit
            Left = 118
            Top = 197
            Width = 85
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'PercPis'
            DataSource = DM1.dsFilial
            TabOrder = 11
          end
          object DBEdit18: TDBEdit
            Left = 118
            Top = 241
            Width = 85
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'PercCofins'
            DataSource = DM1.dsFilial
            TabOrder = 14
          end
          object RxDBLookupCombo7: TRxDBLookupCombo
            Left = 118
            Top = 106
            Width = 275
            Height = 21
            DropDownCount = 8
            DropDownWidth = 500
            DataField = 'CodSitTrib'
            DataSource = DM1.dsFilial
            LookupField = 'Codigo'
            LookupDisplay = 'CodSit;SitTributaria'
            LookupSource = DM1.dsSitTributaria
            TabOrder = 6
          end
          object RxDBLookupCombo8: TRxDBLookupCombo
            Left = 118
            Top = 128
            Width = 275
            Height = 22
            DropDownCount = 8
            DropDownWidth = 500
            DataField = 'CodCSTIPI'
            DataSource = DM1.dsFilial
            LookupField = 'Codigo'
            LookupDisplay = 'Codigo;Nome'
            LookupSource = DM1.dsCSTIPI
            TabOrder = 7
          end
          object GroupBox1: TGroupBox
            Left = 675
            Top = 147
            Width = 177
            Height = 112
            Caption = ' % Tributos Le 12.741/12 '
            TabOrder = 15
            object Label54: TLabel
              Left = 13
              Top = 28
              Width = 87
              Height = 13
              Caption = '% Industrializa'#231#227'o:'
            end
            object Label56: TLabel
              Left = 42
              Top = 45
              Width = 58
              Height = 13
              Caption = '% Com'#233'rcio:'
            end
            object Label57: TLabel
              Left = 18
              Top = 75
              Width = 82
              Height = 13
              Caption = '% Ind. Importado:'
            end
            object Label58: TLabel
              Left = 15
              Top = 93
              Width = 85
              Height = 13
              Caption = '% Com.Importado:'
            end
            object DBEdit35: TDBEdit
              Left = 101
              Top = 20
              Width = 59
              Height = 19
              Ctl3D = False
              DataField = 'Perc_Trib_NTS_Ind'
              DataSource = DM1.dsFilial
              ParentCtl3D = False
              TabOrder = 0
            end
            object DBEdit37: TDBEdit
              Left = 101
              Top = 38
              Width = 59
              Height = 19
              Ctl3D = False
              DataField = 'Perc_Trib_NTS_Ven'
              DataSource = DM1.dsFilial
              ParentCtl3D = False
              TabOrder = 1
            end
            object DBEdit38: TDBEdit
              Left = 101
              Top = 68
              Width = 59
              Height = 19
              Ctl3D = False
              DataField = 'Perc_Trib_NTS_Ind_Exp'
              DataSource = DM1.dsFilial
              ParentCtl3D = False
              TabOrder = 2
            end
            object DBEdit39: TDBEdit
              Left = 101
              Top = 86
              Width = 59
              Height = 19
              Ctl3D = False
              DataField = 'Perc_Trib_NTS_Ven_Exp'
              DataSource = DM1.dsFilial
              ParentCtl3D = False
              TabOrder = 3
            end
          end
          object DBMemo1: TDBMemo
            Left = 128
            Top = 368
            Width = 449
            Height = 89
            DataField = 'ObsSimples'
            DataSource = DM1.dsFilial
            ScrollBars = ssVertical
            TabOrder = 16
          end
          object RxDBLookupCombo10: TRxDBLookupCombo
            Left = 117
            Top = 151
            Width = 275
            Height = 22
            DropDownCount = 8
            DropDownWidth = 700
            DataField = 'ID_EnqIPI'
            DataSource = DM1.dsFilial
            LookupField = 'ID'
            LookupDisplay = 'CODIGO;DESCRICAO'
            LookupSource = DMTabEnqIPI.dsEnqIPI
            TabOrder = 8
            OnKeyDown = RxDBLookupCombo10KeyDown
          end
        end
      end
      object TabSheet3: TRzTabSheet
        Caption = 'Dependente'
        object SMDBGrid1: TSMDBGrid
          Left = 0
          Top = 45
          Width = 929
          Height = 460
          Align = alClient
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 11
          DefaultRowHeight = 17
          ScrollBars = ssHorizontal
          ColCount = 3
          RowCount = 2
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CodFilialDep'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lkNomeFilialDep'
              Title.Alignment = taCenter
              Title.Caption = 'Nome Filial'
              Visible = True
            end>
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 929
          Height = 45
          Align = alTop
          Enabled = False
          TabOrder = 1
          object Label34: TLabel
            Left = 96
            Top = 3
            Width = 20
            Height = 13
            Caption = 'Filial'
          end
          object SpeedButton3: TSpeedButton
            Left = 288
            Top = 15
            Width = 30
            Height = 25
            Hint = 'Cancela a inser'#231#227'o de um item'
            Glyph.Data = {
              CE070000424DCE07000000000000360000002800000024000000120000000100
              18000000000098070000CE0E0000C40E00000000000000000000008080008080
              0080800080800080800080800080800080800080800080800080800080800080
              8000808000808000808000808000808000808000808000808000808000808000
              8080008080008080008080008080008080008080008080008080008080008080
              0080800080800080800080800080800080808080808080800080800080800080
              8000808000808000808000808000808000808000808000808000808000808000
              8080008080008080008080FFFFFF008080008080008080008080008080008080
              0080800080800080800080800080800080800080800080800080800000FF0000
              800000808080800080800080800080800080800080800000FF80808000808000
              8080008080008080008080008080008080008080808080808080FFFFFF008080
              008080008080008080008080008080FFFFFF0080800080800080800080800080
              800080800080800000FF00008000008000008080808000808000808000808000
              00FF000080000080808080008080008080008080008080008080008080808080
              FFFFFF008080808080FFFFFF008080008080008080FFFFFF808080808080FFFF
              FF0080800080800080800080800080800080800000FF00008000008000008000
              00808080800080800000FF000080000080000080000080808080008080008080
              008080008080008080808080FFFFFF008080008080808080FFFFFF008080FFFF
              FF808080008080008080808080FFFFFF00808000808000808000808000808000
              80800000FF000080000080000080000080808080000080000080000080000080
              000080808080008080008080008080008080008080808080FFFFFF0080800080
              80008080808080FFFFFF808080008080008080008080008080808080FFFFFF00
              80800080800080800080800080800080800000FF000080000080000080000080
              0000800000800000800000808080800080800080800080800080800080800080
              80008080808080FFFFFF00808000808000808080808000808000808000808000
              8080FFFFFF808080008080008080008080008080008080008080008080008080
              0000FF0000800000800000800000800000800000808080800080800080800080
              80008080008080008080008080008080008080808080FFFFFF00808000808000
              8080008080008080008080FFFFFF808080008080008080008080008080008080
              0080800080800080800080800080800000800000800000800000800000808080
              8000808000808000808000808000808000808000808000808000808000808000
              8080808080FFFFFF008080008080008080008080008080808080008080008080
              0080800080800080800080800080800080800080800080800080800000FF0000
              8000008000008000008080808000808000808000808000808000808000808000
              8080008080008080008080008080008080808080FFFFFF008080008080008080
              8080800080800080800080800080800080800080800080800080800080800080
              800080800000FF00008000008000008000008000008080808000808000808000
              8080008080008080008080008080008080008080008080008080008080808080
              008080008080008080008080808080FFFFFF0080800080800080800080800080
              800080800080800080800080800000FF00008000008000008080808000008000
              0080000080808080008080008080008080008080008080008080008080008080
              008080008080808080008080008080008080008080008080808080FFFFFF0080
              800080800080800080800080800080800080800080800000FF00008000008000
              00808080800080800000FF000080000080000080808080008080008080008080
              008080008080008080008080008080808080008080008080008080808080FFFF
              FF008080008080808080FFFFFF00808000808000808000808000808000808000
              80800000FF0000800000808080800080800080800080800000FF000080000080
              000080808080008080008080008080008080008080008080808080FFFFFF0080
              80008080808080008080808080FFFFFF008080008080808080FFFFFF00808000
              80800080800080800080800080800080800000FF000080008080008080008080
              0080800080800000FF0000800000800000800080800080800080800080800080
              80008080808080FFFFFFFFFFFF808080008080008080008080808080FFFFFF00
              8080008080808080FFFFFF008080008080008080008080008080008080008080
              0080800080800080800080800080800080800080800000FF0000800000FF0080
              8000808000808000808000808000808000808080808080808000808000808000
              8080008080008080808080FFFFFFFFFFFFFFFFFF808080008080008080008080
              0080800080800080800080800080800080800080800080800080800080800080
              8000808000808000808000808000808000808000808000808000808000808000
              8080008080008080008080008080008080008080008080808080808080808080
              0080800080800080800080800080800080800080800080800080800080800080
              8000808000808000808000808000808000808000808000808000808000808000
              8080008080008080008080008080008080008080008080008080008080008080
              008080008080008080008080008080008080}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton3Click
          end
          object SpeedButton4: TSpeedButton
            Left = 318
            Top = 15
            Width = 30
            Height = 25
            Hint = 'Exclui o item selecionado ao lado'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
              3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
              33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
              33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
              333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
              03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
              33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
              0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
              3333333337FFF7F3333333333000003333333333377777333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton4Click
          end
          object RxDBLookupCombo9: TRxDBLookupCombo
            Left = 0
            Top = 19
            Width = 257
            Height = 21
            DropDownCount = 8
            LookupField = 'Codigo'
            LookupDisplay = 'Empresa'
            LookupSource = dsFilial2
            TabOrder = 0
          end
          object BitBtn7: TBitBtn
            Left = 258
            Top = 15
            Width = 30
            Height = 25
            Hint = 'Confirma a inser'#231#227'o de um item'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = BitBtn7Click
            Glyph.Data = {
              CE070000424DCE07000000000000360000002800000024000000120000000100
              18000000000098070000CE0E0000D80E00000000000000000000008080008080
              0080800080800080800080800080800080800080800080800080800080800080
              8000808000808000808000808000808000808000808000808000808000808000
              8080008080008080008080008080008080008080008080008080008080008080
              0080800080800080800080800080800080800080800080800080800080800080
              8000808000808000808000808000808000808000808000808000808000808000
              8080008080008080008080008080FFFFFF008080008080008080008080008080
              0080800080800080800080800080800080800080800080800080800080800080
              8080000080000000808000808000808000808000808000808000808000808000
              8080008080008080008080008080008080008080008080808080808080FFFFFF
              FFFFFF0080800080800080800080800080800080800080800080800080800080
              8000808000808000808080000000800000800080000000808000808000808000
              8080008080008080008080008080008080008080008080008080008080008080
              808080808080808080808080FFFFFFFFFFFF0080800080800080800080800080
              8000808000808000808000808000808000808080000000800000800000800000
              8000800000008080008080008080008080008080008080008080008080008080
              008080008080008080808080808080808080808080808080808080FFFFFFFFFF
              FF00808000808000808000808000808000808000808000808000808080000000
              8000008000008000008000008000008000800000008080008080008080008080
              0080800080800080800080800080800080808080808080808080808080808080
              80808080808080808080808080FFFFFF00808000808000808000808000808000
              808000808080000000800000800000800000FF00008000008000008000008000
              8000000080800080800080800080800080800080800080800080808080808080
              80808080808080FFFFFF808080808080808080808080808080FFFFFF00808000
              808000808000808000808000808000808000800000800000800000FF00008080
              00FF000080000080000080008000000080800080800080800080800080800080
              80008080008080808080808080808080FFFFFF008080FFFFFF80808080808080
              8080808080FFFFFFFFFFFF00808000808000808000808000808000808000FF00
              00800000FF0000808000808000808000FF000080000080000080008000000080
              80008080008080008080008080008080008080808080808080FFFFFF00808000
              8080008080FFFFFF808080808080808080808080FFFFFFFFFFFF008080008080
              00808000808000808000808000FF0000808000808000808000808000808000FF
              0000800000800000800080000000808000808000808000808000808000808000
              8080FFFFFF008080008080008080008080008080FFFFFF808080808080808080
              808080FFFFFFFFFFFF0080800080800080800080800080800080800080800080
              8000808000808000808000808000FF0000800000800000800080000000808000
              8080008080008080008080008080008080008080008080008080008080008080
              008080FFFFFF808080808080808080808080FFFFFFFFFFFF0080800080800080
              8000808000808000808000808000808000808000808000808000808000FF0000
              8000008000008000800000008080008080008080008080008080008080008080
              008080008080008080008080008080008080FFFFFF8080808080808080808080
              80FFFFFF00808000808000808000808000808000808000808000808000808000
              808000808000808000808000FF00008000008000008000800000008080008080
              0080800080800080800080800080800080800080800080800080800080800080
              80FFFFFF808080808080808080808080FFFFFF00808000808000808000808000
              808000808000808000808000808000808000808000808000808000FF00008000
              0080000080008000000080800080800080800080800080800080800080800080
              80008080008080008080008080008080FFFFFF808080808080808080808080FF
              FFFF008080008080008080008080008080008080008080008080008080008080
              00808000808000808000FF000080000080008000000080800080800080800080
              80008080008080008080008080008080008080008080008080008080008080FF
              FFFF808080808080808080008080008080008080008080008080008080008080
              00808000808000808000808000808000808000808000808000FF000080000080
              0000808000808000808000808000808000808000808000808000808000808000
              8080008080008080008080008080FFFFFF808080808080008080008080008080
              0080800080800080800080800080800080800080800080800080800080800080
              8000808000808000FF0000808000808000808000808000808000808000808000
              8080008080008080008080008080008080008080008080008080008080FFFFFF
              0080800080800080800080800080800080800080800080800080800080800080
              8000808000808000808000808000808000808000808000808000808000808000
              8080008080008080008080008080008080008080008080008080008080008080
              008080008080008080008080008080008080}
            NumGlyphs = 2
          end
        end
      end
      object TabSheet4: TRzTabSheet
        Caption = 'Downloads XML'
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 929
          Height = 45
          Align = alTop
          Enabled = False
          TabOrder = 0
          object Label35: TLabel
            Left = 176
            Top = 3
            Width = 52
            Height = 13
            Caption = 'CNPJ/CPF'
          end
          object SpeedButton5: TSpeedButton
            Left = 335
            Top = 15
            Width = 30
            Height = 25
            Hint = 'Exclui o item selecionado ao lado'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
              3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
              33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
              33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
              333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
              03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
              33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
              0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
              3333333337FFF7F3333333333000003333333333377777333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton5Click
          end
          object Label36: TLabel
            Left = 40
            Top = 2
            Width = 35
            Height = 13
            Caption = 'Pessoa'
          end
          object BitBtn6: TBitBtn
            Left = 307
            Top = 15
            Width = 30
            Height = 25
            Hint = 'Confirma a inser'#231#227'o de um item'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = BitBtn6Click
            Glyph.Data = {
              CE070000424DCE07000000000000360000002800000024000000120000000100
              18000000000098070000CE0E0000D80E00000000000000000000008080008080
              0080800080800080800080800080800080800080800080800080800080800080
              8000808000808000808000808000808000808000808000808000808000808000
              8080008080008080008080008080008080008080008080008080008080008080
              0080800080800080800080800080800080800080800080800080800080800080
              8000808000808000808000808000808000808000808000808000808000808000
              8080008080008080008080008080FFFFFF008080008080008080008080008080
              0080800080800080800080800080800080800080800080800080800080800080
              8080000080000000808000808000808000808000808000808000808000808000
              8080008080008080008080008080008080008080008080808080808080FFFFFF
              FFFFFF0080800080800080800080800080800080800080800080800080800080
              8000808000808000808080000000800000800080000000808000808000808000
              8080008080008080008080008080008080008080008080008080008080008080
              808080808080808080808080FFFFFFFFFFFF0080800080800080800080800080
              8000808000808000808000808000808000808080000000800000800000800000
              8000800000008080008080008080008080008080008080008080008080008080
              008080008080008080808080808080808080808080808080808080FFFFFFFFFF
              FF00808000808000808000808000808000808000808000808000808080000000
              8000008000008000008000008000008000800000008080008080008080008080
              0080800080800080800080800080800080808080808080808080808080808080
              80808080808080808080808080FFFFFF00808000808000808000808000808000
              808000808080000000800000800000800000FF00008000008000008000008000
              8000000080800080800080800080800080800080800080800080808080808080
              80808080808080FFFFFF808080808080808080808080808080FFFFFF00808000
              808000808000808000808000808000808000800000800000800000FF00008080
              00FF000080000080000080008000000080800080800080800080800080800080
              80008080008080808080808080808080FFFFFF008080FFFFFF80808080808080
              8080808080FFFFFFFFFFFF00808000808000808000808000808000808000FF00
              00800000FF0000808000808000808000FF000080000080000080008000000080
              80008080008080008080008080008080008080808080808080FFFFFF00808000
              8080008080FFFFFF808080808080808080808080FFFFFFFFFFFF008080008080
              00808000808000808000808000FF0000808000808000808000808000808000FF
              0000800000800000800080000000808000808000808000808000808000808000
              8080FFFFFF008080008080008080008080008080FFFFFF808080808080808080
              808080FFFFFFFFFFFF0080800080800080800080800080800080800080800080
              8000808000808000808000808000FF0000800000800000800080000000808000
              8080008080008080008080008080008080008080008080008080008080008080
              008080FFFFFF808080808080808080808080FFFFFFFFFFFF0080800080800080
              8000808000808000808000808000808000808000808000808000808000FF0000
              8000008000008000800000008080008080008080008080008080008080008080
              008080008080008080008080008080008080FFFFFF8080808080808080808080
              80FFFFFF00808000808000808000808000808000808000808000808000808000
              808000808000808000808000FF00008000008000008000800000008080008080
              0080800080800080800080800080800080800080800080800080800080800080
              80FFFFFF808080808080808080808080FFFFFF00808000808000808000808000
              808000808000808000808000808000808000808000808000808000FF00008000
              0080000080008000000080800080800080800080800080800080800080800080
              80008080008080008080008080008080FFFFFF808080808080808080808080FF
              FFFF008080008080008080008080008080008080008080008080008080008080
              00808000808000808000FF000080000080008000000080800080800080800080
              80008080008080008080008080008080008080008080008080008080008080FF
              FFFF808080808080808080008080008080008080008080008080008080008080
              00808000808000808000808000808000808000808000808000FF000080000080
              0000808000808000808000808000808000808000808000808000808000808000
              8080008080008080008080008080FFFFFF808080808080008080008080008080
              0080800080800080800080800080800080800080800080800080800080800080
              8000808000808000FF0000808000808000808000808000808000808000808000
              8080008080008080008080008080008080008080008080008080008080FFFFFF
              0080800080800080800080800080800080800080800080800080800080800080
              8000808000808000808000808000808000808000808000808000808000808000
              8080008080008080008080008080008080008080008080008080008080008080
              008080008080008080008080008080008080}
            NumGlyphs = 2
          end
          object ComboBox1: TComboBox
            Left = 4
            Top = 16
            Width = 125
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnExit = ComboBox1Exit
            Items.Strings = (
              'Jur'#237'dica'
              'F'#237'sica')
          end
          object MaskEdit1: TMaskEdit
            Left = 129
            Top = 16
            Width = 177
            Height = 21
            TabOrder = 1
            OnExit = MaskEdit1Exit
          end
        end
        object SMDBGrid2: TSMDBGrid
          Left = 0
          Top = 45
          Width = 929
          Height = 460
          Align = alClient
          DataSource = DM1.dsFilial_Download
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 1
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
          ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 11
          DefaultRowHeight = 17
          ScrollBars = ssHorizontal
          ColCount = 3
          RowCount = 2
          Columns = <
            item
              Expanded = False
              FieldName = 'Pessoa'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNPJ_CPF'
              Width = 179
              Visible = True
            end>
        end
      end
      object TS_Config_Danfe_NFe: TRzTabSheet
        Caption = 'Configura'#231#227'o Danfe NFeConfig'
        object pnlConfig_Danfe_NFe: TPanel
          Left = 0
          Top = 0
          Width = 929
          Height = 471
          Align = alClient
          Enabled = False
          TabOrder = 0
          object gbxCertificado: TRzGroupBox
            Left = 1
            Top = 1
            Width = 927
            Height = 76
            Align = alTop
            BorderColor = clNavy
            BorderInner = fsButtonUp
            BorderOuter = fsBump
            Caption = ' Certificado '
            Ctl3D = True
            FlatColor = clNavy
            FlatColorAdjustment = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            VisualStyle = vsGradient
            object Label67: TLabel
              Left = 48
              Top = 38
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Licen'#231'a:'
            end
            object Label68: TLabel
              Left = 16
              Top = 20
              Width = 74
              Height = 13
              Alignment = taRightJustify
              Caption = 'Validade Inicial:'
            end
            object Label69: TLabel
              Left = 309
              Top = 20
              Width = 69
              Height = 13
              Alignment = taRightJustify
              Caption = 'Validade Final:'
            end
            object Label70: TLabel
              Left = 42
              Top = 56
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ambiente:'
            end
            object DBEdit44: TDBEdit
              Left = 91
              Top = 32
              Width = 633
              Height = 19
              Color = clSilver
              Ctl3D = False
              DataField = 'LICENCA'
              DataSource = DMNFeConfig.dsConfig_NFe
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit45: TDBEdit
              Left = 91
              Top = 14
              Width = 206
              Height = 19
              Color = clSilver
              Ctl3D = False
              DataField = 'VALIDADE_INICIO'
              DataSource = DMNFeConfig.dsConfig_NFe
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit46: TDBEdit
              Left = 379
              Top = 14
              Width = 206
              Height = 19
              Color = clSilver
              Ctl3D = False
              DataField = 'VALIDADE_FIM'
              DataSource = DMNFeConfig.dsConfig_NFe
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 2
            end
            object Edit1: TEdit
              Left = 91
              Top = 50
              Width = 121
              Height = 19
              Color = clSilver
              Ctl3D = False
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 3
            end
          end
          object RzGroupBox1: TRzGroupBox
            Left = 1
            Top = 77
            Width = 927
            Height = 393
            Align = alClient
            BorderColor = clNavy
            BorderInner = fsButtonUp
            BorderOuter = fsBump
            Caption = ' Danfe '
            Ctl3D = True
            FlatColor = clNavy
            FlatColorAdjustment = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            VisualStyle = vsGradient
            object Label72: TLabel
              Left = 50
              Top = 22
              Width = 88
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dados do Emissor:'
            end
            object Label71: TLabel
              Left = 63
              Top = 46
              Width = 75
              Height = 13
              Alignment = taRightJustify
              Caption = 'Imprimir Recibo:'
            end
            object Label73: TLabel
              Left = 67
              Top = 68
              Width = 71
              Height = 13
              Alignment = taRightJustify
              Caption = 'Imprimir Fatura:'
            end
            object Label74: TLabel
              Left = 48
              Top = 90
              Width = 90
              Height = 13
              Alignment = taRightJustify
              Caption = 'Separador do Item:'
            end
            object Label75: TLabel
              Left = 466
              Top = 40
              Width = 343
              Height = 65
              Caption = 
                'O Campo "Dados do Emissor" se deixar em branco o sistema '#13#10'vai i' +
                'mprimir os dados do XML (dados do emitente).'#13#10'Para informar o Lo' +
                'gotipo, '#233' necess'#225'rio informar os dados do emitente no '#13#10'Logo. A ' +
                'imagem deve ser um arquivo jpg de  339 x 114 pixels.'#13#10'Dever'#225' con' +
                'ter todas as informa'#231#245'es cadastrais da empresa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label77: TLabel
              Left = 43
              Top = 154
              Width = 95
              Height = 13
              Alignment = taRightJustify
              Caption = 'Imprime no Rodap'#233':'
            end
            object Label84: TLabel
              Left = 248
              Top = 243
              Width = 186
              Height = 13
              Caption = 'Informe o caracter para quebrar a linha:'
            end
            object Label85: TLabel
              Left = 35
              Top = 134
              Width = 247
              Height = 13
              Caption = 'Quantidade de casas decimais na Qtde. do Produto:'
            end
            object Label86: TLabel
              Left = 408
              Top = 129
              Width = 24
              Height = 13
              Caption = '0 a 4'
            end
            object Label76: TLabel
              Left = 109
              Top = 112
              Width = 173
              Height = 13
              Alignment = taRightJustify
              Caption = 'Altura do quadro do recibo (18 a 40):'
            end
            object DBEdit48: TDBEdit
              Left = 141
              Top = 15
              Width = 517
              Height = 21
              Ctl3D = True
              DataField = 'DANFE_DADOS_EMISSOR'
              DataSource = DMNFeConfig.dsConfig_NFe
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 0
            end
            object BitBtn8: TBitBtn
              Left = 659
              Top = 11
              Width = 25
              Height = 23
              TabOrder = 1
              OnClick = BitBtn2Click
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
                55555575555555775F55509999999901055557F55555557F75F5001111111101
                105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
                01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
                8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
                0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
                0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
                05555555575FF777755555555500055555555555557775555555}
              NumGlyphs = 2
            end
            object RxDBComboBox13: TRxDBComboBox
              Left = 141
              Top = 37
              Width = 145
              Height = 21
              Style = csDropDownList
              DataField = 'DANFE_QUADRO_RECIBO'
              DataSource = DMNFeConfig.dsConfig_NFe
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Superior'
                'Inferior')
              TabOrder = 2
              Values.Strings = (
                'S'
                'I')
            end
            object RxDBComboBox14: TRxDBComboBox
              Left = 141
              Top = 59
              Width = 145
              Height = 21
              Style = csDropDownList
              DataField = 'DANFE_QUADRO_FATURA'
              DataSource = DMNFeConfig.dsConfig_NFe
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Sim'
                'N'#227'o')
              TabOrder = 3
              Values.Strings = (
                'S'
                'N')
            end
            object RxDBComboBox15: TRxDBComboBox
              Left = 141
              Top = 81
              Width = 145
              Height = 21
              Style = csDropDownList
              DataField = 'DANFE_SEPARADOR_ITEM'
              DataSource = DMNFeConfig.dsConfig_NFe
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'Linha'
                'Tracejado'
                'Espa'#231'o em Branco'
                'Zebrado')
              TabOrder = 4
              Values.Strings = (
                'l'
                't'
                'b'
                'z')
            end
            object DBEdit47: TDBEdit
              Left = 141
              Top = 147
              Width = 517
              Height = 21
              Ctl3D = True
              DataField = 'DANFE_RODAPE'
              DataSource = DMNFeConfig.dsConfig_NFe
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 7
            end
            object DBEdit49: TDBEdit
              Left = 436
              Top = 239
              Width = 121
              Height = 21
              DataField = 'DANFE_CARACTER_SALTAR_LINHA'
              DataSource = DMNFeConfig.dsConfig_NFe
              TabOrder = 13
            end
            object DBEdit50: TDBEdit
              Left = 284
              Top = 126
              Width = 121
              Height = 21
              DataField = 'DANFE_QTRIBDEC'
              DataSource = DMNFeConfig.dsConfig_NFe
              TabOrder = 6
            end
            object DBCheckBox6: TDBCheckBox
              Left = 144
              Top = 170
              Width = 569
              Height = 17
              Caption = 'N'#227'o gera a coluna de desconto'
              DataField = 'DANFE_SEM_COLUNA_DESCONTO'
              DataSource = DMNFeConfig.dsConfig_NFe
              TabOrder = 8
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox7: TDBCheckBox
              Left = 144
              Top = 188
              Width = 569
              Height = 17
              Caption = 
                'Indica que os dados da fatura devem ser impressos em informa'#231#245'es' +
                ' adicionais'
              DataField = 'DANFE_COM_FATURA'
              DataSource = DMNFeConfig.dsConfig_NFe
              TabOrder = 9
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox8: TDBCheckBox
              Left = 144
              Top = 205
              Width = 569
              Height = 17
              Caption = 
                'N'#227'o imprime os dados do emitente para atender quem tem impresso ' +
                'personalizado'
              DataField = 'DANFE_SEM_DADOS_EMITENTE'
              DataSource = DMNFeConfig.dsConfig_NFe
              TabOrder = 10
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox9: TDBCheckBox
              Left = 144
              Top = 222
              Width = 569
              Height = 17
              Caption = 
                'N'#227'o imprime os dados do emitente e nem o quadro do emitente para' +
                ' atender quem tem impresso personalizado'
              DataField = 'DANFE_SEM_QUADRO_EMITENTE'
              DataSource = DMNFeConfig.dsConfig_NFe
              TabOrder = 11
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox10: TDBCheckBox
              Left = 144
              Top = 240
              Width = 97
              Height = 17
              Caption = 'Saltar Linha'
              DataField = 'DANFE_SALTAR_LINHA'
              DataSource = DMNFeConfig.dsConfig_NFe
              TabOrder = 12
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox11: TDBCheckBox
              Left = 144
              Top = 258
              Width = 569
              Height = 17
              Caption = 'Imprimir ST na linha dos produtos (vai criar uma coluna)'
              DataField = 'DANFE_MOSTRAR_ST'
              DataSource = DMNFeConfig.dsConfig_NFe
              TabOrder = 14
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox12: TDBCheckBox
              Left = 144
              Top = 275
              Width = 569
              Height = 17
              Caption = 'Omitir o quadro de reservado ao fisco'
              DataField = 'DANFE_OMITIR_RESER_AO_FISCO'
              DataSource = DMNFeConfig.dsConfig_NFe
              TabOrder = 15
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox13: TDBCheckBox
              Left = 144
              Top = 292
              Width = 569
              Height = 17
              Caption = 
                'Imprimir a coluna valor do tributo, mesmo quando n'#227'o houver info' +
                'rma'#231#227'o'
              DataField = 'DANFE_IMP_COLUNA_TRIB_SEM_INF'
              DataSource = DMNFeConfig.dsConfig_NFe
              TabOrder = 16
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox14: TDBCheckBox
              Left = 144
              Top = 308
              Width = 569
              Height = 17
              Caption = 
                'N'#227'o imprimir de 0,00 e 0 do BC ICMS, VALOR ICMS e Aliq ICMS quan' +
                'do os valores forem zero'
              DataField = 'DANFE_NAO_GERAR_ZEROS_ICMS'
              DataSource = DMNFeConfig.dsConfig_NFe
              TabOrder = 17
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox15: TDBCheckBox
              Left = 144
              Top = 324
              Width = 569
              Height = 17
              Caption = 
                'n'#227'o impress'#227'o de 0,00 e 0 do VALOR IPI e Aliq IPI quando os valo' +
                'res forem zero'
              DataField = 'DANFE_NAO_GERAR_ZEROS_IPI'
              DataSource = DMNFeConfig.dsConfig_NFe
              TabOrder = 18
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox16: TDBCheckBox
              Left = 144
              Top = 340
              Width = 569
              Height = 17
              Caption = 'N'#227'o gerar os dados do local de entrega'
              DataField = 'DANFE_NAO_GERAR_DADOS_ENTREGA'
              DataSource = DMNFeConfig.dsConfig_NFe
              TabOrder = 19
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox17: TDBCheckBox
              Left = 144
              Top = 356
              Width = 569
              Height = 17
              Caption = 'N'#227'o gerar os dados do local de retirada'
              DataField = 'DANFE_NAO_GERAR_DADOS_RETIRADA'
              DataSource = DMNFeConfig.dsConfig_NFe
              TabOrder = 20
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox18: TDBCheckBox
              Left = 144
              Top = 374
              Width = 569
              Height = 17
              Caption = 'Mostrar FCI na descri'#231#227'o do Produto'
              DataField = 'DANFE_MOSTRAR_FCI'
              DataSource = DMNFeConfig.dsConfig_NFe
              TabOrder = 21
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBEdit51: TDBEdit
              Left = 284
              Top = 104
              Width = 121
              Height = 21
              DataField = 'DANFE_ALTQUADRORECIBO'
              DataSource = DMNFeConfig.dsConfig_NFe
              TabOrder = 5
            end
          end
        end
        object Panel10: TPanel
          Left = 0
          Top = 471
          Width = 929
          Height = 34
          Align = alBottom
          Color = 8404992
          TabOrder = 1
          object btnConfirmar_Config_NFe: TNxButton
            Left = 220
            Top = 2
            Width = 210
            Height = 30
            Caption = 'Confirmar Configura'#231#227'o'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = []
            Glyph.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFF3F9F4C6CEC7799D7C4D7B4D235C241C561C225E
              224B7B507B9C7CC6CEC7F4F9F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95A996456A443E663E29682B306B30
              3871373B713A386C3731643129642B3D663D456C4494AA97FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFEFFFFFFFFFFFFFF4E794D2A602A4F844F0F
              5E0F055A08005001015004014E03004B01004700054C050E4C0E4D774F2B622A
              4C7A4EFFFFFFFFFFFFFEFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF4868483F6E
              402F7B30005400045C07075A0B06590906550907550A075309064F08034C0601
              4B03003D002E64303F6C4349694DFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
              4D7A4E3E6B3F207723005B0208610E075F0B065B0900560105570907550A0854
              0B085109054F07064C07034C080042001E5B1D3D6B414D7B4FFFFFFFFFFFFF00
              0000FFFFFF97AA992A6028308833006400076809076508056308005600397739
              04550500550505560707540B065309065008044D06034D050042002F65312860
              2898AA99FFFFFF000000F5F9F64266464F9051006100066B0C07690A07670A00
              54004B854CFFFFFFA6C1A6004D0000550306550908530A075209065007044C05
              044B09003E004E7850456D46F6F9F6000000C6CEC63F6640107C12056D09066C
              0A056A0A0059003C7F3BFFFFFFFFFFFFFFFFFFABC6AD004D0203550605550908
              550B065209054F07044C06014C040D4C0F3B643CC6CFC600000079997A37823A
              2183260F761407720E005E00559256FFFFFFFFFFFFFEFEFEFEFFFEFFFFFFBED2
              C0004A0002540506560806540907530A064F08034D05054C062A632B7DA08000
              00004A7B4D4C954F29892F218426006500639E66FFFFFFFFFFFFFEFEFFFFFFFF
              FFFFFFFFFEFFFFFFFFA6C1A8004B0002550506550907540A085209054F080047
              002E6330517E52000000245E2767AE6D39964028872D79B37DFFFFFFF7F9F9F9
              FCFAFFFFFFD2DFD1FCFEFDFFFFFFFFFFFFFFFFFFBED2C0014E02005503055608
              07540A075309004C01376C3427612A0000001F562078BA80479F4D449948DFEF
              DFF6FBF8F0F4EDFFFFFFB4CFB5004F00639663FFFFFFFFFFFFFEFEFFFFFFFFAD
              C6B0014D0200550207540A07540A014E033970371B561C000000275E2782BF87
              5DAA604DA0533D9141F1FAF0FFFFFFBAD4B8005B00006A04005A00689967FFFF
              FFFFFFFFFEFFFFFFFFFFA9C4AC004B00015605065509014F0436723529602900
              000048764A7DB18171B87565B16957A55A519E56A2CCA4248729177A20016D06
              056E0A005400568C55FFFFFFFFFFFFFFFFFEFFFFFFC0D6C30048000055040052
              022E6C2E517D530000007494746B9F6F89C88B75B7776BB26F5BA85F45994C4E
              9C51429748258227006604006E090056006E9C6DFFFFFFFFFFFFFEFEFFFFFFFF
              B3C9B4145F150157062A682D7B9F80000000C4CCC4476C46A0D3A382C3887EBC
              8072B67569AE6B5DA76153A2554E9D52358F3A0B7110006C030055005B8E59FF
              FFFFFFFFFFFFFFFFAEC9B00053000D600F3E653EC6CFC6000000F6FBF72E572F
              B5CFB495CC9B8FC69183BF8779B97C6EB17263AA675AA45D519E5446984E2885
              2D0C7413005100639261FFFFFFB6D0B50044000051004D8452456A45F6FBF700
              0000FFFFFF9BAA9A1F571FDBF9DD99CC9C92C79789C28A7DB98271B37868AD6B
              5CA661549F5B4C9A503F8F422F89350D6D143A8537006208005900338035295C
              299BAE9AFFFFFF000000FEFFFFFFFFFF45744B507850D2F0D2A1D0A798CC9D91
              C79384C0887CBA8070B27466AD685CA460519C5546954B3F8F432B83321E7922
              36873B3E6C3E4E7C51FFFFFFFFFEFF000000FFFFFFFFFFFFFFFFFF4160404F77
              4FE9FFEAAAD7AE9FCEA093C7988AC28D81BA8376B5786CAD6F60A664569D5A49
              984D32893961A8653B6C3C476848FFFFFFFFFFFFFFFFFF000000FFFFFFFFFEFF
              FFFFFFFFFFFF45744A20561EC3D8C3C0E5C3B1DDB69ED0A493C69587BF8A7EBA
              7F71B37570B37564AB6B81AE822259234F7A4FFFFFFFFFFFFFFFFFFEFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BAB9B29552C466B4985AA849EC5A0
              B2D5B5B0D8B5A0CCA482B2856295644169433B5D3C99AE9BFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FCF6C3
              CBC3719270447545255F24225624245E28457649739575C5CDC5F6FBF7FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
            GlyphSpacing = 5
            ParentFont = False
            TabOrder = 0
            Transparent = True
            OnClick = btnConfirmar_Config_NFeClick
          end
          object btnAlterar_Config_NFe: TNxButton
            Left = 10
            Top = 2
            Width = 210
            Height = 30
            Caption = 'Alterar Configura'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = []
            Glyph.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFDDDAD9D4CCC8B9ACA8B0A59FCDC2
              BDD4CECDE9E7E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9A96533E351F1A180C2D3C
              094662104D68093F5212222A2A1E17715E5BD8D6D9FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFEEECEB20120D141D271D
              88B322BFF61EC1FF20C1FF20C0FF1FBFFF22BFF923B4F31757700D06006A615D
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFAEA9A81D12
              0F2D82A42FCFFF1DC3FF20BBFF1FB9FF20B5FF26B9FB37B8F435B8F631B9FA34
              CDFF30B7EE0931403C2B22F6F6F6FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
              D7CDCF0300002385A51EC9FF20B8FE1EB7FD1FB7FD20B9FE20B8FC1FB8FF1DB5
              FE1DB6FD21B6FE20B5FD1CBEFF24C8FF123C4E3B271FFFFFFFFFFFFFFFFFFF00
              0000FFFFFFF7F7F60200001D8CB21FCFFF1CB3F822C0FF20BFFF1FBAFF1EB5FF
              1FB9FE1FB9FD1EB7FF1EB7FF1EB8FF1EB7FF1FB8FC1FBBFF24CAFF002E3E645D
              5CFFFFFFFFFFFF000000FFFFFF665E5C0C384A27D3FF20BAFF269AC6122C4028
              A3DD21B1F022CFFF24BBFF21BAFD20B8FE1FB6FE1FB7FF1EB8FD21B8FE1FB9FD
              1FBDFF24B5EE020000D4D2D4FFFFFF000000E4E0E00F000020B7E71EBAFF1CB8
              FF1BB3EF24678D13405912566B1541581AB2ED1EC3FF1DB8FF1AB7FD1AB6FF20
              B9FE1DB7FF20B6FE1FB5FE22CFFF114C646A615EFFFFFF000000B3ABAA002F49
              35C1FF2CB8F82FB7F733C6FF1C546E2EC1EC36DCFF24617334698A2D6C814BD4
              FF3FBAF939BBF42EB9F62AB7F525B5FD1FB7FF1CBAFF22B5F41B0F09E9E7E600
              0000695B5810688329C3FF23B7FA1FB8FA29C1FF398ABA4495BB2C61792C5A74
              439CC415121C32687959E6FF4FBFFA4EC1F93BBCFA1AB5FC1EB8FF1EB9FF24BE
              F7011319D2CECD000000382E2F1286A922C0FF1CB5FF28B7FD59C5FD5DE4FF1A
              303850A7CB1B35411009094CA6C9111319376A7B5EDAFF53C6FE58C6F948C2F9
              19B4FD1EB8FF1DC1FF003249BBB3AE0000002622211A90B91FBFFF1DB6FC57C6
              FD65CBF761CBFD73D2FF0A0B1156A0BF18232D1A1A1857AACC10111C3A6B7B6F
              E4FF5EC8F96ACCF93FBFFA1BB4FF21C3FF01435EA49B99000000251F201388B0
              1ABFFF3DC0FA77CFF870CCF86FCDF871D8FF4E86970100006FB6D81A292C170C
              0C69B4D30D1017477C8983EAFF71CBFB6ACDF724B6FF20C1FF003957A9A08B00
              00005548481C82A31CBFFF6CC9F785D2F581D0F683CEF77ECFF98CE9FF6DA3B7
              06000072A9C42B3C411918167AB5D21415184E727C88DFFF88D1FA3BBFFB1BBD
              FF123547D0C3B4000000BBB2AB4688A62DBCFF82CDF193D1EE8FD0F18FD1F38C
              D4F58CD2F69BECFF62909C15100F85B6CC3839422A2E3086B7CE191C1F5F8B9B
              99E2FF4EC3FA14B8F96D6C6DEAE7D9000000E9E4E267707309BAFC86D2F9A0D9
              F698D8F699D7F59AD7F59AD7F599D6F5A4EDFF7A9FAC0B00018ABACC2F3D4219
              101387B8CF9DD8F4A6DDF542C5FF2F9FD1A18D89FDFAEB000000FEFEFEA89286
              379FCC5ED1FFB9DFF1A8DCF2AADDF4A9DCF2A9DCF2A9DBF2A5DBF2BAF5FF7FA7
              B0140D0C84A0AE4D5A65A5D4E6A9E1FCABDEF223C7FF6D7C85CDC9C5FFFDF400
              0000FFFFFFD6D4D478807E35BFFFB4E5F6B9DFF0B2DEF4B3DEF2B3DFF3B3DFF3
              B4DEF2B3DDF3C8F4FF798E953C474FC2F1FFB6E4FAC3E0EF8CDCFF3D9DCC9488
              83FFFFFFFFFFFD000000FFFFFFFFFFFFC8BBB2658A9B60CAF9D7EBF4CBE3F1C5
              E1F3C5E2F2C6E2F2C6E2F2C6E2F2C5E3F1D0F1FFDEFBFFC4E5F3D2E5F1BAE8FF
              34ABD58D8884F8F6F4FFFFFFFCFFFF000000FFFFFFFDFDFDFCFDFEBAB0AA7098
              A47DD0F8DDEBF3DFE9F3D3E9EFD2E9F0D2E8F0D1E6EECAE1E8CCE3E8CFE1E7E6
              E8EEAFE2FC56B7DE92928FE0D9D6FFFFFFFCFAFAF0F3F3000000FFFFFFFCFCFC
              FDFDFDFFFFFFCFC0C48D9E9C60B1DAACE0F5E1EEF4E4EEF2E7EEF2E8EEF3E6ED
              F2E2EBF3D9EBF47BCDEE6CA4BCA59D9AF5EBEAFFFFFFFFFFFFFFFDFEEBF3F000
              0000FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFE8E0E2CBBDB383A3AF77AFCE8DC4DB
              A0CFE4A2D0E596CCE284BDD76EA8BFAAADA8D9CAC5FCFCFBFFFFFFFEFFFFFFFF
              FFFFFFFFFCFEFD000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEF7
              F1EDE2DDD5CBCCCAB5C1C4B4BFC2BFC3C1D6D2CFEEE7E3FAF7F5FFFFFFFFFFFF
              FEFFFFFFFFFFFFFFFFFFFFFFF9FEFE000000}
            GlyphSpacing = 5
            ParentFont = False
            TabOrder = 1
            Transparent = True
            OnClick = btnAlterar_Config_NFeClick
          end
          object btnCancelar_Config_NFe: TNxButton
            Left = 430
            Top = 2
            Width = 210
            Height = 30
            Caption = 'Cancelar Configura'#231#227'o'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = []
            Glyph.Data = {
              AE060000424DAE06000000000000360000002800000017000000170000000100
              1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFEDECE4C8C7B9706E6B39384207081E0000220706
              1D3B3A4274736FCCCCBFEEEEE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E7C631F1D2C0000500000810005A3
              000EB4000DB10007AB00009200006C00003C22222A83836EFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFF1F0E93C3B2F00005F000FBE00
              15BD0013B6000BB20006B30003B50003B00005A700069E00029A000092000040
              3E3E35F3F3EDFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFEAE9E11C1D210003
              950021D80015BB0007BF0000C50000C60000C60000C50000C60000C90000C800
              02B50002990000A10000651E1E21EDEDE7FFFFFFFFFFFF000000FFFFFFFFFFFF
              363427000AA50025D70017C10000CD0000CB0000C90000CD0000C90000C90000
              C90000CD0000CD0000D30000CF00029B00019400006C38382EFFFFFFFFFFFF00
              0000FFFFFF6B6549000286002AE7001DC90000D50908C18180B88E8EBD0C0DB9
              0000D30000D20000D21214B77A7BB44344AD0000C90000E100039B00009D0000
              4F6D6D55FFFFFF000000E4E1D80A0F3A0028E70023D00003D40000D28385E1FF
              FFFFFFFFFFDFE0E90709BC0000D71416BCE8E9ECFFFFFFFFFFFF6364D70000D4
              0000D40003940000970A0A26E4E4DC000000ABA69800047D002FE80016D70000
              DA0000D78C8CEEFFFFFFFEFEFDFFFFFFCDCEEC2327BAD7D8EEFFFFFFFEFEFDFF
              FFFF8F8FED0000D70000E10003B5000399000046ABAB9D0000005C5960001BC8
              0031E40005DE0000E00000E00808DEBEBEF6FFFFFFFDFDFDFFFFFFFFFFFFFFFF
              FFFDFDFDFFFFFFC8C8F70C0CDF0000DF0000E40001D700069500007E5B5A5C00
              00002024330030F60031E20000E20000E40000E30000E20A0AE2C9C9FAFFFFFE
              FDFDFDFEFEFEFDFDFDFFFFFED7D6FC1313E30000E20000E30000E50000E80007
              980000A11D1C28000000000830003AFF002EE40000E80000E80000E80000E900
              00E83338DDEEEFF9FFFFFEFDFDFDFFFFFEEFF1F93034DE0000E70000E90000E8
              0000E80000EF000AA00007AF00001F000000000B32003CFF0033E70000EC0000
              EC0000EC0000EB2932E2E9EDF6FFFFFFFDFDFDFFFFFDFDFDFDFFFFFFDFE3F41C
              24E10000EC0000EC0000ED0000F1000CA0000CB400022200000000072F003AFF
              0039EC0008EE0000F00000F0202BEBE5ECF8FFFFFFFEFEFDFFFFFEFFFFFEFFFF
              FEFEFEFDFFFFFFDEE4F71925EA0000F00000F40002E8000FA0000CB700002000
              00001D1C28002CF0003CF60020EF0000F30000F39998F9FFFFFFFDFDFDFFFFFF
              B4B4FB0000F1A9A9FBFFFFFFFEFEFDFFFFFF9595F90000F30000FB000BCC0012
              A70006AD21202B0000005B5653001BB7003FFF0036EF0004F60000F65050F7FF
              FFFFFFFFFFCFCFFD0505F50000F50000F4C8C8FCFFFFFEFFFFFF7374F80000F7
              0001F60012B30014B400008A5C5A5A000000AAA898000051003EFF003DF5002F
              F10000FA0000F92828F94949FA0101F80000F90000F90000F90000F85858F94B
              4BFA0000F90000FF0015C30018B20015BF000049ADAC9D000000E4E4DC0A0518
              0019CE0045FF003EF3002AF20001FB0000FD0000F90000FA0000FA0000FA0000
              FA0000FA0000FA0000FF0000FC0015D1001DB4001CC00005B00A0822E3E3DC00
              0000FFFFFF6C6B5300004D002EF10043FF003DF30036EF0011F70000FF0000FF
              0000FF0000FE0000FF0000FF0000FF000AEE0021CA0021C2001FC40013CA0000
              556C6C53FFFFFF000000FFFFFFFFFFFF38372B0000700023E30042FF003CF700
              3EEE0038EB0021EF0015F20011F40013EF001CE6002AD2002ACB0025CE0025CD
              0012C800007837362BFFFFFFFFFFFF000000FFFFFFFFFFFFECECE51E1D1F0000
              720017E40038F60043FD003BF3003AEC0037E60035E10032DD0030DA002DD800
              2FD90023D1000DD60000791C1B1EEBEBE4FFFFFFFFFFFF000000FFFFFFFFFFFF
              FFFFFFF2F2EB3D3D310000530000C0000EE2002DF70035F40035ED0034E90031
              E4002CE40024E50009D90000C20000573D3C31F1F1EAFFFFFFFFFFFFFFFFFF00
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF82826722212E00005A0000A20000E1
              0002FF0004FF0001FF0000E20000A500005C21202E808065FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEE5CB
              CBBA73736D3A3A4707062F00003107062F3A3A4771716DCACAB8EDEDE5FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
            GlyphSpacing = 5
            ParentFont = False
            TabOrder = 2
            Transparent = True
            OnClick = btnCancelar_Config_NFeClick
          end
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 504
    Top = 63
    Width = 84
    Height = 36
    TabOrder = 1
    object Label3: TLabel
      Left = 27
      Top = 1
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object DBText1: TDBText
      Left = 4
      Top = 12
      Width = 78
      Height = 22
      Alignment = taCenter
      DataField = 'Codigo'
      DataSource = DM1.dsFilial
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
  object VerificaCGC1: TVerificaCGC
    Resultado = False
    Left = 537
    Top = 117
  end
  object OpenPictureDialog2: TOpenPictureDialog
    Filter = 
      'PCX Image (*.pcx)|*.pcx|JPG Image (*.JPG)|*.JPG|BMP Image (*.BMP' +
      ')|*.BMP'
    InitialDir = 'C:\'
    Left = 508
    Top = 117
  end
  object tFilial2: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbFilial.DB'
    Left = 474
    Top = 253
    object tFilial2Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tFilial2Empresa: TStringField
      FieldName = 'Empresa'
      Size = 60
    end
  end
  object dsFilial2: TDataSource
    DataSet = tFilial2
    Left = 498
    Top = 253
  end
  object VerificaCPF1: TVerificaCPF
    Resultado = False
    Left = 568
    Top = 112
  end
end
