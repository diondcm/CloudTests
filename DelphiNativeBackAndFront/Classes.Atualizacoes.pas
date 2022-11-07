unit Classes.Atualizacoes;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TAtualizacoes = class
  private
    FBoletos: string;
    FDashboards: string;
    FRelatórios: string;
  published
    property Boletos: string read FBoletos write FBoletos;
    property Dashboards: string read FDashboards write FDashboards;
    property Relatórios: string read FRelatórios write FRelatórios;
  end;
  
  TNovidades = class(TJsonDTO)
  private
    FAtualizacoes: TAtualizacoes;
    FLicencaAtiva: Boolean;
    FSistema: string;
    FStatus: string;
  published
    property Atualizacoes: TAtualizacoes read FAtualizacoes;
    property LicencaAtiva: Boolean read FLicencaAtiva write FLicencaAtiva;
    property Sistema: string read FSistema write FSistema;
    property Status: string read FStatus write FStatus;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
implementation

{ TRoot }

constructor TNovidades.Create;
begin
  inherited;
  FAtualizacoes := TAtualizacoes.Create;
end;

destructor TNovidades.Destroy;
begin
  FAtualizacoes.Free;
  inherited;
end;

end.
