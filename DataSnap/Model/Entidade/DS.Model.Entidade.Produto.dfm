object ModelEntidadeProduto: TModelEntidadeProduto
  OldCreateOrder = False
  Height = 150
  Width = 215
  object FDQuery1: TFDQuery
    CachedUpdates = True
    Connection = DataModule1.FDConnection1
    SQL.Strings = (
      'select * from produto')
    Left = 88
    Top = 56
  end
end
