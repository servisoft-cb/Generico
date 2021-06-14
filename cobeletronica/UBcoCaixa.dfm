object fBcoCaixa: TfBcoCaixa
  Left = 131
  Top = 197
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Caixa Federal (CNAB 400)'
  ClientHeight = 358
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 358
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
      Height = 325
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 763
        Height = 323
        Align = alClient
        TabOrder = 0
        object Label3: TLabel
          Left = 140
          Top = 38
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Carteira:'
        end
        object Label5: TLabel
          Left = 97
          Top = 81
          Width = 83
          Height = 13
          Alignment = taRightJustify
          Caption = 'Esp'#233'cie do t'#237'tulo:'
        end
        object Label6: TLabel
          Left = 148
          Top = 125
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Aceite:'
        end
        object Label10: TLabel
          Left = 127
          Top = 147
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = '% de Juros:'
        end
        object Label13: TLabel
          Left = 521
          Top = 102
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dias para Protesto:'
        end
        object Label14: TLabel
          Left = 38
          Top = 302
          Width = 98
          Height = 13
          Caption = 'Caminho do Arquivo:'
        end
        object Bevel1: TBevel
          Left = -2
          Top = 284
          Width = 765
          Height = 2
          Shape = bsTopLine
          Style = bsRaised
        end
        object Label11: TLabel
          Left = 121
          Top = 102
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = '1'#186' Instru'#231#227'o:'
        end
        object Label32: TLabel
          Left = 145
          Top = 169
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Moeda:'
        end
        object Label12: TLabel
          Left = 621
          Top = 297
          Width = 62
          Height = 13
          Caption = 'N'#186' Remessa:'
        end
        object Label4: TLabel
          Left = 125
          Top = 60
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ocorr'#234'ncia:'
        end
        object Label8: TLabel
          Left = 489
          Top = 225
          Width = 85
          Height = 52
          Alignment = taRightJustify
          Caption = 
            'Tipo de Cobran'#231'a'#13#10'que vai gravar no'#13#10'contas a receber'#13#10'(interno)' +
            ':'
        end
        object Label16: TLabel
          Left = 51
          Top = 17
          Width = 128
          Height = 13
          Alignment = taRightJustify
          Caption = 'Comiss'#227'o de Perman'#234'ncia:'
        end
        object Label2: TLabel
          Left = 1
          Top = 190
          Width = 181
          Height = 13
          Alignment = taRightJustify
          Caption = 'Mensagem Fixa para todos os boletos:'
        end
        object RxDBComboBox1: TRxDBComboBox
          Left = 181
          Top = 30
          Width = 326
          Height = 21
          Style = csDropDownList
          DataField = 'NumCarteira'
          DataSource = DMBanco.dsBcoCaixa
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '11 = Cobran'#231'a Simples'
            '12 = Cobran'#231'a R'#225'pida'
            '14 = Cobran'#231'a Sem Registro'
            '41 = Cobran'#231'a Descontada'
            '')
          TabOrder = 1
          Values.Strings = (
            '11'
            '12'
            '14'
            '41')
        end
        object RxDBComboBox3: TRxDBComboBox
          Left = 182
          Top = 73
          Width = 326
          Height = 21
          Style = csDropDownList
          DataField = 'EspecieDoc'
          DataSource = DMBanco.dsBcoCaixa
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '01 = Duplicata mercantil'
            '02 = Nota promiss'#243'ria'
            '03 = Duplicata de Presta'#231#227'o de Servi'#231'o'
            '05 = Nota de Seguro'
            '06 = Letra de c'#226'mbio'
            '09 = Outros')
          TabOrder = 2
          Values.Strings = (
            '01'
            '02'
            '03'
            '05'
            '06'
            '09')
        end
        object RxDBComboBox4: TRxDBComboBox
          Left = 183
          Top = 117
          Width = 90
          Height = 21
          Style = csDropDownList
          DataField = 'Aceite'
          DataSource = DMBanco.dsBcoCaixa
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
        object DBEdit3: TDBEdit
          Left = 183
          Top = 139
          Width = 89
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VlrJurosPorDia'
          DataSource = DMBanco.dsBcoCaixa
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 613
          Top = 94
          Width = 69
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DiasProtesto'
          DataSource = DMBanco.dsBcoCaixa
          TabOrder = 5
        end
        object DirectoryEdit1: TDirectoryEdit
          Left = 138
          Top = 296
          Width = 299
          Height = 21
          NumGlyphs = 1
          TabOrder = 6
          Text = 'DirectoryEdit1'
        end
        object RxDBComboBox6: TRxDBComboBox
          Left = 183
          Top = 94
          Width = 326
          Height = 21
          Style = csDropDownList
          DataField = 'Instrucao'
          DataSource = DMBanco.dsBcoCaixa
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '01 = Protestar com NN dias'
            '02 = Devolver ap'#243's NN dias')
          TabOrder = 0
          Values.Strings = (
            '01'
            '02')
        end
        object RxDBComboBox14: TRxDBComboBox
          Left = 183
          Top = 161
          Width = 113
          Height = 21
          Style = csDropDownList
          DataField = 'Moeda'
          DataSource = DMBanco.dsBcoCaixa
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '1 = REAL'
            '4 = UFIR')
          TabOrder = 7
          Values.Strings = (
            '1'
            '4')
        end
        object DBEdit7: TDBEdit
          Left = 686
          Top = 297
          Width = 69
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          Color = clInfoBk
          DataField = 'NumRemessa'
          DataSource = DMBanco.dsBcoCaixa
          ReadOnly = True
          TabOrder = 8
        end
        object RxDBComboBox2: TRxDBComboBox
          Left = 182
          Top = 52
          Width = 326
          Height = 21
          Style = csDropDownList
          DataField = 'CodComando'
          DataSource = DMBanco.dsBcoCaixa
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '01 = Entrada de T'#237'tulo'
            '02 = Pedido de Baixa'
            '03 = Concess'#227'o de Abatimento'
            '04 = Cancelamento do Abatimento'
            '05 = Altera'#231#227'o do Vencimento'
            '06 = Altera'#231#227'o do Uso da Empresa'
            '07 = Altera'#231#227'o do Prazo de Protesto'
            '08 = Altera'#231#227'o do Prazo de Devolu'#231#227'o'
            '09 = Altera'#231#227'o de Outros Dados'
            '10 = Alt. de Dados c/ Emiss'#227'o/Emiss'#227'o de Bloqueto'
            '11 = Altera'#231#227'o da Op'#231#227'o de Protesto para Devolu'#231#227'o'
            '12 = Altera'#231#227'o da Op'#231#227'o de Devolu'#231#227'o para Protesto')
          TabOrder = 9
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
            '12')
        end
        object RxDBLookupCombo1: TRxDBLookupCombo
          Left = 579
          Top = 248
          Width = 177
          Height = 21
          DropDownCount = 8
          DataField = 'CodTipoCobranca'
          DataSource = DMBanco.dsBcoCaixa
          LookupField = 'Codigo'
          LookupDisplay = 'Nome'
          LookupSource = DM1.dsTipoCobranca
          TabOrder = 10
          OnEnter = RxDBLookupCombo1Enter
        end
        object RxDBComboBox5: TRxDBComboBox
          Left = 181
          Top = 9
          Width = 326
          Height = 21
          Style = csDropDownList
          DataField = 'ComissaoPermanencia'
          DataSource = DMBanco.dsBcoCaixa
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            '00 - Acata Comiss'#227'o por Dia'
            '51- Acata Condi'#231#245'es de Cadastramento na CAIXA'
            '')
          TabOrder = 11
          Values.Strings = (
            '00'
            '51')
        end
        object DBEdit2: TDBEdit
          Left = 184
          Top = 182
          Width = 569
          Height = 21
          CharCase = ecUpperCase
          DataField = 'Mensagem1'
          DataSource = DMBanco.dsBcoCaixa
          TabOrder = 12
        end
      end
    end
  end
end
