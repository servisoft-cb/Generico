object fFacaC: TfFacaC
  Left = 266
  Top = 85
  Width = 956
  Height = 573
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'fFacaC'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 376
    Top = 432
    Width = 94
    Height = 13
    Caption = 'FD_FECHAMENTO'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 940
    Height = 33
    Align = alTop
    TabOrder = 0
    object Shape1: TShape
      Left = 176
      Top = 9
      Width = 15
      Height = 15
      Brush.Color = 13743257
    end
    object Shape2: TShape
      Left = 408
      Top = 9
      Width = 15
      Height = 15
      Brush.Color = clMoneyGreen
    end
    object Shape3: TShape
      Left = 536
      Top = 9
      Width = 15
      Height = 15
      Brush.Color = 8963327
    end
    object Label2: TLabel
      Left = 200
      Top = 11
      Width = 162
      Height = 13
      Caption = 'FUNDO / CARTUCHO / SACOLA'
    end
    object Label3: TLabel
      Left = 432
      Top = 11
      Width = 37
      Height = 13
      Caption = 'TAMPA'
    end
    object Label4: TLabel
      Left = 560
      Top = 11
      Width = 52
      Height = 13
      Caption = 'SUPORTE'
    end
    object BitBtn4: TBitBtn
      Left = 4
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Incluir'
      TabOrder = 0
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 79
      Top = 4
      Width = 75
      Height = 25
      Caption = 'E&xcluir'
      TabOrder = 1
      OnClick = BitBtn5Click
    end
  end
  object SMDBGrid2: TSMDBGrid
    Left = 0
    Top = 33
    Width = 940
    Height = 461
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
    ColCount = 28
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Title.Caption = 'C'#211'D.'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'clFDTipoMat'
        Title.Caption = 'MATERIAL FUNDO'
        Title.Color = 13743257
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FD_COPIAS_C'
        Title.Caption = 'COP C'
        Title.Color = 13743257
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FD_COPIAS_L'
        Title.Caption = 'COP L'
        Title.Color = 13743257
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FD_COMPR'
        Title.Caption = 'COM'
        Title.Color = 13743257
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FD_LARGURA'
        Title.Caption = 'LAR'
        Title.Color = 13743257
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FD_ALTURA'
        Title.Caption = 'ALT'
        Title.Color = 13743257
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FD_ABA_INT_CAB'
        Title.Caption = 'AIC'
        Title.Color = 13743257
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FD_ABA_INT_LAT'
        Title.Caption = 'AIL'
        Title.Color = 13743257
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FD_FECHAMENTO'
        Title.Caption = 'FECH.'
        Title.Color = 13743257
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CT_FECHAMENTO'
        Title.Caption = 'FECH. CART.'
        Title.Color = 13743257
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'clTPTipoMat'
        Title.Caption = 'MATERIAL TAMPA'
        Title.Color = clMoneyGreen
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_COPIAS_C'
        Title.Caption = 'COP C'
        Title.Color = clMoneyGreen
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_COPIAS_L'
        Title.Caption = 'COP L'
        Title.Color = clMoneyGreen
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_ABA_EXT_CAB'
        Title.Caption = 'AEC'
        Title.Color = clMoneyGreen
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_ABA_INT_CAB'
        Title.Caption = 'AIC'
        Title.Color = clMoneyGreen
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_ABA_EXT_LAT'
        Title.Caption = 'AEL'
        Title.Color = clMoneyGreen
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_ABA_INT_LAT'
        Title.Caption = 'AIL'
        Title.Color = clMoneyGreen
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TP_FECHAMENTO'
        Title.Caption = 'FECH.'
        Title.Color = clMoneyGreen
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'clSPTipoMat'
        Title.Caption = 'MATERIAL SUPORTE'
        Title.Color = 8963327
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_COPIAS_C'
        Title.Caption = 'COP C'
        Title.Color = 8963327
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_COPIAS_L'
        Title.Caption = 'COP L'
        Title.Color = 8963327
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_COMPR'
        Title.Caption = 'COM'
        Title.Color = 8963327
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_LARGURA'
        Title.Caption = 'LAR'
        Title.Color = 8963327
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_ALTURA'
        Title.Caption = 'ALT'
        Title.Color = 8963327
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SP_FECHAMENTO'
        Title.Caption = 'FECH.'
        Title.Color = 8963327
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'ID'
        Width = 56
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 494
    Width = 940
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Label5: TLabel
      Left = 8
      Top = 0
      Width = 42
      Height = 13
      Caption = 'Legenda'
    end
  end
  object tProdutoIns: TTable
    DatabaseName = 'Tabelas'
    TableName = 'dbProduto.DB'
    Left = 742
    object tProdutoInsCodigo: TIntegerField
      FieldName = 'Codigo'
    end
  end
  object sdsProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.*, FD_LARGURA, FD_COMPR, FD_ALTURA, FD_ABA_INT_CAB, FD_' +
      'ABA_INT_LAT, TP_ABA_EXT_CAB, TP_ABA_INT_CAB, TP_ABA_EXT_LAT, TP_' +
      'ABA_INT_LAT, SP_COMPR, SP_LARGURA, SP_ALTURA, TP_LARGURA, TP_COM' +
      'PR, TP_ALTURA, SP_ABA_INT_CAB, SP_ABA_INT_LAT, FD_TIPO_MAT, TP_T' +
      'IPO_MAT, FD_COPIAS_C, TP_COPIAS_C, SP_COPIAS_C,  FD_COPIAS_L, TP' +
      '_COPIAS_L, SP_COPIAS_L, SP_TIPO_MAT, PCFD.FECHAMENTO FD_FECHAMEN' +
      'TO, PCFD.FECHAMENTO_CT CT_FECHAMENTO, PCTP.FECHAMENTO TP_FECHAME' +
      'NTO, PCSP.FECHAMENTO SP_FECHAMENTO'#13#10'FROM PRODUTO P'#13#10'LEFT JOIN PR' +
      'ODUTOCARTO PC ON (P.CODIGO = PC.CODIGO)'#13#10'LEFT JOIN PRODUTOCARTO_' +
      'FD PCFD ON (P.CODIGO = PCFD.CODIGO)'#13#10'LEFT JOIN PRODUTOCARTO_TP P' +
      'CTP ON (P.CODIGO = PCTP.CODIGO)'#13#10'LEFT JOIN PRODUTOCARTO_SP PCSP ' +
      'ON (P.CODIGO = PCSP.CODIGO)'#13#10'WHERE P.PRODMAT = '#39'P'#39' AND PC.FACA =' +
      ' '#39'1'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 776
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
    object sdsProdutoFD_LARGURA: TFMTBCDField
      FieldName = 'FD_LARGURA'
      Precision = 15
      Size = 2
    end
    object sdsProdutoFD_COMPR: TFMTBCDField
      FieldName = 'FD_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoFD_ALTURA: TFMTBCDField
      FieldName = 'FD_ALTURA'
      Precision = 15
      Size = 2
    end
    object sdsProdutoFD_ABA_INT_CAB: TFMTBCDField
      FieldName = 'FD_ABA_INT_CAB'
      Precision = 15
      Size = 2
    end
    object sdsProdutoFD_ABA_INT_LAT: TFMTBCDField
      FieldName = 'FD_ABA_INT_LAT'
      Precision = 15
      Size = 2
    end
    object sdsProdutoTP_ABA_EXT_CAB: TFMTBCDField
      FieldName = 'TP_ABA_EXT_CAB'
      Precision = 15
      Size = 2
    end
    object sdsProdutoTP_ABA_INT_CAB: TFMTBCDField
      FieldName = 'TP_ABA_INT_CAB'
      Precision = 15
      Size = 2
    end
    object sdsProdutoTP_ABA_EXT_LAT: TFMTBCDField
      FieldName = 'TP_ABA_EXT_LAT'
      Precision = 15
      Size = 2
    end
    object sdsProdutoTP_ABA_INT_LAT: TFMTBCDField
      FieldName = 'TP_ABA_INT_LAT'
      Precision = 15
      Size = 2
    end
    object sdsProdutoSP_COMPR: TFMTBCDField
      FieldName = 'SP_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsProdutoSP_LARGURA: TFMTBCDField
      FieldName = 'SP_LARGURA'
      Precision = 15
      Size = 2
    end
    object sdsProdutoSP_ALTURA: TFMTBCDField
      FieldName = 'SP_ALTURA'
      Precision = 15
      Size = 2
    end
    object sdsProdutoSP_ABA_INT_CAB: TFMTBCDField
      FieldName = 'SP_ABA_INT_CAB'
      Precision = 15
      Size = 2
    end
    object sdsProdutoSP_ABA_INT_LAT: TFMTBCDField
      FieldName = 'SP_ABA_INT_LAT'
      Precision = 15
      Size = 2
    end
    object sdsProdutoFD_TIPO_MAT: TStringField
      FieldName = 'FD_TIPO_MAT'
      Size = 2
    end
    object sdsProdutoSP_TIPO_MAT: TStringField
      FieldName = 'SP_TIPO_MAT'
      Size = 2
    end
    object sdsProdutoTP_TIPO_MAT: TStringField
      FieldName = 'TP_TIPO_MAT'
      Size = 2
    end
    object sdsProdutoFD_COPIAS_C: TSmallintField
      FieldName = 'FD_COPIAS_C'
    end
    object sdsProdutoTP_COPIAS_C: TSmallintField
      FieldName = 'TP_COPIAS_C'
    end
    object sdsProdutoSP_COPIAS_C: TSmallintField
      FieldName = 'SP_COPIAS_C'
    end
    object sdsProdutoFD_COPIAS_L: TSmallintField
      FieldName = 'FD_COPIAS_L'
    end
    object sdsProdutoTP_COPIAS_L: TSmallintField
      FieldName = 'TP_COPIAS_L'
    end
    object sdsProdutoSP_COPIAS_L: TSmallintField
      FieldName = 'SP_COPIAS_L'
    end
    object sdsProdutoFD_FECHAMENTO: TStringField
      FieldName = 'FD_FECHAMENTO'
      Size = 2
    end
    object sdsProdutoCT_FECHAMENTO: TStringField
      FieldName = 'CT_FECHAMENTO'
      Size = 2
    end
    object sdsProdutoTP_FECHAMENTO: TStringField
      FieldName = 'TP_FECHAMENTO'
      Size = 2
    end
    object sdsProdutoSP_FECHAMENTO: TStringField
      FieldName = 'SP_FECHAMENTO'
      Size = 2
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    Left = 808
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Codigo'
    Params = <>
    ProviderName = 'dspProduto'
    OnCalcFields = cdsProdutoCalcFields
    Left = 840
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
    object cdsProdutoFD_LARGURA: TFMTBCDField
      FieldName = 'FD_LARGURA'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoFD_COMPR: TFMTBCDField
      DisplayLabel = 'FD_LARGURA'
      FieldName = 'FD_COMPR'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoFD_ALTURA: TFMTBCDField
      DisplayLabel = 'FD_LARGURA'
      FieldName = 'FD_ALTURA'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoFD_ABA_INT_CAB: TFMTBCDField
      FieldName = 'FD_ABA_INT_CAB'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoFD_ABA_INT_LAT: TFMTBCDField
      FieldName = 'FD_ABA_INT_LAT'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoTP_ABA_EXT_CAB: TFMTBCDField
      DisplayLabel = 'FD_LARGURA'
      FieldName = 'TP_ABA_EXT_CAB'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoTP_ABA_INT_CAB: TFMTBCDField
      DisplayLabel = 'FD_LARGURA'
      FieldName = 'TP_ABA_INT_CAB'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoTP_ABA_EXT_LAT: TFMTBCDField
      DisplayLabel = 'FD_LARGURA'
      FieldName = 'TP_ABA_EXT_LAT'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoTP_ABA_INT_LAT: TFMTBCDField
      DisplayLabel = 'FD_LARGURA'
      FieldName = 'TP_ABA_INT_LAT'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoSP_COMPR: TFMTBCDField
      DisplayLabel = 'FD_LARGURA'
      FieldName = 'SP_COMPR'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoSP_LARGURA: TFMTBCDField
      DisplayLabel = 'FD_LARGURA'
      FieldName = 'SP_LARGURA'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoSP_ALTURA: TFMTBCDField
      DisplayLabel = 'FD_LARGURA'
      FieldName = 'SP_ALTURA'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoSP_ABA_INT_CAB: TFMTBCDField
      DisplayLabel = 'FD_LARGURA'
      FieldName = 'SP_ABA_INT_CAB'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoSP_ABA_INT_LAT: TFMTBCDField
      DisplayLabel = 'FD_LARGURA'
      FieldName = 'SP_ABA_INT_LAT'
      DisplayFormat = '0.0'
      Precision = 15
      Size = 2
    end
    object cdsProdutoFD_TIPO_MAT: TStringField
      FieldName = 'FD_TIPO_MAT'
      Size = 2
    end
    object cdsProdutoSP_TIPO_MAT: TStringField
      FieldName = 'SP_TIPO_MAT'
      Size = 2
    end
    object cdsProdutoTP_TIPO_MAT: TStringField
      FieldName = 'TP_TIPO_MAT'
      Size = 2
    end
    object cdsProdutoclFDTipoMat: TStringField
      FieldKind = fkCalculated
      FieldName = 'clFDTipoMat'
      Size = 30
      Calculated = True
    end
    object cdsProdutoclTPTipoMat: TStringField
      FieldKind = fkCalculated
      FieldName = 'clTPTipoMat'
      Size = 30
      Calculated = True
    end
    object cdsProdutoclSPTipoMat: TStringField
      FieldKind = fkCalculated
      FieldName = 'clSPTipoMat'
      Size = 30
      Calculated = True
    end
    object cdsProdutoFD_COPIAS_C: TSmallintField
      FieldName = 'FD_COPIAS_C'
    end
    object cdsProdutoTP_COPIAS_C: TSmallintField
      FieldName = 'TP_COPIAS_C'
    end
    object cdsProdutoSP_COPIAS_C: TSmallintField
      FieldName = 'SP_COPIAS_C'
    end
    object cdsProdutoFD_COPIAS_L: TSmallintField
      FieldName = 'FD_COPIAS_L'
    end
    object cdsProdutoTP_COPIAS_L: TSmallintField
      FieldName = 'TP_COPIAS_L'
    end
    object cdsProdutoSP_COPIAS_L: TSmallintField
      FieldName = 'SP_COPIAS_L'
    end
    object cdsProdutoFD_FECHAMENTO: TStringField
      FieldName = 'FD_FECHAMENTO'
      Size = 2
    end
    object cdsProdutoCT_FECHAMENTO: TStringField
      FieldName = 'CT_FECHAMENTO'
      Size = 2
    end
    object cdsProdutoTP_FECHAMENTO: TStringField
      FieldName = 'TP_FECHAMENTO'
      Size = 2
    end
    object cdsProdutoSP_FECHAMENTO: TStringField
      FieldName = 'SP_FECHAMENTO'
      Size = 2
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 872
  end
  object Query1: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT MAX(REFERENCIA) ULT'
      'FROM DBPRODUTO')
    Left = 704
    object Query1ULT: TStringField
      FieldName = 'ULT'
      Origin = 'TABELAS."dbProduto.DB".Referencia'
    end
  end
end
