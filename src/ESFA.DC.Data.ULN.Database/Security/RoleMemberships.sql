
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ULN_RW_User];
GO
ALTER ROLE [db_datareader] ADD MEMBER [ULN_RW_User];
GO
ALTER ROLE [db_datareader] ADD MEMBER [ULN_RO_User];
