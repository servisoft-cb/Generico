object fConsFornecAtiv: TfConsFornecAtiv
  Left = 57
  Top = 226
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de Fornecedores p/ Atividade'
  ClientHeight = 418
  ClientWidth = 786
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
    Width = 786
    Height = 418
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 6
      Top = 7
      Width = 774
      Height = 56
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 70
        Top = 26
        Width = 47
        Height = 13
        Caption = 'Atividade:'
      end
      object SpeedButton1: TSpeedButton
        Left = 477
        Top = 16
        Width = 99
        Height = 25
        Hint = 'Desativa a consulta'
        Caption = 'Desativa Cons.'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
          993337777F777F3377F3393999707333993337F77737333337FF993399933333
          399377F3777FF333377F993339903333399377F33737FF33377F993333707333
          399377F333377FF3377F993333101933399377F333777FFF377F993333000993
          399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
          99333773FF777F777733339993707339933333773FF7FFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 120
        Top = 18
        Width = 253
        Height = 21
        DropDownCount = 8
        LookupField = 'Codigo'
        LookupDisplay = 'Nome'
        LookupSource = DM1.dsAtividade
        TabOrder = 0
        OnChange = RxDBLookupCombo1Enter
        OnCloseUp = RxDBLookupCombo1Exit
        OnDropDown = RxDBLookupCombo1Enter
        OnEnter = RxDBLookupCombo1Enter
        OnExit = RxDBLookupCombo1Exit
      end
      object BitBtn1: TBitBtn
        Left = 377
        Top = 16
        Width = 99
        Height = 25
        Hint = 'Executa a consulta p/ atividade selecionada ao lado'
        Caption = '&Consultar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn1Click
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777000000070000000007777777000000070FFFFFFF07777700000000070F7
          7777F07777000000000070F77777F07770007000000070F77780008700077000
          000070F7700FFF0000777000000070F708FFFF0807777000000070F80E000F07
          08777000000070F0EFEFEF0770777000000070F0F0000F077077700000007000
          EFEFFF0770777000000077780000000708777000000077770077777807777000
          0000777770077700777770000000777777800087777770000000777777777777
          777770000000}
      end
      object Panel3: TPanel
        Left = 602
        Top = 7
        Width = 168
        Height = 41
        TabOrder = 2
        object BitBtn2: TBitBtn
          Left = 33
          Top = 8
          Width = 112
          Height = 25
          Hint = 'Fecha a janela atual'
          Caption = '&Fechar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BitBtn2Click
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
      end
    end
    object RxDBGrid1: TRxDBGrid
      Left = 6
      Top = 70
      Width = 772
      Height = 339
      DataSource = dsQuery1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NomeForn'
          Title.Alignment = taCenter
          Title.Caption = 'Fornecedor'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Tel1Forn'
          Title.Alignment = taCenter
          Title.Caption = 'Fone'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FaxForn'
          Title.Alignment = taCenter
          Title.Caption = 'Fax'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ContatoForn'
          Title.Alignment = taCenter
          Title.Caption = 'Contato'
          Width = 187
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EndForn'
          Title.Alignment = taCenter
          Title.Caption = 'Endere'#231'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BairroForn'
          Title.Alignment = taCenter
          Title.Caption = 'Bairro'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome'
          Title.Alignment = taCenter
          Title.Caption = 'Cidade'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EstadoForn'
          Title.Alignment = taCenter
          Title.Caption = 'UF'
          Visible = True
        end>
    end
  end
  object Query1: TQuery
    Active = True
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbfornecedores.NomeForn, Dbfornecedores.EndForn, Dbfornec' +
        'edores.BairroForn, Dbfornecedores.CidadeForn, Dbfornecedores.Est' +
        'adoForn, Dbfornecedores.Tel1Forn, Dbfornecedores.FaxForn, Dbforn' +
        'ecedores.ContatoForn, Dbfornecativ.CodAtiv, Dbcidade.Nome'
      'FROM "dbFornecedores.DB" Dbfornecedores'
      '   INNER JOIN "dbFornecAtiv.db" Dbfornecativ'
      '   ON  (Dbfornecedores.CodForn = Dbfornecativ.CodForn)  '
      '   INNER JOIN "dbCidade.db" Dbcidade'
      '   ON  (Dbfornecedores.CodCidade = Dbcidade.Codigo)  '
      'ORDER BY Dbfornecedores.NomeForn')
    Left = 160
    Top = 176
    object Query1NomeForn: TStringField
      FieldName = 'NomeForn'
      Origin = 'TABELAS."dbFornecedores.DB".NomeForn'
      Size = 40
    end
    object Query1EndForn: TStringField
      FieldName = 'EndForn'
      Origin = 'TABELAS."dbFornecedores.DB".EndForn'
      Size = 40
    end
    object Query1BairroForn: TStringField
      FieldName = 'BairroForn'
      Origin = 'TABELAS."dbFornecedores.DB".BairroForn'
      Size = 30
    end
    object Query1CidadeForn: TStringField
      FieldName = 'CidadeForn'
      Origin = 'TABELAS."dbFornecedores.DB".CidadeForn'
      Size = 40
    end
    object Query1EstadoForn: TStringField
      FieldName = 'EstadoForn'
      Origin = 'TABELAS."dbFornecedores.DB".EstadoForn'
      Size = 2
    end
    object Query1Tel1Forn: TStringField
      FieldName = 'Tel1Forn'
      Origin = 'TABELAS."dbFornecedores.DB".Tel1Forn'
      Size = 15
    end
    object Query1FaxForn: TStringField
      FieldName = 'FaxForn'
      Origin = 'TABELAS."dbFornecedores.DB".FaxForn'
      Size = 15
    end
    object Query1ContatoForn: TStringField
      FieldName = 'ContatoForn'
      Origin = 'TABELAS."dbFornecedores.DB".ContatoForn'
      Size = 40
    end
    object Query1CodAtiv: TIntegerField
      FieldName = 'CodAtiv'
      Origin = 'TABELAS."dbFornecAtiv.DB".CodAtiv'
    end
    object Query1Nome: TStringField
      FieldName = 'Nome'
      Size = 26
    end
  end
  object dsQuery1: TDataSource
    DataSet = Query1
    Left = 192
    Top = 176
  end
end
