unit UPedidoDesconto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, db, dbTables;

type
  TfPedidoDesconto = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPedidoDesconto: TfPedidoDesconto;

implementation

uses UDM1;

{$R *.DFM}

procedure TfPedidoDesconto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfPedidoDesconto.BitBtn1Click(Sender: TObject);
begin
  if DM1.tPedido.State in [dsInsert,dsEdit] then
    begin
      DM1.tPedidoDesconto.First;
      while not DM1.tPedidoDesconto.EOF do
        begin
          if (DM1.tPedidoDescontoPercDesconto.AsFloat = 0) or (DM1.tPedidoDescontoPercDesconto.AsString = '') then
            DM1.tPedidoDesconto.Delete
          else
            DM1.tPedidoDesconto.Next;
        end;
    end;
  Close;
end;

procedure TfPedidoDesconto.DBGrid1Enter(Sender: TObject);
begin
 if DBGrid1.SelectedIndex = 0 then
   DBGrid1.SelectedIndex := 1;
end;

procedure TfPedidoDesconto.FormShow(Sender: TObject);
begin
  if DM1.tPedido.State = dsBrowse then
    DBGrid1.ReadOnly := True
  else
    DBGrid1.ReadOnly := False;
end;

end.
