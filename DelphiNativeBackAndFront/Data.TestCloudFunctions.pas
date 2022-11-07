unit Data.TestCloudFunctions;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.Notifications;

type
  TCloudType = (None, Azure, AWS, GoogleCloud, OracleCloud, AlibabaCloud);

  TdmdTestCloudFunctions = class(TDataModule)
    RESTResponseAzure: TRESTResponse;
    RESTRequestAzure: TRESTRequest;
    RESTClientAzure: TRESTClient;
  private
    FCloudProvedorType: TCloudType;
    procedure GetAzureVersionUpdates;
  public
    procedure GetVersionUpdates;
    property CloudProvedorType: TCloudType read FCloudProvedorType write FCloudProvedorType;
  end;

var
  dmdTestCloudFunctions: TdmdTestCloudFunctions;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdTestCloudFunctions.GetAzureVersionUpdates;
begin
  RESTRequestAzure.Execute;
  var jsonContent: string := RESTResponseAzure.Content;

  if jsonContent <> '' then
  begin

  end else begin
    dmdNotifications.Send('Sem resposta!', 'Não foi possível verificar novidades da versão');
  end;
end;

procedure TdmdTestCloudFunctions.GetVersionUpdates;
begin
  case FCloudProvedorType of
    None: ;
    Azure: GetAzureVersionUpdates;
    AWS: ;
    GoogleCloud: ;
    OracleCloud: ;
    AlibabaCloud: ;
  end;
end;

end.
