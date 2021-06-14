unit UDMNFe;

interface

uses
  SysUtils, Classes, DB, DBTables, DBIProcs;

type
  TDMNFe = class(TDataModule)
    tNFeInutilizacao: TTable;
    dsNFeInutilizacao: TDataSource;
    tNFeInutilizacaoNumMov: TIntegerField;
    tNFeInutilizacaoNumProtocolo: TStringField;
    tNFeInutilizacaoData: TDateField;
    tNFeInutilizacaoHora: TTimeField;
    tNFeInutilizacaoMotivo: TStringField;
    tNFeInutilizacaoNumNotaIni: TIntegerField;
    tNFeInutilizacaoNumNotaFin: TIntegerField;
    tNFeInutilizacaoUsuario: TStringField;
    tNFeInutilizacaoDtUsuario: TDateField;
    tNFeInutilizacaoHrUsuario: TTimeField;
    tNFeInutilizacaoModelo: TStringField;
    tNFeInutilizacaoSerie: TStringField;
    tNFeInutilizacaoFilial: TIntegerField;
    tNFeInutilizacaoAno: TIntegerField;
    qNotaFiscal: TQuery;
    qNotaFiscalNumSeq: TIntegerField;
    qNotaFiscalDtEmissao: TDateField;
    qNotaFiscalNFeChaveAcesso: TStringField;
    qNotaFiscalNumNota: TIntegerField;
    procedure tNFeInutilizacaoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMNFe: TDMNFe;

implementation

{$R *.dfm}

procedure TDMNFe.tNFeInutilizacaoAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tNFeInutilizacao.Handle);
end;

end.
