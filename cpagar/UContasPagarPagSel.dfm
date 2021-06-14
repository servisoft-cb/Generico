object fContasPagarPagSel: TfContasPagarPagSel
  Left = 128
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pagamentos Selecionados'
  ClientHeight = 190
  ClientWidth = 536
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
  object Shape1: TShape
    Left = 0
    Top = 112
    Width = 537
    Height = 39
    Brush.Color = clMoneyGreen
  end
  object Label1: TLabel
    Left = 55
    Top = 16
    Width = 31
    Height = 13
    Caption = 'Conta:'
  end
  object Label2: TLabel
    Left = 3
    Top = 40
    Width = 83
    Height = 13
    Caption = 'Data Pagamento:'
  end
  object Label3: TLabel
    Left = 31
    Top = 130
    Width = 55
    Height = 13
    Caption = 'N'#186' Cheque:'
  end
  object Label4: TLabel
    Left = 275
    Top = 130
    Width = 55
    Height = 13
    Caption = 'Dt.Previsto:'
  end
  object Label12: TLabel
    Left = 9
    Top = 65
    Width = 76
    Height = 13
    Caption = 'Plano de Conta:'
  end
  object SpeedButton8: TSpeedButton
    Left = 332
    Top = 53
    Width = 25
    Height = 25
    Hint = 'Abre o cadastro do plano de contas'
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
      000088888880FFFFFFF088888880F00F00F088888880FFFFFFF088888880F00F
      00F088888880FFFFFFF088888884444444448800008444444444880BB0888888
      8888000BB000888888880BBBBBB0888888880BBBBBB088888888000BB0008888
      8888880BB088888888888800008888888888}
    ParentShowHint = False
    ShowHint = True
  end
  object Label15: TLabel
    Left = 32
    Top = 90
    Width = 53
    Height = 13
    Caption = 'Sub-Conta:'
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 87
    Top = 8
    Width = 313
    Height = 21
    DropDownCount = 8
    LookupField = 'CodConta'
    LookupDisplay = 'NomeConta'
    LookupSource = DM1.dsContas
    TabOrder = 0
    OnEnter = RxDBLookupCombo1Enter
  end
  object DateEdit1: TDateEdit
    Left = 87
    Top = 32
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
    OnExit = DateEdit1Exit
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 88
    Top = 122
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 0
    DisplayFormat = '0'
    TabOrder = 4
  end
  object DateEdit2: TDateEdit
    Left = 332
    Top = 122
    Width = 109
    Height = 21
    NumGlyphs = 2
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 184
    Top = 154
    Width = 88
    Height = 31
    Caption = 'Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 154
    Width = 88
    Height = 31
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = BitBtn2Click
  end
  object RxDBLookupCombo3: TRxDBLookupCombo
    Left = 87
    Top = 57
    Width = 243
    Height = 21
    DropDownCount = 18
    LookupField = 'Codigo'
    LookupDisplay = 'Descricao'
    LookupSource = DM1.dsPlanoContas
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    OnDropDown = RxDBLookupCombo3DropDown
    OnEnter = RxDBLookupCombo3Enter
  end
  object RxDBLookupCombo4: TRxDBLookupCombo
    Left = 87
    Top = 82
    Width = 243
    Height = 21
    DropDownCount = 18
    LookupField = 'CodItem'
    LookupDisplay = 'Nome'
    LookupSource = DM1.dsPlanoContasItens
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    OnEnter = RxDBLookupCombo4Enter
  end
end
