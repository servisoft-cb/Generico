unit UConsPlanoContasCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBClient, UDM1, Grids, DBGrids,
  SMDBGrid, DBTables;

type
  TfConsPlanoContasCad = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    mConsulta: TClientDataSet;
    dsmConsulta: TDataSource;
    mConsultaCodPlano: TIntegerField;
    mConsultaNomePlano: TStringField;
    mConsultaNomeSubConta: TStringField;
    mConsultaCodSubConta: TIntegerField;
    SMDBGrid1: TSMDBGrid;
    tPlanoContas: TTable;
    tPlanoContasCodigo: TIntegerField;
    tPlanoContasDescricao: TStringField;
    tPlanoContasItens: TTable;
    dsPlanoContas: TDataSource;
    tPlanoContasItensCodPlano: TIntegerField;
    tPlanoContasItensCodItem: TIntegerField;
    tPlanoContasItensNome: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Le_tPlanoContas;

  public
    { Public declarations }

  end;

var
  fConsPlanoContasCad: TfConsPlanoContasCad;

implementation

uses URelPlanoContasCad;

{$R *.dfm}

procedure TfConsPlanoContasCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tPlanoContas.Close;
  tPlanoContasItens.Close;
  Action := Cafree;
end;

procedure TfConsPlanoContasCad.FormShow(Sender: TObject);
begin
  tPlanoContas.Open;
  tPlanoContasItens.Open;
  Le_tPlanoContas;
end;

procedure TfConsPlanoContasCad.Le_tPlanoContas;
begin
  mConsulta.EmptyDataSet;
  tPlanoContas.First;
  while not tPlanoContas.Eof do
  begin
    if not tPlanoContasItens.IsEmpty then
    begin
      tPlanoContasItens.First;
      while not tPlanoContasItens.Eof do
      begin
        mConsulta.Insert;
        mConsultaCodPlano.AsInteger    := tPlanoContasCodigo.AsInteger;
        mConsultaNomePlano.AsString    := tPlanoContasDescricao.AsString;
        mConsultaCodSubConta.AsInteger := tPlanoContasItensCodItem.AsInteger;
        mConsultaNomeSubConta.AsString := tPlanoContasItensNome.AsString;
        mConsulta.Post;
        tPlanoContasItens.Next;        
      end;
    end
    else
    begin
      mConsulta.Insert;
      mConsultaCodPlano.AsInteger    := tPlanoContasCodigo.AsInteger;
      mConsultaNomePlano.AsString    := tPlanoContasDescricao.AsString;
      mConsulta.Post;
    end;

    tPlanoContas.Next;
  end;
end;

procedure TfConsPlanoContasCad.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsPlanoContasCad.BitBtn1Click(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  fRelPlanoContasCad := TfRelPlanoContasCad.Create(Self);
  fRelPlanoContasCad.RLReport1.Preview;
  fRelPlanoContasCad.RLReport1.Free;
  SMDBGrid1.EnableScroll;
end;

end.
