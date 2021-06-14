unit UFeriado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, ToolEdit,
  RXDBCtrl, Grids, DBGrids;

type
  TfFeriado = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox1: TGroupBox;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFeriado: TfFeriado;

implementation

uses UDM1;

{$R *.DFM}

procedure TfFeriado.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfFeriado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tFeriado.Close;
  Action := Cafree;
end;

procedure TfFeriado.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir esta data?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
    DM1.tFeriado.Delete;
end;

procedure TfFeriado.BitBtn1Click(Sender: TObject);
begin
  DM1.tFeriado.Last;
  DM1.tFeriado.Insert;
  RxDBGrid1.SetFocus;
  RxDBGrid1.SelectedIndex := 0;
end;

procedure TfFeriado.DateEdit1Change(Sender: TObject);
begin
  DM1.tFeriado.FindKey([DateEdit1.Date])
end;

procedure TfFeriado.FormShow(Sender: TObject);
begin
  DM1.tFeriado.Open;
end;

end.
