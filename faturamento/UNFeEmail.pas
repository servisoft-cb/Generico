unit UNFeEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls,
  RxLookup, ToolEdit, RXDBCtrl, Grids, DBGrids, SMDBGrid, RLSaveDialog, RLFilters, RLPDFFilter, RLBoleto;

type
  TfNFeEmail = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    procedure Grava_NFeEmail;
    
  public
    { Public declarations }
  end;

var
  fNFeEmail: TfNFeEmail;

implementation

uses UDMNFeFB, UDM1, UNFeEmailC, DB;

{$R *.dfm}

procedure TfNFeEmail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMNFeFB.cdsNFE_EMAIL.State in [dsEdit,dsInsert] then
    DMNFeFB.cdsNFE_EMAIL.CancelUpdates;
  Action := Cafree;
end;

procedure TfNFeEmail.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a inclusão/alteração?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  Close;
end;

procedure TfNFeEmail.BitBtn1Click(Sender: TObject);
begin
  Grava_NFeEmail;
  if DMNFeFB.cdsNFE_EMAIL.State in [dsEdit, dsInsert] then
  begin
    DBEdit2.SetFocus;
    exit;
  end;

  DMNFeFB.cdsNFE_EMAIL.ApplyUpdates(0);

  Close;
end;

procedure TfNFeEmail.Grava_NFeEmail;
begin
  if Trim(DMNFeFB.cdsNFE_EMAILNOME.AsString) = '' then
  begin
    ShowMessage('Nome não informado!');
    exit;
  end;
  if Trim(DMNFeFB.cdsNFE_EMAILEMAIL.AsString) = '' then
  begin
    ShowMessage('Email não informado!');
    exit;
  end;

  try
    DMNFeFB.cdsNFE_EMAIL.Post;
    DMNFeFB.cdsNFE_EMAIL.ApplyUpdates(0);

  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível gravar o emaiil, ' + E.Message + '!');
    end;
  end;
end;

procedure TfNFeEmail.FormShow(Sender: TObject);
begin
  BitBtn1.Enabled := DM1.tUsuarioInsNFeEmail.AsBoolean;
end;

end.
