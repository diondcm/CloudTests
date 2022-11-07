object dmdTestCloudFunctions: TdmdTestCloudFunctions
  OldCreateOrder = True
  Height = 297
  Width = 756
  object RESTResponseAzure: TRESTResponse
    Left = 90
    Top = 98
  end
  object RESTRequestAzure: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClientAzure
    Method = rmPOST
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'app-key'
        Value = '2beba3a2-a293-450c-96cd-cf7a4c811046'
      end>
    Response = RESTResponseAzure
    Left = 34
    Top = 178
  end
  object RESTClientAzure: TRESTClient
    BaseURL = 'http://localhost:7031/api/NovidadesERP'
    Params = <>
    Left = 160
    Top = 176
  end
end
