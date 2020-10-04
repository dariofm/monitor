object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Monitor de Impressora'
  ClientHeight = 307
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblUltimaNota: TLabel
    Left = 8
    Top = 8
    Width = 62
    Height = 13
    Caption = #218'ltima Nota: '
  end
  object lblStatus: TLabel
    Left = 8
    Top = 27
    Width = 38
    Height = 13
    Caption = 'Status: '
  end
  object cxButton1: TcxButton
    Left = 416
    Top = 8
    Width = 108
    Height = 25
    Caption = 'Configura'#231#227'o'
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 88
    Width = 516
    Height = 211
    DataSource = dmDados.dsNota
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object cxCbUsuario: TcxComboBox
    Left = 8
    Top = 61
    TabOrder = 2
    Text = 'cxCbUsuario'
    Width = 145
  end
  object TimeMonitor: TTimer
    OnTimer = TimeMonitorTimer
    Left = 240
    Top = 8
  end
end
