object fFacaItem: TfFacaItem
  Left = 158
  Top = 170
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fFacaItem'
  ClientHeight = 378
  ClientWidth = 725
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 725
    Height = 29
    Align = alTop
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 2
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Confirmar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 77
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Ca&ncelar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 725
    Height = 349
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 0
    object TabSheet3: TTabSheet
      Caption = 'Medidas'
      ImageIndex = 2
      DesignSize = (
        717
        321)
      object Bevel3: TBevel
        Left = 12
        Top = 196
        Width = 693
        Height = 93
        Anchors = [akLeft, akTop, akRight]
      end
      object Bevel2: TBevel
        Left = 12
        Top = 98
        Width = 693
        Height = 93
        Anchors = [akLeft, akTop, akRight]
      end
      object Bevel1: TBevel
        Left = 12
        Top = 0
        Width = 693
        Height = 93
        Anchors = [akLeft, akTop, akRight]
      end
      object Label2: TLabel
        Left = 80
        Top = 72
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fundo:'
      end
      object Label3: TLabel
        Left = 77
        Top = 168
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tampa:'
      end
      object Label4: TLabel
        Left = 73
        Top = 272
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Suporte:'
      end
      object Label6: TLabel
        Left = 122
        Top = 48
        Width = 61
        Height = 13
        Alignment = taCenter
        Caption = 'Comprimento'
      end
      object Label7: TLabel
        Left = 206
        Top = 48
        Width = 36
        Height = 13
        Alignment = taCenter
        Caption = 'Largura'
      end
      object Label8: TLabel
        Left = 283
        Top = 48
        Width = 27
        Height = 13
        Alignment = taCenter
        Caption = 'Altura'
      end
      object Label56: TLabel
        Left = 344
        Top = 35
        Width = 48
        Height = 26
        Alignment = taCenter
        Caption = 'Aba Int.'#13#10'Cabeceira'
      end
      object Label57: TLabel
        Left = 422
        Top = 35
        Width = 37
        Height = 26
        Alignment = taCenter
        Caption = 'Aba Int.'#13#10'Lateral'
      end
      object Label59: TLabel
        Left = 200
        Top = 132
        Width = 48
        Height = 26
        Alignment = taCenter
        Caption = 'Aba Int.'#13#10'Cabeceira'
      end
      object Label60: TLabel
        Left = 422
        Top = 132
        Width = 37
        Height = 26
        Alignment = taCenter
        Caption = 'Aba Int.'#13#10'Lateral'
      end
      object Label61: TLabel
        Left = 128
        Top = 132
        Width = 48
        Height = 26
        Alignment = taCenter
        Caption = 'Aba Ext.'#13#10'Cabeceira'
      end
      object Label62: TLabel
        Left = 348
        Top = 132
        Width = 40
        Height = 26
        Alignment = taCenter
        Caption = 'Aba Ext.'#13#10'Lateral'
      end
      object Label63: TLabel
        Left = 122
        Top = 248
        Width = 61
        Height = 13
        Alignment = taCenter
        Caption = 'Comprimento'
      end
      object Label64: TLabel
        Left = 206
        Top = 248
        Width = 36
        Height = 13
        Alignment = taCenter
        Caption = 'Largura'
      end
      object Label65: TLabel
        Left = 283
        Top = 248
        Width = 27
        Height = 13
        Alignment = taCenter
        Caption = 'Altura'
      end
      object Label66: TLabel
        Left = 344
        Top = 235
        Width = 48
        Height = 26
        Alignment = taCenter
        Caption = 'Aba Int.'#13#10'Cabeceira'
      end
      object Label67: TLabel
        Left = 422
        Top = 235
        Width = 37
        Height = 26
        Alignment = taCenter
        Caption = 'Aba Int.'#13#10'Lateral'
      end
      object Label28: TLabel
        Left = 554
        Top = 144
        Width = 61
        Height = 13
        Alignment = taCenter
        Caption = 'Comprimento'
      end
      object Label29: TLabel
        Left = 638
        Top = 144
        Width = 36
        Height = 13
        Alignment = taCenter
        Caption = 'Largura'
      end
      object Label17: TLabel
        Left = 554
        Top = 48
        Width = 61
        Height = 13
        Alignment = taCenter
        Caption = 'Comprimento'
      end
      object Label25: TLabel
        Left = 638
        Top = 48
        Width = 36
        Height = 13
        Alignment = taCenter
        Caption = 'Largura'
      end
      object Label30: TLabel
        Left = 37
        Top = 112
        Width = 76
        Height = 13
        Alignment = taRightJustify
        Caption = 'Material Tampa:'
      end
      object Label31: TLabel
        Left = 40
        Top = 16
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'Material Fundo:'
      end
      object Label32: TLabel
        Left = 33
        Top = 216
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Material Suporte:'
      end
      object Label35: TLabel
        Left = 554
        Top = 240
        Width = 61
        Height = 13
        Alignment = taCenter
        Caption = 'Comprimento'
      end
      object Label36: TLabel
        Left = 638
        Top = 240
        Width = 36
        Height = 13
        Alignment = taCenter
        Caption = 'Largura'
      end
      object DBEdit2: TDBEdit
        Left = 120
        Top = 64
        Width = 65
        Height = 21
        DataField = 'FD_COMPR'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 192
        Top = 64
        Width = 65
        Height = 21
        DataField = 'FD_LARGURA'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 264
        Top = 64
        Width = 65
        Height = 21
        DataField = 'FD_ALTURA'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 192
        Top = 160
        Width = 65
        Height = 21
        DataField = 'TP_ABA_INT_CAB'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 10
      end
      object DBEdit6: TDBEdit
        Left = 120
        Top = 160
        Width = 65
        Height = 21
        DataField = 'TP_ABA_EXT_CAB'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 9
      end
      object DBEdit7: TDBEdit
        Left = 408
        Top = 160
        Width = 65
        Height = 21
        DataField = 'TP_ABA_INT_LAT'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 12
      end
      object DBEdit30: TDBEdit
        Left = 120
        Top = 264
        Width = 65
        Height = 21
        DataField = 'SP_COMPR'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 16
      end
      object DBEdit44: TDBEdit
        Left = 192
        Top = 264
        Width = 65
        Height = 21
        DataField = 'SP_LARGURA'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 17
      end
      object DBEdit45: TDBEdit
        Left = 264
        Top = 264
        Width = 65
        Height = 21
        DataField = 'SP_ALTURA'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 18
      end
      object DBEdit73: TDBEdit
        Left = 336
        Top = 64
        Width = 65
        Height = 21
        DataField = 'FD_ABA_INT_CAB'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 4
      end
      object DBEdit74: TDBEdit
        Left = 336
        Top = 160
        Width = 65
        Height = 21
        DataField = 'TP_ABA_EXT_LAT'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 11
      end
      object DBEdit75: TDBEdit
        Left = 336
        Top = 264
        Width = 65
        Height = 21
        DataField = 'SP_ABA_INT_CAB'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 19
      end
      object DBEdit76: TDBEdit
        Left = 408
        Top = 64
        Width = 65
        Height = 21
        DataField = 'FD_ABA_INT_LAT'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 5
      end
      object DBEdit78: TDBEdit
        Left = 408
        Top = 264
        Width = 65
        Height = 21
        DataField = 'SP_ABA_INT_LAT'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 20
      end
      object DBEdit1: TDBEdit
        Left = 552
        Top = 64
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'FD_DIMENSAO1'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 6
      end
      object DBEdit9: TDBEdit
        Left = 624
        Top = 64
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'FD_DIMENSAO2'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 7
      end
      object DBEdit11: TDBEdit
        Left = 552
        Top = 160
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'TP_DIMENSAO1'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 13
      end
      object DBEdit12: TDBEdit
        Left = 624
        Top = 160
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'TP_DIMENSAO2'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 14
      end
      object BitBtn10: TBitBtn
        Left = 631
        Top = 291
        Width = 75
        Height = 25
        Caption = 'Ca&lcular'
        TabOrder = 23
        OnClick = BitBtn10Click
      end
      object RxDBComboBox5: TRxDBComboBox
        Left = 120
        Top = 104
        Width = 281
        Height = 21
        Style = csDropDownList
        DataField = 'TP_TIPO_MAT'
        DataSource = dmProdutoCarto.dsProdutoCarto
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'DUPLEX'
          'MICRO'
          'CART'#195'O / CART'#195'O'
          'MICRO / ABAS INTERNAS')
        TabOrder = 8
        Values.Strings = (
          '1'
          '2'
          '3'
          '4')
      end
      object RxDBComboBox11: TRxDBComboBox
        Left = 120
        Top = 8
        Width = 281
        Height = 21
        Style = csDropDownList
        DataField = 'FD_TIPO_MAT'
        DataSource = dmProdutoCarto.dsProdutoCarto
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'DUPLEX'
          'MICRO'
          'CART'#195'O / CART'#195'O'
          'MICRO / ABAS INTERNAS')
        TabOrder = 0
        Values.Strings = (
          '1'
          '2'
          '3'
          '4')
      end
      object RxDBComboBox13: TRxDBComboBox
        Left = 120
        Top = 208
        Width = 281
        Height = 21
        Style = csDropDownList
        DataField = 'SP_TIPO_MAT'
        DataSource = dmProdutoCarto.dsProdutoCarto
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'DUPLEX'
          'MICRO'
          'CART'#195'O / CART'#195'O'
          'MICRO / ABAS INTERNAS')
        TabOrder = 15
        Values.Strings = (
          '1'
          '2'
          '3'
          '4')
      end
      object DBEdit13: TDBEdit
        Left = 552
        Top = 256
        Width = 65
        Height = 21
        TabStop = False
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 21
      end
      object DBEdit14: TDBEdit
        Left = 624
        Top = 256
        Width = 65
        Height = 21
        TabStop = False
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 22
      end
    end
  end
end
