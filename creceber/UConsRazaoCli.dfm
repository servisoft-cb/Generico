object fConsRazaoCli: TfConsRazaoCli
  Left = 2
  Top = 30
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Raz'#227'o de Clientes'
  ClientHeight = 503
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
    Left = 4
    Top = 55
    Width = 47
    Height = 13
    Caption = 'Dt. Inicial:'
  end
  object Label2: TLabel
    Left = 28
    Top = 10
    Width = 23
    Height = 13
    Caption = 'Filial:'
  end
  object Label3: TLabel
    Left = 194
    Top = 55
    Width = 42
    Height = 13
    Caption = 'Dt. Final:'
  end
  object Label4: TLabel
    Left = 16
    Top = 32
    Width = 35
    Height = 13
    Caption = 'Cliente:'
  end
  object Bevel1: TBevel
    Left = 0
    Top = 71
    Width = 787
    Height = 2
    Shape = bsTopLine
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 53
    Top = 2
    Width = 285
    Height = 21
    DropDownCount = 8
    LookupField = 'Codigo'
    LookupDisplay = 'NomeInterno'
    LookupSource = DM1.dsFilial
    TabOrder = 0
    OnExit = RxDBLookupCombo1Exit
  end
  object DateEdit1: TDateEdit
    Left = 53
    Top = 47
    Width = 100
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object DateEdit2: TDateEdit
    Left = 238
    Top = 47
    Width = 100
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
  end
  object RxDBLookupCombo2: TRxDBLookupCombo
    Left = 53
    Top = 24
    Width = 285
    Height = 21
    DropDownCount = 8
    LookupField = 'Codigo'
    LookupDisplay = 'Nome'
    LookupSource = DM1.dsCliente
    TabOrder = 1
    OnEnter = RxDBLookupCombo2Enter
  end
  object Panel1: TPanel
    Left = 341
    Top = 1
    Width = 219
    Height = 66
    TabOrder = 4
    object Label5: TLabel
      Left = 4
      Top = 47
      Width = 66
      Height = 13
      Caption = 'P'#225'gina Inicial:'
    end
    object Label6: TLabel
      Left = 140
      Top = 45
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
      Left = 72
      Top = 39
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
      Top = 37
      Width = 41
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 3
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 3
    Top = 74
    Width = 784
    Height = 426
    DataSource = dsmRazao
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
    ColCount = 13
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Data'
        Title.Alignment = taCenter
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodCli'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd.'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeCli'
        Title.Alignment = taCenter
        Title.Caption = 'Nome do Cliente'
        Width = 243
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
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Debito'
        Title.Alignment = taCenter
        Title.Caption = 'D'#233'bitos'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Credito'
        Title.Alignment = taCenter
        Title.Caption = 'Cr'#233'ditos'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Saldo'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Parcela'
        Title.Alignment = taCenter
        Title.Caption = 'Parc.'
        Width = 29
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
        FieldName = 'NumCReceber'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' CReceber'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Filial'
        Title.Alignment = taCenter
        Width = 28
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
  object Panel2: TPanel
    Left = 560
    Top = 1
    Width = 225
    Height = 41
    TabOrder = 7
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
      
        'SELECT DbCReceberparc.Filial, DbCReceberparc.NumCReceber, DbCRec' +
        'eberparc.ParcCReceber, DbCReceberparc.CodCli, DbCReceberparc.Num' +
        'Nota, DbCReceberparc.VlrParcCReceber, DbCReceberparc.DtVencCRece' +
        'ber, DbCReceberparchist.DtUltPgto, DbCReceberparchist.VlrUltPgto' +
        ', DbCReceberparchist.Tipo, DbCReceberparchist.VlrUltDescontos, D' +
        'bCReceberparchist.VlrDevolucao, dbCliente.Nome NomeCli'
      'FROM "dbCReceberParc.DB" DbCReceberparc'
      '   INNER JOIN "dbCReceberParcHist.DB" DbCReceberparchist'
      '   ON  (DbCReceberparc.Filial = DbCReceberparchist.Filial)'
      
        '   AND  (DbCReceberparc.NumCReceber = DbCReceberparchist.NumCRec' +
        'eber)'
      
        '   AND  (DbCReceberparc.ParcCReceber = DbCReceberparchist.ParcCR' +
        'eceber)'
      '   INNER JOIN "dbCliente.DB" DbCliente'
      '   ON  (DbCReceberparc.CodCli = DbCliente.Codigo)'
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
  object mRazao: TClientDataSet
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
        Name = 'Ano'
        DataType = ftInteger
      end
      item
        Name = 'Mes'
        DataType = ftInteger
      end
      item
        Name = 'Saldo'
        DataType = ftFloat
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
    IndexFieldNames = 'NomeCli;CodCli;Ano;Mes;NumControle;Data'
    Params = <>
    StoreDefs = True
    OnNewRecord = mRazaoNewRecord
    Left = 336
    Top = 168
    Data = {
      220100009619E0BD01000000180000000E00000000000300000022010B4E756D
      435265636562657204000100000000000750617263656C610400010000000000
      0444617461040006000000000009486973746F7269636F010049000000010005
      5749445448020002001E00074E756D4E6F746104000100000000000646696C69
      616C04000100000000000644656269746F080004000000000007437265646974
      6F08000400000000000B4E756D436F6E74726F6C65040001000000000003416E
      6F0400010000000000034D657304000100000000000553616C646F0800040000
      00000006436F64436C690400010000000000074E6F6D65436C69010049000000
      010005574944544802000200280001000D44454641554C545F4F524445520200
      820000000000}
    object mRazaoNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
    end
    object mRazaoParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object mRazaoData: TDateField
      FieldName = 'Data'
    end
    object mRazaoHistorico: TStringField
      FieldName = 'Historico'
      Size = 30
    end
    object mRazaoNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mRazaoFilial: TIntegerField
      FieldName = 'Filial'
    end
    object mRazaoDebito: TFloatField
      FieldName = 'Debito'
      DisplayFormat = '###,###,##0.00'
    end
    object mRazaoCredito: TFloatField
      FieldName = 'Credito'
      DisplayFormat = '###,###,##0.00'
    end
    object mRazaoNumControle: TIntegerField
      FieldName = 'NumControle'
    end
    object mRazaoAno: TIntegerField
      FieldName = 'Ano'
    end
    object mRazaoMes: TIntegerField
      FieldName = 'Mes'
    end
    object mRazaoSaldo: TFloatField
      FieldName = 'Saldo'
      DisplayFormat = '###,###,##0.00'
    end
    object mRazaoCodCli: TIntegerField
      FieldName = 'CodCli'
    end
    object mRazaoNomeCli: TStringField
      FieldName = 'NomeCli'
      Size = 40
    end
  end
  object dsmRazao: TDataSource
    DataSet = mRazao
    Left = 360
    Top = 168
  end
  object qSaldoAnt: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT SUM( DbCReceberparc.VlrParcCReceber ) VlrParcCReceber, SU' +
        'M( DbCReceberparchist.VlrUltPgto ) VlrUltPgto, SUM( DbCReceberpa' +
        'rchist.VlrUltDescontos ) VlrUltDescontos, SUM( DbCReceberparchis' +
        't.VlrDevolucao ) VlrDevolucao, DbCReceberparchist.Tipo, dbCReceb' +
        'erParc.CodCli'
      'FROM "dbCReceberParc.DB" DbCReceberparc'
      '   INNER JOIN "dbCReceberParcHist.DB" DbCReceberparchist'
      '   ON  (DbCReceberparc.Filial = DbCReceberparchist.Filial)'
      
        '   AND  (DbCReceberparc.NumCReceber = DbCReceberparchist.NumCRec' +
        'eber)'
      
        '   AND  (DbCReceberparc.ParcCReceber = DbCReceberparchist.ParcCR' +
        'eceber)'
      'WHERE  (DbCReceberparchist.Tipo <> '#39'ALT'#39' )'
      '      AND  (dbCReceberParcHist.DtUltPgto < :DataIni)'
      
        '      AND  ((dbCReceberParc.Cancelado = False) or (dbCReceberPar' +
        'c.Cancelado is Null))'
      'GROUP BY DbCReceberparchist.Tipo, dbCReceberParc.CodCli'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 464
    Top = 224
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
    object qSaldoAntCodCli: TIntegerField
      FieldName = 'CodCli'
      Origin = 'TABELAS."dbCReceberParc.DB".CodCli'
    end
  end
end
