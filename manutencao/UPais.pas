unit UPais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, DBTables,
  Db, RxLookup;

type
  TfPais = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    tPaisIns: TTable;
    RxDBLookupCombo1: TRxDBLookupCombo;
    qPais: TQuery;
    dsqPais: TDataSource;
    qPaisID: TIntegerField;
    qPaisPais: TStringField;
    tPaisInsID: TIntegerField;
    tPaisInsPais: TStringField;
    tPaisInsCodPais: TStringField;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    BitBtn7: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit1Exit(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
  private
    vSQLPais : String;
    procedure Habilita;
    procedure Monta_SQLPais(Campo : String);
    procedure Le_TabPais;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPais: TfPais;
  vExcluir : Boolean;

implementation

uses UDM1, UDM2, StrUtils;

{$R *.DFM}

procedure TfPais.Monta_SQLPais(Campo : String);
begin
  qPais.Close;
  qPais.SQL.Clear;
  qPais.SQL.Add(vSQLPais);
  qPais.SQL.Add('ORDER BY ' + Campo);
  qPais.Open;
end;

procedure TfPais.Habilita;
begin
  Panel2.Enabled       := not(Panel2.Enabled);
  Panel4.Enabled       := not(Panel4.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
end;

procedure TfPais.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfPais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    DM1.tPais.Close;
  qPais.Close;
  Action := Cafree;
end;

procedure TfPais.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsUf.AsBoolean then
    begin
      tPaisIns.IndexFieldNames  := 'ID';
      DM1.tPais.IndexFieldNames := 'ID';
      tPaisIns.Refresh;
      tPaisIns.Last;
      DM1.tPais.Refresh;
      DM1.tPais.Insert;
      DM1.tPaisID.AsInteger := tPaisInsID.AsInteger + 1;
      DM1.tPais.Post;
      DM1.tPais.Edit;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfPais.BitBtn5Click(Sender: TObject);
begin
  if DM1.tPaisPais.AsString = '' then
    ShowMessage('É Obrigatório informar o nome!')
  else
    begin
      DM1.tPais.Post;
      BitBtn2.Tag := 0;
      Habilita;
    end;
  BitBtn1.SetFocus;
end;

procedure TfPais.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    DM1.tPais.Delete
  else
  if BitBtn2.Tag = 1 then
    DM1.tPais.Cancel;
  Habilita;
end;

procedure TfPais.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltUF.AsBoolean then
    begin
      DM1.tPais.Edit;
      BitBtn2.Tag := 1;
      Habilita;
      DBEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfPais.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcUF.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        DM1.tPais.Delete;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfPais.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tPais.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o registro antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfPais.DBEdit1Exit(Sender: TObject);
begin
  if DBEdit1.Text <> '' then
    begin
      if tPaisIns.Locate('Pais',DM1.tPaisPais.AsString,[loCaseInsensitive]) then
        begin
          if tPaisInsID.AsInteger <> DM1.tPaisID.AsInteger then
            begin
              ShowMessage('Nome já cadastrado!');
              DM1.tPaisPais.Clear;
              DBEdit1.SetFocus;
            end;
        end;
    end;
end;

procedure TfPais.RxDBLookupCombo1Enter(Sender: TObject);
begin
  Monta_SQLPais(RxDBLookupCombo1.LookupDisplay);
end;

procedure TfPais.RxDBLookupCombo1Change(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    DM1.tPais.Locate('ID',qPaisID.AsInteger,[loCaseInsensitive]);
end;

procedure TfPais.FormShow(Sender: TObject);
begin
  DM1.tPais.Open;
  vSQLPais := qPais.SQL.Text;
end;

procedure TfPais.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Shift = [ssCtrl]) and (Key = 87)) and (DM1.tPais.State in [dsBrowse]) then
    BitBtn7.Visible := not(BitBtn7.Visible);
end;

procedure TfPais.Le_TabPais;
var
  vPaisAux : array[1..246] of String;
  vNome, vCodPais : String;
  i : Integer;
  vGravar : Boolean;
  vID : Integer;
begin
  vPaisAux[1] := '0175 ALBANIA, REPUBLICA DA';
  vPaisAux[2] := '0230 ALEMANHA';
  vPaisAux[3] := '0310 BURKINA FASO';
  vPaisAux[4] := '0370 ANDORRA';
  vPaisAux[5] := '0400 ANGOLA';
  vPaisAux[6] := '0418 ANGUILLA';
  vPaisAux[7] := '0434 ANTIGUA E BARBUDA';
  vPaisAux[8] := '0477 ANTILHAS HOLANDESAS';
  vPaisAux[9] := '0531 ARABIA SAUDITA';
  vPaisAux[10] := '0590 ARGELIA';
  vPaisAux[11] := '0639 ARGENTINA';
  vPaisAux[12] := '0647 ARMENIA, REPUBLICA DA';
  vPaisAux[13] := '0655 ARUBA';
  vPaisAux[14] := '0698 AUSTRALIA';
  vPaisAux[15] := '0728 AUSTRIA';
  vPaisAux[16] := '0736 AZERBAIJAO, REPUBLICA DO';
  vPaisAux[17] := '0779 BAHAMAS, ILHAS';
  vPaisAux[18] := '0809 BAHREIN, ILHAS';
  vPaisAux[19] := '0817 BANGLADESH';
  vPaisAux[20] := '0833 BARBADOS';
  vPaisAux[21] := '0850 BELARUS, REPUBLICA DA';
  vPaisAux[22] := '0876 BELGICA';
  vPaisAux[23] := '0884 BELIZE';
  vPaisAux[24] := '0906 BERMUDAS';
  vPaisAux[25] := '0930 MIANMAR (BIRMANIA)';
  vPaisAux[26] := '0973 BOLIVIA';
  vPaisAux[27] := '0981 BOSNIA-HERZEGOVINA (REPUBLICA DA)';
  vPaisAux[28] := '1015 BOTSUANA';
  vPaisAux[29] := '1058 BRASIL';
  vPaisAux[30] := '1082 BRUNEI';
  vPaisAux[31] := '1112 BULGARIA, REPUBLICA DA';
  vPaisAux[32] := '1155 BURUNDI';
  vPaisAux[33] := '1198 BUTAO';
  vPaisAux[34] := '1279 CABO VERDE, REPUBLICA DE';
  vPaisAux[35] := '1376 CAYMAN, ILHAS';
  vPaisAux[36] := '1414 CAMBOJA';
  vPaisAux[37] := '1457 CAMAROES';
  vPaisAux[38] := '1490 CANADA';
  vPaisAux[39] := '1504 GUERNSEY, ILHA DO CANAL (INCLUI ALDERNEY E SARK)';
  vPaisAux[40] := '1508 JERSEY, ILHA DO CANAL';
  vPaisAux[41] := '1511 CANARIAS, ILHAS';
  vPaisAux[42] := '1538 CAZAQUISTAO, REPUBLICA DO';
  vPaisAux[43] := '1546 CATAR';
  vPaisAux[44] := '1589 CHILE';
  vPaisAux[45] := '1600 CHINA, REPUBLICA POPULAR';
  vPaisAux[46] := '1619 FORMOSA (TAIWAN)';
  vPaisAux[47] := '1635 CHIPRE';
  vPaisAux[48] := '1651 COCOS(KEELING),ILHAS';
  vPaisAux[49] := '1694 COLOMBIA';
  vPaisAux[50] := '1732 COMORES, ILHAS';
  vPaisAux[51] := '1775 CONGO';
  vPaisAux[52] := '1830 COOK, ILHAS';
  vPaisAux[53] := '1872 COREIA, REP.POP.DEMOCRATICA';
  vPaisAux[54] := '1902 COREIA, REPUBLICA DA';
  vPaisAux[55] := '1937 COSTA DO MARFIM';
  vPaisAux[56] := '1953 CROACIA (REPUBLICA DA)';
  vPaisAux[57] := '1961 COSTA RICA';
  vPaisAux[58] := '1988 COVEITE';
  vPaisAux[59] := '1996 CUBA';
  vPaisAux[60] := '2291 BENIN';
  vPaisAux[61] := '2321 DINAMARCA';
  vPaisAux[62] := '2356 DOMINICA,ILHA';
  vPaisAux[63] := '2399 EQUADOR';
  vPaisAux[64] := '2402 EGITO';
  vPaisAux[65] := '2437 ERITREIA';
  vPaisAux[66] := '2445 EMIRADOS ARABES UNIDOS';
  vPaisAux[67] := '2453 ESPANHA';
  vPaisAux[68] := '2461 ESLOVENIA, REPUBLICA DA';
  vPaisAux[69] := '2470 ESLOVACA, REPUBLICA';
  vPaisAux[70] := '2496 ESTADOS UNIDOS';
  vPaisAux[71] := '2518 ESTONIA, REPUBLICA DA';
  vPaisAux[72] := '2534 ETIOPIA';
  vPaisAux[73] := '2550 FALKLAND (ILHAS MALVINAS)';
  vPaisAux[74] := '2593 FEROE, ILHAS';
  vPaisAux[75] := '2674 FILIPINAS';
  vPaisAux[76] := '2712 FINLANDIA';
  vPaisAux[77] := '2755 FRANCA';
  vPaisAux[78] := '2810 GABAO';
  vPaisAux[79] := '2852 GAMBIA';
  vPaisAux[80] := '2895 GANA';
  vPaisAux[81] := '2917 GEORGIA, REPUBLICA DA';
  vPaisAux[82] := '2933 GIBRALTAR';
  vPaisAux[83] := '2976 GRANADA';
  vPaisAux[84] := '3018 GRECIA';
  vPaisAux[85] := '3050 GROENLANDIA';
  vPaisAux[86] := '3093 GUADALUPE';
  vPaisAux[87] := '3131 GUAM';
  vPaisAux[88] := '3174 GUATEMALA';
  vPaisAux[89] := '3255 GUIANA FRANCESA';
  vPaisAux[90] := '3298 GUINE';
  vPaisAux[91] := '3310 GUINE-EQUATORIAL';
  vPaisAux[92] := '3344 GUINE-BISSAU';
  vPaisAux[93] := '3379 GUIANA';
  vPaisAux[94] := '3417 HAITI';
  vPaisAux[95] := '3450 HONDURAS';
  vPaisAux[96] := '3514 HONG KONG';
  vPaisAux[97] := '3557 HUNGRIA, REPUBLICA DA';
  vPaisAux[98] := '3573 IEMEN';
  vPaisAux[99] := '3595 MAN, ILHA DE';
  vPaisAux[100] := '3611 INDIA';
  vPaisAux[101] := '3654 INDONESIA';
  vPaisAux[102] := '3697 IRAQUE';
  vPaisAux[103] := '3727 IRA, REPUBLICA ISLAMICA DO';
  vPaisAux[104] := '3751 IRLANDA';
  vPaisAux[105] := '3794 ISLANDIA';
  vPaisAux[106] := '3832 ISRAEL';
  vPaisAux[107] := '3867 ITALIA';
  vPaisAux[108] := '3913 JAMAICA';
  vPaisAux[109] := '3964 JOHNSTON, ILHAS';
  vPaisAux[110] := '3999 JAPAO';
  vPaisAux[111] := '4030 JORDANIA';
  vPaisAux[112] := '4111 KIRIBATI';
  vPaisAux[113] := '4200 LAOS, REP.POP.DEMOCR.DO';
  vPaisAux[114] := '4235 LEBUAN, ILHAS';
  vPaisAux[115] := '4260 LESOTO';
  vPaisAux[116] := '4278 LETONIA, REPUBLICA DA';
  vPaisAux[117] := '4316 LIBANO';
  vPaisAux[118] := '4340 LIBERIA';
  vPaisAux[119] := '4383 LIBIA';
  vPaisAux[120] := '4405 LIECHTENSTEIN';
  vPaisAux[121] := '4421 LITUANIA, REPUBLICA DA';
  vPaisAux[122] := '4456 LUXEMBURGO';
  vPaisAux[123] := '4472 MACAU';
  vPaisAux[124] := '4499 MACEDONIA, ANT.REP.IUGOSLAVA';
  vPaisAux[125] := '4502 MADAGASCAR';
  vPaisAux[126] := '4525 MADEIRA, ILHA DA';
  vPaisAux[127] := '4553 MALASIA';
  vPaisAux[128] := '4588 MALAVI';
  vPaisAux[129] := '4618 MALDIVAS';
  vPaisAux[130] := '4642 MALI';
  vPaisAux[131] := '4677 MALTA';
  vPaisAux[132] := '4723 MARIANAS DO NORTE';
  vPaisAux[133] := '4740 MARROCOS';
  vPaisAux[134] := '4766 MARSHALL,ILHAS';
  vPaisAux[135] := '4774 MARTINICA';
  vPaisAux[136] := '4855 MAURICIO';
  vPaisAux[137] := '4880 MAURITANIA';
  vPaisAux[138] := '4885 MAYOTTE (ILHAS FRANCESAS)';
  vPaisAux[139] := '4901 MIDWAY, ILHAS';
  vPaisAux[140] := '4936 MEXICO';
  vPaisAux[141] := '4944 MOLDAVIA, REPUBLICA DA';
  vPaisAux[142] := '4952 MONACO';
  vPaisAux[143] := '4979 MONGOLIA';
  vPaisAux[144] := '4985 MONTENEGRO';
  vPaisAux[145] := '4995 MICRONESIA';
  vPaisAux[146] := '5010 MONTSERRAT,ILHAS';
  vPaisAux[147] := '5053 MOCAMBIQUE';
  vPaisAux[148] := '5070 NAMIBIA';
  vPaisAux[149] := '5088 NAURU';
  vPaisAux[150] := '5118 CHRISTMAS,ILHA (NAVIDAD)';
  vPaisAux[151] := '5177 NEPAL';
  vPaisAux[152] := '5215 NICARAGUA';
  vPaisAux[153] := '5258 NIGER';
  vPaisAux[154] := '5282 NIGERIA';
  vPaisAux[155] := '5312 NIUE,ILHA';
  vPaisAux[156] := '5355 NORFOLK,ILHA';
  vPaisAux[157] := '5380 NORUEGA';
  vPaisAux[158] := '5428 NOVA CALEDONIA';
  vPaisAux[159] := '5452 PAPUA NOVA GUINE';
  vPaisAux[160] := '5487 NOVA ZELANDIA';
  vPaisAux[161]:= '5517 VANUATU';
  vPaisAux[162] := '5568 OMA';
  vPaisAux[163] := '5665 PACIFICO,ILHAS DO (POSSESSAO DOS EUA)';
  vPaisAux[164] := '5738 PAISES BAIXOS (HOLANDA)';
  vPaisAux[165] := '5754 PALAU';
  vPaisAux[166] := '5762 PAQUISTAO';
  vPaisAux[167] := '5800 PANAMA';
  vPaisAux[168] := '5860 PARAGUAI';
  vPaisAux[169] := '5894 PERU';
  vPaisAux[170] := '5932 PITCAIRN,ILHA';
  vPaisAux[171] := '5991 POLINESIA FRANCESA';
  vPaisAux[172] := '6033 POLONIA, REPUBLICA DA';
  vPaisAux[173] := '6076 PORTUGAL';
  vPaisAux[174] := '6114 PORTO RICO';
  vPaisAux[175] := '6238 QUENIA';
  vPaisAux[176] := '6254 QUIRGUIZ, REPUBLICA';
  vPaisAux[177] := '6289 REINO UNIDO';
  vPaisAux[178] := '6408 REPUBLICA CENTRO-AFRICANA';
  vPaisAux[179] := '6475 REPUBLICA DOMINICANA';
  vPaisAux[180] := '6602 REUNIAO, ILHA';
  vPaisAux[181] := '6653 ZIMBABUE';
  vPaisAux[182] := '6700 ROMENIA';
  vPaisAux[183] := '6750 RUANDA';
  vPaisAux[184] := '6769 RUSSIA, FEDERACAO DA';
  vPaisAux[185] := '6777 SALOMAO, ILHAS';
  vPaisAux[186] := '6781 SAINT KITTS E NEVIS';
  vPaisAux[187] := '6858 SAARA OCIDENTAL';
  vPaisAux[188] := '6874 EL SALVADOR';
  vPaisAux[189] := '6904 SAMOA';
  vPaisAux[190] := '6912 SAMOA AMERICANA';
  vPaisAux[191] := '6955 SAO CRISTOVAO E NEVES,ILHAS';
  vPaisAux[192] := '6971 SAN MARINO';
  vPaisAux[193] := '7005 SAO PEDRO E MIQUELON';
  vPaisAux[194] := '7056 SAO VICENTE E GRANADINAS';
  vPaisAux[195] := '7102 SANTA HELENA';
  vPaisAux[196] := '7153 SANTA LUCIA';
  vPaisAux[197] := '7200 SAO TOME E PRINCIPE, ILHAS';
  vPaisAux[198] := '7285 SENEGAL';
  vPaisAux[199] := '7315 SEYCHELLES';
  vPaisAux[200] := '7358 SERRA LEOA';
  vPaisAux[201] := '7370 SERVIA';
  vPaisAux[202] := '7412 CINGAPURA';
  vPaisAux[203] := '7447 SIRIA, REPUBLICA ARABE DA';
  vPaisAux[204] := '7480 SOMALIA';
  vPaisAux[205] := '7501 SRI LANKA';
  vPaisAux[206] := '7544 SUAZILANDIA';
  vPaisAux[207] := '7560 AFRICA DO SUL';
  vPaisAux[208] := '7595 SUDAO';
  vPaisAux[209] := '7641 SUECIA';
  vPaisAux[210] := '7676 SUICA';
  vPaisAux[211] := '7706 SURINAME';
  vPaisAux[212] := '7722 TADJIQUISTAO, REPUBLICA DO';
  vPaisAux[213] := '7765 TAILANDIA';
  vPaisAux[214] := '7803 TANZANIA, REP.UNIDA DA';
  vPaisAux[215] := '7820 TERRITORIO BRIT.OC.INDICO';
  vPaisAux[216] := '7838 DJIBUTI';
  vPaisAux[217] := '7889 CHADE';
  vPaisAux[218] := '7919 TCHECA, REPUBLICA';
  vPaisAux[219] := '7951 TIMOR LESTE';
  vPaisAux[220] := '8001 TOGO';
  vPaisAux[221] := '8052 TOQUELAU,ILHAS';
  vPaisAux[222] := '8109 TONGA';
  vPaisAux[223] := '8150 TRINIDAD E TOBAGO';
  vPaisAux[224] := '8206 TUNISIA';
  vPaisAux[225] := '8230 TURCAS E CAICOS,ILHAS';
  vPaisAux[226] := '8249 TURCOMENISTAO, REPUBLICA DO';
  vPaisAux[227] := '8273 TURQUIA';
  vPaisAux[228] := '8281 TUVALU';
  vPaisAux[229] := '8311 UCRANIA';
  vPaisAux[230] := '8338 UGANDA';
  vPaisAux[231] := '8451 URUGUAI';
  vPaisAux[232] := '8478 UZBEQUISTAO, REPUBLICA DO';
  vPaisAux[233] := '8486 VATICANO, EST.DA CIDADE DO';
  vPaisAux[234] := '8508 VENEZUELA';
  vPaisAux[235] := '8583 VIETNA';
  vPaisAux[236] := '8630 VIRGENS,ILHAS (BRITANICAS)';
  vPaisAux[237] := '8664 VIRGENS,ILHAS (E.U.A.)';
  vPaisAux[238] := '8702 FIJI';
  vPaisAux[239] := '8737 WAKE, ILHA';
  vPaisAux[240] := '8885 CONGO, REPUBLICA DEMOCRATICA DO';
  vPaisAux[241] := '8907 ZAMBIA';
  vPaisAux[242] := '8958 ZONA DO CANAL DO PANAMA';
  vPaisAux[243] := '9903 PROVISAO DE NAVIOS E AERONAVES';
  vPaisAux[244] := '9946 A DESIGNAR';
  vPaisAux[245] := '9950 BANCOS CENTRAIS';
  vPaisAux[246] := '9970 ORGANIZACOES INTERNACIONAIS';

  tPaisIns.IndexFieldNames  := 'ID';
  tPaisIns.Last;
  vID := tPaisInsID.AsInteger;

  i:= 0;
  for i := 1 to 246 do
  begin
    vGravar  := False;
    vCodPais := copy(vPaisAux[i],1,4);
    vNome    := copy(vPaisAux[i],6,Length(vPaisAux[i])-5);
    vNome    := copy(vNome,1,40);
    if not tPaisIns.Locate('Pais',vNome,[loCaseInsensitive]) then
    begin
      if not tPaisIns.Locate('CodPais',vCodPais,[loCaseInsensitive]) then
        vGravar := True;
    end;
    if vGravar then
    begin
      vID := vID + 1;
      DM1.tPais.Insert;
      DM1.tPaisID.AsInteger     := vID;
      DM1.tPaisPais.AsString    := vNome;
      DM1.tPaisCodPais.AsString := vCodPais;
      DM1.tPais.Post;
    end;
  end;
  ShowMessage('Final da geração');
  BitBtn7.Visible := False;
end;

procedure TfPais.BitBtn7Click(Sender: TObject);
begin
  Le_TabPais;
end;

end.
