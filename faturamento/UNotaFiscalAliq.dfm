object fNotaFiscalAliq: TfNotaFiscalAliq
  Left = 189
  Top = 215
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Aliquotas do Item'
  ClientHeight = 234
  ClientWidth = 661
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 329
    Top = 49
    Width = 31
    Height = 13
    Caption = '% PIS:'
  end
  object Label2: TLabel
    Left = 307
    Top = 72
    Width = 53
    Height = 13
    Caption = '% COFINS:'
  end
  object Label3: TLabel
    Left = 473
    Top = 49
    Width = 47
    Height = 13
    Caption = 'Valor PIS:'
  end
  object Label4: TLabel
    Left = 451
    Top = 72
    Width = 69
    Height = 13
    Caption = 'Valor COFINS:'
  end
  object Label7: TLabel
    Left = 20
    Top = 52
    Width = 42
    Height = 13
    Caption = 'C'#243'd. Pis:'
  end
  object Label23: TLabel
    Left = 5
    Top = 76
    Width = 57
    Height = 13
    Caption = 'C'#243'd. Cofins:'
  end
  object Label5: TLabel
    Left = 148
    Top = 52
    Width = 24
    Height = 13
    Caption = 'Tipo:'
  end
  object Label6: TLabel
    Left = 148
    Top = 76
    Width = 24
    Height = 13
    Caption = 'Tipo:'
  end
  object Label8: TLabel
    Left = 25
    Top = 23
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = 'Origem:'
  end
  object Label9: TLabel
    Left = 2
    Top = 167
    Width = 187
    Height = 13
    Alignment = taRightJustify
    Caption = 'Item Soma no Total da Nota (Produtos):'
  end
  object Label10: TLabel
    Left = 100
    Top = 113
    Width = 67
    Height = 13
    Caption = '% Importa'#231#227'o:'
  end
  object Label11: TLabel
    Left = 252
    Top = 113
    Width = 79
    Height = 13
    Caption = 'Desp.Aduaneira:'
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 362
    Top = 41
    Width = 73
    Height = 21
    AutoSize = False
    DisplayFormat = '0.00'
    TabOrder = 3
  end
  object CurrencyEdit2: TCurrencyEdit
    Left = 362
    Top = 64
    Width = 73
    Height = 21
    AutoSize = False
    DisplayFormat = '0.00'
    TabOrder = 7
  end
  object CurrencyEdit3: TCurrencyEdit
    Left = 522
    Top = 41
    Width = 73
    Height = 21
    AutoSize = False
    DisplayFormat = '0.00'
    TabOrder = 4
  end
  object CurrencyEdit4: TCurrencyEdit
    Left = 522
    Top = 64
    Width = 73
    Height = 21
    AutoSize = False
    DisplayFormat = '0.00'
    TabOrder = 8
  end
  object RxDBCodPis: TRxDBLookupCombo
    Left = 63
    Top = 44
    Width = 83
    Height = 21
    DropDownCount = 8
    DropDownWidth = 300
    LookupField = 'Codigo'
    LookupDisplay = 'Codigo;Nome'
    LookupSource = DMTabImposto.dsTabPis
    TabOrder = 1
  end
  object RXDBCodCofins: TRxDBLookupCombo
    Left = 63
    Top = 68
    Width = 83
    Height = 21
    DropDownCount = 8
    DropDownWidth = 300
    LookupField = 'Codigo'
    LookupDisplay = 'Codigo;Nome'
    LookupSource = DMTabImposto.dsTabPis
    TabOrder = 5
  end
  object cbTipoPis: TComboBox
    Left = 174
    Top = 44
    Width = 89
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = 'Percentual'
    Items.Strings = (
      'Percentual'
      'Valor')
  end
  object cbTipoCofins: TComboBox
    Left = 174
    Top = 68
    Width = 89
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 6
    Text = 'Percentual'
    Items.Strings = (
      'Percentual'
      'Valor')
  end
  object rxdbOrigem: TRxDBLookupCombo
    Left = 63
    Top = 15
    Width = 280
    Height = 21
    DropDownCount = 8
    DropDownWidth = 150
    LookupField = 'Origem'
    LookupDisplay = 'Origem;Nome'
    LookupDisplayIndex = 1
    LookupSource = DMTabImposto.dsOrigemProd
    TabOrder = 0
  end
  object cbSomaTotal: TComboBox
    Left = 191
    Top = 161
    Width = 72
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 12
    Text = 'Sim'
    Items.Strings = (
      'Sim'
      'N'#227'o')
  end
  object Panel1: TPanel
    Left = 0
    Top = 197
    Width = 661
    Height = 37
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 13
    object BitBtn1: TBitBtn
      Left = 224
      Top = 5
      Width = 91
      Height = 28
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 315
      Top = 5
      Width = 91
      Height = 28
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object cePercImportacao: TCurrencyEdit
    Left = 170
    Top = 105
    Width = 73
    Height = 21
    AutoSize = False
    DisplayFormat = '0.00'
    TabOrder = 9
  end
  object ceDespAduaneira: TCurrencyEdit
    Left = 332
    Top = 105
    Width = 102
    Height = 21
    AutoSize = False
    DisplayFormat = '0.00'
    TabOrder = 10
  end
  object ckSomaImportacao: TCheckBox
    Left = 456
    Top = 107
    Width = 177
    Height = 17
    Caption = 'Soma autom'#225'tico a importa'#231#227'o'
    TabOrder = 11
  end
end
