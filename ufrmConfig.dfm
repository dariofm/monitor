object frmConfig: TfrmConfig
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Configura'#231#227'o'
  ClientHeight = 302
  ClientWidth = 661
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
  object Shape1: TShape
    Left = 0
    Top = 263
    Width = 661
    Height = 1
    Align = alTop
    ExplicitTop = 257
    ExplicitWidth = 580
  end
  object cxButton1: TcxButton
    Left = 8
    Top = 269
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
    Height = 263
    Align = alTop
    TabOrder = 1
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 263
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
        Left = 92
        Top = 106
        Width = 254
        Height = 13
        Caption = 'Tempo de Monitoramento de impress'#227'o em segundos'
        Transparent = True
      end
      object Label14: TLabel
        Left = 216
        Top = 8
        Width = 153
        Height = 13
        Caption = 'Pedir confirma'#231#227'o de Impress'#227'o'
        Transparent = True
      end
      object Label15: TLabel
        Left = 130
        Top = 207
        Width = 190
        Height = 13
        Caption = 'Exige previl'#233'gio de Administrador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 496
        Top = 8
        Width = 92
        Height = 13
        Caption = 'Tipo de Documento'
        Visible = False
      end
      object Label13: TLabel
        Left = 8
        Top = 51
        Width = 60
        Height = 13
        Caption = 'Restaurante'
      end
      object Label16: TLabel
        Left = 216
        Top = 54
        Width = 153
        Height = 13
        Caption = 'Pedir confirma'#231#227'o de Impress'#227'o'
        Transparent = True
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
        Top = 97
        Width = 75
        Height = 22
        MaxValue = 999
        MinValue = 1
        TabOrder = 1
        Value = 1
      end
      object cxButton2: TcxButton
        Left = 8
        Top = 125
        Width = 113
        Height = 25
        Caption = 'Editor de Impresso'
        TabOrder = 2
        OnClick = cxButton2Click
      end
      object cxCbConfirmImp: TcxComboBox
        Left = 216
        Top = 27
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 3
        Text = 'Sim'
        Width = 121
      end
      object cxButton4: TcxButton
        Left = 8
        Top = 202
        Width = 113
        Height = 25
        Caption = 'Instalar Servi'#231'o'
        TabOrder = 4
        OnClick = cxButton4Click
      end
      object cxBoxImpressoraRestaurante: TcxComboBox
        Left = 8
        Top = 70
        TabOrder = 5
        Text = 'cxBoxImpressoraRestaurante'
        Width = 202
      end
      object cxCbConfirmaImpCoz: TcxComboBox
        Left = 216
        Top = 73
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 6
        Text = 'Sim'
        Width = 121
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Dados ERP'
      ImageIndex = 1
      object Label3: TLabel
        Left = 8
        Top = 13
        Width = 29
        Height = 13
        Caption = 'NOME'
        FocusControl = cxDBTextEdit1
      end
      object Label5: TLabel
        Left = 8
        Top = 53
        Width = 79
        Height = 13
        Caption = 'NOMEFANTASIA'
        FocusControl = cxDBTextEdit2
      end
      object Label6: TLabel
        Left = 8
        Top = 93
        Width = 50
        Height = 13
        Caption = 'TELEFONE'
        FocusControl = cxDBTextEdit3
      end
      object Label7: TLabel
        Left = 111
        Top = 93
        Width = 25
        Height = 13
        Caption = 'CNPJ'
        FocusControl = cxDBTextEdit4
      end
      object Label8: TLabel
        Left = 8
        Top = 136
        Width = 54
        Height = 13
        Caption = 'ENDERECO'
        FocusControl = cxDBTextEdit5
      end
      object Label9: TLabel
        Left = 281
        Top = 139
        Width = 43
        Height = 13
        Caption = 'NUMERO'
        FocusControl = cxDBTextEdit6
      end
      object Label10: TLabel
        Left = 330
        Top = 139
        Width = 39
        Height = 13
        Caption = 'BAIRRO'
        FocusControl = cxDBTextEdit7
      end
      object Label11: TLabel
        Left = 456
        Top = 139
        Width = 19
        Height = 13
        Caption = 'CEP'
        FocusControl = cxDBTextEdit8
      end
      object Label12: TLabel
        Left = 535
        Top = 139
        Width = 38
        Height = 13
        Caption = 'CIDADE'
        FocusControl = cxDBTextEdit9
      end
      object lblsStatus: TLabel
        Left = 84
        Top = 214
        Width = 161
        Height = 13
        AutoSize = False
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 8
        Top = 29
        DataBinding.DataField = 'NOME'
        DataBinding.DataSource = DataSource1
        TabOrder = 0
        Width = 329
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 8
        Top = 69
        DataBinding.DataField = 'NOMEFANTASIA'
        DataBinding.DataSource = DataSource1
        TabOrder = 1
        Width = 329
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 8
        Top = 109
        DataBinding.DataField = 'TELEFONE'
        DataBinding.DataSource = DataSource1
        TabOrder = 2
        Width = 97
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 111
        Top = 109
        DataBinding.DataField = 'CNPJ'
        DataBinding.DataSource = DataSource1
        TabOrder = 3
        Width = 121
      end
      object cxDBTextEdit5: TcxDBTextEdit
        Left = 8
        Top = 155
        DataBinding.DataField = 'ENDERECO'
        DataBinding.DataSource = DataSource1
        TabOrder = 4
        Width = 267
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 281
        Top = 155
        DataBinding.DataField = 'NUMERO'
        DataBinding.DataSource = DataSource1
        TabOrder = 5
        Width = 43
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 330
        Top = 155
        DataBinding.DataField = 'BAIRRO'
        DataBinding.DataSource = DataSource1
        TabOrder = 6
        Width = 121
      end
      object cxDBTextEdit8: TcxDBTextEdit
        Left = 456
        Top = 155
        DataBinding.DataField = 'CEP'
        DataBinding.DataSource = DataSource1
        TabOrder = 7
        Width = 73
      end
      object cxDBTextEdit9: TcxDBTextEdit
        Left = 535
        Top = 155
        DataBinding.DataField = 'CIDADE'
        DataBinding.DataSource = DataSource1
        TabOrder = 8
        Width = 121
      end
      object cxButton3: TcxButton
        Left = 583
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Carregar'
        TabOrder = 9
        OnClick = cxButton3Click
      end
    end
  end
  object cxComboBox1: TcxComboBox
    Left = 480
    Top = 51
    TabOrder = 2
    Text = 'NotaFiscalManual'
    Visible = False
    Width = 121
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
  object DataSource3: TDataSource
    DataSet = dmDados.tblParam
    Left = 488
    Top = 200
  end
  object frxDBDatasetCozinh: TfrxDBDataset
    UserName = 'Cozinha'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'NUMERO=NUMERO'
      'EMISSAO=EMISSAO'
      'CODIGOINTERNO=CODIGOINTERNO'
      'DESCRICAO=DESCRICAO'
      'UND=UND'
      'QTD=QTD'
      'VALOR_UNITARIO=VALOR_UNITARIO'
      'VALOR_TOTAL=VALOR_TOTAL'
      'USUARIO=USUARIO'
      'IMPRESSO=IMPRESSO'
      'OBS=OBS')
    DataSource = dmDados.dsRestaurante
    BCDToCurrency = False
    Left = 448
    Top = 152
  end
end
