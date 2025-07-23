object frmTriangle: TfrmTriangle
  Left = 0
  Top = 0
  Caption = 'frmTriangle'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    628
    442)
  TextHeight = 15
  object lblWindow: TLabel
    Left = 216
    Top = 275
    Width = 205
    Height = 15
    Anchors = []
    Caption = 'Maximize the window before you start!'
  end
  object btnStart: TButton
    Left = 280
    Top = 296
    Width = 75
    Height = 25
    Anchors = []
    Caption = 'Start!'
    TabOrder = 0
    OnClick = btnStartClick
  end
  object tNewPoint: TTimer
    Enabled = False
    Interval = 1
    OnTimer = tNewPointTimer
    Left = 576
    Top = 392
  end
end
