program DataSnap;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FormUnit1 in 'View\FormUnit1.pas' {Form1},
  ServerMethodsUnit1 in 'View\ServerMethodsUnit1.pas' {ServerMethods1: TDSServerModule},
  WebModuleUnit1 in 'WebModuleUnit1.pas' {WebModule1: TWebModule},
  DS.Model.Conexao.Firedac in 'Model\Conexao\DS.Model.Conexao.Firedac.pas' {DataModule1: TDataModule},
  DS.Model.Entidade.Produto in 'Model\Entidade\DS.Model.Entidade.Produto.pas' {ModelEntidadeProduto: TDataModule},
  DS.Controller in 'Controller\DS.Controller.pas',
  DS.Model.Entidade.Factory in 'Model\Entidade\DS.Model.Entidade.Factory.pas',
  DS.View.Entidade.Produto in 'View\Entidade\DS.View.Entidade.Produto.pas' {Produto: TDataModule},
  DataSetConverter4D.Helper in 'DataSetConverter4D.Helper.pas',
  DataSetConverter4D.Impl in 'DataSetConverter4D.Impl.pas',
  DataSetConverter4D in 'DataSetConverter4D.pas',
  DataSetConverter4D.Util in 'DataSetConverter4D.Util.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TModelEntidadeProduto, ModelEntidadeProduto);
  Application.CreateForm(TProduto, Produto);
  Application.Run;
end.
