unit DS.Model.Entidade.Produto;

interface

uses
  System.SysUtils, System.Classes, DS.Model.Conexao.Firedac, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.JSON,
  DataSetConverter4D.Helper, DataSetConverter4D.Impl;

type
  TModelEntidadeProduto = class(TDataModule)
    FDQuery1: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function Get(const Key : String = '') : TJSONArray;
    function Put(const Key : String; JObject : TJSONObject) : TModelEntidadeProduto;
    function Post(const Key : String; JObject : TJSONObject) : TModelEntidadeProduto;
    function Delete(const Key : String) : TModelEntidadeProduto;
  end;

var
  ModelEntidadeProduto: TModelEntidadeProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TModelEntidadeProduto }

function TModelEntidadeProduto.Delete(const Key: String): TModelEntidadeProduto;
begin
  Result := Self;
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('delete from produto where codigo=:codigo');
  FDQuery1.ParamByName('codigo').Value := key;
  FDQuery1.ExecSQL;
end;

function TModelEntidadeProduto.Get(const Key: String): TJSONArray;
begin
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from produto ');
  if Key <> '' then
    FDQuery1.SQL.Add(' where codigo = ' + Key);
  FDQuery1.Open;
  Result :=  FDQuery1.AsJSONArray;
end;

function TModelEntidadeProduto.Post(const Key: String;
  JObject: TJSONObject): TModelEntidadeProduto;
begin
  Result := Self;
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from produto where codigo = :codigo');
  FDQuery1.ParamByName('codigo').Value := Key;
  FDQuery1.Open;

  FDQuery1.RecordFromJSONObject(JObject);
  FDQuery1.ApplyUpdates(-1)
end;

function TModelEntidadeProduto.Put(const Key: String;
  JObject: TJSONObject): TModelEntidadeProduto;
begin
  Result := Self;
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('select * from produto where 1=2');
  FDQuery1.Open;

  FDQuery1.FromJSONObject(JObject);
  FDQuery1.ApplyUpdates(-1)
end;

end.
