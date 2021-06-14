object fConsMovFinanceiro: TfConsMovFinanceiro
  Left = 134
  Top = 198
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta Movimento Financeiro'
  ClientHeight = 446
  ClientWidth = 782
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
    Width = 782
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 3
      Top = 32
      Width = 109
      Height = 13
      Caption = 'Dt. Lan'#231'amento Inicial:'
    end
    object Label1: TLabel
      Left = 217
      Top = 33
      Width = 25
      Height = 13
      Caption = 'Final:'
    end
    object Label3: TLabel
      Left = 10
      Top = 55
      Width = 102
      Height = 13
      Caption = 'Dt. Movimento Inicial:'
    end
    object Label4: TLabel
      Left = 217
      Top = 56
      Width = 25
      Height = 13
      Caption = 'Final:'
    end
    object Label5: TLabel
      Left = 81
      Top = 9
      Width = 31
      Height = 13
      Caption = 'Conta:'
    end
    object Label6: TLabel
      Left = 586
      Top = 11
      Width = 52
      Height = 13
      Caption = 'Vlr. D'#233'bito:'
    end
    object Label7: TLabel
      Left = 584
      Top = 33
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. Cr'#233'dito:'
    end
    object Label8: TLabel
      Left = 611
      Top = 55
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total:'
    end
    object DateEdit1: TDateEdit
      Left = 113
      Top = 24
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object DateEdit2: TDateEdit
      Left = 243
      Top = 25
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
    object DateEdit3: TDateEdit
      Left = 113
      Top = 47
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
    object DateEdit4: TDateEdit
      Left = 243
      Top = 48
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 4
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 113
      Top = 3
      Width = 230
      Height = 21
      DropDownCount = 8
      LookupField = 'CodConta'
      LookupDisplay = 'NomeConta'
      LookupSource = dsContas
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 344
      Top = 43
      Width = 86
      Height = 25
      Caption = 'Consultar'
      TabOrder = 5
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 430
      Top = 43
      Width = 86
      Height = 25
      Caption = 'Fechar'
      TabOrder = 6
      OnClick = BitBtn2Click
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 640
      Top = 3
      Width = 121
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clMoneyGreen
      DisplayFormat = '0.00'
      ReadOnly = True
      TabOrder = 7
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 640
      Top = 25
      Width = 121
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clMoneyGreen
      DisplayFormat = '0.00'
      ReadOnly = True
      TabOrder = 8
    end
    object CurrencyEdit3: TCurrencyEdit
      Left = 640
      Top = 47
      Width = 121
      Height = 21
      TabStop = False
      AutoSize = False
      Color = clMoneyGreen
      DisplayFormat = '0.00'
      ReadOnly = True
      TabOrder = 9
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 73
    Width = 782
    Height = 373
    Align = alClient
    DataSource = dsqConsulta
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
    ColCount = 12
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodConta'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Conta'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeConta'
        Title.Alignment = taCenter
        Title.Caption = 'Nome da Conta'
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtMovimento'
        Title.Alignment = taCenter
        Title.Caption = 'Data Movimento'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtUsuario'
        Title.Alignment = taCenter
        Title.Caption = 'Data Lan'#231'amento'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HrUsuario'
        Title.Alignment = taCenter
        Title.Caption = 'Hora Lan'#231'amento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrMovDebito'
        Title.Alignment = taCenter
        Title.Caption = 'Valor D'#233'bito'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrMovCredito'
        Title.Alignment = taCenter
        Title.Caption = 'Valor Cr'#233'dito'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Usuario'
        Title.Alignment = taCenter
        Title.Caption = 'Usu'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Historico'
        Title.Alignment = taCenter
        Title.Caption = 'Hist'#243'rico'
        Width = 350
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Filial'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumMovimento'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Movimento'
        Visible = True
      end>
  end
  object tContas: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbContas.DB'
    Left = 560
    Top = 200
    object tContasCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object tContasNomeConta: TStringField
      FieldName = 'NomeConta'
      Size = 40
    end
  end
  object dsContas: TDataSource
    DataSet = tContas
    Left = 584
    Top = 200
  end
  object qConsulta: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbmovimentos.CodConta, Dbmovimentos.NumMovimento, Dbmovim' +
        'entos.DtMovimento, Dbmovimentos.VlrMovDebito, Dbmovimentos.VlrMo' +
        'vCredito, Dbmovimentos.Historico, Dbmovimentos.Filial, Dbmovimen' +
        'tos.DtUsuario, Dbmovimentos.HrUsuario, Dbmovimentos.Usuario, Dbc' +
        'ontas.NomeConta'
      'FROM "DBMOVIMENTOS.DB" Dbmovimentos'
      '   INNER JOIN "dbContas.DB" Dbcontas'
      '   ON  (Dbmovimentos.CodConta = Dbcontas.CodConta)  '
      'WHERE 0 = 0')
    Left = 648
    Top = 232
    object qConsultaCodConta: TIntegerField
      FieldName = 'CodConta'
      Origin = 'TABELAS."dbMovimentos.DB".CodConta'
    end
    object qConsultaNomeConta: TStringField
      FieldName = 'NomeConta'
      Origin = 'TABELAS."dbContas.DB".NomeConta'
      Size = 40
    end
    object qConsultaNumMovimento: TIntegerField
      FieldName = 'NumMovimento'
      Origin = 'TABELAS."dbMovimentos.DB".NumMovimento'
    end
    object qConsultaDtMovimento: TDateField
      FieldName = 'DtMovimento'
      Origin = 'TABELAS."dbMovimentos.DB".DtMovimento'
    end
    object qConsultaVlrMovDebito: TFloatField
      FieldName = 'VlrMovDebito'
      Origin = 'TABELAS."dbMovimentos.DB".VlrMovDebito'
    end
    object qConsultaVlrMovCredito: TFloatField
      FieldName = 'VlrMovCredito'
      Origin = 'TABELAS."dbMovimentos.DB".VlrMovCredito'
    end
    object qConsultaHistorico: TStringField
      FieldName = 'Historico'
      Origin = 'TABELAS."dbMovimentos.DB".Historico'
      Size = 100
    end
    object qConsultaFilial: TIntegerField
      FieldName = 'Filial'
      Origin = 'TABELAS."dbMovimentos.DB".Filial'
    end
    object qConsultaDtUsuario: TDateField
      FieldName = 'DtUsuario'
      Origin = 'TABELAS."dbMovimentos.DB".DtUsuario'
    end
    object qConsultaHrUsuario: TTimeField
      FieldName = 'HrUsuario'
      Origin = 'TABELAS."dbMovimentos.DB".HrUsuario'
    end
    object qConsultaUsuario: TStringField
      FieldName = 'Usuario'
      Origin = 'TABELAS."dbMovimentos.DB".Usuario'
      Size = 15
    end
  end
  object dsqConsulta: TDataSource
    DataSet = qConsulta
    Left = 672
    Top = 232
  end
end
