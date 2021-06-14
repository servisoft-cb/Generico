object fVendedorMeta: TfVendedorMeta
  Left = 86
  Top = 214
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Representante Meta'
  ClientHeight = 192
  ClientWidth = 735
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
    Width = 735
    Height = 39
    Align = alTop
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 6
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 80
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 39
    Width = 735
    Height = 153
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 26
      Top = 14
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Representante:'
    end
    object Label13: TLabel
      Left = 66
      Top = 37
      Width = 33
      Height = 13
      Caption = 'Marca:'
    end
    object Label6: TLabel
      Left = 8
      Top = 60
      Width = 91
      Height = 13
      Caption = 'Meta (Quantidade):'
    end
    object RxDBLookupCombo3: TRxDBLookupCombo
      Left = 102
      Top = 6
      Width = 296
      Height = 21
      DropDownCount = 8
      DataField = 'CODIGO'
      DataSource = DMVendedorMeta.dsVendedor_Meta
      LookupField = 'CODIGO'
      LookupDisplay = 'NOME'
      LookupSource = dsVendedor
      TabOrder = 0
    end
    object DBEdit9: TDBEdit
      Left = 102
      Top = 52
      Width = 83
      Height = 21
      DataField = 'META_QTD'
      DataSource = DMVendedorMeta.dsVendedor_Meta
      TabOrder = 2
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 102
      Top = 29
      Width = 296
      Height = 21
      DropDownCount = 8
      DataField = 'CODMARCA'
      DataSource = DMVendedorMeta.dsVendedor_Meta
      LookupField = 'CODIGO'
      LookupDisplay = 'NOME'
      LookupSource = dsMarca
      TabOrder = 1
    end
  end
  object sdsVendedor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT CODIGO, NOME'#13#10'FROM VENDEDOR'#13#10'WHERE INATIVO = '#39'N'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 504
    Top = 79
    object sdsVendedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsVendedorNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
  end
  object dspVendedor: TDataSetProvider
    DataSet = sdsVendedor
    Left = 544
    Top = 79
  end
  object cdsVendedor: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspVendedor'
    Left = 584
    Top = 79
    object cdsVendedorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsVendedorNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
  end
  object dsVendedor: TDataSource
    DataSet = cdsVendedor
    Left = 624
    Top = 79
  end
  object sdsMarca: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT CODIGO, NOME'#13#10'FROM CLIENTE'#13#10'WHERE REPRESENTADA = '#39'S'#39#13#10'  A' +
      'ND INATIVO = '#39'N'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 504
    Top = 127
    object sdsMarcaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsMarcaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dspMarca: TDataSetProvider
    DataSet = sdsMarca
    Left = 544
    Top = 127
  end
  object cdsMarca: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspMarca'
    Left = 584
    Top = 127
    object cdsMarcaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsMarcaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dsMarca: TDataSource
    DataSet = cdsMarca
    Left = 624
    Top = 127
  end
end
