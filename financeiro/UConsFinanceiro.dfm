object fConsFinanceiro: TfConsFinanceiro
  Left = 1
  Top = 56
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta'
  ClientHeight = 481
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
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 69
    Width = 788
    Height = 412
    Align = alClient
    DataSource = dsmFinanceiro
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
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
        FieldName = 'DtVencimento'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Vencimento'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Alignment = taCenter
        Width = 227
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumNota'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Documento'
        Width = 69
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
        FieldName = 'Tipo'
        Title.Alignment = taCenter
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrCredito'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Cr'#233'dito'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrDebito'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. D'#233'bito'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Saldo'
        Title.Alignment = taCenter
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Banco'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeTipoCobranca'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo Cobran'#231'a'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 788
    Height = 69
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 56
      Height = 13
      Caption = 'Data Inicial:'
    end
    object Label2: TLabel
      Left = 172
      Top = 32
      Width = 51
      Height = 13
      Caption = 'Data Final:'
    end
    object Label3: TLabel
      Left = 41
      Top = 10
      Width = 23
      Height = 13
      Caption = 'Filial:'
    end
    object Label4: TLabel
      Left = 384
      Top = 8
      Width = 69
      Height = 13
      Caption = 'Saldo Anterior:'
    end
    object DateEdit1: TDateEdit
      Left = 66
      Top = 24
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 226
      Top = 24
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 544
      Top = 34
      Width = 79
      Height = 31
      Caption = 'Consultar'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 624
      Top = 34
      Width = 79
      Height = 31
      Caption = 'Imprimir'
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 704
      Top = 34
      Width = 79
      Height = 31
      Caption = 'Fechar'
      TabOrder = 4
      OnClick = BitBtn3Click
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 66
      Top = 2
      Width = 259
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'Empresa'
      LookupSource = DM1.dsFilial
      TabOrder = 5
    end
    object CheckBox1: TCheckBox
      Left = 64
      Top = 51
      Width = 129
      Height = 17
      Caption = 'Mostrar Transf. ICMS'
      TabOrder = 6
    end
    object ProgressBar1: TProgressBar
      Left = 496
      Top = 2
      Width = 289
      Height = 17
      TabOrder = 7
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 360
      Top = 23
      Width = 121
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clAqua
      DisplayFormat = '###,###,##0.00'
      ReadOnly = True
      TabOrder = 8
    end
    object CheckBox2: TCheckBox
      Left = 359
      Top = 47
      Width = 129
      Height = 17
      Caption = 'Usar o saldo anterior'
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
  end
  object qCReceber: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbcreceberparc.CodCli, Dbcliente.Nome, Dbcreceberparc.Num' +
        'CReceber, Dbcreceberparc.ParcCReceber, Dbcreceberparc.VlrParcCRe' +
        'ceber, Dbcreceberparc.DtVencCReceber, Dbcreceberparc.RestParcela' +
        ', Dbcreceberparc.DtVencimento2, Dbcreceberparc.Filial, Dbcrecebe' +
        'rparc.NumNota, Dbcreceberparc.DtGerado, Dbcreceberparc.CodConta,' +
        ' Dbcreceberparc.CodTipoCobranca'
      'FROM "dbCReceberParc.DB" Dbcreceberparc'
      '   INNER JOIN "dbCliente.DB" Dbcliente'
      '   ON  (Dbcreceberparc.CodCli = Dbcliente.Codigo)  '
      'WHERE  Dbcreceberparc.RestParcela > 0 ')
    Left = 520
    Top = 128
    object qCReceberCodCli: TIntegerField
      FieldName = 'CodCli'
      Origin = 'TABELAS."dbCReceberParc.DB".CodCli'
    end
    object qCReceberNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbCliente.DB".Nome'
      Size = 40
    end
    object qCReceberNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
      Origin = 'TABELAS."dbCReceberParc.DB".NumCReceber'
    end
    object qCReceberParcCReceber: TIntegerField
      FieldName = 'ParcCReceber'
      Origin = 'TABELAS."dbCReceberParc.DB".ParcCReceber'
    end
    object qCReceberVlrParcCReceber: TFloatField
      FieldName = 'VlrParcCReceber'
      Origin = 'TABELAS."dbCReceberParc.DB".VlrParcCReceber'
    end
    object qCReceberDtVencCReceber: TDateField
      FieldName = 'DtVencCReceber'
      Origin = 'TABELAS."dbCReceberParc.DB".DtVencCReceber'
    end
    object qCReceberRestParcela: TFloatField
      FieldName = 'RestParcela'
      Origin = 'TABELAS."dbCReceberParc.DB".RestParcela'
    end
    object qCReceberDtVencimento2: TDateField
      FieldName = 'DtVencimento2'
      Origin = 'TABELAS."dbCReceberParc.DB".DtVencimento2'
    end
    object qCReceberFilial: TIntegerField
      FieldName = 'Filial'
      Origin = 'TABELAS."dbCReceberParc.DB".Filial'
    end
    object qCReceberNumNota: TIntegerField
      FieldName = 'NumNota'
      Origin = 'TABELAS."dbCReceberParc.DB".NumNota'
    end
    object qCReceberDtGerado: TDateField
      FieldName = 'DtGerado'
      Origin = 'TABELAS."dbCReceberParc.DB".DtGerado'
    end
    object qCReceberCodConta: TIntegerField
      FieldName = 'CodConta'
      Origin = 'TABELAS."dbCReceberParc.DB".CodConta'
    end
    object qCReceberCodTipoCobranca: TIntegerField
      FieldName = 'CodTipoCobranca'
      Origin = 'TABELAS."dbCReceberParc.DB".CodTipoCobranca'
    end
  end
  object mFinanceiro: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Data'
        DataType = ftDate
      end
      item
        Name = 'DtVencimento'
        DataType = ftDate
      end
      item
        Name = 'Saldo'
        DataType = ftFloat
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Banco'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NomeTipoCobranca'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Filial'
        DataType = ftInteger
      end
      item
        Name = 'VlrCredito'
        DataType = ftFloat
      end
      item
        Name = 'VlrDebito'
        DataType = ftFloat
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NumNota'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Parcela'
        DataType = ftInteger
      end>
    IndexDefs = <>
    IndexFieldNames = 'Data;Nome'
    Params = <>
    StoreDefs = True
    OnNewRecord = mFinanceiroNewRecord
    Left = 624
    Top = 208
    Data = {
      1B0100009619E0BD01000000180000000C0000000000030000001B0104446174
      6104000600000000000C447456656E63696D656E746F04000600000000000553
      616C646F0800040000000000044E6F6D65010049000000010005574944544802
      00020028000542616E636F0100490000000100055749445448020002001E0010
      4E6F6D655469706F436F6272616E636101004900000001000557494454480200
      02001E000646696C69616C04000100000000000A566C724372656469746F0800
      04000000000009566C7244656269746F0800040000000000045469706F010049
      0000000100055749445448020002000A00074E756D4E6F746101004900000001
      00055749445448020002000F000750617263656C6104000100000000000000}
    object mFinanceiroData: TDateField
      FieldName = 'Data'
    end
    object mFinanceiroDtVencimento: TDateField
      FieldName = 'DtVencimento'
    end
    object mFinanceiroSaldo: TFloatField
      FieldName = 'Saldo'
      DisplayFormat = '###,###,##0.00'
    end
    object mFinanceiroNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object mFinanceiroBanco: TStringField
      FieldName = 'Banco'
      Size = 30
    end
    object mFinanceiroNomeTipoCobranca: TStringField
      FieldName = 'NomeTipoCobranca'
      Size = 30
    end
    object mFinanceiroFilial: TIntegerField
      FieldName = 'Filial'
    end
    object mFinanceiroVlrCredito: TFloatField
      FieldName = 'VlrCredito'
      DisplayFormat = '###,###,##0.00'
    end
    object mFinanceiroVlrDebito: TFloatField
      FieldName = 'VlrDebito'
      DisplayFormat = '###,###,##0.00'
    end
    object mFinanceiroTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object mFinanceiroNumNota: TStringField
      FieldName = 'NumNota'
      Size = 15
    end
    object mFinanceiroParcela: TIntegerField
      FieldName = 'Parcela'
    end
  end
  object dsmFinanceiro: TDataSource
    DataSet = mFinanceiro
    Left = 640
    Top = 208
  end
  object qCPagar: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbcpagarparc.CodForn, Dbfornecedores.NomeForn, Dbcpagarpa' +
        'rc.Filial, Dbcpagarparc.ParcCPagar, Dbcpagarparc.NumCPagar, Dbcp' +
        'agarparc.DtVencCPagar, Dbcpagarparc.VlrParcCPagar, Dbcpagarparc.' +
        'NroDuplicata, Dbcpagarparc.RestParcela, Dbcpagarparc.CodConta, D' +
        'bcpagarparc.DtGerado'
      'FROM "dbCPagarParc.DB" Dbcpagarparc'
      '   INNER JOIN "dbFornecedores.DB" Dbfornecedores'
      '   ON  (Dbcpagarparc.CodForn = Dbfornecedores.CodForn)  '
      'WHERE  Dbcpagarparc.RestParcela > 0 ')
    Left = 552
    Top = 128
    object qCPagarCodForn: TIntegerField
      FieldName = 'CodForn'
      Origin = 'TABELAS."dbCPagarParc.DB".CodForn'
    end
    object qCPagarNomeForn: TStringField
      FieldName = 'NomeForn'
      Origin = 'TABELAS."dbFornecedores.DB".NomeForn'
      Size = 40
    end
    object qCPagarFilial: TIntegerField
      FieldName = 'Filial'
      Origin = 'TABELAS."dbCPagarParc.DB".Filial'
    end
    object qCPagarParcCPagar: TIntegerField
      FieldName = 'ParcCPagar'
      Origin = 'TABELAS."dbCPagarParc.DB".ParcCPagar'
    end
    object qCPagarNumCPagar: TIntegerField
      FieldName = 'NumCPagar'
      Origin = 'TABELAS."dbCPagarParc.DB".NumCPagar'
    end
    object qCPagarDtVencCPagar: TDateField
      FieldName = 'DtVencCPagar'
      Origin = 'TABELAS."dbCPagarParc.DB".DtVencCPagar'
    end
    object qCPagarVlrParcCPagar: TFloatField
      FieldName = 'VlrParcCPagar'
      Origin = 'TABELAS."dbCPagarParc.DB".VlrParcCPagar'
    end
    object qCPagarRestParcela: TFloatField
      FieldName = 'RestParcela'
      Origin = 'TABELAS."dbCPagarParc.DB".RestParcela'
    end
    object qCPagarCodConta: TIntegerField
      FieldName = 'CodConta'
      Origin = 'TABELAS."dbCPagarParc.DB".CodConta'
    end
    object qCPagarDtGerado: TDateField
      FieldName = 'DtGerado'
      Origin = 'TABELAS."dbCPagarParc.DB".DtGerado'
    end
    object qCPagarNroDuplicata: TStringField
      FieldName = 'NroDuplicata'
      Origin = 'TABELAS."dbCPagarParc.DB".NroDuplicata'
      Size = 12
    end
  end
  object qCheque: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbcheque.CodConta, Dbcheque.NumCheque, Dbcheque.DtPrevist' +
        'a, Dbcheque.VlrTotal, Dbcheque.Nominal, Dbcontas.NomeConta, Dbco' +
        'ntas.Filial'
      'FROM "dbCheque.DB" Dbcheque'
      '   INNER JOIN "dbContas.DB" Dbcontas'
      '   ON  (Dbcheque.CodConta = Dbcontas.CodConta)  '
      'WHERE  Dbcheque.DtEntrada IS NULL ')
    Left = 584
    Top = 128
    object qChequeCodConta: TIntegerField
      FieldName = 'CodConta'
      Origin = 'TABELAS."dbCheque.DB".CodConta'
    end
    object qChequeNumCheque: TIntegerField
      FieldName = 'NumCheque'
      Origin = 'TABELAS."dbCheque.DB".NumCheque'
    end
    object qChequeDtPrevista: TDateField
      FieldName = 'DtPrevista'
      Origin = 'TABELAS."dbCheque.DB".DtPrevista'
    end
    object qChequeVlrTotal: TFloatField
      FieldName = 'VlrTotal'
      Origin = 'TABELAS."dbCheque.DB".VlrTotal'
    end
    object qChequeNominal: TStringField
      FieldName = 'Nominal'
      Origin = 'TABELAS."dbCheque.DB".Nominal'
      Size = 40
    end
    object qChequeNomeConta: TStringField
      FieldName = 'NomeConta'
      Origin = 'TABELAS."dbContas.DB".NomeConta'
      Size = 40
    end
    object qChequeFilial: TIntegerField
      FieldName = 'Filial'
      Origin = 'TABELAS."dbContas.DB".Filial'
    end
  end
end
