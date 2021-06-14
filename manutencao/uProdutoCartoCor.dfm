object fProdutoCartoCor: TfProdutoCartoCor
  Left = 193
  Top = 239
  Width = 489
  Height = 254
  Caption = 'fProdutoCartoCor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 80
    Width = 27
    Height = 13
    Alignment = taRightJustify
    Caption = 'Lado:'
  end
  object Label2: TLabel
    Left = 90
    Top = 104
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'Posi'#231#227'o:'
  end
  object Label10: TLabel
    Left = 109
    Top = 128
    Width = 19
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cor:'
  end
  object Label33: TLabel
    Left = 88
    Top = 152
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = 'Material:'
  end
  object Label13: TLabel
    Left = 84
    Top = 176
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = 'Consumo:'
  end
  object RxDBComboBox14: TRxDBComboBox
    Left = 136
    Top = 72
    Width = 169
    Height = 21
    Style = csDropDownList
    EnableValues = True
    ItemHeight = 13
    Items.Strings = (
      'FRENTE'
      'VERSO')
    TabOrder = 0
    Values.Strings = (
      'F'
      'V')
  end
  object RxDBComboBox1: TRxDBComboBox
    Left = 136
    Top = 96
    Width = 169
    Height = 21
    Style = csDropDownList
    EnableValues = True
    ItemHeight = 13
    Items.Strings = (
      'FUNDO / CARTUCHO / SACOLA'
      'TAMPA'
      'SUPORTE')
    TabOrder = 1
    Values.Strings = (
      'F'
      'V')
  end
  object RxDBLookupCombo5: TRxDBLookupCombo
    Left = 136
    Top = 144
    Width = 281
    Height = 21
    DropDownCount = 8
    DataSource = dmProdutoCarto.dsProdutoCarto
    LookupSource = dmProdutoCarto.dsProdutoCarto
    TabOrder = 3
  end
  object RxDBLookupCombo2: TRxDBLookupCombo
    Left = 136
    Top = 120
    Width = 281
    Height = 21
    DropDownCount = 8
    DataSource = dmProdutoCarto.dsProdutoCarto
    LookupSource = dmProdutoCarto.dsProdutoCarto
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 481
    Height = 29
    Align = alTop
    TabOrder = 5
    object BitBtn1: TBitBtn
      Left = 2
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Confirmar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 77
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Ca&ncelar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object DBEdit8: TDBEdit
    Left = 136
    Top = 168
    Width = 121
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 4
  end
end
