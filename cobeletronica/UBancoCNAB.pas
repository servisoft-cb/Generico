unit UBancoCNAB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls,
  RxLookup, ToolEdit, RXDBCtrl, Grids, DBGrids, SMDBGrid, RxDBComb;

type
  TfBancoCNAB = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Bevel1: TBevel;
    Label11: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    Label9: TLabel;
    Label32: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit5: TDBEdit;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox3: TRxDBComboBox;
    RxDBComboBox4: TRxDBComboBox;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DirectoryEdit1: TDirectoryEdit;
    DBEdit8: TDBEdit;
    RxDBComboBox6: TRxDBComboBox;
    RxDBComboBox9: TRxDBComboBox;
    DBEdit9: TDBEdit;
    RxDBComboBox14: TRxDBComboBox;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    RxDBComboBox2: TRxDBComboBox;
    RxDBComboBox7: TRxDBComboBox;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    procedure Monta_sqlBanco_CNAB;

  public
    { Public declarations }
    vCodConta : Integer;
  end;

var
  fBancoCNAB: TfBancoCNAB;

implementation

uses UDMBanco_CNAB, UDM1, DB;

{$R *.dfm}

procedure TfBancoCNAB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMBanco_CNAB.cdsBanco_CNAB.State in [dsEdit,dsInsert] then
    DMBanco_CNAB.cdsBanco_CNAB.CancelUpdates;
  Action := Cafree;
end;

procedure TfBancoCNAB.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a inclusão/alteração?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  Close;
end;

procedure TfBancoCNAB.BitBtn1Click(Sender: TObject);
begin
  DMBanco_CNAB.cdsBanco_CNAB.Post;

  DMBanco_CNAB.cdsBanco_CNAB.ApplyUpdates(0);

  Close;
end;

procedure TfBancoCNAB.Monta_sqlBanco_CNAB;
begin
  DMBanco_CNAB.cdsBanco_CNAB.Close;
  DMBanco_CNAB.sdsBanco_CNAB.CommandText := ctBanco_CNAB
                                      + ' WHERE CODCONTA = ' + IntToStr(vCodConta);
  DMBanco_CNAB.cdsBanco_CNAB.Open;


  if not DMBanco_CNAB.cdsBanco_CNAB.IsEmpty then
    DMBanco_CNAB.cdsBanco_CNAB.Edit
  else
  begin
    DMBanco_CNAB.cdsBanco_CNAB.Insert;
    DMBanco_CNAB.cdsBanco_CNABCODCONTA.AsInteger := vCodConta;
  end;
end;

procedure TfBancoCNAB.FormCreate(Sender: TObject);
begin
  Monta_sqlBanco_CNAB;
end;

end.
