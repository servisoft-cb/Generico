object fBaixaBeneficiamento: TfBaixaBeneficiamento
  Left = 360
  Top = 173
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Baixa Beneficiamento'
  ClientHeight = 175
  ClientWidth = 489
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 8
    Width = 41
    Height = 13
    Caption = 'N'#186' Nota:'
  end
  object DBText1: TDBText
    Left = 104
    Top = 8
    Width = 42
    Height = 13
    AutoSize = True
    DataField = 'NumNEntr'
    DataSource = fConsNotaBeneficiamento.dsqNotaEntrada
  end
  object Label2: TLabel
    Left = 40
    Top = 24
    Width = 57
    Height = 13
    Caption = 'Fornecedor:'
  end
  object DBText2: TDBText
    Left = 104
    Top = 24
    Width = 42
    Height = 13
    AutoSize = True
    DataField = 'NomeForn'
    DataSource = fConsNotaBeneficiamento.dsqNotaEntrada
  end
  object Label3: TLabel
    Left = 74
    Top = 41
    Width = 23
    Height = 13
    Caption = 'Item:'
  end
  object DBText3: TDBText
    Left = 104
    Top = 41
    Width = 42
    Height = 13
    AutoSize = True
    DataField = 'Item'
    DataSource = fConsNotaBeneficiamento.dsqNotaEntrada
  end
  object Label4: TLabel
    Left = 10
    Top = 66
    Width = 87
    Height = 13
    Caption = 'Qtd. Pendente:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText4: TDBText
    Left = 104
    Top = 66
    Width = 50
    Height = 13
    AutoSize = True
    DataField = 'QtdRestante'
    DataSource = fConsNotaBeneficiamento.dsqNotaEntrada
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 10
    Top = 122
    Width = 90
    Height = 13
    Caption = 'Qtd. Devolvida:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 104
    Top = 114
    Width = 121
    Height = 21
    DataField = 'Qtd'
    DataSource = DM1.dsNEntradaItensBenef
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 104
    Top = 144
    Width = 80
    Height = 29
    Caption = 'Confirma'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 184
    Top = 144
    Width = 80
    Height = 29
    Caption = 'Cancela'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
