object fAtualizaDtVencto2: TfAtualizaDtVencto2
  Left = 186
  Top = 183
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Atualiza a data do financeiro'
  ClientHeight = 117
  ClientWidth = 339
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
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 73
    Height = 13
    Caption = 'Tipo Cobran'#231'a:'
  end
  object BitBtn1: TBitBtn
    Left = 112
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 188
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 48
    Width = 313
    Height = 17
    TabOrder = 2
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 91
    Top = 16
    Width = 241
    Height = 21
    DropDownCount = 8
    LookupField = 'Codigo'
    LookupDisplay = 'Nome'
    LookupSource = DM1.dsTipoCobranca
    TabOrder = 3
    OnEnter = RxDBLookupCombo1Enter
  end
end
