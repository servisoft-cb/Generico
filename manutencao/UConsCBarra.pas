unit UConsCBarra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables, Grids, DBGrids,
  SMDBGrid;

type
  TfConsCBarra = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qConsulta: TQuery;
    dsqConsulta: TDataSource;
    SMDBGrid1: TSMDBGrid;
    qConsultaCodBarra: TStringField;
    qConsultacodproduto: TIntegerField;
    qConsultacodcor: TIntegerField;
    qConsultaTamanho: TStringField;
    qConsultaREFERENCIA: TStringField;
    qConsultaNOME: TStringField;
    qConsultaNomeCor: TStringField;
    qConsultaCodRepresentada: TIntegerField;
    qConsultaNomeCliente: TStringField;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsCBarra: TfConsCBarra;

implementation

uses URelCBarra, rsExcelExporta;

{$R *.dfm}

procedure TfConsCBarra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConsCBarra.FormShow(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;
end;

procedure TfConsCBarra.BitBtn1Click(Sender: TObject);
begin
  qConsulta.Close;
  qConsulta.Open;
end;

procedure TfConsCBarra.BitBtn2Click(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  fRelCBarra := TfRelCBarra.Create(Self);
  fRelCBarra.RLReport1.Preview;
  fRelCBarra.RLReport1.Free;
  SMDBGrid1.EnableScroll;
end;

procedure TfConsCBarra.BitBtn3Click(Sender: TObject);
begin
  ExcelExporta('SMDBGrid1',fConsCBarra);
end;

procedure TfConsCBarra.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

end.
