unit UCarteira;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls,
  RxLookup, ToolEdit, RXDBCtrl, Grids, DBGrids, SMDBGrid;

type
  TfCarteira = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
    vVlrTitulos : Real;
    vQtdTitulos : Integer;

  public
    { Public declarations }
  end;

var
  fCarteira: TfCarteira;

implementation

uses UDMCarteira, UDM1, UCarteiraC, DB;

{$R *.dfm}

procedure TfCarteira.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMCarteira.cdsCarteira.State in [dsEdit,dsInsert] then
    DMCarteira.cdsCarteira.CancelUpdates;
  Action := Cafree;
end;

procedure TfCarteira.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a inclusão/alteração?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  Close;
end;

procedure TfCarteira.BitBtn1Click(Sender: TObject);
begin
  if Trim(DMCarteira.cdsCarteiraCODBANCO.AsString) = '' then
  begin
    ShowMessage('Código do Banco não foi informado!');
    exit;
  end;
  if Trim(DMCarteira.cdsCarteiraCODCARTEIRA.AsString) = '' then
  begin
    ShowMessage('Código da Carteira não foi informada!');
    exit;
  end;
  if Trim(DMCarteira.cdsCarteiraNOMECARTEIRA.AsString) = '' then
  begin
    ShowMessage('Descrição da carteira não foi informada!');
    exit;
  end;
  DMCarteira.cdsCarteira.Post;
  DMCarteira.cdsCarteira.ApplyUpdates(0);

  Close;
end;

procedure TfCarteira.DBEdit2Exit(Sender: TObject);
begin
  DMCarteira.cdsCarteiraCODCARTEIRA_IMP.AsString := DMCarteira.cdsCarteiraCODCARTEIRA.AsString;
end;

end.
