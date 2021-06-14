object fNotaFiscalCCe: TfNotaFiscalCCe
  Left = 107
  Top = 102
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Carta de Corre'#231#227'o Eletr'#244'nica'
  ClientHeight = 599
  ClientWidth = 831
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 831
    Height = 289
    Align = alTop
    Caption = ' Motivo '
    TabOrder = 0
    object Memo1: TMemo
      Left = 2
      Top = 15
      Width = 827
      Height = 272
      Align = alClient
      MaxLength = 1000
      ScrollBars = ssVertical
      TabOrder = 0
      OnKeyPress = Memo1KeyPress
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 289
    Width = 831
    Height = 38
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 1
    object BitBtn5: TBitBtn
      Left = 394
      Top = 6
      Width = 143
      Height = 27
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn5Click
    end
    object BitBtn2: TBitBtn
      Left = 682
      Top = 6
      Width = 143
      Height = 27
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn1: TBitBtn
      Left = 538
      Top = 6
      Width = 143
      Height = 27
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 5
      Top = 7
      Width = 116
      Height = 27
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 121
      Top = 7
      Width = 116
      Height = 27
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BitBtn4Click
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 327
    Width = 831
    Height = 255
    Align = alClient
    DataSource = DMNFeFB.dsNotaFiscal_NFe
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    OnGetCellParams = SMDBGrid1GetCellParams
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 8
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ITEM'
        Title.Alignment = taCenter
        Title.Caption = 'Mov.'
        Width = 42
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIPO'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo Evento'
        Width = 56
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ITEMTIPO'
        Title.Alignment = taCenter
        Title.Caption = 'Item Evento'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o Evento'
        Width = 303
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NFEPROTOCOLO'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Protocolo'
        Width = 234
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DTCADASTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Cadastro'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HRCADASTRO'
        Title.Alignment = taCenter
        Title.Caption = 'Hr. Cadastro'
        Width = 79
        Visible = True
      end>
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 582
    Width = 831
    Height = 17
    Align = alBottom
    Caption = 'F11 Para mostrar a Carta de Corre'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object mCCe: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NumSequencial'
        DataType = ftInteger
      end
      item
        Name = 'Obs'
        DataType = ftWideString
        Size = 1000
      end
      item
        Name = 'NumProtocolo'
        DataType = ftString
        Size = 45
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 384
    Top = 392
    Data = {
      690000009619E0BD01000000180000000300000000000300000069000D4E756D
      53657175656E6369616C0400010000000000034F627302004A00000001000557
      4944544802000200D0070C4E756D50726F746F636F6C6F010049000000010005
      5749445448020002002D000000}
    object mCCeNumSequencial: TIntegerField
      FieldName = 'NumSequencial'
    end
    object mCCeObs: TWideStringField
      FieldName = 'Obs'
      Size = 1000
    end
    object mCCeNumProtocolo: TStringField
      FieldName = 'NumProtocolo'
      Size = 45
    end
  end
  object dsmCCe: TDataSource
    DataSet = mCCe
    Left = 416
    Top = 392
  end
end
