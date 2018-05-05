object frmMailSender: TfrmMailSender
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Example for Delphi XE10.2 Mail Sender -- Halil Han Badem'
  ClientHeight = 336
  ClientWidth = 685
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
    Width = 151
    Height = 13
    Caption = 'Mail Content(HTML Supported):'
  end
  object Label2: TLabel
    Left = 16
    Top = 288
    Width = 243
    Height = 13
    Caption = 'You need to use SSL / TLS supported port number.'
  end
  object btnMailSend: TButton
    Left = 0
    Top = 307
    Width = 685
    Height = 29
    Align = alBottom
    Caption = 'Mail Send'
    TabOrder = 0
    OnClick = btnMailSendClick
    ExplicitTop = 314
    ExplicitWidth = 444
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
    Text = 'yourmail@example.com'
  end
  object edtMailPassword: TLabeledEdit
    Left = 16
    Top = 155
    Width = 161
    Height = 21
    EditLabel.Width = 96
    EditLabel.Height = 13
    EditLabel.Caption = 'Your Mail Password:'
    PasswordChar = '*'
    TabOrder = 4
    Text = 'example'
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
    Text = 'Your Name'
  end
  object edtClientMail: TLabeledEdit
    Left = 216
    Top = 24
    Width = 273
    Height = 21
    EditLabel.Width = 49
    EditLabel.Height = 13
    EditLabel.Caption = 'ClientMail:'
    TabOrder = 6
    Text = 'mail@example.com'
  end
  object memoMailContent: TMemo
    Left = 219
    Top = 67
    Width = 270
    Height = 194
    Lines.Strings = (
      'This is a trial post.<br>'
      ''
      '<b>HTML support is available.</b>')
    TabOrder = 7
  end
  object edtMailSubject: TLabeledEdit
    Left = 16
    Top = 240
    Width = 161
    Height = 21
    EditLabel.Width = 61
    EditLabel.Height = 13
    EditLabel.Caption = 'Mail Subject:'
    TabOrder = 8
    Text = 'HHBMail Component Trial EMail.'
  end
  object FileList: TListBox
    Left = 504
    Top = 67
    Width = 173
    Height = 194
    ItemHeight = 13
    TabOrder = 9
  end
  object btnAddFiles: TButton
    Left = 504
    Top = 22
    Width = 173
    Height = 25
    Caption = 'Add File(s)'
    TabOrder = 10
    OnClick = btnAddFilesClick
  end
  object HHBMailSend1: THHBMailSend
    SMTPPort = 0
    ConnectionTimeOut = 0
    Left = 384
    Top = 216
  end
end
