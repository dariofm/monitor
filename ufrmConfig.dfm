object frmConfig: TfrmConfig
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Configura'#231#227'o'
  ClientHeight = 294
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 257
    Width = 661
    Height = 1
    Align = alTop
    ExplicitWidth = 580
  end
  object cxButton1: TcxButton
    Left = 8
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 661
    Height = 257
    Align = alTop
    TabOrder = 1
    Properties.ActivePage = cxTabSheet2
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 257
    ClientRectRight = 661
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'Monitor'
      ImageIndex = 0
      object Label4: TLabel
        Left = 8
        Top = 8
        Width = 54
        Height = 13
        Caption = 'Impressora'
      end
      object Label1: TLabel
        Left = 89
        Top = 65
        Width = 254
        Height = 13
        Caption = 'Tempo de Monitoramento de impress'#227'o em segundos'
        Transparent = True
      end
      object Label2: TLabel
        Left = 89
        Top = 93
        Width = 257
        Height = 13
        Caption = 'Tempo de Monitoramento do Banco ERP em segundos'
        Transparent = True
      end
      object Label13: TLabel
        Left = 8
        Top = 144
        Width = 111
        Height = 13
        Caption = #218'ltima Nota Manual Erp'
      end
      object cxBoxImpressora: TcxComboBox
        Left = 8
        Top = 27
        Properties.DropDownListStyle = lsEditFixedList
        TabOrder = 0
        Width = 202
      end
      object SpinTempo: TSpinEdit
        Left = 8
        Top = 56
        Width = 75
        Height = 22
        MaxValue = 999
        MinValue = 1
        TabOrder = 1
        Value = 1
      end
      object SpinEdit1: TSpinEdit
        Left = 8
        Top = 84
        Width = 75
        Height = 22
        MaxValue = 999
        MinValue = 1
        TabOrder = 2
        Value = 1
      end
      object cxButton2: TcxButton
        Left = 8
        Top = 112
        Width = 113
        Height = 25
        Caption = 'Editor de Impresso'
        TabOrder = 3
        OnClick = cxButton2Click
      end
      object cxDBSpinEdit1: TcxDBSpinEdit
        Left = 8
        Top = 163
        DataBinding.DataField = 'CONTROLE'
        DataBinding.DataSource = DataSource2
        Properties.ImmediatePost = True
        Properties.MinValue = 1.000000000000000000
        TabOrder = 4
        Width = 121
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Dados ERP'
      ImageIndex = 1
      object Label3: TLabel
        Left = 8
        Top = 0
        Width = 29
        Height = 13
        Caption = 'NOME'
        FocusControl = cxDBTextEdit1
      end
      object Label5: TLabel
        Left = 8
        Top = 40
        Width = 79
        Height = 13
        Caption = 'NOMEFANTASIA'
        FocusControl = cxDBTextEdit2
      end
      object Label6: TLabel
        Left = 8
        Top = 80
        Width = 50
        Height = 13
        Caption = 'TELEFONE'
        FocusControl = cxDBTextEdit3
      end
      object Label7: TLabel
        Left = 111
        Top = 80
        Width = 25
        Height = 13
        Caption = 'CNPJ'
        FocusControl = cxDBTextEdit4
      end
      object Label8: TLabel
        Left = 8
        Top = 123
        Width = 54
        Height = 13
        Caption = 'ENDERECO'
        FocusControl = cxDBTextEdit5
      end
      object Label9: TLabel
        Left = 281
        Top = 126
        Width = 43
        Height = 13
        Caption = 'NUMERO'
        FocusControl = cxDBTextEdit6
      end
      object Label10: TLabel
        Left = 330
        Top = 126
        Width = 39
        Height = 13
        Caption = 'BAIRRO'
        FocusControl = cxDBTextEdit7
      end
      object Label11: TLabel
        Left = 456
        Top = 126
        Width = 19
        Height = 13
        Caption = 'CEP'
        FocusControl = cxDBTextEdit8
      end
      object Label12: TLabel
        Left = 535
        Top = 126
        Width = 38
        Height = 13
        Caption = 'CIDADE'
        FocusControl = cxDBTextEdit9
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 8
        Top = 16
        DataBinding.DataField = 'NOME'
        DataBinding.DataSource = DataSource1
        TabOrder = 0
        Width = 329
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 8
        Top = 56
        DataBinding.DataField = 'NOMEFANTASIA'
        DataBinding.DataSource = DataSource1
        TabOrder = 1
        Width = 329
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 8
        Top = 96
        DataBinding.DataField = 'TELEFONE'
        DataBinding.DataSource = DataSource1
        TabOrder = 2
        Width = 97
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 111
        Top = 96
        DataBinding.DataField = 'CNPJ'
        DataBinding.DataSource = DataSource1
        TabOrder = 3
        Width = 121
      end
      object cxDBTextEdit5: TcxDBTextEdit
        Left = 8
        Top = 142
        DataBinding.DataField = 'ENDERECO'
        DataBinding.DataSource = DataSource1
        TabOrder = 4
        Width = 267
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 281
        Top = 142
        DataBinding.DataField = 'NUMERO'
        DataBinding.DataSource = DataSource1
        TabOrder = 5
        Width = 43
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 330
        Top = 142
        DataBinding.DataField = 'BAIRRO'
        DataBinding.DataSource = DataSource1
        TabOrder = 6
        Width = 121
      end
      object cxDBTextEdit8: TcxDBTextEdit
        Left = 456
        Top = 142
        DataBinding.DataField = 'CEP'
        DataBinding.DataSource = DataSource1
        TabOrder = 7
        Width = 73
      end
      object cxDBTextEdit9: TcxDBTextEdit
        Left = 535
        Top = 142
        DataBinding.DataField = 'CIDADE'
        DataBinding.DataSource = DataSource1
        TabOrder = 8
        Width = 121
      end
      object cxButton3: TcxButton
        Left = 8
        Top = 176
        Width = 75
        Height = 25
        Caption = 'Carregar'
        TabOrder = 9
        OnClick = cxButton3Click
      end
    end
  end
  object frxDBDatasetCupom: TfrxDBDataset
    UserName = 'cupom'
    CloseDataSource = False
    DataSource = dmDados.dsNota
    BCDToCurrency = False
    Left = 456
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = dmDados.tblEmitente
    Left = 560
    Top = 192
  end
  object TimerAtualizaCadastro: TTimer
    Enabled = False
    Interval = 20000
    Left = 592
    Top = 88
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 520
    Top = 80
  end
  object DataSource2: TDataSource
    DataSet = dmDados.tblParam
    Left = 480
    Top = 192
  end
end
