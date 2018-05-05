program DelphiMailSenderExample_Free;

uses
  Vcl.Forms,
  untMailSender1 in 'untMailSender1.pas' {frmMailSender},
  FileProperty1 in 'FileProperty1.pas' {frmFileDescription};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMailSender, frmMailSender);
  Application.CreateForm(TfrmFileDescription, frmFileDescription);
  Application.Run;
end.
