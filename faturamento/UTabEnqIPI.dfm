object fTabEnqIPI: TfTabEnqIPI
  Left = 328
  Top = 177
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro da Tabela do Enquadramento do IPI'
  ClientHeight = 387
  ClientWidth = 679
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
    Width = 679
    Height = 39
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 6
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 81
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 39
    Width = 679
    Height = 348
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 594
      Top = 12
      Width = 14
      Height = 13
      Caption = 'ID:'
    end
    object Label3: TLabel
      Left = 59
      Top = 21
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object Label4: TLabel
      Left = 64
      Top = 42
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome:'
    end
    object Label38: TLabel
      Left = 71
      Top = 63
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo:'
    end
    object DBEdit1: TDBEdit
      Left = 611
      Top = 5
      Width = 62
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'ID'
      DataSource = DMTabEnqIPI.dsEnqIPI
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 96
      Top = 13
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODIGO'
      DataSource = DMTabEnqIPI.dsEnqIPI
      TabOrder = 1
    end
    object DBEdit7: TDBEdit
      Left = 96
      Top = 34
      Width = 552
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = DMTabEnqIPI.dsEnqIPI
      TabOrder = 2
    end
    object RxDBComboBox12: TRxDBComboBox
      Left = 96
      Top = 55
      Width = 145
      Height = 21
      Style = csDropDownList
      DataField = 'TIPO'
      DataSource = DMTabEnqIPI.dsEnqIPI
      EnableValues = True
      ItemHeight = 13
      Items.Strings = (
        'Imune'
        'Suspensao'
        'Isencao'
        'Reducao'
        'Outros')
      TabOrder = 3
      Values.Strings = (
        'M'
        'S'
        'I'
        'R'
        'O')
    end
  end
end
