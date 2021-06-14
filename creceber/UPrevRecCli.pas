unit UPrevRecCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, RxLookup, Mask, ToolEdit, RXCtrls, Menus, Buttons, Printers,
  Db, DBTables, MemTable, Grids, DBGrids, RXDBCtrl;

type
  TfPrevRecCli = class(TForm)
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    Label3: TLabel;
    DateEdit2: TDateEdit;
    Panel1: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    qReceber: TQuery;
    dsReceber: TDataSource;
    qReceberCodCli: TIntegerField;
    qReceberNome: TStringField;
    qReceberVlrParcCReceber: TFloatField;
    RadioGroup2: TRadioGroup;
    Query2: TQuery;
    Query2Nome: TStringField;
    Query2DtUltPgto: TDateField;
    Query2VlrUltPgto: TFloatField;
    tMemo1: TMemoryTable;
    tMemo1NomeCli: TStringField;
    tMemo1Valor: TFloatField;
    dsMemo1: TDataSource;
    Bevel1: TBevel;
    qReceberDesconto: TFloatField;
    qReceberAbatimentos: TFloatField;
    qsQuery2: TDataSource;
    Query2VlrDevolucao: TFloatField;
    Query2Codigo: TIntegerField;
    tMemo1CodCli: TIntegerField;
    qReceberRestParcela: TFloatField;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Enter(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Executa_SQL1;
    procedure Executa_SQL2;
    procedure Gera_Memo;
    Procedure LImpa_Memo;
  public
    { Public declarations }
  end;

var
  fPrevRecCli: TfPrevRecCli;

implementation

uses UDM1, URelRecCli;

{$R *.DFM}

procedure TfPrevRecCli.Limpa_Memo;
begin
  tMemo1.EmptyTable;
end;

procedure TfPrevRecCli.Executa_SQL1;
begin
  qReceber.Active := False;
  qReceber.SQL.Clear;
  qReceber.SQL.Add('SELECT DISTINCT Dbcreceberparc.CodCli, SUM( Dbcreceberparc.RestParcela ) RestParcela, SUM( Dbcreceberparc.VlrParcCReceber ) VlrParcCReceber, SUM( Dbcreceberparc.Desconto ) Desconto, SUM( Dbcreceberparc.Abatimentos ) Abatimentos, Dbcliente.Nome');
  qReceber.SQL.Add('FROM "dbCReceberParc.DB" Dbcreceberparc');
  qReceber.SQL.Add(' INNER JOIN "DBCLIENTE.DB" Dbcliente');
  qReceber.SQL.Add(' ON  (Dbcreceberparc.CodCli = Dbcliente.Codigo)');
  if RadioGroup2.ItemIndex = 0 then
    begin
      qReceber.SQL.Add(' INNER JOIN "dbCReceber.DB" Dbcreceber');
      qReceber.SQL.Add(' ON  (Dbcreceber.NumCReceber = Dbcreceberparc.NumCReceber)');
    end;
  if RadioGroup2.ItemIndex = 1 then
    begin
      Case RadioGroup1.ItemIndex of
        0 : begin
              if DateEdit2.Text = '  /  /    ' then
                begin
//                  qReceber.SQL.Add('WHERE  DtVencCReceber >= :DtInicial AND Dbcreceberparc.Cancelado <> TRUE');
                  qReceber.SQL.Add('WHERE  (DtVencCReceber >= :DtInicial) AND ((Dbcreceberparc.Cancelado = FALSE) OR (Dbcreceberparc.Cancelado IS NULL))');
                  qReceber.Params[0].AsDate := DateEdit1.Date;
                end
              else
                begin
//                  qReceber.SQL.Add('WHERE  DtVencCReceber BETWEEN :DtInicial AND :DtFinal AND Dbcreceberparc.Cancelado <> TRUE');
                  qReceber.SQL.Add('WHERE  (DtVencCReceber BETWEEN :DtInicial AND :DtFinal) AND ((Dbcreceberparc.Cancelado = FALSE) OR (Dbcreceberparc.Cancelado IS NULL))');
                  qReceber.Params[0].AsDate := DateEdit1.Date;
                  qReceber.Params[1].AsDate := DateEdit2.Date;
                end;
            end;
        1: begin
//              qReceber.SQL.Add('WHERE  DtVencCReceber <= :DtInicial AND Dbcreceberparc.Cancelado <> TRUE');
              qReceber.SQL.Add('WHERE (DtVencCReceber <= :DtInicial) AND ((Dbcreceberparc.Cancelado = FALSE) OR (Dbcreceberparc.Cancelado IS NULL))');
              qReceber.Params[0].AsDate := DateEdit1.Date;
            end;
      end;
    end
  else
    begin
      if RadioGroup1.ItemIndex = 0 then
        begin
          if DateEdit2.Text = '  /  /    ' then
            begin
//              qReceber.SQL.Add('WHERE dbcreceber.DtGerado <= :DtInicial AND dbcreceberparc.DtVencCReceber >= :DtVectoIni AND Dbcreceberparc.Cancelado <> TRUE');
              qReceber.SQL.Add('WHERE (dbcreceber.DtGerado <= :DtInicial) AND (dbcreceberparc.DtVencCReceber >= :DtVectoIni) AND ((Dbcreceberparc.Cancelado = FALSE) OR (Dbcreceberparc.Cancelado IS NULL))');
              qReceber.Params[0].AsDate := DateEdit1.Date;
              qReceber.Params[1].AsDate := DateEdit1.Date;
            end
          else
            begin
//              qReceber.SQL.Add('WHERE  dbcreceber.DtGerado <= :DtInicial AND dbcreceberparc.DtVencCReceber BETWEEN :DtVectoIni AND :DtVectoFin AND Dbcreceberparc.Cancelado <> TRUE');
              qReceber.SQL.Add('WHERE  (dbcreceber.DtGerado <= :DtInicial) AND (dbcreceberparc.DtVencCReceber BETWEEN :DtVectoIni AND :DtVectoFin) AND ((Dbcreceberparc.Cancelado = FALSE) OR (Dbcreceberparc.Cancelado IS NULL))');
              qReceber.Params[0].AsDate := DateEdit1.Date;
              qReceber.Params[1].AsDate := DateEdit1.Date;
              qReceber.Params[2].AsDate := DateEdit2.Date;
            end;
        end
      else
        begin
          if DateEdit2.Text = '  /  /    ' then
            begin
//              qReceber.SQL.Add('WHERE dbcreceber.DtGerado <= :DtInicial AND dbcreceberparc.DtVencCReceber <= :DtVectoIni AND Dbcreceberparc.Cancelado <> TRUE');
              qReceber.SQL.Add('WHERE (dbcreceber.DtGerado <= :DtInicial) AND (dbcreceberparc.DtVencCReceber <= :DtVectoIni) AND ((Dbcreceberparc.Cancelado = FALSE) OR (Dbcreceberparc.Cancelado IS NULL))');
              qReceber.Params[0].AsDate := DateEdit1.Date;
              qReceber.Params[1].AsDate := DateEdit1.Date;
            end
          else
            begin
//              qReceber.SQL.Add('WHERE  dbcreceber.DtGerado <= :DtInicial AND dbcreceberparc.DtVencCReceber BETWEEN :DtVectoIni AND :DtVectoFin AND Dbcreceberparc.Cancelado <> TRUE');
              qReceber.SQL.Add('WHERE  (dbcreceber.DtGerado <= :DtInicial) AND (dbcreceberparc.DtVencCReceber BETWEEN :DtVectoIni AND :DtVectoFin) AND ((Dbcreceberparc.Cancelado = FALSE) OR (Dbcreceberparc.Cancelado IS NULL))');
              qReceber.Params[0].AsDate := DateEdit1.Date;
              qReceber.Params[1].AsDate := DateEdit1.Date;
              qReceber.Params[2].AsDate := DateEdit2.Date;
            end;
        end;
    end;
  if RxDBLookupCombo1.Text <> '' then
    begin
      qReceber.SQL.Add(' and Dbcreceberparc.Filial = :Filial');
      qReceber.ParamByName('Filial').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  qReceber.SQL.Add('GROUP BY Dbcreceberparc.CodCli, Dbcliente.Nome');
  qReceber.SQL.Add('ORDER BY Dbcliente.Nome');
  qReceber.Active := True;
end;

procedure TfPrevRecCli.Executa_SQL2;
begin
  Query2.Active := False;
  Query2.SQL.Clear;
  Query2.SQL.Add('SELECT Dbcliente.Codigo, Dbcliente.Nome, Dbcreceberparchist.DtUltPgto, Dbcreceberparchist.VlrUltPgto, Dbcreceberparchist.VlrDevolucao');
  Query2.SQL.Add('FROM "DBCLIENTE.DB" Dbcliente');
  Query2.SQL.Add('  INNER JOIN "dbCReceber.DB" Dbcreceber');
  Query2.SQL.Add('  ON  (Dbcreceber.CodCli = Dbcliente.Codigo)');
  Query2.SQL.Add('  INNER JOIN "dbCReceberParc.DB" Dbcreceberparc');
  Query2.SQL.Add('  ON  (Dbcreceber.NumCReceber = Dbcreceberparc.NumCReceber)');
  Query2.SQL.Add('  INNER JOIN "dbCReceberParcHist.DB" Dbcreceberparchist');
  Query2.SQL.Add('  ON  (Dbcreceberparc.NumCReceber = Dbcreceberparchist.NumCReceber)');
  Query2.SQL.Add('  AND  (Dbcreceberparc.ParcCReceber = Dbcreceberparchist.ParcCReceber)');
  if RadioGroup2.ItemIndex = 1 then
    begin
      Case RadioGroup1.ItemIndex of
        0 : begin
              if DateEdit2.Text = '  /  /    ' then
                begin
//                  Query2.SQL.Add('WHERE  (Dbcreceberparchist.DtUltPgto <= :DtInicial) AND (Dbcreceberparc.DtVencCReceber >= :DtInicial2) AND (Dbcreceberparc.Cancelado <> TRUE) AND (DbCliente.Nome = :Nome1)');
                  Query2.SQL.Add('WHERE  (Dbcreceberparchist.DtUltPgto <= :DtInicial) AND (Dbcreceberparc.DtVencCReceber >= :DtInicial2) AND ((Dbcreceberparc.Cancelado = FALSE) OR (Dbcreceberparc.Cancelado IS NULL)) AND (DbCliente.Codigo = :Cli1)');
                  Query2.Params[0].AsDate    := DateEdit1.Date;
                  Query2.Params[1].AsDate    := DateEdit1.Date;
                  Query2.Params[2].AsInteger := tMemo1CodCli.AsInteger;
                end
              else
                begin
//                  Query2.SQL.Add('WHERE  (Dbcreceberparchist.DtUltPgto <= :DtInicial) AND (Dbcreceberparc.DtVencCReceber BETWEEN :DtInicial2 AND :DtFinal) AND (Dbcreceberparc.Cancelado <> TRUE) AND (Dbcliente.Nome = :Nome1)');
                  Query2.SQL.Add('WHERE  (Dbcreceberparchist.DtUltPgto <= :DtInicial) AND (Dbcreceberparc.DtVencCReceber BETWEEN :DtInicial2 AND :DtFinal) AND ((Dbcreceberparc.Cancelado = FALSE) OR (Dbcreceberparc.Cancelado IS NULL)) AND (Dbcliente.Codigo = :Cli1)');
                  Query2.Params[0].AsDate    := DateEdit1.Date;
                  Query2.Params[1].AsDate    := DateEdit1.Date;
                  Query2.Params[2].AsDate    := DateEdit2.Date;
                  Query2.Params[3].AsInteger := tMemo1CodCli.AsInteger;
                end;
            end;
        1: begin
//              Query2.SQL.Add('WHERE  (Dbcreceberparchist.DtUltPgto <= :DtInicial) AND (Dbcreceberparc.DtVencCReceber <= :DtInicial2) AND (Dbcreceberparc.Cancelado <> TRUE) AND (Dbcliente.Nome = :Nome1)');
              Query2.SQL.Add('WHERE  (Dbcreceberparchist.DtUltPgto <= :DtInicial) AND (Dbcreceberparc.DtVencCReceber <= :DtInicial2) AND ((Dbcreceberparc.Cancelado = FALSE) OR (Dbcreceberparc.Cancelado IS NULL)) AND (Dbcliente.Codigo = :Cli1)');
              Query2.Params[0].AsDate    := DateEdit1.Date;
              Query2.Params[1].AsDate    := DateEdit1.Date;
              Query2.Params[2].AsInteger := tMemo1CodCli.AsInteger;
            end;
      end;
    end
  else
    begin
      if RadioGroup1.ItemIndex = 0 then
        begin
          if DateEdit2.Text = '  /  /    ' then
            begin
//              Query2.SQL.Add('WHERE (Dbcreceberparchist.DtUltPgto <= :DtInicial) AND (dbcreceber.DtGerado <= :DtInicial2) AND (dbcreceberparc.DtVencCReceber >= :DtVectoIni) AND (Dbcreceberparc.Cancelado <> TRUE) AND (Dbcliente.Nome = :Nome1)');
              Query2.SQL.Add('WHERE (Dbcreceberparchist.DtUltPgto <= :DtInicial) AND (dbcreceber.DtGerado <= :DtInicial2) AND (dbcreceberparc.DtVencCReceber >= :DtVectoIni) AND ((Dbcreceberparc.Cancelado = FALSE) OR (Dbcreceberparc.Cancelado IS NULL)) AND (Dbcliente.Codigo = :Cli1)');
              Query2.Params[0].AsDate    := DateEdit1.Date;
              Query2.Params[1].AsDate    := DateEdit1.Date;
              Query2.Params[2].AsDate    := DateEdit1.Date;
              Query2.Params[3].AsInteger := tMemo1CodCli.AsInteger;
            end
          else
            begin
//              Query2.SQL.Add('WHERE  (Dbcreceberparchist.DtUltPgto <= :DtInicial) AND (dbcreceber.DtGerado <= :DtInicial2) AND (dbcreceberparc.DtVencCReceber BETWEEN :DtVectoIni AND :DtVectoFin) AND (Dbcreceberparc.Cancelado <> TRUE) AND (Dbcliente.Nome = :Nome1)');
              Query2.SQL.Add('WHERE  (Dbcreceberparchist.DtUltPgto <= :DtInicial) AND (dbcreceber.DtGerado <= :DtInicial2) AND (dbcreceberparc.DtVencCReceber BETWEEN :DtVectoIni AND :DtVectoFin) AND ');
              Query2.SQL.ADD('((Dbcreceberparc.Cancelado = FALSE) OR (Dbcreceberparc.Cancelado IS NULL)) AND (Dbcliente.Codigo = :Cli1)');
              Query2.Params[0].AsDate    := DateEdit1.Date;
              Query2.Params[1].AsDate    := DateEdit1.Date;
              Query2.Params[2].AsDate    := DateEdit1.Date;
              Query2.Params[3].AsDate    := DateEdit2.Date;
              Query2.Params[4].AsInteger := tMemo1CodCli.AsInteger;
            end;
        end
      else
        begin
          if DateEdit2.Text = '  /  /    ' then
            begin
//              Query2.SQL.Add('WHERE (Dbcreceberparchist.DtUltPgto <= :DtInicial) AND (dbcreceber.DtGerado <= :DtInicial2) AND (dbcreceberparc.DtVencCReceber <= :DtVectoIni) AND (Dbcreceberparc.Cancelado <> TRUE) AND (Dbcliente.Nome = :Nome1)');
              Query2.SQL.Add('WHERE (Dbcreceberparchist.DtUltPgto <= :DtInicial) AND (dbcreceber.DtGerado <= :DtInicial2) AND (dbcreceberparc.DtVencCReceber <= :DtVectoIni) AND ((Dbcreceberparc.Cancelado = FALSE) OR (Dbcreceberparc.cancelado IS NULL)) AND (Dbcliente.Codigo = :Cli1)');
              Query2.Params[0].AsDate    := DateEdit1.Date;
              Query2.Params[1].AsDate    := DateEdit1.Date;
              Query2.Params[2].AsDate    := DateEdit1.Date;
              Query2.Params[3].AsInteger := tMemo1CodCli.AsInteger;
            end
          else
            begin
//              Query2.SQL.Add('WHERE  (Dbcreceberparchist.DtUltPgto <= :DtInicial) AND (dbcreceber.DtGerado <= :DtInicial2) AND (dbcreceberparc.DtVencCReceber BETWEEN :DtVectoIni AND :DtVectoIni2) AND (Dbcreceberparc.Cancelado <> TRUE) AND (Dbcliente.Nome = :Nome1)');
              Query2.SQL.Add('WHERE  (Dbcreceberparchist.DtUltPgto <= :DtInicial) AND (dbcreceber.DtGerado <= :DtInicial2) AND (dbcreceberparc.DtVencCReceber BETWEEN :DtVectoIni AND :DtVectoIni2) AND ');
              Query2.SQL.Add('((Dbcreceberparc.Cancelado = FALSE) OR (Dbcreceberparc.Cancelado IS NULL)) AND (Dbcliente.Codigo = :Cli1)');
              Query2.Params[0].AsDate    := DateEdit1.Date;
              Query2.Params[1].AsDate    := DateEdit1.Date;
              Query2.Params[2].AsDate    := DateEdit1.Date;
              Query2.Params[3].AsDate    := DateEdit2.Date;
              Query2.Params[4].AsInteger := tMemo1CodCli.AsInteger;
            end;
        end;
    end;
  if RxDBLookupCombo1.Text <> '' then
    begin
      Query2.SQL.Add(' and Dbcreceber.Filial = :Filial');
      Query2.ParamByName('Filial').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  Query2.Active := True;
end;

procedure TfPrevRecCli.Gera_Memo;
begin
  qReceber.First;
  while not qReceber.Eof do
    begin
      tMemo1.Insert;
      tMemo1NomeCli.AsString := qReceberNome.AsString;
      tMemo1CodCli.AsInteger := qReceberCodCli.AsInteger;
      tMemo1Valor.AsFloat    := qReceberRestParcela.AsFloat - qReceberDesconto.AsFloat - qReceberAbatimentos.AsFloat;
      tMemo1.Post;
      qReceber.Next;
    end;
  tMemo1.First;
  while not tMemo1.Eof do
    begin
      Executa_SQL2;
      Query2.First;
      while not Query2.Eof do
        begin
          tMemo1.Edit;
          tMemo1Valor.AsFloat := StrToFloat(FormatFloat('0.00',tMemo1Valor.AsFloat - Query2VlrUltPgto.AsFloat - Query2VlrDevolucao.AsFloat));
          tMemo1.Post;
          Query2.Next;
        end;
      tMemo1.Next;
    end;
end;

procedure TfPrevRecCli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfPrevRecCli.RadioGroup1Enter(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0 : DateEdit2.Enabled := True;
    1 : begin
          DateEdit2.Enabled := False;
          DateEdit2.Clear;
        end;
  end;
end;

procedure TfPrevRecCli.Imprimir1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0 : begin
          if DateEdit1.Date > 1 then
            begin
              Screen.Cursor := crHourGlass;
              Executa_SQL1;
              Gera_Memo;
              Screen.Cursor := crDefault;
              fRelRecCli    := TfRelRecCli.Create(Self);
              fRelRecCli.QuickRep1.Print;
              fRelRecCli.QuickRep1.Free;
              Limpa_Memo;
            end;
        end;
    1 : begin
          if DateEdit1.Date > 1 then
            begin
              Screen.Cursor := crHourGlass;
              Executa_SQL1;
              Gera_Memo;
              Screen.Cursor := crDefault;
              fRelRecCli := TfRelRecCli.Create(Self);
              fRelRecCli.QuickRep1.Print;
              fRelRecCli.QuickRep1.Free;
              Limpa_Memo;
            end
          else
            begin
              ShowMessage('Deve haver uma data, p/ executar a consulta!');
              DateEdit1.SetFocus;
            end;
        end;
  end;
end;

procedure TfPrevRecCli.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevRecCli.SpeedButton1Click(Sender: TObject);
begin
  DateEdit1.Clear;
  DateEdit2.Clear;
  RadioGroup2.ItemIndex := 0;
  RadioGroup2.SetFocus;
end;

procedure TfPrevRecCli.Visualizar1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0 : begin
          if DateEdit1.Date > 1 then
            begin
              Screen.Cursor := crHourGlass;
              Executa_SQL1;
              Gera_Memo;
              Screen.Cursor := crDefault;
              fRelRecCli := TfRelRecCli.Create(Self);
              fRelRecCli.QuickRep1.Preview;
              fRelRecCli.QuickRep1.Free;
              Limpa_Memo;
            end;
        end;
    1 : begin
          if DateEdit1.Date > 1 then
            begin
              Screen.Cursor := crHourGlass;
              Executa_SQL1;
              Gera_Memo;
              Screen.Cursor := crDefault;
              fRelRecCli := TfRelRecCli.Create(Self);
              fRelRecCli.QuickRep1.Preview;
              fRelRecCli.QuickRep1.Free;
              Limpa_Memo;
            end
          else
            begin
              ShowMessage('Deve haver uma data, p/ executar a consulta!');
              DateEdit1.SetFocus;
            end;
        end;
  end;
end;

procedure TfPrevRecCli.FormShow(Sender: TObject);
begin
  Limpa_Memo;
  DateEdit1.Date := Date();
  RadioGroup2.ItemIndex := 0;
end;

end.
