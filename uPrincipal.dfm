object Form1: TForm1
  Left = 0
  Top = 0
  Cursor = crHandPoint
  BorderStyle = bsSingle
  Caption = 'Formul'#225'rio Cliente FTP'
  ClientHeight = 529
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 679
    Height = 98
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 40
      Top = 16
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label3: TLabel
      Left = 16
      Top = 51
      Width = 69
      Height = 13
      Caption = 'Novo Diret'#243'rio'
    end
    object EdtEndereco: TEdit
      Left = 91
      Top = 13
      Width = 233
      Height = 21
      TabOrder = 0
      Text = '*.*'
    end
    object ButDeletarDiretorio: TButton
      Left = 330
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Deletar'
      TabOrder = 1
      OnClick = ButDeletarDiretorioClick
    end
    object EdtNovoEndereco: TEdit
      Left = 91
      Top = 48
      Width = 233
      Height = 21
      TabOrder = 2
    end
    object ButCriarDiretorio: TButton
      Left = 330
      Top = 46
      Width = 75
      Height = 25
      Caption = 'Criar'
      TabOrder = 3
      OnClick = ButCriarDiretorioClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 510
    Width = 679
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'Status FTP'
        Width = 100
      end
      item
        Width = 200
      end>
  end
  object Panel3: TPanel
    Left = 426
    Top = 206
    Width = 253
    Height = 301
    TabOrder = 2
    object ListServidor: TListBox
      Left = 1
      Top = 3
      Width = 249
      Height = 296
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object butConectar: TButton
    Left = 302
    Top = 206
    Width = 110
    Height = 45
    Cursor = crHandPoint
    Caption = 'Conectar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = butConectarClick
  end
  object butDesconectar: TButton
    Left = 302
    Top = 257
    Width = 110
    Height = 45
    Cursor = crHandPoint
    Caption = 'Desconectar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = butDesconectarClick
  end
  object butUpload: TButton
    Left = 302
    Top = 308
    Width = 110
    Height = 45
    Cursor = crHandPoint
    Caption = 'Upload'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = butUploadClick
  end
  object butDownload: TButton
    Left = 302
    Top = 359
    Width = 110
    Height = 45
    Cursor = crHandPoint
    Caption = 'Download'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = butDownloadClick
  end
  object Panel2: TPanel
    Left = 0
    Top = 203
    Width = 280
    Height = 307
    TabOrder = 7
    object labelDiretorio: TLabel
      Left = 40
      Top = 5
      Width = 51
      Height = 13
      Caption = 'c:\plussoft'
    end
    object ListArquivolocal: TFileListBox
      Left = 148
      Top = 54
      Width = 130
      Height = 247
      ItemHeight = 13
      TabOrder = 0
    end
    object DirectoryListBox1: TDirectoryListBox
      Left = 2
      Top = 54
      Width = 145
      Height = 247
      DirLabel = labelDiretorio
      FileList = ListArquivolocal
      TabOrder = 1
    end
    object EdtBusca: TEdit
      Left = 0
      Top = 27
      Width = 280
      Height = 21
      TabOrder = 2
      Text = '*.*'
      OnChange = EdtBuscaChange
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 104
    Width = 679
    Height = 95
    Lines.Strings = (
      'Memo1')
    TabOrder = 8
  end
  object FTPconexao: TIdFTP
    OnStatus = FTPconexaoStatus
    IPVersion = Id_IPv4
    ConnectTimeout = 0
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 200
    Top = 128
  end
end
