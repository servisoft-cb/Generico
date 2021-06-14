object fCupomFiscalCli: TfCupomFiscalCli
  Left = 343
  Top = 217
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fCupomFiscalCli - Cliente'
  ClientHeight = 117
  ClientWidth = 459
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
    Left = 48
    Top = 32
    Width = 35
    Height = 13
    Caption = 'Cliente:'
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 85
    Top = 24
    Width = 340
    Height = 21
    DropDownCount = 8
    DataField = 'CODCLIENTE'
    DataSource = DMCupom.dsCupomFiscal
    LookupField = 'Codigo'
    LookupDisplay = 'Nome'
    LookupSource = DM1.dsCliente
    TabOrder = 0
    OnEnter = RxDBLookupCombo1Enter
  end
  object Panel1: TPanel
    Left = 0
    Top = 76
    Width = 459
    Height = 41
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 154
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 229
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
end
