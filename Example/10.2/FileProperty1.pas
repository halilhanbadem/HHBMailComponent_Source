unit FileProperty1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmFileDescription = class(TForm)
    edtFilePath: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    edtContentType: TLabeledEdit;
    edtContentID: TLabeledEdit;
    OpenDialog1: TOpenDialog;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFileDescription: TfrmFileDescription;

implementation

{$R *.dfm}
  uses untMailSender1;
procedure TfrmFileDescription.Button1Click(Sender: TObject);
begin
  if (Trim(edtFilePath.Text) = '') or (Trim(edtContentType.Text) = '') or (Trim(edtContentID.Text) = '') then
  begin
   MessageBox(handle, 'You should not leave it empty', 'Empty!', MB_OK + mb_IconWarning);
   exit;
  end
  else
  begin
   with frmMailSender.HHBMailSend1 do
   begin
    AttachFiles.Add(edtFilePath.Text);
    AttachFilesType.Add(edtContentType.Text);
    AttachFilesID.Add(edtContentID.Text);
    frmMailSender.FileList.Items.Add(OpenDialog1.FileName);
    edtFilePath.Clear;
    edtContentType.Clear;
    edtContentID.Clear;
    Self.Close;
   end;
  end;
end;

procedure TfrmFileDescription.Button2Click(Sender: TObject);
begin
 with OpenDialog1 do
 begin
   Execute;
   edtFilePath.Text := FileName;
 end;
end;

end.
