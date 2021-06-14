object fBuscaDuplicata: TfBuscaDuplicata
  Left = 18
  Top = 131
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Duplicatas'
  ClientHeight = 373
  ClientWidth = 772
  Color = 10930928
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
    Left = 4
    Top = 3
    Width = 765
    Height = 350
    DataSource = dsqDuplicatas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid1DblClick
    OnKeyDown = SMDBGrid1KeyDown
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
    ColCount = 9
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'NomeForn'
        Title.Alignment = taCenter
        Title.Caption = 'Fornecedor'
        Width = 243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Filial'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NroDuplicata'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Duplicata'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ParcCPagar'
        Title.Alignment = taCenter
        Title.Caption = 'Parcela'
        Width = 47
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtVencCPagar'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Vencimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrParcCPagar'
        Title.Alignment = taCenter
        Title.Caption = 'Valor Parcela'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RestParcela'
        Title.Alignment = taCenter
        Title.Caption = 'Valor Restante'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumCPagar'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' La'#231'to. C. Pagar'
        Width = 65
        Visible = True
      end>
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 356
    Width = 772
    Height = 17
    Align = alBottom
    BorderStyle = sbsSunken
    Caption = 'Duplo Clique para selecionar duplicata'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object qDuplicatas: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbcpagarparc.CodForn, Dbfornecedores.NomeForn, Dbcpagarpa' +
        'rc.Filial, Dbcpagarparc.NumCPagar, Dbcpagarparc.ParcCPagar, Dbcp' +
        'agarparc.DtVencCPagar, Dbcpagarparc.VlrParcCPagar, Dbcpagarparc.' +
        'RestParcela, Dbcpagarparc.PlanoContas, Dbcpagarparc.CodPlanoCont' +
        'asItens, Dbcpagarparc.NroDuplicata'
      'FROM "dbCPagarParc.DB" Dbcpagarparc'
      '   INNER JOIN "dbFornecedores.DB" Dbfornecedores'
      '   ON  (Dbcpagarparc.CodForn = Dbfornecedores.CodForn)  '
      'WHERE  Dbcpagarparc.RestParcela > 0 ')
    Left = 440
    Top = 72
    object qDuplicatasCodForn: TIntegerField
      FieldName = 'CodForn'
      Origin = 'TABELAS."dbCPagarParc.DB".CodForn'
    end
    object qDuplicatasNomeForn: TStringField
      FieldName = 'NomeForn'
      Origin = 'TABELAS."dbFornecedores.DB".NomeForn'
      Size = 40
    end
    object qDuplicatasFilial: TIntegerField
      FieldName = 'Filial'
      Origin = 'TABELAS."dbCPagarParc.DB".Filial'
    end
    object qDuplicatasNumCPagar: TIntegerField
      FieldName = 'NumCPagar'
      Origin = 'TABELAS."dbCPagarParc.DB".NumCPagar'
    end
    object qDuplicatasParcCPagar: TIntegerField
      FieldName = 'ParcCPagar'
      Origin = 'TABELAS."dbCPagarParc.DB".ParcCPagar'
    end
    object qDuplicatasDtVencCPagar: TDateField
      FieldName = 'DtVencCPagar'
      Origin = 'TABELAS."dbCPagarParc.DB".DtVencCPagar'
    end
    object qDuplicatasVlrParcCPagar: TFloatField
      FieldName = 'VlrParcCPagar'
      Origin = 'TABELAS."dbCPagarParc.DB".VlrParcCPagar'
    end
    object qDuplicatasRestParcela: TFloatField
      FieldName = 'RestParcela'
      Origin = 'TABELAS."dbCPagarParc.DB".RestParcela'
    end
    object qDuplicatasPlanoContas: TIntegerField
      FieldName = 'PlanoContas'
      Origin = 'TABELAS."dbCPagarParc.DB".PlanoContas'
    end
    object qDuplicatasCodPlanoContasItens: TIntegerField
      FieldName = 'CodPlanoContasItens'
      Origin = 'TABELAS."dbCPagarParc.DB".CodPlanoContasItens'
    end
    object qDuplicatasNroDuplicata: TIntegerField
      FieldName = 'NroDuplicata'
      Origin = 'TABELAS."dbCPagarParc.DB".NroDuplicata'
    end
  end
  object dsqDuplicatas: TDataSource
    DataSet = qDuplicatas
    Left = 464
    Top = 72
  end
end
