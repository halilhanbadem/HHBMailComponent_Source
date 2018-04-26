object frmMailSender: TfrmMailSender
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Example for Delphi XE10.2 Mail Sender -- Halil Han Badem'
  ClientHeight = 215
  ClientWidth = 455
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
    Left = 88
    Top = 48
    Width = 302
    Height = 65
    Caption = 
      'This example application is only typographically encoded. '#13'You c' +
      'an easily change it from the property section if you want.'#13#13'NOTE' +
      ': Delete the codes in the code section first. '#13'NOTE: Just keep "' +
      'Connect" and "SendMail" constants.'
  end
  object btnMailSend: TButton
    Left = 0
    Top = 186
    Width = 455
    Height = 29
    Align = alBottom
    Caption = 'Mail Send'
    TabOrder = 0
    OnClick = btnMailSendClick
    ExplicitTop = 184
    ExplicitWidth = 453
  end
  object HBBMailSend1: THBBMailSend
    SMTPPort = 0
    MailContentType = TextType
    MailContentCharSet = utf8
    Left = 24
    Top = 32
  end
end
