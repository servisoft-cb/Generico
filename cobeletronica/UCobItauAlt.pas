unit UCobItauAlt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RXCtrls, StdCtrls, Mask, DBCtrls, ExtCtrls,
  RxDBComb, ToolEdit, RXDBCtrl, Buttons, VerificaCGC, VerificaCPF, DB, DBTables, RxLookup;

type
  TfCobItauAlt = class(TForm)
    RxLabel1: TRxLabel;
    DBEdit1: TDBEdit;
    RxLabel2: TRxLabel;
    DBEdit2: TDBEdit;
    RxLabel3: TRxLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    RxLabel4: TRxLabel;
    Bevel2: TBevel;
    Label20: TLabel;
    RxDBComboBox11: TRxDBComboBox;
    Label21: TLabel;
    RxDBComboBox12: TRxDBComboBox;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label19: TLabel;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    Label1: TLabel;
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
    DBEdit22: TDBEdit;
    Label22: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label23: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    RxDBComboBox3: TRxDBComboBox;
    RxDBComboBox4: TRxDBComboBox;
    RxDBComboBox8: TRxDBComboBox;
    RxDBComboBox5: TRxDBComboBox;
    RxDBComboBox6: TRxDBComboBox;
    Label7: TLabel;
    DBEdit9: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label18: TLabel;
    DBEdit23: TDBEdit;
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
  fCobItauAlt: TfCobItauAlt;

implementation

uses UCobItau;

{$R *.dfm}

procedure TfCobItauAlt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfCobItauAlt.BitBtn2Click(Sender: TObject);
begin
  fCobItau.mBoletos.Cancel;
  Close;
end;

procedure TfCobItauAlt.BitBtn1Click(Sender: TObject);
var
  vGravar : Boolean;
begin
  vGravar := True;
  if Length(fCobItau.mBoletosCpfCnpjAvalista.AsString) > 0 then
    begin
      if Length(fCobItau.mBoletosCpfCnpjAvalista.AsString) = 11 then
        begin
          VerificaCPF1.Entrada := fCobItau.mBoletosCpfCnpjAvalista.AsString;
          if not VerificaCPF1.Resultado then
            begin
              ShowMessage('Número de CPF inválido!');
              DBEdit12.SetFocus;
              vGravar := False;
            end;
        end
      else
      if Length(fCobItau.mBoletosCpfCnpjAvalista.AsString) = 14 then
        begin
          VerificaCGC1.Entrada := fCobItau.mBoletosCpfCnpjAvalista.AsString;
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
      if (fCobItau.mBoletosNomeAvalista.AsString <> '') and (fCobItau.mBoletosEndAvalista.AsString = '') then
        begin
          ShowMessage('Falta informar o endereço do avalista!');
          vGravar := False;
        end;
    end;
  if vGravar then
    begin
      if (fCobItau.mBoletosNomeAvalista.AsString <> '') and (fCobItau.mBoletosCepAvalista.AsString = '') then
        begin
          ShowMessage('Falta informar o CEP do avalista!');
          vGravar := False;
        end;
    end;
  if vGravar then
    begin
      fCobItau.mBoletos.Post;
      Close;
    end;
end;

procedure TfCobItauAlt.FormShow(Sender: TObject);
begin
  if fCobItau.mBoletosNossoNumero.AsString <> '' then
    RxDBComboBox2.Enabled := False
  else
    RxDBComboBox2.Enabled := True;
end;

end.
