object fTabIBPTC: TfTabIBPTC
  Left = 205
  Top = 111
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tabela IBPT'
  ClientHeight = 505
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 41
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 465
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Inserir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 540
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = False
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn3Click
    end
    object BitBtn5: TBitBtn
      Left = 616
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn5Click
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 89
    Width = 734
    Height = 399
    Align = alClient
    DataSource = DMTabIBPT.dsIBPT
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid1DblClick
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 15
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 13
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Alignment = taCenter
        Title.Caption = 'NCM'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EX'
        Title.Alignment = taCenter
        Title.Caption = 'Excess'#227'o'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_NACIONAL'
        Title.Alignment = taCenter
        Title.Caption = '% Nacional'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_IMPORTACAO'
        Title.Alignment = taCenter
        Title.Caption = '% Importa'#231#227'o'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_ESTADUAL'
        Title.Alignment = taCenter
        Title.Caption = '% Estadual'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_MUNICIPAL'
        Title.Alignment = taCenter
        Title.Caption = '% Municipal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TABELA'
        Title.Alignment = taCenter
        Title.Caption = 'Tabela'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Alignment = taCenter
        Title.Caption = 'Nome'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Width = 59
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DT_INICIO'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. In'#237'cio Vig'#234'ncia'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DT_FINAL'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Final Vig'#234'ncia'
        Width = 64
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FONTE'
        Title.Alignment = taCenter
        Title.Caption = 'Fonte'
        Width = 64
        Visible = True
      end>
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 488
    Width = 734
    Height = 17
    Align = alBottom
    BorderStyle = sbsSunken
    Caption = 'Duplo clique para consultar       '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 734
    Height = 48
    Align = alTop
    Color = clSilver
    TabOrder = 3
    object Label9: TLabel
      Left = 187
      Top = 14
      Width = 143
      Height = 13
      Caption = 'Arquivo IBPT para convers'#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 336
      Top = 28
      Width = 360
      Height = 18
      Caption = '... Aguarde, gerando tabela IBPT ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = 0
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object FilenameEdit1: TFilenameEdit
      Left = 332
      Top = 6
      Width = 400
      Height = 21
      NumGlyphs = 1
      TabOrder = 0
    end
    object BitBtn4: TBitBtn
      Left = 8
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn4Click
    end
    object ProgressBar1: TProgressBar
      Left = 3
      Top = 31
      Width = 319
      Height = 17
      TabOrder = 2
    end
  end
end
