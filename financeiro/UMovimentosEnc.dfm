object fMovimentosEnc: TfMovimentosEnc
  Left = 313
  Top = 251
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Encerra o per'#237'odo'
  ClientHeight = 182
  ClientWidth = 369
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
    Left = 24
    Top = 16
    Width = 31
    Height = 13
    Caption = 'Conta:'
  end
  object Label2: TLabel
    Left = 16
    Top = 59
    Width = 115
    Height = 13
    Caption = 'Dt.'#218'ltimo Encerramento:'
  end
  object Label3: TLabel
    Left = 45
    Top = 104
    Width = 86
    Height = 13
    Caption = 'Dt. Encerramento:'
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 58
    Top = 8
    Width = 279
    Height = 21
    DropDownCount = 8
    LookupField = 'CodConta'
    LookupDisplay = 'NomeConta'
    LookupSource = DM1.dsContas
    TabOrder = 0
    OnExit = RxDBLookupCombo1Exit
  end
  object DateEdit1: TDateEdit
    Left = 136
    Top = 51
    Width = 121
    Height = 21
    TabStop = False
    NumGlyphs = 2
    ReadOnly = True
    TabOrder = 1
  end
  object DateEdit2: TDateEdit
    Left = 136
    Top = 96
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 141
    Width = 369
    Height = 41
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 3
    object BitBtn2: TBitBtn
      Left = 192
      Top = 8
      Width = 80
      Height = 28
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = BitBtn2Click
    end
    object BitBtn1: TBitBtn
      Left = 112
      Top = 8
      Width = 80
      Height = 28
      Caption = 'Confirmar'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
end
