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
     IdSMTP;

type
 FContentType = (TextType, HTML);
 FCharSet = (utf8);
 THBBMailSend = Class(TComponent)
   private
     PAuthor: String;
     PMail: String;
     PSMTPHost: String;
     PSMTPPort: Word;
     PSMTPMailAddress: String;
     PSMTPMailPassword: String;
     PMailSubject: String;
     PClientMailAddress: String;
     PClientMailName: String;
     PMailReplyToAddress: String;
     PSMTPName: String;
     PMailContent: TStringList;
     PMailContentType: FContentType;
     PCharSet: FCharSet;
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
    property AuthorName: String read PAuthor;
    property AuthorMailAddress: String read PMail;
    property SMTPHost: String read PSMTPHost write PSMTPHost;
    property SMTPPort: Word read PSMTPPort write PSMTPPort;
    property SMTPMailAddress: String read PSMTPMailAddress write PSMTPMailAddress;
    property SMTPMailPassword: String read PSMTPMailPassword write PSMTPMailPassword;
    property MailSubject: String read PMailSubject write PMailSubject;
    property ClientMailAddress: String read PClientMailAddress write PClientMailAddress;
    property ClientMailName: String read PClientMailName write PClientMailName;
    property MailReplyToAddress: String read PMailReplyToAddress write PMailReplyToAddress;
    property MailContent: TStringList read PMailContent write WLines;
    property MailContentType: FContentType read PMailContentType write PMailContentType;
    property MailContentCharSet: FCharSet read PCharSet write PCharSet;
    property MailName: String read PSMTPName write PSMTPName;
 End;
    Procedure Register;
implementation
     {HBBMailSend}

procedure Register;
begin
  RegisterComponents('HHB Mail Component', [THBBMailSend]);
end;


constructor THBBMailSend.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  PAuthor := 'Halil Han Badem';    //Please do not change
  PMail := 'halilbadem1903@gmail.com'; //For communication
  PMailContent := TStringList.Create;
  SMTPComponent := TIdSMTP.Create(nil);
  EMailComponent := TIdMessage.Create(nil);
  LHandlerComponent := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
end;

destructor THBBMailSend.Destroy;
begin
  inherited Destroy;
end;

Procedure THBBMailSend.WLines(Value: TStringList);
begin
  PMailContent.Assign(Value);
end;

Procedure THBBMailSend.Connect;
begin
  if SMTPComponent.Connected then SMTPComponent.Disconnect();

   SMTPComponent.Host := PSMTPHost;
   SMTPComponent.AuthType := satDefault;
   SMTPComponent.Username := PSMTPMailAddress;
   SMTPComponent.Password := PSMTPMailPassword;
   SMTPComponent.Port := PSMTPPort;

   LHandlerComponent.Destination := PSMTPHost + ':' + IntToStr(PSMTPPort);
   LHandlerComponent.Host := PSMTPHost;
   LHandlerComponent.Port := PSMTPPort;
   LHandlerComponent.DefaultPort := 0;
   LHandlerComponent.SSLOptions.Method := sslvTLSv1;
   LHandlerComponent.SSLOptions.Mode := sslmUnassigned;
   LHandlerComponent.SSLOptions.VerifyMode := [];
   LHandlerComponent.SSLOptions.VerifyDepth := 0;

   SMTPComponent.IOHandler := LHandlerComponent;
   SMTPComponent.UseTLS := utUseExplicitTLS;
   SMTPComponent.ConnectTimeout := 10000;


   SMTPComponent.Connect;      ///connect...
end;


procedure THBBMailSend.SendMail;
begin
   EMailComponent.Clear;
   EMailComponent.From.Address := PSMTPMailAddress;
   EMailComponent.From.Name := PSMTPName;
   EMailComponent.ReplyTo.EMailAddresses := PMailReplyToAddress;
   EMailComponent.Recipients.Add.Name :=  PClientMailName;
   EMailComponent.Recipients.EMailAddresses := PClientMailAddress;
   EMailComponent.Subject := PMailSubject;

   if (FContentType.TextType = TextType) then
   begin
    EMailComponent.ContentType := 'text/plain';
   end;

   if FContentType.HTML = HTML then
   begin
     EMailComponent.ContentType := 'text/html'
   end;

    if PCharSet = utf8 then   //just only
   begin
      EMailComponent.CharSet := 'UTF-8';
   end;

   EMailComponent.Body.Text := PMailContent.Text;

   SMTPComponent.Send(EMailComponent);
end;
end.
