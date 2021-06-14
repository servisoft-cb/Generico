object fConsPlanoContasCad: TfConsPlanoContasCad
  Left = 119
  Top = 173
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fConsPlanoContasCad'
  ClientHeight = 446
  ClientWidth = 812
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
    Width = 812
    Height = 37
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 660
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888800000000000888808888888880808800000000000008080888888BBB88
        0008088888877788080800000000000008800888888888808080800000000008
        0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
        088888880FFFFFFFF08888888000000000888888888888888888}
    end
    object BitBtn2: TBitBtn
      Left = 735
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 37
    Width = 812
    Height = 409
    Align = alClient
    DataSource = dsmConsulta
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
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodPlano'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Plano'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomePlano'
        Title.Alignment = taCenter
        Title.Caption = 'Nome da Conta'
        Width = 299
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodSubConta'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Item'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeSubConta'
        Title.Alignment = taCenter
        Title.Caption = 'Nome da SubConta'
        Width = 301
        Visible = True
      end>
  end
  object mConsulta: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'NomePlano;NomeSubConta'
    Params = <>
    Left = 456
    Top = 136
    Data = {
      7E0000009619E0BD0100000018000000040000000000030000007E0008436F64
      506C616E6F0400010000000000094E6F6D65506C616E6F010049000000010005
      57494454480200020028000B436F64537562436F6E746104000100000000000C
      4E6F6D65537562436F6E74610100490000000100055749445448020002002800
      0000}
    object mConsultaCodPlano: TIntegerField
      FieldName = 'CodPlano'
    end
    object mConsultaNomePlano: TStringField
      FieldName = 'NomePlano'
      Size = 40
    end
    object mConsultaCodSubConta: TIntegerField
      FieldName = 'CodSubConta'
    end
    object mConsultaNomeSubConta: TStringField
      FieldName = 'NomeSubConta'
      Size = 40
    end
  end
  object dsmConsulta: TDataSource
    DataSet = mConsulta
    Left = 488
    Top = 136
  end
  object tPlanoContas: TTable
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Codigo'
    TableName = 'dbPlanoContas.DB'
    Left = 464
    Top = 248
    object tPlanoContasCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tPlanoContasDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object tPlanoContasItens: TTable
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'CodPlano;CodItem'
    MasterFields = 'Codigo'
    MasterSource = dsPlanoContas
    TableName = 'dbPlanoContasItens.db'
    Left = 544
    Top = 248
    object tPlanoContasItensCodPlano: TIntegerField
      FieldName = 'CodPlano'
    end
    object tPlanoContasItensCodItem: TIntegerField
      FieldName = 'CodItem'
    end
    object tPlanoContasItensNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
  end
  object dsPlanoContas: TDataSource
    DataSet = tPlanoContas
    Left = 488
    Top = 248
  end
end
