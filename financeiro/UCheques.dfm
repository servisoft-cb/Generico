object fCheques: TfCheques
  Left = 205
  Top = 87
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cheques'
  ClientHeight = 563
  ClientWidth = 731
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 731
    Height = 563
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 729
      Height = 66
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      OnEnter = Panel2Enter
      object Label1: TLabel
        Left = 24
        Top = 42
        Width = 128
        Height = 16
        Caption = 'Procura pelo cheque:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 154
        Top = 39
        Width = 222
        Height = 21
        Hint = 'Efetua a procura de um grupo'
        DropDownCount = 8
        LookupField = 'NumMov'
        LookupDisplay = 'NumCheque'
        LookupSource = dsqCheque
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnChange = RxDBLookupCombo1Change
      end
      object BitBtn7: TBitBtn
        Left = 383
        Top = 37
        Width = 130
        Height = 25
        Caption = 'Compensar Cheque'
        TabOrder = 2
        OnClick = BitBtn7Click
        Glyph.Data = {
          5A010000424D5A01000000000000760000002800000012000000130000000100
          040000000000E4000000CE0E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777778877777
          7777770000007777844877777777770000007778444487777777770000007784
          4444487777777700000078444C4444877777770000007444C4C4448777777700
          00007C4C444C444877777700000078C44444C4448777770000008444C4444C44
          487777000000444C7C4448C4448777000000C4C777C4448C4448770000007C77
          777C4448C4448700000077777777C4448C4487000000777777777C4448C44700
          00007777777777C4448C7700000077777777777C444877000000777777777777
          C448770000007777777777777C447700000077777777777777C777000000}
      end
      object BitBtn9: TBitBtn
        Left = 575
        Top = 37
        Width = 137
        Height = 25
        Caption = 'Excluir a Compensa'#231#227'o'
        TabOrder = 3
        OnClick = BitBtn9Click
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 727
        Height = 31
        Align = alTop
        Color = clMoneyGreen
        TabOrder = 0
        object Label9: TLabel
          Left = 119
          Top = 9
          Width = 23
          Height = 13
          Caption = 'Filial:'
        end
        object DBText2: TDBText
          Left = 145
          Top = 9
          Width = 440
          Height = 13
          DataField = 'Empresa'
          DataSource = DM1.dsFilial
        end
        object BitBtn11: TBitBtn
          Left = 4
          Top = 3
          Width = 109
          Height = 25
          Caption = 'Trocar Filial'
          TabOrder = 0
          OnClick = BitBtn11Click
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 67
      Width = 729
      Height = 29
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 159
        Top = 1
        Width = 90
        Height = 25
        Hint = 'Insere um novo grupo'
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
        Left = 3
        Top = 1
        Width = 156
        Height = 25
        DataSource = DM1.dsCheque
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Hints.Strings = (
          'Vai para o primeiro registro'
          'Volta um registro'
          'Avan'#231'a um registro'
          'Vai para o '#250'ltimo registro')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = DBNavigator1Click
      end
      object BitBtn2: TBitBtn
        Left = 249
        Top = 1
        Width = 90
        Height = 25
        Hint = 'Altera o grupo selecionado'
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
        Left = 339
        Top = 1
        Width = 91
        Height = 25
        Hint = 'Exclui grupo selecionado'
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
        Left = 525
        Top = 1
        Width = 90
        Height = 25
        Hint = 'Cancela a inclus'#227'o ou altera'#231#227'o de um grupo'
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
        Left = 615
        Top = 1
        Width = 90
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
      object BitBtn5: TBitBtn
        Left = 430
        Top = 1
        Width = 95
        Height = 25
        Hint = 'Confirma a altera'#231#227'o ou inclus'#227'o de um grupo'
        Caption = '&Confirmar'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
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
      Top = 96
      Width = 729
      Height = 466
      Align = alClient
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 2
      object Label2: TLabel
        Left = 33
        Top = 33
        Width = 34
        Height = 13
        Caption = 'Banco:'
      end
      object Label3: TLabel
        Left = 396
        Top = 33
        Width = 55
        Height = 13
        Caption = 'N'#186' Cheque:'
      end
      object Label4: TLabel
        Left = 26
        Top = 55
        Width = 41
        Height = 13
        Caption = 'Nominal:'
      end
      object Label5: TLabel
        Left = 392
        Top = 55
        Width = 59
        Height = 13
        Caption = 'Dt. Emiss'#227'o:'
      end
      object Label6: TLabel
        Left = 40
        Top = 77
        Width = 27
        Height = 13
        Caption = 'Valor:'
      end
      object Label7: TLabel
        Left = 180
        Top = 77
        Width = 82
        Height = 13
        Caption = 'Dt. Compensado:'
      end
      object Label8: TLabel
        Left = 393
        Top = 77
        Width = 58
        Height = 13
        Caption = 'Dt. Prevista:'
      end
      object Shape1: TShape
        Left = 0
        Top = 213
        Width = 721
        Height = 5
        Brush.Color = clBlue
      end
      object Label10: TLabel
        Left = 640
        Top = 8
        Width = 74
        Height = 13
        Caption = 'N'#186' Lan'#231'amento'
      end
      object DBText1: TDBText
        Left = 648
        Top = 24
        Width = 65
        Height = 17
        Alignment = taCenter
        DataField = 'NumMov'
        DataSource = DM1.dsCheque
      end
      object Label11: TLabel
        Left = 44
        Top = 9
        Width = 23
        Height = 13
        Caption = 'Filial:'
      end
      object Label12: TLabel
        Left = 46
        Top = 140
        Width = 22
        Height = 13
        Caption = 'Obs:'
      end
      object SpeedButton13: TSpeedButton
        Left = 362
        Top = 90
        Width = 25
        Height = 25
        Hint = 'Abre o cadastro de Prazos de Pgto.'
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          04000000000078000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
          000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
          00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
          8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
          8888880BB088888888888800008888888888}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton13Click
      end
      object Label13: TLabel
        Left = 6
        Top = 100
        Width = 61
        Height = 13
        Caption = 'Plano Conta:'
      end
      object Label30: TLabel
        Left = 16
        Top = 122
        Width = 53
        Height = 13
        Caption = 'Sub-Conta:'
      end
      object RxDBLookupCombo2: TRxDBLookupCombo
        Left = 71
        Top = 25
        Width = 290
        Height = 21
        DropDownCount = 8
        DataField = 'CodConta'
        DataSource = DM1.dsCheque
        LookupField = 'CodConta'
        LookupDisplay = 'NomeConta'
        LookupSource = DM1.dsContas
        TabOrder = 0
        OnEnter = RxDBLookupCombo2Enter
      end
      object DBEdit1: TDBEdit
        Left = 456
        Top = 25
        Width = 95
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NumCheque'
        DataSource = DM1.dsCheque
        TabOrder = 1
        OnEnter = DBEdit1Enter
        OnExit = DBEdit1Exit
      end
      object DBEdit2: TDBEdit
        Left = 71
        Top = 47
        Width = 290
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Nominal'
        DataSource = DM1.dsCheque
        TabOrder = 2
      end
      object DBDateEdit1: TDBDateEdit
        Left = 456
        Top = 47
        Width = 95
        Height = 21
        DataField = 'DtEmissao'
        DataSource = DM1.dsCheque
        NumGlyphs = 2
        TabOrder = 3
        StartOfWeek = Sun
      end
      object DBEdit3: TDBEdit
        Left = 71
        Top = 69
        Width = 81
        Height = 21
        DataField = 'VlrTotal'
        DataSource = DM1.dsCheque
        TabOrder = 4
      end
      object DBDateEdit2: TDBDateEdit
        Left = 266
        Top = 69
        Width = 95
        Height = 21
        DataField = 'DtEntrada'
        DataSource = DM1.dsCheque
        Color = clInfoBk
        Enabled = False
        NumGlyphs = 2
        TabOrder = 5
        StartOfWeek = Sun
      end
      object DBDateEdit3: TDBDateEdit
        Left = 456
        Top = 69
        Width = 95
        Height = 21
        DataField = 'DtPrevista'
        DataSource = DM1.dsCheque
        NumGlyphs = 2
        TabOrder = 6
        StartOfWeek = Sun
      end
      object DBCheckBox1: TDBCheckBox
        Left = 557
        Top = 74
        Width = 75
        Height = 17
        Caption = 'Autom'#225'tico'
        DataField = 'Automatico'
        DataSource = DM1.dsCheque
        ReadOnly = True
        TabOrder = 7
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object SMDBGrid1: TSMDBGrid
        Left = 1
        Top = 253
        Width = 727
        Height = 212
        Align = alBottom
        DataSource = DM1.dsChequeCPagar
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 11
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
        ExOptions = [eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 10
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NumCPagar'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' La'#231'to C. Pagar'
            Width = 51
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NumDuplicata'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Duplicata'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Parcela'
            Title.Alignment = taCenter
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Title.Alignment = taCenter
            Title.Caption = 'Vlr. Pagamento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VlrJuros'
            Title.Alignment = taCenter
            Title.Caption = 'Vlr. Juros'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VlrDesconto'
            Title.Alignment = taCenter
            Title.Caption = 'Vlr. Desconto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lkNomeFornecedor'
            Title.Alignment = taCenter
            Title.Caption = 'Fornecedor'
            Width = 224
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Filial'
            Title.Alignment = taCenter
            Width = 27
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NumNota'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Nota'
            Width = 68
            Visible = True
          end>
      end
      object BitBtn8: TBitBtn
        Left = 7
        Top = 221
        Width = 129
        Height = 27
        Hint = 'Insere uma nova duplicata'
        Caption = 'Digitar Duplicatas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnClick = BitBtn8Click
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
      object BitBtn10: TBitBtn
        Left = 137
        Top = 221
        Width = 130
        Height = 27
        Hint = 'Exclui Duplicata'
        Caption = 'Excluir Duplicata'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
        OnClick = BitBtn10Click
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
      object RxDBLookupCombo4: TRxDBLookupCombo
        Left = 71
        Top = 3
        Width = 290
        Height = 21
        DropDownCount = 8
        Color = clSilver
        DataField = 'Filial'
        DataSource = DM1.dsCheque
        LookupField = 'Codigo'
        LookupDisplay = 'NomeInterno'
        LookupSource = DM1.dsFilial
        ReadOnly = True
        TabOrder = 14
        TabStop = False
        OnEnter = RxDBLookupCombo2Enter
      end
      object DBMemo1: TDBMemo
        Left = 71
        Top = 137
        Width = 641
        Height = 67
        DataField = 'Obs'
        DataSource = DM1.dsCheque
        ScrollBars = ssVertical
        TabOrder = 10
      end
      object RxDBLookupCombo5: TRxDBLookupCombo
        Left = 71
        Top = 92
        Width = 290
        Height = 21
        DropDownCount = 18
        DataField = 'PlanoContas'
        DataSource = DM1.dsCheque
        LookupField = 'Codigo'
        LookupDisplay = 'Descricao'
        LookupSource = DM2.dsPlanoContas2
        ParentShowHint = False
        ShowHint = False
        TabOrder = 8
        OnEnter = RxDBLookupCombo5Enter
        OnExit = RxDBLookupCombo5Exit
      end
      object RxDBLookupCombo7: TRxDBLookupCombo
        Left = 71
        Top = 115
        Width = 290
        Height = 21
        DropDownCount = 18
        DataField = 'CodPlanoContasItens'
        DataSource = DM1.dsCheque
        LookupField = 'CodItem'
        LookupDisplay = 'Nome'
        LookupSource = DM2.dsPlanoContaItens2
        ParentShowHint = False
        ShowHint = False
        TabOrder = 9
        OnEnter = RxDBLookupCombo7Enter
      end
    end
  end
  object tChequeIns: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbCheque.db'
    Left = 19
    Top = 80
    object tChequeInsNumMov: TIntegerField
      FieldName = 'NumMov'
    end
    object tChequeInsCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object tChequeInsNumCheque: TIntegerField
      FieldName = 'NumCheque'
    end
    object tChequeInsDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object tChequeInsVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
    object tChequeInsNominal: TStringField
      FieldName = 'Nominal'
      Size = 40
    end
    object tChequeInsDtEntrada: TDateField
      FieldName = 'DtEntrada'
    end
    object tChequeInsDtPrevista: TDateField
      FieldName = 'DtPrevista'
    end
    object tChequeInsAutomatico: TBooleanField
      FieldName = 'Automatico'
    end
    object tChequeInsPlanoContas: TIntegerField
      FieldName = 'PlanoContas'
    end
    object tChequeInsCodPlanoContasItens: TIntegerField
      FieldName = 'CodPlanoContasItens'
    end
    object tChequeInsFilial: TIntegerField
      FieldName = 'Filial'
    end
  end
  object RxDBFilter1: TRxDBFilter
    DataSource = DM1.dsContas
    Filter.Strings = (
      'TipoConta = '#39'B'#39)
    Left = 545
    Top = 200
  end
  object qCheque: TQuery
    AfterScroll = qChequeAfterScroll
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT NumCheque, NumMov'
      'FROM "dbCheque.DB" Dbcheque'
      'ORDER BY NumCheque')
    Left = 665
    Top = 184
    object qChequeNumCheque: TIntegerField
      FieldName = 'NumCheque'
      Origin = 'TABELAS."dbCheque.DB".NumCheque'
    end
    object qChequeNumMov: TIntegerField
      FieldName = 'NumMov'
      Origin = 'TABELAS."dbCheque.DB".NumMov'
    end
  end
  object dsqCheque: TDataSource
    DataSet = qCheque
    Left = 681
    Top = 184
  end
end
