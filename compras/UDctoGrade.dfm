object fDctoGrade: TfDctoGrade
  Left = 112
  Top = 213
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Grade do Material'
  ClientHeight = 159
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 159
    Align = alClient
    Color = 11459824
    TabOrder = 0
    object Panel2: TPanel
      Left = 5
      Top = 5
      Width = 765
      Height = 149
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 11459824
      TabOrder = 0
      object Label1: TLabel
        Left = 492
        Top = 18
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'Qtd. Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 6
        Top = 18
        Width = 39
        Height = 13
        Caption = 'Grade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel5: TPanel
        Left = 656
        Top = 5
        Width = 105
        Height = 36
        Color = clSilver
        TabOrder = 3
        object BitBtn5: TBitBtn
          Left = 7
          Top = 5
          Width = 90
          Height = 26
          Hint = 'Confirma a altera'#231#227'o ou inclus'#227'o de um material'
          Caption = '&Confirmar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BitBtn5Click
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
      object VDBGrid1: TVDBGrid
        Left = 8
        Top = 46
        Width = 753
        Height = 97
        DataSource = fDctoEst.dsAuxDctoGrade
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Vertical = True
        TitlesWidth = 70
        OnCellClick = VDBGrid1CellClick
        OnColEnter = VDBGrid1ColEnter
        OnEnter = VDBGrid1Enter
        OnKeyDown = VDBGrid1KeyDown
        Columns = <
          item
            Alignment = taCenter
            Color = clGray
            FieldName = 'Tamanho'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Color = clGray
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'Qtd'
            Title.Alignment = taCenter
          end
          item
            Alignment = taCenter
            FieldName = 'VlrUnitario'
            Title.Alignment = taCenter
            Title.Caption = 'Vlr.Unit'#225'rio'
          end
          item
            Alignment = taCenter
            FieldName = 'VlrTotal'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Vlr.Total'
          end>
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 554
        Top = 10
        Width = 94
        Height = 21
        AutoSize = False
        DecimalPlaces = 3
        DisplayFormat = '0.000'
        TabOrder = 1
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 45
        Top = 10
        Width = 284
        Height = 21
        DropDownCount = 8
        DropDownWidth = 420
        LookupField = 'Codigo'
        LookupDisplay = 'Nome;CodLetra;Largura'
        LookupSource = DM1.dsGrade
        TabOrder = 0
        OnClick = RxDBLookupCombo1CloseUp
        OnCloseUp = RxDBLookupCombo1CloseUp
        OnDropDown = RxDBLookupCombo1DropDown
        OnExit = RxDBLookupCombo1Exit
      end
    end
  end
end
