unit UBcoCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, RxDBComb,
  Db, DbTables, ToolEdit, RxLookup, RXDBCtrl;

type
  TfBcoCaixa = class(TForm)
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
    Bevel1: TBevel;
    Label11: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox3: TRxDBComboBox;
    RxDBComboBox4: TRxDBComboBox;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DirectoryEdit1: TDirectoryEdit;
    RxDBComboBox6: TRxDBComboBox;
    Label32: TLabel;
    RxDBComboBox14: TRxDBComboBox;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label4: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    Label8: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label16: TLabel;
    RxDBComboBox5: TRxDBComboBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
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
  fBcoCaixa: TfBcoCaixa;

implementation

uses UDM1, UCobBrasil, UDMBanco;

{$R *.DFM}

procedure TfBcoCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
  begin
    DMBanco.tBcoCaixa.Close;
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

procedure TfBcoCaixa.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfBcoCaixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DMBanco.tBcoCaixa.State in [dsEdit,dsInsert] then
    begin
      DMBanco.tBcoCaixaCaminho.AsString := DirectoryEdit1.Text;
      DMBanco.tBcoCaixa.Post;
    end;
end;

procedure TfBcoCaixa.BitBtn5Click(Sender: TObject);
begin
  DMBanco.tBcoCaixaCaminho.AsString := DirectoryEdit1.Text;
  DMBanco.tBcoCaixa.Post;
  DMBanco.tBcoCaixa.Edit;
end;

procedure TfBcoCaixa.BitBtn4Click(Sender: TObject);
begin
  if DM1.tContasFilial.AsInteger > 0 then
    begin
      DMBanco.tBcoCaixaCaminho.AsString := DirectoryEdit1.Text;
      fCobBrasil := TfCobBrasil.Create(Self);
      fCobBrasil.ShowModal;
    end
  else
    ShowMessage('A conta esta sem filial!');
end;

procedure TfBcoCaixa.FormShow(Sender: TObject);
begin
  if not Assigned(DMBanco) then
    DMBanco := TDMBanco.Create(Self);

  DMBanco.tBcoCaixa.Open;
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

  if DMBanco.tBcoCaixa.RecordCount > 0 then
    DMBanco.tBcoCaixa.Edit
  else
    DMBanco.tBcoCaixa.Insert;

  DirectoryEdit1.Text                  := DMBanco.tBcoCaixaCaminho.AsString;
end;

procedure TfBcoCaixa.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tTipoCobranca.IndexFieldNames := 'Nome';
end;

end.
