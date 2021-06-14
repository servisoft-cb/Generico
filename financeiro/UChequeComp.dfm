object fChequeComp: TfChequeComp
  Left = 151
  Top = 129
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Compensa'#231#227'o de Cheques'
  ClientHeight = 493
  ClientWidth = 717
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 717
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 2
      Top = 50
      Width = 82
      Height = 13
      Caption = 'Dt. Compensado:'
    end
    object DBText1: TDBText
      Left = 50
      Top = 8
      Width = 369
      Height = 13
      DataField = 'Empresa'
      DataSource = DM1.dsFilial
    end
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 23
      Height = 13
      Caption = 'Filial:'
    end
    object DateEdit1: TDateEdit
      Left = 89
      Top = 42
      Width = 95
      Height = 21
      NumGlyphs = 2
      StartOfWeek = Sun
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 189
      Top = 40
      Width = 105
      Height = 26
      Caption = '&Confirmar'
      TabOrder = 1
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 295
      Top = 40
      Width = 105
      Height = 26
      Caption = '&Fechar'
      TabOrder = 2
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0038383838380E
        038383838383830E603800000000380E660033333330830E660333333330000E
        660333330030330E660333330E00330E660300000EE0330E06030EEEEEE6030E
        660300000E60330E660333330600330E660333330030330E6603333333303330
        E6033333333033330E0333333330000000033333333333333333}
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 73
    Width = 717
    Height = 420
    Align = alClient
    DataSource = dsqPendentes
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
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 27
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 10
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Filial'
        Title.Alignment = taCenter
        Width = 34
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CodConta'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'd. Conta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeConta'
        Title.Alignment = taCenter
        Title.Caption = 'Nome da Conta'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumCheque'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Cheque'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtEmissao'
        Title.Alignment = taCenter
        Title.Caption = 'Data Emiss'#227'o'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtPrevista'
        Title.Alignment = taCenter
        Title.Caption = 'Data Prevista'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrTotal'
        Title.Alignment = taCenter
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NumConta'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Conta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nominal'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  object qPendentes: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      
        'SELECT Dbcontas.CodConta, Dbcontas.NomeConta, Dbcontas.Filial, D' +
        'bcheque.NumCheque, Dbcheque.DtEmissao, Dbcheque.DtPrevista, Dbch' +
        'eque.VlrTotal, Dbcheque.Nominal, Dbcheque.DtEntrada, Dbcontas.Nu' +
        'mConta, Dbcontas.DigConta'
      'FROM "dbContas.DB" Dbcontas'
      '   INNER JOIN "dbCheque.DB" Dbcheque'
      '   ON  (Dbcontas.CodConta = Dbcheque.CodConta)  '
      'WHERE  Dbcheque.DtEntrada IS NULL '
      '     AND DbCheque.Filial = :Filial'
      'ORDER BY Dbcontas.NomeConta, Dbcheque.NumCheque')
    Left = 488
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Filial'
        ParamType = ptUnknown
      end>
    object qPendentesCodConta: TIntegerField
      FieldName = 'CodConta'
      Origin = 'TABELAS."dbContas.DB".CodConta'
    end
    object qPendentesNomeConta: TStringField
      FieldName = 'NomeConta'
      Origin = 'TABELAS."dbContas.DB".NomeConta'
      Size = 40
    end
    object qPendentesFilial: TIntegerField
      FieldName = 'Filial'
      Origin = 'TABELAS."dbContas.DB".Filial'
    end
    object qPendentesNumCheque: TIntegerField
      FieldName = 'NumCheque'
      Origin = 'TABELAS."dbCheque.DB".NumCheque'
    end
    object qPendentesDtEmissao: TDateField
      FieldName = 'DtEmissao'
      Origin = 'TABELAS."dbCheque.DB".DtEmissao'
    end
    object qPendentesDtPrevista: TDateField
      FieldName = 'DtPrevista'
      Origin = 'TABELAS."dbCheque.DB".DtPrevista'
    end
    object qPendentesVlrTotal: TFloatField
      FieldName = 'VlrTotal'
      Origin = 'TABELAS."dbCheque.DB".VlrTotal'
    end
    object qPendentesNominal: TStringField
      FieldName = 'Nominal'
      Origin = 'TABELAS."dbCheque.DB".Nominal'
      Size = 40
    end
    object qPendentesDtEntrada: TDateField
      FieldName = 'DtEntrada'
      Origin = 'TABELAS."dbCheque.DB".DtEntrada'
    end
    object qPendentesNumConta: TStringField
      FieldName = 'NumConta'
      Origin = 'TABELAS."dbContas.DB".NumConta'
      Size = 12
    end
    object qPendentesDigConta: TStringField
      FieldName = 'DigConta'
      Origin = 'TABELAS."dbContas.DB".DigConta'
      Size = 1
    end
  end
  object dsqPendentes: TDataSource
    DataSet = qPendentes
    Left = 504
    Top = 112
  end
end
