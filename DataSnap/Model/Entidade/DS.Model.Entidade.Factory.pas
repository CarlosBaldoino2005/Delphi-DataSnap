unit DS.Model.Entidade.Factory;

interface

uses DS.Model.Entidade.Produto;

type
  TModelEntidadeFactory = class
    private
      FModelEntidade : TModelEntidadeProduto;
    public
      constructor Create;
      destructor Destroy; override;
      function Produto : TModelEntidadeProduto;
  end;

implementation

{ TModelEntidadeFactory }

constructor TModelEntidadeFactory.Create;
begin
  FModelEntidade := TModelEntidadeProduto.Create(nil);
end;

destructor TModelEntidadeFactory.Destroy;
begin
  FModelEntidade.DisposeOf;
  inherited;
end;

function TModelEntidadeFactory.Produto: TModelEntidadeProduto;
begin
  result := FModelEntidade;
end;

end.
