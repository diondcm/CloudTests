unit WebModuleUnitAzureDelphi;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Classes.Atualizacoes, System.JSON, REST.Json,
  Classes.Validation;

type
  TWebModule2 = class(TWebModule)
    procedure WebModule2DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule2;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}


procedure GravaLog(text: string);
begin
  var stlLog: TStringList := TStringList.Create;

  if FileExists('logExec.txt') then
  begin
    stlLog.LoadFromFile('logExec.txt');
  end;

  stlLog.Insert(0, TimeToStr(Now) + ' - ' + text);

  stlLog.SaveToFile('logExec.txt');

  stlLog.Free;
end;

procedure TWebModule2.WebModule2DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);

  procedure CopyAtualizacoes(nov: TNovidades; atu: TAtualizacoes);
  begin
    nov.Atualizacoes.Boletos := atu.Boletos;
    nov.Atualizacoes.Dashboards := atu.Dashboards;
    nov.Atualizacoes.Relatórios := atu.Relatórios;
  end;

begin
  var appKey : string := Request.GetFieldByName('app-key');
  var nov: TNovidades := TNovidades.Create;
  var atu: TAtualizacoes := TAtualizacoes.Create;

  GravaLog('"app-key": ' + appKey);

  TValidation.GetNews(appKey, atu);
  CopyAtualizacoes(nov, atu);

  nov.LicencaAtiva := TValidation.GetKeyValidation(appKey);
  nov.Sistema := 'Controle de Updates by Azure + Delphi';
  nov.Status := '1 nova atualização disponível';

  Response.ContentType := 'application/json';
  Response.Content := TJson.ObjectToJsonString(nov);

  atu.Free;
  nov.Free;
end;

end.
