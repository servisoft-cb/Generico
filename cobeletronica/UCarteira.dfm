object fCarteira: TfCarteira
  Left = 194
  Top = 184
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cobran'#231'a Eletr'#244'nica'
  ClientHeight = 226
  ClientWidth = 635
  Color = clBtnFace
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
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
    Width = 635
    Height = 187
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 501
      Top = 10
      Width = 14
      Height = 13
      Caption = 'ID:'
    end
    object Label2: TLabel
      Left = 75
      Top = 16
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'd. Carteira:'
    end
    object Label3: TLabel
      Left = 80
      Top = 86
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'd. Banco:'
    end
    object Label4: TLabel
      Left = 59
      Top = 110
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome do Banco:'
    end
    object Label5: TLabel
      Left = 33
      Top = 62
      Width = 105
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o da Carteira:'
    end
    object Label6: TLabel
      Left = 4
      Top = 39
      Width = 135
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'd. Carteira Imp. no Boleto:'
    end
    object DBEdit1: TDBEdit
      Left = 517
      Top = 2
      Width = 102
      Height = 21
      TabStop = False
      Color = clScrollBar
      DataField = 'ID'
      DataSource = DMCarteira.dsCarteira
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit2: TDBEdit
      Left = 141
      Top = 8
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODCARTEIRA'
      DataSource = DMCarteira.dsCarteira
      TabOrder = 0
      OnExit = DBEdit2Exit
    end
    object DBEdit3: TDBEdit
      Left = 141
      Top = 78
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODBANCO'
      DataSource = DMCarteira.dsCarteira
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 141
      Top = 102
      Width = 305
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOMEBANCO'
      DataSource = DMCarteira.dsCarteira
      TabOrder = 4
    end
    object DBEdit5: TDBEdit
      Left = 140
      Top = 54
      Width = 450
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOMECARTEIRA'
      DataSource = DMCarteira.dsCarteira
      TabOrder = 2
    end
    object DBCheckBox1: TDBCheckBox
      Left = 141
      Top = 128
      Width = 193
      Height = 17
      Caption = 'Gerar Nosso N'#250'mero'
      DataField = 'GERARNOSSONUMERO'
      DataSource = DMCarteira.dsCarteira
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 141
      Top = 150
      Width = 193
      Height = 17
      Caption = 'Gerar Remessa para o banco'
      DataField = 'GERARREMESSA'
      DataSource = DMCarteira.dsCarteira
      TabOrder = 6
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBEdit6: TDBEdit
      Left = 141
      Top = 31
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODCARTEIRA_IMP'
      DataSource = DMCarteira.dsCarteira
      TabOrder = 1
    end
  end
end
