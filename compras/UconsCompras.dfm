object fConsCompras: TfConsCompras
  Left = 98
  Top = 162
  Width = 789
  Height = 476
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta compras'
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
    Width = 781
    Height = 74
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 38
      Top = 10
      Width = 23
      Height = 13
      Caption = 'Filial:'
    end
    object Label2: TLabel
      Left = 4
      Top = 32
      Width = 57
      Height = 13
      Caption = 'Fornecedor:'
    end
    object Label3: TLabel
      Left = 17
      Top = 55
      Width = 44
      Height = 13
      Caption = 'Dt.Inicial:'
    end
    object Label4: TLabel
      Left = 178
      Top = 55
      Width = 39
      Height = 13
      Caption = 'Dt.Final:'
    end
    object Label5: TLabel
      Left = 320
      Top = 10
      Width = 60
      Height = 13
      Caption = 'Ordenar Por:'
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 62
      Top = 2
      Width = 257
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'NomeInterno'
      LookupSource = DM1.dsFilial
      TabOrder = 0
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 62
      Top = 24
      Width = 257
      Height = 21
      DropDownCount = 8
      LookupField = 'CodForn'
      LookupDisplay = 'NomeForn'
      LookupSource = DM1.dsFornecedores
      TabOrder = 1
      OnEnter = RxDBLookupCombo2Enter
    end
    object DateEdit1: TDateEdit
      Left = 62
      Top = 47
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
    object DateEdit2: TDateEdit
      Left = 219
      Top = 47
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
    object BitBtn1: TBitBtn
      Left = 326
      Top = 40
      Width = 75
      Height = 30
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object ComboBox1: TComboBox
      Left = 382
      Top = 2
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = 'Data'
      OnClick = ComboBox1Click
      Items.Strings = (
        'Data'
        'N'#186' Nota'
        'Fornecedor'
        'Material')
    end
    object BitBtn2: TBitBtn
      Left = 401
      Top = 40
      Width = 75
      Height = 30
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = BitBtn2Click
    end
    object ProgressBar1: TProgressBar
      Left = 494
      Top = 52
      Width = 282
      Height = 16
      TabOrder = 7
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 74
    Width = 781
    Height = 368
    Align = alClient
    DataSource = dsmCompras
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
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 17
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'Tipo'
        Title.Alignment = taCenter
        Title.Caption = 'TIpo (M.Obra / Material)'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodFornecedor'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Forn.'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeFornecedor'
        Title.Alignment = taCenter
        Title.Caption = 'Nome do Fornecedor'
        Width = 225
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumNota'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Nota'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Data'
        Title.Alignment = taCenter
        Title.Caption = 'Data Entrada'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodMaterial'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Material'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeProduto'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Material'
        Width = 274
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrUnitario'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Unit'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unidade'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Qtd'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrTotal'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrDesconto'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Desconto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrIpi'
        Title.Alignment = taCenter
        Title.Caption = '% IPI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrFrete'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Frete'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeCor'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Cor'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Filial'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  object qNotas: TQuery
    OnCalcFields = qNotasCalcFields
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbnentrada.NumNEntr, Dbnentrada.DtEntrada, Dbnentrada.DtE' +
        'missaoNEntr, Dbnentradaitens.Item, Dbnentradaitens.CodMaterial, ' +
        'Dbnentradaitens.Qtd, Dbnentradaitens.VlrTotalItens, Dbnentradait' +
        'ens.VlrUnit, Dbnentradaitens.Icms, Dbnentradaitens.Ipi, Dbnentra' +
        'daitens.VlrDesc, Dbnentradaitens.VlrIpi, Dbnentradaitens.VlrIcms' +
        ', Dbnentradaitens.NumOC, Dbnentradaitens.ItemOC, Dbnentradaitens' +
        '.Unidade, Dbnentradaitens.CodCor, Dbnentradaitens.CodNatOper, Db' +
        'nentradaitens.GeraDupl, Dbnentradaitens.VlrFrete, Dbfornecedores' +
        '.NomeForn, Dbproduto.Nome NomeProduto, Dbnentrada.CodForn, Dbnen' +
        'trada.Filial'
      'FROM "dbNEntrada.DB" Dbnentrada'
      '   INNER JOIN "dbNEntradaItens.DB" Dbnentradaitens'
      '   ON  (Dbnentrada.Filial = Dbnentradaitens.Filial)  '
      '   AND  (Dbnentrada.NumNEntr = Dbnentradaitens.NumNEntr)  '
      '   AND  (Dbnentrada.CodForn = Dbnentradaitens.CodForn)  '
      '   INNER JOIN "dbFornecedores.DB" Dbfornecedores'
      '   ON  (Dbnentrada.CodForn = Dbfornecedores.CodForn)  '
      '   INNER JOIN "dbProduto.DB" Dbproduto'
      '   ON  (Dbnentradaitens.CodMaterial = Dbproduto.Codigo)  '
      'WHERE   (Dbnentrada.CondPgto <> '#39'N'#39')  '
      '   AND  (Dbnentrada.VlrTotalDuplicata > 0)  '
      '   AND  (Dbnentradaitens.GeraDupl = TRUE)  ')
    Left = 576
    Top = 8
    object qNotaslkNomeCor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCor'
      LookupDataSet = DM1.tCor2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCor'
      Size = 40
      Lookup = True
    end
    object qNotasNumNEntr: TIntegerField
      FieldName = 'NumNEntr'
    end
    object qNotasDtEntrada: TDateField
      FieldName = 'DtEntrada'
    end
    object qNotasDtEmissaoNEntr: TDateField
      FieldName = 'DtEmissaoNEntr'
    end
    object qNotasItem: TSmallintField
      FieldName = 'Item'
    end
    object qNotasCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
    end
    object qNotasQtd: TFloatField
      FieldName = 'Qtd'
    end
    object qNotasVlrTotalItens: TFloatField
      FieldName = 'VlrTotalItens'
    end
    object qNotasVlrUnit: TFloatField
      FieldName = 'VlrUnit'
    end
    object qNotasIcms: TFloatField
      FieldName = 'Icms'
    end
    object qNotasIpi: TFloatField
      FieldName = 'Ipi'
    end
    object qNotasVlrDesc: TFloatField
      FieldName = 'VlrDesc'
    end
    object qNotasVlrIpi: TFloatField
      FieldName = 'VlrIpi'
    end
    object qNotasVlrIcms: TFloatField
      FieldName = 'VlrIcms'
    end
    object qNotasNumOC: TIntegerField
      FieldName = 'NumOC'
    end
    object qNotasItemOC: TIntegerField
      FieldName = 'ItemOC'
    end
    object qNotasUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
    object qNotasCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object qNotasCodNatOper: TIntegerField
      FieldName = 'CodNatOper'
    end
    object qNotasGeraDupl: TBooleanField
      FieldName = 'GeraDupl'
    end
    object qNotasVlrFrete: TFloatField
      FieldName = 'VlrFrete'
    end
    object qNotasNomeForn: TStringField
      FieldName = 'NomeForn'
      Size = 60
    end
    object qNotasNomeProduto: TStringField
      FieldName = 'NomeProduto'
      Size = 40
    end
    object qNotasCodForn: TIntegerField
      FieldName = 'CodForn'
    end
    object qNotasFilial: TIntegerField
      FieldName = 'Filial'
    end
  end
  object dsqNotas: TDataSource
    DataSet = qNotas
    Left = 600
    Top = 8
  end
  object mCompras: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NumNota'
        DataType = ftInteger
      end
      item
        Name = 'CodFornecedor'
        DataType = ftInteger
      end
      item
        Name = 'NomeFornecedor'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Filial'
        DataType = ftInteger
      end
      item
        Name = 'CodMaterial'
        DataType = ftInteger
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Data'
        DataType = ftDate
      end
      item
        Name = 'NomeProduto'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'VlrUnitario'
        DataType = ftFloat
      end
      item
        Name = 'VlrTotal'
        DataType = ftFloat
      end
      item
        Name = 'Qtd'
        DataType = ftFloat
      end
      item
        Name = 'VlrFrete'
        DataType = ftFloat
      end
      item
        Name = 'VlrIcms'
        DataType = ftFloat
      end
      item
        Name = 'VlrIpi'
        DataType = ftFloat
      end
      item
        Name = 'CodCor'
        DataType = ftInteger
      end
      item
        Name = 'NomeCor'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'VlrDesconto'
        DataType = ftFloat
      end
      item
        Name = 'Unidade'
        DataType = ftString
        Size = 3
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 704
    Top = 24
    Data = {
      880100009619E0BD0100000018000000120000000000030000008801074E756D
      4E6F746104000100000000000D436F64466F726E656365646F72040001000000
      00000E4E6F6D65466F726E656365646F72010049000000010005574944544802
      0002003C000646696C69616C04000100000000000B436F644D6174657269616C
      0400010000000000045469706F01004900000001000557494454480200020005
      00044461746104000600000000000B4E6F6D6550726F6475746F010049000000
      01000557494454480200020032000B566C72556E69746172696F080004000000
      000008566C72546F74616C080004000000000003517464080004000000000008
      566C724672657465080004000000000007566C7249636D730800040000000000
      06566C72497069080004000000000006436F64436F720400010000000000074E
      6F6D65436F7201004900000001000557494454480200020028000B566C724465
      73636F6E746F080004000000000007556E696461646501004900000001000557
      494454480200020003000000}
    object mComprasNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mComprasCodFornecedor: TIntegerField
      FieldName = 'CodFornecedor'
    end
    object mComprasNomeFornecedor: TStringField
      FieldName = 'NomeFornecedor'
      Size = 60
    end
    object mComprasFilial: TIntegerField
      FieldName = 'Filial'
    end
    object mComprasCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
    end
    object mComprasTipo: TStringField
      FieldName = 'Tipo'
      Size = 5
    end
    object mComprasData: TDateField
      FieldName = 'Data'
    end
    object mComprasNomeProduto: TStringField
      FieldName = 'NomeProduto'
      Size = 50
    end
    object mComprasVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
      DisplayFormat = '###,###,##0.00###'
    end
    object mComprasVlrTotal: TFloatField
      FieldName = 'VlrTotal'
      DisplayFormat = '###,###,##0.00'
    end
    object mComprasQtd: TFloatField
      FieldName = 'Qtd'
    end
    object mComprasVlrFrete: TFloatField
      FieldName = 'VlrFrete'
      DisplayFormat = '###,###,##0.00'
    end
    object mComprasVlrIcms: TFloatField
      FieldName = 'VlrIcms'
      DisplayFormat = '###,###,##0.00'
    end
    object mComprasVlrIpi: TFloatField
      FieldName = 'VlrIpi'
      DisplayFormat = '###,###,##0.00'
    end
    object mComprasCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object mComprasNomeCor: TStringField
      FieldName = 'NomeCor'
      Size = 40
    end
    object mComprasVlrDesconto: TFloatField
      FieldName = 'VlrDesconto'
      DisplayFormat = '###,###,##0.00'
    end
    object mComprasUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
  end
  object dsmCompras: TDataSource
    DataSet = mCompras
    Left = 728
    Top = 24
  end
  object qNotasServico: TQuery
    OnCalcFields = qNotasCalcFields
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbnentrada.NumNEntr, Dbnentrada.DtEntrada, Dbnentrada.DtE' +
        'missaoNEntr, Dbfornecedores.NomeForn, Dbnentradaitensmobra.Descr' +
        'icao, Dbnentrada.CodForn, Dbnentrada.Filial, Dbnentradaitensmobr' +
        'a.Item ItemMobra, Dbnentradaitensmobra.VlrUnit VlrUnitServico, D' +
        'bnentradaitensmobra.VlrTotal VlrTotalServico, Dbnentradaitensmob' +
        'ra.Qtd QtdServico, Dbnentradaitensmobra.CodNatOper CodNatOperSer' +
        'vico, Dbnentradaitensmobra.GeraDupl GeraDuplMObra, Dbnentradaite' +
        'nsmobra.Codigo CodServico'
      'FROM "dbNEntrada.DB" Dbnentrada'
      
        '   FULL OUTER JOIN "dbNEntradaItensMobra.DB" Dbnentradaitensmobr' +
        'a'
      '   ON  (Dbnentrada.Filial = Dbnentradaitensmobra.Filial)  '
      '   AND  (Dbnentrada.NumNEntr = Dbnentradaitensmobra.NumNEntr)  '
      '   AND  (Dbnentrada.CodForn = Dbnentradaitensmobra.CodForn)  '
      '   INNER JOIN "dbFornecedores.DB" Dbfornecedores'
      '   ON  (Dbnentrada.CodForn = Dbfornecedores.CodForn)  '
      'WHERE   (Dbnentrada.CondPgto <> '#39'N'#39')  '
      '   AND  (Dbnentrada.VlrTotalDuplicata > 0)  '
      '   AND  (Dbnentradaitensmobra.GeraDupl = TRUE)  ')
    Left = 600
    Top = 88
    object qNotasServicoNumNEntr: TIntegerField
      FieldName = 'NumNEntr'
    end
    object qNotasServicoDtEntrada: TDateField
      FieldName = 'DtEntrada'
    end
    object qNotasServicoDtEmissaoNEntr: TDateField
      FieldName = 'DtEmissaoNEntr'
    end
    object qNotasServicoNomeForn: TStringField
      FieldName = 'NomeForn'
      Size = 60
    end
    object qNotasServicoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qNotasServicoCodForn: TIntegerField
      FieldName = 'CodForn'
    end
    object qNotasServicoFilial: TIntegerField
      FieldName = 'Filial'
    end
    object qNotasServicoItemMobra: TSmallintField
      FieldName = 'ItemMobra'
    end
    object qNotasServicoVlrUnitServico: TFloatField
      FieldName = 'VlrUnitServico'
    end
    object qNotasServicoVlrTotalServico: TFloatField
      FieldName = 'VlrTotalServico'
    end
    object qNotasServicoQtdServico: TFloatField
      FieldName = 'QtdServico'
    end
    object qNotasServicoCodNatOperServico: TIntegerField
      FieldName = 'CodNatOperServico'
    end
    object qNotasServicoGeraDuplMObra: TBooleanField
      FieldName = 'GeraDuplMObra'
    end
    object qNotasServicoCodServico: TSmallintField
      FieldName = 'CodServico'
    end
  end
  object dsqNotasServico: TDataSource
    DataSet = qNotasServico
    Left = 624
    Top = 88
  end
end
