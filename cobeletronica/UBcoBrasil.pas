unit UBcoBrasil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, RxDBComb,
  Db, DbTables, ToolEdit, RxLookup, RXDBCtrl;

type
  TfBcoBrasil = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Bevel1: TBevel;
    Label11: TLabel;
    Label18: TLabel;
    DBEdit1: TDBEdit;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox3: TRxDBComboBox;
    RxDBComboBox4: TRxDBComboBox;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DirectoryEdit1: TDirectoryEdit;
    DBEdit2: TDBEdit;
    RxDBComboBox6: TRxDBComboBox;
    RxDBComboBox9: TRxDBComboBox;
    Label22: TLabel;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label32: TLabel;
    RxDBComboBox14: TRxDBComboBox;
    DBEdit4: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label4: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    Label15: TLabel;
    RxDBComboBox7: TRxDBComboBox;
    Label2: TLabel;
    DBEdit8: TDBEdit;
    Label7: TLabel;
    DBEdit9: TDBEdit;
    Label8: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBcoBrasil: TfBcoBrasil;

implementation

uses UDM1, UCobBrasil, UDMBanco;

{$R *.DFM}

procedure TfBcoBrasil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
  begin
    DMBanco.tBcoBrasil.Close;
    DM1.tCliente.Close;
    DM1.tCReceber.Close;
    DM1.tCReceberParc.Close;
    DM1.tCReceberParcHist.Close;
    DM1.tCReceberParcRem.Close;
    DM1.tContasParametros.Close;
  end;
  if DMBanco.Owner.ClassName = Self.ClassName then
    FreeAndNil(DMBanco);
  Action := CaFree;
end;

procedure TfBcoBrasil.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfBcoBrasil.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DMBanco.tBcoBrasil.State in [dsEdit,dsInsert] then
    begin
      DMBanco.tBcoBrasilCaminho.AsString := DirectoryEdit1.Text;
      DMBanco.tBcoBrasil.Post;
    end;
end;

procedure TfBcoBrasil.BitBtn5Click(Sender: TObject);
begin
  DMBanco.tBcoBrasilCaminho.AsString := DirectoryEdit1.Text;
  DMBanco.tBcoBrasil.Post;
  DMBanco.tBcoBrasil.Edit;
end;

procedure TfBcoBrasil.BitBtn4Click(Sender: TObject);
begin
  if DM1.tContasFilial.AsInteger > 0 then
    begin
      DMBanco.tBcoBrasilCaminho.AsString := DirectoryEdit1.Text;
      fCobBrasil := TfCobBrasil.Create(Self);
      fCobBrasil.ShowModal;
    end
  else
    ShowMessage('A conta esta sem filial!');
end;

procedure TfBcoBrasil.FormShow(Sender: TObject);
begin
  if not Assigned(DMBanco) then
    DMBanco := TDMBanco.Create(Self);

  DMBanco.tBcoBrasil.Open;
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
  DM1.tTipoCobranca.Open;
  DM1.tUF.Open;

  if DMBanco.tBcoBrasil.RecordCount > 0 then
    DMBanco.tBcoBrasil.Edit
  else
    DMBanco.tBcoBrasil.Insert;

  DMBanco.tBcoBrasilCodCedente.AsString := DM1.tContasNumConta.AsString;
  DirectoryEdit1.Text               := DMBanco.tBcoBrasilCaminho.AsString;
end;

procedure TfBcoBrasil.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tTipoCobranca.IndexFieldNames := 'Nome';
end;

end.
