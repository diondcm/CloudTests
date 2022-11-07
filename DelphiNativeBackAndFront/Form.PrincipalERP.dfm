object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Meu ERP - TOP'
  ClientHeight = 433
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object memLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 248
    Width = 616
    Height = 182
    Align = alBottom
    Lines.Strings = (
      'memLog')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 32
    Top = 16
    Width = 89
    Height = 33
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object RESTClient1: TRESTClient
    BaseURL = 'http://localhost:7031/api/NovidadesERP'
    Params = <>
    Left = 352
    Top = 144
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'app-key'
        Value = '2beba3a2-a293-450c-96cd-cf7a4c811046'
      end>
    Response = RESTResponse1
    Left = 234
    Top = 130
  end
  object RESTResponse1: TRESTResponse
    Left = 274
    Top = 58
  end
end
