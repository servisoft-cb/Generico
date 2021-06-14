object fConsCBarra: TfConsCBarra
  Left = 160
  Top = 172
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta C'#243'digo de Barras'
  ClientHeight = 446
  ClientWidth = 688
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
    Width = 688
    Height = 41
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Consultar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 83
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 158
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excel'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 233
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 3
      OnClick = BitBtn4Click
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 41
    Width = 688
    Height = 405
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
    ColCount = 8
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodBarra'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Barra'
        Width = 102
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'codproduto'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Produto'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Tamanho'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Produto'
        Width = 250
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
        Expanded = False
        FieldName = 'NomeCliente'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Marca'
        Width = 250
        Visible = True
      end>
  end
  object qConsulta: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT cb.CodBarra, cb.CodProduto, cb.CodCor, cb.Tamanho, P.REFE' +
        'RENCIA, P.NOME, COR.NOME NomeCor, P.CodRepresentada, Cli.Nome No' +
        'meCliente'
      'from dbCBarra.db cb'
      'left join "dbcor" cor'
      '  on cb.codcor = cor.codigo'
      'inner join "dbProduto.db" p'
      '  on cb.codproduto = p.codigo'
      'left join "dbCliente.db" CLI'
      '  on p.CodRepresentada = Cli.Codigo'
      ' ')
    Left = 536
    Top = 80
    object qConsultaCodBarra: TStringField
      FieldName = 'CodBarra'
      Size = 14
    end
    object qConsultacodproduto: TIntegerField
      FieldName = 'codproduto'
    end
    object qConsultacodcor: TIntegerField
      FieldName = 'codcor'
    end
    object qConsultaTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object qConsultaREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object qConsultaNOME: TStringField
      FieldName = 'NOME'
      Size = 65
    end
    object qConsultaNomeCor: TStringField
      FieldName = 'NomeCor'
      Size = 25
    end
    object qConsultaCodRepresentada: TIntegerField
      FieldName = 'CodRepresentada'
    end
    object qConsultaNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 60
    end
  end
  object dsqConsulta: TDataSource
    DataSet = qConsulta
    Left = 560
    Top = 80
  end
end
