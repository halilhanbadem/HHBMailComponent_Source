unit HHBMailSend;


{Hello my friend! Thank you for using the component I wrote. I hope you like it.
 Developer: Halil Han Badem
 Last update date: 25/04/2018  <--- You can change the place if you contribute!
 Written product Delphi XE10.2
 Last developer: If you have contributed, you can write your name here!}


interface

   uses
     System.SysUtils,
     System.Classes,
     Vcl.StdCtrls,
     WinApi.Messages,
     WinApi.Windows,
     Vcl.Dialogs,
     Vcl.Forms,
     IdIOHandler,
     IdIOHandlerSocket,
     IdIOHandlerStack,
     IdSSL,
     IdSSLOpenSSL,
     IdMessage,
     IdBaseComponent,
     IdComponent,
     IdTCPConnection,
     IdTCPClient,
     IdExplicitTLSClientServerBase,
     IdMessageClient,
     IdSMTPBase,
     IdSMTP,
     IdAttachmentFile,
     IdText;

type
 THHBMailSend = Class(TComponent)
   private
     FAuthor: String;
     FMail: String;
     FSMTPHost: String;
     FSMTPPort: Word;
     FSMTPMailAddress: String;
     FSMTPMailPassword: String;
     FMailSubject: String;
     FClientMailAddress: String;
     FClientMailName: String;
     FMailReplyToAddress: String;
     FSMTPName: String;
     FContentID: String;
     FMailContent: TStringList;
     FConnectTimeOut: Integer;
     FAttachFileName: string;
     FAttachType: String;
     SMTPComponent: TIdSMTP;
     EMailComponent: TIdMessage;
     LHandlerComponent: TIdSSLIOHandlerSocketOpenSSL;
     Procedure WLines(Value: TStringList);
   public
     Destructor Destroy; override;
     Constructor Create(AOwner: TComponent); override;
     Procedure Connect;
     Procedure SendMail;
   published
    property AuthorName: String read FAuthor;
    property AuthorMailAddress: String read FMail;
    property SMTPHost: String read FSMTPHost write FSMTPHost;
    property SMTPPort: Word read FSMTPPort write FSMTPPort;
    property SMTPMailAddress: String read FSMTPMailAddress write FSMTPMailAddress;
    property SMTPMailPassword: String read FSMTPMailPassword write FSMTPMailPassword;
    property MailSubject: String read FMailSubject write FMailSubject;
    property ClientMailAddress: String read FClientMailAddress write FClientMailAddress;
    property ClientMailName: String read FClientMailName write FClientMailName;
    property MailReplyToAddress: String read FMailReplyToAddress write FMailReplyToAddress;
    property MailContent: TStringList read FMailContent write WLines;
    property MailName: String read FSMTPName write FSMTPName;
    property ConnectionTimeOut: Integer read FConnectTimeOut write FConnectTimeOut;
    property AttachFile: string read FAttachFileName write FAttachFileName;
    property AttachType: string read FAttachType write FAttachType;
    property AttachFileContentID: string read FContentID write FContentID;
 End;
    Procedure Register;
implementation
     {HBBMailSend}


procedure Register;
begin
  RegisterComponents('HHB Mail Component', [THHBMailSend]);
end;


constructor THHBMailSend.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAuthor := 'Halil Han Badem';    //Please do not change
  FMail := 'halilbadem1903@gmail.com'; //For communication
  FMailContent := TStringList.Create;
  SMTPComponent := TIdSMTP.Create(nil);
  EMailComponent := TIdMessage.Create(nil);
  LHandlerComponent := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
end;

destructor THHBMailSend.Destroy;
begin
  SMTPComponent.Destroy;
  EMailComponent.Destroy;
  LHandlerComponent.Destroy;
  inherited Destroy;
end;

Procedure THHBMailSend.WLines(Value: TStringList);
begin
  FMailContent.Assign(Value);
end;

Procedure THHBMailSend.Connect;
begin
  if SMTPComponent.Connected then SMTPComponent.Disconnect();

   SMTPComponent.Host := FSMTPHost;
   SMTPComponent.AuthType := satDefault;
   SMTPComponent.Username := FSMTPMailAddress;
   SMTPComponent.Password := FSMTPMailPassword;
   SMTPComponent.Port := FSMTPPort;

   LHandlerComponent.Destination := FSMTPHost + ':' + IntToStr(FSMTPPort);
   LHandlerComponent.Host := FSMTPHost;
   LHandlerComponent.Port := FSMTPPort;
   LHandlerComponent.DefaultPort := 0;
   LHandlerComponent.SSLOptions.Method := sslvTLSv1;
   LHandlerComponent.SSLOptions.Mode := sslmUnassigned;
   LHandlerComponent.SSLOptions.VerifyMode := [];
   LHandlerComponent.SSLOptions.VerifyDepth := 0;

   SMTPComponent.IOHandler := LHandlerComponent;
   SMTPComponent.UseTLS := utUseExplicitTLS;
   SMTPComponent.ConnectTimeout := FConnectTimeOut;


   SMTPComponent.Connect;      ///connect...
end;


procedure THHBMailSend.SendMail;
begin
   EMailComponent.Clear;
   EMailComponent.From.Address := FSMTPMailAddress;
   EMailComponent.From.Name := FSMTPName;
   EMailComponent.ReplyTo.EMailAddresses := FMailReplyToAddress;
   EMailComponent.Recipients.Add.Name :=  FClientMailName;
   EMailComponent.Recipients.EMailAddresses := FClientMailAddress;
   EMailComponent.Subject := FMailSubject;
   EMailComponent.ContentType := 'multipart/related; type="text/html"';
   EMailComponent.CharSet := 'utf-8';

   with TIdText.Create(EMailComponent.MessageParts, nil) do
   begin
     Body.Text := FMailContent.Text;
     CharSet := 'utf-8';
     ContentType := 'text/html';
   end;

    if FAttachFileName.Length <> 0 then
   begin
     if FileExists(FAttachFileName, True) = True then
     begin
       with TIdAttachmentFile.Create(EMailComponent.MessageParts, FAttachFileName) do
      begin
       ContentType := FAttachType;
       ContentID := FContentID;
       DisplayName := ExtractFileName(FAttachFileName);
       FileName := ExtractFileName(FAttachFileName);
      end;
     end;
   end;

   EMailComponent.Body.Text := FMailContent.Text;

   SMTPComponent.Send(EMailComponent);

end;
end.
