object fNotaFiscalCCeDet: TfNotaFiscalCCeDet
  Left = 107
  Top = 9
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Carta de Corre'#231#227'o Eletr'#244'nica'
  ClientHeight = 692
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
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 770
    Height = 274
    Align = alTop
    Caption = ' Motivo '
    TabOrder = 0
    object DBMemo1: TDBMemo
      Left = 2
      Top = 15
      Width = 766
      Height = 257
      Align = alClient
      DataField = 'MOTIVO'
      DataSource = DMNFeFB.dsNotaFiscal_NFe
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 274
    Width = 770
    Height = 37
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 1
    object BitBtn2: TBitBtn
      Left = 610
      Top = 6
      Width = 143
      Height = 27
      Hint = 'Fecha a janela atual'
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 311
    Width = 770
    Height = 381
    Align = alClient
    Caption = 'XML'
    TabOrder = 2
    object DBMemo2: TDBMemo
      Left = 2
      Top = 15
      Width = 766
      Height = 364
      Align = alClient
      DataField = 'XML'
      DataSource = DMNFeFB.dsNotaFiscal_NFe
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
