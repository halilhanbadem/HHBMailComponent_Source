object frmMailSender: TfrmMailSender
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Example for Delphi XE10.2 Mail Sender -- Halil Han Badem'
  ClientHeight = 343
  ClientWidth = 444
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
  object Label1: TLabel
    Left = 219
    Top = 51
    Width = 64
    Height = 13
    Caption = 'Mail Content:'
  end
  object Label2: TLabel
    Left = 16
    Top = 295
    Width = 243
    Height = 13
    Caption = 'You need to use SSL / TLS supported port number.'
  end
  object btnMailSend: TButton
    Left = 0
    Top = 314
    Width = 444
    Height = 29
    Align = alBottom
    Caption = 'Mail Send'
    TabOrder = 0
    OnClick = btnMailSendClick
  end
  object edtSMTPAddress: TLabeledEdit
    Left = 16
    Top = 24
    Width = 161
    Height = 21
    EditLabel.Width = 93
    EditLabel.Height = 13
    EditLabel.Caption = 'Mail SMTP Address:'
    TabOrder = 1
    Text = 'smtp.gmail.com'
  end
  object edtSMTPPort: TLabeledEdit
    Left = 16
    Top = 67
    Width = 161
    Height = 21
    EditLabel.Width = 74
    EditLabel.Height = 13
    EditLabel.Caption = 'Mail SMTP Port:'
    TabOrder = 2
    Text = '587'
  end
  object edtMailAddress: TLabeledEdit
    Left = 16
    Top = 110
    Width = 161
    Height = 21
    EditLabel.Width = 89
    EditLabel.Height = 13
    EditLabel.Caption = 'Your Mail Address:'
    TabOrder = 3
    Text = 'halilbadem1903@gmail.com'
  end
  object edtMailPassword: TLabeledEdit
    Left = 16
    Top = 155
    Width = 161
    Height = 21
    EditLabel.Width = 96
    EditLabel.Height = 13
    EditLabel.Caption = 'Your Mail Password:'
    TabOrder = 4
    Text = '3965security'
  end
  object edtYourName: TLabeledEdit
    Left = 16
    Top = 200
    Width = 161
    Height = 21
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = 'Your Name:'
    TabOrder = 5
    Text = 'Developer by Halil Han Badem'
  end
  object edtClientMail: TLabeledEdit
    Left = 216
    Top = 24
    Width = 217
    Height = 21
    EditLabel.Width = 49
    EditLabel.Height = 13
    EditLabel.Caption = 'ClientMail:'
    TabOrder = 6
    Text = 'halilhanbadem@gmail.com'
  end
  object memoMailContent: TMemo
    Left = 219
    Top = 67
    Width = 217
    Height = 150
    Lines.Strings = (
      'Bu bir deneme e-postas'#305'd'#305'r.')
    TabOrder = 7
  end
  object edtMailSubject: TLabeledEdit
    Left = 219
    Top = 240
    Width = 214
    Height = 21
    EditLabel.Width = 61
    EditLabel.Height = 13
    EditLabel.Caption = 'Mail Subject:'
    TabOrder = 8
    Text = 'Resim Mail G'#246'nderme Denemesi'
  end
  object edtAttachFilePath: TLabeledEdit
    Left = 15
    Top = 240
    Width = 169
    Height = 21
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'File Path:'
    TabOrder = 9
  end
  object HHBMailSend1: THHBMailSend
    SMTPPort = 0
    ConnectionTimeOut = 0
    Left = 328
    Top = 112
  end
end
