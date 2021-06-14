unit UCarteiraC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  DateUtils, Grids, DBGrids, SMDBGrid, DB;

type
  TfCarteiraC = class(TForm)
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
    procedure Monta_sqlCarteira;
  public
    { Public declarations }

  end;

var
  fCarteiraC: TfCarteiraC;

implementation

uses UDMCarteira, UDM1, UCarteira, uIntegracao, UArqRetornoBrasil,
  UDMBanco, uUtilPadrao, UArqRetornoItau, DmdDatabase;

{$R *.dfm}

procedure TfCarteiraC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMCarteira.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMCarteira);
  Action := Cafree;
end;

procedure TfCarteiraC.BitBtn3Click(Sender: TObject);
begin
  Monta_sqlCarteira;
end;

procedure TfCarteiraC.Monta_sqlCarteira;
begin
  DMCarteira.cdsCarteira.Close;
  DMCarteira.sdsCarteira.CommandText := ctCarteira
                                      + ' WHERE 0=0 ';
  DMCarteira.sdsCarteira.CommandText := DMCarteira.sdsCarteira.CommandText
                                                + ' ORDER BY ID ';
  DMCarteira.cdsCarteira.Open;
end;

procedure TfCarteiraC.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  DMCarteira.cdsCarteira.Delete;
  DMCarteira.cdsCarteira.ApplyUpdates(0);
end;

procedure TfCarteiraC.BitBtn1Click(Sender: TObject);
var
  vNumAux: Integer;
begin
  vNumAux :=  ProximaSequencia('CARTEIRA',0);

  DMCarteira.cdsCarteira.Insert;
  
  DMCarteira.cdsCarteiraID.AsInteger         := vNumAux;

  fCarteira := TfCarteira.Create(Self);
  fCarteira.ShowModal;
end;

procedure TfCarteiraC.FormShow(Sender: TObject);
var
  vData: TDateTime;
begin
  if not Assigned(DMCarteira) then
    DMCarteira := TDMCarteira.Create(Self);

  Monta_sqlCarteira;
end;

procedure TfCarteiraC.SMDBGrid1DblClick(Sender: TObject);
begin
  if DMCarteira.cdsCarteira.IsEmpty then
    exit;
  DMCarteira.cdsCarteira.Edit;
  fCarteira := TfCarteira.Create(Self);
  fCarteira.ShowModal;
end;

procedure TfCarteiraC.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

end.
