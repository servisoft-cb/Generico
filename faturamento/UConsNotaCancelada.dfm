object fConsNotaCancelada: TfConsNotaCancelada
  Left = 139
  Top = 93
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Notas Canceladas'
  ClientHeight = 485
  ClientWidth = 788
  Color = clBtnFace
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
    Left = 3
    Top = 34
    Width = 89
    Height = 13
    Caption = 'Dt. Emiss'#227'o Inicial:'
  end
  object Label2: TLabel
    Left = 211
    Top = 34
    Width = 47
    Height = 13
    Caption = 'Dt. Inicial:'
  end
  object Label3: TLabel
    Left = 69
    Top = 8
    Width = 23
    Height = 13
    Caption = 'Filial:'
  end
  object DateEdit1: TDateEdit
    Left = 95
    Top = 26
    Width = 100
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object DateEdit2: TDateEdit
    Left = 259
    Top = 26
    Width = 100
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 52
    Width = 788
    Height = 433
    Align = alBottom
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 3
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
    ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 16
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Filial'
        Title.Alignment = taCenter
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lkFilial'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Filial'
        Width = 96
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
        Expanded = False
        FieldName = 'NomeCliente'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Cliente'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtEmissao'
        Title.Alignment = taCenter
        Title.Caption = 'Data Emiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MotivoCanc'
        Title.Alignment = taCenter
        Title.Caption = 'Motivo Cancelada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrTotalNota'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Total Nota'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrTotalDupl'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Total Duplicatas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BaseIcms'
        Title.Alignment = taCenter
        Title.Caption = 'Base Icms'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrIcms'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Icms'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrTotalItens'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Total Mercadorias'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrIpi'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Ipi'
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
        FieldName = 'VlrSeguro'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Seguro'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodCli'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Cliente'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 367
    Top = 11
    Width = 80
    Height = 27
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
  object BitBtn2: TBitBtn
    Left = 447
    Top = 11
    Width = 80
    Height = 27
    Caption = 'Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 527
    Top = 11
    Width = 80
    Height = 27
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtn3Click
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 95
    Top = 2
    Width = 264
    Height = 21
    DropDownCount = 5
    DropDownWidth = 400
    LookupField = 'Codigo'
    LookupDisplay = 'Empresa'
    LookupSource = DM1.dsFilial
    TabOrder = 0
  end
  object qNota: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbnotafiscal.Filial, Dbnotafiscal.NumNota, Dbnotafiscal.C' +
        'odCli, Dbcliente.Nome NomeCliente, Dbnotafiscal.DtEmissao, Dbnot' +
        'afiscal.CodNatOper, Dbnotafiscal.VlrTotalNota, Dbnotafiscal.Base' +
        'Icms, Dbnotafiscal.VlrTotalItens, Dbnotafiscal.VlrIpi, Dbnotafis' +
        'cal.VlrIcms, Dbnotafiscal.VlrFrete, Dbnotafiscal.VlrSeguro, Dbno' +
        'tafiscal.MotivoCanc, Dbnotafiscal.VlrTotalDupl'
      'FROM "dbNotaFiscal.DB" Dbnotafiscal'
      '   INNER JOIN "dbCliente.DB" Dbcliente'
      '   ON  (Dbnotafiscal.CodCli = Dbcliente.Codigo)  '
      'WHERE  (Dbnotafiscal.Cancelada = TRUE )')
    Left = 312
    Top = 144
    object qNotaFilial: TIntegerField
      FieldName = 'Filial'
      Origin = 'TABELAS."dbNotaFiscal.DB".Filial'
    end
    object qNotaNumNota: TIntegerField
      FieldName = 'NumNota'
      Origin = 'TABELAS."dbNotaFiscal.DB".NumNota'
    end
    object qNotaCodCli: TIntegerField
      FieldName = 'CodCli'
      Origin = 'TABELAS."dbNotaFiscal.DB".CodCli'
    end
    object qNotaNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Origin = 'TABELAS."dbCliente.DB".Nome'
      Size = 40
    end
    object qNotaDtEmissao: TDateField
      FieldName = 'DtEmissao'
      Origin = 'TABELAS."dbNotaFiscal.DB".DtEmissao'
    end
    object qNotaCodNatOper: TSmallintField
      FieldName = 'CodNatOper'
      Origin = 'TABELAS."dbNotaFiscal.DB".CodNatOper'
    end
    object qNotaVlrTotalNota: TFloatField
      FieldName = 'VlrTotalNota'
      Origin = 'TABELAS."dbNotaFiscal.DB".VlrTotalNota'
    end
    object qNotaBaseIcms: TFloatField
      FieldName = 'BaseIcms'
      Origin = 'TABELAS."dbNotaFiscal.DB".BaseIcms'
    end
    object qNotaVlrTotalItens: TFloatField
      FieldName = 'VlrTotalItens'
      Origin = 'TABELAS."dbNotaFiscal.DB".VlrTotalItens'
    end
    object qNotaVlrIpi: TFloatField
      FieldName = 'VlrIpi'
      Origin = 'TABELAS."dbNotaFiscal.DB".VlrIpi'
    end
    object qNotaVlrIcms: TFloatField
      FieldName = 'VlrIcms'
      Origin = 'TABELAS."dbNotaFiscal.DB".VlrIcms'
    end
    object qNotaVlrFrete: TFloatField
      FieldName = 'VlrFrete'
      Origin = 'TABELAS."dbNotaFiscal.DB".VlrFrete'
    end
    object qNotaVlrSeguro: TFloatField
      FieldName = 'VlrSeguro'
      Origin = 'TABELAS."dbNotaFiscal.DB".VlrSeguro'
    end
    object qNotaMotivoCanc: TStringField
      FieldName = 'MotivoCanc'
      Origin = 'TABELAS."dbNotaFiscal.DB".MotivoCanc'
      Size = 100
    end
    object qNotaVlrTotalDupl: TFloatField
      FieldName = 'VlrTotalDupl'
      Origin = 'TABELAS."dbNotaFiscal.DB".VlrTotalDupl'
    end
    object qNotalkFilial: TStringField
      FieldKind = fkLookup
      FieldName = 'lkFilial'
      LookupDataSet = DM2.tFilial2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Empresa'
      KeyFields = 'Filial'
      Size = 40
      Lookup = True
    end
  end
  object dsqNota: TDataSource
    Left = 336
    Top = 144
  end
end
