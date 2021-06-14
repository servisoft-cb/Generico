object fNotaFiscalLacre: TfNotaFiscalLacre
  Left = 315
  Top = 204
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados de Importa'#231#227'o'
  ClientHeight = 242
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
    Left = 19
    Top = 16
    Width = 45
    Height = 13
    Alignment = taRightJustify
    Caption = 'N'#186' Lacre:'
  end
  object Edit1: TEdit
    Left = 66
    Top = 8
    Width = 383
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 60
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 67
    Top = 32
    Width = 96
    Height = 30
    Caption = 'Confirmar'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn3: TBitBtn
    Left = 163
    Top = 32
    Width = 96
    Height = 30
    Caption = 'Excluir'
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object BitBtn2: TBitBtn
    Left = 259
    Top = 32
    Width = 96
    Height = 30
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 67
    Width = 477
    Height = 175
    Align = alBottom
    DataSource = DMNotaFiscal.dsNotaFiscalLacre
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 4
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
    ColCount = 2
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'NumLacre'
        Title.Alignment = taCenter
        Width = 426
        Visible = True
      end>
  end
end
