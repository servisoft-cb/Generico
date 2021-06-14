object fNFeInutilizacao: TfNFeInutilizacao
  Left = 153
  Top = 95
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Inutilizar Nota'
  ClientHeight = 556
  ClientWidth = 782
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 112
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 193
      Top = 36
      Width = 71
      Height = 13
      Caption = 'N'#186' Nota Inicial:'
    end
    object Label2: TLabel
      Left = 365
      Top = 34
      Width = 66
      Height = 13
      Caption = 'N'#186' Nota Final:'
    end
    object Label3: TLabel
      Left = 4
      Top = 60
      Width = 99
      Height = 13
      Alignment = taRightJustify
      Caption = 'Motivo (Justificativa):'
    end
    object Label4: TLabel
      Left = 80
      Top = 12
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Filial:'
    end
    object Label5: TLabel
      Left = 76
      Top = 36
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'S'#233'rie:'
    end
    object Label6: TLabel
      Left = 409
      Top = 12
      Width = 22
      Height = 13
      Caption = 'Ano:'
    end
    object ceNotaIni: TCurrencyEdit
      Left = 266
      Top = 28
      Width = 87
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 3
    end
    object ceNotaFin: TCurrencyEdit
      Left = 434
      Top = 26
      Width = 87
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 4
    end
    object edMotivo: TEdit
      Left = 106
      Top = 52
      Width = 665
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 200
      TabOrder = 5
    end
    object btConfirmar: TBitBtn
      Left = 127
      Top = 83
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 6
      OnClick = btConfirmarClick
    end
    object btAlterar: TBitBtn
      Left = 202
      Top = 83
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 7
      OnClick = btAlterarClick
    end
    object btExcluir: TBitBtn
      Left = 277
      Top = 83
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 10
      OnClick = btExcluirClick
    end
    object btCancelar: TBitBtn
      Left = 352
      Top = 83
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 8
      OnClick = btCancelarClick
    end
    object btFechar: TBitBtn
      Left = 427
      Top = 83
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 9
      OnClick = btFecharClick
    end
    object RxDBFilial: TRxDBLookupCombo
      Left = 106
      Top = 4
      Width = 247
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'NomeInterno'
      LookupSource = dsFilial2
      TabOrder = 0
    end
    object edSerie: TEdit
      Left = 106
      Top = 28
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 3
      TabOrder = 2
    end
    object ceAno: TCurrencyEdit
      Left = 434
      Top = 4
      Width = 87
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 1
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 112
    Width = 782
    Height = 427
    Align = alClient
    DataSource = DMNFe.dsNFeInutilizacao
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 9
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumMov'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Mov'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NumProtocolo'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Protocolo'
        Width = 166
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumNotaIni'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Nota Inicial'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumNotaFin'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Nota Final'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Data'
        Title.Alignment = taCenter
        Title.Caption = 'Data Mov'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Hora'
        Title.Alignment = taCenter
        Title.Caption = 'Hora Mov'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Motivo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Usuario'
        Title.Alignment = taCenter
        Title.Caption = 'Usu'#225'rio'
        Visible = True
      end>
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 539
    Width = 782
    Height = 17
    Align = alBottom
    BorderStyle = sbsSunken
    Caption = 'Duplo clique para inutilizar a nota'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object tFilial2: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'dbFilial.DB'
    Left = 400
    Top = 64
    object tFilial2Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tFilial2Empresa: TStringField
      FieldName = 'Empresa'
      Size = 60
    end
    object tFilial2NomeInterno: TStringField
      FieldName = 'NomeInterno'
      Size = 200
    end
  end
  object dsFilial2: TDataSource
    DataSet = tFilial2
    Left = 424
    Top = 64
  end
  object tNotaFiscal2: TTable
    Active = True
    DatabaseName = 'Tabelas'
    TableName = 'DBNOTAFISCAL.DB'
    Left = 536
    Top = 88
    object tNotaFiscal2Filial: TIntegerField
      FieldName = 'Filial'
    end
    object tNotaFiscal2NumSeq: TIntegerField
      FieldName = 'NumSeq'
    end
    object tNotaFiscal2DtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object tNotaFiscal2NumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object tNotaFiscal2NFeRecibo: TStringField
      FieldName = 'NFeRecibo'
    end
    object tNotaFiscal2NFeProtocolo: TStringField
      FieldName = 'NFeProtocolo'
      Size = 45
    end
    object tNotaFiscal2NFeChaveAcesso: TStringField
      FieldName = 'NFeChaveAcesso'
      Size = 44
    end
    object tNotaFiscal2NFeProtocoloCancelada: TStringField
      FieldName = 'NFeProtocoloCancelada'
      Size = 45
    end
    object tNotaFiscal2Serie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
  end
  object qUltNota: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT MAX( NumNota ) NumNota'
      'FROM "DBNOTAFISCAL.DB" Dbnotafiscal'
      'WHERE   (Filial = :Filial)  '
      '   AND  (Serie = :Serie)  '
      '')
    Left = 424
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Serie'
        ParamType = ptUnknown
      end>
    object qUltNotaNumNota: TIntegerField
      FieldName = 'NumNota'
      Origin = 'TABELAS."DBNOTAFISCAL.DB".NumNota'
    end
  end
  object qProximoMov: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT MAX( NumMov ) NumMov'
      'FROM "dbNFeInutilizacao.DB" Dbnfeinutilizacao'
      'WHERE  Filial = :Filial')
    Left = 248
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Filial'
        ParamType = ptUnknown
      end>
    object qProximoMovNumMov: TIntegerField
      FieldName = 'NumMov'
      Origin = 'TABELAS."dbNFeInutilizacao.DB".NumMov'
    end
  end
end
