unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Clipbrd,
  Dialogs, StdCtrls, Menus, IniFiles, ExtCtrls, Unit2, Unit3, Math, Types, ComCtrls, Tabs, DockTabSet, ActnList;

const NORMALSIZE = 18;
  //    SMALLSIZE = 8;
      DELTA = 2;
      FSTEP = 28;
      SECSTEP = 34;
      THSTEP = 42;
      FOURSTEP = 55;

type
  Operations = (op_div, op_mod, op_and, op_multi, op_plus, op_minus, op_or, op_xor, op_Null);
  LastOperationType = (FPOper, SPOper, Null);
  TypeOfRefresh = (RefreshOnly, DoAll);
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    OutBox: TGroupBox;
    mView: TMenuItem;
    mEdit: TMenuItem;
    mAbout: TMenuItem;
    mCopy: TMenuItem;
    mPaste: TMenuItem;
    mHelp: TMenuItem;
    mAboutSoft: TMenuItem;
    gbBinCode: TGroupBox;
    bRoL: TButton;
    bOr: TButton;
    bLsh: TButton;
    bNot: TButton;
    bMod: TButton;
    bRoR: TButton;
    bXor: TButton;
    bRsh: TButton;
    bAnd: TButton;
    bHexA: TButton;
    bHexB: TButton;
    bHexC: TButton;
    bHexD: TButton;
    bHexE: TButton;
    bHexF: TButton;
    bMC: TButton;
    bBack: TButton;
    bSeven: TButton;
    bFour: TButton;
    bOne: TButton;
    bZero: TButton;
    bMR: TButton;
    bCE: TButton;
    bEight: TButton;
    bFive: TButton;
    bTwo: TButton;
    bMS: TButton;
    bC: TButton;
    bNine: TButton;
    bSix: TButton;
    bThree: TButton;
    bMPlus: TButton;
    bChangeSign: TButton;
    bDivision: TButton;
    bMulti: TButton;
    bMinus: TButton;
    bPlus: TButton;
    bMMinus: TButton;
    bResult: TButton;
    pSS: TPanel;
    pSize: TPanel;
    rHex: TRadioButton;
    rBin: TRadioButton;
    rOct: TRadioButton;
    rDec: TRadioButton;
    r8: TRadioButton;
    r1: TRadioButton;
    r4: TRadioButton;
    r2: TRadioButton;
    lpt1: TLabel;
    lpt2: TLabel;
    lpt3: TLabel;
    lpt5: TLabel;
    lpt6: TLabel;
    lpt4: TLabel;
    lMVisual: TLabel;
    mBin: TMenuItem;
    mHexOct: TMenuItem;
    gbHexOct: TGroupBox;
    stHex: TLabel;
    stOct: TLabel;
    Label0: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label31: TLabel;
    Label29: TLabel;
    Label28: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label30: TLabel;
    mBinPr: TMenuItem;
    mBinObr: TMenuItem;
    mBinDop: TMenuItem;
    StatusBar: TStatusBar;
    ch_Sign: TCheckBox;
    lHistory: TLabel;
    mSignMode: TMenuItem;
    lOctOut: TLabel;
    lHexOut: TLabel;
    lOutput: TLabel;
    mParam: TMenuItem;

    procedure BinTo_gbBinCode(i_inp: int64; bt_byte: byte);   //������� ��������� ���� � label'�
    procedure RefreshBin();                               // ���������� label'�� (��������� ����)
    procedure DeleteBin(count: byte);                     // ������� label'�� (��������� ����)
    procedure SignIsRight(size: byte);                    // �������� ����� ��� ������ �� label'�� (��������� ����)
    procedure RefreshLabel(refresh:TypeOfRefresh);        // ���������� �������� label'� ������
    procedure AfterNumberClick(num: byte);                // ��������� ������� �������� ������
    procedure LabelEnable(size: byte);                    // ������� ������ label'�� (��������� ����)
    procedure RefreshSBar();                              // ���������� ����������

    function OverflowMask(inp:int64):int64;               // �������� ������������
    function ToBin(inp: int64): int64;                    // ������� �� 10 � 2
    function NumOfBits(i_inp: int64): byte;               // ���������� �������� ��� � �����
    function FromBin(): int64;                            // �� label'�� (��������� ����) � 10
    function FromDec(n,r:int64):string;                   // �� 10�� � ����� 1..16;
    function ToDec(inp : string;ss:integer):int64;        // � 10�� �� 2,8,16��

    procedure bOneClick(Sender: TObject);                 // ������� ������ 1..
    procedure bTwoClick(Sender: TObject);                 // ..2..
    procedure bThreeClick(Sender: TObject);               // ..3..
    procedure bFourClick(Sender: TObject);                // ..4..
    procedure bFiveClick(Sender: TObject);                // ..5..
    procedure bSixClick(Sender: TObject);                 // ..6..
    procedure bSevenClick(Sender: TObject);               // ..7..
    procedure bEightClick(Sender: TObject);               // ..8..
    procedure bNineClick(Sender: TObject);                // ..9..
    procedure bZeroClick(Sender: TObject);                // ..0
    procedure FormCreate(Sender: TObject);                // ��� �������� �����
    procedure bMSClick(Sender: TObject);                  // ���������� � ������
    procedure bMRClick(Sender: TObject);                  // ����� �� ����� �� ������
    procedure bMPlusClick(Sender: TObject);               // ������� � �������
    procedure bMMinusClick(Sender: TObject);              // ������� �� ������
    procedure bMCClick(Sender: TObject);                  // ������� ������
    procedure r8Click(Sender: TObject);                   // 8 ������ ������
    procedure r1Click(Sender: TObject);                   // 1 ������ ������
    procedure r2Click(Sender: TObject);                   // 2 ������ ������
    procedure r4Click(Sender: TObject);                   // 4 ������ ������
    procedure mAboutSoftClick(Sender: TObject);           // ������� ���� "� ���������.."
    procedure mHexOctClick(Sender: TObject);              // ������������ 8/16����. ��
    procedure bChangeSignClick(Sender: TObject);          // ������� ��������� �����
    procedure mBinPrClick(Sender: TObject);               // ������ �������� ���
    procedure mBinObrClick(Sender: TObject);              // �������� �������� ���
    procedure mBinDopClick(Sender: TObject);              // �������������� �������� ���
    procedure gbBinCodeMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);                 // ������� �� "���" � ��.����
    procedure bCEClick(Sender: TObject);                  // ������� ���� ����������
    procedure ch_SignClick(Sender: TObject);              // ����� ��������/��������
    procedure bMultiClick(Sender: TObject);               // ���������
    procedure bResultClick(Sender: TObject);              // �����
    procedure bMinusClick(Sender: TObject);               // �����
    procedure bPlusClick(Sender: TObject);                // ����
    procedure bDivisionClick(Sender: TObject);            // �������
    procedure bModClick(Sender: TObject);                 // ���
    procedure bOrClick(Sender: TObject);                  // ��������� or
    procedure bXorClick(Sender: TObject);                 // ��������� xor
    procedure bAndClick(Sender: TObject);                 // ��������� and
    procedure bLshClick(Sender: TObject);                 // ����� �����
    procedure bRshClick(Sender: TObject);                 // ����� ������
    procedure bNotClick(Sender: TObject);                 // ��������� not
    procedure FormMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);                 // ��������� �����
    procedure bHexAClick(Sender: TObject);                // ������� 16�� �..
    procedure bHexBClick(Sender: TObject);                // ..B..
    procedure bHexCClick(Sender: TObject);                // ..C..
    procedure bHexDClick(Sender: TObject);                // ..D..
    procedure bHexEClick(Sender: TObject);                // ..E..
    procedure bHexFClick(Sender: TObject);                // ..F..
    procedure bBackClick(Sender: TObject);                // �������� ������ ������� ������
    procedure rDecClick(Sender: TObject);                 // 10��
    procedure rHexClick(Sender: TObject);                 // 16��
    procedure rOctClick(Sender: TObject);                 // 8��
    procedure rBinClick(Sender: TObject);                 // 2��
    procedure bCClick(Sender: TObject);                   // �������� ���������� ���������� �����
    procedure bRoRClick(Sender: TObject);                 // ����. ����� ������
    procedure bRoLClick(Sender: TObject);                 // ����. ����� �����
    procedure mCopyClick(Sender: TObject);                // (����) �����������
    procedure mPasteClick(Sender: TObject);               // (����) �������
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mHelpClick(Sender: TObject);
    procedure mParamClick(Sender: TObject);            // ������ �� ��������� � 2�� �������

    private
      { Private declarations }
    public
      { Public declarations }
  end;

var
  Form1: TForm1;                                    // ���������� �����
  IniFile:TIniFile;
  FormHeight, FormWidth : integer;                  // � �� �������
  b_SSNow : byte;                                   // ������� ����������������
  i_Input,                                          // ��������� �����
  i_Memory : int64;                                 // ����� � ������
  CanNullInput,                                     // ����� �� �������� ��������� �����
  b_MemoryUsed,                                     // ������������ �� ������
  b_CEEnabled,                                      // ����� �� �������� ���
  b_NullInp : boolean;                              // ��������� �����
  lbin : array [1 .. 4, 1 .. 16] of TLabel;         // ������ � ���.�����
  bt_SizeOfWord,                                    // ������� ������ "�����"
  bt_PrevSizeOfWord,                                // ���������� ������ "�����"
  bt_LabelOutputType : byte;                        // ���� �������������� �����
  HighOfWord, LowOfWord: int64;                     // ����. � ���. ����� � ������� �������
  PrevHighOfWord, PrevLowOfWord: int64;             // ����. � ���. ����� � ���������� �������
    // ��� ���������� ��������
  i_Result,                                         // ����� ��������� ����������
  i_LastFPResult,                                   // ��������� ������������������ ���������
  i_LastInputed : int64;                            // ��������� ��������� �����
  op_LastFPOper,                                    // ��������� �������� �������� ����������
  op_LastSPOper,                                    // ��������� �������� ������� ����������
  op_PrevOper,                                      // ���������� ��������
  op_InputedOper : Operations;                      // ��������� ��������
  b_TypeIsChangedFirst,                             // ��� ����������� ������ �����
  b_OperClicked: boolean;                           // ��� ����������� ������� ������� ��������
  b_SignWithMinus,b_SignChecked: Boolean;           // ��/��� �����
  b_FirstOper : boolean;                            // ���� ����, ��� ��� �������� - ������ �������� ���������
  b_ClearLwithMC : boolean;                         // ������� �������� ������ ��� ������� MC
  b_MCwithCE : boolean;                             // ������� ������ �� ��
implementation

{$R *.dfm}
// ******** ��������� ������� �����, ������ � ������ ******** //

procedure TForm1.FormActivate(Sender: TObject);
begin
RefreshSBar;
end;

procedure TForm1.FormClick(Sender: TObject);
begin
RefreshSBar;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  k, i, j: Integer;
begin
  b_SignChecked := false;
  if not FileExists('settings.ini') then
   begin
//     FileCreate('settings.ini');
   try
      IniFile := TIniFile.Create(extractfilepath(paramstr(0))+'settings.ini');
      IniFile.WriteBool('Tweak','ClearWithMC', false);
      IniFile.WriteBool('Tweak','ClearMWithCE', false);
    finally
      IniFile.Free;
    end;
   end
  else
  begin
    try
      IniFile := TIniFile.Create(extractfilepath(paramstr(0))+'settings.ini');
      b_ClearLwithMC := IniFile.ReadBool('Tweak','ClearWithMC', false);
      b_MCwithCE := IniFile.ReadBool('Tweak','ClearMWithCE', false);
    finally
      IniFile.Free;
    end;
  end;




  b_FirstOper := true;                              // �������� ����� ������

  FormHeight := Form1.Height;                       // ����������...
  FormWidth := Form1.Width;                         // ... ��������
  b_SSNow := 10;                                    // ��������� �� - 10
  b_SignWithMinus := true;                          // � �������������� �������


  i_Input := 0;                                     // �������� ����..
  i_Memory := 0;                                    // .. ������...
  CanNullInput := True;                             // .. ����� ����
  bt_SizeOfWord := 8;                               // ������ �� ������� ������ ����� - 8����
  bt_PrevSizeOfWord := 8;                           // ���������� ���� 8
  bt_LabelOutputType := 3;                          // � ��� ���� - �������������� ��������

  // ����� � ���������������� ���� ����������� (Label)
  k := 0;
  for i := 1 to 4 do
    for j := 1 to 16 do
    begin
      lbin[i, j] := FindComponent('Label' + IntToStr(k)) as TLabel;
      inc(k);
    end;

  gbHexOct.Visible := false;                        // ��������� ���������� GroupBox
  HighOfWord := High(int64);                        // ������������ �������� �������� �����
  LowOfWord := Low(int64);                          // ����������� �������� �������� �����
  PrevHighOfWord := High(int64);                    // ������������ �������� ����������� �������� �����
  PrevLowOfWord := Low(int64);                      // ����������� �������� ����������� �������� �����

  // ��� ���������� ��������  (������ ��������� ��������)
  i_Result := 0;
  i_LastFPResult := 0;
  i_LastInputed := 0;
  i_LastFPResult := 0;
  b_TypeIsChangedFirst := True;
  op_PrevOper := op_Null;
  b_OperClicked := false;
  op_PrevOper := op_Null;
  op_LastFPOper := op_Null;
  op_LastSPOper := op_Null;
  op_InputedOper := op_Null;
  b_TypeIsChangedFirst := True;

  RefreshSBar();                                    // ��������� ������-���
end;



procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_NUMLOCK : RefreshSBar;
end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
case Key of                                         // ������ ������������ ����. �����..
'1' : AfterNumberClick(1);                          // .. ����� �� ����������
'2' : AfterNumberClick(2);
'3' : AfterNumberClick(3);
'4' : AfterNumberClick(4);
'5' : AfterNumberClick(5);
'6' : AfterNumberClick(6);
'7' : AfterNumberClick(7);
'8' : AfterNumberClick(8);
'9' : AfterNumberClick(9);
'0' : AfterNumberClick(0);
'a','A' : AfterNumberClick(10);
'b','B' : AfterNumberClick(11);
'c','C' : AfterNumberClick(12);
'd','D' : AfterNumberClick(13);
'e','E' : AfterNumberClick(14);
'f','F' : AfterNumberClick(15);
'*' : bMultiClick(self);
'm' : bMSClick(self);
end;
end;

procedure TForm1.FormMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
RefreshSBar();
end;


procedure TForm1.gbBinCodeMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y, HitTest: Integer; var MouseActivate: TMouseActivate);
var
  i, j: Integer; // ��� ����������� �������� label'�
  s: string;
begin
  s := TLabel(Sender).Name;                     // ��� ��������������� label'�
  delete(s, 1, 5);                              // �������� �� �����
  i := ceil((StrToInt64(s) + 1) / 16);          // ������� ��� ���������....
  if i = 0 then
    i := 1;
  j := (StrToInt64(s) mod 16) + 1;              // .... � ������� ���
//   trunc(power(2,(16*(i-1)+j-1))) and ToDec(lOutput.Caption,b_SSnow) >0
  if lbin[i, j].Caption = '1' then              // ���� �� ����� 1 ..
    lbin[i, j].Caption := '0'
  else                                          // ���� �� ��� ����� 0 ..
    lbin[i, j].Caption := '1';
  // ������������ ��������� �����
  i_Input := OverflowMask(FromBin);

  RefreshLabel(RefreshOnly);                           // ������ ���������� ������
  RefreshBin();                                        // ���������� "��������� ����"
  b_CEEnabled := True;
end;

// ********************* ������� 0-9, �-F ********************* //

procedure TForm1.bOneClick(Sender: TObject);    // ��� ������ '1'
begin
  AfterNumberClick(1);        // ��������� ���������� "���" ������� �������
end;

procedure TForm1.bTwoClick(Sender: TObject);    // ��� ������ '2'
begin
  AfterNumberClick(2);
end;

procedure TForm1.bThreeClick(Sender: TObject);  // ��� ������ '3'
begin
  AfterNumberClick(3);
end;

procedure TForm1.bFourClick(Sender: TObject);   // ��� ������ '4'
begin
  AfterNumberClick(4);
end;

procedure TForm1.bFiveClick(Sender: TObject);   // ��� ������ '5'
begin
  AfterNumberClick(5);
end;

procedure TForm1.bSixClick(Sender: TObject);    // ��� ������ '6'
begin
  AfterNumberClick(6);
end;

procedure TForm1.bSevenClick(Sender: TObject);  // ��� ������ '7'
begin
  AfterNumberClick(7);
end;

procedure TForm1.bEightClick(Sender: TObject);  // ��� ������ '8'
begin
  AfterNumberClick(8);
end;

procedure TForm1.bNineClick(Sender: TObject);   // ��� ������ '9'
begin
  AfterNumberClick(9);
end;

procedure TForm1.bZeroClick(Sender: TObject);   // ��� ������ '0'
begin
  AfterNumberClick(0);
end;


procedure TForm1.bHexAClick(Sender: TObject);   // ��� ������ 'A'
begin
AfterNumberClick(10);
end;

procedure TForm1.bHexBClick(Sender: TObject);   // ��� ������ 'B'
begin
AfterNumberClick(11);
end;

procedure TForm1.bHexCClick(Sender: TObject);   // ��� ������ 'C'
begin
AfterNumberClick(12);
end;

procedure TForm1.bHexDClick(Sender: TObject);   // ��� ������ 'D'
begin
AfterNumberClick(13);
end;

procedure TForm1.bHexEClick(Sender: TObject);   // ��� ������ 'E'
begin
AfterNumberClick(14);
end;

procedure TForm1.bHexFClick(Sender: TObject);   // ��� ������ 'F'
begin
AfterNumberClick(15);
end;


// ********************* ������ � ������� ********************* //

procedure TForm1.bMCClick(Sender: TObject);      // ������� ������ ������� ������
begin
  lMVisual.Caption := '';           // ������� ������ ������������ ������� ����� � ������
  if (ToDec(lOutput.Caption,b_SSnow) = i_Memory) and b_ClearLwithMC then
  begin
    lOutput.Caption := '0';
    i_Input := 0;
    RefreshLabel(DoAll);
    RefreshBin();
  end;
  i_Memory := 0;
  b_MemoryUsed := True;
  RefreshSBar();
end;

procedure TForm1.bMMinusClick(Sender: TObject);
begin
  if ToDec(lOutput.Caption,b_SSnow) <> 0 then
  begin
    lMVisual.Caption := 'M';
    i_Memory := i_Memory - ToDec(lOutput.Caption,b_SSnow);
    RefreshLabel(DoAll);
  end;
  if i_Memory = 0 then
    lMVisual.Caption := '';
  b_MemoryUsed := True;
  RefreshSBar();
end;

procedure TForm1.bMPlusClick(Sender: TObject);
begin
  if ToDec(lOutput.Caption,b_SSnow) <> 0 then
  begin
    lMVisual.Caption := 'M';
    i_Memory := i_Memory + ToDec(lOutput.Caption,b_SSnow);
    RefreshLabel(DoAll);
  end;
  if i_Memory = 0 then
    lMVisual.Caption := '';
  b_MemoryUsed := True;
  RefreshSBar();
end;

procedure TForm1.bMRClick(Sender: TObject);
begin
  lOutput.Caption := FromDec(i_Memory,b_SSNow);
  if i_Memory <> 0 then
    lMVisual.Caption := 'M'
  else
    lMVisual.Caption := '';
  i_Input := i_Memory;
  RefreshLabel(DoAll);
  RefreshBin();
  b_MemoryUsed := True;
  RefreshSBar();
end;

procedure TForm1.bMSClick(Sender: TObject);
begin
  if ToDec(lOutput.Caption,b_SSnow) <> 0 then
  begin
    lMVisual.Caption := 'M';
    i_Memory := ToDec(lOutput.Caption,b_SSnow);
  end
  else
  begin
    i_Memory := 0;
    lMVisual.Caption := '';
  end;
  b_MemoryUsed := True;
  RefreshSBar();
end;


// ********************* ������� �������������� ������ ********************* //

procedure TForm1.bCClick(Sender: TObject);
begin
i_Input := 0;
RefreshLabel(RefreshOnly);
RefreshBin;
end;

procedure TForm1.bCEClick(Sender: TObject);
begin
  i_Input := 0;
  RefreshLabel(RefreshOnly);
  RefreshBin;
  b_CEEnabled := false;
end;

procedure TForm1.bBackClick(Sender: TObject);
begin
  i_Input := ToDec(lOutput.Caption,b_SSnow) div b_SSNow;
  RefreshLabel(RefreshOnly);
  RefreshBin;
end;


// ********************* ������� �������������� �������� ********************* //

procedure TForm1.bMinusClick(Sender: TObject);
begin
  b_OperClicked := True;
  op_InputedOper := op_minus;
  i_LastInputed := ToDec(lOutput.Caption,b_SSnow);
  i_Input := 0;
end;

procedure TForm1.bPlusClick(Sender: TObject);
begin
  b_OperClicked := True;
  op_InputedOper := op_plus;
  i_LastInputed := ToDec(lOutput.Caption,b_SSnow);
  i_Input := 0;
end;

procedure TForm1.bDivisionClick(Sender: TObject);
begin
  b_OperClicked := True;
  op_InputedOper := op_div;
  i_LastInputed := ToDec(lOutput.Caption,b_SSnow);
  i_Input := 0;
end;

procedure TForm1.bResultClick(Sender: TObject);
begin
i_LastInputed := ToDec(lOutput.Caption,b_SSnow);
if op_PrevOper <= op_multi then
  if op_LastSPOper <> op_Null then
  begin
  case op_PrevOper of            // ������� �� ���������� ��������
     op_div:
       i_LastFPResult := i_LastFPResult div i_LastInputed; // ������������ ������������� ���������
     op_mod:
       i_LastFPResult := i_LastFPResult mod i_LastInputed;
     op_and:
       i_LastFPResult := i_LastFPResult and i_LastInputed;
     op_multi:
       i_LastFPResult := i_LastFPResult * i_LastInputed;
  end;
  case op_LastSPOper of
        op_plus:
          i_Result := i_Result + i_LastFPResult ;
        op_minus:
          i_Result := i_Result - i_LastFPResult;
        op_or:
          i_Result := i_Result or i_LastFPResult;
        op_xor:
          i_Result := i_Result xor i_LastFPResult;
  end;
  end
  else
  case op_InputedOper of
      op_div:
        i_Result := i_LastFPResult div i_LastInputed; // ������������ ������������� ���������
      op_mod:
        i_Result := i_LastFPResult mod i_LastInputed;
      op_and:
        i_Result := i_LastFPResult and i_LastInputed;
      op_multi:
        i_Result := i_LastFPResult * i_LastInputed;
    end
 else
  case op_InputedOper of
      op_plus:
        i_Result := i_Result + i_LastInputed; // ������������ ������������� ���������
      op_minus:
        i_Result := i_Result - i_LastInputed;
      op_and:
        i_Result := i_Result and i_LastInputed;
      op_multi:
        i_Result := i_Result * i_LastInputed;
      op_or:
        i_Result := i_Result or i_LastInputed;
      op_xor:
        i_Result := i_Result xor i_LastInputed;
    end;
  b_FirstOper := true;
  i_Input := 0;
  i_Input := OverflowMask(i_Result);
  op_InputedOper := op_Null;
  RefreshLabel(RefreshOnly);
  RefreshBin;
  b_NullInp := True;
  b_CEEnabled := true;
  // ���������
  i_Result := 0;
  i_LastFPResult := 0;
  i_LastInputed := 0;
  i_LastFPResult := 0;
  b_TypeIsChangedFirst := True;
  op_PrevOper := op_Null;
  b_OperClicked := false;
  op_PrevOper := op_Null;
  op_LastFPOper := op_Null;
  op_LastSPOper := op_Null;
  op_InputedOper := op_Null;
  b_TypeIsChangedFirst := True;
end;

procedure TForm1.bModClick(Sender: TObject);
begin
  b_OperClicked := True;
  op_InputedOper := op_mod;
  i_LastInputed := ToDec(lOutput.Caption,b_SSnow);
  i_Input := 0;
end;

procedure TForm1.bMultiClick(Sender: TObject);
begin
  b_OperClicked := True;
  op_InputedOper := op_multi;
  i_LastInputed := ToDec(lOutput.Caption,b_SSnow);
  i_Input := 0;
end;


// ********************* ������� ���������� �������� ********************* //

procedure TForm1.bRoLClick(Sender: TObject);
var rotate : boolean; p:byte;
begin
  rotate := false;
  if b_SignWithMinus then p := 1 else p := 2;
    if (1 and (i_Input shr (bt_SizeOfWord*8-p))) = 1 then
      rotate:= true;

  i_Input := (i_Input shl 1) and ((HighOfWord shl 1) or 1);

  if rotate then
  i_Input := i_Input or 1;

// rotate := false;
 RefreshLabel(DoAll);
 RefreshBin;
end;

procedure TForm1.bRoRClick(Sender: TObject);
var rotate : boolean;
begin
 rotate := false;

 if (i_Input and 1) = 1 then
  rotate:= true;

 i_Input := i_Input shr 1;

 if rotate then
 if b_SignWithMinus then i_Input := (not HighOfWord or i_Input )
 else i_Input := ((not HighOfWord shr 1 ) or i_Input )
 else
 begin
  i_Input := i_Input and HighOfWord;
 end;

 RefreshLabel(DoAll);
 RefreshBin;
end;

procedure TForm1.bLshClick(Sender: TObject);
begin
i_Input := i_Input shl 1;
RefreshLabel(DoAll);
RefreshBin;
end;

procedure TForm1.bRshClick(Sender: TObject);
begin
i_Input := i_Input shr 1;
RefreshLabel(DoAll);
RefreshBin;
end;

procedure TForm1.bOrClick(Sender: TObject);
begin
  b_OperClicked := True;
  op_InputedOper := op_or;
  i_LastInputed := ToDec(lOutput.Caption,b_SSnow);
  i_Input := 0;
end;

procedure TForm1.bXorClick(Sender: TObject);
begin
  b_OperClicked := True;
  op_InputedOper := op_xor;
  i_LastInputed := ToDec(lOutput.Caption,b_SSnow);
  i_Input := 0;
end;

procedure TForm1.bAndClick(Sender: TObject);
begin
  b_OperClicked := True;
  op_InputedOper := op_and;
  i_LastInputed := ToDec(lOutput.Caption,b_SSnow);
  i_Input := 0;
end;

procedure TForm1.bNotClick(Sender: TObject);
begin
i_Input := not i_Input;
RefreshLabel(DoAll);
RefreshBin;
end;


// ********************* ������� ����� ����� ********************* //

procedure TForm1.bChangeSignClick(Sender: TObject);
begin
  b_NullInp := True;
  b_CEEnabled := true;
  i_Input := -1 * i_Input;
  RefreshLabel(DoAll);
  RefreshBin();
end;

procedure TForm1.ch_SignClick(Sender: TObject);
begin
  ch_Sign.Checked := b_SignChecked;
  b_SignChecked := not b_SignChecked;
  lbin[4, 16].Enabled := ch_Sign.Checked ;
  b_SignWithMinus := ch_Sign.Checked;
  mSignMode.Checked := ch_Sign.Checked;
  b_SignChecked := not ch_Sign.Checked;
  bChangeSign.Enabled := ch_Sign.Checked;

  if ch_Sign.Checked then     // �� ������
    lbin[4, 16].Caption := '0';

  i_Input := OverflowMask(i_Input);
  RefreshLabel(DoAll);
  RefreshBin;
  //i_Input := 0;
end;


// ********************* ������ � ������������ ����� ********************* //

procedure TForm1.r1Click(Sender: TObject); // ������������ ���������
begin
  PrevHighOfWord := HighOfWord;
  PrevLowOfWord := LowOfWord;
  HighOfWord := High(ShortInt);
  LowOfWord := Low(ShortInt);
  bt_PrevSizeOfWord := bt_SizeOfWord;
  bt_SizeOfWord := 1;
  LabelEnable(1);
  DeleteBin(1);
  i_Input := FromBin();

  RefreshLabel(RefreshOnly);
  b_CEEnabled := True;
  RefreshBin();
end;

procedure TForm1.r2Click(Sender: TObject); // ������������ ���������
begin
  PrevHighOfWord := HighOfWord;
  PrevLowOfWord := LowOfWord;
  HighOfWord := High(SmallInt);
  LowOfWord := Low(SmallInt);
  bt_PrevSizeOfWord := bt_SizeOfWord;
  bt_SizeOfWord := 2;
  LabelEnable(2);
  DeleteBin(2);
  i_Input := FromBin();

  RefreshLabel(RefreshOnly);
  b_CEEnabled := True;
  RefreshBin();
end;

procedure TForm1.r4Click(Sender: TObject); // ��������������� ���������
begin
  PrevHighOfWord := HighOfWord;
  PrevLowOfWord := LowOfWord;
  HighOfWord := High(LongInt);
  LowOfWord := Low(LongInt);
  bt_PrevSizeOfWord := bt_SizeOfWord;
  bt_SizeOfWord := 4;
  LabelEnable(4);
  DeleteBin(4);
  i_Input := FromBin();

  RefreshLabel(RefreshOnly);
  b_CEEnabled := True;
  RefreshBin();
end;

procedure TForm1.r8Click(Sender: TObject); // �������������� ���������
begin
  PrevHighOfWord := HighOfWord;
  PrevLowOfWord := LowOfWord;
  HighOfWord := High(int64);
  LowOfWord := Low(int64);
  bt_PrevSizeOfWord := bt_SizeOfWord;
  bt_SizeOfWord := 8;
  LabelEnable(8);
  i_Input := FromBin();

  RefreshLabel(RefreshOnly);
  b_CEEnabled := True;
  RefreshBin();
end;


// ********************* ������ � ����� ���������� ����� ********************* //

procedure TForm1.rBinClick(Sender: TObject);
begin
 b_SSNow := 2;
 RefreshLabel(RefreshOnly);

  ch_Sign.Enabled := false;
  mSignMode.Enabled := false;
  bChangeSign.Enabled := false;

 bTwo.Enabled := false;
 bThree.Enabled := false;
 bFour.Enabled := false;
 bFive.Enabled := false;
 bSix.Enabled := false;
 bSeven.Enabled := false;
 bEight.Enabled := false;
 bNine.Enabled := false;
 bHexA.Enabled := false;
 bHexB.Enabled := false;
 bHexC.Enabled := false;
 bHexD.Enabled := false;
 bHexE.Enabled := false;
 bHexF.Enabled := false;
end;

procedure TForm1.rDecClick(Sender: TObject);
begin
  b_SSNow := 10;
  RefreshLabel(RefreshOnly);

  ch_Sign.Enabled := true;
  mSignMode.Enabled := true;
  bChangeSign.Enabled := true;
  lOutput.Font.Size := NORMALSIZE;

  bTwo.Enabled := true;
  bThree.Enabled := true;
  bFour.Enabled := true;
  bFive.Enabled := true;
  bSix.Enabled := true;
  bSeven.Enabled := true;
  bEight.Enabled := true;
  bNine.Enabled := true;

  bHexA.Enabled := false;
  bHexB.Enabled := false;
  bHexC.Enabled := false;
  bHexD.Enabled := false;
  bHexE.Enabled := false;
  bHexF.Enabled := false;
end;

procedure TForm1.rHexClick(Sender: TObject);
begin
  b_SSNow:=16;
  RefreshLabel(RefreshOnly);

  ch_Sign.Enabled := false;
  mSignMode.Enabled := false;
  bChangeSign.Enabled := false;
  lOutput.Font.Size := NORMALSIZE;

 bTwo.Enabled := true;
 bThree.Enabled := true;
 bFour.Enabled := true;
 bFive.Enabled := true;
 bSix.Enabled := true;
 bSeven.Enabled := true;
 bEight.Enabled := true;

 bNine.Enabled := true;
 bHexA.Enabled := true;
 bHexB.Enabled := true;
 bHexC.Enabled := true;
 bHexD.Enabled := true;
 bHexE.Enabled := true;
 bHexF.Enabled := true;
end;

procedure TForm1.rOctClick(Sender: TObject);
begin
 b_SSNow := 8;
 RefreshLabel(RefreshOnly);

  ch_Sign.Enabled := false;
  mSignMode.Enabled := false;
  bChangeSign.Enabled := false;

 lOutput.Font.Size := NORMALSIZE;

 bTwo.Enabled := true;
 bThree.Enabled := true;
 bFour.Enabled := true;
 bFive.Enabled := true;
 bSix.Enabled := true;
 bSeven.Enabled := true;

 bEight.Enabled := false;
 bNine.Enabled := false;
 bHexA.Enabled := false;
 bHexB.Enabled := false;
 bHexC.Enabled := false;
 bHexD.Enabled := false;
 bHexE.Enabled := false;
 bHexF.Enabled := false;
end;


// ********************* ������ � ���� ********************* //

procedure TForm1.mAboutSoftClick(Sender: TObject);
begin
  Application.CreateForm(TForm2, Form2);
end;

procedure TForm1.mHelpClick(Sender: TObject);
const HELP_FILENAME = 'Help.chm';
begin
   if HtmlHelp(Handle, PChar(HELP_FILENAME), 0, 0) = 0 then
    Application.MessageBox(
      PChar(Format('������ ������� ����� ������ "%s"', [HELP_FILENAME])), '������', MB_OK + MB_ICONERROR);
end;

procedure TForm1.mParamClick(Sender: TObject);
begin
  Form3.MCwCE.Checked := b_MCwithCE;
  Form3.ClearLCE.Checked := b_ClearLwithMC;
  Form3.ShowModal;
  if Form3.ModalResult = mrOk then
  begin
    b_MCwithCE := Form3.MCwCE.Checked;
    b_ClearLwithMC := Form3.ClearLCE.Checked;
    try
      try
        IniFile := TIniFile.Create(extractfilepath(paramstr(0))+'settings.ini');
        IniFile.WriteBool('Tweak','ClearWithMC', b_ClearLwithMC);
        IniFile.WriteBool('Tweak','ClearMWithCE', b_MCwithCE);
      except
        ShowMessage('���������� ������� ���� ��������');
      end;
    finally
      IniFile.Free;
    end;
  end;
end;

procedure TForm1.mBinDopClick(Sender: TObject);
begin
  mBin.Checked := True;
  mBinPr.Checked := false;
  mBinObr.Checked := false;
  mBinDop.Checked := True;
  mHexOct.Checked := false;
  gbBinCode.Visible := True;
  gbHexOct.Visible := false;

  gbBinCode.Caption := '�������������� ���';

  bt_LabelOutputType := 3;
  RefreshBin();
end;

procedure TForm1.mBinObrClick(Sender: TObject);
begin
  mBin.Checked := True;
  mBinPr.Checked := false;
  mBinObr.Checked := True;
  mBinDop.Checked := false;
  mHexOct.Checked := false;
  gbBinCode.Visible := True;
  gbHexOct.Visible := false;

  gbBinCode.Caption := '�������� ���';

  bt_LabelOutputType := 2;
  RefreshBin();
end;

procedure TForm1.mBinPrClick(Sender: TObject);
begin
  mBin.Checked := True;
  mBinPr.Checked := True;
  mBinObr.Checked := false;
  mBinDop.Checked := false;
  mHexOct.Checked := false;
  gbBinCode.Visible := True;
  gbHexOct.Visible := false;

  gbBinCode.Caption := '������ ���';

  bt_LabelOutputType := 1;
  RefreshBin();
end;

procedure TForm1.mHexOctClick(Sender: TObject);
begin
  mHexOct.Checked := not mHexOct.Checked;;
  mBin.Checked := not mHexOct.Checked;//  false;
  mBinPr.Checked := false;
  mBinObr.Checked := false;
  mBinDop.Checked := not mHexOct.Checked;
  gbBinCode.Visible := not mHexOct.Checked;;
  gbHexOct.Visible := mHexOct.Checked;;
end;


// ********************* ������ � ������� ������ ********************* //

procedure TForm1.mPasteClick(Sender: TObject);
begin
if clipboard.hasformat(cf_text) then
try
  lOutput.Caption := clipboard.astext;
  i_Input := ToDec(lOutput.Caption,b_SSnow);
except
  on EConvertError do
           ShowMessage('�������� ������ ������ ������')
       else
       begin
        lOutput.Caption := '0';
        i_Input := 0;
       end;
end;
  RefreshLabel(DoAll);
  RefreshBin;
end;

procedure TForm1.mCopyClick(Sender: TObject);
begin
clipboard.astext:=lOutput.Caption;
end;


// ********************* ��������� ������� ��������� ����� ********************* //

procedure TForm1.AfterNumberClick(num: byte); // ���������� ������ ����� ������� �������
{
  0..9 - �����
  69 - ��������
  10 - ���������� �������� (����� ����� ���������������)
}
var
IsMax:int64;
begin

  if b_MemoryUsed then
  begin
    i_Input := 0;
    RefreshLabel(DoAll);
    b_MemoryUsed := false;
  end;

  if b_CEEnabled then
  begin
    i_Input := 0;
    RefreshLabel(DoAll);
    b_CEEnabled := false;
  end;

  if bt_SizeOfWord = 8 then IsMax := 63 else IsMax := trunc(power(2,bt_SizeOfWord*8));


  case num of
    0 .. 15:
      if ((i_Input <= (HighOfWord div b_SSNow)) and (i_Input >= (LowOfWord div b_SSNow))) or
      ( not b_SignWithMinus and (i_Input < (IsMax div b_SSNow)) and (i_Input >= 0))  then
      begin
        if b_NullInp then
        begin
          i_Input := 0;
          RefreshLabel(DoAll);
        end;
        i_Input := i_Input * b_SSNow;
        i_Input := i_Input + num;
        RefreshLabel(DoAll);
        b_NullInp := false;
      end;
    {10..15:
      if (i_Input <= (HighOfWord div 16)) and (i_Input >= (LowOfWord div 16)) then
      begin
        if b_NullInp then
        begin
          i_Input := 0;
          RefreshLabel(DoAll);
        end;
        i_Input := i_Input * 16;
        i_Input := i_Input + num;
        RefreshLabel(DoAll);
        b_NullInp := false;
      end; }
    69:
      i_Input := 0;

  end;

  if b_OperClicked then // ���� ������ ������� ��������
begin
 // i_LastInputed := ToDec(lOutput.Caption,b_SSnow);
  if b_TypeIsChangedFirst then
  begin
    op_PrevOper := op_InputedOper;
    i_LastFPResult := i_LastInputed;
    i_Result := i_LastInputed;
  end;
  if ((op_PrevOper <= op_multi) and (op_InputedOper > op_multi))or((op_PrevOper > op_multi) and (op_InputedOper <= op_multi)) and not(b_TypeIsChangedFirst) then
  begin
    if ((op_InputedOper > op_multi) and (op_PrevOper < op_InputedOper)) then  // c * �� +
    begin
      case op_PrevOper of            // ������� �� ���������� ��������
        op_div:
        i_LastFPResult := i_LastFPResult div i_LastInputed; // ������������ ������������� ���������
      op_mod:
        i_LastFPResult := i_LastFPResult mod i_LastInputed;
      op_and:
        i_LastFPResult := i_LastFPResult and i_LastInputed;
        op_multi:
        i_LastFPResult := i_LastFPResult * i_LastInputed;
      end;
      case op_LastSPOper of
        op_plus:
          i_Result := i_LastFPResult + i_Result;
        op_minus:
          i_Result := -1*i_LastFPResult + i_Result;
        op_or:
          i_Result := i_Result or i_LastFPResult;
        op_xor:
          i_Result := i_Result xor i_LastFPResult;
        op_Null:
          i_Result := i_LastFPResult;
      end;
    end//if (op_InputedOper > op_multi) and (op_PrevOper < op_InputedOper)
    else //if (op_InputedOper > op_multi) and (op_PrevOper < op_InputedOper)   � + �� *
    if ((op_InputedOper <= op_multi) and (op_PrevOper > op_InputedOper)) then
    begin
      op_LastFPOper := op_InputedOper;
      i_LastFPResult := i_LastInputed;
      op_LastSPOper := op_PrevOper;
    end;
  end//if op_PrevOper <> op_InputedOper then
  else//if op_PrevOper <> op_InputedOper then
  begin   //  === 'if op_PrevOper = op_InputedOper then'
   if not(b_TypeIsChangedFirst) then
    case op_PrevOper of
      op_div:
        i_LastFPResult := i_LastFPResult div i_LastInputed; // ������������ ������������� ���������
      op_mod:
        i_LastFPResult := i_LastFPResult mod i_LastInputed;
      op_and:
        i_LastFPResult := i_LastFPResult and i_LastInputed;
      op_multi:
        i_LastFPResult := i_LastFPResult * i_LastInputed;
      op_plus:
        i_Result := i_Result + i_LastInputed; // ������������ ������������� ���������
      op_minus:
        i_Result := i_Result - i_LastInputed;
      op_or:
        i_Result := i_Result or i_LastInputed;
      op_xor:
        i_Result := i_Result xor i_LastInputed;
    end;
  end;//if op_PrevOper <> op_InputedOper then else
  b_OperClicked := False;
  op_PrevOper := op_InputedOper;
  if b_TypeIsChangedFirst then b_TypeIsChangedFirst := False;
end;


  RefreshBin();
end;


// ********************* ���������� ������ ********************* //

procedure TForm1.RefreshLabel(refresh: TypeOfRefresh);
var
  input: int64;
begin
  // if (i_Input = 0) and (op_InputedOper <> op_Null) then
  // input := i_LastInputed
  // else
  input := i_Input;

  if refresh = DoAll then
    input := OverflowMask(input);

  lOctOut.Caption := FromDec(input, 8);
  lHexOut.Caption := FromDec(input, 16);
  lOutput.Caption := FromDec(input, b_SSNow);
  if b_SSNow = 2 then
    if Length(lOutput.Caption) < FSTEP then
      lOutput.Font.size := NORMALSIZE
    else if Length(lOutput.Caption) < SECSTEP then
      lOutput.Font.size := NORMALSIZE - DELTA - 1
    else if Length(lOutput.Caption) < THSTEP then
      lOutput.Font.size := NORMALSIZE - 2 * DELTA - 2
    else if Length(lOutput.Caption) < FOURSTEP then
      lOutput.Font.size := NORMALSIZE - 3 * DELTA - 2
    else
      lOutput.Font.size := NORMALSIZE - 4*DELTA-2;

end;

procedure TForm1.RefreshBin();
begin
  BinTo_gbBinCode(ToDec(lOutput.Caption,b_SSnow), bt_LabelOutputType);
end;

procedure TForm1.DeleteBin(count: byte);
var
  i: Integer;
  a: TLabel;
begin
  for i := count * 8 to 63 do
  begin
    a := FindComponent('Label' + IntToStr(i)) as TLabel;
    a.Caption := '0';
  end;

end;

procedure TForm1.RefreshSBar();
begin
 StatusBar.Panels[1].Text := FromDec(i_Memory,b_SSNow);
 if GetKeyState(VK_NUMLOCK)=1 then
  StatusBar.Panels[2].Text := 'NumLock �������'
 else
  StatusBar.Panels[2].Text := 'NumLock ��������';
end;

// ********************* ��������� ������� �� LABEL ********************* //

procedure TForm1.LabelEnable(size: byte); // �����������/������� ���� � �������� ������������
var
  i, j: Integer;
begin
  if size >= 2 then
  begin
    for i := 9 to 16 do
      lbin[1, i].Show;
    lpt2.Show;
  end
  else
  begin
    for i := 9 to 16 do
      lbin[1, i].Hide;
    lpt2.Hide;
  end;

  if size >= 4 then
  begin
    for i := 1 to 16 do
      lbin[2, i].Show;
  end
  else
  begin
    for i := 1 to 16 do
      lbin[2, i].Hide;
    lpt3.Hide;
  end;

  if size >= 8 then
  begin
    for i := 3 to 4 do
      for j := 1 to 16 do
        lbin[i, j].Show;
    lpt4.Show;
    lpt5.Show;
    lpt6.Show;
  end
  else
  begin
    for i := 3 to 4 do
      for j := 1 to 16 do
        lbin[i, j].Hide;
    lpt4.Hide;
    lpt5.Hide;
    lpt6.Hide;
  end;

end;

// ********************* ���. ������� � ��������� ********************* //

function TForm1.NumOfBits(i_inp: int64): byte; // ������ ���������� ���
begin
  if i_inp = 0 then
    NumOfBits := 0
  else
    NumOfBits := ceil(Log2(abs(i_inp)));

end;

function TForm1.ToBin(inp: int64): int64;
var
  i, a: Integer;
begin
  a := 0;
  for i := NumOfBits(inp) downto 0 do
    a := a * 10 + ((inp shr i) and 1);
  ToBin := a;
end;

procedure TForm1.BinTo_gbBinCode(i_inp: int64; bt_byte: byte);
var
  i, j: Integer;
begin
  case bt_byte of
    1:
      begin
        if  i_inp < 0 then
          i_inp := Overflowmask(not(i_inp-1)) or LowOfWord; // ������ ���
      end;
    2:
      if (i_inp < 0) then
        i_inp := OverflowMask(i_inp-1);
    // 3:  ��� ��������������� ����, ������� ��������� � "��������"
  end;

  for i := 1 to 4 do
    for j := 1 to 16 do
      lbin[i, j].Caption := IntToStr(ToBin(1 and (i_inp shr (16 * (i - 1) + (j - 1)))));

 end;

function TForm1.FromDec(n,r:int64):string;
var
  i : integer;
  s : string;
begin
s := '';
case r of
  2:
    begin
      for i := 1 to bt_SizeOfWord*8 do
      begin
        s := chr(n and 1 + 48)+s;
        n := n shr 1;
        if n = 0 then
         break;
      end;
      FromDec := s;
    end;
  8:
    begin
      for i := 1 to ceil(bt_SizeOfWord*8 / 3) do
      begin
        s := chr(n and $7 + 48)+s;
        n := n shr 3;
        if n = 0 then
         break;
      end;
    FromDec := s;
    end;
  10:
    FromDec := IntToStr(n);
  16:
    begin
      for i := 1 to bt_SizeOfWord*2 do
      begin
        if n and $F > 9 then s := chr(n and $F + 55)+s
        else s := chr(n and $F + 48) + s;
        n := n shr 4;
        if n = 0 then
         break;
      end;
      FromDec := s;
    end;
end;

end;

function TForm1.ToDec(inp : string;ss:integer):int64;
var i : byte;
    j : int64;
    len : byte;
    buf : real;
begin
  j := 0;
  len :=  Length(inp);
  if ss <> 10 then
    for i := 1 to len do
    begin
      if (not((b_SSNow = 2) and ( i = 64 ))) and (not((b_SSNow = 8) and ( i = 22 ))) then
        if ord(inp[len-i+1]) >= 65 then
        begin
          buf := (ord(inp[len-i+1])-55)*trunc(power(b_SSNow,i-1));
          j := j or trunc(buf);
        end
        else
        begin
          buf := (ord(inp[len-i+1])-48)*trunc(power(b_SSNow,i-1));
          j := j or trunc(buf);
        end
      else
      begin
        if (b_SSNow = 2)and(ord(inp[len-i+1])-48 = 1) then j := j or Low(int64);
        if (b_SSNow = 8)and(ord(inp[len-i+1])-48 = 1) then j := j or Low(int64);
      end;
    end
  else j := StrToInt64(inp);
  ToDec := j;
end;

function TForm1.FromBin(): int64;
var
  i: Integer; // ��� �����
  j: int64; // ��� ������������ � ����������
  a: TLabel; // ��� ����������� �������� ����
  maxS: int64;
begin
  j := 0; // �������� �����
  maxS := bt_SizeOfWord;
  for i := 0 to 62 do // ���� ��������� � ��������
  begin
    a := FindComponent('Label' + IntToStr(i)) as TLabel;
    if (a.Caption = '1') then
      j := j + trunc(power(2,i)); // � ����������� �����
  end;

   case bt_LabelOutputType of
     // ������ ���
     1:
       begin
        a := FindComponent('Label' + IntToStr(maxS * 8 - 1)) as TLabel;
        if (a.Caption = '1') and b_SignWithMinus then
         begin
            j := not(j and HighOfWord) + 1;
         end;
       end;

      // �������� ���
     2:
       begin
        a := FindComponent('Label' + IntToStr(maxS * 8 - 1)) as TLabel;
        if (a.Caption = '1') and b_SignWithMinus then
             j := (j or (LowOfWord)) + 1;
        end;

         // �������������� ���
     3:
       begin
        a := FindComponent('Label' + IntToStr(maxS * 8 - 1)) as TLabel;
        if (a.Caption = '1') and b_SignWithMinus then
           j := OverflowMask(j or not HighOfWord );
       end;
   end;



  FromBin := j; // ���������� ��������
end;


// ********************* �������� �� ���� � ������������ ����. ����� ********************* //

procedure TForm1.SignIsRight(size: byte);
var
  i, j: byte;
begin
  // ����������� ��������� ����
  if size = 1 then
  begin
    i := 1;
    j := 8;
  end
  else
  begin
    i := size div 2;
    j := 16;
  end;

  // �������� ��������� ���� �� ������� (�����)
  if lbin[i, j].Caption = '1' then
    i_Input := LowOfWord + (i_Input and (trunc(power(2, 8 * (size-1)))));
end;

function TForm1.OverflowMask(inp:int64):int64;
begin
  inp := inp and ((HighOfWord shl 1) or 1);

  if b_SignWithMinus then
  begin
    if inp and LowOfWord <> 0 then
      inp := not((not (inp - 1)) and ((HighOfWord shl 1) or 1))+1;
  end
  else
  begin
      if bt_SizeOfWord = 8 then inp := inp and HighOfWord;
  end;

  OverflowMask := inp;
end;

end.
