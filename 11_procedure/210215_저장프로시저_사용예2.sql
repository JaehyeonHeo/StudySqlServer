﻿use sqlDB; 
go 

create or alter proc usp_return 
	@userName nvarchar(10) 
as
	declare @userID char(8); 
	select @userID = userID 
	  from userTBL 
	where userName = @userName; 

	if (@userID <> '') return 1; 
	else return 0; 
go 

declare @retVal int; 
exec @retVal = usp_return '은자원'; 
print @retVal ; 
