object fCobEletronicaC: TfCobEletronicaC
  Left = 181
  Top = 111
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'fCobEletronicaC'
  ClientHeight = 505
  ClientWidth = 989
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 36
    Width = 989
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 44
      Height = 13
      Caption = 'Dt.Inicial:'
    end
    object Label2: TLabel
      Left = 160
      Top = 20
      Width = 25
      Height = 13
      Caption = 'Final:'
    end
    object BitBtn1: TBitBtn
      Left = 463
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
      Left = 538
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
      Left = 288
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
    object DateEdit1: TDateEdit
      Left = 54
      Top = 12
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
    object DateEdit2: TDateEdit
      Left = 188
      Top = 12
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 4
    end
    object BitBtn6: TBitBtn
      Left = 613
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn6Click
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 77
    Width = 989
    Height = 411
    Align = alClient
    DataSource = DMCobEletronica.dsCobEletronica
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid1DblClick
    OnKeyDown = SMDBGrid1KeyDown
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
    ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 27
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 11
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'N'#186' Mov.'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DTGERACAO'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Gera'#231#227'o'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FILIAL'
        Title.Alignment = taCenter
        Title.Caption = 'Filial'
        Width = 29
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'USUARIO'
        Title.Alignment = taCenter
        Title.Caption = 'Usu'#225'rio'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HORA'
        Title.Alignment = taCenter
        Title.Caption = 'Hora'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QTDTITULOS'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. T'#237'tulos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLRTITULOS'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. T'#237'tulos'
        Width = 88
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODBANCO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Conta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODTIPOCOBRANCA'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Tipo Cobran'#231'a'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEARQUIVO'
        Title.Caption = 'Nome Arquivo'
        Width = 326
        Visible = True
      end>
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 488
    Width = 989
    Height = 17
    Align = alBottom
    BorderStyle = sbsSunken
    Caption = 'Duplo clique para consultar       F3=Abre o arquivo texto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 989
    Height = 36
    Align = alTop
    Color = clSilver
    TabOrder = 3
    object Label3: TLabel
      Left = 16
      Top = 16
      Width = 34
      Height = 13
      Caption = 'Banco:'
    end
    object BitBtn4: TBitBtn
      Left = 366
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Arq. Retorno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn4Click
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 51
      Top = 8
      Width = 313
      Height = 21
      DropDownCount = 12
      LookupField = 'CodConta'
      LookupDisplay = 'NomeConta'
      LookupSource = DM1.dsContas
      TabOrder = 1
    end
  end
end
