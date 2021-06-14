unit URelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, DB;

type
  TfRelatorio = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Le_tRelatorio(Filial, PagInicial, PagFinal : Integer ; NomeForm : String);
  end;

var
  fRelatorio: TfRelatorio;

implementation

uses UDM1;

{$R *.dfm}

procedure TfRelatorio.Le_tRelatorio(Filial, PagInicial, PagFinal : Integer ; NomeForm : String);
begin
  if DM1.tRelatorio.Locate('Filial;NomeRel',VarArrayOf([Filial, NomeForm ]),[locaseinsensitive]) then
    DM1.tRelatorio.Edit
  else
    begin
      DM1.tRelatorio.Insert;
      DM1.tRelatorioFilial.AsInteger := Filial;
      DM1.tRelatorioNomeRel.AsString := NomeForm;
    end;                                         
  if PagFinal > 0 then
    begin                                                
      DM1.tRelatorioPaginaAnt.AsInteger    := (PagInicial - 1);
      DM1.tRelatorioNumUltPagina.AsInteger := PagFinal;
    end;
  fRelatorio.Label4.Caption := IntToStr(Filial);
end;

procedure TfRelatorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelatorio.BitBtn2Click(Sender: TObject);
begin
  DM1.tRelatorio.Cancel;
  Close;
end;

procedure TfRelatorio.BitBtn1Click(Sender: TObject);
begin
  DM1.tRelatorio.Post;
  Close;
end;

end.
