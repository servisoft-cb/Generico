object fConsMovAux: TfConsMovAux
  Left = 28
  Top = 160
  Width = 968
  Height = 488
  BorderIcons = [biSystemMenu]
  Caption = 'fConsMovAux'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 960
    Height = 49
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 8
      Top = 8
      Width = 153
      Height = 28
      Caption = 'Consultar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 49
    Width = 960
    Height = 405
    Align = alClient
    DataSource = dsqMovimento
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid1DblClick
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 8
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'CodConta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtMovimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrMovDebito'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrMovCredito'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Historico'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PlanoContas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodPlanoContasItens'
        Visible = True
      end>
  end
  object qMovimento: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'select m.*, c.nomeconta'
      'from dbmovimentos.db m'
      'inner join dbcontas.db c'
      '  on m.codconta = c.codconta'
      'where ((m.planocontas is null) or (m.planocontas <= 0))'
      
        '    or   ((m.codplanocontasitens is null) or (m.codplanocontasit' +
        'ens <= 0))'
      'Order by m.CodConta, m.DtMovimento, m.NumMovimento')
    Left = 488
    Top = 160
    object qMovimentoCodConta: TIntegerField
      FieldName = 'CodConta'
    end
    object qMovimentoNumMovimento: TIntegerField
      FieldName = 'NumMovimento'
    end
    object qMovimentoNumCReceber: TIntegerField
      FieldName = 'NumCReceber'
    end
    object qMovimentoNumCPagar: TIntegerField
      FieldName = 'NumCPagar'
    end
    object qMovimentoNumPedVenda: TIntegerField
      FieldName = 'NumPedVenda'
    end
    object qMovimentoDtMovimento: TDateField
      FieldName = 'DtMovimento'
    end
    object qMovimentoVlrMovDebito: TFloatField
      FieldName = 'VlrMovDebito'
    end
    object qMovimentoVlrMovCredito: TFloatField
      FieldName = 'VlrMovCredito'
    end
    object qMovimentoHistorico: TStringField
      FieldName = 'Historico'
      Size = 100
    end
    object qMovimentoNumChequePag: TIntegerField
      FieldName = 'NumChequePag'
    end
    object qMovimentoPlanoContas: TIntegerField
      FieldName = 'PlanoContas'
    end
    object qMovimentoNumNota: TIntegerField
      FieldName = 'NumNota'
    end
    object qMovimentoCodCli: TIntegerField
      FieldName = 'CodCli'
    end
    object qMovimentoCodForn: TIntegerField
      FieldName = 'CodForn'
    end
    object qMovimentoNumNotaEnt: TIntegerField
      FieldName = 'NumNotaEnt'
    end
    object qMovimentoSaldoCliente: TFloatField
      FieldName = 'SaldoCliente'
    end
    object qMovimentoSaldoFornecedor: TFloatField
      FieldName = 'SaldoFornecedor'
    end
    object qMovimentoSaldoPlanoContas: TFloatField
      FieldName = 'SaldoPlanoContas'
    end
    object qMovimentoSaldoConta: TFloatField
      FieldName = 'SaldoConta'
    end
    object qMovimentoCodPlanoContasItens: TIntegerField
      FieldName = 'CodPlanoContasItens'
    end
    object qMovimentoCpagarHist: TIntegerField
      FieldName = 'CpagarHist'
    end
    object qMovimentoFilial: TIntegerField
      FieldName = 'Filial'
    end
    object qMovimentoParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object qMovimentoDtUsuario: TDateField
      FieldName = 'DtUsuario'
    end
    object qMovimentoHrUsuario: TTimeField
      FieldName = 'HrUsuario'
    end
    object qMovimentoUsuario: TStringField
      FieldName = 'Usuario'
      Size = 15
    end
    object qMovimentonomeconta: TStringField
      FieldName = 'nomeconta'
      Size = 40
    end
  end
  object dsqMovimento: TDataSource
    DataSet = qMovimento
    Left = 512
    Top = 160
  end
end
