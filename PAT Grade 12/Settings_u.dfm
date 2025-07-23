object frmSettings: TfrmSettings
  Left = 0
  Top = 0
  Caption = 'Settings'
  ClientHeight = 581
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    812
    581)
  TextHeight = 15
  object lblPreviewHeader: TLabel
    Left = 183
    Top = 49
    Width = 63
    Height = 23
    Anchors = []
    Caption = 'Preview'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ExplicitLeft = 149
    ExplicitTop = 40
  end
  object grpPreview: TGroupBox
    Left = 78
    Top = 98
    Width = 281
    Height = 145
    Anchors = []
    Color = clBtnFace
    Enabled = False
    ParentBackground = False
    ParentColor = False
    ShowFrame = False
    TabOrder = 0
    object sPreviewBackground: TShape
      Left = 0
      Top = 0
      Width = 279
      Height = 143
      Pen.Color = clSkyBlue
    end
    object lblPreview: TLabel
      Left = 40
      Top = 49
      Width = 25
      Height = 15
      Caption = 'Stuff'
    end
    object btnPreview: TButton
      Left = 88
      Top = 75
      Width = 121
      Height = 25
      Caption = 'Enter'
      TabOrder = 0
    end
    object edtPreview: TEdit
      Left = 88
      Top = 46
      Width = 121
      Height = 23
      TabOrder = 1
      TextHint = 'Enter text'
    end
  end
  object rgpThemes: TRadioGroup
    Left = 168
    Top = 300
    Width = 121
    Height = 149
    Anchors = []
    Caption = '       Themes'
    DefaultHeaderFont = False
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -17
    HeaderFont.Name = 'Segoe UI'
    HeaderFont.Style = [fsBold]
    Items.Strings = (
      'Light'
      'Dark'
      'Blue'
      'Purple'
      'Emerald')
    ShowFrame = False
    TabOrder = 1
    OnClick = rgpThemesClick
  end
  object btnReturn: TBitBtn
    Left = 8
    Top = 8
    Width = 75
    Height = 30
    Caption = 'Return'
    Glyph.Data = {
      82060000424D8206000000000000420000002800000014000000140000000100
      20000300000040060000130B0000130B000000000000000000000000FF0000FF
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000004000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      009F000000FF0000004000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000009F000000FF000000BF00000020000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000009F000000FF0000
      00BF000000200000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000009F000000FF000000FF000000FF000000DF000000DF000000DF0000
      00DF000000DF000000DF000000DF000000DF000000DF000000DF000000000000
      000000000000000000000000000000000000000000BF000000FF000000FF0000
      00DF000000DF000000DF000000DF000000DF000000DF000000DF000000DF0000
      00DF000000DF000000FF00000020000000000000000000000000000000000000
      000000000000000000BF000000FF000000BF0000000000000000000000000000
      0000000000000000000000000000000000000000007F000000FF000000200000
      0000000000000000000000000000000000000000000000000000000000BF0000
      00FF000000BF0000000000000000000000000000000000000000000000000000
      00000000007F000000FF00000020000000000000000000000000000000000000
      0000000000000000000000000000000000BF000000FF00000060000000000000
      0000000000000000000000000000000000000000000000000020000000200000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000600000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
    TabOrder = 2
    OnClick = btnReturnClick
  end
  object btnCancel: TBitBtn
    Left = 297
    Top = 500
    Width = 78
    Height = 29
    Anchors = []
    Caption = 'Revert'
    Enabled = False
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object grpUserSettings: TGroupBox
    Left = 424
    Top = 98
    Width = 369
    Height = 351
    Anchors = []
    ShowFrame = False
    TabOrder = 4
    object lblOutputUsername: TLabel
      Left = 144
      Top = 48
      Width = 3
      Height = 15
    end
    object lblOutputName: TLabel
      Left = 136
      Top = 181
      Width = 3
      Height = 15
    end
    object lblOutputSurname: TLabel
      Left = 136
      Top = 227
      Width = 3
      Height = 15
    end
    object lblOutputContact: TLabel
      Left = 136
      Top = 277
      Width = 3
      Height = 15
    end
    object lblOutputPassword: TLabel
      Left = 152
      Top = 128
      Width = 3
      Height = 15
    end
    object edtContactDetails: TLabeledEdit
      Left = 106
      Top = 314
      Width = 151
      Height = 23
      Color = clFirebrick
      EditLabel.Width = 34
      EditLabel.Height = 23
      EditLabel.Caption = 'E-Mail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 5
      Text = ''
      OnChange = edtContactDetailsChange
      OnExit = edtContactDetailsExit
    end
    object edtSurname: TLabeledEdit
      Left = 106
      Top = 248
      Width = 151
      Height = 23
      Color = clFirebrick
      EditLabel.Width = 47
      EditLabel.Height = 23
      EditLabel.Caption = 'Surname'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 4
      Text = ''
      OnChange = edtSurnameChange
      OnExit = edtSurnameExit
    end
    object edtName: TLabeledEdit
      Left = 106
      Top = 186
      Width = 151
      Height = 23
      Color = clFirebrick
      EditLabel.Width = 32
      EditLabel.Height = 23
      EditLabel.Caption = 'Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 3
      Text = ''
      OnChange = edtNameChange
      OnExit = edtNameExit
    end
    object edtUsername: TLabeledEdit
      Left = 106
      Top = 19
      Width = 151
      Height = 23
      Color = clFirebrick
      EditLabel.Width = 53
      EditLabel.Height = 23
      EditLabel.Caption = 'Username'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 0
      Text = ''
      OnChange = edtUsernameChange
      OnExit = edtUsernameExit
    end
    object edtPassword: TLabeledEdit
      Left = 106
      Top = 78
      Width = 151
      Height = 23
      Color = clFirebrick
      EditLabel.Width = 50
      EditLabel.Height = 23
      EditLabel.Caption = 'Password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      Text = ''
      OnChange = edtPasswordChange
      OnExit = edtPasswordExit
    end
    object edtConfirmPassword: TLabeledEdit
      Left = 106
      Top = 107
      Width = 151
      Height = 23
      Color = clFirebrick
      EditLabel.Width = 97
      EditLabel.Height = 23
      EditLabel.Caption = 'Confirm Password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
      Text = ''
      OnChange = edtPasswordChange
      OnExit = edtPasswordExit
    end
    object chkShowPass: TCheckBox
      Left = 263
      Top = 79
      Width = 106
      Height = 17
      Caption = 'Show Passwords'
      TabOrder = 6
      OnClick = chkShowPassClick
    end
  end
  object btnConfirm: TBitBtn
    Left = 408
    Top = 500
    Width = 121
    Height = 29
    Anchors = []
    Caption = 'Confirm'
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 5
    OnClick = btnConfirmClick
  end
end
