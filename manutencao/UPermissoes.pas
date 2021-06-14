unit UPermissoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  TfPermissoes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn6: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPermissoes: TfPermissoes;

implementation

uses UDM1;

{$R *.DFM}

procedure TfPermissoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TfPermissoes.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

end.
