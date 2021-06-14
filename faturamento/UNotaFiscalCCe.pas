unit UNotaFiscalCCe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, RXCtrls, StdCtrls, DBCtrls, ExtCtrls, Mask, Buttons, ToolEdit, RXDBCtrl,
  RzEdit, RzDBEdit, Grids, DBGrids, SMDBGrid, DB, DBClient;

type
  TfNotaFiscalCCe = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    BitBtn5: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    StaticText1: TStaticText;
    BitBtn4: TBitBtn;
    mCCe: TClientDataSet;
    mCCeNumSequencial: TIntegerField;
    mCCeObs: TWideStringField;
    dsmCCe: TDataSource;
    mCCeNumProtocolo: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Abrir_FormNFe;
  public
    { Public declarations }
    vFilial, vNumSeq : Integer;
    procedure Gravar_NotaFiscal_NFe;
    procedure Gravar_mCCe;
  end;

var
  fNotaFiscalCCe: TfNotaFiscalCCe;

implementation

uses UDM1, UDMNFeFB, UDMNotaFiscal, uNFe, UNotaFiscalCCeDet, URelCCe;

{$R *.DFM}

procedure TfNotaFiscalCCe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMNFeFB.Owner.ClassName = Self.ClassName then
    FreeAndNil(DMNFeFB);

  Action := Cafree;
end;

procedure TfNotaFiscalCCe.BitBtn5Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  if Length(Memo1.Text) < 15 then
  begin
    ShowMessage('Motivo deve ter no mínimo 16 caracteres!');
    exit;
  end;

  DMNFeFB.cdsNotaFiscal_NFe.Last;
  vItemAux := DMNFeFB.cdsNotaFiscal_NFeITEM.AsInteger + 1;
  if vItemAux > 1 then
  begin
    if (DMNFeFB.cdsNotaFiscal_NFeNFEPROTOCOLO.IsNull) or (Trim(DMNFeFB.cdsNotaFiscal_NFeNFEPROTOCOLO.AsString) = '') then
    begin
      ShowMessage('Registro anterior não foi autorizado!');
      exit;
    end;
  end;

  Gravar_NotaFiscal_NFe;
  DMNFeFB.cdsNotaFiscal_NFe.Last;
  Abrir_FormNFe;
end;

procedure TfNotaFiscalCCe.FormCreate(Sender: TObject);
begin
  if not Assigned(DMNFeFB) then
    DMNFeFB := TDMNFeFB.Create(Self);
  DMNFeFB.Abre_NotaFiscal_NFe(DM1.tNotaFiscalFilial.AsInteger,DM1.tNotaFiscalNumSeq.AsInteger,'CCE');
end;

procedure TfNotaFiscalCCe.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfNotaFiscalCCe.Gravar_NotaFiscal_NFe;
var
  vItem : Integer;
  vItemTipo : Integer;
begin
  vItemTipo := DMNFeFB.fnc_proximo_ItemTipo(vFilial,vNumSeq,'CCE');
  if vItemTipo > 20 then
  begin
    ShowMessage('Máximo de ocorrência da Carta Eletrônica é 20!');
    exit;
  end;
  DMNFeFB.cdsNotaFiscal_NFe.Last;
  vItem := DMNFeFB.cdsNotaFiscal_NFeITEM.AsInteger + 1;

  try
    DMNFeFB.cdsNotaFiscal_NFe.Insert;
    DMNFeFB.cdsNotaFiscal_NFeFILIAL.AsInteger      := vFilial;
    DMNFeFB.cdsNotaFiscal_NFeNUMSEQ.AsInteger      := vNumSeq;
    DMNFeFB.cdsNotaFiscal_NFeITEM.AsInteger        := vItem;
    DMNFeFB.cdsNotaFiscal_NFeTIPO.AsString         := 'CCE';
    DMNFeFB.cdsNotaFiscal_NFeITEMTIPO.AsInteger    := vItemTipo;
    DMNFeFB.cdsNotaFiscal_NFeDESCRICAO.AsString    := 'Carta de Correção';
    DMNFeFB.cdsNotaFiscal_NFeMOTIVO.Value          := Memo1.Lines.Text;
    DMNFeFB.cdsNotaFiscal_NFeDTCADASTRO.AsDateTime := Date;
    DMNFeFB.cdsNotaFiscal_NFeHRCADASTRO.AsDateTime := Now;
    DMNFeFB.cdsNotaFiscal_NFe.Post;
    DMNFeFB.cdsNotaFiscal_NFe.ApplyUpdates(0);

    Memo1.Lines.Clear;
  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível gravar a Carta de Correção, ' + E.Message + '! Clique para continuar!');
      DMNFeFB.cdsNotaFiscal_NFe.CancelUpdates;
    end;
  end;
end;

procedure TfNotaFiscalCCe.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := ' ';
end;

procedure TfNotaFiscalCCe.Abrir_FormNFe;
begin
  if ((DMNFeFB.cdsNotaFiscal_NFeNFEPROTOCOLO.IsNull) or (Trim(DMNFeFB.cdsNotaFiscal_NFeNFEPROTOCOLO.AsString) = '')) and (DMNFeFB.cdsNotaFiscal_NFeITEMTIPO.AsInteger > 0) then
  begin
    try
      fNFe     := TfNFe.Create(fNFe);
      fNFe.Tag := 5;
      fNFe.ShowModal;
    finally
      FreeAndNil(fNFe);
    end;
  end;
end;


procedure TfNotaFiscalCCe.SMDBGrid1DblClick(Sender: TObject);
begin
  Abrir_FormNFe;
end;


procedure TfNotaFiscalCCe.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not(DMNFeFB.cdsNotaFiscal_NFe.IsEmpty) and
     ((DMNFeFB.cdsNotaFiscal_NFeNFEPROTOCOLO.IsNull) or (trim(DMNFeFB.cdsNotaFiscal_NFeNFEPROTOCOLO.AsString) = '')) then
  begin
    Background  := clRed;
    AFont.Color := clWhite;
  end;
end;

procedure TfNotaFiscalCCe.SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F11) and not(DMNFeFB.cdsNotaFiscal_NFe.IsEmpty) then
  begin
    fNotaFiscalCCeDet := TfNotaFiscalCCeDet.Create(Self);
    fNotaFiscalCCeDet.ShowModal;
  end;
end;

procedure TfNotaFiscalCCe.BitBtn3Click(Sender: TObject);
begin
  if DMNFeFB.cdsNotaFiscal_NFe.IsEmpty then
    exit;

  if (Trim(DMNFeFB.cdsNotaFiscal_NFeNFEPROTOCOLO.AsString) <> '') or not(DMNFeFB.cdsNotaFiscal_NFeNFEPROTOCOLO.IsNull) then
  begin
    ShowMessage('Carta de correção já enviada!');
    exit;
  end;

  if MessageDlg('Deseja excluir o registro da carta de correção?',mtconfirmation,[mbok,mbno],0)=mrNo then
    exit;

  DMNFeFB.cdsNotaFiscal_NFe.Delete;
  DMNFeFB.cdsNotaFiscal_NFe.ApplyUpdates(0);
end;

procedure TfNotaFiscalCCe.BitBtn4Click(Sender: TObject);
begin
  if DMNFeFB.cdsNotaFiscal_NFe.IsEmpty then
    exit;

  if (Trim(DMNFeFB.cdsNotaFiscal_NFeNFEPROTOCOLO.AsString) <> '') or not(DMNFeFB.cdsNotaFiscal_NFeNFEPROTOCOLO.IsNull) then
  begin
    ShowMessage('Carta de correção já enviada!');
    exit;
  end;

  if MessageDlg('Deseja alterar o registro da carta de correção?',mtconfirmation,[mbok,mbno],0)=mrNo then
    exit;

  Memo1.Lines.Text := DMNFeFB.cdsNotaFiscal_NFeMOTIVO.Value;
  Memo1.SetFocus;
  DMNFeFB.cdsNotaFiscal_NFe.Delete;
  DMNFeFB.cdsNotaFiscal_NFe.ApplyUpdates(0);
end;

procedure TfNotaFiscalCCe.BitBtn1Click(Sender: TObject);
begin
  DMNFeFB.cdsNotaFiscal_NFe.Last;

  if DMNFeFB.cdsNotaFiscal_NFe.IsEmpty then
    exit;

  if (Trim(DMNFeFB.cdsNotaFiscal_NFeNFEPROTOCOLO.AsString) = '') or (DMNFeFB.cdsNotaFiscal_NFeNFEPROTOCOLO.IsNull) then
  begin
    ShowMessage('Carta de correção não autorizada!');
    exit;
  end;

  Gravar_mCCe;

  fRelCCe := TfRelCCe.Create(Self);
  fRelCCe.RLReport1.Preview;
  fRelCCe.RLReport1.Free;
end;

procedure TfNotaFiscalCCe.FormShow(Sender: TObject);
begin
  DMNFeFB.cdsNotaFiscal_NFe.Last;
end;

procedure TfNotaFiscalCCe.Gravar_mCCe;
begin
  mCCe.EmptyDataSet;
  mCCe.Insert;
  mCCeNumSequencial.AsInteger := DMNFeFB.cdsNotaFiscal_NFeITEMTIPO.AsInteger;
  mCCeObs.Value               := DMNFeFB.cdsNotaFiscal_NFeMOTIVO.Value;
  mCCeNumProtocolo.AsString   := DMNFeFB.cdsNotaFiscal_NFeNFEPROTOCOLO.AsString;
  mCCe.Post;
  mCCe.First;
end;

end.
