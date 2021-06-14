object fGeraSintegra: TfGeraSintegra
  Left = 228
  Top = 175
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gera o Sintegra'
  ClientHeight = 175
  ClientWidth = 407
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
  object Label1: TLabel
    Left = 48
    Top = 36
    Width = 56
    Height = 13
    Caption = 'Data Inicial:'
  end
  object Label2: TLabel
    Left = 53
    Top = 60
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data Final:'
  end
  object Label5: TLabel
    Left = 1
    Top = 89
    Width = 103
    Height = 13
    Caption = 'Endere'#231'o do Arquivo:'
  end
  object Label3: TLabel
    Left = 19
    Top = 114
    Width = 85
    Height = 13
    Caption = 'Nome do Arquivo:'
  end
  object Bevel1: TBevel
    Left = -1
    Top = 138
    Width = 409
    Height = 5
    Shape = bsTopLine
    Style = bsRaised
  end
  object Label4: TLabel
    Left = 81
    Top = 16
    Width = 23
    Height = 13
    Caption = 'Filial:'
  end
  object DateEdit1: TDateEdit
    Left = 108
    Top = 32
    Width = 101
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
    OnExit = DateEdit1Exit
  end
  object DateEdit2: TDateEdit
    Left = 108
    Top = 56
    Width = 101
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 111
    Top = 146
    Width = 95
    Height = 25
    Caption = 'Gerar'
    TabOrder = 4
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000CE0E0000C40E00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888888888888888888844888888888888888888888888888884224888
      8888888888888888888888884222248888888888888888888888888422222248
      88888888888888888888884222A222248888888888888888888888222A8A2224
      8888888888888888888888A2A888A22248888888888888888888888A88888A22
      248888888888888888888888888888A22248888888888888888888888888888A
      22248888888888888888888888888888A2224888888888888888888888888888
      8A22248888888888888888888888888888A22488888888888888888888888888
      888A22888888888888888888888888888888A888888888888888}
    NumGlyphs = 2
  end
  object DirectoryEdit1: TDirectoryEdit
    Left = 108
    Top = 81
    Width = 293
    Height = 21
    NumGlyphs = 1
    TabOrder = 3
    Text = 'C:\'
  end
  object Edit1: TEdit
    Left = 108
    Top = 106
    Width = 183
    Height = 21
    BorderStyle = bsNone
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object BitBtn5: TBitBtn
    Left = 207
    Top = 146
    Width = 95
    Height = 25
    Hint = 'Fecha a janela atual'
    Caption = '&Fechar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = BitBtn5Click
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
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 108
    Top = 8
    Width = 293
    Height = 21
    DropDownCount = 8
    LookupField = 'Codigo'
    LookupDisplay = 'Empresa'
    LookupSource = DM1.dsFilial
    TabOrder = 0
    OnExit = RxDBLookupCombo1Exit
  end
  object mReg50: TMemoryTable
    Active = True
    BeforePost = mReg50BeforePost
    OnNewRecord = mReg50NewRecord
    Left = 248
    Top = 36
    object mReg50CodNatOper: TStringField
      FieldName = 'CodNatOper'
    end
    object mReg50AliqICMS: TFloatField
      FieldName = 'AliqICMS'
    end
    object mReg50CNPJ: TStringField
      DisplayWidth = 18
      FieldName = 'CNPJ'
      Size = 18
    end
    object mReg50InscEstadual: TStringField
      FieldName = 'InscEstadual'
    end
    object mReg50DtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object mReg50UF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object mReg50Modelo: TStringField
      FieldName = 'Modelo'
      Size = 2
    end
    object mReg50Serie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object mReg50NumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mReg50Emitente: TStringField
      FieldName = 'Emitente'
      Size = 1
    end
    object mReg50VlrTotal: TFloatField
      FieldName = 'VlrTotal'
      DisplayFormat = '0.00'
    end
    object mReg50BaseIcms: TFloatField
      FieldName = 'BaseIcms'
      DisplayFormat = '0.00'
    end
    object mReg50VlrIcms: TFloatField
      FieldName = 'VlrIcms'
      DisplayFormat = '0.00'
    end
    object mReg50VlrIsento: TFloatField
      FieldName = 'VlrIsento'
      DisplayFormat = '0.00'
    end
    object mReg50VlrOutras: TFloatField
      FieldName = 'VlrOutras'
      DisplayFormat = '0.00'
    end
    object mReg50Situacao: TStringField
      FieldName = 'Situacao'
      Size = 1
    end
  end
  object mReg54: TMemoryTable
    Active = True
    OnNewRecord = mReg54NewRecord
    Left = 312
    Top = 36
    object mReg54CNPJ: TStringField
      DisplayWidth = 18
      FieldName = 'CNPJ'
      Size = 18
    end
    object mReg54Serie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object mReg54Modelo: TStringField
      FieldName = 'Modelo'
      Size = 2
    end
    object mReg54NumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mReg54CodNatOper: TStringField
      FieldName = 'CodNatOper'
      Size = 4
    end
    object mReg54CodSitTrib: TStringField
      FieldName = 'CodSitTrib'
      Size = 3
    end
    object mReg54ItemNota: TIntegerField
      FieldName = 'ItemNota'
    end
    object mReg54CodProduto: TStringField
      FieldName = 'CodProduto'
      Size = 14
    end
    object mReg54Qtde: TFloatField
      FieldName = 'Qtde'
      DisplayFormat = '0.000'
    end
    object mReg54VlrTotal: TFloatField
      FieldName = 'VlrTotal'
      DisplayFormat = '0.00'
    end
    object mReg54VlrDesconto: TFloatField
      FieldName = 'VlrDesconto'
      DisplayFormat = '0.00'
    end
    object mReg54BaseIcms: TFloatField
      FieldName = 'BaseIcms'
      DisplayFormat = '0.00'
    end
    object mReg54VlrIPI: TFloatField
      FieldName = 'VlrIPI'
      DisplayFormat = '0.00'
    end
    object mReg54AliqICMS: TFloatField
      FieldName = 'AliqICMS'
      DisplayFormat = '0.00'
    end
    object mReg54GeraDupl: TBooleanField
      FieldName = 'GeraDupl'
    end
    object mReg54CodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object mReg54Tamanho: TStringField
      FieldName = 'Tamanho'
      Size = 6
    end
  end
  object mReg75: TMemoryTable
    Active = True
    Left = 344
    Top = 36
    object mReg75CodProduto: TStringField
      FieldName = 'CodProduto'
      Size = 14
    end
    object mReg75ClasFiscal: TStringField
      DisplayWidth = 12
      FieldName = 'ClasFiscal'
      Size = 8
    end
    object mReg75NomeProduto: TStringField
      FieldName = 'NomeProduto'
      Size = 53
    end
    object mReg75Unidade: TStringField
      FieldName = 'Unidade'
      Size = 6
    end
    object mReg75CodSitTrib: TStringField
      FieldName = 'CodSitTrib'
      Size = 3
    end
    object mReg75AliqIPI: TFloatField
      FieldName = 'AliqIPI'
    end
    object mReg75AliqICMS: TFloatField
      FieldName = 'AliqICMS'
    end
    object mReg75PercRedBaseCalculo: TFloatField
      FieldName = 'PercRedBaseCalculo'
      DisplayFormat = '0.00'
    end
    object mReg75TipoRegistro: TStringField
      FieldName = 'TipoRegistro'
      Size = 1
    end
    object mReg75CodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object mReg75Tamanho: TStringField
      FieldName = 'Tamanho'
      Size = 6
    end
  end
  object qItNotaFiscal: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT NumNota, Item, GeraDupl'
      'FROM "dbNotaFiscalItens.DB" Dbnotafiscalitens'
      'WHERE  NumNota = :NumNota'
      'order by  Item')
    Left = 216
    Top = 36
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NumNota'
        ParamType = ptUnknown
        Value = 0
      end>
    object qItNotaFiscalNumNota: TIntegerField
      FieldName = 'NumNota'
      Origin = 'TABELAS."dbNotaFiscalItens.DB".NumNota'
    end
    object qItNotaFiscalItem: TSmallintField
      FieldName = 'Item'
      Origin = 'TABELAS."dbNotaFiscalItens.DB".Item'
    end
    object qItNotaFiscalGeraDupl: TBooleanField
      FieldName = 'GeraDupl'
      Origin = 'TABELAS."dbNotaFiscalItens.DB".GeraDupl'
    end
  end
  object mReg51: TMemoryTable
    Active = True
    OnNewRecord = mReg51NewRecord
    Left = 280
    Top = 36
    object mReg51CNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object mReg51InscEstadual: TStringField
      FieldName = 'InscEstadual'
    end
    object mReg51DtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object mReg51UF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object mReg51Serie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object mReg51NumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mReg51CodNatOper: TStringField
      FieldName = 'CodNatOper'
      Size = 4
    end
    object mReg51VlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
    object mReg51VlrIPI: TFloatField
      FieldName = 'VlrIPI'
    end
    object mReg51VlrIpiIsento: TFloatField
      FieldName = 'VlrIpiIsento'
    end
    object mReg51VlrIpiOutros: TFloatField
      FieldName = 'VlrIpiOutros'
    end
    object mReg51Situacao: TStringField
      FieldName = 'Situacao'
      Size = 1
    end
  end
end
