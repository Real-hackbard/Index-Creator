{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN UNIT_PLATFORM OFF}

unit Unit1;

{.$DEFINE TEST}

interface

uses
  Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.Shell.ShellCtrls, FileCtrl, Vcl.StdCtrls, Vcl.ExtCtrls,
  IniFiles;

type
  TForm1 = class(TForm)
    Button7: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    Button3: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Button4: TButton;
    Button8: TButton;
    Bevel1: TBevel;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    lblBanner: TLabel;
    Bevel2: TBevel;
    Button1: TButton;
    Label5: TLabel;
    Edit3: TEdit;
    Button5: TButton;
    Button6: TButton;
    SaveDialog2: TSaveDialog;
    OpenDialog2: TOpenDialog;
    Memo1: TMemo;
    Label6: TLabel;
    Button9: TButton;
    StatusBar1: TStatusBar;
    ComboBox1: TComboBox;
    Button10: TButton;
    Label7: TLabel;
    Label8: TLabel;
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditsOnChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
    procedure SaveTemplate(Filename: string);
    procedure LoadTemplate(Filename: string);
  public
    { Public declarations }
  end;

const
  SECTION = 'Template';
  DIR = 'Dir';
  SAVEAS = 'SaveAs';
  FILTER = 'Filter';
  TITLE = 'Title';
  CSS = 'CSS';

const
  APPNAME = 'Index Creator';
  VER = '1.0';
  INFO_TEXT = APPNAME + ' ' + VER + #13#10 +
    'Copyright © Your Name' + #13#10#13#10 +
    'https://github.com';
  CSS_DIR = 'Stylesheets';

var
  Form1: TForm1;

implementation

{$R *.dfm}
function GetFileSize(szFile: PChar): Int64;
var
  fFile: THandle;
  wfd: TWIN32FINDDATA;
begin
  result := 0;
  if not FileExists(szFile) then
    exit;
  fFile := FindFirstfile(pchar(szFile), wfd);
  if fFile = INVALID_HANDLE_VALUE then
    exit;
  result := (wfd.nFileSizeHigh * (Int64(MAXDWORD) + 1)) + wfd.nFileSizeLow;
  windows.FindClose(fFile);
end;

procedure FindAllFiles(var Liste: TStrings; RootFolder: string; Mask: string =
  '*.*'; Recurse: Boolean = True);

  function HTMLLink(Filename: string): string;
  begin
    result := '<a title="' + Filename + '" ' + 'href="' + Filename + '">' +
      ExtractFileName(Filename) + '</a>';
  end;

var
  SR: TSearchRec;
begin
  if AnsiLastChar(RootFolder)^ <> '\' then
    RootFolder := RootFolder + '\';
  Liste.Add('<dl>' + #13#10);
  if Recurse then
  begin
    if FindFirst(RootFolder + '*.*', faAnyFile, SR) = 0 then
    begin
      try
        repeat
          Application.ProcessMessages;
          if SR.Attr and faDirectory = faDirectory then
          begin
            if (SR.Name <> '.') and (SR.Name <> '..') then
            begin
              Liste.Add('<dl>' + #13#10);
              Liste.Add('<dt>' + HTMLLink(RootFolder + SR.Name) + '</dt>' +
                #13#10);
              Liste.Add('</dl>' + #13#10);
              FindAllFiles(Liste, RootFolder + SR.Name, Mask, Recurse);
            end;
          end;
        until FindNext(SR) <> 0;
      finally
        FindClose(SR);
      end;
    end;
  end;
  if FindFirst(RootFolder + Mask, faAnyFile, SR) = 0 then
  try
    repeat
      Application.ProcessMessages;
      if SR.Attr and faDirectory <> faDirectory then
      begin
        Liste.Add('<dd>' + HTMLLink(RootFolder + SR.Name) + '</dd>');
      end;
    until FindNext(SR) <> 0;
  finally
    FindClose(SR);
  end;
  Liste.Add('</dl>' + #13#10);
end;

function HTMLHeader(Title, Stylesheet: string): string;
  function InsertCSS: String;
  var
    sl: TStringList;
  begin
    sl := TStringList.Create;
    try
      sl.LoadFromFile(Form1.Edit5.Text);
      result := sl.Text;
    finally
      FreeAndNil(sl);
    end;
  end;
begin
  result := '<html>' + #13#10 +
    '<head>' + #13#10 +
    '<title>' + Title + '</title>' + #13#10 +
    '<style type="text/css">' + #13#10 +
    '<!--' + #13#10+
    InsertCSS + #13#10 +
    '--!>'+ #13#10 +
    '</style>' + #13#10 +
    '</head>' + #13#10 +
    '<h1>' + Title + '</h1>' +
    '<hr>';
end;

function HTMLFooter: string;
begin
  result := '<p>' +
    'Created with Index Creator &copy; Your Name.<br>' + #13#10 +
    '<a target="_blank" href="https://github.com">https://github.com</a>' + #13#10
    +
    '</p>' + #13#10 +
    '</body>' + #13#10 + '</html>';
end;

function Foo: string;
begin
  result := 'Create: ' + DateTimeToStr(now);
end;

procedure TForm1.SaveTemplate(Filename: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(Filename);
  try
    ini.WriteString(SECTION, DIR, Edit1.Text);
    ini.WriteString(SECTION, SAVEAS, Edit2.Text);
    ini.WriteString(SECTION, FILTER, Edit3.Text);
    ini.WriteString(SECTION, TITLE, Edit4.Text);
    ini.WriteString(SECTION, CSS, Edit5.Text);
  finally
    FreeAndNil(ini);
  end;
end;

procedure TForm1.LoadTemplate(Filename: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(Filename);
  try
    Edit1.Text := ini.ReadString(SECTION, DIR, '');
    Edit2.Text := ini.ReadString(SECTION, SAVEAS, '');
    Edit3.Text := ini.ReadString(SECTION, FILTER, '');
    Edit4.Text := ini.ReadString(SECTION, TITLE, '');
    Edit5.Text := ini.ReadString(SECTION, CSS, '');
  finally
    FreeAndNil(ini);
  end;
end;

procedure TForm1.EditsOnChange(Sender: TObject);
begin
  Button7.Enabled := (length(Edit1.Text) > 0) and (length(Edit2.Text) >
    0);
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  Liste: TStrings;
  Filter: string;
resourcestring
  rsDirNotExists = 'The specified directory does not exist.';
  rsWork = 'Create file...';
begin
  if not FileExists(Edit5.Text) then
  begin
    MessageDlg('I need a *.css Stylesheet file!',mtInformation, [mbOK], 0);
    Exit;
  end;

  if DirectoryExists(Edit1.Text) then
  begin
    Screen.Cursor := crHourGlass;
    Liste := TStringList.Create;
    try
      StatusBar1.Panels[0].Text := rsWork;
      Form1.Refresh;
      Liste.Add(HTMLHeader(Edit4.Text, Edit5.Text));
      Liste.Add(Foo + '<br>' + #13#10);
      Filter := Edit3.Text;
      if Filter = '' then
        Filter := '*.*';
      FindAllFiles(Liste, Edit1.Text, Filter);
      Liste.Add(HTMLFooter);
      Liste.SaveToFile(Edit2.Text);
      Application.ProcessMessages;
    finally
      FreeAndNil(Liste);
      StatusBar1.Panels[0].Text := 'Index ' + IntToStr(GetFileSize(PChar(Edit2.Text))) + ' bytes, Create finish';
    end;
    Screen.Cursor := crDefault;
  end
  else
    Messagebox(Handle, PChar(rsDirNotExists), APPNAME, MB_ICONERROR);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if not FileExists(Edit5.Text) then
  begin
    MessageDlg('CSS file not found...',mtInformation, [mbOK], 0);
    Exit;
  end;

  Memo1.Lines.SaveToFile(Edit5.Text);
  MessageDlg('CSS file saved..',mtInformation, [mbOK], 0);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  Edit3.Text := ComboBox1.Text;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    Edit2.Text := SaveDialog1.FileName;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Dir: string;
resourcestring
  rsDialogCaption = 'Select a directory';
begin
  if SelectDirectory(rsDialogCaption, '', dir) then
  begin
    Edit1.Text := Dir;
    Edit4.Text := ExtractFileName(Edit1.Text);
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0)) + CSS_DIR;
  if OpenDialog1.Execute then
  begin
    Memo1.Clear;
    Edit5.Text := OpenDialog1.FileName;
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
    StatusBar1.Panels[1].Text := ExtractFilename(OpenDialog1.FileName);
    Label8.Caption := IntToStr(Memo1.Lines.Count);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.MaxLength := $7FFFFFF0;
  Form1.Caption := APPNAME;
  lblBanner.Caption := APPNAME;
  if ParamCount > 0 then
    LoadTemplate(ParamStr(1));
{$IFDEF TEST}
  edtDir.Text := 'h:\';
  edtHTMLFile.Text := 'h:\content.html';
  edtTitle.Text := 'Test';
  edtStylesheet.Text := 'h:\Stylesheet.css';
{$ENDIF}
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit5.Clear;
  Memo1.Clear;
  Label8.Caption := '0';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Messagebox(0, INFO_TEXT, APPNAME, MB_ICONINFORMATION);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if SaveDialog2.Execute then
  begin
    SaveTemplate(SaveDialog2.FileName);
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if OpenDialog2.Execute then
  begin
    LoadTemplate(OpenDialog2.FileName);
  end;
end;

end.

