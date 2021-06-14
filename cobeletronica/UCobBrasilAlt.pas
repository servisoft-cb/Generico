unit UCobBrasilAlt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, StdCtrls, Mask, DBCtrls, ExtCtrls, RxDBComb, ToolEdit,
  RXDBCtrl, Buttons, VerificaCGC, VerificaCPF, DB, DBTables, RxLookup;

type
  TfCobBrasilAlt = class(TForm)
    RxLabel1: TRxLabel;
    DBEdit1: TDBEdit;
    RxLabel2: TRxLabel;
    DBEdit2: TDBEdit;
    RxLabel3: TRxLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    RxLabel4: TRxLabel;
    Bevel2: TBevel;
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
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label22: TLabel;
    Label7: TLabel;
    Label32: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    RxDBComboBox3: TRxDBComboBox;
    RxDBComboBox4: TRxDBComboBox;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    RxDBComboBox6: TRxDBComboBox;
    RxDBComboBox9: TRxDBComboBox;
    DBEdit8: TDBEdit;
    RxDBComboBox14: TRxDBComboBox;
    DBEdit9: TDBEdit;
    RxDBComboBox2: TRxDBComboBox;
    RxDBComboBox7: TRxDBComboBox;
    DBEdit10: TDBEdit;
    Label1: TLabel;
    DBEdit22: TDBEdit;
    Label21: TLabel;
    DBEdit24: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCobBrasilAlt: TfCobBrasilAlt;

implementation

uses UCobBrasil;

{$R *.dfm}

procedure TfCobBrasilAlt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfCobBrasilAlt.BitBtn2Click(Sender: TObject);
begin
  fCobBrasil.mBoletos.Cancel;
  Close;
end;

procedure TfCobBrasilAlt.BitBtn1Click(Sender: TObject);
var
  vGravar : Boolean;
begin
  vGravar := True;
  if Length(fCobBrasil.mBoletosCpfCnpjAvalista.AsString) > 0 then
    begin
      if Length(fCobBrasil.mBoletosCpfCnpjAvalista.AsString) = 11 then
        begin
          VerificaCPF1.Entrada := fCobBrasil.mBoletosCpfCnpjAvalista.AsString;
          if not VerificaCPF1.Resultado then
            begin
              ShowMessage('Número de CPF inválido!');
              DBEdit12.SetFocus;
              vGravar := False;
            end;
        end
      else
      if Length(fCobBrasil.mBoletosCpfCnpjAvalista.AsString) = 14 then
        begin
          VerificaCGC1.Entrada := fCobBrasil.mBoletosCpfCnpjAvalista.AsString;
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
      if (fCobBrasil.mBoletosNomeAvalista.AsString <> '') and (fCobBrasil.mBoletosEndAvalista.AsString = '') then
        begin
          ShowMessage('Falta informar o endereço do avalista!');
          vGravar := False;
        end;
    end;
  if vGravar then
    begin
      if (fCobBrasil.mBoletosNomeAvalista.AsString <> '') and (fCobBrasil.mBoletosCepAvalista.AsString = '') then
        begin
          ShowMessage('Falta informar o CEP do avalista!');
          vGravar := False;
        end;
    end;
  if vGravar then
    begin
      fCobBrasil.mBoletos.Post;
      Close;
    end;
end;

end.
