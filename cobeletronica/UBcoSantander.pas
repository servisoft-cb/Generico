unit UBcoSantander;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, RxDBComb, Db, DbTables,
  ToolEdit, RxLookup, RXDBCtrl;

type
  TfBcoSantander = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Label11: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox3: TRxDBComboBox;
    RxDBComboBox4: TRxDBComboBox;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DirectoryEdit1: TDirectoryEdit;
    RxDBComboBox8: TRxDBComboBox;
    DBEdit2: TDBEdit;
    RxDBComboBox11: TRxDBComboBox;
    RxDBComboBox12: TRxDBComboBox;
    DBEdit4: TDBEdit;
    RxDBComboBox6: TRxDBComboBox;
    RxDBComboBox7: TRxDBComboBox;
    RxDBComboBox9: TRxDBComboBox;
    Label22: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label23: TLabel;
    RxDBComboBox10: TRxDBComboBox;
    Label24: TLabel;
    RxDBComboBox13: TRxDBComboBox;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label15: TLabel;
    DBEdit8: TDBEdit;
    Label16: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit9: TDBEdit;
    RxDBComboBox2: TRxDBComboBox;
    DBDateEdit2: TDBDateEdit;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    DBEdit10: TDBEdit;
    RxDBComboBox5: TRxDBComboBox;
    DBDateEdit3: TDBDateEdit;
    Label30: TLabel;
    DBEdit11: TDBEdit;
    Label31: TLabel;
    DBEdit12: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBcoSantander: TfBcoSantander;

implementation

uses UDM1, UCobSantander;

{$R *.DFM}

procedure TfBcoSantander.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tBcoSantander.Close;
      DM1.tCliente.Close;
      DM1.tCReceber.Close;
      DM1.tCReceberParc.Close;
      DM1.tCReceberParcHist.Close;
      DM1.tCReceberParcRem.Close;
      DM1.tContas.Close;
      DM1.tContaslk.Close;
      DM1.tContasParametros.Close;
    end;
  Action := CaFree;
end;

procedure TfBcoSantander.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfBcoSantander.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tBcoSantander.State in [dsEdit,dsInsert] then
    DM1.tBcoSantander.Post;
end;

procedure TfBcoSantander.BitBtn5Click(Sender: TObject);
begin
  if ((DM1.tBcoSantanderTipoDesconto.AsString = '1') or (DM1.tBcoSantanderTipoDesconto.AsString = '2')) and
     (DM1.tBcoSantanderDtLimiteDesconto.AsDateTime < 1) then
    begin
      ShowMessage('Faltou informar a data do desconto!');
      exit;
    end;
  DM1.tBcoSantanderCaminho.AsString := DirectoryEdit1.Text;
  DM1.tBcoSantander.Post;
  DM1.tBcoSantander.Edit;
end;

procedure TfBcoSantander.BitBtn4Click(Sender: TObject);
begin
  if DM1.tContasFilial.AsInteger > 0 then
    begin
      DM1.tBcoSantanderCaminho.AsString := DirectoryEdit1.Text;
      fCobSantander := TfCobSantander.Create(Self);
      fCobSantander.ShowModal;
    end
  else
    ShowMessage('A conta esta sem filial!');
end;

procedure TfBcoSantander.FormShow(Sender: TObject);
begin
  DM1.tBcoSantander.Open;
  DM1.tCliente.Open;
  DM1.tCReceber.Open;
  DM1.tCReceberParc.Open;
  DM1.tCReceberParcHist.Open;
  DM1.tCReceberParcRem.Open;
  DM1.tContaslk.Open;
  DM1.tMovimentos.Open;
  DM1.tCidade.Open;
  DM1.tUF.Open;

  if DM1.tBcoSantander.RecordCount > 0 then
    begin
      DM1.tBcoSantander.Edit;
      DirectoryEdit1.Text := DM1.tBcoSantanderCaminho.AsString;
    end
  else
    DM1.tBcoSantander.Insert;
end;

procedure TfBcoSantander.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
    DBEdit7.ReadOnly := not(DBEdit7.ReadOnly);
end;

end.
