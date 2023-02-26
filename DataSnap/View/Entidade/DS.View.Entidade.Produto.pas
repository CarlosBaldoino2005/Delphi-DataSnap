unit DS.View.Entidade.Produto;

interface

uses
  System.SysUtils, System.Classes, System.JSON, DS.Controller,
  Datasnap.DSServer, Datasnap.DSAuth;

{$METHODINFO ON}
type
  TProduto = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FController : TController;
  public
    { Public declarations }
    [TRoleAuth('Nivel1, Nivel2')]
    function Produto(const Key : String) : TJSONArray;
    [TRoleAuth('Nivel2')]
    procedure acceptProduto(const Key : String; JObject : TJSONObject);
    [TRoleAuth('Nivel2')]
    procedure updateProduto(const Key : String; JObject : TJSONObject);
    [TRoleAuth('Nivel2')]
    procedure cancelProduto(const key : String);
  end;
{$METHODINFO OFF}

var
  Produto: TProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TProduto }

procedure TProduto.acceptProduto(const Key: String; JObject: TJSONObject);
begin
  FController.Entidades.Produto.Put(Key,JObject);
end;

procedure TProduto.cancelProduto(const key: String);
begin
  FController.Entidades.Produto.Delete(Key);
end;

procedure TProduto.DataModuleCreate(Sender: TObject);
begin
  FController := TController.Create;
end;

procedure TProduto.DataModuleDestroy(Sender: TObject);
begin
  FController.DisposeOf;
end;

function TProduto.Produto(const Key: String): TJSONArray;
begin
  Result := FController.Entidades.Produto.Get(Key);
end;

procedure TProduto.updateProduto(const Key: String; JObject: TJSONObject);
begin
  FController.Entidades.Produto.Post(Key,JObject);
end;

end.
