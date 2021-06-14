object fNFeEmail: TfNFeEmail
  Left = 114
  Top = 215
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Email'
  ClientHeight = 109
  ClientWidth = 679
  Color = clBtnFace
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
    Top = 0
    Width = 679
    Height = 39
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 6
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 81
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 39
    Width = 679
    Height = 70
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 64
      Top = 11
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Label6: TLabel
      Left = 67
      Top = 33
      Width = 28
      Height = 13
      Caption = 'Email:'
    end
    object Label1: TLabel
      Left = 594
      Top = 12
      Width = 14
      Height = 13
      Caption = 'ID:'
    end
    object DBEdit1: TDBEdit
      Left = 611
      Top = 5
      Width = 62
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'ID'
      DataSource = DMNFeFB.dsNFE_EMAIL
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 99
      Top = 5
      Width = 326
      Height = 21
      DataField = 'NOME'
      DataSource = DMNFeFB.dsNFE_EMAIL
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 99
      Top = 30
      Width = 326
      Height = 21
      DataField = 'EMAIL'
      DataSource = DMNFeFB.dsNFE_EMAIL
      TabOrder = 1
    end
  end
end
