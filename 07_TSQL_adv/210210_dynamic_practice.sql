use sqlDB; 
go 

declare @sql varchar(100); 
set @sql = 'select * from userTBL where userID = ''EJW'' '; 

exec( @sql ); 

select * from userTBL where userID = 'EJW'; 