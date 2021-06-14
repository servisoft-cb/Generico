object fOutros: TfOutros
  Left = 190
  Top = 134
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de outros p/ consulta de Agenda Telef'#244'nica'
  ClientHeight = 459
  ClientWidth = 635
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
    Width = 635
    Height = 459
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 633
      Height = 41
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 47
        Top = 13
        Width = 137
        Height = 20
        Caption = 'Procura p/ nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 187
        Top = 12
        Width = 274
        Height = 21
        DropDownCount = 8
        LookupField = 'Codigo'
        LookupDisplay = 'Nome'
        LookupSource = DM1.dsOutros
        TabOrder = 0
        OnDropDown = RxDBLookupCombo1Enter
        OnEnter = RxDBLookupCombo1Enter
        OnExit = RxDBLookupCombo1Exit
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 42
      Width = 633
      Height = 30
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'Panel3'
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 253
        Top = 2
        Width = 75
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
        Left = 2
        Top = 2
        Width = 236
        Height = 25
        DataSource = DM1.dsOutros
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
        Left = 329
        Top = 2
        Width = 75
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
        Left = 479
        Top = 2
        Width = 75
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
        Left = 404
        Top = 2
        Width = 75
        Height = 25
        Hint = 'Cancela  a altera'#231#227'o ou inclus'#227'o de um registro'
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
      object BitBtn6: TBitBtn
        Left = 554
        Top = 2
        Width = 75
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = BitBtn6Click
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
    object Panel4: TPanel
      Left = 1
      Top = 72
      Width = 633
      Height = 386
      Align = alClient
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 2
      object Label2: TLabel
        Left = 47
        Top = 21
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object Label4: TLabel
        Left = 38
        Top = 164
        Width = 40
        Height = 13
        Caption = 'Contato:'
      end
      object Label9: TLabel
        Left = 24
        Top = 188
        Width = 54
        Height = 13
        Caption = 'Telefone 1:'
        FocusControl = DBEdit6
      end
      object Label10: TLabel
        Left = 219
        Top = 188
        Width = 54
        Height = 13
        Caption = 'Telefone 2:'
        FocusControl = DBEdit7
      end
      object Label11: TLabel
        Left = 425
        Top = 188
        Width = 20
        Height = 13
        Caption = 'Fax:'
        FocusControl = DBEdit8
      end
      object Label5: TLabel
        Left = 47
        Top = 212
        Width = 31
        Height = 13
        Caption = 'E-mail:'
      end
      object Label16: TLabel
        Left = 40
        Top = 68
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pessoa:'
        FocusControl = DBEdit1
      end
      object Label12: TLabel
        Left = 265
        Top = 68
        Width = 30
        Height = 13
        Caption = 'CNPJ:'
      end
      object Label6: TLabel
        Left = 29
        Top = 92
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Endere'#231'o:'
        FocusControl = DBEdit4
      end
      object Label7: TLabel
        Left = 42
        Top = 116
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cidade:'
      end
      object SpeedButton6: TSpeedButton
        Left = 309
        Top = 107
        Width = 21
        Height = 22
        Hint = 'Abre o cadastro de Cidades'
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
      end
      object Label8: TLabel
        Left = 338
        Top = 116
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estado:'
      end
      object SpeedButton5: TSpeedButton
        Left = 436
        Top = 108
        Width = 21
        Height = 21
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
      end
      object Label13: TLabel
        Left = 48
        Top = 140
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Bairro:'
        FocusControl = DBEdit5
      end
      object Label14: TLabel
        Left = 350
        Top = 140
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'CEP:'
        FocusControl = DBEdit10
      end
      object Label15: TLabel
        Left = 19
        Top = 236
        Width = 59
        Height = 13
        Caption = 'Home Page:'
      end
      object Label17: TLabel
        Left = 56
        Top = 260
        Width = 22
        Height = 13
        Caption = 'Obs:'
      end
      object Label18: TLabel
        Left = 4
        Top = 44
        Width = 74
        Height = 13
        Caption = 'Nome Fantasia:'
      end
      object DBEdit1: TDBEdit
        Left = 82
        Top = 13
        Width = 375
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Nome'
        DataSource = DM1.dsOutros
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 82
        Top = 156
        Width = 243
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Contato'
        DataSource = DM1.dsOutros
        TabOrder = 9
      end
      object DBEdit6: TDBEdit
        Left = 82
        Top = 180
        Width = 98
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Telefone1'
        DataSource = DM1.dsOutros
        MaxLength = 14
        TabOrder = 10
      end
      object DBEdit7: TDBEdit
        Left = 276
        Top = 180
        Width = 98
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Telefone2'
        DataSource = DM1.dsOutros
        MaxLength = 14
        TabOrder = 11
      end
      object DBEdit8: TDBEdit
        Left = 447
        Top = 180
        Width = 98
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Fax'
        DataSource = DM1.dsOutros
        MaxLength = 14
        TabOrder = 12
      end
      object DBEdit3: TDBEdit
        Left = 82
        Top = 204
        Width = 524
        Height = 21
        CharCase = ecLowerCase
        DataField = 'Email'
        DataSource = DM1.dsOutros
        TabOrder = 13
      end
      object RxDBComboBox2: TRxDBComboBox
        Left = 82
        Top = 60
        Width = 60
        Height = 21
        Style = csDropDownList
        DataField = 'Pessoa'
        DataSource = DM1.dsOutros
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'J'
          'F')
        TabOrder = 2
        Values.Strings = (
          'J'
          'F')
      end
      object DBEdit9: TDBEdit
        Left = 298
        Top = 60
        Width = 159
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NumDoc'
        DataSource = DM1.dsOutros
        TabOrder = 3
        OnEnter = DBEdit9Enter
        OnExit = DBEdit9Exit
      end
      object DBEdit4: TDBEdit
        Left = 82
        Top = 84
        Width = 375
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Endereco'
        DataSource = DM1.dsOutros
        TabOrder = 4
      end
      object RxDBLookupCombo5: TRxDBLookupCombo
        Left = 82
        Top = 108
        Width = 227
        Height = 21
        DropDownCount = 8
        DropDownWidth = 260
        DataField = 'CodCidade'
        DataSource = DM1.dsOutros
        LookupField = 'Codigo'
        LookupDisplay = 'Nome;Estado'
        LookupSource = DM1.dsCidade
        TabOrder = 5
      end
      object RxDBLookupCombo6: TRxDBLookupCombo
        Left = 378
        Top = 108
        Width = 56
        Height = 21
        DropDownCount = 8
        DataField = 'UF'
        DataSource = DM1.dsOutros
        LookupField = 'Sigla'
        LookupDisplay = 'Sigla'
        LookupSource = DM1.dsUF
        TabOrder = 6
      end
      object DBEdit5: TDBEdit
        Left = 82
        Top = 132
        Width = 180
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Bairro'
        DataSource = DM1.dsOutros
        TabOrder = 7
      end
      object DBEdit10: TDBEdit
        Left = 378
        Top = 132
        Width = 79
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Cep'
        DataSource = DM1.dsOutros
        TabOrder = 8
      end
      object DBEdit11: TDBEdit
        Left = 82
        Top = 228
        Width = 524
        Height = 21
        CharCase = ecLowerCase
        DataField = 'HomePage'
        DataSource = DM1.dsOutros
        TabOrder = 14
      end
      object DBEdit12: TDBEdit
        Left = 82
        Top = 36
        Width = 375
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Fantasia'
        DataSource = DM1.dsOutros
        TabOrder = 1
      end
    end
  end
  object Panel5: TPanel
    Left = 473
    Top = 75
    Width = 158
    Height = 41
    TabOrder = 2
    object Label3: TLabel
      Left = 20
      Top = 1
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object DBText1: TDBText
      Left = 5
      Top = 14
      Width = 69
      Height = 20
      Alignment = taCenter
      DataField = 'Codigo'
      DataSource = DM1.dsOutros
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BitBtn5: TBitBtn
      Left = 77
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Confirma  a altera'#231#227'o ou inclus'#227'o de um registro'
      Caption = '&Confirmar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
  object DBMemo1: TDBMemo
    Left = 83
    Top = 325
    Width = 524
    Height = 125
    DataField = 'Obs'
    DataSource = DM1.dsOutros
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object VerificaCPF1: TVerificaCPF
    Resultado = False
    Left = 581
    Top = 170
  end
  object VerificaCGC1: TVerificaCGC
    Resultado = False
    Left = 581
    Top = 198
  end
  object tOutrosIns: TTable
    DatabaseName = 'Tabelas'
    TableName = 'dbOutros.DB'
    Left = 489
    Top = 144
    object tOutrosInsCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tOutrosInsNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tOutrosInsContato: TStringField
      FieldName = 'Contato'
      Size = 30
    end
    object tOutrosInsTelefone1: TStringField
      FieldName = 'Telefone1'
      Size = 15
    end
    object tOutrosInsTelefone2: TStringField
      FieldName = 'Telefone2'
      Size = 15
    end
    object tOutrosInsFax: TStringField
      FieldName = 'Fax'
      Size = 15
    end
    object tOutrosInsEmail: TStringField
      FieldName = 'Email'
      Size = 200
    end
    object tOutrosInsCodCidade: TIntegerField
      FieldName = 'CodCidade'
    end
    object tOutrosInsEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object tOutrosInsBairro: TStringField
      FieldName = 'Bairro'
      Size = 30
    end
    object tOutrosInsCep: TStringField
      FieldName = 'Cep'
      Size = 9
    end
    object tOutrosInsUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tOutrosInsNumDoc: TStringField
      FieldName = 'NumDoc'
      Size = 18
    end
    object tOutrosInsPessoa: TStringField
      FieldName = 'Pessoa'
      Size = 1
    end
    object tOutrosInsHomePage: TStringField
      FieldName = 'HomePage'
      Size = 200
    end
    object tOutrosInsObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 1
    end
  end
end
