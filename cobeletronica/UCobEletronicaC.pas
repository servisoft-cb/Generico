unit UCobEletronicaC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  DateUtils, Grids, DBGrids, SMDBGrid, DB, RxLookup;

type
  TfCobEletronicaC = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label2: TLabel;
    SMDBGrid1: TSMDBGrid;
    StaticText1: TStaticText;
    BitBtn6: TBitBtn;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_sqlCobEletronica;
  public
    { Public declarations }
    procedure prc_Ajustar_CReceber;

    function fnc_Posiciona_CReceber(Filial, NumNota, Parcela, NumCReceber: Integer; Serie: String): Boolean;
  end;

var
  fCobEletronicaC: TfCobEletronicaC;

implementation

uses UDMCobEletronica, UDM1, UCobEletronica, uIntegracao, UArqRetornoBrasil, URelCobrancaEletronica, URelCobEletronica,
  UDMBanco, uUtilPadrao, UArqRetornoItau, DmdDatabase, UDMBanco_CNAB,
  UDMCarteira, uCobRetorno;

{$R *.dfm}

procedure TfCobEletronicaC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMCobEletronica.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMCobEletronica);
  if DMBanco.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMBanco);
  if DMBanco_CNAB.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMBanco_CNAB);
  if DMCarteira.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMCarteira);
  Action := Cafree;
end;

procedure TfCobEletronicaC.BitBtn3Click(Sender: TObject);
begin
  Monta_sqlCobEletronica;
end;

procedure TfCobEletronicaC.Monta_sqlCobEletronica;
begin
  DMCobEletronica.cdsCobEletronica.Close;
  DMCobEletronica.sdsCobEletronica.CommandText := ctCobEletronica
                                                + ' WHERE 0=0 ';
  if DateEdit1.Date > 0 then
  begin
    DMCobEletronica.sdsCobEletronica.CommandText := DMCobEletronica.sdsCobEletronica.CommandText
                                                  + ' AND DTGERACAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  end;
  if DateEdit2.Date > 0 then
  begin
    DMCobEletronica.sdsCobEletronica.CommandText := DMCobEletronica.sdsCobEletronica.CommandText
                                                  + ' AND DTGERACAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  end;

  {if DateEdit1.Date > 0 then
  begin
    DMCobEletronica.sdsCobEletronica.CommandText := DMCobEletronica.sdsCobEletronica.CommandText
                                                  + ' AND DTGERACAO >= :DataIni ';
    DMCobEletronica.sdsCobEletronica.ParamByName('DataIni').AsDate := DateEdit1.Date;
  end;
  if DateEdit2.Date > 0 then
  begin
    DMCobEletronica.sdsCobEletronica.CommandText := DMCobEletronica.sdsCobEletronica.CommandText
                                                  + ' AND DTGERACAO <= :DataFin ';
    DMCobEletronica.sdsCobEletronica.ParamByName('DataFin').AsDate := DateEdit2.Date;
  end;}

  DMCobEletronica.sdsCobEletronica.CommandText := DMCobEletronica.sdsCobEletronica.CommandText
                                                + ' ORDER BY DTGERACAO, ID ';

  DMCobEletronica.cdsCobEletronica.Open;
end;

procedure TfCobEletronicaC.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  DM1.tFilial.IndexFieldNames := 'Codigo';

  DMCobEletronica.cdsCobEletronica_Nota.First;
  while not DMCobEletronica.cdsCobEletronica_Nota.Eof do
  begin
    if fnc_Posiciona_CReceber(DMCobEletronica.cdsCobEletronicaFILIAL.AsInteger,DMCobEletronica.cdsCobEletronica_NotaNUMNOTA.AsInteger,
                              DMCobEletronica.cdsCobEletronica_NotaParcela.AsInteger,DMCobEletronica.cdsCobEletronica_NotaNUMCRECEBER.AsInteger,DMCobEletronica.cdsCobEletronica_NotaSERIE.AsString) then
      prc_Ajustar_CReceber;

    DMCobEletronica.cdsCobEletronica_Nota.Delete;
  end;

  DMCobEletronica.cdsCobEletronica.Delete;
  DMCobEletronica.cdsCobEletronica.ApplyUpdates(0);
end;

function TfCobEletronicaC.fnc_Posiciona_CReceber(Filial, NumNota, Parcela, NumCReceber: Integer;
  Serie: String): Boolean;
begin
  Result := False;
  if DM1.tFilialCodigo.AsInteger <> Filial then
    if not DM1.tFilial.FindKey([Filial]) then
      exit;

  if not DM1.tCReceber.Locate('Filial;NumNota;Serie;NumCReceber',VarArrayOf([Filial,NumNota,Serie,NumCReceber]),[locaseinsensitive]) then
    exit;

  if not DM1.tCReceberParc.Locate('ParcCReceber',Parcela,[loCaseInsensitive]) then
    exit;
  Result := True;
end;

procedure TfCobEletronicaC.prc_Ajustar_CReceber;
begin
  if DM1.tCReceberParcIDCobEletronica.AsInteger = DMCobEletronica.cdsCobEletronicaID.AsInteger then
  begin
    DM1.tCReceberParc.Edit;
    DM1.tCReceberParcCodBancoBoleto.AsInteger  := 0;
    DM1.tCReceberParcCodTipoCobranca.AsInteger := 0;
    DM1.tCReceberParcIDCobEletronica.AsInteger := 0;
    DM1.tCReceberParcNumCarteira.AsString      := '';
    DM1.tCReceberParcAceite.AsString           := '';
    DM1.tCReceberParcEspecieDoc.AsString       := '';
    if Trim(DM1.tCReceberParcNumTitBanco.AsString) = '' then
      DM1.tCReceberParcArqGerado.AsBoolean     := False;
    DM1.tCReceberParc.Post;
  end;
end;

procedure TfCobEletronicaC.BitBtn1Click(Sender: TObject);
var
  vNumAux: Integer;
begin
  vNumAux := ProximaSequencia('COBELETRONICA',0);

  DMCobEletronica.cdsCobEletronica.Insert;
  
  DMCobEletronica.cdsCobEletronicaID.AsInteger         := vNumAux;
  DMCobEletronica.cdsCobEletronicaUSUARIO.AsString     := DM1.tUsuarioUsuario.AsString;
  DMCobEletronica.cdsCobEletronicaDTGERACAO.AsDateTime := Date;
  DMCobEletronica.cdsCobEletronicaHORA.AsDateTime      := Now;
  DMCobEletronica.cdsCobEletronicaVLRTITULOS.AsFloat   := 0;
  DMCobEletronica.cdsCobEletronicaQTDTITULOS.AsFloat   := 0;

  fCobEletronica := TfCobEletronica.Create(Self);
  fCobEletronica.ShowModal;
end;

procedure TfCobEletronicaC.FormShow(Sender: TObject);
var
  vData: TDateTime;
begin
  if not Assigned(DMCobEletronica) then
    DMCobEletronica := TDMCobEletronica.Create(Self);
  if not Assigned(DMBanco) then
    DMBanco := TDMBanco.Create(Self);
  if not Assigned(DMBanco_CNAB) then
    DMBanco_CNAB := TDMBanco_CNAB.Create(Self);
  if not Assigned(DMCarteira) then
    DMCarteira := TDMCarteira.Create(Self);
  DM1.tFilial.Open;
  DM1.tFilial.IndexFieldNames := 'Codigo';

  DM1.tContas.Open;
  DM1.tContasParametros.Open;
  DM1.tCliente.Open;
  DM1.tCReceber.Open;
  DM1.tCReceberParc.Open;
  DM1.tCReceberParcHist.Open;
  DM1.tCReceberParcRem.Open;
  DM1.tTipoCobranca.Open;
  DM1.tContas.Open;
  DM1.tExtComissao.Open;
  DMBanco.tBcoBrasil.Open;
  DMBanco.tBcoItau.Open;
  DMBanco.tBcoCaixa.Open;
  DM1.tMovimentos.Open;
  DM1.tNotaFiscal.Open;

  vData := EncodeDate(YearOf(Date),MonthOf(Date),01);
  DateEdit1.Date := vData;
  DateEdit2.Date := Date;
  Monta_sqlCobEletronica;
end;

procedure TfCobEletronicaC.SMDBGrid1DblClick(Sender: TObject);
begin
  if DMCobEletronica.cdsCobEletronica.IsEmpty then
    exit;
  DMCobEletronica.cdsCobEletronica.Edit;
  fCobEletronica := TfCobEletronica.Create(Self);
  fCobEletronica.ShowModal;
end;

procedure TfCobEletronicaC.BitBtn4Click(Sender: TObject);
var
  vCNAB: String;
begin
  vCNAB := '';
  if RxDBLookupCombo1.Text = '' then
  begin
    ShowMessage('Banco não foi informado!');
    exit;
  end;
  if DM1.tContas.Locate('CodConta',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]) then
    vCNAB := DM1.tContasCNAB.AsString;
  if vCNAB = 'ITAU400' then
  begin
    fArqRetornoItau := TfArqRetornoItau.Create(Self);
    fArqRetornoItau.ShowModal;
  end
  else
  if (DM1.tContasCNAB.AsString = 'SANTANDER240') then
  begin
    fCobRetorno := TfCobRetorno.Create(Self);
    fCobRetorno.vID_BancoLoc := RxDBLookupCombo1.KeyValue;
    fCobRetorno.ShowModal;
  end
  else
  begin
    fArqRetornoBrasil := TfArqRetornoBrasil.Create(Self);
    fArqRetornoBrasil.ShowModal;
  end;
end;

procedure TfCobEletronicaC.SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F3) and not(DMCobEletronica.cdsCobEletronica.IsEmpty) and (DMCobEletronica.cdsCobEletronicaNOMEARQUIVO.AsString <> '') then
    AbreArquivo(DMCobEletronica.cdsCobEletronicaNOMEARQUIVO.AsString);
end;

procedure TfCobEletronicaC.BitBtn6Click(Sender: TObject);
begin
  if not DMCobEletronica.cdsCobEletronica.Active then
    Exit;
  if DMCobEletronica.cdsCobEletronicaCODBANCO.AsInteger < 1 then
    Exit;
  DM1.tContas.IndexFieldNames := 'CodConta';
  DM1.tContas.FindKey([DMCobEletronica.cdsCobEletronicaCODBANCO.AsInteger]);

  fRelCobEletronica := TfRelCobEletronica.Create(Self);
  fRelCobEletronica.vNomeBanco := DM1.tContasNomeConta.AsString;
  fRelCobEletronica.RLReport1.Preview;
  fRelCobEletronica.RLReport1.Free;
end;

end.
