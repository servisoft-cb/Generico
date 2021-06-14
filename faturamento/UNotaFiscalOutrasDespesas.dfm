object fNotaFiscalOutrasDespesas: TfNotaFiscalOutrasDespesas
  Left = 276
  Top = 174
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informar outras despesas'
  ClientHeight = 346
  ClientWidth = 528
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
  object BitBtn1: TBitBtn
    Left = 445
    Top = 311
    Width = 78
    Height = 28
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 528
    Height = 303
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 1
    object Label1: TLabel
      Left = 82
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Valor Pis:'
    end
    object Label2: TLabel
      Left = 67
      Top = 40
      Width = 59
      Height = 13
      Caption = 'Valor Cofins:'
    end
    object Label3: TLabel
      Left = 24
      Top = 88
      Width = 102
      Height = 13
      Caption = 'Valor Taxa Siscomex:'
    end
    object Label4: TLabel
      Left = 54
      Top = 160
      Width = 72
      Height = 13
      Caption = 'Outros Valores:'
    end
    object Label5: TLabel
      Left = 275
      Top = 135
      Width = 40
      Height = 13
      Caption = '% ICMS:'
    end
    object Bevel1: TBevel
      Left = -1
      Top = 184
      Width = 532
      Height = 4
      Shape = bsTopLine
    end
    object Label21: TLabel
      Left = 40
      Top = 205
      Width = 69
      Height = 13
      Caption = 'Valor do Frete:'
    end
    object Label6: TLabel
      Left = 275
      Top = 200
      Width = 40
      Height = 13
      Caption = '% ICMS:'
    end
    object Bevel2: TBevel
      Left = -2
      Top = 245
      Width = 532
      Height = 4
      Shape = bsTopLine
    end
    object Bevel3: TBevel
      Left = -1
      Top = 291
      Width = 532
      Height = 4
      Shape = bsTopLine
    end
    object Label22: TLabel
      Left = 24
      Top = 268
      Width = 79
      Height = 13
      Caption = 'Valor do Seguro:'
    end
    object Label7: TLabel
      Left = 12
      Top = 111
      Width = 114
      Height = 13
      Caption = 'Vlr. Imposto Importa'#231#227'o:'
    end
    object Bevel4: TBevel
      Left = -4
      Top = 64
      Width = 532
      Height = 4
      Shape = bsTopLine
    end
    object Label8: TLabel
      Left = 275
      Top = 11
      Width = 40
      Height = 13
      Caption = '% ICMS:'
    end
    object Label9: TLabel
      Left = 57
      Top = 135
      Width = 69
      Height = 13
      Caption = 'Vlr. Aduaneira:'
    end
    object DBEdit1: TDBEdit
      Left = 128
      Top = 8
      Width = 121
      Height = 21
      DataField = 'VlrPis'
      DataSource = DM1.dsNotaFiscal
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 128
      Top = 32
      Width = 121
      Height = 21
      DataField = 'VlrCofins'
      DataSource = DM1.dsNotaFiscal
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 128
      Top = 80
      Width = 121
      Height = 21
      DataField = 'VlrTaxaCiscomex'
      DataSource = DM1.dsNotaFiscal
      TabOrder = 5
    end
    object DBEdit4: TDBEdit
      Left = 128
      Top = 152
      Width = 121
      Height = 21
      DataField = 'VlrOutros'
      DataSource = DM1.dsNotaFiscal
      TabOrder = 8
    end
    object DBEdit16: TDBEdit
      Left = 113
      Top = 197
      Width = 89
      Height = 21
      CharCase = ecUpperCase
      DataField = 'VlrFrete'
      DataSource = DM1.dsNotaFiscal
      TabOrder = 11
    end
    object DBEdit17: TDBEdit
      Left = 112
      Top = 260
      Width = 89
      Height = 21
      CharCase = ecUpperCase
      DataField = 'VlrSeguro'
      DataSource = DM1.dsNotaFiscal
      TabOrder = 14
    end
    object DBEdit5: TDBEdit
      Left = 128
      Top = 103
      Width = 121
      Height = 21
      DataField = 'VlrImpImportacao'
      DataSource = DM1.dsNotaFiscal
      TabOrder = 6
    end
    object CheckBox5: TCheckBox
      Left = 320
      Top = 43
      Width = 160
      Height = 17
      Caption = 'Somar em Outras Despesas'
      TabOrder = 4
    end
    object DBCheckBox1: TDBCheckBox
      Left = 320
      Top = 26
      Width = 113
      Height = 17
      Caption = 'Somar Duplicatas'
      DataField = 'GeraDupl_PisCofins'
      DataSource = DM1.dsNotaFiscal
      TabOrder = 3
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 320
      Top = 156
      Width = 113
      Height = 17
      Caption = 'Somar Duplicatas'
      DataField = 'GeraDupl_OutrosValores'
      DataSource = DM1.dsNotaFiscal
      TabOrder = 10
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBCheckBox3: TDBCheckBox
      Left = 320
      Top = 222
      Width = 113
      Height = 17
      Caption = 'Somar Duplicatas'
      DataField = 'GeraDupl_Frete'
      DataSource = DM1.dsNotaFiscal
      TabOrder = 13
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBCheckBox4: TDBCheckBox
      Left = 320
      Top = 262
      Width = 113
      Height = 17
      Caption = 'Somar Duplicatas'
      DataField = 'GeraDupl_Seguro'
      DataSource = DM1.dsNotaFiscal
      TabOrder = 15
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBEdit6: TDBEdit
      Left = 320
      Top = 4
      Width = 81
      Height = 21
      DataField = 'AliqICMS_PisCofins'
      DataSource = DM1.dsNotaFiscal
      TabOrder = 2
    end
    object DBEdit7: TDBEdit
      Left = 320
      Top = 127
      Width = 81
      Height = 21
      DataField = 'AliqICMS_OutrosValores'
      DataSource = DM1.dsNotaFiscal
      TabOrder = 9
    end
    object DBEdit8: TDBEdit
      Left = 320
      Top = 196
      Width = 81
      Height = 21
      DataField = 'AliqICMS_Frete'
      DataSource = DM1.dsNotaFiscal
      TabOrder = 12
    end
    object DBEdit9: TDBEdit
      Left = 128
      Top = 127
      Width = 121
      Height = 21
      DataField = 'VlrAduaneira'
      DataSource = DM1.dsNotaFiscal
      TabOrder = 7
    end
  end
end
