unit Classes.Validation;

interface

uses Classes.Atualizacoes;

type
  TValidation = class
  private
    class function GetNewsRelat(systemKey: string): string;
    class function GetNewsDash(systemKey: string): string;
    class function GetNewsBol(systemKey: string): string;
  public
    class function GetNews(systemKey: string; var atu: TAtualizacoes): string;
    class function GetKeyValidation(systemKey: string): Boolean;
  end;


implementation

uses
  System.SysUtils;

{ TValidation }

class function TValidation.GetKeyValidation(systemKey: string): Boolean;
begin
  Result := LowerCase(systemKey) = '2beba3a2-a293-450c-96cd-cf7a4c811046';
end;

class function TValidation.GetNews(systemKey: string; var atu: TAtualizacoes): string;
begin
  atu.Relatórios := GetNewsRelat(systemKey);
  atu.Dashboards := GetNewsDash(systemKey);
  atu.Boletos := GetNewsBol(systemKey);
end;

class function TValidation.GetNewsBol(systemKey: string): string;
begin
  Result := 'Funcionalidade de pagamento por PIX';
end;

class function TValidation.GetNewsDash(systemKey: string): string;
begin
  Result := 'Consolidação dos totalizadores filtrados';
end;

class function TValidation.GetNewsRelat(systemKey: string): string;
begin
  Result := 'Adicionados multiplos filtros';
end;

end.
