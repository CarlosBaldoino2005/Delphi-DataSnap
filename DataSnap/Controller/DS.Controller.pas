unit DS.Controller;

interface

uses
  DS.Model.Entidade.Factory;

type
  TController = class
    private
      FEntidades : TModelEntidadeFactory;
    public
      constructor Create;
      destructor Destroy; override;
      function Entidades : TModelEntidadeFactory;
  end;

implementation

{ TController }

constructor TController.Create;
begin
  FEntidades := TModelEntidadeFactory.Create;
end;

destructor TController.Destroy;
begin
   FEntidades.DisposeOf;
  inherited;
end;

function TController.Entidades: TModelEntidadeFactory;
begin
  Result := FEntidades;
end;

end.
