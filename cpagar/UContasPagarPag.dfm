ÿ
 TFCONTASPAGARPAG 0ÿ*  TPF0TfContasPagarPagfContasPagarPagLeft¿ TopFBorderIconsbiSystemMenu BorderStylebsSingleCaption(Pagamento das Parcelas do Contas a PagarClientHeightClientWidthÂColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style 
KeyPreview	OldCreateOrder	PositionpoScreenCenterOnClose	FormCloseOnShowFormShowPixelsPerInch`
TextHeight TPanelPanel1Left Top WidthÂHeightAlignalClient
BevelInnerbvRaised
BevelOuter	bvLoweredColorclMoneyGreenTabOrder  TPanelPanel3LeftTop/Width¾Height_AlignalBottom
BevelOuter	bvLoweredColorclMoneyGreenTabOrder  TDBTextDBText2LeftOTopWidth"Height	DataField
ParcCPagar
DataSourceDM1.dsCPagarParcFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Heightó	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel2LeftTopWidth4HeightCaption
   NÂº Parc.:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightó	Font.NameMS Sans Serif
Font.Style 
ParentFont  TDBTextDBText3LeftÅ TopWidthBHeight	DataFieldVlrParcCPagar
DataSourceDM1.dsCPagarParcFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Heightó	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel3Left|TopWidthBHeightCaptionValor Orig.:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightó	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel4LeftTop#WidthXHeightCaptionDt.de Vencimento:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel5LeftÖ Top#WidthbHeightCaptionData de Pagamento:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel6LeftTop WidthHeightCaptionJuros  TLabelLabel7LeftTop^WidthOHeightCaption   CÃ³digo da ContaFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel8Left.TopCWidth@HeightCaptionVlr.Desconto:  TLabelLabel9LeftTop^Width`HeightCaptionValor de PagamentoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel1LeftTopWidthEHeightCaptionValor Rest.:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightó	Font.NameMS Sans Serif
Font.Style 
ParentFont  TDBTextDBText1LeftUTopWidthBHeight	DataFieldRestParcela
DataSourceDM1.dsCPagarParcFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Heightó	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel12LeftTop¬ WidthIHeightCaptionPlano de Conta  TSpeedButtonSpeedButton8LeftTop¸ WidthHeightHint"Abre o cadastro do plano de contas
Glyph.Data
ò   î   BMî       v   (               x                                  ÀÀÀ   ÿ  ÿ   ÿÿ ÿ   ÿ ÿ ÿÿ  ÿÿÿ     ÿÿÿðð ðÿÿÿðð ðÿÿÿðDDDD  DDDD° ° »»°»»° ° °  ParentShowHintShowHint	OnClickSpeedButton8Click  TBevelBevel1LeftTopWidthÀHeightShape	bsTopLineStylebsRaised  TSpeedButtonSpeedButton1LeftTop?WidthHeightHint   Abre o cadastro de histÃ³ricos
Glyph.Data
ò   î   BMî       v   (               x                                  ÀÀÀ   ÿ  ÿ   ÿÿ ÿ   ÿ ÿ ÿÿ  ÿÿÿ     ÿÿÿðð ðÿÿÿðð ðÿÿÿðDDDD  DDDD° ° »»°»»° ° °  ParentShowHintShowHint	OnClickSpeedButton1Click  TLabelLabel10LeftTop3Width)HeightCaption
   HistÃ³rico  TLabelLabel11LeftVTopCWidth:HeightCaptionAbatimentosVisible  TDBTextDBText5LeftuTop"WidthBHeight	DataFieldDtVencCPagar
DataSourceDM1.dsCPagarParcFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Heightó	Font.NameMS Sans Serif
Font.Style 
ParentFont  TBevelBevel2Left	Top.WidthÀHeightShape	bsTopLineStylebsRaised  TLabelLabel13LeftTopWidth7HeightCaption   NÂº Cheque:  TLabelLabel14Leftª TopWidth HeightCaption   Dt.PrevisÃ£o Entrada Cheque:  TLabelLabel15LeftTopÔ Width2HeightCaption	Sub-Conta  TRxDBLookupComboRxDBLookupCombo3LeftTop¼ Widthó HeightDropDownCount	DataFieldPlanoContas
DataSourceDM1.dsCPagarParcLookupFieldCodigoLookupDisplay	DescricaoLookupSourceDM1.dsPlanoContasParentShowHintShowHintTabOrderOnChangeRxDBLookupCombo3Enter
OnDropDownRxDBLookupCombo3EnterOnEnterRxDBLookupCombo3Enter  TCurrencyEditCurrencyEdit1LeftTopAWidth6HeightAutoSizeDisplayFormat0TabOrderOnEnterCurrencyEdit1EnterOnExitCurrencyEdit1Exit  	TDateEdit	DateEdit1Left:TopWidth]Height	NumGlyphsStartOfWeekSunTabOrder   TCurrencyEditCurrencyEdit2LeftTopnWidthlHeightAutoSizeDisplayFormat###,###,##0.00TabOrderOnExitCurrencyEdit2Exit  TRxDBLookupComboRxDBLookupCombo1LeftFTopAWidth8HeightDropDownCountLookupFieldCodigoLookupDisplayNomeLookupSourcedsHistoricoTabOrder	TabStopOnChangeRxDBLookupCombo1Change	OnCloseUpRxDBLookupCombo1Exit
OnDropDownRxDBLookupCombo1EnterOnEnterRxDBLookupCombo1EnterOnExitRxDBLookupCombo1Exit  TEditEdit1LeftFTopAWidth&HeightTabOrder
OnChangeEdit1Change  TCurrencyEditCurrencyEdit3LeftTop WidthPHeightAutoSizeDisplayFormat0.00TabOrder  TCurrencyEditCurrencyEdit4LeftTop<WidthHeightAutoSizeDisplayFormat0.00TabOrderVisibleOnExitCurrencyEdit4Exit  TCurrencyEditCurrencyEdit5LeftsTop<Width]HeightAutoSizeDisplayFormat0.00TabOrderOnExitCurrencyEdit5Exit  TRxDBLookupComboRxDBLookupCombo2LeftTopmWidthë HeightDropDownCountLookupFieldCodContaLookupDisplay	NomeContaLookupSourceDM1.dsContasTabOrder  TCurrencyEditCurrencyEdit6LeftPTopWidthTHeightAutoSizeDisplayFormat0TabOrder  	TDateEdit	DateEdit2Left9TopWidth_Height	NumGlyphsTabOrder  TRxDBLookupComboRxDBLookupCombo4LeftTopä Widthó HeightDropDownCount	DataFieldCodPlanoContasItens
DataSourceDM1.dsCPagarParcLookupFieldCodItemLookupDisplayNomeLookupSourceDM1.dsPlanoContasItensParentShowHintShowHintTabOrderOnEnterRxDBLookupCombo4Enter   TPanelPanel2Leftÿ TopWidth Height
BevelOuter	bvLoweredTabOrder TBitBtnBitBtn4LeftSTopWidthHHeightHintFecha a janela atualCaption&FecharParentShowHintShowHint	TabOrder OnClickBitBtn4Click
Glyph.Data
º  ¶  BM¶      v   (   "            @  Î  Ä                            ÀÀÀ    ÿ  ÿ   ÿÿ ÿ   ÿ ÿ ÿÿ  ÿÿÿ 8888833333833   `83ÿÿÿÿ83ÿ       8f 888   3330f333388ó   3330 f333ÿ8ó   33 03f33888ó   33 3f3ÿøø88ó     à38388ó   îîæf8ÿÿóx88ó     `3f8÷88ó   33 3f338x88ó   33 03f33888ó   333030æ33333øó   3330333333ÿøxó   3330   33333   33333333333333333   	NumGlyphs  TBitBtnBitBtn1LeftTopWidthPHeightHint   Confirma o pagamento do tÃ­tuloCaption
&ConfirmarParentShowHintShowHint	TabOrderOnClickBitBtn1Click
Glyph.Data
Ò  Î  BMÎ      6   (   $              Î  Ø                                                                      ÿÿÿ                                    ÿÿÿÿÿÿ                                   ÿÿÿÿÿÿ                                   ÿÿÿÿÿÿ                                   ÿÿÿ                ÿ                   ÿÿÿÿÿÿ              ÿ   ÿ                 ÿÿÿ ÿÿÿÿÿÿÿÿÿ       ÿ    ÿ     ÿ                ÿÿÿ   ÿÿÿÿÿÿÿÿÿ       ÿ       ÿ                ÿÿÿ     ÿÿÿÿÿÿÿÿÿ             ÿ                      ÿÿÿÿÿÿÿÿÿ             ÿ                      ÿÿÿÿÿÿ              ÿ                      ÿÿÿÿÿÿ              ÿ                      ÿÿÿÿÿÿ              ÿ                     ÿÿÿ                ÿ                    ÿÿÿ                 ÿ                  ÿÿÿ                                      	NumGlyphs    TTabletCPagarParcHistInsDatabaseNameTabelasIndexFieldNamesFilial;NumCPagar;ParcCPagarMasterFieldsFilial;NumCPagar;ParcCPagar	TableNamedbCPagarParcHist.DBLeftTop TIntegerFieldtCPagarParcHistInsFilial	FieldNameFilial  TIntegerFieldtCPagarParcHistInsNumCPagar	FieldName	NumCPagar  TIntegerFieldtCPagarParcHistInsParcCPagar	FieldName
ParcCPagar  TIntegerFieldtCPagarParcHistInsItem	FieldNameItem  TIntegerFieldtCPagarParcHistInsCodHistorico	FieldNameCodHistorico  
TDateFieldtCPagarParcHistInsDtHistorico	FieldNameDtHistorico  TStringFieldtCPagarParcHistInsHistorico	FieldName	HistoricoSizeF  
TDateFieldtCPagarParcHistInsDtUltPgto	FieldName	DtUltPgto  TFloatFieldtCPagarParcHistInsVlrUltPgto	FieldName
VlrUltPgto  TFloatFieldtCPagarParcHistInsVlrUltJuros	FieldNameVlrUltJuros  TFloatField!tCPagarParcHistInsVlrUltDescontos	FieldNameVlrUltDescontos  TFloatField tCPagarParcHistInsVlrUltDespesas	FieldNameVlrUltDespesas  TBooleanFieldtCPagarParcHistInsPgto	FieldNamePgto  TFloatFieldtCPagarParcHistInsJurosPagos	FieldName
JurosPagos   TTable
tHistoricoActive	DatabaseNameTabelasIndexFieldNamesCodigo	TableNamedbHistorico.DBLeft?Top TIntegerFieldtHistoricoCodigo	FieldNameCodigo  TStringFieldtHistoricoNome	FieldNameNomeSize2  TStringFieldtHistoricoTipo	FieldNameTipoSize   TDataSourcedsHistoricoDataSet
tHistoricoLeft]Top  TRxDBFilterRxDBFilter1Active	
DataSourcedsHistoricoFilter.StringsTipo <> 'R' Left Top   