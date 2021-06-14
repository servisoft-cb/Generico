object fTabIBPT: TfTabIBPT
  Left = 214
  Top = 184
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Email'
  ClientHeight = 387
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
    Color = clSilver
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
    Height = 348
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 594
      Top = 12
      Width = 14
      Height = 13
      Caption = 'ID:'
    end
    object Label3: TLabel
      Left = 5
      Top = 21
      Width = 90
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo NCM/NBS:'
    end
    object Label4: TLabel
      Left = 64
      Top = 42
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome:'
    end
    object Label5: TLabel
      Left = 78
      Top = 63
      Width = 17
      Height = 13
      Alignment = taRightJustify
      Caption = 'EX:'
    end
    object Label38: TLabel
      Left = 59
      Top = 84
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tabela:'
    end
    object Label7: TLabel
      Left = 39
      Top = 105
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = '% Nacional:'
    end
    object Label8: TLabel
      Left = 228
      Top = 105
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = '% Importa'#231#227'o:'
    end
    object Label2: TLabel
      Left = 40
      Top = 127
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = '% Estadual:'
    end
    object Label6: TLabel
      Left = 236
      Top = 127
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = '% Municipal:'
    end
    object Label13: TLabel
      Left = 4
      Top = 148
      Width = 91
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt. In'#237'cio Vig'#234'ncia:'
    end
    object Label14: TLabel
      Left = 209
      Top = 148
      Width = 86
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt. Final Vig'#234'ncia:'
    end
    object Label15: TLabel
      Left = 61
      Top = 171
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Chave:'
    end
    object Label16: TLabel
      Left = 59
      Top = 193
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vers'#227'o:'
    end
    object Label17: TLabel
      Left = 65
      Top = 215
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fonte:'
    end
    object DBEdit1: TDBEdit
      Left = 611
      Top = 5
      Width = 62
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'ID'
      DataSource = DMTabIBPT.dsIBPT
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 96
      Top = 13
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DMTabIBPT.dsIBPT
      TabOrder = 1
    end
    object DBEdit7: TDBEdit
      Left = 96
      Top = 34
      Width = 552
      Height = 21
      DataField = 'NOME'
      DataSource = DMTabIBPT.dsIBPT
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 96
      Top = 55
      Width = 100
      Height = 21
      CharCase = ecUpperCase
      DataField = 'EX'
      DataSource = DMTabIBPT.dsIBPT
      TabOrder = 3
    end
    object RxDBComboBox2: TRxDBComboBox
      Left = 96
      Top = 76
      Width = 100
      Height = 21
      Style = csDropDownList
      DataField = 'TABELA'
      DataSource = DMTabIBPT.dsIBPT
      EnableValues = True
      ItemHeight = 13
      Items.Strings = (
        '0=NCM'
        '1=NBS')
      TabOrder = 4
      Values.Strings = (
        '0'
        '1')
    end
    object DBEdit6: TDBEdit
      Left = 96
      Top = 97
      Width = 100
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PERC_NACIONAL'
      DataSource = DMTabIBPT.dsIBPT
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 296
      Top = 97
      Width = 100
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PERC_IMPORTACAO'
      DataSource = DMTabIBPT.dsIBPT
      TabOrder = 6
    end
    object DBEdit3: TDBEdit
      Left = 96
      Top = 119
      Width = 100
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PERC_ESTADUAL'
      DataSource = DMTabIBPT.dsIBPT
      TabOrder = 7
    end
    object DBEdit4: TDBEdit
      Left = 296
      Top = 119
      Width = 100
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PERC_MUNICIPAL'
      DataSource = DMTabIBPT.dsIBPT
      TabOrder = 8
    end
    object DBDateEdit1: TDBDateEdit
      Left = 96
      Top = 141
      Width = 105
      Height = 21
      DataField = 'DT_INICIO'
      DataSource = DMTabIBPT.dsIBPT
      NumGlyphs = 2
      TabOrder = 9
    end
    object DBDateEdit2: TDBDateEdit
      Left = 296
      Top = 141
      Width = 105
      Height = 21
      DataField = 'DT_FINAL'
      DataSource = DMTabIBPT.dsIBPT
      NumGlyphs = 2
      TabOrder = 10
    end
    object DBEdit9: TDBEdit
      Left = 96
      Top = 163
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CHAVE'
      DataSource = DMTabIBPT.dsIBPT
      TabOrder = 11
    end
    object DBEdit10: TDBEdit
      Left = 96
      Top = 185
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      DataField = 'VERSAO'
      DataSource = DMTabIBPT.dsIBPT
      TabOrder = 12
    end
    object DBEdit11: TDBEdit
      Left = 96
      Top = 207
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      DataField = 'FONTE'
      DataSource = DMTabIBPT.dsIBPT
      TabOrder = 13
    end
  end
end
