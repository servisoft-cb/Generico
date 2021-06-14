unit UCobSantanderAlt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, StdCtrls, Mask, DBCtrls, ExtCtrls, RxDBComb, ToolEdit,
  RXDBCtrl, Buttons, VerificaCGC, VerificaCPF, DB, DBTables, RxLookup;

type
  TfCobSantanderAlt = class(TForm)
    RxLabel1: TRxLabel;
    DBEdit1: TDBEdit;
    RxLabel2: TRxLabel;
    DBEdit2: TDBEdit;
    RxLabel3: TRxLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    RxLabel4: TRxLabel;
    Bevel2: TBevel;
    Label3: TLabel;
    DBEdit10: TDBEdit;
    Bevel1: TBevel;
    Label4: TLabel;
    DBEdit11: TDBEdit;
    RxLabel5: TRxLabel;
    Label8: TLabel;
    DBEdit12: TDBEdit;
    Label9: TLabel;
    DBEdit13: TDBEdit;
    Label12: TLabel;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    DBEdit15: TDBEdit;
    Label15: TLabel;
    DBEdit16: TDBEdit;
    Bevel3: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxLabel6: TRxLabel;
    DBEdit17: TDBEdit;
    RxLabel7: TRxLabel;
    DBEdit18: TDBEdit;
    RxLabel8: TRxLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    RxLabel9: TRxLabel;
    RxLabel10: TRxLabel;
    DBEdit21: TDBEdit;
    VerificaCPF1: TVerificaCPF;
    VerificaCGC1: TVerificaCGC;
    Label18: TLabel;
    DBEdit23: TDBEdit;
    Label1: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    Label11: TLabel;
    RxDBComboBox3: TRxDBComboBox;
    RxDBComboBox8: TRxDBComboBox;
    Label5: TLabel;
    Label17: TLabel;
    RxDBComboBox7: TRxDBComboBox;
    Label6: TLabel;
    RxDBComboBox9: TRxDBComboBox;
    Label10: TLabel;
    RxDBComboBox4: TRxDBComboBox;
    Label21: TLabel;
    RxDBComboBox12: TRxDBComboBox;
    Label13: TLabel;
    RxDBComboBox5: TRxDBComboBox;
    Label16: TLabel;
    DBEdit5: TDBEdit;
    Label22: TLabel;
    DBEdit6: TDBEdit;
    Label19: TLabel;
    RxDBComboBox11: TRxDBComboBox;
    Label20: TLabel;
    Label23: TLabel;
    RxDBComboBox10: TRxDBComboBox;
    Label24: TLabel;
    DBEdit7: TDBEdit;
    RxDBComboBox13: TRxDBComboBox;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label2: TLabel;
    DBEdit22: TDBEdit;
    Label7: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit24: TDBEdit;
    RxDBComboBox1: TRxDBComboBox;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBEdit25: TDBEdit;
    RxDBComboBox6: TRxDBComboBox;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    Label32: TLabel;
    DBEdit28: TDBEdit;
    Label33: TLabel;
    DBEdit29: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCobSantanderAlt: TfCobSantanderAlt;

implementation

uses UCobSantander;

{$R *.dfm}

procedure TfCobSantanderAlt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfCobSantanderAlt.BitBtn2Click(Sender: TObject);
begin
  fCobSantander.mBoletos.Cancel;
  Close;
end;

procedure TfCobSantanderAlt.BitBtn1Click(Sender: TObject);
var
  vGravar : Boolean;
begin
  vGravar := True;
  if Length(fCobSantander.mBoletosCpfCnpjAvalista.AsString) > 0 then
    begin
      if Length(fCobSantander.mBoletosCpfCnpjAvalista.AsString) = 11 then
        begin
          VerificaCPF1.Entrada := fCobSantander.mBoletosCpfCnpjAvalista.AsString;
          if not VerificaCPF1.Resultado then
            begin
              ShowMessage('Número de CPF inválido!');
              DBEdit12.SetFocus;
              vGravar := False;
            end;
        end
      else
      if Length(fCobSantander.mBoletosCpfCnpjAvalista.AsString) = 14 then
        begin
          VerificaCGC1.Entrada := fCobSantander.mBoletosCpfCnpjAvalista.AsString;
          if not VerificaCGC1.Resultado then
            begin
              ShowMessage('Número de CNPJ inválido!');
              DBEdit12.SetFocus;
              vGravar := False;
            end;
        end
      else
        begin
          ShowMessage('Falta digitos do CNPJ ou CPF!');
          DBEdit12.SetFocus;
          vGravar := False;
        end;
    end;
  if vGravar then
    begin
      if (fCobSantander.mBoletosNomeAvalista.AsString <> '') and (fCobSantander.mBoletosEndAvalista.AsString = '') then
        begin
          ShowMessage('Falta informar o endereço do avalista!');
          vGravar := False;
        end;
    end;
  if vGravar then
    begin
      if (fCobSantander.mBoletosNomeAvalista.AsString <> '') and (fCobSantander.mBoletosCepAvalista.AsString = '') then
        begin
          ShowMessage('Falta informar o CEP do avalista!');
          vGravar := False;
        end;
    end;
  if vGravar then
    begin
      fCobSantander.mBoletos.Post;
      Close;
    end;
end;

procedure TfCobSantanderAlt.FormShow(Sender: TObject);
begin
  if fCobSantander.mBoletosNossoNumero.AsString <> '' then
    RxDBComboBox2.Enabled := False
  else
    RxDBComboBox2.Enabled := True;
end;

end.
