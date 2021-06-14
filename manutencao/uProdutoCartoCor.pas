unit uProdutoCartoCor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, RxDBComb, Buttons, ExtCtrls, Mask,
  RxLookup, DBCtrls, uDmProdutoCarto;

type
  TfProdutoCartoCor = class(TForm)
    RxDBComboBox14: TRxDBComboBox;
    Label1: TLabel;
    Label2: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    Label10: TLabel;
    Label33: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    fDmProdutoCarto: TdmProdutoCarto;
  public
    { Public declarations }
    property DmProdutoCarto: TDmProdutoCarto read fDmProdutoCarto write fDmProdutoCarto;
  end;

var
  fProdutoCartoCor: TfProdutoCartoCor;

implementation

{$R *.dfm}

procedure TfProdutoCartoCor.BitBtn2Click(Sender: TObject);
begin
//  fDmProdutoCarto.cdsProdutoCartoCor.Cancel;
  Close;
end;

procedure TfProdutoCartoCor.BitBtn1Click(Sender: TObject);
begin
//  fDmProdutoCarto.cdsProdutoCartoCor.Post;
end;

end.
