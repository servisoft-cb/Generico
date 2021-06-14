unit UBaixaBeneficiamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, Buttons, DB;

type
  TfBaixaBeneficiamento = class(TForm)
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    Label3: TLabel;
    DBText3: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    vQtdDevolvida : Real;
  public
    { Public declarations }
  end;

var
  fBaixaBeneficiamento: TfBaixaBeneficiamento;

implementation

uses UDM1, UConsNotaBeneficiamento;

{$R *.dfm}

procedure TfBaixaBeneficiamento.FormShow(Sender: TObject);
begin
  vQtdDevolvida :=  0;
  if DM1.tNEntradaItensBenef.IsEmpty then
    begin
      DM1.tNEntradaItensBenef.Insert;
      DM1.tNEntradaItensBenefFilial.AsInteger   := DM1.tNEntradaItensFilial.AsInteger;
      DM1.tNEntradaItensBenefCodForn.AsInteger  := DM1.tNEntradaItensCodForn.AsInteger;
      DM1.tNEntradaItensBenefNumNEntr.AsInteger := DM1.tNEntradaItensNumNEntr.AsInteger;
      DM1.tNEntradaItensBenefItem.AsInteger     := DM1.tNEntradaItensItem.AsInteger;
    end
  else
    begin
      DM1.tNEntradaItensBenef.Edit;
      vQtdDevolvida := DM1.tNEntradaItensBenefQtd.AsFloat;
    end;
end;

procedure TfBaixaBeneficiamento.BitBtn1Click(Sender: TObject);
begin
  if StrToFloat(FormatFloat('0.0000000',DM1.tNEntradaItensBenefQtd.AsFloat)) <= 0 then
    begin
      if DM1.tNEntradaItensBenef.State in [dsInsert] then
        DM1.tNEntradaItensBenef.Cancel
      else
        begin
          DM1.tNEntradaItens.Edit;
          DM1.tNEntradaItensQtdRestante.AsFloat  := StrToFloat(FormatFloat('0.000000',DM1.tNEntradaItensQtdRestante.AsFloat + vQtdDevolvida));
          DM1.tNEntradaItensQtdDevolvida.AsFloat := StrToFloat(FormatFloat('0.000000',DM1.tNEntradaItensQtdDevolvida.AsFloat - vQtdDevolvida));
          DM1.tNEntradaItens.Post;
          DM1.tNEntradaItensBenef.Cancel;
          DM1.tNEntradaItensBenef.Delete;
        end;
    end
  else
    begin
      DM1.tNEntradaItensBenefUsuario.AsString := DM1.tUsuarioUsuario.AsString;
      DM1.tNEntradaItensBenefData.AsDateTime  := Date;
      DM1.tNEntradaItensBenefHora.AsDateTime  := Now;
      DM1.tNEntradaItensBenef.Post;

      DM1.tNEntradaItens.Edit;
      DM1.tNEntradaItensQtdRestante.AsFloat  := StrToFloat(FormatFloat('0.000000',DM1.tNEntradaItensQtdRestante.AsFloat + vQtdDevolvida));
      DM1.tNEntradaItensQtdRestante.AsFloat  := StrToFloat(FormatFloat('0.000000',DM1.tNEntradaItensQtdRestante.AsFloat - DM1.tNEntradaItensBenefQtd.AsFloat));
      DM1.tNEntradaItensQtdDevolvida.AsFloat := StrToFloat(FormatFloat('0.000000',DM1.tNEntradaItensQtdDevolvida.AsFloat - vQtdDevolvida));
      DM1.tNEntradaItensQtdDevolvida.AsFloat := StrToFloat(FormatFloat('0.000000',DM1.tNEntradaItensQtdDevolvida.AsFloat + DM1.tNEntradaItensBenefQtd.AsFloat));
      DM1.tNEntradaItens.Post;
    end;
  Close;
end;

procedure TfBaixaBeneficiamento.BitBtn2Click(Sender: TObject);
begin
  if DM1.tNEntradaItensBenef.State in [dsInsert,dsEdit] then
    DM1.tNEntradaItensBenef.Cancel;
  Close;
end;

procedure TfBaixaBeneficiamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tNEntradaItensBenef.State in [dsInsert,dsEdit] then
    DM1.tNEntradaItensBenef.Cancel;
end;

procedure TfBaixaBeneficiamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.
