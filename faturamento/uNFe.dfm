object fNFe: TfNFe
  Left = 434
  Top = 26
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Nota Eletr'#244'nica'
  ClientHeight = 629
  ClientWidth = 764
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 10
    Top = 10
    Width = 133
    Height = 13
    Caption = 'Endere'#231'o do Arquivo Texto:'
  end
  object Label1: TLabel
    Left = 31
    Top = 32
    Width = 112
    Height = 13
    Caption = 'Forma de Emiss'#227'o NFe:'
  end
  object Label2: TLabel
    Left = 96
    Top = 54
    Width = 47
    Height = 13
    Caption = 'Ambiente:'
  end
  object Label3: TLabel
    Left = 92
    Top = 76
    Width = 51
    Height = 13
    Caption = 'Finalidade:'
  end
  object Label4: TLabel
    Left = 39
    Top = 99
    Width = 104
    Height = 13
    Caption = 'Processo de Emiss'#227'o:'
  end
  object Label9: TLabel
    Left = 60
    Top = 121
    Width = 83
    Height = 13
    Caption = 'Tipo de Gera'#231#227'o:'
  end
  object Label15: TLabel
    Left = 316
    Top = 33
    Width = 131
    Height = 13
    Caption = 'Tipo de arquivo para Envio:'
    Visible = False
  end
  object lbErro: TLabel
    Left = 345
    Top = 131
    Width = 368
    Height = 23
    AutoSize = False
    Caption = 'Nota Denegada - Irregularidade Destinat'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Button1: TButton
    Left = 320
    Top = 56
    Width = 49
    Height = 25
    Caption = 'XML'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object DirectoryEdit1: TDirectoryEdit
    Left = 147
    Top = 2
    Width = 293
    Height = 21
    InitialDir = 'C:\'
    MultipleDirs = True
    NumGlyphs = 1
    TabOrder = 1
    Text = 'C:\'
  end
  object ComboBox1: TComboBox
    Left = 147
    Top = 24
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    Items.Strings = (
      'Normal'
      'Conting'#234'ncia FS'
      'Conting'#234'ncia SCAN'
      'Conting'#234'ncia FS-DA')
  end
  object ComboBox2: TComboBox
    Left = 147
    Top = 46
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 1
    TabOrder = 3
    Text = 'Homologa'#231#227'o'
    Items.Strings = (
      'Produ'#231#227'o'
      'Homologa'#231#227'o')
  end
  object ComboBox3: TComboBox
    Left = 147
    Top = 68
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    Items.Strings = (
      'NFe Normal'
      'NFe Complementar'
      'NFe de Ajuste'
      'NFe de Devolu'#231#227'o / Retorno')
  end
  object ComboBox4: TComboBox
    Left = 147
    Top = 90
    Width = 293
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 5
    Text = '0- Emiss'#227'o de NFe com aplicativo do contribuinte'
    Items.Strings = (
      '0- Emiss'#227'o de NFe com aplicativo do contribuinte'
      '1- Emiss'#227'o de NFe avulsa pelo fisco'
      
        '2- Emiss'#227'o de NFe avulsa, pelo contribuinte com seu certificado ' +
        'digital atrav'#233's do site do Fisco'
      
        '3- Emiss'#227'o NFe pelo contribuinte com aplicativo fornecido pelo F' +
        'isco')
  end
  object ComboBox5: TComboBox
    Left = 147
    Top = 112
    Width = 197
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 6
    Text = 'Gera direto'
    OnClick = ComboBox5Click
    Items.Strings = (
      'Gera direto'
      'Gera em arquivo texto'
      'Reenvio para valida'#231#227'o'
      'Reenvio do XML para o cliente')
  end
  object CheckBox1: TCheckBox
    Left = 464
    Top = 49
    Width = 97
    Height = 17
    Caption = 'Vers'#227'o Antiga'
    TabOrder = 7
    Visible = False
  end
  object CheckBox2: TCheckBox
    Left = 464
    Top = 63
    Width = 145
    Height = 17
    Caption = 'Enviar I18 (Importa'#231#227'o)'
    Checked = True
    State = cbChecked
    TabOrder = 8
    Visible = False
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 153
    Width = 764
    Height = 476
    ActivePage = tsEnvio
    Align = alBottom
    TabIndex = 0
    TabOrder = 9
    FixedDimension = 19
    object tsEnvio: TRzTabSheet
      Caption = 'Controle de Envio'
      DesignSize = (
        760
        453)
      object Label12: TLabel
        Left = 2
        Top = 345
        Width = 228
        Height = 13
        Caption = 'Endere'#231'o de grava'#231#227'o do arquivo (XML / TXT):'
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 760
        Height = 72
        Align = alTop
        Caption = 'Envio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label6: TLabel
          Left = 51
          Top = 14
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Caption = 'Recibo:'
        end
        object Label7: TLabel
          Left = 9
          Top = 30
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nro. Protocolo:'
        end
        object Label8: TLabel
          Left = 10
          Top = 46
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'Chave Acesso:'
        end
        object lbRecibo: TLabel
          Left = 98
          Top = 14
          Width = 352
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbNroProtocolo: TLabel
          Left = 98
          Top = 30
          Width = 352
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbChaveAcesso: TLabel
          Left = 98
          Top = 46
          Width = 352
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btEnviar: TButton
          Left = 534
          Top = 38
          Width = 89
          Height = 25
          Caption = '&Enviar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = False
          OnClick = btEnviarClick
        end
        object btDanfe: TButton
          Left = 623
          Top = 38
          Width = 89
          Height = 25
          Caption = '&DANFE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btDanfeClick
        end
        object btEnviarNovo: TButton
          Left = 534
          Top = 10
          Width = 89
          Height = 25
          Caption = 'Enviar Novo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btEnviarNovoClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 120
        Width = 760
        Height = 48
        Align = alTop
        Caption = 'Cancelamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label10: TLabel
          Left = 9
          Top = 16
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nro. Protocolo:'
        end
        object lbNroProtocoloCancelamento: TLabel
          Left = 100
          Top = 14
          Width = 413
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btCancelar: TBitBtn
          Left = 568
          Top = 16
          Width = 145
          Height = 25
          Caption = 'Cancelar Nota'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btCancelarClick
        end
      end
      object Edit1: TEdit
        Left = -1
        Top = 432
        Width = 714
        Height = 21
        TabStop = False
        Anchors = [akLeft, akBottom]
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 264
        Width = 760
        Height = 151
        Align = alTop
        Caption = ' Outras Op'#231#245'es '
        TabOrder = 3
        object Label13: TLabel
          Left = 71
          Top = 94
          Width = 57
          Height = 13
          Caption = 'Chave NFe:'
        end
        object Label17: TLabel
          Left = 8
          Top = 114
          Width = 120
          Height = 13
          Caption = 'C'#243'd.Barras Conting'#234'ncia:'
        end
        object Button5: TButton
          Left = 9
          Top = 49
          Width = 120
          Height = 25
          Caption = 'Gera Chave NFe'
          TabOrder = 0
          OnClick = Button5Click
        end
        object Button6: TButton
          Left = 129
          Top = 49
          Width = 120
          Height = 25
          Hint = 
            'Gera o c'#243'digo de barras adicional para emiss'#227'o da Danfe em conti' +
            'ng'#234'ncia'
          Caption = 'Gera C'#243'd. Barras'
          TabOrder = 1
          OnClick = Button6Click
        end
        object Button7: TButton
          Left = 249
          Top = 49
          Width = 120
          Height = 25
          Caption = 'Consultar NFe'
          TabOrder = 2
          OnClick = Button7Click
        end
        object btGravaNota: TButton
          Left = 369
          Top = 49
          Width = 120
          Height = 25
          Caption = 'Grava Chave na Nota'
          TabOrder = 3
          OnClick = btGravaNotaClick
        end
        object Button8: TButton
          Left = 489
          Top = 49
          Width = 120
          Height = 25
          Caption = 'Converter XML'
          TabOrder = 4
          OnClick = Button8Click
        end
        object edChaveNfe: TEdit
          Left = 131
          Top = 88
          Width = 480
          Height = 19
          Color = clBtnFace
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
        end
        object edCodBarras: TEdit
          Left = 131
          Top = 108
          Width = 480
          Height = 19
          Color = clBtnFace
          Ctl3D = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 6
        end
        object Button2: TButton
          Left = 9
          Top = 22
          Width = 120
          Height = 25
          Caption = 'Verifica WebService'
          TabOrder = 7
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 129
          Top = 22
          Width = 120
          Height = 25
          Caption = 'Verifica Contingencia'
          TabOrder = 8
          OnClick = Button3Click
        end
        object btConexao: TButton
          Left = 249
          Top = 22
          Width = 120
          Height = 25
          Caption = 'Verificar Internet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnClick = btConexaoClick
        end
        object btBuscarStatus: TButton
          Left = 489
          Top = 22
          Width = 120
          Height = 25
          Caption = 'Buscar Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          OnClick = btBuscarStatusClick
        end
        object btDownloadWeb: TButton
          Left = 369
          Top = 22
          Width = 120
          Height = 25
          Caption = 'Download Web'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          OnClick = btDownloadWebClick
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 168
        Width = 760
        Height = 48
        Align = alTop
        Caption = 'Inutilizar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object Label16: TLabel
          Left = 9
          Top = 16
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nro. Protocolo:'
        end
        object lbNroProtocoloInutil: TLabel
          Left = 100
          Top = 14
          Width = 413
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btInutilizar: TBitBtn
          Left = 568
          Top = 16
          Width = 145
          Height = 25
          Caption = 'Inutilizar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btInutilizarClick
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 72
        Width = 760
        Height = 48
        Align = alTop
        Caption = 'Conting'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object Label11: TLabel
          Left = 10
          Top = 16
          Width = 123
          Height = 13
          Alignment = taRightJustify
          Caption = 'C'#243'd.Barras Adicional:'
        end
        object lbCodBarraContingencia: TLabel
          Left = 138
          Top = 16
          Width = 382
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btContingencia: TBitBtn
          Left = 568
          Top = 16
          Width = 145
          Height = 25
          Caption = 'Gerar Conting'#234'ncia'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btContingenciaClick
        end
      end
      object GroupBox6: TGroupBox
        Left = 0
        Top = 216
        Width = 760
        Height = 48
        Align = alTop
        Caption = 'Carta Corre'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        object Label18: TLabel
          Left = 9
          Top = 16
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nro. Protocolo:'
        end
        object lbNroProtocoloCCe: TLabel
          Left = 100
          Top = 14
          Width = 413
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btCCe: TBitBtn
          Left = 568
          Top = 16
          Width = 145
          Height = 25
          Caption = 'Carta Corre'#231#227'o'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btCCeClick
        end
      end
    end
    object tsConfig: TRzTabSheet
      Caption = 'Configura'#231#227'o'
      object ckAnexarDanfe: TCheckBox
        Left = 512
        Top = 8
        Width = 97
        Height = 17
        Caption = 'Anexar Danfe'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object ckFilialNao: TCheckBox
        Left = 408
        Top = 32
        Width = 249
        Height = 17
        Caption = 'N'#227'o Possui Filial na Chave da Nota Fiscal'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object GroupBox7: TGroupBox
        Left = 16
        Top = 24
        Width = 209
        Height = 169
        Caption = ' Tipos de Email '
        TabOrder = 2
        object ckUsarOutlook: TCheckBox
          Left = 16
          Top = 24
          Width = 97
          Height = 17
          Caption = 'Usar Outlook'
          TabOrder = 0
        end
        object ckUsarPadrao: TCheckBox
          Left = 16
          Top = 48
          Width = 97
          Height = 17
          Caption = 'Usar Padr'#227'o'
          TabOrder = 1
        end
        object ckUsarJv: TCheckBox
          Left = 16
          Top = 72
          Width = 97
          Height = 17
          Caption = 'Usar JV Mail'
          TabOrder = 2
        end
        object ckUsarOutlookOLE: TCheckBox
          Left = 16
          Top = 96
          Width = 121
          Height = 17
          Caption = 'Usar Outlook (OLE)'
          TabOrder = 3
        end
        object ckEmailConfigurado: TCheckBox
          Left = 16
          Top = 120
          Width = 121
          Height = 17
          Caption = 'Usar NFeConfig'
          TabOrder = 4
        end
      end
    end
    object TabSheet1: TRzTabSheet
      Caption = 'XML'
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 760
        Height = 453
        Align = alClient
        Lines.Strings = (
          'Memo1')
        TabOrder = 0
      end
    end
  end
  object cbConvTxtXml: TComboBox
    Left = 451
    Top = 25
    Width = 94
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 10
    Text = 'TXT'
    Visible = False
    Items.Strings = (
      'TXT'
      'XML')
  end
  object CheckBox3: TCheckBox
    Left = 480
    Top = 96
    Width = 121
    Height = 17
    Caption = 'Usar Enviar Novo'
    Checked = True
    State = cbChecked
    TabOrder = 11
    OnClick = CheckBox3Click
  end
  object ComboBox6: TComboBox
    Left = 451
    Top = 1
    Width = 230
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 12
    Text = 'Danfe - Pelo NFeBD'
    Items.Strings = (
      'Danfe - Pelo NFeBD'
      'Danfe - Pelo XML (montar)'
      'Danfe - Pelo XML (gravado na pasta)')
  end
  object XMLDocument1: TXMLDocument
    Left = 32
    Top = 64
    DOMVendorDesc = 'MSXML'
  end
  object mItensNFe: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Filial'
        DataType = ftInteger
      end
      item
        Name = 'NumNota'
        DataType = ftInteger
      end
      item
        Name = 'ItemNota'
        DataType = ftInteger
      end
      item
        Name = 'CodProduto'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CodNatOper'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NomeProduto'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'Qtd'
        DataType = ftFloat
      end
      item
        Name = 'Unidade'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'VlrUnitario'
        DataType = ftFloat
      end
      item
        Name = 'VlrTotal'
        DataType = ftFloat
      end
      item
        Name = 'AliqIcms'
        DataType = ftFloat
      end
      item
        Name = 'AliqIpi'
        DataType = ftFloat
      end
      item
        Name = 'VlrIcms'
        DataType = ftFloat
      end
      item
        Name = 'VlrIpi'
        DataType = ftFloat
      end
      item
        Name = 'AliqSitTrib'
        DataType = ftFloat
      end
      item
        Name = 'ClasFiscalRed'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ClasFiscal'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'InfAdicionais'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'VlrDesconto'
        DataType = ftFloat
      end
      item
        Name = 'PercRedICMS'
        DataType = ftFloat
      end
      item
        Name = 'VlrBaseICMS'
        DataType = ftFloat
      end
      item
        Name = 'BaseICMS'
        DataType = ftFloat
      end
      item
        Name = 'CodCSTIPI'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TipoReg'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'AliqPis'
        DataType = ftFloat
      end
      item
        Name = 'AliqCofins'
        DataType = ftFloat
      end
      item
        Name = 'VlrPis'
        DataType = ftFloat
      end
      item
        Name = 'VlrCofins'
        DataType = ftFloat
      end
      item
        Name = 'IcmsBaseSubst'
        DataType = ftFloat
      end
      item
        Name = 'IcmsVlrSubst'
        DataType = ftFloat
      end
      item
        Name = 'CodPis'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CodCofins'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TipoPis'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TipoCofins'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CodSitTrib'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'PedidoCliente'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ItemPedido'
        DataType = ftInteger
      end
      item
        Name = 'VlrIcmsSimples'
        DataType = ftFloat
      end
      item
        Name = 'BaseIcmsSimples'
        DataType = ftFloat
      end
      item
        Name = 'MVA'
        DataType = ftFloat
      end
      item
        Name = 'SomaVlrTotalProd'
        DataType = ftBoolean
      end
      item
        Name = 'VlrFrete'
        DataType = ftFloat
      end
      item
        Name = 'VlrSeguro'
        DataType = ftFloat
      end
      item
        Name = 'VlrOutrasDespesas'
        DataType = ftFloat
      end
      item
        Name = 'CodBarra'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'VlrBaseImportacao'
        DataType = ftFloat
      end
      item
        Name = 'VlrImportacao'
        DataType = ftFloat
      end
      item
        Name = 'VlrIOF'
        DataType = ftFloat
      end
      item
        Name = 'VlrDespAduaneira'
        DataType = ftFloat
      end
      item
        Name = 'VlrTributos'
        DataType = ftFloat
      end
      item
        Name = 'VlrTributos_Federal'
        DataType = ftFloat
      end
      item
        Name = 'VlrTributos_Estadual'
        DataType = ftFloat
      end
      item
        Name = 'VlrTributos_Municipal'
        DataType = ftFloat
      end
      item
        Name = 'PercTributos_Federal'
        DataType = ftFloat
      end
      item
        Name = 'PercTributos_Estadual'
        DataType = ftFloat
      end
      item
        Name = 'PercTributos_Municipal'
        DataType = ftFloat
      end
      item
        Name = 'Fonte'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PercRedICMSSubst'
        DataType = ftFloat
      end
      item
        Name = 'VlrIcmsDesonerado'
        DataType = ftFloat
      end
      item
        Name = 'CodMotivoDesonerado'
        DataType = ftInteger
      end
      item
        Name = 'VlrIcmsOperacao'
        DataType = ftFloat
      end
      item
        Name = 'PercTribIcms'
        DataType = ftFloat
      end
      item
        Name = 'NCM_EX'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ItemOriginal'
        DataType = ftInteger
      end
      item
        Name = 'PercDiferimento'
        DataType = ftFloat
      end
      item
        Name = 'VlrIcmsDiferido'
        DataType = ftFloat
      end
      item
        Name = 'Cod_EnqIPI'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Perc_ICMS_FCP'
        DataType = ftFloat
      end
      item
        Name = 'Perc_ICMS_UF_Dest'
        DataType = ftFloat
      end
      item
        Name = 'Perc_ICMS_Partilha'
        DataType = ftFloat
      end
      item
        Name = 'Vlr_ICMS_FCP'
        DataType = ftFloat
      end
      item
        Name = 'Vlr_ICMS_UF_Dest'
        DataType = ftFloat
      end
      item
        Name = 'Vlr_ICMS_UF_Remet'
        DataType = ftFloat
      end
      item
        Name = 'QTD_TRIB'
        DataType = ftFloat
      end
      item
        Name = 'VLR_UNITARIO_TRIB'
        DataType = ftFloat
      end
      item
        Name = 'UNIDADE_TRIB'
        DataType = ftString
        Size = 6
      end>
    IndexDefs = <>
    IndexFieldNames = 'Filial;NumNota;ItemNota'
    Params = <>
    StoreDefs = True
    BeforePost = mItensNFeBeforePost
    OnNewRecord = mItensNFeNewRecord
    Left = 384
    Top = 264
    Data = {
      3C0700009619E0BD01000000180000004C0000000000030000003C070646696C
      69616C0400010000000000074E756D4E6F74610400010000000000084974656D
      4E6F746104000100000000000A436F6450726F6475746F010049000000010005
      57494454480200020008000A436F644E61744F70657201004900000001000557
      494454480200020004000B4E6F6D6550726F6475746F01004900000001000557
      4944544802000200780003517464080004000000000007556E69646164650100
      4900000001000557494454480200020003000B566C72556E69746172696F0800
      04000000000008566C72546F74616C080004000000000008416C697149636D73
      080004000000000007416C6971497069080004000000000007566C7249636D73
      080004000000000006566C7249706908000400000000000B416C697153697454
      72696208000400000000000D436C617346697363616C52656401004900000001
      000557494454480200020003000A436C617346697363616C0100490000000100
      055749445448020002000A000D496E6641646963696F6E61697304004B000000
      0200075355425459504502004900050054657874000557494454480200020001
      000B566C72446573636F6E746F08000400000000000B5065726352656449434D
      5308000400000000000B566C724261736549434D530800040000000000084261
      736549434D53080004000000000009436F644353544950490100490000000100
      055749445448020002000200075469706F526567010049000000010005574944
      544802000200010007416C697150697308000400000000000A416C6971436F66
      696E73080004000000000006566C72506973080004000000000009566C72436F
      66696E7308000400000000000D49636D73426173655375627374080004000000
      00000C49636D73566C725375627374080004000000000006436F645069730100
      49000000010005574944544802000200020009436F64436F66696E7301004900
      00000100055749445448020002000200075469706F5069730100490000000100
      0557494454480200020001000A5469706F436F66696E73010049000000010005
      57494454480200020001000A436F645369745472696201004900000001000557
      494454480200020004000D50656469646F436C69656E74650100490000000100
      055749445448020002000F000A4974656D50656469646F04000100000000000E
      566C7249636D7353696D706C657308000400000000000F4261736549636D7353
      696D706C65730800040000000000034D5641080004000000000010536F6D6156
      6C72546F74616C50726F64020003000000000008566C72467265746508000400
      0000000009566C7253656775726F080004000000000011566C724F7574726173
      4465737065736173080004000000000008436F64426172726101004900000001
      00055749445448020002000E0011566C7242617365496D706F72746163616F08
      000400000000000D566C72496D706F72746163616F080004000000000006566C
      72494F46080004000000000010566C7244657370416475616E65697261080004
      00000000000B566C725472696275746F73080004000000000013566C72547269
      6275746F735F4665646572616C080004000000000014566C725472696275746F
      735F457374616475616C080004000000000015566C725472696275746F735F4D
      756E69636970616C080004000000000014506572635472696275746F735F4665
      646572616C080004000000000015506572635472696275746F735F4573746164
      75616C080004000000000016506572635472696275746F735F4D756E69636970
      616C080004000000000005466F6E746501004900000001000557494454480200
      02001E00105065726352656449434D535375627374080004000000000011566C
      7249636D734465736F6E657261646F080004000000000013436F644D6F746976
      6F4465736F6E657261646F04000100000000000F566C7249636D734F70657261
      63616F08000400000000000C506572635472696249636D730800040000000000
      064E434D5F455801004900000001000557494454480200020003000C4974656D
      4F726967696E616C04000100000000000F506572634469666572696D656E746F
      08000400000000000F566C7249636D73446966657269646F0800040000000000
      0A436F645F456E7149504901004900000001000557494454480200020003000D
      506572635F49434D535F464350080004000000000011506572635F49434D535F
      55465F44657374080004000000000012506572635F49434D535F50617274696C
      686108000400000000000C566C725F49434D535F464350080004000000000010
      566C725F49434D535F55465F44657374080004000000000011566C725F49434D
      535F55465F52656D65740800040000000000085154445F545249420800040000
      00000011564C525F554E49544152494F5F5452494208000400000000000C554E
      49444144455F5452494201004900000001000557494454480200020006000000}
    object mItensNFeFilial: TIntegerField
      FieldName = 'Filial'
    end
    object mItensNFeNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mItensNFeItemNota: TIntegerField
      FieldName = 'ItemNota'
    end
    object mItensNFeCodProduto: TStringField
      FieldName = 'CodProduto'
      Size = 8
    end
    object mItensNFeCodNatOper: TStringField
      FieldName = 'CodNatOper'
      Size = 4
    end
    object mItensNFeNomeProduto: TStringField
      FieldName = 'NomeProduto'
      Size = 120
    end
    object mItensNFeQtd: TFloatField
      FieldName = 'Qtd'
    end
    object mItensNFeUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
    object mItensNFeVlrUnitario: TFloatField
      FieldName = 'VlrUnitario'
      DisplayFormat = '###,###,##0.00########'
    end
    object mItensNFeVlrTotal: TFloatField
      FieldName = 'VlrTotal'
      DisplayFormat = '###,###,##0.00'
    end
    object mItensNFeAliqIcms: TFloatField
      FieldName = 'AliqIcms'
    end
    object mItensNFeAliqIpi: TFloatField
      FieldName = 'AliqIpi'
    end
    object mItensNFeVlrIcms: TFloatField
      FieldName = 'VlrIcms'
      DisplayFormat = '###,###,##0.00'
    end
    object mItensNFeVlrIpi: TFloatField
      FieldName = 'VlrIpi'
      DisplayFormat = '###,###,##0.00'
    end
    object mItensNFeAliqSitTrib: TFloatField
      FieldName = 'AliqSitTrib'
    end
    object mItensNFeClasFiscalRed: TStringField
      FieldName = 'ClasFiscalRed'
      Size = 3
    end
    object mItensNFeClasFiscal: TStringField
      FieldName = 'ClasFiscal'
      Size = 10
    end
    object mItensNFeInfAdicionais: TMemoField
      FieldName = 'InfAdicionais'
      BlobType = ftMemo
      Size = 1
    end
    object mItensNFeVlrDesconto: TFloatField
      FieldName = 'VlrDesconto'
      DisplayFormat = '###,###,##0.00'
    end
    object mItensNFePercRedICMS: TFloatField
      FieldName = 'PercRedICMS'
    end
    object mItensNFeVlrBaseICMS: TFloatField
      FieldName = 'VlrBaseICMS'
      DisplayFormat = '###,###,##0.00'
    end
    object mItensNFeBaseICMS: TFloatField
      FieldName = 'BaseICMS'
      DisplayFormat = '###,###,##0.00'
    end
    object mItensNFeCodCSTIPI: TStringField
      FieldName = 'CodCSTIPI'
      Size = 2
    end
    object mItensNFeTipoReg: TStringField
      FieldName = 'TipoReg'
      Size = 1
    end
    object mItensNFeAliqPis: TFloatField
      FieldName = 'AliqPis'
    end
    object mItensNFeAliqCofins: TFloatField
      FieldName = 'AliqCofins'
    end
    object mItensNFeVlrPis: TFloatField
      FieldName = 'VlrPis'
      DisplayFormat = '###,###,##0.00'
    end
    object mItensNFeVlrCofins: TFloatField
      FieldName = 'VlrCofins'
      DisplayFormat = '###,###,##0.00'
    end
    object mItensNFeIcmsBaseSubst: TFloatField
      FieldName = 'IcmsBaseSubst'
    end
    object mItensNFeIcmsVlrSubst: TFloatField
      FieldName = 'IcmsVlrSubst'
    end
    object mItensNFeCodPis: TStringField
      FieldName = 'CodPis'
      Size = 2
    end
    object mItensNFeCodCofins: TStringField
      FieldName = 'CodCofins'
      Size = 2
    end
    object mItensNFeTipoPis: TStringField
      FieldName = 'TipoPis'
      Size = 1
    end
    object mItensNFeTipoCofins: TStringField
      FieldName = 'TipoCofins'
      Size = 1
    end
    object mItensNFeCodSitTrib: TStringField
      FieldName = 'CodSitTrib'
      Size = 4
    end
    object mItensNFePedidoCliente: TStringField
      FieldName = 'PedidoCliente'
      Size = 15
    end
    object mItensNFeItemPedido: TIntegerField
      FieldName = 'ItemPedido'
    end
    object mItensNFeVlrIcmsSimples: TFloatField
      FieldName = 'VlrIcmsSimples'
    end
    object mItensNFeBaseIcmsSimples: TFloatField
      FieldName = 'BaseIcmsSimples'
    end
    object mItensNFeMVA: TFloatField
      FieldName = 'MVA'
    end
    object mItensNFeSomaVlrTotalProd: TBooleanField
      FieldName = 'SomaVlrTotalProd'
    end
    object mItensNFeVlrFrete: TFloatField
      FieldName = 'VlrFrete'
    end
    object mItensNFeVlrSeguro: TFloatField
      FieldName = 'VlrSeguro'
    end
    object mItensNFeVlrOutrasDespesas: TFloatField
      FieldName = 'VlrOutrasDespesas'
    end
    object mItensNFeCodBarra: TStringField
      FieldName = 'CodBarra'
      Size = 14
    end
    object mItensNFeVlrBaseImportacao: TFloatField
      FieldName = 'VlrBaseImportacao'
    end
    object mItensNFeVlrImportacao: TFloatField
      FieldName = 'VlrImportacao'
    end
    object mItensNFeVlrIOF: TFloatField
      FieldName = 'VlrIOF'
    end
    object mItensNFeVlrDespAduaneira: TFloatField
      FieldName = 'VlrDespAduaneira'
    end
    object mItensNFeVlrTributos: TFloatField
      FieldName = 'VlrTributos'
    end
    object mItensNFeVlrTributos_Federal: TFloatField
      FieldName = 'VlrTributos_Federal'
    end
    object mItensNFeVlrTributos_Estadual: TFloatField
      FieldName = 'VlrTributos_Estadual'
    end
    object mItensNFeVlrTributos_Municipal: TFloatField
      FieldName = 'VlrTributos_Municipal'
    end
    object mItensNFePercTributos_Federal: TFloatField
      FieldName = 'PercTributos_Federal'
    end
    object mItensNFePercTributos_Estadual: TFloatField
      FieldName = 'PercTributos_Estadual'
    end
    object mItensNFePercTributos_Municipal: TFloatField
      FieldName = 'PercTributos_Municipal'
    end
    object mItensNFeFonte: TStringField
      FieldName = 'Fonte'
      Size = 30
    end
    object mItensNFePercRedICMSSubst: TFloatField
      FieldName = 'PercRedICMSSubst'
    end
    object mItensNFeVlrIcmsDesonerado: TFloatField
      FieldName = 'VlrIcmsDesonerado'
    end
    object mItensNFeCodMotivoDesonerado: TIntegerField
      FieldName = 'CodMotivoDesonerado'
    end
    object mItensNFeVlrIcmsOperacao: TFloatField
      FieldName = 'VlrIcmsOperacao'
    end
    object mItensNFePercTribIcms: TFloatField
      FieldName = 'PercTribIcms'
    end
    object mItensNFeNCM_EX: TStringField
      FieldName = 'NCM_EX'
      Size = 3
    end
    object mItensNFeItemOriginal: TIntegerField
      FieldName = 'ItemOriginal'
    end
    object mItensNFePercDiferimento: TFloatField
      FieldName = 'PercDiferimento'
    end
    object mItensNFeVlrIcmsDiferido: TFloatField
      FieldName = 'VlrIcmsDiferido'
    end
    object mItensNFeCod_EnqIPI: TStringField
      FieldName = 'Cod_EnqIPI'
      Size = 3
    end
    object mItensNFePerc_ICMS_FCP: TFloatField
      FieldName = 'Perc_ICMS_FCP'
    end
    object mItensNFePerc_ICMS_UF_Dest: TFloatField
      FieldName = 'Perc_ICMS_UF_Dest'
    end
    object mItensNFePerc_ICMS_Partilha: TFloatField
      FieldName = 'Perc_ICMS_Partilha'
    end
    object mItensNFeVlr_ICMS_FCP: TFloatField
      FieldName = 'Vlr_ICMS_FCP'
    end
    object mItensNFeVlr_ICMS_UF_Dest: TFloatField
      FieldName = 'Vlr_ICMS_UF_Dest'
    end
    object mItensNFeVlr_ICMS_UF_Remet: TFloatField
      FieldName = 'Vlr_ICMS_UF_Remet'
    end
    object mItensNFeQTD_TRIB: TFloatField
      FieldName = 'QTD_TRIB'
    end
    object mItensNFeVLR_UNITARIO_TRIB: TFloatField
      FieldName = 'VLR_UNITARIO_TRIB'
    end
    object mItensNFeUNIDADE_TRIB: TStringField
      FieldName = 'UNIDADE_TRIB'
      Size = 6
    end
  end
  object TCPClient: TIdTCPClient
    IOHandler = IOHandlerSocket
    MaxLineAction = maException
    ReadTimeout = 0
    Host = 'localhost'
    Port = 7001
    Left = 472
    Top = 313
  end
  object IOHandlerSocket: TIdIOHandlerSocket
    Left = 504
    Top = 313
  end
  object dsmiItensNFe: TDataSource
    DataSet = mItensNFe
    Left = 416
    Top = 264
  end
  object mDadosAdicionaisNFe: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Filial'
        DataType = ftInteger
      end
      item
        Name = 'NumNota'
        DataType = ftInteger
      end
      item
        Name = 'Obs'
        DataType = ftMemo
        Size = 10
      end
      item
        Name = 'ObsAux'
        DataType = ftMemo
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforePost = mDadosAdicionaisNFeBeforePost
    Left = 320
    Top = 264
    Data = {
      920000009619E0BD01000000180000000400000000000300000092000646696C
      69616C0400010000000000074E756D4E6F74610400010000000000034F627304
      004B000000020007535542545950450200490005005465787400055749445448
      020002000A00064F627341757804004B00000002000753554254595045020049
      0005005465787400055749445448020002000A000000}
    object mDadosAdicionaisNFeFilial: TIntegerField
      FieldName = 'Filial'
    end
    object mDadosAdicionaisNFeNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mDadosAdicionaisNFeObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 10
    end
    object mDadosAdicionaisNFeObsAux: TMemoField
      FieldName = 'ObsAux'
      BlobType = ftMemo
      Size = 10
    end
  end
  object mAuxDadosNFe: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'Tipo'
    Params = <>
    StoreDefs = True
    Left = 352
    Top = 264
    Data = {
      640000009619E0BD010000001800000002000000000003000000640004546970
      6F010049000000010005574944544802000200030006436F6469676F01004900
      0000010005574944544802000200070001000D44454641554C545F4F52444552
      0200820000000000}
    object mAuxDadosNFeTipo: TStringField
      FieldName = 'Tipo'
      Size = 3
    end
    object mAuxDadosNFeCodigo: TStringField
      FieldName = 'Codigo'
      Size = 7
    end
  end
  object mNotaDevolvidaNFe: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Item'
        DataType = ftInteger
      end
      item
        Name = 'NumNota'
        DataType = ftInteger
      end
      item
        Name = 'ParcialTotal'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Qtd'
        DataType = ftFloat
      end
      item
        Name = 'Unidade'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CodForn'
        DataType = ftInteger
      end
      item
        Name = 'NomeForn'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Triangular'
        DataType = ftBoolean
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'CodUF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Serie'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Modelo'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NFeChaveAcesso'
        DataType = ftString
        Size = 44
      end
      item
        Name = 'CupomNumECF'
        DataType = ftInteger
      end
      item
        Name = 'CupomNumCOO'
        DataType = ftInteger
      end
      item
        Name = 'CupomModelo'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'AnoEmissao'
        DataType = ftInteger
      end
      item
        Name = 'MesEmissao'
        DataType = ftInteger
      end
      item
        Name = 'IE'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'CTeChaveAcesso'
        DataType = ftString
        Size = 44
      end>
    IndexDefs = <>
    IndexFieldNames = 'Tipo;Item'
    Params = <>
    StoreDefs = True
    OnNewRecord = mNotaDevolvidaNFeNewRecord
    Left = 288
    Top = 264
    Data = {
      0C0200009619E0BD0100000018000000150000000000030000000C0204546970
      6F0100490000000100055749445448020002000300044974656D040001000000
      0000074E756D4E6F746104000100000000000C5061726369616C546F74616C01
      0049000000010005574944544802000200010003517464080004000000000007
      556E6964616465010049000000010005574944544802000200030007436F6446
      6F726E0400010000000000084E6F6D65466F726E010049000000010005574944
      54480200020028000A547269616E67756C6172020003000000000004434E504A
      010049000000010005574944544802000200120005436F645546010049000000
      0100055749445448020002000200055365726965010049000000010005574944
      5448020002000300064D6F64656C6F0100490000000100055749445448020002
      0003000E4E4665436861766541636573736F0100490000000100055749445448
      020002002C000B4375706F6D4E756D45434604000100000000000B4375706F6D
      4E756D434F4F04000100000000000B4375706F6D4D6F64656C6F010049000000
      01000557494454480200020002000A416E6F456D697373616F04000100000000
      000A4D6573456D697373616F0400010000000000024945010049000000010005
      5749445448020002000E000E435465436861766541636573736F010049000000
      0100055749445448020002002C000000}
    object mNotaDevolvidaNFeTipo: TStringField
      FieldName = 'Tipo'
      Size = 3
    end
    object mNotaDevolvidaNFeItem: TIntegerField
      FieldName = 'Item'
    end
    object mNotaDevolvidaNFeNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mNotaDevolvidaNFeParcialTotal: TStringField
      FieldName = 'ParcialTotal'
      Size = 1
    end
    object mNotaDevolvidaNFeQtd: TFloatField
      FieldName = 'Qtd'
    end
    object mNotaDevolvidaNFeUnidade: TStringField
      FieldName = 'Unidade'
      Size = 3
    end
    object mNotaDevolvidaNFeCodForn: TIntegerField
      FieldName = 'CodForn'
    end
    object mNotaDevolvidaNFeNomeForn: TStringField
      FieldName = 'NomeForn'
      Size = 40
    end
    object mNotaDevolvidaNFeTriangular: TBooleanField
      FieldName = 'Triangular'
    end
    object mNotaDevolvidaNFeCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object mNotaDevolvidaNFeCodUF: TStringField
      FieldName = 'CodUF'
      Size = 2
    end
    object mNotaDevolvidaNFeSerie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object mNotaDevolvidaNFeModelo: TStringField
      FieldName = 'Modelo'
      Size = 3
    end
    object mNotaDevolvidaNFeNFeChaveAcesso: TStringField
      FieldName = 'NFeChaveAcesso'
      Size = 44
    end
    object mNotaDevolvidaNFeCupomNumECF: TIntegerField
      FieldName = 'CupomNumECF'
    end
    object mNotaDevolvidaNFeCupomNumCOO: TIntegerField
      FieldName = 'CupomNumCOO'
    end
    object mNotaDevolvidaNFeCupomModelo: TStringField
      FieldName = 'CupomModelo'
      Size = 2
    end
    object mNotaDevolvidaNFeAnoEmissao: TIntegerField
      FieldName = 'AnoEmissao'
    end
    object mNotaDevolvidaNFeMesEmissao: TIntegerField
      FieldName = 'MesEmissao'
    end
    object mNotaDevolvidaNFeIE: TStringField
      FieldName = 'IE'
      Size = 14
    end
    object mNotaDevolvidaNFeCTeChaveAcesso: TStringField
      FieldName = 'CTeChaveAcesso'
      Size = 44
    end
  end
  object RzSendMessage1: TRzSendMessage
    Left = 440
    Top = 313
  end
  object OpenDialog: TOpenDialog
    Filter = 'Arquivo XML|*.xml'
    Title = 'Selecione o arquivo xml para converter'
    Left = 536
    Top = 313
  end
  object MailMessage: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 568
    Top = 315
  end
  object SMTP: TIdSMTP
    IOHandler = IdSSLIOHandlerSocket1
    MaxLineAction = maException
    ReadTimeout = 1000
    Port = 25
    AuthenticationType = atLogin
    Left = 600
    Top = 315
  end
  object AttachmentDialog: TOpenDialog
    Options = [ofReadOnly, ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 361
    Top = 316
  end
  object IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket
    SSLOptions.Method = sslvSSLv2
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 633
    Top = 315
  end
  object mParcelaNFe: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NumNota'
        DataType = ftInteger
      end
      item
        Name = 'Parcela'
        DataType = ftInteger
      end
      item
        Name = 'Valor'
        DataType = ftFloat
      end
      item
        Name = 'DtVencimento'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    IndexFieldNames = 'NumNota;Parcela'
    Params = <>
    StoreDefs = True
    Left = 464
    Top = 264
    Data = {
      690000009619E0BD0100000018000000040000000000030000006900074E756D
      4E6F746104000100000000000750617263656C6104000100000000000556616C
      6F7208000400000000000C447456656E63696D656E746F010049000000010005
      5749445448020002000F000000}
    object mParcelaNFeNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mParcelaNFeParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object mParcelaNFeValor: TFloatField
      FieldName = 'Valor'
    end
    object mParcelaNFeDtVencimento: TStringField
      FieldName = 'DtVencimento'
      Size = 15
    end
  end
  object JvMail1: TJvMail
    BlindCopy = <>
    CarbonCopy = <>
    Recipient = <>
    Left = 416
    Top = 313
  end
  object qNotaAux: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'Select Filial, Serie, NumNota'
      'From dbNotaFiscal.db'
      'Where Filial = :Filial'
      '    and Serie = :Serie'
      '    and NumNota = :NumNota')
    Left = 552
    Top = 19
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Serie'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NumNota'
        ParamType = ptUnknown
      end>
    object qNotaAuxFilial: TIntegerField
      FieldName = 'Filial'
    end
    object qNotaAuxSerie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object qNotaAuxNumNota: TIntegerField
      FieldName = 'NumNota'
    end
  end
  object qIcmsPartilha: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ANO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT T.ano, T.perc_destino'
      'FROM TAB_PARTILHA_ICMS T'
      'WHERE T.ANO = :ANO')
    SQLConnection = dmDatabase.scoDados
    Left = 240
    Top = 320
    object qIcmsPartilhaANO: TIntegerField
      FieldName = 'ANO'
      Required = True
    end
    object qIcmsPartilhaPERC_DESTINO: TFloatField
      FieldName = 'PERC_DESTINO'
    end
  end
  object qTPag: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT SUM(NP.VlrVenc) VLR_VENCIMENTO, TP.Cod_Imp_Fiscal'
      'FROM dbNotaFiscalParc.db NP'
      'LEFT JOIN dbTipoCobranca TP'
      'ON NP.CodTipoCobr = TP.Codigo'
      'where NP.FILIAL = :FILIAL'
      '  and NP.NumSeq = :NumSeq'
      'GROUP BY TP.cod_imp_fiscal')
    Left = 280
    Top = 159
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NumSeq'
        ParamType = ptInput
      end>
    object qTPagVLR_VENCIMENTO: TFloatField
      FieldName = 'VLR_VENCIMENTO'
    end
    object qTPagCod_Imp_Fiscal: TStringField
      FieldName = 'Cod_Imp_Fiscal'
      Size = 2
    end
  end
  object qsTPag: TDataSource
    DataSet = qTPag
    Left = 304
    Top = 159
  end
end
