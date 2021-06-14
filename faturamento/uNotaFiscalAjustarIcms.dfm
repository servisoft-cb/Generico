object fNotaFiscalAjustarIcms: TfNotaFiscalAjustarIcms
  Left = 349
  Top = 103
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ajustar Imposto'
  ClientHeight = 514
  ClientWidth = 846
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 160
    Top = 484
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 235
    Top = 484
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 846
    Height = 553
    Align = alTop
    Color = clMoneyGreen
    Enabled = False
    TabOrder = 0
    DesignSize = (
      846
      553)
    object Label1: TLabel
      Left = 87
      Top = 56
      Width = 56
      Height = 13
      Caption = 'Base ICMS:'
    end
    object Label2: TLabel
      Left = 87
      Top = 79
      Width = 56
      Height = 13
      Caption = 'Valor ICMS:'
    end
    object Label3: TLabel
      Left = 301
      Top = 55
      Width = 43
      Height = 13
      Caption = 'Valor IPI:'
    end
    object Label4: TLabel
      Left = 48
      Top = 109
      Width = 95
      Height = 13
      Caption = 'Base ICMS Simples:'
    end
    object Label5: TLabel
      Left = 48
      Top = 132
      Width = 95
      Height = 13
      Caption = 'Valor ICMS Simples:'
    end
    object Label6: TLabel
      Left = 7
      Top = 162
      Width = 136
      Height = 13
      Caption = 'Base ICMS Subst. Tribut'#225'ria:'
    end
    object Label7: TLabel
      Left = 10
      Top = 185
      Width = 133
      Height = 13
      Caption = 'Valor ICMS Subst. Tribut'#225'ria'
    end
    object Label8: TLabel
      Left = 8
      Top = 10
      Width = 23
      Height = 13
      Caption = 'Item:'
    end
    object Label9: TLabel
      Left = 103
      Top = 242
      Width = 42
      Height = 13
      Caption = 'C'#243'd. Pis:'
    end
    object Label23: TLabel
      Left = 88
      Top = 264
      Width = 57
      Height = 13
      Caption = 'C'#243'd. Cofins:'
    end
    object Label10: TLabel
      Left = 113
      Top = 286
      Width = 31
      Height = 13
      Caption = '% PIS:'
    end
    object Label11: TLabel
      Left = 91
      Top = 308
      Width = 53
      Height = 13
      Caption = '% COFINS:'
    end
    object Label12: TLabel
      Left = 295
      Top = 286
      Width = 47
      Height = 13
      Caption = 'Valor PIS:'
    end
    object Label13: TLabel
      Left = 273
      Top = 308
      Width = 69
      Height = 13
      Caption = 'Valor COFINS:'
    end
    object Label14: TLabel
      Left = 311
      Top = 242
      Width = 31
      Height = 13
      Caption = 'Sit.IPI:'
    end
    object Label15: TLabel
      Left = 108
      Top = 393
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Origem:'
    end
    object Label16: TLabel
      Left = 69
      Top = 33
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nat. Opera'#231#227'o:'
    end
    object Label17: TLabel
      Left = 98
      Top = 214
      Width = 45
      Height = 13
      Caption = 'Vlr. Frete:'
    end
    object Label18: TLabel
      Left = 49
      Top = 411
      Width = 95
      Height = 13
      Alignment = taRightJustify
      Caption = 'Obs. Complementar:'
    end
    object Label19: TLabel
      Left = 304
      Top = 79
      Width = 40
      Height = 13
      Caption = '% ICMS:'
    end
    object Label20: TLabel
      Left = 303
      Top = 110
      Width = 36
      Height = 13
      Caption = 'Sit.Trib:'
    end
    object Label21: TLabel
      Left = 31
      Top = 340
      Width = 113
      Height = 13
      Alignment = taRightJustify
      Caption = '% Tributo lei 12.741/12:'
    end
    object Label22: TLabel
      Left = 288
      Top = 340
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. Tributo:'
    end
    object Label24: TLabel
      Left = 312
      Top = 134
      Width = 27
      Height = 13
      Caption = 'NCM:'
    end
    object Label25: TLabel
      Left = 277
      Top = 31
      Width = 67
      Height = 13
      Caption = 'Valor Produto:'
    end
    object Label26: TLabel
      Left = 507
      Top = 30
      Width = 83
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor Importa'#231#227'o:'
    end
    object Label27: TLabel
      Left = 512
      Top = 52
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor Aduaneira:'
    end
    object Label28: TLabel
      Left = 506
      Top = 74
      Width = 84
      Height = 13
      Alignment = taRightJustify
      Caption = 'Outras Despesas:'
    end
    object Label29: TLabel
      Left = 558
      Top = 110
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. Unit.'
    end
    object Label30: TLabel
      Left = 578
      Top = 138
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = 'Qtd.'
    end
    object Label31: TLabel
      Left = 580
      Top = 288
      Width = 87
      Height = 13
      Caption = 'PERC_ICMS_FCP'
      FocusControl = DBEdit23
    end
    object Label32: TLabel
      Left = 551
      Top = 312
      Width = 116
      Height = 13
      Caption = 'PERC_ICMS_UF_DEST'
      FocusControl = DBEdit24
    end
    object Label33: TLabel
      Left = 547
      Top = 336
      Width = 120
      Height = 13
      Caption = 'PERC_ICMS_PARTILHA'
      FocusControl = DBEdit25
    end
    object Label34: TLabel
      Left = 588
      Top = 360
      Width = 79
      Height = 13
      Caption = 'VLR_ICMS_FCP'
      FocusControl = DBEdit26
    end
    object Label35: TLabel
      Left = 559
      Top = 384
      Width = 108
      Height = 13
      Caption = 'VLR_ICMS_UF_DEST'
      FocusControl = DBEdit27
    end
    object Label36: TLabel
      Left = 550
      Top = 408
      Width = 117
      Height = 13
      Caption = 'VLR_ICMS_UF_REMET'
      FocusControl = DBEdit28
    end
    object DBEdit1: TDBEdit
      Left = 145
      Top = 48
      Width = 121
      Height = 21
      DataField = 'BaseIcms'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 145
      Top = 71
      Width = 121
      Height = 21
      DataField = 'VlrIcms'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 345
      Top = 47
      Width = 121
      Height = 21
      DataField = 'VlrIpi'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 145
      Top = 101
      Width = 121
      Height = 21
      DataField = 'BaseIcmsSimples'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 5
    end
    object DBEdit5: TDBEdit
      Left = 145
      Top = 124
      Width = 121
      Height = 21
      DataField = 'VlrIcmsSimples'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 7
    end
    object DBEdit6: TDBEdit
      Left = 145
      Top = 154
      Width = 121
      Height = 21
      DataField = 'IcmsBaseSubst'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 8
    end
    object DBEdit7: TDBEdit
      Left = 145
      Top = 177
      Width = 121
      Height = 21
      DataField = 'IcmsVlrSubst'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 9
    end
    object DBEdit8: TDBEdit
      Left = 33
      Top = 3
      Width = 61
      Height = 19
      TabStop = False
      Color = clMoneyGreen
      Ctl3D = False
      DataField = 'Item'
      DataSource = DM1.dsNotaFiscalItens
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 22
    end
    object RxDBCodPis: TRxDBLookupCombo
      Left = 146
      Top = 234
      Width = 122
      Height = 21
      DropDownCount = 8
      DropDownWidth = 300
      DataField = 'CodPis'
      DataSource = DM1.dsNotaFiscalItens
      LookupField = 'Codigo'
      LookupDisplay = 'Codigo;Nome'
      LookupSource = DMTabImposto.dsTabPis
      TabOrder = 11
    end
    object RXDBCodCofins: TRxDBLookupCombo
      Left = 146
      Top = 256
      Width = 122
      Height = 21
      DropDownCount = 8
      DropDownWidth = 300
      DataField = 'CodCofins'
      DataSource = DM1.dsNotaFiscalItens
      LookupField = 'Codigo'
      LookupDisplay = 'Codigo;Nome'
      LookupSource = DMTabImposto.dsTabCofins
      TabOrder = 13
    end
    object DBEdit9: TDBEdit
      Left = 145
      Top = 278
      Width = 121
      Height = 21
      DataField = 'AliqPis'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 14
    end
    object DBEdit10: TDBEdit
      Left = 145
      Top = 300
      Width = 121
      Height = 21
      DataField = 'AliqCofins'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 16
    end
    object DBEdit11: TDBEdit
      Left = 343
      Top = 278
      Width = 121
      Height = 21
      DataField = 'VlrPis'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 15
    end
    object DBEdit12: TDBEdit
      Left = 343
      Top = 300
      Width = 121
      Height = 21
      DataField = 'VlrCofins'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 17
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 343
      Top = 234
      Width = 122
      Height = 21
      DropDownCount = 8
      DropDownWidth = 300
      DataField = 'CodCSTIPI'
      DataSource = DM1.dsNotaFiscalItens
      LookupField = 'Codigo'
      LookupDisplay = 'Codigo;Nome'
      LookupSource = DM1.dsCSTIPI
      TabOrder = 12
    end
    object rxdbOrigem: TRxDBLookupCombo
      Left = 146
      Top = 385
      Width = 362
      Height = 21
      DropDownCount = 8
      DropDownWidth = 150
      DataField = 'OrigemProd'
      DataSource = DM1.dsNotaFiscalItens
      LookupField = 'Origem'
      LookupDisplay = 'Origem;Nome'
      LookupDisplayIndex = 1
      LookupSource = DMTabImposto.dsOrigemProd
      TabOrder = 20
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 145
      Top = 25
      Width = 121
      Height = 21
      DropDownCount = 8
      DropDownWidth = 150
      DataField = 'NatOper'
      DataSource = DM1.dsNotaFiscalItens
      LookupField = 'Codigo'
      LookupDisplay = 'CodNatOper'
      LookupDisplayIndex = 1
      LookupSource = DM1.dsNatOperacao
      TabOrder = 0
    end
    object DBEdit13: TDBEdit
      Left = 145
      Top = 206
      Width = 121
      Height = 21
      DataField = 'VlrFrete'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 10
    end
    object DBMemo1: TDBMemo
      Left = 146
      Top = 407
      Width = 361
      Height = 56
      DataField = 'ObsComplementar'
      DataSource = DM1.dsNotaFiscalItens
      MaxLength = 250
      ScrollBars = ssVertical
      TabOrder = 21
      OnKeyPress = DBMemo1KeyPress
    end
    object DBEdit14: TDBEdit
      Left = 345
      Top = 71
      Width = 121
      Height = 21
      DataField = 'Icms'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 4
    end
    object RxDBLookupCombo3: TRxDBLookupCombo
      Left = 346
      Top = 102
      Width = 122
      Height = 21
      DropDownCount = 8
      DropDownWidth = 300
      DataField = 'SitTrib'
      DataSource = DM1.dsNotaFiscalItens
      LookupField = 'Codigo'
      LookupDisplay = 'CodSit;Nome'
      LookupSource = DM1.dsSitTributaria
      TabOrder = 6
    end
    object DBEdit15: TDBEdit
      Left = 145
      Top = 332
      Width = 121
      Height = 21
      DataField = 'PERC_TRIBUTO_FEDERAL'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 18
    end
    object DBEdit16: TDBEdit
      Left = 343
      Top = 332
      Width = 121
      Height = 21
      DataField = 'Vlr_Tributo'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 19
    end
    object RxDBLookupCombo4: TRxDBLookupCombo
      Left = 346
      Top = 126
      Width = 122
      Height = 21
      DropDownCount = 8
      DropDownWidth = 300
      DataField = 'ClasFiscal'
      DataSource = DM1.dsNotaFiscalItens
      LookupField = 'ClasFiscal'
      LookupDisplay = 'ClasFiscal'
      LookupSource = DM1.dsClasFiscal
      TabOrder = 23
    end
    object DBEdit17: TDBEdit
      Left = 345
      Top = 23
      Width = 121
      Height = 21
      DataField = 'VlrTotal'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 24
    end
    object DBEdit18: TDBEdit
      Left = 591
      Top = 22
      Width = 121
      Height = 21
      DataField = 'VlrImportacao'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 25
    end
    object DBEdit19: TDBEdit
      Left = 591
      Top = 44
      Width = 121
      Height = 21
      DataField = 'VlrAduaneira'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 26
    end
    object DBEdit20: TDBEdit
      Left = 591
      Top = 66
      Width = 121
      Height = 21
      DataField = 'VlrOutrasDespesas'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 27
    end
    object RzGroupBox2: TRzGroupBox
      Left = 537
      Top = 166
      Width = 245
      Height = 83
      Anchors = [akLeft, akTop, akRight]
      BorderColor = clNavy
      BorderInner = fsButtonUp
      BorderOuter = fsBump
      Caption = ' Unidade Tribut'#225'vel '
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
      TabOrder = 30
      VisualStyle = vsGradient
      object Label67: TLabel
        Left = 37
        Top = 25
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidade:'
      end
      object Label68: TLabel
        Left = 51
        Top = 43
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Qtde.:'
      end
      object Label69: TLabel
        Left = 26
        Top = 61
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vlr.Unit'#225'rio:'
      end
      object DBEdit53: TDBEdit
        Left = 81
        Top = 17
        Width = 87
        Height = 19
        Color = clWhite
        Ctl3D = False
        DataField = 'UNIDADE_TRIB'
        DataSource = DM1.dsNotaFiscalItens
        ParentCtl3D = False
        TabOrder = 0
      end
      object DBEdit54: TDBEdit
        Left = 81
        Top = 35
        Width = 87
        Height = 19
        Color = clWhite
        Ctl3D = False
        DataField = 'QTD_TRIB'
        DataSource = DM1.dsNotaFiscalItens
        ParentCtl3D = False
        TabOrder = 1
      end
      object DBEdit55: TDBEdit
        Left = 81
        Top = 53
        Width = 87
        Height = 19
        Color = clWhite
        Ctl3D = False
        DataField = 'VLR_UNITARIO_TRIB'
        DataSource = DM1.dsNotaFiscalItens
        ParentCtl3D = False
        TabOrder = 2
      end
    end
    object DBEdit21: TDBEdit
      Left = 599
      Top = 102
      Width = 121
      Height = 21
      DataField = 'VlrUnit'
      DataSource = DM1.dsNotaFiscalItens
      ReadOnly = True
      TabOrder = 28
    end
    object DBEdit22: TDBEdit
      Left = 599
      Top = 130
      Width = 121
      Height = 21
      DataField = 'Qtd'
      DataSource = DM1.dsNotaFiscalItens
      ReadOnly = True
      TabOrder = 29
    end
    object DBEdit23: TDBEdit
      Left = 672
      Top = 280
      Width = 134
      Height = 21
      DataField = 'PERC_ICMS_FCP'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 31
    end
    object DBEdit24: TDBEdit
      Left = 672
      Top = 304
      Width = 134
      Height = 21
      DataField = 'PERC_ICMS_UF_DEST'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 32
    end
    object DBEdit25: TDBEdit
      Left = 672
      Top = 328
      Width = 134
      Height = 21
      DataField = 'PERC_ICMS_PARTILHA'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 33
    end
    object DBEdit26: TDBEdit
      Left = 672
      Top = 352
      Width = 134
      Height = 21
      DataField = 'VLR_ICMS_FCP'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 34
    end
    object DBEdit27: TDBEdit
      Left = 672
      Top = 376
      Width = 134
      Height = 21
      DataField = 'VLR_ICMS_UF_DEST'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 35
    end
    object DBEdit28: TDBEdit
      Left = 672
      Top = 400
      Width = 134
      Height = 21
      DataField = 'VLR_ICMS_UF_REMET'
      DataSource = DM1.dsNotaFiscalItens
      TabOrder = 36
    end
  end
end
