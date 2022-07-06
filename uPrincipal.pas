unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.FileCtrl, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, Vcl.Grids,
  Vcl.Outline, Vcl.Samples.DirOutln;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    butConectar: TButton;
    butDesconectar: TButton;
    butUpload: TButton;
    butDownload: TButton;
    FTPconexao: TIdFTP;
    Panel2: TPanel;
    labelDiretorio: TLabel;
    Memo1: TMemo;
    EdtEndereco: TEdit;
    Label2: TLabel;
    ButDeletarDiretorio: TButton;
    EdtNovoEndereco: TEdit;
    Label3: TLabel;
    ButCriarDiretorio: TButton;
    ListServidor: TListBox;
    ListArquivolocal: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    EdtBusca: TEdit;
    procedure ButCriarDiretorioClick(Sender: TObject);
    procedure ButDeletarDiretorioClick(Sender: TObject);
    procedure butUploadClick(Sender: TObject);
    procedure butConectarClick(Sender: TObject);
    procedure butDesconectarClick(Sender: TObject);
    procedure FTPconexaoStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure butDownloadClick(Sender: TObject);
    procedure EdtBuscaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.butConectarClick(Sender: TObject);
begin
 try
    if not FTPconexao.Connected then
    begin
      FTPconexao.Host := 'localhost';
      FTPconexao.Username := 'LucasPC';
      FTPconexao.Password := '123';
      FTPconexao.Port := 21;
      FTPconexao.Connect;
//      FTPconexao.List(TreeView1.Items, '', false);
      FTPconexao.List(ListServidor.Items, '', False);

      butConectar.Enabled := false;
      butDesconectar.Enabled := True;
      butUpload.Enabled := True;
      butDownload.Enabled := True;

    end;

 except
    on E:Exception do
    begin
      MessageDlg('Erro na Conexão!', mtError, [mbOK], 0);
      butConectar.Enabled := True;
      butDesconectar.Enabled := False;
      butUpload.Enabled := False;
      butDownload.Enabled := False;
    end;
 end;
end;

procedure TForm1.ButCriarDiretorioClick(Sender: TObject);
begin
  try
     FTPconexao.Connect;
     FTPconexao.MakeDir(EdtEndereco.Text + '/' + EdtNovoEndereco.Text);
  finally
    FTPconexao.Disconnect;
  end;
end;

procedure TForm1.ButDeletarDiretorioClick(Sender: TObject);
begin
 Try
      FTPconexao.Connect;
      FTPconexao.Delete(EdtEndereco.Text);
   Finally
      FTPconexao.Disconnect;
   End;
end;

procedure TForm1.butDesconectarClick(Sender: TObject);
begin

 try
  if FTPconexao.Connected then
  begin
    FTPconexao.Disconnect;
    ListServidor.Clear;
    butConectar.Enabled := True;
    butDesconectar.Enabled := False;
    butUpload.Enabled := False;
    butDownload.Enabled := False;
  end;
 Except
   on E:Exception do
   begin
     MessageDlg('Erro ao Desconectar!', mtError, [mbOK], 0);
     butConectar.Enabled := True;
     butDesconectar.Enabled := False;
     butUpload.Enabled := False;
     butDownload.Enabled := False
   end;

 end;
end;

procedure TForm1.butDownloadClick(Sender: TObject);
begin
 FTPconexao.Get(ListServidor.Items[ListServidor.ItemIndex], ListServidor.Items[ListServidor.ItemIndex], false, true);
 ListArquivolocal.ApplyFilePath(EdtBusca.Text);
 ListArquivolocal.Update;
end;

procedure TForm1.butUploadClick(Sender: TObject);
begin
   FTPconexao.Put(ListArquivolocal.FileName, '', False);

   FTPconexao.List(ListServidor.Items, '', False);


end;

procedure TForm1.EdtBuscaChange(Sender: TObject);
begin
 ListArquivolocal.ApplyFilePath(EdtBusca.Text);


end;

procedure TForm1.FTPconexaoStatus(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
 StatusBar1.Panels[1].Text := AStatusText;
end;

end.
