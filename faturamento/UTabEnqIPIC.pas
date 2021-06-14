unit UTabEnqIPIC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  DateUtils, Grids, DBGrids, SMDBGrid, DB, ComCtrls, UDMTabEnqIPI;

type
  TfTabEnqIPIC = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    StaticText1: TStaticText;
    BitBtn5: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    fDMCadTabEnqIPI: TDMTabEnqIPI;

    procedure Monta_sqlTabEnqIPI;
    procedure prc_Inserir;
  public
    { Public declarations }
  end;

var
  fTabEnqIPIC: TfTabEnqIPIC;

implementation

uses UDM1, uIntegracao, DmdDatabase, UTabEnqIPI, rsDBUtils, uUtil;

{$R *.dfm}

procedure TfTabEnqIPIC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMCadTabEnqIPI);
  Action := Cafree;
end;

procedure TfTabEnqIPIC.BitBtn3Click(Sender: TObject);
begin
  Monta_sqlTabEnqIPI;
end;

procedure TfTabEnqIPIC.Monta_sqlTabEnqIPI;
begin
  fDMCadTabEnqIPI.cdsEnqIPI.Close;
  fDMCadTabEnqIPI.sdsEnqIPI.CommandText := fDMCadTabEnqIPI.ctEnqIPI;
  fDMCadTabEnqIPI.cdsEnqIPI.Open;
end;

procedure TfTabEnqIPIC.BitBtn2Click(Sender: TObject);
begin
  if fDMCadTabEnqIPI.cdsEnqIPI.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadTabEnqIPI.cdsEnqIPI.Delete;
  fDMCadTabEnqIPI.cdsEnqIPI.ApplyUpdates(0);
end;

procedure TfTabEnqIPIC.BitBtn1Click(Sender: TObject);
begin
  prc_Inserir;
  fTabEnqIPI := TfTabEnqIPI.Create(Self);
  fTabEnqIPI.fDMCadTabEnqIPI := fDMCadTabEnqIPI;
  fTabEnqIPI.ShowModal;
end;

procedure TfTabEnqIPIC.FormShow(Sender: TObject);
var
  vData: TDateTime;
begin
  fDMCadTabEnqIPI := TDMTabEnqIPI.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadTabEnqIPI);

  Monta_sqlTabEnqIPI;
end;

procedure TfTabEnqIPIC.SMDBGrid1DblClick(Sender: TObject);
begin
  if fDMCadTabEnqIPI.cdsEnqIPI.IsEmpty then
    exit;
  fDMCadTabEnqIPI.cdsEnqIPI.Edit;
  fTabEnqIPI := TfTabEnqIPI.Create(Self);
  fTabEnqIPI.fDMCadTabEnqIPI := fDMCadTabEnqIPI;
  fTabEnqIPI.ShowModal;
end;

procedure TfTabEnqIPIC.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfTabEnqIPIC.prc_Inserir;
var
  vNumAux: Integer;
begin
  vNumAux := ProximaSequencia('TAB_IBPT',0);

  //fDMCadTabEnqIPI.cdsEnqIPI.Last;
  vNumAux := vNumAux + 1;

  fDMCadTabEnqIPI.cdsEnqIPI.Insert;
  fDMCadTabEnqIPI.cdsEnqIPIID.AsInteger := vNumAux;
end;

end.
