unit UDctoGrade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RxLookup, StdCtrls, Mask, ToolEdit, CurrEdit, Grids, DBVGrids, Buttons,
  ExtCtrls, Db, DBTables, Variants;

type
  TfDctoGrade = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel5: TPanel;
    BitBtn5: TBitBtn;
    VDBGrid1: TVDBGrid;
    CurrencyEdit1: TCurrencyEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure RxDBLookupCombo1CloseUp(Sender: TObject);
    procedure VDBGrid1Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure VDBGrid1CellClick(Column: TColumn);
    procedure VDBGrid1ColEnter(Sender: TObject);
    procedure VDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    procedure MontaGrade;
  public
    { Public declarations }
  end;

var
  fDctoGrade: TfDctoGrade;

implementation

uses UDctoEst, UDM1, UDM2, UConsEstoqueMat;

{$R *.DFM}

procedure TfDctoGrade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfDctoGrade.MontaGrade;
begin
  if (fDctoEst.SpeedButton1.Tag < 1) or (fDctoEst.tAuxDctoGrade.RecordCount < 1) then
    begin
      fDctoESt.tAuxDctoGrade.First;
      while not fDctoESt.tAuxDctoGrade.Eof do
        fDctoESt.tAuxDctoGrade.delete;
      DM1.tGradeItem.First;
      while not DM1.tGradeItem.Eof do
        begin
          fDctoEst.tAuxDctoGrade.Insert;
          fDctoEst.tAuxDctoGradeCodGrade.AsInteger   := DM1.tGradeItemCodGrade.AsInteger;
          fDctoEst.tAuxDctoGradePosicao.AsInteger    := DM1.tGradeItemPosicao.AsInteger;
          fDctoEst.tAuxDctoGradeQtd.AsString         := '';
          if DM1.tProdutoPrecoGrade.AsBoolean then
            begin
              if DM2.tProdutoTam2.Locate('CodProduto;CodGrade;Posicao',VarArrayOf([DM1.tProdutoCodigo.AsInteger,DM1.tGradeItemCodGrade.AsInteger,DM1.tGradeItemPosicao.AsInteger]),[locaseinsensitive]) then
                fDctoEst.tAuxDctoGradeVlrUnitario.AsFloat := DM2.tProdutoTam2PrecoCusto.AsFloat
              else
                fDctoEst.tAuxDctoGradeVlrUnitario.AsFloat := DM1.tProdutoPrecoCusto.AsFloat;
            end;
          fDctoEst.tAuxDctoGradeLargura.AsString := DM1.tGradeLargura.AsString;
          fDctoEst.tAuxDctoGradeTamanho.AsString := DM1.tGradeItemTamanho.AsString;
          fDctoEst.tAuxDctoGrade.Post;
          DM1.tGradeItem.Next;
        end;
    end;
  fDctoEst.tAuxDctoGrade.First;
end;

procedure TfDctoGrade.RxDBLookupCombo1Exit(Sender: TObject);
begin
  MontaGrade;
end;

procedure TfDctoGrade.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Nome';
end;

procedure TfDctoGrade.RxDBLookupCombo1CloseUp(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Codigo';
end;

procedure TfDctoGrade.VDBGrid1Enter(Sender: TObject);
begin
 if CurrencyEdit1.Value = 0 then
   begin
     ShowMessage('É obrigatório informar a quantidade total!');
     CurrencyEdit1.SetFocus;
   end
 else
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfDctoGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_F3 then
    begin
      if DM1.tUsuarioConsEstoqueMat.AsBoolean then
        begin
          fConsEstoqueMat := TfConsEstoqueMat.Create(Self);
          fConsEstoqueMat.ShowModal;
        end
      else
        ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir esta consulta!');
    end;
end;

procedure TfDctoGrade.FormShow(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Codigo';
  RxDBLookupCombo1.KeyValue := DM1.tProdutoCodGrade.AsInteger;
  DM1.tGrade.FindKey([DM1.tProdutoCodGrade.AsInteger]);
  if DM1.tProdutoProdMat.AsString = 'P' then
    begin
      DM1.tProdutoGrade.First;
      if DM1.tProdutoGradeCodGrade.AsInteger > 0 then
        begin
          RxDBLookupCombo1.KeyValue := DM1.tProdutoGradeCodGrade.AsInteger;
          DM1.tGrade.FindKey([RxDBLookupCombo1.KeyValue]);
        end;
    end
  else
    begin
      RxDBLookupCombo1.KeyValue := DM1.tProdutoCodGrade.AsInteger;
      DM1.tGrade.FindKey([DM1.tProdutoCodGrade.AsInteger]);
    end;
  if not DM1.tProdutoPrecoGrade.AsBoolean then
    begin
      vDBGrid1.Columns[3].Destroy;
      vDBGrid1.Columns[2].Destroy;
    end;
  MontaGrade;
  if fDctoEst.SpeedButton1.Tag = 1 then
    CurrencyEdit1.Value := fDctoEst.CurrencyEdit1.Value
  else
  if fDctoEst.SpeedButton1.Tag = 2 then
    begin
      CurrencyEdit1.Value      := DM1.tDctoEstItemQtd.AsFloat;
      RxDBLookupCombo1.Enabled := False;
      VDBGrid1.ReadOnly        := True;
      CurrencyEdit1.Enabled    := False;
    end;
end;

procedure TfDctoGrade.VDBGrid1CellClick(Column: TColumn);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfDctoGrade.VDBGrid1ColEnter(Sender: TObject);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfDctoGrade.VDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := vk_Return;
end;

procedure TfDctoGrade.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
 vQtd : Currency;
begin
  if fDctoEst.SpeedButton1.Tag <> 2 then
    begin
      vQtd := 0;
      fDctoEst.tAuxDctoGrade.First;
      while not fDctoEst.tAuxDctoGrade.Eof do
        begin
          vQtd := vQtd + fDctoEst.tAuxDctoGradeQtd.asFloat;
          fDctoEst.tAuxDctoGrade.Next;
        end;
      if StrToCurr(FormatCurr('0.000',vQtd)) <> StrToCurr(FormatCurr('0.000',CurrencyEdit1.Value)) then
        begin
          ShowMessage('Quantidade da grade diferente da quantidade total!');
          CurrencyEdit1.SetFocus;
          CanClose := False;
        end
      else
        begin
          fDctoEst.CurrencyEdit1.Value := vQtd;
          CanClose := True;
        end;
    end;
end;

procedure TfDctoGrade.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

end.
