object fNotaFiscalContingencia: TfNotaFiscalContingencia
  Left = 73
  Top = 187
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Conting'#234'ncia'
  ClientHeight = 219
  ClientWidth = 770
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object RxLabel2: TRxLabel
    Left = 14
    Top = 84
    Width = 123
    Height = 13
    Caption = 'Motivo Conting'#234'ncia:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RxLabel1: TRxLabel
    Left = 16
    Top = 24
    Width = 198
    Height = 13
    Caption = 'Data de Entrada em Conting'#234'ncia:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RxLabel3: TRxLabel
    Left = 16
    Top = 49
    Width = 198
    Height = 13
    Caption = 'Hora de Entrada em Conting'#234'ncia:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtn5: TBitBtn
    Left = 610
    Top = 188
    Width = 143
    Height = 27
    Hint = 'Fecha a janela atual'
    Caption = 'Confirmar/Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BitBtn5Click
  end
  object DBMemo2: TDBMemo
    Left = 11
    Top = 98
    Width = 742
    Height = 79
    Ctl3D = False
    DataField = 'MotivoContingencia'
    DataSource = DM1.dsNotaFiscal
    MaxLength = 250
    ParentCtl3D = False
    ScrollBars = ssVertical
    TabOrder = 2
    OnKeyPress = DBMemo2KeyPress
  end
  object DBDateEdit1: TDBDateEdit
    Left = 216
    Top = 16
    Width = 121
    Height = 21
    DataField = 'DtContingencia'
    DataSource = DM1.dsNotaFiscal
    NumGlyphs = 2
    TabOrder = 0
  end
  object RzDBDateTimeEdit2: TRzDBDateTimeEdit
    Left = 216
    Top = 41
    Width = 91
    Height = 21
    DataSource = DM1.dsNotaFiscal
    DataField = 'HrContingencia'
    Ctl3D = True
    MaxLength = 4
    ParentCtl3D = False
    TabOrder = 1
    EditType = etTime
    Format = 'hh:nn:ss'
  end
end
