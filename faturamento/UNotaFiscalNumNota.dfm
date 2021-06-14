object fNotaFiscalNumNota: TfNotaFiscalNumNota
  Left = 329
  Top = 264
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informar o n'#250'mero da nota'
  ClientHeight = 242
  ClientWidth = 526
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 40
    Width = 41
    Height = 13
    Caption = 'N'#186' Nota:'
  end
  object Label2: TLabel
    Left = 176
    Top = 16
    Width = 262
    Height = 32
    Caption = 
      'Obs: Depois de confirmado o n'#250'mero '#13#10'        n'#227'o pode mais ser a' +
      'lterado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 20
    Top = 18
    Width = 27
    Height = 13
    Caption = 'S'#233'rie:'
  end
  object Label12: TLabel
    Left = 74
    Top = 79
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = 'N'#186' Recibo:'
  end
  object Label15: TLabel
    Left = 63
    Top = 100
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = 'N'#186' Protocolo:'
  end
  object Label26: TLabel
    Left = 54
    Top = 121
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = 'Chave Acesso:'
  end
  object Label27: TLabel
    Left = 9
    Top = 142
    Width = 117
    Height = 13
    Alignment = taRightJustify
    Caption = 'N'#186' Protocolo Cancelada:'
  end
  object Label46: TLabel
    Left = 11
    Top = 163
    Width = 115
    Height = 13
    Alignment = taRightJustify
    Caption = 'C'#243'd.Barra Conting'#234'ncia:'
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 48
    Top = 32
    Width = 75
    Height = 21
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0'
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 48
    Top = 10
    Width = 75
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 128
    Top = 71
    Width = 361
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 128
    Top = 92
    Width = 361
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object Edit4: TEdit
    Left = 128
    Top = 113
    Width = 361
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
  end
  object Edit5: TEdit
    Left = 128
    Top = 134
    Width = 361
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
  end
  object Edit6: TEdit
    Left = 128
    Top = 155
    Width = 361
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 6
  end
  object Panel1: TPanel
    Left = 0
    Top = 201
    Width = 526
    Height = 41
    Align = alBottom
    TabOrder = 7
    object BitBtn1: TBitBtn
      Left = 187
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 262
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object qNota: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Filial, NumNota, Serie'
      'FROM "dbNotaFiscal.DB" Dbnotafiscal'
      'WHERE   (NumNota = :NumNota)  '
      '   AND  (Filial = :Filial)  '
      '   AND  (Serie = :Serie)  ')
    Left = 472
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NumNota'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Serie'
        ParamType = ptUnknown
      end>
    object qNotaFilial: TIntegerField
      FieldName = 'Filial'
      Origin = 'TABELAS."dbNotaFiscal.DB".Filial'
    end
    object qNotaNumNota: TIntegerField
      FieldName = 'NumNota'
      Origin = 'TABELAS."dbNotaFiscal.DB".NumNota'
    end
    object qNotaSerie: TStringField
      FieldName = 'Serie'
      Origin = 'TABELAS."dbNotaFiscal.DB".Serie'
      Size = 3
    end
  end
end
