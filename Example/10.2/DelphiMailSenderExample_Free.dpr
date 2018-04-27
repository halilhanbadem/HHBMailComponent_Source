program DelphiMailSenderExample_Free;

uses
  Vcl.Forms,
  untMailSender1 in 'untMailSender1.pas' {frmMailSender};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMailSender, frmMailSender);
  Application.Run;
end.
