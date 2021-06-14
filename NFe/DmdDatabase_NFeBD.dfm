object dmDatabase_NFeBD: TdmDatabase_NFeBD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 427
  Top = 189
  Height = 347
  Width = 768
  object scoNFeBD: TSQLConnection
    ConnectionName = 'SSFacil'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    KeepConnection = False
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=D:\Fontes\$Servisoft\NFeConfig\NFEBD.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet=win1252'
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Left = 40
    Top = 24
  end
  object Decoder64: TIdDecoderMIME
    FillChar = '='
    Left = 104
    Top = 24
  end
  object Encoder64: TIdEncoderMIME
    FillChar = '='
    Left = 120
    Top = 24
  end
end
