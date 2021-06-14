object fConsLancCReceber: TfConsLancCReceber
  Left = 113
  Top = 66
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Lan'#231'amentos de Ctas. a Receber'
  ClientHeight = 479
  ClientWidth = 558
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
    Width = 558
    Height = 479
    Align = alClient
    TabOrder = 0
    object ALed1: TALed
      Left = 7
      Top = 459
      Width = 16
      Height = 16
      FalseColor = clWhite
    end
    object Label8: TLabel
      Left = 27
      Top = 461
      Width = 76
      Height = 13
      Caption = 'Conta pendente'
    end
    object ALed2: TALed
      Left = 131
      Top = 459
      Width = 16
      Height = 16
      FalseColor = 8421440
    end
    object Label9: TLabel
      Left = 151
      Top = 461
      Width = 66
      Height = 13
      Caption = 'Conta quitada'
    end
    object Panel2: TPanel
      Left = 4
      Top = 5
      Width = 550
      Height = 86
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 50
        Top = 37
        Width = 35
        Height = 13
        Caption = 'Cliente:'
      end
      object Label2: TLabel
        Left = 8
        Top = 68
        Width = 77
        Height = 13
        Caption = 'N'#186' Lan'#231'amento:'
      end
      object Label3: TLabel
        Left = 202
        Top = 68
        Width = 41
        Height = 13
        Caption = 'N'#186' Dcto:'
      end
      object Label4: TLabel
        Left = 356
        Top = 68
        Width = 87
        Height = 13
        Caption = 'Dt. do Movimento:'
      end
      object Label5: TLabel
        Left = 62
        Top = 13
        Width = 23
        Height = 13
        Caption = 'Filial:'
        OnClick = BitBtn1Click
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 88
        Top = 29
        Width = 304
        Height = 21
        DropDownCount = 8
        LookupField = 'Codigo'
        LookupDisplay = 'Nome'
        LookupSource = DM1.dsCliente
        TabOrder = 1
        OnChange = RxDBLookupCombo1Change
        OnEnter = RxDBLookupCombo1Enter
      end
      object Edit1: TEdit
        Left = 88
        Top = 60
        Width = 82
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
        OnChange = Edit1Change
        OnEnter = Edit1Enter
      end
      object Edit2: TEdit
        Left = 245
        Top = 60
        Width = 82
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 3
        OnChange = Edit2Change
        OnEnter = Edit2Enter
      end
      object DateEdit1: TDateEdit
        Left = 446
        Top = 60
        Width = 95
        Height = 21
        NumGlyphs = 2
        TabOrder = 4
        OnChange = DateEdit1Change
        OnEnter = DateEdit1Enter
      end
      object BitBtn1: TBitBtn
        Left = 446
        Top = 4
        Width = 95
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
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
      object RxDBLookupCombo2: TRxDBLookupCombo
        Left = 88
        Top = 5
        Width = 304
        Height = 21
        DropDownCount = 8
        DropDownWidth = 600
        LookupField = 'Codigo'
        LookupDisplay = 'NomeInterno;Empresa'
        LookupSource = DM1.dsFilial
        TabOrder = 0
        OnChange = RxDBLookupCombo2Change
        OnExit = RxDBLookupCombo2Exit
      end
    end
    object RxDBGrid1: TRxDBGrid
      Left = 4
      Top = 105
      Width = 550
      Height = 357
      DataSource = qsReceber
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnGetCellParams = RxDBGrid1GetCellParams
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumCReceber'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Lan'#231'.'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtGerado'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Movto.'
          Width = 86
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumNota'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Dcto.'
          Width = 66
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TipoDoc'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo Dcto.'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lkNomeCli'
          Title.Alignment = taCenter
          Title.Caption = 'Nome do Fornecedor'
          Visible = True
        end>
    end
  end
  object qCReceber: TQuery
    Active = True
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Filial, NumCReceber, NumNota, Quitado, CodCli, TipoDoc, D' +
        'tGerado'
      'FROM "dbCReceber.DB" Dbcreceber'
      'ORDER BY NumCReceber')
    Left = 184
    Top = 184
    object qCReceberNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
      Origin = 'TABELAS."dbCReceber.DB".NumCReceber'
    end
    object qCReceberNumNota: TIntegerField
      FieldName = 'NumNota'
      Origin = 'TABELAS."dbCReceber.DB".NumNota'
    end
    object qCReceberQuitado: TBooleanField
      FieldName = 'Quitado'
      Origin = 'TABELAS."dbCReceber.DB".Quitado'
    end
    object qCReceberCodCli: TIntegerField
      FieldName = 'CodCli'
      Origin = 'TABELAS."dbCReceber.DB".CodCli'
    end
    object qCReceberTipoDoc: TStringField
      FieldName = 'TipoDoc'
      Origin = 'TABELAS."dbCReceber.DB".TipoDoc'
      Size = 2
    end
    object qCReceberDtGerado: TDateField
      FieldName = 'DtGerado'
      Origin = 'TABELAS."dbCReceber.DB".DtGerado'
    end
    object qCReceberlkNomeCli: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCli'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCli'
      Size = 40
      Lookup = True
    end
    object qCReceberFilial: TIntegerField
      FieldName = 'Filial'
      Origin = 'TABELAS."dbCReceber.DB".Filial'
    end
  end
  object qsReceber: TDataSource
    DataSet = qCReceber
    Left = 194
    Top = 184
  end
end
