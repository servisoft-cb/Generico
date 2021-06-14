object fConsDiarioCli: TfConsDiarioCli
  Left = 2
  Top = 35
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Di'#225'rio de Clientes'
  ClientHeight = 498
  ClientWidth = 791
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
    Left = 13
    Top = 55
    Width = 47
    Height = 13
    Caption = 'Dt. Inicial:'
  end
  object Label2: TLabel
    Left = 37
    Top = 10
    Width = 23
    Height = 13
    Caption = 'Filial:'
  end
  object Label3: TLabel
    Left = 229
    Top = 55
    Width = 42
    Height = 13
    Caption = 'Dt. Final:'
  end
  object Label4: TLabel
    Left = 25
    Top = 32
    Width = 35
    Height = 13
    Caption = 'Cliente:'
  end
  object Bevel1: TBevel
    Left = 0
    Top = 71
    Width = 791
    Height = 2
    Shape = bsTopLine
  end
  object RxLabel1: TRxLabel
    Left = 336
    Top = 80
    Width = 74
    Height = 16
    Alignment = taRightJustify
    Caption = 'Saldo at'#233':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 62
    Top = 2
    Width = 310
    Height = 21
    DropDownCount = 8
    LookupField = 'Codigo'
    LookupDisplay = 'NomeInterno'
    LookupSource = DM1.dsFilial
    TabOrder = 0
    OnExit = RxDBLookupCombo1Exit
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
    Left = 273
    Top = 47
    Width = 100
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
  end
  object RxDBLookupCombo2: TRxDBLookupCombo
    Left = 62
    Top = 24
    Width = 310
    Height = 21
    DropDownCount = 8
    LookupField = 'Codigo'
    LookupDisplay = 'Nome'
    LookupSource = DM1.dsCliente
    TabOrder = 1
    OnEnter = RxDBLookupCombo2Enter
  end
  object Panel1: TPanel
    Left = 374
    Top = 1
    Width = 219
    Height = 66
    TabOrder = 4
    object Label5: TLabel
      Left = 12
      Top = 49
      Width = 66
      Height = 13
      Caption = 'P'#225'gina Inicial:'
    end
    object Label6: TLabel
      Left = 140
      Top = 49
      Width = 25
      Height = 13
      Caption = 'Final:'
    end
    object BitBtn1: TBitBtn
      Left = 5
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 81
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object CurrencyPagina: TCurrencyEdit
      Left = 80
      Top = 41
      Width = 41
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      MinValue = 1.000000000000000000
      TabOrder = 2
      Value = 1.000000000000000000
    end
    object CurrencyPaginaFinal: TCurrencyEdit
      Left = 169
      Top = 41
      Width = 41
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 3
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 2
    Top = 98
    Width = 786
    Height = 397
    DataSource = dsmDiario
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 5
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    OnGetCellParams = SMDBGrid1GetCellParams
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 10
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Data'
        Title.Alignment = taCenter
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodCli'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd.'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeCli'
        Title.Alignment = taCenter
        Title.Caption = 'Nome do Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Historico'
        Title.Alignment = taCenter
        Title.Caption = 'Hist'#243'rico'
        Width = 129
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
        FieldName = 'Parcela'
        Title.Alignment = taCenter
        Title.Caption = 'Parc.'
        Width = 30
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Filial'
        Title.Alignment = taCenter
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Debito'
        Title.Alignment = taCenter
        Title.Caption = 'D'#233'bitos'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Credito'
        Title.Alignment = taCenter
        Title.Caption = 'Cr'#233'ditos'
        Width = 69
        Visible = True
      end>
  end
  object ProgressBar1: TProgressBar
    Left = 600
    Top = 48
    Width = 185
    Height = 17
    TabOrder = 6
  end
  object CheckBox1: TCheckBox
    Left = 544
    Top = 79
    Width = 233
    Height = 17
    Alignment = taLeftJustify
    Caption = '<== Usar o saldo anterior no relat'#243'rio'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 7
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 411
    Top = 74
    Width = 95
    Height = 21
    TabStop = False
    AutoSize = False
    Color = clSilver
    DisplayFormat = '###,###,##0.00'
    ReadOnly = True
    TabOrder = 8
  end
  object Panel2: TPanel
    Left = 595
    Top = 1
    Width = 195
    Height = 41
    TabOrder = 9
    object BitBtn4: TBitBtn
      Left = 3
      Top = 4
      Width = 118
      Height = 25
      Caption = 'Confirma '#218'lt. P'#225'gina'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn4Click
    end
  end
  object qConsulta: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT dbCReceberParc.Filial, dbCReceberParc.NumCReceber, dbCRec' +
        'eberParc.ParcCReceber, dbCReceberParc.CodCli, dbCReceberParc.Num' +
        'Nota, dbCReceberParc.VlrParcCReceber, dbCReceberParc.DtVencCRece' +
        'ber, dbCReceberParchist.DtUltPgto, dbCReceberParchist.VlrUltPgto' +
        ', dbCReceberParchist.Tipo, dbCReceberParchist.VlrUltDescontos, d' +
        'bCReceberParchist.VlrDevolucao, DbCliente.Nome NomeCli'
      'FROM "dbCReceberParc.DB" dbCReceberParc'
      '   INNER JOIN "dbCReceberParcHist.DB" dbCReceberParchist'
      '   ON  (dbCReceberParc.Filial = dbCReceberParchist.Filial)'
      
        '   AND  (dbCReceberParc.NumCReceber = dbCReceberParchist.NumCRec' +
        'eber)'
      
        '   AND  (dbCReceberParc.ParcCReceber = dbCReceberParchist.ParcCR' +
        'eceber)'
      '   INNER JOIN "dbCliente.DB" dbCliente'
      '   ON  (dbCReceberParc.CodCli = DbCliente.Codigo)'
      ' '
      ' ')
    Left = 464
    Top = 136
    object qConsultaFilial: TIntegerField
      FieldName = 'Filial'
    end
    object qConsultaNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
    end
    object qConsultaParcCReceber: TIntegerField
      FieldName = 'ParcCReceber'
    end
    object qConsultaCodCli: TIntegerField
      FieldName = 'CodCli'
    end
    object qConsultaNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object qConsultaVlrParcCReceber: TFloatField
      FieldName = 'VlrParcCReceber'
    end
    object qConsultaDtVencCReceber: TDateField
      FieldName = 'DtVencCReceber'
    end
    object qConsultaDtUltPgto: TDateField
      FieldName = 'DtUltPgto'
    end
    object qConsultaVlrUltPgto: TFloatField
      FieldName = 'VlrUltPgto'
    end
    object qConsultaTipo: TStringField
      FieldName = 'Tipo'
      Size = 3
    end
    object qConsultaVlrUltDescontos: TFloatField
      FieldName = 'VlrUltDescontos'
    end
    object qConsultaVlrDevolucao: TFloatField
      FieldName = 'VlrDevolucao'
    end
    object qConsultaNomeCli: TStringField
      FieldName = 'NomeCli'
      Size = 40
    end
  end
  object dsqConsulta: TDataSource
    DataSet = qConsulta
    Left = 480
    Top = 136
  end
  object dsmDiario: TDataSource
    DataSet = mDiario
    Left = 360
    Top = 168
  end
  object qSaldoAnt: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT SUM( DbCReceberparc.VlrParcCReceber ) VlrParcCReceber, SU' +
        'M( DbCReceberparchist.VlrUltPgto ) VlrUltPgto, SUM( DbCReceberpa' +
        'rchist.VlrUltDescontos ) VlrUltDescontos, SUM( DbCReceberparchis' +
        't.VlrDevolucao ) VlrDevolucao, DbCReceberparchist.Tipo, dbcreceb' +
        'erparc.codcli'
      'FROM "dbCReceberParc.DB" DbCReceberparc'
      '   INNER JOIN "dbCReceberParcHist.DB" DbCReceberparchist'
      '   ON  (DbCReceberparc.Filial = DbCReceberparchist.Filial)'
      
        '   AND  (DbCReceberparc.NumCReceber = DbCReceberparchist.NumCRec' +
        'eber)'
      
        '   AND  (DbCReceberparc.ParcCReceber = DbCReceberparchist.ParcCR' +
        'eceber)'
      
        'WHERE  ((DbCReceberparchist.Tipo <> '#39'ALT'#39' ) and  (DbCReceberparc' +
        'hist.Tipo <> '#39'DIV'#39' ) and  (DbCReceberparchist.Tipo <> '#39'OUT'#39' ))'
      '      AND  (dbCReceberParcHist.DtUltPgto < :DataIni)'
      
        '      AND  ((dbCReceberParc.Cancelado = False) or (dbCReceberPar' +
        'c.Cancelado is Null))'
      'GROUP BY DbCReceberparchist.Tipo, dbcreceberparc.codcli'
      ''
      ' '
      ' ')
    Left = 464
    Top = 216
    ParamData = <
      item
        DataType = ftDate
        Name = 'DataIni'
        ParamType = ptUnknown
      end>
    object qSaldoAntVlrParcCReceber: TFloatField
      FieldName = 'VlrParcCReceber'
      Origin = 'TABELAS."dbCReceberParc.DB".VlrParcCReceber'
      DisplayFormat = '###,###,##0.00'
    end
    object qSaldoAntVlrUltPgto: TFloatField
      FieldName = 'VlrUltPgto'
      Origin = 'TABELAS."dbCReceberParcHist.DB".VlrUltPgto'
      DisplayFormat = '###,###,##0.00'
    end
    object qSaldoAntVlrUltDescontos: TFloatField
      FieldName = 'VlrUltDescontos'
      Origin = 'TABELAS."dbCReceberParcHist.DB".VlrUltDescontos'
      DisplayFormat = '###,###,##0.00'
    end
    object qSaldoAntVlrDevolucao: TFloatField
      FieldName = 'VlrDevolucao'
      Origin = 'TABELAS."dbCReceberParcHist.DB".VlrDevolucao'
      DisplayFormat = '###,###,##0.00'
    end
    object qSaldoAntTipo: TStringField
      FieldName = 'Tipo'
      Origin = 'TABELAS."dbCReceberParcHist.DB".Tipo'
      Size = 3
    end
  end
  object mDiario: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NumCReceber'
        DataType = ftInteger
      end
      item
        Name = 'Parcela'
        DataType = ftInteger
      end
      item
        Name = 'Data'
        DataType = ftDate
      end
      item
        Name = 'Historico'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NumNota'
        DataType = ftInteger
      end
      item
        Name = 'Filial'
        DataType = ftInteger
      end
      item
        Name = 'Debito'
        DataType = ftFloat
      end
      item
        Name = 'Credito'
        DataType = ftFloat
      end
      item
        Name = 'NumControle'
        DataType = ftInteger
      end
      item
        Name = 'CodCli'
        DataType = ftInteger
      end
      item
        Name = 'NomeCli'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'Data;NumControle;NomeCli;NumNota'
    Params = <>
    StoreDefs = True
    OnNewRecord = mDiarioNewRecord
    Left = 336
    Top = 168
    Data = {
      FC0000009619E0BD01000000180000000B000000000003000000FC000B4E756D
      435265636562657204000100000000000750617263656C610400010000000000
      0444617461040006000000000009486973746F7269636F010049000000010005
      5749445448020002001E00074E756D4E6F746104000100000000000646696C69
      616C04000100000000000644656269746F080004000000000007437265646974
      6F08000400000000000B4E756D436F6E74726F6C65040001000000000006436F
      64436C690400010000000000074E6F6D65436C69010049000000010005574944
      544802000200280001000D44454641554C545F4F524445520200820000000000}
    object mDiarioNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
    end
    object mDiarioParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object mDiarioData: TDateField
      FieldName = 'Data'
    end
    object mDiarioHistorico: TStringField
      FieldName = 'Historico'
      Size = 30
    end
    object mDiarioNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mDiarioFilial: TIntegerField
      FieldName = 'Filial'
    end
    object mDiarioDebito: TFloatField
      FieldName = 'Debito'
      DisplayFormat = '###,###,##0.00'
    end
    object mDiarioCredito: TFloatField
      FieldName = 'Credito'
      DisplayFormat = '###,###,##0.00'
    end
    object mDiarioNumControle: TIntegerField
      FieldName = 'NumControle'
    end
    object mDiarioCodCli: TIntegerField
      FieldName = 'CodCli'
    end
    object mDiarioNomeCli: TStringField
      FieldName = 'NomeCli'
      Size = 40
    end
  end
end
