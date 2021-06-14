unit UTabEnqIPI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls,
  RxLookup, ToolEdit, RXDBCtrl, RxDBComb, UDMTabEnqIPI;

type
  TfTabEnqIPI = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit7: TDBEdit;
    Label38: TLabel;
    RxDBComboBox12: TRxDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    procedure Grava_TabEnqIPI;

  public
    { Public declarations }
    fDMCadTabEnqIPI: TDMTabEnqIPI;

  end;

var
  fTabEnqIPI: TfTabEnqIPI;

implementation

uses UDM1, UTabEnqIPIC, DB;

{$R *.dfm}

procedure TfTabEnqIPI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDMCadTabEnqIPI.cdsEnqIPI.State in [dsEdit,dsInsert] then
    fDMCadTabEnqIPI.cdsEnqIPI.CancelUpdates;
  Action := Cafree;
end;

procedure TfTabEnqIPI.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a inclusão/alteração?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  Close;
end;

procedure TfTabEnqIPI.BitBtn1Click(Sender: TObject);
begin
  Grava_TabEnqIPI;
  if fDMCadTabEnqIPI.cdsEnqIPI.State in [dsEdit, dsInsert] then
  begin
    DBEdit2.SetFocus;
    exit;
  end;
  fDMCadTabEnqIPI.cdsEnqIPI.ApplyUpdates(0);
  Close;
end;

procedure TfTabEnqIPI.Grava_TabEnqIPI;
begin
  if Trim(fDMCadTabEnqIPI.cdsEnqIPIDESCRICAO.AsString) = '' then
  begin
    ShowMessage('Nome não informado!');
    exit;
  end;
  if (fDMCadTabEnqIPI.cdsEnqIPITIPO.IsNull) or (trim(fDMCadTabEnqIPI.cdsEnqIPITIPO.AsString) = '') then
  begin
    ShowMessage('Tipo não informado!');
    exit;
  end;
  if trim(fDMCadTabEnqIPI.cdsEnqIPICODIGO.AsString) = '' then
  begin
    ShowMessage('Código não informado');
    exit;
  end;

  try
    fDMCadTabEnqIPI.cdsEnqIPI.Post;
    fDMCadTabEnqIPI.cdsEnqIPI.ApplyUpdates(0);

  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível gravar o registro, ' + E.Message + '!');
    end;
  end;
end;

procedure TfTabEnqIPI.FormShow(Sender: TObject);
begin
  BitBtn1.Enabled := DM1.tUsuarioInsNFeEmail.AsBoolean;
end;

end.
