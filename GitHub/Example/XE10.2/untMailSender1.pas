unit untMailSender1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, HHBMailSend, Vcl.StdCtrls;

type
  TfrmMailSender = class(TForm)
    btnMailSend: TButton;
    HBBMailSend1: THBBMailSend;
    Label1: TLabel;
    procedure btnMailSendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMailSender: TfrmMailSender;

implementation

{$R *.dfm}

procedure TfrmMailSender.btnMailSendClick(Sender: TObject);
begin
 with HBBMailSend1 do
 begin
   SMTPHost := 'smtp.gmail.com'; //Not just Google; you can experiment in Yandex or Hotmail!
   SMTPPort := 587;  //Search with Google to find the appropriate port! e.g "Google SMTP settings"
   SMTPMailAddress := 'yourmail'; //Enter the e-mail address.
   SMTPMailPassword := 'yourpassword'; //Enter the e-mail password.
   MailName := 'Halil Han Badem'; //Enter the name you want to show.

   ClientMailName := 'ClientName'; //Enter the client name
   ClientMailAddress := 'ClientMail'; //Enter the client mail address
   MailContentType := HTML;  //Enter the mail content type "HTML" or "TextType"
   MailContent.Text := '<h1>This is a heading</h1>'; //Enter the mail content.
   MailSubject := 'Example for Delphi Mail Sender';  // Enter the mail subject.

   Connect;  //Connecting...
   SendMail; //Sending...
 end;
end;

end.
