unit UNotaFiscalOBS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, RxLookup, RXCtrls, ExtCtrls, Mask, DBCtrls,
  Grids, DBGrids, RXDBCtrl, DB, DBTables;

type
  TfNotaFiscalOBS = class(TForm)
    RxLabel5: TRxLabel;
    RxDBLookupCombo12: TRxDBLookupCombo;
    BitBtn12: TBitBtn;
    SpeedButton22: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    DBMemo1: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo12Enter(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNotaFiscalOBS: TfNotaFiscalOBS;

implementation

uses UDM1, UObsAux;

{$R *.dfm}

procedure TfNotaFiscalOBS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM1.tNotaFiscalTBObs.State in [dsEdit, dsInsert] then
    DM1.tNotaFiscalTBObs.Cancel;
  Action := Cafree;
end;

procedure TfNotaFiscalOBS.RxDBLookupCombo12Enter(Sender: TObject);
begin
  DM1.tObsAux.IndexFieldNames := 'Nome';
end;

procedure TfNotaFiscalOBS.BitBtn12Click(Sender: TObject);
begin
  if RxDBLookupCombo12.Text <> '' then
    begin
      DM1.tObsAux.IndexFieldNames := 'Codigo';
      DM1.tObsAux.SetKey;
      DM1.tObsAuxCodigo.AsInteger := RxDBLookupCombo12.KeyValue;
      if DM1.tObsAux.GotoKey then
      begin
        if Trim(DM1.tNotaFiscalTBObsDadosAdicionais.Value) = '' then
          DM1.tNotaFiscalTBObsDadosAdicionais.Value := DM1.tObsAuxDescricao.Value
        else
          DM1.tNotaFiscalTBObsDadosAdicionais.Value := DM1.tNotaFiscalTBObsDadosAdicionais.Value + '. ' + DM1.tObsAuxDescricao.Value;
      end;
      RxDBLookupCombo12.ClearValue;
      RxDBLookupCombo12.SetFocus;
    end
  else
    begin
      ShowMessage('Obs não cadastrada!');
      RxDBLookupCombo12.SetFocus;
    end;
end;

procedure TfNotaFiscalOBS.SpeedButton22Click(Sender: TObject);
begin
  if DM1.tUsuarioObsAux.AsBoolean then
    begin
      fObsAux := TfObsAux.Create(Self);
      fObsAux.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfNotaFiscalOBS.BitBtn1Click(Sender: TObject);
begin
  DM1.tNotaFiscalTBObs.Post;
  Close;
end;

procedure TfNotaFiscalOBS.FormShow(Sender: TObject);
begin
  if DM1.tNotaFiscalTBObs.IsEmpty then
    begin
      DM1.tNotaFiscalTBObs.Insert;
      DM1.tNotaFiscalTBObsFilial.AsInteger := DM1.tNotaFiscalFilial.AsInteger;
      DM1.tNotaFiscalTBObsNumSeq.AsInteger := DM1.tNotaFiscalNumSeq.AsInteger;
    end
  else
    DM1.tNotaFiscalTBObs.Edit;
end;

procedure TfNotaFiscalOBS.BitBtn2Click(Sender: TObject);
begin
  DM1.tNotaFiscalTBObs.Cancel;
  Close;
end;

end.
