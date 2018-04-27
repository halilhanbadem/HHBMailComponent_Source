unit untMailSender1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, HHBMailSend, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMailSender = class(TForm)
    btnMailSend: TButton;
    edtSMTPAddress: TLabeledEdit;
    edtSMTPPort: TLabeledEdit;
    edtMailAddress: TLabeledEdit;
    edtMailPassword: TLabeledEdit;
    edtYourName: TLabeledEdit;
    edtClientMail: TLabeledEdit;
    memoMailContent: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    edtMailSubject: TLabeledEdit;
    edtAttachFilePath: TLabeledEdit;
    HHBMailSend1: THHBMailSend;
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
 with HHBMailSend1 do
 begin
   SMTPHost := edtSMTPAddress.Text; //Not just Google; you can experiment in Yandex or Hotmail!
   SMTPPort := StrToInt(edtSMTPPort.Text);  //Search with Google to find the appropriate port! e.g "Google SMTP settings"
   SMTPMailAddress := edtMailAddress.Text ; //Enter the e-mail address.
   SMTPMailPassword := edtMailPassword.Text; //Enter the e-mail password.
   MailName := edtYourName.Text; //Enter the name you want to show.

   ClientMailName := 'ClientName'; //Enter the client name
   ClientMailAddress := edtClientMail.Text; //Enter the client mail address
   MailContent.Text := memoMailContent.Lines.Text; //Enter the mail content.
   MailSubject := edtMailSubject.Text;  // Enter the mail subject.
   AttachFile := edtAttachFilePath.Text;

   Connect;  //Connecting...
   SendMail; //Sending...
 end;
end;

end.
