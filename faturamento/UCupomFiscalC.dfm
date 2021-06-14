object fCupomFiscalC: TfCupomFiscalC
  Left = 13
  Top = 137
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Cupom Fiscal'
  ClientHeight = 505
  ClientWidth = 989
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 989
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 44
      Height = 13
      Caption = 'Dt.Inicial:'
    end
    object Label2: TLabel
      Left = 160
      Top = 20
      Width = 25
      Height = 13
      Caption = 'Final:'
    end
    object BitBtn1: TBitBtn
      Left = 463
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Inserir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 538
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      TabStop = False
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object DateEdit1: TDateEdit
      Left = 57
      Top = 12
      Width = 90
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 188
      Top = 12
      Width = 90
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object BitBtn5: TBitBtn
      Left = 912
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn5Click
    end
    object BitBtn7: TBitBtn
      Left = 837
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Encerra cupom aberto'
      Caption = 'Encerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      TabStop = False
      OnClick = BitBtn7Click
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 81
    Width = 989
    Height = 420
    Align = alClient
    DataSource = dsCupomFiscal
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid1DblClick
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
    ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    OnGetCellParams = SMDBGrid1GetCellParams
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 27
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 2
    RowCount = 2
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 501
    Width = 989
    Height = 4
    Align = alBottom
    BorderStyle = sbsSunken
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 989
    Height = 40
    Align = alTop
    TabOrder = 3
    object BitBtn4: TBitBtn
      Left = 4
      Top = 8
      Width = 121
      Height = 25
      Caption = 'Op'#231#245'es do Cupom'
      TabOrder = 0
      OnClick = BitBtn4Click
    end
    object BitBtn6: TBitBtn
      Left = 125
      Top = 8
      Width = 121
      Height = 25
      Caption = ' (F12) Abrir Gaveta'
      TabOrder = 1
      OnClick = BitBtn6Click
    end
    object ckTeste: TCheckBox
      Left = 768
      Top = 5
      Width = 97
      Height = 17
      Caption = 'Teste'
      TabOrder = 2
      Visible = False
    end
    object ckMostrarSitTrib: TCheckBox
      Left = 768
      Top = 21
      Width = 161
      Height = 17
      Caption = 'Mostrar Situa'#231#227'o Tribut'#225'ria'
      TabOrder = 3
      Visible = False
    end
  end
  object sdsCupomFiscal: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT CF.*, C.NOME NOMECLIENTE'#13#10'FROM CUPOMFISCAL CF'#13#10'INNER JOIN' +
      ' CLIENTE C ON (CF.CODCLIENTE = C.CODIGO)'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 600
    Top = 256
    object sdsCupomFiscalID_CUPOM: TIntegerField
      FieldName = 'ID_CUPOM'
      Required = True
    end
    object sdsCupomFiscalNUMCUPOM: TIntegerField
      FieldName = 'NUMCUPOM'
    end
    object sdsCupomFiscalDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object sdsCupomFiscalHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
    end
    object sdsCupomFiscalCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object sdsCupomFiscalTIPOPGTO: TStringField
      FieldName = 'TIPOPGTO'
      FixedChar = True
      Size = 1
    end
    object sdsCupomFiscalCODCONDPGTO: TIntegerField
      FieldName = 'CODCONDPGTO'
    end
    object sdsCupomFiscalCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
    end
    object sdsCupomFiscalPERCVENDEDOR: TFloatField
      FieldName = 'PERCVENDEDOR'
    end
    object sdsCupomFiscalBASEICMS: TFloatField
      FieldName = 'BASEICMS'
    end
    object sdsCupomFiscalVLRICMS: TFloatField
      FieldName = 'VLRICMS'
    end
    object sdsCupomFiscalVLRPRODUTOS: TFloatField
      FieldName = 'VLRPRODUTOS'
    end
    object sdsCupomFiscalVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
    end
    object sdsCupomFiscalVLRTOTAL: TFloatField
      FieldName = 'VLRTOTAL'
    end
    object sdsCupomFiscalCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object sdsCupomFiscalVLRRECEBIDO: TFloatField
      FieldName = 'VLRRECEBIDO'
    end
    object sdsCupomFiscalVLRTROCO: TFloatField
      FieldName = 'VLRTROCO'
    end
    object sdsCupomFiscalNUMMOVFINANCEIRO: TIntegerField
      FieldName = 'NUMMOVFINANCEIRO'
    end
    object sdsCupomFiscalCODCONTA: TIntegerField
      FieldName = 'CODCONTA'
    end
    object sdsCupomFiscalFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsCupomFiscalCODTIPOCOBRANCA: TIntegerField
      FieldName = 'CODTIPOCOBRANCA'
    end
    object sdsCupomFiscalNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Size = 60
    end
  end
  object dspCupomFiscal: TDataSetProvider
    DataSet = sdsCupomFiscal
    Left = 632
    Top = 256
  end
  object cdsCupomFiscal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCupomFiscal'
    Left = 664
    Top = 256
    object cdsCupomFiscalID_CUPOM: TIntegerField
      FieldName = 'ID_CUPOM'
      Required = True
    end
    object cdsCupomFiscalNUMCUPOM: TIntegerField
      FieldName = 'NUMCUPOM'
    end
    object cdsCupomFiscalDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsCupomFiscalHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
    end
    object cdsCupomFiscalCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object cdsCupomFiscalNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Size = 60
    end
    object cdsCupomFiscalTIPOPGTO: TStringField
      FieldName = 'TIPOPGTO'
      FixedChar = True
      Size = 1
    end
    object cdsCupomFiscalCODCONDPGTO: TIntegerField
      FieldName = 'CODCONDPGTO'
    end
    object cdsCupomFiscalCODVENDEDOR: TIntegerField
      FieldName = 'CODVENDEDOR'
    end
    object cdsCupomFiscalPERCVENDEDOR: TFloatField
      FieldName = 'PERCVENDEDOR'
    end
    object cdsCupomFiscalBASEICMS: TFloatField
      FieldName = 'BASEICMS'
      DisplayFormat = '0.00'
    end
    object cdsCupomFiscalVLRICMS: TFloatField
      FieldName = 'VLRICMS'
      DisplayFormat = '0.00'
    end
    object cdsCupomFiscalVLRPRODUTOS: TFloatField
      FieldName = 'VLRPRODUTOS'
      DisplayFormat = '0.00'
    end
    object cdsCupomFiscalVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
      DisplayFormat = '0.00'
    end
    object cdsCupomFiscalVLRTOTAL: TFloatField
      FieldName = 'VLRTOTAL'
      DisplayFormat = '0.00'
    end
    object cdsCupomFiscalCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object cdsCupomFiscalVLRRECEBIDO: TFloatField
      FieldName = 'VLRRECEBIDO'
      DisplayFormat = '0.00'
    end
    object cdsCupomFiscalVLRTROCO: TFloatField
      FieldName = 'VLRTROCO'
      DisplayFormat = '0.00'
    end
    object cdsCupomFiscalNUMMOVFINANCEIRO: TIntegerField
      FieldName = 'NUMMOVFINANCEIRO'
    end
    object cdsCupomFiscalCODCONTA: TIntegerField
      FieldName = 'CODCONTA'
    end
    object cdsCupomFiscalFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsCupomFiscalCODTIPOCOBRANCA: TIntegerField
      FieldName = 'CODTIPOCOBRANCA'
    end
  end
  object dsCupomFiscal: TDataSource
    DataSet = cdsCupomFiscal
    Left = 696
    Top = 256
  end
  object qVerificaUlt: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT MAX(NUMCUPOM) NUMCUPOM'
      'FROM CUPOMFISCAL')
    SQLConnection = dmDatabase.scoDados
    Left = 720
    Top = 128
    object qVerificaUltNUMCUPOM: TIntegerField
      FieldName = 'NUMCUPOM'
    end
  end
end
