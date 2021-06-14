unit UNFeEmailC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  DateUtils, Grids, DBGrids, SMDBGrid, DB;

type
  TfNFeEmailC = class(TForm)
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
    procedure Monta_sqlNFeEmail;
  public
    { Public declarations }
  end;

var
  fNFeEmailC: TfNFeEmailC;

implementation

uses UDM1, uIntegracao, DmdDatabase, UDMNFeFB, UNFeEmail;

{$R *.dfm}

procedure TfNFeEmailC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMNFeFB.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMNFeFB);
  Action := Cafree;
end;

procedure TfNFeEmailC.BitBtn3Click(Sender: TObject);
begin
  Monta_sqlNFeEmail;
end;

procedure TfNFeEmailC.Monta_sqlNFeEmail;
begin
  DMNFeFB.cdsNFE_EMAIL.Close;
  DMNFeFB.sdsNFE_EMAIL.CommandText := ctNFe_Email;
  DMNFeFB.cdsNFE_EMAIL.Open;
end;

procedure TfNFeEmailC.BitBtn2Click(Sender: TObject);
begin
  if DMNFeFB.cdsNFE_EMAIL.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  DMNFeFB.cdsNFE_EMAIL.Delete;
  DMNFeFB.cdsNFE_EMAIL.ApplyUpdates(0);
end;

procedure TfNFeEmailC.BitBtn1Click(Sender: TObject);
var
  vNumAux: Integer;
begin
  //vNumAux := ProximaSequencia('NFE_EMAIL',0);

  DMNFeFB.cdsNFE_EMAIL.Last;
  vNumAux := DMNFeFB.cdsNFE_EMAILID.AsInteger + 1;

  DMNFeFB.cdsNFE_EMAIL.Insert;
  DMNFeFB.cdsNFE_EMAILID.AsInteger := vNumAux;

  fNFeEmail := TfNFeEmail.Create(Self);
  fNFeEmail.ShowModal;
end;

procedure TfNFeEmailC.FormShow(Sender: TObject);
var
  vData: TDateTime;
begin
  if not Assigned(DMNFeFB) then
    DMNFeFB := TDMNFeFB.Create(Self);

  Monta_sqlNFeEmail;

  BitBtn1.Enabled := DM1.tUsuarioInsNFeEmail.AsBoolean;
  BitBtn2.Enabled := DM1.tUsuarioExcNFeEmail.AsBoolean;
end;

procedure TfNFeEmailC.SMDBGrid1DblClick(Sender: TObject);
begin
  if DMNFeFB.cdsNFE_EMAIL.IsEmpty then
    exit;
  DMNFeFB.cdsNFE_EMAIL.Edit;
  fNFeEmail := TfNFeEmail.Create(Self);
  fNFeEmail.ShowModal;
end;

procedure TfNFeEmailC.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

end.
