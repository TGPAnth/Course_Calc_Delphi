object Form3: TForm3
  Left = 313
  Top = 162
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 89
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 4
    Top = 4
    Width = 261
    Height = 81
    Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1087#1072#1084#1103#1090#1100#1102
    TabOrder = 0
    object ClearLCE: TCheckBox
      Left = 12
      Top = 20
      Width = 241
      Height = 17
      Caption = #1054#1095#1080#1089#1090#1082#1072' '#1075#1083#1072#1074#1085#1086#1075#1086' '#1074#1099#1074#1086#1076#1072' '#1087#1088#1080' '#1085#1072#1078#1072#1090#1080#1080' MC'
      TabOrder = 0
    end
    object MCwCE: TCheckBox
      Left = 12
      Top = 43
      Width = 241
      Height = 17
      Caption = #1054#1095#1080#1089#1090#1082#1072' '#1087#1072#1084#1103#1090#1080' '#1087#1088#1080' '#1085#1072#1078#1072#1090#1080#1080' CE'
      TabOrder = 1
    end
  end
  object bitOk: TBitBtn
    Left = 278
    Top = 4
    Width = 75
    Height = 25
    Caption = #1054#1082
    DoubleBuffered = True
    ModalResult = 1
    ParentDoubleBuffered = False
    TabOrder = 1
  end
  object bitCancel: TBitBtn
    Left = 278
    Top = 35
    Width = 75
    Height = 25
    Caption = 'Cancel'
    DoubleBuffered = True
    ModalResult = 2
    ParentDoubleBuffered = False
    TabOrder = 2
  end
end
