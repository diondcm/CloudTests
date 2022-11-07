program functionDelphiAzure;
{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  System.Types,
  IPPeerServer,
  IPPeerAPI,
  IdHTTPWebBrokerBridge,
  Web.WebReq,
  Web.WebBroker,
  WebModuleUnitAzureDelphi in 'WebModuleUnitAzureDelphi.pas' {WebModule2: TWebModule},
  ServerConstDelphiAzure in 'ServerConstDelphiAzure.pas',
  Classes.Validation in 'Classes.Validation.pas',
  Classes.Atualizacoes in 'Classes.Atualizacoes.pas';

{$R *.res}

function BindPort(APort: Integer): Boolean;
var
  LTestServer: IIPTestServer;
begin
  Result := True;
  try
    LTestServer := PeerFactory.CreatePeer('', IIPTestServer) as IIPTestServer;
    LTestServer.TestOpenPort(APort, nil);
  except
    Result := False;
  end;
end;

function CheckPort(APort: Integer): Integer;
begin
  if BindPort(APort) then
    Result := APort
  else
    Result := 0;
end;

procedure SetPort(const AServer: TIdHTTPWebBrokerBridge; APort: String);
begin
  if not AServer.Active then
  begin
    APort := APort.Replace(cCommandSetPort, '').Trim;
    if CheckPort(APort.ToInteger) > 0 then
    begin
      AServer.DefaultPort := APort.ToInteger;
    end;
  end;
end;

procedure StartServer(const AServer: TIdHTTPWebBrokerBridge);
begin
  if not AServer.Active then
  begin
    if CheckPort(AServer.DefaultPort) > 0 then
    begin
      AServer.Bindings.Clear;
      AServer.Active := True;
    end;
  end;
end;

procedure StopServer(const AServer: TIdHTTPWebBrokerBridge);
begin
  if AServer.Active then
  begin
    AServer.Active := False;
    AServer.Bindings.Clear;
  end;
end;

procedure RunServer(APort: Integer);
var
  LServer: TIdHTTPWebBrokerBridge;
  LResponse: string;
begin
  LServer := TIdHTTPWebBrokerBridge.Create(nil);
  try
    var portEnvVarStr: string := GetEnvironmentVariable('FUNCTIONS_CUSTOMHANDLER_PORT');
    var portEnvVar: Integer;
    if TryStrToInt(portEnvVarStr, portEnvVar) then
    begin
      LServer.DefaultPort := portEnvVar;
    end else begin
      LServer.DefaultPort := APort;
    end;

    StartServer(LServer);
    while True do
    begin
      //
    end;

  finally
    StopServer(LServer);
    LServer.Free;
  end;
end;

begin
  try
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
    RunServer(8080);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end
end.
