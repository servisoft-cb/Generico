unit UCupomFiscalCanc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, Buttons, DB;

type
  TfCupomFiscalCanc = class(TForm)
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCupomFiscalCanc: TfCupomFiscalCanc;

implementation

uses UDMCupom, uUtilCupomFiscal, UCupomFiscal;

{$R *.dfm}

procedure TfCupomFiscalCanc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfCupomFiscalCanc.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfCupomFiscalCanc.BitBtn1Click(Sender: TObject);
begin
  if not DMCupom.cdsCupomFiscalIt.Locate('ITEM',CurrencyEdit1.AsInteger,[loCaseInsensitive]) then
    Raise Exception.Create('Item não encontrado no cupom!');

  if DMCupom.cdsCupomFiscalItCANCELADO.AsString = 'S' then
    Raise Exception.Create('Item já cancelado!');

  if MessageDlg('Deseja Cancelar o Item ' + DMCupom.cdsCupomFiscalItNOMEPRODUTO.AsString + '?' ,mtconfirmation,[mbok,mbno],0)=mrNo then
    exit;

  fCupomFiscal.Excluir_Estoque(DMCupom.cdsCupomFiscalFILIAL.AsInteger,DMCupom.cdsCupomFiscalItNUMMOVEST.AsInteger);
  
  DMCupom.cdsCupomFiscalIt.Edit;
  DMCupom.cdsCupomFiscalItCANCELADO.AsString := 'S';
  DMCupom.cdsCupomFiscalIt.Post;
  DMCupom.cdsCupomFiscal.ApplyUpdates(0);
  DMCupom.cdsCupomFiscal.Edit;

  prc_Imprimir_Item_Cancelado_Daruma;

  Close;

end;

end.
