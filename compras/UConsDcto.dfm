object fConsDcto: TfConsDcto
  Left = 12
  Top = 65
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Dcto. de Entrada e Sa'#237'da do Estoque'
  ClientHeight = 459
  ClientWidth = 747
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
    Width = 747
    Height = 459
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 3
      Top = 3
      Width = 315
      Height = 166
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 3
        Top = 44
        Width = 44
        Height = 13
        Caption = 'N'#186' Dcto.:'
      end
      object Label2: TLabel
        Left = 18
        Top = 99
        Width = 26
        Height = 13
        Caption = 'Data:'
      end
      object Label3: TLabel
        Left = 8
        Top = 73
        Width = 39
        Height = 13
        Caption = 'Usu'#225'rio:'
      end
      object Label4: TLabel
        Left = 24
        Top = 16
        Width = 23
        Height = 13
        Caption = 'Filial:'
        OnClick = BitBtn1Click
      end
      object Edit1: TEdit
        Left = 50
        Top = 36
        Width = 109
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = Edit1Change
        OnEnter = Edit1Enter
      end
      object DateEdit1: TDateEdit
        Left = 50
        Top = 91
        Width = 95
        Height = 21
        NumGlyphs = 2
        TabOrder = 2
        OnChange = DateEdit1Change
        OnEnter = DateEdit1Enter
      end
      object Edit2: TEdit
        Left = 50
        Top = 65
        Width = 173
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 20
        TabOrder = 1
        OnChange = Edit2Change
        OnEnter = Edit2Enter
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 50
        Top = 8
        Width = 255
        Height = 21
        DropDownCount = 8
        DropDownWidth = 600
        LookupField = 'Codigo'
        LookupDisplay = 'NomeInterno;Empresa'
        LookupSource = DM1.dsFilial
        TabOrder = 3
        OnChange = RxDBLookupCombo1Change
      end
    end
    object RxDBGrid1: TRxDBGrid
      Left = 320
      Top = 2
      Width = 423
      Height = 255
      DataSource = qsDctoEst
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = RxDBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NumDcto'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Dcto.'
          Width = 51
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Data'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Usuario'
          Title.Alignment = taCenter
          Title.Caption = 'Usu'#225'rio'
          Width = 167
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Tipo'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Total'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Total'
          Width = 76
          Visible = True
        end>
    end
    object BitBtn1: TBitBtn
      Left = 232
      Top = 170
      Width = 85
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
      TabOrder = 2
      OnClick = BitBtn1Click
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
    object RxDBGrid2: TRxDBGrid
      Left = 3
      Top = 259
      Width = 740
      Height = 197
      DataSource = dsDctoEstItem
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Item'
          Title.Alignment = taCenter
          Width = 29
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CodMaterial'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 48
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'lkReferencia'
          Title.Alignment = taCenter
          Title.Caption = 'Refer'#234'ncia'
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lkNomeProduto'
          Title.Alignment = taCenter
          Title.Caption = 'Nome do Produto'
          Width = 258
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Unidade'
          Title.Alignment = taCenter
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
          FieldName = 'VlrTotal'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr.Total'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lkNomeCor'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Cor'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumMovEst'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Mov.Estoque'
          Visible = True
        end>
    end
  end
  object qDctoEst: TQuery
    AfterOpen = qDctoEstAfterOpen
    BeforeClose = qDctoEstBeforeClose
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Filial, NumDcto, Data, Usuario, Tipo, Total'
      'FROM "dbDctoEst.DB" Dbdctoest'
      'WHERE Filial = :Filial'
      'ORDER BY NumDcto')
    Left = 216
    Top = 203
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Filial'
        ParamType = ptUnknown
      end>
    object qDctoEstFilial: TIntegerField
      FieldName = 'Filial'
      Origin = 'TABELAS."dbDctoEst.DB".Filial'
    end
    object qDctoEstNumDcto: TIntegerField
      FieldName = 'NumDcto'
      Origin = 'TABELAS."dbDctoEst.DB".NumDcto'
    end
    object qDctoEstData: TDateField
      FieldName = 'Data'
      Origin = 'TABELAS."dbDctoEst.DB".Data'
    end
    object qDctoEstUsuario: TStringField
      FieldName = 'Usuario'
      Origin = 'TABELAS."dbDctoEst.DB".Usuario'
    end
    object qDctoEstTipo: TStringField
      FieldName = 'Tipo'
      Origin = 'TABELAS."dbDctoEst.DB".Tipo'
      Size = 1
    end
    object qDctoEstTotal: TFloatField
      FieldName = 'Total'
      Origin = 'TABELAS."dbDctoEst.DB".Total'
      DisplayFormat = '0.00'
    end
  end
  object qsDctoEst: TDataSource
    DataSet = qDctoEst
    Left = 235
    Top = 203
  end
  object tDctoEstItem: TTable
    Active = True
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Filial;NumDcto;Item'
    MasterFields = 'Filial;NumDcto'
    MasterSource = qsDctoEst
    TableName = 'dbDctoEstItem.DB'
    Left = 144
    Top = 168
    object tDctoEstItemFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tDctoEstItemNumDcto: TIntegerField
      FieldName = 'NumDcto'
    end
    object tDctoEstItemItem: TIntegerField
      FieldName = 'Item'
    end
    object tDctoEstItemCodMaterial: TIntegerField
      FieldName = 'CodMaterial'
    end
    object tDctoEstItemCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object tDctoEstItemCodGrade: TIntegerField
      FieldName = 'CodGrade'
    end
    object tDctoEstItemUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
    object tDctoEstItemQtd: TFloatField
      FieldName = 'Qtd'
    end
    object tDctoEstItemVlrUnit: TFloatField
      FieldName = 'VlrUnit'
    end
    object tDctoEstItemVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
    object tDctoEstItemNumMovEst: TIntegerField
      FieldName = 'NumMovEst'
    end
    object tDctoEstItemlkReferencia: TStringField
      FieldKind = fkLookup
      FieldName = 'lkReferencia'
      LookupDataSet = DM1.tProduto
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Referencia'
      KeyFields = 'CodMaterial'
      Size = 22
      Lookup = True
    end
    object tDctoEstItemlkNomeProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeProduto'
      LookupDataSet = DM1.tProduto
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodMaterial'
      Size = 40
      Lookup = True
    end
    object tDctoEstItemlkNomeCor: TStringField
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
  object dsDctoEstItem: TDataSource
    DataSet = tDctoEstItem
    Left = 160
    Top = 168
  end
end
