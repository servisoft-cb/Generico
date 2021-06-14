object fCopiaCli: TfCopiaCli
  Left = 140
  Top = 159
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Copia Cliente para a Transportadora'
  ClientHeight = 130
  ClientWidth = 489
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
    Width = 489
    Height = 130
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 37
      Top = 17
      Width = 130
      Height = 13
      Caption = 'Seleciona Cliente p/ Nome:'
    end
    object Label2: TLabel
      Left = 10
      Top = 43
      Width = 157
      Height = 13
      Caption = 'Seleciona Cliente p/ Nome Fant.:'
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 169
      Top = 9
      Width = 304
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsCliente
      TabOrder = 0
      OnEnter = RxDBLookupCombo1Enter
      OnExit = RxDBLookupCombo1Exit
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 169
      Top = 35
      Width = 304
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'Fantasia'
      LookupSource = DM1.dsCliente
      TabOrder = 1
      OnEnter = RxDBLookupCombo2Enter
      OnExit = RxDBLookupCombo2Exit
    end
    object Panel2: TPanel
      Left = 136
      Top = 73
      Width = 217
      Height = 41
      TabOrder = 2
      object BitBtn1: TBitBtn
        Left = 8
        Top = 8
        Width = 100
        Height = 25
        Hint = 'Copia o fornecedor selecionado acima'
        Caption = '&Copiar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn1Click
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888800008888888888888888888800008888777777778888888800008800
          00000000788888880000880BFFFBFFF0777777880000880F444444F000000078
          0000880FFBFFFBF0FBFFF0780000880F444444F04444F0780000880BFFFBFFF0
          FFFBF0780000880F444444F04444F0780000880FFBFFFBF0FBFFF0780000880F
          44F000004440F0780000880BFFF0FFF0FFFBF0780000880F44F0FB00F0000078
          0000880FFBF0F0FFF0FFF0880000880000000F44F0FB08880000888888880FFB
          F0F0888800008888888800000008888800008888888888888888888800008888
          88888888888888880000}
      end
      object BitBtn2: TBitBtn
        Left = 109
        Top = 8
        Width = 100
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        TabOrder = 1
        OnClick = BitBtn2Click
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
  end
end
