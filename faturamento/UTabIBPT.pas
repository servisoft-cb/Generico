unit UTabIBPT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls,
  RxLookup, ToolEdit, RXDBCtrl, RxDBComb, UDMTabIBPT;

type
  TfTabIBPT = class(TForm)
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
    Label5: TLabel;
    DBEdit5: TDBEdit;
    RxDBComboBox2: TRxDBComboBox;
    Label38: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label2: TLabel;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label13: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label14: TLabel;
    DBDateEdit2: TDBDateEdit;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label16: TLabel;
    DBEdit11: TDBEdit;
    Label17: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    procedure Grava_TabIBPT;

  public
    { Public declarations }
    fDMCadTab_IBPT: TDMTabIBPT;
    
  end;

var
  fTabIBPT: TfTabIBPT;

implementation

uses UDM1, UTabIBPTC, DB;

{$R *.dfm}

procedure TfTabIBPT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDMCadTab_IBPT.cdsIBPT.State in [dsEdit,dsInsert] then
    fDMCadTab_IBPT.cdsIBPT.CancelUpdates;
  Action := Cafree;
end;

procedure TfTabIBPT.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a inclusão/alteração?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  Close;
end;

procedure TfTabIBPT.BitBtn1Click(Sender: TObject);
begin
  Grava_TabIBPT;
  if fDMCadTab_IBPT.cdsIBPT.State in [dsEdit, dsInsert] then
  begin
    DBEdit2.SetFocus;
    exit;
  end;
  fDMCadTab_IBPT.cdsIBPT.ApplyUpdates(0);
  Close;
end;

procedure TfTabIBPT.Grava_TabIBPT;
begin
  if Trim(fDMCadTab_IBPT.cdsIBPTNOME.AsString) = '' then
  begin
    ShowMessage('Nome não informado!');
    exit;
  end;
  if (fDMCadTab_IBPT.cdsIBPTTABELA.AsString <> '0') and (fDMCadTab_IBPT.cdsIBPTTABELA.AsString <> '1') then
  begin
    ShowMessage('Tabela não informada!');
    exit;
  end;
  if StrToFloat(FormatFloat('0.00',fDMCadTab_IBPT.cdsIBPTPERC_NACIONAL.AsFloat)) <= 0 then
  begin
    ShowMessage('% Nacional não informado!');
    exit;
  end;
  try
    fDMCadTab_IBPT.cdsIBPT.Post;
    fDMCadTab_IBPT.cdsIBPT.ApplyUpdates(0);

  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível gravar o registro, ' + E.Message + '!');
    end;
  end;
end;

procedure TfTabIBPT.FormShow(Sender: TObject);
begin
  BitBtn1.Enabled := DM1.tUsuarioInsNFeEmail.AsBoolean;
end;

end.
