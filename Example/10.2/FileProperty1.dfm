object frmFileDescription: TfrmFileDescription
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'File Property'
  ClientHeight = 218
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object edtFilePath: TLabeledEdit
    Left = 72
    Top = 40
    Width = 217
    Height = 21
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'File Path:'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 0
    Top = 193
    Width = 385
    Height = 25
    Align = alBottom
    Caption = 'Add File'
    TabOrder = 1
    OnClick = Button1Click
    ExplicitLeft = 160
    ExplicitTop = 128
    ExplicitWidth = 75
  end
  object Button2: TButton
    Left = 295
    Top = 38
    Width = 42
    Height = 25
    Caption = '...'
    TabOrder = 2
    OnClick = Button2Click
  end
  object edtContentType: TLabeledEdit
    Left = 72
    Top = 88
    Width = 217
    Height = 21
    EditLabel.Width = 70
    EditLabel.Height = 13
    EditLabel.Caption = 'Content Type:'
    TabOrder = 3
  end
  object edtContentID: TLabeledEdit
    Left = 72
    Top = 136
    Width = 217
    Height = 21
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = 'Content ID:'
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 328
    Top = 104
  end
end
