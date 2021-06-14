object fRelatorio: TfRelatorio
  Left = 306
  Top = 157
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informa'#231#245'es do relat'#243'rio'
  ClientHeight = 125
  ClientWidth = 278
  Color = 10930928
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
  object Label1: TLabel
    Left = 37
    Top = 83
    Width = 83
    Height = 13
    Caption = 'N'#186' '#218'ltima P'#225'gina:'
  end
  object Label2: TLabel
    Left = 37
    Top = 42
    Width = 87
    Height = 13
    Caption = 'N'#186' P'#225'gina Anterior'
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 39
    Height = 16
    Caption = 'Filial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 49
    Top = 8
    Width = 39
    Height = 16
    Caption = 'Filial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 27
    Top = 98
    Width = 118
    Height = 21
    DataField = 'NumUltPagina'
    DataSource = DM1.dsRelatorio
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 192
    Top = 54
    Width = 80
    Height = 33
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 192
    Top = 86
    Width = 80
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object DBEdit2: TDBEdit
    Left = 27
    Top = 56
    Width = 118
    Height = 21
    DataField = 'PaginaAnt'
    DataSource = DM1.dsRelatorio
    TabOrder = 0
  end
end
