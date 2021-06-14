unit UDaruma_iMFLerSerial_ECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TfDaruma_iMFLerSerial_ECF = class(TForm)
    RDG_TipoLeitura: TRadioGroup;
    BT_ENVIAR: TButton;
    BT_FECHAR: TButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    LBL_IntervaloInicial: TLabel;
    LBL_IntervaloFinal: TLabel;
    DTP_DataInicial: TDateTimePicker;
    DTP_DataFinal: TDateTimePicker;
    EDT_Final: TEdit;
    EDT_Inicial: TEdit;
    CBX_Tipo: TComboBox;
    procedure BT_FECHARClick(Sender: TObject);
    procedure BT_ENVIARClick(Sender: TObject);
    procedure CBX_TipoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDaruma_iMFLerSerial_ECF: TfDaruma_iMFLerSerial_ECF;

implementation

uses uImpFiscal_Daruma;

{$R *.dfm}

procedure TfDaruma_iMFLerSerial_ECF.BT_FECHARClick(
  Sender: TObject);
begin
   Close;
end;

procedure TfDaruma_iMFLerSerial_ECF.BT_ENVIARClick(
  Sender: TObject);
Var Str_ParametroInicial, Str_ParametroFinal: String;
    sTipo,sDataIni,sDataFim,sDiaIni,sMesIni,sAnoIni, sDiaFim,sMesFim,sAnoFim: String;
begin
      if Rdg_TipoLeitura.ItemIndex = 0 then
         Begin
            Int_Retorno:= regAlterarValor_Daruma('ECF\LMFCompleta','1');
         end
         else begin
            Int_Retorno:= regAlterarValor_Daruma('ECF\LMFCompleta','0');
       end;

   sTipo:= CBX_Tipo.Text;
   If (sTipo = 'CRZ') then
     begin
        Str_ParametroInicial:= EDT_Inicial.Text;
        Str_ParametroFinal:= EDT_Final.Text;
        Int_Retorno:=  iMFLerSerial_ECF_Daruma(Str_ParametroInicial,Str_ParametroFinal);
        DarumaFramework_Mostrar_Retorno(Int_Retorno);
      end
      else
      begin
        sDataIni:= DateTimeToStr(DTP_DataInicial.Date);
        sDataFim:= DateTimeToStr(DTP_DataFinal.Date);
        sDataIni:= StringReplace(sDataIni,'/','',[rfReplaceAll]);
        sDataFim:= StringReplace(sDataFim,'/','',[rfReplaceAll]);
        sDiaIni:= copy(sDataIni,1,2);
        sMesIni:= copy(sDataIni,3,2);
        sAnoIni:= copy(sDataIni,7,2);
        sDataIni:= sDiaIni + sMesIni + sAnoIni;
        sDiaFim:= copy(sDataFim,1,2);
        sMesFim:= copy(sDataFim,3,2);
        sAnoFim:= copy(sDataFim,7,2);
        sDataFim:= sDiaFim + sMesFim + sAnoFim;
        Int_Retorno:=  iMFLerSerial_ECF_Daruma(sDataIni,sDataFim);
        DarumaFramework_Mostrar_Retorno(Int_Retorno);
      end;


end;

procedure TfDaruma_iMFLerSerial_ECF.CBX_TipoClick(
  Sender: TObject);
begin
      If (CBX_Tipo.ItemIndex = 0) then
        begin
           EDT_Inicial.Visible:= true;
           EDT_Final.Visible:= true;
           EDT_Inicial.SetFocus;
           LBL_IntervaloInicial.Caption:= CBX_Tipo.Text + ' Inicial:';
           LBL_IntervaloFinal.Caption:= CBX_Tipo.Text + ' Final:';
        end
        else
        begin
           EDT_Inicial.Visible:= false;
           EDT_Final.Visible:= false;
           DTP_DataInicial.Visible:= true;
           DTP_DataFinal.Visible:= true;
           LBL_IntervaloInicial.Caption:= CBX_Tipo.Text + ' Inicial:';
           LBL_IntervaloFinal.Caption:= CBX_Tipo.Text + ' Final:';
           DTP_DataInicial.SetFocus;
        end;
end;

end.
