object fPrevNotasEnt: TfPrevNotasEnt
  Left = 386
  Top = 263
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Notas Fiscais de Entrada por Material'
  ClientHeight = 288
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 69
    Top = 13
    Width = 23
    Height = 13
    Caption = 'Filial:'
  end
  object Label2: TLabel
    Left = 38
    Top = 158
    Width = 56
    Height = 13
    Caption = 'Data Inicial:'
  end
  object Label3: TLabel
    Left = 202
    Top = 158
    Width = 51
    Height = 13
    Caption = 'Data Final:'
  end
  object Bevel1: TBevel
    Left = 0
    Top = 224
    Width = 385
    Height = 2
    Shape = bsTopLine
    Style = bsRaised
  end
  object Label4: TLabel
    Left = 35
    Top = 36
    Width = 57
    Height = 13
    Alignment = taRightJustify
    Caption = 'Fornecedor:'
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 94
    Top = 5
    Width = 266
    Height = 21
    DropDownCount = 8
    LookupField = 'Codigo'
    LookupDisplay = 'Empresa'
    LookupSource = DM1.dsFilial
    TabOrder = 0
  end
  object DateEdit1: TDateEdit
    Left = 95
    Top = 150
    Width = 96
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
  end
  object DateEdit2: TDateEdit
    Left = 255
    Top = 150
    Width = 96
    Height = 21
    NumGlyphs = 2
    TabOrder = 4
  end
  object BitBtn2: TBitBtn
    Left = 251
    Top = 253
    Width = 116
    Height = 25
    Hint = 'Fecha a janela atual'
    Caption = '&Fechar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
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
  object BitBtn1: TBitBtn
    Left = 18
    Top = 253
    Width = 116
    Height = 25
    Caption = '&Imprimir Detalhado'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
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
  object RxDBLookupCombo2: TRxDBLookupCombo
    Left = 94
    Top = 28
    Width = 266
    Height = 21
    DropDownCount = 8
    LookupField = 'CodForn'
    LookupDisplay = 'NomeForn'
    LookupSource = DM1.dsFornecedores
    TabOrder = 1
    OnEnter = RxDBLookupCombo2Enter
  end
  object RadioGroup1: TRadioGroup
    Left = 61
    Top = 181
    Width = 257
    Height = 38
    Caption = 'Ordem de Impress'#227'o'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Produto'
      'Data'
      'Nota')
    TabOrder = 5
  end
  object BitBtn3: TBitBtn
    Left = 135
    Top = 253
    Width = 116
    Height = 25
    Caption = '&Imprimir Resumo'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = BitBtn3Click
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
  object ProgressBar1: TProgressBar
    Left = 50
    Top = 235
    Width = 295
    Height = 16
    TabOrder = 9
  end
  object GroupBox1: TGroupBox
    Left = 10
    Top = 53
    Width = 349
    Height = 94
    Caption = 'Sele'#231#227'o de Produtos / Materiais '
    TabOrder = 2
    object Label5: TLabel
      Left = 44
      Top = 44
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produto:'
    end
    object Label10: TLabel
      Left = 3
      Top = 66
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produto (Parcial):'
    end
    object Label8: TLabel
      Left = 48
      Top = 23
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object RadioButton2: TRadioButton
      Left = 282
      Top = 20
      Width = 60
      Height = 17
      Caption = 'Material'
      TabOrder = 4
      OnClick = RadioButton1Click
    end
    object RadioButton1: TRadioButton
      Left = 222
      Top = 20
      Width = 60
      Height = 17
      Caption = 'Produto'
      Checked = True
      TabOrder = 3
      TabStop = True
      OnClick = RadioButton1Click
    end
    object RxDBLookupCombo3: TRxDBLookupCombo
      Left = 85
      Top = 43
      Width = 257
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsProduto
      TabOrder = 1
      OnChange = RxDBLookupCombo3Change
      OnEnter = RxDBLookupCombo3Enter
    end
    object Edit2: TEdit
      Left = 85
      Top = 66
      Width = 257
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 85
      Top = 20
      Width = 65
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 0
      OnExit = CurrencyEdit1Exit
    end
  end
  object qProdutosFat: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'select'
      '  Dbnotafiscalitens.Filial, '
      '  Dbnotafiscalitens.NumNEntr NumNota,'
      '  Dbnotafiscalitens.CodMaterial CodProduto,'
      '  dbNotaFiscalItens.CodCor,'
      '  Dbnotafiscalitens.Unidade,'
      '  Dbnotafiscalitens.Qtd,'
      '  Dbproduto.Referencia,'
      '  Dbproduto.Nome, '
      '  Dbnotafiscal.DtEmissaoNEntr, '
      '  DbnotafiscalItens.Tamanho, '
      '  Dbnotafiscalitens.VlrUnit, '
      
        '  (Dbnotafiscalitens.VlrTotalItens + dbNotaFiscalItens.Ipi) VlrT' +
        'otal, '
      '  Dbnotafiscal.PercDesc,'
      '  dbNotaFiscalItens."Desc" PercDescItem,'
      '  dbNotaFiscalItens.VlrDesc VlrDescontoItem, '
      '  dbNotaFiscalItens.VlrIpi '
      'FROM dbNEntradaItens.DB Dbnotafiscalitens '
      '  INNER JOIN dbProduto.DB Dbproduto '
      #9'  ON  (Dbnotafiscalitens.CodMaterial = Dbproduto.Codigo) '
      '  INNER JOIN dbNEntrada.DB Dbnotafiscal '
      #9'  ON  (Dbnotafiscal.Filial = Dbnotafiscalitens.Filial) '
      #9'  AND (Dbnotafiscal.NumNEntr = Dbnotafiscalitens.NumNEntr)'
      '  INNER JOIN dbFornecedores.DB DbFornec '
      #9'  ON  (Dbnotafiscal.CodForn = DbFornec.CodForn) ')
    Left = 302
    Top = 16
    object qProdutosFatFilial: TIntegerField
      FieldName = 'Filial'
    end
    object qProdutosFatNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object qProdutosFatCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object qProdutosFatCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object qProdutosFatUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
    object qProdutosFatQtd: TFloatField
      FieldName = 'Qtd'
    end
    object qProdutosFatReferencia: TStringField
      FieldName = 'Referencia'
    end
    object qProdutosFatNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object qProdutosFatDtEmissaoNEntr: TDateField
      FieldName = 'DtEmissaoNEntr'
    end
    object qProdutosFatTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object qProdutosFatVlrUnit: TFloatField
      FieldName = 'VlrUnit'
    end
    object qProdutosFatVlrTotal: TFloatField
      FieldName = 'VlrTotal'
    end
    object qProdutosFatPercDesc: TFloatField
      FieldName = 'PercDesc'
    end
    object qProdutosFatPercDescItem: TFloatField
      FieldName = 'PercDescItem'
    end
    object qProdutosFatVlrDescontoItem: TFloatField
      FieldName = 'VlrDescontoItem'
    end
    object qProdutosFatVlrIpi: TFloatField
      FieldName = 'VlrIpi'
    end
    object qProdutosFatlkNomeCor: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCor'
      LookupDataSet = DM1.tCor
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCor'
      Size = 50
      Lookup = True
    end
  end
  object mAcumulado: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'CodProduto;CodCor;Tamanho;Unidade'
    Params = <>
    OnNewRecord = mAcumuladoNewRecord
    Left = 268
    Top = 13
    Data = {
      EC0000009619E0BD010000001800000009000000000003000000EC000A436F64
      50726F6475746F04000100000000000A5265666572656E636961010049000000
      01000557494454480200020014000B4E6F6D6550726F6475746F010049000000
      010005574944544802000200280007556E696461646501004900000001000557
      4944544802000200030003517464080004000000000008566C72546F74616C08
      000400000000000754616D616E686F0100490000000100055749445448020002
      00060006436F64436F720400010000000000074E6F6D65436F72010049000000
      0100055749445448020002001E000000}
    object mAcumuladoCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object mAcumuladoReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mAcumuladoNomeProduto: TStringField
      FieldName = 'NomeProduto'
      Size = 40
    end
    object mAcumuladoUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
    object mAcumuladoQtd: TFloatField
      FieldName = 'Qtd'
    end
    object mAcumuladoVlrTotal: TFloatField
      FieldName = 'VlrTotal'
      DisplayFormat = '###,###,##0.00'
    end
    object mAcumuladoTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 6
    end
    object mAcumuladoCodCor: TIntegerField
      FieldName = 'CodCor'
    end
    object mAcumuladoNomeCor: TStringField
      FieldName = 'NomeCor'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = qProdutosFat
    Left = 328
    Top = 16
  end
end
