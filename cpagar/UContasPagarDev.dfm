object fContasPagarDev: TfContasPagarDev
  Left = 172
  Top = 150
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Devolu'#231#245'es das Parcelas do Contas a Pagar'
  ClientHeight = 164
  ClientWidth = 420
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
    Width = 420
    Height = 164
    Align = alClient
    TabOrder = 0
    object Label15: TLabel
      Left = 9
      Top = 13
      Width = 59
      Height = 16
      Caption = 'N'#186' Nota:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText5: TDBText
      Left = 70
      Top = 14
      Width = 91
      Height = 17
      Alignment = taCenter
      DataField = 'NumNotaEnt'
      DataSource = DM1.dsCPagarParc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 260
      Top = 3
      Width = 157
      Height = 31
      BevelOuter = bvLowered
      TabOrder = 0
      object BitBtn4: TBitBtn
        Left = 78
        Top = 3
        Width = 75
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn4Click
        Glyph.Data = {
          B6010000424DB601000000000000760000002800000022000000100000000100
          04000000000040010000CE0E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0038383838380E
          03833333333333387F333300000083838383830E603833FFFFFFFF387F33FF00
          000000000000380E6600388888888F387F388300000033333330830E66033333
          33338F387F38F300000033333330000E6603333333FF88887F38F30000003333
          0030330E66033333388F8F387F38F300000033330E00330E660333FFF8F88F38
          7F38F300000000000EE0330E0603388888338F387F38F30000000EEEEEE6030E
          660338FFFFF378387F38F300000000000E60330E6603388888F78F387F38F300
          000033330600330E6603333338788F387F38F300000033330030330E66033333
          38838F387F38F3000000333333303330E603333333338F3387F8F30000003333
          333033330E03333333338FFFF878F30000003333333000000003333333338888
          8888330000003333333333333333333333333333333333000000}
        NumGlyphs = 2
      end
      object BitBtn1: TBitBtn
        Left = 3
        Top = 3
        Width = 75
        Height = 25
        Hint = 'Confirma devolu'#231#227'o s/ o t'#237'tulo'
        Caption = '&Confirmar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn1Click
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
    object Panel3: TPanel
      Left = 3
      Top = 37
      Width = 414
      Height = 124
      BevelOuter = bvLowered
      TabOrder = 1
      object Label2: TLabel
        Left = 14
        Top = 3
        Width = 52
        Height = 16
        Caption = 'N'#186' Parc.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 71
        Top = 4
        Width = 34
        Height = 13
        DataField = 'ParcCPagar'
        DataSource = DM1.dsCPagarParc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 116
        Top = 3
        Width = 66
        Height = 16
        Caption = 'Valor Orig.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 189
        Top = 4
        Width = 66
        Height = 14
        DataField = 'VlrParcCPagar'
        DataSource = DM1.dsCPagarParc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 260
        Top = 3
        Width = 69
        Height = 16
        Caption = 'Valor Rest.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 333
        Top = 4
        Width = 66
        Height = 14
        DataField = 'RestParcela'
        DataSource = DM1.dsCPagarParc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 238
        Top = 25
        Width = 100
        Height = 13
        Caption = 'Data de Vencimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 343
        Top = 23
        Width = 65
        Height = 15
        DataField = 'DtVencCPagar'
        DataSource = DM1.dsCPagarParc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 14
        Top = 52
        Width = 96
        Height = 13
        Caption = 'Data de Devolu'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 14
        Top = 22
        Width = 114
        Height = 16
        Caption = 'Valor j'#225' Devolvido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText6: TDBText
        Left = 134
        Top = 24
        Width = 97
        Height = 14
        DataField = 'VlrDevolucao'
        DataSource = DM1.dsCPagarParc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 214
        Top = 51
        Width = 95
        Height = 13
        Caption = 'Valor da devolu'#231#227'o:'
      end
      object Bevel1: TBevel
        Left = -62
        Top = 74
        Width = 475
        Height = 2
        Shape = bsTopLine
        Style = bsRaised
      end
      object Label11: TLabel
        Left = 2
        Top = 77
        Width = 56
        Height = 16
        Caption = 'Hist'#243'rico:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 380
        Top = 91
        Width = 25
        Height = 25
        Hint = 'Abre o cadastro de hist'#243'ricos'
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
        OnClick = SpeedButton1Click
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 56
        Top = 93
        Width = 321
        Height = 21
        DropDownCount = 8
        LookupField = 'Codigo'
        LookupDisplay = 'Nome'
        LookupSource = dsHistorico
        TabOrder = 4
        TabStop = False
        OnChange = RxDBLookupCombo1Change
        OnDropDown = RxDBLookupCombo1Enter
        OnEnter = RxDBLookupCombo1Enter
        OnExit = RxDBLookupCombo1Exit
      end
      object DateEdit1: TDateEdit
        Left = 114
        Top = 44
        Width = 95
        Height = 21
        NumGlyphs = 2
        TabOrder = 0
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 312
        Top = 43
        Width = 96
        Height = 21
        AutoSize = False
        DisplayFormat = '0.00'
        TabOrder = 1
      end
      object CurrencyEdit2: TCurrencyEdit
        Left = 2
        Top = 93
        Width = 52
        Height = 21
        AutoSize = False
        DisplayFormat = '0'
        TabOrder = 2
        OnEnter = CurrencyEdit2Enter
        OnExit = CurrencyEdit2Exit
      end
      object Edit1: TEdit
        Left = 56
        Top = 93
        Width = 303
        Height = 21
        AutoSelect = False
        CharCase = ecUpperCase
        MaxLength = 70
        TabOrder = 3
        OnChange = Edit1Change
      end
    end
  end
  object tHistorico: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbHistorico.DB'
    Left = 104
    object tHistoricoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tHistoricoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tHistoricoTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
  end
  object dsHistorico: TDataSource
    DataSet = tHistorico
    Left = 112
  end
  object RxDBFilter1: TRxDBFilter
    Active = True
    DataSource = dsHistorico
    Filter.Strings = (
      'Tipo <> '#39'R'#39)
    Left = 160
  end
end
