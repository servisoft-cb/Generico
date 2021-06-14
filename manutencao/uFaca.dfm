object fFaca: TfFaca
  Left = 358
  Top = 76
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fFaca'
  ClientHeight = 674
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
  OnShow = FormShow
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
    Height = 645
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Medidas'
      ImageIndex = 2
      DesignSize = (
        717
        617)
      object Shape3: TShape
        Left = 6
        Top = 400
        Width = 705
        Height = 181
        Brush.Color = 8963327
        Pen.Color = 8963327
        Pen.Width = 0
      end
      object Shape2: TShape
        Left = 7
        Top = 215
        Width = 705
        Height = 181
        Brush.Color = clMoneyGreen
        Pen.Color = clMoneyGreen
        Pen.Width = 0
      end
      object Shape1: TShape
        Left = 7
        Top = 30
        Width = 705
        Height = 180
        Brush.Color = 13743257
        Pen.Color = clActiveCaption
        Pen.Width = 0
      end
      object Bevel3: TBevel
        Left = 12
        Top = 407
        Width = 693
        Height = 168
        Anchors = [akLeft, akTop, akRight]
        Shape = bsFrame
      end
      object Bevel2: TBevel
        Left = 12
        Top = 221
        Width = 693
        Height = 168
        Anchors = [akLeft, akTop, akRight]
        Shape = bsFrame
      end
      object Bevel1: TBevel
        Left = 12
        Top = 35
        Width = 693
        Height = 167
        Anchors = [akLeft, akTop, akRight]
        Shape = bsFrame
      end
      object Label2: TLabel
        Left = 64
        Top = 131
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fundo:'
        Color = 13743257
        ParentColor = False
      end
      object Label3: TLabel
        Left = 61
        Top = 315
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tampa:'
        Color = clMoneyGreen
        ParentColor = False
      end
      object Label4: TLabel
        Left = 57
        Top = 507
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Suporte:'
        Color = 8963327
        ParentColor = False
      end
      object Label6: TLabel
        Left = 106
        Top = 107
        Width = 61
        Height = 13
        Alignment = taCenter
        Caption = 'Comprimento'
        Color = 13743257
        ParentColor = False
      end
      object Label7: TLabel
        Left = 190
        Top = 107
        Width = 36
        Height = 13
        Alignment = taCenter
        Caption = 'Largura'
        Color = 13743257
        ParentColor = False
      end
      object Label8: TLabel
        Left = 267
        Top = 107
        Width = 27
        Height = 13
        Alignment = taCenter
        Caption = 'Altura'
        Color = 13743257
        ParentColor = False
      end
      object Label56: TLabel
        Left = 328
        Top = 94
        Width = 48
        Height = 26
        Alignment = taCenter
        Caption = 'Aba Int.'#13#10'Cabeceira'
        Color = 13743257
        ParentColor = False
      end
      object Label57: TLabel
        Left = 406
        Top = 94
        Width = 37
        Height = 26
        Alignment = taCenter
        Caption = 'Aba Int.'#13#10'Lateral'
        Color = 13743257
        ParentColor = False
      end
      object Label59: TLabel
        Left = 184
        Top = 279
        Width = 48
        Height = 26
        Alignment = taCenter
        Caption = 'Aba Int.'#13#10'Cabeceira'
        Color = clMoneyGreen
        ParentColor = False
      end
      object Label60: TLabel
        Left = 406
        Top = 279
        Width = 37
        Height = 26
        Alignment = taCenter
        Caption = 'Aba Int.'#13#10'Lateral'
        Color = clMoneyGreen
        ParentColor = False
      end
      object Label61: TLabel
        Left = 112
        Top = 279
        Width = 48
        Height = 26
        Alignment = taCenter
        Caption = 'Aba Ext.'#13#10'Cabeceira'
        Color = clMoneyGreen
        ParentColor = False
      end
      object Label62: TLabel
        Left = 332
        Top = 279
        Width = 40
        Height = 26
        Alignment = taCenter
        Caption = 'Aba Ext.'#13#10'Lateral'
        Color = clMoneyGreen
        ParentColor = False
      end
      object Label63: TLabel
        Left = 106
        Top = 483
        Width = 61
        Height = 13
        Alignment = taCenter
        Caption = 'Comprimento'
        Color = 8963327
        ParentColor = False
      end
      object Label64: TLabel
        Left = 190
        Top = 483
        Width = 36
        Height = 13
        Alignment = taCenter
        Caption = 'Largura'
        Color = 8963327
        ParentColor = False
      end
      object Label65: TLabel
        Left = 267
        Top = 483
        Width = 27
        Height = 13
        Alignment = taCenter
        Caption = 'Altura'
        Color = 8963327
        ParentColor = False
      end
      object Label66: TLabel
        Left = 328
        Top = 470
        Width = 48
        Height = 26
        Alignment = taCenter
        Caption = 'Aba Int.'#13#10'Cabeceira'
        Color = 8963327
        ParentColor = False
      end
      object Label67: TLabel
        Left = 406
        Top = 470
        Width = 37
        Height = 26
        Alignment = taCenter
        Caption = 'Aba Int.'#13#10'Lateral'
        Color = 8963327
        ParentColor = False
      end
      object Label28: TLabel
        Left = 554
        Top = 227
        Width = 61
        Height = 13
        Alignment = taCenter
        Caption = 'Comprimento'
        Color = clMoneyGreen
        ParentColor = False
      end
      object Label29: TLabel
        Left = 638
        Top = 227
        Width = 36
        Height = 13
        Alignment = taCenter
        Caption = 'Largura'
        Color = clMoneyGreen
        ParentColor = False
      end
      object Label17: TLabel
        Left = 554
        Top = 41
        Width = 61
        Height = 13
        Alignment = taCenter
        Caption = 'Comprimento'
        Color = 13743257
        ParentColor = False
      end
      object Label25: TLabel
        Left = 638
        Top = 41
        Width = 36
        Height = 13
        Alignment = taCenter
        Caption = 'Largura'
        Color = 13743257
        ParentColor = False
      end
      object Label30: TLabel
        Left = 37
        Top = 235
        Width = 76
        Height = 13
        Alignment = taRightJustify
        Caption = 'Material Tampa:'
        Color = clMoneyGreen
        ParentColor = False
      end
      object Label31: TLabel
        Left = 40
        Top = 51
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'Material Fundo:'
        Color = 13743257
        ParentColor = False
      end
      object Label32: TLabel
        Left = 33
        Top = 427
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Material Suporte:'
        Color = 8963327
        ParentColor = False
      end
      object Label35: TLabel
        Left = 554
        Top = 411
        Width = 61
        Height = 13
        Alignment = taCenter
        Caption = 'Comprimento'
        Color = 8963327
        ParentColor = False
      end
      object Label36: TLabel
        Left = 638
        Top = 411
        Width = 36
        Height = 13
        Alignment = taCenter
        Caption = 'Largura'
        Color = 8963327
        ParentColor = False
      end
      object Label1: TLabel
        Left = 510
        Top = 65
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'pias:'
        Color = 13743257
        ParentColor = False
      end
      object Label5: TLabel
        Left = 510
        Top = 251
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'pias:'
        Color = clMoneyGreen
        ParentColor = False
      end
      object Label9: TLabel
        Left = 510
        Top = 435
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'pias:'
        Color = 8963327
        ParentColor = False
      end
      object Label10: TLabel
        Left = 77
        Top = 10
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'digo:'
      end
      object Label11: TLabel
        Left = 501
        Top = 89
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Intervalo:'
        Color = 13743257
        ParentColor = False
      end
      object Label12: TLabel
        Left = 501
        Top = 275
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Intervalo:'
        Color = clMoneyGreen
        ParentColor = False
      end
      object Label13: TLabel
        Left = 501
        Top = 459
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Intervalo:'
        Color = 8963327
        ParentColor = False
      end
      object Label14: TLabel
        Left = 482
        Top = 113
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fio a fio unit.:'
        Color = 13743257
        ParentColor = False
      end
      object Label15: TLabel
        Left = 482
        Top = 299
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fio a fio unit.:'
        Color = clMoneyGreen
        ParentColor = False
      end
      object Label16: TLabel
        Left = 482
        Top = 483
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fio a fio unit.:'
        Color = 8963327
        ParentColor = False
      end
      object Label79: TLabel
        Left = 305
        Top = 10
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo:'
      end
      object Label18: TLabel
        Left = 505
        Top = 137
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fio a fio:'
        Color = 13743257
        ParentColor = False
      end
      object Label19: TLabel
        Left = 505
        Top = 323
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fio a fio:'
        Color = clMoneyGreen
        ParentColor = False
      end
      object Label20: TLabel
        Left = 505
        Top = 507
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fio a fio:'
        Color = 8963327
        ParentColor = False
      end
      object Label21: TLabel
        Left = 77
        Top = 75
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'digo:'
        Color = 13743257
        ParentColor = False
      end
      object Label22: TLabel
        Left = 77
        Top = 259
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'digo:'
        Color = clMoneyGreen
        ParentColor = False
      end
      object Label24: TLabel
        Left = 50
        Top = 160
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fechamento:'
        Color = 13743257
        ParentColor = False
      end
      object Label23: TLabel
        Left = 66
        Top = 160
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cartucho:'
        Color = 13743257
        ParentColor = False
        Visible = False
      end
      object Label26: TLabel
        Left = 50
        Top = 344
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fechamento:'
        Color = clMoneyGreen
        ParentColor = False
      end
      object Label27: TLabel
        Left = 50
        Top = 531
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fechamento:'
        Color = 8963327
        ParentColor = False
      end
      object Label33: TLabel
        Left = 51
        Top = 184
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Observa'#231#227'o:'
        Color = 13743257
        ParentColor = False
      end
      object Label34: TLabel
        Left = 51
        Top = 368
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Observa'#231#227'o:'
        Color = clMoneyGreen
        ParentColor = False
      end
      object Label37: TLabel
        Left = 51
        Top = 555
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Observa'#231#227'o:'
        Color = 8963327
        ParentColor = False
      end
      object DBEdit2: TDBEdit
        Left = 104
        Top = 123
        Width = 65
        Height = 21
        DataField = 'FD_COMPR'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 4
        OnExit = DBEdit2Exit
      end
      object DBEdit3: TDBEdit
        Left = 176
        Top = 123
        Width = 65
        Height = 21
        DataField = 'FD_LARGURA'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 5
        OnExit = DBEdit2Exit
      end
      object DBEdit4: TDBEdit
        Left = 248
        Top = 123
        Width = 65
        Height = 21
        DataField = 'FD_ALTURA'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 6
        OnExit = DBEdit2Exit
      end
      object DBEdit5: TDBEdit
        Left = 176
        Top = 307
        Width = 65
        Height = 21
        DataField = 'TP_ABA_INT_CAB'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 23
        OnExit = DBEdit2Exit
      end
      object DBEdit6: TDBEdit
        Left = 104
        Top = 307
        Width = 65
        Height = 21
        DataField = 'TP_ABA_EXT_CAB'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 22
        OnExit = DBEdit2Exit
      end
      object DBEdit7: TDBEdit
        Left = 392
        Top = 307
        Width = 65
        Height = 21
        DataField = 'TP_ABA_INT_LAT'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 25
        OnExit = DBEdit2Exit
      end
      object DBEdit30: TDBEdit
        Left = 104
        Top = 499
        Width = 65
        Height = 21
        DataField = 'SP_COMPR'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 37
      end
      object DBEdit44: TDBEdit
        Left = 176
        Top = 499
        Width = 65
        Height = 21
        DataField = 'SP_LARGURA'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 38
      end
      object DBEdit45: TDBEdit
        Left = 248
        Top = 499
        Width = 65
        Height = 21
        DataField = 'SP_ALTURA'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 39
      end
      object DBEdit73: TDBEdit
        Left = 320
        Top = 123
        Width = 65
        Height = 21
        DataField = 'FD_ABA_INT_CAB'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 7
        OnExit = DBEdit2Exit
      end
      object DBEdit74: TDBEdit
        Left = 320
        Top = 307
        Width = 65
        Height = 21
        DataField = 'TP_ABA_EXT_LAT'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 24
        OnExit = DBEdit2Exit
      end
      object DBEdit75: TDBEdit
        Left = 320
        Top = 499
        Width = 65
        Height = 21
        DataField = 'SP_ABA_INT_CAB'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 40
      end
      object DBEdit76: TDBEdit
        Left = 392
        Top = 123
        Width = 65
        Height = 21
        DataField = 'FD_ABA_INT_LAT'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 8
        OnExit = DBEdit2Exit
      end
      object DBEdit78: TDBEdit
        Left = 392
        Top = 499
        Width = 65
        Height = 21
        DataField = 'SP_ABA_INT_LAT'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 41
      end
      object DBEdit1: TDBEdit
        Left = 552
        Top = 129
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'FD_DIMENSAO1'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 15
      end
      object DBEdit9: TDBEdit
        Left = 624
        Top = 129
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'FD_DIMENSAO2'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 16
      end
      object DBEdit11: TDBEdit
        Left = 552
        Top = 315
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'TP_DIMENSAO1'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 32
      end
      object DBEdit12: TDBEdit
        Left = 624
        Top = 315
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'TP_DIMENSAO2'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 33
      end
      object BitBtn10: TBitBtn
        Left = 631
        Top = 588
        Width = 75
        Height = 25
        Caption = 'Ca&lcular'
        TabOrder = 52
        OnClick = BitBtn10Click
      end
      object RxDBComboBox5: TRxDBComboBox
        Left = 120
        Top = 227
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
        TabOrder = 20
        Values.Strings = (
          '1'
          '2'
          '3'
          '4')
      end
      object RxDBComboBox11: TRxDBComboBox
        Left = 120
        Top = 43
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
        TabOrder = 2
        Values.Strings = (
          '1'
          '2'
          '3'
          '4')
      end
      object RxDBComboBox13: TRxDBComboBox
        Left = 120
        Top = 419
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
        TabOrder = 36
        Values.Strings = (
          '1'
          '2'
          '3'
          '4')
      end
      object DBEdit13: TDBEdit
        Left = 552
        Top = 499
        Width = 65
        Height = 21
        TabStop = False
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 48
      end
      object DBEdit14: TDBEdit
        Left = 624
        Top = 499
        Width = 65
        Height = 21
        TabStop = False
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 49
      end
      object RxDBComboBox1: TRxDBComboBox
        Left = 552
        Top = 57
        Width = 65
        Height = 21
        Style = csDropDownList
        DataField = 'FD_COPIAS_C'
        DataSource = dmProdutoCarto.dsProdutoCarto
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8')
        TabOrder = 9
        Values.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8')
      end
      object RxDBComboBox2: TRxDBComboBox
        Left = 552
        Top = 243
        Width = 65
        Height = 21
        Style = csDropDownList
        DataField = 'TP_COPIAS_C'
        DataSource = dmProdutoCarto.dsProdutoCarto
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8')
        TabOrder = 26
        Values.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8')
      end
      object RxDBComboBox3: TRxDBComboBox
        Left = 552
        Top = 427
        Width = 65
        Height = 21
        Style = csDropDownList
        DataField = 'SP_COPIAS_C'
        DataSource = dmProdutoCarto.dsProdutoCarto
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8')
        TabOrder = 42
        Values.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8')
      end
      object DBEdit8: TDBEdit
        Left = 120
        Top = 2
        Width = 153
        Height = 21
        DataField = 'REFERENCIA'
        DataSource = dmProdutoCarto.dsProduto
        TabOrder = 0
      end
      object DBEdit10: TDBEdit
        Left = 552
        Top = 81
        Width = 65
        Height = 21
        DataField = 'FD_INT_C'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 11
      end
      object DBEdit15: TDBEdit
        Left = 552
        Top = 267
        Width = 65
        Height = 21
        DataField = 'TP_INT_C'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 28
      end
      object DBEdit16: TDBEdit
        Left = 552
        Top = 451
        Width = 65
        Height = 21
        DataField = 'SP_INT_C'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 44
      end
      object DBEdit17: TDBEdit
        Left = 624
        Top = 451
        Width = 65
        Height = 21
        DataField = 'SP_INT_L'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 45
      end
      object DBEdit18: TDBEdit
        Left = 624
        Top = 267
        Width = 65
        Height = 21
        DataField = 'TP_INT_L'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 29
      end
      object DBEdit19: TDBEdit
        Left = 624
        Top = 81
        Width = 65
        Height = 21
        DataField = 'FD_INT_L'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 12
      end
      object RxDBComboBox4: TRxDBComboBox
        Left = 624
        Top = 57
        Width = 65
        Height = 21
        Style = csDropDownList
        DataField = 'FD_COPIAS_L'
        DataSource = dmProdutoCarto.dsProdutoCarto
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8')
        TabOrder = 10
        Values.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8')
      end
      object RxDBComboBox6: TRxDBComboBox
        Left = 624
        Top = 243
        Width = 65
        Height = 21
        Style = csDropDownList
        DataField = 'TP_COPIAS_L'
        DataSource = dmProdutoCarto.dsProdutoCarto
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8')
        TabOrder = 27
        Values.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8')
      end
      object RxDBComboBox7: TRxDBComboBox
        Left = 624
        Top = 427
        Width = 65
        Height = 21
        Style = csDropDownList
        DataField = 'SP_COPIAS_L'
        DataSource = dmProdutoCarto.dsProdutoCarto
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8')
        TabOrder = 43
        Values.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8')
      end
      object RxDBComboBox8: TRxDBComboBox
        Left = 336
        Top = 2
        Width = 281
        Height = 21
        Style = csDropDownList
        DataField = 'TIPO'
        DataSource = dmProdutoCarto.dsProdutoCarto
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'CAIXA NORMAL'
          'TAMPA ACOPLADA'
          'CARTUCHO'
          'SACOLA')
        TabOrder = 1
        Values.Strings = (
          '1'
          '2'
          '3'
          '4')
      end
      object DBEdit20: TDBEdit
        Left = 552
        Top = 105
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'FD_FIO_C'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 13
      end
      object DBEdit21: TDBEdit
        Left = 624
        Top = 105
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'FD_FIO_L'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 14
      end
      object DBEdit22: TDBEdit
        Left = 552
        Top = 291
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'TP_FIO_C'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 30
      end
      object DBEdit23: TDBEdit
        Left = 624
        Top = 291
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'TP_FIO_L'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 31
      end
      object DBEdit24: TDBEdit
        Left = 552
        Top = 475
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'SP_FIO_C'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 46
      end
      object DBEdit25: TDBEdit
        Left = 624
        Top = 475
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'SP_FIO_L'
        DataSource = dmProdutoCarto.dsProdutoCarto
        TabOrder = 47
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 120
        Top = 67
        Width = 145
        Height = 21
        DropDownCount = 8
        DataField = 'FACA_FD'
        DataSource = dmProdutoCarto.dsProdutoCarto
        LookupField = 'CODIGO'
        LookupDisplay = 'REFERENCIA'
        LookupSource = dsFacaFD
        TabOrder = 3
        TabStop = False
      end
      object RxDBLookupCombo2: TRxDBLookupCombo
        Left = 120
        Top = 251
        Width = 145
        Height = 21
        DropDownCount = 8
        DataField = 'FACA_TP'
        DataSource = dmProdutoCarto.dsProdutoCarto
        LookupField = 'CODIGO'
        LookupDisplay = 'REFERENCIA'
        LookupSource = dsFacaTP
        TabOrder = 21
        TabStop = False
      end
      object RxDBComboBox10: TRxDBComboBox
        Left = 120
        Top = 152
        Width = 281
        Height = 21
        Style = csDropDownList
        DataField = 'FECHAMENTO'
        DataSource = dmProdutoCarto.dsProdutoCartoFD
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'N - N'#195'O'
          'AA - AUTO ADESIVO NORMAL'
          'AAA - AUTO ADESIVO COM ABAS LATERAIS COLADAS'
          'ME - MONTAGEM POR ENCAIXE (com cola)'
          'MM - MONTAGEM MANUAL (sem cola)'
          'SAC - SACOLA')
        TabOrder = 17
        Values.Strings = (
          'N'
          'AA'
          'AAA'
          'ME'
          'MM'
          'SAC')
      end
      object RxDBComboBox9: TRxDBComboBox
        Left = 120
        Top = 152
        Width = 276
        Height = 21
        Style = csDropDownList
        DataField = 'FECHAMENTO_CT'
        DataSource = dmProdutoCarto.dsProdutoCartoFD
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'N - N'#195'O'
          'FN - FUNDO NORMAL'
          'FNT - FUNDO NORMAL COM TRAVA'
          'FA - FUNDO AUTOM'#193'TICO'
          'FAT - FUNDO AUTOM'#193'TICO COM TRAVA'
          'FAM - FUNDO AMERICANO'
          'FAMR - FUNDO AMERICANO COM TRAVA'
          'ME - MONTAGEM POR ENCAIXE (com cola)'
          'MET - MONTAGEM POR ENCAIXE TRAVA (com cola)'
          'MM - MONTAGEM MANUAL (sem cola) '
          'MMT - MONTAGEM MANUAL COM TRAVA (sem cola) '
          '4P - 4 PONTOS'
          '6P - 6 PONTOS'
          '8P - 8 PONTOS'
          'DIS - DISPLAY'
          'ENV - ENVOLT'#211'RIO')
        TabOrder = 18
        Values.Strings = (
          'N'
          'FN'
          'FNT'
          'FA'
          'FAT'
          'FAM'
          'FAMR'
          'ME'
          'MET'
          'MM'
          'MMT'
          '4P'
          '6P'
          '8P'
          'DIS'
          'ENV')
        Visible = False
      end
      object RxDBComboBox12: TRxDBComboBox
        Left = 120
        Top = 336
        Width = 281
        Height = 21
        Style = csDropDownList
        DataField = 'FECHAMENTO'
        DataSource = dmProdutoCarto.dsProdutoCartoTP
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'N - N'#195'O'
          'AA - AUTO ADESIVO NORMAL'
          'AAA - AUTO ADESIVO COM ABAS LATERAIS COLADAS'
          'ME - MONTAGEM POR ENCAIXE (com cola)'
          'MM - MONTAGEM MANUAL (sem cola)')
        TabOrder = 34
        Values.Strings = (
          'N'
          'AA'
          'AAA'
          'ME'
          'MM')
      end
      object RxDBComboBox14: TRxDBComboBox
        Left = 120
        Top = 523
        Width = 281
        Height = 21
        Style = csDropDownList
        DataField = 'FECHAMENTO'
        DataSource = dmProdutoCarto.dsProdutoCartoSP
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'N - N'#195'O'
          'AA - AUTO ADESIVO NORMAL'
          'AAA - AUTO ADESIVO COM ABAS LATERAIS COLADAS'
          'ME - MONTAGEM POR ENCAIXE (com cola)'
          'MM - MONTAGEM MANUAL (sem cola)')
        TabOrder = 50
        Values.Strings = (
          'N'
          'AA'
          'AAA'
          'ME'
          'MM')
      end
      object DBEdit26: TDBEdit
        Left = 120
        Top = 176
        Width = 498
        Height = 21
        DataField = 'OBS'
        DataSource = dmProdutoCarto.dsProdutoCartoFD
        TabOrder = 19
        OnExit = DBEdit2Exit
      end
      object DBEdit27: TDBEdit
        Left = 120
        Top = 360
        Width = 498
        Height = 21
        DataField = 'OBS'
        DataSource = dmProdutoCarto.dsProdutoCartoFD
        TabOrder = 35
        OnExit = DBEdit2Exit
      end
      object DBEdit28: TDBEdit
        Left = 120
        Top = 547
        Width = 498
        Height = 21
        DataField = 'OBS'
        DataSource = dmProdutoCarto.dsProdutoCartoFD
        TabOrder = 51
        OnExit = DBEdit2Exit
      end
    end
  end
  object sdsFacaFD: TSQLDataSet
    CommandText = 
      'SELECT PC.CODIGO, FD_COMPR, FD_LARGURA, FD_ALTURA, FD_ABA_INT_CA' +
      'B, FD_ABA_INT_LAT, FD_COPIAS_C, FD_COPIAS_L, P.REFERENCIA'#13#10'FROM ' +
      'PRODUTOCARTO PC'#13#10'INNER JOIN PRODUTO P ON (PC.CODIGO = P.CODIGO)'#13 +
      #10'WHERE FACA = '#39'1'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 405
    Top = 97
    object IntegerField5: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsFacaFDFD_COMPR: TFMTBCDField
      FieldName = 'FD_COMPR'
      Precision = 15
      Size = 2
    end
    object sdsFacaFDFD_LARGURA: TFMTBCDField
      FieldName = 'FD_LARGURA'
      Precision = 15
      Size = 2
    end
    object sdsFacaFDFD_ALTURA: TFMTBCDField
      FieldName = 'FD_ALTURA'
      Precision = 15
      Size = 2
    end
    object sdsFacaFDFD_ABA_INT_CAB: TFMTBCDField
      FieldName = 'FD_ABA_INT_CAB'
      Precision = 15
      Size = 2
    end
    object sdsFacaFDFD_ABA_INT_LAT: TFMTBCDField
      FieldName = 'FD_ABA_INT_LAT'
      Precision = 15
      Size = 2
    end
    object sdsFacaFDFD_COPIAS_C: TSmallintField
      FieldName = 'FD_COPIAS_C'
    end
    object sdsFacaFDFD_COPIAS_L: TSmallintField
      FieldName = 'FD_COPIAS_L'
    end
    object sdsFacaFDREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
  end
  object dspFacaFD: TDataSetProvider
    DataSet = sdsFacaFD
    Left = 421
    Top = 97
  end
  object cdsFacaFD: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFacaFD'
    Left = 433
    Top = 97
    object cdsFacaFDCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsFacaFDFD_COMPR: TFMTBCDField
      FieldName = 'FD_COMPR'
      Precision = 15
      Size = 2
    end
    object cdsFacaFDFD_LARGURA: TFMTBCDField
      FieldName = 'FD_LARGURA'
      Precision = 15
      Size = 2
    end
    object cdsFacaFDFD_ALTURA: TFMTBCDField
      FieldName = 'FD_ALTURA'
      Precision = 15
      Size = 2
    end
    object cdsFacaFDFD_ABA_INT_CAB: TFMTBCDField
      FieldName = 'FD_ABA_INT_CAB'
      Precision = 15
      Size = 2
    end
    object cdsFacaFDFD_ABA_INT_LAT: TFMTBCDField
      FieldName = 'FD_ABA_INT_LAT'
      Precision = 15
      Size = 2
    end
    object cdsFacaFDFD_COPIAS_C: TSmallintField
      FieldName = 'FD_COPIAS_C'
    end
    object cdsFacaFDFD_COPIAS_L: TSmallintField
      FieldName = 'FD_COPIAS_L'
    end
    object cdsFacaFDREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
  end
  object dsFacaFD: TDataSource
    DataSet = cdsFacaFD
    Left = 445
    Top = 97
  end
  object sdsFacaTP: TSQLDataSet
    CommandText = 
      'SELECT PC.CODIGO, TP_ABA_EXT_CAB, TP_ABA_INT_CAB,'#13#10'TP_ABA_EXT_LA' +
      'T, TP_ABA_INT_LAT, TP_COPIAS_C, TP_COPIAS_L, P.REFERENCIA'#13#10'FROM ' +
      'PRODUTOCARTO PC'#13#10'INNER JOIN PRODUTO P ON (PC.CODIGO = P.CODIGO)'#13 +
      #10'WHERE FACA = '#39'1'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 404
    Top = 233
    object sdsFacaTPCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsFacaTPTP_ABA_EXT_CAB: TFMTBCDField
      FieldName = 'TP_ABA_EXT_CAB'
      Precision = 15
      Size = 2
    end
    object sdsFacaTPTP_ABA_INT_CAB: TFMTBCDField
      FieldName = 'TP_ABA_INT_CAB'
      Precision = 15
      Size = 2
    end
    object sdsFacaTPTP_ABA_EXT_LAT: TFMTBCDField
      FieldName = 'TP_ABA_EXT_LAT'
      Precision = 15
      Size = 2
    end
    object sdsFacaTPTP_ABA_INT_LAT: TFMTBCDField
      FieldName = 'TP_ABA_INT_LAT'
      Precision = 15
      Size = 2
    end
    object sdsFacaTPTP_COPIAS_C: TSmallintField
      FieldName = 'TP_COPIAS_C'
    end
    object sdsFacaTPTP_COPIAS_L: TSmallintField
      FieldName = 'TP_COPIAS_L'
    end
    object sdsFacaTPREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
  end
  object dspFacaTP: TDataSetProvider
    DataSet = sdsFacaTP
    Left = 420
    Top = 233
  end
  object cdsFacaTP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFacaTP'
    Left = 432
    Top = 233
    object cdsFacaTPCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsFacaTPTP_ABA_EXT_CAB: TFMTBCDField
      FieldName = 'TP_ABA_EXT_CAB'
      Precision = 15
      Size = 2
    end
    object cdsFacaTPTP_ABA_INT_CAB: TFMTBCDField
      FieldName = 'TP_ABA_INT_CAB'
      Precision = 15
      Size = 2
    end
    object cdsFacaTPTP_ABA_EXT_LAT: TFMTBCDField
      FieldName = 'TP_ABA_EXT_LAT'
      Precision = 15
      Size = 2
    end
    object cdsFacaTPTP_ABA_INT_LAT: TFMTBCDField
      FieldName = 'TP_ABA_INT_LAT'
      Precision = 15
      Size = 2
    end
    object cdsFacaTPTP_COPIAS_C: TSmallintField
      FieldName = 'TP_COPIAS_C'
    end
    object cdsFacaTPTP_COPIAS_L: TSmallintField
      FieldName = 'TP_COPIAS_L'
    end
    object cdsFacaTPREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
  end
  object dsFacaTP: TDataSource
    DataSet = cdsFacaTP
    Left = 444
    Top = 233
  end
end
