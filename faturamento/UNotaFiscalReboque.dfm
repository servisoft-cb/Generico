object fNotaFiscalReboque: TfNotaFiscalReboque
  Left = 209
  Top = 207
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados de Importa'#231#227'o'
  ClientHeight = 288
  ClientWidth = 477
  Color = clMoneyGreen
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
  object Label1: TLabel
    Left = 34
    Top = 16
    Width = 30
    Height = 13
    Alignment = taRightJustify
    Caption = 'Placa:'
  end
  object Label2: TLabel
    Left = 28
    Top = 40
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = 'Estado:'
  end
  object Label3: TLabel
    Left = 31
    Top = 64
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'RNTC:'
  end
  object Edit1: TEdit
    Left = 66
    Top = 8
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 0
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 66
    Top = 32
    Width = 87
    Height = 21
    DropDownCount = 8
    LookupField = 'Sigla'
    LookupDisplay = 'Sigla'
    LookupSource = DM1.dsUF
    TabOrder = 1
    OnEnter = RxDBLookupCombo1Enter
  end
  object Edit3: TEdit
    Left = 66
    Top = 56
    Width = 183
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 20
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 80
    Width = 96
    Height = 30
    Caption = 'Confirmar'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn3: TBitBtn
    Left = 160
    Top = 80
    Width = 96
    Height = 30
    Caption = 'Excluir'
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object BitBtn2: TBitBtn
    Left = 256
    Top = 80
    Width = 96
    Height = 30
    Caption = 'Fechar'
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 113
    Width = 477
    Height = 175
    Align = alBottom
    DataSource = DMNotaFiscal.dsNotaFiscalReboque
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Flat = False
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'MS Sans Serif'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Item'
        Title.Alignment = taCenter
        Width = 41
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Placa'
        Title.Alignment = taCenter
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UF'
        Title.Alignment = taCenter
        Width = 34
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RNTC'
        Title.Alignment = taCenter
        Width = 271
        Visible = True
      end>
  end
end
