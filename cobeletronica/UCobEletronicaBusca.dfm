object fCobEletronicaBusca: TfCobEletronicaBusca
  Left = 21
  Top = 74
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Cobran'#231'a Eletr'#244'nica - Busca'
  ClientHeight = 547
  ClientWidth = 967
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 967
    Height = 56
    Align = alTop
    BevelOuter = bvLowered
    Color = clMoneyGreen
    TabOrder = 0
    object Label3: TLabel
      Left = 858
      Top = 39
      Width = 100
      Height = 13
      Caption = 'J'#225' enviada ao banco'
    end
    object ALed1: TALed
      Left = 838
      Top = 36
      Width = 16
      Height = 16
      FalseColor = clGreen
    end
    object Label7: TLabel
      Left = 16
      Top = 14
      Width = 38
      Height = 13
      Caption = 'Mostrar:'
    end
    object Label9: TLabel
      Left = 20
      Top = 38
      Width = 34
      Height = 13
      Caption = 'Banco:'
    end
    object BitBtn1: TBitBtn
      Left = 249
      Top = 24
      Width = 141
      Height = 28
      Hint = 'Gera rela'#231#227'o de t'#237'tulos cfe. sele'#231#227'o de datas'
      Caption = '&Filtrar as duplicatas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        46050000424D460500000000000036040000280000000D000000110000000100
        08000000000010010000C30E0000C30E00000001000000000000000000008080
        8000000080000080800000800000808000008000000080008000408080004040
        0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
        FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
        80008000FF004080FF00C0DCC000F0CAA60060208000C0FFFF00E0E0A0008000
        60008080FF00C0800000FFC0C000FFCF0000FFFF6900E0FFE000B39CDD00EE8F
        B300F96F2A00CDB83F0036844800418C9500425E8E007A62A000AC4F6200BE2F
        1D007666280000450000013E450013286A006A39850085324A00040404000808
        08000C0C0C0011111100161616001C1C1C002222220029292900303030005F5F
        5F00555555004D4D4D0042424200393939000007000000000D008199B700B499
        840090BDBD00607F7F007F606000000E000000001B00000028002B090800001D
        0000000039009B00000000250000000049003B111100002F000000005D004517
        1700003A000011114900531C1C00FF160000FF002B006C212100141459000051
        00006A1A47006732190000610000FF310000FF0061007B20530067431600E22E
        2E001659260004465100492E68008F520700B8186A0015239000FF530000FF00
        A300124A6A006C3375009A414A000B653700152CA400B11F8300FF2C4E00B651
        2000926408000B566F00AD435900127236001733B00000A100001F5F77007147
        89001C43B0007D2DB70095860000236E7A00009F260001A9730000CA0000015B
        AC00C21D2000705294004CAA240089940A007B6E360090754400A800FF00FF71
        0000FF00DF004A915600F84834008232CC007041E40001CA680042BC3600FF9A
        0000B7229600337D85008CB72500ED5A360000FF5C000048FF00A29B22004DCF
        42005258C20095D32000E024A500B556730000A9A9003C6FD000589F67000BCF
        890000ACFF00FE2EA7007F59E20067DC4C00FF18FF00FF7D3A0018D0B10000FF
        C70000E2FF003D9ADF009F815600BA43C6008B71AF00C9A23800CE53D100659A
        FF00DBCA4600FF4DFF006AE9C800E0DE4C00FF98FF0082C0DF00A5ECE900CDF6
        F500FFD0FF005AACB100AE916300654C22003F4E8D0070705000FFFFD000FFE7
        FF00696969007777770086868600969696009D9D9D00A4A4A400B2B2B200CBCB
        CB00D7D7D700DDDDDD00E3E3E300EAEAEA00F1F1F100F8F8F80066C1B20078BF
        8000F0F0C600FFA4B200FFB3FF00A38ED10037DCC300549EA00070AE7600C19E
        7800BF648300D383A400323FD100007DFF0023784400605F24002C0E0E000000
        BE00001FFF00003931003E85D9008577020081D8B0001D21560030000000B3C8
        88000079A0008170EA0069F15100CD749100FF7CFF00FFFFA200F0FBFF00A4A0
        A000537F200029798A00326932007F05EC00AC112F00423FEE000F0F0F0F0001
        0F0F0F0F0F0F0F0000000F0F0F0F0000010F0F0F0F0F0F0000000F0F0F0F0F00
        00010F0F0F0F0F0000000F0F0F0F0F001100010F0F0F0F0000000F0F0F000000
        001100010F0F0F0000000F0F0F0011110E111100010F0F0000000F0F0F0F000E
        11000000000F0F0000000F0F0F0F00110E1100010F0F0F0000000F0000000000
        110E1100010F0F0000000F000E110E110E110E1100010F0000000F0F000E110E
        11000000000F0F0000000F0F00110E110E1100010F0F0F0000000F0F0F00110E
        110E1100010F0F0000000F0F0F000E0E0E110E0E00010F0000000F0F0F0F000E
        110E0E110E00010000000F0F0F0F0000000000000000000000000F0F0F0F0F0F
        0F0F0F0F0F0F0F000000}
    end
    object ComboBox1: TComboBox
      Left = 56
      Top = 6
      Width = 191
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'N'#227'o Enviadas'
      Items.Strings = (
        'N'#227'o Enviadas'
        'Impresso Boleto e N'#227'o Enviado'
        'Ambas')
    end
    object ComboBox2: TComboBox
      Left = 56
      Top = 30
      Width = 191
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 2
      Text = 'Somente do Banco Selecionado'
      Items.Strings = (
        'Todos'
        'Somente do Banco Selecionado')
    end
    object BitBtn4: TBitBtn
      Left = 390
      Top = 24
      Width = 141
      Height = 28
      Hint = 'Confirma as altera'#231#245'es abaixo'
      Caption = 'Copiar os Selecionados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn4Click
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
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 56
    Width = 967
    Height = 491
    Align = alClient
    DataSource = msTitulos
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 1
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
    ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    OnGetCellParams = SMDBGrid1GetCellParams
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 27
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 13
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'IDCobEletronica'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Mov. Remessa'
        Width = 74
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumNota'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Nota'
        Width = 63
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Serie'
        Title.Alignment = taCenter
        Title.Caption = 'S'#233'rie'
        Width = 38
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Parcela'
        Title.Alignment = taCenter
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NossoNumero'
        Title.Alignment = taCenter
        Title.Caption = 'Nosso N'#186' (Banco)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrParcela'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Parcela'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtEmissao'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Emiss'#227'o'
        Width = 75
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtVencimento'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Vecto.'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeCliente'
        Title.Alignment = taCenter
        Title.Caption = 'Cliente'
        Width = 252
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeConta'
        Title.Alignment = taCenter
        Title.Caption = 'Banco'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodCliente'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Cliente'
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumCReceber'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' C.Receber'
        Visible = True
      end>
  end
  object qBoletos: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbcreceberparc.NumCReceber, Dbcreceberparc.ParcCReceber, ' +
        'Dbcreceberparc.VlrParcCReceber, Dbcreceberparc.DtVencCReceber, D' +
        'bcreceberparc.CodCli, Dbcreceberparc.NumNota, Dbcreceberparc.DtG' +
        'erado, Dbcliente.Nome, Dbcliente.Endereco||'#39', '#39'||Dbcliente.NumEn' +
        'd as Endereco, Dbcliente.Bairro, Dbcliente.Uf, Dbcliente.Cep, Db' +
        'cliente.Pessoa, Dbcliente.CgcCpf, Dbcliente.InscrEst, Dbcliente.' +
        'EndPgto, Dbcliente.BairroPgto, Dbcliente.CepPgto, Dbcliente.UfPg' +
        'to, Dbcliente.CodCidade, Dbcliente.CodCidadeP, Dbcreceberparc.Ar' +
        'qGerado, Dbcreceberparc.NumTitBanco, dbCliente.Email, Dbcreceber' +
        'parc.NumCarteira, Dbcreceberparc.Filial, Dbcreceberparc.RestParc' +
        'ela, Dbcreceberparc.CodBancoBoleto, dbCliente.ComplEndereco, dbC' +
        'ReceberParc.Serie, dbCReceberParc.NumSeqNota, dbCReceberParc.IDC' +
        'obEletronica'
      'FROM "DBCRECEBERPARC.DB" Dbcreceberparc'
      '   INNER JOIN "dbCliente.DB" Dbcliente'
      '   ON  (Dbcreceberparc.CodCli = Dbcliente.Codigo)'
      
        'WHERE ((Dbcreceberparc.cancelado = False) OR (Dbcreceberparc.Can' +
        'celado IS NULL))'
      
        '  AND (Dbcreceberparc.DtGerado BETWEEN :D1 AND :D2) and (Dbcrece' +
        'berparc.Filial = :Filial)'
      
        '  AND (Dbcreceberparc.CodConta = :CodConta)  AND (Dbcreceberparc' +
        '.RestParcela > 0)'
      
        'ORDER BY Dbcreceberparc.DtGerado, Dbcreceberparc.NumCReceber, Db' +
        'creceberparc.ParcCReceber, Dbcreceberparc.DtVencCReceber'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 96
    Top = 192
    ParamData = <
      item
        DataType = ftDate
        Name = 'D1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'D2'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Filial'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CodConta'
        ParamType = ptUnknown
      end>
    object qBoletosFilial: TIntegerField
      FieldName = 'Filial'
      Origin = 'TABELAS."dbCReceberParc.DB".Filial'
    end
    object qBoletosNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
      Origin = 'TABELAS."dbCReceberParc.DB".NumCReceber'
    end
    object qBoletosParcCReceber: TIntegerField
      FieldName = 'ParcCReceber'
      Origin = 'TABELAS."dbCReceberParc.DB".ParcCReceber'
    end
    object qBoletosVlrParcCReceber: TFloatField
      FieldName = 'VlrParcCReceber'
      Origin = 'TABELAS."dbCReceberParc.DB".VlrParcCReceber'
    end
    object qBoletosDtVencCReceber: TDateField
      FieldName = 'DtVencCReceber'
      Origin = 'TABELAS."dbCReceberParc.DB".DtVencCReceber'
    end
    object qBoletosCodCli: TIntegerField
      FieldName = 'CodCli'
      Origin = 'TABELAS."dbCReceberParc.DB".CodCli'
    end
    object qBoletosNumNota: TIntegerField
      FieldName = 'NumNota'
      Origin = 'TABELAS."dbCReceberParc.DB".NumNota'
    end
    object qBoletosDtGerado: TDateField
      FieldName = 'DtGerado'
      Origin = 'TABELAS."dbCReceberParc.DB".DtGerado'
    end
    object qBoletosNome: TStringField
      FieldName = 'Nome'
      Origin = 'TABELAS."dbCliente.DB".Nome'
      Size = 40
    end
    object qBoletosEndereco: TStringField
      FieldName = 'Endereco'
      Origin = 'TABELAS."dbCliente.DB".Endereco'
      Size = 40
    end
    object qBoletosBairro: TStringField
      FieldName = 'Bairro'
      Origin = 'TABELAS."dbCliente.DB".Bairro'
      Size = 25
    end
    object qBoletosUf: TStringField
      FieldName = 'Uf'
      Origin = 'TABELAS."dbCliente.DB".Uf'
      Size = 2
    end
    object qBoletosCep: TStringField
      FieldName = 'Cep'
      Origin = 'TABELAS."dbCliente.DB".Cep'
      Size = 10
    end
    object qBoletosPessoa: TStringField
      FieldName = 'Pessoa'
      Origin = 'TABELAS."dbCliente.DB".Pessoa'
      Size = 1
    end
    object qBoletosCgcCpf: TStringField
      FieldName = 'CgcCpf'
      Origin = 'TABELAS."dbCliente.DB".CgcCpf'
      Size = 18
    end
    object qBoletosEndPgto: TStringField
      FieldName = 'EndPgto'
      Origin = 'TABELAS."dbCliente.DB".EndPgto'
      Size = 40
    end
    object qBoletosBairroPgto: TStringField
      FieldName = 'BairroPgto'
      Origin = 'TABELAS."dbCliente.DB".BairroPgto'
      Size = 26
    end
    object qBoletosCepPgto: TStringField
      FieldName = 'CepPgto'
      Origin = 'TABELAS."dbCliente.DB".CepPgto'
      Size = 10
    end
    object qBoletosUfPgto: TStringField
      FieldName = 'UfPgto'
      Origin = 'TABELAS."dbCliente.DB".UfPgto'
      Size = 2
    end
    object qBoletosInscrEst: TStringField
      FieldName = 'InscrEst'
      Origin = 'TABELAS."dbCliente.DB".InscrEst'
      Size = 18
    end
    object qBoletosCodCidade: TIntegerField
      FieldName = 'CodCidade'
      Origin = 'TABELAS."dbCliente.DB".CodCidade'
    end
    object qBoletosCodCidadeP: TIntegerField
      FieldName = 'CodCidadeP'
      Origin = 'TABELAS."dbCliente.DB".CodCidadeP'
    end
    object qBoletoslkCidade: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCidade'
      LookupDataSet = DM1.tCidade
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCidade'
      Size = 26
      Lookup = True
    end
    object qBoletoslkCidadePgto: TStringField
      FieldKind = fkLookup
      FieldName = 'lkCidadePgto'
      LookupDataSet = DM1.tCidade
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'CodCidadeP'
      Size = 26
      Lookup = True
    end
    object qBoletosArqGerado: TBooleanField
      FieldName = 'ArqGerado'
      Origin = 'TABELAS."dbCReceberParc.DB".ArqGerado'
    end
    object qBoletosNumTitBanco: TStringField
      FieldName = 'NumTitBanco'
      Origin = 'TABELAS."dbCReceberParc.DB".NumTitBanco'
    end
    object qBoletosEmail: TStringField
      FieldName = 'Email'
      Origin = 'TABELAS."dbCliente.DB".Email'
      Size = 50
    end
    object qBoletosNumCarteira: TStringField
      FieldName = 'NumCarteira'
      Origin = 'TABELAS."dbCReceberParc.DB".NumCarteira'
      Size = 3
    end
    object qBoletosRestParcela: TFloatField
      FieldName = 'RestParcela'
      Origin = 'TABELAS."DBCRECEBERPARC.DB".RestParcela'
    end
    object qBoletosCodBancoBoleto: TIntegerField
      FieldName = 'CodBancoBoleto'
      Origin = 'TABELAS."DBCRECEBERPARC.DB".CodBancoBoleto'
    end
    object qBoletosComplEndereco: TStringField
      FieldName = 'ComplEndereco'
      Origin = 'TABELAS."dbCliente.DB".ComplEndereco'
      Size = 50
    end
    object qBoletosSerie: TStringField
      FieldName = 'Serie'
      Origin = 'TABELAS."DBCRECEBERPARC.DB".Serie'
      Size = 3
    end
    object qBoletosNumSeqNota: TIntegerField
      FieldName = 'NumSeqNota'
      Origin = 'TABELAS."DBCRECEBERPARC.DB".NumSeqNota'
    end
    object qBoletosIDCobEletronica: TIntegerField
      FieldName = 'IDCobEletronica'
      Origin = 'TABELAS."DBCRECEBERPARC.DB".IDCobEletronica'
    end
  end
  object msTitulos: TDataSource
    DataSet = mTitulos
    Left = 296
    Top = 192
  end
  object dsqBoletos: TDataSource
    DataSet = qBoletos
    Left = 120
    Top = 192
  end
  object mTitulos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NumCReceber'
        DataType = ftInteger
      end
      item
        Name = 'Parcela'
        DataType = ftInteger
      end
      item
        Name = 'NumNota'
        DataType = ftInteger
      end
      item
        Name = 'VlrParcela'
        DataType = ftFloat
      end
      item
        Name = 'ArqGerado'
        DataType = ftBoolean
      end
      item
        Name = 'DtEmissao'
        DataType = ftDate
      end
      item
        Name = 'DtVencimento'
        DataType = ftDate
      end
      item
        Name = 'CodCliente'
        DataType = ftInteger
      end
      item
        Name = 'NomeCliente'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NomeConta'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CodConta'
        DataType = ftInteger
      end
      item
        Name = 'Filial'
        DataType = ftInteger
      end
      item
        Name = 'Serie'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NumSeqNota'
        DataType = ftInteger
      end
      item
        Name = 'IDCobEletronica'
        DataType = ftInteger
      end
      item
        Name = 'NossoNumero'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CgcCpf'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'Pessoa'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NumCarteira'
        DataType = ftString
        Size = 3
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'NumNota;Parcela'
    Params = <>
    StoreDefs = True
    Left = 273
    Top = 193
    Data = {
      DC0100009619E0BD010000001800000013000000000003000000DC010B4E756D
      435265636562657204000100000000000750617263656C610400010000000000
      074E756D4E6F746104000100000000000A566C7250617263656C610800040000
      0000000941727147657261646F0200030000000000094474456D697373616F04
      000600000000000C447456656E63696D656E746F04000600000000000A436F64
      436C69656E746504000100000000000B4E6F6D65436C69656E74650100490000
      000100055749445448020002002800094E6F6D65436F6E746101004900000001
      00055749445448020002001E0008436F64436F6E746104000100000000000646
      696C69616C040001000000000005536572696501004900000001000557494454
      480200020003000A4E756D5365714E6F746104000100000000000F4944436F62
      456C6574726F6E69636104000100000000000B4E6F73736F4E756D65726F0100
      4900000001000557494454480200020014000643676343706601004900000001
      0005574944544802000200120006506573736F61010049000000010005574944
      54480200020001000B4E756D4361727465697261010049000000010005574944
      544802000200030001000D44454641554C545F4F524445520200820000000000}
    object mTitulosNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
    end
    object mTitulosParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object mTitulosNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object mTitulosVlrParcela: TFloatField
      FieldName = 'VlrParcela'
      DisplayFormat = '###,###,##0.00'
    end
    object mTitulosArqGerado: TBooleanField
      FieldName = 'ArqGerado'
    end
    object mTitulosDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object mTitulosDtVencimento: TDateField
      FieldName = 'DtVencimento'
    end
    object mTitulosCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object mTitulosNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 40
    end
    object mTitulosNomeConta: TStringField
      FieldName = 'NomeConta'
      Size = 30
    end
    object mTitulosCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object mTitulosFilial: TIntegerField
      FieldName = 'Filial'
    end
    object mTitulosSerie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object mTitulosNumSeqNota: TIntegerField
      FieldName = 'NumSeqNota'
    end
    object mTitulosIDCobEletronica: TIntegerField
      FieldName = 'IDCobEletronica'
    end
    object mTitulosNossoNumero: TStringField
      FieldName = 'NossoNumero'
    end
    object mTitulosCgcCpf: TStringField
      FieldName = 'CgcCpf'
      Size = 18
    end
    object mTitulosPessoa: TStringField
      FieldName = 'Pessoa'
      Size = 1
    end
    object mTitulosNumCarteira: TStringField
      FieldName = 'NumCarteira'
      Size = 3
    end
  end
end
