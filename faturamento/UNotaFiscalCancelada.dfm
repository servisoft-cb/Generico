object fNotaFiscalCancelada: TfNotaFiscalCancelada
  Left = 17
  Top = 88
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fNotaFiscalCancelada'
  ClientHeight = 93
  ClientWidth = 770
  Color = 10545150
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object RxLabel1: TRxLabel
    Left = 8
    Top = 16
    Width = 52
    Height = 13
    Caption = 'N'#186' Nota:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 61
    Top = 16
    Width = 65
    Height = 12
    Alignment = taCenter
    DataField = 'NumNota'
    DataSource = DM1.dsNotaFiscal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = -1
    Top = 35
    Width = 772
    Height = 3
    Shape = bsTopLine
    Style = bsRaised
  end
  object RxLabel2: TRxLabel
    Left = 8
    Top = 52
    Width = 146
    Height = 13
    Caption = 'Motivo do cancelamento:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 5
    Top = 68
    Width = 761
    Height = 21
    CharCase = ecUpperCase
    Color = clAqua
    DataField = 'MotivoCanc'
    DataSource = DM1.dsNotaFiscal
    TabOrder = 0
  end
  object BitBtn5: TBitBtn
    Left = 664
    Top = 6
    Width = 95
    Height = 25
    Hint = 'Fecha a janela atual'
    Caption = '&Fechar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BitBtn5Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000CE0E0000D80E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0038383838380E
      038383838383830E603800000000380E660033333330830E660333333330000E
      660333330030330E660333330E00330E660300000EE0330E06030EEEEEE6030E
      660300000E60330E660333330600330E660333330030330E6603333333303330
      E6033333333033330E0333333330000000033333333333333333}
  end
end
