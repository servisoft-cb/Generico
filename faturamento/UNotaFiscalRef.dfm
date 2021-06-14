object fNotaFiscalRef: TfNotaFiscalRef
  Left = 250
  Top = 231
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Nota Fiscal Referenciada (usar quando nota for complementar)'
  ClientHeight = 330
  ClientWidth = 570
  Color = clMoneyGreen
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
    Top = 289
    Width = 570
    Height = 41
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 128
      Top = 6
      Width = 84
      Height = 28
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 211
      Top = 6
      Width = 84
      Height = 28
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 570
    Height = 289
    ActivePage = TabSheet4
    ActivePageDefault = TabSheet1
    Align = alClient
    TabIndex = 3
    TabOrder = 1
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Color = clMoneyGreen
      Caption = 'NFe'
      object Label4: TLabel
        Left = 11
        Top = 64
        Width = 72
        Height = 13
        Caption = 'Chave Acesso:'
      end
      object Edit2: TEdit
        Left = 87
        Top = 56
        Width = 385
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 44
        TabOrder = 0
      end
    end
    object TabSheet2: TRzTabSheet
      Color = clMoneyGreen
      Caption = 'Nota Fiscal'
      object Label1: TLabel
        Left = 113
        Top = 77
        Width = 27
        Height = 13
        Caption = 'S'#233'rie:'
      end
      object Label2: TLabel
        Left = 99
        Top = 101
        Width = 41
        Height = 13
        Caption = 'N'#186' Nota:'
      end
      object Label3: TLabel
        Left = 281
        Top = 101
        Width = 38
        Height = 13
        Caption = 'Modelo:'
      end
      object Label5: TLabel
        Left = 123
        Top = 125
        Width = 17
        Height = 13
        Alignment = taCenter
        Caption = 'UF:'
      end
      object Label7: TLabel
        Left = 110
        Top = 153
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'CNPJ:'
      end
      object Label8: TLabel
        Left = 9
        Top = 181
        Width = 131
        Height = 13
        Alignment = taCenter
        Caption = 'M'#234's/Ano Emiss'#227'o (mm/aa):'
      end
      object Label6: TLabel
        Left = 209
        Top = 125
        Width = 55
        Height = 13
        Alignment = taCenter
        Caption = 'do emitente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 232
        Top = 6
        Width = 273
        Height = 39
        Caption = 
          'Se for Produtor Rural:'#13#10'S'#233'rie se n'#227'o existir informar 0'#13#10'Modelo ' +
          '  04 se for NF de produtor   ou  01 para NF avulsa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 129
        Top = 202
        Width = 13
        Height = 13
        Alignment = taCenter
        Caption = 'IE:'
        Visible = False
      end
      object Edit1: TEdit
        Left = 142
        Top = 69
        Width = 68
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 3
        TabOrder = 1
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 142
        Top = 95
        Width = 119
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        TabOrder = 2
      end
      object Edit3: TEdit
        Left = 320
        Top = 93
        Width = 68
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 3
        TabOrder = 3
      end
      object Edit5: TEdit
        Left = 142
        Top = 147
        Width = 210
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 14
        TabOrder = 5
      end
      object MaskEdit1: TMaskEdit
        Left = 144
        Top = 173
        Width = 49
        Height = 21
        EditMask = '99/99'
        MaxLength = 5
        TabOrder = 6
        Text = '  /  '
      end
      object RxDBLookupCombo6: TRxDBLookupCombo
        Left = 142
        Top = 121
        Width = 67
        Height = 21
        DropDownCount = 8
        LookupField = 'Sigla'
        LookupDisplay = 'Sigla'
        LookupSource = dsUF2
        TabOrder = 4
      end
      object CheckBox1: TCheckBox
        Left = 120
        Top = 8
        Width = 97
        Height = 17
        Caption = 'Produtor Rural'
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object Edit6: TEdit
        Left = 144
        Top = 196
        Width = 209
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 14
        TabOrder = 7
        Visible = False
      end
    end
    object TabSheet3: TRzTabSheet
      Color = clMoneyGreen
      Caption = 'Cupom Fiscal'
      object Label9: TLabel
        Left = 24
        Top = 16
        Width = 63
        Height = 13
        Caption = 'N'#250'mero ECF:'
      end
      object Label10: TLabel
        Left = 21
        Top = 56
        Width = 66
        Height = 13
        Caption = 'N'#250'mero COO:'
      end
      object Label11: TLabel
        Left = 49
        Top = 96
        Width = 38
        Height = 13
        Caption = 'Modelo:'
      end
      object Label12: TLabel
        Left = 160
        Top = 7
        Width = 277
        Height = 26
        Caption = 
          'N'#186' de ordem sequencial do ECF que emitiu o Cupom Fiscal'#13#10'vincula' +
          'do '#224' NFe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 160
        Top = 50
        Width = 300
        Height = 13
        Caption = 'N'#186' do Contador de Ordem de Opera'#231#227'o - COO vinculado '#224' NFe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 160
        Top = 87
        Width = 390
        Height = 39
        Caption = 
          '2B = Quando se tratar de Cupom Fiscal emitido por m'#225'quina regist' +
          'radora (n'#227'o ECF)'#13#10'2C = Quando se tratar de Cupom Fiscal PDV'#13#10'2D ' +
          '= Quando se tratar de Cupom Fiscal emitido por ECF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object CurrencyEdit2: TCurrencyEdit
        Left = 89
        Top = 8
        Width = 65
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        MaxLength = 3
        TabOrder = 0
      end
      object CurrencyEdit3: TCurrencyEdit
        Left = 89
        Top = 48
        Width = 65
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        MaxLength = 3
        TabOrder = 1
      end
      object ComboBox1: TComboBox
        Left = 89
        Top = 88
        Width = 65
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Items.Strings = (
          ''
          '2B'
          '2C'
          '2D')
      end
    end
    object TabSheet4: TRzTabSheet
      Color = clMoneyGreen
      Caption = 'CTe'
      object Label15: TLabel
        Left = 14
        Top = 15
        Width = 95
        Height = 13
        Alignment = taRightJustify
        Caption = 'Chave Acesso CTe:'
      end
      object Edit4: TEdit
        Left = 111
        Top = 8
        Width = 385
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 44
        TabOrder = 0
      end
    end
  end
  object tUF2: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbUF.DB'
    Left = 376
    Top = 184
    object tUF2Sigla: TStringField
      FieldName = 'Sigla'
      Size = 2
    end
  end
  object dsUF2: TDataSource
    DataSet = tUF2
    Left = 400
    Top = 184
  end
  object qNotaRef: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT MAX( Item ) Item'
      'FROM "dbNotaFiscalRef.DB" Dbnotafiscalref'
      'WHERE   (Filial = :Filial)  '
      '   AND  (NumSeq = :NumSeq)  '
      '   AND  (Tipo =  :Tipo)  ')
    Left = 337
    Top = 132
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NumSeq'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Tipo'
        ParamType = ptUnknown
      end>
    object qNotaRefItem: TIntegerField
      FieldName = 'Item'
      Origin = 'TABELAS."dbNotaFiscalRef.DB".Item'
    end
  end
end
