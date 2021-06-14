object fBcoItau: TfBcoItau
  Left = 414
  Top = 207
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ita'#250' (CNAB 400)'
  ClientHeight = 336
  ClientWidth = 477
  Color = clBtnFace
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 477
    Height = 336
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 475
      Height = 31
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object BitBtn3: TBitBtn
        Left = 361
        Top = 3
        Width = 85
        Height = 25
        Hint = 'Fecha a janela atual'
        Caption = '&Fechar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn3Click
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F0000000CE0E0000D80E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777000077777777777777777777000077778787878780E0787700007778
          7878787870E60787000077700000000780E66007000077777777770870E66077
          000077777777770000E66077000077777770070770E66077000077777770E007
          70E06077000077700000EE0770E6607700007770EEEEEE6070E6607700007770
          0000E60770E66077000077777770600770E66077000077777770070770E66077
          0000777777777707770E607700007777777777077770E0770000777777777700
          0000007700007777777777777777777700007777777777777777777700007777
          77777777777777770000}
      end
      object BitBtn5: TBitBtn
        Left = 276
        Top = 3
        Width = 85
        Height = 25
        Hint = 'Confirma as altera'#231#245'es abaixo'
        Cancel = True
        Caption = '&Confirmar'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BitBtn5Click
        Glyph.Data = {
          CE070000424DCE07000000000000360000002800000024000000120000000100
          18000000000098070000CE0E0000D80E00000000000000000000008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080FFFFFF008080008080008080008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8080000080000000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080808080808080FFFFFF
          FFFFFF0080800080800080800080800080800080800080800080800080800080
          8000808000808000808080000000800000800080000000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          808080808080808080808080FFFFFFFFFFFF0080800080800080800080800080
          8000808000808000808000808000808000808080000000800000800000800000
          8000800000008080008080008080008080008080008080008080008080008080
          008080008080008080808080808080808080808080808080808080FFFFFFFFFF
          FF00808000808000808000808000808000808000808000808000808080000000
          8000008000008000008000008000008000800000008080008080008080008080
          0080800080800080800080800080800080808080808080808080808080808080
          80808080808080808080808080FFFFFF00808000808000808000808000808000
          808000808080000000800000800000800000FF00008000008000008000008000
          8000000080800080800080800080800080800080800080800080808080808080
          80808080808080FFFFFF808080808080808080808080808080FFFFFF00808000
          808000808000808000808000808000808000800000800000800000FF00008080
          00FF000080000080000080008000000080800080800080800080800080800080
          80008080008080808080808080808080FFFFFF008080FFFFFF80808080808080
          8080808080FFFFFFFFFFFF00808000808000808000808000808000808000FF00
          00800000FF0000808000808000808000FF000080000080000080008000000080
          80008080008080008080008080008080008080808080808080FFFFFF00808000
          8080008080FFFFFF808080808080808080808080FFFFFFFFFFFF008080008080
          00808000808000808000808000FF0000808000808000808000808000808000FF
          0000800000800000800080000000808000808000808000808000808000808000
          8080FFFFFF008080008080008080008080008080FFFFFF808080808080808080
          808080FFFFFFFFFFFF0080800080800080800080800080800080800080800080
          8000808000808000808000808000FF0000800000800000800080000000808000
          8080008080008080008080008080008080008080008080008080008080008080
          008080FFFFFF808080808080808080808080FFFFFFFFFFFF0080800080800080
          8000808000808000808000808000808000808000808000808000808000FF0000
          8000008000008000800000008080008080008080008080008080008080008080
          008080008080008080008080008080008080FFFFFF8080808080808080808080
          80FFFFFF00808000808000808000808000808000808000808000808000808000
          808000808000808000808000FF00008000008000008000800000008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          80FFFFFF808080808080808080808080FFFFFF00808000808000808000808000
          808000808000808000808000808000808000808000808000808000FF00008000
          0080000080008000000080800080800080800080800080800080800080800080
          80008080008080008080008080008080FFFFFF808080808080808080808080FF
          FFFF008080008080008080008080008080008080008080008080008080008080
          00808000808000808000FF000080000080008000000080800080800080800080
          80008080008080008080008080008080008080008080008080008080008080FF
          FFFF808080808080808080008080008080008080008080008080008080008080
          00808000808000808000808000808000808000808000808000FF000080000080
          0000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080FFFFFF808080808080008080008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000FF0000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080FFFFFF
          0080800080800080800080800080800080800080800080800080800080800080
          8000808000808000808000808000808000808000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          008080008080008080008080008080008080}
        NumGlyphs = 2
      end
      object BitBtn4: TBitBtn
        Left = 191
        Top = 3
        Width = 85
        Height = 25
        Hint = 'Abre a tela de boletos'
        Caption = '&Boletos'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BitBtn4Click
        Glyph.Data = {
          76030000424D7603000000000000360000002800000011000000100000000100
          18000000000040030000C30E0000C30E00000000000000000000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000000000000000000000
          00000000000000BFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBF7F0000BFBFBF
          BFBFBFBFBFBF000000000000000000000000000000000000000000000000BFBF
          BF00BFBFBFBFBFBFBFBFBFBFBFBF7F00007F0000BFBFBFBFBFBF000000007F7F
          007F7F007F7F007F7F007F7F00000000000000000000BFBFBF7F00007F00007F
          00007F00007F00007F0000BFBFBF000000000000000000000000000000000000
          000000007F7F00000000BFBFBFBFBFBFBFBFBFBFBFBF7F00007F0000BFBFBFBF
          BFBF000000FFFFFFBFBFBFFFFFFFBFBFBFFFFFFFBFBFBF00000000000000BFBF
          BFBFBFBFBFBFBFBFBFBF7F0000BFBFBFBFBFBFBFBFBF00000000000000000000
          0000000000000000BFBFBF7F7F7F00000000BFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
          0000BFBFBF00BFBFBFBFBFBFBFBFBF000000000000000000000000000000BFBF
          BF000000FFFFFF7F7F7F7F7F7FFFFFFF000000BFBFBFBFBFBF00BFBFBFBFBFBF
          BFBFBF000000FFFFFFFFFFFFFFFFFF000000BFBFBFBFBFBF000000FFFFFFFFFF
          FFFFFFFFFFFFFF000000BFBFBF00BFBFBF000000000000000000000000000000
          FFFFFF000000BFBFBFBFBFBFBFBFBF000000000000000000000000000000BFBF
          BF00BFBFBF000000FFFFFFFFFFFFFFFFFF000000FFFFFF000000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFF7F
          7F7FFFFFFF000000000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBF00BFBFBF000000FFFFFF7F7F7FFFFFFF000000000000BF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBF
          BF000000FFFFFFFFFFFF000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00BFBFBF0000000000000000000000
          00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00}
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 32
      Width = 475
      Height = 303
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Label3: TLabel
        Left = 57
        Top = 13
        Width = 78
        Height = 13
        Caption = 'Tipo de Carteira:'
      end
      object Label5: TLabel
        Left = 38
        Top = 56
        Width = 97
        Height = 13
        Caption = 'Esp'#233'cie documento:'
      end
      object Label6: TLabel
        Left = 62
        Top = 125
        Width = 73
        Height = 13
        Caption = 'C'#243'd. do Aceite:'
      end
      object Label10: TLabel
        Left = 251
        Top = 147
        Width = 138
        Height = 13
        Caption = 'Vlr/% Juros por dia de atraso:'
      end
      object Label13: TLabel
        Left = 304
        Top = 125
        Width = 77
        Height = 13
        Caption = 'Dias p/Protesto:'
      end
      object Label14: TLabel
        Left = 37
        Top = 255
        Width = 98
        Height = 13
        Caption = 'Caminho do Arquivo:'
      end
      object Label15: TLabel
        Left = 50
        Top = 277
        Width = 85
        Height = 13
        Caption = 'Nome do Arquivo:'
      end
      object Label16: TLabel
        Left = 273
        Top = 277
        Width = 101
        Height = 13
        Caption = 'Extens'#227'o do Arquivo:'
      end
      object Label2: TLabel
        Left = 80
        Top = 35
        Width = 55
        Height = 13
        Caption = 'Ocorr'#234'ncia:'
      end
      object Label19: TLabel
        Left = 299
        Top = 169
        Width = 90
        Height = 13
        Caption = 'Vlr/% do desconto:'
      end
      object Label20: TLabel
        Left = 49
        Top = 169
        Width = 86
        Height = 13
        Caption = 'Tipo de desconto:'
      end
      object Label21: TLabel
        Left = 71
        Top = 147
        Width = 64
        Height = 13
        Caption = 'Tipo de juros:'
      end
      object Bevel1: TBevel
        Left = 0
        Top = 243
        Width = 475
        Height = 2
        Shape = bsTopLine
        Style = bsRaised
      end
      object Label9: TLabel
        Left = 57
        Top = 79
        Width = 78
        Height = 13
        Caption = 'Inst.Cobran'#231'a 1:'
      end
      object Label12: TLabel
        Left = 57
        Top = 102
        Width = 78
        Height = 13
        Caption = 'Inst.Cobran'#231'a 2:'
      end
      object Label4: TLabel
        Left = 322
        Top = 193
        Width = 67
        Height = 13
        Caption = '% Taxa Multa:'
      end
      object Label1: TLabel
        Left = 57
        Top = 217
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr. Taxa Boleto:'
        Visible = False
      end
      object RxDBComboBox1: TRxDBComboBox
        Left = 137
        Top = 5
        Width = 326
        Height = 21
        Style = csDropDownList
        DataField = 'NumCarteira'
        DataSource = DMBanco.dsBcoItau
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          '112 - ESCRITURAL ELETR'#212'NICA - SIMPLES / CONTRATUAL'
          '109 - DIRETA ELETR'#212'NICA SEM EMISS'#195'O - SIMPLES'
          '175 - SEM REGISTRO SEM EMISS'#195'O')
        TabOrder = 0
        Values.Strings = (
          '112'
          '109'
          '175')
      end
      object RxDBComboBox3: TRxDBComboBox
        Left = 137
        Top = 48
        Width = 326
        Height = 21
        Style = csDropDownList
        DataField = 'EspecieDoc'
        DataSource = DMBanco.dsBcoItau
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Duplicata mercantil'
          'Nota Promiss'#243'ria'
          'Nota de Seguro'
          'Mensalidade escolar'
          'Recibo'
          'Contrato'
          'Cosseguros'
          'Duplicata de Servi'#231'o'
          'Letra de C'#226'mbio'
          'Nota de D'#233'bitos'
          'DIVERSOs')
        TabOrder = 2
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
          '13'
          '99')
      end
      object RxDBComboBox4: TRxDBComboBox
        Left = 137
        Top = 117
        Width = 97
        Height = 21
        Style = csDropDownList
        DataField = 'Aceite'
        DataSource = DMBanco.dsBcoItau
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 3
        Values.Strings = (
          'A'
          'N')
      end
      object DBEdit3: TDBEdit
        Left = 394
        Top = 139
        Width = 69
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VlrJurosPorDia'
        DataSource = DMBanco.dsBcoItau
        TabOrder = 6
      end
      object DBEdit6: TDBEdit
        Left = 394
        Top = 117
        Width = 69
        Height = 21
        CharCase = ecUpperCase
        DataField = 'DiasProtesto'
        DataSource = DMBanco.dsBcoItau
        TabOrder = 4
      end
      object DirectoryEdit1: TDirectoryEdit
        Left = 137
        Top = 247
        Width = 299
        Height = 21
        NumGlyphs = 1
        TabOrder = 10
        Text = 'DirectoryEdit1'
      end
      object DBEdit7: TDBEdit
        Left = 137
        Top = 269
        Width = 128
        Height = 21
        Color = clInfoBk
        DataField = 'Nome'
        DataSource = DMBanco.dsBcoItau
        ReadOnly = True
        TabOrder = 11
        OnKeyDown = DBEdit7KeyDown
      end
      object DBEdit8: TDBEdit
        Left = 377
        Top = 269
        Width = 57
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Extensao'
        DataSource = DMBanco.dsBcoItau
        TabOrder = 12
      end
      object RxDBComboBox8: TRxDBComboBox
        Left = 137
        Top = 27
        Width = 326
        Height = 21
        Style = csDropDownList
        DataField = 'Instrucao'
        DataSource = DMBanco.dsBcoItau
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Remessa'
          'Pedido de Baixa'
          'Concess'#227'o de Abatimento (   indicador 12.5) '
          'Cancelamento de Abatimento'
          'Altera'#231#227'o do vencimento '
          'Altera'#231#227'o do Uso da Empresa'
          'Altera'#231#227'o do Seu N'#250'mero '
          'Protestar'
          'N'#227'o protestar '
          'Sustar o Protesto '
          'Altera'#231#227'o de outros dados '
          'Baixa por ter sido pago diretamente ao cedente'
          'cancelamento de instru'#231#227'o'
          'Protesto Urgente '
          'altera'#231#227'o do vencimento e sustar protesto'
          'CEDENTE N'#195'O CONCORDA COM ALEGA'#199#195'O DO SACADO'
          'CEDENTE SOLICITA DISPENSA DE JUROS')
        TabOrder = 1
        Values.Strings = (
          '01'
          '02'
          '04'
          '05'
          '06'
          '07'
          '08'
          '09'
          '10'
          '18'
          '31'
          '34'
          '35'
          '36'
          '37'
          '38'
          '47')
      end
      object DBEdit2: TDBEdit
        Left = 394
        Top = 161
        Width = 69
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VlrDesconto'
        DataSource = DMBanco.dsBcoItau
        TabOrder = 8
      end
      object RxDBComboBox11: TRxDBComboBox
        Left = 137
        Top = 161
        Width = 106
        Height = 21
        Style = csDropDownList
        DataField = 'TipoDesconto'
        DataSource = DMBanco.dsBcoItau
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Valor'
          'Percentual')
        TabOrder = 7
        Values.Strings = (
          'A'
          'B')
      end
      object RxDBComboBox12: TRxDBComboBox
        Left = 137
        Top = 139
        Width = 106
        Height = 21
        Style = csDropDownList
        DataField = 'TipoJuro'
        DataSource = DMBanco.dsBcoItau
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Valor'
          'Percentual')
        TabOrder = 5
        Values.Strings = (
          'A'
          'B')
      end
      object RxDBComboBox2: TRxDBComboBox
        Left = 137
        Top = 71
        Width = 326
        Height = 21
        Style = csDropDownList
        DataField = 'InstrCobranca1'
        DataSource = DMBanco.dsBcoItau
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Devolver  ap'#243's 05 dias do Vencimento'
          'Devolver  ap'#243's 30 dias do Vencimento'
          'Receber conforme instru'#231#245'es no pr'#243'prio t'#237'tulo'
          'Devolver  ap'#243's 10 dias do Vencimento'
          'Devolver  ap'#243's 15 dias do Vencimento'
          'Devolver  ap'#243's 20 dias do Vencimento'
          'Protestar'
          'N'#227'o protestar '
          'Devolver  ap'#243's 25 dias do Vencimento'
          'Devolver  ap'#243's 35 dias do Vencimento'
          'Devolver  ap'#243's 40 dias do Vencimento'
          'Devolver  ap'#243's 45 dias do Vencimento'
          'Devolver  ap'#243's 50 dias do Vencimento'
          'Devolver  ap'#243's 55 dias do Vencimento'
          'Devolver  ap'#243's 60 dias do Vencimento'
          'Devolver  ap'#243's 90 dias do Vencimento'
          'N'#227'o Receber ap'#243's 05 dias do vencimento'
          'N'#227'o Receber ap'#243's 10 dias do vencimento'
          'N'#227'o Receber ap'#243's 15 dias do vencimento'
          'N'#227'o Receber ap'#243's 20 dias do vencimento'
          'N'#227'o Receber ap'#243's 25 dias do vencimento'
          'N'#227'o Receber ap'#243's 30 dias do vencimento'
          'N'#227'o Receber ap'#243's 35 dias do vencimento'
          'N'#227'o Receber ap'#243's 40 dias do vencimento'
          'N'#227'o Receber ap'#243's 45 dias do vencimento'
          'N'#227'o Receber ap'#243's 50 dias do vencimento'
          'N'#227'o Receber ap'#243's 55 dias do vencimento'
          'Import'#226'ncia de desconto por dia'
          'N'#227'o Receber ap'#243's 60 dias do vencimento'
          'N'#227'o Receber ap'#243's 90 dias do vencimento'
          'Protesto Urgente '
          'Receber at'#233' o '#250'ltimo dia do m'#234's de vencimento'
          'Conceder desconto mesmo ap'#243's vencimento'
          'N'#227'o Receber ap'#243's o vencimento'
          'Conceder desconto conforme Nota de Cr'#233'dito'
          'Sujeito a protesto se n'#227'o for pago no vencimento'
          'Import'#226'ncia por dia de atraso a partir de '
          'Tem dia da Gra'#231'a'
          'uso do banco'
          'DISPENSAR JUROS/COMISS'#195'O DE PERMAN'#202'NCIA'
          'RECEBER SOMENTE COM A PARCELA ANTERIOR QUITADA'
          'favor efetuar pgto  somente atrav'#233's desta cobran'#231'a banc'#225'ria'
          'USO DO BANCO'
          'ap'#243's vencimento pag'#225'vel somente na empresa'
          'uso do banco'
          'somar valor do t'#237'tulo ao valor do campo mora/multa caso exista'
          'DEVOLVER AP'#211'S 365 DIAS DE VENCIDO'
          
            'COBRAN'#199'A NEGOCIADA. PAG'#193'VEL SOMENTE POR ESTE BLOQUETO NA REDE BA' +
            'NC'#193'RIA'
          'uso do banco'
          'VALOR DA IDA ENGLOBA MULTA DE 10% PRO RATA'
          
            'Cobrar juros ap'#243's 15 dias da emiss'#227'o (para t'#237'tulos com venciment' +
            'o '#224' vista)'
          
            'PAGAMENTO EM CHEQUE: SOMENTE RECEBER COM CHEQUE DE EMISS'#195'O DO SA' +
            'CADO'
          'protestar ap'#243's xx dias corridos do vencimento'
          'protestar ap'#243's xx DIAS '#250'teis do vencimento'
          'OPERA'#199#195'O REF A VENDOR'
          'Ap'#243's vencimento consultar a Ag'#234'ncia cedente'
          
            'Antes do Vencimento ou ap'#243's 15 dias, pag'#225'vel SOMENTE em nossa se' +
            'de'
          'uso do banco'
          'N'#227'o receber antes do Vencimento'
          'uso do banco'
          'No vencimento pag'#225'vel em qualquer ag'#234'ncia banc'#225'ria'
          'N'#227'o receber ap'#243's xx dias do vencimento'
          'Devolver ap'#243's xx dias do vencimento'
          'Mensagens nos bloquetos com 30 posi'#231#245'es'
          'Mensagens nos bloquetos com 40 posi'#231#245'es'
          'uso do banco'
          'Duplicata / Fatura N'#186)
        TabOrder = 13
        Values.Strings = (
          '02'
          '03'
          '05'
          '06'
          '07'
          '08'
          '09'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25'
          '26'
          '27'
          '28'
          '29'
          '30'
          '31'
          '32'
          '36'
          '37'
          '38'
          '39'
          '40'
          '43'
          '44'
          '45'
          '46'
          '47'
          '51'
          '52'
          '53'
          '54'
          '56'
          '57'
          '58'
          '59'
          '70'
          '78'
          '79'
          '80'
          '81'
          '82'
          '83'
          '84'
          '86'
          '87'
          '88'
          '89'
          '90'
          '91'
          '92'
          '93'
          '94'
          '95'
          '98')
      end
      object RxDBComboBox5: TRxDBComboBox
        Left = 137
        Top = 94
        Width = 326
        Height = 21
        Style = csDropDownList
        DataField = 'InstrCobranca2'
        DataSource = DMBanco.dsBcoItau
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Devolver  ap'#243's 05 dias do Vencimento'
          'Devolver  ap'#243's 30 dias do Vencimento'
          'Receber conforme instru'#231#245'es no pr'#243'prio t'#237'tulo'
          'Devolver  ap'#243's 10 dias do Vencimento'
          'Devolver  ap'#243's 15 dias do Vencimento'
          'Devolver  ap'#243's 20 dias do Vencimento'
          'Protestar'
          'N'#227'o protestar '
          'Devolver  ap'#243's 25 dias do Vencimento'
          'Devolver  ap'#243's 35 dias do Vencimento'
          'Devolver  ap'#243's 40 dias do Vencimento'
          'Devolver  ap'#243's 45 dias do Vencimento'
          'Devolver  ap'#243's 50 dias do Vencimento'
          'Devolver  ap'#243's 55 dias do Vencimento'
          'Devolver  ap'#243's 60 dias do Vencimento'
          'Devolver  ap'#243's 90 dias do Vencimento'
          'N'#227'o Receber ap'#243's 05 dias do vencimento'
          'N'#227'o Receber ap'#243's 10 dias do vencimento'
          'N'#227'o Receber ap'#243's 15 dias do vencimento'
          'N'#227'o Receber ap'#243's 20 dias do vencimento'
          'N'#227'o Receber ap'#243's 25 dias do vencimento'
          'N'#227'o Receber ap'#243's 30 dias do vencimento'
          'N'#227'o Receber ap'#243's 35 dias do vencimento'
          'N'#227'o Receber ap'#243's 40 dias do vencimento'
          'N'#227'o Receber ap'#243's 45 dias do vencimento'
          'N'#227'o Receber ap'#243's 50 dias do vencimento'
          'N'#227'o Receber ap'#243's 55 dias do vencimento'
          'Import'#226'ncia de desconto por dia'
          'N'#227'o Receber ap'#243's 60 dias do vencimento'
          'N'#227'o Receber ap'#243's 90 dias do vencimento'
          'Protesto Urgente '
          'Receber at'#233' o '#250'ltimo dia do m'#234's de vencimento'
          'Conceder desconto mesmo ap'#243's vencimento'
          'N'#227'o Receber ap'#243's o vencimento'
          'Conceder desconto conforme Nota de Cr'#233'dito'
          'Sujeito a protesto se n'#227'o for pago no vencimento'
          'Import'#226'ncia por dia de atraso a partir de '
          'Tem dia da Gra'#231'a'
          'uso do banco'
          'DISPENSAR JUROS/COMISS'#195'O DE PERMAN'#202'NCIA'
          'RECEBER SOMENTE COM A PARCELA ANTERIOR QUITADA'
          'favor efetuar pgto  somente atrav'#233's desta cobran'#231'a banc'#225'ria'
          'USO DO BANCO'
          'ap'#243's vencimento pag'#225'vel somente na empresa'
          'uso do banco'
          'somar valor do t'#237'tulo ao valor do campo mora/multa caso exista'
          'DEVOLVER AP'#211'S 365 DIAS DE VENCIDO'
          
            'COBRAN'#199'A NEGOCIADA. PAG'#193'VEL SOMENTE POR ESTE BLOQUETO NA REDE BA' +
            'NC'#193'RIA'
          'uso do banco'
          'VALOR DA IDA ENGLOBA MULTA DE 10% PRO RATA'
          
            'Cobrar juros ap'#243's 15 dias da emiss'#227'o (para t'#237'tulos com venciment' +
            'o '#224' vista)'
          
            'PAGAMENTO EM CHEQUE: SOMENTE RECEBER COM CHEQUE DE EMISS'#195'O DO SA' +
            'CADO'
          'protestar ap'#243's xx dias corridos do vencimento'
          'protestar ap'#243's xx DIAS '#250'teis do vencimento'
          'OPERA'#199#195'O REF A VENDOR'
          'Ap'#243's vencimento consultar a Ag'#234'ncia cedente'
          
            'Antes do Vencimento ou ap'#243's 15 dias, pag'#225'vel SOMENTE em nossa se' +
            'de'
          'uso do banco'
          'N'#227'o receber antes do Vencimento'
          'uso do banco'
          'No vencimento pag'#225'vel em qualquer ag'#234'ncia banc'#225'ria'
          'N'#227'o receber ap'#243's xx dias do vencimento'
          'Devolver ap'#243's xx dias do vencimento'
          'Mensagens nos bloquetos com 30 posi'#231#245'es'
          'Mensagens nos bloquetos com 40 posi'#231#245'es'
          'uso do banco'
          'Duplicata / Fatura N'#186)
        TabOrder = 14
        Values.Strings = (
          '02'
          '03'
          '05'
          '06'
          '07'
          '08'
          '09'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25'
          '26'
          '27'
          '28'
          '29'
          '30'
          '31'
          '32'
          '36'
          '37'
          '38'
          '39'
          '40'
          '43'
          '44'
          '45'
          '46'
          '47'
          '51'
          '52'
          '53'
          '54'
          '56'
          '57'
          '58'
          '59'
          '70'
          '78'
          '79'
          '80'
          '81'
          '82'
          '83'
          '84'
          '86'
          '87'
          '88'
          '89'
          '90'
          '91'
          '92'
          '93'
          '94'
          '95'
          '98')
      end
      object DBEdit4: TDBEdit
        Left = 394
        Top = 185
        Width = 69
        Height = 21
        CharCase = ecUpperCase
        DataField = 'TaxaMulta'
        DataSource = DMBanco.dsBcoItau
        TabOrder = 9
      end
      object DBEdit1: TDBEdit
        Left = 137
        Top = 209
        Width = 69
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VlrTaxaBoleto'
        DataSource = DMBanco.dsBcoItau
        TabOrder = 15
        Visible = False
      end
    end
  end
end
