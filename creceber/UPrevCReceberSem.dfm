ÿ
 TFPREVCRECEBERSEM 0i  TPF0TfPrevCReceberSemfPrevCReceberSemLeftTopò BorderIconsbiSystemMenu BorderStylebsSingleCaption)   RelatÃ³rio do Contas a Receber por SemanaClientHeightpClientWidth¸Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PositionpoScreenCenterOnClose	FormClosePixelsPerInch`
TextHeight TPanelPanel1Left Top Width¸HeightpAlignalClientTabOrder  TLabelLabel1LeftHTopWidthHeightCaptionFilial:  TStaticTextStaticText1Left	Top(WidthWHeightAutoSizeBorderStyle	sbsSunkenCaptionData Inicial:TabOrder  	TDateEdit	DateEdit1LeftfTop&Width\Height	NumGlyphsStartOfWeekSunTabOrder   TStaticTextStaticText2LeftÐ Top(WidthWHeightAutoSizeBorderStyle	sbsSunkenCaptionData Final:TabOrder  	TDateEdit	DateEdit2Left*Top&Width\Height	NumGlyphsStartOfWeekSunTabOrder  TPanelPanel2LeftaTopGWidthÎ HeightTabOrder TBitBtnBitBtn4LeftgTopWidthcHeightHintFecha a janela atualCaption&FecharParentShowHintShowHint	TabOrderOnClickBitBtn4Click
Glyph.Data
º  ¶  BM¶      v   (   "            @  Î  Ä                            ÀÀÀ    ÿ  ÿ   ÿÿ ÿ   ÿ ÿ ÿÿ  ÿÿÿ 8888833333833   `83ÿÿÿÿ83ÿ       8f 888   3330f333388ó   3330 f333ÿ8ó   33 03f33888ó   33 3f3ÿøø88ó     à38388ó   îîæf8ÿÿóx88ó     `3f8÷88ó   33 3f338x88ó   33 03f33888ó   333030æ33333øó   3330333333ÿøxó   3330   33333   33333333333333333   	NumGlyphs  TBitBtnBitBtn1LeftTopWidthcHeightHintFecha a janela atualCaption	Im&primirParentShowHintShowHint	TabOrder OnClickBitBtn1Click
Glyph.Data
ú   ö   BMö       v   (                                                     ÀÀÀ   ÿ  ÿ   ÿÿ ÿ   ÿ ÿ ÿÿ  ÿÿÿ            » w           ÿÿÿðð  ð ÿÿÿÿ  ÿÿÿð       TRxDBLookupComboRxDBLookupCombo1LefteTopWidth"HeightDropDownCountLookupFieldCodigoLookupDisplayEmpresaLookupSourceDM1.dsFilialTabOrder  TDBGridDBGrid1LeftTop° Width¶Height¿ AlignalBottom
DataSource	dsmSemanaTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.HeightõTitleFont.NameMS Sans SerifTitleFont.Style    TQueryqReceberDatabaseNameTabelasSQL.StringsuSELECT DbCliente.Nome, Dbcreceberparc.DtVencCReceber, Dbcontas.NomeConta, Sum(Dbcreceberparc.RestParcela) RestParcela'FROM "dbCReceberParc.DB" Dbcreceberparc&   INNER JOIN "dbCliente.DB" Dbcliente1   ON  (Dbcreceberparc.CodCli = Dbcliente.Codigo)#   FULL JOIN "dbContas.DB" Dbcontas4   ON  (Dbcreceberparc.CodConta = Dbcontas.CodConta)(WHERE   (Dbcreceberparc.RestParcela > 0)A   AND  (Dbcreceberparc.DtVencCReceber BETWEEN :Data1 AND :Data2))   AND  (dbCReceberParc.Filial = :Filial)S   AND  ((dbCReceberParc.Cancelado = False) or (dbCReceberParc.Cancelado is Null)) JGROUP BY Dbcliente.Nome, Dbcreceberparc.DtVencCReceber, Dbcontas.NomeConta6ORDER BY Dbcreceberparc.DtVencCReceber, Dbcliente.Nome   LeftTop"	ParamDataDataTypeftDateNameData1	ParamType	ptUnknown DataTypeftDateNameData2	ParamType	ptUnknown DataType	ftUnknownNameFilial	ParamType	ptUnknown   TStringFieldqReceberNome	FieldNameNomeSize(  
TDateFieldqReceberDtVencCReceber	FieldNameDtVencCReceber  TStringFieldqReceberNomeConta	FieldName	NomeContaSize(  TFloatFieldqReceberRestParcela	FieldNameRestParcelaDisplayFormat0.00   TMemoryTablemSemanaActive	Left`Topp TStringFieldmSemanaNomeBancoDisplayWidth	FieldName	NomeBancoSize<  
TDateFieldmSemanaData1DisplayWidth	FieldNameData1  TFloatFieldmSemanaSaldo1DisplayWidth	FieldNameSaldo1DisplayFormat###,###,##0.00  
TDateFieldmSemanaData2DisplayWidth	FieldNameData2  TFloatFieldmSemanaSaldo2DisplayWidth	FieldNameSaldo2DisplayFormat###,###,##0.00  
TDateFieldmSemanaData3DisplayWidth	FieldNameData3  TFloatFieldmSemanaSaldo3DisplayWidth	FieldNameSaldo3DisplayFormat###,###,##0.00  
TDateFieldmSemanaData4DisplayWidth	FieldNameData4  TFloatFieldmSemanaSaldo4DisplayWidth	FieldNameSaldo4DisplayFormat###,###,##0.00  
TDateFieldmSemanaData5DisplayWidth	FieldNameData5  TFloatFieldmSemanaSaldo5DisplayWidth	FieldNameSaldo5DisplayFormat###,###,##0.00  
TDateFieldmSemanaData6DisplayWidth	FieldNameData6  TFloatFieldmSemanaSaldo6DisplayWidth	FieldNameSaldo6DisplayFormat###,###,##0.00  
TDateFieldmSemanaData7DisplayWidth	FieldNameData7  TFloatFieldmSemanaSaldo7DisplayWidth	FieldNameSaldo7DisplayFormat###,###,##0.00  TStringFieldmSemanaNomeClienteDisplayWidthH	FieldNameNomeClienteSize<   TDataSource	dsmSemanaDataSetmSemanaLeftTopp   