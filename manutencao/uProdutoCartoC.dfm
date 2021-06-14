object fProdutoCartoC: TfProdutoCartoC
  Left = 337
  Top = 150
  Width = 718
  Height = 573
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'fProdutoCartoC'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 702
    Height = 33
    Align = alTop
    TabOrder = 0
    object BitBtn4: TBitBtn
      Left = 79
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Incluir'
      TabOrder = 1
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 154
      Top = 4
      Width = 75
      Height = 25
      Caption = 'E&xcluir'
      TabOrder = 2
      OnClick = BitBtn5Click
    end
    object BitBtn3: TBitBtn
      Left = 229
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Im&primir'
      TabOrder = 3
      OnClick = BitBtn3Click
    end
    object BitBtn1: TBitBtn
      Left = 4
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Consultar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 33
    Width = 702
    Height = 502
    Align = alClient
    DataSource = dsProduto
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clNavy
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
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 4
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Title.Caption = 'C'#211'GIO (REF.)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 162
        Visible = True
      end>
  end
  object tProdutoIns: TTable
    DatabaseName = 'Tabelas'
    TableName = 'dbProduto.DB'
    Left = 478
    object tProdutoInsCodigo: TIntegerField
      FieldName = 'Codigo'
    end
  end
  object sdsProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.*'#13#10'FROM PRODUTO P'#13#10'LEFT JOIN PRODUTOCARTO PC ON (P.CODI' +
      'GO = PC.CODIGO)'#13#10'WHERE P.PRODMAT = '#39'P'#39' AND PC.FACA = '#39'0'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 512
    object sdsProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object sdsProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object sdsProdutoINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    Left = 544
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Codigo'
    Params = <>
    ProviderName = 'dspProduto'
    Left = 576
    object cdsProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object cdsProdutoINATIVO: TStringField
      FieldName = 'INATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 608
  end
end
