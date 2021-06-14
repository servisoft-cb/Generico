unit URelExtComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfRelExtComissao = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel21: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel22: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLSubDetail1: TRLSubDetail;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw5: TRLDraw;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLSubDetail2: TRLSubDetail;
    RLBand4: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLDraw6: TRLDraw;
    RLDraw7: TRLDraw;
    RLBand5: TRLBand;
    RLDBText12: TRLDBText;
    RLLabel26: TRLLabel;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText20: TRLDBText;
    RLBand6: TRLBand;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    RLDraw12: TRLDraw;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    RLBand7: TRLBand;
    RLLabel38: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDraw13: TRLDraw;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
    RLDBResult7: TRLDBResult;
    RLDBResult8: TRLDBResult;
    RLDBResult9: TRLDBResult;
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelExtComissao: TfRelExtComissao;

implementation

uses UConsComissao, ToolEdit;

{$R *.dfm}

procedure TfRelExtComissao.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel1.Caption := 'RELATÓRIO EXTRATO  DA COMISSÃO - ' + fConsComissao.DateEdit1.Text + ' a ' + fConsComissao.DateEdit2.Text;
end;

procedure TfRelExtComissao.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if fConsComissao.qComissaoFuncao.AsString = 'E' then
    RLLabel26.Caption := 'Entrada'
  else
  if fConsComissao.qComissaoFuncao.AsString = 'S' then
    RLLabel26.Caption := 'Pagto'
  else
  if fConsComissao.qComissaoFuncao.AsString = 'D' then
    RLLabel26.Caption := 'Devol.';
end;

procedure TfRelExtComissao.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  fConsComissao.qComissao.Close;
  if fConsComissao.Tag = 0 then
    RLSubDetail2.DataSource := nil
  else
    begin
      fConsComissao.Monta_SqlComissao;
      RLSubDetail2.DataSource := fConsComissao.dsqComissao;
    end;
end;

procedure TfRelExtComissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fConsComissao.qComissao.Close;
  Action := Cafree;
end;

procedure TfRelExtComissao.FormCreate(Sender: TObject);
begin
  if fConsComissao.Tag = 0 then
    RLBand3.Completion := ctNone
  else
    RLBand3.Completion := ctFullPage;
  RLBand7.Visible := (fConsComissao.Tag = 0);
end;

procedure TfRelExtComissao.RLBand6BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if fConsComissao.Tag = 0 then
    PrintIt := True
  else
    PrintIt := False;
end;

procedure TfRelExtComissao.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if fConsComissao.Tag = 0 then
    PrintIt := False
  else
    PrintIt := True;
end;

end.
