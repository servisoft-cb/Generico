object fCBarra: TfCBarra
  Left = 226
  Top = 221
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'C'#243'd. Barra'
  ClientHeight = 194
  ClientWidth = 423
  Color = clMoneyGreen
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
  object Label1: TLabel
    Left = 32
    Top = 16
    Width = 68
    Height = 13
    Caption = 'C'#243'd. de Barra:'
  end
  object Label2: TLabel
    Left = 81
    Top = 40
    Width = 19
    Height = 13
    Caption = 'Cor:'
  end
  object Edit1: TEdit
    Left = 101
    Top = 8
    Width = 135
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 14
    TabOrder = 0
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 101
    Top = 32
    Width = 244
    Height = 21
    DropDownCount = 8
    LookupField = 'CodCor'
    LookupDisplay = 'NomeCor'
    LookupSource = dsqCor
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 96
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 171
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object qCor: TQuery
    DatabaseName = 'Tabelas'
    SQL.Strings = (
      'SELECT Dbcor.Nome NomeCor, Dbprodutocor.CodCor'
      'FROM "dbProdutoCor.DB" Dbprodutocor'
      '   INNER JOIN "Dbcor.DB" Dbcor'
      '   ON  (Dbprodutocor.CodCor = Dbcor.Codigo)  '
      'WHERE  Dbprodutocor.CodProduto = :CodProduto'
      'ORDER BY NomeCor')
    Left = 312
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CodProduto'
        ParamType = ptUnknown
      end>
    object qCorNomeCor: TStringField
      FieldName = 'NomeCor'
      Origin = 'TABELAS."dbCor.DB".Nome'
      Size = 25
    end
    object qCorCodCor: TIntegerField
      FieldName = 'CodCor'
      Origin = 'TABELAS."dbProdutoCor.DB".CodCor'
    end
  end
  object dsqCor: TDataSource
    DataSet = qCor
    Left = 328
    Top = 88
  end
end
