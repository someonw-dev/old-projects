object frmSetup: TfrmSetup
  Left = 0
  Top = 0
  Caption = 'Setup'
  ClientHeight = 602
  ClientWidth = 838
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnClose = FormClose
  DesignSize = (
    838
    602)
  TextHeight = 15
  object lblTitle: TLabel
    Left = 258
    Top = 32
    Width = 319
    Height = 23
    Anchors = [akTop]
    Caption = 'Before you hop in lets do a quick setup.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPreviewTitle: TLabel
    Left = 183
    Top = 87
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
    ExplicitLeft = 186
  end
  object grpPreview: TGroupBox
    Left = 71
    Top = 127
    Width = 281
    Height = 145
    Anchors = []
    Color = clBtnFace
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
    Left = 159
    Top = 333
    Width = 121
    Height = 149
    Anchors = []
    Caption = '    Select Theme'
    DefaultHeaderFont = False
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -17
    HeaderFont.Name = 'Segoe UI'
    HeaderFont.Style = [fsBold]
    ItemIndex = 2
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
  object btnContinue: TBitBtn
    Left = 358
    Top = 529
    Width = 121
    Height = 29
    Anchors = []
    Caption = 'Continue'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnContinueClick
  end
  object grpUserDetails: TGroupBox
    Left = 441
    Top = 165
    Width = 310
    Height = 276
    Anchors = []
    TabOrder = 3
    object lblOutputName: TLabel
      Left = 152
      Top = 48
      Width = 3
      Height = 15
    end
    object lblOutputSurname: TLabel
      Left = 144
      Top = 112
      Width = 3
      Height = 15
    end
    object lblOutputContact: TLabel
      Left = 144
      Top = 168
      Width = 3
      Height = 15
    end
    object edtName: TLabeledEdit
      Left = 83
      Top = 19
      Width = 177
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
      TabOrder = 0
      Text = ''
      TextHint = 'Enter name'
      OnExit = edtNameExit
    end
    object edtSurname: TLabeledEdit
      Left = 83
      Top = 104
      Width = 177
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
      TabOrder = 1
      Text = ''
      TextHint = 'Enter surname'
      OnExit = edtSurnameExit
    end
    object edtContactDetails: TLabeledEdit
      Left = 83
      Top = 184
      Width = 177
      Height = 23
      Color = clFirebrick
      EditLabel.Width = 34
      EditLabel.Height = 23
      EditLabel.Caption = 'E-mail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 2
      Text = ''
      TextHint = 'Enter e-mail'
      OnExit = edtContactDetailsExit
    end
  end
end
