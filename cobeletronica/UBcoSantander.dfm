object fBcoSantander: TfBcoSantander
  Left = 10
  Top = 61
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Santander (CNAB 240)'
  ClientHeight = 430
  ClientWidth = 767
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 430
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 765
      Height = 31
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object BitBtn3: TBitBtn
        Left = 673
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
        Left = 588
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
        Left = 503
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
      Width = 765
      Height = 397
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 763
        Height = 395
        Align = alClient
        TabOrder = 0
        object Label3: TLabel
          Left = 46
          Top = 82
          Width = 88
          Height = 13
          Caption = 'Tipo de Cobran'#231'a:'
        end
        object Label5: TLabel
          Left = 51
          Top = 148
          Width = 83
          Height = 13
          Caption = 'Esp'#233'cie do t'#237'tulo:'
        end
        object Label6: TLabel
          Left = 524
          Top = 148
          Width = 33
          Height = 13
          Caption = 'Aceite:'
        end
        object Label10: TLabel
          Left = 501
          Top = 170
          Width = 56
          Height = 13
          Caption = 'Vlr/% Juros:'
        end
        object Label13: TLabel
          Left = 467
          Top = 258
          Width = 90
          Height = 13
          Caption = 'Dias para Protesto:'
        end
        object Label14: TLabel
          Left = 37
          Top = 373
          Width = 98
          Height = 13
          Caption = 'Caminho do Arquivo:'
        end
        object Label2: TLabel
          Left = 27
          Top = 38
          Width = 107
          Height = 13
          Caption = 'C'#243'd.na compensa'#231#227'o:'
        end
        object Label19: TLabel
          Left = 467
          Top = 191
          Width = 90
          Height = 13
          Caption = 'Vlr/% do desconto:'
        end
        object Label20: TLabel
          Left = 48
          Top = 191
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo de desconto:'
        end
        object Label21: TLabel
          Left = 29
          Top = 170
          Width = 105
          Height = 13
          Caption = 'Tipo de juros de mora:'
        end
        object Bevel1: TBevel
          Left = -3
          Top = 361
          Width = 765
          Height = 2
          Shape = bsTopLine
          Style = bsRaised
        end
        object Label4: TLabel
          Left = 12
          Top = 344
          Width = 122
          Height = 13
          Caption = 'Vlr.do IOF a ser recolhido:'
        end
        object Label11: TLabel
          Left = 54
          Top = 60
          Width = 80
          Height = 13
          Caption = 'C'#243'd. Movimento:'
        end
        object Label17: TLabel
          Left = 13
          Top = 104
          Width = 121
          Height = 13
          Caption = 'Forma de Cadastramento:'
        end
        object Label18: TLabel
          Left = 52
          Top = 126
          Width = 82
          Height = 13
          Caption = 'Tipo Documento:'
        end
        object Label22: TLabel
          Left = 633
          Top = 187
          Width = 26
          Height = 13
          Caption = 'Data:'
        end
        object Label23: TLabel
          Left = 67
          Top = 258
          Width = 67
          Height = 13
          Caption = 'C'#243'd. Protesto:'
        end
        object Label24: TLabel
          Left = 26
          Top = 280
          Width = 108
          Height = 13
          Caption = 'C'#243'd.Baixa/Devolu'#231#227'o:'
        end
        object Label9: TLabel
          Left = 51
          Top = 16
          Width = 84
          Height = 13
          Caption = 'C'#243'd.Transmiss'#227'o:'
        end
        object Label12: TLabel
          Left = 620
          Top = 373
          Width = 62
          Height = 13
          Caption = 'N'#186' Remessa:'
        end
        object Label15: TLabel
          Left = 481
          Top = 281
          Width = 76
          Height = 13
          Caption = 'Dias para baixa:'
        end
        object Label16: TLabel
          Left = 467
          Top = 213
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vlr/% do desconto:'
        end
        object Label25: TLabel
          Left = 39
          Top = 213
          Width = 95
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo de desconto 2:'
        end
        object Label26: TLabel
          Left = 633
          Top = 209
          Width = 26
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data:'
        end
        object Label27: TLabel
          Left = 500
          Top = 235
          Width = 57
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vlr/% Multa:'
        end
        object Label28: TLabel
          Left = 66
          Top = 235
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo da Multa:'
        end
        object Label29: TLabel
          Left = 633
          Top = 231
          Width = 26
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data:'
        end
        object Label30: TLabel
          Left = 70
          Top = 302
          Width = 64
          Height = 13
          Caption = 'Mensagem 1:'
        end
        object Label31: TLabel
          Left = 70
          Top = 323
          Width = 64
          Height = 13
          Caption = 'Mensagem 2:'
        end
        object RxDBComboBox1: TRxDBComboBox
          Left = 136
          Top = 74
          Width = 326
          Height = 21
          Style = csDropDownList
          DataField = 'NumCarteira'
          DataSource = DM1.dsBcoSantander
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '1 = Cobran'#231'a Simples (Sem Registro e Eletr'#244'nica com Registro)'
            
              '3 = Cobran'#231'a Caucionada (Eletr'#244'nica com Registro e Convencional ' +
              'com Registro)'
            '5 = Cobran'#231'a Simples (R'#225'pida com Registro)'
            '6 = Cobran'#231'a Caucionada (R'#225'pida com Registro)')
          TabOrder = 3
          Values.Strings = (
            '1'
            '3'
            '5'
            '6')
        end
        object RxDBComboBox3: TRxDBComboBox
          Left = 136
          Top = 140
          Width = 326
          Height = 21
          Style = csDropDownList
          DataField = 'EspecieDoc'
          DataSource = DM1.dsBcoSantander
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '02 = Duplicata mercantil'
            '04 = Duplicata de Servi'#231'o'
            '07 = Letra de C'#226'mbio (Somente para Banco 353)'
            '30 = Letra de C'#226'mbio (Somente para Banco 008)'
            '12 = Nota Promiss'#243'ria'
            '13 = Nota Promiss'#243'ria Rural'
            '17 = Recibo'
            '20 = Ap'#243'lice de Seguro'
            '97 = Cheque'
            '98 = Nota Promiss'#243'ria Direta')
          TabOrder = 6
          Values.Strings = (
            '02'
            '04'
            '07'
            '30'
            '12'
            '13'
            '17'
            '20'
            '97'
            '98')
        end
        object RxDBComboBox4: TRxDBComboBox
          Left = 559
          Top = 140
          Width = 90
          Height = 21
          Style = csDropDownList
          DataField = 'Aceite'
          DataSource = DM1.dsBcoSantander
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Aceite'
            'N'#227'o Aceite')
          TabOrder = 7
          Values.Strings = (
            'A'
            'N')
        end
        object DBEdit3: TDBEdit
          Left = 559
          Top = 162
          Width = 69
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VlrJurosPorDia'
          DataSource = DM1.dsBcoSantander
          TabOrder = 9
        end
        object DBEdit6: TDBEdit
          Left = 559
          Top = 250
          Width = 69
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DiasProtesto'
          DataSource = DM1.dsBcoSantander
          TabOrder = 20
        end
        object DirectoryEdit1: TDirectoryEdit
          Left = 137
          Top = 367
          Width = 299
          Height = 21
          NumGlyphs = 1
          TabOrder = 27
          Text = 'DirectoryEdit1'
        end
        object RxDBComboBox8: TRxDBComboBox
          Left = 136
          Top = 30
          Width = 326
          Height = 21
          Style = csDropDownList
          DataField = 'CodCompensacao'
          DataSource = DM1.dsBcoSantander
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '008'
            '033'
            '353')
          TabOrder = 1
          Values.Strings = (
            '008'
            '033'
            '353')
        end
        object DBEdit2: TDBEdit
          Left = 559
          Top = 183
          Width = 69
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VlrDesconto'
          DataSource = DM1.dsBcoSantander
          TabOrder = 11
        end
        object RxDBComboBox11: TRxDBComboBox
          Left = 136
          Top = 183
          Width = 325
          Height = 21
          Style = csDropDownList
          DataField = 'TipoDesconto'
          DataSource = DM1.dsBcoSantander
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '0 = Isento'
            '1 = Valor fixo at'#233' a data informada'
            '2 = Percentual at'#233' a data informada'
            '3 = Valor por antecipa'#231#227'o por dia corrido'
            '4 = Valor por antecipa'#231#227'o dia '#250'til')
          TabOrder = 10
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4')
        end
        object RxDBComboBox12: TRxDBComboBox
          Left = 136
          Top = 162
          Width = 325
          Height = 21
          Style = csDropDownList
          DataField = 'TipoJuro'
          DataSource = DM1.dsBcoSantander
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '1 = Valor por dia'
            '2 = Taxa Mensal'
            '3 = Isento'
            '4 = Utilizar comiss'#227'o perman'#234'ncia do Banco por dia de atraso'
            '5 = Toler'#226'ncia valor por dia (cobrar juros a partir de)'
            '6 = Toler'#226'ncia taxa mensal (cobrar juros a partir de)')
          TabOrder = 8
          Values.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6')
        end
        object DBEdit4: TDBEdit
          Left = 136
          Top = 336
          Width = 69
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VlrIOF'
          DataSource = DM1.dsBcoSantander
          TabOrder = 25
        end
        object RxDBComboBox6: TRxDBComboBox
          Left = 136
          Top = 52
          Width = 326
          Height = 21
          Style = csDropDownList
          DataField = 'Instrucao'
          DataSource = DM1.dsBcoSantander
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '01 = Entrada de t'#237'tulo'
            '02 = Pedido de baixa'
            '04 = Concess'#227'o de abatimento'
            '05 = Cancelamento de abatimento'
            '06 = Altera'#231#227'o de vencimento'
            '07 = Altera'#231#227'o de identifica'#231#227'o do t'#237'tulo na empresa'
            '08 = Altera'#231#227'o seu n'#250'mero'
            '09 = Pedido Protesto'
            '18 = Pedido de Susta'#231#227'o de Protesto'
            '10 = Concess'#227'o de desconto'
            '11 = Cancelamento de desconto'
            '31 = Altera'#231#227'o de outros dados'
            '98 = N'#227'o Protestar')
          TabOrder = 2
          Values.Strings = (
            '01'
            '02'
            '04'
            '05'
            '06'
            '07'
            '08'
            '09'
            '18'
            '10'
            '11'
            '31'
            '98')
        end
        object RxDBComboBox7: TRxDBComboBox
          Left = 136
          Top = 96
          Width = 326
          Height = 21
          Style = csDropDownList
          DataField = 'FormaCadastramento'
          DataSource = DM1.dsBcoSantander
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '1 = Cobran'#231'a Registrada (R'#225'pida e Eletr'#244'nica com Registro)'
            '2 = Cobran'#231'a sem Registro')
          TabOrder = 4
          Values.Strings = (
            '1'
            '2')
        end
        object RxDBComboBox9: TRxDBComboBox
          Left = 136
          Top = 118
          Width = 326
          Height = 21
          Style = csDropDownList
          DataField = 'TipoDocumento'
          DataSource = DM1.dsBcoSantander
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '1 = Tradicional'
            '2 = Escritural')
          TabOrder = 5
          Values.Strings = (
            '1'
            '2')
        end
        object DBDateEdit1: TDBDateEdit
          Left = 661
          Top = 179
          Width = 100
          Height = 21
          DataField = 'DtLimiteDesconto'
          DataSource = DM1.dsBcoSantander
          NumGlyphs = 2
          TabOrder = 12
          StartOfWeek = Sun
        end
        object RxDBComboBox10: TRxDBComboBox
          Left = 136
          Top = 250
          Width = 325
          Height = 21
          Style = csDropDownList
          DataField = 'CodProtesto'
          DataSource = DM1.dsBcoSantander
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '0 = N'#227'o Protestar'
            '1 = Protestar dias corridos'
            '2 = Protestar dias '#250'teis'
            '3 = Utilizar perf'#237'l cedente'
            '9 = Cancelamento de protesto automatico')
          TabOrder = 19
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '9')
        end
        object RxDBComboBox13: TRxDBComboBox
          Left = 136
          Top = 272
          Width = 325
          Height = 21
          Style = csDropDownList
          DataField = 'CodBaixa'
          DataSource = DM1.dsBcoSantander
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '1 = Baixar / Devolver'
            '2 = N'#227'o Baixar / N'#227'o Devolver'
            '3 = Utilizar Perf'#237'l Cedente')
          TabOrder = 21
          Values.Strings = (
            '1'
            '2'
            '3')
        end
        object DBEdit5: TDBEdit
          Left = 136
          Top = 8
          Width = 113
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CodTransmissao'
          DataSource = DM1.dsBcoSantander
          TabOrder = 0
        end
        object DBEdit7: TDBEdit
          Left = 685
          Top = 365
          Width = 69
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clInfoBk
          DataField = 'NumRemessa'
          DataSource = DM1.dsBcoSantander
          ReadOnly = True
          TabOrder = 26
        end
        object DBEdit8: TDBEdit
          Left = 559
          Top = 273
          Width = 69
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DiasBaixa'
          DataSource = DM1.dsBcoSantander
          TabOrder = 22
        end
        object DBEdit9: TDBEdit
          Left = 559
          Top = 205
          Width = 69
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VlrDesconto2'
          DataSource = DM1.dsBcoSantander
          TabOrder = 14
        end
        object RxDBComboBox2: TRxDBComboBox
          Left = 136
          Top = 205
          Width = 325
          Height = 21
          Style = csDropDownList
          DataField = 'TipoDesconto2'
          DataSource = DM1.dsBcoSantander
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '0 = Isento'
            '1 = Valor fixo at'#233' a data informada'
            '2 = Percentual at'#233' a data informada'
            '3 = Valor por antecipa'#231#227'o por dia corrido'
            '4 = Valor por antecipa'#231#227'o dia '#250'til')
          TabOrder = 13
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4')
        end
        object DBDateEdit2: TDBDateEdit
          Left = 661
          Top = 201
          Width = 100
          Height = 21
          DataField = 'DtLimiteDesconto2'
          DataSource = DM1.dsBcoSantander
          NumGlyphs = 2
          TabOrder = 15
          StartOfWeek = Sun
        end
        object DBEdit10: TDBEdit
          Left = 559
          Top = 227
          Width = 69
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VlrMulta'
          DataSource = DM1.dsBcoSantander
          TabOrder = 17
        end
        object RxDBComboBox5: TRxDBComboBox
          Left = 136
          Top = 227
          Width = 325
          Height = 21
          Style = csDropDownList
          DataField = 'CodMulta'
          DataSource = DM1.dsBcoSantander
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '1 = Valor Fixo'
            '2 = Percentual')
          TabOrder = 16
          Values.Strings = (
            '1'
            '2')
        end
        object DBDateEdit3: TDBDateEdit
          Left = 661
          Top = 223
          Width = 100
          Height = 21
          DataField = 'DtMulta'
          DataSource = DM1.dsBcoSantander
          NumGlyphs = 2
          TabOrder = 18
          StartOfWeek = Sun
        end
        object DBEdit11: TDBEdit
          Left = 136
          Top = 294
          Width = 325
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Mensagem1'
          DataSource = DM1.dsBcoSantander
          TabOrder = 23
        end
        object DBEdit12: TDBEdit
          Left = 136
          Top = 315
          Width = 325
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Mensagem2'
          DataSource = DM1.dsBcoSantander
          TabOrder = 24
        end
      end
    end
  end
end
