unit UConsCReceberRem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, RxDBComb, RXCtrls, ExtCtrls, Mask,
  DBCtrls;

type
  TfConsCReceberRem = class(TForm)
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    DBEdit24: TDBEdit;
    DBEdit1: TDBEdit;
    Bevel1: TBevel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Bevel2: TBevel;
    Label35: TLabel;
    RxLabel5: TRxLabel;
    Label36: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label40: TLabel;
    DBEdit32: TDBEdit;
    DBEdit29: TDBEdit;
    Label37: TLabel;
    Label38: TLabel;
    DBEdit30: TDBEdit;
    Label39: TLabel;
    DBEdit31: TDBEdit;
    Label7: TLabel;
    DBEdit14: TDBEdit;
    Label8: TLabel;
    DBEdit15: TDBEdit;
    Label9: TLabel;
    DBEdit16: TDBEdit;
    Label10: TLabel;
    DBEdit17: TDBEdit;
    Label11: TLabel;
    DBEdit18: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label12: TLabel;
    DBEdit19: TDBEdit;
    Label13: TLabel;
    DBEdit20: TDBEdit;
    Label14: TLabel;
    DBEdit21: TDBEdit;
    Label15: TLabel;
    DBEdit22: TDBEdit;
    Label16: TLabel;
    DBEdit34: TDBEdit;
    Label17: TLabel;
    DBEdit35: TDBEdit;
    Label18: TLabel;
    DBEdit36: TDBEdit;
    Label19: TLabel;
    DBEdit37: TDBEdit;
    Label20: TLabel;
    DBEdit38: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsCReceberRem: TfConsCReceberRem;

implementation

uses UDM1;

{$R *.dfm}

procedure TfConsCReceberRem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.
