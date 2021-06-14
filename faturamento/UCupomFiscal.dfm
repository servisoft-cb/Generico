object fCupomFiscal: TfCupomFiscal
  Left = 3
  Top = 58
  Width = 1011
  Height = 637
  BorderIcons = [biSystemMenu]
  Caption = 'Emiss'#227'o Cupom Fiscal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 409
    Top = 0
    Width = 594
    Height = 603
    Align = alRight
    TabOrder = 1
    object SMDBGrid1: TSMDBGrid
      Left = 1
      Top = 1
      Width = 592
      Height = 601
      Align = alClient
      DataSource = DMCupom.dsCupomFiscalIt
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
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
      ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoRowHeightAutofit, eoTitleWordWrap]
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
          Title.Caption = 'Item'
          Width = 31
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODPRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Produto'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTD'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLRUNIT'
          Title.Alignment = taCenter
          Title.Caption = 'V.Unit'#225'rio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLRTOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr.Total'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEPRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'Produto'
          Width = 234
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Unid.'
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 603
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel3: TPanel
      Left = 0
      Top = 431
      Width = 409
      Height = 138
      Align = alBottom
      Enabled = False
      TabOrder = 3
      object Label7: TLabel
        Left = 51
        Top = 80
        Width = 113
        Height = 48
        Alignment = taRightJustify
        Caption = 'Valor Total '#13#10'do Cupom:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 171
        Top = 80
        Width = 222
        Height = 46
        DataField = 'VLRTOTAL'
        DataSource = DMCupom.dsCupomFiscal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -33
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 8
        Width = 377
        Height = 27
        DataField = 'NOME_CLIENTE'
        DataSource = DMCupom.dsCupomFiscal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 409
      Height = 191
      Align = alTop
      TabOrder = 0
      object Label3: TLabel
        Left = 45
        Top = 125
        Width = 20
        Height = 13
        Caption = 'Qtd:'
      end
      object Label4: TLabel
        Left = 11
        Top = 149
        Width = 54
        Height = 13
        Caption = 'Vlr.Unit'#225'rio:'
      end
      object Label5: TLabel
        Left = 16
        Top = 173
        Width = 49
        Height = 13
        Caption = 'Sub.Total:'
      end
      object Label6: TLabel
        Left = 3
        Top = 95
        Width = 62
        Height = 13
        Caption = 'Sit.Tributaria:'
      end
      object Label10: TLabel
        Left = 46
        Top = 71
        Width = 19
        Height = 13
        Caption = 'Cor:'
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 68
        Top = 117
        Width = 121
        Height = 21
        AutoSize = False
        DecimalPlaces = 5
        DisplayFormat = '0.000##'
        TabOrder = 3
        OnExit = CurrencyEdit1Exit
      end
      object CurrencyEdit2: TCurrencyEdit
        Left = 68
        Top = 141
        Width = 121
        Height = 21
        AutoSize = False
        DecimalPlaces = 5
        DisplayFormat = '0.000##'
        TabOrder = 4
        OnExit = CurrencyEdit1Exit
      end
      object CurrencyEdit3: TCurrencyEdit
        Left = 68
        Top = 165
        Width = 121
        Height = 21
        TabStop = False
        AutoSize = False
        DecimalPlaces = 5
        DisplayFormat = '0.000##'
        ReadOnly = True
        TabOrder = 5
      end
      object RxDBLookupCombo2: TRxDBLookupCombo
        Left = 68
        Top = 87
        Width = 301
        Height = 21
        DropDownCount = 8
        LookupField = 'CODIGO'
        LookupDisplay = 'CODIGO;PERCENTUAL'
        LookupSource = dsSitTrib_CF
        TabOrder = 2
        OnExit = RxDBLookupCombo2Exit
      end
      object RxDBLookupCombo3: TRxDBLookupCombo
        Left = 68
        Top = 63
        Width = 301
        Height = 21
        DropDownCount = 8
        LookupField = 'CodCor'
        LookupDisplay = 'Nome'
        LookupSource = dsqCor
        TabOrder = 1
      end
      object Panel8: TPanel
        Left = 1
        Top = 1
        Width = 407
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        OnExit = Panel8Exit
        object Label1: TLabel
          Left = 25
          Top = 10
          Width = 40
          Height = 13
          Caption = 'Produto:'
        end
        object Label2: TLabel
          Left = 34
          Top = 34
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object Edit1: TEdit
          Left = 68
          Top = 2
          Width = 121
          Height = 21
          TabOrder = 0
          OnExit = Edit1Exit
          OnKeyDown = Edit1KeyDown
        end
        object RxDBLookupCombo1: TRxDBLookupCombo
          Left = 68
          Top = 26
          Width = 301
          Height = 21
          DropDownCount = 8
          LookupField = 'Codigo'
          LookupDisplay = 'Nome'
          LookupSource = DM1.dsProduto
          TabOrder = 1
          OnEnter = RxDBLookupCombo1Enter
        end
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 191
      Width = 409
      Height = 42
      Align = alTop
      TabOrder = 1
      object BitBtn4: TBitBtn
        Left = 8
        Top = 8
        Width = 89
        Height = 25
        Caption = 'Confirmar Item'
        TabOrder = 0
        OnClick = BitBtn4Click
      end
      object BitBtn1: TBitBtn
        Left = 304
        Top = 8
        Width = 89
        Height = 25
        Caption = 'Cancelar Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = BitBtn1Click
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 569
      Width = 409
      Height = 34
      Align = alBottom
      TabOrder = 4
      DesignSize = (
        409
        34)
      object BitBtn2: TBitBtn
        Left = 283
        Top = 5
        Width = 120
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'F10 - Finalizar Cupom'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BitBtn2Click
      end
    end
    object Panel9: TPanel
      Left = 0
      Top = 233
      Width = 409
      Height = 198
      Align = alClient
      TabOrder = 2
      object Label8: TLabel
        Left = 208
        Top = 144
        Width = 98
        Height = 13
        Caption = 'Multiplicar a qtd. por:'
        Visible = False
      end
      object CurrencyEdit4: TCurrencyEdit
        Left = 308
        Top = 137
        Width = 53
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        TabOrder = 0
        Value = 10.000000000000000000
        Visible = False
      end
    end
  end
  object RxDBFilter1: TRxDBFilter
    DataSource = DM1.dsProduto
    Filter.Strings = (
      'Inativo = False')
    Left = 656
    Top = 64
  end
  object sdsSitTrib_CF: TSQLDataSet
    CommandText = 'SELECT *'#13#10'FROM SITTRIB_CF'#13#10'ORDER BY CODIGO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 520
    Top = 120
    object sdsSitTrib_CFID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsSitTrib_CFPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object sdsSitTrib_CFCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 5
    end
  end
  object cdsSitTrib_CF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSitTrib_CF'
    Left = 600
    Top = 120
    object cdsSitTrib_CFID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSitTrib_CFPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object cdsSitTrib_CFCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 5
    end
  end
  object dspSitTrib_CF: TDataSetProvider
    DataSet = sdsSitTrib_CF
    Left = 560
    Top = 120
  end
  object dsSitTrib_CF: TDataSource
    DataSet = cdsSitTrib_CF
    Left = 640
    Top = 120
  end
  object qCor: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Dbprodutocor.CodProduto, Dbcor.Nome, Dbprodutocor.CodCor'
      'FROM "dbProdutoCor.DB" Dbprodutocor'
      '   INNER JOIN "Dbcor.DB" Dbcor'
      '   ON  (Dbprodutocor.CodCor = Dbcor.Codigo)  '
      'WHERE  Dbprodutocor.CodProduto = :CodProduto'
      'ORDER BY NOME')
    Left = 592
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodProduto'
        ParamType = ptUnknown
      end>
    object qCorCodProduto: TIntegerField
      FieldName = 'CodProduto'
      Origin = 'TABELAS."dbProdutoCor.DB".CodProduto'
    end
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
    Left = 616
    Top = 216
  end
end
