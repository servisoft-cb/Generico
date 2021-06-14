object fCupomFiscalPgto: TfCupomFiscalPgto
  Left = 279
  Top = 190
  Width = 488
  Height = 346
  BorderIcons = [biSystemMenu]
  Caption = 'fCupomFiscalPgto - Pagamento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 480
    Height = 209
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 80
      Top = 56
      Width = 110
      Height = 24
      Alignment = taRightJustify
      Caption = 'Valor Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 208
      Top = 56
      Width = 81
      Height = 24
      AutoSize = True
      DataField = 'VLRTOTAL'
      DataSource = DMCupom.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 44
      Top = 112
      Width = 150
      Height = 24
      Alignment = taRightJustify
      Caption = 'Valor Recebido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 131
      Top = 176
      Width = 63
      Height = 24
      Alignment = taRightJustify
      Caption = 'Troco:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 200
      Top = 138
      Width = 138
      Height = 13
      Caption = 'Pressione Enter para calcular'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 200
      Top = 104
      Width = 163
      Height = 32
      DataField = 'VLRRECEBIDO'
      DataSource = DMCupom.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = DBEdit1Exit
      OnKeyDown = DBEdit1KeyDown
    end
    object DBEdit2: TDBEdit
      Left = 200
      Top = 168
      Width = 163
      Height = 32
      TabStop = False
      Ctl3D = True
      DataField = 'VLRTROCO'
      DataSource = DMCupom.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object BitBtn4: TBitBtn
      Left = 11
      Top = 8
      Width = 75
      Height = 25
      Caption = '(F2) A Vista'
      TabOrder = 2
      TabStop = False
      OnClick = BitBtn4Click
    end
    object BitBtn3: TBitBtn
      Left = 86
      Top = 8
      Width = 75
      Height = 25
      Caption = '(F3) A Prazo'
      TabOrder = 3
      TabStop = False
      OnClick = BitBtn3Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 209
    Width = 480
    Height = 62
    Align = alBottom
    TabOrder = 1
    Visible = False
    object Label3: TLabel
      Left = 14
      Top = 16
      Width = 120
      Height = 13
      Caption = 'Condi'#231#227'o de Pagamento:'
    end
    object Label2: TLabel
      Left = 45
      Top = 40
      Width = 89
      Height = 13
      Caption = 'Forma Pagamento:'
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 136
      Top = 8
      Width = 225
      Height = 21
      DropDownCount = 8
      DataField = 'CODCONDPGTO'
      DataSource = DMCupom.dsCupomFiscal
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsCondPgto
      TabOrder = 0
      OnEnter = RxDBLookupCombo2Enter
    end
    object RxDBLookupCombo3: TRxDBLookupCombo
      Left = 136
      Top = 32
      Width = 324
      Height = 21
      DropDownCount = 8
      DataField = 'CODTIPOCOBRANCA'
      DataSource = DMCupom.dsCupomFiscal
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsTipoCobranca
      TabOrder = 1
      OnEnter = RxDBLookupCombo3Enter
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 271
    Width = 480
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 128
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 203
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn5: TBitBtn
      Left = 384
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cliente'
      TabOrder = 2
      OnClick = BitBtn5Click
    end
  end
  object tCReceberIns: TTable
    DatabaseName = 'Tabelas'
    IndexFieldNames = 'Filial;NumCReceber'
    MasterFields = 'Codigo'
    MasterSource = DM1.dsFilial
    TableName = 'dbCReceber.db'
    Left = 416
    Top = 72
    object tCReceberInsFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tCReceberInsNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
    end
    object tCReceberInsNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object tCReceberInsQuitado: TBooleanField
      FieldName = 'Quitado'
    end
    object tCReceberInsCodCli: TIntegerField
      FieldName = 'CodCli'
    end
    object tCReceberInsTipoDoc: TStringField
      FieldName = 'TipoDoc'
      Size = 2
    end
    object tCReceberInsDtGerado: TDateField
      FieldName = 'DtGerado'
      EditMask = '99/99/9999'
    end
    object tCReceberInsHistorico: TStringField
      FieldName = 'Historico'
      Size = 100
    end
    object tCReceberInsCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
  end
end
