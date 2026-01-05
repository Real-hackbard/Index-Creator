object Form1: TForm1
  Left = 442
  Top = 395
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Index Creator'
  ClientHeight = 537
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 53
    Top = 75
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = 'Directory :'
  end
  object Label2: TLabel
    Left = 23
    Top = 106
    Width = 78
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Save as.. :'
  end
  object Label3: TLabel
    Left = 75
    Top = 163
    Width = 26
    Height = 13
    Alignment = taRightJustify
    Caption = 'Title :'
  end
  object Label4: TLabel
    Left = 46
    Top = 193
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Stylesheet :'
  end
  object Bevel1: TBevel
    Left = 10
    Top = 458
    Width = 425
    Height = 10
    Shape = bsBottomLine
  end
  object lblBanner: TLabel
    Left = 0
    Top = 0
    Width = 444
    Height = 53
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'lblBanner'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    ExplicitWidth = 443
  end
  object Bevel2: TBevel
    Left = 0
    Top = 53
    Width = 444
    Height = 10
    Align = alTop
    Shape = bsTopLine
    ExplicitTop = 81
  end
  object Label5: TLabel
    Left = 23
    Top = 133
    Width = 78
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Filter :'
  end
  object Label6: TLabel
    Left = 74
    Top = 227
    Width = 23
    Height = 13
    Caption = 'Css :'
  end
  object Label7: TLabel
    Left = 21
    Top = 246
    Width = 31
    Height = 13
    Caption = 'Lines :'
  end
  object Label8: TLabel
    Left = 58
    Top = 246
    Width = 6
    Height = 13
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button7: TButton
    Left = 281
    Top = 482
    Width = 75
    Height = 25
    Hint = 'Create html Index file'
    Caption = '&Create'
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 10
    OnClick = Button7Click
  end
  object Edit1: TEdit
    Left = 106
    Top = 72
    Width = 273
    Height = 21
    TabStop = False
    TabOrder = 0
    OnChange = EditsOnChange
  end
  object Edit2: TEdit
    Left = 106
    Top = 102
    Width = 273
    Height = 21
    TabStop = False
    TabOrder = 2
    OnChange = EditsOnChange
  end
  object Button2: TButton
    Left = 386
    Top = 72
    Width = 49
    Height = 23
    Hint = 'Load Folder'
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TabStop = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 386
    Top = 102
    Width = 49
    Height = 23
    Hint = 'HTML Save Directory'
    Caption = '&File'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TabStop = False
    OnClick = Button3Click
  end
  object Edit4: TEdit
    Left = 107
    Top = 160
    Width = 272
    Height = 21
    TabStop = False
    TabOrder = 5
    Text = 'Index Creator'
  end
  object Edit5: TEdit
    Left = 106
    Top = 189
    Width = 273
    Height = 21
    TabStop = False
    TabOrder = 6
  end
  object Button4: TButton
    Left = 386
    Top = 189
    Width = 49
    Height = 23
    Hint = 'Load CSS file'
    Caption = '&Open'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    TabStop = False
    OnClick = Button4Click
  end
  object Button8: TButton
    Left = 362
    Top = 482
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Exit'
    TabOrder = 11
    TabStop = False
    OnClick = Button8Click
  end
  object Button1: TButton
    Left = 392
    Top = 8
    Width = 43
    Height = 25
    Caption = '&Info'
    TabOrder = 12
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 106
    Top = 130
    Width = 121
    Height = 21
    TabStop = False
    TabOrder = 4
    Text = '*.*'
  end
  object Button5: TButton
    Left = 8
    Top = 482
    Width = 75
    Height = 25
    Hint = 'Save Template'
    Caption = 'Save'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 8
    TabStop = False
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 89
    Top = 482
    Width = 75
    Height = 25
    Hint = 'Load Template'
    Caption = 'Load'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 9
    TabStop = False
    OnClick = Button6Click
  end
  object Memo1: TMemo
    Left = 106
    Top = 224
    Width = 273
    Height = 228
    TabStop = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 13
  end
  object Button9: TButton
    Left = 385
    Top = 427
    Width = 49
    Height = 25
    Hint = 'Save CSS file'
    Caption = '&Save'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    TabStop = False
    OnClick = Button9Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 518
    Width = 444
    Height = 19
    Panels = <
      item
        Text = '...'
        Width = 200
      end
      item
        Text = 'no css..'
        Width = 50
      end>
    ExplicitTop = 514
    ExplicitWidth = 441
  end
  object ComboBox1: TComboBox
    Left = 233
    Top = 131
    Width = 146
    Height = 21
    Style = csDropDownList
    DropDownCount = 30
    ItemIndex = 0
    TabOrder = 16
    TabStop = False
    Text = '*.*'
    OnChange = ComboBox1Change
    Items.Strings = (
      '*.*'
      '*.bmp'
      '*.gif'
      '*.png'
      '*.jpg'
      '*.jpeg'
      '*.ico'
      '*.svg'
      '*.avi'
      '*.mp4'
      '*.mkv'
      '*.raw'
      '*.mp3'
      '*.wav'
      '*.ogg'
      '*.aac'
      '*.ttf'
      '*.css'
      '*.htm'
      '*.shtml'
      '*.html')
  end
  object Button10: TButton
    Left = 170
    Top = 482
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 17
    TabStop = False
    OnClick = Button10Click
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'html'
    FileName = 'index'
    Filter = 
      'HTML Dateien (*.html, *shtml)|*.html; *.shtml|alle Dateien (*.)|' +
      '*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 128
    Top = 312
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Stylesheet (*.css)|*.css'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 208
    Top = 312
  end
  object SaveDialog2: TSaveDialog
    DefaultExt = 'd2h'
    Filter = 'Template (*.d2h)|*.d2h'
    Left = 128
    Top = 248
  end
  object OpenDialog2: TOpenDialog
    Filter = 'Vorlagendatei (*.d2h)|*.d2h'
    Left = 200
    Top = 248
  end
end
