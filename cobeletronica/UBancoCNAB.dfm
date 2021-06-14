object fBancoCNAB: TfBancoCNAB
  Left = 141
  Top = 146
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o para o arquivo de remessa'
  ClientHeight = 374
  ClientWidth = 723
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 39
    Align = alTop
    TabOrder = 0
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
      Left = 81
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
    Width = 723
    Height = 335
    Align = alClient
    TabOrder = 1
    object Label5: TLabel
      Left = 503
      Top = 35
      Width = 97
      Height = 13
      Caption = 'N'#186' Conta/Cendente:'
      Visible = False
    end
    object Label6: TLabel
      Left = 71
      Top = 125
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Carteira:'
    end
    object Label7: TLabel
      Left = 27
      Top = 191
      Width = 83
      Height = 13
      Alignment = taRightJustify
      Caption = 'Esp'#233'cie do t'#237'tulo:'
    end
    object Label8: TLabel
      Left = 77
      Top = 213
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Aceite:'
    end
    object Label10: TLabel
      Left = 67
      Top = 235
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr Juros:'
    end
    object Label13: TLabel
      Left = 20
      Top = 278
      Width = 90
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dias para Protesto:'
    end
    object Label14: TLabel
      Left = 14
      Top = 310
      Width = 98
      Height = 13
      Caption = 'Caminho do Arquivo:'
    end
    object Label19: TLabel
      Left = 250
      Top = 257
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. Abatimento:'
    end
    object Bevel1: TBevel
      Left = -51
      Top = 298
      Width = 765
      Height = 2
      Shape = bsTopLine
      Style = bsRaised
    end
    object Label11: TLabel
      Left = 50
      Top = 81
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = '1'#186' Instru'#231#227'o:'
    end
    object Label18: TLabel
      Left = 37
      Top = 169
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Cobran'#231'a:'
    end
    object Label22: TLabel
      Left = 197
      Top = 235
      Width = 127
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Limite para desconto:'
    end
    object Label9: TLabel
      Left = 47
      Top = 59
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Conv'#234'nio:'
    end
    object Label32: TLabel
      Left = 288
      Top = 213
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Moeda:'
    end
    object Label12: TLabel
      Left = 581
      Top = 313
      Width = 62
      Height = 13
      Caption = 'N'#186' Remessa:'
    end
    object Label15: TLabel
      Left = 62
      Top = 146
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Comando:'
    end
    object Label16: TLabel
      Left = 50
      Top = 103
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = '2'#186' Instru'#231#227'o:'
    end
    object Label17: TLabel
      Left = 72
      Top = 257
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. IOF:'
    end
    object Label20: TLabel
      Left = 449
      Top = 81
      Width = 99
      Height = 13
      Alignment = taRightJustify
      Caption = 'Varia'#231#227'o da Carteira:'
    end
    object Label21: TLabel
      Left = 457
      Top = 129
      Width = 85
      Height = 52
      Alignment = taRightJustify
      Caption = 
        'Tipo de Cobran'#231'a'#13#10'que vai gravar no'#13#10'contas a receber'#13#10'(interno)' +
        ':'
    end
    object DBEdit5: TDBEdit
      Left = 601
      Top = 27
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODCEDENTE'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      MaxLength = 5
      ReadOnly = True
      TabOrder = 0
      Visible = False
    end
    object RxDBComboBox1: TRxDBComboBox
      Left = 112
      Top = 117
      Width = 326
      Height = 21
      Style = csDropDownList
      DataField = 'NUMCARTEIRA'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      EnableValues = True
      ItemHeight = 13
      Items.Strings = (
        '11 = Cobran'#231'a Simples'
        '12 = Cobran'#231'a Indexada'
        '17 = Cobran'#231'a Direta Especial'
        '31 = Cobran'#231'a Vinculada'
        '51 = Cobran'#231'a Descontada')
      TabOrder = 1
      Values.Strings = (
        '11'
        '12'
        '17'
        '31'
        '51')
    end
    object RxDBComboBox3: TRxDBComboBox
      Left = 112
      Top = 183
      Width = 326
      Height = 21
      Style = csDropDownList
      DataField = 'ESPECIEDOC'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      EnableValues = True
      ItemHeight = 13
      Items.Strings = (
        '01 = Duplicata mercantil'
        '02 = Nota promiss'#243'ria'
        '03 = Nota de seguro'
        '05 = Recibo'
        '08 = Letra de c'#226'mbio'
        '09 = Warrant'
        '10 = Cheque'
        '12 = Duplicata de servi'#231'o'
        '13 = Nota de d'#233'bito'
        '15 = Ap'#243'lice de seguro'
        '21 = Duplicata rural'
        '25 = Divida ativa da Uni'#227'o'
        '26 = Divida ativa de Estado'
        '27 = Divida ativa de Mun'#237'cipio')
      TabOrder = 2
      Values.Strings = (
        '01'
        '02'
        '03'
        '05'
        '08'
        '09'
        '10'
        '12'
        '13'
        '15'
        '21'
        '25'
        '26'
        '27')
    end
    object RxDBComboBox4: TRxDBComboBox
      Left = 112
      Top = 205
      Width = 90
      Height = 21
      Style = csDropDownList
      DataField = 'ACEITE'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      EnableValues = True
      ItemHeight = 13
      Items.Strings = (
        'Aceite'
        'N'#227'o Aceite')
      TabOrder = 3
      Values.Strings = (
        'A'
        'N')
    end
    object DBEdit6: TDBEdit
      Left = 112
      Top = 227
      Width = 69
      Height = 21
      CharCase = ecUpperCase
      DataField = 'VLRJUROSPORDIA'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 112
      Top = 270
      Width = 69
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DIASPROTESTO'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      TabOrder = 5
    end
    object DirectoryEdit1: TDirectoryEdit
      Left = 114
      Top = 304
      Width = 299
      Height = 21
      NumGlyphs = 1
      TabOrder = 6
      Text = 'DirectoryEdit1'
    end
    object DBEdit8: TDBEdit
      Left = 326
      Top = 249
      Width = 69
      Height = 21
      CharCase = ecUpperCase
      DataField = 'VLRDESCONTO'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      TabOrder = 7
    end
    object RxDBComboBox6: TRxDBComboBox
      Left = 112
      Top = 73
      Width = 326
      Height = 21
      Style = csDropDownList
      DataField = 'INSTRUCAO'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      EnableValues = True
      ItemHeight = 13
      Items.Strings = (
        '00 = Aus'#234'ncia de intru'#231#245'es'
        '01 = Cobrar juros'
        '03 = Protestar no terceiro dia '#250'til ap'#243's vencido'
        '04 = Protestar no quarto dia '#250'til ap'#243's vencido'
        '05 = Protestar no quinto dia '#250'til ap'#243's vencido'
        '06 = Protesto em dias corridos'
        '07 = N'#227'o Protestar'
        '10 = Protestar no 10'#186' dia corrido ap'#243's vencido'
        '15 = Protestar no 15'#186' dia corrido ap'#243's vencido'
        '20 = Protestar no 20'#186' dia corrido ap'#243's vencido'
        '22 = Conceder desconto s'#243' at'#233' a data estipulada'
        '25 = Protestar no 25'#186' dia corrido ap'#243's vencido'
        '30 = Protestar no 30'#186' dia corrido ap'#243's vencido'
        '45 = Protestar no 45'#186' dia corrido ap'#243's vencido'
        '42 = Devolver'
        '44 = Baixar'
        '46 = Entregar ao sacado franco de pagamento'
        ''
        '')
      TabOrder = 8
      Values.Strings = (
        '00'
        '01'
        '03'
        '04'
        '05'
        '06'
        '07'
        '10'
        '15'
        '20'
        '22'
        '25'
        '30'
        '45'
        '42'
        '44'
        '46')
    end
    object RxDBComboBox9: TRxDBComboBox
      Left = 112
      Top = 161
      Width = 326
      Height = 21
      Style = csDropDownList
      DataField = 'TIPODOCUMENTO'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      EnableValues = True
      ItemHeight = 13
      Items.Strings = (
        'Brancos'
        '04DSC = Solicita'#231#227'o de registro como cobran'#231'a Descontada'
        '08VDR = Solicita'#231#227'o de registro como cobran'#231'a Vendor'
        '02VIN = Solicita'#231#227'o de registro como cobran'#231'a Vinculada')
      TabOrder = 9
      Values.Strings = (
        '     '
        '04DSC'
        '08VDR'
        '02VIN')
    end
    object DBEdit9: TDBEdit
      Left = 112
      Top = 51
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODTRANSMISSAO'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      MaxLength = 9
      TabOrder = 10
    end
    object RxDBComboBox14: TRxDBComboBox
      Left = 326
      Top = 205
      Width = 113
      Height = 21
      Style = csDropDownList
      DataField = 'MOEDA'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      EnableValues = True
      ItemHeight = 13
      Items.Strings = (
        '1 = FAJTR'
        '2 = DOLAR'
        '3 = EURO'
        '4 = IENE'
        '5 = MARCO ALEMAO'
        '6 = FTR'
        '7 = IDTR')
      TabOrder = 11
      Values.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7')
    end
    object DBEdit10: TDBEdit
      Left = 326
      Top = 227
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DTLIMITEDESCONTO'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      MaxLength = 6
      TabOrder = 12
    end
    object DBEdit11: TDBEdit
      Left = 645
      Top = 305
      Width = 69
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      Color = clInfoBk
      DataField = 'NUMREMESSA'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      ReadOnly = True
      TabOrder = 13
    end
    object RxDBComboBox2: TRxDBComboBox
      Left = 112
      Top = 138
      Width = 326
      Height = 21
      Style = csDropDownList
      DataField = 'CODCOMANDO'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      EnableValues = True
      ItemHeight = 13
      Items.Strings = (
        '01 = Registro de t'#237'tulos'
        '02 = Solicita'#231#227'o de baixa'
        '03 = Pedido de debito em conta'
        '04 = Concess'#227'o de abatimento'
        '05 = Cancelamento de abatimento'
        '06 = Altera'#231#227'o de vcto. de t'#237'tulo'
        '07 = Altera'#231#227'o do n'#250'mero de controle do participante'
        '08 = Altera'#231#227'o do n'#250'mero do t'#237'tulo dado pelo cedente'
        '09 = Instru'#231#227'o para protestar'
        '10 = Instru'#231#227'o para sustar protesto'
        '11 = Instru'#231#227'o para dispensar juros'
        '12 = Altera'#231#227'o de nome e endere'#231'o do sacado'
        '16 = Altera'#231#227'o de juros mora'
        '31 = Conceder desconto'
        '32 = N'#227'o conceder desconto'
        '33 = Retificar desconto'
        '34 = Alterar data para desconto'
        '35 = Cobrar multa'
        '36 = Dispensar multa'
        '37 = Dispensar indexador'
        '38 = Dispensar prazo limite de recebimento'
        '39 = Alterar prazo limite de recebimento'
        '40 = Alterar modalidade de cobran'#231'a')
      TabOrder = 14
      Values.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12'
        '16'
        '31'
        '32'
        '33'
        '34'
        '35'
        '36'
        '37'
        '38'
        '39'
        '40')
    end
    object RxDBComboBox7: TRxDBComboBox
      Left = 112
      Top = 95
      Width = 326
      Height = 21
      Style = csDropDownList
      DataField = 'INSTRUCAO2'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      EnableValues = True
      ItemHeight = 13
      Items.Strings = (
        '00 = Aus'#234'ncia de intru'#231#245'es'
        '01 = Cobrar juros'
        '03 = Protestar no terceiro dia '#250'til ap'#243's vencido'
        '04 = Protestar no quarto dia '#250'til ap'#243's vencido'
        '05 = Protestar no quinto dia '#250'til ap'#243's vencido'
        '06 = Protesto em dias corridos'
        '07 = N'#227'o Protestar'
        '10 = Protestar no 10'#186' dia corrido ap'#243's vencido'
        '15 = Protestar no 15'#186' dia corrido ap'#243's vencido'
        '20 = Protestar no 20'#186' dia corrido ap'#243's vencido'
        '22 = Conceder desconto s'#243' at'#233' a data estipulada'
        '25 = Protestar no 25'#186' dia corrido ap'#243's vencido'
        '30 = Protestar no 30'#186' dia corrido ap'#243's vencido'
        '45 = Protestar no 45'#186' dia corrido ap'#243's vencido'
        '42 = Devolver'
        '44 = Baixar'
        '46 = Entregar ao sacado franco de pagamento'
        ''
        '')
      TabOrder = 15
      Values.Strings = (
        '00'
        '01'
        '03'
        '04'
        '05'
        '06'
        '07'
        '10'
        '15'
        '20'
        '22'
        '25'
        '30'
        '45'
        '42'
        '44'
        '46')
    end
    object DBEdit12: TDBEdit
      Left = 112
      Top = 249
      Width = 69
      Height = 21
      CharCase = ecUpperCase
      DataField = 'VLRIOF'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      TabOrder = 16
    end
    object DBEdit13: TDBEdit
      Left = 550
      Top = 73
      Width = 69
      Height = 21
      CharCase = ecUpperCase
      DataField = 'VARIACAOCARTEIRA'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      TabOrder = 17
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 545
      Top = 144
      Width = 177
      Height = 21
      DropDownCount = 8
      DataField = 'CODTIPOCOBRANCA'
      DataSource = DMBanco_CNAB.dsBanco_CNAB
      LookupField = 'Codigo'
      LookupDisplay = 'Nome'
      LookupSource = DM1.dsTipoCobranca
      TabOrder = 18
    end
  end
end
