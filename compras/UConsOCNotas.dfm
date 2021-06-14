object fConsOCNotas: TfConsOCNotas
  Left = 11
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Notas'
  ClientHeight = 403
  ClientWidth = 759
  Color = 10545150
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
  object RxLabel1: TRxLabel
    Left = 8
    Top = 11
    Width = 42
    Height = 13
    Caption = 'N'#186' OC:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RxLabel2: TRxLabel
    Left = 176
    Top = 11
    Width = 71
    Height = 13
    Caption = 'Fornecedor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 30
    Width = 759
    Height = 2
    Shape = bsTopLine
    Style = bsRaised
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 50
    Top = 3
    Width = 103
    Height = 21
    AutoSize = False
    Color = clAqua
    DecimalPlaces = 0
    DisplayFormat = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 248
    Top = 3
    Width = 345
    Height = 21
    CharCase = ecUpperCase
    Color = clAqua
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object RxDBGrid1: TRxDBGrid
    Left = 1
    Top = 36
    Width = 755
    Height = 364
    DataSource = dsqNotas
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumNEntr'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' da Nota'
        Width = 59
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Item'
        Title.Alignment = taCenter
        Title.Caption = 'It.Nota'
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ItemOC'
        Title.Alignment = taCenter
        Title.Caption = 'Item OC'
        Width = 56
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Referencia'
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Alignment = taCenter
        Title.Caption = 'Nome do Produto'
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
        FieldName = 'lkNomeCor'
        Title.Alignment = taCenter
        Title.Caption = 'Nome da Cor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd'
        Title.Alignment = taCenter
        Title.Caption = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrUnit'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr.Unit'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrTotalItens'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr.Total'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodCor'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd.Cor'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodForn'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd.Fornecedor'
        Visible = True
      end>
  end
  object BitBtn6: TBitBtn
    Left = 664
    Top = 2
    Width = 90
    Height = 25
    Hint = 'Fecha a janela atual'
    Caption = '&Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BitBtn6Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000CE0E0000D80E00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0038383838380E
      038383838383830E603800000000380E660033333330830E660333333330000E
      660333330030330E660333330E00330E660300000EE0330E06030EEEEEE6030E
      660300000E60330E660333330600330E660333330030330E6603333333303330
      E6033333333033330E0333333330000000033333333333333333}
  end
  object qNotas: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbnentradaitens.Filial, Dbnentradaitens.CodForn, Dbnentra' +
        'daitens.NumNEntr, Dbnentradaitens.CodMaterial, Dbproduto.Nome, D' +
        'bproduto.Referencia, Dbnentradaitens.Item, Dbnentradaitens.NumOC' +
        ', Dbnentradaitens.ItemOC, Dbnentradaitens.Qtd, Dbnentradaitens.V' +
        'lrUnit, Dbnentradaitens.VlrTotalItens, Dbnentradaitens.Tamanho, ' +
        'Dbnentradaitens.CodCor'
      'FROM "dbNEntradaItens.DB" Dbnentradaitens'
      '   INNER JOIN "dbProduto.DB" Dbproduto'
      '   ON  (Dbnentradaitens.CodMaterial = Dbproduto.Codigo)'
      'Where Dbnentradaitens.Filial = :Filial and'
      '            Dbnentradaitens.NumOC = :NumOC'
      
        'Order By Dbnentradaitens.NumOC, Dbnentradaitens.ItemOC, Dbnentra' +
        'daitens.NumNEntr'
      '')
    Left = 424
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NumOC'
        ParamType = ptUnknown
      end>
    object qNotasFilial: TIntegerField
      FieldName = 'Filial'
      Origin = 'TABELAS."dbNEntradaItens.DB".Filial'
    end
    object qNotasCodForn: TIntegerField
      FieldName = 'CodForn'
      Origin = 'TABELAS."dbNEntradaItens.DB".CodForn'
    end
    object qNotasNumNEntr: TIntegerField
      FieldName = 'NumNEntr'
      Origin = 'TABELAS."dbNEntradaItens.DB".NumNEntr'
    end
    object qNotasCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
      Origin = 'TABELAS."dbNEntradaItens.DB".CodMaterial'
    end
    object qNotasNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbProduto.DB".Nome'
      Size = 40
    end
    object qNotasReferencia: TStringField
      FieldName = 'Referencia'
      Origin = 'TABELAS."dbProduto.DB".Referencia'
    end
    object qNotasItem: TSmallintField
      FieldName = 'Item'
      Origin = 'TABELAS."dbNEntradaItens.DB".Item'
    end
    object qNotasNumOC: TIntegerField
      FieldName = 'NumOC'
      Origin = 'TABELAS."dbNEntradaItens.DB".NumOC'
    end
    object qNotasItemOC: TIntegerField
      FieldName = 'ItemOC'
      Origin = 'TABELAS."dbNEntradaItens.DB".ItemOC'
    end
    object qNotasQtd: TFloatField
      FieldName = 'Qtd'
      Origin = 'TABELAS."dbNEntradaItens.DB".Qtd'
    end
    object qNotasVlrUnit: TFloatField
      FieldName = 'VlrUnit'
      Origin = 'TABELAS."dbNEntradaItens.DB".VlrUnit'
    end
    object qNotasVlrTotalItens: TFloatField
      FieldName = 'VlrTotalItens'
      Origin = 'TABELAS."dbNEntradaItens.DB".VlrTotalItens'
    end
    object qNotasTamanho: TStringField
      FieldName = 'Tamanho'
      Origin = 'TABELAS."dbNEntradaItens.DB".Tamanho'
      Size = 6
    end
    object qNotasCodCor: TIntegerField
      FieldName = 'CodCor'
      Origin = 'TABELAS."dbNEntradaItens.DB".CodCor'
    end
    object qNotaslkNomeCor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCor'
      LookupDataSet = DM1.tCor
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCor'
      Size = 25
      Lookup = True
    end
  end
  object dsqNotas: TDataSource
    DataSet = qNotas
    Left = 448
    Top = 88
  end
end
