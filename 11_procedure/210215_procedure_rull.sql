use sqlDB ; 
go 

create or alter procedure usp_buyproduct 
	@userID char(8) 
as 
	select num, userID, prodName, (pice * amount) as '���űݾ�'
	  from buyTBL2
	 where userID = @userID; 
go 

exec usp_buyproduct 'BBK'; 
