object fConsCReceberRem: TfConsCReceberRem
  Left = 1
  Top = 5
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta da remessa para o banco'
  ClientHeight = 536
  ClientWidth = 789
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 13
    Width = 39
    Height = 13
    Caption = 'Parcela:'
    FocusControl = DBEdit3
  end
  object Label23: TLabel
    Left = 163
    Top = 13
    Width = 45
    Height = 13
    Caption = 'Dt.Vecto:'
    FocusControl = DBEdit23
  end
  object Label24: TLabel
    Left = 557
    Top = 13
    Width = 34
    Height = 13
    Caption = 'Banco:'
  end
  object Label25: TLabel
    Left = 352
    Top = 13
    Width = 65
    Height = 13
    Caption = 'C'#243'd.Cedente:'
    FocusControl = DBEdit24
  end
  object Bevel1: TBevel
    Left = -2
    Top = 32
    Width = 791
    Height = 2
    Shape = bsTopLine
    Style = bsRaised
  end
  object Label2: TLabel
    Left = 3
    Top = 60
    Width = 106
    Height = 26
    Alignment = taCenter
    Caption = 'Instru'#231#227'o/Ocorr'#234'ncia/'#13#10'    Movimento:'
  end
  object Label1: TLabel
    Left = 30
    Top = 95
    Width = 78
    Height = 13
    Caption = 'Campo Alterado:'
  end
  object Label4: TLabel
    Left = 21
    Top = 332
    Width = 86
    Height = 13
    Caption = 'Tipo de desconto:'
  end
  object Label5: TLabel
    Left = 43
    Top = 310
    Width = 64
    Height = 13
    Caption = 'Tipo de juros:'
  end
  object Label6: TLabel
    Left = 328
    Top = 310
    Width = 138
    Height = 13
    Caption = 'Vlr/% Juros por dia de atraso:'
  end
  object Label26: TLabel
    Left = 374
    Top = 332
    Width = 90
    Height = 13
    Alignment = taRightJustify
    Caption = 'Vlr/% do desconto:'
  end
  object Label27: TLabel
    Left = 388
    Top = 289
    Width = 78
    Height = 13
    Caption = 'Taxa Multa/IOF:'
  end
  object Label28: TLabel
    Left = 30
    Top = 289
    Width = 77
    Height = 13
    Caption = 'Dias p/Protesto:'
  end
  object Label29: TLabel
    Left = 311
    Top = 354
    Width = 155
    Height = 13
    Caption = 'Vlr.Desc.por dia de antecipa'#231#227'o:'
  end
  object Label30: TLabel
    Left = 63
    Top = 268
    Width = 42
    Height = 13
    Caption = 'Protesto:'
  end
  object Label31: TLabel
    Left = 34
    Top = 246
    Width = 73
    Height = 13
    Caption = 'C'#243'd. do Aceite:'
  end
  object Label32: TLabel
    Left = 10
    Top = 225
    Width = 97
    Height = 13
    Caption = 'Esp'#233'cie documento:'
  end
  object Label33: TLabel
    Left = 14
    Top = 354
    Width = 93
    Height = 13
    Caption = 'Dt.Limite Desconto:'
  end
  object Label34: TLabel
    Left = 36
    Top = 375
    Width = 71
    Height = 13
    Caption = 'Vlr.Abatimento:'
  end
  object Bevel2: TBevel
    Left = -2
    Top = 428
    Width = 791
    Height = 2
    Shape = bsTopLine
    Style = bsRaised
  end
  object Label35: TLabel
    Left = 75
    Top = 449
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object RxLabel5: TRxLabel
    Left = 0
    Top = 422
    Width = 106
    Height = 13
    Caption = 'Dados do Avalista'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label36: TLabel
    Left = 491
    Top = 447
    Width = 55
    Height = 13
    Caption = 'CNPJ/CPF:'
  end
  object Label40: TLabel
    Left = 523
    Top = 471
    Width = 22
    Height = 13
    Caption = 'Cep:'
  end
  object Label37: TLabel
    Left = 57
    Top = 493
    Width = 49
    Height = 13
    Caption = 'Endere'#231'o:'
  end
  object Label38: TLabel
    Left = 70
    Top = 517
    Width = 36
    Height = 13
    Caption = 'Cidade:'
  end
  object Label39: TLabel
    Left = 394
    Top = 517
    Width = 17
    Height = 13
    Caption = 'UF:'
  end
  object Label7: TLabel
    Left = 582
    Top = 64
    Width = 53
    Height = 13
    Caption = 'Imp.Boleto:'
  end
  object Label8: TLabel
    Left = 5
    Top = 182
    Width = 103
    Height = 13
    Caption = 'Intr.Cobr./Mensagem:'
  end
  object Label9: TLabel
    Left = 5
    Top = 203
    Width = 103
    Height = 13
    Caption = 'Intr.Cobr./Mensagem:'
  end
  object Label10: TLabel
    Left = 12
    Top = 117
    Width = 96
    Height = 13
    Caption = 'Carteira / Cobran'#231'a:'
  end
  object Label11: TLabel
    Left = 74
    Top = 402
    Width = 32
    Height = 13
    Caption = 'E-Mail:'
  end
  object Label12: TLabel
    Left = 76
    Top = 472
    Width = 30
    Height = 13
    Caption = 'Bairro:'
  end
  object Label13: TLabel
    Left = 21
    Top = 45
    Width = 86
    Height = 13
    Caption = 'Nosso N'#186' Gerado:'
  end
  object Label14: TLabel
    Left = 2
    Top = 140
    Width = 106
    Height = 13
    Caption = 'Forma Cadastramento:'
  end
  object Label15: TLabel
    Left = 585
    Top = 88
    Width = 50
    Height = 13
    Caption = 'Tipo Doc.:'
  end
  object Label16: TLabel
    Left = 547
    Top = 104
    Width = 86
    Height = 26
    Alignment = taCenter
    Caption = 'C'#243'd.Transmiss'#227'o/'#13#10'Conv'#234'nio:'
  end
  object Label17: TLabel
    Left = 542
    Top = 136
    Width = 93
    Height = 13
    Caption = 'C'#243'd.Compensa'#231#227'o:'
  end
  object Label18: TLabel
    Left = 573
    Top = 179
    Width = 62
    Height = 13
    Caption = 'N'#186' Remessa:'
  end
  object Label19: TLabel
    Left = 606
    Top = 201
    Width = 29
    Height = 13
    Caption = 'Baixa:'
  end
  object Label20: TLabel
    Left = 60
    Top = 161
    Width = 48
    Height = 13
    Caption = 'Comando:'
  end
  object DBEdit3: TDBEdit
    Left = 48
    Top = 5
    Width = 105
    Height = 21
    Color = clInfoBk
    DataField = 'ParcCReceber'
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit23: TDBEdit
    Left = 211
    Top = 5
    Width = 118
    Height = 21
    Color = clInfoBk
    DataField = 'DtVecto'
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit24: TDBEdit
    Left = 416
    Top = 5
    Width = 129
    Height = 21
    Color = clInfoBk
    DataField = 'CodCedente'
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit1: TDBEdit
    Left = 592
    Top = 5
    Width = 185
    Height = 21
    Color = clInfoBk
    DataField = 'lkNomeConta'
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 470
    Top = 302
    Width = 67
    Height = 21
    CharCase = ecUpperCase
    DataField = 'VlrJuros'
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 470
    Top = 324
    Width = 67
    Height = 21
    CharCase = ecUpperCase
    DataField = 'VlrDesconto'
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit2: TDBEdit
    Left = 470
    Top = 281
    Width = 67
    Height = 21
    CharCase = ecUpperCase
    DataField = 'TaxaMulta'
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit4: TDBEdit
    Left = 109
    Top = 281
    Width = 52
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DiasProtesto'
    ReadOnly = True
    TabOrder = 7
  end
  object DBEdit25: TDBEdit
    Left = 470
    Top = 346
    Width = 67
    Height = 21
    CharCase = ecUpperCase
    DataField = 'VlrDescAntecipacao'
    ReadOnly = True
    TabOrder = 8
  end
  object DBEdit26: TDBEdit
    Left = 109
    Top = 367
    Width = 104
    Height = 21
    CharCase = ecUpperCase
    DataField = 'VlrAbatimento'
    ReadOnly = True
    TabOrder = 9
  end
  object DBEdit27: TDBEdit
    Left = 109
    Top = 441
    Width = 337
    Height = 21
    CharCase = ecUpperCase
    DataField = 'Avalista'
    ReadOnly = True
    TabOrder = 10
  end
  object DBEdit28: TDBEdit
    Left = 549
    Top = 439
    Width = 154
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CnpjAvalista'
    ReadOnly = True
    TabOrder = 11
  end
  object DBEdit33: TDBEdit
    Left = 109
    Top = 346
    Width = 104
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DtLimiteDesconto'
    ReadOnly = True
    TabOrder = 12
  end
  object DBEdit7: TDBEdit
    Left = 109
    Top = 60
    Width = 428
    Height = 21
    CharCase = ecUpperCase
    DataField = 'Instrucao'
    ReadOnly = True
    TabOrder = 13
  end
  object DBEdit8: TDBEdit
    Left = 109
    Top = 87
    Width = 428
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CampoAlterado'
    ReadOnly = True
    TabOrder = 14
  end
  object DBEdit9: TDBEdit
    Left = 109
    Top = 217
    Width = 428
    Height = 21
    CharCase = ecUpperCase
    DataField = 'EspDoc'
    ReadOnly = True
    TabOrder = 15
  end
  object DBEdit10: TDBEdit
    Left = 109
    Top = 238
    Width = 104
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CodAceite'
    ReadOnly = True
    TabOrder = 16
  end
  object DBEdit11: TDBEdit
    Left = 109
    Top = 260
    Width = 428
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CodProtestoST'
    ReadOnly = True
    TabOrder = 17
  end
  object DBEdit12: TDBEdit
    Left = 109
    Top = 302
    Width = 104
    Height = 21
    CharCase = ecUpperCase
    DataField = 'TipoJuros'
    ReadOnly = True
    TabOrder = 18
  end
  object DBEdit13: TDBEdit
    Left = 109
    Top = 324
    Width = 104
    Height = 21
    CharCase = ecUpperCase
    DataField = 'TipoDesconto'
    ReadOnly = True
    TabOrder = 19
  end
  object DBEdit32: TDBEdit
    Left = 548
    Top = 463
    Width = 98
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CepAvalista'
    ReadOnly = True
    TabOrder = 20
  end
  object DBEdit29: TDBEdit
    Left = 109
    Top = 485
    Width = 337
    Height = 21
    CharCase = ecUpperCase
    DataField = 'EndAvalista'
    ReadOnly = True
    TabOrder = 21
  end
  object DBEdit30: TDBEdit
    Left = 109
    Top = 509
    Width = 218
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CidAvalista'
    ReadOnly = True
    TabOrder = 22
  end
  object DBEdit31: TDBEdit
    Left = 412
    Top = 509
    Width = 34
    Height = 21
    CharCase = ecUpperCase
    DataField = 'UFAvalista'
    ReadOnly = True
    TabOrder = 23
  end
  object DBEdit14: TDBEdit
    Left = 636
    Top = 56
    Width = 148
    Height = 21
    CharCase = ecUpperCase
    DataField = 'ImpBoleto'
    ReadOnly = True
    TabOrder = 24
  end
  object DBEdit15: TDBEdit
    Left = 109
    Top = 174
    Width = 428
    Height = 21
    CharCase = ecUpperCase
    DataField = 'InstrCobranca1'
    ReadOnly = True
    TabOrder = 25
  end
  object DBEdit16: TDBEdit
    Left = 109
    Top = 195
    Width = 428
    Height = 21
    CharCase = ecUpperCase
    DataField = 'InstrCobranca2'
    ReadOnly = True
    TabOrder = 26
  end
  object DBEdit17: TDBEdit
    Left = 109
    Top = 109
    Width = 428
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NumCarteira'
    ReadOnly = True
    TabOrder = 27
  end
  object DBEdit18: TDBEdit
    Left = 109
    Top = 394
    Width = 468
    Height = 21
    DataField = 'Email'
    TabOrder = 28
  end
  object DBCheckBox1: TDBCheckBox
    Left = 592
    Top = 397
    Width = 153
    Height = 17
    Caption = 'Entregar o boleto por e-mail'
    DataField = 'BoletoPorEmail'
    TabOrder = 29
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBEdit19: TDBEdit
    Left = 109
    Top = 464
    Width = 337
    Height = 21
    CharCase = ecUpperCase
    DataField = 'BairroAvalista'
    ReadOnly = True
    TabOrder = 30
  end
  object DBEdit20: TDBEdit
    Left = 109
    Top = 37
    Width = 196
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NumTitBanco'
    ReadOnly = True
    TabOrder = 31
  end
  object DBEdit21: TDBEdit
    Left = 109
    Top = 131
    Width = 428
    Height = 21
    CharCase = ecUpperCase
    DataField = 'FormaCadastramentoST'
    ReadOnly = True
    TabOrder = 32
  end
  object DBEdit22: TDBEdit
    Left = 636
    Top = 80
    Width = 148
    Height = 21
    CharCase = ecUpperCase
    DataField = 'TipoDocumentoST'
    ReadOnly = True
    TabOrder = 33
  end
  object DBEdit34: TDBEdit
    Left = 636
    Top = 104
    Width = 148
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CodTransmissaoST'
    ReadOnly = True
    TabOrder = 34
  end
  object DBEdit35: TDBEdit
    Left = 636
    Top = 128
    Width = 148
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CodTransmissaoST'
    ReadOnly = True
    TabOrder = 35
  end
  object DBEdit36: TDBEdit
    Left = 637
    Top = 171
    Width = 148
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NumRemessaST'
    ReadOnly = True
    TabOrder = 36
  end
  object DBEdit37: TDBEdit
    Left = 637
    Top = 193
    Width = 148
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CodBaixaST'
    ReadOnly = True
    TabOrder = 37
  end
  object DBEdit38: TDBEdit
    Left = 109
    Top = 152
    Width = 428
    Height = 21
    CharCase = ecUpperCase
    DataField = 'CodComando'
    ReadOnly = True
    TabOrder = 38
  end
end
