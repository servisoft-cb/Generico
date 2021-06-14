object fConsSaldos: TfConsSaldos
  Left = 91
  Top = 109
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Saldo das contas (Bancos)'
  ClientHeight = 563
  ClientWidth = 788
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 788
    Height = 59
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 136
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label2: TLabel
      Left = 299
      Top = 16
      Width = 25
      Height = 13
      Caption = 'Final:'
    end
    object Label3: TLabel
      Left = 441
      Top = 15
      Width = 100
      Height = 13
      Caption = 'Usar no Saldo Inicial:'
    end
    object BitBtn6: TBitBtn
      Left = 8
      Top = 3
      Width = 121
      Height = 27
      Caption = 'Consulta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn6Click
    end
    object DateEdit1: TDateEdit
      Left = 195
      Top = 8
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object DateEdit2: TDateEdit
      Left = 326
      Top = 8
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
    object ComboBox1: TComboBox
      Left = 544
      Top = 8
      Width = 225
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = 'Saldo (N'#227'o soma os Atrasados)'
      Items.Strings = (
        'Saldo (N'#227'o soma os Atrasados)'
        'Sub Saldo (Soma os Atrasados)'
        'Soma Cheque Atrasados'
        'Soma Contas a Receber Atrasados'
        'Soma Contas a Pagar Atrasados'
        'Soma Cheques/Contas Receber em Atraso'
        'Soma Cheques/Contas Pagar em Atraso')
    end
    object BitBtn1: TBitBtn
      Left = 694
      Top = 31
      Width = 75
      Height = 25
      Caption = 'Recalcular'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object ProgressBar1: TProgressBar
      Left = 8
      Top = 35
      Width = 237
      Height = 16
      TabOrder = 5
    end
    object ProgressBar2: TProgressBar
      Left = 248
      Top = 35
      Width = 237
      Height = 16
      TabOrder = 6
    end
    object BitBtn2: TBitBtn
      Left = 617
      Top = 31
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = BitBtn2Click
    end
    object CheckBox1: TCheckBox
      Left = 496
      Top = 34
      Width = 97
      Height = 17
      Caption = 'Imprimir as datas'
      TabOrder = 8
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 59
    Width = 788
    Height = 504
    ActivePage = TabSheet2
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    FixedDimension = 19
    object TabSheet2: TRzTabSheet
      Color = clMoneyGreen
      Caption = 'Por Data'
      object Splitter1: TSplitter
        Left = 0
        Top = 186
        Width = 784
        Height = 6
        Cursor = crVSplit
        Align = alTop
      end
      object SMDBGrid2: TSMDBGrid
        Left = 0
        Top = 192
        Width = 784
        Height = 272
        Align = alClient
        DataSource = dsmSaldoPorData
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        GridStyle.Style = gsPriceList
        GridStyle.OddColor = cl3DLight
        GridStyle.EvenColor = clWindow
        TitleHeight.PixelCount = 24
        FooterColor = clBtnFace
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        FixedCols = 1
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 16
        ScrollBars = ssHorizontal
        ColCount = 7
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Data'
            Title.Alignment = taCenter
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Saldo'
            Title.Alignment = taCenter
            Title.Caption = 'Saldo Inicial'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VlrChequePagar'
            Title.Alignment = taCenter
            Title.Caption = 'Cheques'
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VlrContasReceber'
            Title.Alignment = taCenter
            Title.Caption = 'A Receber'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VlrContasPagar'
            Title.Alignment = taCenter
            Title.Caption = 'A Pagar'
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SaldoGeral'
            Title.Alignment = taCenter
            Title.Caption = 'Saldo'
            Width = 110
            Visible = True
          end>
      end
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 0
        Width = 784
        Height = 186
        Align = alTop
        DataSource = dsmSaldoConta
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
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
        GridStyle.Style = gsPriceList
        GridStyle.OddColor = cl3DLight
        GridStyle.EvenColor = clWindow
        TitleHeight.PixelCount = 24
        FooterColor = clBtnFace
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        FixedCols = 1
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 16
        ScrollBars = ssHorizontal
        ColCount = 12
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'NomeConta'
            Title.Alignment = taCenter
            Title.Caption = 'Nome da Conta'
            Width = 211
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Saldo'
            Title.Alignment = taCenter
            Title.Color = 10930928
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VlrChequeAtrasado'
            Title.Alignment = taCenter
            Title.Caption = 'Cheques em Atraso'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VlrCReceberAtrasado'
            Title.Alignment = taCenter
            Title.Caption = 'A Receber em Atraso'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VlrCPagarAtrasado'
            Title.Alignment = taCenter
            Title.Caption = 'A Pagar em Atraso'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SubSaldo'
            Title.Alignment = taCenter
            Title.Caption = 'Sub Saldo '
            Title.Color = 10930928
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VlrCheque'
            Title.Alignment = taCenter
            Title.Caption = 'Cheques No Per'#237'odo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VlrCReceber'
            Title.Alignment = taCenter
            Title.Caption = 'A Receber No Per'#237'odo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VlrCPagar'
            Title.Alignment = taCenter
            Title.Caption = 'A Pagar no Per'#237'odo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SaldoGeral'
            Title.Alignment = taCenter
            Title.Caption = 'Saldo Geral'
            Title.Color = 10930928
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CodConta'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Conta'
            Width = 34
            Visible = True
          end>
      end
      object StaticText1: TStaticText
        Left = 0
        Top = 464
        Width = 784
        Height = 17
        Align = alBottom
        BorderStyle = sbsSunken
        Caption = 'F3= Contas a Receber     F4= Contas a Pagar    F5= Cheques'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object qContas: TQuery
    OnCalcFields = qContasCalcFields
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbcontas.CodConta, Dbcontas.NomeConta, Dbcontas.NumConta,' +
        ' Dbcontas.Filial, SUM( Dbmovimentos.VlrMovDebito ) VlrMovDebito,' +
        ' SUM( Dbmovimentos.VlrMovCredito ) VlrMovCredito, Dbcontas.DigCo' +
        'nta'
      'FROM "dbContas.DB" Dbcontas'
      '   LEFT OUTER JOIN "dbMovimentos.DB" Dbmovimentos'
      '   ON  (Dbcontas.CodConta = Dbmovimentos.CodConta)  '
      
        'GROUP BY Dbcontas.CodConta, Dbcontas.NomeConta, Dbcontas.NumCont' +
        'a, Dbcontas.Filial, Dbcontas.DigConta')
    Left = 296
    Top = 208
    object qContasCodConta: TIntegerField
      FieldName = 'CodConta'
      Origin = 'TABELAS."dbContas.DB".CodConta'
    end
    object qContasNomeConta: TStringField
      FieldName = 'NomeConta'
      Origin = 'TABELAS."dbContas.DB".NomeConta'
      Size = 40
    end
    object qContasNumConta: TStringField
      FieldName = 'NumConta'
      Origin = 'TABELAS."dbContas.DB".NumConta'
      Size = 12
    end
    object qContasFilial: TIntegerField
      FieldName = 'Filial'
      Origin = 'TABELAS."dbContas.DB".Filial'
    end
    object qContasVlrMovDebito: TFloatField
      FieldName = 'VlrMovDebito'
      Origin = 'TABELAS."dbMovimentos.DB".VlrMovDebito'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qContasVlrMovCredito: TFloatField
      FieldName = 'VlrMovCredito'
      Origin = 'TABELAS."dbMovimentos.DB".VlrMovCredito'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qContasclVlrMovimento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'clVlrMovimento'
      DisplayFormat = '###,###,###,##0.00'
      Calculated = True
    end
  end
  object qCheques: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT CodConta, SUM( VlrTotal ) VlrTotal, DtPrevista'
      'FROM "dbCheque.DB" Dbcheque'
      'WHERE   ((DtEntrada IS NULL) or (DtEntrada < '#39'01/01/1900'#39'))'
      '   AND  (DtPrevista <= :DtPrevista)  '
      'GROUP BY CodConta, DtPrevista'
      'ORDER BY CodConta, DtPrevista ')
    Left = 328
    Top = 384
    ParamData = <
      item
        DataType = ftDate
        Name = 'DtPrevista'
        ParamType = ptUnknown
      end>
    object qChequesCodConta: TIntegerField
      FieldName = 'CodConta'
      Origin = 'TABELAS."dbCheque.DB".CodConta'
    end
    object qChequesVlrTotal: TFloatField
      FieldName = 'VlrTotal'
      Origin = 'TABELAS."dbCheque.DB".VlrTotal'
    end
    object qChequesDtPrevista: TDateField
      FieldName = 'DtPrevista'
      Origin = 'TABELAS."dbCheque.DB".DtPrevista'
    end
  end
  object qCReceber: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT CodBancoBoleto, SUM( RestParcela ) RestParcela, DtVencime' +
        'nto2'
      'FROM "dbCReceberParc.DB" Dbcreceberparc'
      'WHERE   (RestParcela > 0)  '
      '   AND  ( (Cancelado = FALSE)  OR  (Cancelado IS NULL) )  '
      '   AND  (DtVencimento2  <= :DtVencimento2)'
      'GROUP BY CodBancoBoleto, DtVencimento2'
      'ORDER BY CodBancoBoleto, DtVencimento2')
    Left = 232
    Top = 384
    ParamData = <
      item
        DataType = ftDate
        Name = 'DtVencimento2'
        ParamType = ptUnknown
      end>
    object qCReceberCodBancoBoleto: TIntegerField
      FieldName = 'CodBancoBoleto'
      Origin = 'TABELAS."dbCReceberParc.DB".CodBancoBoleto'
    end
    object qCReceberRestParcela: TFloatField
      FieldName = 'RestParcela'
      Origin = 'TABELAS."dbCReceberParc.DB".RestParcela'
    end
    object qCReceberDtVencimento2: TDateField
      FieldName = 'DtVencimento2'
      Origin = 'TABELAS."dbCReceberParc.DB".DtVencimento2'
    end
  end
  object mSaldoPorData: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CodConta'
        DataType = ftInteger
      end
      item
        Name = 'Data'
        DataType = ftDate
      end
      item
        Name = 'Saldo'
        DataType = ftFloat
      end
      item
        Name = 'VlrChequePagar'
        DataType = ftFloat
      end
      item
        Name = 'VlrContasReceber'
        DataType = ftFloat
      end
      item
        Name = 'VlrContasPagar'
        DataType = ftFloat
      end
      item
        Name = 'SaldoGeral'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'CodConta;Data'
    MasterFields = 'CodConta'
    MasterSource = dsmSaldoConta
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 616
    Top = 208
    Data = {
      B60000009619E0BD010000001800000007000000000003000000B60008436F64
      436F6E74610400010000000000044461746104000600000000000553616C646F
      08000400000000000E566C724368657175655061676172080004000000000010
      566C72436F6E7461735265636562657208000400000000000E566C72436F6E74
      6173506167617208000400000000000A53616C646F476572616C080004000000
      000001000D44454641554C545F4F524445520200820000000000}
    object mSaldoPorDataCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object mSaldoPorDataData: TDateField
      FieldName = 'Data'
    end
    object mSaldoPorDataSaldo: TFloatField
      FieldName = 'Saldo'
      DisplayFormat = '###,###,##0.00'
    end
    object mSaldoPorDataVlrChequePagar: TFloatField
      FieldName = 'VlrChequePagar'
      DisplayFormat = '###,###,##0.00'
    end
    object mSaldoPorDataVlrContasReceber: TFloatField
      FieldName = 'VlrContasReceber'
      DisplayFormat = '###,###,##0.00'
    end
    object mSaldoPorDataVlrContasPagar: TFloatField
      FieldName = 'VlrContasPagar'
      DisplayFormat = '###,###,##0.00'
    end
    object mSaldoPorDataSaldoGeral: TFloatField
      FieldName = 'SaldoGeral'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsmSaldoPorData: TDataSource
    DataSet = mSaldoPorData
    Left = 640
    Top = 208
  end
  object mSaldoConta: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CodConta'
        DataType = ftInteger
      end
      item
        Name = 'NomeConta'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Saldo'
        DataType = ftFloat
      end
      item
        Name = 'VlrChequeAtrasado'
        DataType = ftFloat
      end
      item
        Name = 'VlrCReceberAtrasado'
        DataType = ftFloat
      end
      item
        Name = 'VlrCPagarAtrasado'
        DataType = ftFloat
      end
      item
        Name = 'SubSaldo'
        DataType = ftFloat
      end
      item
        Name = 'VlrCheque'
        DataType = ftFloat
      end
      item
        Name = 'VlrCReceber'
        DataType = ftFloat
      end
      item
        Name = 'VlrCPagar'
        DataType = ftFloat
      end
      item
        Name = 'SaldoGeral'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'CodConta'
    Params = <>
    StoreDefs = True
    Left = 617
    Top = 261
    Data = {
      030100009619E0BD01000000180000000B000000000003000000030108436F64
      436F6E74610400010000000000094E6F6D65436F6E7461010049000000010005
      57494454480200020028000553616C646F080004000000000011566C72436865
      717565417472617361646F080004000000000013566C72435265636562657241
      7472617361646F080004000000000011566C7243506167617241747261736164
      6F08000400000000000853756253616C646F080004000000000009566C724368
      6571756508000400000000000B566C7243526563656265720800040000000000
      09566C7243506167617208000400000000000A53616C646F476572616C080004
      00000000000000}
    object mSaldoContaCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object mSaldoContaNomeConta: TStringField
      FieldName = 'NomeConta'
      Size = 40
    end
    object mSaldoContaSaldo: TFloatField
      FieldName = 'Saldo'
      DisplayFormat = '###,###,##0.00'
    end
    object mSaldoContaVlrChequeAtrasado: TFloatField
      FieldName = 'VlrChequeAtrasado'
      DisplayFormat = '###,###,##0.00'
    end
    object mSaldoContaVlrCReceberAtrasado: TFloatField
      FieldName = 'VlrCReceberAtrasado'
      DisplayFormat = '###,###,##0.00'
    end
    object mSaldoContaVlrCPagarAtrasado: TFloatField
      FieldName = 'VlrCPagarAtrasado'
      DisplayFormat = '###,###,##0.00'
    end
    object mSaldoContaSubSaldo: TFloatField
      FieldName = 'SubSaldo'
      DisplayFormat = '###,###,##0.00'
    end
    object mSaldoContaVlrCheque: TFloatField
      FieldName = 'VlrCheque'
      DisplayFormat = '###,###,##0.00'
    end
    object mSaldoContaVlrCReceber: TFloatField
      FieldName = 'VlrCReceber'
      DisplayFormat = '###,###,##0.00'
    end
    object mSaldoContaVlrCPagar: TFloatField
      FieldName = 'VlrCPagar'
      DisplayFormat = '###,###,##0.00'
    end
    object mSaldoContaSaldoGeral: TFloatField
      FieldName = 'SaldoGeral'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsmSaldoConta: TDataSource
    DataSet = mSaldoConta
    Left = 641
    Top = 261
  end
  object qCPagar: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT DtVencCPagar, CodConta, SUM( RestParcela ) RestParcela'
      'FROM "dbCPagarParc.DB" Dbcpagarparc'
      'WHERE   (RestParcela > 0)  '
      '   AND  DtVencCPagar <= :DtVencCPagar '
      'GROUP BY DtVencCPagar, CodConta'
      'ORDER BY CodConta, DtVencCPagar')
    Left = 281
    Top = 381
    ParamData = <
      item
        DataType = ftDate
        Name = 'DtVencCPagar'
        ParamType = ptUnknown
      end>
    object qCPagarDtVencCPagar: TDateField
      FieldName = 'DtVencCPagar'
      Origin = 'TABELAS."dbCPagarParc.DB".DtVencCPagar'
    end
    object qCPagarCodConta: TIntegerField
      FieldName = 'CodConta'
      Origin = 'TABELAS."dbCPagarParc.DB".CodConta'
    end
    object qCPagarRestParcela: TFloatField
      FieldName = 'RestParcela'
      Origin = 'TABELAS."dbCPagarParc.DB".RestParcela'
    end
  end
end
