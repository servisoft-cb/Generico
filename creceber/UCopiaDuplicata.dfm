object fCopiaDuplicata: TfCopiaDuplicata
  Left = 278
  Top = 182
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'C'#243'pia de Duplicata'
  ClientHeight = 193
  ClientWidth = 358
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
    Width = 358
    Height = 193
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 50
      Width = 86
      Height = 13
      Caption = 'Nota Fiscal Inicial:'
    end
    object Label2: TLabel
      Left = 188
      Top = 50
      Width = 81
      Height = 13
      Caption = 'Nota Fiscal Final:'
    end
    object Label3: TLabel
      Left = 73
      Top = 23
      Width = 23
      Height = 13
      Caption = 'Filial:'
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 100
      Top = 42
      Width = 79
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 1
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 272
      Top = 42
      Width = 79
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 32
      Top = 72
      Width = 295
      Height = 73
      TabOrder = 3
      object RxSpeedButton1: TRxSpeedButton
        Left = 12
        Top = 8
        Width = 90
        Height = 25
        DropDownMenu = PopupMenu1
        Caption = 'Imprimir'
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
          F75EF75EF75EF75EF75E00000000000000000000000000000000000000000000
          F75EF75EF75EF75E0000F75EF75EF75EF75EF75EF75EF75EF75EF75E0000F75E
          0000F75EF75E0000000000000000000000000000000000000000000000000000
          F75E0000F75E0000F75EF75EF75EF75EF75EF75EE07FE07FE07FF75EF75E0000
          00000000F75E0000F75EF75EF75EF75EF75EF75EEF3DEF3DEF3DF75EF75E0000
          F75E0000F75E0000000000000000000000000000000000000000000000000000
          F75EF75E00000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75E0000F75E
          0000F75E0000F75E0000000000000000000000000000000000000000F75E0000
          F75E00000000F75EF75E0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000F75E
          0000F75E0000F75EF75EF75E0000FF7F00000000000000000000FF7F00000000
          00000000F75EF75EF75EF75E0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
          F75EF75EF75EF75EF75EF75EF75E0000FF7F00000000000000000000FF7F0000
          F75EF75EF75EF75EF75EF75EF75E0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          0000F75EF75EF75EF75EF75EF75EF75E00000000000000000000000000000000
          0000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
          F75EF75EF75E}
        Layout = blGlyphLeft
      end
      object BitBtn2: TBitBtn
        Left = 102
        Top = 8
        Width = 90
        Height = 25
        Hint = 'Cancela a sele'#231#227'o acima'
        Caption = 'Ca&ncelar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn2Click
        Glyph.Data = {
          CE070000424DCE07000000000000360000002800000024000000120000000100
          18000000000098070000CE0E0000C40E00000000000000000000008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          0080800080800080800080800080800080808080808080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080FFFFFF008080008080008080008080008080008080
          0080800080800080800080800080800080800080800080800080800000FF0000
          800000808080800080800080800080800080800080800000FF80808000808000
          8080008080008080008080008080008080008080808080808080FFFFFF008080
          008080008080008080008080008080FFFFFF0080800080800080800080800080
          800080800080800000FF00008000008000008080808000808000808000808000
          00FF000080000080808080008080008080008080008080008080008080808080
          FFFFFF008080808080FFFFFF008080008080008080FFFFFF808080808080FFFF
          FF0080800080800080800080800080800080800000FF00008000008000008000
          00808080800080800000FF000080000080000080000080808080008080008080
          008080008080008080808080FFFFFF008080008080808080FFFFFF008080FFFF
          FF808080008080008080808080FFFFFF00808000808000808000808000808000
          80800000FF000080000080000080000080808080000080000080000080000080
          000080808080008080008080008080008080008080808080FFFFFF0080800080
          80008080808080FFFFFF808080008080008080008080008080808080FFFFFF00
          80800080800080800080800080800080800000FF000080000080000080000080
          0000800000800000800000808080800080800080800080800080800080800080
          80008080808080FFFFFF00808000808000808080808000808000808000808000
          8080FFFFFF808080008080008080008080008080008080008080008080008080
          0000FF0000800000800000800000800000800000808080800080800080800080
          80008080008080008080008080008080008080808080FFFFFF00808000808000
          8080008080008080008080FFFFFF808080008080008080008080008080008080
          0080800080800080800080800080800000800000800000800000800000808080
          8000808000808000808000808000808000808000808000808000808000808000
          8080808080FFFFFF008080008080008080008080008080808080008080008080
          0080800080800080800080800080800080800080800080800080800000FF0000
          8000008000008000008080808000808000808000808000808000808000808000
          8080008080008080008080008080008080808080FFFFFF008080008080008080
          8080800080800080800080800080800080800080800080800080800080800080
          800080800000FF00008000008000008000008000008080808000808000808000
          8080008080008080008080008080008080008080008080008080008080808080
          008080008080008080008080808080FFFFFF0080800080800080800080800080
          800080800080800080800080800000FF00008000008000008080808000008000
          0080000080808080008080008080008080008080008080008080008080008080
          008080008080808080008080008080008080008080008080808080FFFFFF0080
          800080800080800080800080800080800080800080800000FF00008000008000
          00808080800080800000FF000080000080000080808080008080008080008080
          008080008080008080008080008080808080008080008080008080808080FFFF
          FF008080008080808080FFFFFF00808000808000808000808000808000808000
          80800000FF0000800000808080800080800080800080800000FF000080000080
          000080808080008080008080008080008080008080008080808080FFFFFF0080
          80008080808080008080808080FFFFFF008080008080808080FFFFFF00808000
          80800080800080800080800080800080800000FF000080008080008080008080
          0080800080800000FF0000800000800000800080800080800080800080800080
          80008080808080FFFFFFFFFFFF808080008080008080008080808080FFFFFF00
          8080008080808080FFFFFF008080008080008080008080008080008080008080
          0080800080800080800080800080800080800080800000FF0000800000FF0080
          8000808000808000808000808000808000808080808080808000808000808000
          8080008080008080808080FFFFFFFFFFFFFFFFFF808080008080008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080808080808080808080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          008080008080008080008080008080008080}
        NumGlyphs = 2
      end
      object BitBtn3: TBitBtn
        Left = 193
        Top = 8
        Width = 90
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn3Click
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
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 100
      Top = 15
      Width = 253
      Height = 21
      DropDownCount = 8
      LookupField = 'Codigo'
      LookupDisplay = 'Empresa'
      LookupSource = DM1.dsFilial
      TabOrder = 0
    end
  end
  object mDuplicata: TMemoryTable
    Active = True
    DatabaseName = 'Tabelas'
    Left = 8
    Top = 72
    object mDuplicataNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mDuplicataParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object mDuplicataVcto: TDateTimeField
      FieldName = 'Vcto'
    end
    object mDuplicataCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object mDuplicataVlrParcela: TFloatField
      FieldName = 'VlrParcela'
      DisplayFormat = '0.00'
    end
    object mDuplicataVlrTotal: TFloatField
      FieldName = 'VlrTotal'
      DisplayFormat = '0.00'
    end
    object mDuplicatalkNomeCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'lkNomeCliente'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCliente'
      Size = 40
      Lookup = True
    end
    object mDuplicatalkEndereco: TStringField
      FieldKind = fkLookup
      FieldName = 'lkEndereco'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Endereco'
      KeyFields = 'CodCliente'
      Size = 40
      Lookup = True
    end
    object mDuplicatalkBairro: TStringField
      FieldKind = fkLookup
      FieldName = 'lkBairro'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Bairro'
      KeyFields = 'CodCliente'
      Size = 25
      Lookup = True
    end
    object mDuplicatalkCidade: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCidade'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'lkCidade'
      KeyFields = 'CodCliente'
      Size = 26
      Lookup = True
    end
    object mDuplicatalkUf: TStringField
      FieldKind = fkLookup
      FieldName = 'lkUf'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Uf'
      KeyFields = 'CodCliente'
      Size = 2
      Lookup = True
    end
    object mDuplicatalkCep: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCep'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Cep'
      KeyFields = 'CodCliente'
      Size = 9
      Lookup = True
    end
    object mDuplicatalkEndPgto: TStringField
      FieldKind = fkLookup
      FieldName = 'lkEndPgto'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'EndPgto'
      KeyFields = 'CodCliente'
      Size = 40
      Lookup = True
    end
    object mDuplicatalkCidPgto: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCidPgto'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'lkCidadeP'
      KeyFields = 'CodCliente'
      Size = 26
      Lookup = True
    end
    object mDuplicatalkUfPgto: TStringField
      FieldKind = fkLookup
      FieldName = 'lkUfPgto'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Uf'
      KeyFields = 'CodCliente'
      Size = 2
      Lookup = True
    end
    object mDuplicatalkCepPgto: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCepPgto'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'CepPgto'
      KeyFields = 'CodCliente'
      Size = 9
      Lookup = True
    end
    object mDuplicatalkCnpj: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCnpj'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'CgcCpf'
      KeyFields = 'CodCliente'
      Size = 18
      Lookup = True
    end
    object mDuplicatalkInscrEst: TStringField
      FieldKind = fkLookup
      FieldName = 'lkInscrEst'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'InscrEst'
      KeyFields = 'CodCliente'
      Size = 18
      Lookup = True
    end
    object mDuplicataDtEmissao: TDateTimeField
      FieldName = 'DtEmissao'
    end
    object mDuplicatalkTelefone: TStringField
      FieldKind = fkLookup
      FieldName = 'lkTelefone'
      LookupDataSet = DM1.tCliente
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Telefone'
      KeyFields = 'CodCliente'
      Size = 15
      Lookup = True
    end
  end
  object ValorPorExtenso1: TValorPorExtenso
    MoedaNoSingular = 'REAL'
    MoedaNoPlural = 'REAIS'
    TipoDoTexto = ttMaiuscula
    Genero = gMasculino
    Left = 40
    Top = 72
  end
  object PopupMenu1: TPopupMenu
    Left = 126
    Top = 15
    object MSDOS1: TMenuItem
      Caption = 'MS-DOS'
      OnClick = MSDOS1Click
    end
    object Windows1: TMenuItem
      Caption = 'Windows'
      OnClick = Windows1Click
    end
  end
end
