object fCupomFiscalOpcoes: TfCupomFiscalOpcoes
  Left = 365
  Top = 194
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Op'#231#245'es do Cupom Fiscal'
  ClientHeight = 173
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 13
    Top = 16
    Width = 137
    Height = 36
    Caption = 'Leitura X'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 13
    Top = 51
    Width = 137
    Height = 36
    Caption = 'Redu'#231#227'o Z'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 13
    Top = 86
    Width = 137
    Height = 36
    Caption = 'L'#234' Mem'#243'ria Fiscal'
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 13
    Top = 121
    Width = 137
    Height = 36
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = BitBtn4Click
  end
  object ComboBox1: TComboBox
    Left = 152
    Top = 24
    Width = 201
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 4
    Text = 'iLeitura'
    Visible = False
    Items.Strings = (
      'iLeitura'
      'rLeitura')
  end
  object ComboBox2: TComboBox
    Left = 152
    Top = 92
    Width = 201
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 5
    Text = 'iMFLer_ECF_Daruma'
    Visible = False
    Items.Strings = (
      'iMFLer_ECF_Daruma'
      'iMFLerSerial_ECF_Daruma')
  end
end
