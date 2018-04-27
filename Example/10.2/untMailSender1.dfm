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
  end
  object memoMailContent: TMemo
    Left = 219
    Top = 67
    Width = 217
    Height = 150
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
  end
  object HBBMailSend1: THBBMailSend
    SMTPPort = 0
    MailContentType = TextType
    MailContentCharSet = utf8
    Left = 208
    Top = 168
  end
end
