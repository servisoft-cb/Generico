object fCobEletronica: TfCobEletronica
  Left = 156
  Top = 128
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cobran'#231'a Eletr'#244'nica - fCobEletronica'
  ClientHeight = 487
  ClientWidth = 927
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
    Width = 927
    Height = 32
    Align = alTop
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 7
      Top = 4
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
      Left = 82
      Top = 4
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
    object BitBtn6: TBitBtn
      Left = 693
      Top = 4
      Width = 121
      Height = 25
      Caption = 'Par'#226'metros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn6Click
    end
    object BitBtn5: TBitBtn
      Left = 814
      Top = 4
      Width = 105
      Height = 25
      Caption = 'Enviar ao banco'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn5Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 32
    Width = 927
    Height = 95
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 780
      Top = 11
      Width = 39
      Height = 13
      Caption = 'N'#186' Mov:'
    end
    object Label2: TLabel
      Left = 56
      Top = 33
      Width = 34
      Height = 13
      Caption = 'Banco:'
    end
    object Label3: TLabel
      Left = 764
      Top = 31
      Width = 55
      Height = 13
      Caption = 'Dt. Gerado:'
    end
    object Label4: TLabel
      Left = 793
      Top = 51
      Width = 26
      Height = 13
      Caption = 'Hora:'
    end
    object Label5: TLabel
      Left = 780
      Top = 71
      Width = 39
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
    object Label6: TLabel
      Left = 67
      Top = 11
      Width = 23
      Height = 13
      Caption = 'Filial:'
    end
    object Label7: TLabel
      Left = 5
      Top = 55
      Width = 85
      Height = 13
      Caption = 'Per'#237'odo Gera'#231#227'o:'
    end
    object Label8: TLabel
      Left = 205
      Top = 55
      Width = 12
      Height = 13
      Caption = ' a '
    end
    object Label9: TLabel
      Left = 362
      Top = 55
      Width = 42
      Height = 13
      Caption = 'Vlr.Total:'
    end
    object Label10: TLabel
      Left = 54
      Top = 76
      Width = 39
      Height = 13
      Caption = 'Arquivo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 96
      Top = 77
      Width = 42
      Height = 13
      AutoSize = True
      DataField = 'NOMEARQUIVO'
      DataSource = DMCobEletronica.dsCobEletronica
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 355
      Top = 11
      Width = 49
      Height = 13
      Caption = 'Cobran'#231'a:'
    end
    object Label12: TLabel
      Left = 348
      Top = 33
      Width = 56
      Height = 13
      Caption = 'Qtd.T'#237'tulos:'
    end
    object DBEdit1: TDBEdit
      Left = 820
      Top = 3
      Width = 102
      Height = 21
      TabStop = False
      Color = clScrollBar
      DataField = 'ID'
      DataSource = DMCobEletronica.dsCobEletronica
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit3: TDBEdit
      Left = 820
      Top = 23
      Width = 102
      Height = 21
      TabStop = False
      Color = clScrollBar
      DataField = 'DTGERACAO'
      DataSource = DMCobEletronica.dsCobEletronica
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit4: TDBEdit
      Left = 820
      Top = 43
      Width = 102
      Height = 21
      TabStop = False
      Color = clScrollBar
      DataField = 'HORA'
      DataSource = DMCobEletronica.dsCobEletronica
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit5: TDBEdit
      Left = 820
      Top = 63
      Width = 102
      Height = 21
      TabStop = False
      Color = clScrollBar
      DataField = 'USUARIO'
      DataSource = DMCobEletronica.dsCobEletronica
      ReadOnly = True
      TabOrder = 8
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 93
      Top = 25
      Width = 236
      Height = 21
      DropDownCount = 8
      DataField = 'CODBANCO'
      DataSource = DMCobEletronica.dsCobEletronica
      LookupField = 'CodConta'
      LookupDisplay = 'NomeConta'
      LookupSource = DM1.dsContas
      TabOrder = 1
      OnEnter = RxDBLookupCombo1Enter
      OnExit = RxDBLookupCombo1Exit
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 93
      Top = 3
      Width = 236
      Height = 21
      DropDownCount = 8
      DropDownWidth = 500
      DataField = 'FILIAL'
      DataSource = DMCobEletronica.dsCobEletronica
      LookupField = 'Codigo'
      LookupDisplay = 'NomeInterno;CNPJ'
      LookupSource = DM1.dsFilial
      TabOrder = 0
      OnChange = RxDBLookupCombo2Change
    end
    object DBDateEdit1: TDBDateEdit
      Left = 93
      Top = 47
      Width = 100
      Height = 21
      DataField = 'DTINICIAL'
      DataSource = DMCobEletronica.dsCobEletronica
      NumGlyphs = 2
      TabOrder = 2
    end
    object DBDateEdit2: TDBDateEdit
      Left = 229
      Top = 47
      Width = 100
      Height = 21
      DataField = 'DTFINAL'
      DataSource = DMCobEletronica.dsCobEletronica
      NumGlyphs = 2
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 406
      Top = 47
      Width = 113
      Height = 21
      TabStop = False
      Color = clScrollBar
      DataField = 'VLRTITULOS'
      DataSource = DMCobEletronica.dsCobEletronica
      ReadOnly = True
      TabOrder = 9
    end
    object RxDBLookupCombo3: TRxDBLookupCombo
      Left = 406
      Top = 3
      Width = 209
      Height = 21
      DropDownCount = 8
      DataField = 'CODTIPOCOBRANCA'
      DataSource = DMCobEletronica.dsCobEletronica
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsTipoCobranca
      TabOrder = 4
      OnEnter = RxDBLookupCombo1Enter
    end
    object DBEdit6: TDBEdit
      Left = 406
      Top = 25
      Width = 113
      Height = 21
      TabStop = False
      Color = clScrollBar
      DataField = 'QTDTITULOS'
      DataSource = DMCobEletronica.dsCobEletronica
      ReadOnly = True
      TabOrder = 10
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 158
    Width = 927
    Height = 329
    Align = alClient
    DataSource = DMCobEletronica.dsCobEletronica_Nota
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 15
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FILIAL'
        Title.Alignment = taCenter
        Title.Caption = 'Filial'
        Width = 28
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUMNOTA'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Nota'
        Width = 71
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SERIE'
        Title.Alignment = taCenter
        Title.Caption = 'S'#233'rie'
        Width = 42
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PARCELA'
        Title.Alignment = taCenter
        Title.Caption = 'Parcela'
        Width = 43
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUMCARTEIRA'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Carteira'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NOSSONUMERO'
        Title.Alignment = taCenter
        Title.Caption = 'Nosso N'#250'mero (Banco)'
        Width = 108
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CODCLIENTE'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Cliente'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMECLIENTE'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Cliente'
        Width = 264
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLRTITULO'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. T'#237'tulo'
        Width = 78
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DTVENCIMENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Data Vencimento'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PROCESSO'
        Title.Alignment = taCenter
        Title.Caption = 'Processo'
        Width = 53
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUMCRECEBER'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' C.Receber'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ACEITE'
        Title.Alignment = taCenter
        Title.Caption = 'Aceite'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ESPECIEDOC'
        Title.Alignment = taCenter
        Title.Caption = 'Esp'#233'cie Doc.'
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 127
    Width = 927
    Height = 31
    Align = alTop
    TabOrder = 2
    object BitBtn3: TBitBtn
      Left = 5
      Top = 2
      Width = 77
      Height = 25
      Caption = 'Buscar T'#237'tulos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 82
      Top = 2
      Width = 89
      Height = 25
      Caption = 'Excluir T'#237'tulo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn4Click
    end
    object BitBtn7: TBitBtn
      Left = 171
      Top = 2
      Width = 85
      Height = 25
      Caption = 'Imprimir Boleto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn7Click
    end
  end
end
