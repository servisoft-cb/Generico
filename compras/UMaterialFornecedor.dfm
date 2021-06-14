object fMaterialFornecedor: TfMaterialFornecedor
  Left = 179
  Top = 171
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Produto no fornecedor'
  ClientHeight = 446
  ClientWidth = 747
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 747
    Height = 161
    Align = alTop
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 29
      Top = 101
      Width = 134
      Height = 13
      Caption = 'C'#243'd.Produto do Fornecedor:'
    end
    object Label2: TLabel
      Left = 131
      Top = 55
      Width = 32
      Height = 13
      Caption = 'Grade:'
    end
    object Label3: TLabel
      Left = 115
      Top = 77
      Width = 48
      Height = 13
      Caption = 'Tamanho:'
    end
    object Label4: TLabel
      Left = 106
      Top = 10
      Width = 57
      Height = 13
      Caption = 'Fornecedor:'
    end
    object Label5: TLabel
      Left = 144
      Top = 32
      Width = 19
      Height = 13
      Caption = 'Cor:'
    end
    object Label6: TLabel
      Left = 5
      Top = 123
      Width = 158
      Height = 13
      Caption = 'Nome do Produto no Fornecedor:'
    end
    object Label7: TLabel
      Left = 23
      Top = 145
      Width = 140
      Height = 13
      Caption = 'C'#243'd. de Barra no Fornecedor:'
    end
    object Edit1: TEdit
      Left = 165
      Top = 94
      Width = 225
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 4
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 165
      Top = 49
      Width = 225
      Height = 21
      DropDownCount = 8
      LookupField = 'CodGrade'
      LookupDisplay = 'lkNomeGrade'
      TabOrder = 2
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 165
      Top = 71
      Width = 225
      Height = 21
      DropDownCount = 8
      LookupField = 'Posicao'
      LookupDisplay = 'lkTamanho'
      LookupSource = DM1.dsProdutoTam
      TabOrder = 3
    end
    object RxDBLookupCombo3: TRxDBLookupCombo
      Left = 165
      Top = 4
      Width = 225
      Height = 21
      DropDownCount = 8
      LookupField = 'CodForn'
      LookupDisplay = 'NomeForn'
      LookupSource = DM1.dsFornecedores
      TabOrder = 0
      OnEnter = RxDBLookupCombo3Enter
    end
    object RxDBLookupCombo4: TRxDBLookupCombo
      Left = 165
      Top = 26
      Width = 225
      Height = 21
      DropDownCount = 8
      LookupField = 'CodCor'
      LookupDisplay = 'Nome'
      LookupSource = dsqCor
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 393
      Top = 133
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 7
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 468
      Top = 133
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 8
      OnClick = BitBtn2Click
    end
    object Edit2: TEdit
      Left = 165
      Top = 116
      Width = 225
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object Edit3: TEdit
      Left = 165
      Top = 138
      Width = 225
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 14
      TabOrder = 6
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 161
    Width = 747
    Height = 285
    Align = alClient
    DataSource = DMMaterialFornecedor.dsMaterialFornecedor
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
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
    ColCount = 10
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'lkNomeFornecedor'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Fornecedor'
        Width = 239
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Item'
        Title.Alignment = taCenter
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkNomeCor'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Cor'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodMaterialForn'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Produto no Fornecedor'
        Width = 141
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodBarra'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Barra'
        Width = 95
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Tamanho'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeMaterialForn'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Material'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodGrade'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Grade'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodFornecedor'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Fornecedor'
        Width = 64
        Visible = True
      end>
  end
  object BitBtn3: TBitBtn
    Left = 543
    Top = 133
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = BitBtn3Click
  end
  object qCor: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Dbcor.Nome, Dbprodutocor.CodCor'
      'FROM "dbProdutoCor.DB" Dbprodutocor'
      '   INNER JOIN "Dbcor.DB" Dbcor'
      '   ON  (Dbprodutocor.CodCor = Dbcor.Codigo)  '
      'WHERE  Dbprodutocor.CodProduto = :CodProduto'
      'ORDER BY dbCor.Nome')
    Left = 512
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodProduto'
        ParamType = ptUnknown
      end>
    object qCorNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbCor.DB".Nome'
      Size = 25
    end
    object qCorCodCor: TIntegerField
      FieldName = 'CodCor'
      Origin = 'TABELAS."dbProdutoCor.DB".CodCor'
    end
  end
  object dsqCor: TDataSource
    DataSet = qCor
    Left = 544
    Top = 48
  end
  object qProximaItem: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT MAX( Item ) Item'
      'FROM "dbMaterialFornecedor.db" Dbmaterialfornecedor'
      'WHERE   (CodMaterial = :CodMaterial)  '
      '   AND  (CodFornecedor = :CodFornecedor)  ')
    Left = 536
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodMaterial'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodFornecedor'
        ParamType = ptUnknown
      end>
    object qProximaItemItem: TIntegerField
      FieldName = 'Item'
      Origin = 'TABELAS."dbMaterialFornecedor.DB".Item'
    end
  end
end
