﻿USE [sqlDB]
GO

begin try
	begin tran

	INSERT INTO [dbo].[userTBL]
			   ([userID]
			   ,[userName]
			   ,[birthYear]
			   ,[addr]
			   ,[mobile1]
			   ,[mobile2]
			   ,[height]
			   ,[mDate])
		 VALUES
			   ('GJY',  
				'권지용',
				1988, 
				'서울',
				'010',
				'88888888',
				175,
				getdate() ) 

	INSERT INTO [dbo].[buyTBL]
			   ([userID]
			   ,[prodName]
			   ,[groupName]
			   ,[price]
			   ,[amount])
		 VALUES
			   (
			   'GJY',
			   '선글라스',
			    null,
			   8000000000,
			   1)
		   
	commit

end try

begin catch
	rollback
end catch

GO

