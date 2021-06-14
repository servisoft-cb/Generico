unit UBcoItau;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, RxDBComb,
  Db, DbTables, ToolEdit, RxLookup;

type
  TfBcoItau = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    Panel3: TPanel;
    Label3: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    Label5: TLabel;
    RxDBComboBox3: TRxDBComboBox;
    Label6: TLabel;
    RxDBComboBox4: TRxDBComboBox;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    Label13: TLabel;
    DBEdit6: TDBEdit;
    Label14: TLabel;
    DirectoryEdit1: TDirectoryEdit;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    Label16: TLabel;
    DBEdit8: TDBEdit;
    Label2: TLabel;
    RxDBComboBox8: TRxDBComboBox;
    Label19: TLabel;
    DBEdit2: TDBEdit;
    Label20: TLabel;
    RxDBComboBox11: TRxDBComboBox;
    Label21: TLabel;
    RxDBComboBox12: TRxDBComboBox;
    Bevel1: TBevel;
    Label9: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    Label12: TLabel;
    RxDBComboBox5: TRxDBComboBox;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBcoItau: TfBcoItau;

implementation

uses UDM1, UCobItau, UContas, UDMBanco;

{$R *.DFM}

procedure TfBcoItau.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
  begin
    DMBanco.tBcoItau.Close;
    DM1.tCliente.Close;
    DM1.tCReceber.Close;
    DM1.tCReceberParc.Close;
    DM1.tCReceberParcHist.Close;
    DM1.tCReceberParcRem.Close;
  end;
  if DMBanco.Owner.ClassName = Self.ClassName then
    FreeAndNil(DMBanco);
  Action := CaFree;
end;

procedure TfBcoItau.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfBcoItau.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DMBanco.tBcoItau.State in [dsEdit,dsInsert] then
    begin
      DMBanco.tBcoItauCaminho.AsString := DirectoryEdit1.Text;
      DMBanco.tBcoItau.Post;
    end;
end;

procedure TfBcoItau.BitBtn5Click(Sender: TObject);
begin
  DMBanco.tBcoItauCaminho.AsString := DirectoryEdit1.Text;
  DMBanco.tBcoItau.Post;
  DMBanco.tBcoItau.Edit;
  Close;
end;

procedure TfBcoItau.BitBtn4Click(Sender: TObject);
begin
  if DM1.tContasFilial.AsInteger > 0 then
    begin
      DMBanco.tBcoItauCaminho.AsString := DirectoryEdit1.Text;
      fCobItau := TfCobItau.Create(Self);
      fCobItau.ShowModal;
    end
  else
    ShowMessage('A conta esta sem filial!');
end;

procedure TfBcoItau.FormShow(Sender: TObject);
begin
  if not Assigned(DMBanco) then
    DMBanco := TDMBanco.Create(Self);

  DMBanco.tBcoItau.Open;
  DM1.tCliente.Open;
  DM1.tCReceber.Open;
  DM1.tCReceberParc.Open;
  DM1.tCReceberParcHist.Open;
  DM1.tCReceberParcRem.Open;
  DM1.tContas.Open;
  DM1.tContaslk.Open;
  DM1.tContasParametros.Open;
  DM1.tMovimentos.Open;
  DM1.tCidade.Open;
  DM1.tUF.Open;

  if DMBanco.tBcoItau.RecordCount > 0 then
    DMBanco.tBcoItau.Edit
  else
    DMBanco.tBcoItau.Insert;

  DMBanco.tBcoItauCodCedente.AsString := DM1.tContasCodCedente.AsString;
  DirectoryEdit1.Text                 := DMBanco.tBcoItauCaminho.AsString;
end;

procedure TfBcoItau.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
    DBEdit7.ReadOnly := not(DBEdit7.ReadOnly);
end;

end.
