object FormSendMailOptions: TFormSendMailOptions
  Left = 294
  Top = 187
  Width = 401
  Height = 301
  ActiveControl = EditDestinatarios
  AutoSize = True
  Caption = 'Enviar relatório via E-mail'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelOpcoes: TPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 233
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 8
      Width = 70
      Height = 13
      Caption = 'Destinatário(s):'
    end
    object Label2: TLabel
      Left = 12
      Top = 48
      Width = 244
      Height = 13
      Caption = 'Separe vários destinatários com ponto-e-vírgula ";".'
    end
    object Label3: TLabel
      Left = 11
      Top = 68
      Width = 84
      Height = 13
      Caption = 'Linha de assunto:'
    end
    object GroupBoxFormato: TGroupBox
      Left = 12
      Top = 112
      Width = 237
      Height = 68
      Caption = ' Escolha o formato do relatório: '
      TabOrder = 2
      object RadioButtonPDF: TRadioButton
        Left = 8
        Top = 16
        Width = 217
        Height = 17
        Caption = 'Documento PDF (Acrobat Reader)'
        TabOrder = 0
      end
      object RadioButtonRTF: TRadioButton
        Left = 8
        Top = 32
        Width = 217
        Height = 17
        Caption = 'Formato RichText (Word e OpenOffice)'
        TabOrder = 1
      end
      object RadioButtonHTM: TRadioButton
        Left = 8
        Top = 48
        Width = 217
        Height = 17
        Caption = 'Página Web (HTML)'
        TabOrder = 2
      end
    end
    object EditDestinatarios: TEdit
      Left = 11
      Top = 24
      Width = 370
      Height = 21
      TabOrder = 0
    end
    object EditAssunto: TEdit
      Left = 11
      Top = 84
      Width = 370
      Height = 21
      TabOrder = 1
    end
    object CheckBoxAbrir: TCheckBox
      Left = 12
      Top = 212
      Width = 301
      Height = 17
      Caption = 'Abrir a mensagem para configurar outras opções'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object PanelSubmit: TPanel
    Left = 0
    Top = 233
    Width = 393
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtnEnviar: TBitBtn
      Left = 212
      Top = 4
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Enviar'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtnEnviarClick
      NumGlyphs = 2
      Style = bsNew
    end
    object BitBtnCancelar: TBitBtn
      Left = 300
      Top = 4
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtnCancelarClick
      Style = bsNew
    end
  end
end
