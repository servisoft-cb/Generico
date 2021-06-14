object fNotaFiscalImp: TfNotaFiscalImp
  Left = 240
  Top = 47
  ActiveControl = DBDateEdit2
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados de Importa'#231#227'o'
  ClientHeight = 519
  ClientWidth = 772
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  DesignSize = (
    772
    519)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 16
    Width = 250
    Height = 13
    Alignment = taRightJustify
    Caption = 'N'#186' do Documento de Importa'#231#227'o DI/DSI/DA/DRI-E:'
  end
  object Label2: TLabel
    Left = 116
    Top = 40
    Width = 140
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data Registro da DI/DSI/DA:'
  end
  object Label3: TLabel
    Left = 368
    Top = 42
    Width = 120
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cidade de Desembara'#231'o:'
  end
  object Label5: TLabel
    Left = 151
    Top = 63
    Width = 105
    Height = 13
    Alignment = taRightJustify
    Caption = 'C'#243'digo do Exportador:'
  end
  object Label9: TLabel
    Left = 208
    Top = 86
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = 'N'#186' Fatura:'
  end
  object Label13: TLabel
    Left = 105
    Top = 112
    Width = 151
    Height = 13
    Alignment = taRightJustify
    Caption = 'Via de Transporte Internacional:'
  end
  object Label18: TLabel
    Left = 176
    Top = 134
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tipo Importa'#231#227'o:'
  end
  object Label14: TLabel
    Left = 493
    Top = 112
    Width = 75
    Height = 13
    Alignment = taRightJustify
    Caption = 'Vlr. da AFRMM:'
    Visible = False
  end
  object DBEdit1: TDBEdit
    Left = 260
    Top = 8
    Width = 185
    Height = 21
    DataField = 'NumDI'
    DataSource = DMNotaFiscal.dsNotaFiscalImp
    TabOrder = 0
  end
  object DBDateEdit1: TDBDateEdit
    Left = 260
    Top = 32
    Width = 90
    Height = 21
    DataField = 'DataRegistro'
    DataSource = DMNotaFiscal.dsNotaFiscalImp
    NumGlyphs = 2
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 260
    Top = 55
    Width = 397
    Height = 21
    DataField = 'CodExportador'
    DataSource = DMNotaFiscal.dsNotaFiscalImp
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 0
    Top = 278
    Width = 772
    Height = 44
    Align = alBottom
    Color = clMoneyGreen
    TabOrder = 10
    object BitBtn1: TBitBtn
      Left = 200
      Top = 8
      Width = 96
      Height = 30
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 392
      Top = 8
      Width = 96
      Height = 30
      Caption = 'Cancelar / Fechar'
      TabOrder = 2
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 296
      Top = 8
      Width = 96
      Height = 30
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = BitBtn3Click
    end
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 492
    Top = 34
    Width = 229
    Height = 21
    DropDownCount = 8
    DataField = 'CodCidade'
    DataSource = DMNotaFiscal.dsNotaFiscalImp
    LookupField = 'Codigo'
    LookupDisplay = 'Nome'
    LookupSource = DM1.dsCidade
    TabOrder = 2
    OnEnter = RxDBLookupCombo1Enter
  end
  object Panel2: TPanel
    Left = 0
    Top = 322
    Width = 772
    Height = 197
    Align = alBottom
    TabOrder = 11
    OnEnter = Panel2Enter
    object Label6: TLabel
      Left = 8
      Top = 8
      Width = 48
      Height = 13
      Caption = 'N'#186' Adi'#231#227'o'
    end
    object Label7: TLabel
      Left = 162
      Top = 8
      Width = 86
      Height = 13
      Caption = 'C'#243'digo Fabricante'
    end
    object Label8: TLabel
      Left = 464
      Top = 8
      Width = 75
      Height = 13
      Caption = 'Vlr.Desconto DI'
    end
    object SpeedButton9: TSpeedButton
      Left = 732
      Top = 18
      Width = 32
      Height = 28
      Hint = 'Exclui o produto selecionado da nota'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton9Click
    end
    object SpeedButton23: TSpeedButton
      Left = 700
      Top = 18
      Width = 32
      Height = 28
      Hint = 'Altera o item selecionado na Nota Fiscal'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton23Click
    end
    object Label17: TLabel
      Left = 580
      Top = 8
      Width = 64
      Height = 13
      Caption = 'N'#186' Drawback'
    end
    object Edit2: TEdit
      Left = 58
      Top = 24
      Width = 402
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 1
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 460
      Top = 24
      Width = 93
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00'
      TabOrder = 2
    end
    object BitBtn6: TBitBtn
      Left = 668
      Top = 18
      Width = 32
      Height = 28
      Hint = 'Confirma a inser'#231#227'o do produto'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BitBtn6Click
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000007777777777777777700000007777777774F77777700000007777
        7777444F77777000000077777774444F777770000000700000444F44F7777000
        000070FFF444F0744F777000000070F8884FF0774F777000000070FFFFFFF077
        74F77000000070F88888F077774F7000000070FFFFFFF0777774F000000070F8
        8777F07777774000000070FFFF00007777777000000070F88707077777777000
        000070FFFF007777777770000000700000077777777770000000777777777777
        777770000000}
    end
    object SMDBGrid1: TSMDBGrid
      Left = 1
      Top = 48
      Width = 770
      Height = 148
      Align = alBottom
      DataSource = DMNotaFiscal.dsNotaFiscalImpAdicao
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 5
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
      RowCount = 2
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NumAdicao'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Adi'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CodFabricante'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo Fabricante'
          Width = 384
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorDescontoDI'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Desconto DI'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_DRAWBACK'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Drawback'
          Width = 111
          Visible = True
        end>
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 0
      Top = 24
      Width = 56
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      MaxLength = 3
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 553
      Top = 24
      Width = 114
      Height = 21
      MaxLength = 11
      TabOrder = 3
    end
  end
  object DBEdit3: TDBEdit
    Left = 260
    Top = 78
    Width = 181
    Height = 21
    DataField = 'NroFatura'
    DataSource = DMNotaFiscal.dsNotaFiscalImp
    TabOrder = 4
  end
  object RxDBComboBox1: TRxDBComboBox
    Left = 260
    Top = 104
    Width = 217
    Height = 21
    Style = csDropDownList
    Ctl3D = False
    DataField = 'TIPO_VIA_TRANSORTE'
    DataSource = DMNotaFiscal.dsNotaFiscalImp
    EnableValues = True
    ItemHeight = 13
    Items.Strings = (
      '1= Maritima'
      '2= Fluvial'
      '3= Lacustre'
      '4= Aerea'
      '5= Postal'
      '6= Ferroviaria'
      '7= Rodoviaria'
      '8= Conduto / Rede Transmissao'
      '9= Meios Proprios'
      '10= Entrada / Saida Ficta'
      '11= Courier            '
      '12= Handcarry')
    ParentCtl3D = False
    TabOrder = 5
    Values.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12')
    OnChange = RxDBComboBox1Change
  end
  object RxDBComboBox2: TRxDBComboBox
    Left = 260
    Top = 126
    Width = 217
    Height = 21
    Style = csDropDownList
    Ctl3D = False
    DataField = 'TIPO_INTERMEDIO'
    DataSource = DMNotaFiscal.dsNotaFiscalImp
    EnableValues = True
    ItemHeight = 13
    Items.Strings = (
      '1= Por conta pr'#243'pria'
      '2= Por conta e ordem'
      '3= Por encomenda')
    ParentCtl3D = False
    TabOrder = 7
    Values.Strings = (
      '1'
      '2'
      '3')
  end
  object DBEdit6: TDBEdit
    Left = 572
    Top = 104
    Width = 85
    Height = 21
    Ctl3D = True
    DataField = 'VLR_AFRMM'
    DataSource = DMNotaFiscal.dsNotaFiscalImp
    ParentCtl3D = False
    TabOrder = 6
    Visible = False
  end
  object gbxVendedor: TRzGroupBox
    Left = 40
    Top = 152
    Width = 540
    Height = 63
    Anchors = [akLeft, akTop, akRight]
    BorderColor = clNavy
    BorderInner = fsButtonUp
    BorderOuter = fsBump
    Caption = ' Desembara'#231'o aduaneiro '
    Color = clMoneyGreen
    Ctl3D = True
    FlatColor = clNavy
    FlatColorAdjustment = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 8
    VisualStyle = vsGradient
    object Label10: TLabel
      Left = 19
      Top = 23
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Local:'
    end
    object Label11: TLabel
      Left = 31
      Top = 45
      Width = 17
      Height = 13
      Alignment = taRightJustify
      Caption = 'UF:'
    end
    object Label4: TLabel
      Left = 235
      Top = 46
      Width = 110
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data do Desembara'#231'o:'
    end
    object DBEdit5: TDBEdit
      Left = 52
      Top = 15
      Width = 397
      Height = 21
      Ctl3D = True
      DataField = 'LOCAL_DESEMBARACO'
      DataSource = DMNotaFiscal.dsNotaFiscalImp
      ParentCtl3D = False
      TabOrder = 0
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 52
      Top = 38
      Width = 52
      Height = 20
      DropDownCount = 8
      Ctl3D = True
      DataField = 'UF'
      DataSource = DMNotaFiscal.dsNotaFiscalImp
      LookupField = 'Sigla'
      LookupDisplay = 'Sigla'
      LookupSource = DM1.dsUF
      ParentCtl3D = False
      TabOrder = 1
    end
    object DBDateEdit2: TDBDateEdit
      Left = 349
      Top = 38
      Width = 100
      Height = 21
      DataField = 'DataDesembaraco'
      DataSource = DMNotaFiscal.dsNotaFiscalImp
      NumGlyphs = 2
      TabOrder = 2
    end
  end
  object RzGroupBox1: TRzGroupBox
    Left = 40
    Top = 219
    Width = 538
    Height = 50
    Anchors = [akLeft, akTop, akRight]
    BorderColor = clNavy
    BorderInner = fsButtonUp
    BorderOuter = fsBump
    Caption = ' Adquirente ou Encomendante '
    Color = clMoneyGreen
    Ctl3D = True
    FlatColor = clNavy
    FlatColorAdjustment = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 9
    VisualStyle = vsGradient
    object Label15: TLabel
      Left = 130
      Top = 28
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'CNPJ:'
    end
    object Label16: TLabel
      Left = 31
      Top = 28
      Width = 17
      Height = 13
      Alignment = taRightJustify
      Caption = 'UF:'
    end
    object DBEdit7: TDBEdit
      Left = 164
      Top = 20
      Width = 221
      Height = 21
      Ctl3D = True
      DataField = 'CNPJ'
      DataSource = DMNotaFiscal.dsNotaFiscalImp
      ParentCtl3D = False
      TabOrder = 1
    end
    object RxDBLookupCombo3: TRxDBLookupCombo
      Left = 52
      Top = 20
      Width = 52
      Height = 21
      DropDownCount = 8
      Ctl3D = True
      DataField = 'UF_TERCEIRO'
      DataSource = DMNotaFiscal.dsNotaFiscalImp
      LookupField = 'Sigla'
      LookupDisplay = 'Sigla'
      LookupSource = DM1.dsUF
      ParentCtl3D = False
      TabOrder = 0
    end
  end
end
