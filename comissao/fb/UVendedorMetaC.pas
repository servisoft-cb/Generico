unit UVendedorMetaC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, Grids, DBGrids,
  SMDBGrid, DB;

type
  TfVendedorMetaC = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    StaticText1: TStaticText;
    BitBtn5: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    procedure Montar_sqlVendedorMeta(Tipo : String ; Codigo, CodMarca : Integer);
  public
    { Public declarations }

  end;

var
  fVendedorMetaC: TfVendedorMetaC;

implementation

uses UDMVendedorMeta, UDM1, UVendedorMeta, DateUtils;

{$R *.dfm}

procedure TfVendedorMetaC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMVendedorMeta.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMVendedorMeta);
  Action := Cafree;
end;

procedure TfVendedorMetaC.BitBtn3Click(Sender: TObject);
begin
  Montar_sqlVendedorMeta('C',0,0);
end;

procedure TfVendedorMetaC.Montar_sqlVendedorMeta(Tipo : String ; Codigo, CodMarca : Integer);
begin
  DMVendedorMeta.cdsVendedor_Meta.Close;
  DMVendedorMeta.sdsVendedor_Meta.CommandText := ctVendedorMeta
                                                + ' WHERE 0=0 ';
  if (Tipo = 'I') or (Codigo > 0) then
    DMVendedorMeta.sdsVendedor_Meta.CommandText := DMVendedorMeta.sdsVendedor_Meta.CommandText
                                                  + ' AND VM.CODIGO = ' + IntToStr(Codigo)
                                                  + ' AND VM.CODMARCA = ' + IntToStr(CodMarca);
  DMVendedorMeta.sdsVendedor_Meta.CommandText := DMVendedorMeta.sdsVendedor_Meta.CommandText
                                                + ' ORDER BY V.NOME, VM.CODIGO ';
  DMVendedorMeta.cdsVendedor_Meta.Open;
end;

procedure TfVendedorMetaC.BitBtn2Click(Sender: TObject);
begin
  if DMVendedorMeta.cdsVendedor_Meta.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  DMVendedorMeta.cdsVendedor_Meta.Delete;
  DMVendedorMeta.cdsVendedor_Meta.ApplyUpdates(0);
end;


procedure TfVendedorMetaC.BitBtn1Click(Sender: TObject);
begin
  if not DM1.tUsuarioInsVendedorMeta.AsBoolean then
  begin
    ShowMessage('Usuário ' + DM1.tUsuarioUsuario.AsString + ', não autorizado!');
    exit;
  end;

  if not DMVendedorMeta.cdsVendedor_Meta.Active then
    Montar_sqlVendedorMeta('I',0,0);

  DMVendedorMeta.cdsVendedor_Meta.Insert;

  fVendedorMeta := TfVendedorMeta.Create(Self);
  fVendedorMeta.ShowModal;
end;

procedure TfVendedorMetaC.FormShow(Sender: TObject);
begin
  if not Assigned(DMVendedorMeta) then
    DMVendedorMeta := TDMVendedorMeta.Create(Self);

  Montar_sqlVendedorMeta('C',0,0);
end;

procedure TfVendedorMetaC.SMDBGrid1DblClick(Sender: TObject);
begin
  if DMVendedorMeta.cdsVendedor_Meta.IsEmpty then
    exit;
  DMVendedorMeta.cdsVendedor_Meta.Edit;
  fVendedorMeta := TfVendedorMeta.Create(Self);
  fVendedorMeta.ShowModal;
end;

procedure TfVendedorMetaC.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

end.
