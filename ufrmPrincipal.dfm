object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Monitor de Impressora'
  ClientHeight = 365
  ClientWidth = 666
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblUltimaNota: TLabel
    Left = 8
    Top = 5
    Width = 62
    Height = 13
    Caption = #218'ltima Nota: '
  end
  object lblStatus: TLabel
    Left = 8
    Top = 24
    Width = 38
    Height = 13
    Caption = 'Status: '
  end
  object Label1: TLabel
    Left = 8
    Top = 215
    Width = 38
    Height = 13
    Caption = 'Cozinha'
  end
  object Label2: TLabel
    Left = 8
    Top = 70
    Width = 60
    Height = 13
    Caption = 'Nota Manual'
  end
  object cxButton1: TcxButton
    Left = 550
    Top = 13
    Width = 108
    Height = 25
    Caption = 'Configura'#231#227'o'
    TabOrder = 1
    OnClick = cxButton1Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 89
    Width = 650
    Height = 120
    DataSource = dmDados.dsNota
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGOINTERNO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 358
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD'
        Title.Caption = 'Qtd.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_UNITARIO'
        Title.Caption = 'Valor Unit'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL'
        Title.Caption = 'Total'
        Visible = True
      end>
  end
  object cxCbUsuario: TcxComboBox
    Left = 8
    Top = 43
    Properties.OnCloseUp = cxCbUsuarioPropertiesCloseUp
    TabOrder = 2
    Text = 'cxCbUsuario'
    Width = 145
  end
  object cxButton2: TcxButton
    Left = 550
    Top = 44
    Width = 108
    Height = 25
    Caption = 'Lista'
    TabOrder = 3
    Visible = False
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 234
    Width = 650
    Height = 120
    DataSource = dmDados.dsRestaurante
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGOINTERNO'
        Title.Caption = 'C'#243'digo'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 184
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Title.Caption = 'Observa'#231#227'o'
        Width = 217
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD'
        Title.Caption = 'Qtd.'
        Visible = True
      end>
  end
  object TimeMonitor: TTimer
    OnTimer = TimeMonitorTimer
    Left = 240
    Top = 5
  end
  object TimeCozinha: TTimer
    OnTimer = TimeCozinhaTimer
    Left = 240
    Top = 224
  end
end
