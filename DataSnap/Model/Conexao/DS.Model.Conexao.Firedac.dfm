object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 235
  Width = 345
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\bd\PDVUPDATES.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    LoginPrompt = False
    Left = 88
    Top = 56
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 208
    Top = 32
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 88
    Top = 144
  end
end
