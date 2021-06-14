object DMNFe: TDMNFe
  OldCreateOrder = False
  Left = 430
  Top = 203
  Height = 230
  Width = 342
  object tNFeInutilizacao: TTable
    AfterPost = tNFeInutilizacaoAfterPost
    DatabaseName = 'Tabelas'
    TableName = 'dbNFeInutilizacao.DB'
    Left = 72
    Top = 56
    object tNFeInutilizacaoFilial: TIntegerField
      FieldName = 'Filial'
    end
    object tNFeInutilizacaoNumMov: TIntegerField
      FieldName = 'NumMov'
    end
    object tNFeInutilizacaoNumProtocolo: TStringField
      FieldName = 'NumProtocolo'
      Size = 44
    end
    object tNFeInutilizacaoData: TDateField
      FieldName = 'Data'
    end
    object tNFeInutilizacaoHora: TTimeField
      FieldName = 'Hora'
    end
    object tNFeInutilizacaoMotivo: TStringField
      FieldName = 'Motivo'
      Size = 200
    end
    object tNFeInutilizacaoNumNotaIni: TIntegerField
      FieldName = 'NumNotaIni'
    end
    object tNFeInutilizacaoNumNotaFin: TIntegerField
      FieldName = 'NumNotaFin'
    end
    object tNFeInutilizacaoUsuario: TStringField
      FieldName = 'Usuario'
      Size = 15
    end
    object tNFeInutilizacaoDtUsuario: TDateField
      FieldName = 'DtUsuario'
    end
    object tNFeInutilizacaoHrUsuario: TTimeField
      FieldName = 'HrUsuario'
    end
    object tNFeInutilizacaoModelo: TStringField
      FieldName = 'Modelo'
      Size = 2
    end
    object tNFeInutilizacaoSerie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object tNFeInutilizacaoAno: TIntegerField
      FieldName = 'Ano'
    end
  end
  object dsNFeInutilizacao: TDataSource
    DataSet = tNFeInutilizacao
    Left = 160
    Top = 56
  end
  object qNotaFiscal: TQuery
    DatabaseName = 'Tabelas'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT NumSeq, DtEmissao, NFeChaveAcesso, NumNota'
      'FROM "DBNOTAFISCAL.DB" Dbnotafiscal'
      'WHERE  NFeChaveAcesso = :NFeChaveAcesso')
    Left = 72
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'NFeChaveAcesso'
        ParamType = ptUnknown
      end>
    object qNotaFiscalNumSeq: TIntegerField
      FieldName = 'NumSeq'
      Origin = 'TABELAS."DBNOTAFISCAL.DB".NumSeq'
    end
    object qNotaFiscalDtEmissao: TDateField
      FieldName = 'DtEmissao'
      Origin = 'TABELAS."DBNOTAFISCAL.DB".DtEmissao'
    end
    object qNotaFiscalNFeChaveAcesso: TStringField
      FieldName = 'NFeChaveAcesso'
      Origin = 'TABELAS."DBNOTAFISCAL.DB".NFeChaveAcesso'
      Size = 44
    end
    object qNotaFiscalNumNota: TIntegerField
      FieldName = 'NumNota'
      Origin = 'TABELAS."DBNOTAFISCAL.DB".NumNota'
    end
  end
end
