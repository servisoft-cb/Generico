unit UNotaFiscalConfirma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, DbTables, DB;

type
  TfNotaFiscalConfirma = class(TForm)
    btNormal: TBitBtn;
    btAtualiza: TBitBtn;
    btContingencia: TBitBtn;
    GroupBox1: TGroupBox;
    btFS: TBitBtn;
    btScan: TBitBtn;
    btCancelar: TBitBtn;
    btFSDA: TBitBtn;
    procedure btNormalClick(Sender: TObject);
    procedure btFSClick(Sender: TObject);
    procedure btScanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btAtualizaClick(Sender: TObject);
    procedure btContingenciaClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btFSDAClick(Sender: TObject);
  private
    { Private declarations }
    procedure Grava_NumNota(Serie, Tipo: String);
  public
    vOk: Boolean;
    { Public declarations }
  end;

var
  fNotaFiscalConfirma: TfNotaFiscalConfirma;

implementation

uses UEmissaoNotaFiscal, UDM1, UDM2, uNFeComandos, UNFeDados, uNFe,
  UDMNotaFiscal;

{$R *.dfm}

procedure TfNotaFiscalConfirma.Grava_NumNota(Serie, Tipo: String);
var
  vNumAux: Integer;
  vflag: Boolean;
  vNumSeq: Integer;
  vNumAux2: Integer;
begin
  if DM1.tNotaFiscalNumNota.AsInteger > 0 then
    exit;

  DM2.qProximaNota.Close;
  DM2.qProximaNota.Params[0].AsInteger := DM1.tNotaFiscalFilial.AsInteger;
  DM2.qProximaNota.Params[1].AsString  := Trim(Serie);
  DM2.qProximaNota.Open;
  vNumAux := DM2.qProximaNotaNumNota.AsInteger;

  DM2.qProximaNota.Close;
  vOk := True;
  if vNumAux2 > 1 then
  begin
    vNumAux2 := vNumAux - 1;
    if not DMNotaFiscal.tNotaFiscalIns.Locate('Filial;NumNota;Serie',VarArrayOf([DM1.tNotaFiscalFilial.AsInteger,vNumAux2,Serie]),[locaseinsensitive]) then
    begin
      vOK := False;
      exit;
    end;
  end;

  DMNotaFiscal.tNotaFiscalIns.Close;
  DMNotaFiscal.tNotaFiscalIns.Open;
  DMNotaFiscal.tNotaFiscalIns.Refresh;
  DMNotaFiscal.tNotaFiscalIns.Last;
  vflag := False;
  while vflag = False do
  begin
    
    vNumAux := vNumAux + 1;
    if not DMNotaFiscal.tNotaFiscalIns.Locate('Filial;NumNota;Serie',VarArrayOf([DM1.tNotaFiscalFilial.AsInteger,vNumAux,Serie]),[locaseinsensitive]) then
    begin
      if vNumAux > 1 then
      begin
        vNumAux2 := vNumAux - 1;
        if not DMNotaFiscal.tNotaFiscalIns.Locate('Filial;NumNota;Serie',VarArrayOf([DM1.tNotaFiscalFilial.AsInteger,vNumAux2,Serie]),[locaseinsensitive]) then
        begin
          vOK   := False;
          vFlag := True;
        end;
      end;

      if vOK then
      begin
        vNumSeq := Dm1.tNotaFiscalNumSeq.AsInteger;
        DM1.tNotaFiscalNumNota.AsInteger    := vNumAux;
        DM1.tNotaFiscalSerie.AsString       := Serie;
        //NFe 2.00
        DM1.tNotaFiscalTipoEnvioNF.AsString        := Tipo;
        DM1.tNotaFiscalVersaoNFe.AsString          := DM1.tParametrosVersaoNFe.AsString;
        DM1.tNotaFiscalIdentVersaoEmissao.AsString := DM1.tParametrosVersaoEmissaoNFe.AsString;

        DM1.tNotaFiscal.Post;
        DM1.tNotaFiscal.Refresh;
        DMNotaFiscal.tNotaFiscalIns.Refresh;

        DM1.tNotaFiscal.Locate('Filial;NumSeq',VarArrayOf([DM1.tFilialCodigo.AsInteger,vNumSeq]),[locaseinsensitive]);
        DM1.tNotaFiscal.Edit;
        if DMNotaFiscal.tNotaFiscalIns.Locate('Filial;NumNota;Serie',VarArrayOf([DM1.tNotaFiscalFilial.AsInteger,vNumAux,Serie]),[locaseinsensitive]) then
        begin
          if DMNotaFiscal.tNotaFiscalInsNumSeq.AsInteger = DM1.tNotaFiscalNumSeq.AsInteger then
          begin
            if DM1.tNotaFiscal.State in [dsBrowse] then
              DM1.tNotaFiscal.Edit;
            vflag := True;
          end;
        end;
      end;

    end;
  end;
end;

procedure TfNotaFiscalConfirma.btNormalClick(Sender: TObject);
begin
  Grava_NumNota(DM1.tParametrosSerieNormal.AsString,'1-NORMAL') ;
  if not vOk  then
    fEmissaoNotaFiscal.Tag := 2;
  Close;
end;

procedure TfNotaFiscalConfirma.btFSClick(Sender: TObject);
begin
  Grava_NumNota(DM1.tParametrosSerieNormal.AsString,'2-CONTINGENCIA FS') ;
  if not vOk  then
    fEmissaoNotaFiscal.Tag := 2;
  Close;
end;

procedure TfNotaFiscalConfirma.btScanClick(Sender: TObject);
begin
  Grava_NumNota(DM1.tParametrosSerieContingencia.AsString,'3-CONTINGENCIA SCAN') ;
  if not vOk  then
    fEmissaoNotaFiscal.Tag := 2;
  Close;
end;

procedure TfNotaFiscalConfirma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfNotaFiscalConfirma.FormShow(Sender: TObject);
begin
  fEmissaoNotaFiscal.Tag := 0;
  btAtualizaClick(Sender);
  if btNormal.Enabled then
    btNormal.SetFocus
  else
    btContingencia.SetFocus;
end;

procedure TfNotaFiscalConfirma.btAtualizaClick(Sender: TObject);
var
  texto: String;
begin
  DM1.tParametros.Close;
  DM1.tParametros.Open;
  DM1.tParametros.Refresh;
  btAtualiza.Enabled := DM1.tParametrosControlaNFe.AsBoolean;
  //btScan.Enabled     := False;
  //btFS.Enabled       := False;
  if DM1.tParametrosControlaNFe.AsBoolean then
    begin
      texto := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
      //Foi tirado dia 18/03/2010 para deixar confirmar a nota mesmo que não tenha internet
      {btNormal.Enabled := VerificaStatusNFe(
                                            //no lugar do localhost incluir o ip da máquina onde vai ficar o nfeconfig
                                            // 'localhost',
                                            DM1.tParametrosLocalServidorNFe.AsString,
                                            //edCNPJ.Text,
                                            texto,False);}
      {if not btNormal.Enabled then
        btScan.Enabled := VerificaStatusNFe(
                                            //no lugar do localhost incluir o ip da máquina onde vai ficar o nfeconfig
                                            //'localhost',
                                            DM1.tParametrosLocalServidorNFe.AsString,
                                            //edCNPJ.Text,
                                            texto,True) and not(btNormal.Enabled);


      btFS.Enabled := not(btNormal.Enabled);}

      {btFS.Enabled := not(ConectadoInternet(
                                            //no lugar do localhost incluir o ip da máquina onde vai ficar o nfeconfig
                                            //'localhost',
                                            DM1.tParametrosLocalServidorNFe.AsString,
                                            //edCNPJ.Text,
                                            texto));}
    end;


end;

procedure TfNotaFiscalConfirma.btContingenciaClick(Sender: TObject);
var
  texto: String;
begin
  DM1.tParametros.Close;
  DM1.tParametros.Open;
  DM1.tParametros.Refresh;
  if DM1.tParametrosControlaNFe.AsBoolean then
    begin
      texto := Monta_Texto(DM1.tFilialCNPJ.AsString,14);

      try
        btScan.Enabled := VerificaStatusNFe(
                                            //no lugar do localhost incluir o ip da máquina onde vai ficar o nfeconfig
                                             //'localhost',
                                             DM1.tParametrosLocalServidorNFe.AsString,
                                             //edCNPJ.Text,
                                             texto,True);
      except
        ShowMessage('Modo Scan não ativado ou internet com problema!');
      end;

      btFS.Enabled   := True;
      btFSDA.Enabled := True;

      {btFS.Enabled := not(ConectadoInternet(
                                            //no lugar do localhost incluir o ip da máquina onde vai ficar o nfeconfig
                                            //'localhost',
                                            DM1.tParametrosLocalServidorNFe.AsString,
                                            //edCNPJ.Text,
                                            texto));}
    end;

end;

procedure TfNotaFiscalConfirma.btCancelarClick(Sender: TObject);
begin
  fEmissaoNotaFiscal.Tag := 2;
  Close;
end;

procedure TfNotaFiscalConfirma.btFSDAClick(Sender: TObject);
begin
  //NFe 2.0
  Grava_NumNota(DM1.tParametrosSerieNormal.AsString,'5-CONTINGENCIA FS-DA') ;
  if not vOk  then
    fEmissaoNotaFiscal.Tag := 2;
  Close;
end;

end.

